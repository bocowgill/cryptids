# State-53 pilot result — 2026-10-24

**Latest verification:** the one additional user-authorized job independently
replayed the fixed counterexample and Lean-checked it successfully, with a passing
full-private audit. See [replay-02/RESULT.md](replay-02/RESULT.md).
The remainder of this page preserves the result/status after the original failed
job, before that separate verification. The 95-state RH baseline is still unchanged.

**The proposed skipped-bit encoding is rejected by an exact source-level
counterexample. No 94-state RH machine is certified.**
See [COUNTEREXAMPLE.md](COUNTEREXAMPLE.md) for the full direct proof:

```text
c = outside 44; zero DEC of bank 0
W = 1001110110
E(B_1(W)) = 100111
B_1(E(W)) = 101
```

E deletes the bit read at old state 53; B_1 is the accepted zero-DEC return pop.
The deleted ZERO is a delimiter needed by that pop. The proposal's required
encoding equation is false on a valid typed frame. This rejects the canonical
proof route; it is not a proof that the fixed table recipe fails the blank-tape
RH theorem or that no other 94-state construction exists.

## Actual remote execution

[Run 40132242492](https://github.com/bocowgill/cryptids/actions/runs/40132242492)
used ordinary `ubuntu-24.04` on the existing public `bocowgill/cryptids` fork.
Producer: `471387388084c3e973b88f0c5039987501d5ccff`.
Job: `120986248652`. Run started 20:59:45 UTC and finished 20:59:56 UTC.
The source transport push used `[skip ci]` and launched zero jobs; the separate
launch packet produced exactly one RH job. No Chess or other baseline job ran
as part of these pushes.

The job **failed before candidate generation**: the capacity probe unconditionally
read `/sys/fs/cgroup/memory.max`, which was absent. This is an implementation
error in the runner, not a proof failure, time limit, memory stop or mathematical
counterexample. The original failure excerpt is retained in `evidence/`.
No artifact was uploaded because the summary had not yet been written.
Peak RSS and actual container memory limits were not recorded; do not infer them.

The probe now tolerates absent files and checks visible v1/v2 paths. This repair
is source-only and **unexecuted**; the failed producer remains recoverable by SHA.
There was no rerun, retry, larger runner, paid resource or local computation.
The single-job cap was preserved. The direct mathematical obstruction was then
derived by lightweight source inspection, with every binary operation shown.

## What is and is not verified

- The accepted table, proof sources, toolchain and manifest remain unchanged.
- The exact fixed recipe is still expected to contain 94 states; no candidate
  table was generated or independently counted during this run.
- Remote generation, finite fixtures, full-tape replay, corruption controls,
  Lean checks and foundation audits did not execute. Do not credit planned checks.
- The source proof refutes the necessary return equation for E. Its tape sets
  and transition path are manual derivations, not executed witness data.
- New certified savings: zero. Accepted RH baseline: 95 states.
- Chess branch, paused goal, artifacts, historical evidence and jobs were untouched.
- Broader search was not started; the fallback decoder-fusion family is unrun.

Audit of pilot gates: P3/P5 met by explicit manual proof/scope review; P1/P2/P4
abandoned because startup prevented execution and no retry was permitted.
These dispositions are recorded in GATES.md and are not a successful remote
verification certificate. The requested mathematical obstruction is nevertheless
fully specified without relying on the failed execution.

## Recovery

Read COUNTEREXAMPLE.md before revisiting this operator. Do not retry the same
E/pop claim: it is false. A later proposal must either preserve the lost return
delimiter in a different exact frame encoding or choose another bounded operator.
The runner capacity repair needs remote validation before any future execution.
No further action or broader search is launched by this checkpoint.
