# Proposed next pilot: certify avoidance of cell 41/ONE

**Approved for one free remote job, no retries, on 2026-10-24.**
The job is complete: [RESULT.md](RESULT.md) records the local Lean source failure,
checked literal roots and independently replayed finite filters. Global avoidance
is unproved; no further job is authorized. See [GATES.md](GATES.md).
The original proposal wording is preserved below.
Original status: proposal only; approval required before launch.
This is a proof-only prerequisite pilot, with zero optimized candidates, zero
exported tables and zero state savings claimed. Preparation is lightweight
source/provenance inspection; none of the proposed checks has run.

## Mechanism and first kernel

The accepted table's actual state 41 is a decrement selector whose ZERO cell is
`0R54` and ONE cell is `1R80`. Source inspection finds the incoming transition
`58/ONE = 0R41`. State 58 is the DEC-j leaf: it fills zero padding via `1R58`
until meeting the root frame's register separator `10`. Its ONE step changes
the first separator bit and moves to its following ZERO, where 41 reads ZERO.

This suggests a useful invariant: **every executed entry to 41 reads ZERO**.
The retained bootstrap's zero visits to 41/ONE are only finite evidence; they
do not establish this invariant for the unbounded run. Nor is the textual
incoming-edge inspection an exhaustive machine certificate. Both gaps are
explicit tasks for this pilot.

The fixed decoder-sharing family is [closed](../pilot-decoder-sharing/CLOSED.md).
This pilot changes neither its contract nor any alias. The logical-program
alternatives remain speculative: the paired increments preserve two live values,
and no justified single-row deletion was identified in this source review.
The present pilot isolates one concrete tape guard before proposing cell reuse.

## Frozen target and scope

Use only baseline `6c28d8524fa008c6fb5aadb759df74a55ce96423`, table SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`,
and its pinned Lean/toolchain/manifest. All state numbers here are actual Fin-95
labels, not auxiliary labels. Preserve accepted sources and historical evidence.

Write Avoid(c) for: c is not in state 41 reading ONE. The principal target is

```text
For every n and configuration c,
  nSteps(machine95, n, blank-state-0) = some c  implies Avoid(c).
```

If this is proved, also prove the one-cell isolation corollary: replacing only
41/ONE by any transition (including absence) in a machine with the same 95-state
type leaves every blank-run finite prefix unchanged. This is a first-difference
induction using the original run's avoidance; it must not assume the modified
run avoids the cell. No concrete replacement table is generated.

This corollary permits only the isolated overwrite. It does **not** justify
removing state 41, redirecting another edge into it, merging any states, or
combining the overwrite with another rewrite. Such changes may make 41/ONE
reachable and invalidate the premise. Even a complete success saves zero states;
a later reuse candidate would need its own concrete recipe and approval.

## Proof and rejection gates

1. **Literal fidelity.** Independently parse the accepted table and prove over
   all cells that the only edge entering actual 41 is old 58/ONE, with write
   ZERO and direction RIGHT. Check the two 41 cells and 58's fill loop against
   the actual Lean transition function. Stop on a mismatched cell or extra entry.
2. **Separator guard.** Prove that at every reachable 58/ONE step in an admissible
   typed native call, the cell immediately right of its head is ZERO. Use the
   complete frame `Physical.rootCfg`, the actual leaf-fill path and separator
   `[1,0]`; quantify over valid padding, arbitrary bank values and extra banks.
   Include every intermediate configuration, not just native entry/exit tapes.
   An invented arbitrary tape at 58 is not an admissible native caller.
3. **Macro coverage.** Strengthen the existing parser/native/jump/return paths
   with Avoid at every intermediate step. Cover every Schema.ControlWord,
   arbitrary natural recursion depth, both DEC branches, extra-bank growth,
   root exhaustion and padding credit. Prove avoidance on non-DEC-j paths too;
   classifying 58 as a leaf does not itself rule out other physical entries.
4. **Bootstrap and unbounded assembly.** Kernel-check avoidance throughout the
   actual 3634-step blank initializer, bind its full terminal tape to the accepted
   initialRoot, then compose the refined macro traces through typed closure and
   positive progress. Cover every finite time, terminal/halt configurations and
   all stage prefixes. The accepted end-to-end stage theorem is a starting point;
   its endpoint equality alone does not certify intermediate avoidance.
5. **One-cell isolation.** Prove equality of all finite prefixes under an arbitrary
   overwrite of this one cell, using the full avoidance theorem. Keep the same
   initial blank state, machine size, alphabet and all other transitions.
6. **Verification.** Strict default-kernel build and full-private audit of all
   new proof roots; reject unsafe/partial dependencies, sorryAx, new axioms,
   challenge holes and native proof oracles. Only propext, Quot.sound and
   Classical.choice are permitted semantic axioms; record those actually used.
   Require an injected sorryAx audit rejection and fresh kernel-invalid proof
   rejection. The finite hit detector must reject the known false avoidance
   claim for cell 0/ZERO, which is read at the initial blank configuration.

Potential reusable sources are `Parser95.lean`, `RootNative95.lean`,
`ArithmeticDispatch95.lean`, `Padding95.lean`, `Auxiliary95RawPhysical.lean`,
`Return95.lean`, `Bootstrap95.lean`, `PhysicalTrace95.lean` and `Stage95.lean`.
They establish parsing, full frames and macro/stage outcomes, not this new
all-intermediate-step invariant. New lemmas belong in a separate pilot module;
do not edit an accepted theorem to add the desired guard as a hypothesis.

## Bounded finite rejection filters

Remotely replay the unchanged blank initializer, at most 20000 steps, recording
the first target-cell hit or the full certified initialRoot tape. Independently
replay the same receipt. A finite pass is only a filter for the proof above.

For native-frame probes, form the actual outside, entry and local typed callers
at depths 0..3 whose effect is DEC-j (physical register 4). Sort by walked length,
bits and typed label; retain the first 16, or all if fewer. For each, use the
four active-bank vectors [0,0,0,0,0], [1,1,1,1,1], [0,1,2,3,4] and [4,3,2,1,0],
each with either no extras or extras [0,1,0,2]. This gives at most 128 fixtures.
Use pad = max(22, walked.length+3); preserve whole finite tapes, heads and every
transition through the first next root, halt, target hit or 20000-step bound.

Primary and independent replays share a 2000000-transition global budget,
including boot and any decoder evaluations. Reserve the independent replay's
allowance before starting each fixture. Stop at a concrete mismatch, resource
limit or inconclusive bound; do not widen the fixtures. A valid typed-frame
counterexample refutes that proposed macro guard; it is a blank-run counterexample
only if an actual blank-to-frame trace is also certified. Do not conflate them.

## Same remote-only limits

Proposed budget: one ordinary free ubuntu-24.04 job on the existing public
bocowgill/cryptids fork, one concurrent pilot job, no retry. Check public/free
status and branch identity before dispatch; stop if unavailable. No paid runner,
purchase, external model/API, SAT search or separate baseline replay job.

| Stage | Wall cap, seconds |
| --- | ---: |
| Capacity and all setup/toolchain/cache work | 900 |
| Pinned-source and incoming-cell fidelity | 120 |
| Bounded finite boot/frame filters | 180 |
| Local separator/avoidance kernel proofs | 600 |
| Unbounded trace assembly and isolation corollary | 900 |
| Independent replay, full-private audit and controls | 450 |
| Evidence packaging | 30 |
| **Total from the initial job clock** | **3180** |

Stage allowances are cumulative and capped by the remaining total. Outer workflow
timeout stays 60 minutes. The 6 GiB aggregate child-session-plus-driver RSS limit,
512 MiB driver cap, -M6144, LEAN_NUM_THREADS=1 and serialized real Lean invocations
include dependency builds. Keep the repaired optional cgroup v1/v2 probe and
0.05-second aggregate watchdog; retain capacity and label peak RSS as sampled.
Missing cgroup files are not evidence of unlimited memory.

All Lean/Lake/LSP/LeanProbe, generation, census and simulations remain remote.
Local activity remains source/document editing, provenance inspection, small
hashes and retaining artifacts. Use separate future pilot paths, concurrency
and evidence. No runner code, workflow or launch packet is created here.
Future source transport must skip CI; launch only after the user's approval.

## Result and stop

Return either the kernel-checked avoidance theorem and isolation corollary with
their audits/controls, or the first false local implication, actual target-cell
hit, missing trace-coverage lemma or resource obstruction. Distinguish completed
checks from unexecuted proof obligations. If only a local separator lemma is
proved, report it as local evidence and name the unproved global assembly.

Retain source/table/proof hashes, commands, logs, exact witness tapes/traces,
proof roots, actual resources and unchanged-baseline receipts. No positive finite
screen or successfully overwritten cell earns an RH score. The accepted machine
stays 95 states in every pilot outcome. Chess stays paused, broader search stays
held, and any later optimization candidate requires a separate approved proposal.
