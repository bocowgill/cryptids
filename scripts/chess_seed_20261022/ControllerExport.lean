/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Seed.Controller
import Lean

open Lean Turing ConjectureMachines ConjectureMachines.Compilation

namespace ChessSeedControllerExport

def rowJson (row : Option (Fin 2 × Dir × Fin 216)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, next) =>
    Json.arr #[toJson write.val, toJson (if dir = .right then (1 : Int) else -1),
      toJson next.val]

def exportRows (path : System.FilePath) : IO Unit := do
  unless (← IO.getEnv "CHESS_REMOTE") = some "1" ∧
      (← IO.getEnv "GITHUB_ACTIONS") = some "true" do
    throw (IO.userError "Controller native export is remote-only")
  let mut rows : Array Json := #[]
  for state in List.finRange 216 do
    rows := rows.push (Json.arr ((List.finRange 2).map
      (fun bit ↦ rowJson (Seed.machine.transition state bit))).toArray)
  let payload := Json.mkObj [
    ("schema", toJson "chess-seed-lean-controller-v1"),
    ("states", toJson (216 : Nat)), ("rows", Json.arr rows),
    ("scope", toJson "Complete actual Lean controller table; universal expansion is separate")]
  IO.FS.writeFile path (payload.compress ++ "\n")
  IO.println "Seed actual controller export passed"

end ChessSeedControllerExport

def main (args : List String) : IO Unit := do
  let [path] := args | throw (IO.userError "Expected one output JSON path")
  ChessSeedControllerExport.exportRows path
