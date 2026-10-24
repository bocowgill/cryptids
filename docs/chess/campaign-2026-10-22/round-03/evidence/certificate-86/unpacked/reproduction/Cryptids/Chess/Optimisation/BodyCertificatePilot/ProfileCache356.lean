module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache356Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace ProfileCache356Pilot
theorem checked_17231_70 : validate cache_17231_70 17231 =
    some 17301 := by
  decide +kernel

theorem checked : validate cache 17231 = some 17301 := checked_17231_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 17231 17301 checked
  omega

theorem within_body : 17301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 17231 17301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 17231 17301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 17231 17301 address = observedPair address :=
  cachedPair_eq cache 17231 17301 checked address

end ProfileCache356Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 70"
