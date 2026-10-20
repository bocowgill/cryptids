# Complete blank binary compilation

`Cryptids/Chess/Compilation/Binary.lean` now establishes the unconditional theorem
`Chess.Compilation.Binary.generated_halts`:

```lean
generated.Halts ↔ ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)
```

This theorem concerns the actual finite generated binary machine, started in state zero
on an all-blank tape. It does not determine the initial chess value. Publication of a literal
matrix with a measured numerical state count and its own certificate remains unfinished.

The proof follows these checked links:

1. `Source.program_initial_dom` connects all concrete rule procedures and the fuel-free
   continuation evaluator to the frozen M4 strategic proposition. No callee remains abstract.
2. `SourceCertificate.program_decode` identifies the 5,952 explicit literal DAG rows with
   precisely that complete source syntax. Its two proof families certify shared syntax and
   each row's children and constructor. The elaborator produces ordinary kernel-checked
   theorems; it supplies no mathematical axiom or runtime primitive.
3. `Tape.halts_iff` applies the fixed four-stack interpreter proof to the literal DAG and
   the literal packed initial game. `Tape.argument_eq` checks the latter against the frozen
   initial position's complete history encoding. The whole program and initial data are input.
4. `TM2Number.cachedNumberProgram_dom_of_support` converts the interpreter's supported
   macro labels to finite numeric control and captures all store-dependent jump values.
5. `StrongAssembly.twiceStack_halts` lowers those stacks to a shared tape, normalizes
   control, encodes the finite alphabet into binary blocks, numbers binary control, and
   lowers to a finite binary Post machine. Both simulation directions are retained.
6. `Compilation.Binary.compile_halts_input` changes Post writes to write/move pairs,
   with one main state and one return state per Post state.
7. `FlatInit.initialise_halts` connects the body on its complete binary input to the
   closed machine on blank tape. `generated_initializes` gives its exact prefix execution:
   write every input bit, return the head, and enter body state zero after twice the
   number of input bits in actual steps.

`generated_states` proves the exact accounting formula
`2 * (post.extraStates + 1) + 2 * bits.size`. No input bit, return state, or source table is
supplied by an external oracle. Hashes affect construction/numbering, while all collisions
are resolved with full decidable equality; the correctness theorem is valid for the supplied
hasher without assumptions about its collision rate.

The separate literal-matrix task must establish stopping as well as successor preservation.
A finite local-row certificate and an initial-state decoder can prove both halting directions
without recomputing a native hash table in the kernel. Until that table and certificate exist,
this generated-machine theorem does not close all M6 acceptance criteria.
