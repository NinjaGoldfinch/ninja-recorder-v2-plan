# 0001 — Option B is the target capture backend

- **Status:** Accepted
- **Date:** 2026-09-13
- **Source:** [implementation plan](../implementation/v2-implementation-plan.md) §1, §4.5

## Context

GPL-2.0 is inherited from libobs and from nothing else. The maintainer intends to
leave it so that a closed-source or source-available distribution stays possible.

Every libobs configuration keeps the shipped binary GPL, whatever process libobs
lives in. The design document's arms-length argument — that confining libobs to a
worker might avoid the inherited licence — is contested and is not relied on. The
maintainer's own code can be relicensed at any time; the constraint is that a
libobs-linked build cannot be *distributed* under anything but GPL-2.0. The design document left the backend as three candidates; it is closed here.

## Decision

**Option B — WGC → D3D11 → Media Foundation — is the target, not a candidate.**

Trimmed libobs (A-trim) is retained only as the fallback if the P0c spike fails its
gates, and as a selectable second backend for exactly one release while Option B
proves itself on real hardware. Option C, the branch-pinned fork, is not carried into
v2 at all.

P0c is the gate, run in [WS1](../workstreams/ws1.md). Both stages must pass: isolated
per-app game audio via process loopback, then under one frame of drift over ten
minutes with a kill-safe file and encoder detection on two GPU vendors.

## Consequences

- The sequence is fixed: build, ship alongside libobs, delete, relicense —
  [ADR 0002](0002-two-release-relicensing-sequence.md).
- If stage 1 fails, per-app game audio needs libobs. Q1a settles that trade-off
  *before* the spike runs.
- Stage 2 failing on encoder quality only → the B2 variant (NVENC/AMF/oneVPL).
  Failing on drift or crash-safety → trimmed libobs is v2.0's only backend, GPL stays.
- `capture_backend = own | libobs`, default `own`. The trait contract is unchanged,
  so nothing above `Recorder` knows which backend wrote a file.
