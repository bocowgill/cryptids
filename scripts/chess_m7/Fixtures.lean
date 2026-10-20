/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Optimisation.CompactPost

open Turing ConjectureMachines.Compilation ConjectureMachines.Optimisation.CompactPost

namespace M7Fixtures

def graph : BoolGraph.Graph 7 2 2 where
  nodes := #v[.halt, .goto #v[0, 1, 1, 0], .move .right 0,
    .write #v[false, true, true, false] 0, .branch #v[false, true, true, false] 1 2,
    .load #v[1, 0, 0, 1] 4, .write #v[false, true, true, false] 5]
  entries := #v[6, 0]
  below := by decide

def getter : LazyGraph.Graph 7 2 2 := ⟨graph.nodes.get, graph.entries.get, graph.below⟩

example : GraphPost.stateCount 7 2 = 17 := by decide
example : stateCount 7 2 = 15 := by decide
example : encode getter (some (getter.entry 0), 0) = 0 := encode_initial getter
example : encode getter (none, 0) = encode getter (none, 1) := rfl
example : decode getter (encode getter (none, 1)) = none := decode_encode getter (none, 1)
example (input : List Bool) :
    (TM0.eval (machine getter) input).Dom ↔ (TM0.eval (LazyGraph.machine getter) input).Dom :=
  halts_input getter input

def view {q : Nat} : Option (Fin q × TM0.Stmt Bool) → Option (Nat × Nat)
  | none => none
  | some (next, cmd) => some (next.val, match cmd with
      | .move .left => 0 | .move .right => 1 | .write false => 2 | .write true => 3)

def expected (q : Fin 17) (bit : Bool) : Option (Fin 15 × TM0.Stmt Bool) :=
  (LazyGraph.machine getter q bit).map fun (next, cmd) ↦
    (encode getter (LazyGraph.descriptor getter next), cmd)

-- Exhaust all old controls and both symbols, including every halted store and initial duplicate.
example (q : Fin 17) (bit : Bool) :
    view (machine getter (encode getter (LazyGraph.descriptor getter q)) bit) =
      view (expected q bit) := by
  fin_cases q <;> cases bit <;> decide

end M7Fixtures

def main : IO Unit := do
  let mut count := 0
  for i in [:17] do
    if h : i < 17 then
      for bit in [false, true] do
        let q : Fin 17 := ⟨i, h⟩
        unless M7Fixtures.view (machine M7Fixtures.getter
            (encode M7Fixtures.getter (LazyGraph.descriptor M7Fixtures.getter q)) bit) ==
            M7Fixtures.view (M7Fixtures.expected q bit) do
          throw <| IO.userError "Quotient changed a live command or stopping condition"
        count := count + 1
  unless count == 34 do throw <| IO.userError "Incomplete fixture enumeration"
  IO.println "M7 quotient fixtures passed: 34 row corners and universal input equivalence"
