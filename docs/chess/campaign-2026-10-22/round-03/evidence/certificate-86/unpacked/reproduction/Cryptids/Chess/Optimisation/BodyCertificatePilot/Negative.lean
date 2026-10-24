module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Rows64
public meta import Lean

public meta section
open Lean Elab Term Meta Command Turing ConjectureMachines
set_option Elab.async false
-- Deliberately false: the accepted entry's symbol-zero row is defined.
-- A checked actual-row theorem with an explicit some RHS cannot prove none.
elab "submit_false_body_row" : command => do
  liftTermElabM do
    let lhs ← elabTerm (← `(term|
      Chess.Optimisation.FieldSelective.body.toMachine.transition
        (0 : Fin 573802) (0 : Fin 2))) none
    let rhs ← elabTerm (← `(term| (none : Option (Fin 2 × Dir × Fin 573802)))) none
    synthesizeSyntheticMVarsNoPostponing
    let proposition ← instantiateMVars (← mkEq lhs rhs)
    let falseProof :=
      Lean.mkConst `Chess.Optimisation.BodyCertificatePilot.Sample64.actual_0_0
    Lean.addDecl (.thmDecl {
      name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_row
      levelParams := []
      type := proposition
      value := falseProof
    }) true
submit_false_body_row
