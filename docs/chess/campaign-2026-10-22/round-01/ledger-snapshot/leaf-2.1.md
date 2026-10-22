# Selective binary compiler
OWNS: Cryptids/Optimisation/SelectiveBinary.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.1.md

Scope: Implement generic selective returns, universal coverage, exact row certificate, arbitrary-tape halting, numeric table transformer. All verification remote via root; source drafting only locally.

- [x] G1: Complete source implements agreed contract with no placeholders.
  EVIDENCE: SelectiveBinary.lean source draft contains explicit q+r compilation, universal WriteCoverage, exact LocalCertificate.Rows, arbitrary-state/tape haltsFrom, input/blank wrappers, numeric decode/remap and independent table_compile. Four source passes below; Lean acceptance remains G2.
- [ ] G2: Strict remote Lean build passes.
  EVIDENCE: remote run39776381244 at213aaf0 failed because the Post machine type needs Inhabited(Fin q). Added explicit NeZero q to Post-machine definitions/theorems; pure numeric layout remains unconstrained. Awaiting next strict remote build; first-run cascading tactic diagnostics are not accepted proof evidence.

Remote repair2: run39777234132 eliminated missing instances; its remaining rows/table_compile
failures were transparency mismatches after Fin.addCases and Machine.mk congruence.
Enabled the existing compiler convention backward.isDefEq.respectTransparency=false and
explicitly refolded table/compile transition projections before the table case split.
No new semantic premise or weaker statement was introduced. Awaiting remote validation.

Four source passes:
1. Complete: every requested construction/theorem is drafted with no proof placeholder;
   no old file is changed and no local substantive execution was used.
2. Expert: semantic certificate is separate from table equality; Rows preserves both
   existing and missing transitions and includes every retained return on both bits.
3. Defect: inspected r=0, duplicate slots, incorrect/missing lookup, terminal writes,
   mixed move/write controls, repeated writes, arbitrary tape/head, and initial zero.
   Coverage rules out missing/wrong actual destinations; injectivity is not assumed.
4. Polish: retained explicit numeric index lemmas and exact q+r accounting; separated
   source completion from pending remote kernel verification. No full chess count claimed.
