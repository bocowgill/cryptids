/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.Tables

open Turing ConjectureMachines.Compilation.Examples

private def cell {q : ℕ} : Option (Fin 2 × Dir × Fin q) → String
  | none => "---"
  | some (a, d, next) => s!"{a.val}{if d = Dir.left then "L" else "R"}{next.val}"

/-- Export the elaborated literal data independently of the native compiler pipeline. -/
private def emit {q : ℕ} (dir : System.FilePath) (name : String)
    (rows : List (List (Option (Fin 2 × Dir × Fin q)))) : IO Unit := do
  let lines := rows.map fun row ↦ String.intercalate " " (row.map cell)
  IO.FS.writeFile (dir / s!"{name}.txt") (String.intercalate "\n" lines ++ "\n")

def main (args : List String) : IO Unit := do
  let [dir] := args | throw <| IO.userError "Expected literal export directory"
  let output := System.FilePath.mk dir
  IO.FS.createDirAll output
  emit output "white" whiteRows
  emit output "black" blackRows
  emit output "draw" drawRows
  emit output "refutation" refutationRows
  IO.println "Exported all four elaborated literal tables"
