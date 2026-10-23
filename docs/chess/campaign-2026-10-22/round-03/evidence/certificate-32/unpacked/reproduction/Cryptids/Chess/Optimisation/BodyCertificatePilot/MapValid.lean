module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapCount

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
theorem map_valid : mapTree.WellFormed := map_facts.2.1

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map caches checked"
