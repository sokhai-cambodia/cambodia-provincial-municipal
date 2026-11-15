#!/usr/bin/env python3
"""Pull the latest Cambodia gazetteer from NCDD and rebuild the SQL files.

Source: https://db.ncdd.gov.kh/gazetteer/view/index.castle

How it works:
  1. Download the index page. Its "List of Provincial/Municipal" table gives
     every province (code, Khmer, English) and the official counts of
     districts, communes and villages, which we use to validate the result.
  2. Download each province's Excel export (25 requests, a few seconds apart).
     NCDD's "complete gazetteer" download is broken (HTTP 500), so we use the
     per-province export instead.
  3. Normalise, validate, and write data/mysql/locations.sql,
     data/postgres/locations.sql and data/csv/*.csv.

Raw downloads are cached in .cache/ so re-runs don't hit NCDD again.
Use --refresh to ignore the cache and download everything fresh.

Standard library only: python scripts/update.py
"""

from __future__ import annotations

import argparse
import csv
import datetime as dt
import html
import re
import sys
import time
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path

BASE = "https://db.ncdd.gov.kh/gazetteer"
INDEX_URL = f"{BASE}/view/index.castle"
PROVINCE_URL = f"{BASE}/province/downloadprovince.castle"

ROOT = Path(__file__).resolve().parent.parent
CACHE = ROOT / ".cache"
OUT_MYSQL = ROOT / "data" / "mysql" / "locations.sql"
OUT_POSTGRES = ROOT / "data" / "postgres" / "locations.sql"
OUT_CSV = ROOT / "data" / "csv" / "locations.csv"
OUT_TYPES_CSV = ROOT / "data" / "csv" / "location_types.csv"

USER_AGENT = "cambodia-gazetteer-sync/2.0 (+open data mirror)"
DELAY_SECONDS = 3

# Rows of the location_types lookup table. The ids are part of the public schema:
# never renumber them, only append new ones.
# type_km -> (id, level, type_en)
TYPES = {
    "ខេត្ត": (1, 1, "Province"),
    "រាជធានី": (2, 1, "Capital"),
    "ស្រុក": (3, 2, "District"),
    "ក្រុង": (4, 2, "Municipality"),
    "ខណ្ឌ": (5, 2, "Khan"),
    "ឃុំ": (6, 3, "Commune"),
    "សង្កាត់": (7, 3, "Sangkat"),
    "ភូមិ": (8, 4, "Village"),
}
CODE_LEN = {1: 2, 2: 4, 3: 6, 4: 8}

# Zero-width and other invisible characters that sneak into the source data.
INVISIBLE = re.compile("[\u200b\u200c\u200d\u2060\ufeff\u00a0]")
SS = "urn:schemas-microsoft-com:office:spreadsheet"


@dataclass
class Row:
    code: str
    parent_code: str | None
    level: int
    type_km: str
    name_km: str  # falls back to the English name if NCDD has no Khmer name
    name_en: str | None  # None when NCDD has no English name yet

    @property
    def type_id(self) -> int:
        return TYPES[self.type_km][0]


@dataclass
class ProvinceSummary:
    code: str
    name_km: str  # with type prefix, e.g. ខេត្តបន្ទាយមានជ័យ
    name_en: str  # with suffix, e.g. Banteay Meanchey Province
    districts: int
    communes: int
    villages: int


def clean(text: str | None) -> str:
    text = INVISIBLE.sub(" ", html.unescape(text or ""))
    return re.sub(r"\s+", " ", text).strip()


# --------------------------------------------------------------------------- fetch

def fetch(url: str, cache_name: str, refresh: bool, data: dict | None = None) -> bytes:
    path = CACHE / cache_name
    if path.exists() and not refresh:
        return path.read_bytes()
    body = urllib.parse.urlencode(data).encode() if data else None
    req = urllib.request.Request(url, data=body, headers={"User-Agent": USER_AGENT})
    for attempt in range(1, 4):
        try:
            with urllib.request.urlopen(req, timeout=180) as resp:
                content = resp.read()
            break
        except Exception as exc:  # network hiccups: retry with backoff
            if attempt == 3:
                raise RuntimeError(f"failed to fetch {url} {data or ''}: {exc}") from exc
            print(f"  retry {attempt} after error: {exc}", file=sys.stderr)
            time.sleep(DELAY_SECONDS * attempt * 2)
    CACHE.mkdir(exist_ok=True)
    path.write_bytes(content)
    time.sleep(DELAY_SECONDS)
    return content


# --------------------------------------------------------------------------- parse

def parse_summary(index_html: str) -> list[ProvinceSummary]:
    provinces = []
    for tr in re.findall(r'<tr id="row_pv_\d+".*?</tr>', index_html, re.S):
        tds = [clean(re.sub(r"<[^>]+>", "", td)) for td in re.findall(r"<td[^>]*>(.*?)</td>", tr, re.S)]
        code, km, en, *nums = tds[:9]
        krong, srok, khan, commune, sangkat, village = (int(n.replace(",", "")) for n in nums)
        provinces.append(ProvinceSummary(
            code=code.zfill(2), name_km=km, name_en=en,
            districts=krong + srok + khan,
            communes=commune + sangkat,
            villages=village,
        ))
    if len(provinces) != 25:
        raise SystemExit(f"expected 25 provinces in NCDD index, found {len(provinces)}")
    return provinces


def province_row(p: ProvinceSummary) -> Row:
    for type_km in ("រាជធានី", "ខេត្ត"):
        if p.name_km.startswith(type_km):
            name_km = p.name_km[len(type_km):].strip()
            break
    else:
        raise SystemExit(f"unknown province type: {p.name_km!r}")
    level = TYPES[type_km][1]
    name_en = re.sub(r"\s+(Province|Capital|Municipality)$", "", p.name_en)
    return Row(p.code, None, level, type_km, name_km or name_en, name_en or None)


def sheet_rows(xml_bytes: bytes) -> list[list[str]]:
    root = ET.fromstring(xml_bytes)
    rows = []
    for r in root.iter(f"{{{SS}}}Row"):
        cells: list[str] = []
        for c in r.findall(f"{{{SS}}}Cell"):
            idx = c.get(f"{{{SS}}}Index")
            if idx:
                cells.extend([""] * (int(idx) - 1 - len(cells)))
            d = c.find(f"{{{SS}}}Data")
            cells.append(clean("".join(d.itertext())) if d is not None else "")
        rows.append(cells)
    return rows


def parse_province_sheet(xml_bytes: bytes, province_code: str) -> list[Row]:
    rows = sheet_rows(xml_bytes)
    try:
        start = next(i for i, r in enumerate(rows) if r[:2] == ["Type", "Code"]) + 1
    except StopIteration:
        raise SystemExit(f"province {province_code}: header row not found (NCDD format changed?)")
    out = []
    for r in rows[start:]:
        if not any(r):
            continue
        type_km, raw_code, name_km, name_en = (r + [""] * 4)[:4]
        if type_km not in TYPES:
            raise SystemExit(f"province {province_code}: unknown type {type_km!r} in {r}")
        level = TYPES[type_km][1]
        code = raw_code.zfill(CODE_LEN[level])
        if not code.isdigit() or len(code) != CODE_LEN[level] or not code.startswith(province_code):
            raise SystemExit(f"province {province_code}: bad code {raw_code!r} for {type_km}")
        out.append(Row(code, code[:-2], level, type_km, name_km or name_en, name_en or None))
    return out


# --------------------------------------------------------------------------- validate

def validate(rows: list[Row], summaries: list[ProvinceSummary]) -> tuple[list[str], list[str]]:
    problems, warnings = [], []
    codes = {}
    for r in rows:
        if r.code in codes:
            problems.append(f"duplicate code {r.code}")
        codes[r.code] = r
        if not r.name_km:
            problems.append(f"{r.code}: missing Khmer name")
        if not r.name_en:
            warnings.append(f"{r.code} {r.type_km}{r.name_km}: no English name in NCDD (stored as NULL)")
    for r in rows:
        if r.parent_code is not None:
            parent = codes.get(r.parent_code)
            if parent is None:
                problems.append(f"{r.code}: parent {r.parent_code} does not exist")
            elif parent.level != r.level - 1:
                problems.append(f"{r.code}: parent {r.parent_code} is level {parent.level}")
    for p in summaries:
        got = {lvl: sum(1 for r in rows if r.level == lvl and r.code.startswith(p.code)) for lvl in (2, 3, 4)}
        want = {2: p.districts, 3: p.communes, 4: p.villages}
        for lvl in (2, 3, 4):
            if got[lvl] != want[lvl]:
                problems.append(f"province {p.code} {p.name_en}: level {lvl} has {got[lvl]} rows, NCDD says {want[lvl]}")
    return problems, warnings


# --------------------------------------------------------------------------- write

def sql_str(value: str | None, mysql: bool) -> str:
    if value is None:
        return "NULL"
    if mysql:
        value = value.replace("\\", "\\\\")
    return "'" + value.replace("'", "''") + "'"


def header(dialect: str, today: str, counts: dict[int, int]) -> str:
    return (
        f"-- Cambodia administrative divisions (gazetteer), {dialect}\n"
        f"-- Source: NCDD Gazetteer Database Online, {INDEX_URL}\n"
        f"-- Retrieved: {today}\n"
        f"-- Rows: {counts[1]} provinces, {counts[2]} districts, {counts[3]} communes, {counts[4]} villages\n"
        f"-- Unofficial copy. NCDD publishes no licence for this data. Generated by scripts/update.py; do not edit by hand.\n\n"
    )


def write_sql(rows: list[Row], path: Path, mysql: bool, today: str, counts: dict[int, int]) -> None:
    q = (lambda s: f"`{s}`") if mysql else (lambda s: s)
    lines = [header("MySQL 8" if mysql else "PostgreSQL", today, counts)]
    if mysql:
        lines.append(
            "SET NAMES utf8mb4;\n\n"
            "DROP TABLE IF EXISTS `locations`;\n"
            "DROP TABLE IF EXISTS `location_types`;\n\n"
            "CREATE TABLE `location_types` (\n"
            "  `id`      tinyint     NOT NULL,\n"
            "  `level`   tinyint     NOT NULL COMMENT '1 province, 2 district, 3 commune, 4 village',\n"
            "  `name_km` varchar(32) NOT NULL,\n"
            "  `name_en` varchar(32) NOT NULL,\n"
            "  PRIMARY KEY (`id`),\n"
            "  UNIQUE KEY `location_types_name_km_uq` (`name_km`)\n"
            ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;\n\n"
            "CREATE TABLE `locations` (\n"
            "  `code`        varchar(8)   NOT NULL COMMENT 'Official NCDD code, zero-padded: 2 province, 4 district, 6 commune, 8 village',\n"
            "  `parent_code` varchar(8)   NULL     COMMENT 'Code of the parent division; NULL for provinces',\n"
            "  `level`       tinyint      NOT NULL COMMENT '1 province, 2 district, 3 commune, 4 village',\n"
            "  `type_id`     tinyint      NOT NULL,\n"
            "  `name_km`     varchar(255) NOT NULL,\n"
            "  `name_en`     varchar(255) NULL     COMMENT 'NULL when NCDD has no English name yet',\n"
            "  PRIMARY KEY (`code`),\n"
            "  KEY `locations_parent_code_idx` (`parent_code`),\n"
            "  KEY `locations_level_idx` (`level`),\n"
            "  KEY `locations_type_id_idx` (`type_id`),\n"
            "  CONSTRAINT `locations_parent_fk` FOREIGN KEY (`parent_code`) REFERENCES `locations` (`code`),\n"
            "  CONSTRAINT `locations_type_fk` FOREIGN KEY (`type_id`) REFERENCES `location_types` (`id`),\n"
            "  CONSTRAINT `locations_level_chk` CHECK (`level` BETWEEN 1 AND 4)\n"
            ") ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;\n\n"
        )
    else:
        lines.append(
            "BEGIN;\n\n"
            "DROP TABLE IF EXISTS locations;\n"
            "DROP TABLE IF EXISTS location_types;\n\n"
            "CREATE TABLE location_types (\n"
            "  id      smallint PRIMARY KEY,\n"
            "  level   smallint NOT NULL CHECK (level BETWEEN 1 AND 4),\n"
            "  name_km text     NOT NULL UNIQUE,\n"
            "  name_en text     NOT NULL\n"
            ");\n\n"
            "CREATE TABLE locations (\n"
            "  code        varchar(8)  PRIMARY KEY,\n"
            "  parent_code varchar(8)  REFERENCES locations (code),\n"
            "  level       smallint    NOT NULL CHECK (level BETWEEN 1 AND 4),\n"
            "  type_id     smallint    NOT NULL REFERENCES location_types (id),\n"
            "  name_km     text        NOT NULL,\n"
            "  name_en     text\n"
            ");\n"
            "CREATE INDEX locations_parent_code_idx ON locations (parent_code);\n"
            "CREATE INDEX locations_level_idx ON locations (level);\n"
            "CREATE INDEX locations_type_id_idx ON locations (type_id);\n\n"
            "COMMENT ON COLUMN locations.code IS 'Official NCDD code, zero-padded: 2 province, 4 district, 6 commune, 8 village';\n"
            "COMMENT ON COLUMN locations.parent_code IS 'Code of the parent division; NULL for provinces';\n"
            "COMMENT ON COLUMN locations.level IS '1 province, 2 district, 3 commune, 4 village';\n"
            "COMMENT ON COLUMN locations.name_en IS 'NULL when NCDD has no English name yet';\n\n"
        )

    type_values = ",\n".join(
        f"({tid}, {lvl}, {sql_str(km, mysql)}, {sql_str(en, mysql)})"
        for km, (tid, lvl, en) in sorted(TYPES.items(), key=lambda kv: kv[1][0])
    )
    lines.append(
        f"INSERT INTO {q('location_types')} ({q('id')}, {q('level')}, {q('name_km')}, {q('name_en')}) VALUES\n"
        f"{type_values};\n\n"
    )

    cols = ", ".join(q(c) for c in ("code", "parent_code", "level", "type_id", "name_km", "name_en"))
    batch = 500
    for i in range(0, len(rows), batch):
        values = ",\n".join(
            f"({sql_str(r.code, mysql)}, {sql_str(r.parent_code, mysql)}, {r.level}, {r.type_id}, "
            f"{sql_str(r.name_km, mysql)}, {sql_str(r.name_en, mysql)})"
            for r in rows[i:i + batch]
        )
        lines.append(f"INSERT INTO {q('locations')} ({cols}) VALUES\n{values};\n\n")
    if not mysql:
        lines.append("COMMIT;\n")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("".join(lines), encoding="utf-8", newline="\n")


def write_csv(rows: list[Row]) -> None:
    """UTF-8 with BOM ("utf-8-sig") so Excel shows Khmer text correctly on double-click."""
    OUT_CSV.parent.mkdir(parents=True, exist_ok=True)
    types_by_id = {tid: (km, lvl, en) for km, (tid, lvl, en) in TYPES.items()}
    with OUT_TYPES_CSV.open("w", encoding="utf-8-sig", newline="") as f:
        w = csv.writer(f)
        w.writerow(["id", "level", "name_km", "name_en"])
        for tid in sorted(types_by_id):
            km, lvl, en = types_by_id[tid]
            w.writerow([tid, lvl, km, en])
    with OUT_CSV.open("w", encoding="utf-8-sig", newline="") as f:
        w = csv.writer(f)
        w.writerow(["code", "parent_code", "level", "type_id", "type_km", "type_en", "name_km", "name_en"])
        for r in rows:
            km, _, en = types_by_id[r.type_id]
            w.writerow([r.code, r.parent_code or "", r.level, r.type_id, km, en, r.name_km, r.name_en or ""])


# --------------------------------------------------------------------------- main

def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--refresh", action="store_true", help="ignore .cache/ and download everything again")
    args = ap.parse_args()
    for stream in (sys.stdout, sys.stderr):  # Khmer text on Windows consoles
        stream.reconfigure(encoding="utf-8")

    print("Fetching NCDD index ...")
    index_html = fetch(INDEX_URL, "index.html", args.refresh).decode("utf-8")
    summaries = parse_summary(index_html)

    rows: list[Row] = []
    for p in summaries:
        print(f"Province {p.code} {p.name_en} ...")
        rows.append(province_row(p))
        xml_bytes = fetch(PROVINCE_URL, f"province_{p.code}.xml", args.refresh, {"pv": str(int(p.code))})
        rows.extend(parse_province_sheet(xml_bytes, p.code))

    rows.sort(key=lambda r: r.code)  # parents always sort before their children
    problems, warnings = validate(rows, summaries)
    for msg in warnings:
        print("warning: " + msg)
    if problems:
        print(f"\nValidation failed with {len(problems)} problem(s):", file=sys.stderr)
        for msg in problems[:50]:
            print("  " + msg, file=sys.stderr)
        return 1

    counts = {lvl: sum(1 for r in rows if r.level == lvl) for lvl in (1, 2, 3, 4)}
    retrieved = dt.datetime.fromtimestamp((CACHE / "index.html").stat().st_mtime).date().isoformat()
    write_sql(rows, OUT_MYSQL, True, retrieved, counts)
    write_sql(rows, OUT_POSTGRES, False, retrieved, counts)
    write_csv(rows)
    print(f"\nOK: {counts[1]} provinces, {counts[2]} districts, {counts[3]} communes, {counts[4]} villages")
    for out in (OUT_MYSQL, OUT_POSTGRES, OUT_CSV, OUT_TYPES_CSV):
        print(f"Wrote {out.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
