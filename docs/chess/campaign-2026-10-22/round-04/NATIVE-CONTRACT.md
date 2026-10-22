# Complete structured-initializer acceptance contract

This is an implementation contract, not acceptance evidence. Frozen/accepted sources
and their 2,983 pins stay fixed. Every build, generator, simulation, count and fixture
runs remotely. No full quadratic chess startup is executed. Root owns Git, network,
remote dispatch and integration. All workers preserve other owners' edits.

## Machine and proof boundary

New `Chess.Optimisation.FieldTableSeed` uses `TableSeed.ChessCodec.bits`, paid
`OpenEvolveWide.schedule`, and
`SeedLink.link TableSeed.machine TableSeed.done FieldSeed.linked`.
The old complete expander/bridge/body is retained exactly. Expected accounting:
173642 writer +21682 decoder +1 new bridge +216 old expander +1 old bridge
+533341 mains +40461 returns =769344. This is a candidate until every gate passes.
Public `Machines.chess_table_seed` and
`Semantics.ChessTableSeed.halts_iff_not_draw` retain the original equivalence.
FieldTableSeed exposes `bits`, `actions`, `linked`, `generated`, `machine`,
`rowMachine`, exact count and halting theorems analogous to FieldSeed. Numeric
rows use FieldSeed.rowLinked as inner body and prove equality to the actual body.

## Export leaf (4.1)

Own only `scripts/chess_table_full_20261022/Export.lean` and its leaf ledger.
Implement all-row native export of the actual complete machine, equality against
proved numeric image, canonical six-byte <BBI records in state/bit order, and
complete linear writer replay. Export exact packet, full allocation metadata,
actual decoder table and old expander table. Count missing transitions explicitly.
Reuse inspected accepted helpers by source copying without editing originals.

Also run bounded complete constructions on toy pre/row/post inputs, through both
decoder and old expander and both bridges to a one-state halted body. Include empty
phases, all literal symbols, tags0..6, operand boundaries0,1,4096,8191, and unequal
nonempty pre/post. Cap per-case steps, record exact endpoint state/head and entire
nonzero tape support plus visited range, and fail on unexpected halt or timeout.
Do not compute expected output using the decoder under test. Export toy actual rows
or an equally complete explicit row comparison so the independent checker verifies
all composition/dispatch controls. Share the exact JSON schema with the fixture
owner before finalizing; no circular oracle. Both native and Python check the same
complete paths independently. Finite fixtures complement universal Lean proofs.

## Independent fixture leaf (4.2)

Own only `scripts/chess_table_full_20261022/fixtures.py`, `FIXTURES.md` in round04,
and own ledger. Reconstruct packet from independently retained original source rows
and accepted complete letters; independently decode all173641bits to the exact old
424156bit seed, then compare original full field tape. Avoid trusting only the
matching encoder/decoder. Reconstruct every paid full row from reverse writer,
pinned independent decoder pilot, accepted old expander and accepted body rows.
Compare the complete stream, strict metadata, writer tape/head and complete toy
startup paths with independent sparse-tape execution. Account for both bridges,
both controller success controls, final writer turn, error control and all halts.

Require meaningful mutation controls with a passing positive control first:
writer payload/order/turn, decoder read/write/consume/dispatch, decoder success
and bridge directions, old expander/bridge, relocated body row/destination, omitted
rows or states, incorrect counts, changed full input, and toy tape/head/support.
Retain exact rejection stages; do not claim a later predicate detects a mutation
rejected earlier. Return complete detail JSON with hashes/counts/coverage and all
mutation outcomes. Work output `.lake/chess-table-full-20261022`.

## Parent integration and acceptance

Strict complete public Lean build; full safe transitive axiom/unsafe/partial audit
with negative controls; false kernel allocation/saving controls; both native leaves;
existing M2-M7 regressions; exact source/run/artifact binding; independent fresh
advisory; sealed metadata checker positive/hostile/portable replay. No component
pass or measured candidate count changes the accepted998176 machine by itself.
