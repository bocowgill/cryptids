/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Semantics.ChessM7
import scripts.chess_m6.Export
import Lean

open ChessM6Export

def main (args : List String) : IO Unit := do
  if args == ["--metadata"] then
    let root := Chess.Compilation.Image.getter.entry 0
    IO.println <| Lean.Json.compress <| Lean.Json.mkObj [
      ("prefix_states", Lean.toJson (3110360 : Nat)),
      ("post_states", Lean.toJson (194468236 : Nat)),
      ("stores", Lean.toJson (5 : Nat)),
      ("initial_node", Lean.toJson root.val),
      ("baseline_states", Lean.toJson (392046832 : Nat)),
      ("candidate_states", Lean.toJson (392046822 : Nat))]
    return
  let [startText, countText] := args
    | throw <| IO.userError "Expected --metadata or START COUNT"
  let some start := startText.toNat? | throw <| IO.userError "Invalid START"
  let some count := countText.toNat? | throw <| IO.userError "Invalid COUNT"
  let output ← IO.getStdout
  emitRange output ConjectureMachines.Machines.chess_m7 start count
