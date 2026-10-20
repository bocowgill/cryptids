# Finite branching games on the stack backend

`Cryptids/Compilation/Games.lean`, namespace `Chess.Compilation`, implements a genuine
runtime interpreter for every finite binary game tree. `Tree.leaf` contains a
`Chess.Outcome`; `Tree.choice` contains a controlling `Chess.Color` and two subtrees.
White maximizes and Black minimizes the ordered score `0 = Black win`, `1 = draw`,
`2 = White win`. `value` returns the score and `minimax` returns the corresponding
outcome. These are specifications used in the correctness proofs. The evaluator
does not call either definition.

## Data and finite control

The source is Mathlib's actual `Turing.TM2`, with these finite types:

| Component | Type | Meaning |
| --- | --- | --- |
| Stack index | `Bool` | `false` is input data, `true` is evaluated values |
| Input alphabet | `Fin 5` | Tokens `0`, `1`, `2`, `3`, `4` |
| Value alphabet | `Fin 3` | Scores `0`, `1`, `2` |
| Store | `Fin 6` | Scores/opcodes `0`–`4`; missing input sentinel `5` |
| Labels | `Fin 8` | Exactly eight labels for every tree |
| Memory | `List (GameGamma k)` | Each stack has no fixed length bound |

`serialize` produces postfix data. A leaf emits its score. A White choice emits
the left subtree, the right subtree, then `3`; a Black choice uses `4`. For example,
`[2, 1, 4]` evaluates two leaves and lets Black select the draw.

| Label | Statement behavior |
| --- | --- |
| `0` | Push the reversed serialized word onto the initially empty input stack, then jump to `1` |
| `1` | Pop a token, record it in the store, and dispatch to a literal/reduction/end label |
| `2` | Push the recorded leaf score onto the value stack, then jump to `1` |
| `3` | Pop two scores, push their maximum, then jump to `1` |
| `4` | Pop two scores, push their minimum, then jump to `1` |
| `5` | Require exactly one value; halt for `0` or `2`, loop for `1` |
| `6` | Jump to the loop; unreachable from initialized valid input |
| `7` | Jump to `7` forever |

The tree occurs only in label `0` as literal data initialization. The theorem
`gameProgram_control_independent` proves that every nonzero-label statement is
identical for all trees. The program does not compile a constant halting answer,
compute minimax during compilation, or allocate a control label per subtree.
`gameProgram_supports` proves support by the complete `Fin 8` label set. Initializer
statement length grows with the serialized data; the eight-label count does not
claim constant compiled binary state count.

The store holds at most a token or one popped score. The second operand is read
while the first is still in this finite store. Neither complete trees nor lists
are hidden in local variables. The value stack contains all outstanding subtree
results. `unbounded_live_value_stack n` constructs a finite game whose actual
initialized execution reaches `n + 1` live scores, for every natural number `n`.

## Initialization and exact stack invariant

`TM2.init false []` has label `0`, store `0`, and both stacks empty, as proved by
`init_empty`. The recursive `pushData` constructs only finite literal push
statements. `stepAux_pushData` proves its exact effect on arbitrary existing data
and value stacks. `step_init` specializes this to initialization:

```lean
TM2.step (gameProgram tree) (TM2.init false []) =
  some (dispatch (serialize tree) [] 0)
```

Mathlib treats a finite straight-line TM2 statement body as one TM2 step. Its
lowering executes that body through the supported lower-level instructions; the
initial data is not supplied as an assumed prewritten TM2 input.

`serialize_stack_effect programTree tree rest values v` proves that the actual
TM2 program reaches

```lean
dispatch rest (value tree :: values) (saved (value tree))
```

from `dispatch (serialize tree ++ rest) values v`. Both the remaining input word
and prior values are arbitrary. The proof is structural induction on the data
tree, composed from the exact TM2 leaf and binary-operation step equations.
`runTokens_serialize` proves the corresponding residual computation equation.

`WellFormed result cfg` describes each evaluation control point: dispatchers have
a successful residual postfix computation; literal states store an actual score;
reduction states have two actual operands and the correct residual computation;
the exit state has exactly one result; the draw loop or terminal state has the
same correct score and empty stacks. `WellFormed.step` proves preservation under
every actual TM2 transition. `reachable_wellFormed` proves that every configuration
reachable from empty-stack initialization is the initial configuration itself or
satisfies this invariant with `result = value tree`. This covers intermediate
states, rather than only the final result.

## Malformed input and halting

`readScore` maps a missing operand to sentinel `5`. Each reduction checks both
operands before pushing a score. Operand underflow enters label `7`, as proved by
`step_reduce_empty`, `step_reduce_singleton`, and the dispatcher underflow lemmas.
At end of input the wrapper pops the result and peeks for surplus values. Empty
and surplus final stacks enter the loop, proved by `step_finish_empty` and
`step_finish_surplus`. Thus modulo conversion in `storedScore` is used only on
actual scores in well-formed reachable executions.

For arbitrary postfix data, `runTokens` is the total mathematical stack-operation
specification, returning `none` on underflow. `dispatch_halts_iff` proves the full
raw-data characterization:

```lean
(StateTransition.eval (TM2.step (gameProgram tree))
  (dispatch tokens values v)).Dom ↔
  ∃ result, runTokens tokens values = some [result] ∧ result ≠ 1
```

Consequently no underflowing word, missing final result, or surplus final result
qualifies as a successful computation. Token values outside the five-symbol
alphabet cannot be supplied by the typed source language.

`reaches_result` proves that initialization and evaluation reach the wrapper's
result configuration. A win has label `none`, with no further TM2 step. A draw
has label `7`, which returns to exactly the same configuration. The general
`selfLoop_reaches` theorem proves that every finite prefix of this loop still ends
at that configuration; `selfLoop_not_halts` then rules out terminal evaluation.
This is unbounded nonhalting, independent of any simulation fuel limit.

The main checked contracts are:

```lean
gameProgram_halts_iff tree :
  (TM2.eval (gameProgram tree) false []).Dom ↔ value tree ≠ 1

gameProgram_halts_iff_nonDraw tree :
  (TM2.eval (gameProgram tree) false []).Dom ↔ minimax tree ≠ .draw
```

Both directions follow from equality of deterministic evaluations along the
proved initialization/evaluation path and the explicit final-state dichotomy.
There is no assumed memory availability beyond the source model's unbounded
finite lists and no assumed halting oracle.

## Checked fixtures

| Fixture | Serialized tokens | Minimax score | TM2 behavior |
| --- | --- | --- | --- |
| `whiteWin` | `[0, 2, 3]` | `2` | Halts |
| `blackWin` | `[2, 0, 4]` | `0` | Halts |
| `drawGame` | `[0, 1, 3]` | `1` | Diverges |
| `favorableLine` | `[2, 1, 4, 0, 3]` | `1` | Diverges |

In `favorableLine`, White chooses between a Black-controlled branch and an
immediate Black win. The Black-controlled branch contains a White-win leaf and
a draw leaf. Black selects the draw. `favorableLine_has_white_win` proves that a
favorable White-win line exists; `favorableLine_not_forced_white_win` proves that
White cannot force that outcome. The fixture therefore checks genuine adversarial
branching, rather than existence of a favorable terminal path.

All fixture values, serializations, and halting/nonhalting statements are checked
by Lean. The source-level result is ready for the generic stack and binary
compilers and the separate binary blank-tape initializer. This module concerns
finite abstract games; chess move legality, infinite play, M6/M7, and the open
chess draw theorem are outside this M5 module.

## Verification

The focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Games
```

The leaf evidence directory `.unlazy/chess-m5/leaf-1.3/` records the direct gate,
all-declaration axiom audit (including generated recursion and matching helpers),
source fingerprints, and four-pass review. Runtime definitions are total,
executable Lean definitions. Only the standard mathematical axioms `propext`,
`Classical.choice`, and `Quot.sound` are permitted by that audit.
