# Exact removal of graph padding

This describes the candidate construction. Complete remote acceptance is recorded
separately in RESULTS.md when all proof, native and evidence gates have passed.

The target remains

```lean
Halts ConjectureMachines.Machines.chess_field_packed ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The source rows, source input, thirteen-bit cell codec, CompactPost quotient,
binary compiler and paid initializer are the previously accepted definitions.
Every previous tracked file is fixed by the 2,393-file baseline manifest.

## What is removed

The previous graph reserves 1,024 slots for each of 4,042 source labels. Its
actual local syntax uses fewer slots. The new allocation contains every actual
local syntax node, with its original source label and postorder local index,
and contains no padding alternative.

For the fixed vector of source syntax rows, define

```lean
Slot rows := Σ q : Fin labels, Fin (rows.get q).size
```

`FieldPacking.Layout` contains a computable equivalence `Slot rows ≃ Fin total`
and strict order preservation within each row. The equivalence supplies both
coverage directions: no actual node is omitted, and every allocated numeric
node decodes to an actual local node. Injectivity prevents collisions.

`FieldPackedLayout.Block.ofTree` folds the original balanced source tree. Each
leaf allocates exactly its syntax size. Appending blocks uses disjoint finite
sums for rows and nodes. The total is therefore the sum of all leaf weights;
the kernel count theorem reduces that complete frozen syntax. Both executable
lookup directions follow cached balanced subtree totals.

`code_val` identifies each allocated address with its source-order prefix sum
plus local index. `weights_get`, `prefix_succ` and `prefix_end` connect the balanced
implementation to ordinary prefix arithmetic. These equations let a separate
Python recipe reconstruct every numeric address directly from exported syntax.

## Why the complete meaning is preserved

`FieldPacking.graphNode` decodes a numeric node through the inverse equivalence
and reads the original local syntax node. Only its child addresses are renamed,
through the forward equivalence. Source-label goto tables keep their labels.
Entries encode the original row roots through the same map.

Local postorder descent and the layout's order property prove global child
descent. `graphNode_meaning` proves the one-constructor interpretation equation;
`decode_node` proves the full subtree interpretation by well-founded induction.
`machine_eq` identifies every complete row with its original syntax meaning.
These statements quantify over every allocated node and source row, with no
reachable-position assumption or bounded-test premise.

`FieldPacked.post_halts_input` composes that universal source identity with the
frozen CompactPost, field compiler, literal source snapshot, actual shared
runtime and chess tape equivalences. The binary input theorem and paid initializer
then yield the blank-tape theorem. `equivalent` connects this complete machine's
halting directly with the accepted 45,065,962-state machine's halting.

`rowMachine_eq` separately connects arithmetic main/bounce and paid-prefix rows
to the actual machine, universally including missing transitions. The independent
Python recipe is additional finite implementation evidence, not the universal
halting proof.

## Accounting to be certified

| Allocation | Candidate controls |
|---|---:|
| Actual syntax nodes, before store expansion | 106,668 |
| Every node at all five stores | 533,340 |
| Shared halt control | 1 |
| Complete Post controls | 533,341 |
| Binary main controls | 533,341 |
| Binary return controls | 533,341 |
| Complete binary body | 1,066,682 |
| Initializer write controls | 1,837,940 |
| Initializer head-restoration controls | 1,837,940 |
| Complete paid initializer | 3,675,880 |
| Complete binary blank-tape machine | 4,742,562 |

Dispatch is implemented by the retained syntax nodes and their tables. Every
store control and binary return control is charged above. The shared halt and
its binary return control are retained, including their actual transitions.
The initializer contains the same literal input as the accepted machine and
pays both controls per bit. There is no free preloaded tape or external input.

The proposed saving is 4,032,340 padding nodes times five stores times two binary
controls: 40,323,400 states. Full acceptance requires both the Lean count theorem
and the separate remote allocation derivation from every actual exported row.

## Evidence boundary

The remote exporter enumerates all actual body states with both symbols and
compares every row with the arithmetic Lean row machine before emission. Python
checks the complete ordered stream against its independent recipe, validates
all actual getter nodes and source entries, re-encodes every source cell, and
replays the full paid initializer. The source-operation fixtures compare the
complete sparse tape, head, store and continuation for every tested case.

Deliberate corruptions must fail the same positive oracle. Strict Lean builds,
the safe dependency-closure audit, false kernel contracts and the accepted chess
regressions remain required. Official artifacts bind exact source and frozen
file hashes, commands, exits, output hashes and full transition-stream coverage.
Local evidence inspection uses metadata and hashes only. All proof checking,
native compilation, execution, simulation and machine counting run remotely.
