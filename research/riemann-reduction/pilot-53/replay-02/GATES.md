# Gates: one additional remote counterexample verification

OWNS: scripts/riemann53/**, .github/workflows/riemann53_pilot.yml,
  lakefile.riemann53.toml, research/riemann-reduction/pilot-53/replay-02/**

Scope: independently replay and Lean-check the fixed outside44 counterexample.
Authorization: user explicitly grants one additional free remote job on 2026-10-24.
Limits: same 3180 seconds total / 6 GiB aggregate / 512 MiB driver; one Lean process,
Lean -M6144, no automatic retry, unchanged per-stage caps and finite-step ceiling.
No additional optimization candidate, Chess action, baseline edit or broader search.

- [x] V1: Repaired capacity probe and unchanged baseline/source identities are recorded remotely.
  EVIDENCE: Run 40134606435, producer aed235c1001984528478268f4de834a1110cad77;
    resource-summary/provenance report successful probe, exact accepted SHA and remote zero diff.

- [x] V2: Python and independent Node replay agree on the fixed witness and complete tapes.
  EVIDENCE: screening and independent-replay stages exit 0. Witness is outside44/k1;
    both tapes replayed to roots (58/56 steps), with full support and exact outputs recorded.

- [x] V3: Strict Lean checking proves the exact counterexample using the actual accepted definitions.
  EVIDENCE: kernel stage exits 0, Rh53Counterexample built under strict warnings, -M6144;
    source SHA 3e61cd63bbd426b9e088140962ae3579ad0773077a8ce224bde5d90777ecfe79.

- [x] V4: Full-private proof closure and corruption/kernel rejection controls pass remotely.
  EVIDENCE: 10 roots/815 dependencies, only propext; injected sorryAx and fresh invalid
    proof each rejected with exit 1. Independent wrong-cell/count controls also rejected.

- [x] V5: Source/evidence archive, actual resource use and protected-state review are complete.
  EVIDENCE: artifact12576542287 retained; archive SHA agrees with GitHub; 352.013s,
    sampled aggregate RSS 6286041088 bytes, driver 13512704 bytes. Baseline zero diff;
    Chess worktree/HEAD unchanged; no other job or broader search launched.

Disposition: five met, zero unmet, zero abandoned for this additional verification task.
Historical first-job failures are preserved. No certified RH state saving is claimed.
