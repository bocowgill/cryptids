# Active chess compression goal — 2026-10-22

The Codex goal is active. Continue successive focused rounds. Usage exhaustion is
a resource stop, not successful completion. Leave resets and resumption to the user.

## Accepted best

**2,411,743 states**, public machine `ConjectureMachines.Machines.chess_field_selective`,
with `ConjectureMachines.Semantics.ChessFieldSelective.halts_iff_not_draw`.
It saves **492,880 states** from the goal's starting 2,904,623-state machine.
Computation commit `2dfa3a7656de3f15a0bbda387d6f0642328e6d08`; sealed acceptance
checkpoint `d79ae92034a7d33db9787bab8f15bbc349a60bd9`; final ledger checkpoint
`18e8474`. All are pushed to the fork. All 29 round-01 gates passed.

Round-01 exact complete table, independent checks, safe closure audit, regressions,
fresh advisory and sealed parent replay passed. See `round-01/RESULTS.md` and
`round-01/evidence/final/`. Successful remote run39780889172 iteration4 is complete.
No round-01 job remains active. Preserve all accepted sources and evidence.

## Constraints and priorities

- Frozen chess specification/conjecture fixed. Round-02 `baseline-pins.json` pins
  2,762 baseline and accepted files. Accepted earlier rounds remain immutable.
- ALL Lean/Lake/LSP/LeanProbe, compilation, native execution, models, generators,
  simulations, synthesis, fixtures and counting stay **remote**. Local source
  editing and retained metadata/hash inspection are allowed.
- No outreach, upstream issues/comments/PRs or messages. Fork checkpoints authorized.
- Prioritize large reductions in the complete certified machine. Maintain the
  complete breakdown and ranked savings/proof/effort in
  `STATE-COUNTS-AND-OPPORTUNITIES.md`. Separate accepted counts from experiments.
  Small proof components currently unlock the 1,413,567-state seed reduction.
- Use bounded pilots; retain failed routes and reconsider growing costs without
  better prospects. No micro-optimization of the 216-state controller now.
- Latest usage snapshot: **68% used / 32% remaining**. No numeric goal token budget,
  no reset credit consumed. Check usage periodically and checkpoint throughout.

## Round 02 — current primary route

Experimental full count **998,176** =424,157 paid writer +216 expander +1 bridge
+573,802 accepted interpreter body. Prospective additional saving **1,413,567**.
**Not accepted yet.** Universal proof and the full wrapper/public theorem have
passed named strict builds. Full native/audit/regression evidence and final
advisory/sealed replay remain pending.

The writer installs three-bit stack symbols between two guarded markers. The
controller expands each to the old thirteen-bit cell, erases all temporary data,
sets the original bottom marker and passes the exact old tape/head to the body.
Runtime is quadratic in input length: NEVER execute the entire 141,380-symbol
startup. Acceptance requires universal finite-input proof, full static input
identity, full actual table comparison and small native composition fixtures.

### Completed intermediate evidence

- Finite pilot216controls/432rows/465validfixtures/14corruptions/fullstaticinput:
  run39788561190 at619a4cde330b15ea16bc1cdbdea7f581b4658629;
  `round-02/evidence/pilot-02/`.
- Generic protected-success SeedLink strict Lean: run39788567168 iteration2,
  `round-02/evidence/link-final/`. All D+1+B controls paid, both halting directions.
- Actual Lean controller exactly matches all432pilotrows and reruns fixtures:
  run39790380235 iteration2 at4fa54a4; `round-02/evidence/controller-final/`.
- Blocks and Scan strict named builds passed in run39793271595 at7710f6f.
  Overall command failed downstream in Expander/ChessCodec; do not call this a
  full proof pass. Official retained packet `round-02/evidence/proofs-session-1/`;
  initial diagnostics also saved in `proofs-session-1-diagnostics/`.
- Expander syntax/dependent rewriting/blank-tail/arithmetic errors repaired.
  Codec concrete input normalization exceeded6GiB; repaired by generic equality
  composition and irreducibility. No theorem statements weakened.

### Current remote run / source

**Run39797909133**, bounded `chess_seed_20261022.yml` session target `full`,
initial source **7e32af8**. Iteration1 passed Expander/Codec but found the wrapper
entry-state equality; iteration2 required a more explicit finite equality;
iteration3 at**80c2dd6** passed the complete FieldSeed/ChessSeed proofs and found
two native-exporter typing errors. Those are repaired and pushed at**780ad59**
for iteration4. Inspect uploaded artifacts as well as status; GitHub status has
lagged behind actual execution. Each failure opens a five-minute repair window,
up to eight iterations. Preserve exact computation/workflow identities.

Previous machine-only run39795117911 is completed failure. Its last iteration4
at92b8204 is officially retained in `round-02/evidence/machine-session-4/`; all
of those Expander/Codec errors are now repaired. No job from that session is active.

At14:34UTC GitHub's incident API reported Actions Results incidentq29p76qtnkyk,
investigating delays since14:18UTC in workflow/step results and repository updates.
Link https://stspg.io/44w94j036yc8 . Both jobs still showed queued with no runner
assigned. Do not duplicate/cancel them merely for the delayed status. Continue
source/evidence preparation, then inspect actual artifacts when service recovers.

Root owns `FieldSeed.lean`, `Semantics/ChessSeed.lean`, runner/workflow/audit,
git/network/remote jobs. Agents own:

- goal_seed_expander: `Seed/Expander.lean`, awaiting remote diagnostics.
- goal_seed_codec: `Seed/ChessCodec.lean`, awaiting remote diagnostics.
- goal_seed_machine/scan: controller/blocks/scans; named builds passed, final
  root full receipt/audit still required.
- goal_seed_native: new `scripts/chess_seed_20261022/Export.lean`, `fixtures.py`,
  `round-02/NATIVE-CONTRACT.md`. Drafting full actual rows and independent checks.
  Expected binary full-rows.bin, six bytes per row, both bits of every state.

Root full runner/audit and native checks are drafted for remote execution. Native
source includes all1,996,352rows,88complete startup cases,465controller cases and
34corruption controls; complete same-source receipts are pending. Worker
goal_seed_evidence has drafted the separate metadata-only sealed checker;
goal_seed_review is performing the fresh complete-candidate advisory, pending
the final successful packet before any approval.
Acceptance remains: strict complete
build, safe axiom closure, full table/count/input/fixtures and hostile controls,
prior regressions, fresh complete advisory, sealed metadata checker and parent
replay, then a committed/pushed result. No count is accepted before all pass.

## Round 03 — bounded independent body measurement

Worker goal_body_quotient_pilot owns `scripts/chess_body_20261022/pilot.py` and
`round-03/PILOT.md`; root owns remote-only verify.py/workflow. Source review is
complete; **run39795919458** completed successfully at **8cd145e**. It analyzed
the entire already accepted573,802-state body,
including both transitions of every allocated state, by exact output-labelled
bisimulation. Bound600seconds/6GiB including independent serialized certificate
checks and hostile controls. Measured quotient **114,487states**, prospective
saving **459,315**, in21.027seconds/287,416KiB. The full certificate occupies
8,397,167bytes. No Lean quotient claim or new accepted count. The official ZIP,
APIs/logs/source manifest/all files are retained in `round-03/evidence/pilot-final/`;
root's metadata/hash replay passed in `round-03/evidence/parent-pilot-replay.json`.

`round-03/PROOF-OPTIONS.md` identifies existing LocalCertificate.Rows/respects:
use old→class map; no new generic simulation theorem is necessary. Next bounded
pilot tests full data loading and64/512/4096representative old-state kernel
certificates, both bits, within20minutes/6GiB. Worker goal_body_quotient_pilot
owns new certificate_pilot.py/CERTIFICATE-PILOT.md; root owns separate workflow,
lakefile and certificate_verify.py. Source drafting only, not dispatched yet.
Restricting the measured partition to store-only pairs is not known to preserve
successors; do not promote its diagnostic339,898saving into a separate quotient.

## Recovery and orchestration

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`. **Origin is upstream.**
Push explicitly to `git@github.com:bocowgill/cryptids.git`; never push upstream.
Latest pushed computation source `780ad59`; inspect git status for subsequent root/worker
changes before committing. Do not discard concurrent edits.
Full native/audit/runner source is in the active `full` session. Do not duplicate
it; inspect exact new artifacts and repair within its window. All accepted
baseline and successful finite-pilot source files remain fixed.

Ignored active ledgers `.unlazy/chess-goal-20261022-r02` and `...-r03`; copy their
snapshots to dated tracked docs at major checkpoints. Source-ready is not verified.
Native/evidence/source-scout waves are returned; fresh-review and certificate-pilot
waves are active. Returned means scheduler completion, not proof pass.

Metadata-only official retention command:
`python3 scripts/chess_goal_20261022/retain.py --run ID --artifact EXACTNAME --output FRESH_FOLDER`.
Only after run completion; reads/downloads saved evidence and hashes, no model run.
For live iteration diagnostics use `gh run download` into a fresh dated folder.

Accepted round-01 metadata replay (does not execute Lean/models/counting):
`python3 scripts/chess_goal_20261022/check_saved_evidence.py --root . --evidence docs/chess/campaign-2026-10-22/round-01/evidence/final --seal docs/chess/campaign-2026-10-22/round-01/review/seal.json --self-test`.
Passed with41rejectedcorruptions and copiedchecker/seal portability. Its old sealed
files must stay fixed; create a new round-02 checker/seal for the new machine.
