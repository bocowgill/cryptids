# Gates: M3 exact chess history and adjudication

OWNS: Cryptids/Chess/Adjudication/**, Cryptids/Chess/Adjudication.lean, Cryptids.lean, scripts/AuditChessM3.lean, scripts/RunChessM3.lean, scripts/verify_chess_m3.py, docs/chess/m3/**, ROADMAP.md, .github/workflows/lean_action_ci.yml

Scope: Exact repetition and claims, full history, automatic outcomes and legal actions, and a
proved executable dead-position decision against the unchanged reference. M4–M7 and outreach
remain outside this milestone.

- [x] M3A: Project away only the halfmove clock, proving move and checkmate preservation, path projection/lifting, and exact finite-graph dead-position decidability.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Adjudication Cryptids.Chess.Fixtures
  EXPECT: Build completed successfully
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=e40cb655abb527fd24760eade81bbd3977154e5e4428f46cbf8cbbc2acdb5052; output_bytes=42

- [x] M3B: Full histories, repetition equality/counting, and current/intended-move draw claims refine the frozen predicates exactly.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake env lean -DwarningAsError=true --run scripts/AuditChessM3.lean
  EXPECT: Chess M3 theorem audit passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=aebdcb829a48250314ac78ff1fb6c148a78859c65f70859fe7cfe358a8292543; output_bytes=239

- [x] M3C: Automatic outcomes and complete legal actions refine the reference; outcomes are unique, terminal actions are impossible, and nonterminal games have an action.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake env lean -DwarningAsError=true --run scripts/AuditChessM3.lean
  EXPECT: Chess M3 theorem audit passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=aebdcb829a48250314ac78ff1fb6c148a78859c65f70859fe7cfe358a8292543; output_bytes=239

- [x] M3D: Execute repetition/metadata, claims, reset/threshold, precedence, and exact dead/non-dead fixtures, with trust negative controls.
  CHECK: python3 scripts/verify_chess_m3.py
  EXPECT: Chess M3 executable verification passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=a11f614dacdf4f530d0ed2b8f875632010418e8d32ddc74f8f440464c81f7886; output_bytes=397

- [x] M3E: The frozen reference and M2 input versions remain unchanged and default targets build.
  CHECK: python3 scripts/verify_chess_m3.py --baseline
  EXPECT: Chess M3 baseline verification passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=72de28e0b321bfe60ebf10e87be70e9ad7944728de0fe871a5084c59593d836d; output_bytes=1752

- [x] M3F: Record source identities, theorem contracts, exact decision limits, CI integration, and all remaining milestone boundaries.
  EVIDENCE: Manual review of DESIGN.md, RESULTS.md, results.json, ROADMAP.md, and the CI diff. All recorded M3 inputs match implementation revision 9115a213a1203fde1e9b4725e1b0b0eee6b3426d. No M1 or M2 files or dependency pins changed. Exact clock projection, path lifting, repetition-index counting, raw-game theorem domains, compiler-helper trust treatment, bounded fixture scope, and potentially astronomical search cost are explicit. M4–M7 remain unstarted; no new issue, PR, or outreach occurred. Six gates met, zero unmet, zero abandoned.
