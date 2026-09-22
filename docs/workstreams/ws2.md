# WS2 — Generated contract

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — |
| **Rough effort** | 2–3 weeks |
| **Status** | Complete |

## Goal

Generated contract: commands *and* events declared once in Rust, TypeScript client generated.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 2.1 | Add `-> ReturnType` to every `dispatch_table!` row; macro emits `contract_manifest()` | `cargo test` green, no behaviour change |
| 2.2 | `ts-rs` derives on every type crossing the boundary (~40); `#[ts(export)]` disabled in favour of the generator collecting them | Types compile |
| 2.3 | `contract/events.rs` with `Event`, `Topic`, `ContractEvent` derive; `EventSink` on `Supervisor`; emit on every transition, marker, LCU phase, library change, retention run, update status | Unit test asserts one event per state transition against the fixture-driven supervisor test |
| 2.4 | `contract/snapshot.rs`: `Snapshot { seq, state, lcu, current_recording, update, prefs }` assembled from `Ctx` | Round-trips through serde |
| 2.5 | `gen-contract` binary: emits `types.ts`, `client.ts` (one method per command, camelCase args, typed return), `events.ts` (discriminated union + `Topic`); `--check` mode | Generated output committed; `--check` passes |
| 2.6 | `src/lib/transport/{invoke,mock}.ts`; `bridge.ts` becomes a thin re-export of the client over `InvokeTransport` | Frontend behaviour unchanged; `tsc` green |
| 2.7 | Delete `every_command_round_trips`, `src/dev/registry.ts` and the portal's drift banner; move help text to doc comments | Merged; CI has `gen-contract --check` |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **2.1** — `cargo test` green, no behaviour change
- **2.2** — Types compile
- **2.3** — Unit test asserts one event per state transition against the fixture-driven supervisor test
- **2.4** — Round-trips through serde
- **2.5** — Generated output committed; `--check` passes
- **2.6** — Frontend behaviour unchanged; `tsc` green
- **2.7** — Merged; CI has `gen-contract --check`

## Where it stands

Updated 2026-09-23. **Complete**, all seven tasks.

Commands and events are declared once in Rust and the TypeScript client is
generated from that declaration. `gen-contract --check` is a CI gate, so a
command added without regenerating cannot merge, and the three things it
replaced were deleted rather than left beside it: `every_command_round_trips`,
`src/dev/registry.ts` and the dev portal's drift banner.

One correction came out of it. The module is `r#gen`, not `gen`, because `gen`
is a reserved keyword in edition 2024; the file is still `gen.rs`, since a file
name is not an identifier. [Q9](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/75) decided to keep it rather than
rename. Recorded in [corrections.md](../corrections.md).

[Q7](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/73) settled that `Event::LcuPhase` carries the full gameflow
enumeration, and [Q8](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/74) that the `dev_*` commands join the
declaration.

## Status

- [x] **2.1** — Add -> ReturnType to every dispatch_table! row; macro emits contract_manifest()
- [x] **2.2** — ts-rs derives on every type crossing the boundary (~40); #[ts(export)] disabled in favour…
- [x] **2.3** — contract/events.rs with Event, Topic, ContractEvent derive; EventSink on Supervisor; emit…
- [x] **2.4** — contract/snapshot.rs: Snapshot { seq, state, lcu, current_recording, update, prefs }…
- [x] **2.5** — gen-contract binary: emits types.ts, client.ts (one method per command, camelCase args,…
- [x] **2.6** — src/lib/transport/{invoke,mock}.ts; bridge.ts becomes a thin re-export of the client over…
- [x] **2.7** — Delete every_command_round_trips, src/dev/registry.ts and the portal's drift banner; move…
