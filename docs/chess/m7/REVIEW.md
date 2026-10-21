# M7 independent adversarial review

Disposition: **correct — R1 and R2 accepted for the pinned M7 construction and evidence**.
The actual M7 kernel, independent target, every-row comparison and unchanged
regression wrapper passed their required remote checks. All 192 computation
hashes match across those reports and the current files; all 172 frozen M6
hashes remain unchanged. No remaining mathematical, numeric-map, artifact or
verification defect was identified. This is independent advisory review of the
construction and recorded formal evidence, not an additional source of proof
authority.

Reviewed implementation: `088988f81248c3b2270d6d4549dd3ab29296c3a9`. Current
checkout `1c3be1cb21ae223794c51f569dd53d12f7991cca` adds a separately pinned
regression orchestration helper and leaves all 192 computation hashes identical.
The exact computation inputs, evidence hashes and accepted scope are fixed in
the final [review seal](evidence/review/seal.json). The portable
[review validator](evidence/review/validate_review.py) rechecks the retained
remote evidence without executing Lean, a native exporter or a table sweep.
Only this review and the private referee evidence directory were written. No local
Lean, Lake, Lean LSP, LeanProbe, native exporter, chess search, or full table sweep
was run.

## Exact claim and mathematical construction

The candidate must have two symbols, ordinary state zero on the all-blank tape,
and missing-transition halting equivalent to
`¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`. It must preserve the frozen
M6 inputs and strictly improve the fixed 392,046,832-state baseline. No value of
initial chess is inferred.

`CompactPost` maps the old distinguished initial control and all old
optional-node/store descriptors into one terminal control and all live
node/store pairs. On a live pair, `rawEncode` gives `1 + pc * k + store`; on a
terminal descriptor, it gives zero. The involution exchanging zero with
`1 + entry(0) * k` makes the actual root at store zero the ordinary initial
control. It moves the terminal control to that nonzero index. The old
distinguished initial control duplicates that same live root, so it need not
survive as a separate control.

This collapse is valid for every old configuration and tape, rather than only
for reachable chess configurations. Distinct live pairs are not merged. Every
terminal store has the same missing transition on either symbol. In particular,
a live `.halt` syntax node still performs its original final write before
entering the shared terminal control; the quotient does not remove that step.
`step_trCfg` states exact one-step commutation, including the `none` case, and
preserves the entire tape. `respects`, `trCfg_init`, and `halts_input` assemble
both halting directions for arbitrary finite inputs without a termination,
reachability, or chess-value assumption.

The historical generic proof passed at `75f25b5`. The current construction adds
a direct universal transition certificate, without changing the quotient. The
actual current source now passes the complete strict proof build and foundation
audit in CI 39506528766, including the actual chess assembly and mathematical
table bridge. The count proof uses the frozen symbolic
`Compilation.Input.initialise_states` theorem, avoiding expansion of the input
array without changing its statement or paid accounting.

The count is consistent: `n = 38,893,646`, `k = 5`, so old Post controls number
`1 + (n + 1) * k = 194,468,236`, and new controls number
`1 + n * k = 194,468,231`. Merging five terminal stores saves four controls;
removing the duplicate initial control saves one more. The frozen binary
compiler pays for both main and return blocks, so this saves ten binary
controls. Its 388,936,462 body controls plus the unchanged 3,110,360 paid
initializer controls give 392,046,822. The proposed strict reduction is attached
to actual generated counts in `M7Table.strict_generated_reduction`, not merely
to an unrelated numeric inequality.

The checked assembly uses the frozen getter, `Binary.compile`, `Input.binary`,
`Input.bits`, and `FlatInit.initialise`. Its proof chain is:

1. Generic Post quotient equivalence on the same input.
2. Frozen M6 Post-to-strategic equivalence.
3. Frozen binary compiler equivalence and exact bit-list identity.
4. Frozen, fully paid blank initialization and cardinality cast.

`initialises` specifies the same exact bit tape and restored head after
3,110,360 ordinary steps from the blank configuration. The target, two-symbol
convention, and initializer are not weakened. The current remote proof report
contains seven successful expected checks, including foundation rejection controls.
It audits 65 roots and 48,674 declarations with only `propext`, `Classical.choice`
and `Quot.sound`.

## Exact table specification and extraction

The retained literal M6 payload plus a fixed `table-map.json` and the checked-in
numeric extractor fully specify every candidate row and destination. This is a
recoverable encoding of the exact candidate table: extraction needs Python,
the retained literal baseline parts, and fixed arithmetic metadata, with no
chess solver or chess compiler.

The old descriptor encoding is `1 + optionIndex * k + store`, where
`optionIndex = 0` for `none` and `pc + 1` for `some pc`. The extractor's
`post_map` removes the terminal-store offset, collapses every terminal store,
and makes the same root/zero swap as `CompactPost`. `state_map` applies this
map separately to both binary blocks and leaves prefix controls fixed. It
renames destinations in prefix rows as well, including the last initializer
transition into ordinary body state zero.

The canonical section selects the old encoded root for new control zero, the
old terminal descriptor at store zero for the new terminal control, and the
corresponding old live descriptor elsewhere. Hence `state_map(section(s)) = s`.
Selecting the encoded root instead of the old distinguished initial row is
legitimate because those rows execute the same root/default-store descriptor.
The interval decomposition preserves candidate order across both swapped
indices and the main/return boundary.

A full extraction validates the complete raw and compressed hashes, sizes and
row counts of every selected baseline part. Only ten old binary controls are
omitted. Every one of the actual 393 retained parts contains at least 46,832
rows, so no entire part can be omitted: a complete extraction touches and
validates all retained parts. This observation does not claim those payloads
were swept locally.

Independent bounded Python checks passed for 448 parameter cases, 7,168 old
Post controls, 12,768 canonical target controls, 249,984 complete interval
segmentations, and 30,016 synthetic binary cells. They include root at the
first and last live node, one-store cases, missing transitions, load/branch
chains, goto targets, prefix/body boundaries and both binary blocks. The
[script](evidence/review/finite_map_review.py) and
[result](evidence/review/finite_map_result.json) are retained with the review evidence. These checks
are bounded evidence for the arithmetic and extraction logic; they do not
replace the universal Lean proof or actual all-row comparison.

The exact candidate is now frozen by the committed standalone target and fixed
map (`initial_node = 0`), and by the complete canonical manifest. The full raw
stream contains 8,979,480,868 bytes and has SHA-256
`47a9730ccdcbdf0983951be91993ce1470b0109e75a347696786b70eda011c81`.
The canonical manifest SHA-256 is
`02c783610211d05f02005d8294088abbb1f2735f3cbda812732a076c6bdbb07a`.

## Audits, failure paths and evidence boundary

The solution foundation audit follows types and bodies transitively, checks
required construction roots, rejects the open chess conjecture, proof-generator
dependencies, unsafe/partial definitions and nonstandard axioms, and tests those
rejection paths. The independent target comparator checks the theorem type and
the complete transitive target declarations in separate environments. It also
checks permitted library imports, solution-proof axioms, and standalone runtime
aliases. The explicit `M6SnapshotReferenceGoals` marker is confined to the
standalone challenge bridge; it is rejected from the actual mathematical target
closure. An explicit reference-goal axiom in that challenge is not evidence for
the solution theorem.

All four actual semantic controls constructed kernel-valid altered targets for
the proposition, a transition chunk, frozen initial position and reference
bridge. Exact comparison rejected each for its expected reason. The normal
Linux sandbox comparator completed successfully, and the independent comparison
checked 13,837 target dependencies, the 48,629-declaration solution proof closure
and 27 runtime alias roots.

The table verifier completed the identity check comparing every extracted
candidate row byte against a newly built standalone native exporter. The inherited
orchestrator requires all ranges, checks exact row syntax/counts/destinations,
records source/executable pins and part hashes, and rejects extra output. Full
comparison plus canonical raw hashing is materially stronger than samples or a
hash with no semantic comparison. Native execution and file I/O remain the
explicit artifact identity trust boundary; they are not premises in the Lean
halting theorem.

Two orchestration distinctions must remain visible in final acceptance:

- A workflow with no committed challenge performs proof checks and bootstrap,
  then deliberately skips independent definitions, complete table comparison
  and regressions. Its green status certifies only that preliminary mode.
- Direct `--definitions` and `--table` modes do not themselves call `freeze`.
  Final acceptance must compose them with a fresh freeze/proof record and check
  that their current source pins agree. The full committed-target workflow orders
  these checks appropriately; its actual reports must be inspected.

All 172 frozen baseline hashes matched in the light local check. The independent
extractor validates the literal payload against the frozen manifest during the
required remote sweep. A report based on changed input pins, a stale standalone
target, a partial range set, or a bootstrap-only workflow cannot close the gate.

## Completed component evidence and regression recovery

CI 39506528766 at the implementation commit passed its actual proof and
fixed-target/full-table steps. The bootstrap step was skipped because the target
was already committed. Its full workflow conclusion is **failure**, because the
later baseline wrapper encountered a missing umbrella `Mathlib.olean` while
compiling the pinned reference source. The retained failure log identifies that
setup error; the passed earlier component reports are not relabeled as an overall
green run.

The official archive has SHA-256
`777fb6e818d3d744809610e64f22f56b01eca4543b8eab173a24693d57540c4a`,
matching the saved GitHub artifact metadata for artifact 12312851587 and run
39506528766. All 12 entries match their extracted files. The [proof](evidence/current/proofs.json),
[definition](evidence/current/definitions.json) and
[table](evidence/current/table.json) reports each contain the same 192 source
hashes, all matching current
files; all 172 frozen M6 hashes remain unchanged. The separate producer journals
also contain those same semantic pins and independently pinned executables.
The [extractor](evidence/current/extract-run.json) and
[standalone producer](evidence/current/independent-run.json) each completed all
393 ranges with no gaps
or overlaps. Their ordered part records equal the complete manifest. The
independent journal records all 392,046,822 byte comparisons and identical fresh
gzip reproduction with zlib 1.3.1. Extraction took 3,063.87 seconds and independent
comparison/reproduction 4,173.74 seconds. Those are artifact processing costs,
not a runtime measurement of solving initial chess.

The separate regression helper fetched the complete pinned Mathlib cache and
invoked the unchanged `verify_chess_m7.py --baseline`. Recovery CI 39527113752
completed successfully; its [baseline report](evidence/regressions/baseline.json)
records the expected command, zero exit, completion output and 2,287.08-second
regression-wrapper cost. Its [checkout record](evidence/regressions/regression-checkout.json)
contains the exact same 192 core input hashes and pinned toolchain. It records its checkout,
all 192 core input hashes and its own separately pinned workflow hash. The helper
hash reviewed here is
`b931742cde22641c0508fba5bbc6e56e591c12b59bdff044b6b1878a453efe51`.
The official recovery artifact 12315800109 has SHA-256
`459319558e2fa81574f9df225868f0d42ac3704b946e42fa6b853513c23ba6e0`;
all three ZIP entries match the retained files and saved GitHub metadata. The
[successful recovery run](evidence/regressions/run.json) and unchanged wrapper
therefore compose validly with the already completed two-hour table evidence. Repeating the table sweep is not
necessary merely because regression setup was repaired in a separate workflow.
The failed overall run and its actual failure must remain retained and visible.

The original CI 39506528743 attempt 2 was green on the same implementation,
including reference, executable rules, history, evaluation, compilation,
comparator, machine-table and initializer checks. Its metadata and logs are
supplementary regression evidence; they do not substitute for the required new
baseline wrapper report.

## Final acceptance and seal

R1 and R2 are accepted. The [current component evidence](evidence/current/),
[successful regression evidence](evidence/regressions/), retained failed-run
status, and exact shared computation pins satisfy the unchanged M7 acceptance
outcomes. The independent validator rechecks source inventory, official ZIP
content and metadata, actual log completion tokens, expected control rejections,
ordered table ranges, full manifest linkage, producer identities and regression
composition. The [seal](evidence/review/seal.json) fixes all 192 current inputs,
separate orchestration, both official artifacts, full table manifest, durable
evidence and this review report by SHA-256. The root must verify the copied seal
and current hashes before recording final acceptance.

The accepted improvement is exactly **392,046,832 → 392,046,822 states**, preserving
two symbols, ordinary state zero on blank tape, missing-transition halting and
all 3,110,360 paid startup steps. Its unconditional target remains
`¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`. The explicit reference
axiom remains confined to the independent challenge bridge and is not a premise
of the solution proof. Artifact extraction/native printing, file I/O, hashes and
gzip remain the stated external verification boundary.

This accepts one certified strict reduction under the frozen target. It does not
resolve initial chess, establish minimality or claim a practical runtime
improvement. No outreach or Git mutation was performed by the referee.
