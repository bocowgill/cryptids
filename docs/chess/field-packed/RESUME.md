# Completed padding-elimination checkpoint

The complete binary blank-tape chess machine has **4,742,562 states**, saving
**40,323,400** from the accepted **45,065,962**. Every actual syntax node is
retained; all graph padding is removed. The frozen chess specification and all
2,393 previous tracked files remain unchanged. Outreach remains on hold.

Named machine: `ConjectureMachines.Machines.chess_field_packed`.
Theorem: `ConjectureMachines.Semantics.ChessFieldPacked.halts_iff_not_draw`:
`Halts machine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.
This does not determine chess's value.

Certified allocation: 106,668 graph nodes; all five stores plus one shared halt
make 533,341 Post controls. Both binary blocks total 1,066,682 body states. The
unchanged 1,837,940 input bits pay 3,675,880 initializer states. Total 4,742,562.

Official complete successful remote run39727629533, computation commit
`7c43454a01201ea122f9769ec751c0582aacc692`. The retained official packet is
`evidence/current/`, with nine passed phases, 30 command receipts and 48 entries.
All Lean/Lake, native compilation/execution, machine simulation and counting
were remote. Every body state on both bits was independently checked: 2,133,364
rows. Complete initializer replay, 202,100 source cases, eleven intended
corruptions, safe proof closure, false kernel contracts and old regressions pass.

Fresh complete-candidate model advisory: `evidence/review/` (correct, no fatal
error or missing premise; model advisory only, not human approval). Root promoted
all six sealed files byte-for-byte. Positive, self-test, six individual tampering
controls, separate copied-directory replay, old accepted checker and frozen-file
metadata all pass; exact receipt is `evidence/parent-replay.json`.

Read `RESULTS.md` for exact accounting and validation scope, `CONSTRUCTION.md`
for the proof mechanism, and `evidence/review/review.md` for the advisory.
Development history retains all seven earlier packets with actual dispositions.
The first complete source run passed the theorem but failed its negative padding
control on a recursion limit; the final corrected control rejects the old padded
node count for its mathematical reason. It is not mislabeled as a successful run.

Branch `codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`.
New implementation paths: `Cryptids/Compilation/FieldPacking/`,
`Cryptids/Chess/Optimisation/FieldPacked{Layout,}.lean`,
`Cryptids/Semantics/ChessFieldPacked.lean`, `scripts/chess_field_packed/`,
and new Lake/workflow configurations. No old accepted path was changed.

Local-safe replay (hashes/saved metadata only):
```sh
python3 scripts/chess_field_packed/verify.py --metadata
python3 docs/chess/field-packed/evidence/review/check_saved_evidence.py --self-test
```

Remote-only reproduction:
```sh
CHESS_REMOTE=1 python3 scripts/chess_field_packed/verify.py --target full
```

Do not run Lean/Lake/LSP/LeanProbe, native code, generators, machine simulations
or machine counting locally. No new optimization or outreach is underway.
