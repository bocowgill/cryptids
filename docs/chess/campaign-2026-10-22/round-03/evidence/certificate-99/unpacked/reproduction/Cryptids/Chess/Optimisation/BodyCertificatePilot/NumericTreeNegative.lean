module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericTree
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_annotation" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.NumericTreePilot.halt_count
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected annotation equality"
    let args := equality.getAppArgs
    let proposition ← mkEq args[1]! (mkNatLit 2)
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_numeric_annotation
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_false_numeric_annotation
