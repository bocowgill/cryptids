import Cryptids.Compilation.FieldBinary.Pilot
open ConjectureMachines.Compilation.FieldBinary
example : (moveCell Turing.Dir.right).size = 13 := by decide +kernel
