# 0002 — Relicensing happens over two releases, not one

- **Status:** Accepted
- **Date:** 2026-09-13
- **Source:** [implementation plan](../implementation/v2-implementation-plan.md) §1, §8, WS8

## Context

[ADR 0001](0001-option-b-is-the-target.md) makes Option B the target so the GPL-2.0
inheritance can be removed. The licence cannot change while libobs ships, and libobs
cannot be deleted until the own backend has proved itself on real hardware.

Relicensing also needs work unrelated to capture: a contributor audit across the full
history, and a derived-code audit of everything written against the libobs-recorder
fork.

## Decision

**v2.0.0** ships Option B as the default backend with trimmed libobs selectable,
both under 200 MB combined, libobs pinned to a tag not a branch. It remains
**GPL-2.0**. `deny.toml` denies GPL with exactly one named exception, so the next
step is a deletion, not an audit.

**v2.1.0**, after one full release cycle in the field, deletes `recorder/libobs/`,
the CI staging steps, the `tauri.windows.conf.json` resources and the
`capture_backend` switch; runs both audits; and changes the licence in **one tagged
commit** across `Cargo.toml`, `package.json`, `LICENSE`, `README` and the About panel.

**The target licence is TBD.** Q1 in §9 is open. WS8 lists the options:

| Option | Note |
|---|---|
| Permissive — MIT, Apache-2.0, or the dual | Apache-2.0 is conventional if the repo stays public |
| Source-available — BUSL-1.1, PolyForm | Compatible with later closed-source distribution |
| All rights reserved, repository private | Simplest if the intent is closed source *soon* |

All three keep a closed-source path open, because the maintainer keeps the copyright.

## Consequences

- v2.0.0 ships before Option B has months of field time. That is what the selectable
  backend buys.
- Historical releases stay GPL-2.0 and stay available. `v2.0.0` is the last GPL
  release and the README says so.
- ffmpeg stays the LGPL static build, a separate process doing `-c copy` only — the
  one copyleft component surviving WS8.
- From v2.1 the repo needs a contributor licence agreement or no outside contributions.
- Q1 blocks task 8.4.
