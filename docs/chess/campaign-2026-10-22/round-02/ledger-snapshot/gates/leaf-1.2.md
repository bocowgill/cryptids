# Three-bit controller pilot
OWNS: scripts/chess_seed_20261022/pilot.py, docs/chess/campaign-2026-10-22/round-02/CONTROLLER.md, .unlazy/chess-goal-20261022-r02/gates/leaf-1.2.md

- [x] G1: Complete explicit finite binary controller, named state accounting, source geometry and independent pilot checks are implemented after four source passes.
  EVIDENCE: `scripts/chess_seed_20261022/pilot.py` and `docs/chess/campaign-2026-10-22/round-02/CONTROLLER.md`; complete two-symbol row allocation, only done terminal, paid invalid-code loop, separate expected-output oracle, frozen full-input static decode, all length0..3 fixtures/translations plus boundaries, and14 focused mutations. Independent source-only geometry/code review found no blocking defect. Four passes are recorded in CONTROLLER.md. No local execution/import occurred; this checks source completion only.
- [ ] G2: Remote pilot exports every controller row, exact paid count, full frozen-input decoding and all small-input/negative controls, preserving evidence scope.
  EVIDENCE: pending root-owned remote receipt for `.lake/chess-seed-20261022/pilot-summary.json`; required final banner `Three-bit seed pilot passed`. Do not infer execution from the completed source gate. No new formal machine accepted.
