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
-- Check every raw leaf; no modulo conversion can conceal an out-of-range value.
def mapAllBelow : Balanced.RowTree Nat → Nat → Bool
  | .empty, _ => true
  | .leaf value, bound => decide (value < bound)
  | .branch _ left right, bound => mapAllBelow left bound && mapAllBelow right bound

theorem lookup_lt_of_allBelow (tree : Balanced.RowTree Nat) (bound fallback : Nat)
    (bounded : mapAllBelow tree bound = true) (fallback_lt : fallback < bound)
    (index : Nat) : tree.lookup index fallback < bound := by
  induction tree generalizing index with
  | empty => exact fallback_lt
  | leaf value =>
      have value_lt : value < bound := of_decide_eq_true bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact value_lt
      · exact fallback_lt
  | branch leftCount left right ihl ihr =>
      have both : mapAllBelow left bound = true ∧ mapAllBelow right bound = true := by
        simpa only [mapAllBelow, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

noncomputable def classMap (s : Fin 573802) : Fin 114487 :=
  Fin.ofNat 114487 (mapTree.lookup s.val 0)
def quotient : Machine 114487 2 := Balanced.ofTree quotientTree
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem map_count : mapTree.count = 573802 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem map_valid : mapTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem map_bounded : mapAllBelow mapTree 114487 = true := by decide +kernel
theorem map_lookup_lt (index : Nat) : mapTree.lookup index 0 < 114487 :=
  lookup_lt_of_allBelow mapTree 114487 0 map_bounded (by decide) index
theorem classMap_val (s : Fin 573802) : (classMap s).val = mapTree.lookup s.val 0 := by
  change (mapTree.lookup s.val 0) % 114487 = mapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (map_lookup_lt s.val)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_count : quotientTree.count = 114487 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem quotient_valid : quotientTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem entry : classMap 0 = 0 := by decide +kernel
def RowAt (s : Fin 573802) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete body certificate data checked"
