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
  is recorded separately under G2. Accepted source and controller files are unchanged.
- [x] G2: Strict remote codec build verifies exact letter identity, packet length173641 and paid writer length173642 using existing certified source data.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target codec
  EXPECT: Structured decoder proof target passed
  EVIDENCE: The first coherent generic block passed strict remote session `39819742050`,
  iteration 1 at `733a2fe`, building ChessCodec in 8.4 seconds with exit 0 and no timeout.
  Inspected command receipt:
  `docs/chess/campaign-2026-10-22/round-04/evidence/codec-proof-live-01/unpacked/commands/1792688917051463430.json`.
  Output SHA256: `1f21ce69982fe276bd2fe072c959a7b6f2d1dafc9d2a535daf35015158ca4feb`.
  That source predates the complete concrete additions at `5acb1ff`, so that pass alone
  did not close G2.
  Complete-codec session `39820664426`, iteration 1 at `850908e`, returned exit 1 after
  9.0 seconds: `prefix` was parsed as a reserved token in `mapped_input`, causing the
  downstream theorem reference to be unknown. No other diagnostic was reported.
  Inspected receipt:
  `docs/chess/campaign-2026-10-22/round-04/evidence/codec-complete-live-01/unpacked/commands/1792689332352759497.json`.
  The minimal repair renames only that binder and its two occurrences to `initialWords`;
  the mathematical statement and proof are unchanged.
  The complete corrected codec passed session `39820664426`, iteration 2 at
  `f1aec68820cf7d393848cb5a89d33dd306709381`: strict named `lake --wfail` build exit 0,
  ChessCodec 3.3 seconds, no warning or timeout, and `Build completed successfully`.
  Inspected final command receipt:
  `docs/chess/campaign-2026-10-22/round-04/evidence/codec-complete-live-02/unpacked/commands/1792689540829846274.json`.
  Output SHA256: `22f0cfbdc6a9d101eb465f5d5cb20b6e4ce17780f027d3d048c4c3b7044d5a02`.
  Current ChessCodec SHA256 matches the retained `source-manifest.json` exactly:
  `63f41f7bac001988fc60688ef291f275cc10e603eb10c54663670ada1595ad7e`.
  The matching `codec.json` reports `status: passed`, target `codec`, and
  `new_accepted_machine: false`; its scope explicitly keeps universal/full-machine
  gates separate. Source remains fixed after the matching metadata check.

Leaf ledger: 2 met, 0 unmet, 0 abandoned. Exact chess letters, the 173641-bit packet,
and the 173642-state paid writer are kernel-verified. This leaf makes no accepted
full-machine count or saving claim.
