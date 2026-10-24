module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Diagnostics

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
capture_cert in
theorem diagnostic_capture_smoke : True := True.intro
capture_cert in
run_cmd Lean.logInfo "Chess command diagnostics probe"

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Diagnostic command capture smoke checked"
