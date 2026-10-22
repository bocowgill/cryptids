module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapData
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.QuotientData
public import Cryptids.Chess.Optimisation.FieldSelective
public import Cryptids.Compilation.LocalCertificate

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
def classMap (s : Fin 573802) : Fin 114487 := mapTree.lookup s.val 0
def quotient : Machine 114487 2 := Balanced.ofTree quotientTree
-- Each kernel computation remains bounded by the driver's wall and RSS limits.
set_option maxHeartbeats 0 in
theorem map_count : mapTree.count = 573802 := by decide +kernel
set_option maxHeartbeats 0 in
theorem map_valid : mapTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
theorem quotient_count : quotientTree.count = 114487 := by decide +kernel
set_option maxHeartbeats 0 in
theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
theorem entry : classMap 0 = 0 := by decide +kernel
def RowAt (s : Fin 573802) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body certificate data checked"
