# Complete selective-return chess integration
OWNS: Cryptids/Chess/Optimisation/FieldSelectiveLayout.lean, Cryptids/Chess/Optimisation/FieldSelective.lean, Cryptids/Semantics/ChessFieldSelective.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.4.md

Scope: Draft against parent-approved source APIs; final integration depends on all component strict builds. Balanced 8092 local return slots,40461 globalreturns,573802body,2411743full. Frozen source and prefix unchanged.

- [x] G1: Full executable construction and both halting directions, exact paid tape entry and independent row image, no placeholders.
  EVIDENCE: Parent source review of final layout, wrappers and all component APIs passed; full native extraction/independent rows and foundation audit passed at exact final sources. Whole dependent slots, protected layout transparency and fixed machine dimensions resolved the recorded elaboration errors without changing statements.
- [x] G2: Strict remote full machine Lean build passes, all component gates required.
  EVIDENCE: Run39780889172 iteration4 at2dfa3a7656de3f15a0bbda387d6f0642328e6d08, strict full build command1792673868492975522 exit0 with Build completed successfully. All component modules and public ChessFieldSelective theorem pass; audit9259roots58974dependencies and all20commands pass. Parent matched all16 new source hashes and2638 baseline hashes. Final fresh review/seal are separate gates.

Source pass1: instantiated Block.ofTree with1+writeCount and the complete frozen snapshot;
all8092 local slots and40461 halt/live/store returns are paid. Partial lookup remains visible.
Source pass2: coverage is structural at every write-child and label-entry, then lifted through
pure graph loads/branches by compact_write_covered. Numeric raw/encoded swap remains accepted.
Source pass3: reviewed halt-store quotient, Option missing-row behavior, sigma casts, local
target rank, full paid input tape, and both halting directions. Added exact return roundtrip.
Source pass4: root-visible APIs, complete machine/row image, explicit counts and no placeholders;
all source checks are manual, and strict remote build remains a separate unmet gate.

Remote session39779413053 iteration1 reached this layout and rejected the draft:
two dependent inverse simplifications, one getter-unfolding heartbeat timeout,
and a long-line warning. Repair keeps dependent slots as whole function arguments
and uses congrArg with the exact equivalence inverse equations; the old layout is
locally irreducible and getter projection is rewritten explicitly. Source semantics
and counts unchanged. Next remote iteration pending; G2 remains unmet.

Remote session39780889172 iteration1 eliminated all previous errors except the
returnAt_live definitional-equality heartbeat. New repair makes the certified code
locally irreducible after its construction/count lemmas and explicitly aligns both
sides as returnAtSlot applications before congrArg. No resource-limit increase or
semantic change. Next remote iteration pending; G2 remains unmet.

Remote session39780889172 iteration2 at857841b strictly built FieldSelectiveLayout
in37seconds. Wrapper rowBody_eq failed because rewriting an entire BundledMachine
changed the state index of its toMachine projection. Repaired by unfolding both
bundles and rewriting only the fixed-dimension binaryRows and table compiler
functions. Full wrapper/semantic build still pending; G2 remains unmet.
