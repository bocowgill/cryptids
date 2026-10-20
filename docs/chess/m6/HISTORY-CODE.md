# Concrete full-history Code procedures

`Cryptids/Chess/Compilation/HistoryCode.lean` provides actual
`Turing.ToPartrec.Code` syntax in `Chess.Compilation.HistoryCode`. Its theorems
state exact `Code.eval` equalities. The implementation uses the checked scalar,
list, position-update, and raw-repetition interfaces; it does not introduce a
chess decision oracle or extract an executable witness from a computability
existence theorem.

## Concrete callee contract

`Callees` stores three actual `Code` values and their raw-position refinements:

- `legal`: `positionWords ++ plyWords` returns the singleton truth value of the
  frozen `IsLegalPly` predicate.
- `update`: the same input returns all 71 words of `Exec.applyPly`, including
  unchecked raw requests.
- `check`: `positionWords` returns the singleton truth value of `InCheck` for the
  side to move.

Position words are the unchanged `Data.encodePosition` format. `plyWords` is
`[sourceRankMajorIndex, destinationRankMajorIndex, promotionWord]`; `plyWords_eq`
identifies it with the independently checked `Updates.encodePly` format. Promotion
zero means none; the other six words are one plus the kind code, including king
and pawn requests. The final chess assembly must instantiate this record with
the actual legality, update, and check procedures and discharge all three
refinements. Quantifying over concrete callees here does not discharge that final
instantiation obligation.

## Candidate enumeration

`candidateIndex` and `candidate` are inverse over the complete 28,672-move scan.
Source squares are grouped by file and then rank, followed by destination in the
same order, with all seven promotion requests innermost. The positive play word
is `candidateIndex + 1`; zero is reserved for the separate draw-claim action.

`candidate_order` proves equality with the entire ordered `Exec.candidates` list,
using a generic product-index theorem. It establishes order, beyond membership
or permutation. `candidateContext_eval` and `candidateGameContext_eval` prove
that the generated 74-word callee contexts contain exactly the intended position
and raw move. The runtime loops use a binary-size literal count and one generic
loop body; construction does not bake a literal list of 28,672 moves into the
program.

## Repetition and full-history counting

`samePositionCode_eval` is exact for every pair of raw executable positions.
The comparison scans every board, turn, and castling-right word, ignoring only
the move clock and temporarily separating the en-passant field. Equal raw
en-passant targets take the established shortcut. Unequal targets are ignored
only when neither position admits a legal en-passant capture.

The en-passant scan combines the actual legality callee with the full checked
`Updates.enPassant` expression and its nonempty-source guard. It retains every
promotion request. This matters for raw positions whose en-passant target is on
the final rank: the frozen specification can admit a promoting en-passant move
there, despite such metadata being unreachable from standard play.

`occurrencesCode` is a decrementing `Code.fix` loop. Its state is the number of
remaining positions, an accumulated count, the complete target position, and
the remaining 71-word source blocks. Each iteration compares one complete source
block and retains the target unchanged. It visits the current position plus all
previous positions, preserving duplicates. `matches_card` proves that this
list count equals the frozen `Fintype.card` of matching history indices; no
cardinality computation is a runtime primitive. `repeatedCode_eval` then proves
the exact arbitrary-threshold repetition predicate.

## Claims, adjudication, and ordered actions

`canClaimCode_eval` proves the unchanged optional draw-claim condition. It checks
current threefold/fifty-move thresholds and enumerates legal intended moves,
using the complete updated game for the next-position thresholds. It does not
replace the current game when testing an intended move. The claim action remains
optional and distinct from every played move.

`automaticFlatCode_eval` implements exactly
`WithoutDead.automaticWithoutDead`: checkmate wins have priority; stalemate,
fivefold repetition, and the 150-halfmove clock impose draws. Only dead-position
termination is deferred, under the separate proved value-preservation theorem
in `WithoutDead`. This module does not assert equality with the original
automatic-result function at dead positions.

`actionsFlatCode_eval` proves the complete ordered legal-action list of that
evaluator. A descending counter inspects each raw candidate and conses retained
positive action words, yielding the frozen ascending candidate order. The optional
zero-valued claim is appended after played actions. Terminal games return the
empty encoded action list.

## Packed evaluator interfaces

`gameWord game = ListCode.stack (Data.encodeGame game)`. The following actual
procedures support the control machine:

| Procedure | Input | Output |
|---|---|---|
| `automaticCode` | `[gameWord game]` | `[0]` if live; `[1]` draw; `[2]` White win; `[3]` Black win |
| `actionsCode` | `[gameWord game]` | Singleton stack of the complete ordered action words |
| `playCode` | `[gameWord game, plyWord ply]` | `[gameWord (game.play ply)]` |
| `turnCode` | `[gameWord game]` | Singleton side-to-move word |

`playFlatCode_eval` proves the complete unchecked update and retained history.
`reverseStackCode`, `decodeStackCode`, and `encodeFramedCode` prove the scalar/list
adapters against their actual partial semantics. `encodeGameCode` computes the
exact frame length from the stored history count. It does not infer an arbitrary
unframed list length or remove any history.

The packed play-word arithmetic equals the control module's positive word
convention after natural-number addition normalization. Both game and action
word correspondences must be included in the final assembly proof.

## Verification and limits

The focused build is:

```
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Compilation.HistoryCode
```

Five exact modular-code fixtures cover ignored irrelevant en-passant metadata,
distinguishing a legal en-passant opportunity, raw last-rank en-passant promotion,
history multiplicity with clock-insensitive equality, and an intended-move-only
fifty-move claim. Their underlying rule facts are kernel checked, including
legal raw moves. The clock fixture transports the frozen update through the
proved executable update correspondence before reducing it. Two additional
kernel-decided sequential interpreter executions check empty scalar/list framing.

The transitive audit checks declaration types and values, permits only the three
standard mathematical axioms, and rejects the open chess conjecture, proof holes,
and unsafe/partial dependencies. Exact Lean-generated recursion artifacts are
inventoried only outside safe roots and remain forbidden during dependency
traversal. Proof-hole and recursion-artifact negative controls must fail.

These are correctness constructions. Large scalar stack words and basic
arithmetic can make execution extremely expensive. No practical execution-time
or state-count claim is made. Actual callee instantiation, complete control/backend
composition, exact emitted-table identity, blank initialization, and the final
strategic halting equivalence remain integration obligations outside this module.
