# M6 flat chess data

`Cryptids/Chess/Compilation/Encoding.lean` defines executable codecs in
`Chess.Compilation.Data`. It imports the frozen M3 history module and reuses
`Chess.Exec.Position` and `Chess.Adjudication.Game`; it changes no M1–M5 source.

## Position layout

`encodePosition : Exec.Position → List Nat` emits exactly 71 words. Indices are zero based.

| Index | Meaning | Valid values |
| --- | --- | --- |
| 0 | Side to move | White 0, black 1 |
| 1 | White kingside castling right | False 0, true 1 |
| 2 | White queenside castling right | False 0, true 1 |
| 3 | Black kingside castling right | False 0, true 1 |
| 4 | Black queenside castling right | False 0, true 1 |
| 5 | Raw en-passant target | None 0; square `1 + file + 8 * rank` |
| 6 | Halfmove clock | Any natural number |
| `7 + 8 * rank + file` | Board cell | Empty 0; piece `1 + 6 * color + kind` |

Files and ranks range from 0 through 7. Colors are white 0 and black 1. Piece kinds are
king 0, queen 1, rook 2, bishop 3, knight 4, pawn 5. Cell codes therefore range from 0
through 12; target codes range from 0 through 64. Rank is the outer board index, and file
varies fastest.

`decodePosition : List Nat → Option Exec.Position` reconstructs a concrete candidate,
then returns it only if its exact re-encoding equals the entire input list. Candidate helpers
`colorOfNat`, `cellOfNat`, `targetOfNat`, and `boardOfWords` intentionally have defaults for
invalid or missing data. Those helpers are **not validating decoders**. The enclosing equality
guard prevents the defaults from accepting malformed input. It rejects wrong metadata codes,
cells above 12, short input, and extra words. `ValidPositionWords` states all finite bounds and
the exact board length; `decodePosition_valid` and `decodePosition_invalid` prove the checks.

No chess legality is checked: missing kings, multiple kings, inconsistent rights, inert or
impossible en-passant targets, unreachable positions, and arbitrary clocks remain representable.

## Game layout

`encodeGame : Adjudication.Game → List Nat` emits the number of previous positions, then the
current 71-word position, then all previous 71-word positions in their original newest-first
order. Its length is `1 + 71 * (previous.length + 1)`. Equal positions remain distinct history
entries. There is no clipping, deduplication, repetition-key replacement, or clock normalization.

`decodeGame : List Nat → Option Adjudication.Game` uses `decodePositions` to consume exactly
the stated number of previous blocks and all remaining words. Each block passes
`decodePosition`. A final exact re-encoding guard certifies the whole game. The empty list,
wrong history count, incomplete blocks, malformed blocks, and trailing words are rejected.
`decodeGame_history_count`, `decodeGame_body_length`, and `decodeGame_wrong_length` make the
count and length obligations explicit.

## Kernel-checked guarantees

The primary round trips have no legality or reachability assumptions:

```lean
decode_encodePosition (p : Exec.Position) : decodePosition (encodePosition p) = some p
decode_encodeGame (g : Adjudication.Game) : decodeGame (encodeGame g) = some g
```

Successful decoding is canonical in both directions:

```lean
decodePosition_eq_some_iff words p :
  decodePosition words = some p ↔ encodePosition p = words
decodeGame_eq_some_iff words g :
  decodeGame words = some g ↔ encodeGame g = words
```

`encode_decodePosition` and `encode_decodeGame` expose the forward implications for rewriting.
`encodePosition_injective` and `encodeGame_injective` exclude raw-data collisions.
`encodePosition_length`, `encodePositions_length`, and `encodeGame_length` prove fixed-block sizes.
The board proof uses all 64 coordinates and exact quotient/remainder identities.

`initialPositionWords` is a literal list of all 71 initial words. `initialGameWords` prefixes
it with zero. `encode_initialPosition` and `encode_initialGame` establish equality to the
existing initial data by kernel reduction. Their lengths, and successful initial decoding,
are also proved. The initial board ranks are:

```text
3  5  4  2  1  4  5  3
6  6  6  6  6  6  6  6
0  0  0  0  0  0  0  0
0  0  0  0  0  0  0  0
0  0  0  0  0  0  0  0
0  0  0  0  0  0  0  0
12 12 12 12 12 12 12 12
9  11 10 8  7  10 11 9
```

The metadata prefix is `[0, 1, 1, 1, 1, 0, 0]`.

## Verification and integration boundary

The focused check is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Compilation.Encoding
```

Leaf evidence, malformed-data checks, declaration hashes, and the complete declaration axiom
report are in `.unlazy/chess-m6/leaf-1.1/`. No proof uses a custom axiom or a native computation
certificate. Runtime operations use explicit lists, vectors, arithmetic, finite matches,
structural recursion, and decidable natural-list equality.

This module supplies data and codec correctness only. Parent integration must still translate
these runtime procedures into actual `Turing.ToPartrec.Code`, prove `Code.eval` refinement,
connect the evaluator and M5 backend, initialize the exact literal data from blank tape, and
identify the published binary table. This leaf proves no such backend connection, chess game
value, or completed M6 result.
