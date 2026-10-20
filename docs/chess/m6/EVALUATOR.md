# First-order evaluator refinement

`Cryptids/Chess/Compilation/Evaluator.lean` provides an intermediate source bridge in
`Chess.Compilation.Evaluator`. It proves exact value agreement with unchanged M4 for
**every raw `Chess.Adjudication.Game`**, including arbitrary halfmove clocks and complete,
arbitrary previous-position lists. It does not assume initial-position reachability or
an answer to the chess draw conjecture.

The executed interface is:

- `better : Color → Outcome → Outcome → Outcome` compares M4's `utility`, retaining the
  first value on ties.
- `evaluate : Nat → Adjudication.Game → Option Outcome` returns `none` at fuel zero.
  With positive fuel it calls the actual `Adjudication.automatic`; an automatic result
  is returned immediately. A live game calls `evaluateActions` on the actual
  `Adjudication.legalActions` list.
- `evaluateActions : Nat → Adjudication.Game → List Action → Option Outcome` is a
  first-order recursive action-list fold. A draw claim contributes `.draw`; a played
  ply calls `evaluate` on the actual `Adjudication.Game.play`, retaining the entire
  history. Nonempty lists combine successful values using `better`; a failed child
  propagates `none`. The empty action list also returns `none`.

The mutual recursion decreases lexicographically by `(fuel, phase/list length)`.
The game evaluator consumes one fuel unit before processing actions. The action fold
uses the same remaining fuel for every sibling. Terminal games therefore require
positive fuel too. Draw is returned only as an actual automatic outcome, a draw claim,
or a maximizing child value; fuel exhaustion has no fallback outcome.

There are no action subtypes, higher-order choice parameters, strategy objects, erased
rank values, or key enumerations in these executed procedures. The mathematical helper
`foldValues` and the subtype use in `solve_foldValues` connect the new fold to M4's
`choose`; the evaluator does not call either helper or M4's `solve`.

The principal theorems are:

- `evaluate_correct fuel game`: if `Chess.Evaluation.rank game < fuel`, then
  `evaluate fuel game = some (Chess.Evaluation.solve game)`.
- `key_card_le`: `Nat.card Adjudication.Key ≤ keyBound`.
- `rank_lt_uniformFuel game`: the executable numerical bound exceeds the rank of
  every raw game.
- `evaluate_uniform game`: `evaluate uniformFuel game = some (Chess.Evaluation.solve game)`.

Here `keyBound = 13^64 * 2 * 16 * 65` and `uniformFuel = 8 * keyBound + 2`.
Each square is empty or holds one of twelve colored pieces. There are 64 squares,
two turns, four independent castling bits, and 65 raw en-passant options. The cardinal
proof injects keys into this product, then applies function/product cardinality laws.
It does not enumerate boards or keys. Combining this with M4's
`rank game ≤ 8 * Nat.card Key + 1` establishes the bound. `keyBound` and `uniformFuel`
are executable arithmetic definitions; `Nat.card`, `Fintype.ofFinite`, and M4's
noncomputable capacity/rank are used only in proof dependencies.

## Remaining actual Code obligations

This file contains no `Turing.ToPartrec.Code` program and no `Code.eval` refinement.
It proves a source-to-source bridge, not an M6 compiler theorem. The remaining work
must give concrete first-order code for the data codec, actual automatic adjudication
(including exact dead-position search), legal action enumeration, full-history move
updates, outcome comparison, and the evaluator's fuel/list control. That code must
reject malformed encodings as specified and prove exact `Code.eval` behavior on valid
encodings against these procedures. The numerical constant must have a construction
whose size scales with its binary representation, rather than its numeric magnitude.
The resulting program still needs the verified M5 backend, blank initializer, exact
published binary table identity, and final strategic-equivalence theorem.

Focused verification and the standard-axiom closure audit are recorded in
`.unlazy/chess-m6/leaf-1.3/`. No initial game tree was evaluated.
