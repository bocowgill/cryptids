# M6 compiled unchecked position update

`Cryptids/Chess/Compilation/Updates.lean` supplies an actual `Turing.ToPartrec.Code` procedure
in namespace `Chess.Compilation.Updates`. It uses the frozen M2 unchecked update as its
specification and the frozen M6 data-codec interface as its representation.

## Public entry points

```lean
encodePly : Chess.Ply → List Nat
context : Chess.Exec.Position → Chess.Ply → List Nat
expressions : List ConjectureMachines.Compilation.Scalar.Expr
code : Turing.ToPartrec.Code

code_refines (position : Chess.Exec.Position) (ply : Chess.Ply) :
  code.eval (context position ply) =
    pure (Chess.Compilation.Data.encodePosition (Chess.Exec.applyPly position ply))
```

The theorem has no legality, reachability, turn-agreement, king-count, promotion-validity,
clock-bound, or castling-right hypothesis. `expressions_refine` proves the corresponding
source-expression equality. `expressions_length` proves there are exactly 71 output words.

The context has exactly 74 words: the existing 71-word position followed by
`[src.file + 8 * src.rank, dst.file + 8 * dst.rank, promotion]`. Promotion is zero for none,
or `1 + Data.encodeKind kind` for every requested kind, including king and pawn. Thus source,
destination and promotion occupy input indices 71, 72 and 73. Position fields 0–6 and board
cells 7–70 retain the frozen encoding.

## Concrete construction

`code` is `NatCode.tuple (expressions.map Scalar.compile)`. It is built from explicit scalar
syntax for arithmetic, comparisons, conditional branches, reads and bounded recursion.
`Scalar.compile_eval` proves actual `Code.eval` semantics for each constructor;
`compile_tuple_eval` collects the ordered scalar results. There is no opaque rule oracle,
noncomputable runtime operation, assumed recursive-function realization, or call to a Lean
interpreter embedded as a machine primitive.

The seven metadata formulas precede 64 literal-indexed cell formulas. Every board read uses
the context's explicit base offset seven. `context_board_view` connects those reads to the
raw frozen board. `Geometry.pathClear` contributes one bounded 64-cell scan to the double
pawn advance test; `Geometry.pawnAttacks` supplies the ordinary pawn geometry. The module
reuses those exact source procedures and their semantic theorems.

## Exact unchecked behavior

| Formula | Frozen behavior retained |
| --- | --- |
| Turn | Flips the stored turn independently of source contents or moving-piece color. |
| Rights | Empty source preserves all rights. Otherwise a moving king, a moving home rook, and a captured home rook remove rights according to their actual colors. |
| Target | A pawn double advance with empty destination and clear path sets the intermediate target. Every other request clears the target. |
| Clock | Pawn moves and captures reset to zero; all other requests increment the arbitrary natural clock. An occupied destination counts as capture even when the source is empty. |
| Destination cell | Takes priority over source clearing, including source equals destination. Every requested promotion changes the moving piece to that requested kind. |
| Other cells | Castling-shaped king moves create the rook and clear its home square without validation. Otherwise an exact raw en-passant capture clears its captured pawn square; unaffected cells retain their old contents. |

For example, an unchecked e1–g1 king request can create the white rook at f1 without any
rook at h1. A source-equals-destination request with promotion retains the promoted piece.
An empty-source request aimed at an occupied rook square preserves the board and castling
rights while resetting the clock. A blocked double pawn request still changes the board but
does not create an en-passant target. These cases follow the frozen update order.

## Proof map

- `context_position_read`, `context_ply_read`, `context_board_view`: exact environment layout.
- `source_kind`, `source_color`, `eval_kind_eq`, `eval_color_eq`: finite piece-code meanings.
- `eval_enPassant`, `eval_doubleAdvance`: exact raw pawn predicates.
- `eval_castleShape`, `eval_movedCell`, `eval_rookSource`, `eval_rookDestination`, `eval_cell`:
  all unchecked board effects, with arbitrary queried output square.
- `removeRookRightAt_has`, `afterMove_has`, `nextCastlingRights_has`, `eval_rightRemoval`,
  `eval_right`: all four castling-right outputs, including empty-source capture exceptions.
- `eval_resetClock`, `eval_clock`, `eval_turn`, `eval_target`: the remaining metadata.
- `eval_board_cells`, `expressions_refine`, `compile_tuple_eval`, `code_refines`: complete
  rank-major output assembly and actual partial-function refinement.

## Verification and boundary

The focused target is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Compilation.Updates
```

Evidence in `.unlazy/chess-m6/leaf-1.10/` includes the successful focused build, kernel-checked
fixtures, every named declaration's axiom report, source hashes, and the four-pass ledger.
Fixtures cover castling without a rook, source/destination overlap, unchecked king and pawn
promotions, en passant with wrong turn, clear and blocked double advances, empty-source
capture behavior, clock 149→150, and captured-rook color attribution.

This module proves complete one-position updates. Legality, history extension, dead-position
search, full game evaluation, the M5 stack/binary compilation, blank-tape initialization and
published table identity remain separate integration obligations. No chess game value or
full M6 completion follows from this leaf alone.
