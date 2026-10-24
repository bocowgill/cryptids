# Bounded RH95 compression audit — 2026-10-24

Follow-up: the authorized state-53 pilot now has an exact source-level
counterexample to its skipped-bit encoding. Its one remote job failed before
generation; no executable witness replay or new certification was completed.
Read [the pilot result](pilot-53/RESULT.md) and
[the direct counterexample](pilot-53/COUNTEREXAMPLE.md) before acting on the
initial-audit recommendation below. No broader search was launched.

The reviewed accepted baseline remains **95 states**. No smaller machine was
implemented or certified in this audit. The best first bounded probe is removing
the bit-insensitive decoder state **53**, conditional on a sound shorter control
encoding. The exact obstruction is closure of the existing return/pop protocol
under that encoding; a transition redirect by itself is not justified.

The clean independent checkout already matched freshly fetched upstream main,
`6c28d8524fa008c6fb5aadb759df74a55ce96423`. Its new branch is
`codex/riemann-reduction` at
`/Users/bocowgill/.codex/worktrees/4e0d/cryptids`.
No chess branch was merged. Chess remains paused and its checkout, accepted
artifacts, historical evidence, goals and remote jobs were left unchanged.

## Evidence and state accounting

[BASELINE.md](BASELINE.md) pins the source commit, literal-table SHA-256,
toolchain, dependency manifest, proof sources and comparator inputs. The actual
RH95 inputs are byte-identical to a historical successful PR10 test-merge run;
the comparison includes the solution/challenge sources and verification inputs.
[Retained excerpts](evidence/pr10-ci-excerpts.txt) show default-kernel comparator
acceptance. PR7 CI evidence is retained separately. No fresh proof replay was
needed or run. The later upstream foundation changes were inspected; no newer
accepted reduction was found in the current repository/result/PR review.

The physical charge is **45 decoder + 10 native leaves + 7 INC core + 11 DEC
core + 4 register returns + 2 padding/pop + 4 guarded scanner + 11 jump/bridge +
1 shared halt terminal = 95**. Initialization uses the same table and is included.
[STATE-ACCOUNTING.md](STATE-ACCOUNTING.md) and [the per-state TSV](state-ledger.tsv)
account for every ID exactly once, while recording secondary uses and limits of
attribution. This is a manually reviewed census, not a fresh executable check.
The 98 auxiliary labels and 121 logical rows are separate proof presentations.
No false saving is booked from them or from an unproved initializer-only set.

## Recommendation

[PILOT.md](PILOT.md) specifies one candidate recipe: bypass and remove old state
53 (`0R68 1R68`), densely relabel, add no states, and prove a full-tape encoding
bridge. The expected total is 94; every initializer, return and bridge remains
charged. Reject immediately if the encoding cannot commute with returns and
padding. Finite tests only reject; acceptance requires the unconditional
blank-tape RH theorem, independent table/theorem comparison and foundation audit.

The proposed remote budget is one free job, one candidate, 3,180 seconds total,
6 GiB aggregate memory and no automatic retry. It is a proposal, not a dispatched
job. No broad search or optimization was implemented. The audit itself used zero
remote compute jobs and zero baseline-verification replays.

[OPPORTUNITIES.md](OPPORTUNITIES.md) ranks decoder sharing, logical operation
elimination, temporary reuse, bank layout and return sharing, with conditional
savings and exact reusable contracts/new obligations. Larger gains remain
speculation. The chess workflow supplies useful evaluation/checkpoint discipline,
not a transferable compiler theorem: its 310,029-state candidate is uncertified,
and the numeric checker did not improve the measured whole recipes.

## Recovery and next task

[CHECKPOINT.md](CHECKPOINT.md) records the held boundary and source-level rejected
shortcuts. No numerical optimization trial failed because none was run.
Next concrete task: derive the state-53 control-word/frame map and its pop/return
equations; either close that kernel or retain a minimal obstruction before
generation. Broader search should wait for this pilot's verdict.

Audit ledger: seven manual gates met, zero unmet, zero abandoned. These judge the
audit deliverables; they confer no new formal certification on a smaller machine.
