# Exact concrete chess packet codec
OWNS: Cryptids/Compilation/TableSeed/ChessCodec.lean

- [x] G1: Concrete pre/rows/post reconstruct the exact frozen chess stack, preserve every row and bound without modulo/clamping, and account for every packet/writer bit. No accepted sources change; four source passes complete.
  EVIDENCE: Complete source draft uses `nodeToRow` with direct `Fin.mk` operands and the
  seven canonical source tags. Generic `array_below` derives all bounds from topology and
  size; `source_below` instantiates the existing `SourceCertificate.dag_valid` and
  `rows_size` certificates. `List.pmap` preserves original row order. Generic
  `nodeToRow_letters`, `nodes_letters`, and `mapped_input` establish exact original-word
  and separator fidelity before concrete instantiation. `letters_eq` finishes by explicit
  transport of `Input.stack_eq_raw`; it does not normalize the complete concrete stack.
  The packet length uses certified root14, argument323 and row5952 lengths, then the
  verified symbolic `TableSeed.packet_length`. The paid writer includes its turn via
  the existing generic `Seed.ChessCodec.counted_schedule` theorem.
  Passes 1–3 cover constructor/operand fidelity, original words and delimiter/order, and
  counts/definitional-conversion risks. Independent fourth source pass found no semantic
  defect or new large-normalization trigger: only small aliases bridge the exact word
  theorem, all counts stay symbolic until tiny arithmetic, and the existing generic
  schedule theorem avoids the prior concrete schedule-conversion failure. The review
  found no placeholders, new assumptions, modulo/clamping, or frozen-source changes.
  No local Lean, models, generators, counts or tests were executed; remote verification
  remains pending separately under G2. Accepted source and controller files are unchanged.
- [ ] G2: Strict remote codec build verifies exact letter identity, packet length173641 and paid writer length173642 using existing certified source data.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target codec
  EXPECT: Structured decoder proof target passed
  EVIDENCE: pending

Leaf ledger: 1 met, 1 unmet, 0 abandoned. Source readiness is not a remote proof receipt,
and this leaf makes no accepted full-machine count or saving claim.
