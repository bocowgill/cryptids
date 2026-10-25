# Repair verification stopped before proof checking — 2026-10-25

The namespace/deprecation repairs are committed, but **the additional job never
reached a Lean proof check**. Its first provenance step failed because the
20-commit shallow checkout omitted the pinned baseline commit. This is a runner
defect, not a mathematical result. The one additional job is consumed; no retry
or other compute job is authorized.

## Exact obstruction

[Run 40198910472](https://github.com/bocowgill/cryptids/actions/runs/40198910472),
job `121185664029`, attempt 1, failed. Producer:
`73cff1f1cc90bd00cfbb138be8b48cdaaebe53c0`.
CI-skipped source transport:
`79c7e9450b55792ad8c12ad0832487c1cd7ef8e3`.

The retained fidelity.log starts:

```text
fatal: bad object 6c28d8524fa008c6fb5aadb759df74a55ce96423
```

`pilot.py:143` calls the accepted-source comparison
`git diff --exit-code BASE -- ...`; it returned exit 128 before table parsing,
proof-repair binding, finite filters or setup of the Lean wrapper. The driver
then recorded fidelity exit 1 and stopped. No time or memory stop occurred.

Local Git provenance inspection confirms exactly 20 commits in BASE..producer.
Thus the baseline itself is the 21st commit in that linear history, outside
the workflow's fetch-depth:20. The recipe relied on an increasingly shallow
history window instead of fetching its exact proof pins. This omission should
have been caught before dispatch.

## Applied repairs and their verification status

The submitted repair removes the broad Turing opening in GuardCore and GuardBoot,
so their tape and ListBlank operations resolve through ConjectureMachines; uses
the pinned `ite_eq_right ha` instead of deprecated `if_neg ha`; and changes the
boot helper to `Bool.and_eq_true_iff.mp hc`, matching the pinned Lean Init API.
Every statement and hypothesis is unchanged. AssemblyProbe is byte-identical.

These are source edits, not checked theorems. The new preflight assertion that
binds exactly those substitutions did not execute, and no new proof root built.
The prior run's literal-only certificate and finite evidence remain the existing
checked facts; they are not fresh verification of the repaired source.

Unexecuted in this job:

- Exact remote proof-repair binding and table/fixture regeneration.
- All finite filters, seven-file binding, independent replay and known-hit control.
- GuardCore, new GuardBoot and native assembly proof checks.
- Full-private audit, axiom prints, sorryAx and fresh invalid-kernel controls.
- Global blank-run avoidance and unconditional isolated-overwrite assembly.

The toolchain action did install the pinned Lean and print its version. That is
not a proof check; the driver's wrapped proof/dependency invocation count is zero.

## Checkout repair prepared after the stop — unexecuted

The current workflow now explicitly fetches the two exact proof commits after
checkout: the accepted baseline and the failed producer used for source binding.
It checks both commit objects with git cat-file before the Lean action. The
fetch has a two-minute cap inside the original 900-second setup/3180-second total
envelope. This adds no mathematical assumption and changes no accepted file.

The checkout repair is retained in evidence/checkout-repair-unverified.patch.
It is saved with CI skipped and has **not** been executed remotely. The failed
producer and artifact are preserved exactly. The launch packet is unchanged;
no rerun, replacement job, new search or candidate was launched.

## Actual resources and retention

| Item | Actual |
| --- | ---: |
| Governed elapsed time, including setup | 14.900 seconds |
| Initial action setup before driver | 14.422 seconds |
| Fidelity stage | 0.475 seconds; exit 1 |
| Sampled aggregate child-session plus driver RSS peak | 48074752 bytes |
| Driver RSS peak | 17240064 bytes |
| Wrapped Lean proof/dependency invocations | 0 |
| New finite transition evaluations | 0 |
| Exported candidates / savings / retries | 0 / 0 / 0 |

The ordinary public-fork ubuntu-24.04 runner stayed inside the original
3180s/6GiB/512MiB-driver limits. The repaired optional cgroup probe recorded
missing files as null and retained /proc capacity. It did not infer unlimited
memory. All mathematical execution remained remote; none ran locally.

Artifact `12600029966`, 1509 bytes, is retained intact and extracted under
evidence/unpacked/. Its measured SHA-256 matches GitHub's digest:

```text
1f08eb3b7a6745c08547f1dec46f7c916929a5ae7fbbdfb07640858957d8e602
```

The two remote files are fidelity.log and resource-summary.json. Separate
evidence/job.log and artifact-metadata.json retain the job and service receipts.
Local provenance files retain the proof-repair diff, baseline distance,
unexecuted checkout repair and source hashes. Those local text/hash receipts
are not mathematical verification.

## Preserved hold and handoff

The accepted baseline remains 95 states at
`6c28d8524fa008c6fb5aadb759df74a55ce96423`, table SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`.
Accepted sources, toolchain, manifest, old failed source and historical evidence
compare unchanged. The historical Chess pause file is preserved; separate
Parsimony work is untouched. Broader search and every further RH job are held.

The verification request remains unfulfilled: the repaired proof has not been
checked. [GATES.md](GATES.md) records the first runner obstruction and the
unexecuted finite-check gate as an explicit handoff, not successful verification.
