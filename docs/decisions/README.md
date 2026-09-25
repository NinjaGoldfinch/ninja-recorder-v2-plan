# Decisions

Architecture decision records for ninja-recorder v2. Each one records a decision
that was made, the context it was made in, and what follows from it.

## Index

| # | Decision | Status |
|---|---|---|
| [0001](0001-option-b-is-the-target.md) | Option B (WGC → D3D11 → Media Foundation) is the target capture backend | Accepted |
| [0002](0002-two-release-relicensing-sequence.md) | Relicensing happens over two releases, not one | Accepted |
| [0003](0003-plan-lives-in-a-separate-repo.md) | The plan lives in a separate repository; the code lands as ordinary PRs | Accepted |
| [0004](0004-add-ws9-vod-review.md) | VOD review is WS9, an additive workstream outside the v2.0.0 and v2.1.0 releases | Accepted |

## Rules

- ADRs are numbered sequentially from `0001`. Numbers are **never reused,
  renumbered or deleted**.
- A decision that is reversed is not edited away. The old ADR gains a
  `Superseded by NNNN` line in its status, and the new one explains what changed.
- Keep each record under 300 words. If it needs more, the decision is probably two
  decisions.
- Cite the source: which document, which section.
- A pull request on `ninja-recorder` that implements a decision should cite the ADR
  number in its description — see [0003](0003-plan-lives-in-a-separate-repo.md).

## Template

```markdown
# NNNN — Short imperative title

- **Status:** Proposed | Accepted | Superseded by NNNN
- **Date:** YYYY-MM-DD
- **Source:** which document and section this comes from

## Context

What forces are in play. What makes this a decision rather than an obvious step.
State the situation, not the answer.

## Decision

What was decided, in the active voice. One decision per record.

## Consequences

What becomes true, easier, harder or newly required. Include the costs and the
things left open — a consequence that is only good is usually incomplete.
```
