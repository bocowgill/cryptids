# Gates: M1 definitions-only port and reference freeze

OWNS: Cryptids/Chess/**, Cryptids/Chess.lean, Cryptids.lean, scripts/verify_chess_reference.py, scripts/CompareChessReference.lean, docs/chess/m1/**, ROADMAP.md, .github/workflows/lean_action_ci.yml

Scope: Port the audited reference without rule changes, build it on the pinned toolchain, check correspondence and trust, specify its domain contract, and freeze it without starting executable move generation or outreach.

- [x] P1: The complete default Cryptids targets build on the unchanged pinned toolchain.
  CHECK: env ELAN_NO_UPDATE_CHECK=1 lake build
  EXPECT: Build completed successfully
  EVIDENCE: exit=0; shell=/bin/sh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; path=3caa621c5162/31 entries; EXPECT=matched; output-sha256=0ae5a36b79e758790261b653985f9542441e77f04f96f109901222a49a014855; output-bytes=1347

- [x] P2: Every retained reference declaration and its dependencies match the independently compiled pinned source, and only permitted axioms occur.
  CHECK: python3 scripts/verify_chess_reference.py
  EXPECT: Chess reference correspondence verified
  EVIDENCE: exit=0; shell=/bin/sh; cwd=/Users/bocowgill/.codex/worktrees/6ba9/cryptids; path=3caa621c5162/31 entries; EXPECT=matched; output-sha256=013e0d2a69026565cd6d2ab2e890051d89850344ecc4ae44278cb8f97ba65efb; output-bytes=251

- [x] P3: The freeze record identifies the reviewed target and its exact source/port identities, with all departures accounted for.
  EVIDENCE: Manual review of FREEZE.md against reference-v1.json and the archive; exact retained namespace/sanity bodies checked by the verifier; module/import/attribute/documentation changes enumerated; all manifest file hashes independently recomputed; source commit and Git blob preserved; no semantic rule correction introduced.

- [x] P4: Exact reference domains and invariant obligations are documented without assuming the draw conjecture or declaring unproved invariants established.
  EVIDENCE: DOMAIN.md uses the existing compiled Reachable, IsLegalAction, and Position.Next predicates as exact contracts, distinguishes terminal endpoints and raw inputs, and specifies invariant conclusions as future proof obligations. FREEZE.md and the compiled dependency check establish absence of the open draw theorem; no extra target hypothesis or axiom added.

- [x] P5: Milestone status and repository changes complete the reference-only scope, with no executable move generator, machine construction, or outreach.
  EVIDENCE: ROADMAP.md marks M1 complete and M2–M7 unstarted. Final path inspection found only Spec, the retained sanity theorem, the public aggregate/import, verification scripts/CI registration, and M1 documentation. Exact toolchain/Lake/dependency files unchanged; no Exec directory or new machine table exists; no issue/PR/message tools used.
