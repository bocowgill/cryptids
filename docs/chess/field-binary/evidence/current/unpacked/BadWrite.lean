import Cryptids.Compilation.FieldBinary.Pilot
open ConjectureMachines.Compilation.FieldBinary
example (tape : Turing.Tape Bit) : (written 0 (1, 0, 0) tape).nth 0 = 0 := by rw [written_nth]; norm_num
