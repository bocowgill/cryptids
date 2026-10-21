# Return-to-main-pop composition checkpoint

The requested composition is complete. Fork: `bocowgill/cryptids`; branch:
`codex/chess-openevolve-pilot`. Successful computation revision:
`4ee97f0289f7400f822022e67b6399a69715e949`; full remote run: `39677074188`.
Results and exact state inventory are in `RESULTS.md` and `results.json`.

The composed path starts at `SharedModel.stack0629` / `TM2to1.ret s000`,
executes the frozen return, dispatches actual `normal 2` / `RuntimeModel.s004`,
performs its main-stack pop, and ends on arrival at `ret RuntimeModel.s003`.
`FieldContinuation.composed_certificate` proves the actual source and binary
executions reach corresponding successor configurations. Its explicit premises
are finite `FieldReturn.ReturnPath` and `FieldContinuation.PopPath` witnesses
and global `RepTape`. Source cost: `n+m+3`; binary cost:
`37*n+26+23*m+(if markedEmptyGap then 34 else 61)`.

The remote native export contains 425 states, including all 245 old return
states, 180 new states, every connector and five final successor ports.
Final ports 404/409/414/419/424 represent `ret s003` and stores 0–4.
Execution of that successor is the next integration boundary and has not been
implemented by this task. Its label can first be audited against the frozen
runtime, then connected with another explicit composed certificate and complete
state inventory if requested. No later work or outreach is authorized here.

Source files: `Cryptids/Compilation/FieldContinuation/{Graph,Certificate}.lean`;
`scripts/chess_field_continuation/{verify.py,fixtures.py,Audit.lean,Export.lean}`;
`lakefile.chess-field-continuation.toml`;
`.github/workflows/chess_field_continuation.yml`.
Accepted return and backend sources are unchanged. The 406-entry pin manifest
also freezes the prior chess specification, compiler, toolchain and evidence.
The accepted full chess machine remains 390,491,642 states.

All five successful remote phases share the same nine computation hashes.
Strict proofs, trust audit, negative contracts, export, 55,072 replay cases,
nine corruption controls and complete count accounting passed. Five earlier
proof-development failures are retained under `evidence/history/attempt-1`
through `attempt-5`. The official accepted packet is `evidence/current`.
Remote dispositions are in `evidence/run-dispositions.json`; no task jobs remain
active. The advisory R1/R2 review and sealed portable checker are in
`evidence/review`; root replays are in `evidence/root-check.json`.

Safe local checks inspect hashes and saved metadata only:

```sh
python3 scripts/chess_field_continuation/verify.py --metadata
python3 docs/chess/field-continuation/evidence/review/check_saved_evidence.py
```

Do not run Lean, Lake, LSP, LeanProbe, native compilation/export, machine replay,
fixtures or state-count computations locally. Heavy work stays remote. If the
nine computation files change, commit and push the exact candidate, dispatch
the focused `chess_field_continuation.yml` workflow with `stage=full`, retain
the official completed packet with `evidence/retain_remote.py RUN_ID`, and
renew review bindings. Documentation-only commits do not require rebuilding
unchanged certified sources. Use `[skip ci]` and explicit focused dispatch to
avoid redundant generic builds. Git index mutations and network operations
require sandbox escalation in this worktree.

Outreach remains on hold. The frozen reference remains fixed. No full chess
machine recompile, state saving or new full-machine halting theorem is claimed.
