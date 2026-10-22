import Cryptids.Semantics.ChessSeed
open Chess.Optimisation Chess.Optimisation.FieldSeed
example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel
