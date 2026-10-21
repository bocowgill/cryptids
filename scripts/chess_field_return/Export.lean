/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.FieldReturn.Certificate
import Lean

open Lean Turing ConjectureMachines ConjectureMachines.Compilation.FieldReturn

def rowJson (row : Option (Fin 2 × Dir × Fin 245)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, dest) => Json.arr #[toJson write.val,
      toJson (if dir = .right then (1 : Int) else -1), toJson dest.val]

def main (args : List String) : IO Unit := do
  let payload := Json.mkObj [
    ("states", toJson (245 : Nat)),
    ("inventory", toJson ([60, 5, 120, 55, 5] : List Nat)),
    ("entries", toJson ((List.finRange 5).map fun v ↦ (embed v 0).val)),
    ("rows", Json.arr ((List.finRange 245).map fun q ↦
      Json.arr #[rowJson (machine.transition q 0), rowJson (machine.transition q 1)]).toArray),
    ("ports", Json.arr ((List.finRange 245).map fun q ↦
      if (control q).val = 48 then toJson (store q).val else Json.null).toArray)]
  match args with
  | [path] =>
    IO.FS.writeFile path payload.compress
    IO.println "Field return machine export passed"
  | _ => throw (IO.userError "Provide the output JSON path")
