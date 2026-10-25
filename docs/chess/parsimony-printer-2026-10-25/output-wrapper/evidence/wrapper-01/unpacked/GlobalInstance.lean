import AllWords

open Turing ConjectureMachines
open ConjectureMachines.Compilation
open Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false

def word (i : Nat) : List (Fin 2) :=
  Parsimony.Packet.encode 13 (Parsimony.Data.wordAt 13359 values i).val

theorem global_tick (i : Nat) (bound : i ≤ 13359) (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data i L)
      (Parsimony.Global.boundary data (i + 1) (ListBlank.append (word i) L)) := by
  apply Parsimony.Global.tick (model values) data 13359 13 (row_more values)
    (fun j ↦ (Parsimony.Data.wordAt 13359 values j).val)
  · intro j upper
    simpa only [values, show (2 : Nat) ^ 13 = 8192 by decide +kernel]
      using words_bound raw j
  · intro j upper left right
    exact allWordsIndexed ⟨j, by omega⟩ left right
  · exact bound

theorem global_iteration (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data 0 L)
      (Parsimony.Global.boundary data 13360
        (ListBlank.append (Parsimony.Global.written word 13360) L)) :=
  Parsimony.Global.iterate (model values) data 13359 word global_tick 13360 (by omega) L

def positiveEnd : Fin 13546 := stateOf 13506

theorem values_size : values.size = 13360 := by
  simp only [values, Array.size_map, raw_size]

theorem final_one : (model values).transition exit 1 =
    some (0, .left, positiveEnd) := by
  rw [static_eq values #[] exit 1 (by decide +kernel)]
  decide +kernel

theorem global_terminated (L : ListBlank (Fin 2)) :
    Parsimony.Common.Runs (model values) (Parsimony.Global.boundary data 0 L)
      ⟨positiveEnd, Tape.mk'
        (O 13359 ((ListBlank.append (Parsimony.Global.written word 13360) L).cons 0))
        Parsimony.Global.blank⟩ :=
  (global_iteration L).trans
    (Parsimony.Global.finish_left (model values) data exit positiveEnd 13359
      (row_more values) (row_last values) final_one _)

end ParsimonyComposed

#print axioms ParsimonyComposed.global_iteration
#print axioms ParsimonyComposed.global_terminated
