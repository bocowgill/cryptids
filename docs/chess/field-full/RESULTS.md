# Complete field-aware chess machine

The complete construction has **45,065,962 states**, saving **345,425,680 states**
against the frozen 390,491,642-state machine. This is a replacement for the whole
chess machine, including the actual paid blank-tape input.

**Accepted:** the complete same-source remote suite, independent advisory review,
sealed evidence checker and parent replays passed.

The named machine is `ConjectureMachines.Machines.chess_field_aware`, of type
`Machine 45065962 2`. Its checked theorem is
`ConjectureMachines.Semantics.ChessFieldAware.halts_iff_not_draw`:

```lean
Halts ConjectureMachines.Machines.chess_field_aware ↔
  ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

Thus it halts exactly when the initial position is not drawn under the frozen
specification. This construction does not determine that position's value.

## Complete accounting

| Allocation | States |
|---|---:|
| Binary main controls, including all store dispatch and padding | 20,695,041 |
| Binary write-return controls | 20,695,041 |
| Body subtotal | 41,390,082 |
| Actual-input write controls | 1,837,940 |
| Head-restoration controls | 1,837,940 |
| Paid initializer subtotal | 3,675,880 |
| **Complete machine** | **45,065,962** |

Every one of the 4,042 source labels receives 1,024 graph slots. Every slot,
including unused halt padding, pays all five store controls. One additional
shared halt control gives 20,695,041 Post controls. The binary compiler pays a
main and a return control for each of them. The actual input contains 141,380
source cells, encoded as 1,837,940 bits, with two initializer controls per bit.
No continuation, dispatch, return, exit, input or padding state is free.

The theorem `Chess.Optimisation.FieldAware.generated_states` proves the total;
`strict_reduction` and `saved_states` compare it with the frozen complete machine.
The independent remote Python allocation derives the complete count from the
exported finite syntax and actual input, rather than subtracting pilot savings.
The saved allocation includes 106,668 meaningful graph nodes and 4,032,340 unused
padding nodes. Every padding control remains charged in the accepted total.

## Certification

`Snapshot.source_program` identifies all source labels with the actual frozen
`SharedModel.machine`. `lower_refines` preserves the exact complete tape, store
and next control for every supported operation. `respects` proves positive
progress and exact stopping; `halts_input` proves both halting directions from
the actual finite input representation.

`Graph.machine_eq` connects the numeric graph to every syntax row, including all
padding. `Numeric.binaryRows_eq` and `Numeric.paidRows_eq` certify independent
arithmetic recipes for binary main/return rows and the complete paid prefix.
`FieldAware.rowMachine_eq` proves universal equality with the named construction.
The independent Post recipe in Python is additional finite evidence; the Lean
binary-row recipe reuses the verified `CompactPost` stage.

`FieldAware.initialises` proves all 3,675,880 transitions from blank tape to the
complete encoded input with the head restored. The final halting theorem composes
these results with the frozen runtime and chess source certificates. It assumes
no chess value, reachability certificate or external solver result.

The native getter uses `Syntax.fastNodeAt`. Its universally proved equality
`fastNodeAt_eq` and compiler equation `nodeAt_csimp` replace the toolchain's eager
`Fin.lastCases` recursion with direct indexed lookup. Both equalities are explicit
trust-audit roots. This changes execution cost without changing any transition
or allocating another state.

## Evidence

Computation source: `270d3e6aeb7258e1c9871077cf3e8e4f7d9fc53d`.
The final combined run is [39722113405](https://github.com/bocowgill/cryptids/actions/runs/39722113405).
It completed successfully. Its official APIs, artifact, logs, unpacked files and
command receipts are retained in `evidence/current/`.

The run passed strict kernel builds, all eight phase receipts, the foundation
audit, three forbidden-dependency audit controls and six deliberately false Lean
contracts. The audit permits only `propext`, `Classical.choice` and `Quot.sound`;
the open chess conjecture and proof generators are forbidden dependencies.

Independent fixtures covered every source label, all five stores, both marker
values and all five active field values: 202,100 source cases with complete sparse
tape equality. They checked 202,126 actual native state/bit samples, including
190,920 unique pairs and both symbols at the shared halt and its return control.
Both implementations replayed the whole initializer and compared the complete
paid input. Five corrupted payloads were rejected: dispatch, store, movement/frame,
initializer and accounting. The movement/frame mutation specifically failed head
restoration; its rejection is not claimed as a tape-corruption-specific control.
Finite fixtures supplement the universal kernel theorems.

Existing regressions passed: M2 rule fixtures (164 assertions), M3 (55), M4 (21),
M5 (16), shared M6 assertions and three paired executions, M7 quotient corners,
and terminal binary fixtures. This reruns M2's rule suite; the older complete
perft evidence remains frozen rather than being claimed as a fresh rerun.

The successful [bounded profile](https://github.com/bocowgill/cryptids/actions/runs/39721302791)
checked the faster getter and exported the actual complete machine samples and
entire initializer in 3.501 seconds. Development failures and component successes
are retained with their actual official dispositions in `evidence/history/`.
Earlier complete kernel successes did not substitute for final native acceptance.

The sealed review in `evidence/review/` binds all eight successful phases, 48
artifact entries, 31 unique command receipts, 19 computation-source files, 570
frozen pins and 29 retained development runs with their actual dispositions.
The review is a model advisory; Lean's kernel checks the proofs. It is not human
approval or formal verification performed by the reviewer.

Root independently passed the sealed checker, all six deliberate evidence
corruptions, a copied-folder replay and the prior accepted review checker.
The parent receipts are `evidence/root-phase-replay.json` and
`evidence/root-review-replay.json`. Local-safe replay:

```sh
python3 scripts/chess_field_full/verify.py --metadata
python3 docs/chess/field-full/evidence/review/check_saved_evidence.py
```

The complete machine is specified by executable numeric row constructors and
their universal equality theorem. The native packet retains the actual finite
syntax, inputs and samples; it does not materialize all state/symbol rows.
No claim of state minimality is made.

All 21 campaign acceptance gates are met; none are unmet or abandoned. A later
campaign can target the fully paid padding, then the input initializer, while
preserving this complete machine as its regression baseline.

All proof checking, native compilation/execution, simulation and counting ran
remotely. Local work was limited to source/document edits and saved metadata/hash
inspection. The frozen specification, prior machines/evidence, `ROADMAP.md` and
toolchain remain fixed under `baseline-pins.json`. Outreach remains on hold.
