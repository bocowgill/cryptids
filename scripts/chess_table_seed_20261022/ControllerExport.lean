/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.TableSeed.Controller
import Lean

/-! All actual rows of the paid packet decoder, including missing terminal rows. -/

open Lean Turing ConjectureMachines ConjectureMachines.Compilation

namespace ChessTableSeedControllerExport

def statesOf {states : Nat} (_ : Machine states 2) : Nat := states

def rowJson (row : Option (Fin 2 × Dir × Nat)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, next) =>
    Json.arr #[toJson write.val, toJson (if dir = Dir.right then (1 : Int) else -1),
      toJson next]

def exportRows (path : System.FilePath) : IO Unit := do
  unless (← IO.getEnv "CHESS_REMOTE") = some "1" ∧
      (← IO.getEnv "GITHUB_ACTIONS") = some "true" do
    throw (IO.userError "Actual controller export requires remote GitHub Actions")
  let mut rows : Array Json := #[]
  let mut allocated := 0
  let mut missing := 0
  for state in List.finRange 21682 do
    allocated := allocated + 1
    for bit in List.finRange 2 do
      let actual := (TableSeed.machine.transition state bit).map
        (fun (write, dir, next) ↦ (write, dir, next.val))
      unless decide (actual = TableSeed.numericRow state bit) do
        throw (IO.userError s!"Actual/numeric row mismatch at {state.val}/{bit.val}")
      if actual.isNone then missing := missing + 1
      rows := rows.push (Json.arr #[toJson state.val, toJson bit.val, rowJson actual])
  let payload := Json.mkObj [
    ("schema", toJson "chess-table-seed-lean-controller-v1"),
    ("states", toJson (statesOf TableSeed.machine)), ("allocated_states", toJson allocated),
    ("entry", toJson TableSeed.entry.val), ("done", toJson TableSeed.done.val),
    ("error", toJson TableSeed.error.val), ("rows_count", toJson rows.size),
    ("missing_rows", toJson missing), ("order", toJson "state-major,bit-0-before-1"),
    ("actual_numeric_rows_equal", toJson true), ("rows", Json.arr rows),
    ("scope", toJson "Complete actual Lean controller table; universal expansion is separate")]
  IO.FS.writeFile path (payload.compress ++ "\n")
  IO.println "Table seed actual controller export passed"

end ChessTableSeedControllerExport

def main (args : List String) : IO Unit := do
  let [path] := args | throw (IO.userError "Expected one output JSON path")
  ChessTableSeedControllerExport.exportRows path
