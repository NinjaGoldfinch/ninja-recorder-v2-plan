# Diagrams

Every diagram in the implementation plan exists twice: as a Mermaid fenced block
inside [`../implementation/v2-implementation-plan.md`](../implementation/v2-implementation-plan.md),
which GitHub renders live, and as a `.mmd` source plus a rendered `.png` here.

The `.mmd` files under `src/` are the source of truth. The PNGs under `png/` are
generated output — re-render them, never hand-edit them.

## Index

| Diagram | Figure in the plan | Subject |
|---|---|---|
| `01-v1-baseline` | Figure 1 | v1 as it is. Orange is what v2 changes; red is what P0 decides |
| `02-v2-target` | Figure 2 | Recommended v2 architecture — one binary, two modes |
| `03-lifecycle` | Figure 3 | A normal session, including the UI attaching mid-recording |
| `11-state` | Figure 4 | The v1 state machine, unchanged, with every transition also an event |
| `04-contract` | Figure 5 | One declaration, both sides generated, CI-checked |
| `05-rpc` | Figure 6 | One session on the wire, with per-request ids |
| `06-db` | Figure 7 | One writer, several readers, WAL in between |
| `07-capture` | Figure 8 | The P0 gate. Blue is the target; green is the fallback |
| `10-frontend` | Figure 9 | The strangler — each view replaced at its root DOM node |
| `08-deps` | Figure 10 | Workstream dependencies |
| `09-gantt` | Figure 11 | Indicative calendar; the critical path runs through WS1 |

Note the numbering: the diagram file names follow the order the diagrams were
authored, not the order the figures appear in the plan. `11-state` is Figure 4
and `10-frontend` is Figure 9.

## Re-rendering

All of them, via the wrapper:

```bash
./scripts/render-diagrams.sh
```

The wrapper runs, for each `docs/diagrams/src/*.mmd`:

```bash
mmdc -i docs/diagrams/src/<name>.mmd -o docs/diagrams/png/<name>.png -b white -w 1200 -s 2
```

`mmdc` is the Mermaid CLI. If it is missing:

```bash
npm install -g @mermaid-js/mermaid-cli
```

Re-render and commit the PNG in the same commit as the `.mmd` change — CI checks
that every `src/*.mmd` has a matching `png/*.png`.
