# Value-preserving deferral of dead-position termination

`Cryptids/Chess/Compilation/WithoutDead.lean` proves a source evaluator in
`Chess.Compilation.WithoutDead` has the unchanged M4 value for **every raw executable
game**, with arbitrary clocks and full previous-position lists:

```lean
evaluate_uniform (game : Chess.Adjudication.Game) :
  evaluate uniformFuel game = some (Chess.Evaluation.solve game)
```

This theorem defers one termination test. It neither changes the frozen rules nor
assumes the initial value of chess. It is a source-to-source refinement, not an actual
`Turing.ToPartrec.Code` or binary-machine compilation theorem.

## Executed control

`automaticWithoutDead` tests checkmate first, followed by stalemate, fivefold repetition,
and the 150-halfmove automatic draw threshold. Its definition never tests deadness or
calls the finite dead-position search. `legalActions` uses this procedure's own live
gate, then the unchanged `Exec.legalPlies` and `Adjudication.canClaimDraw`. It retains
optional claims and uses the actual full-history `Adjudication.Game.play` for moves.

`evaluate` and `evaluateActions` are first-order mutual recursion over natural fuel
and ordinary action lists. Zero game fuel returns `none`, including at terminal games.
A played child with exhausted fuel causes `none` to propagate through its action list.
Claims contribute draw; successful siblings are combined using the same player utility
as M4. No exhausted branch defaults to draw, even when another branch is a valid claim.
The runtime never calls M4's `solve`, proof-only ranks, or a key-space enumeration.

At a nondead raw game, `automatic_eq_of_not_dead` and `legalActions_eq_of_not_dead`
prove exact equality with the original procedures. At a dead game, the deferred live
gate may permit additional moves after the original automatic draw. These are raw legal
plies, not an assertion that frozen `IsLegalAction` permits moves after an original
terminal result. Every added played branch retains deadness, and every added claim
has draw value.

## Why the extension preserves the value

`dead_closed` proves deadness is hereditary along any raw legal-ply path, by composition
of the reference's reachability relation. `dead_play` transfers that fact through the
executable move representation. Deadness excludes checkmate at every continuation;
`dead_not_win` therefore rules out either automatic win in the deferred procedure.

The proof uses a fresh terminal bit in `rankNoDead`, rather than reusing the old rank:

```text
rankNoDead game = 2 * Evaluation.capacity (Evaluation.keys game)
                 + if automaticWithoutDead game = none then 1 else 0
```

The fifth-occurrence condition implies a live game's current raw key occurs fewer than
five times. The unchanged capacity lemmas then prove `rankNoDead_play_lt` for every
played child of a live game. `rankNoDead_le` gives the bound
`8 * Nat.card Adjudication.Key + 1`. These rank/cardinality operations are proof-only;
`uniformFuel` is the executable arithmetic constant from the exact source evaluator:
`8 * (13^64 * 2 * 16 * 65) + 2`.

Fuel induction proves `evaluate_dead`: every sufficiently fuelled evaluation from a dead
game returns draw. At terminal nodes, checkmate is excluded. At live nodes, the action
list is nonempty; each legal played child is still dead and has smaller rank, and each
claim returns draw. `evaluateActions_draw` proves the whole list folds to draw.

A second fuel induction proves `evaluate_correct`. At dead inputs, both the deferred
evaluator and unchanged M4 return draw. At nondead inputs, automatic outcomes and
legal-action lists agree exactly, and the recursive children agree by induction.
The previously verified value-fold/chooser bridge identifies the result with M4's value.
`rankNoDead_lt_uniformFuel` discharges the fuel premise uniformly, yielding
`evaluate_uniform`. `dead_evaluate_not_win` explicitly excludes either winner from
an adequately fuelled dead input.

## Verification and remaining obligations

The leaf evidence contains the focused `--wfail` build, a standard-axiom closure audit
of every new declaration, forbidden-mechanism scan, and distinguishing executable
fixtures. A raw position containing only a white king is dead but has three legal raw
moves: the old guard immediately returns draw, while the deferred guard is live.
One fuel unit exhausts; two reach a stalemate draw. Separate fixtures exercise optional
claims, threefold/fivefold history, checkmate priority at clock 150, and stalemate.
Negative controls reject immediate dead draw and a draw fallback on insufficient fuel.
These finite fixtures support the implementation; the all-game claim rests on the Lean
proofs. No initial game tree was evaluated.

The theorem permits a subsequent compiler refinement to target this evaluator without
implementing dead-position graph search. Actual concrete Code procedures and `Code.eval`
refinement for all remaining rules, full-history operations, optional claims, outcome
comparison, and fuel/list control are still required. So are the verified M5 backend,
blank initializer, exact published binary table, and final strategic-equivalence proof.
This file alone does not discharge M6 and does not begin M7.
