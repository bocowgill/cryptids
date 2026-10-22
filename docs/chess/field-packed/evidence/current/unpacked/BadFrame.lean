import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : FieldBinary.updateCell (false, fun _ ↦ 0) 0 4 = (false, fun _ ↦ 4) := by decide +kernel
