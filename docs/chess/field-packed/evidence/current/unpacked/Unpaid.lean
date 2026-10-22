import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel
