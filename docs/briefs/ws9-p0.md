# WS9 P0 — review schema, review form, spreadsheet import

> Implementation brief for phase P0 of [WS9](../workstreams/ws9.md). Section numbers (§3, §3.1, §6) refer to that file. Adapted from the draft with the same changes as its "Adapted to the tree" table: `games` is a new table, events reuse `markers`, table names are plural.

Implement phase P0 of WS9 (VOD review and note-taking) in [`ninja-recorder`](https://github.com/NinjaGoldfinch/ninja-recorder). Read [`ws9.md`](../workstreams/ws9.md) fully before writing code. Ground every decision in it; where it is silent, follow the [design document](../design/v2-design.md), the [implementation plan](../implementation/v2-implementation-plan.md) and the code repository's `CLAUDE.md`, and note the gap in the PR description.

## Ground rules

- Match the target layout (design document §3.4) and the existing module conventions. Do not invent a new layout.
- Respect the locked decisions: the SQLite writer is daemon-owned with a reader pool; IPC contract types come from ts-rs plus the existing `dispatch_table!` macro. Do not introduce tauri-specta or any alternative.
- Every gate in the code repository's `CLAUDE.md` passes on every commit. Add tests for everything added.
- Commit messages and PR descriptions follow the code repository's conventions, including its rule against attribution trailers and session links.
- Small, reviewable commits. One logical change per commit.

## In scope

### 1. Schema (§3)

One appended migration introducing:

- `games`, `blocks`, `game_reviews`, `notes`, `objectives`, `game_objectives`, `takeaways`
- `games.recording_id` (nullable FK to `recordings`, `ON DELETE SET NULL`), `games.riot_game_id` (nullable, unique when present), `games.block_id` (nullable FK) and `games.recording_offset_ms` (nullable INTEGER)

Exactly as specified in §3 and §3.1. Enforce with constraints:

- Enums as `CHECK (col IN (...))` using the value sets in §3.1.
- `takeaways`: `CHECK ((game_id IS NULL) <> (block_id IS NULL))`.
- `game_reviews.game_id` is both PK and FK to `games`.
- `game_objectives` PK is `(game_id, objective_id)`.
- Foreign keys `ON DELETE CASCADE` from `games`; `ON DELETE SET NULL` for `games.recording_id`, `notes.objective_id`, `notes.marker_id`, `takeaways.objective_id`, `takeaways.promoted_to_id`.
- Indexes: `notes(game_id, ts_ms)`, `objectives(status)`, `takeaways(game_id)`, `takeaways(block_id)`, `games(started_at)`, `games(block_id)`.

Events are **not** a new table: §6 Q2 is answered, and `markers` is reused. Confirm nothing in the schema has changed that since, and record the check in the PR.

### 2. Daemon-side data access

`Db` methods, each on the correct side of the writer/reader split:

- `objectives`: create, update body/category, set status, list by status
- `blocks`: get-or-create for a game start time using the 2-hour gap rule (§3.1), split, merge
- `game_reviews`: upsert for a game
- `game_objectives`: snapshot active objectives for a game at game start; toggle `ticked`
- `takeaways`: create for game or block, delete, promote (creates an `objectives` row from the takeaway body and sets `promoted_to_id`) in one transaction

Hook game creation, the block get-or-create and the objective snapshot into the existing game-start path (next to `begin_recording` in the supervisor) so they run automatically when a recording begins. Complete the game from the recording at finalize.

### 3. IPC contract

Expose the above through the existing dispatch table with ts-rs-derived types. Follow the existing naming and error patterns exactly. Regenerate the TypeScript contract with `gen-contract` and commit the output.

### 4. Review form UI (Svelte 5)

A single `ReviewForm` component for one game, matching the right-hand rail of the §4.1 wireframe, minus anything video-related:

- Header: date/time, champion, matchup, result (from `games`)
- Ratings: three segmented controls for `game_rating`, `lane_rating`, `mental_rating`, colour-coded consistently with the spreadsheet (win/good = green, neutral = amber, loss/bad = red)
- Clear time (mm:ss input) and smites-at-clear (integer); deaths (integer, prefilled from `death` markers if present, editable)
- "Reviewing against": checklist of the game's snapshotted objectives with `ticked` toggles
- Takeaways: list with delete and a "Promote to objective" action; add-takeaway textarea
- Free notes textarea

Autosave on change with a debounce; show a saved/unsaved indicator. Add a minimal `Objectives` list view (active/paused/retired, create, retire) so promoted takeaways can be seen and managed. Stay within the existing design tokens.

### 5. Spreadsheet importer (§3.2)

A command following the repository's existing pattern for one-off tools, ingesting a CSV export of the spreadsheet. Columns: `date`, `time`, `block`, `game_no`, `playing`, `matchup`, `game`, `lane`, `mental`, `clear_time`, `smites`, `deaths`, `learning_objectives` (bullet-separated), `key_takeaways` (bullet-separated), `block_takeaways`. Behaviour per §3.2. Idempotent: re-running must not duplicate rows. Include a fixture CSV and a test.

## Out of scope — do not start

- Any video playback, timeline, marker, or hotkey work (P1)
- The always-on-top objectives widget or any second Tauri window (P2)
- Block view, trends, retention policy, unreviewed queue (P3)
- Drawing, clips, YouTube or any export (P4)
- Any change to capture backends, Live Client polling cadence, or other workstreams' tasks
- Resolving the open questions in §6 — implement the P0 defaults stated there (manual clear time, 2-hour block gap, plain-text notes)

## Deliverables

1. Migration + `Db` methods + tests
2. Contract additions + regenerated TypeScript
3. `ReviewForm` and `Objectives` views + Vitest coverage for their state logic
4. Importer + fixture + test
5. PR descriptions stating what was built, any place the spec was silent and the choice made, and follow-ups for P1
