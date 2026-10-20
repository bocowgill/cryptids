# Complete blank binary compilation

The published construction is `Chess.Compilation.Image.machine`, an ordinary
`Machine 392046832 2`. Its initial state is zero and its tape is entirely zero.
`Image.halts_iff` proves, without assuming either player's result,

```lean
Halts Image.machine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The final theorem exposed to the comparator is
`ConjectureMachines.Semantics.Chess.halts_chess_baseline_iff_not_draw`.
The proof concerns the frozen `chess-reference-v1`. It does not determine whether
that initial position is drawn. Full file verification is a separate acceptance
boundary, recorded in [the results](RESULTS.md) when complete.

## Proof links

1. `Source.program_initial_dom` connects the concrete arithmetic, list, geometric,
   legal-move, update, history, draw-claim and evaluation procedures to the M4
   strategic proposition. Every callee is instantiated. `WithoutDead` proves
   that internally deferring dead-position adjudication preserves the complete
   value; it introduces no approximation or fuel-exhaustion draw.
2. `SourceCertificate.program_decode` identifies the complete source syntax with
   5,952 literal shared DAG rows. Kernel-checked congruence and row certificates
   cover the entire program. The certificate generator is outside the theorem's
   mathematical dependencies.
3. `Tape.halts_iff` applies the four-stack interpreter to this exact DAG and packed
   initial game. `Tape.argument_eq` connects the literal game to the unchanged
   initial position and its complete history encoding. Program and game data are
   input to the fixed interpreter, and are subsequently written by the machine.
4. `RuntimeCertificate.rows` identifies every numeric interpreter row;
   `RuntimeCertificate.eval_dom` preserves both halting directions.
   `SharedCertificate.rows` identifies all 4,042 normalized primitive rows, and
   `runtime_eval_dom` connects them to the full shared tape.
5. `Templates.rows`, its write/read/move partition and the continuation inverses
   fix every primitive site. `runtime_eval_dom` preserves execution through the
   exact 11-bit block codec. The row theorems also cover invalid codewords.
   Executable data are separate from erased validity and refinement proofs.
6. `TemplateGraph.machine_eq` identifies the arithmetic getter graph with every
   numeric template. `LazyGraph.machine_eq` and `step_decode` identify direct
   Post lookup with the graph's finite interpretation, including missing
   transitions and halted stores. `TemplateGraph.halts_iff` composes the
   two-direction correspondence.
7. `Compilation.Binary.compile_halts_input` replaces Post writes by write/move
   pairs, with a main state and preserving return state for every Post control.
8. `Input.bits_size` and `Input.paid_prefix` account for every serialized program
   and game bit. `FlatInit.initialise_run` supplies the exact write-and-return
   execution from blank tape; `initialise_halts` connects it to the body.
   `Image.initialises` specializes this to exactly 3,110,360 actual transitions.
9. The explicit finite-index transport in `Image` preserves every transition,
   configuration step and halting condition. `Image.halts_iff` composes the
   complete chain. `Matrix.row_count`, `column_count` and `identity` identify
   the ordinary complete row-list machine; `Matrix.halts_iff` proves its same
   strategic equivalence.

Every local row theorem quantifies over all states, scanned symbols and stores.
Reachable-state samples are supplementary fixtures. The count is
`388936472 + 3110360 = 392046832`: all reserved cells, store variants, bounce
states and blank initializer controls are charged.

## Literal files and independent target

The finite mathematical machine is fixed by literal primitive fields and
arithmetic templates. Its complete canonical text is retained in 393 ordered
lossless gzip parts, with 392,046,832 rows and two columns. The parts manifest
fixes every row range, length and compressed/raw SHA-256.

`Cryptids.ChessM6Challenge` imports fixed libraries and replays literal declaration
constructor data through kernel checking. It copies the target definitions and
frozen chess proposition, without copying the selected solution proof. Its
explicit reference-only goal is never a premise of that proof. The deep comparator
checks the complete target dependency closure's types, values and inductive/
recursor fields in separate environments. The source proof and independently
compiled runtime aliases receive separate standard-axiom audits. Actual semantic
mutation controls verify that changed propositions, valid transitions, frozen
initial clocks and reference bridges are rejected.

The source exporter queries `Image.machine`. A separately built exporter queries
only the standalone target. The full byte sweep compares every retained row
against the latter, validates all destination bounds and hashes, and, on the
recorded Python/zlib runtime, reproduces every compressed part exactly. Raw row
bytes remain the portable identity across codec versions.

Native compilation, printing, filesystem I/O, gzip and SHA-256 are external
verification tools. Lean proves the fixed mathematical transition function's
behavior and complete row-list identity; the exhaustive independent byte check
connects the saved payload to that function. No Lean theorem about native file
I/O is claimed.

## Earlier construction experiment

`Chess.Compilation.Binary.generated_halts` proves the same strategic equivalence
for a separate hash-numbered construction using `TM2Number` and `StrongAssembly`.
Its complete-label packaging exceeded the measured construction limits. It is
retained as proof and engineering evidence, and supplies neither the published
state count nor its byte-identity check. The arithmetic `Image` route above is the
baseline artifact.
