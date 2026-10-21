# M7 acceptance gates

Status: **9 met, 0 unmet, 0 abandoned**. First certified strict reduction accepted.

The CHECK lines record actual remote Linux commands. Heavy checks remain remote;
local verification is limited to the retained evidence metadata/hash checker.
G1 records the successful broader proof command: its first mandatory subphase
is exactly the freeze function, and its actual freeze-success token is retained.
No acceptance outcome was weakened. The original whole core workflow failed in
later regression setup; successful current component checks compose with the
unchanged successful regression wrapper under identical 192 input hashes.

The root independently rechecked current hashes, official archives, full range
journals and the final review seal. See [results](RESULTS.md),
[root evidence check](evidence/root-check.json) and
[independent review](REVIEW.md).


- [x] G1: M6 machine, proof, frozen source and retained literal payload remain fixed under recorded baseline pins.
  CHECK: python3 scripts/verify_chess_m7.py --proofs
  EXPECT: Chess M7 frozen baseline verification passed
  EVIDENCE: {"run":39506528766,"command":"python3 scripts/verify_chess_m7.py --proofs","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/current/logs.zip!verify/9_Verify quotient proofs, exact stopping and corruption controls.txt","remote_log_bytes":2184,"remote_log_sha256":"997beba77d3d3441d0ddc2e1cb923f0e1a030fe5cb50e560310d2912d4ebb9b1","reports":["docs/chess/m7/evidence/current/freeze.json","docs/chess/m7/evidence/current/proofs.json"]}
- [x] G2: Generic quotient simulates every old state/tape step and exact stopping, with ordinary blank state0 correspondence and both halting directions.
  CHECK: python3 scripts/verify_chess_m7.py --proofs
  EXPECT: Chess M7 quotient proof verification passed
  EVIDENCE: {"run":39506528766,"command":"python3 scripts/verify_chess_m7.py --proofs","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/current/logs.zip!verify/9_Verify quotient proofs, exact stopping and corruption controls.txt","remote_log_bytes":2184,"remote_log_sha256":"997beba77d3d3441d0ddc2e1cb923f0e1a030fe5cb50e560310d2912d4ebb9b1","reports":["docs/chess/m7/evidence/current/freeze.json","docs/chess/m7/evidence/current/proofs.json"]}
- [x] G3: Actual candidate has a kernel-proved strict lower state count and the unchanged unconditional frozen non-draw equivalence, including the paid initializer.
  CHECK: python3 scripts/verify_chess_m7.py --proofs
  EXPECT: Chess M7 quotient proof verification passed
  EVIDENCE: {"run":39506528766,"command":"python3 scripts/verify_chess_m7.py --proofs","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/current/logs.zip!verify/9_Verify quotient proofs, exact stopping and corruption controls.txt","remote_log_bytes":2184,"remote_log_sha256":"997beba77d3d3441d0ddc2e1cb923f0e1a030fe5cb50e560310d2912d4ebb9b1","reports":["docs/chess/m7/evidence/current/freeze.json","docs/chess/m7/evidence/current/proofs.json"]}
- [x] G4: Independent target matches all transitive machine/chess definitions; solution audits allow only standard axioms and semantic negative controls fail correctly.
  CHECK: python3 scripts/verify_chess_m7.py --definitions
  EXPECT: Chess M7 definition verification passed
  EVIDENCE: {"run":39506528766,"command":"python3 scripts/verify_chess_m7.py --definitions","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/current/logs.zip!verify/11_Verify fixed target and complete candidate table.txt","remote_log_bytes":513081,"remote_log_sha256":"9885eb62dcac06a9fd8fab7dfbc8df5928fa48155afa506793528e30923d84a0","reports":["docs/chess/m7/evidence/current/definitions.json","docs/chess/m7/evidence/current/controls.json"]}
- [x] G5: Candidate artifact fixes the entire table; every canonical row byte matches independent export, with mutation/truncation/count/map controls.
  CHECK: python3 scripts/verify_chess_m7.py --table
  EXPECT: Chess M7 complete table verification passed
  EVIDENCE: {"run":39506528766,"command":"python3 scripts/verify_chess_m7.py --table","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/current/logs.zip!verify/11_Verify fixed target and complete candidate table.txt","remote_log_bytes":513081,"remote_log_sha256":"9885eb62dcac06a9fd8fab7dfbc8df5928fa48155afa506793528e30923d84a0","reports":["docs/chess/m7/evidence/current/table.json","docs/chess/m7/evidence/current/candidate-table-manifest.json"]}
- [x] G6: Applicable Linux regressions pass; before/after counts and separate runtime/build costs, failed attempts and reproduction guide are retained. No heavy local work or outreach.
  CHECK: python3 scripts/verify_chess_m7.py --baseline
  EXPECT: Chess M7 baseline verification passed
  EVIDENCE: {"run":39527113752,"command":"python3 scripts/verify_chess_m7.py --baseline","shell":"/usr/bin/bash -e {0}","cwd":"/home/runner/work/cryptids/cryptids","exit":0,"expect_matched":true,"retained_log":"docs/chess/m7/evidence/regressions/logs.zip!verify/8_Verify unchanged M1\u2013M5 regression baseline.txt","remote_log_bytes":12326,"remote_log_sha256":"64a7c98fefcae89b6064c7b79d1d0f5b300a7ac6dc0056a36d7bddc00fdb3440","reports":["docs/chess/m7/evidence/regressions/baseline.json","docs/chess/m7/RESULTS.md","docs/chess/m7/RESEARCH.md"]}

- [x] G7: Independent review finds no remaining mathematical, exact-artifact, verification or scope defect; root rechecks its current evidence and source pins.
  EVIDENCE: {"review":"accepted R1 and R2","review_seal":"docs/chess/m7/evidence/review/seal.json","seal_sha256":"c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4","root_recheck":"docs/chess/m7/evidence/root-check.json","root_recheck_sha256":"33bcb67cb83d06930e72b0a6e872468a37d6660b356cfb9390a0526fa7aa62c9","root_seal_recheck":"passed: all192core,45evidence,4reviewer,helper,REVIEWhashes"}

## Independent review


- [x] R1: Quotient, numeric count, ordinary initial state, exact stopping, full chess correspondence and explicit table recipe satisfy the unchanged target; concrete defects are resolved or identified.
  EVIDENCE: {"review":"docs/chess/m7/REVIEW.md","review_sha256":"690e6b8a9ca9ca964e88b14ae495adaa2943df08dc837ddb58aa5beac16fa7d8","disposition":"accepted; universal checked construction, strict count, fixed target, complete table"}
- [x] R2: Final review is bound to current source hashes and actual completed Linux proof/definitions/all-row/regression evidence; no claim follows from bounded traces or pending CI.
  EVIDENCE: {"seal":"docs/chess/m7/evidence/review/seal.json","sha256":"c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4","disposition":"accepted; exact current pins and actual complete remote evidence"}
