import Cryptids.Compilation.GraphPost

open Turing StateTransition
open ConjectureMachines.Compilation BoolGraph GraphPost

deriving instance DecidableEq for TM0.Stmt

namespace GraphFixtures

def bits : Table 2 Bool := #v[false, true, true, false]
def stores : Table 2 (Fin 2) := #v[1, 0, 0, 1]
def targets : Table 2 (Fin 2) := #v[0, 1, 1, 0]

def allNodes : Graph 7 2 2 where
  nodes := #v[.halt, .goto targets, .move .right 0, .write bits 0,
    .branch bits 1 2, .load stores 4, .write bits 5]
  entries := #v[6, 0]
  below := by decide

-- Every finite table corner, including the final (true, last-store) cell.
example : bits.read false 0 = false := by decide
example : bits.read false 1 = true := by decide
example : bits.read true 0 = true := by decide
example : bits.read true 1 = false := by decide

-- Branch alternatives, direct write, load's changed store, goto target and final halt write.
example : trAux allNodes false 4 0 = ((some 0, 0), .move .right) := by
  rw [trAux]
  change trAux allNodes false 2 0 = _
  rw [trAux]
  rfl
example : trAux allNodes false 4 1 = ((some 0, 1), .write false) := by
  rw [trAux]
  change trAux allNodes false 1 1 = _
  rw [trAux]
  rfl
example : trAux allNodes false 3 1 = ((some 0, 1), .write true) := by rw [trAux]; rfl
example : trAux allNodes false 5 0 = ((some 0, 1), .write false) := by
  rw [trAux]
  change trAux allNodes false 4 1 = _
  rw [trAux]
  change trAux allNodes false 1 1 = _
  rw [trAux]
  rfl
example : trAux allNodes true 5 1 = ((some 0, 1), .move .right) := by
  rw [trAux]
  change trAux allNodes true 4 1 = _
  rw [trAux]
  change trAux allNodes true 2 1 = _
  rw [trAux]
  rfl
example : trAux allNodes true 1 0 = ((some 0, 0), .write true) := by rw [trAux]; rfl
example : trAux allNodes false 0 1 = ((none, 1), .write false) := by rw [trAux]; rfl

example : stateCount 7 2 = 17 := rfl
example : ∀ d : Descriptor 7 2, descriptor allNodes (encode d) = d :=
  descriptor_encode allNodes
example : ∀ q : Fin 17, ∀ b, programMachine (program allNodes) q b = machine allNodes q b := by
  intro q b
  rw [program_correct]

-- Ordinary state zero begins by writing, while encoded halted controls have no row.
example : machine allNodes 0 true = some (encode (some 5, 0), .write true) := by
  rw [machine_zero, trAux]
  rfl
example : machine allNodes (encode (none, 1)) true = none := by decide
example : decodeState allNodes (Equiv.refl (Fin 2)) 0 =
    (some (BoolGraph.machine allNodes (Equiv.refl (Fin 2)) 0), 0) := rfl

-- Literal mutation changes actual output; later negative-control compilation must reject it.
def mutated : Graph 7 2 2 where
  nodes := #v[.halt, .goto targets, .move .right 0, .write bits 0,
    .branch bits 1 2, .load stores 4, .write #v[true, true, false, false] 5]
  entries := #v[6, 0]
  below := by decide
example : machine mutated 0 true ≠ machine allNodes 0 true := by
  rw [machine_zero, machine_zero, trAux, trAux]
  decide

-- A real source-label goto cycle requires no cyclic syntax nodes.
def loop : Graph 1 1 1 where
  nodes := #v[.goto #v[0, 0]]
  entries := #v[0]
  below := by decide

example (b : Bool) : machine loop 0 b = some (encode (some 0, 0), .write b) := by
  cases b <;> rw [machine_zero, trAux] <;> rfl
example (b : Bool) : machine loop (encode (some 0, 0)) b =
    some (encode (some 0, 0), .write b) := by
  cases b <;> rw [machine_running, trAux] <;> rfl

-- A one-node halt still emits one write; only its successor has a missing transition.
def stop : Graph 1 1 1 where
  nodes := #v[.halt]
  entries := #v[0]
  below := by decide
example (b : Bool) : machine stop 0 b = some (encode (none, 0), .write b) := by
  cases b <;> rw [machine_zero, trAux] <;> rfl
example (b : Bool) : machine stop (encode (none, 0)) b = none := by cases b <;> decide

-- Exact input/output theorem and both directions specialize without any source oracle.
example (input : List Bool) : TM0.eval (programMachine (program allNodes)) input =
    TM1.eval (BoolGraph.machine allNodes (Equiv.refl (Fin 2))) input :=
  program_eval_eq allNodes (Equiv.refl _) rfl input
example (input : List Bool) : (TM0.eval (machine loop) input).Dom ↔
    (TM1.eval (BoolGraph.machine loop (Equiv.refl (Fin 1))) input).Dom :=
  halts_iff loop (Equiv.refl _) rfl input

-- The nontrivial store type used by the eventual frontend has five values.
def fiveStore : Graph 2 5 1 where
  nodes := #v[.halt, .load #v[0, 1, 2, 3, 4, 4, 3, 2, 1, 0] 0]
  entries := #v[1]
  below := by decide
example : trAux fiveStore false 1 4 = ((none, 4), .write false) := by
  rw [trAux]
  change trAux fiveStore false 0 4 = _
  rw [trAux]
  rfl
example : trAux fiveStore true 1 4 = ((none, 0), .write true) := by
  rw [trAux]
  change trAux fiveStore true 0 0 = _
  rw [trAux]
  rfl
example (input : List Bool) : TM0.eval (machine fiveStore) input =
    TM1.eval (BoolGraph.machine fiveStore (finSuccEquiv 4)) input :=
  eval_eq fiveStore (finSuccEquiv 4) rfl input

private theorem self_loop_not_dom {α : Type} (f : α → Option α) (a : α)
    (step : f a = some a) : ¬(StateTransition.eval f a).Dom := by
  intro dom
  obtain ⟨b, hb⟩ := Part.dom_iff_mem.mp dom
  have impossible : a = a → False := StateTransition.evalInduction
    (C := fun x ↦ x = a → False) hb (fun x _ ih hx ↦ by
      subst x
      exact ih a step rfl)
  exact impossible rfl

-- The goto cycle really diverges, for every input; numeric lowering preserves this.
theorem loop_source_not_dom (input : List Bool) :
    ¬(TM1.eval (BoolGraph.machine loop (Equiv.refl (Fin 1))) input).Dom := by
  change ¬(StateTransition.eval _ _).Dom
  apply self_loop_not_dom
  change some (TM1.stepAux (BoolGraph.decode loop (Equiv.refl (Fin 1)) 0) 0 _) = _
  rw [BoolGraph.decode]
  cases bit : (Tape.mk₁ input).head <;>
    simp [loop, TM1.stepAux, Table.read, Vector.get, Fin.cast, bit, TM1.init] <;> rfl

theorem loop_numeric_not_dom (input : List Bool) : ¬(TM0.eval (machine loop) input).Dom := by
  rw [halts_iff loop (Equiv.refl (Fin 1)) rfl input]
  exact loop_source_not_dom input

end GraphFixtures

namespace NativeGraphProbe
open GraphFixtures

def writeTable : Table 5 Bool := #v[false, true, false, true, false,
  true, false, true, false, true]

def wide (extra : Nat) : Graph (extra + 1) 5 1 where
  nodes := Vector.ofFn (fun i ↦ if i.val = 0 then .halt else .write writeTable 0)
  entries := #v[⟨extra, by omega⟩]
  below := by
    intro i child member
    simp [Vector.get, Fin.cast] at member
    by_cases zero : i = 0
    · simp [zero, Node.children] at member
    · simp [zero, Node.children] at member
      subst child
      exact Nat.pos_of_ne_zero (fun h ↦ zero (Fin.ext h))

def signature {n : Nat} : Option (Fin n × TM0.Stmt Bool) → Nat
  | none => 0
  | some (q, .move .left) => 1 + 4 * q.val
  | some (q, .move .right) => 2 + 4 * q.val
  | some (q, .write false) => 3 + 4 * q.val
  | some (q, .write true) => 4 + 4 * q.val

def boundedRun {α : Type} (step : α → Option α) : Nat → α → Option α
  | 0, _ => none
  | fuel + 1, cfg => match step cfg with
    | none => some cfg
    | some next => boundedRun step fuel next

def tapeWindow : Nat → Tape Bool → List Bool
  | 0, _ => []
  | n + 1, tape => tape.head :: tapeWindow n (tape.move .right)

def paired (input : List Bool) : Bool :=
  let source := boundedRun (TM1.step (BoolGraph.machine allNodes (Equiv.refl (Fin 2))))
    40 (TM1.init input)
  let target := boundedRun (TM0.step (programMachine (program allNodes))) 40 (TM0.init input)
  match source, target with
  | some a, some b => tapeWindow 12 a.Tape == tapeWindow 12 b.Tape
  | none, none => true
  | _, _ => false

end NativeGraphProbe

def main : IO Unit := do
  let start ← IO.monoMsNow
  let table := program (NativeGraphProbe.wide 10000)
  let checksum := table.toArray.foldl (fun sum row ↦ row.toArray.foldl
    (fun s instruction ↦ s + NativeGraphProbe.signature instruction) sum) 0
  let elapsed ← IO.monoMsNow
  let inputs := [[], [false], [true], [false, true, false], [true, false, true, true]]
  unless inputs.all NativeGraphProbe.paired do throw <| IO.userError "Paired runs disagree"
  unless table.toArray.size == 50011 do throw <| IO.userError "Wrong numeric state count"
  IO.println s!"states={table.toArray.size}; cells={2 * table.toArray.size}; checksum={checksum}"
  IO.println s!"construction_and_scan_ms={elapsed-start}; paired_inputs={inputs.length}"
