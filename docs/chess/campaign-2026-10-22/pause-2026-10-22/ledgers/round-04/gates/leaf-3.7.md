# Universal structured packet control semantics
OWNS: Cryptids/Compilation/TableSeed/Transducer.lean

- [ ] G1: A proof abstraction follows the actual typed readTarget/consumeEntry/emitTarget graph and proves complete valid packet processing for arbitrary bounded rows/pre/post, including zero/leading bits, reverse order and consumed bits; no abstract-halt-to-machine claim or free runtime operations.
  EVIDENCE: All prefix, operand, literal, row, and reversed-phase lemmas passed strict remote compilation. Final `packetRaw`, `packet_eq_header_raw`, and universal `packet_run` are saved in the owned source and independently source-reviewed, but their final remote check is pending. The final statement consumes all raw bits, produces exactly `letters pre rows post`, and reaches gap `1 + (packetRaw pre rows post).length`. Exact physical lifting stays separate.
- [ ] G2: Strict remote named proof build passes with complete universal valid-input theorem, no placeholders or extra axioms; retained source/command evidence provided.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target transducer
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Latest passed checkpoint is commit `f1aec68820cf7d393848cb5a89d33dd306709381`, run `39821587222`, iteration 1, strict named build exit 0 (12s). Receipts: `docs/chess/campaign-2026-10-22/round-04/evidence/transducer-compose-live-01/unpacked/transducer.json` and `commands/1792689713576884872.json`. This pass includes `reversed_rows_run` and all preceding declarations; it does not validate the subsequently saved final packet section.

## Paused checkpoint

The user requested a complete saved checkpoint and campaign pause on 2026-10-22. The source is frozen, with no further edits, repairs, or execution authorized until resume. G1 and G2 remain open because the final packet theorem has not yet passed remote Lean checking. The independent source review found the phase joins and exact gap accounting consistent, including empty pre/rows/post (mandatory separator output and gap 10). On resume, the next obligation is the strict remote `transducer` target for the complete saved source, followed only by any diagnostics-driven repairs and the separate physical integration gate.
