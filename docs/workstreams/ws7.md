# WS7 — Measure and ship

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | everything |
| **Rough effort** | 1 week |
| **Status** | Not started. Gated on the WS1 gate and a release candidate |

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

## Where it stands

Updated 2026-09-23. **Not started.** It is gated on everything, and in
practice on two things that are not ready: the WS1 gate has not been answered,
and there is no release candidate.

One verification did close early. The `build` job had never run in this
repository at all ([#60](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/60)). Running it found that the production
bundle failed while the devtools bundle passed, because only one of the two
matrix entries produced updater artifacts and no signing key exists here. Both
now agree: no key means build the installer and skip publishing. Confirmed by
artifact rather than by a green tick, 64 MB production against 92 MB devtools.

The `release` job itself, meaning publishing, the update manifest and minisign
signing, has still never run and cannot until a key exists. That is 7.3.

## Status

- [ ] **7.1** — Run scripts/measure.ps1 on the release candidate
- [ ] **7.2** — Full verification pass per windows-verification.md §1–§5 plus the new §4 daemon cases
- [ ] **7.3** — npm run release -- next 2.0.0; alpha soak for one week; npm run release -- cut
