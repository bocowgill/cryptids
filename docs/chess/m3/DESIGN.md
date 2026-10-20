# M3 design and exact contracts

M3 follows the finite-graph route already specified in `ROADMAP.md`. It introduces
no alternate game and needs no game-value preservation exception. The reference
remains `chess-reference-v1`. M2's files and tested input versions remain fixed.

## Exact dead positions

The reference defines `Chess.IsDeadPosition p` by **all** finite legal-ply paths
from `p`, including the zero-length path. It forbids any reachable checkmate. It
does not stop those paths at 50/75-move draws, repetition draws, or other automatic
game outcomes. Consequently a position currently checkmated is not dead, while a
stalemate is dead. This differs from deciding whether mate can be forced.

The compiled construction under namespace `Chess.Adjudication` is:

1. `Key` retains the complete board, turn, all castling rights, and raw en-passant
   target. `project` removes only the halfmove clock. `Key.position` restores an
   arbitrary clock. The key type is finite: squares and optional pieces are
   finite, as are the remaining fields. The `Finite Key` instance proves this by
   injection into a product of finite types. Board equality inspects every square.
2. `legal_position` and `checkmate_position` prove that every restored clock
   gives exactly the original legal plies and checkmate predicate.
   `project_applyPly` proves that projecting a successor also ignores that clock.
3. `project_edge` and `lift_edge` preserve individual move edges in both
   directions. `project_path` projects any reference path. `lift_path` lifts a
   projected path from **any** original clock to an actual reference path with
   the same projected endpoint. Clock changes are carried by reference updates;
   no artificial clock bound is imposed on the lifted path.
4. `successors` enumerates M2's legal plies and projects their actual successors.
   `mem_successors` proves exact correspondence to `Key.Next`.
5. `FiniteSearch.search` grows a finite set of discovered vertices. If a target
   is present, it returns true. Otherwise it adds every successor. A closed set
   without a target returns false. Each recursive call strictly increases the
   discovered set, so `Nat.card α - seen.card` decreases. Finiteness appears only
   in the termination proof: runtime code does not enumerate all possible keys.
6. The search returns a Boolean paired with its correctness proof.
   `expand_preserves` proves that expansion preserves target reachability.
   `closed_contains` proves that every path from a closed set remains in it.
   Together they justify both answers. `reachableTarget_iff` exposes the exact
   directed-reachability contract, without a caller-supplied fuel bound.
7. `canReachMate_iff` connects the search to checkmate in the projected graph.
   `dead_iff_no_projected_mate` transfers the result to the original graph using
   both path directions and checkmate preservation. `isDead_iff` then proves
   exact Boolean correspondence to `Chess.IsDeadPosition` for every executable
   raw position. A computable `Decidable` instance follows for the raw predicate.

No material test, sampled path, depth cutoff, unproved witness, or game-level
draw shortcut replaces this search. Its worst-case runtime and memory are
astronomical. Running it on the initial position is not an acceptance check.
The executed chess examples are an actual stalemate, current mate, and mate
reachable in one ply. An intentionally unreachable raw lone-king layout exercises
the automatic dead-draw branch despite having raw legal moves; it is not presented
as a valid chess position. A separate small directed cycle tests search saturation.
There is no claim that bare-kings or arbitrary practical endgames were exhausted.

## Full history and repetition

`Adjudication.Game` retains the current M2 position and the complete prior list,
newest first. `decode_encodeGame` and `encode_decodeGame` prove both round trips.
`decode_play` proves exact history extension, including every position field.
The projected key is used for dead-position search, not to compress this history.

The `samePosition` Boolean implements the reference's `Chess.SamePosition`.
It compares board, turn, rights, and **legal en-passant possibilities**, rather
than equating raw en-passant targets. Identical projected keys are a proved fast
case; the general decision checks the reference predicate by finite enumeration.
`samePosition_iff` holds for every pair of raw executable positions.

`occurrences` counts the subtype of matching indices into `game.positions`.
It therefore counts identical positions at different historical times separately.
`repeated_iff_occurrences` proves that the reference's injective map from `Fin n`
exists exactly when `n` is at most this count. The proof constructs an embedding
into matching indices in one direction and extracts the injective index map in
the other. This includes `n = 0` and thresholds larger than the history.

`canClaimThreefold_iff`, `canClaimFiftyMove_iff`, and `canClaimDraw_iff` cover
current claims and existential claims based on an intended **legal** raw move.
The intended move is inspected without extending the actual game. Claiming is
still a separate optional action. No history is discarded.

## Automatic outcomes and actions

`automatic` checks mate first. In its absence it checks stalemate, fifth
occurrence, 150 halfmoves, and exact deadness. This order can avoid the expensive
dead search when another draw already decides the result; it does not truncate
the internal dead-position graph. `automatic_some_iff` identifies exactly the
reference's `AutomaticOutcome` relation, and `automatic_none_iff` identifies its
absence. Claim eligibility alone never produces an automatic result.

`automatic_unique` proves uniqueness for every raw game. The critical conflict
is excluded by `dead_not_checkmate`, which uses the zero-length path in the dead
predicate. Stalemate contradicts mate's check condition, while the two automatic
threshold constructors already require absence of mate. Multiple draw reasons
all give the same outcome.

`legalActions` is empty after an automatic result. Otherwise it includes every
M2 legal ply and one draw-claim action exactly when eligible. `mem_legalActions`
proves soundness and completeness, and `legalActions_nodup` excludes duplicates.
`no_action_after_automatic` proves the semantic terminal-action exclusion.
`nonterminal_has_action` proves existence even on raw games: if there were no
legal ply, check or its negation would give mate or stalemate, contradicting
nonterminality. Thus the required reachable-game statement is a special case.

These results do not prove existence of globally legal strategies, bounded game
length, result totality for strategy pairs, minimax correctness, or the target
halting equivalence. Those remain later milestones.

## Regression and trust boundaries

`scripts/RunChessM3.lean` uses M2's unchanged FEN test adapter and explicit legal
raw-ply sequences. Fixtures check Articles 9.2, 9.3, and 9.6 of the fixed
[2023 FIDE Laws](https://handbook.fide.com/chapter/E012023), along with mate and
stalemate layouts. The intended-move repetition fixture performs seven plies of
two knight cycles, then verifies the prospective eighth ply creates the third
occurrence. Four complete cycles reach a fifth occurrence. Other fixtures cover
rights, turn, clocks, inert/available/pinned en passant, pawn/capture resets,
optional claims, and simultaneous mate/repetition/75-move thresholds.

The fixtures test encoded examples, not a universal theorem of FIDE fidelity.
Universal claims come from Lean refinement against the frozen reference. The
audit checks exact public theorem types and all safe M3 declarations' transitive
types, values, constructors, and recursor rules. It rejects unsafe or partial
dependencies, `sorryAx`, the open chess conjecture, and every axiom except
`propext`, `Classical.choice`, and `Quot.sound`. Forbidden dependencies have
explicit negative controls. Classical reasoning is confined to erased proofs.

Lean generates `FiniteSearch.search._unsafe_rec` as a compiled implementation
of the safe well-founded search. This is the compiler's normal recursion
mechanism, documented in the pinned Lean sources
[`PreDefinition/Basic.lean`](https://github.com/leanprover/lean4/blob/v4.35.0-rc4/src/Lean/Elab/PreDefinition/Basic.lean)
and [`LCNF/ToDecl.lean`](https://github.com/leanprover/lean4/blob/v4.35.0-rc4/src/Lean/Compiler/LCNF/ToDecl.lean).
The audit separately inventories exactly that generated artifact, checks its
name, type, and safe owner's metadata, and requires that it never occur in the
safe mathematical dependency closure. An extra negative control places it in
the proof roots and must fail. User-written unchecked recursion, explicit
compiler replacements, and native proof shortcuts are rejected by source scans.
As with M2, execution relies on Lean's compiler/runtime; M3 does not claim a
formal verification of that compiler or its generated native code.
