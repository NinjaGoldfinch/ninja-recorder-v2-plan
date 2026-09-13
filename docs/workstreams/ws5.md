# WS5 — Toolchain and gates

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 2 weeks |
| **Status** | Not started |

## Goal

Toolchain pin, edition 2024, Biome, Vitest, svelte-check, cargo-deny in CI.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 5.1 | `rust-toolchain.toml`; CI reads it | Two CI runs a week apart use the same compiler |
| 5.2 | `cargo fix --edition`; edition 2024; unsafe backlog; `static mut` audit | Clippy `-D warnings` green on both feature sets |
| 5.3 | `deny.toml`; `cargo deny check` in CI | Green with the current tree |
| 5.4 | `biome.json`; `biome ci` in CI; one formatting commit | Green |
| 5.5 | Vitest config + first tests on `format.ts`, `router.ts` | `vitest run` in CI |
| 5.6 | `svelte-check` in CI (lands with 4.1) | Green |
| 5.7 | `CLAUDE.md`, `docs/ci-and-releases.md` updated with the new gate list | Merged |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **5.1** — Two CI runs a week apart use the same compiler
- **5.2** — Clippy `-D warnings` green on both feature sets
- **5.3** — Green with the current tree
- **5.4** — Green
- **5.5** — `vitest run` in CI
- **5.6** — Green
- **5.7** — Merged

## Status

- [ ] **5.1** — rust-toolchain.toml; CI reads it
- [ ] **5.2** — cargo fix --edition; edition 2024; unsafe backlog; static mut audit
- [ ] **5.3** — deny.toml; cargo deny check in CI
- [ ] **5.4** — biome.json; biome ci in CI; one formatting commit
- [ ] **5.5** — Vitest config + first tests on format.ts, router.ts
- [ ] **5.6** — svelte-check in CI (lands with 4.1)
- [ ] **5.7** — CLAUDE.md, docs/ci-and-releases.md updated with the new gate list
