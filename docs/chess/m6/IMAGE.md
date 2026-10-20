# The fully paid chess image

`Chess.Compilation.Image.machine` is a concrete
`ConjectureMachines.Machine 392046832 2`. Its ordinary start state is zero on an all-blank
tape. `Image.halts_iff` proves, unconditionally,

```lean
ConjectureMachines.Halts Image.machine ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The theorem uses the frozen strategic predicates. It neither assumes the open draw
conjecture nor evaluates the initial game to decide its value.

The executable `data` record contains literal primitive rows from `Templates`, the
11-bit codec, finite alphabet/store equivalences, saved write continuations, and numeric
read/move indexes. `classify` tries `readIndex`, then `moveIndex`, otherwise plain. A
separate proposition `valid` proves the classification using the accepted membership,
inverse and coverage theorems; the remaining plain cases are goto and halt. Neither this
certificate nor `Templates.writeSites` enters construction.

`getter := TemplateGraph.lazyGraph data` retains the nominal getter bundle once.
`post := LazyGraph.machine getter` performs direct first-order lookup. `body` applies
the generic `ConjectureMachines.Compilation.Binary.compile`, and `generated` applies
`FlatInit.initialise Input.bits body`. The old `Chess.Compilation.Binary` module and its
materialized global backend are absent from the imports and executable closure.

The exact paid partition is:

| Allocation | States or nodes |
| --- | ---: |
| Childless normal/writer continuations: `2*4042 + 270` | 8,354 nodes |
| Read payloads: `1734*1250` | 2,167,500 nodes |
| Restoring/movement layers: `11*(1734*1250 + 270 + 1188)` | 23,858,538 nodes |
| Complete read trees: `3*1734*(2^11 - 1)` | 10,648,494 nodes |
| Shared binary writer suffixes: `2*270*(2^12 - 2)` | 2,210,760 nodes |
| Total graph | 38,893,646 nodes |
| Post: `1 + (nodes + 1)*5` | 194,468,236 states |
| Binary main and return blocks: `2*Post` | 388,936,472 states |
| Complete input: 141,380 stack symbols, each encoded in 11 bits | 1,555,180 bits |
| Blank write and head restoration: `2*inputBits` | 3,110,360 states |
| Final image | **392,046,832 states** |

`node_count`, `post_count`, `body_states`, `prefix_states`, and `generated_states`
are kernel-checked equalities. All normal/writer labels, optional-node/store descriptors,
halted stores and binary return controls remain paid, including unreachable controls.

The final numeric transport is `castMachine`: it preserves each write/direction and
casts source and successor finite indices with the proved count equality. This explicit
record avoids reducing a whole-machine equality transport during row projection.
`rows` covers every final transition, including missing transitions; `step_eq` covers
complete configurations. `body_main` and `body_bounce` expose the binary compiler's
exact row equations. Generic `initialise_cast_step`, `initialise_cast_row`,
`initialise_cast_write`, and `initialise_cast_return` expose the initializer's offset and
both prefix ranges without unfolding the concrete input array during elaboration.

`initialises` proves that exactly 3,110,360 ordinary transitions from blank state zero
reach `bodyEntry (Tape.mk₁ Input.bits.toList)`. This configuration has state 3,110,360,
the complete program/game bit stream, and the original head position. `initial_reaches`
gives positive reachability. `Input`'s independently proved serialization/count results
supply the complete initial program and initial game; this is actual paid input writing.

The halting chain is direct Post lookup → generic template machine → accepted Runtime
semantics → frozen chess semantics, combined with binary compilation and blank
initialization. Every equivalence includes both halting directions. Proofs and semantic
records erase from execution. The executable dependency audit is stronger than a
proof-erased check: it conservatively visits declaration types and proof bodies as well.
It excludes semantic certificates, raw SharedModel decoder/entry/stack witnesses,
materialized graph interpretation and the old binary assembly. The pure
`Runtime.trList_append` serialization-count theorem is allowed; it is not an execution
oracle or a Runtime semantic certificate.

Evidence lives in `.unlazy/chess-m6/leaf-1.43/`. The full logical audit covers all module
declarations, private helpers and transitive types/values; the executable audit starts
from the eight construction roots. Both allow only `propext`, `Classical.choice`, and
`Quot.sound`, and reject the open draw axiom. Rejection controls inject a forbidden
axiom, an unsafe compiler helper, a raw witness, WriteSites and Valid, and corrupt the
count, a prefix transition and a write-site index.

The native executable is built ahead of time using the leaf's alternate Lake file.
It checks 2,030 actual fixed-machine boundary/spaced rows against independent partition
arithmetic, plus count and transition mutations. Three small programs run through the
same template graph, Post, binary and paid blank-initialization backends. They execute
both source movement directions and compare complete terminal tapes and numeric states.
The actual initial chess program is never executed. All experiments have 60-second and
8-GiB owned process-tree limits. The initial whole-record-transport failure is retained
with markers and measured bounds, alongside the successful explicit-index replacement.

To re-run the sealed leaf checks from the repository root:

```sh
python3 .unlazy/chess-m6/leaf-1.43/verify.py --recheck
```

The source exporter, full transition-byte artifact and standalone final challenge are
separate root integration deliverables.
