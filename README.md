# ninja-recorder v2 — plan

Planning, design and decision log for version 2 of
[ninja-recorder](https://github.com/NinjaGoldfinch/ninja-recorder).

**This repository holds documents and diagrams. It holds no application code, and
none belongs here.** The v2 implementation lands as pull requests on the code
repository, workstream by workstream. This is where the plan, the decisions and the
measurements live.

## What v2 is

v2 is **eight workstreams** over roughly five months of part-time work. It keeps
Tauri, Rust, SQLite, files-as-truth and the `Recorder` trait, and changes the
frontend, the IPC contract, the process model, the quality gates and the capture
backend. The capture backend is the decision that gates the rest: **Option B —
Windows.Graphics.Capture → D3D11 → Media Foundation — is the target**, because every
libobs configuration keeps the shipped binary GPL-2.0 and a closed-source path is
wanted. Trimmed libobs is the fallback and a one-release safety net. The licence
exits over **two releases**: v2.0.0 ships Option B with libobs selectable and stays
GPL-2.0; v2.1.0 deletes libobs, runs the audits and changes the licence in one
tagged commit.

WS9, in-app VOD review, is additive and outside both releases
([ADR 0004](docs/decisions/0004-add-ws9-vod-review.md)).

## The documents

| Document | What it is |
|---|---|
| [Design document](docs/design/v2-design.md) | The v2 architecture and tech-stack evaluation — decides *what* changes |
| [Implementation plan](docs/implementation/v2-implementation-plan.md) | The implementation and design document, rev 2 — decides *how* |
| [Workstreams](docs/workstreams/README.md) | WS0–WS9, one file each: goal, tasks, exit criteria, status |
| [Briefs](docs/README.md#briefs) | Implementation briefs for a single phase of a workstream, under `docs/briefs/` |
| [Decisions](docs/decisions/README.md) | ADRs 0001–0004, with the index and template |
| [Corrections](docs/corrections.md) | Where the plan and the built tree disagree, and which one is right |
| [Measurements](docs/measurements/README.md) | The measurement method and the v1 baseline table |
| [Diagrams](docs/diagrams/README.md) | Eleven diagrams as Mermaid source and rendered PNG |
| [Document index](docs/README.md) | Every document in this repository, one line each |

## How the plan relates to the code repo

The code changes land on
[`NinjaGoldfinch/ninja-recorder`](https://github.com/NinjaGoldfinch/ninja-recorder)
`main` as ordinary pull requests behind the existing CI — **one branch per
workstream, never a long-lived `v2` branch**. `v1.1.0` is tagged there as the working
baseline.

Nothing here is pushed to the code repository. A pull request that implements a
decision recorded here cites its ADR number in the description, because the two
repositories are versioned apart.

The reasoning is [ADR 0003](docs/decisions/0003-plan-lives-in-a-separate-repo.md).

## Status

**Planning. No workstream has been started.** The measurement tables are empty and
the workstream checklists are unticked.

---

The documents in this repository are All Rights Reserved, © 2026 NinjaGoldfinch.
See [LICENSE](LICENSE).
