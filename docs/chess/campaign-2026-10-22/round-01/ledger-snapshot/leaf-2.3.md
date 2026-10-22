# Graph write-destination coverage
OWNS: Cryptids/Compilation/FieldReturns/Graph.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.3.md

Scope: Abstract graph write coverage from primitive write-child/entry/halt support, then CompactPost universal coverage. Independent of concrete syntax layout.

- [x] G1: Complete source implements generic coverage contract with no placeholders.
  EVIDENCE: Cryptids/Compilation/FieldReturns/Graph.lean contains trAux_write_covered and compact_write_covered. Source-only four passes complete: (1) every primitive constructor and pure recursive constructor handled; (2) abstract descriptor predicate then encoded-control predicate, no concrete syntax dependency; (3) checked updated store after loads, both branch outcomes/scanned bits, shared halt versus live halt node, missing halted row, and strict descent for every recursive call; (4) documentation distinguishes universal structural coverage from finite evidence. No local Lean, LSP, Probe, Lake, native, model or count execution. Parent review and remote kernel gate remain separate.
- [ ] G2: Strict remote Lean build passes.
  EVIDENCE: First remote graph39776806488 failed only because branch case analysis lacked a named equality for simplifying the command and goal. Source repaired to retain `test : table.read bit value`; next remote receipt pending. No local Lean execution.
