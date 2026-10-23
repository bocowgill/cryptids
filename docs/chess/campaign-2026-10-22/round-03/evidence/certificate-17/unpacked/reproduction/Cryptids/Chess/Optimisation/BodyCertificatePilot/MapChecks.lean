module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapCount
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapValid
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapBounded

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
theorem map_lookup_lt (index : Nat) : mapTree.lookup index 0 < 114487 :=
  lookup_lt_of_allBelow mapTree 114487 0 map_bounded (by decide) index
theorem classMap_val (s : Fin 573802) : (classMap s).val = mapTree.lookup s.val 0 := by
  change (mapTree.lookup s.val 0) % 114487 = mapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (map_lookup_lt s.val)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem entry : classMap 0 = 0 := by decide +kernel

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body class map checks passed"
