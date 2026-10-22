# Independent advisory: complete structured-initializer chess candidate

Status: passed independent advisory for the exact completed remote packet below.
No unresolved finding remains. Coordinator acceptance, seal and hostile/portable
metadata replay remain separate responsibilities.
This is an independent model advisory, not human approval or a new formal
verification. No Lean, Lake, LSP, LeanProbe, native execution, generator,
simulation, fixture or machine-counting command was run locally by the reviewer.
Only source and saved metadata/hash inspection were used.

The proposed machine is `ConjectureMachines.Machines.chess_table_seed`, with
`ConjectureMachines.Semantics.ChessTableSeed.halts_iff_not_draw`. It preserves
`Halts M ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)` from entirely blank
binary tape. The reviewed allocation is 173,642 writer controls, 21,682 new
decoder controls, one new bridge, 216 retained expander controls, one retained
bridge, 533,341 interpreter main controls and 40,461 returns. The full candidate
is 769,344 states, a prospective 228,832 reduction from the accepted 998,176.
No component-only progress establishes a new accepted machine.

## Mathematical path and state accounting

The first source pass traced every new semantic link. `Format.W` is the original
`trList` natural-word encoding, including zero's terminating cons and its guarded
leading-zero recurrence. Fixed-width operand decoding is bounded by `Fin 8192`;
tags are `Fin 7`, excluding the all-ones phase separator. The packet reverses rows
and literals only to support physical prepend order. `ChessCodec.nodeToRow_letters`
preserves all original node tags/operands, `nodes_letters` preserves order, and
`letters_eq` proves equality to the accepted complete symbol input using the
existing topology, row and input certificates. This is not an encoder/decoder
agreement substituted for source fidelity.

`Controller.Control` is explicitly equivalent to `Fin 21682`; every typed
control maps to an allocated numeric state and back. The physical row definitions
use unit left/right moves and ordinary binary writes. `Transducer.Step` refers
directly to the allocated controller's read and emit destinations. Its source
path is a proof abstraction, not an unpaid runtime operation. `packet_run` covers
all three phases, all row operands, separators and cleanup, with no outstanding
path assumption. `Correct.step_reaches` and `path_reaches` lift that path through
actual paid block execution. `packet_reaches` then composes actual entry and
finish, proving the entire final tape and head equal to the exact old seed.

The second pass checked framing, halting reflection and hidden state costs.
`Blocks.ValidPath` checks both rows at each paid position; marker scanners retain
arbitrary exterior frames. Read, emit, entry and finish contracts include each
seek, read, write, scan and return. `finish_frame` erases the final marker and
normalizes blank tails rather than silently discarding nonblank storage.
`FieldTableSeed.decoder_reaches` instantiates the unconditional theorem and uses
both named bit-list identities and `ChessCodec.letters_eq`. `SeedLink` patches
only terminal success, pays a distinct bridge and restores the head through two
preserving transitions; the complete accepted inner expander/bridge/body remains
unchanged. Its existing proof reflects as well as preserves halting. The actual
reverse schedule, including its final turn, is charged through `actions.size` and
`initialise_states`; its proved blank-input behavior closes the public theorem.
The final cast and numeric row image have explicit equality proofs. No hidden
oracle, input parameter, source-path premise or free auxiliary state was found.

## Executable evidence and trust boundary

The third source pass reviewed the remote exporter, runner and negative checks.
`Export.lean` iterates every allocated actual state and both symbols, checks the
proved numeric image, and writes canonical six-byte transition records. The full
writer is executed on blank tape with a complete finite-frame/exterior check.
Fourteen bounded toy machines run the complete writer, both decoders and both
bridges into a one-state halting body; the native oracle independently forms
natural words arithmetically and checks intermediate seed and final complete
support/head/control. Full quadratic chess startup is deliberately not simulated;
its correctness is supplied by the universal proof and exact complete input.

The Python fixture checker independently reconstructs the packet and all rows
from pinned original source rows, original symbol/field input, independently
retained decoder/expander tables and the accepted original body table. It checks
all original input identities, all full rows, the paid writer, twenty executions
including translated toy starts, and corruption controls at their intended
rejection stages. A timeout is never a successful rejection. The runner requires
strict public builds, full safe foundation closure, three deliberate foundation
failures, five false kernel allocation/saving contracts, native and independent
checks and the prior M2–M7/terminal-binary regressions.

An independent read-only sub-review covered `fixtures.py`, `full.py`, `verify.py`,
`Audit.lean`, the workflow/lakefile and saved-evidence checker. It found the one
resource-accounting issue recorded below and no additional semantic,
state-accounting, circular-input or provenance defect. The parent reviewer also
read the complete checker: it binds exact current source and accepted pins,
archive/unpacked identities, direct successful workflow provenance, cumulative
and standalone command receipts, scope/count/fixture metadata, a separate
independent advisory and an external coordinator seal. It hashes the large row
stream as opaque bytes and does not claim local recounting. Saved official API
responses and the externally reviewed seal are explicit trust anchors; replay
does not independently authenticate GitHub. Hostile metadata tests first require
a genuine passing positive packet and remain in memory.

## Findings and disposition

1. **Resource receipt repair: resolved and remotely verified.** `fixtures.py`'s
   original reached-boundary helper executed five positive and five corrupted one-step
   transitions without incrementing `budget.steps` or checking the budget. Its
   `total_simulated_steps` therefore omitted ten steps despite the stated all-hostile
   execution budget. This does not alter the machine count or mathematical proof,
   but the exact resource receipt contract requires the increment/check and a new
   complete source-bound remote run. The fixture owner added `budget.steps += 1`
   and `budget.check()` before each boundary step. The fourth source pass inspected
   that exact repair and found it sufficient. The final source-bound remote run
   passed with the repaired fixture hash and a complete 555,567-step receipt.
   No actionable source issue remains.

## Exact final evidence reviewed

The reviewed official direct run is **39830779431**, completed successfully on
2026-10-22, with computation and workflow commit
`1c8334adb8fa63f9f8450b2d8ea08bb5f01eeb85`. It uses artifact **12447959670**,
`chess-table-full-full-1c8334adb8fa63f9f8450b2d8ea08bb5f01eeb85`, retained in
`docs/chess/campaign-2026-10-22/round-04/evidence/final/`. The earlier full run
39829682430 used the pre-repair fixture source and is not this advisory's basis.
The supporting strict public theorem run 39828692045 remains separately retained.

The reviewer checked the saved successful run/job/required-step/artifact identities,
archive hashes and sizes, member inventory/CRC/hash information, and exact unpacked
bytes. Every one of 57 current computation-source files and 2,983 frozen baseline
files matches the retained manifest; all 133 repository files reached by the
import-binding traversal are bound. The only producer change after the initial
source pass is the inspected boundary-budget repair. The saved-evidence checker
is separately reviewed and remains unchanged.

All twenty standalone command receipts agree with the five cumulative phase
receipts (1, 10, 11, 12 and 20 commands). Their output hashes, exact command
arguments, intended exit statuses, no-timeout flags and duration bounds match.
The strict public/executable build passed. The foundation audit inspected 10,773
roots and 60,793 dependencies, permitting only `propext`, `Classical.choice` and
`Quot.sound`. Its three intentional controls rejected the exact forbidden axiom,
open conjecture and proof-generator dependency. The five false count/saving
contracts failed because kernel `decide` established those propositions false,
not due to unrelated elaboration/import failures.

The native export passed in 35.349 seconds and retained all **1,538,688 actual
state/symbol rows**, including two missing transitions, in **9,232,128 bytes**.
The reviewer hashes this binary as opaque bytes and does not interpret or recount
it locally. The independent remote checker passed in 18.351 seconds with
477,348 KiB peak RSS, 555,567 simulated steps and a maximum single fixture of
46,005 steps. All allocations and static input identities agree: 5,952 source
rows, 141,380 symbols, 173,641 packet bits, 424,156 old-seed bits and 1,837,940
original field bits. The paid full writer takes 173,642 steps and reaches state
173,642 at physical head −173,640 with exact complete tape support.

Fourteen native complete startup cases and twenty independent executions passed,
including the specified translated starts. Their saved complete tape support,
head, state, step count and visited interval agree exactly. All 37 corruption
controls were rejected at their specified stages after positive controls, with
zero timeouts counted as rejections. Full quadratic chess startup remains
explicitly unexecuted, and the fixture report does not claim a universal proof.
The earlier rule/evaluation/compiler regressions also passed: M2 (164 assertions),
M3 (55), M4 (21), M5 (16), M6 (12 kernel assertions and three paired executions),
M7 (34 row corners and universal-input theorem) and terminal binary (30 corners,
singleton edge and all-input theorem).

In addition to the independent metadata/hash comparisons above, the reviewer ran
only the reviewed checker's unsealed source/command/scope metadata subchecks.
They passed. This did not create or simulate an acceptance seal and did not run
Lean, native code, fixtures, a model or a local state census.

Exact identity anchors:

- Source manifest SHA-256:
  `b4b358288e3c3c071329cb07060eda03f0756cf964f23568f41ab9e0681de605`.
- Artifact archive SHA-256:
  `b631558b531ff437ef4d8dae8d42f637166c4d3df5bca56c007145a242ed377b`.
- Logs archive SHA-256:
  `cb9742a6d172b41cf4e45059c6b3cd3906a056c15cd54318013fcc695bb885bf`.
- Complete row-stream SHA-256:
  `29989c45b9281c91f33349b23610a7e335a9e352f6647f10fedd61cb4497d086`.
- Repaired independent fixture source SHA-256:
  `b01b410778f53681b2071c946ad19abd76178b076de5cd36a698661cc9b9a42f`.
- Reviewed saved-evidence checker SHA-256:
  `86e414ccf7b9931fdccd1b8417fc2e5b27154c6faa5557b5dceb16b11e196a82`.

## Advisory verdict and limits

The reviewed source and exact successful remote packet support the complete
769,344-state machine and both directions of its original halting equivalence.
The independent advisory verdict is **correct**, with no unresolved finding.
This is an assessment of the retained formal and computational evidence, not a
new proof performed by the reviewer, human approval, a proof of optimality or a
determination of chess's game-theoretic value. Frozen sources were preserved.

The coordinator must still supply the separate acceptance seal and successfully
run positive/hostile saved-metadata replay and copied-directory portability before
promoting the candidate. This advisory supplies no seal and does not itself
change the accepted machine. Its exact narrative and checker hashes are bound in
`evidence/review/advisory.json`; later edits require renewed review and binding.
