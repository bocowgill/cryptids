# Completed field-aware binary pilot checkpoint

Fork: `bocowgill/cryptids`; branch: `codex/chess-openevolve-pilot`.
Computation commit: `aec53614962607635789060f51c4576bdcdc00b0`.
Successful full remote run:
[39621322042](https://github.com/bocowgill/cryptids/actions/runs/39621322042).

The requested routine pilot is complete. The standalone certified counts are:
reads39/66/93/120; constant writes5/11/17/23; movement14 in either direction.
Every exit is charged. Four fields occupy offsets0/3/6/9 of a thirteen-bit cell;
bit12 is the marker. Arbitrary-tape preservation, valid-cell refinement and exact
execution to decoded numeric exits are universally proved. All38 emitted binary
machines passed311296 independent cases over8192 raw cell patterns and nonblank
neighbours, plus six corruption controls. Strict compilation, native dependency
audit and all false-theorem controls passed. See [RESULTS.md](RESULTS.md),
[results.json](results.json), [REVIEW.md](REVIEW.md) and
[root-check.json](evidence/root-check.json).

No new full chess machine was constructed; the accepted total remains390491642.
Legacy211410/82000/110 figures are allocator sensitivities with overlapping
families and different scopes, not standalone routine counts or additive
replacement savings. Dynamic write dispatch, marker operations and a complete
simulation of actual interpreter primitives remain future integration work.
Do not claim these were implemented or extrapolate a global saving ratio.

Preserve all237 entries in baseline-pins.json, including the frozen chess
reference, accepted source, toolchain and prior review bindings. All pilot changes
are separate. No local Lean/LSP/LeanProbe/Lake, native, fixture, model or machine
execution: all heavy work stays remote. Local edits, hashes and saved-output
checks are permitted. Outreach and upstream writes remain on hold.

The full accepted run is source-bound by five matching phase maps. Original
failed attempts and logs are retained under evidence/history. A cancelled duplicate
39608526061 used the old e3c6617 source because a Git-index permission failure
prevented publication of repairs; it is not new proof evidence. Later Git changes
use escalation for the index outside the writable checkout. The independent
referee's audit-control ordering finding was repaired before accepted computation.

Remote reproduction workflow: chess_field_binary.yml with stage=full. A new run
is not needed to finish this completed pilot. Inspect existing jobs before
starting another. Heavy full-chess integration is a separate next task; the most
useful first extension is one actual Runtime primitive with all caller/return
controls and the required marker operations, then a checked end-to-end simulation.

Local-safe receipt replay:

```sh
python3 docs/chess/field-binary/evidence/check_evidence.py
python3 scripts/chess_field_binary/verify.py --metadata
```

The private acceptance ledger has six root gates and two review gates at
.unlazy/chess-field-binary. Final measured counts are recorded in the root receipt.
