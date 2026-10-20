# Gates: M4 bounded play and strategic evaluation

OWNS: Cryptids/Chess/Evaluation/**, Cryptids/Chess/Evaluation.lean, Cryptids.lean, scripts/AuditChessM4.lean, scripts/RunChessM4.lean, scripts/verify_chess_m4.py, docs/chess/m4/**, ROADMAP.md, .github/workflows/lean_action_ci.yml

Scope: Total executable backward induction over full games, finite branching and a proved
uniform bound, globally legal optimal strategies, and exact correspondence with the frozen
avoid-loss and forced-win predicates. M5–M7 and outreach remain on hold.

- [x] M4A: Prove finite branching and a uniform bound on legal play, including terminal endpoints and draw claims, using finite keys without dropping game history or counters.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Evaluation Cryptids.Chess.Fixtures
  EXPECT: Build completed successfully
  EVIDENCE: cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; shell=/bin/zsh; exit=0; expect_matched=True; output_sha256=202a72950e5eb378619b02068a26f8682e43291813d818ea25f49d54be9975a2; output_bytes=42

- [x] M4B: Construct total executable backward induction and globally legal optimal strategies; prove existence and uniqueness of strategy-pair results from reachable histories.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake env lean -DwarningAsError=true --run scripts/AuditChessM4.lean
  EXPECT: Chess M4 theorem audit passed
  EVIDENCE: cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; shell=/bin/zsh; exit=0; expect_matched=True; output_sha256=cafc7843c464f581d8ca77f9b1adff602968f0014801d6ba16ab62992fed0ee3; output_bytes=240

- [x] M4C: Prove draw iff both frozen avoid-loss predicates, and both forced-win characterizations, without depending on the open chess conjecture.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake env lean -DwarningAsError=true --run scripts/AuditChessM4.lean
  EXPECT: Chess M4 theorem audit passed
  EVIDENCE: cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; shell=/bin/zsh; exit=0; expect_matched=True; output_sha256=cafc7843c464f581d8ca77f9b1adff602968f0014801d6ba16ab62992fed0ee3; output_bytes=240

- [x] M4D: Execute bounded outcome and strategic fixtures, including a draw claim improving a loss, and reject deliberate trust violations.
  CHECK: python3 scripts/verify_chess_m4.py
  EXPECT: Chess M4 executable verification passed
  EVIDENCE: cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; shell=/bin/zsh; exit=0; expect_matched=True; output_sha256=965de6cb280e42aa36ce566cccd720665ceae64ddc28b899b3b0de405050d264; output_bytes=1405

- [x] M4E: Preserve all frozen and M2/M3 computational inputs and pass the default build and prior regression suites.
  CHECK: python3 scripts/verify_chess_m4.py --baseline
  EXPECT: Chess M4 baseline verification passed
  EVIDENCE: cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; shell=/bin/zsh; exit=0; expect_matched=True; output_sha256=f312fa660ddc721e60c666874b4c9a0810c2c4f3925e9e3eabfbb9725823b5ec; output_bytes=3231

- [x] M4F: Document the complete proof chain, executable limits, exact revisions and checks, and milestone boundary; review all requirements before reporting completion.

  EVIDENCE: Manual review of DESIGN.md, RESULTS.md, results.json, the CI diff, and every M4 roadmap criterion. All tested inputs match implementation 0e62d56fdb5971900250949fa82affb5734c68b9. Full histories and clocks, finite-key counting, terminal endpoints and claims, globally legal off-trajectory choices, unique results, all-opponent optimality, exact frozen predicates, compiler artifacts, raw fixture domains, and impractical runtime limits are explicit. No frozen/M2/M3 inputs or dependency pins changed. M5–M7 and outreach remain on hold. Six gates met, zero unmet, zero abandoned.
