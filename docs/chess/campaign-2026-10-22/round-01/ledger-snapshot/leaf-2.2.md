# Structural write-target layout
OWNS: Cryptids/Compilation/FieldReturns/Syntax.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.2.md

Scope: Implement syntax write-count, root/write-child return slots, executable rank/decode and universal coverage lemmas. Do not implement concrete frozen layout yet. All verification remote via root; source drafting only locally.

- [ ] G1: Complete source implements agreed contract with no placeholders.
  EVIDENCE: First source draft saved in Cryptids/Compilation/FieldReturns/Syntax.lean. Pass1 implements recursive write-child list, root prefix, exact length and executable indexed lookup. Pass2 uses list Nodup and idxOf inverse facts for full roundtrip. Pass3 checks both branches, repeated equal subtrees as distinct occurrences, zero-write rows, shared parent indices, and arbitrary nodeAt write children. Pass4 documents executable local lookup and distinguishes draft from remote verification. Source contains no placeholders; parent review and remote diagnostics pending.
- [x] G2: Strict remote Lean build passes.
  EVIDENCE: Root notified first draft ready; no local Lean/LSP/Probe/Lake or model was run. Pending exact source commit and remote receipt.

Remote repair1: run39776658598 rejected the draft for two Fin.val domain inference
errors and a shadowed node-equality hypothesis at four structural branches; strict
checking also rejected deprecated dif_pos. Explicit target Fin domains, a distinct
primitive hypothesis name, and dite_eq_left are now applied. No theorem signatures
changed; the repaired draft still awaits its next remote result.

Parent remote receipt: machine39777697376 atbc2e490 successfully built this exact module; current SHA256 matched source-manifest. Overallrun failed only on older generic compiler. Full integrated acceptance remains unmet.
