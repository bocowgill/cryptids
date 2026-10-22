import Cryptids.Semantics.ChessSeed
open Chess.Optimisation Chess.Optimisation.FieldSeed
example : FieldSelective.generated.states - generated.states = 1413568 := by rw [FieldSelective.generated_states, generated_states]; decide +kernel
