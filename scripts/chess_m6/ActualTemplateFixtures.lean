import Cryptids.Chess.Compilation.Templates

open Turing PartrecToTM2
open ConjectureMachines.Compilation
open Chess.Compilation.Templates

set_option maxRecDepth 16384

example : primitiveRows.count = 4042 := primitiveRows_count
example : primitiveRows.WellFormed := primitiveRows_wellFormed
example (q : SourceLabel) : primitiveMachine q = SharedModel.machine q := primitiveMachine_eq q
example : writeData.count = 270 := writeData_count
example : readData.count = 1734 := readData_count
example : moveData.count = 1188 := moveData_count
example : writePC 0 = 278 ∧ writeTarget 0 = 277 := by decide
example : writePC 269 = 2059 ∧ writeTarget 269 = 2057 := by decide
example : readPC 0 = 4 ∧ readPC 1733 = 4041 := by decide
example : movePC 0 = 277 ∧ movePC 1187 = 4040 := by decide
example : writeIndex 278 = some 0 ∧ writeIndex 277 = none := by decide
example (i : Fin 270) : writeIndex (writePC i) = some i := write_lookup i
example (i : Fin 1734) : readIndex (readPC i) = some i := read_lookup i
example (i : Fin 1188) : moveIndex (movePC i) = some i := move_lookup i
example : CodeBackend.symbolRank (alphabet 0) = 0 := symbolRank_unrank 0
example : CodeBackend.symbolRank (alphabet 624) = 624 := symbolRank_unrank 624
example : CodeBackend.symbolRank (alphabet 625) = 625 := symbolRank_unrank 625
example : CodeBackend.symbolRank (alphabet 1249) = 1249 := symbolRank_unrank 1249
example : stores 0 = none ∧ stores 4 = some Γ'.bit1 := by decide
example : stores.symm default = 0 := stores_symm_default
example : Fintype.card Label = 341542 := state_count
example : decode 0 = .normal (0 : SourceLabel) := initial
example (q : Label) : TM1Number.mapStmt decode (machine q) =
    Block.compilerFree CodeBackend.blockCode primitiveMachine (decode q) := rows q
example (k : K') (values : List Γ') :
    letI : Inhabited Λ' := ⟨Runtime.label .start⟩
    (TM1.eval machine (input k values)).Dom ↔ (TM2.eval Runtime.machine k values).Dom :=
  runtime_eval_dom k values

-- Changing a saved target cannot satisfy the literal write-row certificate.
example : ¬(∃ f : Symbol → Store → Symbol,
    primitiveMachine (writePC 0) = .write f (.goto fun _ _ ↦ (278 : SourceLabel))) := by
  rintro ⟨f, h⟩
  have bad : (277 : SourceLabel) = 278 := congrArg (fun l ↦ l default default)
    (TM1.Stmt.goto.inj (TM1.Stmt.write.inj h).2)
  exact (by decide : (277 : SourceLabel) ≠ 278) bad
