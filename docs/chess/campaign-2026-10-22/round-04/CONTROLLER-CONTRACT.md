# Bounded structured decoder interface

The complete packet identity passed remote run 39807083846 at 6b2e120.
The accepted machine remains **998,176 states**. This experiment tests the next
dependency of a potential **250,514−D** full-machine saving: build and count the
physical decoder D. No Lean theorem or new accepted machine is claimed here.

## Ownership and limits

- Controller leaf owns `scripts/chess_table_seed_20261022/controller.py` and
  `CONTROLLER.md`.
- Independent checker leaf owns `controller_fixtures.py` and
  `CONTROLLER-FIXTURES.md`.
- Root owns this contract, workflow, runner, retention, git and dispatch.
- Existing accepted sources, packet pilot, pinset and all old evidence stay fixed.
- All execution, construction, simulation and counting happen remotely. Local
  work is source editing/review only. One combined pilot: 600 seconds, 4 GiB.
- Stop and retain evidence if D exceeds 50,000 or an exact-tape check fails.
  Do not simulate the full quadratic chess packet. Complete small packets plus
  the already checked full static identity are the finite feasibility evidence.

## Complete explicit controller artifact

`controller.py --output PATH` writes `PATH/controller.json` and a construction
report. It requires `CHESS_REMOTE=1` and `GITHUB_ACTIONS=true`, refuses to overwrite
its own evidence, and does no fixture execution. The root runner applies limits.
Builder success banner: `CHESS_TABLE_SEED_CONTROLLER_BUILT`.

`controller.json` fields:

```text
schema: "chess-table-seed-direct-binary-v1"
status: "FINITE_UNVERIFIED_CONTROLLER"
states: D
entry: 0
done: designated terminal index
error: designated nonterminal error index
names: D unique descriptive control names
rows: D pairs, each element null or [write_bit, movement, next_index]
blocks: contiguous allocation records with name, kind, entry, states,
        state_names, contract; carry/operations optional
```

Movement is exactly −1 or +1; writes are 0/1. Every destination is in range.
Both rows at `done` are absent; no other transition is absent. All allocation,
including parser products and unreachable malformed-input controls, is paid.
There are no runtime Python operations, free calls/returns, integer registers,
implicit stay moves or transitions omitted from the count. Macro generation is
allowed only when fully expanded into these rows before execution.

The parser stores only finite phase, tag 0–6, bit position, leading-zero status
and pending letter. Do not store an entire 13-bit operand as 8,192 control values.
Use the exact fixed29 packet and geometry in `SEED-ARCHITECTURE.md`: consume one
raw bit before shifting B by one; compact output triples remain between A and B;
never scan unread raw data; prepend each emitted letter; final cleanup produces
the exact old `Seed.seed` tape at its first bit. Empty phases are valid.

## Independent checker

`controller_fixtures.py --controller PATH/controller.json --output PATH` reads
the complete JSON table without importing the generator or its transition
helpers. It independently checks allocation coverage, all rows and bounds,
unique terminal state, and every block's contiguous paid controls.

It simulates the explicit rows on a sparse binary tape. The expected result is
constructed directly from original-order literal prefix, `[tag,left,right]`
natural words (canonical low-bit-first digits and cons even for zero), delimiter
and literal suffix, followed by the accepted three-bit seed framing. Check the
entire nonzero tape support relative to the final head, not only a bounded window.
Translate starting positions to test independence from a privileged origin.

Positive cases include empty literal phases/table, all letters, all seven tags,
all-zero operands, 1, powers of two and neighbors, 4095/4096/8191, adjacent long
one-runs, multiple rows and phase boundaries. Give each run an explicit step cap
and the batch a global deadline. Retain fixtures and execution counts, maximum
steps, first failure and controller hash. The full chess packet is not simulated.

After positives pass, reject meaningful mutations of table writes/movement/
destinations, B-shift, zero-word emission, cleanup marker and final head. Verify
the unmutated control reaches its expected output before counting a mutation as
rejected. A timeout or unexpected checker exception is not a successful rejection.
Invalid packet cases may be reported separately; valid-packet correctness does
not require a general malformed-header validator.

Final success banner: `CHESS_TABLE_SEED_CONTROLLER_PILOT_PASSED`.
Output `controller-summary.json` includes status, controller hash, complete D
and 2D allocations, complete fixture/control counts, resource bounds and explicit
`universal_proof: false`, `new_accepted_machine: false`. Report complete candidate
totals `747662+D` and conditional `288347+D`, and prospective saving `250514-D`.
Count the retained 216-state expander and both one-state bridges in those totals.
Required binding keys are `controller_sha256`, `controller_states`, and
`transition_rows`; the root wrapper checks these against the unchanged table.
