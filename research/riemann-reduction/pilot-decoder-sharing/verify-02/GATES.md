# Gates: one additional retained-witness verification

OWNS: scripts/riemann_share/**, .github/workflows/riemann_share.yml,
  research/riemann-reduction/**

One solo verification leaf. Read-only local provenance checks and source edits;
all executable mathematics stays in the single authorized free remote job.

- [x] V1: The only mathematical repair supplies a computable Decidable instance;
  the exact 30 retained witness IDs, predicate and alias family stay fixed.
  EVIDENCE: Manual diff and remote provenance confirm exactly the instance insertion;
    all six retained-file hashes match. The unchanged witness module hash is
    68d218019755897c...; strict kernel build passed at producer 18e8cc2907fb.
- [x] V2: Exactly one additional free job runs within the same limits, without retry.
  EVIDENCE: Run 40145261135, job 121025114709, attempt 1, ordinary public-fork
    ubuntu-24.04. Governed time 347.438s, sampled aggregate 6280089600 bytes,
    driver 13541376 bytes; 39 serialized real Lean invocations. No resource stop.
- [x] V3: Lean checks the retained batch and its full-private dependency audit and
  explicit rejection controls pass, or the exact earliest obstruction is retained.
  EVIDENCE: Kernel and audit exit 0; 4 roots/774 dependencies use only propext and
    Quot.sound; main batch uses only propext. Injected sorryAx and fresh invalid
    True.intro : False both rejected, exit 1. Independent replay verifies the same
    30 endpoints in 515 evaluations, no search, with corruption controls rejected.
- [x] V4: Original failed-run evidence, pinned baseline and Chess pause are preserved,
  artifacts are retained, and broader search/further jobs stay held.
  EVIDENCE: Artifact 12580686076 retained intact/extracted; measured digest equals
    98240a6cffd58954... . Accepted-source and original failed-evidence diffs exit 0;
    Chess pause file remains identical to the historical pause checkpoint. RESULT
    and current checkpoint hold broader search and further RH jobs.

These manual integration gates review remote artifacts, not locally run proofs.
No completion status confers an RH state saving or a general lower bound.
Verification integration gates: 4 met, 0 unmet, 0 abandoned. The retained batch
and audits actually passed; no planned check is credited as executed.
