# Independent advisory review of the complete field compiler

Status: R1/R2 passed as independent model advisory review for official complete run
39722113405 at 270d3e6aeb7258e1c9871077cf3e8e4f7d9fc53d.
This is a model advisory, not formal verification by this reviewer or human approval.
No local Lean, Lake, LSP, LeanProbe, native compilation, machine execution, machine
simulation, or machine counting was performed. The portable checker reads saved
metadata and computes file/archive/output hashes only.

The target is the frozen complete chess runtime and source, an explicit binary
blank-tape machine below 390,491,642 states, and the unconditional equivalence
`Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`. In particular, the
review does not assume a chess value, termination, reachability, or validity of
bounded tests as a universal proof.

The candidate's closed type is `Machine 45065962 2`, named
`ConjectureMachines.Machines.chess_field_aware`. Its theorem is
`ConjectureMachines.Semantics.ChessFieldAware.halts_iff_not_draw`. The certified
allocation is 41,390,082 body controls plus 3,675,880 initializer controls. The
certified saving is 345,425,680 controls against the frozen complete baseline.
The final same-source strict kernel and native evidence verifies these identities
and the unchanged equivalence. The reviewer did not execute the machine locally.

## Constructive source pass

`Snapshot.source_program` compares every label with the actual
`SharedModel.machine`, rather than a separate surrogate semantics. Its two key
ingredients are `correct_lookup`, which propagates each literal leaf equality
through the whole balanced tree including fallback, and `rows_match`, which
retains every cached branch count and source leaf position under projection.
`program_source` is the extensional universal identity. The per-row proposal
generator is not used to infer a theorem merely from generation succeeding.
Each proposed equality and the tree identities still require kernel checking.
The review follows these structural interfaces and representative leaf proof
families; it does not substitute visual inspection of 4,042 generated proof terms
for the retained complete kernel check.

The first-order `Op` interface covers move, field write, field load, pure store
load, marker test, field absence test, store branch, store-dependent jump, and
halt. Its source meaning uses the exact five-value store codec. `lower_refines`
is quantified over the entire source tape, represented bit tape, store, and
operation. Its output includes the full next control, store, and tape. Reads
return the original tape; writes preserve all other fields and all other source
cells; moves shift thirteen bits in either direction. Marker and absence cases
are reduced against the actual source symbol. There is no per-source-label proof
obligation left outside the literal snapshot certificate.

`Codec.bitInput_rep` derives the representation from the actual finite list for
every integer source coordinate and every one of thirteen bits. The negative
coordinate case and beyond-list blank case are present. `input_rep` transports
this statement through the Bool/Fin-2 codec. Thus initial representation is not
an extra premise of the final theorem. `respects` gives a positive target step
for every running source boundary, and exact missing-step reflection for a
halted boundary. `halts_input` uses `tr_eval_dom` in both directions and is
quantified over every finite input. These properties rule out a one-way
simulation or a stuttering/divergence loophole.

`lower_size` is a universal bound over every `Op` and all finite table contents.
`Graph` allocates one 1,024-node block per label, represents its actual tree in
postorder, and makes every unused slot a literal halt node. Child descent is
proved, and `decode_node`/`machine_eq` identify the full getter interpretation
with every source syntax row. The getter's executable implementation avoids
materializing the huge vector, but the mathematical vector and its semantics
remain connected universally. No free dispatch block or omitted padding is
used in the accounting.

The native getter uses a proved compiler simplification from `nodeAt` to
`fastNodeAt`. For a unary syntax node, indices below the child's size recurse
without changing the child index; the only remaining valid index is the parent
root. For a branch, the sum of both child sizes is the root index. Smaller
indices split at the left size; the right subtree subtracts exactly that left
size, and its children are shifted back by the same amount. The two root child
indices and all unary embeddings match the original postorder definition.
Go and halt have one valid slot. `fastNodeAt_eq` is universal over syntax and
every valid local index. `nodeAt_csimp` states equality of the complete old and
new functions, in the compiler's old-to-fast direction. Both declarations are
explicit required foundation-audit roots. This improves native lookup without
changing the formal getter, any allocated slot, any row, or any count. The
final successful complete run includes the new same-source strict kernel/native pass.

The frozen `CompactPost` quotient retains every live node/store pair, merges
only halted stores, and swaps the live initial control with state zero. Its
step theorem preserves the exact command and tape and reflects stopping; its
input halting equivalence has no reachability premise. The frozen `Binary`
compiler pays one main and one bounce control per Post control. A write's
right/left bounce restores the head and preserves the neighboring cell; both
halting directions hold on the actual finite input. `FlatInit` pays one write
and one return control per bit, proves the complete blank-tape run and restored
head, and embeds all body transitions including absent ones.

`FieldAware.post_halts_input` composes `CompactPost.halts_input`,
`LazyGraph.halts_iff`, the universal getter identity, the field compiler's
`halts_input`, the snapshot identity, `SharedCertificate.runtime_eval_dom`, and
the frozen `Chess.Compilation.Tape.halts_iff`. The last theorem connects the
actual fixed runtime, actual source DAG, and literal standard initial game to
the original chess proposition. The new input is `TM2to1.trInit .main
Compilation.Input.stack`, and `Input.stack` is definitionally the original
`Tape.input`. The final blank-tape theorem then uses the complete binary and
initializer equivalences and a state-count cast. The original open conjecture
is not an accepted dependency of this chain.

`Numeric.binaryRows` uses arithmetic main/bounce ranges separately from the
sum-indexed binary compiler. `paidRows` separately uses write/restore/body
ranges. Universal equality theorems connect those functions to the frozen
compilers, including missing transitions and empty generic inputs.
`rowMachine_eq` composes the full dependent bundle and cast equalities. The
independent Python fixture recipe supplies further implementation evidence;
neither that recipe nor finite native samples are the universal theorem.

## Hostile source pass

I checked specifically for a changed chess statement, an assumed chess value,
an unproved source/input bridge, boundary-only tape assumptions, unpaid initial
data, free dispatch/return states, omitted padding, a nonempty-step omission,
one-way halting preservation, and finite testing presented as proof. None was
found in the reviewed composition. The intentionally shared halt control loses
the halted store only after there is no observable next transition, so this
does not invalidate the halting theorem.

The certified allocation pays every one of 4,139,008 graph slots at all five
stores, one shared halt control, both binary control blocks, and both initializer
blocks. The actual `body`, `generated`, cast `machine`, and independent
`rowMachine` are the definitions in the stated theorem. The larger thirteen-bit
input is charged as 1,837,940 bits; no subtraction of an isolated pilot from the
old eleven-bit body is involved.

The audit imports the actual named semantics module, requires the central
construction theorem names, and traverses both types and bodies plus inductive
and recursor dependencies. It rejects nonstandard axioms, the open chess
conjecture, unsafe/partial mathematical dependencies, and the proof-generator
namespaces. Its excluded compiler helpers are checked against their safe owner
and matching type. Expected negative audit controls and six kernel-false
contracts must fail for the intended reasons in the final packet. Command
timeouts are recorded explicitly after this review requested that evidence
schema repair; this alters evidence receipts, not machine semantics.

## Evidence boundary

The earlier run 39717490210 at 9eef8d9 compiled the actual complete theorem but
failed while building the exporter because of a missing `NeZero` constraint.
That is useful development evidence and is not a successful complete run.
All 29 development runs are retained and bound with their actual official
dispositions: 19 failures, nine successful component/profile runs, and one
cancellation. The final successful full run uses exactly the current 19-file
computation-source manifest and all 570 frozen pins. Later report/history
commits do not replace its computation commit.

The next full run, 39718195823 at 7002529, passed the complete kernel build,
semantics, coverage, machine, foundation audit, and negative contracts. Its
native exporter then exceeded the configured 900-second timeout without a
success token. It remains failed development evidence. The codec, graph, and
snapshot component rechecks on that same commit succeeded; they do not replace
the missing complete native/fixture/regression/count pass.

Run 39721552989 at 82c39c9 subsequently passed the new kernel and native checks,
including the full initializer and all 202,100 operation cases. A later accepted
regression launcher incorrectly requested `--run` for `SharedFixtures.lean`,
which contains a `#eval` block and no `main`. The unchanged assertions printed
their success before Lean rejected that launcher. This run is still failed
development evidence. The final verifier compiles this one fixture without
`--run`, so its `#eval` assertions execute normally; the other six regression
scripts define `main` and retain `--run`. Exit zero and the expected success
token remain mandatory for every regression.

The checker requires the full phase receipts, their exact argv/cwd/shell,
configured timeout, exit, output hash, and success markers. It also requires
official run/job/artifact identity and URLs, artifact size/hash, ZIP CRC and
entry hashes, identical unpacked bytes, the regenerated snapshot, the complete
saved allocation, 202,100 cases covering all 4,042 × 5 × 2 × 5 source cases,
native/row-machine samples, the entire actual paid initializer, all five native
mutations, foundation audit controls, six meaningful false-contract failures,
and the prior chess regressions. The checker runs no machines locally.

The exporter instrumentation added after the timeout prints flushed stage and
initializer progress without changing the machine or proofs. It now explicitly
samples the shared-halt main and bounce controls on both symbols. The fixture
oracle requires all four probes and saves their actual, row-machine, and
independent-recipe results plus `shared_halt_probes_verified`. The checker
requires that complete saved receipt, including absent main transitions and
the two preserving left-return transitions. A separate bounded profile target
is development diagnostics only; it cannot satisfy the complete full phase.
The native payload is `machine-export.json`; `machine.json` is reserved for the
machine-proof phase receipt. Keeping these paths distinct is required so native
export cannot overwrite the mandatory proof-phase evidence.

The final successful packet is retained under `docs/chess/field-full/evidence/current`.
It has 48 artifact entries and all eight successful phases. Its independent
fixtures report 202,100 source cases, 202,126 actual native rows (190,920 unique
state/symbol pairs), the complete 3,675,880-step actual paid initializer, and all
five intended mutations rejected. The movement-frame mutation is rejected for
head restoration at position 2 instead of 0; its rejection is not described as
a tape-corruption finding. Positive cases compare the complete sparse tape.

The portable metadata-only checker has validated the complete current packet,
all source bindings, all 29 historical packets, and all required command
contracts. Final sealed CLI/control/portability replay is recorded in review.json.
Root promotion, independent replay of the positive check and all six corruption
controls, copied-directory replay, and the prior accepted checker remain separate
root acceptance obligations. This advisory does not represent human approval.
