module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.QuotientData

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
def quotient : Machine 114487 2 := packedMachine 114487 quotientTree
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_count : quotientTree.count = 114487 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_bounded :
    packedAllBounded quotientTree (4 * 114487) = true := by decide +kernel
theorem quotient_code_bound (state : Fin 114487) (bit : Fin 2) :
    packedCodeAt quotientTree state bit ≤ 4 * 114487 :=
  packed_code_bound quotientTree (4 * 114487) quotient_bounded state bit
theorem quotient_fidelity (state : Fin 114487) (bit : Fin 2) :
    packedEncode (quotient.transition state bit) = packedCodeAt quotientTree state bit :=
  packed_transition_fidelity 114487 quotientTree quotient_bounded state bit

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete packed quotient checks passed"
