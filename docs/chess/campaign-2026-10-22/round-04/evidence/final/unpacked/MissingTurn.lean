import Cryptids.Semantics.ChessTableSeed
open Chess.Optimisation Chess.Optimisation.FieldTableSeed
example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel
