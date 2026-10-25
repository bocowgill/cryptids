# Counter, indexed insertion and full-data local composition checked

Decision: the bounded routine-certification milestone passed. Continue with
global printer iteration and packet identity in a subsequent authorized phase.
The real indexed query/extraction contract is kernel-checked for **all 13,360
actual words**, using shared proof data. The all-word check/export took
**14.678 seconds**, with sampled peak group-plus-driver RSS **4.9957 GiB** under
the unchanged 6 GiB cap. This creates a usable local proof interface for the next
global invariant; it is not complete-printer or full-chess-machine certification.

The accepted full machine remains **769,344 states**, source
`100ed947d612079dc454070189e506efc2b7a780`. The unchanged experimental machine
remains **609,247 states**, potential saving **160,097**. **New accepted
full-machine saving: zero.** No physical transition or state was added or removed.

## Operational results

The new modules in `Cryptids/Compilation/Parsimony` certify finite ordinary
machine paths with complete tape/head results and arbitrary exterior frames:

- **Common:** single-cell steps, finite scans, indexed return walks and transfer
  from an exact successful run to finite reachability.
- **Counter:** little-endian ripple carry, length and numeric successor,
  nonoverflow existence from the word-capacity inequality, the left sweep and
  every paid return control. The missing physical no-carry digit-zero entry is
  excluded explicitly; overflowing final carry is never treated as wrapping.
- **Insertion / Extractor:** the initially checked zero-index specialization,
  both insertion carry continuations and finish controls, repeated increment
  and finite unary conversion. These checked declarations remain unchanged.
- **IndexedInsertion:** both unary runs, including the secondary left search,
  its rightward turn, and the write-one/right-search branch that shifts the
  nonzero word index. No nonexistent initial B control is required.
- **IndexedExtractor:** crossing the index before and after each increment,
  preserving it during the loop, and erasing exactly that index run at exit.
  The remaining unary value is a decreasing natural variant.

The counter's pure finite increment has an explicit failure result on overflow.
The repeated-increment existence theorem proves its success from
`value bits + n < 2^width`; callers do not assume a machine's correctness or
unproved termination. Width 13 and the actual value bound below 8,192 discharge
that condition at the full-size instance.

Data.lean is byte-identical to the earlier checked version. The composition
reuses its `step_cell` and `unary_run` proofs through a row-parametric query
lemma. Its original `query_run` statement and exact `v+2` step count are fixed.
The new routines prove finite ordinary reachability and exact resulting tapes;
they do not claim a new exact total physical-step formula. The measured seconds
are proof/check/export cost, not the machine's execution time.

## The actual indexed entry and exit

Write O(n) and Z(n) for finite runs of n ones and zeros. Lists on the left are
nearest-head-first. Define `P(j,L) = 0 :: O(j) ++ 0 :: L`. Indexed insertion starts
with left `O(v) ++ P(j,L)` and right `Z(width+2) ++ R`, including the scanned zero.
It exits with left `O(v) ++ P(j,Z(width) ++ L)` and right `Z(2) ++ R`. This creates
exactly the blank binary word while preserving both unary runs and both exterior
frames. The distinct zero/positive carry paths include their real finish rows.

The final family `ParsimonyComposed.allWordsIndexed` uses `j = i.val` for every
`i : Fin 13360`. Let v be that actual encoded word value. Its entry is data state
i, scanning a query marker one, with left `O(i) ++ 0 :: L` and the stated finite
blank working area on the right. Its exit is data state zero with a width-13
word `out` satisfying `Counter.value out = v`, left `0 :: out ++ L`, and right
`Z(i) ++ [0,1] ++ Z(v+2) ++ R`. The separators, new marker, erased index and head
are all part of the kernel theorem, not just a numeric-value fixture.

The continuation audit was consequential: after the first word, the data-chain
advance leaves an actual unary word-index run. The earlier checked zero-index
contract alone would not support global iteration. This phase preserved that
specialization and added the full indexed contracts, rather than treating an
all-word benchmark with a reset index as sufficient. The new indexed proof
quantifies over arbitrary index and value lengths; it does not unroll thousands
of counter executions or index scans.

## Full-size instantiation and binding

The shared representation stores the retained Nat word array and maps it through
one modulo-8192 constructor into `Fin 13360`. A generic identity theorem preserves
an original value under its explicit `<8192` bound; a generic array theorem proves
every resulting value has that bound without normalizing all entries. The full
native row comparison proves finite representation agreement with the unchanged
candidate; the constructor is not permission to wrap different original words.

Static row certificates are checked on an empty data array, then transported by
a kernel-checked theorem showing that static states do not inspect word data.
This avoids both per-word proof duplication and a decision tactic with a free
array parameter. All finite certificates use `decide +kernel`.

The canonical local model has 13,546 controls: the original 13,545 printer
addresses and the existing first decoder address as a boundary. Its preamble and
decoder outgoing semantics are outside this local contract. It introduces no
new paid state. All **27,078 cells at addresses 6 through 13,544** were exported
and matched independently against the corresponding writes, directions and
targets of the complete unchanged candidate table. These include all 26,720
data cells and the 358 static-region cells. Matching rows outside a routine's
contract does not certify their global semantics.

Both a changed exported row and a changed actual counter write were rejected.
The latter changed only one literal transition, writing zero instead of one
at the initial increment. The original proof passed; the changed machine failed
the kernel finite-row certificate, as required. No theorem statement, linter or
resource limit was weakened to accept it.

The local operational theorem is a kernel result. The connection to the retained
binary file is an executable row comparison with checked provenance. This is
**not yet a kernel binary-parser theorem or full-machine halting equivalence**.
The actual `data_out` zero branch is included. Its one branch for global end-of-
data detection, preamble/epilogue, marker adapter and full decoder link remain
later obligations.

## Measured cost and retained evidence

Successful run:
[40149380578](https://github.com/bocowgill/cryptids/actions/runs/40149380578),
producer **86439e752fc3b2f0fb296d02781e026fca76e655**.

| Check | Seconds | Sampled peak group + driver bytes |
| --- | ---: | ---: |
| Shared full-word indexed composition, compile and export | **14.678** | **5,364,101,120** |
| Changed real counter-row rejection | 13.327 | 5,290,958,848 |
| Indexed generic foundation audit | 3.504 | 4,918,505,472 |

The full instance object is **13,456,080 bytes**, source **131,413 bytes**.
The seven generic objects together are **564,896 bytes**. Remaining headroom
below the 6 GiB group cap is **1.0043 GiB**. The whole driver took **119.767
seconds**, including 22.529 seconds fetching dependencies; its peak was **34,064
KiB**. All successful stages were warning-free. Standard-foundation audits for
all roots and both all-word families report only `propext`, `Classical.choice`
and `Quot.sound`. No placeholders, custom axioms, unsafe code or native proof
oracle enter the checked result.

Caps stayed fixed: 1,200-second driver, 300-second dependency fetch, 240-second
generic build, 180-second instance, 5 GiB Lean heap, 6 GiB sampled process-group
plus driver RSS, 512 MiB driver, one Lean thread and 25-minute workflow timeout.
Only the existing free ubuntu-24.04 runner was used. All compilation, generation,
exports, comparison, corruption checks and machine counting stayed remote.

This is one full-size measurement with 50 ms RSS sampling, not a heap bound or
proof that the complete printer plus chess suffix fits. Full-certification
runtime remains uncertain because global packet identity and composition are
not yet checked. Do not extrapolate a proof-completion percentage from row count.

All seven runs' archives, complete workflow logs, producer manifests, failures,
objects and command/resource receipts are retained under `evidence/counter-01`
through `counter-07`. Source hashes were checked against exact committed Git
blobs. The final lightweight local `review.py --iteration 7` rechecks retained
provenance, hashes, foundation reports, successful exits and the single negative
source difference without executing a model.

Final artifact SHA-256:
`3d75f22e111af760fb5204d1573b7520e24850dd56176ff37290a15bf829a373`.
Workflow logs SHA-256:
`087a38962170e421657778e6680b357ea421c883d4d527b2525cb3dba4a5c73e`.
All-word source SHA-256:
`98731976b679e8aca4c94c3cfc1175de324afcdcf633f94300a5494bbf61af10`.
Full local export SHA-256:
`00c969fe4433fdacb6a5cccee583b1872305a8f3c5a7820c8186078a47942e41`.
Complete candidate table remains SHA-256
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.

## Bounded attempts and corrections

| Iteration / run | Diagnosed result |
| --- | --- |
| 1 / 40145616663 | Tape move reduction, repeat normalization, missing bit argument and index reassociation in Common. |
| 2 / 40146146317 | Opaque reachability wrapper normalized differently under simplification; switched to explicit ordinary-step equality closure. |
| 3 / 40146645212 | Common checked; parent `Runs` shadowed the helper, and grouped structure fields were parsed as binders. |
| 4 / 40147284895 | New exact-run helper inferred equality on Option configurations; supplied the explicit machine-path type. |
| 5 / 40147646742 | Generic counter, zero-index insertion/conversion and composition passed, with strict foundations. Pinned those sources unchanged. |
| 6 / 40148305978 | Full-data generator used a reserved identifier and free-variable decision goals; fixed naming, static-row transport, capacity rewrite and one simp argument. Continuation audit also required the real unary index run. |
| 7 / 40149380578 | Indexed contracts, full-data composition, every local row, foundations and changed-counter-row rejection passed. |

No run hit a memory or time limit. Seven of at most eight iterations were used.
No eighth run is needed. Failed elaborations and their automatic placeholder
diagnostics are historical failures, not accepted proofs. All accepted roots
were rebuilt and audited in the successful final run.

The existing broad push rules also launched twelve incidental Cryptids CI/M6
runs on this phase's source commits. Four had completed successfully; the eight
still active were cancelled during wind-down. All twelve terminal/job records,
available full logs and artifact listings are preserved under
`evidence/incidental-ci`. These broad runs are not included in the bounded
pilot's timing/memory figures or used as acceptance evidence for the new proofs.
Workflow and notification settings were not disabled. Final checkpoint commits
use `[skip ci]`; future bounded proof commits should do the same and dispatch
their scoped manual pilot explicitly. Full integration CI remains a later
explicit check. See [GitHub's skip instructions](https://docs.github.com/en/actions/how-tos/manage-workflow-runs/skip-workflow-runs).

## Complete-machine state breakdown and next decision

The preceding full census is unchanged; this phase did not emit a smaller table.

| Category | States |
| --- | ---: |
| Data, including data-out | 13,361 |
| Extractor | 140 |
| Preamble / epilogue | 6 |
| Tail cleanup | 3 |
| Nondestructive marker scan | 32 |
| Marker erasure / direct decoder connection | 2 |
| Nonhalting error trap | 1 |
| **Experimental printer subtotal** | **13,545** |
| Table decoder | 21,682 |
| Decoder bridge | 1 |
| Seed expander | 216 |
| Expander bridge | 1 |
| Interpreter main | 533,341 |
| Interpreter returns | 40,461 |
| **Unchanged suffix subtotal** | **595,702** |
| **Experimental complete machine** | **609,247** |

The accepted writer has 173,642 states. Its replacement can save 160,097 only
after complete correctness is proved; the model boundary is not paid twice.

| Opportunity | Plausible absolute payoff | Proof difficulty / implementation effort | Decision |
| --- | ---: | --- | --- |
| Finish this printer's global correctness and link | 160,097 experimental states | High mathematical work; moderate composition engineering | Main next route after authorization |
| Reuse indexed local macro and shared proof data | 0 additional states; enables the above | Local milestone complete at full data size | Keep these checked contracts and pins |
| Structural framed-packet/word identity | 0 additional states; enables the above | Medium/high; avoid literal-array equality blowup | Include in next global invariant phase |
| Earlier interpreter quotient | 459,315 experimental states on its own baseline | High; prior complete certification scaling unresolved | Older goal remains paused; do not combine savings |

Next prove global word iteration using the real index-run boundary, including
the final `data_out` one branch. Derive the full emitted bit list from the frozen
framed packet and prove its identity structurally. Then prove preamble, epilogue,
marker/tail cleanup, complete finite blank startup and relative head, construct
the full Lean printer and certify direct linking/full suffix relocation. Compose
with the pinned chess theorem for both halting directions and finish final
strict/foundation/regression checks before accepting 609,247 or updating a public
machine-size claim.

The bounded phase stops here. The older goal remains paused; no subsequent
research job, upstream update or outreach is launched automatically. Final pushed
recovery verification and all gate evidence are recorded in CHECKPOINT.md.
