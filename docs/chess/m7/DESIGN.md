# M7: quotient duplicate Post controls

Status: first reduction accepted. The frozen M6 baseline remains fixed.
The certified reduction is 392,046,832 to 392,046,822 states under the same
two-symbol, state-0 blank-tape convention. Completed kernel, independent target,
every-row table, regression and review evidence is in [RESULTS.md](RESULTS.md).

## Construction and proof obligation

M6 pays for a distinguished initial Post control and every pair of an optional
graph node and one of five stores: `1 + (n + 1) * k`. The initial control has the
same behavior as the existing live root/default-store pair. Every halted
`(none, store)` control has a missing transition, irrespective of the store.

`CompactPost` retains every live `(node, store)` pair and one halt control:
`1 + n * k`. An explicit permutation exchanges the live root/default-store
index with 0. Its configuration map preserves the entire tape. The central
proof states that every old step, including exact stopping, commutes with the
map. `StateTransition.Respects` then gives both halting directions for every
finite input, without a reachable-state oracle or an assumed chess value.

For `n = 38,893,646` and `k = 5`, the checked accounting is:

| Component | Frozen M6 | M7 candidate |
|---|---:|---:|
| Post controls | 194,468,236 | 194,468,231 |
| Binary main and return controls | 388,936,472 | 388,936,462 |
| Program and initial-game bits | 1,555,180 | 1,555,180 |
| Paid blank initializer states and exact startup steps | 3,110,360 | 3,110,360 |
| **Total binary states** | **392,046,832** | **392,046,822** |

The ten-state reduction is four duplicate halted-store controls plus the
initial duplicate, in both binary blocks. All other controls, including
unreachable/reserved controls and return states, remain paid. This is an initial
strict improvement, with no claim of minimality or practical chess solving.

`Chess.Optimisation.M7` composes the quotient with the unchanged binary compiler
and unchanged entire input/initializer. Its target is the same unconditional
frozen non-draw proposition. `M7Table` ties the strict inequality to actual
constructed state counts and identifies all rows and both columns of the ordinary
finite mathematical table. The baseline theorem, source and literal payload are
retained independently; no M6 source is edited.

## Exact candidate table encoding

The candidate table is encoded by the retained complete M6 literal payload plus
a fixed small quotient map. Once the initial node index is fixed, extraction
needs only decompression, row selection and numeric destination reindexing. It
requires neither a chess solver nor a Lean/compiler installation. This avoids
storing a second near-identical large payload while specifying every new row.

For each new numeric control, a canonical section chooses an old row. It retains
the original tape symbol, movement direction and missing-transition cells, and
maps every successor through the numeric quotient. The initializer interval is
unchanged. Both binary blocks are compacted with the same Post map. Duplicate
old rows are identified; ordinary candidate state 0 is still the first paid
initializer state. The canonical body-state representative of its live root is
the old encoded root, rather than the old distinguished initial control.

The complete remote extraction validated the retained compressed/raw parts, then
compared **every candidate row byte** against an independently reconstructed
standalone Lean target. The raw stream hash, exact map, all 393 ordered ranges,
producer journals and current computation pins are retained with the results.
Hashes, bounded fixtures and symbolic table proofs alone cannot close that file
identity gate. Lean proves mathematical machine semantics; native printing,
filesystem I/O, hashing and gzip remain the explicit external verification boundary.

## Remote verification and review

All Lean/native builds, complete table work and regressions run on fork Linux
Actions. Local work is limited to edits, reads, small metadata checks and the
independent review's bounded arithmetic tests. No local Lean/LSP server is started.

The workflow has two explicit modes. Without a committed fixed target, it checks
proofs and proposes snapshot/map artifacts; success in that mode does **not**
complete M7. Final acceptance composes the completed proof, independent
definition/mutation/sandbox and full-row component reports with an unchanged
successful regression wrapper under exactly the same 192 current input hashes.
The separate setup helper is independently pinned. The original whole core run
failed later during regression setup; this is preserved, never relabeled green.
The final review matches all reports to current pins and authenticated CI artifacts.

M7 is authorized; outreach remains on hold. Chess's initial value is not computed.
