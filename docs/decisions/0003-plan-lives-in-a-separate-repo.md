# 0003 — The plan lives in a separate repository; code lands as ordinary PRs

- **Status:** Accepted
- **Date:** 2026-09-13
- **Source:** [implementation plan](../implementation/v2-implementation-plan.md) §1, §2.1, §5

## Context

v2 is eight workstreams over roughly five months of part-time work. Five — WS0, WS1,
WS2, WS5 and WS6 — have no upstream and can start in week one. The code repository
carries 447 Rust tests, a signed updater, an alpha channel and a CI version scheme
that §2.1 carries forward unchanged.

A long-lived `v2` branch would put five months of independent work behind one merge,
hold every workstream hostage to the slowest, and take the changes out from under
the CI that already gates `main`.

The planning material is documents, not code, and is written ahead of the work.

## Decision

**The plan lives in this repository, `ninja-recorder-v2-plan`, private, documents and
diagrams only. No application code.**

**Code lands on [`NinjaGoldfinch/ninja-recorder`](https://github.com/NinjaGoldfinch/ninja-recorder)
`main` as ordinary pull requests behind the existing CI, one branch per workstream.
There is no long-lived `v2` branch.**

`v1.1.0` is tagged on the code repository as the working baseline. The plan analysed
`main` at `32dcd41` — app version 0.8.0, 1.1.0 declared.

## Consequences

- `main` stays releasable throughout. Ungated workstreams merge as they finish rather
  than waiting on WS1's capture gate.
- Every v2 change passes the gates already on `main`, plus those WS5 adds.
- Plan and code are versioned apart, so a decision here is invisible from the code
  repository's `git log`. A PR implementing a decision cites its ADR number.
- Workstream files and measurements are living documents, updated here as work lands
  there.
- Nothing in this repository is pushed to `ninja-recorder`.
