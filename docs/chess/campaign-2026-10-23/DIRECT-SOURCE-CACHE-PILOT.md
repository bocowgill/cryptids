# Alternative certificate interface: check decoded source directly

Status: proposed, unimplemented and unproved. This is a dependency for the
existing 459,315-state opportunity, not an additional state saving. Accepted
769,344; prospective target310,029. Full acceptance still requires G4/G5/G6.

Certificate43 establishes the kernel negative control but times out during
512-state offset setup. A separate proof for each of more than one million
binary rows remains a poor scaling prospect. The packed-cache design also
proposes a faithful 106,668-node literal graph. We may be able to remove that
extra graph-data category by checking cache equations directly over each exact
decoded source operation's lowering.

The finite source-table campaign is the first prerequisite. Its all-label
reconstruction theorem must identify every decoded operation with Snapshot.program
and preserve its meaning and lowering. That would let a checker lower the small
function-free operation tables without repeatedly normalizing original callbacks.
No original source operation, getter, layout or machine transition would change.

## Proposed proof boundary

1. Parameterize a local certificate by an arbitrary source label q, syntax p,
   and equality FieldPacked.syntaxRows.get q=p. Use the existing generic
   getter_syntax and slotIndex_val to relate every local slot to the original
   global getter. Validate cached transitions against p.fastNodeAt directly.
   There is no separately proposed global graph dump to trust or reconstruct.
2. Prove the cache equation by strong induction on local syntax position for
   load/branch only. Moves, writes, goto and halt are observable base cases.
   Goto remains a write to another source entry; control cycles are preserved.
   This is induction on pure syntax children, never on the chess/control graph.
3. Validate each source entry's numeric address and all forward return targets
   against the decoded source syntax and certified node/return prefixes. The
   frozen returnAt_syntax/findReturn_returnAt interfaces can justify write
   destinations without computing the original global inverse lookup.
4. Prove every global main state is represented by a source-label/local-slot/
   store triple, plus the distinct halted-main state; prove every paid return
   is represented by its halt or source-label/local-rank/store case. Existing
   layout bijections are ingredients, not a completed coverage theorem.
5. Check all cache lanes against classMap/Q and all paid bounce transitions.
   Include both bits, the halted-main missing transitions, initial-state swap,
   exact ranges and all return controls. Apply the original all-state halting
   equivalence theorem only after this universal relation is proved.

The cache, source table and forward-return checks are separate obligations.
Correct lengths, a native export, a valid quotient partition, representative rows
or a single successful operation never establish their complete conjunction.
Any raw address conversion must retain and prove its exact range; no modulo
conversion may conceal invalid data.

## Bounded acceptance gates before implementation

- [ ] D1: R3/R4 source gates pass with complete retained full-private audits.
- [ ] D2: A generic local-cache soundness theorem builds/audits under the existing
  60-second/6GiB helper limit, with arbitrary syntax, exact source correspondence,
  all observable cases and strict descent for pure children explicitly stated.
- [ ] D3: One actual nonconstant operation checks every lowered local slot, all
  ten bit/store lanes and all its forward return targets. Independently corrupt
  a callback, cache lane and return destination; require meaningful rejection.
  Retain timings showing which original per-row costs this removes.
- [ ] D4: A complete coverage/entry/return interface and all-source checker scale
  within predeclared bounds. Record a specific obstruction before retrying;
  do not raise limits or trade universal coverage for reachability or samples.

Proof difficulty and implementation effort are high. This route is attractive
only if the bounded pilot removes the separate global graph-fidelity stage and
repeated closed offset/source normalization. Compare those costs explicitly with
the saved packed-graph design before committing to the complete implementation.
All computation remains remote, frozen sources fixed, strict lint enabled,
outreach on hold and accepted full-machine savings zero in this resumed round.
