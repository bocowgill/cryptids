# Universal structured packet control semantics
OWNS: Cryptids/Compilation/TableSeed/Transducer.lean

- [x] G1: A proof abstraction follows the actual typed readTarget/consumeEntry/emitTarget graph and proves complete valid packet processing for arbitrary bounded rows/pre/post, including zero/leading bits, reverse order and consumed bits; no abstract-halt-to-machine claim or free runtime operations.
  EVIDENCE: The complete `Transducer.packet_run` passed strict remote compilation. For every `pre post : List Letter` and `rows : List Row`, it gives a finite path from the first post-literal read entry on `packetRaw pre rows post`, empty output and gap 1 to `Entry.finish`, output exactly `letters pre rows post`, empty raw input and gap `1 + (packetRaw pre rows post).length`. `packet_eq_header_raw` identifies this raw suffix with the actual packet after its fixed header. Every path edge uses the existing typed source graph directly. Exact physical lifting remains a separate integration theorem.
- [x] G2: Strict remote named proof build passes with complete universal valid-input theorem, no placeholders or extra axioms; retained source/command evidence provided.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target transducer
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Complete-source strict named build passed at commit `dfb522af6c94a153c3f109dee8515d67751c9a2f`, remote run `39825511470`, iteration 3, exit 0; Lean target build 5.1s, recorded command elapsed 7.528164728999968s. Manifest: `docs/chess/campaign-2026-10-22/round-04/evidence/transducer-resume-live-03/unpacked/transducer.json`. Command receipt: `docs/chess/campaign-2026-10-22/round-04/evidence/transducer-resume-live-03/unpacked/commands/1792691703445972242.json`. The manifest records `Cryptids/Compilation/TableSeed/Transducer.lean` SHA-256 `e9d137490e2d6a41cb7fe13f3d1a6e523321e157cc472533649ca834413af041`; the owned source has not changed since that submitted checkpoint. Source review found no `sorry`, `admit`, `axiom`, `unsafe`, or `native_decide`. This receipt validates the named proof target; the campaign's official final provenance and full-machine acceptance gates remain separate parent obligations.

## Four review passes

1. Protocol: the raw suffix matches `Format.packet`; reversed literal and row streams restore original output order; the delimiter is emitted once and all three sentinels are consumed.
2. Universal domain: all tag values below 7 and operand values below 8192 are covered. The operand induction preserves whether the consumed MSB prefix is nonzero, skips leading zeros and emits the canonical zero word. Tag zero remains a valid row; only tag bits `111` terminate rows.
3. Boundaries: empty pre/rows/post produce the mandatory separator, empty raw input and gap 10. In general, the final gap includes exactly every consumed raw bit. Independent source review found no mismatch, and the complete theorem passed remote Lean checking after explicit terminal-entry and arithmetic normalization.
4. Integration: `Correct.frameCfg` has the identical entry/output/raw/gap interface, and its step lift uses the existing physical read/emission contracts. `Correct.packet_reaches_of_path` accepts this exact endpoint. The theorem remains a source-graph result until composed with that separately verified physical lift.

## Checkpoint history and handoff

The user paused the campaign on 2026-10-22 with the final packet section saved but unverified, then explicitly resumed from `fc16528`. The resumed remote session exposed a final normalization issue and then a deprecated lemma name; both were repaired only in the final proof. The third iteration passed the complete source. The source is now frozen at the recorded hash for parent integration; only this ledger was updated afterward. All Lean execution remained remote, with dispatch, Git, networking and evidence retention owned by the parent.
