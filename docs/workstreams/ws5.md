# WS5 — Toolchain and gates

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 2 weeks |
| **Status** | Complete |

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

## Where it stands

Updated 2026-09-23. **Complete**, all seven tasks. The gate list in the code
repository's `CLAUDE.md` and `docs/ci-and-releases.md` is the live record of
what CI runs.

Four deviations from §4.7 came out of it and are recorded in
[corrections.md](../corrections.md): `[licenses] deny` no longer exists in
cargo-deny, the allow list is thirteen identifiers rather than six, the "single
named exception" is six crates in two groups, and `rustfmt` is listed as a
toolchain component while not being a gate.

Three defects were found by running the gates rather than by reading them:
Windows CRLF checkouts made `biome ci .` fail on every text file
([#55](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/55)); clippy's `collapsible_if` fired on Windows-only code
nothing local compiles ([#58](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/58)); and `cargo fix --edition` left
`expr_2021` fragment specifiers in fourteen macro arms
([#62](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/62)).

## Status

- [x] **5.1** — rust-toolchain.toml; CI reads it
- [x] **5.2** — cargo fix --edition; edition 2024; unsafe backlog; static mut audit
- [x] **5.3** — deny.toml; cargo deny check in CI
- [x] **5.4** — biome.json; biome ci in CI; one formatting commit
- [x] **5.5** — Vitest config + first tests on format.ts, router.ts
- [x] **5.6** — svelte-check in CI (lands with 4.1)
- [x] **5.7** — CLAUDE.md, docs/ci-and-releases.md updated with the new gate list
