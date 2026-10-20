# Concrete full-ply legality

`Cryptids/Chess/Compilation/Legality.lean` supplies actual `Turing.ToPartrec.Code` in namespace
`Chess.Compilation.Legality`. Its complete theorem is

```
code_refines (position : Exec.Position) (ply : Ply) :
  code.eval (Updates.context position ply) =
    pure [Geometry.truth (IsLegalPly (Exec.decode position) ply)]
```

`truth P` is one when `P` holds and zero otherwise. There is no validation, legality,
reachability, unique-king, or existence-of-a-king premise. `Exec.Position` is the raw typed
position representation: arbitrary boards, turn, castling rights, en-passant target, and natural
halfmove clock. The theorem concerns every such position and every typed `Ply`, encoded by the
74-word `Updates.context`. It makes no claim about malformed word lists outside that interface.

## Runtime program

The scalar `pseudoLegal` expression reads the actual source piece, requires its color to match
the original turn, rejects source equal to destination, and checks destination occupancy,
promotion, and the corresponding piece movement. Its short-circuit conjunction returns false
for an empty source before using the source color/kind fields.

`checkedAfter` first runs the independently verified complete unchecked `Updates.code`, then
runs the `Geometry.inCheck` scan on its new board. The checked color is one minus the updated
turn word, which equals the original mover. `code` returns zero immediately for pseudo-illegal
requests; otherwise it negates this final check result. Every procedure is concrete syntax built
from `Scalar.compile`, the verified arithmetic/branch combinators, and `Code.comp`. No executable
reference predicate, legality oracle, or compiler existence witness is used as an instruction.

## Predicate refinements

| Theorem | Frozen behavior covered |
| --- | --- |
| `eval_validPromotion` | Promotion exactly when a pawn reaches its color's last rank; only queen, rook, bishop, or knight allowed. |
| `eval_destinationAllowed` | Empty destination or an opponent non-king piece. |
| `eval_pawnAdvance` | Single empty forward square, for the actual source-piece color. |
| `eval_pawnCapture` | Diagonal pawn geometry and an opponent non-king victim. |
| `eval_castle` | One side's complete frozen castling conjunction. |
| `eval_castling` | Existential choice of kingside or queenside. |
| `eval_pieceMovement` | All six piece kinds, with the frozen movement/attack distinction retained. |
| `eval_pseudoLegal` | All pseudo-legality conjuncts, unconditionally on raw positions. |
| `checkedAfter_refines` | Frozen `InCheck` on the exact updated board, for the original mover. |
| `code_refines` | Full unconditional `IsLegalPly` decision as an exact singleton `Code.eval` result. |

Supporting theorems prove turn/opposite-turn and last-rank values, encoded king/rook home and
destination/transit indices, and the dynamic castling-right lookup. `CastleCondition` names the
side-specific frozen conjunction solely for proof composition; its decision is never inserted
into the runtime code. Source-occupancy hypotheses on intermediate piece-specific lemmas are
discharged by the actual raw board case split in `eval_pseudoLegal`.

Pawn double advances and en passant use the already verified `Updates.eval_doubleAdvance` and
`Updates.eval_enPassant`, including path clearance, actual source color, raw target metadata,
empty destination, and an opponent pawn at the captured square. Sliders retain the frozen
`PieceMovement` predicate's lack of a local unequal-square test; the global pseudo-legality
test supplies that condition. King adjacency and castling remain separate alternatives.

Castling checks the actual turn's king and rook, their home squares, the selected right, the full
king-to-rook open path, and absence of attacks at source and transit. Queenside path clearance
therefore includes the b-file square. Destination king safety is supplied by the complete final
updated-board scan, as in the frozen specification.

The final scan retains the raw existential `InCheck` semantics: an absent own king makes that
predicate false, and any attacked same-color king makes it true when several exist. No normalized
or single-king board model is substituted.

## Verification and evidence

The focused `lake --wfail build Cryptids.Chess.Compilation.Legality` passes without warnings.
All 19 theorem closures were inspected; only `propext`, `Classical.choice`, and `Quot.sound`
occur. LSP verification of `code_refines` and the side-specific castling theorem reports standard
trust, no nonstandard axioms, and no suspicious source patterns.

`.unlazy/chess-m6/leaf-1.13/Fixtures.lean` contains 32 runtime comparisons of a proved executable
scalar composite against the independently executable frozen `Exec.isLegal`. Its `code_result`
theorem connects that composite to exact actual `Code.eval` for every raw context. All expected
values and reference comparisons pass. The suite covers missing/multiple kings, check evasion,
pinned exposure, destination occupancy, promotions of both colors, en-passant metadata/victim
and self-check, and every stage of castling rejection. Closed empty-source and missing-king
compiled equations are also kernel checked. A direct mathlib `stepNormal`/`stepRet` execution
returns `some [0]` for empty-source rejection.

Build and fixture logs, exact axiom queries, source-verification output, a four-pass review
ledger, and SHA-256 hashes are retained in the same evidence directory. The original runtime
formula definitions required no correction; this leaf completed their proofs.

This completes the concrete move-validation callee. History/adjudication/control instantiation,
the whole chess program, its final machine table, and M6's integration gates remain separate work.
