module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache476Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache476Pilot
theorem checked_41591_167 : validate cache_41591_167 41591 =
    some 41758 := by
  decide +kernel
theorem checked_41758_168 : validate cache_41758_168 41758 =
    some 41926 := by
  decide +kernel
theorem checked_41591_335 : validate cache_41591_335 41591 =
    some 41926 := by
  exact validate_branch 167 cache_41591_167 cache_41758_168
    41591 41758 41926
    checked_41591_167 rfl checked_41758_168
theorem checked_41926_167 : validate cache_41926_167 41926 =
    some 42093 := by
  decide +kernel
theorem checked_42093_168 : validate cache_42093_168 42093 =
    some 42261 := by
  decide +kernel
theorem checked_41926_335 : validate cache_41926_335 41926 =
    some 42261 := by
  exact validate_branch 167 cache_41926_167 cache_42093_168
    41926 42093 42261
    checked_41926_167 rfl checked_42093_168
theorem checked_41591_670 : validate cache_41591_670 41591 =
    some 42261 := by
  exact validate_branch 335 cache_41591_335 cache_41926_335
    41591 41926 42261
    checked_41591_335 rfl checked_41926_335

theorem checked : validate cache 41591 = some 42261 := checked_41591_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 41591 42261 checked
  omega

theorem within_body : 42261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 41591 42261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 41591 42261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 41591 42261 address = observedPair address :=
  cachedPair_eq cache 41591 42261 checked address

end ProfileCache476Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 670"
