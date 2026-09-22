# WS0 — Baseline and measurement

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 1 week, part-time |
| **Status** | In progress, 2 of 3. Task 0.2 needs the Windows box |

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

## Where it stands

Updated 2026-09-23.

**0.1 and 0.3 are done.** The method is `docs/measurement.md` on the code
repository, and [`README.md`](../measurements/README.md) here restates it.
`scripts/measure.ps1` is committed and has been run. Two bugs came out of
running it rather than reading it: it crashed when exactly one process matched
([#56](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/56)) and again on a single sample ([#57](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/57)),
both fixed.

**0.2 is the one left, and it needs the box.**
[`baseline-v1.md`](../measurements/baseline-v1.md) still has an empty row. That
is deliberate: an empty cell is a true statement and a plausible number is not,
and the whole point of C3 is a falsifiable target. Until v1 0.8.0 is measured
on the machine, WS7 has nothing to compare against.

One verification is also open: `measure.ps1`'s `-ArgumentFilter` success path
has never run on Windows ([#59](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/59)).

## Status

- [x] **0.1** — Add docs/measurement.md with the Appendix A method from the design document (Private…
- [ ] **0.2** — Measure v1 0.8.0: install size, Private Bytes and Working Set with window closed, with…
- [x] **0.3** — Script the measurement (scripts/measure.ps1) so WS7 repeats it identically
