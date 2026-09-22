# WS4 — Svelte 5 strangler

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | WS2 |
| **Rough effort** | 5–6 weeks |
| **Status** | Complete, and verified on Windows |

## Goal

Svelte 5 strangler migration, player last as an imperative island.

## Tasks

| # | Task | Exit criterion |
|---|---|---|
| 4.1 | Vite plugin, `svelte` 5, `svelte-check`, `tokens.css`; `mount()` hook in `router.ts` | An empty `App.svelte` mounts and unmounts without affecting vanilla views |
| 4.2 | Extract pure functions from `review.ts` and `library.ts` (`clusterMarkers`, `groupByProximity`, stem sync offset math, filter predicates) into `src/lib/timeline/` and `src/lib/library/`; Vitest on all | ≥ 80% line coverage on the extracted modules |
| 4.3 | `Library.svelte` and children; parity against dev-portal seed fixtures (every row shape in `frontend.md`'s fallback table) | `library.ts` deleted |
| 4.4 | `Settings.svelte`, `Update.svelte`; retention preview, audio preset, autostart, theme, about | `settings.ts`, `update.ts` deleted |
| 4.5 | `Review.svelte` imperative island + `Timeline.svelte`; scrub, stems, clip, dead-end skipping | `review.ts` deleted; fixture MP4 review session identical by manual checklist |
| 4.6 | Delete `dom.ts` (`el`, `escapeHtml`, `escapeAttr`), `index.html` markup down to `<div id="app-root">`, `styles.css` | Only `main.ts`, `theme.ts`, `desktop.ts` remain vanilla |
| 4.7 | `{@html` guard test; Biome clean; `frontend.md` rewritten for the component tree | CI green |

## Exit criteria

The workstream is complete when every task below has met its exit criterion as stated in the table.

- **4.1** — An empty `App.svelte` mounts and unmounts without affecting vanilla views
- **4.2** — ≥ 80% line coverage on the extracted modules
- **4.3** — `library.ts` deleted
- **4.4** — `settings.ts`, `update.ts` deleted
- **4.5** — `review.ts` deleted; fixture MP4 review session identical by manual checklist
- **4.6** — Only `main.ts`, `theme.ts`, `desktop.ts` remain vanilla
- **4.7** — CI green

## Where it stands

Updated 2026-09-23. **Complete**, all seven tasks, and **verified on Windows:
all 45 rows pass** as of 2026-09-21.

The migration ran as a strangler throughout. Each task moved one view and
deleted its vanilla counterpart in the same commit, and 4.6 deleted `dom.ts`,
the `index.html` markup and `styles.css` rather than leaving them beside the
components.

**The verification pass earned its keep.** It found two defects the checklist
had no row for, both of which every gate had passed:

| Found | Cause |
|---|---|
| The player rendered enormous and cropped | `app.css` sizes the video through `#review-video`, and 4.5 rebuilt the element with a `bind:this` reference, which needs no id. The rule stopped matching and the element fell back to its intrinsic 1920-wide box inside a wrapper with `overflow: hidden` |
| Clicking the video did nothing | The old code bound a click handler; the rebuilt element carried seven handlers and no `click` |

Both fixed in [#169](https://github.com/NinjaGoldfinch/ninja-recorder-v2/pull/169). Nothing in the code repository renders a
pixel in CI, so a structural guard was added instead: a test that fails when a
stylesheet selects an id the markup does not declare.

[Q6](https://github.com/NinjaGoldfinch/ninja-recorder-v2/issues/72) decided the dev portal's vanilla UI does not survive v2,
and the same issue ported its eleven panels to Svelte.

## Status

- [x] **4.1** — Vite plugin, svelte 5, svelte-check, tokens.css; mount() hook in router.ts
- [x] **4.2** — Extract pure functions from review.ts and library.ts (clusterMarkers, groupByProximity,…
- [x] **4.3** — Library.svelte and children; parity against dev-portal seed fixtures (every row shape in…
- [x] **4.4** — Settings.svelte, Update.svelte; retention preview, audio preset, autostart, theme, about
- [x] **4.5** — Review.svelte imperative island + Timeline.svelte; scrub, stems, clip, dead-end skipping
- [x] **4.6** — Delete dom.ts (el, escapeHtml, escapeAttr), index.html markup down to <div…
- [x] **4.7** — {@html guard test; Biome clean; frontend.md rewritten for the component tree
