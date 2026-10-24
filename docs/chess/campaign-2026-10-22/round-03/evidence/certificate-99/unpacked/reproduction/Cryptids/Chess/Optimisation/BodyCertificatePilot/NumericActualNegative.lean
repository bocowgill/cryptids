module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericActualProfile
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_actual_recipe" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.NumericActualProfilePilot.whole_numeric_445
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected checked recipe equality"
    let args := equality.getAppArgs
    unless args[0]!.isConstOf ``Bool do throwError "Expected Bool recipe"
    let proposition ← mkEq args[1]! (Lean.mkConst ``Bool.false)
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_numeric_actual_recipe
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_false_numeric_actual_recipe
