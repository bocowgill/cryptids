import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : generated.states = 45065962 := by rw [generated_states]; decide +kernel
