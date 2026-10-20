/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Games
open Turing Chess.Compilation

private def check (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"M5 fixture failed: {label}"
  IO.println s!"ok: {label}"

private def runPrefix (tree : Tree) (n : Nat) : Option GameCfg :=
  (fun c ↦ c.bind (TM2.step (gameProgram tree)))^[n] (some (TM2.init false []))

def main : IO Unit := do
  check "White maximizes" (value whiteWin == 2)
  check "Black minimizes" (value blackWin == 0)
  check "draw" (value drawGame == 1)
  check "favorable line is not forced" (value favorableLine == 1)
  check "White serialization" (serialize whiteWin == [0, 2, 3])
  check "Black serialization" (serialize blackWin == [2, 0, 4])
  check "draw serialization" (serialize drawGame == [0, 1, 3])
  check "refutation serialization" (serialize favorableLine == [2, 1, 4, 0, 3])
  check "empty input rejected" (runTokens [] [] == some [])
  check "underflow rejected" (runTokens [3] [] == none)
  check "surplus values remain surplus" (runTokens [2, 2] [] == some [2, 2])
  check "nested min/max" (runTokens (serialize favorableLine) [] == some [1])
  check "White wrapper halts within runPrefix" ((runPrefix whiteWin 100).isNone)
  check "Black wrapper halts within runPrefix" ((runPrefix blackWin 100).isNone)
  check "draw runPrefix remains live" ((runPrefix drawGame 100).isSome)
  check "refutation runPrefix remains live" ((runPrefix favorableLine 100).isSome)
  IO.println "Chess M5 fixtures passed: 16 assertions"
