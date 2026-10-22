# Independent finite controller checker

Status: the bounded remote finite pilot passed in official run
[39810577763](https://github.com/bocowgill/cryptids/actions/runs/39810577763), at source
commit `0afbd2a0c921b4bf0ffdcc5dee67b5b89f899eab`. No local execution occurred.
The accepted complete machine remains **998,176 states**. The universal decoder
proof and complete-machine composition are still missing. The packet identity run
39807083846 establishes a static input identity; it does not establish this
controller's behavior. The checker does not import `controller.py` or any of its
transition helpers.

## Inputs and complete allocation

Run remotely:

```text
python3 scripts/chess_table_seed_20261022/controller_fixtures.py \
  --controller OUTPUT/controller.json --output OUTPUT
```

Both `CHESS_REMOTE=1` and `GITHUB_ACTIONS=true` are required at import time. The
checker refuses to overwrite its evidence. It reads at most 64 MiB of controller
JSON, rejects duplicate keys, and checks all `D` states and `2D` symbol rows.
Writes must be binary, movement must be exactly one cell left or right, and
every successor must be allocated. Exactly the two rows of the designated done
state are absent. Every named block must occupy a contiguous, nonoverlapping
segment with exactly its declared state names. Blocks cover the whole machine,
including malformed-input and potentially unreachable controls. `D > 50000`
is a failed bounded pilot, with no fixture execution or reduction claim.
The designated error control must preserve either symbol and move right to itself.

These checks count the complete artifact rather than a reachable subset. They
do not establish that human-readable control names are faithful descriptions;
the actual row table is what the executor runs.

## Independent packet and output oracles

The fixture language uses 1 for the delimiter, 2 for cons, 3 for bit0, and 4 for
bit1. An arithmetic loop computes each natural's canonical least-significant
bit-first symbols followed by cons, including a zero natural. The expected
original symbol list is:

```text
pre ++ naturalSymbols(rows.flatMap [tag,left,right]) ++ [delimiter] ++ post.
```

Each symbol's three bits are computed by division and remainder. Expected output
is the literal thirteen-bit marker/gap header, followed by those original-order
symbols' codes and three zero bits. The packet is independently assembled from
reversed literal suffix, reversed fixed29 rows (tag LSB first, right/left operands
MSB first), and reversed literal prefix, with all three aligned stops. No decoder
model is used as the expected-output oracle.

The executor stores the entire finite nonzero support in a Python set. Every
physical step reads the explicit table row, writes its bit, moves by its signed
unit direction, and enters the paid successor. Only the designated done state
ends execution. On success, the **entire** nonzero support relative to the final
head must equal the expected old seed. This includes all cells outside the
expected finite string: leftover marker, scratch bit, unread input, and distant
nonzero cells all fail. The architecture's physical head formula is also checked:
starting origin minus three times the emitted symbol count minus seven.

Cases cover empty phases and table, every literal letter, all seven row tags,
zero words, 1, powers of two and their neighbors, 4095/4096/4097 and 8190/8191,
adjacent maximal operands, multiple rows, and phase boundaries. Four representative
cases run at origins 0, -37 and 101. The full chess packet is never executed.

## Positive-before-negative controls

The complete positive suite must pass first. Three table controls then challenge
the same complete allocation oracle with an undercount, missing allocation block,
and an undesignated terminal row. Three valid-row mutations run a complete small
packet: change the last transition's write, change its movement, and redirect the
initial transition to done. Rejection requires a concrete output/head mismatch.

Four more controls use primitive-entry configurations captured from successful
complete packets. Each unmutated primitive first passes an independent full-tape
geometry oracle, then the corresponding mutation must fail that same oracle:

| Primitive | Independent bounded result | Mutation |
|---|---|---|
| B shift | From old B+5, eight steps install `0 ++ M` at old B through old B+6 and end at old B+1; the just-consumed bit is already zero | Flip the first shift write |
| Zero operand's cons code | From old A+5, three leftward writes leave `010` at old A+3 through old A+5 and end at old A+2 | Erase the required cons code to `000` |
| Cleanup header | From old A+5, thirteen leftward writes install the header at old A-7 through old A+5 and end at old A-8 | Corrupt a marker bit |
| Final head | One preserving rightward move from old A-8 to old A-7, with the entire tape unchanged | Reverse the final movement |

These are finite actual-context checks, not proofs of arbitrary-frame primitive
correctness. Each record identifies its successful complete parent fixture. A
timeout, budget failure, parse error, or unexpected Python exception is **never**
counted as rejection of a behavioral mutation. Structural controls catch only
the checker-specific table-validation exception; behavioral controls catch only
the explicit tape/head mismatch exception.

## Resource and evidence boundary

Every packet run has an explicit cap of at most 4,000,000 transitions. The batch
has a 50,000,000-transition ceiling, a 540-second internal deadline and a 4 GiB
address-space limit. Root additionally limits construction plus checking to
600 seconds. Primitive controls use fixed lengths of 8, 3, 13 and 1 steps.
The checker saves progress before each case/control and writes fixture/control
records as they complete. A failure retains its first precise context and
traceback, followed by a failed summary. No failed run prints the success banner.
Failure summaries also retain the maximum completed positive fixture steps and
the current case's executed steps/cap; a failed case is never included as completed.

The summary binds to the raw controller JSON hash and records `controller_states`
and `transition_rows`, allocation categories, actual fixture/control totals,
maximum steps, resource use, and all paid overheads. Complete prospective totals
are `747662 + D` with the current body and conditionally `288347 + D` with the
experimental quotient body; the same-body saving is `250514 - D`. Both formulas
include the retained 216-state expander and both one-state bridges. Neither formula
is an accepted-machine count until the universal proof and full composition pass.
The summary explicitly sets `universal_proof: false`, `new_accepted_machine: false`,
and `full_chess_packet_executed: false`.

Successful finite verification prints
`CHESS_TABLE_SEED_CONTROLLER_PILOT_PASSED`. The official receipt is retained in
[controller-01](evidence/controller-01/), and the parent inspected the saved packet's
metadata and hashes in [parent-controller-replay.json](evidence/parent-controller-replay.json).

## Retained remote result

The [controller summary](evidence/controller-01/unpacked/controller-summary.json)
reports the following finite results:

| Check | Remote result |
|---|---:|
| Complete decoder states `D` | 21,682 |
| All allocated symbol rows `2D` | 43,364 |
| Contiguous paid allocation blocks | 4,626 |
| Complete positive fixtures | 66 |
| Rejected corruption controls | 10 |
| Total simulated transitions, including controls | 410,290 |
| Maximum completed positive fixture transitions | 47,746 |
| Independent checker elapsed time | 0.777 seconds |
| Independent checker peak RSS | 43,644 KiB |
| Timeouts counted as rejection | 0 |

All tested packets had exact final head and complete sparse support, including
translated origins -37, 0 and 101. Every row and paid block was checked. The full
quadratic chess packet was not executed. The raw controller JSON hash is
`c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f`;
the retained summary hash is
`87c4885e89eb4e041a255d1e717d7454d389969dbb43fa65e9efb15a77f90637`.

Substituting this complete `D` into the paid accounting gives **769,344 prospective
states** with the current body, or **310,029 conditionally** with the experimental
114,487-state body. The same-body prospective saving is **228,832 states**. These
figures include the packet writer, decoder, retained 216-state expander, and both
one-state bridges. They are finite construction/accounting results, not new
accepted chess machines. Acceptance still requires the universal decoder proof,
the relevant body certificate, exact composition, and full-machine verification.

## Four source passes

1. Complete: implemented separate arithmetic oracles, explicit sparse execution,
   complete allocation, bounded fixtures and retained failure evidence.
2. Expert: checked word order, zero cons, three phase stops, shared packet framing,
   all control costs, and final physical/relative tape geometry against the source
   contract. Corrected primitive entry positions to the actual leftward writer.
3. Defect: isolated timeouts from successful negative controls, retained progress
   on a failed negative, checked full support rather than a finite window, and
   added allocation undercount/missing-block/extra-terminal controls.
4. Polish: separated finite evidence from universal obligations, named each paid
   component and exact resource bound, and kept remote verification explicitly open.

Independent read-only source review by `fixture_source_review` found no semantic
mismatch in packet order, head/support, primitive geometry, census or controls. It
identified missing maximum/current-step information on failures; that evidence
gap was repaired. Parent review additionally requested an exact check of the
nonterminal error self-loop; that check is present. No simulation or counting
was run locally. The source-bound bounded remote pilot and parent metadata/hash
replay now close this fixture leaf; the universal-proof and full-machine gates
remain separate and unmet.
