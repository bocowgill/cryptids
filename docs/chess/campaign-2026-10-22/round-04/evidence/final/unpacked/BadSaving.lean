import Cryptids.Semantics.ChessTableSeed
open Chess.Optimisation Chess.Optimisation.FieldTableSeed
example : FieldSeed.generated.states - generated.states = 228833 := by rw [FieldSeed.generated_states, generated_states]; decide +kernel
