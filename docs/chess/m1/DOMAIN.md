# Frozen reference domains and invariant contract

This contract fixes the domains to use with `Cryptids.Chess.Spec`. It adds no
hypothesis to the draw proposition and asserts no unproved invariant as a theorem.
The authoritative predicates below are compiled definitions in the reference.

## Exact domains

| Use | Exact domain / assumption |
| --- | --- |
| Raw move predicates and unchecked updates | Every `Chess.Position` and `Chess.Ply`; these are total mathematical definitions, not validators |
| Initial-game strategic proposition | Exactly the source's `WhiteCanAvoidLoss ∧ BlackCanAvoidLoss`, with its own `Game.initial`, `Reachable`, `IsLegalStrategy`, and `ResultsIn` definitions |
| A game described as a legal historical game | `Chess.Reachable game` |
| A position described as occurring in legal initial play | `∃ game : Chess.Game, Chess.Reachable game ∧ game.current = position` |
| A decision requiring a player to act | `Reachable game ∧ ¬ ∃ outcome, AutomaticOutcome game outcome`, with the side to move given by `game.current.turn` |
| A legal game continuation | `IsLegalAction game (.play ply)` and the successor `game.play ply`; reachable predecessors yield reachable successors by the source constructor |
| Dead-position reachability | Exactly `Relation.ReflTransGen Chess.Position.Next source target`; do not replace this with game-level reachability or a nonterminal restriction |

`Reachable` includes the current terminal endpoint. Do not require nonterminality
when stating a general reachable-game theorem. It excludes histories that moved
after an earlier automatic outcome. A successful claim ends a result derivation
without creating an additional game state.

The default M2 refinement goal is agreement on all representable raw positions.
If implementation later chooses a narrower domain, its theorem must display
that restriction and establish initial validity and transition closure. Neither
local board checks nor a FEN-shaped record may be substituted for `Reachable`.

## Precise invariant obligations for later proofs

These are desired consequences of the reachable-history condition, not additional
assumptions of the frozen target. They are listed precisely to avoid silently
weakening later statements. Formal proofs of their preservation belong with the
subsequent refinement/lemma work and are not claimed at this reference freeze.

For `p = game.current` and `Reachable game`:

1. **Unique kings:** for every `color`, `∃! square, p.board square = some ⟨color, .king⟩`.
2. **King safety:** `¬ InCheck p.board p.turn.other`. The player to move may be
   in check. Together with unique kings this prevents adjacent kings; state any
   separate adjacency lemma explicitly when needed.
3. **Pawn ranks:** for all `square` and `color`,
   `p.board square = some ⟨color, .pawn⟩ → square.rank ≠ 0 ∧ square.rank ≠ 7`.
4. **Retained castling rights:** for every `color` and `side`,
   `p.castlingRights.has color side = true` implies both
   `p.board (kingHome color) = some ⟨color, .king⟩` and
   `p.board (rookHome color side) = some ⟨color, .rook⟩`.
   Each of the four rights is monotone along legal histories: it can be lost,
   never regained. This is stronger than merely checking current castle moves.
5. **En-passant provenance:** if `p.enPassantTarget = some target`, the game is
   not initial and has a predecessor `before` and ply with
   `Reachable before`, `IsLegalAction before (.play ply)`, and
   `game = before.play ply`. That ply's source contains a pawn of
   `before.current.turn`, satisfies `IsPawnDoubleAdvance`, and
   `nextEnPassantTarget before.current ply = some target`.
   The exact target rank is 2 after White's double advance and 5 after Black's
   (internal zero-based coordinates). No legal capture availability is implied.
6. **History and counter coherence:** either `game = Game.initial`, or it is
   exactly `before.play ply` for a reachable predecessor and legal play action.
   Thus `game.previous = before.current :: before.previous`, its board metadata
   is `applyPly before.current ply`, and the clock is zero on a pawn move/capture
   and otherwise the previous clock plus one. The initial clock is zero.
   Do not use an independently supplied historical list as proof of this property.

The history decomposition in items 5–6 follows the shape of `Reachable`'s
constructors; the further pawn/metadata assertions and invariant preservation
still require proofs. None is installed as an axiom, implicit instance, or
precondition that changes the strategic proposition.

## Strategy and terminal contracts

`IsLegalStrategy color strategy` quantifies over **all** reachable, nonterminal
histories at that color's turn, including histories outside a chosen trajectory.
The opponent quantifiers in the avoid-loss propositions range over such globally
legal strategies. Future optimal strategies must be extended legally off path;
enumerating arbitrary functions `Game → Action` as a finite list is invalid.

Outcome consistency, legal-strategy existence, bounded play, result totality and
uniqueness, exact dead-position decidability, and the evaluator/strategy bridge
remain the M3–M4 proof obligations recorded by the audit. The reference freeze
certifies which definitions are being used, not these future theorems or the
English-rule specification's full formal fidelity.
