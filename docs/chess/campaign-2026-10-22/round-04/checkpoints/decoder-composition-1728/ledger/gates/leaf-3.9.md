# Lift the verified source-control paths into the actual paid machine
OWNS: Cryptids/Compilation/TableSeed/Correct.lean

- [ ] G1: Every Transducer.Step and finite Path is realized by actual-machine Reaches between exact frameTape configurations using the verified paid Blocks; no free steps, placeholders, new axioms or accepted-source edits. Four source passes completed.
  EVIDENCE: pending
- [ ] G2: Strict remote Correct build proves general physical path lifting and the entry/path/finish composition conditional only on the stated source-graph Path. No universal packet or chess theorem is claimed until that antecedent is independently discharged.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target correct
  EXPECT: Structured decoder proof target passed
  EVIDENCE: pending

## Initial complete block

`Correct.frameCfg` maps every source configuration to the actual paid control encoding and
`Blocks.frameTape`. `step_reaches` uses only `Blocks.read_reaches` and `Blocks.emit_reaches`.
`path_reaches` uses reflexive-transitive tail induction and concatenates those physical paths.
`source_path_reaches` composes the verified entry, explicit source path, and verified cleanup.
`packet_reaches_of_path` exposes the same result at numeric state zero on `header ++ raw`.

The sole semantic premise is exactly
`Transducer.Path ⟨.read (.literal 0 0), [], raw, 1⟩ ⟨.finish, out, [], gap⟩`.
The source does not use the pending packet theorem or require an unproved positive-gap lemma.
No actual state, row, runtime operation, or accepted source is added or changed. No placeholders,
new axioms, unsafe declarations, or native proof oracles occur. First remote check pending.

## Source review passes

1. Matched both source Step constructors against verified Blocks endpoints, including output,
   unread bit removal, gap increment, emission continuation, and full tape frames.
2. Checked closure lifting and entry/path/finish concatenation mathematically: zero source paths
   map to reflexivity; nonempty source edges map to finite paid executions. Cleanup is a separate
   paid physical path. No first-hit, global marker-uniqueness, or unconditional-validity claim.
3. Independent draft review pending.
4. Strict remote check and source/receipt binding pending.
