# Proposed next pilot: decoder sharing with unchanged words

**Historical approved contract, now executed once.** Read [RESULT.md](RESULT.md):
all 30 finite witnesses were independently reproduced, but the batched Lean
certificate failed Decidable synthesis. No retry or further job is authorized.
The original proposal wording below is preserved.

Status: **proposal only; awaiting the user's approval before any job launch**.
No candidate, new runner, Lean proof or execution result is supplied by this
document. The preparation uses lightweight source/provenance inspection only.

## One mechanism and one decisive question

Can one pair from S = {26, 46, 50, 86, 87, 94} share a physical decoder state
while retaining the accepted control words, tapes, native endpoints and returns?
All six rows have ZERO cell `0R58`. Their ONE cells are:

| Old state | ONE cell |
| ---: | --- |
| 26 | 1R33 |
| 46 | 1R60 |
| 50 | 1R64 |
| 86 | 1R89 |
| 87 | 1R94 |
| 94 | 1R43 |

The common ZERO column motivates this small family. The different ONE columns
are its likely obstruction. Source inspection supplies no equivalence or survival
claim. Matching endpoints on the entire typed language is the first proof kernel.
Keeping word bits fixed avoids the delimiter deletion that retired state 53.

## Frozen family and transformation

Use baseline `6c28d8524fa008c6fb5aadb759df74a55ce96423` and literal SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`.
Keep the pinned toolchain/manifest and the original blank state 0.

For each unordered pair a < b in S, consider either member as representative r.
Let x be the other member and define f(x) = r, f(q) = q for q != x.
The shared row is exactly r's old row: its ZERO cell stays `0R58` and its ONE
target is r's original ONE target, mapped by f. Every other retained row keeps
its old write/move, with destination mapped by f. Remove x, then apply the
order-preserving dense labeling d to the remaining states. In particular all
destinations, including self-loops and edges inside the pair, use d(f(target)).
This specifies the alias even for pair {87,94}, where 87/ONE points into the pair.
The source-to-candidate map is d composed with f.

There are 15 pairs and at most 30 fixed alias choices. This is one bounded
operator family, with no learned proposals, new target choices or combined edits.
Enumerate pairs lexicographically, testing the smaller representative first.
Analyze the choices as symbolic row aliases; **materialize at most one complete
94-state candidate table** in the entire job. Do not generate 30 full machines.
There is no second candidate if the selected survivor later fails.

All control-word bits, their lengths, padding positions, bank encodings and
native/return/jump/scanner routines stay fixed, up to the state map. State 53
is retained. No extra repair, initializer, bridge, state or table-cell edit is
allowed. Expected complete charge is D = 44 with every other component unchanged:
94 states, 188 cells, 187 defined. The sole absent cell is old 61/ONE under d
(new 60/ONE if x < 61, otherwise new 61/ONE). These are recipe predictions;
independent remote census must check the exported bytes if a table is generated.

## Typed language and rejection contract

Read the pinned `ControllerSchema95`, `ControlStep95` and `Parser95` definitions
as authoritative data. Bind every symbolic alias and fixture to their hashes.
The required parser endpoint equation is, for every typed control c,

```text
candidateWalk(d(f(15)), Control.walked c)
  = some (d(f(oldEndpoint c))).
```

Here oldEndpoint is the actual accepted read-preserving walk on that same word;
candidateWalk also requires the same writes, right moves and consumed length.
Define the aliases before dense labeling for analysis, and prove their agreement
with the eventual 94-state table. Native endpoints outside S retain their exact
identity under the map. A weaker observation such as matching the first ZERO
branch is insufficient.

Start with all 97 outside walked words and the entry/local schemas at depths
0..3 (22 local IDs). A failed choice gets the shortest failing word **within
that explicitly tested set**, then lexicographic bits, then typed ID/depth.
Record the complete typed input, alias choice, expected/actual endpoint and
earliest differing transition. An independent implementation must reproduce it.
Do not claim global shortestness or blank reachability.

If all 30 choices fail, stop alias analysis. Attempt one batched Lean certificate
of the 30 endpoint-contract failures, using the actual accepted definitions and
the frozen alias definition. Independent symbolic replay and two complete tape
replays for one representative failure (old machine and on-demand alias view,
with no exported 94-state table) bind the word contract to physical data.
Rejecting this contract retires this unchanged-endpoint family; it does not prove
blank-run inequivalence or rule out other relations/encodings.

If any choice survives the finite filter, select the first survivor in the fixed
order and stop considering alternatives. Prove its parser equation for arbitrary
natural recursion depth, using the actual regular form

```text
callerPrefix d = 111110 ++ (11110 repeated d times),
```

the entry tail `[0]`, and all 22 local walk suffixes, plus all outside walks.
`Parser.actual_prefix`, `actual_cycle`, `prefix_parse`, `localWalk_parse` and
`entryWalk_parse` motivate the induction; they concern the old machine and do
not automatically prove the candidate equation. A cycle or finite automaton
argument needs a Lean-checked invariant covering every depth. Do not replace it
by a larger finite depth bound. Stop at the first false equation or open lemma
if the universal check fails; do not try the next survivor in this job.

## Conditional full-machine path

Only after the selected universal parser equation is proved, export its single
candidate table, source map and census. Independent code checks all 188 cells,
all incoming edges, dense IDs, the initial state and the absent cell. Test
wrong-cell and wrong-count controls. No old-table count formula alone is enough.

The parser theorem is not the whole simulation. In particular, the merged states
could have other uses: inspect all affected transitions and prove the complete
native, jump, return and blank-initializer transport. Keep all extra registers,
both DEC branches, exhausted-root padding and terminal behavior. Prove positive
physical progress and both halting directions through the accepted unbounded
typed-control/stage chain. State-map equality is not assumed at cells where the
discarded ONE branch differs. No unrestricted quotient theorem is supplied here.

Finite physical screens use at most 128 complete root-frame fixtures, depths
0..3, plus one blank boot check capped at 20,000 candidate steps. Two witness
replays in the all-rejected path also count toward those 128 fixtures. All TM
replays and symbolic decoder transition evaluations combined have a
2,000,000-step cap. Compare full tapes, heads, bank effects and padding.
Bound exhaustion is inconclusive; it is not disagreement.

Credit a saving only after the new unconditional public theorem
`Halts candidate94 ↔ ¬ RiemannHypothesis` from state 0 on the blank tape,
a constructive strict state-count theorem, independent table/specification
comparison and default-kernel replay. Full-private closure auditing rejects
unsafe/partial dependencies, sorryAx, new axioms, challenge holes and native
proof oracles; standard semantic allowances are propext, Classical.choice and
Quot.sound. Keep counting constructive. Require fresh forbidden-axiom and
kernel-invalid-proof controls, strict warnings/linting and new Lean lines <=100.
A parser certificate alone earns zero RH state savings. Missing boot, macro,
closure, comparator or foundation evidence ends in the exact named obstruction.

## Same free remote resource ceiling

Proposed execution is one ordinary free `ubuntu-24.04` job on the existing public
`bocowgill/cryptids` fork, one running job, no retry. Recheck public/free status
and branch identity at launch; stop if unavailable. No purchase, paid capacity,
model API, OpenEvolve loop, SAT search or separate baseline replay job.
The 30 symbolic choices are the only expanded analysis allowance relative to
the first fixed operator; the one exported candidate and physical fixture caps
stay unchanged. Approval would cover this explicit family only.

| Stage | Wall cap, seconds |
| --- | ---: |
| Capacity and all dependency/toolchain/cache setup | 900 |
| Alias definitions, provenance and any single export/census | 120 |
| Typed-word rejection filters and finite physical screens | 180 |
| Batched negative certificate OR selected universal parser/physical kernel | 600 |
| Conditional strict candidate proof/comparator | 900 |
| Independent replay, full-private audit and controls | 450 |
| Evidence packaging | 30 |
| **Total from the initial job clock** | **3,180** |

Repeated use of a stage consumes its same cumulative allowance. Also cap each
stage at the remaining whole-job time. Outer workflow timeout stays 60 minutes.
Use the repaired optional cgroup v1/v2 probe; missing files are recorded as null,
not interpreted as unlimited capacity. Record admission capacity and actual use.
Enforce <=6 GiB aggregate child-session-plus-driver RSS, driver <=512 MiB,
Lean -M6144, LEAN_NUM_THREADS=1, and serialized real Lean invocations including
dependency builds. Keep the 0.05-second sampled aggregate watchdog and label the
recorded peak as sampled. Setup and all failed checks consume these budgets.
Stop on the first operational failure; no larger runner or automatic retry.

Generate, simulate, count, and invoke Lean/Lake/LSP/LeanProbe only remotely.
Local work remains text/source editing, Git/provenance review, small hashes and
retaining artifacts. A future implementation must use new RH-only paths, a new
concurrency key and evidence directory; preserve the state-53 historical runner
and evidence. Transport commits must skip CI; launch only after explicit user
approval with a reviewed, separate launch change. No launch mechanism is added
or exercised by this proposal.

## Required result and stop

Return exactly one of: (a) a kernel-checked batch of fixed-family contract
counterexamples, (b) a fully certified 94-state RH machine, or (c) the earliest
open equation, source-fidelity error, failed control or resource obstruction,
with completed checks and unexecuted stages distinguished. Keep per-choice
JSONL, full witness tapes/traces, source/table hashes, proof roots, commands,
logs and actual resource use. Finite survivors stay uncertified.

The accepted 95-state baseline and Chess pause remain unchanged in every outcome.
Broader search stays held after this pilot as well. Any new operator, second
candidate or additional job requires a separate proposal and approval.
