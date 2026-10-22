module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Loaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
def quotientTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 114487))) :=
  load_balanced_rows% "Cryptids/Chess/Optimisation/BodyCertificatePilot/quotient.rows"

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body quotient rows loaded"
