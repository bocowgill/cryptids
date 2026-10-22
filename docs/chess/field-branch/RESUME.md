# Completed ret-s003 extension checkpoint

Fork: bocowgill/cryptids. Branch: codex/chess-openevolve-pilot. Successful full
remote run 39699849855 at computation 5277e624b154f1c7c8ceed704668a20a7819ef89.
The task is complete: the accepted return/main-pop path now executes ret s003
through its return to the marker and actual store-dependent branch. Results,
state inventory and limits are in RESULTS.md and results.json.

New source: Cryptids/Compilation/FieldBranch/{Graph,Certificate}.lean;
scripts/chess_field_branch/{verify.py,fixtures.py,Audit.lean,Export.lean};
lakefile.chess-field-branch.toml; .github/workflows/chess_field_branch.yml.
All prior return, continuation, backend, chess and toolchain bytes remain fixed,
bound by the 503-entry baseline-pins.json. The new graph has 675 states: old 425,
five paid connector gates, and 245 return controls including five final ports.
Final ports 478/527/576 represent normal3 with stores 0/1/2; ports 625/674 represent
the exact go rev(pushFn s002)s000 continuation with bit stores 3/4.
Neither outgoing successor body is implemented by this task.

FieldBranch.extended_certificate proves the complete actual source and binary
path under explicit finite ReturnPath/PopPath/ReturnPath and global RepTape
premises. Source cost n+m+k+4; binary cost the prior prefix plus 2+(37*k+24).
The successful remote packet has all five same-source phases, strict proof,
safe dependency audit, false contracts, native export, 73,822 replay cases,
all 675 controls and 14 rejected corruptions. One earlier strict-lint failure is
retained under evidence/history/attempt-1; accepted official packet evidence/current.
The advisory review/checker is evidence/review, with root replay in
evidence/root-check.json. Remote dispositions are recorded; no task jobs remain
active. Outreach stays held, and the frozen specification remains fixed.

Safe local checks only inspect hashes and saved metadata:

```sh
python3 scripts/chess_field_branch/verify.py --metadata
python3 docs/chess/field-branch/evidence/review/check_saved_evidence.py
```

Never run Lean, Lake, LSP, LeanProbe, native compilation/export, machine replay,
fixtures or state counting locally. If the nine computation files change,
commit/push the exact revision, dispatch chess_field_branch.yml with stage=full,
retain the completed official packet using evidence/retain_remote.py RUN_ID,
and renew source/evidence review bindings. Documentation-only changes need no
rebuild of unchanged sources. Use [skip ci] and explicit focused dispatch to
avoid redundant jobs. Git index mutations and network need sandbox escalation.

The complete chess count is still 390,491,642, with zero saving from this extension.
Before another implementation request, use FULL-MACHINE-PLAN.md: stop manually
following single labels as the primary strategy. The next recommended campaign
completes generic compiler families, assembles the entire frozen interpreter and
paid 13-bit initial tape, proves progress/simulation/both halting directions, and
certifies a complete numeric machine with total below 390,491,642. No reliable
calendar ETA is established; multiple substantial sessions and possibly days or
longer is a planning judgment. This checkpoint authorizes no later campaign.
