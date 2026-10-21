/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.FieldContinuation.Certificate
import Lean

open Lean Turing ConjectureMachines ConjectureMachines.Compilation.FieldContinuation

def rowJson (row : Option (Fin 2 × Dir × Fin 425)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, dest) => Json.arr #[toJson write.val,
      toJson (if dir = .right then (1 : Int) else -1), toJson dest.val]

def main (args : List String) : IO Unit := do
  let payload := Json.mkObj [
    ("states", toJson (425 : Nat)),
    ("inventory", toJson ([245,1,39,2,14,1,37,2,14,1,39,5,25] : List Nat)),
    ("entries", toJson ((List.finRange 5).map fun v ↦
      (returnIn (ConjectureMachines.Compilation.FieldReturn.embed v 0)).val)),
    ("scan_entry", toJson (scanIn 0).val),
    ("rows", Json.arr ((List.finRange 425).map fun q ↦
      Json.arr #[rowJson (machine.transition q 0), rowJson (machine.transition q 1)]).toArray),
    ("ports", Json.arr ((List.finRange 425).map fun q ↦
      if q.val ≥ 400 ∧ (q.val - 400) % 5 = 4 then toJson ((q.val - 400) / 5)
      else Json.null).toArray)]
  match args with
  | [path] =>
    IO.FS.writeFile path payload.compress
    IO.println "Field continuation machine export passed"
  | _ => throw (IO.userError "Provide the output JSON path")
