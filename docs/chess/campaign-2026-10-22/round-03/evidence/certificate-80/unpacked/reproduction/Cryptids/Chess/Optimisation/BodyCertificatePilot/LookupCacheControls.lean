module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache128

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCacheControlsPilot
theorem bad_class_rejected : checkCell 0 ⟨1, 426179, 426180⟩ = false := by
  decide +kernel
theorem bad_word_rejected : checkCell 0 ⟨0, 426180, 426180⟩ = false := by
  decide +kernel
end LookupCacheControlsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Cache class and word corruption rejected"
