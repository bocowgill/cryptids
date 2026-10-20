# Concrete chess geometry

`Cryptids/Chess/Compilation/Geometry.lean` supplies actual scalar expression syntax for the
frozen specification's geometric predicates. The scalar compiler turns each expression into
an explicit `Turing.ToPartrec.Code`; the proof uses that compiler's exact partial semantics.
The reference, M2 rules, M3 adjudication and M4 evaluator are unchanged.

## Calling conventions

An environment is a list of natural numbers. A square's index is `file + 8 * rank`, with file
and rank in `0..7`. Board cells use the frozen M6 data encoding: zero is empty, and a piece has
code `1 + 6 * color + kind`. White is zero, Black is one; kinds are king, queen, rook, bishop,
knight, pawn numbered zero through five.

The `base` argument is itself a scalar expression. Its value is the offset of the first board
cell in the current environment. `BoardView base env board` states exact agreement at all 64
squares with an arbitrary reference board. `BoardView_encodePosition` proves this for every
raw executable position at literal offset seven. `BoardView_encodePosition_append` permits
trailing procedure arguments, including the update procedure's source/destination/promotion
words. No reachability, king-count, castling, en passant or clock invariant is required.

| Expression | Parameters after `base`, when present | Proven reference predicate |
| --- | --- | --- |
| `strictlyBetween` | `a b x` | `Chess.StrictlyBetween` |
| `onOpenSegment` | `src dst square` | `Chess.OnOpenSegment` |
| `pathClear` | `base src dst` | `Chess.PathClear` |
| `pawnAttacks` | `color src dst` | `Chess.PawnAttacks` |
| `pieceAttacks` | `base color kind src dst` | `Chess.PieceAttacks` |
| `isAttackedBy` | `base color square` | `Chess.IsAttackedBy` |
| `inCheck` | `base color` | `Chess.InCheck` |

The `eval_*` theorems state exact zero-or-one results, expressed as `truth predicate`.
Square and color arguments must evaluate to the encodings in the corresponding theorem.
`eval_pieceAttacks` additionally requires the piece-kind encoding. Malformed kinds return
zero; claims about malformed input words beyond the stated theorem hypotheses are not needed
for chess refinement.

## Bounded scans and compiler connection

`all count body` uses `Scalar.Expr.fold`. Its body sees `iterationIndex :: accumulator :: env`.
`eval_all` proves exact bounded universal quantification, and `any`/`eval_any` derive bounded
existential quantification by complement. A 64-square scan therefore retains one expression
body rather than enumerating 64 copies during program construction. Nested attack and king
scans compose the same proved primitive-recursion interface.

Original expressions lift under a scan with `.drop 2`. A board offset also increases by two:
`liftBoard 2 base`. `BoardView_lift` and `BoardView_lift_two` prove that these reads retain the
same raw board. This accounts for every fresh loop variable in nested scans.

The five `compile_*_eval` theorems for paths, pawn attacks, general piece attacks, attacks on a
square and check state equalities about actual `Code.eval`. For example:

```lean
(Scalar.compile (inCheck base color)).eval env = pure [truth (Chess.InCheck board c)]
```

The only executed operations are scalar constructors and their concrete compiler output.
`BoardView`, reference-board functions, propositions, `truth` in theorem conclusions, and
finite proof reasoning supply refinement evidence; they are not runtime oracles.

## Verification

The focused command passes with warnings treated as failures:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Compilation.Geometry
```

Eight fixture theorems compute the scalar program with `decide +kernel`: an unobstructed rook
check, an e4 blocker, multiple White kings, a missing White king, White and Black pawn board
boundaries, a knight attack and a rook index-wrap rejection. Four additional theorems transfer
the check fixtures through `Scalar.compile_eval` to actual `Code.eval` results. These are
kernel proofs of the finite fixture computations and compiler consequences; no interpreter
timing or full binary-machine execution result is claimed.

The leaf audit traverses all 131 declarations in this namespace and all 4,115 transitive
dependency declarations. It finds only `propext`, `Classical.choice` and `Quot.sound`, with no
unsafe or partial dependency and no recursion-artifact exemption. Negative controls reject
both `sorryAx` and the open chess-draw conjecture. Evidence is retained under
`.unlazy/chess-m6/leaf-1.8/`; the parent campaign performs the aggregate audit independently.

## Remaining integration

This leaf completes geometric attacks and check, including the frozen existential semantics
on raw boards with missing or multiple kings. M6 still needs movement and castling rules,
promotions, en passant, position updates, complete move generation, claims and repetition,
dead-position search, evaluator lowering, and the exact final binary table and strategic
halting theorem. Those procedures belong to other leaves or parent integration. This module
does not establish completion of M6 or a state count for the chess machine.
