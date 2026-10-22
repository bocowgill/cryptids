# Independent complete structured-seed machine checks

Status: source ready for the parent's remote acceptance run. No local model,
generation, count, simulation, fixture, compiler or Lean execution was performed.
This document is a checker contract, not a successful execution report. The
accepted machine remains **998,176 states** until the separate complete proof,
audit, native, regression and evidence gates pass.

The new checker is
[`scripts/chess_table_full_20261022/fixtures.py`](../../../../scripts/chess_table_full_20261022/fixtures.py).
It imports only the Python standard library. It does not import a generator,
previous fixture script or compiler implementation. It requires the remote
environment guards and reads the actual new native export under
`.lake/chess-table-full-20261022`.

## Independent references and input equality

Seven byte-pinned references supply the original source input, complete original
letters, complete old seed, original field export, accepted body rows, independently
checked 21,682-state decoder table and previously accepted 216-state expander.
The exact paths and SHA-256 pins are declared in `PINS` and copied into every
retained detail report. References come from retained packet run **39807083846**,
decoder run **39810577763**, round02 expander pilot and round01 accepted native
export. Their historical acceptance classifications remain unchanged.

The checker builds canonical LSB-first natural words directly from integers and
compares all 141,380 original letters, including the delimiter, root and wide
argument. It reconstructs the packet from all 5,952 original table rows and the
literal prefix/suffix. A separate cursor parser consumes the entire 173,641-bit
packet, recovers all three phases and rows, and produces the exact retained
424,156-bit old seed. The same original letters independently reconstruct all
1,837,940 field bits and all original source cells. This checks the source identity
instead of relying only on an encoder and decoder agreeing with each other.

## Every paid transition

The expected stream is assembled independently from:

- Each reversed packet write and the final preserving right turn.
- Every pinned new decoder row, with only its designated success patched.
- The new preserving left bridge.
- Every pinned old expander row, with only its designated success patched.
- The old preserving left bridge.
- Every accepted body row, relocating each defined destination and preserving
  every missing transition.

The actual native stream is compared byte for byte with this reconstruction.
Every state has both symbol rows; all writes, movements, destinations, missing
rows and canonical halt encodings are checked. Strict metadata equality prevents
extra or unpaid regions. The decoder error loop and both original success states
are included. The candidate allocation is:

| Component | States |
| --- | ---: |
| Packet writer, including its final turn | 173,642 |
| Complete table decoder | 21,682 |
| New bridge | 1 |
| Complete retained seed expander | 216 |
| Old bridge | 1 |
| Retained complete body | 573,802 |
| Candidate total | 769,344 |

This implies 1,538,688 symbol rows and a prospective saving of 228,832 states.
The checker derives allocation from the complete input and table lengths, checks
the full body extent, and then requires the intended numerical target. These
figures are acceptance targets here; no new measurement is claimed by this source
document.

## Actual execution scope

The entire linear chess packet writer runs from a blank sparse tape. Its endpoint
must have the exact control, physical head, entire packet support and blank
exteriors, matching the native receipt. Full quadratic chess startup is forbidden.

Fourteen native toy constructions run through the writer, both decoders, both
success controls and both bridges into a one-state halted body. Inputs include
empty phases, all four letters, all seven tags, zero words, operand boundaries
0/1/4096/8191, unequal nonempty prefix/suffix and multiple rows. The checker
reconstructs every toy transition independently before execution. At new decoder
success it checks the exact complete old seed and head; at the body it checks the
exact complete field tape and head. Expected words come from integer arithmetic.
The final head for packet length `K` and original letter count `n` is `-K-16*n`.

The empty, zero and operand-boundary examples also run at origins -37 and 101,
giving twenty complete Python executions. Complete sparse support is compared,
so no finite-window assumption can hide a distant nonzero cell. Native visited
ranges must fit their declared frames. Each case is capped at 4,000,000 steps,
the batch at 50,000,000 steps, the checker at 540 seconds and 4 GiB. A timeout is
a failure and never a successful corruption rejection.

## Positive controls and corruption stages

All complete unmodified predicates pass before negative controls begin. Each
corruption records its actual and required rejection stage; a rejection by an
earlier predicate cannot be reported as evidence about a later predicate.

The 37 declared controls cover writer data/order/turn; decoder read, consume,
write, dispatch, success and error rows; both success and bridge directions; old
expander rows; relocated body writes/destinations and preserved halts; invalid
destinations, noncanonical halts, omitted rows/states, extra rows and unpaid
counts; changed full packet and original input; writer and toy receipts; and toy
output or distant support corruption.

Two controls execute an entire changed toy from blank, modifying the final bridge
write or direction and requiring the resulting complete-tape or exact-head
predicate to reject. Five additional controls use configurations reached by a
complete passing toy and compare exact one-step support, head and destination at
each paid handoff. These execution controls are distinct from full-table equality
controls. Every negative outcome records its scope and whether its unmodified
positive passed.

## Retention and review

`fixtures-detail.json` binds native JSON, binary rows, checker source, original
references, commit and run identity. It records complete allocation, row census,
static identity, writer endpoint, individual toy results and individual mutation
outcomes. Atomic checkpoints after each successful toy or control preserve partial
progress. `fixtures-progress.json` identifies the current case, origin, cap,
steps and control. The first failure and traceback are retained separately.

The success token is `Table seed complete independent fixtures passed`.
`universal_proof=false` and `new_accepted_machine=false` are explicit: finite
evidence supplements the separate Lean proof and does not change acceptance.

Four source passes were completed: full implementation; input and tape geometry
review; allocation, negative-stage and failure-retention review; final schema and
evidence polish. Independent read-only review found one retention gap, repaired
by shared report lists and atomic per-result checkpoints. Its follow-up found no
remaining source-level blocker. It also confirmed both link offsets, exact seed
and field endpoints, full-support checks and expected negative stages. Actual
remote execution remains pending.
