# Corrections

Where the implementation plan and the built tree disagree, and which one is
right.

A living document. The two source documents are frozen (see
[`../CLAUDE.md`](../CLAUDE.md)), so a factual correction cannot be applied by
editing the sentence it corrects. It is recorded here instead, against the
section it belongs to, so that a reader who follows the plan literally finds
out before acting on it.

**Nothing here blocks work.** Every entry is already handled in the code
repository. What was missing was a way for the plan to admit it.

## How to read an entry

Each one names the plan's claim, what the tree does, and why the tree is what
it is. An entry is added when the disagreement is a matter of fact, not taste:
a keyword that changed, a tool that dropped a key, a count that was quoted
without its units. A deliberate change of direction is an ADR, not a
correction.

Entries are never deleted. One that is itself overtaken gains a line saying so,
the way an ADR does, because the plan's wording it corrects is still there.

---

## §4.7 Toolchain and quality gates

### The module is `r#gen`, not `gen`

§3.4 draws the generated contract module as `contract/gen.rs`. `gen` is a
reserved keyword in edition 2024, so the declaration has to be
`pub mod r#gen;`. The *file* is still `gen.rs`, because a file name is not an
identifier, and neither is the `gen-contract` binary name. Only the `mod`
declaration and the `use` sites carry the escape.

### Clippy's `collapsible_if` fires under edition 2024

Edition 2024 stabilised let-chains, which turns a nested `if let` into
something clippy can collapse and therefore something it warns about. Eight
sites in the tree, and `-D warnings` makes each one an error, so this is part
of the edition migration rather than a tidy-up afterwards. Two of the eight
were inside `#[cfg(windows)]` code and invisible to a Linux build, which is
worth knowing before planning the migration as a local afternoon.

### The `unsafe_op_in_unsafe_fn` backlog is one file, not three

§4.7 names `recorder/libobs/`, `recorder/devices.rs` and `worker_log.rs`. Only
`devices.rs` had anything to fix. The other two already wrote their `unsafe`
operations in explicit blocks inside safe functions, which is the shape the
lint exists to produce.

### There is no `static mut` to restructure

§4.7's "restructure any `static mut`" is a no-op: the tree has none, and had
none at import.

### `[licenses] deny` no longer exists

§4.7 specifies `deny = ["GPL-*", "AGPL-*"]`. cargo-deny removed the
`[licenses] deny` key in 0.18 (upstream PR #611), so that line is not
expressible in a current `deny.toml`.

Denial is now by omission from `allow`, which is **broader than what the plan
asked for**, not narrower: an allow list refuses SSPL, CDDL and EPL as well,
none of which the plan thought to name. The property §4.7 wanted is preserved
and strengthened; only the mechanism changed.

### The allow list is thirteen entries, not six

§4.7 gives `["MIT", "Apache-2.0", "BSD-*", "ISC", "Zlib", "Unicode-3.0"]`. The
shipped graph resolves to thirteen distinct identifiers:

| Added | Why |
|---|---|
| `BSD-2-Clause`, `BSD-3-Clause` | cargo-deny takes SPDX identifiers, not globs, so `BSD-*` has to be spelled out |
| `MPL-2.0` | five crates: `cssparser`, `cssparser-macros`, `selectors` and `dtoa-short` through Tauri, `option-ext` through `dirs-sys` |
| `0BSD`, `CC0-1.0`, `MIT-0`, `BSL-1.0`, `Unlicense` | public-domain-equivalent, roughly one crate each: `adler2`, `dunce`, `ryu`, and the dual-licensed halves of `memchr`, `aho-corasick`, `walkdir` and friends |

`MPL-2.0` is the only judgement on that list rather than a formality, and it is
the one that matters to WS8: its copyleft is per file. It obliges source for
those files if they are modified and says nothing about the program that links
them, so it survives the v2.1 relicence where GPL would not. `deny.toml` spells
that reasoning out at the entry rather than here.

### "Exactly one named exception" is six crates in two groups

§4.7 asks for "a single named exception for `libobs-recorder`". The dependency
resolves to five crates (`libobs-recorder`, `intprocess-recorder`, `ipc-link`,
`libobs-sys`, `build-helper`), and this crate's own inherited `GPL-2.0-only`
needs an exception of its own, making six.

The plan's *property* holds and is what WS8 relies on: the exceptions are
written as one deletable block, so removing them is still what proves no
copyleft dependency remains. It is the number that was wrong.

### `rustfmt` is listed as a component but is not a gate

§4.7's `rust-toolchain.toml` row gives
`components = ["rustfmt", "clippy"]` and the CI order below it names nine
steps, none of which is `cargo fmt`. The tree has never been run through
rustfmt and is hand-formatted; a tree-wide `cargo fmt` rewrites 63 of the 76
Rust source files. The component stays installed so a single-file run works,
and the code repository's `CLAUDE.md` carries the measurement and the warning.
Whether to adopt rustfmt properly, as the Biome formatting commit already did
for the frontend, is open.

---

## §5 Workstreams

### The test count needs its invocation

§5 and §6 quote **447** Rust tests without saying which command produces it.
It is `cargo test --features devtools`. Plain `cargo test` was 407 at the same
commit, because the dev portal's own tests only compile under the feature.

Both numbers have since moved, and will keep moving. The durable correction is
not the figure: it is that a test count in this project is meaningless without
the feature set beside it, because CI runs the suite twice.

### `windows-verification.md` §5.0 was already taken

§5.0 in the code repository's `docs/windows-verification.md` is "Launch
modes", which predates WS0. WS0's rows went in as **§5.2** rather than as a
second §5.0.

This is the worked example for the append-only rule that the code
repository's `CLAUDE.md` states: section numbers are cited from source
comments, so a new section takes the next free number rather than the one that
reads best.

---

## Appendix D — file map

### Seven v1 modules have no row

`audio_tracks.rs`, `ddragon.rs`, `fixtures.rs`, `notify.rs`, `probe.rs`,
`recorder/audio.rs` and `recorder/libobs/window.rs` appear nowhere in the file
map. None of them is ambiguous: §3.1's ownership table puts every one on the
daemon side, and they were copied across unchanged.

The code repository's `docs/provenance.md` carries the full table, with each
module's line count and the sentence in §3.1 that places it. The gap is
recorded rather than filled, because filling it would mean editing a frozen
document.

---

## Elsewhere

### Vitest 5 requires Node 22

Vitest 5's `engines` is `^22.12.0 || ^24.0.0 || >=26.0.0`. The plan was written
against Node 20, which left maintenance in April 2026. CI runs Node 22, and a
Node 20 machine cannot run the frontend test gate at all.

### WS1.7's blocker was wrong, and is paid

> **Superseding an entry.** The finding below read "the fork has no tags, so
> WS1.7's tag pin is impossible today". That was checked again during WS1.7
> and was not true.

The fork carried five tags. All five were inherited upstream libobs version
tags pointing at unrelated commits, and none covered the
`multi-track-audio` branch the build uses, which is how they came to be read
as "no tags". The fix was therefore one tag rather than a tagging scheme:
`v2.0.0`, annotated, on the revision `Cargo.lock` already held rather than on
the branch head, so the pin change is a no-op for the build.

`[bans] wildcards` sat at `warn` only because a git dependency without a
`version` key is a wildcard to cargo-deny. With `tag = "v2.0.0"` and
`version = "2.0.0"` together, it is `deny`. Both halves of §8's definition of
done for that item are met.
