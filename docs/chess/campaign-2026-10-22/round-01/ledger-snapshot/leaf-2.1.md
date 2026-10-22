# Selective binary compiler
OWNS: Cryptids/Optimisation/SelectiveBinary.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.1.md

Scope: Implement generic selective returns, universal coverage, exact row certificate, arbitrary-tape halting, numeric table transformer. All verification remote via root; source drafting only locally.

- [x] G1: Complete source implements agreed contract with no placeholders.
  EVIDENCE: SelectiveBinary.lean source draft contains explicit q+r compilation, universal WriteCoverage, exact LocalCertificate.Rows, arbitrary-state/tape haltsFrom, input/blank wrappers, numeric decode/remap and independent table_compile. Four source passes below; Lean acceptance remains G2.
- [x] G2: Strict remote Lean build passes.
  EVIDENCE: Session39780889172 iteration1, commit965a568c124b28a48d6a1926d99a0f8496e30718, command1792673368363408211.json reports Built Cryptids.Optimisation.SelectiveBinary (6.7s) without warnings. Parent matched current file SHA to source-manifest.json. Overall full build failed only in FieldSelectiveLayout; this is component evidence only, not full-machine acceptance.

Remote repair2: run39777234132 eliminated missing instances; its remaining rows/table_compile
failures were transparency mismatches after Fin.addCases and Machine.mk congruence.
Enabled the existing compiler convention backward.isDefEq.respectTransparency=false and
explicitly refolded table/compile transition projections before the table case split.
No new semantic premise or weaker statement was introduced. Awaiting remote validation.

Remote repair3: run39778061609 showed the option alone did not fold Fin.castAdd/natAdd.
All four Fin.addCases arms now explicitly `change` every state occurrence to mainState
or bounceState before rewriting. Table arms additionally expose the table bind directly,
so their source selector and destination remap have syntactically matching lemmas.
The remaining steps await the remote kernel; no local Lean was run.

Remote repair4: session39779413053 iteration1 elaborated the generic proof declarations;
strict checking still reported one line-length warning on the table_compile docstring.
Wrapped only that docstring. G2 remains unmet pending the warning-free remote receipt.

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
