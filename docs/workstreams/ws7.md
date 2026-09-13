# WS7 — Measure and ship

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | everything |
| **Rough effort** | 1 week |
| **Status** | Not started |

## Goal

Measure against C3 and ship v2.0.0 (Option B default, libobs selectable, still GPL-2.0).

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 7.1 | Run `scripts/measure.ps1` on the release candidate | Install size and daemon-only Private Bytes recorded against C3 in `windows-verification.md` |
| 7.2 | Full verification pass per `windows-verification.md` §1–§5 plus the new §4 daemon cases | Signed off |
| 7.3 | `npm run release -- next 2.0.0`; alpha soak for one week; `npm run release -- cut` | v2.0.0 on the stable channel; `README.md` status blockquote updated |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **7.1** — Install size and daemon-only Private Bytes recorded against C3 in `windows-verification.md`
- **7.2** — Signed off
- **7.3** — v2.0.0 on the stable channel; `README.md` status blockquote updated

## Status

- [ ] **7.1** — Run scripts/measure.ps1 on the release candidate
- [ ] **7.2** — Full verification pass per windows-verification.md §1–§5 plus the new §4 daemon cases
- [ ] **7.3** — npm run release -- next 2.0.0; alpha soak for one week; npm run release -- cut
