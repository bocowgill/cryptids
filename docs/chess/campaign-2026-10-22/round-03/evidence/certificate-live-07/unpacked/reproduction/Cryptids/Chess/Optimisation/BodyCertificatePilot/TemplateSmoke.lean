module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Loaders
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

set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapTree : Balanced.RowTree Nat :=
  load_body_map% "Cryptids/Chess/Optimisation/BodyCertificatePilot/smoke-map.txt"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientChunk_000000 : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 2))) :=
  load_balanced_rows% "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeQuotient-chunks/000000-0001.rows"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientChunk_000001 : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 2))) :=
  load_balanced_rows% "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeQuotient-chunks/000001-0001.rows"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientTree : Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 2))) :=
  (Balanced.RowTree.branch 1 smokeQuotientChunk_000000 smokeQuotientChunk_000001)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_count : smokeMapTree.count = 4 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_valid : smokeMapTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_bounded : mapAllBelow smokeMapTree 2 = true := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_quotient_count : smokeQuotientTree.count = 2 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_quotient_valid : smokeQuotientTree.WellFormed := by decide +kernel
theorem smoke_lookup_lt (index : Nat) : smokeMapTree.lookup index 0 < 2 :=
  lookup_lt_of_allBelow smokeMapTree 2 0 smoke_map_bounded (by decide) index
noncomputable def smokeClassMap (s : Fin 4) : Fin 2 := Fin.ofNat 2 (smokeMapTree.lookup s.val 0)
theorem smokeClassMap_val (s : Fin 4) :
    (smokeClassMap s).val = smokeMapTree.lookup s.val 0 := by
  change (smokeMapTree.lookup s.val 0) % 2 = smokeMapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (smoke_lookup_lt s.val)
def smokeQuotient : Machine 2 2 := Balanced.ofTree smokeQuotientTree
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_entry : smokeClassMap 0 = 0 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_row :
    smokeQuotient.transition (smokeClassMap 0) 0 = some (0, Dir.right, 1) ∧
    smokeQuotient.transition (smokeClassMap 1) 1 = some (1, Dir.left, 0) := by decide +kernel

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body certificate template smoke checked"
