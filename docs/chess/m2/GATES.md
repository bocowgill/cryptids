# Gates: M2 executable chess rules

OWNS: Cryptids/Chess/Exec/**, Cryptids/Chess/Exec.lean, Cryptids/Chess/Fixtures.lean, Cryptids.lean, scripts/verify_chess_m2.py, scripts/AuditChessM2.lean, scripts/RunChessM2.lean, docs/chess/m2/**, ROADMAP.md, .github/workflows/lean_action_ci.yml

Scope: Executable raw-position encodings, complete legal-ply enumeration, full position updates,
unrestricted refinement proofs, and independently documented rule fixtures. Keep M1 frozen and
leave history adjudication, strategy evaluation, compilation, machine construction, and outreach
outside this milestone.

- [x] M2A: Concrete boards and positions have checked encoding/decoding round trips and an exact initial encoding.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Exec Cryptids.Chess.Fixtures
  EXPECT: Build completed successfully
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=0cba766514c31fcbb5f02ab3ae7f5af672bfb3b38fb6e8ab27b51fca2691b05a; output_bytes=42

- [x] M2B: Legal-ply enumeration is sound, complete, and duplicate-free for every raw position; updates agree in every position field without reachability assumptions.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake env lean --run scripts/AuditChessM2.lean
  EXPECT: Chess M2 theorem audit passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=310048f2c8d657e374df050f0228639e52cb07f06cdb61adb2f4f9ad14ad6969; output_bytes=154

- [x] M2C: Executed fixtures cover both colors and sides of castling, transit check, rights loss, en passant and expiry, all promotions, check evasion, mate, stalemate, and independently sourced move-tree counts.
  CHECK: python3 scripts/verify_chess_m2.py
  EXPECT: Chess M2 executable verification passed
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=04bb29faab7bc9c8cbe7463b9108df8adc82300ffe70da60f9d6ced575a28f3b; output_bytes=1006

- [x] M2D: Frozen M1 source, declaration correspondence, manifest, and toolchain remain intact.
  CHECK: python3 scripts/verify_chess_reference.py
  EXPECT: Chess reference correspondence verified
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=013e0d2a69026565cd6d2ab2e890051d89850344ecc4ae44278cb8f97ba65efb; output_bytes=251

- [x] M2E: Default targets build with the executable API integrated.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake build
  EXPECT: Build completed successfully
  EVIDENCE: exit=0; shell=/bin/zsh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; expect_matched=True; output_sha256=96aa18f51fd66810129f67e8bcdbb5a23643a7b1e071560bda947ccd85d47c2d; output_bytes=1347

- [x] M2F: Document the exact domains, theorem names, fixture provenance, measured results, CI registration, and remaining milestone boundaries.
  EVIDENCE: Manual review of README.md, RESULTS.md, results.json, perft.json, ROADMAP.md, and workflow diff. Public contracts are unrestricted; all tested source hashes match implementation commit 3fe6082385cdbf5136a02af43ea61aaab8e5de13. CI includes the M2 verifier and script/fixture path filters. git diff against M1 is empty for the frozen reference, manifest, archive, checkers, and toolchain pins. M3–M7 remain unstarted; no new issue, PR, or outreach was performed. Six gates met, zero unmet, zero abandoned.
