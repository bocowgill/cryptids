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
  EVIDENCE: pending

- [ ] P2: Exactly the authorized 53-bypass artifact and source map are retained.
  EVIDENCE: pending

- [ ] P3: The canonical skipped-bit encoding either closes or yields an exact failing equation.
  EVIDENCE: pending

- [ ] P4: Any negative witness is replayed independently with complete frame/source provenance.
  EVIDENCE: pending

- [ ] P5: Outcome is scoped correctly, recoverable, and all limits and protected inputs are reviewed.
  EVIDENCE: pending

Conditional acceptance only: a positive screen is insufficient. If no obstruction is found,
full candidate Lean equivalence, independent challenge/comparator, foundation audits and
baseline regressions from PILOT.md remain required. No certification is credited before those.
