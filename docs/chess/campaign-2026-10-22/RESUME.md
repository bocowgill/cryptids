# Active chess compression goal — 2026-10-22

The Codex goal is active. Continue reducing the complete certified chess machine
through successive focused rounds. Usage exhaustion is a resource stop, not
successful completion. Leave usage resets and resumption to the user.

## Best accepted machine

**2,904,623 states**, accepted commit `7987e740b492736cc18eba7896727544ef027c93`:
1,837,941 initializer controls and 1,066,682 body controls.

- Machine: `ConjectureMachines.Machines.chess_field_reverse`.
- Theorem: `ConjectureMachines.Semantics.ChessFieldReverse.halts_iff_not_draw`.
- Accepted evidence: `docs/chess/field-reverse/RESULTS.md` and `RESUME.md`.
- Initial sealed metadata replay passed: `check_saved_evidence.py --self-test`
  returned `Reverse sealed evidence controls passed`, exit 0.

No smaller machine has yet passed the new round's acceptance gates.

## Constraints

All Lean, Lake, LSP, LeanProbe, native compilation/execution, generators, models,
simulations, fixtures, synthesis and machine counting must run **remotely**.
Local source/document editing and saved metadata/hash inspection are permitted.
Keep the frozen chess specification and every pre-campaign tracked file fixed;
`baseline-pins.json` records their hashes. Use new source and evidence paths.
No outreach, upstream issues/comments/PRs, or messages to other people.

The goal has no numeric token budget. Latest account snapshot: **52% used,
48% remaining** in the primary window. No reset credits have been consumed.
Check usage periodically and maintain this handoff throughout the run.

## Round 01: selective return controls

The accepted binary compiler allocates a return control for every Post state.
Only write destinations need those controls. The candidate retains all 533,341
main controls and 40,461 returns, giving a 573,802-state body. With the unchanged
1,837,941-state paid initializer, the proposed full count is **2,411,743**, saving
**492,880** controls.

Remote census `39775667430` at source
`5af89c69ed69e0bf0a3d7a710a2bbc3eac7ac0a4` checked all 2,133,364 accepted body rows.
It found 4,050 syntax writes and exactly 40,461 write destinations, equal to the
structural allocation `1 + 5 × (4,042 roots + 4,050 write children)`. This is
finite evidence for the proposed allocation, not a new halting certificate.
See `round-01/CONSTRUCTION.md`, `GENERIC-ROUTE.md`, and `BODY-ROUTE.md`.

## Proof and validation status

- `FieldReturns.Syntax` and `FieldReturns.Graph` built successfully in remote run
  `39777697376` at `bc2e490`. Their current source hashes matched that receipt.
- `SelectiveBinary` proofs elaborated in session `39779413053`, iteration 1.
  Only a long-line warning remained; its source repair accompanies this checkpoint.
- The three `FieldSelective` modules are complete source drafts, including both
  halting directions, exact paid tape entry, state count and row-image equality.
  Their strict integrated build remains pending.
- Native exporter, independent fixtures, proof audit and full remote runner are
  committed. No successful new native artifact or full acceptance receipt exists.
- The validator requires all 4,823,486 actual full-machine rows, 202,100 source
  cases, six initializer edges, 27 corruptions, false-count proof controls, a
  safe proof-closure audit, and the prior M2–M7 regressions.
- The audit explicitly imports both the new and previous public theorem modules.

Failed runs and diagnostics are retained under `round-01/evidence/`. Do not
reinterpret a failed overall run as a successful complete construction.

## Active remote session

Run **39779413053**, initial workflow/source commit **cd09c1e**, finished its
first check and its five-minute wait expired. Its diagnostics are retained under
`round-01/evidence/session-39779413053-1`. The concrete layout needed two
dependent equivalence rewrites and protection against expanding the large
layout during child coverage. Those repairs accompany this checkpoint.

Dispatch a new bounded remote session targeting `full`. It can check up to eight committed
revisions while retaining one runner's dependency cache. Each iteration uploads
`chess-goal-session-N-SOURCE_SHA`. It stops after a successful full check or five
minutes without a new source commit, with a 60-minute job timeout.

For later iterations, the computation commit differs from the workflow's initial
head SHA. `session-binding.json`, `source-manifest.json`, and the saved executed
workflow bind these separately. Preserve both identities.

Read compact run status and artifact metadata with `gh`. Download each completed
iteration's diagnostics while the session waits, repair its actual errors, then
push a source checkpoint. Avoid documentation-only pushes during a waiting
session: any new branch commit triggers the next check.

## Next concrete task

1. Dispatch the repaired checkpoint and retrieve its first iteration. Route generic errors
   to `goal_selective_binary`, concrete layout errors to `goal_selective_chess`,
   exporter errors to `goal_selective_export`, and fixture errors to
   `goal_selective_fixtures`. These agents are available for follow-up repairs.
2. Continue until the strict complete proof, audit, actual native export,
   independent full validation and regressions pass on one exact source snapshot.
3. Retain the final artifact ZIP, API metadata and logs after the session finishes.
   `scripts/chess_goal_20261022/retain.py` performs metadata/byte retention only;
   it is safe to run locally with the necessary network access.
4. Obtain fresh independent complete-candidate review, seal the evidence and
   replay the sealed packet before accepting a new best count.
5. Record the result and continue the active optimization goal. Possible next
   routes include write/move fusion and further initializer compression.

## Workspace and checkpoints

Directory: `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`.
Branch: `codex/chess-openevolve-pilot`. Fork: `bocowgill/cryptids`.
`origin` is upstream, so push explicitly to `git@github.com:bocowgill/cryptids.git`.
All computation sources through `cd09c1e` are pushed. This handoff and the new
retention helper should accompany the next source checkpoint.

Unlazy scope: `.unlazy/chess-goal-20261022-r01`; a tracked ledger snapshot is under
`round-01/ledger-snapshot`. Component source gates are distinct from remote proof
and full-machine acceptance gates. The root coordinates pushes and remote runs.
