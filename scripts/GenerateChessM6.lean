/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Compilation.Image
import scripts.chess_m6.Export

/-! Stream an exact numeric range of the checked chess machine; stdout contains only rows. -/

open ChessM6Export

def main (args : List String) : IO Unit := do
  let [startText, countText] := args
    | throw <| IO.userError "Expected START COUNT (zero-based state range)"
  let some start := startText.toNat? | throw <| IO.userError "Invalid START"
  let some count := countText.toNat? | throw <| IO.userError "Invalid COUNT"
  let output ← IO.getStdout
  let begin ← IO.monoMsNow
  emitRange output Chess.Compilation.Image.machine start count
  let ended ← IO.monoMsNow
  let log ← IO.getStderr
  log.putStrLn s!"chess-m6 source: start={start}; rows={count}; elapsed_ms={ended-begin}"
