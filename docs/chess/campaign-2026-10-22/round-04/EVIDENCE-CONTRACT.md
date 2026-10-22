# Complete structured-initializer saved-evidence contract

Status: source contract only. The accepted machine remains 998,176 states until
one complete remote packet, a fresh independent advisory, the coordinator's seal,
and the positive/hostile/portable metadata replays all pass. This document and the
checker do not create a mathematical certificate or promote a component result.

The new checker is `scripts/chess_table_full_20261022/check_saved_evidence.py`.
The accepted seed checker and every one of the 2,983 accepted pinned files remain
unchanged. The new checker may postdate the computation; its exact bytes must
agree with both the fresh independent review and the external acceptance seal.

## Candidate and full remote scope

The candidate is `ConjectureMachines.Machines.chess_table_seed`, with public
`ConjectureMachines.Semantics.ChessTableSeed.halts_iff_not_draw`. Its allocation
is 173,642 writer controls +21,682 decoder controls +1 new bridge +216 retained
expander controls +1 old bridge +573,802 body controls =769,344. The body retains
533,341 mains and 40,461 returns. The prospective saving from 998,176 is 228,832.
These are requirements on the remote proof, export and independent receipts;
the local saved-evidence checker does not recount or simulate a machine.

The saved full stream must contain 1,538,688 implicit state/bit rows in 9,232,128
bytes, with canonical six-byte `<BBI` records and exactly two missing transitions.
The local checker hashes that binary stream as opaque bytes. It never decodes
or interprets its records. It additionally hashes canonical JSON values of the
native decoder and old expander tables against the independently retained tables;
this is identity checking, not evaluation or enumeration of transitions.

The direct workflow is `.github/workflows/chess_table_full_20261022.yml`, named
`Chess complete structured initializer`. A completed successful dispatch must
have one successful `verify` job, successful `Fetch pinned Mathlib cache` and
`Complete remote verification` steps, and artifact
`chess-table-full-full-COMPUTATION_SHA`. This workflow has no repair session:
workflow and computation commits must be the same, and the seal's
`executed_workflow_sha256` must be JSON null. Session artifacts cannot substitute.

Five cumulative phase receipts are required: build=1, contracts=10, native=11,
counts=12, full=20. Their 54 entries must agree exactly with 20 distinct standalone
command receipts, including arguments, working directory, exit status, timeout,
output hash and intended success or failure markers. The final phase includes
M2–M7 and terminal-binary regressions plus the retained public semantics builds.
Three audit controls and five false allocation/saving kernel contracts must fail
for their intended reasons. Missing imports, unrelated elaboration errors and
timeouts cannot satisfy those controls. The successful audit must traverse the
full safe foundation closure and permit only propext, Classical.choice and
Quot.sound; the open conjecture, proof generators, unsafe/partial declarations
and forbidden axioms must be rejected.

## Source, bytes and independent references

`source-manifest.json` must match the exact producer inventory: the new workflow
and lakefile, accepted-pins JSON, complete FieldTableSeed/public theorem modules,
all Python/Lean files directly in both new script directories, all TableSeed
source modules, `NATIVE-CONTRACT.md`, and every retained file in the round04
packet-02 and controller-01 oracle directories. The checker is excluded from that
computation inventory and externally pinned. Every accepted baseline file is
hashed, and every repository import reached by the source-file closure must be
bound by the source manifest or accepted pins.

The packet directory contains exactly `artifact.zip`, `logs.zip`, `unpacked/`,
`run-api.json`, `jobs-api.json`, `artifact-api.json`, `retention.json` and
`archive-entries.json`. The retained artifact API is a single artifact object.
Archive names, byte lengths, SHA-256, CRC, compression metadata and exact unpacked
file inventory must agree; absolute/traversal paths, duplicate members, symlinks,
encryption and special files are rejected. Every loaded JSON/text payload is
checked against its archived bytes/hash. The seal pins both archives and all five
retention metadata files. Saved APIs and the reviewed seal are trust anchors;
this replay is not independent authentication of GitHub's original responses.

The successful artifact contains the source manifest, five phases, twenty command
files, five false-contract Lean sources, `machine-export.json`, `full-rows.bin`,
`fixtures-detail.json`, and `fixtures-progress.json`. No failure or temporary file
is accepted. The progress file intentionally retains `status="running"` and its
last mutation breadcrumb; success is established by the authoritative final
detail, complete phases and official API conclusion, not that progress label.

Seven exact input pins bind original source rows, symbols, old seed, original
field export, original body rows, independent new decoder and accepted old
expander. The full input receipt must retain equality for all 5,952 original rows,
141,380 symbols, 173,641 packet bits, 424,156 old-seed bits and 1,837,940 field bits.
The packet SHA-256 is
`ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8`.
Neither an encoder/decoder agreement alone nor a supplied count is acceptance.
The fixture report's `artifact_sha256.checker` binds `fixtures.py`; it is distinct
from the saved-evidence checker's external hash.

## Finite execution receipts and hostile controls

The actual full writer is replayed remotely through all 173,642 paid steps to
state 173,642 and physical head −173,640, preserving the exact packet and blank
exteriors in frame [−173,641,1]. Full quadratic chess startup remains explicitly
false in both native and independent reports. Finite evidence is explicitly
`universal_proof=false` and `new_accepted_machine=false`.

Fourteen native toy cases must appear in source order: empty, letters, zero,
tag_0 through tag_6, boundaries, pre_only, post_only, row_only. The independent
report records those cases and translated executions at origins −37 and 101 for
indices 0, 2 and 10, giving twenty executions. Native and Python receipts must
agree on complete support, physical head, state, steps and visited ranges. The
new decoder's exact seed endpoint is checked separately. Bounds are 4,000,000
steps per case, 50,000,000 total simulated steps, 540 seconds and 4 GiB. Total
simulated steps include the writer and hostile controls; they are not merely a
sum of positive toy runtimes.

All 37 remote corruption controls are required in the exact order declared by
`MUTATION_STAGES` in the saved-evidence checker and `controls()` in fixtures.py.
Every control records its expected exact rejection stage, a nonempty reason,
`original_positive_passed=true`, `rejected=true`, and
`timeout_counted_as_rejection=false`. Their scopes include complete-row equality,
encoding/extent/allocation, exact input and writer identities, complete toy
receipts, changed full toy paths, and reached-context handoff behavior. Early
rejection cannot be described as a later predicate's success.

The local `--self-test` first requires a genuine accepted positive packet. It
then attacks only in-memory metadata: claim, source and frozen hashes, archive
and API identities, command outcomes, audit axioms, native allocation and table
identity, full-row coverage, input pins, toy and translation inventories,
mutation stages/positive controls/timeouts, advisory identity and narrative
hash/content. Semantic tests explicitly update only their copied inner metadata
hashes so they exercise the intended guard; separate byte/hash controls exercise
the enclosing bindings. No binary row stream is parsed, rewritten or regenerated.

## Review, seal and exact invocation

`--describe-review` documents schema `chess-table-full-review-v1`. A fresh reviewer
must supply `status=passed`, `verdict=correct`, the exact claim, run/workflow/source
identities, source-manifest and artifact hashes, exact saved-evidence checker
hash, and a repository-relative durable narrative plus its exact SHA-256. Extra
advisory prose fields are allowed. The report must preserve
`review_kind=independent-model-advisory`, `human_approval=false`,
`formal_verification_by_reviewer=false`, and `local_heavy_computation=false`.

The coordinator separately creates `chess-table-full-seal-v1`, with
`status=accepted`, using the exact fields printed by `--describe-seal`. There is
no checker command to derive an accepted seal from a packet's own assertions.
The accepted review JSON and narrative must exist before the sealed replay.

Canonical planned positive/hostile invocation, fixed before execution:

```sh
python3 scripts/chess_table_full_20261022/check_saved_evidence.py \
  --root /Users/bocowgill/.codex/worktrees/6ba9/cryptids \
  --evidence docs/chess/campaign-2026-10-22/round-04/evidence/final \
  --seal docs/chess/campaign-2026-10-22/round-04/evidence/review/seal.json \
  --self-test
```

Require exit zero and `Table seed sealed evidence controls passed`. Record the
receipt and source/artifact hashes. For portability, copy only the identical
checker into a fresh temporary directory and invoke that copy with explicit
absolute `--root`, `--evidence` and `--seal` paths. Require exit zero and
`Table seed sealed evidence review passed`. The copied checker still binds all
computation files to the original repository and its own exact bytes to the
review and seal. Neither a source-only schema check nor a failed run can satisfy
this acceptance gate. Actual remote packet, advisory, seal, hostile replay and
copied-directory runtime evidence are pending at the time of this contract.
