/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Evaluation
import Cryptids.Chess.Fixtures

open Chess Chess.Adjudication Chess.Evaluation

private def position (fen : String) : IO Exec.Position :=
  match Fixtures.position? fen with
  | some p => pure p
  | none => throw <| IO.userError s!"Invalid fixture FEN: {fen}"

private def check (count : IO.Ref Nat) (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Chess M4 fixture failed: {label}"
  count.modify (· + 1)
  IO.println s!"ok: {label}"

private def isPlay : Action → Bool
  | .play _ => true
  | .claimDraw => false

def main : IO Unit := do
  let count ← IO.mkRef 0
  let test := check count
  let whiteMate ← position "7k/6Q1/5K2/8/8/8/8/8 b - - 150 1"
  test "terminal White win takes priority over clock draw"
    (solve ⟨whiteMate, []⟩ == .win .white)
  let blackMate ← position "8/8/8/8/8/5k2/6q1/7K w - - 150 1"
  test "terminal Black win takes priority over clock draw"
    (solve ⟨blackMate, []⟩ == .win .black)
  let stale ← position "7k/5Q2/6K1/8/8/8/8/8 b - - 0 1"
  test "terminal stalemate evaluates to draw" (solve ⟨stale, []⟩ == .draw)
  let winWhite ← position "7k/8/5KQ1/8/8/8/8/8 w - - 149 1"
  let whiteGame : Adjudication.Game := ⟨winWhite, []⟩
  test "White can claim before a winning move" (canClaimDraw whiteGame)
  let whiteDecision := analyse whiteGame
  test "White chooses mate over an available draw" (whiteDecision.1 == .win .white)
  test "White optimal action is a move" (isPlay whiteDecision.2)
  test "White chosen move is legal" ((legalActions whiteGame).contains whiteDecision.2)
  test "White chosen move attains the value" (actionValue whiteGame whiteDecision.2 == .win .white)
  let winBlack ← position "8/8/8/8/8/5kq1/8/7K b - - 149 1"
  let blackGame : Adjudication.Game := ⟨winBlack, []⟩
  let blackDecision := analyse blackGame
  test "Black chooses mate over an available draw" (blackDecision.1 == .win .black)
  test "Black optimal action is a move" (isPlay blackDecision.2)
  test "Black chosen move is legal" ((legalActions blackGame).contains blackDecision.2)
  test "Black chosen move attains the value" (actionValue blackGame blackDecision.2 == .win .black)
  -- White has only Ka2. Black can answer Qa4#, ahead of the automatic clock draw.
  let threatened ← position "8/8/8/8/1q6/8/2k5/K7 w - - 148 1"
  let threatenedGame : Adjudication.Game := ⟨threatened, []⟩
  let threatenedActions := legalActions threatenedGame
  test "threatened position has exactly one move plus a claim" (threatenedActions.length == 2)
  test "threatened position offers a legal draw claim" (threatenedActions.contains .claimDraw)
  test "every played alternative loses to a forced mate"
    (threatenedActions.all fun action ↦ !isPlay action || actionValue threatenedGame action == .win .black)
  let saved := analyse threatenedGame
  test "claim improves the outcome from loss to draw" (saved.1 == .draw)
  test "optimal policy takes the saving claim" (saved.2 == .claimDraw)
  let clockDraw := {winWhite with halfmoveClock := 150}
  test "automatic draw stops evaluation before considering moves"
    (solve ⟨clockDraw, []⟩ == .draw)
  let repeated : Adjudication.Game := ⟨winWhite, List.replicate 4 winWhite⟩
  test "full history changes a winning layout into an automatic draw" (solve repeated == .draw)
  test "finite selector rejects one favorable line with a better opposing option"
    (choose .black id (.win .white) [.draw, .win .black] == .win .black)
  test "finite selector preserves an actual candidate on ties"
    (choose .white id .draw [.draw] == .draw)
  IO.println s!"Chess M4 fixtures passed: {← count.get} assertions"
