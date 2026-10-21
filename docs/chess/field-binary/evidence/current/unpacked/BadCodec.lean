import Cryptids.Compilation.FieldBinary.Pilot
open ConjectureMachines.Compilation.FieldBinary
example : decodeWord (1, 0, 1) = 1 := by decide +kernel
