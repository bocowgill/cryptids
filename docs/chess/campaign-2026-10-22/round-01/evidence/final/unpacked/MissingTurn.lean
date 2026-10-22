import Cryptids.Semantics.ChessFieldSelective
open Chess.Optimisation Chess.Optimisation.FieldSelective
example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel
