# Proposed complete certificate: packed binary-transition cache

Status: unimplemented and unproved. This is a candidate format for the complete
relation, not a new state-count result. Accepted769344, target310029, prospective
saving459315. Proof difficulty high; implementation effort high. The entire
saving belongs to the already measured114487state quotient of the573802body.
Cache/serialization data are proof artifacts and add no runtime machine states.

Motivation: closed source-row elaboration is costly, and millions of named
actual/RowAt theorems may exceed memory even if small samples pass. Use a generic
structural checker and packed literal certificates instead. The current symbolic
write pilot tests one essential equation; it never establishes this design.

## Eliminate inverse return lookup from the proof

The frozen FieldSelectiveLayout already proves findReturn_returnAt and
returnAt_injective. In particular, a checked equality returnAt j=target implies
findReturn target=some j, directly by congruence and findReturn_returnAt. No
computation of the old partial inverse is needed. A proposed write destination
can be checked against a faithful forward return-decoding table instead.

First bind that entire forward table to the source. Every row contributes its
root plus literal write children, each with all five store values, plus the
shared halt return. Universal operation weights already establish the counts.
Return-target positions should also depend only on lowering shape, not callback
values. Prove that separately, preserving target order; inspect all four write
fields and every other constructor. Use frozen127operation chunks and checked
prefixes to certify all8092local targets and all40461paid return decodings.
A native table or correct length alone is insufficient.

## Finite source-operation data, then source-graph fidelity

Reify callback tables once:5cells for write/pureLoad/branch/jump,25for load.
Prove typed encode/decode reconstruction for arbitrary source operations. Check
source reification against literal Snapshot chunks, avoiding independent global
program/vector lookup for each numeric node. Prove lowering/serialization
commutes with reconstruction, then identify complete numeric node/entry tables
with the actual frozen getter through its certified local-slot bijection and
shared node offsets. Prove all raw child/store/label ranges before any modulo
conversion could hide an invalid value. Preserve goto cycles: only pure syntax
children descend, not the complete machine's control graph.

## Cache binary main transitions, not full auxiliary descriptors

A candidate cache has one packed natural per106668syntax nodes, with ten lanes
for scanned bit/store pairs. Each lane encodes the resulting *binary* main-row
transition. Reuse the existing checked packed-row codec; choose a fixed lane
width only after proving the concrete573802state codec bound. For example a
32bit lane is a proposal, not an established bound. Validate canonical word and
lane bounds; reject an unexpected missing transition for a live Post control.

Check local equations against faithful source-node data:

- move: output preserves the scanned bit, uses the actual direction, and targets
  the numeric main encoding of child/current store;
- write: output uses the actual table cell, moves right, and targets a paid return
  whose faithful forward decoding is the encoded child/current store;
- load: copy the child's cache lane with the newly read store;
- branch: copy the selected child's lane with the current store;
- goto: write the scanned bit, move right, and check the proposed paid return
  against the faithful source entry/current store;
- halt syntax: write the scanned bit and use the shared halt return, whose forward
  decoding is the distinguished halted Post control.

A generic soundness proof uses strong induction on source node position only for
load/branch. Existing trAux equations and symbolic compilation equations connect
these checks to the exact original body. For write/goto/halt, a forward-return
check plus findReturn_returnAt justifies the original lookup. Observable moves
and writes are base cases; no termination assumption about chess/control loops.

The distinguished halted Post main state is separate: both source transitions
are missing. All paid binary bounce rows preserve the bit, move left and use the
faithful forward return decoder. Prove numeric coverage of every main/live/store
and bounce state, including the CompactPost initial/halt swap. Do not infer full
coverage from sampled indices or reachability.

## Complete quotient checker and acceptance

Check every source numeric row against Q after classMap: all ten live lanes per
node, both halted-main bits, and both bits for every paid return. Use named
balanced chunk facts and one-pass soundness to avoid millions of declarations.
Source data, cache validity and quotient relation are distinct proof obligations.
Packed lanes reduce proof-data overhead; they do not justify omitting any row.

Pilot gates: first generic symbolic equations; then one source-operation chunk
and constructor family with corrupted callback/return/cache controls; only then
measure scalable complete certificates. Preserve existing6GiB and bounded-stage
limits, strict lint, ordinary kernel proof authority and full-private audits.
No native_decide, sorry, new axiom or unchecked source dump. Record exact failures
and representation corrections before retries. Final acceptance still requires
all-state relation, both halting directions, complete310029paid allocation,
independent regressions, final review and immutable evidence/pins.
