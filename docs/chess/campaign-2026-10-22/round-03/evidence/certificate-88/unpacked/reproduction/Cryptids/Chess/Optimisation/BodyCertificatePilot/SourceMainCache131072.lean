module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceMainCache131072Data

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceMainCache131072Pilot
theorem checked_131072_158 : validate cache_131072_158 131072 =
    some 131230 := by
  decide +kernel
theorem checked_131230_158 : validate cache_131230_158 131230 =
    some 131388 := by
  decide +kernel
theorem checked_131072_316 : validate cache_131072_316 131072 =
    some 131388 := by
  exact validate_branch 158 cache_131072_158 cache_131230_158
    131072 131230 131388
    checked_131072_158 rfl checked_131230_158
theorem checked_131388_158 : validate cache_131388_158 131388 =
    some 131546 := by
  decide +kernel
theorem checked_131546_158 : validate cache_131546_158 131546 =
    some 131704 := by
  decide +kernel
theorem checked_131388_316 : validate cache_131388_316 131388 =
    some 131704 := by
  exact validate_branch 158 cache_131388_158 cache_131546_158
    131388 131546 131704
    checked_131388_158 rfl checked_131546_158
theorem checked_131072_632 : validate cache_131072_632 131072 =
    some 131704 := by
  exact validate_branch 316 cache_131072_316 cache_131388_316
    131072 131388 131704
    checked_131072_316 rfl checked_131388_316
theorem checked_131704_158 : validate cache_131704_158 131704 =
    some 131862 := by
  decide +kernel
theorem checked_131862_158 : validate cache_131862_158 131862 =
    some 132020 := by
  decide +kernel
theorem checked_131704_316 : validate cache_131704_316 131704 =
    some 132020 := by
  exact validate_branch 158 cache_131704_158 cache_131862_158
    131704 131862 132020
    checked_131704_158 rfl checked_131862_158
theorem checked_132020_158 : validate cache_132020_158 132020 =
    some 132178 := by
  decide +kernel
theorem checked_132178_158 : validate cache_132178_158 132178 =
    some 132336 := by
  decide +kernel
theorem checked_132020_316 : validate cache_132020_316 132020 =
    some 132336 := by
  exact validate_branch 158 cache_132020_158 cache_132178_158
    132020 132178 132336
    checked_132020_158 rfl checked_132178_158
theorem checked_131704_632 : validate cache_131704_632 131704 =
    some 132336 := by
  exact validate_branch 316 cache_131704_316 cache_132020_316
    131704 132020 132336
    checked_131704_316 rfl checked_132020_316
theorem checked_131072_1264 : validate cache_131072_1264 131072 =
    some 132336 := by
  exact validate_branch 632 cache_131072_632 cache_131704_632
    131072 131704 132336
    checked_131072_632 rfl checked_131704_632
theorem checked_132336_158 : validate cache_132336_158 132336 =
    some 132494 := by
  decide +kernel
theorem checked_132494_158 : validate cache_132494_158 132494 =
    some 132652 := by
  decide +kernel
theorem checked_132336_316 : validate cache_132336_316 132336 =
    some 132652 := by
  exact validate_branch 158 cache_132336_158 cache_132494_158
    132336 132494 132652
    checked_132336_158 rfl checked_132494_158
theorem checked_132652_158 : validate cache_132652_158 132652 =
    some 132810 := by
  decide +kernel
theorem checked_132810_158 : validate cache_132810_158 132810 =
    some 132968 := by
  decide +kernel
theorem checked_132652_316 : validate cache_132652_316 132652 =
    some 132968 := by
  exact validate_branch 158 cache_132652_158 cache_132810_158
    132652 132810 132968
    checked_132652_158 rfl checked_132810_158
theorem checked_132336_632 : validate cache_132336_632 132336 =
    some 132968 := by
  exact validate_branch 316 cache_132336_316 cache_132652_316
    132336 132652 132968
    checked_132336_316 rfl checked_132652_316
theorem checked_132968_158 : validate cache_132968_158 132968 =
    some 133126 := by
  decide +kernel
theorem checked_133126_158 : validate cache_133126_158 133126 =
    some 133284 := by
  decide +kernel
theorem checked_132968_316 : validate cache_132968_316 132968 =
    some 133284 := by
  exact validate_branch 158 cache_132968_158 cache_133126_158
    132968 133126 133284
    checked_132968_158 rfl checked_133126_158
theorem checked_133284_158 : validate cache_133284_158 133284 =
    some 133442 := by
  decide +kernel
theorem checked_133442_159 : validate cache_133442_159 133442 =
    some 133601 := by
  decide +kernel
theorem checked_133284_317 : validate cache_133284_317 133284 =
    some 133601 := by
  exact validate_branch 158 cache_133284_158 cache_133442_159
    133284 133442 133601
    checked_133284_158 rfl checked_133442_159
theorem checked_132968_633 : validate cache_132968_633 132968 =
    some 133601 := by
  exact validate_branch 316 cache_132968_316 cache_133284_317
    132968 133284 133601
    checked_132968_316 rfl checked_133284_317
theorem checked_132336_1265 : validate cache_132336_1265 132336 =
    some 133601 := by
  exact validate_branch 632 cache_132336_632 cache_132968_633
    132336 132968 133601
    checked_132336_632 rfl checked_132968_633
theorem checked_131072_2529 : validate cache_131072_2529 131072 =
    some 133601 := by
  exact validate_branch 1264 cache_131072_1264 cache_132336_1265
    131072 132336 133601
    checked_131072_1264 rfl checked_132336_1265

theorem checked : validate cache 131072 = some 133601 := checked_131072_2529

theorem count_exact : cache.count = 2529 := by
  have extent := validate_extent cache 131072 133601 checked
  omega

theorem within_body : 133601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131072 133601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131072 133601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131072 133601 address = observedPair address :=
  cachedPair_eq cache 131072 133601 checked address

end SourceMainCache131072Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric observation cache fidelity checked: 2529"
