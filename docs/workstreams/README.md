# Workstreams

v2 is eight workstreams (WS0–WS8). The table is section 1 of the [implementation plan](../implementation/v2-implementation-plan.md), with links added.

| WS | What | Gated by | Rough effort |
|---|---|---|---|
| [WS0](ws0.md) | Baseline measurement (install size, idle RAM by Private Bytes) | — | 1 week, part-time |
| [WS1](ws1.md) | Capture backend: P0c go/no-go spike, then build Option B; A-trim as fallback and one-release safety net | — (spike); gate (build) | 3 weeks spike + 4 weeks build |
| [WS2](ws2.md) | Generated contract: commands *and* events declared once in Rust, TypeScript client generated | — | 2–3 weeks |
| [WS3](ws3.md) | Daemon / UI split over a named-pipe JSON-RPC transport | WS2, WS6 | 3 weeks |
| [WS4](ws4.md) | Svelte 5 strangler migration, player last as an imperative island | WS2 | 5–6 weeks |
| [WS5](ws5.md) | Toolchain pin, edition 2024, Biome, Vitest, svelte-check, cargo-deny in CI | — | 2 weeks |
| [WS6](ws6.md) | SQLite WAL, busy_timeout, writer + reader pool, `query_only` UI connection | — | 1 week |
| [WS7](ws7.md) | Measure against C3 and ship v2.0.0 (Option B default, libobs selectable, still GPL-2.0) | everything | 1 week |
| [WS8](ws8.md) | Remove libobs, audit derived code and contributors, relicense, ship v2.1.0 | one release of WS7 in the field | 1–2 weeks |

WS0, WS1, WS2, WS5 and WS6 have no upstream and can all start in week one. WS8 is deliberately a separate release.

![Workstream dependencies](../diagrams/png/08-deps.png)

*Figure 10 in the plan — dependencies.*

## Working agreement

Each workstream lands on `ninja-recorder` `main` as ordinary pull requests behind the existing CI, one branch per workstream — see [ADR 0003](../decisions/0003-plan-lives-in-a-separate-repo.md). These files are living documents: tick the status boxes and record outcomes as the work lands.
