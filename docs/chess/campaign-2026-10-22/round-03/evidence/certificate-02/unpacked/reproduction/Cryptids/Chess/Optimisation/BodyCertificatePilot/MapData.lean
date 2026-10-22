module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Loaders

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxHeartbeats 0
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
def mapTree : Balanced.RowTree (Fin 114487) :=
  load_body_map% "Cryptids/Chess/Optimisation/BodyCertificatePilot/class-map.txt"

audit_body_roots% [Chess.Optimisation.BodyCertificatePilot.mapTree]
end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map loaded"
