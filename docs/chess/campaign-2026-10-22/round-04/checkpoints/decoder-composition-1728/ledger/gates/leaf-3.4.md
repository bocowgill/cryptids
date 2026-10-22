# Compact output language and framed scans

OWNS: Cryptids/Compilation/TableSeed/Scan.lean

- [x] G1: Universal arbitrary-frame scan lemmas match the specified controller operations;
  four source passes, no new axioms or placeholders, and no accepted source edits.
  EVIDENCE: Complete source and four reviews below; the exact source passed remote Lean checking.
- [x] G2: Strict remote named build passes with exact source and command evidence;
  physical machine row integration remains separate.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target scan
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Run `39816368927`, iteration 1, commit `c0be393f574c785ba0e352df98f3f78f1ed2c20d`;
  successful focused receipt and hashes below.

Status: 2 met, 0 unmet, 0 abandoned. Source held fixed after successful verification.

## Final remote evidence

- Receipt: `docs/chess/campaign-2026-10-22/round-04/evidence/scan-proof-live-01/unpacked/scan.json`.
- Receipt status: `passed`; target: `scan`; `new_accepted_machine: false`.
- Run: `39816368927`; exact commit: `c0be393f574c785ba0e352df98f3f78f1ed2c20d`.
- Strict command: `lake --wfail -f lakefile.chess-table-proof-20261022.toml build`
  `Cryptids.Compilation.TableSeed.Scan`.
- Command exit: 0; no timeout; output reports the named Scan build in 5.4 seconds and
  `Build completed successfully (3817 jobs).`
- Command output SHA-256:
  `dded3aa9f790e4a576677e1415653b0e91480573759d0d3cdd8b233a42d2a02a`.
- Scan source SHA-256, matching the receipt and the unchanged current file:
  `a1768db7f1ad55a9aedf05e3896fa90f4afddb3baf753d83a0f532a97839034c`.
- Receipt SHA-256:
  `1ad288cf1e559a3c258d11693987da8159582d689392c6633d4d104ef9e8170e`.

This is a successful focused strict build of the complete generic scanner leaf. The physical
machine's row instances, composed universal decoder, numeric correspondence, full dependency
audit, and full-machine acceptance remain separate root integration work. No local Lean,
LSP, Probe, generator, model, test, or state-count execution was performed.

## Exposed contracts

The file imports only accepted `Seed.Scan` and `Seed.Format`.

- `word_forward`, `payload_forward`: arbitrary compact payloads preserve counter at most one.
- `word_reverse`, `payload_reverse`: reversed compact payloads preserve counter at most two.
- `append_zero`, the payload guard lemmas, and gap lemmas: a boundary zero resets a safe run;
  a nonempty gap resets the required arbitrary initial counters. Empty gaps are handled by
  the marker's leading zero where the theorem permits them.
- `left_marker`, `right_marker`: machine-parametric exact executions under the caller's
  `Seed.Scan.Rows`, preserving arbitrary exterior ListBlank frames.
- `payload_left_marker`, `payload_right_marker`: compact-output specializations with lengths
  `gap + 3 * letters.length + 5` and `3 * letters.length + gap + 5` respectively.

The left contract starts after the caller's paid `1L` and lands at A's left zero. The right
contract lands at B+5 before the caller's paid `5L`. No controller state, row instance,
allocation change, global marker uniqueness, or uncharged move is introduced. The exact-run
statements do not assert first arrival for arbitrary state embeddings, which may alias states.

## Four completed source-review passes

1. Protocol and bounds: checked the actual compact words `100,010,110,001`, their forward
   terminal counters `0,0,0,1`, and reversed terminal counters `1,0,2,0`. Checked the tight
   forward≤1 and reverse≤2 bounds and the distinction between empty and nonempty zero gaps.
2. Universal induction: independently reviewed forward head-first and reversed tail-first
   payload induction, final-zero resets, and nonempty-gap resetting of arbitrary initial counters.
3. Framed execution: reviewed exact Reads/shift decomposition against accepted Seed.Scan APIs
   and the proof plan's paid paths, with arbitrary complete left/right frames.
4. Independent adversarial pass: `compact_scan_review` found no defect in either generic wrapper
   or compact-payload specialization, including empty payloads, zero gaps, marker orientation,
   A's left guard, B+5, and scanner-only step counts. This was source review; the separate
   remote receipt above supplies kernel elaboration and strict build evidence.

## Retained development history

- Session `39813644432`, iteration 1, commit `8500f41`: initial finite word proofs failed only
  because `omega` did not normalize impossible `Fin.val` bounds after `fin_cases`. Repaired
  with `norm_num at bound` before kernel `decide`; theorem statements were unchanged.
- Session `39813644432`, iteration 2, commit `9b50904`: initial word block passed its strict
  named Scan build (1.9 seconds); combined primitives command exit 0.
- Session `39815250484`, iteration 1, commit `e959201`: payload/gap block passed its strict
  named Scan build (1.5 seconds). The combined command exited 1 only on separate Format errors;
  no combined success is claimed for that intermediate attempt.
- Session `39816368927`, iteration 1: the complete final source, including all framed wrappers,
  passed the focused strict command bound above. Scan has not been edited since this success.
