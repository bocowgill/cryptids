import Cryptids.Semantics.ChessFieldPacked
open Chess.Optimisation Chess.Optimisation.FieldPacked ConjectureMachines.Compilation
example : FieldPackedLayout.packed.nodes = 4139008 := by rw [FieldPackedLayout.packed_nodes]; decide +kernel
