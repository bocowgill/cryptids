# Chess compression campaign — live checkpoint, 2026-10-22

The user resumed the existing goal from `fc16528`. The goal is active and the
optimization objective remains open. The previous pause snapshot is immutable
in `pause-2026-10-22/`. Latest account usage observation: 70% consumed at 18:44 UTC;
usage is shared across the account and may change independently of this task.

## Hard wind-down

Finish a graceful checkpoint and pause **by October 22, 2026, 4:15 p.m. Eastern
(20:15 UTC)**. The user's personal hard stop is 4:25 p.m. Stop substantial launches
by 19:45 UTC; begin shutdown at 20:00. Stop workers and remote jobs, retain their
results/diagnostics, update this handoff, commit and push a clean checkpoint,
then mark the existing goal paused. If usage approaches exhaustion first, prioritize
this same handoff. A time or resource stop is not successful completion or a proof
of optimality. Do not reset usage or create a replacement goal.

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

## Highest-priority unfinished route

The finite whole-body quotient has 114,487 states versus the accepted 573,802-state
body. Its prospective saving is **459,315** and the complete machine with the
accepted initializer would have **310,029** states. **No actual-body quotient row
has yet been kernel-certified.** The generic quotient theorem and finite evidence
do not close the concrete certificate.

Trial 09, run 39825520233 at `fc16528`, passed full raw-map build/audit but the
typed executable quotient exceeded 6 GiB after 142.458 seconds. A produced olean
is not a successful stage. Official `round-03/evidence/certificate-09` is retained.

**Trial 10 completed with a narrower memory obstruction:** run **39830984315**, source
`fe8656cdd316bf64e1317bf8a8aaa64c71e9450f`. The packed-Nat representation removes
per-row dependent Fin proof data while preserving complete range/decoder fidelity,
original readable rows, independent full inverse comparison, all actual-row
checks, meaningful negative controls and the original **1,200 seconds / 6 GiB**
caps. Packed Q now compiles in 53.650 seconds at 4,268,597,248 bytes and its full-private
audit passes. Combined `Data` then exceeds 6 GiB after 16.412 seconds at
6,456,266,752 bytes. No actual rows or negative control ran. Official
`round-03/evidence/certificate-10` is retained. A thin data/fidelity module that
avoids the heavy chess imports during global range checks is under source review.
The next pilot wrapper now verifies all 3,116 new accepted pins.

If concrete row normalization is the next obstruction, use `round-03/FAST-ROW-OPTION.md`
and `PROOF-OPTIONS.md` for structural local-slot certificates. Reconsider repeated
representation tuning without measured progress. Full current ranking is in
`STATE-COUNTS-AND-OPPORTUNITIES.md`.

## Next concrete actions

1. Review the proposed thin-data split against trial 10's precise combined-memory
   obstruction. Preserve all earlier failures and original caps. A standalone
   data pass alone does not establish actual-row scalability.
2. If a small proof/source repair is needed, make one bounded exact-source retry.
   If the underlying memory obstruction persists, choose a structurally different
   certificate rather than raising the cap.
3. Any quotient success is partial until every original transition is certified,
   the complete blank-tape machine is linked and all acceptance gates are repeated.
4. Maintain a pushed checkpoint and obey the hard wind-down above.

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`. **Origin is upstream: do not push origin.** Use
`git@github.com:bocowgill/cryptids.git`, the same branch, for authorized checkpoints.
No upstream communication is authorized.

Remote setup improvement for the next pilot: the body workflow now restores the
fresh accepted table cache and saves subsequent body caches. Trial 10 spent
645.964 seconds rebuilding unchanged base modules; this infrastructure repair
changes no proof, source requirement, machine count or resource cap.
