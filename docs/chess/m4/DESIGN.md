# M4: total evaluation of the frozen chess game

M4 provides an executable evaluator and proves its strategic meaning. It does not run the
standard initial game to completion, assert its value, or produce a Turing machine.
The reference remains `chess-reference-v1`; M1–M3 source files and dependency pins are unchanged.

## Finite keys prove termination; full games determine value

`Adjudication.Key` contains the board, side to move, four castling rights, and raw en-passant
target. M3 proves this type finite. Neither the full position type nor the game/history type
is assumed finite. The clock and history remain unbounded data in the evaluator.

`keys` maps the full history, including the current position, to a list of keys. It preserves
multiplicities. `count_map_card` identifies a key's list count with the cardinality of its
matching historical indices. Equality of keys implies the frozen `SamePosition` relation;
therefore `key_count_le_occurrences` embeds those indices in the reference's repetition indices.
This implication is sufficient: inert en-passant targets can make keys different while the
reference still regards the positions as equivalent.

Let `N = Nat.card Adjudication.Key`. The proof-only capacity is

```
capacity(history) = sum over keys k of max(0, 4 - count(k, history))
rank(game) = 2 * capacity(keys(game)) + (1 if nonterminal, otherwise 0)
```

The capacity is at most `4*N`, and prepending a position never increases it. A nonterminal
current position has fewer than five occurrences of its raw key: five matching indices imply
a repetition draw unless it is checkmate, which is already terminal. Thus a played move into
another nonterminal game strictly decreases capacity. A move into a terminal game decreases
the terminal bit, even when its key was already saturated. `rank_play_lt` covers both cases.
It actually holds for every raw ply from a nonterminal input, so legal moves are a subset of
the transitions covered by this rank proof.

`LegalPrefix` counts played plies, including a final move into a terminal game. `prefix_rank`
proves `n + rank(finish) <= rank(start)`. Consequently `uniform_play_bound` gives at most
`8*N+1` played plies from any input history, and in particular from the standard initial game.
`uniform_claim_bound` also bounds a played prefix followed by a claim, counting the claim as
one action. Claims end immediately and do not create a fictitious next position. This is a
coarse bound; no numerical maximum-game-length claim or external chess literature is used.

The finite sum and key cardinality occur only in proofs and the erased termination measure.
Evaluation does not enumerate the key universe or replace the current full game with a key.

## Executable backward induction

`analyse : Adjudication.Game -> Outcome * Action` uses M3's exact `automatic` adjudicator.
At a terminal game it returns the automatic result and an unused placeholder action. Otherwise
it enumerates the complete `legalActions`, which M3 proves duplicate-free and exactly legal.
`finite_branching` explicitly establishes finiteness of the legal action set. Nonterminal
nonemptiness follows from M3's raw-game action-existence theorem.

For each legal action, a claim has value draw and a played move has the recursively evaluated
value of the full `game.play ply`. `choose` selects an actual candidate that maximizes the
current player's utility: own win is 2, draw is 1, opponent win is 0. It retains the earlier
candidate on a tie. `choose_ge`, `policy_legal`, `solve_policy`, and `optimal` prove membership,
attainment, and dominance over all legal alternatives. The public `solve` returns the outcome;
`policy` returns the selected action.

Recursion uses the proved natural rank. There is no fuel argument, cutoff, heuristic material
evaluation, or default draw on exhaustion. The terminal placeholder action is never used to
justify a legal strategy choice.

The exact dead-position decision and exhaustive move enumeration inherited from M2/M3 can
make evaluation extraordinarily expensive. Totality is a mathematical termination theorem,
not a practical claim that initial-position evaluation will finish on available hardware.
There is currently no memoization, pruning, or cost bound suitable for practical chess solving.

## Global strategies and all opponents

The encoding between the concrete full game and the frozen `Chess.Game` is lossless and
commutes with play (`encode_play`). `value` and `strategy` transport the concrete evaluator
and policy to the frozen types. `strategy_legal` proves the policy legal for either color on
all reachable nonterminal histories. In fact, pointwise policy legality holds on every raw
nonterminal game. It is not constructed only along a chosen trajectory.

`selected_legal` obtains the selected player's legal action for any globally legal pair.
`results_exist` uses well-founded induction on the same rank and preserves reference
reachability at each played move. `results_unique` proves determinism directly from the frozen
`ResultsIn` constructors, automatic-result uniqueness, and impossibility of actions after an
automatic result. `initial_result_unique` combines existence and uniqueness. No list of all
`Strategy := Game -> Action` functions is assumed finite or enumerated.

`UsesPolicy` states that a player's actions agree with the policy on all of that player's
histories. `policy_guarantee` proves that every derivable result gives a policy user at least
their evaluated utility. On their turn the selected action attains the value; on the opponent's
turn finite optimality bounds the chosen legal alternative. The two players' utilities sum
to 2. This supplies the opposing inequality and proves `optimal_pair_value` and
`optimal_pair_result`. Opponent global legality supplies result existence, rather than an
assumption about which line the opponent will choose.

`guarantee_iff_threshold` quantifies over every globally legal opponent. A policy witnesses the
forward guarantee from the computed value. Conversely, facing the opponent's globally legal
policy bounds what any proposed strategy can guarantee. At utility threshold 1 this yields

```
WhiteCanAvoidLoss <-> value(initial) != BlackWin
BlackCanAvoidLoss <-> value(initial) != WhiteWin
```

Threshold 2 characterizes forced victory. `CanForceWin color` spells out a globally legal
strategy with a winning `ResultsIn` outcome against every globally legal opponent. Results are
unique for each such pair, so this is forced victory, rather than existence of one favorable
line. The independent audit pins this predicate's expanded quantifiers for both colors.

The main public contracts are:

- `solve_initial_draw_iff`: `solve initial = draw` iff the conjunction of the two **unchanged
  frozen** avoid-loss predicates.
- `solve_initial_white_win_iff`: `solve initial = WhiteWin` iff `CanForceWin white`.
- `solve_initial_black_win_iff`: `solve initial = BlackWin` iff `CanForceWin black`.

These are characterizations of an unknown computed value. No proof assumes or derives the
open proposition `Chess.perfect_play_results_in_draw`.

## Runtime fixtures and trust checks

`RunChessM4.lean` executes terminal White/Black mates, stalemate, both colors choosing mate over
an available claim, action legality and value attainment, clock/repetition termination, and a
claim that improves a forced loss to a draw. The saving-claim fixture is White Ka1 versus
Black Kc2/Qb4 with White to move and halfmove clock 148. White's sole played move is Ka2;
Black can answer Qa4 mate ahead of the automatic clock draw. All played alternatives evaluate
to Black win, while claiming evaluates to draw and is selected. These are bounded, constructed
raw-position fixtures; they are not assertions that these histories arose from the standard
initial game. The FEN parser is the unchanged M2 testing adapter, outside the proof chain.

`AuditChessM4.lean` checks exact theorem types and traverses every safe M4 declaration's full
compiled type/value dependency closure, including opaque values and recursor rules. It permits
only `propext`, `Classical.choice`, and `Quot.sound`. Negative controls inject `sorryAx`, the
open conjecture, and each of the two M4 compiler recursion artifacts as mathematical roots;
all must be rejected. The source scan independently rejects proof shortcuts and user-written
unsafe/partial definitions.

As in M3, Lean's ordinary compiler emits separate partial implementations named
`analyse._unsafe_rec` and `choose._unsafe_rec` for safe recursive definitions. The audit
inventories exactly these two generated artifacts, checks their owner names, safety flags,
and exact types, and removes only these artifacts from the initial namespace inventory.
It **never exempts them during dependency traversal**. A safe mathematical declaration depending
on either artifact fails the audit. The safe `analyse` definition is justified by well-founded
recursion, and `choose` by structural list recursion. Running the executable additionally trusts
the usual Lean compiler/runtime; the kernel proofs do not depend on these compiler artifacts.
M3's corresponding compiler artifact remains governed by its unchanged audit.

`scripts/verify_chess_m4.py` checks stable source hashes, builds both the M4 aggregate and the
fixture adapter from a fresh checkout, runs the audit and controls, and executes all fixtures.
`--baseline` verifies every recorded M2/M3 input hash, performs the default build and frozen
source correspondence check, and reruns both prior regression suites. CI includes the focused
M4 verifier. Durable check output and exact input identities are in `results.json` and
`RESULTS.md`; the acceptance ledger is `GATES.md`.

M5 compilation/simulation, M6 explicit chess machine, M7 reductions, and outreach remain on hold.
A working Lean evaluator does not establish verified compilation to a binary Turing machine.
