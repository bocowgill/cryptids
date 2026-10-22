import Cryptids.Semantics.ChessFieldReverse
open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation
example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel
