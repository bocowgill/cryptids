module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericControl
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_false_numeric_rank" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.NumericControlPilot.rank_three
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected rank equality"
    let args := equality.getAppArgs
    let wrong := mkApp2 (Lean.mkConst ``Option.some [Level.zero])
      (Lean.mkConst ``Nat) (mkNatLit 2)
    let proposition ← mkEq args[1]! wrong
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_numeric_rank
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_false_numeric_rank
