# M2: executable move rules and position updates

The public entry point is `Cryptids.Chess.Exec`, under namespace `Chess.Exec`.
The implementation branch is `codex/chess-executable-m2`, based on M1 commit
`1bb98ba36bd94a63ac203b4e4630e88b3eaf42c3`. The frozen M1 reference, archive,
manifest, checkers, toolchain, and dependency pins are unchanged.

## Domain and representation

`Exec.Board` is an eight-element `Vector` of eight-element vectors of optional
pieces. `Exec.Position` stores this board and the reference's turn, castling
rights, en-passant target, and natural-number halfmove clock. Coordinates,
pieces, and `Ply` reuse the reference's finite, executable data types. Added
constructive `Fintype` instances provide enumeration without changing those
types. The position type itself is not claimed finite: its clock is unbounded.

Every raw reference position is representable. The round trips, move-list
equivalence, and update refinements hold without assumptions about reachability,
unique kings, pawn ranks, or metadata provenance. No normalization silently
removes malformed boards or historical metadata.

The only representation invariant is the vectors' lengths, enforced by their
types. Encoding is initially correct and every update returns the same type.
`invariant_applyPly` transports any proved reference invariant through a legal
update. `reachable_applyPly` preserves the exact reference history contract when
given a reachable predecessor, matching decoding, and a legal **game action**.
It uses the existing reference constructor; it does not decide terminality.
The additional reachable-game consequences listed in M1's `DOMAIN.md` have not
all been proved here and are not premises of M2's unrestricted refinements.

## Checked public contracts

All names below have prefix `Chess.Exec`.

| Theorem | Checked conclusion |
| --- | --- |
| `decode_encodeBoard`, `encode_decodeBoard` | Both board round trips |
| `decode_encode`, `encode_decode` | Both full-position round trips |
| `decode_initial` | Initial encoding decodes to `Chess.initialPosition` |
| `represents_all` | Every raw reference position has a concrete representation |
| `isLegal_iff` | Executable Boolean agrees with `Chess.IsLegalPly` |
| `mem_legalPlies` | List membership iff reference legality, for every position and ply |
| `legalPlies_nodup` | No move occurs twice |
| `candidates_length` | The baseline enumerates 28,672 distinct raw requests |
| `decode_applyBoard` | Every square agrees with the reference board update |
| `decode_applyPly` | The full updated position equals the reference update |
| `applyPly_encode` | Encoding commutes with unchecked reference updates |
| `next_applyPly` | A legal executable update is a reference position transition |
| `invariant_applyPly`, `reachable_applyPly` | Invariant transport and exact history closure |
| `play?_eq_some` | Checked-update success iff raw legality and the specified successor |

`legalPlies` enumerates squares in file/rank order, then source/destination pairs,
then the seven optional promotion values. Filtering excludes forbidden promotion
requests. This is a correctness baseline, not a speed or state-count optimum.
The runtime decisions inspect finite data; they do not call classical choices.
Classical reasoning remains allowed inside erased proofs.

`applyPly` deliberately agrees with the reference even on illegal requests.
`play?` checks raw ply legality before updating. Neither API checks for a prior
automatic result, repetition, draw claims, or dead positions. Those belong to M3.
The abstract chess conjecture and its negation are never used as premises.

## Regression evidence and provenance

`scripts/RunChessM2.lean --rules` runs the rule assertions. They cover both
colors and both castling sides, king and rook movement, attack and obstruction
rejection, rook-home capture rights, clocks, en passant and expiry, pinned
en passant, every ordinary and capture promotion including underpromotion,
invalid promotion requests, check evasion, mate and stalemate layouts, and the
test-input adapter's initial orientation and bounds.

The hand-constructed rule positions follow Articles 3.7–3.9 and 5.1–5.2 of the
[FIDE Laws effective 1 January 2023](https://handbook.fide.com/chapter/E012023).
Their expectations are direct rule examples, separate from the implementation.
Mate/stalemate fixtures inspect check and an empty raw move list; no M3 outcome
adjudicator has been added.

`perft.json` records exact FENs and expected leaf counts transcribed from the
[published perft tables](https://www.chessprogramming.org/Perft_Results), checked
on 2026-10-19. It includes the initial position through depth three and six
additional layouts through depth two, counting the mirrored fourth position
separately. These counts exercise ordinary moves, castling, promotions, checks,
and en passant over multiple plies. They count paths, not distinct positions.
The [Stockfish test suite](https://github.com/official-stockfish/Stockfish/blob/master/tests/perft.sh)
also uses these standard positions, at larger depths. The original computation
for the sixth position is reported by
[Steven Edwards](https://www.talkchess.com/forum/viewtopic.php?t=49118).
The standard perft convention does not stop at history-dependent draws.

The FEN reader lives in `Cryptids.Chess.Fixtures`, not the verified runtime API.
It is a test adapter without a parser-correctness or reachable-state theorem.
Initial-position equality checks its orientation and all initial metadata.
Universal correctness comes from the refinement theorems, not bounded tests.

## Reproduction and trust

Use the unchanged pinned Lean `v4.35.0-rc4` and Lake dependencies:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Exec
env ELAN_NO_UPDATE_CHECK=1 lake env lean --run scripts/AuditChessM2.lean
python3 scripts/verify_chess_m2.py
python3 scripts/verify_chess_reference.py
env ELAN_NO_UPDATE_CHECK=1 lake build
```

The M2 verifier builds the executable modules and fixtures, checks the exact
public theorem types, and follows the types, values, constructors, and recursor
rules of every M2 declaration. It rejects unsafe/partial dependencies, the open
draw theorem, `sorryAx`, and axioms other than `propext`, `Classical.choice`, and
`Quot.sound`. A negative control adds `sorryAx` to the audit roots and must fail
for that specific reason. Source-scan controls also reject explicit proof
shortcuts. Fixtures execute in Lean with warnings treated as errors.

Successful observed results are written to `.lake/chess-m2-check/results.json`.
The durable acceptance record is `GATES.md` and `RESULTS.md`. CI runs both the M1
reference verifier and the M2 executable verifier. M3–M7 and outreach remain on
hold.
