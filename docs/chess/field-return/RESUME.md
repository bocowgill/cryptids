# Field-aware interpreter return checkpoint

Fork `bocowgill/cryptids`, branch `codex/chess-openevolve-pilot`.
The implementation is separate from all326 pinned accepted files. Frozen chess,
prior field backend, accepted compiler, toolchain and prior review stay fixed.
No outreach, later primitive, full chess recompilation or model search is authorized
by this task. Keep all Lean/Lake/LSP/LeanProbe/native/fixture/count execution remote.

Target: actual SharedModel.stack0629, the TM2to1 return shuttle for RuntimeModel.s000.
The binary capsule has five store blocks of49 numeric controls and five counted
continuation ports included in245 total. The source continuation is normal label2.
Its integration boundary is explicit; this is not a new blank-tape chess machine.
The accepted full chess count remains390491642.

Universal contracts: iteration_refines, return_refines, source_return and
return_certificate in Cryptids/Compilation/FieldReturn/Certificate.lean. The final
certificate joins bounded execution of the actual source with execution of the
cyclic binary capsule and a decoded continuation configuration over the entire tape.
For a marker n source cells left, source takes n+1 steps and binary37*n+24 steps.

The task is complete. Successful full remote run39663260946 at computation
source a54a0823d7da7461c4b2c44998ff79f251e9b07e passed strict proofs, native trust
audit, export,56585 independent cases, all245 controls and six corruption tests.
All five phase receipts share eight computation and326 frozen source hashes.
See RESULTS.md and results.json. The three failed proof-development probes are
retained under evidence/history/attempt-{1,2,3}. No rerun is needed to finish this
primitive. Further integration is a new task.

Remote reproduction workflow: chess_field_return.yml with stage=full. Root gates:
.unlazy/chess-field-return/GATES.md. Fresh-context advisory source review repaired
the missing full source/port assembly and pin-selection issues. Final review,
sealed source binding and portable metadata-only checker are under evidence/review.
Root replays and acceptance totals are in evidence/root-check.json. Review advice
is separate from the formal Lean evidence. The local-safe verification commands are:

```sh
python3 scripts/chess_field_return/verify.py --metadata
python3 docs/chess/field-return/evidence/check_evidence.py
python3 docs/chess/field-return/evidence/review/check_saved_evidence.py
```

These read saved outputs and file hashes only; none executes a proof or machine.

Git index is outside writable checkout: use escalation for git add/commit/push.
Use [skip ci] on checkpoints, then dispatch focused workflow explicitly. Do not
relaunch stale source after a failed index mutation; inspect each result first.
The only initially triggered generic and M6 jobs were cancelled as redundant.
