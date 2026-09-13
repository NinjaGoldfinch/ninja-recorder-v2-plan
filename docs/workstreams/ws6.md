# WS6 — SQLite

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 1 week |
| **Status** | Not started |

## Goal

SQLite WAL, busy_timeout, writer + reader pool, `query_only` UI connection.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 6.1 | Pragmas at open; WAL set by the writer | Existing tests green; `library.sqlite-wal` appears on Windows |
| 6.2 | `db::Pool` (writer + reader `Vec`); audit every `Db` method for read vs write | Test: a long read on a reader does not block a write |
| 6.3 | Reader mode with `query_only = ON`; test that a write on it errors | Green |
| 6.4 | Concurrency test: daemon writing markers at 1 Hz while a reader lists recordings in a loop for 60 s | Zero `SQLITE_BUSY` |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **6.1** — Existing tests green; `library.sqlite-wal` appears on Windows
- **6.2** — Test: a long read on a reader does not block a write
- **6.3** — Green
- **6.4** — Zero `SQLITE_BUSY`

## Status

- [ ] **6.1** — Pragmas at open; WAL set by the writer
- [ ] **6.2** — db::Pool (writer + reader Vec); audit every Db method for read vs write
- [ ] **6.3** — Reader mode with query_only = ON; test that a write on it errors
- [ ] **6.4** — Concurrency test: daemon writing markers at 1 Hz while a reader lists recordings in a…
