# Actual paid decoder primitive execution
OWNS: Cryptids/Compilation/TableSeed/Blocks.lean

- [ ] G1: Framed actual-machine read, prepend/scan emission, entry and finish contracts match complete paid controller; no assumed unpaid steps, placeholders, new axioms or accepted edits. Four source passes completed.
  EVIDENCE: pending
- [ ] G2: Strict remote Blocks build verifies exact entire tapes and finite reachability for the primitive contracts; retained source/command evidence and actual controller correspondence are cited.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target blocks
  EXPECT: Structured decoder proof target passed
  EVIDENCE: pending
