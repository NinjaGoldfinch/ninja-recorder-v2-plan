# v1 baseline

The figures v2 is measured against. Taken per the method in
[`README.md`](README.md). Filled in by [WS0](../workstreams/ws0.md) task 0.2.

| Build | Install size | Private Bytes (idle) | Working Set (idle) | Private Bytes (client open) | Two-process total | Date | Machine |
|---|---|---|---|---|---|---|---|
| v1 0.8.0 | | | | | | | |

## Known figures, not taken by this method

`docs/windows-verification.md` on the code repository already records two numbers
for v1. They are carried here as a sanity check on the row above, not as a
substitute for it.

| Figure | Value | Caveat |
|---|---|---|
| Install size | 248 MB | Recorded in `windows-verification.md` |
| Idle RAM | 9 MB working set | App idle, no League running, **window closed**. Working Set, not Private Bytes, and a single-process v1 app rather than a daemon |

The design document says idle RAM was never measured. It was — but as Working Set
with the window closed, on the one-process v1 architecture. WS0 re-measures as
Private Bytes, daemon-only, and records both.

## Notes

- v1 is one process, so "two-process total" does not apply to the baseline row and
  is recorded as `n/a`. The column exists because v2 is a daemon plus a UI, and the
  comparison WS7 has to make is daemon-only against this row.
- "Client open" means the League client running with the capture backend warm, per
  WS0 task 0.2.
- C3 sets the targets v2 is measured against: install under 200 MB, and the idle-RAM
  figure this table makes falsifiable.
