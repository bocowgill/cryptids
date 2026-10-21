import Cryptids.Optimisation.ReverseInit
open Turing ConjectureMachines.Compilation
open ConjectureMachines.Optimisation
def proposed (bits : List (Fin 2)) : List Init.Instruction := ((ReverseInit.writes bits .right) ++ (ReverseInit.moves .left (bits).length))
example (bits : List (Fin 2)) :
    Init.executeList (proposed bits) (Tape.mk₁ []) = Tape.mk₁ bits := by
  first
  | simpa [proposed] using ReverseInit.reverse_correct bits
  | simpa [proposed] using ReverseInit.forward_correct bits
theorem proposed_length (bits : List (Fin 2)) :
    (proposed bits).length = (bits.length + bits.length) := by
  simp [proposed, ReverseInit.writes, ReverseInit.moves]
example (bits : List (Fin 2)) (size : bits.length = 1555180) :
    (proposed bits).length = 3110360 := by
  rw [proposed_length, size]
