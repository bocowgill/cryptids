# Independent broader OpenEvolve review

Final verdict: **correct**, with the accepted limits below. This is a
fresh-context advisory model review, not human approval. Formal authority is
the actual remote Lean build and dependency audit of the encoded theorem.
The reviewer ran only source reads, metadata/hash checks and saved-output
inspection locally; no local Lean, Lake, LSP, LeanProbe, model, native audit,
fixture or table computation was run.

## Accepted outcome and attribution

**The 24-request OpenEvolve search found zero certified state saving.** Its
best certified result is the original 392,046,821-state seed; the million-state
search objective was not met. There are 25 evaluations including that seed,
18 distinct raw proposals and six certified evaluations, all equal to the
forward-write/long-return seed. The model repeatedly used an incorrect long
return after reversed leftward writes, or malformed arguments. It never
proposed the correct final single right move. No selected-plan bridge was
invoked, and no model-produced plan was certified as the new machine.

**The separately engineered construction supplied before inference is
certified at 390,491,642 states, saving 1,555,179.** It is the ordinary binary
blank-state-zero machine `ConjectureMachines.Machines.chess_openevolve_wide`,
with the unchanged theorem
`Halts machine ↔ NOT(Chess.WhiteCanAvoidLoss AND Chess.BlackCanAvoidLoss)`.
This reduction must not be called an OpenEvolve-found or model-invented result.
The final public RESULTS.md, results.json, RESUME.md and ROADMAP.md make that
separation prominent and agree with the saved evidence.

## R1 — construction and final source fidelity

Verdict: **correct**. No fatal mathematical construction, count or statement
fidelity error was found. Initial source review was at `5058c59`; the final
review binds computation commit `5af346f454a32b403a0dfd085160431b8d9cca77`.

Writing the reversed finite input while moving left places the input to the
right of a blank scanned cell. One preserving move right gives exactly
`Tape.mk₁ bits`. This includes empty input and arbitrary zero padding. The
physical origin may translate; the encoded tape records the relative zipper.
The construction does not claim return to an absolute physical origin.

The generic schedule machine allocates one state per instruction, gives both
scanned symbols a defined prefix transition, and then offsets all unchanged
body states by the prefix count. Its row and simulation theorems preserve
successor configurations and missing transitions. The exact execution and
halting bridge include an empty generic schedule. The concrete initializer
uses 1,555,181 states and steps for the frozen 1,555,180-bit input and enters
body state zero at numeric state 1,555,181 with the exact input zipper.
The unchanged body has 388,936,461 states. Their sum is 390,491,642;
392,046,821 minus that sum is 1,555,179.

The post-R1 concrete proof repair explicitly identifies the blank initial
configuration before transporting execution. The mathematical machine and
target are unchanged. Symbolic count proofs keep the concrete million-bit
input abstract; they do not weaken the equality being checked. All 211 frozen
prior inputs still match their pinned hashes.

The typed AST parser treats proposal text as data; candidate Python and
candidate-supplied tactics are not executed. The independent 127 small-input
tape checks and cost comparison are rejection filters. Admission additionally
requires a universal Lean tape identity, a symbolic length theorem and its
checked specialization to the frozen input length. The cost-based choice of
one supplied proof identity is only a search heuristic; a wrong witness must
still fail the universal Lean check. No warning suppression was introduced.

The proof bank supplies only two universal identities and may reject valid
new algorithms as unproved. The correct but unsupported control actually fails
this bank. Certification is narrower than free proposal generation. There is
no unrestricted compiler/proof synthesis, optimality, advantage over enumeration
or scalability conclusion.

The earlier provenance qualification is resolved. Source flags now specify
that no explicit solution appears in the static system prompt and that later
feedback may expose supplied proof identities. The research/results documents
state the same limitation. The idea and reverse identity predate inference;
they are never attributed to the search model.

## R2 — actual source-bound remote evidence

Verdict: **correct / passed**. The independently replayed metadata checker is
`check_saved_evidence.py`; its detailed result is `final-evidence-receipt.json`.
This review authenticates the retained official API metadata against the saved
archive digests, exact extracted bytes and saved workflow logs. It did not
perform an additional live network authentication or rerun the mathematics.

Official run **39598997807** completed successfully on computation commit
`5af346f454a32b403a0dfd085160431b8d9cca77`. All 427 artifact entries match the
archive manifest and extracted bytes. Artifact SHA-256 is
`581026dac290c7ebb74d666ed7760f335027fb8eb99eacf0226ae517f59f1ec7`;
logs SHA-256 is
`513a221c803178a54919ce72990ec965771a5662a9c672623329a8c037cc8bb4`.
All five successful phase reports bind the same 16 current computation hashes
and 211 unchanged prior hashes. Their command/output records agree with the
retained command records and their output hashes. The official job steps and
saved workflow logs agree with the phase outcomes.

The strict semantic-machine build passed. The native trust audit checked
69 roots and 48,854 dependencies, permitting only `propext`, `Classical.choice`
and `Quot.sound`, with no generator roots or unsafe compiler artifacts promoted
into the safe roots. All three negative audit controls failed as intended:
`sorryAx`, the open chess conjecture and a proof generator dependency.
The actual unchanged M7 and completed-pilot proof regression commands passed.

The final workflow also passed 14 rejection controls: six syntax, four
semantic, one cost corruption, one correct-but-unproved plan, an actual Lean
subprocess timeout and a corrupted proof. Both positive schedules passed all
127 small inputs and their universal certificates before inference. These
finite checks are not promoted into a universal proof.

The real pinned OpenEvolve framework is commit
`59dfe764b5ab4478ac00214432fcac33bbe2bf4b`; the model is
Qwen2.5-Coder-1.5B-Instruct revision
`2e1fd397ee46e1388853d2af2c993145b0f1098a`. Raw prompts, generated token IDs,
proposals, evaluations, rejection diagnostics and all 24 checkpoints are
retained. Source and outputs support free token generation within the supplied
typed language, with no finite response trie. The actual run used 20,098 tokens
(19,562 input, 536 output), 535.109726708 seconds of framework elapsed time and
508.918332278 seconds of summed model generation time. No prompt was truncated;
the observed maxima were 955 input and 110 output tokens per request. There
were zero paid model API calls; runner billing was not measured.

The independent check also authenticated the earlier pilot's retained partial
failure and separate successful baseline-completion archive, including the
unchanged source maps and the saved M1–M5 regression success. The original
pilot timeout remains a failure. All seven retained failed wide attempts were
checked as failures, with no model-request evidence in their saved archives or
logs. Pending/failed work from the R1 cutoff was never credited as a completed
success. The final acceptance rests on the actual successful final run.

## Numeric manifest and remaining limits

The table-map JSON has SHA-256
`46f1848d2bb6e8f150786a84fbb4a6f2bb0c15a3c5448b89000dd8ab78d5ea93`.
It is a separately hashed descriptor over unchanged accepted body rows, not
an expanded table. Its prefix rows agree with the reversed array schedule and
the generic prefix-row theorem. Its body mapping reads the old row at
`s + 1555179` and subtracts that shift from destinations; the old/new prefix
sizes differ by exactly that amount. The generic body-row theorem, the accepted
row body and `rowMachine_eq` justify this description universally. Its source
recipe hash and all count arithmetic match. No expanded payload, full new table
stream or row sweep is claimed.

The encoded target is the frozen strategic non-draw proposition. This review
does not determine chess's value, establish state minimality, certify the full
machine's execution time or improve the model-search null result by wording.
Final root acceptance and remote-job cleanup remain separate root checks;
this review makes no claim that all repository jobs have stopped. No further
R1/R2 obligation remains at these bound bytes; later changes require a new
binding check.
