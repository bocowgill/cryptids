# Independent review of the fixed mathematical Image candidate

Reviewed candidate: `Cryptids/Chess/Compilation/Image.lean`, SHA-256
`78dc9a503d77dfa7049f467bf331760e76ac8bf6da5416ad9426083b0f15a960`.
The complete 98-file review pin set is `.unlazy/chess-m6/leaf-1.45/source-pins.json`.
No mathematical correctness defect or additional proof obligation was found in this
candidate. This review does **not** approve M6 completion, published transition bytes,
or the actual standalone challenge. Those identities still require their own evidence.

## Semantic trace

- `Source.program_initial_dom` (Source.lean:89) states exactly source termination iff
  `¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`, without a chess-value premise.
  `Source.procedures_correct`, `evaluator_eval`, and `program_eval` instantiate concrete
  legal-move, update, check, history and evaluator Code procedures. The frozen predicates
  are Spec.lean:624 and :630; `Evaluation.solve_initial_draw_iff` is the unchanged
  strategic bridge. `WithoutDead.evaluate_correct` proves the value-preserving internal
  deferral of dead-position termination on every raw game; it is not an assumed omitted
  rule. History remains encoded and updated. No initial game value is computed here.
- `SourceCertificate.program_decode` (:250) is exact equality of the literal 5,952-row
  DAG decode with `Source.program`, rather than a hash claim. `dag_valid` (:255)
  certifies child ordering. `Tape.argument_eq` identifies the literal initial game,
  and `Tape.halts_iff` combines that data equality with `RuntimeProof.tm2_halts`.
- `RuntimeCertificate.rows`, `step_decode`, and `eval_dom` (:1811) identify the
  345-control literal Runtime in both stopping directions, with default source control
  explicitly `.start`. `SharedCertificate.rows`, `initial`, `eval_dom`, and
  `runtime_eval_dom` (:52590) certify all 4,042 normalized controls and initial control
  zero. Stores and full tapes are preserved by configuration decoding.
- `Templates.primitiveMachine_eq` (:2575) identifies every actual primitive row.
  `writeSites`, read/move membership, inverse and coverage proofs, `onePrimitive`,
  `allHeadFree`, and `machine_template` apply to these rows, not an abstract substitute.
  `Templates.runtime_eval_dom` (:12743) handles arbitrary Runtime stack input.
- `Image.classified` and `valid` discharge the actual 270-write/1,734-read/1,188-move
  inventory. `TemplateGraph.machine_eq` (:1060) covers every normal and writer control;
  complete read trees use the same decoder for all 2,048 bit words. The 1,250-symbol,
  five-store codec intentionally maps unused binary words arithmetically: word 1250
  has decoded rank 625 and word 2047 has rank 797. Invalid words are neither silently
  rejected nor replaced by blank. `Raw` child ordering prevents infinite internal
  load/branch descent. `LazyGraph.machine_eq` identifies the direct getter program
  with GraphPost; `TemplateGraph.eval_eq` and `halts_iff` include both stopping directions.
- `Image.post_runtime_dom`, `input_eq`, and `post_halts_input` use the actual complete
  serialized input. `Binary.compile_halts_input` preserves its tape geometry and both
  halting directions. `body_main` covers missing source transitions; `body_bounce`
  proves every reserved bounce state has an ordinary preserving left transition.
- `FlatInit.initialise_halts` (:220) is an equivalence, including empty input.
  `Image.initialises` (:336) proves exactly 3,110,360 actual transitions from ordinary
  state zero and an all-blank tape to body state 3,110,360 with the complete input under
  the original head. The prewritten tape is a reached configuration, not an initial
  assumption. `cast_transition`, `cast_step`, `cast_init`, and `cast_halts` preserve
  state values, tape, missing transitions and both stopping directions. Finally
  `Image.halts_iff` (:233) has the exact frozen proposition and no hypotheses.

## Complete accounting and computational boundary

Independent arithmetic from the actual Data dimensions gives graph allocations
8,354 + 2,167,500 + 23,858,538 + 10,648,494 + 2,210,760 = **38,893,646** nodes.
Post has `1 + (nodes + 1)*5` = **194,468,236** states, including distinguished zero
and all halted-store descriptors. Binary doubles this to **388,936,472** controls.
The input has **1,555,180** bits and costs **3,110,360** prefix controls, giving
**392,046,832** total states. Unreachable normal slots, writer controls, halted
stores and return controls remain paid. No off-by-one exclusion was found.

The constructor uses literal primitive rows, finite index tables, arithmetic codecs
and nominal getter layers. Semantic `Valid`/`WriteSites` certificates and raw witness
pairs are separate proof inputs. An independent conservative traversal of types and
values reaches 13,576 declarations from `Image.machine` and rejects the listed
semantic/materialized construction dependencies. The separate traversal from
`Image.halts_iff` reaches 48,581 declarations. Both admit only `propext`,
`Classical.choice`, and `Quot.sound`; neither uses the open chess conjecture.

## Reproducible authored checks and limitations

Run from the repository root:

```sh
python3 .unlazy/chess-m6/leaf-1.45/verify.py
```

All seven checks passed, with 60-second and sampled 8-GiB owned-process-tree limits.
The positive kernel fixture checks valid/unused codec corners, instantiates actual
`Image.halts_iff`, `rows`, and `initialises` with the actual input kept abstract, and
checks a tiny Binary/FlatInit/cast composition: both return symbols, both bounce
symbols, a write, exact initial head restoration, surrounding observed cells, proven
unbounded divergence, proven stopping, and empty input. Four rejection checks detect
an injected runtime proof record, a new axiom, wrongly treating unused code as blank,
and a return transition that erases a scanned one. Evidence records argv, exits,
output fingerprints, bounds and source hashes. All 42 frozen M1/M5 input pins agree.

An exploratory attempt to elaborate a concrete actual-last-prefix observation hit
Lean's interpreter allocation limit. Its failure is retained in `fixture-initial.json`
and `MEMORY-LIMIT.md`; it is not counted as a successful actual-row experiment.
The final fixtures use universal actual-machine theorems and finite arrays. The
independently owned native actual-row checks remain a distinct supplementary test.
No actual initial chess evaluator execution or aggregate build was performed here.

Four passes completed: complete semantic trace; expert reread of source/normalization
and decoder scope; adversarial accounting/stopping/initialization and rejection tests;
then evidence, frozen-input and source-pin reread. The final improvement pass found
no further mathematical change needed.

Publication remains pending: retain the complete canonical expanded literal table
(possibly ordered lossless compressed parts), certify the mathematical row identity,
compare every expanded native byte/row, and verify reproducibility. The actual
`Cryptids.ChessM6Challenge` standalone snapshot and exact transitive ConstantInfo
comparison also remain pending. A descriptor hash, a successful source exporter,
or kernel acceptance of this candidate alone establishes none of those artifact or
intended-target identities. The earlier EXPORT-REVIEW boundary continues to apply.
