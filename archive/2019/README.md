# Archived: 2019 data (v1)

These are the original SQL dumps from December 2019, kept for anyone who still depends on them.
They are **no longer updated** and are out of date (for example, they miss the sangkats and villages
created by sub-decrees in 2021 and 2023).

Known issues in these files:

- `one-table/addresses.sql` inserts row `id = 1` twice, so a plain import fails on the primary key.
- `id` values are auto-increment numbers, not official codes, and are not stable between versions.
- `type` values contain a hidden zero-width space (`'ខេត្ត​'`), so `WHERE type = 'ខេត្ត'` matches nothing.

Use the current data in [`data/`](../../data) instead.
