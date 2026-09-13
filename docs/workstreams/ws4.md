# WS4 — Svelte 5 strangler

> From section 5 of the [v2 implementation plan](../implementation/v2-implementation-plan.md). The task table is reproduced verbatim.

| | |
|---|---|
| **Gated by** | WS2 |
| **Rough effort** | 5–6 weeks |
| **Status** | Not started |

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

## Status

- [ ] **4.1** — Vite plugin, svelte 5, svelte-check, tokens.css; mount() hook in router.ts
- [ ] **4.2** — Extract pure functions from review.ts and library.ts (clusterMarkers, groupByProximity,…
- [ ] **4.3** — Library.svelte and children; parity against dev-portal seed fixtures (every row shape in…
- [ ] **4.4** — Settings.svelte, Update.svelte; retention preview, audio preset, autostart, theme, about
- [ ] **4.5** — Review.svelte imperative island + Timeline.svelte; scrub, stems, clip, dead-end skipping
- [ ] **4.6** — Delete dom.ts (el, escapeHtml, escapeAttr), index.html markup down to <div…
- [ ] **4.7** — {@html guard test; Biome clean; frontend.md rewritten for the component tree
