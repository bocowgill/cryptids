# Complete field-aware compiler checkpoint

This campaign is complete. The accepted full chess machine has **45,065,962
states**, including 3,675,880 paid initializer states. It saves **345,425,680**
against the frozen 390,491,642-state baseline. All 21 gates passed; none are
unmet or abandoned. The campaign's remote jobs finished; no outreach occurred.

Computation commit: `270d3e6aeb7258e1c9871077cf3e8e4f7d9fc53d`.
Official complete success:
[39722113405](https://github.com/bocowgill/cryptids/actions/runs/39722113405).
Later commits retain evidence and documentation without changing the computation
sources. Branch: `codex/chess-openevolve-pilot` in `bocowgill/cryptids`.

Read `RESULTS.md`, then `evidence/review/review.md`. Machine:
`ConjectureMachines.Machines.chess_field_aware : Machine 45065962 2`.
Theorem: `ConjectureMachines.Semantics.ChessFieldAware.halts_iff_not_draw`.
Its target remains `Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`;
the value of initial chess has not been determined.

Core implementation:

- `Cryptids/Compilation/FieldCompiler/`: finite syntax, global codec, operation
  lowering, all-row source correspondence, graph allocation and generic proofs.
- `Cryptids/Chess/Optimisation/FieldAware.lean`: complete interpreter, actual
  input, paid initialization, count and universal numeric row identity.
- `Cryptids/Semantics/ChessFieldAware.lean`: named machine and final statement.
- `scripts/chess_field_full/`: remote audit, native exporter, independent numeric
  fixtures, snapshot proposal generator and verification driver.

Local-safe metadata replay:

```sh
python3 scripts/chess_field_full/verify.py --metadata
python3 docs/chess/field-full/evidence/review/check_saved_evidence.py
```

The second command checks the sealed official packet and retained history; six
`--negative` modes demonstrate evidence rejection. No local Lean or machine
execution is needed. Root positive, negative, copied-folder and prior-checker
receipts are saved beside the accepted packet.

All substantive computation must remain remote. Use the focused
`chess_field_full.yml` workflow and `lakefile.chess-field-full.toml`; do not run
Lean, Lake, LSP, LeanProbe, native fixtures, simulations or counting locally.
The toolchain and 570 prior source/evidence pins remain fixed. Keep `ROADMAP.md`
and the frozen specification unchanged. Outreach remains on hold.

The next reduction opportunity is the uniform allocation: 106,668 meaningful
nodes plus 4,032,340 fully paid unused nodes. A future authorized campaign can
pack meaningful nodes with a proved allocator correspondence. Preserve this
machine as the complete regression case. After packing, consider the paid
initializer. No further optimization work was started by this campaign.

Implementation lessons: use the universally proved `Syntax.fastNodeAt`
replacement rather than executing recursive `Fin.lastCases`; keep the machine
phase receipt `machine.json` separate from the native `machine-export.json`;
compile the older shared fixture's `#eval` normally rather than with `--run`.
All failed attempts and their actual official dispositions are retained.
