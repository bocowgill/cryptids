/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Exec
public import Lean.Data.Json

/-!
# Executable chess regression support

The FEN reader is a test-input adapter, not a verified parser or a reachable-position validator.
It checks field shape and bounds, preserves raw metadata, and ignores only the fullmove number
after validating it. Tests separately check its orientation and initial-position decoding.
`perft` counts raw legal move paths, without claims or automatic-draw adjudication.
-/

@[expose] public section
namespace Chess.Fixtures
open Exec

/-- Decode a standard algebraic square. -/
def square? (text : String) : Option Square := do
  let [file, rank] := text.toList | none
  guard ('a' ≤ file && file ≤ 'h' && '1' ≤ rank && rank ≤ '8')
  let file := file.toNat - 'a'.toNat
  let rank := rank.toNat - '1'.toNat
  if hf : file < 8 then
    if hr : rank < 8 then some ⟨⟨file, hf⟩, ⟨rank, hr⟩⟩ else none
  else none

/-- Decode a FEN piece character. -/
def piece? (char : Char) : Option Piece := do
  let kind ← match char.toLower with
    | 'k' => some PieceKind.king
    | 'q' => some .queen
    | 'r' => some .rook
    | 'b' => some .bishop
    | 'n' => some .knight
    | 'p' => some .pawn
    | _ => none
  return ⟨if char.isUpper then .white else .black, kind⟩

/-- Decode exactly one FEN rank, rejecting overflows and malformed runs. -/
def rank? (text : String) : Option (Vector (Option Piece) 8) := do
  let mut cells : Array (Option Piece) := #[]
  for char in text.toList do
    if '1' ≤ char && char ≤ '8' then
      cells := cells ++ Array.replicate (char.toNat - '0'.toNat) none
    else
      cells := cells.push (some (← piece? char))
  if h : cells.size = 8 then some ⟨cells, h⟩ else none

/-- Read all six FEN fields as a raw executable position. -/
def position? (text : String) : Option Exec.Position := do
  let [placement, active, rights, ep, clock, fullmove] := text.splitOn " " | none
  let ranks := placement.splitOn "/"
  if ranks.length != 8 then none else do
    let rows ← ranks.reverse.mapM rank?
    let board := rows.toArray
    if h : board.size = 8 then
      let turn ← match active with | "w" => some Color.white | "b" => some .black | _ => none
      if !(rights == "-" || rights.toList.all (fun c ↦ "KQkq".contains c)) then none else do
        let enPassantTarget ← if ep == "-" then some none else (square? ep).map some
        let halfmoveClock ← clock.toNat?
        let fullmove ← fullmove.toNat?
        if fullmove == 0 then none else
          return { board := ⟨board, h⟩
                   turn
                   castlingRights := ⟨rights.contains 'K', rights.contains 'Q',
                     rights.contains 'k', rights.contains 'q'⟩
                   enPassantTarget
                   halfmoveClock }
    else none

/-- Count paths of exactly `depth` raw legal plies. A depth-zero tree has one leaf. -/
def perft (position : Exec.Position) : ℕ → ℕ
  | 0 => 1
  | depth + 1 => (legalPlies position).foldl
      (fun total ply ↦ total + perft (Exec.applyPly position ply) depth) 0

end Chess.Fixtures
