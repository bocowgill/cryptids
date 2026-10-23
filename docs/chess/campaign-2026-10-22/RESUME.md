# Chess campaign resumed October 23, 2026

The user explicitly resumed the existing campaign, targeting a certified310029
state machine. Current plan, gates and progress are in
`../campaign-2026-10-23/RESUME.md` and its GATES.md. The October22 shutdown
packet remains immutable; its deadline applied only to that date.
Goal tracking has been restored from the saved campaign after an initial null
API response; the current record is in the October23 checkpoint. All prior mathematical, frozen-source,
remote-computation, local-memory and outreach constraints continue.

The account usage observation at resumption is8% consumed. First bounded action
adds durable MapValid timing markers while preserving all proof statements,
audits and resource caps. The original historical handoff follows below;
its 'next resume' instructions are now authorized.

## Latest accepted machine

**769,344 states**, public `ConjectureMachines.Machines.chess_table_seed`, theorem
`ConjectureMachines.Semantics.ChessTableSeed.halts_iff_not_draw`:

`Halts M ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.

| Paid component | States |
|---|---:|
| Packet writer, including final turn | 173,642 |
| Structured decoder | 21,682 |
| New bridge | 1 |
| Retained expander | 216 |
| Retained bridge | 1 |
| Interpreter mains | 533,341 |
| Interpreter returns | 40,461 |
| **Total** | **769,344** |

Latest accepted saving: **228,832** from 998,176. Goal cumulative accepted saving:
**2,135,279** from 2,904,623. Neither chess's value nor minimality is established.

Final official run **39830779431**, computation/workflow commit
`1c8334adb8fa63f9f8450b2d8ea08bb5f01eeb85`, artifact **12447959670**. All strict
proofs, 1,538,688 actual rows, independent full input/writer and 20 startup
executions, 37 corruptions, safe foundation audit and eight intended failures,
prior regressions, fresh independent review, external seal, 52 hostile metadata
checks and copied-directory portability passed. See `round-04/RESULTS.md`,
`round-04/evidence/final/` and `round-04/evidence/review/`.

Checker SHA: `86e414ccf7b9931fdccd1b8417fc2e5b27154c6faa5557b5dceb16b11e196a82`.
Seal SHA: `29579084f3691e6ab8dd9c6447df7fb70abcb858994b7c9c23b04687c3d6d8c4`.
All 2,983 predecessor pins and 57 computation source hashes matched. The new `accepted-769344-pins.json` freezes 3,116 files (SHA-256
`43942091ac61ca4d93001fb259eb8e0694bbc499e5279658ac10d3836f166102`).
The complete accepted checkpoint is `100ed94` and is pushed to the fork. Preserve
that manifest and every earlier accepted pin set.
The successful diagnostic `full-01` is retained separately; the final run includes
a reviewed ten-step resource-counter correction.

## Constraints that continue on every resume

- Frozen chess specification/conjecture, accepted source and sealed evidence stay fixed.
- ALL Lean/Lake/LSP/LeanProbe, native compilation/execution, models, generators,
  simulations, synthesis, fixtures and mathematical machine counting run remotely.
  Local source editing and retained metadata/hash inspection are permitted.
- No outreach, upstream issues/comments/PRs/messages. Fork checkpoints are authorized.
- Prioritize large full-machine savings. Keep accepted reductions separate from
  estimates and partial proofs, and count every paid control and bridge.
- Never simulate the full quadratic 141,380-symbol startup. Use universal execution
  proofs and exact complete input identity.
- Root owns Git/network/dispatch/retention. Workers use disjoint files. Existing
  workers are idle unless named as active in `ACTIVE-RUN.md`.

## Experimental route and exact stopping point

The finite whole-body quotient has 114,487 states versus the accepted
573,802-state body. Its prospective saving is **459,315**, giving a prospective
complete machine of **310,029**. This reduction is **not certified or accepted**.
Zero actual-body quotient transition rows have been kernel-certified.

Final trial 13: completed/failure run **39839073884**, source
`c04fba3ee1443a9b734ca0a8a45543d3d06e8ab3`, retained in
`round-03/evidence/certificate-13/`. Its named chunk proof establishes complete
`map_count = 573802` by ordinary kernel checking and full-private audit:
one root, 5,212 dependencies, no axioms. Build: 47.695s, peak 2,836,414,464 bytes;
audit: 2.839s. The previous whole-map count exceeded 6 GiB in trial 12.

MapValid then exhausted its **remaining 61.702 seconds** of the unchanged shared
120-second data allowance (observed 61.782s, peak 2,756,288,512 bytes). This is a
time obstruction, not a memory failure, and does not show validity needs more
than 120 seconds. Logs contain replayed dependencies only: no validity theorem
or individual chunk completion receives credit. Only MapPrelude and MapCount
completed; complete data=false, actual rows=0, negative unrun. Total 256.468s.
All original proof obligations and 1,200s/6GiB global limits remain.

Parent metadata checks bind the exact source commit, all 3,116 accepted pins,
13 stage logs, 1,200 generated files and both official archives. Accepted machine
and every frozen file remain unchanged. No additional reduction is claimed.

## Next concrete task after user resumes

1. Add bounded durable timing markers between validity chunk batches in the
   experimental driver, then run one reviewed remote pilot under the unchanged
   shared data budget. Markers are diagnostics only until build and audit pass.
   Preserve fresh target checking; cached dependency replay is intentional.
2. Use the resulting timing evidence to select a smaller compositional proof or
   structural certificate. Do not simply raise caps or repeat an identical run.
   Read `round-03/CHUNK-PROOF-OPTION.md`, `FAST-ROW-OPTION.md`, `PROOF-OPTIONS.md`
   and the ranked `STATE-COUNTS-AND-OPPORTUNITIES.md` before changing direction.
3. Complete cache/range/codec/body relations, actual-row pilot and meaningful
   negative before any full quotient certificate. A later acceptance must cover
   every original transition, the complete blank-tape machine and all full-machine
   verification gates. Partial proof progress never changes the accepted count.

Historical failures 09–13 remain retained. Trial 09: typed quotient memory;
10: packed quotient passes, combined Data memory; 11: isolated MapChecks memory;
12: isolated MapCount memory; 13: chunked MapCount passes, MapValid shared time.
Remote cache repair reduced unchanged dependency setup from 645.964s to 5.393s.

## Resume logistics and local memory

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`. Origin is upstream: **never push origin**.
Authorized checkpoint remote: `git@github.com:bocowgill/cryptids.git`, same branch.
No outreach. Keep tool output compact, avoid loading huge generated source or
agent histories into chat, and use bounded metadata summaries. The local process
snapshot during shutdown showed the Codex renderer at about 2.6 GiB RSS and its
backend at about 1.4 GiB; these are shared app processes and were not killed.
After this checkpoint the user can quit/reopen the app to release its memory.
Do not restart or terminate unrelated user applications.
