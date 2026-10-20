/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Machines

/-! Streaming canonical export. No table or list of state indices is materialized. -/

@[expose] public section
namespace ChessM6Export
open Turing ConjectureMachines

def cell {q : Nat} : Option (Fin 2 × Dir × Fin q) → String
  | none => "---"
  | some (a, d, next) => s!"{a.val}{if d = .left then "L" else "R"}{next.val}"

def row {q : Nat} (M : Machine q 2) (state : Fin q) : String :=
  cell (M.transition state 0) ++ " " ++ cell (M.transition state 1) ++ "\n"

/-- Stream a checked state interval in bounded batches, including absent transitions. -/
def emitRange {q : Nat} (output : IO.FS.Stream) (M : Machine q 2)
    (start count : Nat) (batchRows : Nat := 4096) : IO Unit := do
  unless start + count ≤ q do
    throw <| IO.userError "Export interval exceeds the machine state count"
  unless batchRows > 0 do
    throw <| IO.userError "Export batch size must be positive"
  let mut lines : List String := []
  let mut buffered := 0
  for index in [start : start + count] do
    if h : index < q then
      lines := row M ⟨index, h⟩ :: lines
      buffered := buffered + 1
      if buffered == batchRows then
        output.putStr (String.join lines.reverse)
        lines := []
        buffered := 0
    else
      throw <| IO.userError "Export state is outside the declared finite machine"
  unless lines.isEmpty do
    output.putStr (String.join lines.reverse)
  output.flush

end ChessM6Export
