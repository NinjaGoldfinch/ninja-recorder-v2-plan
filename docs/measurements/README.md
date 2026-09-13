# Measurements

The design document set a 100 MB idle-RAM target but no method, which made the
target unfalsifiable. This is the method, from Appendix A of the
[design document](../design/v2-design.md) and the
[WS0 tasks](../workstreams/ws0.md).

Every figure recorded in this directory must have been taken this way, or it is not
comparable with the others.

## Method

**Private Bytes is the headline figure.** Private committed memory excludes shared
pages and is the honest measure of what the process costs the machine.

**Working Set is recorded alongside it**, for comparison with Task Manager — which
is what a user would actually look at. Both numbers go in the table; neither is
reported without the other.

**Measure the daemon alone.** The resting state is the daemon with no UI process and
no recording in progress. That is the state the machine spends almost all its time
in, and it is the state the C3 target is about.

**Record the two-process total separately.** Daemon plus UI with the window open is
a second row, not a substitute for the first.

**Install size** is measured over the installed directory:

```powershell
Get-ChildItem -Recurse | Measure-Object -Property Length -Sum
```

## Practice

- Measure a CI-built installer, installed — not a dev build from the tree.
- Record the machine and the date with every row. Figures from different machines
  are not comparable.
- WS0 task 0.3 scripts this as `scripts/measure.ps1` on the code repository, so WS7
  repeats it identically against the release candidate. Until that script exists,
  record how the number was taken.
- The v1 baseline goes in [`baseline-v1.md`](baseline-v1.md). The v2 figures are
  taken again in [WS7](../workstreams/ws7.md) and recorded against C3 in
  `windows-verification.md` on the code repository.

## Why it matters

C3 is a hard constraint, and [WS7](../workstreams/ws7.md) ships v2.0.0 against it:
install under 200 MB, or the miss documented with the number. A target without a
method cannot be missed, which is the failure this method exists to prevent.
