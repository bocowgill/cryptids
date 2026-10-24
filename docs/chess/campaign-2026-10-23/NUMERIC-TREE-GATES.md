# Numeric decorated-tree core pilot92

Scope: first prerequisite for STRUCTURAL-NUMERIC-CHECKER-GATES.md. This is
NOT a complete row checker, source-scaling proof, or accepted new machine.
Accepted769,344/target310,029; prospective459,315saving unchanged. Core
20root proofs are UNVERIFIED until remote strict build/private audit.

Representation stores plain Nat child/slot positions, fixed finite tables,
cached counts/root, structural trace and ordered write-target list. encode
computes child fragments once and derives annotations from them. Reference
trace ties every node/table to the original Syntax. Paid return root and
write-target ordering must exactly match FieldReturns for arbitrary offsets.
No Nat-to-Fin clipping/default restore is used in this core.

- [x] T1: All20explicit roots pass strict remote Lean build and full-private
  audit, including all six constructor/branch cases, renaming, cached count/
  root, exact trace, ordered targets and paid target count. Standard axioms only.
  MANUAL CHECK: NumericTree.log, NumericTreeAudit.log and20root receipt.
- [x] T2: Wrong annotation Boolean control passes; an explicit forged false
  annotation theorem is rejected by the kernel with type mismatch. No timeout,
  source/import/tactic failure or linter error counts as successful rejection.
  MANUAL CHECK: NumericTreeNegative.log and driver kernel-negative receipt.
- [x] T3: Original smoke/captured diagnostics/structural helpers still pass;
  generated source/log/script/pin hashes and widths are retained and reviewed.
  MANUAL CHECK: complete smoke result and retained byte/provenance review.

Run in the EXISTING manual workflow mode smoke. No workflow change or extra
automatic smoke is introduced. New core60s (including audit), negative45s,
original smoke global300s/6GiB incldriver/driver512MiB/Lean-M6144 unchanged.
Run core immediately after template smoke for fast failure, before old prefix
helper builds. Every generated Lean line<=100 checked before build. All heavy
work remote on existing free runner. Frozen3116pins and accepted sources fixed;
no local Lean/generation/model/counts, no paid resources or outreach.

Success unlocks numeric checker soundness and concrete source fidelity, not
N1in full or N2-N4. Next implement a plain-node checker corresponding to old
DirectChecks/StructuralChecks, exact numeric return inverse and SourceCertificate
transport. Then same-host355load/445write/356move fidelity+checking costs,
including setup/audits; only material improvement justifies substantial tiers.
All-source/shared controls/bidirectional halting/paid310,029/independent
fixtures/regressions/distinct final review remain open. No full cost estimate.


Evidence92run40117525615 atb8695666 retained and byte/provenance reviewed.
All20roots/1,131deps pass standard3axioms; core5.669s/audit2.738s,
peaks2,814,410,752/4,540,456,960bytes. Kernel false-annotation rejected5.066s.
Original smoke passes; driver123.868s, original caps unchanged. This closes
ONLY T1-T3. N1full checker, N2-N4actual source/scaling and machine gates open.
