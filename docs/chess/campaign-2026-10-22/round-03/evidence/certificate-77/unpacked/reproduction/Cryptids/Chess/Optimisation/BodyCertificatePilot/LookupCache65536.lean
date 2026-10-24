module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache65536Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace LookupCache65536Pilot

theorem checked : validate cache 0 = some 65536 := by decide +kernel

theorem count_exact : cache.count = 65536 := by
  have extent := validate_extent cache 0 65536 checked
  simpa only [Nat.zero_add] using extent.symm

theorem within_body : 65536 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 0 65536 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 0 65536 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 0 65536 address = observedPair address :=
  cachedPair_eq cache 0 65536 checked address

end LookupCache65536Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 65536"
