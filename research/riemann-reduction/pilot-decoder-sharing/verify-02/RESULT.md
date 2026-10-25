# Retained decoder witnesses verified — 2026-10-24 America/New_York

**The computable Decidable repair passed. All 30 retained endpoint counterexamples
are Lean-checked, and the full-private audit and rejection controls passed.**
This rejects the fixed decoder-sharing family's unchanged-endpoint contract.
The accepted RH baseline remains 95 states, with zero new certified savings.
The user has now [closed this fixed route](../CLOSED.md); this verified evidence
is retained unchanged. The closure launches no further job.

## Checked statement and unchanged inputs

The verified theorem is:

```lean
RhShare.all_aliases_fail : ∀ i : Fin 30, RhShare.failure i (RhShare.witness i)
```

Each failure asserts that the genuine accepted typed walk succeeds but its
symbolic alias has a different dense endpoint (or leaves the read-preserving
parser). `RhShare.family_exact` covers both orientations of every pair from
{26,46,50,86,87,94}. The witness count and dense range lemmas were also checked.
All four proof roots use `decide +kernel`.

The sole mathematical repair adds `RhShare.failureDecidable` in
`scripts/riemann_share/ShareDefinitions.lean`: `inferInstanceAs` exposes the
existing computable Bool and Option Nat comparisons beneath the named predicate.
No predicate, alias row, control word, theorem statement or witness ID changed.
There is no Classical decision oracle, new hypothesis, sorry or native proof oracle.

The job copied the original retained ShareCertificate.lean byte-for-byte. Its
SHA-256 remains:

```text
68d218019755897c2fcc67f3ab3594fd4c279ac35240668766e9f1c1791d466e
```

It also checked all six retained-file digests and verified that removing exactly
the instance insertion recovers the definitions at failed producer
`8f3bda3344561fcb2d81987f8dfc48eeac1413ef`. Independent Node code bound the
retained witness list to actual source words and replayed only those 30 endpoint
calculations: 515 transition evaluations, zero new alias/fixture searches.
Wrong-cell and wrong-alias-count controls were rejected. No table was generated,
no candidate exported, and no physical tape simulation rerun in this job. The
prior independently replayed complete tapes remain retained and hash-bound.

## Kernel, audit and controls

[Run 40145261135](https://github.com/bocowgill/cryptids/actions/runs/40145261135),
job `121025114709`, attempt 1, succeeded on the ordinary free public-fork
ubuntu-24.04 runner. Producer:
`18e8cc2907fbf20b95f52b2cbdfaac5c8991be4b`.
CI-skipped source transport: `af6db67b89a92d4d28a0b2e8d9448c03ade19991`.

| Check | Retained outcome |
| --- | --- |
| Exact prior witness/source binding | Exit 0; all pins matched; instance-only mathematical repair |
| Independent fixed endpoint replay | Exit 0; 30 witnesses; 515 evaluations; no search |
| Strict Lean build | Exit 0; ShareDefinitions and unchanged ShareCertificate built |
| Full-private audit | Exit 0; 4 roots, 774 dependencies; propext and Quot.sound only |
| Main theorem axiom print | RhShare.all_aliases_fail uses only propext |
| Injected sorryAx audit root | Rejected, exit 1: Forbidden axiom: sorryAx |
| Fresh kernel-invalid proof | True.intro : False rejected, exit 1 |

The audit traversed types, available opaque/private values, inductive constructors
and recursor rules, rejecting unsafe/partial dependencies and nonstandard axioms.
Its aggregate four-root closure uses two permitted axioms; do not confuse that
with the main theorem's smaller propext-only closure. Fresh controls, their
commands, exit codes, logs and output hashes are in the retained artifact.

This separately authorized verification resolves the first job's Decidable
synthesis error. The original failed run, original kernel log and its artifact
remain unchanged. There was exactly one additional compute job and no retry.

## Actual resources and retained artifact

| Governed stage | Seconds | Cap |
| --- | ---: | ---: |
| Retained-byte/provenance binding | 0.092 | 120 |
| Independent fixed replay/controls | 1.971 | 60 of the 450 audit allowance |
| Dependency/cache setup | 100.974 | 884.157 remaining setup allowance |
| Strict kernel build | 211.002 | 600 |
| Full-private audit and kernel controls | 19.618 | Remaining 390 audit allowance |

Initial checkout/toolchain/cache restoration consumed 13.738 seconds. Total from
the job clock was **347.438 seconds**, below 3180. The GitHub run spanned
2026-10-25 00:04:30–00:10:26 UTC (356 seconds including platform setup/cleanup;
October 24 locally). Artifact upload took under two seconds, within the 30-second
packaging allowance. The optional candidate/comparator stage was unused.

Sampled child-session-plus-driver peak RSS was **6,280,089,600 bytes (about 5.85 GiB)**,
below 6 GiB. Driver peak was 13,541,376 bytes, below 512 MiB. All 39 real Lean
invocations were serialized, including dependency builds, with -M6144 and
LEAN_NUM_THREADS=1. The 0.05-second aggregate RSS watchdog was active. No resource
stop occurred. New full accepted-baseline comparator replays: zero.

The repaired capacity probe recorded physical RAM 16,766,414,848 bytes and
admission availability 15,300,640,768 bytes. Visible cgroup v1/v2 limit files
were absent and recorded as null; absence does not establish unlimited memory.

Artifact `12580686076` (16,257 bytes) is retained intact as `evidence/artifact.zip`
and extracted in `evidence/unpacked/`. Its measured SHA-256 equals GitHub's digest:

```text
98240a6cffd58954b5511886e4cebd0f4ef86da7fe2864a775d43bc677125edb
```

Repaired ShareDefinitions.lean SHA-256:
`ae0c7ab078f877d14454796289b412f44de6b2302ef80165b4235e7e749ebf37`.
Local activity only edited/read sources, reviewed Git provenance, measured small
hashes and retained/extracted bytes. No local Lean/Lake/LSP/LeanProbe, simulation,
generation or executable state census ran.

## Scope and hold

The finite witnesses now formally refute the required endpoint equation for each
of the 30 fixed aliases. This is not a certified 94-state RH machine, a blank-run
inequivalence proof, a blank-reachability result, a global shortest-witness claim
or a lower bound ruling out other encodings/relations. No universal positive
parser, initializer or RH proof was attempted after the retained failures.

All four verification integration gates are met: zero unmet or abandoned.
Accepted sources, specification, artifact, toolchain and manifest stay pinned to
`6c28d8524fa008c6fb5aadb759df74a55ce96423`. The canonical state-53 route remains
closed. The older Chess campaign's pause record is unchanged; separate Parsimony
work and all Chess goals/jobs were untouched. Broader search and further RH jobs
remain held. This additional-job authorization is consumed.
