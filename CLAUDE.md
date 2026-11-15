# CLAUDE.md

Open dataset of Cambodia's administrative divisions (province → district → commune → village),
scraped from the NCDD Gazetteer and published as SQL (PostgreSQL, MySQL) and CSV. Tables are
`locations` and `location_types`, named so both developers and business users understand them.

## Layout

- `scripts/update.py`: the only source of truth for the data. Fetches NCDD, validates, writes the SQL and CSV files. Python 3.10+, standard library only (keep it that way, so users don't need `pip install`).
- `db/postgres/locations.sql`, `db/mysql/locations.sql`, `data/locations.csv`, `data/location_types.csv`: **generated**. Never edit by hand; change the script and re-run.
- CSVs are written as `utf-8-sig` (with BOM) on purpose, so Excel renders Khmer. Don't drop the BOM. Codes stay zero-padded strings; the README explains how Excel users keep the zeros.
- `archive/2019/`: frozen v1 dumps. Do not modify or regenerate.
- `.cache/`: raw NCDD downloads (git-ignored). Delete it or pass `--refresh` to re-download.

## Regenerating

```bash
python scripts/update.py            # from cache
python scripts/update.py --refresh  # fresh from NCDD (25 province exports, 3 s apart)
```

The script fails (exit 1, writes nothing) if row counts per province don't match NCDD's summary
table, a code is duplicated, a parent is missing, or NCDD introduces an unknown type. Fix the cause;
don't loosen the checks. A missing English name is only a warning (stored as `NULL`); a missing Khmer
name falls back to the English name.

## NCDD source quirks

- Index: `https://db.ncdd.gov.kh/gazetteer/view/index.castle`. Its "List of Provincial/Municipal" table gives province names (with the ខេត្ត/រាជធានី prefix and a " Province"/" Capital" suffix, which we strip) and the expected counts (numbers can contain thousands commas).
- Per-province export: `POST /gazetteer/province/downloadprovince.castle` with `pv=<1..25>`. It returns Excel 2003 XML (SpreadsheetML), parsed with `xml.etree`. It has no province row; districts, communes and villages only.
- The "complete gazetteer" download (`/gazetteer/download/downloadgazetteer.castle`) is broken (HTTP 500 with an error page served as `.xls`). Don't use it.
- Source codes have no leading zeros (`102`); we zero-pad by level (`0102`).
- Source text contains zero-width spaces and NBSPs; `clean()` strips them.
- The site is slow and sometimes times out; `fetch()` retries. Keep requests polite (one at a time, with a delay).

## Schema rules

- `locations.code` is the public, stable key. Users store it, so never switch to surrogate IDs.
- `location_types.id` values (1–8, defined in `TYPES` in the script) are public too: append new types, never renumber.
- `locations.level` is kept alongside `type_id` on purpose for easy filtering; the script ensures it matches the type's level.
- Rows are written sorted by `code`, so parents are always inserted before children (FKs are enforced during the load).

## Verifying a change

Load both files into throwaway containers and run sanity queries (counts per type, orphan parents, a village → province join):

```bash
docker run -d --rm --name gz-pg -e POSTGRES_PASSWORD=test postgres:16
docker run -d --rm --name gz-my -e MYSQL_ROOT_PASSWORD=test -e MYSQL_DATABASE=gz mysql:8.4
docker exec -i gz-pg psql -v ON_ERROR_STOP=1 -U postgres < db/postgres/locations.sql
docker exec -i gz-my mysql -uroot -ptest --default-character-set=utf8mb4 gz < db/mysql/locations.sql
docker stop gz-pg gz-my
```

On Git Bash for Windows, set `MSYS_NO_PATHCONV=1` first.

## Licensing

NCDD publishes no license. Keep the README's "unofficial copy, source: NCDD" notice and the source line in the SQL headers.
