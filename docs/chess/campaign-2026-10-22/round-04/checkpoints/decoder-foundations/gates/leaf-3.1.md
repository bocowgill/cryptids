# Original-word and packet semantics
OWNS: Cryptids/Compilation/TableSeed/Format.lean

- [ ] G1: Complete source satisfies PROOF-PLAN.md, without placeholders or accepted-file edits; four adversarial passes and interface review recorded.
  EVIDENCE: pending
- [ ] G2: Strict remote Lean build of this module passes with warningAsError, unchanged accepted pins and retained exact source/command receipts.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target format
  EXPECT: Structured decoder proof target passed
  EVIDENCE: pending; remote only, root runs the eventual inspected wrapper
