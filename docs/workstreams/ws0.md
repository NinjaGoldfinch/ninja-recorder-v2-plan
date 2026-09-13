# WS0 — Baseline and measurement

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 1 week, part-time |
| **Status** | Not started |

## Goal

Baseline measurement (install size, idle RAM by Private Bytes).

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 0.1 | Add `docs/measurement.md` with the Appendix A method from the design document (Private Bytes headline, Working Set alongside, daemon-only resting state, two-process total separately) | Merged |
| 0.2 | Measure v1 0.8.0: install size, Private Bytes and Working Set with window closed, with window open, with League client open (backend warm) | Three rows recorded in `docs/windows-verification.md §5` |
| 0.3 | Script the measurement (`scripts/measure.ps1`) so WS7 repeats it identically | Script committed and run once |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **0.1** — Merged
- **0.2** — Three rows recorded in `docs/windows-verification.md §5`
- **0.3** — Script committed and run once

## Status

- [ ] **0.1** — Add docs/measurement.md with the Appendix A method from the design document (Private…
- [ ] **0.2** — Measure v1 0.8.0: install size, Private Bytes and Working Set with window closed, with…
- [ ] **0.3** — Script the measurement (scripts/measure.ps1) so WS7 repeats it identically
