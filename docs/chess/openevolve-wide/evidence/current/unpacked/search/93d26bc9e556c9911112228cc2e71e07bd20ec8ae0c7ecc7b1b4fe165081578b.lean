import Cryptids.Optimisation.ReverseInit
open Turing ConjectureMachines.Compilation
open ConjectureMachines.Optimisation
def proposed (bits : List (Fin 2)) : List Init.Instruction := ((ReverseInit.writes (bits).reverse .left) ++ (ReverseInit.moves .right 1))
example (bits : List (Fin 2)) :
    Init.executeList (proposed bits) (Tape.mk₁ []) = Tape.mk₁ bits := by
  simpa [proposed] using ReverseInit.reverse_correct bits
theorem proposed_length (bits : List (Fin 2)) :
    (proposed bits).length = (bits.length + 1) := by
  simp [proposed, ReverseInit.writes, ReverseInit.moves]
example (bits : List (Fin 2)) (size : bits.length = 1555180) :
    (proposed bits).length = 1555181 := by
  rw [proposed_length, size]
