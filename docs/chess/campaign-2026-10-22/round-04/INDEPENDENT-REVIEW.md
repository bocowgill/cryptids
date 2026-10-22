# Independent advisory: complete structured-initializer chess candidate

Status: four source review passes complete; full evidence review and advisory JSON pending.
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

1. **Resource receipt repair: source fixed; remote validation pending.** `fixtures.py`'s
   original reached-boundary helper executed five positive and five corrupted one-step
   transitions without incrementing `budget.steps` or checking the budget. Its
   `total_simulated_steps` therefore omitted ten steps despite the stated all-hostile
   execution budget. This does not alter the machine count or mathematical proof,
   but the exact resource receipt contract requires the increment/check and a new
   complete source-bound remote run. The fixture owner added `budget.steps += 1`
   and `budget.check()` before each boundary step. The fourth source pass inspected
   that exact repair and found it sufficient; genuine final remote evidence is
   still required. No other actionable source issue remains.

## Remaining evidence obligations

The completed strict public theorem run 39828692045 at
`e40aeef1e377910e1f86fd31c717c18b1729458c` is retained as `machine-proof-final`.
It is supporting proof evidence, not a substitute for the complete acceptance
packet. The initial full run 39829682430 uses pre-repair fixture bytes and cannot
serve as the final accepted packet after the finding above is fixed.

A final advisory will be written only after inspecting genuine completed remote
full evidence for the exact repaired source, matching all accepted pins, all
command outputs and hashes, complete actual rows, independent fixtures,
corruptions and regressions. The narrative and checker hashes must be frozen in
that advisory. The coordinator must subsequently supply its separate seal and
perform positive/hostile saved-metadata replay plus copied-directory portability.
Those obligations remain open. No accepted state count is changed by this report.
