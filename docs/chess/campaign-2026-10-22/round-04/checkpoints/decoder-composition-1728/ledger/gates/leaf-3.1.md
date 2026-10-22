# Original-word and packet semantics
OWNS: Cryptids/Compilation/TableSeed/Format.lean

- [x] G1: Complete source satisfies PROOF-PLAN.md, without placeholders or accepted-file edits; four adversarial passes and interface review recorded.
  EVIDENCE: The first source block at `f882aa8` defines bounded `Row`, the actual original
  `W := (trList [value]).map Seed.ofSymbol`, and guarded `W_bit` through the pinned Num APIs.
  Later local definitions freeze the approved `fixedBits`, `readValue`, `tagBits`, `fieldBits`,
  `rowBits`, `rowLetters`, `header`, `packet`, and `letters` interfaces. No placeholders.
  The next small source block adds generic fixed-width length/value proofs via division by two
  and `Nat.bit_bodd_div2`, then specializes the field theorem to `Fin 8192` without enumeration.
  The final source block supplies the explicit MSB head theorem, symbolic packet length,
  arbitrary-prefix word step, actual `trList` triple identity, and literal/row reversal identities.
  Source passes 1–3 cover the frozen packet protocol, original canonical natural words including
  the guarded zero case, and bounded MSB fields plus prepend order. Independent final pass 4
  found no semantic defect or missing mandatory pure contract: arbitrary base is preserved,
  the guarded step matches optional emission, fields retain fixed width and original value,
  triple words use actual `trList`, and all three sentinels enter the count. Root approved the
  definition interface, which was shared with the controller leaf. The same-source remote
  recheck is recorded separately under G2.
- [x] G2: Strict remote Lean build of this module passes with warningAsError, unchanged accepted pins and retained exact source/command receipts.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target primitives
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Strict combined run `39813644432`, iteration 2 at
  `9b50904c694d2a8f616fb94cf33e29e892917c17`, built Format in 2.3 seconds with exit 0.
  The pre-final-block local Format SHA256 was verified against the remote source manifest:
  `17d217dac91fe2ad17a3e53a2c64f196ca6f0062ea13173fd99bbfc9f16c3e15`.
  That intermediate pass certified guarded `W_bit`, packet definitions, and generic
  `fixedBits_value`. Final strict combined run `39815250484`, iteration 3 at
  `fe5ad6f5f68d3652c4199b07ba41dbbccab9d889`, built the complete Format in 1.7 seconds;
  the command and session both returned exit 0, without warnings or a timeout.
  Current Format SHA256 equals the retained source manifest exactly:
  `7e55858fff8c88367f8dd7fa922d0f6032944fd78876482fcd05e1430ad5f5a0`.
  The inspected wrapper checks every accepted pin before invoking `lake --wfail`; its
  `primitives.json` status is `passed` and explicitly reports `new_accepted_machine: false`.
  Exact command receipt:
  `/tmp/chess-table-primitives-39815250484-3/commands/1792687295874149406.json`.
  Output SHA256: `bbb3022818ab9935d9db793684346a33ebc95632efbf9c9e0991624b0aa1aee8`.
  No Format source changes after this verification; root owns durable ZIP retention and the
  final GitHub job-status check, as well as all downstream full-machine acceptance.

First remote run `39813062936` at `f882aa8` reported only the false/zero branch of
`numWord_bit`: simplification left `Num.zero ≠ 0` without discharging its definitional
contradiction. The repair explicitly splits the guard, applies the nonzero assumption to
`rfl`, and eliminates the impossible Boolean equality. No other diagnostic was reported.
The corrected recurrence, shared definitions, and generic fixed-width value block passed the
combined run above. Root explicitly permitted that next small generic field block after repair.
The retained passing command is
`/tmp/chess-table-proof-session-39813644432-2/commands/1792686576915970534.json`;
root retains official acceptance and durable evidence promotion.

Final-block check `39815250484`, iteration 1 at `e959201`, reported only a deprecated
`if_neg` name and the actual-triple proof's missing `List.nil_append` simplification (with an
unused `List.append_nil`). The repairs replace those exact names; no theorem or definition
changes. All other final-block proofs had no diagnostic. The final strict retry above passed.

Leaf ledger: 2 met, 0 unmet, 0 abandoned. This certifies only the pure original-word and packet
format leaf; it does not establish a new machine saving or the decoder's tape-execution theorem.
