# Universal structured packet control semantics
OWNS: Cryptids/Compilation/TableSeed/Transducer.lean

- [ ] G1: A proof abstraction follows the actual typed readTarget/consumeEntry/emitTarget graph and proves complete valid packet processing for arbitrary bounded rows/pre/post, including zero/leading bits, reverse order and consumed bits; no abstract-halt-to-machine claim or free runtime operations.
  EVIDENCE: pending; exact physical lifting stays separate
- [ ] G2: Strict remote named proof build passes with complete universal valid-input theorem, no placeholders or extra axioms; retained source/command evidence provided.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target transducer
  EXPECT: Structured decoder proof target passed
  EVIDENCE: pending
