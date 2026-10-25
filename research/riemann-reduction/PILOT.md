# First pilot: one-state pass-through decoder removal

**Historical proposal; canonical route now closed.** The verified return-pop
counterexample retires the skipped-bit/unchanged-return construction described
below. Read [pilot-53/CLOSED.md](pilot-53/CLOSED.md). The subsequently approved
[decoder-sharing pilot](pilot-decoder-sharing/verify-02/RESULT.md) now also has
Lean-checked endpoint counterexamples after a separately authorized repair/check.
Nothing in this retained document authorizes another job.

Proposal only. The initial audit ends before implementation or execution.
Target: one certified state saved, 95 -> 94. No larger saving is promised.

## Exact scope and proposed machine recipe

Use the pinned 95-state literal table as the only starting machine.
Investigate a shorter typed-word encoding that removes the bit consumed in
state 53, whose row is `0R68 1R68`. The visible incoming edge is 40/ONE = 1R53.
Before generation, remotely enumerate **all** incoming cells and reject this
recipe if there is an unaccounted entry. Do not assume this source inspection
is an exhaustive graph certificate.

The single permitted table transformation is: redirect that edge to old 68,
remove old 53, and densely relabel all retained IDs. The relabeling is q -> q
below 53 and q -> q-1 above 53; state 0 stays state 0. Destinations into 53 must
all be covered by the bypass rule. No other write, move or target edit is allowed
in this pilot, and no replacement state is free.

Future mutable artifacts must use separate RH pilot paths (for example new
candidate/challenge modules, `artifacts/riemann_94_pilot/` and a dedicated comparator
config). Do not edit the accepted table, existing Challenge, proof layers or
historical evidence to make a candidate pass. New physical proof wrappers may
import accepted mathematical facts while keeping their new obligations explicit.

Expected accounting, conditional on generating exactly that recipe:

| Component | Baseline | Proposed |
| --- | ---: | ---: |
| D: decoder including root/dispatch | 45 | 44 |
| L: arithmetic leaves | 10 | 10 |
| I: INC core/selectors, including shared jump 70 | 7 | 7 |
| C: DEC core/selectors, including blank entry 0 | 11 | 11 |
| R: register returns | 4 | 4 |
| P: padding / pop | 2 | 2 |
| S: guarded scanner / root recovery | 4 | 4 |
| J: jump and bridge pool | 11 | 11 |
| H: shared HALT terminal | 1 | 1 |
| New initializer / dispatcher / bridge states | 0 | 0 |
| **Complete total** | **95** | **94** |

New cells: 188, 187 defined, sole absent cell old 61/ONE -> new 60/ONE.
Old 68 becomes new 67; the changed 40/ONE cell would therefore be `1R67`.
These are recipe predictions, not measured candidate data. A future remote
census must derive them independently from the exported literal bytes and
produce a state-by-state map. A required extra state makes the target fail.

## First obstruction to resolve

Removing a read-preserving move changes the head position on the old control
word. A speedup argument alone cannot justify the deletion. First define an
encoding E of **complete** typed control frames, with E([]) = [], and show it
commutes with instruction transitions and the concrete continuation operations.
The arithmetic values and stage criterion must stay fixed.

In particular, cover `popBreakRev` for both DEC outcomes, `popContinueRev` for
jumps, root-sentinel restoration, padding changes and arbitrary extra registers.
No dummy input bit may be assumed preloaded on the blank tape. The decoder's
unbounded recursive caller language needs a proof for arbitrary natural depth,
not a finite expansion of the 121 logical labels.

If the existing stack-pop protocol cannot realize E with this table edit,
reject the pilot with its smallest offending typed word and before/after full
frame. Do not add a repair loop or a bridge state during this pilot. A negative
result is useful evidence about this operator, not a lower bound on RH machines.

## Staged gates

1. **Pin and schema gate.** Recheck upstream/table/toolchain identity and the
   manually supplied ledger against literal bytes remotely. Establish the full
   incoming-edge set, the E definition and its required pop/return equations.
   If an equation is false, retain a concrete witness and stop. If proof work
   cannot close it within budget, record the first open equation and stop.
2. **Artifact gate.** Generate at most one explicit two-symbol table using the
   recipe above. A strict data-only parser checks all cells, destinations,
   initial state, dense state IDs and absence cells. Independent census validates
   the complete 94-state count. Record raw/canonical SHA-256 and source-map bytes.
3. **Rejection filters.** Compare full decoded words, heads, banks, padding and
   tape frames at small depths and both DEC branches; include root exhaustion,
   positive/zero registers and shared-return boundaries. Check the blank boot
   against the entire required root tape within 20,000 candidate steps. Use at
   most 128 recorded frame fixtures, depth 0..3, and 2,000,000 TM steps total.
   Fuel exhaustion is a bounded-screen failure/inconclusive result, not proof
   of semantic disagreement. Every finite pass remains only a rejection filter.
4. **Universal proof gate.** Prove candidate parsing and physical macro execution
   for every `Schema.ControlWord`, all valid padding, active register values and
   extras. Transport unchanged arithmetic contracts through the new labeling;
   old Fin-95 theorems do not automatically apply to Fin 94. Prove the complete
   blank initializer, terminal fidelity and positive macro progress. Assemble
   both halting directions using typed closure and unbounded stage cofinality.
5. **Public theorem gate.** The complete candidate must satisfy
   `Halts candidate94 ↔ ¬ RiemannHypothesis` from state 0 on the blank tape,
   and `candidate94.states < Riemann95.candidate.states`. Equivalence to RH104
   alone without the final RH statement is insufficient. No added hypotheses,
   changed RH definition, `sorry`, unproved closure assumptions or unsafe/native
   proof oracle. Keep strict warnings/linting and new/generated Lean lines <=100.
6. **Independent specification and foundation gate.** Load the exported literal
   table separately in a candidate challenge, compare all 188 cells and theorem
   dependencies, run default-kernel comparator replay and audit the full private
   dependency closure. Allow only `propext`, `Quot.sound`, `Classical.choice` for
   equivalence/semantics; keep constructive state-count checking stricter. Reject
   sorryAx, extra axioms or a challenge hole in the solution closure. Test a wrong
   cell/count and a wrong theorem through the relevant rejection paths, and a
   fresh kernel-invalid proof as a control. Retain each control's command/result.
7. **Regression and recovery gate.** Retain the accepted baseline unchanged;
   recheck its pins and existing strict comparator targets. Archive every stage's
   commands, statuses, actual resource use, source/table/proof hashes, proof roots,
   complete census and the earliest failure. A canceled/timed-out stage earns no
   proof credit. Complete a distinct final adversarial review before acceptance.

The existing semantic chain to reuse is: typed control program -> exact physical
stage outcomes -> stage-zero witness/cofinality -> RH104 arithmetic criterion ->
Mathlib RH. `Algorithm.residual_eq`, `residual_criterion` and the abstract typed
program facts can remain unchanged. A new physical implementation still owes
the counterparts of `physical_stage_outcomes` and
`physical_stage0_halts_iff_witness`; writing their names is not a proof.

## Resource contract before any future execution

The audit used **zero remote compute jobs and zero baseline replays**.
This future pilot is capped at one ordinary free `ubuntu-24.04` GitHub-hosted
job on the already-used public `bocowgill/cryptids` fork, isolated by a new RH-only
concurrency key and evidence directory. Confirm it is still public/free before
dispatch; otherwise stop without enabling billing or acquiring capacity.
The current worktree has only upstream origin: do not push to that origin.
No workflow or job is created by this proposal.

| Stage | Wall cap, seconds |
| --- | ---: |
| Capacity, dependency restore/setup | 900 |
| Generate, census, data corruption controls | 120 |
| Finite word/frame/boot screening | 180 |
| First universal encoding/physical-kernel checks | 600 |
| Strict candidate build and candidate comparator | 900 |
| Full-private audits and accepted-baseline regressions | 450 |
| Evidence packaging | 30 |
| **Whole process group plus driver** | **3,180** |

Workflow outer timeout: 60 minutes; enforce the smaller 3,180-second total so
cleanup fits. Setup, exports, audits and failed checks consume that same budget.
At most one candidate, one running job, one Lean process; LEAN_NUM_THREADS=1;
Lean `-M6144`; process group plus driver <=6 GiB, driver <=512 MiB; retain actual
host capacity and peak RSS. Kill on the aggregate cap, not just individual child
caps. No automatic retry, larger memory, paid APIs, purchased runner or baseline
replay job. Diagnose any failure before proposing a separate revised pilot.
If setup leaves too little proof time, record the truncation; do not report the
later stage as a full-budget trial.

No OpenEvolve loop or external model is needed for this fixed first operator.
For a later authorized search, reuse the chess evaluator's strict data grammar,
seeded proposals, immutable pin packet, per-candidate JSONL, failure feedback and
checkpoint interval of one. An LLM may propose only reviewed operators/parameters;
proposals are untrusted data, never executed Python or proof authority.
OpenEvolve's scheduler may rank them only after an RH-specific evaluator exists.
Do not assume chess compiler policies, hardcoded count formulas or quotient
certificates apply to this direct arithmetic/tape construction.

Keep two separate metrics: complete literal-state count and certified status.
Only certified candidates can improve the accepted score. Failed/unknown checks
get an invalid score, never an apparent zero-state reward. Measure whole-recipe
time including fidelity/loading, assembly, regressions and audits; chess's newer
numeric checker established correspondence without improving its screening
whole-recipe times. No small timing result here would justify a scalability claim.
