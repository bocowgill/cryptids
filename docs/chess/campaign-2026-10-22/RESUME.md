# Chess compression campaign — resumed by user, 2026-10-22

**User explicitly resumed the existing campaign from checkpoint fc16528.**
The immutable pause snapshot remains in `pause-2026-10-22/`; the current handoff
continues below. Goal tooling now confirms **active** (17:59 UTC observation); automatic goal
continuation has resumed under the user's hard wind-down deadline.
Resource exhaustion did not cause the earlier stop.
The optimization goal is not complete. Latest observed account usage was41% used at18:16UTC; no agent-initiated reset
occurred. Usage readings have changed sharply; checkpoint throughout.

## Hard stop for this resumed run

User requested graceful wind-down **by 2026-10-22 16:15 America/New_York**
(**20:15 UTC**), preferably earlier at a useful checkpoint. Their hard stop is
16:25 Eastern. Stop launching substantial work by15:45 Eastern (19:45 UTC),
begin shutdown/checkpoint by16:00 (20:00 UTC), stop workers and remote jobs,
retain diagnostics and save/push a clean handoff, then mark the goal paused.
Do not consume the remaining usage past this deadline. An early stop is appropriate
if the goal is achieved or a useful recoverable checkpoint is reached. A resource
or time stop is not proof of global minimum or successful campaign completion.

## Accepted machine and exact objective

`ConjectureMachines.Machines.chess_seed` has **998,176 states**. The Lean theorem
`ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw` proves both directions:

`Halts M ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.

| Paid component | States |
|---|---:|
| Input writer, including final turn | 424,157 |
| Complete seed expander | 216 |
| Exact-head bridge | 1 |
| Interpreter main controls | 533,341 |
| Interpreter return controls | 40,461 |
| **Complete accepted machine** | **998,176** |

Accepted saving during this goal: **1,906,447** from 2,904,623. Round 01 saved
492,880 and round 02 saved 1,413,567. **No later reduction is accepted.**

Round 02 official run39797909133 iteration4, computation780ad59e871a47d76726a5c81800af3e48bda188,
workflow7e32af8294ca8052c88852518508c0e6ecd5bcf4, artifact12433769822.
All1,996,352actualrows, strict universal/public Lean, safe axiom closure,
88complete startupfixtures,465controllerfixtures,34corruptions and regressions
passed. Fresh advisory, external seal,45hostilemetadata controls and portability
passed. `round-02/RESULTS.md`, `evidence/final/` and `review/` are immutable.
All35acceptance gates met. CheckerSHA5e148cacf6a852cc899eaf1fff3e6fb7ad5d5f4451e1fbe53e982a7461465557.

## Requirements on resume

- Frozen chess specification/conjecture, accepted sources and sealed evidence stay
  fixed. `accepted-998176-pins.json` has2,983immutable entries.
- ALL Lean/Lake/LSP/LeanProbe, native compilation/execution, models, generators,
  simulations, synthesis, fixtures and machine counting remain **remote only**.
  Local source editing and saved metadata/hash inspection are permitted.
- No outreach, upstream issues/comments/PRs/messages. Fork checkpoints authorized.
- Prioritize large complete-machine savings; maintain the breakdown and ranking
  in `STATE-COUNTS-AND-OPPORTUNITIES.md`. Count every control and bridge.
- Never simulate the full quadratic141380symbol startup. Use universal execution
  proofs plus exact complete input identity.
- Accept no new best until strict full-machine Lean, exact full export/count,
  independent fixtures/corruptions, safe audit, fresh advisory, official provenance,
  seal and parent replay all pass.
- Root owns Git/network/remote dispatch/retention; workers use disjoint files.

## Ranked unfinished reductions

| Route | Prospective full count | Measured saving | Remaining difficulty |
|---|---:|---:|---|
| Whole-body quotient | 538,861 | 459,315 | Concrete kernel scalability and all actual transition rows; highest absolute opportunity. |
| Structured initializer | 769,344 | 228,832 | Complete theorem passed; full export, independent checks, audit and acceptance underway. |
| Both, conditional on both complete certificates | 310,029 | 688,147 | Combination must itself be certified and counted. |

Structured candidate accounting:173642writer +21682decoder +1newbridge +216old
expander +1oldbridge +573802body =769344. These are **candidate counts**, not
accepted machines. Dictionary/arity/tiny-controller extensions remain deferred.

## Round 03: current quotient obstruction

Finite whole-body pilot39795919458 at8cd145e checked all1,147,604old rows and
228,974quotient rows, with114487classes. This remains finite evidence only.
No concrete actual-body row has yet been kernel-certified.

Resumed trial09 run39825520233 atfc16528 completed/failure. Complete raw-Nat map
build passed22.259s/3,234,848,768bytes and full-private audit passed3.237s/
4,275,249,152bytes. Executable typed quotient128shards exceeded6GiB after142.458s:
6,486,990,848bytes. A94,802,768byteolean was produced but is NOT a successful
stage. Total188.792s; no quotient audit, fullData, actualRows or negative stage.
Official evidence is retained in `round-03/evidence/certificate-09`.

A bounded packed-Nat transition representation pilot is now authorized, retaining
complete kernel range and decoder-fidelity obligations, the original1200seconds/
6GiBcaps, all actual-row checks and meaningful negatives. Root dispatches only
when source is ready. Independent raw-code roundtrip must bind original quotient
rows; modulo targets cannot substitute for a bound proof. Structural/local-slot
certificates remain alternatives if actual-row checking becomes the obstruction.
Every older failed/cancelled trial remains retained in CERTIFICATE-PILOT.md.

## Round 04: source and proof state

Finite packet census39807083846 at6b2e120 and physical controller pilot39810577763
at0afbd2a passed. Complete controller:21682states,43364rows,4626blocks;66complete
fixtures/10corruptions. Source/pilot bytes remain fixed.

| File in `Cryptids/Compilation/TableSeed/` | Exact status |
|---|---|
| `Format.lean` | Complete strict pass39815250484 iteration3fe5ad6f. Original words, fixed fields, ordering, packet length. |
| `Controller.lean` | Complete; final target39821642854 atf1aec68 strictly builds/exports and matches all43364rows with28corruptions rejected. Read/emit row views checked. |
| `Geometry.lean` | Complete strict9b50904 pass; exact arbitrary-frame consume/prepend/header tape equalities. |
| `Scan.lean` | Complete strict39816368927 atc0be393; generic framed marker scans. |
| `Blocks.lean` | Complete strict39821625026 atf1aec68,6.2s. Actual paid entry/read/emit/finish and Reaches contracts, no assumed free controls. |
| `ChessCodec.lean` | Complete strict39820664426 iteration2f1aec68,3.3s. Exact frozen letters and173641packetbits/173642writerstates using existing certified row bounds. |
| `Transducer.lean` | Through literal/row/reversed-phase composition passed39821587222 atf1aec68,12s. **Complete final packet theorem passed strict39825511470 iteration3 atdfb522a (5.1s).** |
| `Correct.lean` | Conditional lift reconciled; **unconditional `packet_reaches` passed strict39827508136 iteration1 at7c477f3 (5.0s)**. Exact entire tape/head decoder theorem has no Path premise. Official evidence is retained in correct-unconditional-final. |

Required final packet signature:
`Path ⟨.read (.literal 0 0), [], packetRaw pre rows post, 1⟩`
`     ⟨.finish, letters pre rows post, [], 1+(packetRaw pre rows post).length⟩`.

`Correct.packet_reaches_of_path` already composes actual entry/path/finish, but
explicitly assumes that source path. The new `Correct.packet_reaches` discharges it
using the verified finalpacket theorem and has passed strict remote checking.

`ControllerExport.lean` / `controller_compare.py` are complete and fixed. Their
finite correspondence is separate from universal execution and full acceptance.
Exact source hashes, receipts and former ownership are in the pause snapshot.

## Current complete-machine check and next concrete actions

Full `FieldTableSeed` / public `ChessTableSeed` passed strict remote build
39828692045 iteration1 at e40aeef1e377910e1f86fd31c717c18b1729458c (15.027s).
Official `round-04/evidence/machine-proof-final` retains all provenance. The
kernel-checked769344 candidate charges173642writer +21682decoder +1newbridge
+216oldexpander +1oldbridge +533341mains +40461returns. Exact row image, strict
228832saving and original both-direction halting equivalence are proved.
This is not yet an accepted full-machine result.

1. Finish remote full acceptance39829682430 at93389ce; inspect actual strict
   export/audit, all full rows, independent exact input/writer/toys/corruptions,
   prior regressions and intended negative controls. Repair only new sources.
2. Retain official completed-run provenance. Finish fresh independent complete
   review, external seal, positive/hostile saved-metadata and portable replay.
   Only then promote a new best; keep998176accepted meanwhile.
3. In parallel, prepare and dispatch one bounded packed-Nat quotient trial.
   Retain precise obstruction/actual coverage without weakening resource limits.
4. Obey20:15UTCpause deadline. No major launches after19:45; startshutdown20:00.
   Update breakdown/ranking, retain logs, stopworkers/jobs, commit/push and pause.

## Checkpoint files and remote shutdown

`pause-2026-10-22/` contains live ledger snapshots, source/evidence hash manifest,
pre-pause handoff, run/artifact API responses and final branch-job inventory.
Scheduler wave completion records worker return, not successful proof completion.
Open gates stay open; no unfinished route is marked successful or abandoned.

Cancelled/stopped campaign runs:39822945066,39823380010,39813062294,39813062323.
GitHub Actions status can lag actual execution (incidentq29p76qtnkyk). The final
inventory records the observed state; uploaded diagnostics are retained separately.
`PENDING.json` means official completed-run/log provenance still needs retention.
On resume use `scripts/chess_goal_20261022/retain.py` into a fresh folder once
needed. Never overwrite earlier failed or live packets.

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`. **Origin is upstream**. Authorized fork push is
`git@github.com:bocowgill/cryptids.git`, same branch. Source baseline before pause
checkpoint:721ab7423d47146c446c51e6e601593c0f9e46d0. The final checkpoint commit
includes the saved unverified packet theorem and every retained evidence packet;
the complete pause checkpoint is fc16528caeaf909e9bfb2b0239ced8f352d6bf3d.
The user has now explicitly resumed, with every prior constraint preserved.
