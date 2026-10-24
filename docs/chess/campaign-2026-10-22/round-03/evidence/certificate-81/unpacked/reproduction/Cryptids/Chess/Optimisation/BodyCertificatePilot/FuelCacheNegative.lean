module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FuelCache8192
public meta import Lean
public meta section
open Lean Elab Term Meta Command
elab "submit_wrong_fuel_extent" : command => do
  liftTermElabM do
    let name := `Chess.Optimisation.BodyCertificatePilot.FuelCache8192Pilot.checked
    let info ← getConstInfo name
    let equality ← whnf info.type
    unless equality.isAppOfArity ``Eq 3 do throwError "Expected fuel-check equality"
    let args := equality.getAppArgs
    let wrong := mkApp2 (Lean.mkConst ``Option.some [Level.zero])
      (Lean.mkConst ``Nat) (mkNatLit 8193)
    let proposition ← mkEq args[1]! wrong
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_fuel_extent
      levelParams := []
      type := proposition
      value := Lean.mkConst name
    }) true
submit_wrong_fuel_extent
