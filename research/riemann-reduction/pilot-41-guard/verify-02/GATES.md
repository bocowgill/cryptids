# Gates: one additional 41/ONE repair verification job

OWNS: scripts/riemann41/**, .github/workflows/riemann41.yml,
  research/riemann-reduction/**

Scope: repair the namespace/deprecation defects, then execute one additional free
remote job under the unchanged proof-only limits. No retry, candidate or broader
search. Preserve the first failed producer and artifact byte-for-byte.

- [x] V1: The mathematical source repair preserves every statement and hypothesis.
  EVIDENCE: Manual source/diff review 2026-10-25: remove broad Turing openings in
    GuardCore/GuardBoot; use ite_eq_right and the pinned Bool.and_eq_true_iff.
    All statements/hypotheses and AssemblyProbe stay unchanged. The runner contains
    exact substitution/seven-file binding assertions, but they did not execute
    because the first Git baseline comparison failed. No local mathematics.
- [x] V2: One additional free job runs once under the original resource limits.
  EVIDENCE: Run 40198910472, job 121185664029, attempt 1, ordinary ubuntu-24.04;
    14.900 governed seconds, 48074752-byte sampled aggregate peak, 17240064-byte
    driver peak, zero wrapped Lean proof/dependency invocations. No retry or limit stop.
- [ ] V3: The unchanged finite filters and independent replay receive explicit dispositions.
  EVIDENCE: Not executed. Fidelity stopped first at missing baseline object,
    before generation, finite checks, independent replay or negative controls.
- [x] V4: Strict proof checks and audits certify only successful modules, or retain
  the first exact certification obstruction with all unexecuted obligations named.
  EVIDENCE: RESULT and fidelity.log retain fatal bad object 6c28d852... and Git
    diff exit 128. All proof/audit/control stages are explicitly unexecuted.
    This gate records the exact runner obstruction only; zero new proof credit.
- [x] V5: Evidence, baseline, previous runs and Chess pause are preserved; further work is held.
  EVIDENCE: Artifact 12600029966 retained/extracted; measured SHA-256 matches
    1f08eb3b7a6745c08547f1dec46f7c916929a5ae7fbbdfb07640858957d8e602.
    Accepted-source, old evidence and historical Chess-pause Git comparisons exit 0.
    Current explicit-pin checkout repair is unexecuted, with no new launch packet.

These are manual task-integration gates against remote artifacts. Completion at
an exact obstruction does not certify the failed or unexecuted mathematical claim.
Manual integration gates: 4 met, 0 other unmet, 1 abandoned. Handoff required:
the repaired proof and new verification checks remain unexecuted.

ABANDON: V3 The single additional job is consumed and retries are forbidden; hand off the unexecuted filters pending any new authorization.
