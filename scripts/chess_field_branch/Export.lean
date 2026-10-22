/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.FieldBranch.Certificate
import Lean

open Lean Turing ConjectureMachines ConjectureMachines.Compilation.FieldBranch

def rowJson (row : Option (Fin 2 × Dir × Fin 675)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, dest) => Json.arr #[toJson write.val,
      toJson (if dir = .right then (1 : Int) else -1), toJson dest.val]

def portJson (v : Fin 5) : Json := Json.mkObj [
  ("store", toJson v.val),
  ("successor", toJson (if v.val < 3 then "normal3" else "reverse_push_s000"))]

def main (args : List String) : IO Unit := do
  let payload := Json.mkObj [
    ("states", toJson (675 : Nat)),
    ("inventory", toJson ([425,5,245] : List Nat)),
    ("entries", toJson ((List.finRange 5).map fun v ↦
      (oldIn (Compilation.FieldContinuation.returnIn (Compilation.FieldReturn.embed v 0))).val)),
    ("return_entries", toJson ((List.finRange 5).map fun v ↦
      (returnIn (Compilation.FieldReturn.embed v 0)).val)),
    ("scan_entry", toJson (oldIn (Compilation.FieldContinuation.scanIn 0)).val),
    ("rows", Json.arr ((List.finRange 675).map fun q ↦
      Json.arr #[rowJson (machine.transition q 0), rowJson (machine.transition q 1)]).toArray),
    ("ports", Json.arr ((List.finRange 675).map fun q ↦
      if h : q.val ≥ 430 ∧ (q.val - 430) % 49 = 48 then
        portJson ⟨(q.val - 430) / 49, by have := q.isLt; omega⟩
      else Json.null).toArray)]
  match args with
  | [path] =>
    IO.FS.writeFile path payload.compress
    IO.println "Field branch machine export passed"
  | _ => throw (IO.userError "Provide the output JSON path")
