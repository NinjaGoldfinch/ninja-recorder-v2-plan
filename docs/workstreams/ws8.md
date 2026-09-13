# WS8 — Remove libobs and relicense (v2.1.0)

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | one release of WS7 in the field |
| **Rough effort** | 1–2 weeks |
| **Status** | Not started |

## Goal

Remove libobs, audit derived code and contributors, relicense, ship v2.1.0.

Runs after v2.0.0 has had one release cycle in the field with Option B as the default.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 8.1 | Contributor audit: `git shortlog -sne` on the full history; written agreement from every non-maintainer author, or rewrite their hunks | Recorded in `docs/licensing.md` |
| 8.2 | Derived-code audit: everything in `recorder/libobs/`, `worker_log.rs`, and any identifier or comment lifted from the libobs-recorder fork; delete or rewrite from the public Windows API documentation, not from the fork | `grep` for fork identifiers returns nothing; audit checklist in `docs/licensing.md` |
| 8.3 | Delete `recorder/libobs/`, the CI staging steps, `tauri.windows.conf.json` resources, the `capture_backend` switch; remove the `deny.toml` exception | `cargo deny check` green with GPL denied; install size re-measured |
| 8.4 | Choose and apply the target licence (see §9, Q1); update `Cargo.toml`, `package.json`, `LICENSE`, `README`, the About panel, and the release-notes caveat block | One commit, tagged `v2.1.0` |
| 8.5 | ffmpeg stays the LGPL static build, invoked as a separate process for `-c copy` only; document that this is the only remaining copyleft component and why it is compatible with a proprietary distribution | `docs/licensing.md` |
| 8.6 | Historical releases remain GPL-2.0 and remain available; the tag `v2.0.0` is the last GPL release and `README` says so | Merged |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **8.1** — Recorded in `docs/licensing.md`
- **8.2** — `grep` for fork identifiers returns nothing; audit checklist in `docs/licensing.md`
- **8.3** — `cargo deny check` green with GPL denied; install size re-measured
- **8.4** — One commit, tagged `v2.1.0`
- **8.5** — `docs/licensing.md`
- **8.6** — Merged

**On the target licence.** Any permissive licence (MIT, Apache-2.0, or the dual) or a source-available licence (BUSL-1.1, PolyForm) is compatible with a later closed-source distribution, because the maintainer keeps the copyright. Past releases stay under whatever they were released under; that cannot be revoked and does not need to be. If the intent is closed source *soon*, the simplest v2.1 is "all rights reserved" with the source repository made private; if the intent is to keep the repository public while reserving the option, Apache-2.0 (patent grant, contributor licence clarity) is the conventional choice. Either way, from v2.1 onward the repository should carry a `CONTRIBUTING.md` with a contributor licence agreement, or accept no outside contributions, so the copyright stays consolidated.

## Status

- [ ] **8.1** — Contributor audit: git shortlog -sne on the full history; written agreement from every…
- [ ] **8.2** — Derived-code audit: everything in recorder/libobs/, worker_log.rs, and any identifier or…
- [ ] **8.3** — Delete recorder/libobs/, the CI staging steps, tauri.windows.conf.json resources, the…
- [ ] **8.4** — Choose and apply the target licence (see §9, Q1); update Cargo.toml, package.json,…
- [ ] **8.5** — ffmpeg stays the LGPL static build, invoked as a separate process for -c copy only;…
- [ ] **8.6** — Historical releases remain GPL-2.0 and remain available; the tag v2.0.0 is the last GPL…
