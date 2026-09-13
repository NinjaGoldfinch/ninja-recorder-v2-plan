# WS3 — Daemon / UI split

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | WS2, WS6 |
| **Rough effort** | 3 weeks |
| **Status** | Not started |

## Goal

Daemon / UI split over a named-pipe JSON-RPC transport.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 3.1 | `daemon/rpc.rs`: pipe listener, line framing, `hello`/`subscribe`, per-request ids, `spawn_blocking` for sync commands, bounded broadcast for events, lag handling | Integration test over a Unix socket on the dev box: 100 interleaved requests, events delivered in order |
| 3.2 | `daemon/mod.rs`: single-instance mutex, DB writer, supervisor, runtime; `launch.rs` `--daemon` no longer refuses | `ninja-recorder --daemon` runs headless on Windows and records via the dev portal |
| 3.3 | `daemon/pump.rs`: `tray-icon` + `muda` menu on a Win32 message loop; Open/Settings/Quit; quit-while-recording confirmation | Tray behaviour matches `windows-verification.md §5.0.1` |
| 3.4 | `ui/`: `rpc_call`/`rpc_subscribe` Tauri commands proxying the pipe; `PipeTransport` in TS; reconnect with backoff; snapshot applied to stores; version-skew refusal | UI killed and relaunched mid-recording shows the live recording within one reconnect |
| 3.5 | Autostart flag `--hidden` → `--daemon`; UI starts daemon if absent | Login starts a daemon only |
| 3.6 | Updater in daemon (`reqwest` + `minisign-verify`); UI shows status from `UpdateStatus` events; install is an RPC refused during recording | Alpha-channel update applied end to end from the daemon |
| 3.7 | Dev portal over the pipe (`dev_*` join the declaration under `cfg(feature = "devtools")`) | Every portal panel works against a separate daemon process |
| 3.8 | Daemon killed mid-recording → UI shows "daemon not running", restarts it, resyncs; recording file playable, row reconciled | Documented in `windows-verification.md §4` |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **3.1** — Integration test over a Unix socket on the dev box: 100 interleaved requests, events delivered in order
- **3.2** — `ninja-recorder --daemon` runs headless on Windows and records via the dev portal
- **3.3** — Tray behaviour matches `windows-verification.md §5.0.1`
- **3.4** — UI killed and relaunched mid-recording shows the live recording within one reconnect
- **3.5** — Login starts a daemon only
- **3.6** — Alpha-channel update applied end to end from the daemon
- **3.7** — Every portal panel works against a separate daemon process
- **3.8** — Documented in `windows-verification.md §4`

## Status

- [ ] **3.1** — daemon/rpc.rs: pipe listener, line framing, hello/subscribe, per-request ids,…
- [ ] **3.2** — daemon/mod.rs: single-instance mutex, DB writer, supervisor, runtime; launch.rs --daemon…
- [ ] **3.3** — daemon/pump.rs: tray-icon + muda menu on a Win32 message loop; Open/Settings/Quit;…
- [ ] **3.4** — ui/: rpc_call/rpc_subscribe Tauri commands proxying the pipe; PipeTransport in TS;…
- [ ] **3.5** — Autostart flag --hidden → --daemon; UI starts daemon if absent
- [ ] **3.6** — Updater in daemon (reqwest + minisign-verify); UI shows status from UpdateStatus events;…
- [ ] **3.7** — Dev portal over the pipe (dev_* join the declaration under cfg(feature = "devtools"))
- [ ] **3.8** — Daemon killed mid-recording → UI shows "daemon not running", restarts it, resyncs;…
