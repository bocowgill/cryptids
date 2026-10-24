module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericSourceCore
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_source_target" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.NumericSourceCorePilot.halt_paid_target
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected source-target equality"
    let args := equality.getAppArgs
    let proposition ← mkEq args[1]! (mkNatLit 1)
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_numeric_source_target
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_false_numeric_source_target
