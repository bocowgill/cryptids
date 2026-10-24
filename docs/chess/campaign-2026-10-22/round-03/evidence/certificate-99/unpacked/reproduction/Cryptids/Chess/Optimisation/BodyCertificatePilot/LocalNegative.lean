module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalChunk
public meta import Lean
public meta section
open Lean Elab Term Meta Command

elab "submit_false_local_word" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.LocalChunkPilot.checked_anchor
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected checked equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Nat do throwError "Expected checked Nat word"
    let changed := mkApp (Lean.mkConst ``Nat.succ) args[2]!
    let proposition ← mkEq args[1]! changed
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_local_word
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_false_local_word
