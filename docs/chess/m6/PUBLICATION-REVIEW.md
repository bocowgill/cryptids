# Final publication candidate review

Publication approval: **passed**

Candidate: parent-declared immutable commit `256d7e1` (supersedes `37fc80d`, `3af047c`, `6c4c271`, `f99d8cf` and `595d747`). Reviewed source hashes are
pinned in `.unlazy/chess-m6/leaf-1.47/source-pins.json` (172 files, including all
42 frozen M1/M5 input files). Documentation may change; these computation and target
pins must not. This closes the review scope of the initial `595d747` freeze plus
the separately inspected `f99d8cf` baseline-wrapper/manifest amendment, `6c4c271`
CI setup amendment, `3af047c` cold-native-build amendment and `37fc80d`
clean-fixture dependency amendment, plus the separately reviewed `256d7e1`
process-exit monitor and evidence-retention amendment. The original G1
freeze is retained in that scope; it has not been silently replaced by a different
candidate. **No mathematical or comparator correctness defect remains. All three
review gates are met for `256d7e1a91546d4b2289edf2b075ab7ffa2aa0ee`.**
Current Linux all-row verification and historical local exact gzip reproduction
are separately retained under their actual pins.

## Mathematical table and retained literal payload

The candidate follows the descriptor-plus-complete-compressed-payload design in
EXPORT-REVIEW. It does not publish only an algorithm, a hash, or sampled rows.
All 393 named gzip parts are present locally, with their exact manifest sizes:
1,762,091,864 compressed bytes representing 8,979,481,064 canonical raw bytes and
392,046,832 rows. The raw identity recorded by the manifest is
`85254453db2653e6a057307006848fea92c9dc1e1aba74c68f4fbc78cee8421e`.
The completed clean Linux checkout and all-row comparison exercised all 393 retained
parts from the pushed candidate; acceptance does not rely on local presence alone.

`Matrix.lean:16` defines every row and column in increasing finite-index order.
`row_count` (:44), `column_count` (:47), and `identity` (:51) identify this complete
row-list machine with the actual indexed `Image.machine`. `Matrix.halts_iff` (:54)
then proves unconditionally that the row-list machine halts iff
`¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`. The source proof remains
`Image.halts_iff`; the earlier IMAGE-REVIEW trace and paid 392,046,832-state accounting
still apply to the identical Image hash
`78dc9a503d77dfa7049f467bf331760e76ac8bf6da5416ad9426083b0f15a960`.
No filesystem assertion or native hash is a premise of either theorem.

The 1,734 “read sites” are the read-bearing `.write`, `.load` and `.branch` rows
(`TemplateGraph.ReadRow`), not an additional disjoint source constructor. The 270
write sites are a subset of this family and also allocate writer suffixes. The
read-bearing/move/plain classes partition source controls; reader payloads and
writer suffixes are separate graph allocations. The count formula intentionally
includes both families, with no accidentally omitted or double-counted state.

This identity theorem concerns the fixed mathematical table. It does not prove that
bytes in a filesystem decode to that table. The full independent native comparison
is the explicit representation/I/O boundary, as in the existing export
convention. Kernel acceptance, a row-list view, or the ten boundary observations
below cannot replace that comparison.

## Fixed standalone target and proof separation

`Cryptids.ChessM6Challenge` is a self-contained fixed constructor-data snapshot,
9,698,093 source bytes, hash
`83125dc39ad8d9f4a52134bc6e0036592ac6e2b35ae19f36a6d8d5472e19495a`.
It imports only permitted Lean/Mathlib modules. The constructor replay calls the
kernel's declaration checker; the exporter is native tooling, not a logical premise.
The target contains the actual frozen machine, execution semantics and strategic
predicate definitions. It has no source-module import or evaluator oracle.

The target does not contain `Source.program_initial_dom`, `Source.program`,
`SourceCertificate.program_decode`, `Image.halts_iff`, `Image.valid`, or
`Matrix.halts_iff`; the independent target-only check confirms these absences.
The designated target goal is a theorem bridge to exactly one clearly labelled
`M6SnapshotReferenceGoals` axiom. It fixes a challenge statement; the solution proof
is not copied. The source proof audit rejects every nonstandard axiom, so that
reference-only axiom cannot enter the proved solution.

The mathematical target closure contains 13,860 declarations and 12,981 bodies,
independently counted from the actual target environment. The completed root
comparison matches the same closure with the solution. Separately, its solution
proof audit reaches 48,586 declarations and its 27 safe runtime aliases reach 6,124;
both use only `propext`, `Classical.choice`, and `Quot.sound`. This review independently
rechecks the source proof's 48,586-declaration closure and its new-axiom rejection.

The seven regenerated recursive runtime owners have safe mathematical bodies and
kernel-checked source/unfolding and alias equality proofs. Compiler recursion helpers
are recognized only with an existing safe owner and the same type. Diagnostic
`_recApp` normalization is outside the exact mathematical target closure. Native
compilation of aliases remains part of the ordinary executable/I/O trust boundary;
it is not an extra mathematical axiom or a copied solution proof.

## Comparator and failure controls

`CompareChessM6.lean:89` requires a source theorem, the explicit reference bridge,
equality of their types, and equality of all declarations reachable through those
types and their bodies. `sameInfo` (:35) compares complete definition/theorem/opaque
values and metadata, constructor information, inductive fields and recursor rules.
Only bound universe parameter names are normalized by position; expressions and
bodies are otherwise exact. Traversal includes private helpers, types, proof bodies,
mutual inductives and recursor rule dependencies. The supported Lean InductiveVal
field inventory was checked against this comparison.

The direct-import guard permits Lean/Mathlib/core roots, then walks their complete
library import graph and rejects repository imports or any unexplained target module.
The target identity audit rejects open/reference-goal dependencies, unsafe/partial
logical dependencies and new axioms. Separate source-proof and runtime-alias audits
avoid treating reference-goal axioms or compiler aliases as trusted solutions.

The existing actual-target controls are substantial: all four changed targets first
pass kernel replay, then exact comparison rejects (1) statement replaced with True,
(2) literal write data 277 changed to 278, (3) initial-position clock 0 changed to 1,
and (4) an unlabelled reference bridge. Their recorded original snapshot hash matches
this candidate. The current proof and mutation reports were inspected directly.

An optional duplicate two-environment comparator run in this review hit its 8-GiB
owned-RSS cap before producing a comparison result. It is retained as a bounded
experiment limitation, not a passed comparison or a mismatch. This review instead
uses the already completed root exact-comparator/mutant reports and independent
single-environment audits and the completed current Linux sandbox comparison below.

## Canonical bytes, reproducibility and independent checks

The transport checks ordered ranges, all rows, both cells, destination bounds,
canonical decimal syntax, spaces and LF, exact row/byte counts, all per-part and
whole hashes, gzip headers and single-member termination. It rejects extra files,
truncation, trailing data and extra gzip members. Producer exit, output bounds,
timeouts, source/executable pins and final completeness are checked; an independent
comparison cannot resume an earlier generation journal. Completion requires every
range and a final whole-table assembly check.

`verify_chess_m6.py:298` compares all retained rows against the separately compiled
standalone exporter. Source and target export binaries are distinct. Inputs are
pinned before building and checked after build and complete comparison. Direct
row-byte equality is required independently of checksums. When reproducing, every
fresh gzip part and the manifest are also compared byte for byte.

The codec policy is explicit: the canonical raw bytes are portable. Exact gzip
reproduction is claimed only for the recorded Python 3.9.6/zlib 1.2.12 runtime and
fixed gzip settings. Another runtime must still check all raw row bytes and retained
compressed hashes; it is not reported as having reproduced identical gzip bytes.
The Linux check must be interpreted with this distinction.

Authored focused checks are reproducible with:

```sh
python3 .unlazy/chess-m6/leaf-1.47/verify.py
```

They kernel-check the complete Matrix statements, count and audit the actual target
without copied proofs, and audit the source proof plus an injected-axiom rejection.
Six small transport mutations check coherent-but-different tables, short/long
reference streams, bad destinations, noncanonical decimals, and extra gzip members
with updated compressed metadata. Both actual native exporters match retained bytes
at ten initializer/main/bounce/end boundary rows. These checks are bounded evidence,
not a replacement for the 392,046,832-row comparison. No initial chess value is run.

## Narrow baseline-wrapper correction

The `f99d8cf` correction changes the verifier and release input metadata; Lean,
standalone target, exporters and literal table bytes are unchanged. The prior
`595d747` review/pins/results are retained under `candidate-595d747/`. Reconstructing
the old verifier by removing only the reviewed correction reproduces its previously
pinned SHA-256 exactly; `baseline-correction.diff` records that exact narrow diff.

`baseline_diagnostic` accepts clean output or exactly the complete ordered set of
22 already recorded Challenge.lean warnings. Changed, partial, duplicate, reordered
or new warnings fail. The exception requires an explicit flag and the exact
`python3 scripts/verify_chess_m5.py --baseline` argv. Other commands remain strict.
The source input set now pins both Challenge.lean and the retained M5 result record.
The production fixture passes 2 positive/6 negative cases. Independent wrapper-scope
checks with mocked subprocess output pass 2 positive/7 negative cases, including
attempts to use the exception on the main M5 command and a different build command.
These mock tests do not count as completion of the actual M5 suite. The full byte
sweep restarted from zero with the new input pins; interrupted older progress is not
reused as final evidence.

## Narrow CI setup correction

`6c4c271` changes the M6 workflow only. All111 publication inputs, Lean/source
proofs, standalone constructor data, exporters, table manifests and literal payloads
remain unchanged, so the full sweep did not need another restart. The review now also
pins the workflow itself (172 files total).

The official pinned Lean action is setup-only using its documented false-valued
build/test/lint/cache inputs. Explicit pinned cache restore/save steps use the
pinned toolchain/manifest and commit key. Cache fetch names 25 existing Mathlib roots;
the installed pinned cache CLI accepts named-module roots and their dependency
closure. Each of three attempts has a 240-second timeout and a 10-second kill grace;
all failures leave the step failed. Successful setup still proceeds through strict
`lake --wfail` Foundations+Matrix build and the unchanged complete verifier. This
bounds a cache-download failure without skipping any proof, comparator or table check.
The earlier cold-cache stall happened before project code executed and is not a
mathematical result. The completed current workflow supplies the required evidence.

`3af047c` adds only a visible 40-minute strict cold native build of the existing
source and standalone exporters before the unchanged verifier. This warms shared
native dependencies after the earlier run reached the native Image fixture build
but exceeded its 600-second cold budget. The verifier's budgets and checks are not
relaxed. Reversing just these three workflow lines reproduces the independently
reviewed 6c4c271 workflow hash exactly. Both workflow changes are infrastructure
preparation; the current final workflow has now completed successfully.

`37fc80d` changes only two workflow lines: the strict proof-build step now also
builds the existing `Cryptids.Compilation.Tables`, and its label states that scope.
Reversing those exact lines recovers the pinned `3af047c` workflow hash. The failed
`3af047c` run reached `ExportFixtures.lean`, whose explicit Tables import lacked a
compiled `.olean` in the clean checkout. The verifier failed closed. Adding that
existing build target prepares the fixture dependency without changing its checks,
any Lean source, any literal byte, or any of the 111 publication input pins. The
replacement M6 run `39445308871` on `37fc80d` failed later in the monitor,
as recorded below; it is not counted as a complete pass.

## Process-exit monitor and evidence-retention amendment

The `37fc80d` Linux run passed all 50 foundation checks, exact standalone
comparison, all four actual target mutations, and the normal sandbox comparator.
It then completed four million-row ranges and failed when `/proc/PID/statm` raised
`ProcessLookupError` after a child exited. That is partial Linux evidence; the run
and table check did not pass.

`256d7e1` changes exactly four files. The monitor adds only `ProcessLookupError`
to its existing disappearance catch. A completed child has zero RSS; its actual
exit status, bounded output and complete row bytes are still checked by the worker.
Permission and other I/O errors still propagate. Focused mocks cover live RSS,
ENOENT/ESRCH disappearance and EACCES/EIO propagation. This review independently
ran those exact-function mocks and reproduced ESRCH failure with the prior function.
The manifest changes only the monitor and focused-fixture hashes. Reversing both
Python edits and those two manifest entries recovers the pinned `37fc80d` files.
No mathematical definition, snapshot, exporter, retained row or gzip byte changes.

The workflow moves optional cache saving after strict native compilation and before
the unchanged mandatory default verifier. `continue-on-error` applies only to cache
saving. A pinned upload action retains the three component JSON reports and table
run journals even after failure, with 14-day retention; it excludes literal payload
parts. Cached `.lake` reports may be old, so file presence alone is insufficient.
Final acceptance requires successful exact-head runs and log milestones, current
report pins, complete fresh journal identity and artifact/run provenance.

The final-results assembler was separately reviewed for stale evidence acceptance.
Initial missing guards were corrected: artifact run/head/name and archive digest bind
all extracted report bytes; the selected journal must belong to that archive; both
50-check lists, current input maps, exit classifications and expected commands are
checked. Complete-table plans must use current monitor/tool and semantic producer
pins, retained part records and one fresh completed attempt. Historical report and
journal hashes remain fixed. The approval guard binds this report's hash, candidate,
172 reviewed source pins and completed review gates. Static script hashes are retained
in `assembler-static-review-final.json`; neither private script was executed by this
reviewer. The actual downloaded archive is independently checked below.

## Historical foundations

The local `37fc80d` foundations completed all 50 checks with 107 input hashes,
including its workflow, and were independently checked. The resumed review does
not rerun Lean, native builds or full sweeps locally. Its exact earlier report and
pins are retained under `candidate-37fc80d`; its hashes are not edited to match the
new tools. The completed `256d7e1` Linux default verifier supplies current foundation,
definition and complete-table reports, independently checked below. Mathematical,
source and snapshot pins are unchanged; the new monitor controls also passed.

## Completed local frozen baseline

The final local baseline report contains both successful original commands:
M5 `--baseline` (frozen M1–M4 correspondence, audits, rule/perft/evaluation fixtures)
and the full main M5 suite. Report output fingerprints and exits independently
recompute. All four native regenerations and literal exports, the 70,415-declaration
standalone comparison, and both independent semantic mutation controls are covered.
Artifact records equal the retained frozen M5 records exactly, every original
frozen source hash is preserved, and all recorded source hashes still match.
The current report additionally inventories 35 new M6 compilation files; that is
broader coverage, not a change to any frozen M5 source. The exact inherited warning
exception applies only to the baseline command; the main suite has no warnings.
The supported-host regression run also completed, as recorded below.

## Historical complete local table sweep

The finished earlier local run independently compared every one of the 392,046,832 rows
against the standalone native exporter. All 393 ranges completed with
`every-row-byte` comparison, and all 393 fresh gzip parts reproduce the retained
manifest and compressed bytes on the recorded local codec runtime. The retained
payload contains 8,979,481,064 canonical raw bytes and 1,762,091,864 gzip bytes.
The journal reports 2,454.860454167 seconds and peak sampled aggregate RSS of
792,969,216 bytes, within the recorded 8-GiB limit.

The earlier read-only `check_finished_table.py` independently checked complete status,
all row/range counts, exact fresh-manifest byte identity, all 111 then-current publication
source pins, all 172 then-current review pins, producer executable and semantic-file pins,
comparison/reproduction settings, and build output fingerprints. It did not repeat
the full sweep. `full-table-evidence.json` pins the final report and journal hashes.
Its exact report and journal are copied and hash-checked under `candidate-37fc80d`.
This remains historical complete byte/gzip evidence under the earlier tool pins.
The two reviewed operational tool changes are explicit. The completed Linux run
below supplies current 111-pin verification. Portable identity is canonical raw bytes;
exact fresh gzip reproduction is specific to the recorded local Python/zlib runtime.

## Historical supported-host original regressions

Original CI run `39435177296` on `f99d8cf` finished successfully, including M1–M5,
the normal repository sandbox comparator, and machine-table/blank-initializer
regressions. Metadata records every required step successful. The log contains
`Lean default kernel accepts the solution`, `Your solution is okay!`, and the final
first-principles verification pass. Its historical source scope remains applicable: the subsequent edits concern M6
verification operations and their manifest pins, while original source and test
definitions remain unchanged. `candidate-37fc80d/regression-ci-evidence.json`
retains the historical head, step statuses and metadata/log fingerprints. Current
original CI is recorded separately below.

## Completed current-candidate original CI

Original CI `39458752023` completed successfully at the exact current `256d7e1`
head. The independent light checker verified all seven required verification steps,
M1–M5 success markers, the normal repository sandbox's default-kernel acceptance,
and the final machine-table/blank-initializer pass. `regression-ci-evidence.json`
records its exact metadata and log fingerprints; the log SHA-256 is
`c2bff0e9f65b4cc857ca32bed8ca1265c869daa5abbfb5284a7b2be9a8ede975`.
This completes current original-regression acceptance. The separate completed M6
default/all-row run is checked below.

## Completed current-candidate M6 Linux acceptance

M6 run `39458752058` completed successfully at the same full `256d7e1` head.
Its actual uploaded reports contain all 50 foundation checks with 107 current input
hashes, and four successful definition checks: strict snapshot replay, exact deep
comparison, all four kernel-valid semantic mutants, and the normal Linux sandbox.
The independent reader checks their expected commands, exit classifications and
output fingerprints, including the unchanged source/alias standard-axiom audits.
The raw foundation-mode report still records its component scope (`in_progress`,
1/8 integration gates and no published literal-machine field). Those fields remain
untouched; final acceptance composes that component with the completed definition,
table, original-CI and review evidence rather than relabelling its raw status.

The current table report and selected journal record all 392,046,832 rows compared
by `every-row-byte` across all 393 complete ranges, under all 111 current publication
pins. The journal contains one fresh completed attempt with four workers, 120-second
producer limits and an 8-GiB sampled aggregate RSS limit. Actual comparison time was
2,897.990306377 seconds; peak sampled aggregate RSS was 844,886,016 bytes. Current
monitor/tool hashes, producer semantic pins, the retained part manifest and every
completed part record all match. This supplies the current complete-table evidence.

Official artifact `12288679618` is 81,161 bytes, with SHA-256
`e55fae9e70505c2ec572160a38cb0b8eb8ccd48f06f80ee2577a5d6b4d3c98dd`.
Its actual run/head/name metadata and official digest match the downloaded archive.
All extracted file hashes match exact archive members, including the selected
`full-independent-vgfivvpq/run/run.json`; stale cached files cannot supply that journal.
Both current CI runs, all report identities and all 172 reviewed source pins were
independently rechecked before this approval.

Linux used Python 3.14.4/zlib 1.3.1, so its report correctly records
`compressed_reproduction = false`. It checked every canonical raw row byte and the
retained gzip hashes. Exact fresh gzip reproduction remains the separately preserved
complete local Python 3.9.6/zlib 1.2.12 run. The unchanged payload and explicit two-tool
operational delta connect those records without rewriting any historical report.

Final light checks are reproducible with:

```sh
python3 .unlazy/chess-m6/leaf-1.47/check_ci.py --m6-metadata .unlazy/chess-m6/ci-final-m6.json --m6-log .unlazy/chess-m6/ci-final-m6.log --regression-metadata .unlazy/chess-m6/ci-final-regressions.json --regression-log .unlazy/chess-m6/ci-final-regressions.log
python3 .unlazy/chess-m6/leaf-1.47/check_downloaded_evidence.py
```

Both checks exited zero. `ci-evidence.json`, `downloaded-evidence.json` and
`seal.json` retain their concrete identities and final review hashes. G1/G2/G3 are
met, with zero pending or abandoned gates. The kernel mathematical identity and
ordinary native compiler/I/O byte boundary remain distinct. No initial chess value,
M7 work or outreach was performed.
