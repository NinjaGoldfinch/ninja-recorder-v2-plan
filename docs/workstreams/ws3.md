# WS3 — Daemon / UI split

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | WS2, WS6 |
| **Rough effort** | 3 weeks |
| **Status** | Code complete. Verified 26 of 28 rows on Windows |

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

## Where it stands

Updated 2026-09-23. **All eight tasks are closed and the code is complete.**
Verification is the part that is still running, because this workstream split
one process into two and every failure mode it introduces is two processes
disagreeing about who owns what. None of that shows up in a unit test.

[#130](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/130) is the verification plan, with an order and a statement
of what CI already rules out. As of 2026-09-22 it stands at **26 of 28 rows**.

**WS3.4's exit criterion passes**: the UI killed mid-game, relaunched, showing
the recording still in flight with its elapsed time continuing, and a complete
VOD afterwards. That is also WS1.2's exit criterion, so it needs no separate
run.

Two rows are open:

| Open | Why it still matters |
|---|---|
| `daemon.log` holds the finalize with no `WARN [notify]` | The notification was seen, so the absence of a warning is the only evidence the daemon took the intended path rather than a fallback |
| The row and its markers survive a killed daemon | The change that makes this true has never been run on hardware |

Two sub-issues are open beside them: [#61](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/61), `--daemon` exit code
2 on a real release build, and [Q5](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/71), whether `--hidden` stays an
alias for one release or goes at 2.0.0.

## Status

- [x] **3.1** — daemon/rpc.rs: pipe listener, line framing, hello/subscribe, per-request ids,…
- [x] **3.2** — daemon/mod.rs: single-instance mutex, DB writer, supervisor, runtime; launch.rs --daemon…
- [x] **3.3** — daemon/pump.rs: tray-icon + muda menu on a Win32 message loop; Open/Settings/Quit;…
- [x] **3.4** — ui/: rpc_call/rpc_subscribe Tauri commands proxying the pipe; PipeTransport in TS;…
- [x] **3.5** — Autostart flag --hidden → --daemon; UI starts daemon if absent
- [x] **3.6** — Updater in daemon (reqwest + minisign-verify); UI shows status from UpdateStatus events;…
- [x] **3.7** — Dev portal over the pipe (dev_* join the declaration under cfg(feature = "devtools"))
- [x] **3.8** — Daemon killed mid-recording → UI shows "daemon not running", restarts it, resyncs;…
