# M7 independent adversarial review

Disposition: **uncertain — publication acceptance withheld pending current remote evidence**.
The mathematical construction and numeric extraction recipe have no identified
defect in this preliminary review. This is an advisory source review, not a claim
that the actual M7 assembly has passed the kernel or that the full candidate table
has been checked.

Reviewed source: commit `522d1c4d7a6f24dd49fb9549622900dca2075f43`.
Exact hashes are in
[`review-pins.json`](../../../.unlazy/chess-m7/leaf-1.1/review-pins.json).
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

The current `CompactPost.lean` bytes equal those at `75f25b5`, whose retained
CI 39496217300 log reports the generic module built. That local kernel result
does not certify the later actual chess assembly.

The count is consistent: `n = 38,893,646`, `k = 5`, so old Post controls number
`1 + (n + 1) * k = 194,468,236`, and new controls number
`1 + n * k = 194,468,231`. Merging five terminal stores saves four controls;
removing the duplicate initial control saves one more. The frozen binary
compiler pays for both main and return blocks, so this saves ten binary
controls. Its 388,936,462 body controls plus the unchanged 3,110,360 paid
initializer controls give 392,046,822. The proposed strict reduction is attached
to actual generated counts in `M7Table.strict_generated_reduction`, not merely
to an unrelated numeric inequality.

The intended assembly uses the frozen getter, `Binary.compile`, `Input.binary`,
`Input.bits`, and `FlatInit.initialise`. Its proof chain is:

1. Generic Post quotient equivalence on the same input.
2. Frozen M6 Post-to-strategic equivalence.
3. Frozen binary compiler equivalence and exact bit-list identity.
4. Frozen, fully paid blank initialization and cardinality cast.

`initialises` specifies the same exact bit tape and restored head after
3,110,360 ordinary steps from the blank configuration. The target, two-symbol
convention, and initializer are not weakened in the source. The actual M7
proof/audit run remains a required missing premise.

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
script and result are retained in the private referee directory. These checks
are bounded evidence for the arithmetic and extraction logic; they do not
replace the universal Lean proof or actual all-row comparison.

The exact candidate is not yet frozen by this review: the current committed
standalone target, fixed map and full-row raw hash remain to be supplied.

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

The semantic controls are intended to construct kernel-valid altered targets
for the proposition, a transition chunk, frozen initial position and reference
bridge, then require exact comparison to reject each. The current Linux sandbox
comparator and these controls must actually complete before acceptance.

The table verifier's required identity check compares every extracted candidate
row byte against a newly built standalone native exporter. The inherited
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

## Pending decision

The earliest missing premise is a completed current Linux kernel build and
foundation audit of the actual M7 assembly. The previous assembly terminated
with exit 143; no success follows from that termination or from the generic
quotient module's success. R1 has no identified source-level mathematical or
numeric-map defect, but remains preliminary. R2 is open.

Before a final verdict, provide completed reports for actual proofs and exact
initialization/counts; committed independent target and map; target comparison,
semantic mutants and Linux sandbox comparator; every one of the 392,046,822
candidate rows with canonical raw hash and part/run journals; unchanged Linux
regressions; separate build/runtime costs and failure records; and immutable
artifact/source provenance. Final review must re-pin those exact inputs and
evidence. No final publication approval is given here.
