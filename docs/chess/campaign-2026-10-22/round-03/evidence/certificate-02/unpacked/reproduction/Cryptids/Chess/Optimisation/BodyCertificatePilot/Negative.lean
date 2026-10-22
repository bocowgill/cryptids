module
import Cryptids.Chess.Optimisation.BodyCertificatePilot.Rows64
open Lean Elab Term Meta Command Turing ConjectureMachines
-- Deliberately false: the accepted entry's symbol-zero row is defined.
-- A reflexivity term at the actual row cannot prove it equals none.
elab "submit_false_body_row" : command => do
  liftTermElabM do
    let lhs ← elabTerm (← `(term|
      Chess.Optimisation.FieldSelective.body.toMachine.transition
        (0 : Fin 573802) (0 : Fin 2))) none
    let rhs ← elabTerm (← `(term| (none : Option (Fin 2 × Dir × Fin 573802)))) none
    let proposition ← mkEq lhs rhs
    let falseProof ← mkEqRefl lhs
    addDecl (.thmDecl {name := `Chess.Optimisation.BodyCertificatePilot.deliberately_false_row,
      levelParams := [], type := proposition, value := falseProof}) true
submit_false_body_row
