# 0004 — Add WS9, VOD review, as an additive workstream

- **Status:** Accepted
- **Date:** 2026-09-26
- **Source:** [implementation plan](../implementation/v2-implementation-plan.md) §1, §5, §9; [WS9](../workstreams/ws9.md)

## Context

The plan is eight workstreams, WS0–WS8, ending in v2.1.0. Reviewing games
currently happens outside the app, in a spreadsheet, on YouTube and in Sticky
Notes. Bringing that loop in is a product feature, not an architecture change:
it adds tables and views and moves none of the locked decisions.

The plan's wording is frozen, so adding a workstream to it needs a record of
why. WS8 is taken by the licence exit.

## Decision

**VOD review is WS9, specified in [`ws9.md`](../workstreams/ws9.md).** It is
additive: it gates neither WS7 nor WS8, and changes no locked decision.

Its phase P0 touches only the schema, a review form and an importer, and may
run beside WS1–WS3. P1 onward builds on WS2, WS3, WS4 and WS6.

Under this record the plan gains a WS9 row in §1, a sequencing note in §5 and
open questions Q7–Q11 in §9. No existing sentence changes.

## Consequences

- §1 still says "eight workstreams". That is the v2.0.0/v2.1.0 delivery count,
  and WS9 is outside it.
- Figures 10 and 11 do not show WS9. The §5 note says where it sits.
- The daemon's schema gains seven tables, and the code repository's
  `data-model.md` owns their diagram.
- A review outlives its VOD, which changes what retention means for a
  recording. That is WS9 P3's problem, and it is recorded in `ws9.md` §4.4.
- WS9 competes with WS1 for the same part-time maintainer. Nothing here
  reorders the critical path.
