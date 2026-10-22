# Active chess compression goal — 2026-10-22

The Codex goal is active. Continue successive optimization rounds. Usage exhaustion
is a resource stop, not successful completion; leave resets and resumption to the user.

## Current accepted best

**2,411,743 states**, public machine
`ConjectureMachines.Machines.chess_field_selective`, theorem
`ConjectureMachines.Semantics.ChessFieldSelective.halts_iff_not_draw`.
The computation commit is `2dfa3a7656de3f15a0bbda387d6f0642328e6d08`; the sealed acceptance checkpoint is `d79ae92034a7d33db9787bab8f15bbc349a60bd9`, committed and pushed to the fork.
It saves **492,880** states from the previous accepted 2,904,623-state machine.
Full proof, actual native export, independent full-table checks, audit, regressions,
fresh advisory and sealed parent replay passed. See `round-01/RESULTS.md`.
The previous accepted machine and all its sealed evidence remain unchanged.

## Nonnegotiable constraints

Keep every pre-campaign file fixed under `baseline-pins.json` (2,638 files),
including the frozen chess specification, conjecture and all earlier evidence.
All Lean/Lake/LSP/LeanProbe, native compilation/execution, generators, models,
fixtures, simulations, synthesis and counting stay **remote**. Local source edits
and saved metadata/hash inspection are permitted. No outreach, issues/comments,
upstream PRs or messages to others. Use new dated source/evidence paths.

Latest account snapshot: **58% used / 42% remaining** in the primary window.
No numeric goal token budget and no reset credit consumed. Check usage periodically;
checkpoint throughout and stop recoverably near exhaustion, without marking success.

## Completed remote check

Run **39780889172** is **completed successfully**. Its fourth iteration checked
`2dfa3a7656de3f15a0bbda387d6f0642328e6d08`; original workflow SHA was
`965a568c124b28a48d6a1926d99a0f8496e30718`. Session provenance binds both.
There is no active remote job from this round.

Official ZIP, logs, APIs, archive inventory and all 38 exact unpacked files are
retained in `round-01/evidence/final/`. Artifact ID **12427716840**, SHA-256
`a493ccbc794bdbfce0b879d1e0cb0767f53ccba3e39bf98bfd453357f8344c10`.
All 16 new-source hashes and all 2,638 frozen hashes match the final manifest.

All 20 command receipts passed their intended conditions across build, contracts,
native, counts and full. Complete validation includes 4,823,486 actual rows,
202,100 source cases, all 40,461 return inverse checks, exact paid initializer,
six edge cases, 27 rejected corruptions, five false count contracts, three audit
negative controls, safe closure of 9,259 roots / 58,974 dependencies, and M2–M7
and shared/terminal regressions. Raw streams are retained, not only samples.

Failed runs remain under `round-01/evidence/`: source-only census and earlier
syntax/graph/generic/layout/wrapper/export repairs. They do not constitute new
machine acceptance. Repairs preserved theorem statements and frozen sources.

## Immediate next task

Round 01 is accepted and its complete checkpoint is pushed. Round 02 is active:
a direct binary three-bit seed expander plus one paid bridge into the accepted
573,802-state body. Do not mark the overall goal complete after this reduction.

The metadata-only acceptance command is:

```sh
python3 scripts/chess_goal_20261022/check_saved_evidence.py --root . --evidence docs/chess/campaign-2026-10-22/round-01/evidence/final --seal docs/chess/campaign-2026-10-22/round-01/review/seal.json --self-test
```

It passed with 41 rejected evidence corruptions. A copied checker/seal also passed
from a different working directory. Exact actual receipts are retained under
`round-01/evidence/parent-replay.json` and `parent-portability.json`; the baseline
replay is `baseline-parent-replay.json`. This executes no proof, model or recount.
The sealed advisory is an independent model review, not human approval or formal
verification by that reviewer. Preserve all accepted round-01 source/evidence.

## Next focused route

`round-01/NEXT-INITIALIZER.md` is a reviewed source reconnaissance report, not an
implementation. Three-bit source symbols plus two guarded markers and a fixed
expander could replace the 13-bit-per-cell straight-line writer. Symbolic full
count with the selective body is **997,959 + D + H**, where every decompressor
control is D and the proposed exact-head linker adds H=1. These are not measured
or certified new machine counts. Sub-million total needs D+H<2,041.

The report specifies tape geometry, reversal, empty input, marker overlap,
complete cleanup and exact head restoration. Required new proofs: universal
finite-input expansion and a protected-prefix expander/body linker. Quadratic
startup makes full step-by-step chess initialization impractical; use a certified
universal expansion path, full static input equality, exact full table export,
and independent small-input/negative controls. The round-02 contract is active
in `.unlazy/chess-goal-20261022-r02`; tracked snapshots are under `round-02/ledger-snapshot`.
Worker `/root/goal_seed_link` has drafted `Cryptids/Compilation/SeedLink.lean`;
worker `/root/goal_seed_controller` owns the finite binary controller pilot.
The new workflow `chess_seed_20261022.yml` supports `pilot` and a bounded `link`
proof-repair session. No remote round-02 run has started yet.

The controller source estimate is D=216, hence candidate 998,176 states; this is
not a measured or accepted new machine. First run the finite pilot and strict
link proof remotely, retain diagnostics, then establish universal expander correctness.
All 2,762 tracked baseline/accepted files except these mutable campaign progress
documents are pinned in `round-02/baseline-pins.json`. Accepted round-01 files stay fixed.

## Workspace and recovery

Directory `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`. Origin is upstream;
push explicitly to `git@github.com:bocowgill/cryptids.git`. All computation sources
through `2dfa3a7` are pushed; the complete acceptance checkpoint
`d79ae92` is also pushed. Inspect the latest commit before resuming. Never push upstream or open outreach.

Unlazy scope `.unlazy/chess-goal-20261022-r01`, tracked ledger snapshot under
`round-01/ledger-snapshot`. All 29 round-01 gates are met, with no unmet or abandoned gate; G6 records
the final committed/pushed checkpoint. All proof,
native, checker and fresh-review leaves passed, and all launch waves are complete.
Release ownership after parent verification and preserve the final tracked ledger
snapshot. No remote job remains active from this round.
