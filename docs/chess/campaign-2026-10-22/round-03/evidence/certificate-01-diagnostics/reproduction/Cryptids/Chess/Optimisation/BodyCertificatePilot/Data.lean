module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.MapData
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.QuotientData
public import Cryptids.Chess.Optimisation.FieldSelective
public import Cryptids.Compilation.LocalCertificate

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxHeartbeats 0
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
def classMap (s : Fin 573802) : Fin 114487 := mapTree.lookup s.val 0
def quotient : Machine 114487 2 := Balanced.ofTree quotientTree
theorem map_count : mapTree.count = 573802 := by decide +kernel
theorem map_valid : mapTree.WellFormed := by decide +kernel
theorem quotient_count : quotientTree.count = 114487 := by decide +kernel
theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
theorem entry : classMap 0 = 0 := by decide +kernel
def RowAt (s : Fin 573802) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b

audit_body_roots% [Chess.Optimisation.BodyCertificatePilot.map_count, Chess.Optimisation.BodyCertificatePilot.map_valid, Chess.Optimisation.BodyCertificatePilot.quotient_count, Chess.Optimisation.BodyCertificatePilot.quotient_valid, Chess.Optimisation.BodyCertificatePilot.entry, Chess.Optimisation.BodyCertificatePilot.RowAt]
end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body certificate data checked"
