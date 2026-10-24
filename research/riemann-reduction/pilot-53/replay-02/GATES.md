# Gates: one additional remote counterexample verification

OWNS: scripts/riemann53/**, .github/workflows/riemann53_pilot.yml,
  lakefile.riemann53.toml, research/riemann-reduction/pilot-53/replay-02/**

Scope: independently replay and Lean-check the fixed outside44 counterexample.
Authorization: user explicitly grants one additional free remote job on 2026-10-24.
Limits: same 3180 seconds total / 6 GiB aggregate / 512 MiB driver; one Lean process,
Lean -M6144, no automatic retry, unchanged per-stage caps and finite-step ceiling.
No additional optimization candidate, Chess action, baseline edit or broader search.

- [ ] V1: Repaired capacity probe and unchanged baseline/source identities are recorded remotely.
  EVIDENCE: pending

- [ ] V2: Python and independent Node replay agree on the fixed witness and complete tapes.
  EVIDENCE: pending

- [ ] V3: Strict Lean checking proves the exact counterexample using the actual accepted definitions.
  EVIDENCE: pending

- [ ] V4: Full-private proof closure and corruption/kernel rejection controls pass remotely.
  EVIDENCE: pending

- [ ] V5: Source/evidence archive, actual resource use and protected-state review are complete.
  EVIDENCE: pending
