import Cryptids.Semantics.ChessFieldReverse
open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation
example : generated.states = 4742562 := by rw [generated_states]; decide +kernel
