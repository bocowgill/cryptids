# Reusable data-routine proof and full-size scaling passed

Decision: continue the structural proof route, and reduce data materialization
overhead before integrating the full printer. This phase kernel-checked a real
operational routine and scaled it to all 13,360 actual words. The full-size
check/export took 26.910 seconds but used 5.64 GiB against the fixed 6 GiB group
cap. That is useful full-data evidence, with limited memory headroom. It is not
yet evidence that the complete printer and accepted chess suffix fit together.

The accepted chess machine remains **769,344 states**. The **609,247-state**
candidate and its **160,097-state** reduction remain experimental. Accepted
savings from this phase are **zero**. The complete printer startup and both
directions of its chess halting equivalence have not been proved.

## Proved operational contract

[Data.lean](../../../../Cryptids/Compilation/Parsimony/Data.lean) contains
six checked roots: `step_cell`, `unary_run`, `row_zero_more`, `row_zero_last`,
`row_one` and `query_run`. The reusable chain theorem quantifies over arbitrary
machine size, chain length and complete exterior tape frames. The canonical
data constructor proves the required row equations rather than assuming whole
printer correctness.

At a query marker, a word value `v` selects data index `last - v`. Ordinary
execution consumes the marker and materializes exactly `v` unary ones and a
zero separator, reaching the extractor entry in exactly **v + 2 steps**. Both
arbitrary exterior frames and the final head are fixed by the theorem. The
successful finite run excludes premature halting within this routine. See
[PROOF-PLAN.md](PROOF-PLAN.md) for the precise nearest-head-first tape contract.

The generic proof object is **41,872 bytes**. Instantiations apply this theorem
without unfolding the word array or evaluating the physical run. A real changed
write in the canonical machine caused the row proof to fail with an unsolved
`False` goal. No linter was disabled and no theorem statement was weakened.

The strict library build passed with `--wfail`. All successful stage logs,
including generated instances, were checked to be warning-free. Transitive
axiom reports for all six roots and all three instances contained only
`propext`, `Classical.choice` and `Quot.sound`. The code uses no proof placeholders,
custom axioms, native decision proof oracle or unsafe proof shortcut. Native
execution is used only for exporting rows after checking the proof.

## Scaling and connection to the exact candidate

All points share the actual width-13, 13,360-word control layout. The first two
materialize only the named real prefix, with default values outside it; the
instance theorem restricts its query index to that prefix. At the final point
the complete data block is materialized. Balanced 256-word chunks keep the
generated constructor depth bounded. Every literal value bound is kernel-checked.

| Real word entries | Actual rows compared | Check + export seconds | Sampled peak group + driver GiB | Object bytes |
| ---: | ---: | ---: | ---: | ---: |
| 512 | 1,024 | 4.941 | 4.64 | 1,077,472 |
| 8,192 | 16,384 | 18.813 | 5.25 | 11,061,816 |
| 13,360 | **26,720** | **26.910** | **5.64** | **16,392,352** |

Times include elaboration/kernel checking, axiom reporting, code generation and
row export. Memory is sampled process-group RSS including the small driver,
not an instantaneous or heap-only measurement. No point hit a resource limit.
These three measurements do not prove an asymptotic complexity bound.

For every materialized control and both binary symbols, Lean exported its
canonical transition. Independent comparison added the actual data offset six
and matched the corresponding candidate rows, including write, direction and
target. At full size this covers controls 6 through 13,365 and all 26,720 cells.
The actual `data_out` branching control is outside this proved routine. A changed
transport row was rejected at each point.

This is a kernel proof for the canonical routine plus executable representation
evidence tying its rows to the retained candidate. It is **not yet a kernel
theorem for the full 609,247-state machine or a proof of its binary-file parser**.
State coverage does not measure the remaining proof difficulty: the smaller
extractor block contains the central counter and word-insertion invariants.

## Retained run and resource bounds

Successful run:
[40141647723](https://github.com/bocowgill/cryptids/actions/runs/40141647723),
producer `ce6afbdda2650a792b2fb3ff11479f31abc9a5ce`.
Driver elapsed time was **106.056 seconds**, including 23.313 seconds fetching
the pinned dependency cache. The strict kernel build command took 12.815
seconds; Lean reported 5.9 seconds for the new module. Driver peak was 34,288 KiB.

The free GitHub-hosted runner used the unchanged 900-second driver limit,
240-second Lean stage limit, 120-second scale-point limit, 5 GiB Lean heap cap,
6 GiB group-plus-driver cap and 512 MiB driver cap. Setup was bounded by the
25-minute workflow timeout. No resources were purchased or limits raised.
All compilation, generation, checking, exports and counting stayed remote.

The phase used all four predeclared iterations. Prior obstructions are retained:

| Run | Result and corrective evidence |
| --- | --- |
| 40140596450 | Optional cgroup-v2 metadata file absent; no Lean stage ran. Corrected portable v1/v2 probing. |
| 40140890739 | Two row proofs left an arithmetic goal and unused simp arguments. Supplied the available inequality explicitly. |
| 40141259554 | Operational proofs elaborated; strict lint rejected two remaining redundant simp arguments. Removed exactly those arguments. |
| 40141647723 | Strict core, all scaling points, row comparisons, foundations and corruption control passed. |

There were no memory-limit or timeout failures. All four jobs are terminal.
Complete archives, logs, generated sources, exports, compiled objects, hashes and
per-command resource receipts are in `evidence/proof-01` through `evidence/proof-04`.
The final archive SHA-256 is
`9bdd732175d63256f3d9d758220ce3672b7cc2ccf043555a039bea96047d168e`;
workflow logs SHA-256 is
`68241a5050c282274c049682dcef8fe78d4314330cb6ed75f942dca2aedbe6e6`.
Retained manifests bind the exact committed sources and unchanged accepted pins.

## Next bounded work and remaining obligations

Keep the operational induction and its theorem statements fixed. First pilot
a cheaper data representation at the same full 13,360-word size and same caps:
store raw natural values and map them to bounded values using one shared bound
proof, rather than repeating a decision proof for every literal. Compare all
exported rows and audit the resulting instance again. This is a representation
change with **zero additional state saving**; its payoff is memory headroom for
certifying the complete **160,097-state** reduction. Prefer deriving the final
word data generically from framed packet bits to a second independent literal
packet identity that would need expensive equality proofs.

Then prove the reusable unary-to-binary counter and word-insertion contracts,
including exact tape geometry and decreasing variants. Compose the data-out
branch, preamble and epilogue, prove marker cleanup and complete finite startup
from blank tape, and instantiate on the exact frozen packet. Define the complete
Lean printer and prove direct linking and suffix relocation for the actual
state allocation. Compose with `FieldTableSeed.linked_halts_input`, preserving
both halting directions and counting any additional packaging controls. Finish
strict foundation/regression audits before accepting or publishing a new size.

No reliable full-certification runtime estimate follows from this data-routine
test; the remaining mathematical invariants and combined memory footprint are
unresolved. This phase stops with its reusable kernel and scaling evidence saved.
No additional job, old-goal resumption, upstream update or outreach is launched.

All five gates of this first structural phase are met, with zero unmet or
abandoned gates. These phase gates do not claim complete-printer certification.
The complete recovery payload is pushed at
`d4f8d54c014f38047f3b97906836a081d5fc9fe8` with its fork ref verified.
