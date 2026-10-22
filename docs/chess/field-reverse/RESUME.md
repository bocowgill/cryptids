# Completed shorter-initializer checkpoint

Full accepted target: `Machines.chess_field_reverse : Machine 2904623 2`, with
`Semantics.ChessFieldReverse.halts_iff_not_draw` proving the unchanged original
not-drawn proposition in both halting directions. Total: 1,837,941 initializer
controls plus 1,066,682 unchanged body controls, saving 1,837,939 against 4,742,562.
The prefix pays 1,837,940 reverse leftward writes and one final preserving right
move. Its physical endpoint is −1,837,939; its relative tape is exactly the frozen
body input. All 2,550 prior tracked files remain fixed under baseline-pins.json.

Computation source: `9d51a19a9a098d17d48a6f37ba1afe96080c80ce` on fork branch
`codex/chess-openevolve-pilot`. Complete remote run `39770155131` succeeded.
`evidence/current/` permanently retains its official complete logs/artifact/API
packet, raw prefix/body transition streams and all seven passed phase receipts.
`evidence/history/machine-1/` retains the first successful strict proof run;
`evidence/history/full-1/` retains the first full run's line-length warning failure.
Only the warning formatting changed before the final successful full run.

New mathematical modules:

- `Cryptids/Chess/Optimisation/FieldReverse.lean`
- `Cryptids/Semantics/ChessFieldReverse.lean`

They instantiate the frozen reverse-schedule theorems on exactly FieldPacked.bits
and FieldPacked.body. They certify exact paid startup, full count, universal row
equality, strict reduction and both halting directions. The current exact source
hashes are bound in every phase receipt and the independent review binding.

New remote-only infrastructure: `scripts/chess_field_reverse/`,
`lakefile.chess-field-reverse.toml`, and workflow `chess_field_reverse.yml`.
The full run checked 5,809,246 actual state/symbol rows, all startup steps, six
generic edges, 202,100 source cases, sixteen native corruption controls, foundation
audit and false kernel contracts, plus prior compiler/chess regressions.

The independent advisory, exact source/evidence binding, receipt and seal live in
`evidence/review/`. `evidence/parent-replay.json` records the parent's separate
metadata-only positive, negative, portable and prior-evidence replays. Review
authority is model advisory, not human approval or formal verification by reviewer.
See RESULTS.md for exact controls, raw artifact hashes and evidence boundaries.

Safe local replay (saved metadata/hashes only):

```sh
python3 docs/chess/field-reverse/evidence/review/check_saved_evidence.py --self-test
python3 scripts/chess_field_reverse/verify.py --metadata
```

Do not run any Lean/Lake/LSP/LeanProbe, native exporter, machine model, fixtures,
simulation or state counter locally. If a substantive recheck is authorized,
push the intended source checkpoint to the fork and explicitly dispatch remotely:

```sh
gh workflow run chess_field_reverse.yml --repo bocowgill/cryptids \
  --ref codex/chess-openevolve-pilot -f target=full
```

Retain a new run in a new packet directory; do not overwrite this accepted current
packet or place files inside the previously sealed campaigns. Preserve the frozen
specification and toolchain. Use `[skip ci]` for documentation/evidence commits
and focused explicit dispatch for substantive checks. Outreach remains on hold.
No background search or later optimization campaign is running.
