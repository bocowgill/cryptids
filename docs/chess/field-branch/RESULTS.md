# Certified second return and actual branch

Completed 2026-10-21 in fork `bocowgill/cryptids`, branch
`codex/chess-openevolve-pilot`. The previously certified path now executes
`ret RuntimeModel.s003` through its return to the marker and its actual branch.
The extended binary module has **675 states**, including every control:

| Controls | States | Range | Final successor port |
|---|---:|---|---|
| Entire accepted return/main-pop path, with its five exits made live | 425 | 0–424 | — |
| Five store-preserving connector gates | 5 | 425–429 | — |
| Return for absence | 49 | 430–478 | 478: normal3, absence |
| Return for cons-l | 49 | 479–527 | 527: normal3, cons-l |
| Return for cons | 49 | 528–576 | 576: normal3, cons |
| Return for bit0 | 49 | 577–625 | 625: reverse push, bit0 |
| Return for bit1 | 49 | 626–674 | 674: reverse push, bit1 |
| **Total** | **675** | **0–674** | **Five paid final ports** |

The old 425-state inventory is fixed and documented in
[the accepted continuation results](../field-continuation/RESULTS.md).
This extension adds 250 states. Old ports 404/409/414/419/424 now execute right
moves to the five new left-move gates. Each gate restores the head and enters
the corresponding return block. Each 49-state block includes its marker test,
loop movement, restoration and terminal dispatch control. No external store,
return register or uncharged transfer performs the composition.

At the marker, the actual frozen s003 branch dispatches absence, cons-l and cons
to `TM2to1.normal 3`. Bit0 and bit1 dispatch
`TM2to1.go .rev (.push (SharedModel.pushFn RuntimeModel.s002)) RuntimeModel.s000`.
Both successors preserve the loaded store. The next normal3 and push bodies
are outside this extension; the named final controls represent arrival at them.

`ConjectureMachines.Compilation.FieldBranch.extended_certificate` proves the
complete original-return → main-pop → second-return → actual-branch path in
the real source machine and the exported binary graph. It couples the actual
successor label and store with the entire tape representation over every
integer cell. The main pop changes its specified coordinate; the added return
preserves all tape bits and the loaded store. Finite first-return, pop and
second-return path premises remain explicit, with lengths n, m and k. Source
execution takes `n+m+k+4` steps. Binary execution takes the earlier prefix
`37*n+26+23*m+(if flag then 34 else 61)`, plus `2+(37*k+24)` steps.
`branch_certificate` separately certifies the newly connected segment.

Official full remote run
[39699849855](https://github.com/bocowgill/cryptids/actions/runs/39699849855)
passed at computation commit `5277e624b154f1c7c8ceed704668a20a7819ef89`.
All five phases bind the same nine computation files and 503 frozen inputs.
Strict Lean compilation, native export and the trust audit passed. The audit
checked 38 roots and 6,937 dependencies, permitting only `propext`,
`Classical.choice` and `Quot.sound`, with no excluded compiler helpers or
generator roots. Three forbidden-dependency controls and three false Lean
contracts were rejected for their intended reasons.

Independent remote replay of the actual numeric rows passed **73,822 cases**:
46,875 complete composed source cases, 18,750 arbitrary second-return source
cases, 8,192 raw-code robustness cases and five arbitrary valid-gap cases.
Every one of the 675 controls was visited; all five stores and both successor
labels were covered. Second-return distances include 0/1/2/7/31/64. Every
replay checks exact tape contents, absolute head, store, successor control and
execution length. All fourteen deliberate corruptions were rejected. Raw
invalid encodings remain outside source-correctness evidence. These finite
tests support the emitted artifact; the universal theorem supplies the proof.

The official 21-entry artifact and logs are retained in [evidence/current](evidence/current).
The initial failed strict build is preserved in [evidence/history/attempt-1](evidence/history/attempt-1):
its two unused simplification arguments were removed without changing statements
or graph rows. No local Lean/Lake/LSP/LeanProbe, native code, machine replay,
fixtures or state-count computation ran. All task jobs have stopped. The final
fresh-context advisory review and sealed metadata-only checker are in
[evidence/review](evidence/review); root replay is recorded in
[evidence/root-check.json](evidence/root-check.json). Model review is separate
from formal Lean verification.

**The accepted complete chess machine remains 390,491,642 states. This task
saved zero states in that complete construction.** The field encoding is a
replacement-backend design; it cannot simply be inserted into the existing
eleven-bit whole-cell backend. The concrete missing compiler, initialization
and whole-machine proof work is laid out in [FULL-MACHINE-PLAN.md](FULL-MACHINE-PLAN.md).
That plan ends successive manual label ports as the main reduction strategy
and makes a strict full-machine reduction the next campaign's completion gate.
There is no measured calendar ETA; the plan explains the uncertainty.

The frozen specification and all accepted inputs stay fixed. Heavy computation
remains remote, and outreach remains on hold. Machine-readable measurements:
[results.json](results.json). Checkpoint: [RESUME.md](RESUME.md).
