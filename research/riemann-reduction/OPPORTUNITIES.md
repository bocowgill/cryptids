# Ranked optimization opportunities

Every saving below is a hypothesis about the **complete** physical machine.
No smaller candidate has been generated, tested or certified. Ranges are planning
estimates from the affected state pools, not achieved bounds or a probability of
success. Decoder costs need not track logical instruction counts.

| Rank | Concrete change to investigate | Plausible absolute net saving | Proof difficulty | Implementation effort |
| --- | --- | --- | --- | --- |
| 1 | Remove pass-through decoder 53 by shortening the affected control words | 1 if the exact one-state pilot closes; otherwise 0 | Medium/high: encoded returns are the obstruction | Tiny table edit; substantial encoding bridge |
| 2 | Share a decoder state under the complete typed-word language | 0-1 in a bounded pair family | Medium if words stay fixed; potentially impossible | Low candidate cost; moderate invariant work |
| 3 | Eliminate a whole register-program transfer or duplicate update | 0-4, very uncertain | High: new stage/register relation | High: logical and physical program changes |
| 4 | Reuse a temporary bank across non-overlapping phases | 0-4, before any staging cost | High: phase-dependent liveness and frames | High |
| 5 | Reorder/reverse operand-bank layout to share selection/return work | 0-3 | High for tape reversal; medium/high for a permutation | Medium/high |
| 6 | Share branch-return / padding / jump micro-routines | 0-2 | High: must retain branch and root-fence information | Medium |

Rank 1 is recommended for its small, explicit edit and decisive rejection gate,
not because an equivalence is known. Rank 2 is a cheap fallback, not an invitation
to start a broad search. Larger speculative ranges should not guide a search
score until an explicit complete machine realizes them.

## 1. Pass-through state 53 and control-word encoding

Literal rows include `40/ONE = 1R53` and `53 = (0R68, 1R68)`.
State 53 consumes a bit without branching on its value. A proposed shorter
encoding would omit that bit after the corresponding prefix and route directly
from 40/ONE to 68. Remove 53 and densely relabel to obtain 94 states **only if**
the same arithmetic program is realized from a blank tape. See `PILOT.md`.

Reusable mathematical contracts: `Control.step_encode`, `Control.instruction_words`,
`Control.decoded_next_word_schema`, `Control.decoded_next_noThree`,
`WidthSteps95`'s abstract half/unwind transitions, `Algorithm.residual_eq`, and
`Stage95.residual_criterion`. These concern the existing typed program/arithmetic.

New obligations: a full-tape encoding relation, not just a word-length change;
commutation with both `popBreakRev` branches and `popContinueRev`; preservation
of root sentinel, padding credit and extra registers; an exact new blank boot;
unbounded depth closure; terminal and halt correspondence; positive physical
progress; and both halting directions. Existing parser and physical theorems
mention the literal 95-state machine and cannot simply be reused at Fin 94.

## 2. Contextual decoder sharing

An explicit small family is {26, 46, 50, 86, 87, 94}. Each ZERO cell is `0R58`;
their ONE targets are respectively 33, 60, 64, 89, 94, 43. A two-state fusion
could choose either ONE target, redirect all incoming edges and remove one ID.
The six-member family has 15 unordered pairs and at most 30 such choices.
This is a proposed future family; none has been enumerated or run here.

Matching one column is insufficient. Each valid typed caller word, including
all recursion depths, must retain its native operation and continuation. Distinct
ONE targets likely distinguish several or all pairs. A shortest distinguishing
typed word is the desired failure record, rather than repeated random mutations.

Reusable specification: `Schema.ControlWord`, `Parser.actual_prefix`,
`Parser.actual_cycle`, `Parser.prefix_parse`, `Dispatch.nativeCorrect_all` and
`Dispatch.arithmeticPrefix_all`. New proof: parser equivalence on the full typed
language, an appropriate state/tape relation, exact boot and end-to-end halting.
There is no preexisting universal quotient theorem for this machine. Do not port
chess's Q/classMap certificate without first proving its hypotheses here.

## 3. Eliminate a logical transfer or duplicated update

Inspect `ReferenceLogical95.rows`'s paired `.firstSwap` / `.secondSwap` increments
and the seed/product/pre-width boundary. The supplied 95-state program already
retains x after FOLD and removes MoveXM. A second saving must identify a different
live value or a phase relation permitting an update to disappear. The paired
updates currently preserve two values; deleting either without an invariant is
unsound. A logical deletion may save zero decoder states after compilation.

Reusable contracts: `ReferenceLogical.specs`, `ReferenceLogicalSemantics.RegRel`,
`ReferenceBridge.original_scoped_move95`, `original_scoped_fold95`,
`original_scoped_product_step95`, `original_scoped_transform95`,
`original_prewidth_cut95` and `reference_prewidth_execution95`.
The pre-width output is explicitly
`[0,0,shuniaDeficit (M+2),0,M+1]` under word 88.

New obligations: an exact relation at every changed logical row, restoration at
the pre-width cut, the unchanged arithmetic criterion for every M, matching
physical decoder/returns and complete stage progress from M = 0. Proof of the
first stage cannot be replaced by checking a few small stage values.

## 4. Temporary-register reuse

At stage boundaries three temporary values are zero; inside PRODUCT/TRANSFORM/
WIDTH the five active banks have different live roles. Investigate sharing the
temporary v bank with a zero bank at a named cut, rather than assuming that
boundary zeros imply global deadness. A true four-bank implementation might
remove native leaf/selection costs, but extra save/restore controls can erase
the gain. No four-register algorithm or liveness proof was found in this audit.

Reusable contracts: `ReferencePermutation95`'s `encodeBank_getD`, `encodeBank_set`
and permutation step transport; `SwapBank95.apply_swapInstr`; the exact typed
pre-width result; `WidthSteps95` and `BoundedUnwind95` for width phases.
These are starting specifications, not a proof of a non-injective bank encoding.
New obligations include phase-indexed injectivity for live values, preservation
of both DEC outcomes, arbitrary extra-bank frames, all arithmetic cuts, and a
new physical selection/shift implementation with every bridge counted.

## 5. Tape layout

The current physical order is [x, v, f, m, j], from perm = [3,4,0,2,1] on old
indices. The existing permutation enabled the blank initializer; permutations
alone do not automatically change the number of five INC/five DEC leaves.
Investigate whether moving a frequently adjacent pair enables a shared selector,
or reversing the bank direction removes a return scan. Runtime frequency is not
the state-count objective.

Reusable specification: `ReferenceProgram.mapInstr`, `ReferencePermutation95`,
`Physical.rootCfg`, the `unary98_*` full-bank contracts, and
`PhysicalRaw.fenceReturn_exact` / its projected form. New obligations: unary
encoding boundaries, both tape directions, suffix shifts and appended zero bank,
complete boot, caller-word guards, dynamic padding and new transition fidelity.
A zero-cost abstract permutation is not a zero-cost physical tape rearrangement.

## 6. Returns, padding and local transition rewrites

The INC and positive-DEC return scan already share 8/9. Zero DEC needs 48/62 to
retain the alternate branch; padding pop uses 2/11. Scanner states 5/7/10 remember
zero streaks 0/1/2. Jump entries 19/25/43/59/64/69/71/73/74 have different rewrites
or destinations even when one cell agrees. Try a sharing only after naming the
input-window invariant and counting any replacement bounce/bridge states.

Reusable contracts: `ReturnRaw.run_return98`, `run_return98_after_one`,
`PhysicalRaw.fenceReturn_exact`, `Dispatch.arithmetic_dispatch_exact`,
`RootJump.root_jump` and `Dispatch.root_native`.
New obligations: bit-exact full-frame restoration, DEC branch discrimination,
NoThree guard at all callers and recursion depths, exhausted-root padding +1,
and halting equivalence under any variable-length stutter. Replacing state 2 by
11 loses the second-break distinction; fusing scanner streak states without a
stronger language invariant loses fence detection.

## Retired shortcuts and evidence limits

- Deducting three auxiliary labels is invalid: the physical baseline is already 95.
- Repeating the MoveXM removal is not a new opportunity; it is the accepted change.
- Fewer logical instructions, shorter runtime or fewer visited states is not the
  complete physical-state objective.
- State 41/ONE is unvisited by the retained bootstrap check. This finite fact
  neither proves global unreachability nor frees a physical state by itself.
- Merely redirecting around 53 on the old tape skips a symbol. Its new encoding
  and return closure are unproved; no halting claim is made for that redirect.
- No experimental candidate failed here because no optimization was executed.
  These are source-level exclusions and open obligations, not simulated failures.
