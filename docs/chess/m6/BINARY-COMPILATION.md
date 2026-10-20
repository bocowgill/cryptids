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

The exact input bridge is now proved too: `Input.bits_size = 1555180`,
`Binary.initializer_states = 3110360`, and `generated_states_paid` accounts for all
those states. The independent literal-control certificates are `RuntimeCertificate.rows`
and `SharedCertificate.rows`; their local decoded-step equations preserve stopping and
continue through ordinary initialization. `BinaryTemplates.rows_refine` handles every
normal and site/glyph binary macro without a hash-order computation in the kernel.
These are separately checked prerequisites for the eventual published arithmetic table.

## Arithmetic publication route

The publication route uses literal numeric rows and arithmetic template families. Its
independently checked prerequisites replace hash-order packaging; the original generated
machine above remains a separate construction. The final `Image` integration and full-table
publication checks are tracked in `PROGRESS.md` until the executable verifier passes.

The proof chain after `Tape.halts_iff` is:

1. `RuntimeCertificate.rows` identifies every literal numeric interpreter row with the
   fixed Runtime instruction. `RuntimeCertificate.eval_dom` preserves both domain directions.
2. `SharedCertificate.rows` identifies all 4,042 normalized source rows. Its
   `runtime_eval_dom` covers all stack inputs with the complete initial shared tape.
3. `Templates.write_row`, its inverses/coverage certificates, and the read/move partition
   fix every primitive site. The literal primitive row tree carries no raw decoder witnesses.
4. `Templates.rows` and `runtime_eval_dom` lower every normal/write-site/symbol control
   through the exact 11-bit block codec. Invalid 11-bit codewords are covered too.
5. `TemplateGraph.machine_eq` identifies the finite getter graph's decoded statement at
   every label with the exact numeric binary template. `Valid` and all semantic certificates
   are erased proof arguments, separate from the graph's literal computational fields.
6. `LazyGraph.machine_eq` and `step_decode` identify direct numeric Post lookup with that
   graph's full finite interpretation. Missing transitions and all halted stores are retained.
   `TemplateGraph.halts_iff` composes the complete partial-output correspondence.
7. `Compilation.Binary.compile_halts_input` gives one main and one return state per Post
   control and preserves both stopping directions on the full binary input.
8. `Input.bits_size` and `Input.paid_prefix` account for every serialized program and game
   bit. `FlatInit.initialise_run` proves the exact write-and-return path from blank tape;
   `initialise_halts` composes that real path with the body on its encoded input.
9. The final state-count transport preserves numeric row destinations, every tape cell,
   configuration steps and blank halting. It changes no transition or initialization convention.

The mathematical row theorems cover every finite state, scanned symbol and local store;
reachable-state sampling is not their proof. Bounded execution fixtures supplement these
proofs and never establish nonhalting or the initial position's value.

The artifact boundary is separate. The finite machine is fixed by literal numeric primitive
fields and arithmetic template descriptors in Lean. The complete expanded canonical text is
retained as ordered lossless gzip parts. The byte checker must decompress every part and
compare every row against an independently compiled standalone snapshot. Native export,
filesystem I/O, gzip and SHA256 are not being proved correct inside Lean. The theorem proves
the fixed mathematical machine's behavior; complete byte comparison binds the saved payload
to that machine under the ordinary Lean native execution and artifact-checker boundary.
