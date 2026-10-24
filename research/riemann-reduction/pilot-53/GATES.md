# Gates: fixed state-53 pilot

OWNS: research/riemann-reduction/pilot-53/**, scripts/riemann53/**,
  .github/workflows/riemann53_pilot.yml

Scope: run one fixed candidate remotely and report a certified result or an exact obstruction.
Authorization: user explicitly requested this pilot on 2026-10-24.
Budget: one free public-fork ubuntu-24.04 job, one candidate, no retries;
3180 seconds total, 6 GiB aggregate, 512 MiB driver, one Lean process at -M6144.
Stage caps and finite fixture limits remain those in ../PILOT.md.
No Chess changes, baseline edits, broader search or outreach.

- [ ] P1: Baseline/source pins and complete state census agree on the remote host.
  EVIDENCE: Not reached. Run 40132242492 failed in the capacity probe before generation.

- [ ] P2: Exactly the authorized 53-bypass artifact and source map are retained.
  EVIDENCE: Not generated. The recipe is retained in source; no measured 94-state artifact exists.

- [x] P3: The canonical skipped-bit encoding either closes or yields an exact failing equation.
  EVIDENCE: Manual direct proof in COUNTEREXAMPLE.md: outside44 zero DEC has
    W=1001110110, E(B_1(W))=100111 and B_1(E(W))=101. Source indices and all reads shown.

- [ ] P4: Any negative witness is replayed independently with complete frame/source provenance.
  EVIDENCE: Independent executable replay did not run; the counterexample is a human-readable
    derivation from pinned sources. Planned Python/Node checks earn no credit.

- [x] P5: Outcome is scoped correctly, recoverable, and all limits and protected inputs are reviewed.
  EVIDENCE: RESULT.md distinguishes failed remote execution, unexecuted capacity repair,
    manual exact obstruction and absent certification. One job, no retry; accepted sources
    unchanged and Chess HEAD/branch unchanged in the final Git review. RSS was not recorded.

ABANDON: P1 Startup failed before census; no retry under the authorized one-job cap.
ABANDON: P2 Generation was not reached; the false encoding equation stops this fixed route.
ABANDON: P4 Independent replay was not reached; preserve manual proof without claiming execution.

Disposition: 2 manual gates met, 3 abandoned execution gates, zero pending execution promises.
This is an explicit verification handoff, not a successful remote certification.

Conditional acceptance only: a positive screen is insufficient. If no obstruction is found,
full candidate Lean equivalence, independent challenge/comparator, foundation audits and
baseline regressions from PILOT.md remain required. No certification is credited before those.
