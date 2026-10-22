# Native complete selective exporter
OWNS: scripts/chess_goal_20261022/Export.lean, lakefile.chess-goal-20261022.toml, .unlazy/chess-goal-20261022-r01/gates/leaf-2.5.md

Scope: Native complete actual machine/rowMachine exporter using frozen input, all prefix/body rows, exact return layout. Only local source edits; execution remote by root.

- [x] G1: Complete source and four-pass review against agreed extraction format.
  EVIDENCE: Source draft in scripts/chess_goal_20261022/Export.lean and lakefile.chess-goal-20261022.toml; manually reviewed below. Parent review remains separate.
- [x] G2: Remote actual-artifact full validation passes on exact source.
  EVIDENCE: Successful run39780889172 iteration4 at2dfa3a7656de3f15a0bbda387d6f0642328e6d08; native export command1792673927903612955 exit0 with Selective native export passed. Full independent fixtures command1792673961284055501 exit0. All saved final source hashes matched locally; evidence/final retains official ZIP/API/logs and all20 complete command receipts. Parent source review and complete table/count receipt inspection passed. No local model execution.

## Four source passes

1. Complete: copied the accepted exporter into a new module and retained every actual
   prefix/body transition, actual/rowMachine comparisons, initializer replay, generic
   edge cases, frozen source syntax/getter export and source input encoding.
2. Expert: reflected the return count from the actual function domain; exported all
   returnAt destinations and per-row targets/offsets; checked actual balanced offsets
   against row prefix sums and every returnAt/findReturn inverse at runtime.
3. Defect: inspected raw versus encoded Post indices, entry/store return lookup,
   shared-halt return zero, final return boundary, full state bounds, both symbols,
   missing body transitions, initializer physical offset, and preservation of all
   old helper bodies. No hardcoded smaller machine replaces the actual machine.
4. Polish: confirmed the new schema and payload with the fixture owner, confirmed
   returnAt/findReturn/offset APIs with the concrete layout owner, retained pinned
   toolchain configuration, and made remote GitHub Actions a runtime requirement.

Final remote extraction passed. Full-machine acceptance additionally requires the
independent complete-candidate review and sealed parent replay.
