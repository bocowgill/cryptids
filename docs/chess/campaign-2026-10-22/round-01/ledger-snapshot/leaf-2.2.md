# Structural write-target layout
OWNS: Cryptids/Compilation/FieldReturns/Syntax.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.2.md

Scope: Implement syntax write-count, root/write-child return slots, executable rank/decode and universal coverage lemmas. Do not implement concrete frozen layout yet. All verification remote via root; source drafting only locally.

- [x] G1: Complete source implements agreed contract with no placeholders.
  EVIDENCE: Parent reviewed complete recursive write count/targets, strict-below-root and branch-disjoint Nodup proofs, total paid targetAt and partial executable idxOf inverse, all root/write-child coverage and zero-write edges. No placeholders; exact file passed strict Lean and final full verification. Source contract complete, independent final model advisory found no issue.
- [x] G2: Strict remote Lean build passes.
  EVIDENCE: Exact source matched source-manifest in successful remote run39780889172 iteration4 at2dfa3a7656de3f15a0bbda387d6f0642328e6d08; strict full build and safe foundation audit passed. Earlier component build39777697376 also passed. No local Lean/model execution.

Remote repair1: run39776658598 rejected the draft for two Fin.val domain inference
errors and a shadowed node-equality hypothesis at four structural branches; strict
checking also rejected deprecated dif_pos. Explicit target Fin domains, a distinct
primitive hypothesis name, and dite_eq_left are now applied. No theorem signatures
changed; the repaired draft still awaits its next remote result.

Parent remote receipt: machine39777697376 atbc2e490 successfully built this exact module; current SHA256 matched source-manifest. Overallrun failed only on older generic compiler. Full integrated acceptance remains unmet.
