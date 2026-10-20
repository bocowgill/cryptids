# Concrete evaluator control bridge

`Cryptids/Chess/Compilation/Control.lean` defines an independent continuation machine,
an injective register encoding, and an actual `Turing.ToPartrec.Code.fix` interpreter.
Its final theorem is conditional only on refinements for four supplied **actual Code
syntax trees**:

```lean
programCode_eval (procedures : Procedures) (correct : Correct procedures)
    (game : Chess.Adjudication.Game) :
  (programCode procedures).eval [gameWord game] =
    pure [Program.encodeOutcome (Chess.Evaluation.solve game)]
```

The quantifier covers every raw game, retaining arbitrary clocks and complete histories.
`programCode_value_iff` proves both directions between a returned outcome word and M4's
exact value. This is a complete modular control bridge. The four chess callees and the
packed initial-input adapter still require concrete instantiation; this module does not
claim a complete M6 program or published binary table.

## Source workstack and termination

A `Frame` retains its game, remaining actions, optional best outcome, and turn.
`State` has three modes: evaluate a game, process a frame's actions, or return an outcome.
`step` is a first-order transition over this explicit state:

- Evaluating a game calls `WithoutDead.automaticWithoutDead`. A terminal result enters
  return mode. A live game enters action mode using the actual deferred legal-action list.
- A claim adds a draw candidate. A played ply pushes the remaining frame and evaluates
  the full-history child game. A returning child merges its value into that frame.
- An empty action list returns its recorded best value. An invalid empty list with no
  recorded candidate repeats its state; it does not manufacture a draw or win.
- A return with an empty continuation stack emits the final outcome.

`Runs` is an independent inductive relation describing finite source execution.
`evaluate_runs` uses strong induction on `WithoutDead.rankNoDead`, generalized over every
suspended caller. An inner action-list induction handles siblings. The proof derives the
appropriate Bellman equation from the previously checked deferred evaluator and M4's
chooser, including the associativity needed for the left-to-right accumulator.
`initial_runs game` proves finite execution with M4's value for every raw game.

There is **no runtime fuel register or numerical rank bound** in the control program.
The rank and the temporary fuel used to establish the Bellman equation occur only in
proofs. No branch decides the initial value of chess while constructing the syntax tree.

## Exact data interfaces

`gameWord game = ListCode.stack (Data.encodeGame game)` encodes every game field.
The game-codec round trip and stack injectivity prove `gameWord_injective`.

Ply codes follow the frozen candidate order, which is file-major for each square and
has seven promotion requests in the innermost loop:

```text
squareWord square = 8 * square.file + square.rank
promotionWord none = 0
promotionWord (some kind) = 1 + Data.encodeKind kind
plyWord ply = 1 + 7 * (64 * squareWord ply.src + squareWord ply.dst)
                + promotionWord ply.promotion
```

`actionWord` reserves zero for a claim and uses the positive `plyWord` for a played ply.
`actionsWord` packs the mapped action list. Outcomes use the existing `Program` interface:
zero draw, one White win, two Black win. `bestWord` reserves zero for no candidate and
adds one to a present outcome code. It therefore also encodes the automatic result:
zero live, one draw, two White win, three Black win.

A frame is `stack [gameWord, actionsWord, bestWord, colorWord]`; a continuation stack is
the packed list of frame words. Seven registers encode each state:

| Index | Register |
|---|---|
| 0 | Phase: 0 evaluate, 1 actions, 2 return |
| 1 | Current game word |
| 2 | Remaining action stack |
| 3 | Optional best value word |
| 4 | Turn: 0 White, 1 Black |
| 5 | Returned outcome word |
| 6 | Continuation frame stack |

Unused registers are zero. `encodeState_injective` proves that complete source states,
including all pending games and full histories, have distinct encodings. The proof also
establishes injectivity of individual stack cells, lists, games, plies, actions, best
values, and frames. No zero-valued data word is mistaken for a list terminator.

## Actual callee contracts

`Procedures` contains four `Code` values, with these exact `Code.eval` contracts in
`Correct` for every raw game and ply:

| Field | Input | Singleton output |
|---|---|---|
| `automatic` | `[gameWord game]` | `bestWord (WithoutDead.automaticWithoutDead game)` |
| `actions` | `[gameWord game]` | `actionsWord (WithoutDead.legalActions game)` |
| `play` | `[gameWord game, plyWord ply]` | `gameWord (game.play ply)` |
| `turn` | `[gameWord game]` | `Data.encodeColor game.current.turn` |

The contract has no abstract function-oracle field and no assumed computability theorem.
It requires supplied finite syntax and explicit semantic equalities. No instance of this
whole-chess contract is constructed here. The independent root assembly must supply and
verify all four, including the deferred automatic guard, complete action enumeration,
optional claims, and all full-history move updates.

## Concrete transition and fixpoint proofs

`stackCode`, `unstackCode`, and the proven `improveCode` are actual syntax over the existing
numeric/list basis. The finite bodies `evalMode`, `actionsMode`, `claimMode`, `playMode`,
`returnMode`, and `resumeMode` implement the register protocol with explicit pack/unpack
calls. `stepCode` emits `0 :: [outcomeWord]` on a final return and `1 :: nextRegisters` on
every continuation. `stepCode_eval` proves exact list equality against `encodeStep (step
state)` for every encoded source state.

`loopCode = Code.fix stepCode`. `Runs.eval_eq` uses the actual `PFun.fix_stop` and
`PFun.fix_fwd_eq` semantics through the checked ListCode lemmas. `loop_complete` uses
`PFun.fixInduction` to reconstruct a finite source derivation from every terminating
concrete execution on an encoded state. `runs_iff_eval` packages both directions.
`loop_initial_eval`, followed by the concrete seven-register `initCode`, proves the
entry program theorem above.

`initCode` expects a singleton **packed** game input. The existing `Program.initialData`
produces flat game words, so a concrete packing adapter with its own `Code.eval` proof
must be composed before this entry point. Root integration still must connect the final
chess program to the verified M5 backend, genuine blank initializer, exact published
binary table, and unconditional strategic-equivalence theorem.

## Cost and verification

The syntax contains no astronomical fuel literal and no unrolling by game-tree size.
The simple ListCode representation can nevertheless produce enormous runtime integers:
packing a game word inside a frame uses that already large natural as an exponent.
This is a finite correctness construction; it makes no practical time, memory, or state
count claim. The evaluator is never run on the initial game tree during construction
or verification.

The focused `--wfail` build and the transitive declaration audit pass. The audit checks
both types and values, rejects proof holes, nonstandard axioms, unsafe/partial dependencies,
and the open chess conjecture, and exercises known-failing negative controls. Validated
Lean-generated recursion artifacts for `stackCode` and `unstackCode` are inventoried
outside the safe root set; dependency traversal still rejects any unsafe dependency.
The small stack fixtures prove exact Code semantics for packed zero words, tuple
unpacking, both players' best-value updates, return/pop/resume, claim and play plumbing,
the invalid empty-fold continuation, and entry-register initialization. Dummy fixture
syntax tests plumbing only and does not instantiate the chess callee contract.

Evidence lives in `.unlazy/chess-m6/leaf-1.12/`. M7 remains unstarted.
