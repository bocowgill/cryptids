/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Adjudication
import Cryptids.Chess.Fixtures

open Chess Chess.Adjudication

private def position (fen : String) : IO Exec.Position :=
  match Fixtures.position? fen with
  | some p => pure p
  | none => throw <| IO.userError s!"Invalid fixture FEN: {fen}"

private def check (count : IO.Ref Nat) (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Chess M3 fixture failed: {label}"
  count.modify (· + 1)

private def square (name : String) : IO Square :=
  match Fixtures.square? name with
  | some s => pure s
  | none => throw <| IO.userError s!"Invalid fixture square: {name}"

private def move (src dst : String) : IO Ply := do
  return ⟨← square src, ← square dst, none⟩

private def play (game : Adjudication.Game) (src dst : String) : IO Adjudication.Game := do
  let ply ← move src dst
  unless Exec.isLegal game.current ply do
    throw <| IO.userError s!"Illegal raw fixture move: {src}{dst}"
  return game.play ply

def main : IO Unit := do
  let count ← IO.mkRef 0
  let test := check count
  let cycleGraph := fun n : Fin 3 ↦ if n == 0 then [1] else if n == 1 then [0] else []
  test "finite directed search reaches target"
    (FiniteSearch.reachableTarget cycleGraph (· == 1) 0)
  test "finite directed search saturates a cycle"
    (!(FiniteSearch.reachableTarget cycleGraph (· == 2) 0))
  let stale ← position "7k/5Q2/6K1/8/8/8/8/8 b - - 0 1"
  test "stalemate is exactly dead" (isDead stale)
  let mate ← position "7k/6Q1/5K2/8/8/8/8/8 b - - 0 1"
  test "current mate is not dead" (!(isDead mate))
  let mateInOne ← position "7k/8/5KQ1/8/8/8/8/8 w - - 0 1"
  test "one-ply mate is not dead" (!(isDead mateInOne))
  let rawLoneKing ← position "8/8/8/8/8/8/8/4K3 w - - 0 1"
  test "raw lone-king layout has legal plies" (!(Exec.legalPlies rawLoneKing).isEmpty)
  test "raw lone-king layout is exactly dead" (isDead rawLoneKing)
  test "deadness alone gives an automatic result" (automatic ⟨rawLoneKing, []⟩ == some .draw)
  test "deadness alone excludes actions" (legalActions ⟨rawLoneKing, []⟩).isEmpty
  test "history initial encoding"
    (encodeGame Chess.Game.initial == Adjudication.Game.initial)
  test "zero occurrences threshold always met" (Adjudication.Game.initial.repeated 0)
  test "one current occurrence" (Adjudication.Game.initial.occurrences == 1)
  test "one index cannot witness two occurrences" (!(Adjudication.Game.initial.repeated 2))
  test "initial has no 50-move claim" (!(canClaimFiftyMove Adjudication.Game.initial))
  let initial := Exec.initial
  test "repetition ignores halfmove clock" (samePosition initial {initial with halfmoveClock := 81})
  test "repetition distinguishes turn" (!(samePosition initial {initial with turn := .black}))
  let lostRights := {initial with castlingRights :=
    {initial.castlingRights with whiteKingside := false}}
  test "repetition distinguishes retained but currently unusable rights"
    (!(samePosition initial lostRights))
  test "repetition ignores inert en-passant target"
    (samePosition initial {initial with enPassantTarget := some (← square "e3")})
  let ep ← position "4k3/8/8/3pP3/8/8/8/4K3 w - d6 0 1"
  test "repetition distinguishes a legal en-passant possibility"
    (!(samePosition ep {ep with enPassantTarget := none}))
  let pinned ← position "k3r3/8/8/3pP3/8/8/8/4K3 w - d6 0 1"
  test "repetition ignores a pinned en-passant possibility"
    (samePosition pinned {pinned with enPassantTarget := none})
  let mut knights := Adjudication.Game.initial
  for (src, dst) in [("g1", "f3"), ("g8", "f6"), ("f3", "g1"), ("f6", "g8"),
      ("g1", "f3"), ("g8", "f6"), ("f3", "g1")] do
    knights ← play knights src dst
  test "full history retained before intended claim" (knights.previous.length == 7)
  test "current position has only two occurrences" (knights.occurrences == 2)
  test "third occurrence threshold not yet met" (!(knights.repeated 3))
  test "intended move can establish a third occurrence" (canClaimThreefold knights)
  knights ← play knights "f6" "g8"
  test "actual third occurrence counted" (knights.occurrences == 3)
  test "current third occurrence claim" (canClaimThreefold knights)
  test "third occurrence does not mean fourth" (!(knights.repeated 4))
  test "eight plies and clock preserved"
    (knights.previous.length == 8 && knights.current.halfmoveClock == 8)
  test "full history encoding round trip" (encodeGame (decodeGame knights) == knights)
  for _ in List.range 2 do
    for (src, dst) in [("g1", "f3"), ("g8", "f6"), ("f3", "g1"), ("f6", "g8")] do
      knights ← play knights src dst
  test "fifth occurrence counted" (knights.occurrences == 5)
  test "full sixteen-ply history retained" (knights.previous.length == 16)
  test "fifth occurrence automatically draws" (automatic knights == some .draw)
  test "no legal actions after fifth occurrence" (legalActions knights).isEmpty
  let nearClaim : Adjudication.Game := ⟨{mateInOne with halfmoveClock := 99}, []⟩
  test "below intended 50-move threshold rejected"
    (!(canClaimFiftyMove ⟨{mateInOne with halfmoveClock := 98}, []⟩))
  test "intended quiet move can establish 50-move claim" (canClaimFiftyMove nearClaim)
  let currentClaim := {nearClaim with current := {nearClaim.current with halfmoveClock := 100}}
  test "current 50-move threshold accepted" (canClaimFiftyMove currentClaim)
  test "100 halfmoves alone are not automatic" ((automatic currentClaim).isNone)
  let actions := legalActions currentClaim
  test "draw claim action available" (actions.contains .claimDraw)
  test "claim remains optional alongside moves" (actions.any fun action ↦ match action with
    | .play _ => true
    | .claimDraw => false)
  test "legal actions have no duplicates" (decide actions.Nodup)
  let resetPawn ← play ⟨{initial with halfmoveClock := 99}, []⟩ "e2" "e4"
  test "pawn resets threshold counter" (resetPawn.current.halfmoveClock == 0)
  test "pawn reset removes 50-move entitlement" (!(canClaimFiftyMove resetPawn))
  let capturePosition ← position "4k3/8/8/8/8/8/p7/R3K3 w - - 99 1"
  let resetCapture ← play ⟨capturePosition, []⟩ "a1" "a2"
  test "capture resets threshold counter" (resetCapture.current.halfmoveClock == 0)
  test "capture reset removes 50-move entitlement" (!(canClaimFiftyMove resetCapture))
  let at150 := {mateInOne with halfmoveClock := 150}
  test "150 halfmoves automatically draw" (automatic ⟨at150, []⟩ == some .draw)
  test "no actions after 75-move draw" (legalActions ⟨at150, []⟩).isEmpty
  test "dead search ignores game-level 75-move draw" (!(isDead at150))
  let atMate150 := {mate with halfmoveClock := 150}
  let terminalMate : Adjudication.Game := ⟨atMate150, [mate, mate, mate, mate]⟩
  test "mate fixture reaches both automatic draw thresholds"
    (terminalMate.repeated 5 && terminalMate.current.halfmoveClock == 150)
  test "checkmate beats both automatic draw thresholds"
    (automatic terminalMate == some (.win .white))
  test "no actions after checkmate even with claim entitlement" (legalActions terminalMate).isEmpty
  test "stalemate automatically draws" (automatic ⟨stale, []⟩ == some .draw)
  test "no actions after stalemate" (legalActions ⟨stale, []⟩).isEmpty
  test "nonterminal with mating move has no automatic outcome"
    ((automatic ⟨mateInOne, []⟩).isNone)
  test "ordinary nonterminal still has legal actions" (!(legalActions ⟨mateInOne, []⟩).isEmpty)
  test "no claim before any threshold" (!(legalActions ⟨mateInOne, []⟩).contains .claimDraw)
  IO.println s!"Chess M3 fixtures passed: {← count.get} assertions"
