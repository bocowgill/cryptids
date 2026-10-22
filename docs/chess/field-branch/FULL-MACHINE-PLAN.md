# Getting back to reductions of the complete chess machine

The recent field-aware modules do not reduce the accepted complete machine.
They are certified fragments of a replacement backend. Completing one more
continuation does not make the replacement usable by the existing machine.
The distinction should have driven the campaign's milestones sooner.

## Why the accepted count has stayed fixed

The accepted total is 390,491,642 states: a 388,936,461-state body and a
1,555,181-state paid initializer. These figures and their halting theorem are
recorded in the frozen `docs/chess/openevolve-wide/RESULTS.md` and
`artifacts/chess_openevolve_wide/table-map.json`. The earlier broader campaign
did reduce the total by 1,555,179 states; the later field pilots have saved zero
states in the accepted full construction.

The accepted body uses the combined 1,250-symbol simultaneous-stack alphabet
and an eleven-bit whole-cell codec. The new routines use four three-bit fields
and one marker bit: thirteen bits per source cell. The representations differ
across the whole tape. Subtracting a new module's count from the old body's count
would not produce a machine with an established semantics. A local tape-format
adapter has not been constructed or shown to pay for itself.

The new fragments prove finite boundary-to-boundary executions. The full result
requires a compiler that accepts the entire frozen interpreter and establishes
progress, simulation and halting reflection from its actual initialized tape.
The numerical state sum for that resulting machine must include initialization,
all operation dispatch, every return and all exits. Those assembly obligations
are still open. These fragments are useful kernels, but they do not discharge
that whole-machine theorem.

## Change the unit of work

After the requested ret-s003 extension, stop hand-porting successive labels as
the main state-reduction strategy. Work by *compiler family*, with one complete
machine as the acceptance target. A family theorem should cover every instance
of its operation; it should not require a new manual proof per source label.

1. **Complete the generic lowering and its simulation.** Parameterize stack
   fields, store tables and continuations. Cover normal dispatch and pure
   load/branch/goto/halt; return-to-marker; and go/scan with push, peek and pop
   on every stack coordinate. Reuse the certified field routines, global tape
   frame lemmas and finite-execution lifting. The new s003 proof supplies a
   concrete store-dependent return example, not a certificate for this family.
   Acceptance: an allocator and operational theorem for every source operation
   used by the frozen runtime, with no per-label manual proof obligations.
2. **Assemble the actual frozen interpreter and paid initial tape.** Instantiate
   the family compiler on all supported controls, connect every continuation,
   encode the complete frozen source/data input in the thirteen-bit layout,
   and include a paid blank-tape initializer. Prove well-formedness, preservation,
   progress and both halting directions. Acceptance: a named closed two-symbol
   machine whose halting is equivalent to the unchanged chess proposition.
3. **Certify and measure the complete replacement.** Obtain its exact state
   count and an independently defined numeric-row recipe with universal
   correspondence. Run the existing chess regressions and reject corrupted
   dispatch, store, frame, initialization and accounting claims. Acceptance:
   a kernel-checked total strictly below 390,491,642, preserving
   `Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`.

A remote source inventory is recorded in this extension's fixture receipt.
It describes literal runtime constructors and shared-label forms. It does not
measure compiler coverage, prove reachability, predict a replacement count or
justify any percentage-complete claim.

## Timing and the next campaign contract

There is no evidence-based calendar ETA yet. This is a substantial compiler and
proof integration effort, rather than one or two more continuation hookups.
Plan for multiple substantial work sessions, with the possibility of days or
longer if the generic simulation or halting-reflection bridge resists. This is
a planning judgment, not a measured forecast or a promised completion date.

The next campaign should target the three gates above in one sustained effort.
Its first checkpoint should expose the complete generic compiler interface and
all remaining proof obligations; its completion criterion should be the strict
full-machine reduction, not another standalone module. If the complete compiler
does not fit or a proof fails, retain the exact obstruction and reassess that
route before spending more sessions on isolated labels. A certified full saving
has priority over further local polishing or an enlarged search budget.

The frozen chess specification stays fixed, all substantive computation remains
remote, and outreach remains on hold. This assessment authorizes no later
implementation beyond the user's current extension request.
