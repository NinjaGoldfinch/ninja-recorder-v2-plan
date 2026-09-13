# WS1 — Capture backend

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | — (spike); gate (build) |
| **Rough effort** | 3 weeks spike + 4 weeks build |
| **Status** | Not started |

## Goal

Capture backend: P0c go/no-go spike, then build Option B; A-trim as fallback and one-release safety net.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 1.1 | P0a keep-list PowerShell step behind `LIBOBS_TRIM=1`; devtools installer; real game | Recording plays; size recorded; plugin-load log clean |
| 1.2 | P0b `LibObsRecorder` constructed by a `--daemon` process; UI killed mid-record | Recording finalizes; daemon-only RAM recorded |
| 1.3 | P0c-1 loopback spike binary; 60 s WAV with Discord open | Game audio present, Discord absent, root PID documented |
| 1.4 | P0c-2 WGC+MF spike; 10-minute sample; kill at minute 5 | Drift < 1 frame; killed file playable; vendor detection on ≥2 GPUs |
| 1.5 | Gate outcome recorded in `DEVELOPMENT.md §16` (new section; do not renumber): loopback root PID, drift figure, encoder vendors seen, decision | Merged |
| 1.6 | P1: `recorder/own/` behind `Recorder` in the daemon crate, default backend | Full game on real hardware from a CI-built installer, isolated game audio, seekable after remux |
| 1.7 | Fallback: trimmed libobs staged from the P0a keep-list; fork pin replaced by a tag; `capture_backend` switch in Settings | Both backends record the same game; `windows-verification.md` gains a backend-comparison table |
| 1.8 | B2 path only if 1.4 flagged encoder quality: direct NVENC/AMF/oneVPL behind `encode.rs` | Quality-per-bitrate within 10% of libobs at 8 Mbps by visual comparison of the same game |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **1.1** — Recording plays; size recorded; plugin-load log clean
- **1.2** — Recording finalizes; daemon-only RAM recorded
- **1.3** — Game audio present, Discord absent, root PID documented
- **1.4** — Drift < 1 frame; killed file playable; vendor detection on ≥2 GPUs
- **1.5** — Merged
- **1.6** — Full game on real hardware from a CI-built installer, isolated game audio, seekable after remux
- **1.7** — Both backends record the same game; `windows-verification.md` gains a backend-comparison table
- **1.8** — Quality-per-bitrate within 10% of libobs at 8 Mbps by visual comparison of the same game

## Status

- [ ] **1.1** — P0a keep-list PowerShell step behind LIBOBS_TRIM=1; devtools installer; real game
- [ ] **1.2** — P0b LibObsRecorder constructed by a --daemon process; UI killed mid-record
- [ ] **1.3** — P0c-1 loopback spike binary; 60 s WAV with Discord open
- [ ] **1.4** — P0c-2 WGC+MF spike; 10-minute sample; kill at minute 5
- [ ] **1.5** — Gate outcome recorded in DEVELOPMENT.md §16 (new section; do not renumber): loopback root…
- [ ] **1.6** — P1: recorder/own/ behind Recorder in the daemon crate, default backend
- [ ] **1.7** — Fallback: trimmed libobs staged from the P0a keep-list; fork pin replaced by a tag;…
- [ ] **1.8** — B2 path only if 1.4 flagged encoder quality: direct NVENC/AMF/oneVPL behind encode.rs
