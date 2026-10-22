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
- Latest usage snapshot: **66% used / 34% remaining**. No numeric goal token budget,
  no reset credit consumed. Check usage periodically and checkpoint throughout.

## Round 02 — current primary route

Experimental full count **998,176** =424,157 paid writer +216 expander +1 bridge
+573,802 accepted interpreter body. Prospective additional saving **1,413,567**.
**Not accepted yet.** No completed universal/full-machine Lean certificate yet.

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

**Run39795117911**, bounded `chess_seed_20261022.yml` session target `machine`,
initial source **cc5731e**. Last observed queued. Inspect status/artifacts before
starting another job. It checks universal components and the complete FieldSeed
wrapper/public ChessSeed theorem. A failure opens a five-minute source-repair
window, up to eight iterations. Preserve exact computation/workflow identities.

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
34corruption controls; these new checks have not executed yet. Worker
goal_seed_evidence is drafting the separate new metadata-only sealed checker.
Acceptance remains: strict complete
build, safe axiom closure, full table/count/input/fixtures and hostile controls,
prior regressions, fresh complete advisory, sealed metadata checker and parent
replay, then a committed/pushed result. No count is accepted before all pass.

## Round 03 — bounded independent body measurement

Worker goal_body_quotient_pilot owns `scripts/chess_body_20261022/pilot.py` and
`round-03/PILOT.md`; root owns remote-only verify.py/workflow. Source review is
complete; **run39795919458** is queued at **8cd145e**. It analyzes the entire
already accepted573,802-state body,
including both transitions of every allocated state, by exact output-labelled
bisimulation. Bound600seconds/6GiB including independent serialized certificate
checks and hostile controls. No Lean quotient claim or new accepted count.
Retain map, representatives, full quotient rows, state-family costs and certificate
size to rank whether structural sharing is worth formalizing next.

## Recovery and orchestration

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`. **Origin is upstream.**
Push explicitly to `git@github.com:bocowgill/cryptids.git`; never push upstream.
Latest pushed proof source `cc5731e`; inspect git status for subsequent root/worker
changes before committing. Do not discard concurrent edits.

Ignored active ledgers `.unlazy/chess-goal-20261022-r02` and `...-r03`; copy their
snapshots to dated tracked docs at major checkpoints. Source-ready is not verified.
Native worker wave is sealed; returned source workers must be recorded as returned
before parent verification. Returned means scheduler completion, not proof pass.

Metadata-only official retention command:
`python3 scripts/chess_goal_20261022/retain.py --run ID --artifact EXACTNAME --output FRESH_FOLDER`.
Only after run completion; reads/downloads saved evidence and hashes, no model run.
For live iteration diagnostics use `gh run download` into a fresh dated folder.

Accepted round-01 metadata replay (does not execute Lean/models/counting):
`python3 scripts/chess_goal_20261022/check_saved_evidence.py --root . --evidence docs/chess/campaign-2026-10-22/round-01/evidence/final --seal docs/chess/campaign-2026-10-22/round-01/review/seal.json --self-test`.
Passed with41rejectedcorruptions and copiedchecker/seal portability. Its old sealed
files must stay fixed; create a new round-02 checker/seal for the new machine.
