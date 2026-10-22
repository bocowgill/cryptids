import Cryptids.Semantics.ChessFieldReverse
open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation
example : actions.size = 3675880 := by rw [prefix_states]; decide +kernel
