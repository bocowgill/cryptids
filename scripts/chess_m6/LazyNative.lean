import Cryptids.Compilation.LazyGraph

open Turing ConjectureMachines.Compilation
open LazyGraph

namespace LazyGraphNative

def bits : BoolGraph.Table 5 Bool := #v[false, true, false, true, false,
  true, false, true, false, true]

/-- Construction is an arithmetic closure, independently of the represented node count. -/
def wide (extra : Nat) : Graph (extra + 1) 5 2 where
  node i := if i.val = 0 then .halt else .write bits 0
  entry label := if label = 0 then ⟨extra, by omega⟩ else 0
  below i child member := by
    by_cases zero : i.val = 0
    · simp [zero, BoolGraph.Node.children] at member
    · simp [zero, BoolGraph.Node.children] at member
      subst child
      exact Nat.pos_of_ne_zero zero

def observe {q : Nat} (row : Option (Fin q × TM0.Stmt Bool)) : Option (Nat × Nat) :=
  row.map fun (next, action) ↦ (next.val, match action with
    | .write bit => if bit then 1 else 0
    | .move .left => 2
    | .move .right => 3)

/-- Independent arithmetic oracle for the wide fixture, without backend packing calls. -/
def expected (extra q : Nat) (bit : Bool) : Option (Nat × Nat) :=
  let k := 5
  let pc := if q = 0 then extra + 1 else (q - 1) / k
  let value := if q = 0 then 0 else (q - 1) % k
  if pc = 0 then none
  else if pc = 1 then some (1 + value, if bit then 1 else 0)
  else some (1 + k + value, if bit != (value % 2 == 1) then 1 else 0)

-- No vector interpretation or materialized program appears in this executed function.
def probe (extra repeats : Nat) : IO Unit := do
  let start ← IO.monoMsNow
  let graph := wide extra
  let count := GraphPost.stateCount (extra + 1) 5
  let indices := #[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
    count / 2, count - 5, count - 4, count - 3, count - 2, count - 1]
  let mut checksum := 0
  for _ in [:repeats] do
    for i in indices do
      if bound : i < count then
        for bit in [false, true] do
          let actual := observe (machine graph ⟨i, bound⟩ bit)
          let wanted := expected extra i bit
          unless actual == wanted do
            throw <| IO.userError s!"Row mismatch at {i}/{count}, bit {bit}: {actual} != {wanted}"
          checksum := checksum + (actual.map (fun pair ↦ pair.1 + pair.2)).getD 0
  let elapsed := (← IO.monoMsNow) - start
  IO.println <| s!"nodes={extra + 1} paidStates={count} queries={repeats * indices.size * 2} " ++
    s!"checksum={checksum} ms={elapsed}"

end LazyGraphNative

def main (args : List String) : IO Unit := do
  match args with
  | [size] =>
    let some extra := size.toNat? | throw <| IO.userError "Expected natural size"
    if extra < 1 then throw <| IO.userError "Use a positive size"
    LazyGraphNative.probe extra 10000
  | _ => throw <| IO.userError "Expected one size argument"
