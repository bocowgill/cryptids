module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache445Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache445Pilot
theorem checked_34231_167 : validate cache_34231_167 34231 =
    some 34398 := by
  decide +kernel
theorem checked_34398_168 : validate cache_34398_168 34398 =
    some 34566 := by
  decide +kernel
theorem checked_34231_335 : validate cache_34231_335 34231 =
    some 34566 := by
  exact validate_branch 167 cache_34231_167 cache_34398_168
    34231 34398 34566
    checked_34231_167 rfl checked_34398_168
theorem checked_34566_167 : validate cache_34566_167 34566 =
    some 34733 := by
  decide +kernel
theorem checked_34733_168 : validate cache_34733_168 34733 =
    some 34901 := by
  decide +kernel
theorem checked_34566_335 : validate cache_34566_335 34566 =
    some 34901 := by
  exact validate_branch 167 cache_34566_167 cache_34733_168
    34566 34733 34901
    checked_34566_167 rfl checked_34733_168
theorem checked_34231_670 : validate cache_34231_670 34231 =
    some 34901 := by
  exact validate_branch 335 cache_34231_335 cache_34566_335
    34231 34566 34901
    checked_34231_335 rfl checked_34566_335

theorem checked : validate cache 34231 = some 34901 := checked_34231_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 34231 34901 checked
  omega

theorem within_body : 34901 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 34231 34901 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 34231 34901 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 34231 34901 address = observedPair address :=
  cachedPair_eq cache 34231 34901 checked address

end ProfileCache445Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 670"
