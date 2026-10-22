# Complete exact quotient pilot
OWNS: scripts/chess_body_20261022/pilot.py, docs/chess/campaign-2026-10-22/round-03/PILOT.md, .unlazy/chess-goal-20261022-r03/gates/leaf-1.1.md

- [x] G1: Full bounded partition, independent universal row checker, literal golden cases, negative controls and complete exports are implemented without local execution.
  EVIDENCE: source implemented in scripts/chess_body_20261022/pilot.py; four-pass source review documented in round-03/PILOT.md. Independent static reviewer found no blocking defect; both suggested semantic negative controls added. No local code/import/model/count/fixture execution. This manual source gate makes no execution-pass claim.
- [ ] G2: Exact-source remote pilot passes all checks and retains measured complete counts, or records its precise resource/representation obstruction.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python scripts/chess_body_20261022/pilot.py --output .lake/chess-body-20261022 --seconds 600 --memory-gib 6
  EXPECT: Whole-body exact quotient pilot passed
  EVIDENCE: pending root-owned remote run and source-bound retained artifacts; failures/obstructions do not certify a quotient or satisfy the success oracle.
