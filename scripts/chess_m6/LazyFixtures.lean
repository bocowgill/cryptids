import Cryptids.Compilation.LazyGraph

open Turing ConjectureMachines.Compilation
namespace LazyGraphFixtures

deriving instance DecidableEq for TM0.Stmt
open LazyGraph

-- Table order is false/store0, false/store1, true/store0, true/store1.
def writes : BoolGraph.Table 2 Bool := #v[false, true, true, false]
def loads : BoolGraph.Table 2 (Fin 2) := #v[1, 1, 1, 1]
def branches : BoolGraph.Table 2 Bool := #v[false, true, false, true]
def jumps : BoolGraph.Table 2 (Fin 2) := #v[0, 1, 1, 0]

def graph : Graph 6 2 2 where
  node i := match i.val with
    | 0 => .halt
    | 1 => .write writes 0
    | 2 => .move .left 0
    | 3 => .branch branches 1 2
    | 4 => .load loads 3
    | _ => .goto jumps
  entry label := if label = 0 then 4 else 5
  below i child h := by
    fin_cases i <;> simp_all [BoolGraph.Node.children]
    rcases h with rfl | rfl <;> decide

example (i : Fin 6) : (asGraph graph).nodes.get i = graph.node i := asGraph_node graph i
example (i : Fin 2) : (asGraph graph).entries.get i = graph.entry i := asGraph_entry graph i
example (bit : Bool) (i : Fin 6) (value : Fin 2) :
    trAux graph bit i value = GraphPost.trAux (asGraph graph) bit i value :=
  trAux_eq graph bit i value
example : machine graph = GraphPost.machine (asGraph graph) := machine_eq graph

theorem row0 (bit : Bool) (value : Fin 2) :
    trAux graph bit 0 value = ((none, value), .write bit) := trAux_halt _ _ _ _ rfl

theorem row1 (bit : Bool) (value : Fin 2) :
    trAux graph bit 1 value = ((some 0, value), .write (writes.read bit value)) :=
  trAux_write _ _ _ _ _ _ rfl

theorem row2 (bit : Bool) (value : Fin 2) :
    trAux graph bit 2 value = ((some 0, value), .move .left) := trAux_move _ _ _ _ _ _ rfl

theorem row3 (bit : Bool) (value : Fin 2) :
    trAux graph bit 3 value =
      if branches.read bit value then trAux graph bit 1 value else trAux graph bit 2 value :=
  trAux_branch _ _ _ _ _ _ _ rfl

theorem row4 (bit : Bool) (value : Fin 2) :
    trAux graph bit 4 value = trAux graph bit 3 (loads.read bit value) :=
  trAux_load _ _ _ _ _ _ rfl

theorem row5 (bit : Bool) (value : Fin 2) :
    trAux graph bit 5 value = ((some (graph.entry (jumps.read bit value)), value), .write bit) :=
  trAux_goto _ _ _ _ _ rfl

-- Every constructor, both branch alternatives, changed-store read ordering and goto entries.
example : trAux graph false 0 1 = ((none, 1), .write false) := by rw [row0]
example : trAux graph true 1 1 = ((some 0, 1), .write false) := by rw [row1]; rfl
example : trAux graph false 1 1 = ((some 0, 1), .write true) := by rw [row1]; rfl
example : trAux graph true 2 1 = ((some 0, 1), .move .left) := by rw [row2]
example : trAux graph false 3 0 = ((some 0, 0), .move .left) := by
  simp only [row3, row1, row2]; decide
example : trAux graph false 3 1 = ((some 0, 1), .write true) := by
  simp only [row3, row1, row2]; decide
example : trAux graph false 4 0 = ((some 0, 1), .write true) := by
  simp only [row4, row3, row1, row2]; decide
example : trAux graph true 4 0 = ((some 0, 1), .write false) := by
  simp only [row4, row3, row1, row2]; decide
example : trAux graph false 5 0 = ((some 4, 0), .write false) := by rw [row5]; rfl
example : trAux graph false 5 1 = ((some 5, 1), .write false) := by rw [row5]; rfl
example : trAux graph true 5 0 = ((some 5, 0), .write true) := by rw [row5]; rfl

-- Numeric state zero is running; halted descriptor controls remain separate and paid.
example : GraphPost.stateCount 6 2 = 15 := rfl
example : descriptor graph 0 = (some 4, 0) := rfl
theorem initial_row : machine graph 0 false = some (GraphPost.encode (some 0, 1), .write true) := by
  rw [machine_zero]
  change some (GraphPost.encode (trAux graph false 4 0).1, (trAux graph false 4 0).2) = _
  simp only [row4, row3, row1, row2]; decide
example (bit : Bool) (value : Fin 2) :
    machine graph (GraphPost.encode (none, value)) bit = none := machine_halted graph value bit
example : GraphPost.encode (n := 6) (none, (0 : Fin 2)) ≠ (0 : Fin 15) := GraphPost.encode_ne_zero _
example : GraphPost.encode (n := 6) (none, (0 : Fin 2)) ≠ GraphPost.encode (n := 6) (none, (1 : Fin 2)) := by
  decide
example (input : List Bool) :
    LocalCertificate.decodePostCfg (decodeState graph (Equiv.refl (Fin 2))) (TM0.init input) =
      TM0.init input := init_decode graph _ rfl input
example (input : List Bool) :
    TM0.eval (machine graph) input =
      TM1.eval (BoolGraph.machine (asGraph graph) (Equiv.refl (Fin 2))) input :=
  eval_eq graph _ rfl input
example (input : List Bool) :
    (TM0.eval (machine graph) input).Dom ↔
      (TM1.eval (BoolGraph.machine (asGraph graph) (Equiv.refl (Fin 2))) input).Dom :=
  halts_iff graph _ rfl input

-- Mutating the initial entry or the load changes actual numeric rows.
def entryMutation : Graph 6 2 2 := { graph with entry := fun _ ↦ 2 }
def loadMutation : Graph 6 2 2 where
  node i := if i = 4 then .load #v[0, 0, 0, 0] 3 else graph.node i
  entry := graph.entry
  below i child h := by
    by_cases hi : i = 4
    · subst i; simp [BoolGraph.Node.children] at h; subst child; decide
    · exact graph.below i child (by simpa [hi] using h)

theorem entry_mutated_row : machine entryMutation 0 false =
    some (GraphPost.encode (some 0, 0), .move .left) := by
  rw [machine_zero]
  change some (GraphPost.encode (trAux entryMutation false 2 0).1,
    (trAux entryMutation false 2 0).2) = _
  rw [trAux_move entryMutation false 2 0 0 .left rfl]

theorem load_mutated_row : machine loadMutation 0 false =
    some (GraphPost.encode (some 0, 0), .move .left) := by
  rw [machine_zero]
  change some (GraphPost.encode (trAux loadMutation false 4 0).1,
    (trAux loadMutation false 4 0).2) = _
  rw [trAux_load loadMutation false 4 3 0 #v[0, 0, 0, 0] rfl]
  change some (GraphPost.encode (trAux loadMutation false 3 0).1,
    (trAux loadMutation false 3 0).2) = _
  rw [trAux_branch loadMutation false 3 1 2 0 branches rfl]
  change some (GraphPost.encode (trAux loadMutation false 2 0).1,
    (trAux loadMutation false 2 0).2) = _
  rw [trAux_move loadMutation false 2 0 0 .left rfl]

example : machine entryMutation 0 false ≠ machine graph 0 false := by
  rw [entry_mutated_row, initial_row]; decide
example : machine loadMutation 0 false ≠ machine graph 0 false := by
  rw [load_mutated_row, initial_row]; decide
example : machine graph 0 false ≠ some (GraphPost.encode (some 0, 1), .write false) := by
  rw [initial_row]; decide
example : machine graph 0 false ≠ some (GraphPost.encode (some 0, 0), .write true) := by
  rw [initial_row]; decide

/-- A genuine control cycle: goto targets need not be smaller than their nodes. -/
def loop : Graph 1 1 1 where
  node _ := .goto #v[0, 0]
  entry _ := 0
  below _ _ h := by cases h

def loopSource (_ : Fin 1) : TM1.Stmt Bool (Fin 1) (Fin 1) := .goto fun _ _ ↦ 0

theorem loop_source_eq : BoolGraph.machine (asGraph loop) (Equiv.refl (Fin 1)) =
    loopSource := by
  funext label
  rw [BoolGraph.machine]
  rw [BoolGraph.decode_goto _ _ _ #v[0, 0] (by rw [asGraph_node]; rfl)]
  congr 1
  funext bit value
  exact Subsingleton.elim _ _

private theorem self_loop_not_dom {α : Type} (f : α → Option α) (a : α)
    (step : f a = some a) : ¬(StateTransition.eval f a).Dom := by
  intro dom
  obtain ⟨b, hb⟩ := Part.dom_iff_mem.mp dom
  have impossible : a = a → False := StateTransition.evalInduction
    (C := fun x ↦ x = a → False) hb (fun x _ ih hx ↦ by
      subst x
      exact ih a step rfl)
  exact impossible rfl

theorem loop_diverges (input : List Bool) : ¬(TM0.eval (machine loop) input).Dom := by
  rw [halts_iff loop (Equiv.refl (Fin 1)) rfl input]
  rw [loop_source_eq]
  change ¬(StateTransition.eval _ _).Dom
  apply self_loop_not_dom
  rfl

/-- A halt root performs its actual preserving write before the missing transition. -/
def stop : Graph 1 1 1 where
  node _ := .halt
  entry _ := 0
  below _ _ member := by cases member

theorem stop_step (input : List Bool) :
    TM0.step (machine stop) (TM0.init input) =
      some ⟨GraphPost.encode (n := 1) (none, (0 : Fin 1)), Tape.mk₁ input⟩ := by
  simp only [TM0.step, TM0.init, Fin.default_eq_zero]
  rw [machine_zero stop (Tape.mk₁ input).head, trAux_halt stop _ _ _ rfl]
  simp only [Option.map_some, Tape.write_self]

theorem stop_terminal (input : List Bool) :
    TM0.step (machine stop) ⟨GraphPost.encode (n := 1) (none, (0 : Fin 1)), Tape.mk₁ input⟩ = none := by
  simp [TM0.step]

theorem stop_result (input : List Bool) :
    (⟨GraphPost.encode (n := 1) (none, (0 : Fin 1)), Tape.mk₁ input⟩ : TM0.Cfg Bool (Fin 3)) ∈
      StateTransition.eval (TM0.step (machine stop)) (TM0.init input) :=
  StateTransition.mem_eval.mpr ⟨Relation.ReflTransGen.single
    (by rw [stop_step]; exact rfl), stop_terminal input⟩

example (input : List Bool) : (Tape.mk₁ input).right₀ ∈ TM0.eval (machine stop) input :=
  Part.mem_map _ (stop_result input)

example (input : List Bool) : (TM0.eval (machine stop) input).Dom := by
  change (StateTransition.eval _ _).Dom
  exact Part.dom_iff_mem.mpr ⟨_, stop_result input⟩

-- The empty getter presentation needs neither nodes nor entries to be allocated.
def empty : Graph 0 0 0 where
  node := Fin.elim0
  entry := Fin.elim0
  below i := i.elim0
example : (asGraph empty).nodes.toArray.size = 0 := rfl
example : GraphPost.stateCount 0 0 = 1 := rfl

end LazyGraphFixtures

#eval IO.println "Lazy graph kernel fixtures passed"
