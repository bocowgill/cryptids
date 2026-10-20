# Finite Boolean syntax graphs and direct numeric Post lowering

`BoolGraph.lean` and `GraphPost.lean` give a generic constructive backend from a
finite first-order Boolean TM1 graph to a numeric Post machine. The proof establishes
exact partial tape-output equality and both termination directions on every input.
It does not instantiate the complete chess program or certify a final binary table.

## Literal graph data

Namespace `ConjectureMachines.Compilation.BoolGraph` provides:

```lean
Table k α := Vector α (2 * k)
Node n k labels
Graph n k labels

decode (g : Graph n k labels) (store : Fin k ≃ σ) (i : Fin n) :
  Turing.TM1.Stmt Bool (Fin labels) σ
machine (g : Graph n k labels) (store : Fin k ≃ σ) :
  Fin labels → Turing.TM1.Stmt Bool (Fin labels) σ
```

`Node` has exactly six constructors: move, write, load, branch, goto and halt. Write
and branch tables contain Boolean cells; load tables contain `Fin k`; goto tables
contain `Fin labels`. Each table has all `2*k` cells, ordered by scanned bit and then
store index. `Table.read` performs direct finite arithmetic indexing.

A graph stores an array-backed node vector and an entry-root vector. Child IDs are
`Fin n`; the erased `below` proof requires every immediate syntax child to have a
strictly smaller numeric ID. Goto destinations select the entry-root vector and may
form arbitrary labeled control cycles. No callback function, hash, support list or
source-label equality occurs in this graph data.

`decode` recurses on the strictly decreasing node ID. The six `decode_move`,
`decode_write`, `decode_load`, `decode_branch`, `decode_goto` and `decode_halt`
equations expose its exact Mathlib constructor behavior. The store equivalence is
supplied only to decode the graph into the chosen source store type; the numeric
backend operates on store indices and does not execute that equivalence. The
initialization theorem requires `store 0 = default`. This covers a five-value store,
for example `finSuccEquiv 4 : Fin 5 ≃ Option (Fin 4)`.

## Exact Post instruction semantics

Namespace `ConjectureMachines.Compilation.GraphPost` provides `trAux`, which recurses
by the same strict topology. Move and write emit one Post command with a child PC.
Load changes the finite store and recurses without emitting a command. Branch selects
a child and recurses without emitting a command. Goto writes the scanned symbol and
enters the selected source root. Halt writes the scanned symbol and enters the
`none` descriptor; the subsequent transition is missing. No fuel or exhaustion case
is present.

`trAux_correct` proves equality to actual `Turing.TM1to0.trAux`, for every graph,
scanned bit, node, finite store and supplied store equivalence. Its proof descends on
the child ID, with both branch cases and load's updated store explicit. Six separate
`trAux_*` constructor equations support local row certificates.

## Numeric states and materialization

```lean
Descriptor n k := Option (Fin n) × Fin k
stateCount n k = 1 + (n + 1) * k
machine g : Turing.TM0.Machine Bool (Fin (stateCount n k))
program g : Vector (Vector
  (Option (Fin (stateCount n k) × Turing.TM0.Stmt Bool)) 2) (stateCount n k)
```

The count pays for one distinguished initial state, every node/store pair, and every
halted/store pair. `stateCount_eq` also expresses it as `1 + k*(n+1)`.
`descriptorEquiv` uses finite product arithmetic; `encode` reserves state zero and
places every successor in the remaining descriptor range. `encode_injective`,
`encode_ne_zero`, `unpack_encode` and `descriptor_encode` prove the packing facts.
State zero denotes `(some (entry 0), 0)`, including the actual initial statement.
It is not a halted descriptor. `machine_zero`, `machine_running` and `machine_halted`
expose all three transition cases.

`program` optionally materializes both Boolean rows for every numeric state into a
vector. `programMachine` reads this data directly. `program_correct` proves equality
to `machine` for all states and bits; `program_size` proves the exact row count.
No source graph decoding, source-label search or support enumeration is used by
numeric construction or execution.

## Full semantic certificate

`rows` establishes `LocalCertificate.PostRows` against actual `TM1to0.tr` for every
numeric state and bit, including missing transitions. `initial` proves numeric zero
decodes to `(some (M default), default)`. `init_decode` preserves ordinary initialization
on the same arbitrary Boolean input tape. `step_decode` preserves the complete tape
and exactly one Post transition. `eval_decode` preserves the complete final Post
configuration under control decoding.

The principal APIs are:

```lean
GraphPost.eval_eq g store zero input :
  TM0.eval (GraphPost.machine g) input = TM1.eval (BoolGraph.machine g store) input

GraphPost.halts_iff g store zero input :
  (TM0.eval (GraphPost.machine g) input).Dom ↔
    (TM1.eval (BoolGraph.machine g store) input).Dom
```

`program_eval_eq` and `program_halts_iff` give the same statements for materialized
rows. The domain proof explicitly uses `LocalCertificate.post_halts_iff` followed by
Mathlib's `TM1to0.tr_eval`. The stronger output equality follows from exact terminal
configuration decoding. None of these proofs assumes label injectivity, source support,
termination, or an abstract source-operation oracle.

## Verification and remaining integration

Strict focused checks, complete dependency audits, live LSP diagnostics and reproducible
fixtures are under `.unlazy/chess-m6/leaf-1.35/`. Fixtures cover all six constructors,
all four cells of a two-store table, both branch choices, changed stores, last-store
boundaries, ordinary state zero, halted successors and a literal output mutation.
They also prove a labeled goto loop diverges for every input and a one-node halt
terminates for every input. The five-store equivalence is checked against exact partial
output equality. Negative controls reject an injected axiom, an unsafe compiler
artifact, the false mutated-row equality, and a cyclic syntax child.

The capped native probe constructs a 10,001-node/five-store graph, materializes all
50,011 numeric states and 100,022 transition cells, scans all cells, and compares five
finite paired source/Post runs. Timings and peak RSS are recorded in `verification.json`;
these observations supplement the generic proof and do not establish full-chess scale.
The native harness uses ordinary imports so Lean's interpreter can load generated
private worker code; this is an execution-harness detail, not a proof assumption.

The complete chess Boolean graph, its exact local decoder certificate to the existing
source machine, the eventual literal Post/binary rows and the paid final binary count
remain integration obligations. No whole-chess graph, final published machine table,
M6 completion or M7 state reduction is claimed here.
