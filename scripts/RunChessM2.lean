/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Fixtures

open Chess Chess.Exec Chess.Fixtures

private def position (fen : String) : IO Exec.Position :=
  match position? fen with
  | some p => pure p
  | none => throw <| IO.userError s!"Invalid fixture FEN: {fen}"

private def square (name : String) : IO Square :=
  match square? name with
  | some s => pure s
  | none => throw <| IO.userError s!"Invalid fixture square: {name}"

private def move (src dst : String) (promotion : Option PieceKind := none) : IO Ply := do
  return ⟨← square src, ← square dst, promotion⟩

private def check (count : IO.Ref Nat) (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Chess rule fixture failed: {label}"
  count.modify (· + 1)

private def rules : IO Unit := do
  let count ← IO.mkRef 0
  let test := check count
  let start ← position "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"
  test "FEN initial orientation and all metadata" (start == initial)
  test "square lower bound rejected" ((square? "A1").isNone)
  test "square upper bound rejected" ((square? "i9").isNone)
  test "malformed rank rejected" ((position? "9/8/8/8/8/8/8/8 w - - 0 1").isNone)
  test "short board rejected" ((position? "8/8 w - - 0 1").isNone)
  test "zero fullmove rejected" ((position? "8/8/8/8/8/8/8/8 w - - 0 0").isNone)
  test "initial moves duplicate free" (decide (legalPlies start).Nodup)
  let castles := "r3k2r/8/8/8/8/8/8/R3K2R"
  for color in [Color.white, .black] do
    let active := if color == .white then "w" else "b"
    let p ← position s!"{castles} {active} KQkq - 12 1"
    for side in [CastleSide.kingside, .queenside] do
      let m : Ply := ⟨kingHome color, castleKingDestination color side, none⟩
      test "castling legal, both colors and sides" (isLegal p m)
      let next := Exec.applyPly p m
      let board := decodeBoard next.board
      test "castling clears king origin" (board (kingHome color) == none)
      test "castling clears rook origin" (board (rookHome color side) == none)
      test "castling king destination" (board m.dst == some ⟨color, .king⟩)
      test "castling rook destination"
        (board (castleRookDestination color side) == some ⟨color, .rook⟩)
      test "castling changes turn" (next.turn == color.other)
      test "castling increments clock" (next.halfmoveClock == 13)
      test "castling clears en passant" (next.enPassantTarget == none)
      test "castling loses both own rights"
        (!(next.castlingRights.has color .kingside) && !(next.castlingRights.has color .queenside))
      test "castling preserves opponent rights"
        (next.castlingRights.has color.other .kingside &&
          next.castlingRights.has color.other .queenside)
      let home := rookHome color side
      let rookMove : Ply := ⟨home, ⟨home.file, if color == .white then 1 else 6⟩, none⟩
      test "rook move legal" (isLegal p rookMove)
      let rookNext := Exec.applyPly p rookMove
      test "rook move removes own home-square right" (!(rookNext.castlingRights.has color side))
      let other := if side == .kingside then CastleSide.queenside else .kingside
      test "rook move preserves other own right" (rookNext.castlingRights.has color other)
      test "rook move preserves opponent right" (rookNext.castlingRights.has color.other side)
      let capture : Ply := ⟨home, rookHome color.other side, none⟩
      test "rook home capture legal" (isLegal p capture)
      let captured := Exec.applyPly p capture
      test "rook capture removes both affected rights"
        (!(captured.castlingRights.has color side) &&
          !(captured.castlingRights.has color.other side))
      test "rook capture resets clock" (captured.halfmoveClock == 0)
  for (fen, src, dst) in
      [("4kr2/8/8/8/8/8/8/R3K2R w KQ - 0 1", "e1", "g1"),
       ("r3k2r/8/8/8/8/8/8/4KR2 b kq - 0 1", "e8", "g8"),
       ("k3r3/8/8/8/8/8/8/R3K2R w KQ - 0 1", "e1", "c1"),
       ("4k1r1/8/8/8/8/8/8/R3K2R w KQ - 0 1", "e1", "g1"),
       ("4k3/8/8/8/8/8/8/4K3 w K - 0 1", "e1", "g1"),
       ("4k3/8/8/8/8/8/8/RN2K2R w Q - 0 1", "e1", "c1")] do
    test "castling forbidden by attack, missing rook, or obstruction"
      (!(isLegal (← position fen) (← move src dst)))
  for (fen, src, dst, capturedSquare) in
      [("4k3/8/8/3pP3/8/8/8/4K3 w - d6 17 1", "e5", "d6", "d5"),
       ("4k3/8/8/8/3Pp3/8/8/4K3 b - d3 17 1", "e4", "d3", "d4")] do
    let p ← position fen
    let m ← move src dst
    test "en passant legal for either color" (isLegal p m)
    let next := Exec.applyPly p m
    test "en passant removes the captured pawn"
      (decodeBoard next.board (← square capturedSquare) == none)
    test "en passant clears the source" (decodeBoard next.board m.src == none)
    test "en passant moves the capturing pawn"
      (decodeBoard next.board m.dst == some ⟨p.turn, .pawn⟩)
    test "en passant resets clock and expires target"
      (next.halfmoveClock == 0 && next.enPassantTarget == none)
  for (fen, src, dst) in
      [("k3r3/8/8/3pP3/8/8/8/4K3 w - d6 0 1", "e5", "d6"),
       ("4k3/8/8/8/3Pp3/8/8/K3R3 b - d3 0 1", "e4", "d3")] do
    test "pinned en passant rejected for either color"
      (!(isLegal (← position fen) (← move src dst)))
  let ep ← position "4k3/8/8/3pP3/8/8/8/4K3 w - d6 17 1"
  let first ← move "e1" "f1"
  test "quiet move instead of available en passant is legal" (isLegal ep first)
  let epNext := Exec.applyPly ep first
  test "quiet move expires en passant and increments clock"
    (epNext.enPassantTarget == none && epNext.halfmoveClock == 18)
  let reply ← move "e8" "f8"
  test "opponent reply after expiry is legal" (isLegal epNext reply)
  test "expired en passant cannot be claimed next turn"
    (!(isLegal (Exec.applyPly epNext reply) (← move "e5" "d6")))
  let e4 ← move "e2" "e4"
  let afterE4 := Exec.applyPly start e4
  test "double pawn advance legal" (isLegal start e4)
  test "white double advance target, clock, and turn"
    (afterE4.enPassantTarget == some (← square "e3") && afterE4.halfmoveClock == 0 &&
      afterE4.turn == .black)
  let e5 ← move "e7" "e5"
  let afterE5 := Exec.applyPly afterE4 e5
  test "black double pawn advance legal" (isLegal afterE4 e5)
  test "black double advance target" (afterE5.enPassantTarget == some (← square "e6"))
  let noEp := Exec.applyPly afterE4 (← move "a7" "a6")
  test "next ordinary pawn move expires target" (noEp.enPassantTarget == none)
  test "spurious promotion rejected" (!(isLegal start (← move "e2" "e4" (some .queen))))
  for (fen, src, dst, capture) in
      [("1r2k3/P7/8/8/8/8/8/4K3 w - - 9 1", "a7", "a8", "b8"),
       ("4k3/8/8/8/8/8/p7/1R2K3 b - - 9 1", "a2", "a1", "b1")] do
    let p ← position fen
    for kind in [PieceKind.queen, .rook, .bishop, .knight] do
      for target in [dst, capture] do
        let m ← move src target (some kind)
        test "promotion and capture promotion legal for all four kinds" (isLegal p m)
        let next := Exec.applyPly p m
        test "promoted piece installed with same color"
          (decodeBoard next.board m.dst == some ⟨p.turn, kind⟩)
        test "promotion clears pawn source and resets clock"
          (decodeBoard next.board m.src == none && next.halfmoveClock == 0)
    for invalid in [none, some PieceKind.king, some .pawn] do
      test "missing or forbidden promotion rejected" (!(isLegal p (← move src dst invalid)))
  let checked ← position "k3r3/8/8/8/8/8/R7/4K3 w - - 2 1"
  test "check detected" (decide (InCheck (decodeBoard checked.board) .white))
  test "move ignoring check rejected" (!(isLegal checked (← move "a2" "a3")))
  test "blocking check accepted" (isLegal checked (← move "a2" "e2"))
  test "king evasion accepted" (isLegal checked (← move "e1" "d1"))
  test "checked update rejects illegal move" ((play? checked (← move "a2" "a3")).isNone)
  let mate ← position "7k/6Q1/5K2/8/8/8/8/8 b - - 0 1"
  test "mate layout is checked with no legal plies"
    (decide (InCheck (decodeBoard mate.board) .black) && (legalPlies mate).isEmpty)
  let stale ← position "7k/5Q2/6K1/8/8/8/8/8 b - - 0 1"
  test "stalemate layout is not checked and has no legal plies"
    (!(decide (InCheck (decodeBoard stale.board) .black)) && (legalPlies stale).isEmpty)
  IO.println s!"Rule fixtures passed: {← count.get} assertions"

def main (args : List String) : IO Unit := do
  match args with
  | ["--rules"] => rules
  | [fen, depth] =>
      let some position := position? fen | throw <| IO.userError "Invalid fixture FEN"
      let some depth := depth.toNat? | throw <| IO.userError "Invalid fixture depth"
      IO.println (perft position depth)
  | _ => throw <| IO.userError "Expected FEN and depth"
