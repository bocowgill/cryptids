# Two-pilot memory comparison and route decision

The user explicitly authorized revising the campaign's self-imposed memory cap
for this experiment: compare6GiB with10GiB on the existing free GitHub-hosted
runner, permitting at most12GiB only with sufficient headroom. Initial phase is
exactly TWO pilots,6and10. No12GiB run is scheduled. All other correctness,
time, frozen-source, remote-computation and outreach constraints remain fixed.

Accepted complete machine769344; target310029; prospective saving459315.
No new accepted full-machine saving. This experiment cannot accept a new machine.

## Diagnosed bottleneck and fair comparison

Certificate19 direct actual-row normalization hit the6GiB process-group cap in
38.335s while checking the original64-state sample. This is an actual recorded
memory failure. The later structural512-state path in43 instead timed out180s
at3.595GB; more RAM cannot directly fix that observed time obstruction. All-source
trial48 also timed out60.067s at3.548GB after127chunk markers; no complete module
or audit credit. Do not confuse these time failures with memory exhaustion.

Replay the EXACT literal data and proof files retained in certificate19 under
the same current bounded driver in BOTH pilots. Verify every retained byte hash,
all3116accepted pins, exact component root censuses and fresh proof builds. Only
the generated experiment Lake configuration and process-group memory budget
differ between pilots. Historical files and the normal campaign cap stay fixed.
No per-proof markers or new imports are inserted into the compared proof source.

Each standard ubuntu-24.04 job runs only in the public fork, with read-only
repository permissions and GitHub-hosted environment enforced. No paid runner,
purchase, larger-runner label or billing setting is introduced. The new workflow
starts on its own workflow-file push or explicit dispatch. Its initial push
starts the fixed matrix[6,10]; DO NOT dispatch a duplicate. Fail-fast=false and
max-parallel=1 preserve both outcomes. Different assigned hosts are a source
of uncertainty. There are no automatic retries.

## Capacity and coordinated limits

Before dependency preparation and again before measured proof stages, read actual
/proc/meminfo, /proc/self/cgroup, visible cgroup-v1/v2 memory max/high/current/stat,
address-space/data limits and CPU affinity. Admission requires budget plus2GiB
reserve within host MemAvailable and every visible effective cgroup ceiling.
Only inactive file pages are treated as reclaimable. Save raw readings, not just
the admission result. Insufficient headroom blocks the job rather than allocating
paid resources or pretending a10GiB test happened.

Measured Lean builds use-M6144/-M10240 respectively, while the existing resident
memory sampler caps the entire process group plus driver at6/10GiB. Driver cap
stays512MiB. The native full-private auditor is subject to the same group cap;
its allocator has no separate CLI cap. Record actual commands and peak RSS.
The unchanged frozen dependency preparation uses the original6GiB Lean setting
in both jobs and is excluded from the compared proof-stage throughput.

Time budgets stay unchanged:120s auditor build,60s loaders/template smoke,
240s map-data/180s quotient-data loading with their audits; shared120s complete data
chain plus union32root audit;64states120s,512states180s,4096states210s. Each
sample budget includes its full-private audit. Later tiers run only after the
previous tier succeeds. Overall orchestration remains1200s, job45minutes.

## Acceptance and decision gates

- [ ] P1: Retain both capacity reports, exact manifests/configuration differences,
  full logs, resource outcomes, runtime, peak RSS and freshly audited coverage.
- [ ] P2: Compare both trials together. A partially elaborated module earns zero
  completed row-module credit. Distinguish data coverage, actual rows, kernel
  controls already retained in43, and remaining universal/full-machine work.
- [ ] P3: Decide explicitly whether to continue, redesign or abandon the tested
  route. If10GiB merely postpones memory failure or reaches a time limit without
  useful row coverage, abandon monolithic closed-row normalization as the full
  certificate route; continue the target through reusable structural certificates.
- [ ] P4: If additional RAM materially improves audited throughput, small samples
  still cannot establish scaling. Before committing to this route, measure
  increasing substantial portions, including at least1/16and1/4of the body,
  and account for proof assembly, full-private audits, memory growth and final
  full-machine linkage. Report an estimated total runtime range and assumptions;
  do not extrapolate a tiny sample as a reliable complete-machine cost.

No completed comparison exists yet. A reusable observed-cache/source-slot
certificate is the proposed alternative, designed to eliminate repeated global
normalization and a separate literal graph-fidelity stage. See
DIRECT-SOURCE-CACHE-PILOT.md. It remains unimplemented and unproved. Complete
source trial48's remaining boundary overhead also remains unlocalized; do not
repeat it unchanged while this memory comparison is pending.
