# Shared proof data creates full-word memory headroom

Decision: use the shared-bound representation for the next structural proof
stage. The bounded paired experiment passed at **all 13,360 actual words** under
the unchanged caps. Peak sampled group-plus-driver memory fell **802.56 MiB**
(13.88%); check/export runtime fell from **23.824 to 8.453 seconds**; the instance
object shrank **27.85%**. This meets the predeclared usefulness threshold without
raising memory or weakening the operational contract.

The accepted full machine remains **769,344 states**. The unchanged experimental
candidate remains **609,247 states**, a potential **160,097-state** saving.
**New accepted full-machine savings: zero.** This representation improvement adds
no states and removes no machine states. Its purpose is to make certification
of the existing candidate fit with room for additional proofs.

## Paired all-word measurements

| Representation | Words / compared cells | Check + export seconds | Sampled peak GiB | Object bytes | Source bytes |
| --- | ---: | ---: | ---: | ---: | ---: |
| Exact retained literal-Fin source | 13,360 / 26,720 | 23.824 | 5.6482 | 16,392,400 | 440,192 |
| Nat array with shared bound proof | 13,360 / 26,720 | 8.453 | 4.8645 | 11,827,144 | 106,200 |

Exact peak memory was 6,064,721,920 versus 5,223,178,240 bytes, a reduction of
841,543,680 bytes. Remaining headroom below the unchanged 6 GiB cap rose from
0.3518 to **1.1355 GiB**. The object shrank 4,565,256 bytes. Runtime was 2.82
times faster in this pair. All instance times include elaboration/kernel
checking, axiom reporting, code generation and native row export.

The same baseline source previously took 26.910 seconds and 6,059,950,080 bytes
in structural run 40141647723. The new paired baseline peak is within 4.56 MiB
of that retained measurement. Its object is 48 bytes larger; the source is
byte-identical. All reported improvement ratios use the current paired baseline,
not a mixture of the two runs.

This is one paired runner measurement, with 50 ms RSS sampling and a shared OS
page cache. It is not a peak heap measurement or an asymptotic guarantee.
The new process still imports a substantial library: the separate foundations
audit alone used 4,879,523,840 bytes. Do not add independent peak measurements or
claim that the complete printer plus suffix will fit from this experiment alone.
Whole-composition memory remains unmeasured.

The complete driver took **80.855 seconds**, including 21.035 seconds fetching
dependencies, a 10.456-second strict library build and an 8.357-second foundation
audit. Driver peak was **35,576 KiB**. Each instance stayed within 120 seconds;
all stages stayed below their budgets. The runner reported 16,372,440 KiB total
RAM and 15,282,252 KiB available at the probe. Neither probed cgroup memory-file
path existed; this metadata absence did not alter the enforced process-group cap.

## What changed and what was preserved

The old generated definitions repeated a kernel decision proof for every
literal `Fin 13360` word. The replacement stores the same values in balanced
256-entry `Array Nat` chunks, then uses `raw.map boundWord`, with
`boundWord value = ⟨value % 13360, Nat.mod_lt value ...⟩`. That constructor has
one shared bound proof. A checked generic theorem proves its numeric value is
unchanged whenever `value < 13360`. All actual values are below 8,192; the remote
finite binding explicitly verified that bound and the identity for every word.
The constructor would wrap values outside its bound; no correctness claim for
such input is made or needed for this candidate.

The existing full-size `runData` statement **and proof text** were copied
verbatim. It still specifies ordinary successful execution, exact `v + 2`
steps, exact head/tape result, arbitrary exterior tape frames and every valid
word index. No whole-printer correctness premise was substituted.

The generic module `Cryptids/Compilation/Parsimony/Data.lean` stayed byte-for-byte
fixed, SHA-256:
`2317ad63aab9eb6796508ba6e2df1bb33a61816afd77b55ceb363dab2b20d6ac`.
Its rebuilt 41,872-byte object also matched the preceding object exactly:
`d81b2297360e2d627ff77b5b97af105212a8590b6858f383b3360359e47a6bdc`.
The six checked roots and both full-size instances use only `propext`,
`Classical.choice` and `Quot.sound`; the new constructor identity uses only
`propext`. All positive proof logs are warning-free, the library build used
`--wfail`, and generated source width was checked before expensive stages.
There are no placeholders, custom axioms, native proof oracles or linter changes.

Both Lean instances exported every data transition. Independent relocation by
offset six matched **all 26,720 cells**, including each write, direction and
target, in the unchanged complete candidate table. Each positive-tested
comparator rejected a mutation that changed an encoded word's target while
preserving canonical row shape. The two exports are byte-identical, SHA-256:
`e4820e2a8ad863cd6d3728b120c67f5a249fac8f9418445fb55f795cfbba6a2c`.

The complete candidate table retained SHA-256
`b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45`.
All 3,116 accepted/frozen pins were checked before and after the run. The frozen
specification, packet, physical printer and accepted suffix were not edited.
This is a kernel-checked operational contract plus external row-binding evidence;
it is not yet a kernel theorem about parsing that binary table, the full printer
or the complete chess machine.

## Full-machine count remains fixed

These counts are the preceding phase's retained full-machine census, unchanged
here; this experiment did not generate or recount a different machine.

| Category | States |
| --- | ---: |
| Data controls, including data-out | 13,361 |
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
| **Experimental full candidate** | **609,247** |

The accepted printer has 173,642 states; replacing it by the experimental
13,545-state printer yields the stated potential 160,097-state reduction.
The standalone diagnostic boundary represents the existing decoder entry and
is not charged twice. The current data proof excludes the actual data-out
branching row. Coverage of most data states does not measure the difficulty of
the smaller extractor's arithmetic and global tape invariants.

## Evidence and reproducibility

Successful free GitHub-hosted run:
[40143132066](https://github.com/bocowgill/cryptids/actions/runs/40143132066),
producer **5e978b16ee8269943ef4e9999b6f34cafc965801**, manual phase `memory`.
One of at most two allowed iterations was used, with no failed approach in this
phase. There is no reason to spend a second iteration merely repeating success.
The shared-bound approach passed its first all-word check.

Evidence is retained under `evidence/memory-01`: complete workflow logs, original
artifact archive, exact source manifest, capacity probe, command/resource
receipts, both generated sources/objects/exports, negative controls, preservation
receipt and comparison. Producer-source hashes were verified against exact Git
blobs. `review.py --iteration 1` independently rechecked the retained provenance,
log/object/export hashes, arithmetic and decisions without executing a model.

Artifact archive SHA-256:
`119a62a2751dfe51964da5806ccd19e7d8cfa153890d104fb00cc20eb81765ae`.
Full workflow logs SHA-256:
`32c68e268e0d97531893cce4e4cc980eda7f6e314dcc5e754c0f5e65ac3c159c`.
New shared source SHA-256:
`bb4fb6c20db56f773de3813c40b7615c0b02d2b8dada4521653f3ef5e9e4ae99`.

Limits remained 900 seconds total driver time, 300 seconds dependency fetch,
240 seconds strict library build, 120 seconds per instance, 5 GiB Lean heap,
6 GiB sampled group-plus-driver RSS, 512 MiB driver and one Lean thread, with
a 25-minute workflow timeout. No resource cap was raised or paid runner used.
All generation, Lean, execution, row comparison and measurement stayed remote;
local work was text, provenance, editing and transport only.

## Next decision and unresolved obligations

The shared representation clears this bounded integration prerequisite. Use it
in the next authorized structural stage; avoid restoring per-literal proofs or
raising memory to accommodate them. The next mathematical task is a reusable
unary-to-binary counter and word-insertion contract with exact tape geometry,
including the data-out branch. First test its generic proof and its composition
with `query_run`; then check that composition against the same full data block
within the unchanged caps. Do not flatten or unroll full physical startup.

Subsequent obligations remain preamble/epilogue, framing and marker cleanup,
complete finite blank-tape startup, exact frozen packet identity, the whole Lean
printer, direct linking and suffix relocation, both halting directions and final
strict/foundation/regression checks. Prefer deriving word values generically
from packet bits so identity is structural, rather than paying for a second huge
literal-array equality. No reliable whole-certification time estimate is yet
available; the new memory headroom does not solve those proofs.

| Opportunity | Plausible full-machine saving | Proof difficulty / implementation effort | Decision |
| --- | ---: | --- | --- |
| Complete this printer's structural certification | 160,097 experimental states | High mathematical work; moderate composition engineering | Next active route after authorization |
| Shared-bound data materialization | 0 additional states; enables the 160,097 above | Low, now checked at full data size | Pilot complete; use this representation |
| Derive words from framed packet bits | 0 additional states; supports the same 160,097 | Medium; avoids later literal-identity overhead | Design into later packet instantiation |
| Earlier interpreter quotient | 459,315 experimental states on its own baseline | High; prior complete certification scaling unresolved | Older campaign remains paused; do not combine savings |

This bounded pilot is complete. No subsequent proof job or old-goal resumption
is launched automatically. Outreach, upstream issues and PRs remain on hold.
Complete recovery payload push and final ref verification are recorded in
CHECKPOINT.md and the manual R1 gate after they have actually completed.
