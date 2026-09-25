# Documents

Every document in this repository, one line each.

## Source documents

These two are the inputs. Their wording is frozen — see [`../CLAUDE.md`](../CLAUDE.md).

| Document | What it is |
|---|---|
| [design/v2-design.md](design/v2-design.md) | The v2 architecture and tech-stack design document — decides *what* changes |
| [design/v2-design.docx](design/v2-design.docx) | The same document as Word, original and unmodified |
| [implementation/v2-implementation-plan.md](implementation/v2-implementation-plan.md) | The implementation and design document, rev 2 — decides *how* |
| [implementation/v2-implementation-plan.docx](implementation/v2-implementation-plan.docx) | The same document as Word, original and unmodified |

## Corrections

A living document. Where the plan and the built tree disagree, and which one is
right. The source documents are frozen, so a factual correction is recorded
here rather than applied to the sentence it corrects.

| Document | What it is |
|---|---|
| [corrections.md](corrections.md) | Plan-to-tree disagreements, by section, with what the tree does and why |

## Diagrams

| Document | What it is |
|---|---|
| [diagrams/README.md](diagrams/README.md) | Index of all eleven diagrams, the figure each matches, and how to re-render |
| [diagrams/src/](diagrams/src/) | Mermaid sources, `.mmd` — the source of truth |
| [diagrams/png/](diagrams/png/) | Rendered PNGs, generated output, never hand-edited |

## Decisions

| Document | What it is |
|---|---|
| [decisions/README.md](decisions/README.md) | ADR index, numbering rules and the template |
| [decisions/0001](decisions/0001-option-b-is-the-target.md) | Option B (WGC → D3D11 → Media Foundation) is the target capture backend |
| [decisions/0002](decisions/0002-two-release-relicensing-sequence.md) | Relicensing happens over two releases, not one |
| [decisions/0003](decisions/0003-plan-lives-in-a-separate-repo.md) | The plan lives in a separate repository; code lands as ordinary PRs |
| [decisions/0004](decisions/0004-add-ws9-vod-review.md) | VOD review is WS9, additive to the v2 plan |

## Workstreams

Living documents. Updated as the work lands on the code repository.

| Document | What it is |
|---|---|
| [workstreams/README.md](workstreams/README.md) | WS0–WS9 summary table with links, and the working agreement |
| [workstreams/ws0.md](workstreams/ws0.md) | Baseline and measurement |
| [workstreams/ws1.md](workstreams/ws1.md) | Capture backend — the P0 arms and the Option B build |
| [workstreams/ws2.md](workstreams/ws2.md) | Generated contract — commands and events declared once |
| [workstreams/ws3.md](workstreams/ws3.md) | Daemon / UI split over a named-pipe JSON-RPC transport |
| [workstreams/ws4.md](workstreams/ws4.md) | Svelte 5 strangler migration |
| [workstreams/ws5.md](workstreams/ws5.md) | Toolchain and quality gates |
| [workstreams/ws6.md](workstreams/ws6.md) | SQLite WAL and connection ownership |
| [workstreams/ws7.md](workstreams/ws7.md) | Measure against C3 and ship v2.0.0 |
| [workstreams/ws8.md](workstreams/ws8.md) | Remove libobs, audit, relicense, ship v2.1.0 |
| [workstreams/ws9.md](workstreams/ws9.md) | VOD review and note-taking — additive, outside the v2 releases |

## Briefs

Implementation briefs: what one phase of a workstream builds, what it must not
start, and what it hands back. Written ahead of the work and handed to whoever
picks it up.

| Document | What it is |
|---|---|
| [briefs/ws9-p0.md](briefs/ws9-p0.md) | WS9 P0 — review schema, review form, spreadsheet import |

## Measurements

Living documents.

| Document | What it is |
|---|---|
| [measurements/README.md](measurements/README.md) | The measurement method — Private Bytes headline, Working Set alongside, daemon-only |
| [measurements/baseline-v1.md](measurements/baseline-v1.md) | The v1 baseline table, to be filled in during WS0 |
