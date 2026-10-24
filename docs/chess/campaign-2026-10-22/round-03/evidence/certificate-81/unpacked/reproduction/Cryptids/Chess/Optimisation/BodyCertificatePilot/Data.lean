module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapChecks
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.QuotientChecks

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body certificate data assembled"
