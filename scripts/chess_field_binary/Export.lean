/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.FieldBinary.Pilot
import Lean

/-! Export every row of the actual small binary routines for an independent simulator. -/
open Lean Turing ConjectureMachines ConjectureMachines.Compilation.FieldBinary

def rowJson {q : Nat} (row : Option (Fin 2 × Dir × Fin q)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, dest) => Json.arr #[toJson write.val,
      toJson (if dir = .right then (1 : Int) else -1), toJson dest.val]

def routineJson {α : Type} (encode : α → Nat) (p : Routine α)
    (kind : String) (offset : Nat) (value : Nat := 0) : Json :=
  Json.mkObj [
    ("kind", toJson kind), ("offset", toJson offset), ("value", toJson value),
    ("states", toJson p.size),
    ("rows", Json.arr ((List.finRange p.size).map fun state ↦
      Json.arr #[rowJson (p.machine.transition state 0),
        rowJson (p.machine.transition state 1)]).toArray),
    ("exits", Json.arr ((List.finRange p.size).map fun state ↦
      match p.result state with | none => Json.null | some x => toJson (encode x)).toArray)]

def rawWord (n : Nat) : Word :=
  (⟨n % 2, Nat.mod_lt _ (by decide)⟩,
   ⟨n / 2 % 2, Nat.mod_lt _ (by decide)⟩,
   ⟨n / 4 % 2, Nat.mod_lt _ (by decide)⟩)

def main (args : List String) : IO Unit := do
  let mut routines := #[]
  for field in List.finRange 4 do
    routines := routines.push (routineJson wordValue (readField field) "read" (fieldOffset field))
    for value in [:8] do
      routines := routines.push (routineJson (fun _ ↦ 0)
        (writeAt (fieldOffset field) (rawWord value)) "write" (fieldOffset field) value)
  for dir in [Dir.left, Dir.right] do
    routines := routines.push (routineJson (fun _ ↦ 0) (moveCell dir)
      (if dir = .right then "move_right" else "move_left") 0)
  let codec := (List.range 8).map fun n ↦
    Json.arr #[toJson n, toJson (decodeWord (rawWord n)).val]
  let payload := (Json.mkObj [("routines", Json.arr routines),
    ("codec", Json.arr codec.toArray),
    ("legacy_allocation_marginals", Json.arr #[toJson legacyReadContribution,
      toJson legacyWriteContribution, toJson legacyMoveContribution])]).compress
  match args with
  | [path] =>
    IO.FS.writeFile path payload
    IO.println "Field binary routine export passed"
  | _ => throw (IO.userError "Provide the output JSON path")
