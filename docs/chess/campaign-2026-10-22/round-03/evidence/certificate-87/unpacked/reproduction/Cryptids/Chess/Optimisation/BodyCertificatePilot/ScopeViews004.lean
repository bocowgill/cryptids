module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews004Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache444Pilot
theorem checked_33561_167 : validate cache_33561_167 33561 =
    some 33728 := by
  decide +kernel
theorem checked_33728_168 : validate cache_33728_168 33728 =
    some 33896 := by
  decide +kernel
theorem checked_33561_335 : validate cache_33561_335 33561 =
    some 33896 := by
  exact validate_branch 167 cache_33561_167 cache_33728_168
    33561 33728 33896
    checked_33561_167 rfl checked_33728_168
theorem checked_33896_167 : validate cache_33896_167 33896 =
    some 34063 := by
  decide +kernel
theorem checked_34063_168 : validate cache_34063_168 34063 =
    some 34231 := by
  decide +kernel
theorem checked_33896_335 : validate cache_33896_335 33896 =
    some 34231 := by
  exact validate_branch 167 cache_33896_167 cache_34063_168
    33896 34063 34231
    checked_33896_167 rfl checked_34063_168
theorem checked_33561_670 : validate cache_33561_670 33561 =
    some 34231 := by
  exact validate_branch 335 cache_33561_335 cache_33896_335
    33561 33896 34231
    checked_33561_335 rfl checked_33896_335

theorem checked : validate cache 33561 = some 34231 := checked_33561_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 33561 34231 checked
  omega

theorem within_body : 34231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 33561 34231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 33561 34231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 33561 34231 address = observedPair address :=
  cachedPair_eq cache 33561 34231 checked address

end SourceCache444Pilot
open LookupCachePilot
namespace SourceCache445Pilot
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

end SourceCache445Pilot
open LookupCachePilot
namespace SourceCache446Pilot
theorem checked_34901_5 : validate cache_34901_5 34901 =
    some 34906 := by
  decide +kernel

theorem checked : validate cache 34901 = some 34906 := checked_34901_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 34901 34906 checked
  omega

theorem within_body : 34906 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 34901 34906 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 34901 34906 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 34901 34906 address = observedPair address :=
  cachedPair_eq cache 34901 34906 checked address

end SourceCache446Pilot
open LookupCachePilot
namespace SourceCache447Pilot
theorem checked_34906_70 : validate cache_34906_70 34906 =
    some 34976 := by
  decide +kernel

theorem checked : validate cache 34906 = some 34976 := checked_34906_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 34906 34976 checked
  omega

theorem within_body : 34976 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 34906 34976 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 34906 34976 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 34906 34976 address = observedPair address :=
  cachedPair_eq cache 34906 34976 checked address

end SourceCache447Pilot
open LookupCachePilot
namespace SourceCache448Pilot
theorem checked_34976_167 : validate cache_34976_167 34976 =
    some 35143 := by
  decide +kernel
theorem checked_35143_168 : validate cache_35143_168 35143 =
    some 35311 := by
  decide +kernel
theorem checked_34976_335 : validate cache_34976_335 34976 =
    some 35311 := by
  exact validate_branch 167 cache_34976_167 cache_35143_168
    34976 35143 35311
    checked_34976_167 rfl checked_35143_168
theorem checked_35311_167 : validate cache_35311_167 35311 =
    some 35478 := by
  decide +kernel
theorem checked_35478_168 : validate cache_35478_168 35478 =
    some 35646 := by
  decide +kernel
theorem checked_35311_335 : validate cache_35311_335 35311 =
    some 35646 := by
  exact validate_branch 167 cache_35311_167 cache_35478_168
    35311 35478 35646
    checked_35311_167 rfl checked_35478_168
theorem checked_34976_670 : validate cache_34976_670 34976 =
    some 35646 := by
  exact validate_branch 335 cache_34976_335 cache_35311_335
    34976 35311 35646
    checked_34976_335 rfl checked_35311_335

theorem checked : validate cache 34976 = some 35646 := checked_34976_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 34976 35646 checked
  omega

theorem within_body : 35646 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 34976 35646 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 34976 35646 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 34976 35646 address = observedPair address :=
  cachedPair_eq cache 34976 35646 checked address

end SourceCache448Pilot
open LookupCachePilot
namespace SourceCache449Pilot
theorem checked_35646_5 : validate cache_35646_5 35646 =
    some 35651 := by
  decide +kernel

theorem checked : validate cache 35646 = some 35651 := checked_35646_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 35646 35651 checked
  omega

theorem within_body : 35651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 35646 35651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 35646 35651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 35646 35651 address = observedPair address :=
  cachedPair_eq cache 35646 35651 checked address

end SourceCache449Pilot
open LookupCachePilot
namespace SourceCache450Pilot
theorem checked_35651_10 : validate cache_35651_10 35651 =
    some 35661 := by
  decide +kernel

theorem checked : validate cache 35651 = some 35661 := checked_35651_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 35651 35661 checked
  omega

theorem within_body : 35661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 35651 35661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 35651 35661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 35651 35661 address = observedPair address :=
  cachedPair_eq cache 35651 35661 checked address

end SourceCache450Pilot
open LookupCachePilot
namespace SourceCache451Pilot
theorem checked_35661_185 : validate cache_35661_185 35661 =
    some 35846 := by
  decide +kernel
theorem checked_35846_185 : validate cache_35846_185 35846 =
    some 36031 := by
  decide +kernel
theorem checked_35661_370 : validate cache_35661_370 35661 =
    some 36031 := by
  exact validate_branch 185 cache_35661_185 cache_35846_185
    35661 35846 36031
    checked_35661_185 rfl checked_35846_185

theorem checked : validate cache 35661 = some 36031 := checked_35661_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 35661 36031 checked
  omega

theorem within_body : 36031 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 35661 36031 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 35661 36031 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 35661 36031 address = observedPair address :=
  cachedPair_eq cache 35661 36031 checked address

end SourceCache451Pilot
open LookupCachePilot
namespace SourceCache452Pilot
theorem checked_36031_220 : validate cache_36031_220 36031 =
    some 36251 := by
  decide +kernel
theorem checked_36251_220 : validate cache_36251_220 36251 =
    some 36471 := by
  decide +kernel
theorem checked_36031_440 : validate cache_36031_440 36031 =
    some 36471 := by
  exact validate_branch 220 cache_36031_220 cache_36251_220
    36031 36251 36471
    checked_36031_220 rfl checked_36251_220

theorem checked : validate cache 36031 = some 36471 := checked_36031_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 36031 36471 checked
  omega

theorem within_body : 36471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36031 36471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36031 36471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36031 36471 address = observedPair address :=
  cachedPair_eq cache 36031 36471 checked address

end SourceCache452Pilot
open LookupCachePilot
namespace SourceCache453Pilot
theorem checked_36471_70 : validate cache_36471_70 36471 =
    some 36541 := by
  decide +kernel

theorem checked : validate cache 36471 = some 36541 := checked_36471_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 36471 36541 checked
  omega

theorem within_body : 36541 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36471 36541 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36471 36541 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36471 36541 address = observedPair address :=
  cachedPair_eq cache 36471 36541 checked address

end SourceCache453Pilot
open LookupCachePilot
namespace SourceCache454Pilot
theorem checked_36541_195 : validate cache_36541_195 36541 =
    some 36736 := by
  decide +kernel

theorem checked : validate cache 36541 = some 36736 := checked_36541_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 36541 36736 checked
  omega

theorem within_body : 36736 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36541 36736 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36541 36736 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36541 36736 address = observedPair address :=
  cachedPair_eq cache 36541 36736 checked address

end SourceCache454Pilot
open LookupCachePilot
namespace SourceCache455Pilot
theorem checked_36736_70 : validate cache_36736_70 36736 =
    some 36806 := by
  decide +kernel

theorem checked : validate cache 36736 = some 36806 := checked_36736_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 36736 36806 checked
  omega

theorem within_body : 36806 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36736 36806 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36736 36806 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36736 36806 address = observedPair address :=
  cachedPair_eq cache 36736 36806 checked address

end SourceCache455Pilot
open LookupCachePilot
namespace SourceCache456Pilot
theorem checked_36806_200 : validate cache_36806_200 36806 =
    some 37006 := by
  decide +kernel
theorem checked_37006_200 : validate cache_37006_200 37006 =
    some 37206 := by
  decide +kernel
theorem checked_36806_400 : validate cache_36806_400 36806 =
    some 37206 := by
  exact validate_branch 200 cache_36806_200 cache_37006_200
    36806 37006 37206
    checked_36806_200 rfl checked_37006_200

theorem checked : validate cache 36806 = some 37206 := checked_36806_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 36806 37206 checked
  omega

theorem within_body : 37206 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36806 37206 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36806 37206 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36806 37206 address = observedPair address :=
  cachedPair_eq cache 36806 37206 checked address

end SourceCache456Pilot
open LookupCachePilot
namespace SourceCache457Pilot
theorem checked_37206_5 : validate cache_37206_5 37206 =
    some 37211 := by
  decide +kernel

theorem checked : validate cache 37206 = some 37211 := checked_37206_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 37206 37211 checked
  omega

theorem within_body : 37211 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37206 37211 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37206 37211 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37206 37211 address = observedPair address :=
  cachedPair_eq cache 37206 37211 checked address

end SourceCache457Pilot
open LookupCachePilot
namespace SourceCache458Pilot
theorem checked_37211_70 : validate cache_37211_70 37211 =
    some 37281 := by
  decide +kernel

theorem checked : validate cache 37211 = some 37281 := checked_37211_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 37211 37281 checked
  omega

theorem within_body : 37281 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37211 37281 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37211 37281 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37211 37281 address = observedPair address :=
  cachedPair_eq cache 37211 37281 checked address

end SourceCache458Pilot
open LookupCachePilot
namespace SourceCache459Pilot
theorem checked_37281_185 : validate cache_37281_185 37281 =
    some 37466 := by
  decide +kernel
theorem checked_37466_185 : validate cache_37466_185 37466 =
    some 37651 := by
  decide +kernel
theorem checked_37281_370 : validate cache_37281_370 37281 =
    some 37651 := by
  exact validate_branch 185 cache_37281_185 cache_37466_185
    37281 37466 37651
    checked_37281_185 rfl checked_37466_185

theorem checked : validate cache 37281 = some 37651 := checked_37281_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 37281 37651 checked
  omega

theorem within_body : 37651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37281 37651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37281 37651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37281 37651 address = observedPair address :=
  cachedPair_eq cache 37281 37651 checked address

end SourceCache459Pilot
open LookupCachePilot
namespace SourceCache460Pilot
theorem checked_37651_5 : validate cache_37651_5 37651 =
    some 37656 := by
  decide +kernel

theorem checked : validate cache 37651 = some 37656 := checked_37651_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 37651 37656 checked
  omega

theorem within_body : 37656 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37651 37656 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37651 37656 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37651 37656 address = observedPair address :=
  cachedPair_eq cache 37651 37656 checked address

end SourceCache460Pilot
open LookupCachePilot
namespace SourceCache461Pilot
theorem checked_37656_70 : validate cache_37656_70 37656 =
    some 37726 := by
  decide +kernel

theorem checked : validate cache 37656 = some 37726 := checked_37656_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 37656 37726 checked
  omega

theorem within_body : 37726 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37656 37726 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37656 37726 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37656 37726 address = observedPair address :=
  cachedPair_eq cache 37656 37726 checked address

end SourceCache461Pilot
open LookupCachePilot
namespace SourceCache462Pilot
theorem checked_37726_200 : validate cache_37726_200 37726 =
    some 37926 := by
  decide +kernel
theorem checked_37926_200 : validate cache_37926_200 37926 =
    some 38126 := by
  decide +kernel
theorem checked_37726_400 : validate cache_37726_400 37726 =
    some 38126 := by
  exact validate_branch 200 cache_37726_200 cache_37926_200
    37726 37926 38126
    checked_37726_200 rfl checked_37926_200

theorem checked : validate cache 37726 = some 38126 := checked_37726_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 37726 38126 checked
  omega

theorem within_body : 38126 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 37726 38126 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 37726 38126 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 37726 38126 address = observedPair address :=
  cachedPair_eq cache 37726 38126 checked address

end SourceCache462Pilot
open LookupCachePilot
namespace SourceCache463Pilot
theorem checked_38126_5 : validate cache_38126_5 38126 =
    some 38131 := by
  decide +kernel

theorem checked : validate cache 38126 = some 38131 := checked_38126_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 38126 38131 checked
  omega

theorem within_body : 38131 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 38126 38131 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 38126 38131 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 38126 38131 address = observedPair address :=
  cachedPair_eq cache 38126 38131 checked address

end SourceCache463Pilot
open LookupCachePilot
namespace SourceCache464Pilot
theorem checked_38131_10 : validate cache_38131_10 38131 =
    some 38141 := by
  decide +kernel

theorem checked : validate cache 38131 = some 38141 := checked_38131_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 38131 38141 checked
  omega

theorem within_body : 38141 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 38131 38141 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 38131 38141 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 38131 38141 address = observedPair address :=
  cachedPair_eq cache 38131 38141 checked address

end SourceCache464Pilot
open LookupCachePilot
namespace SourceCache465Pilot
theorem checked_38141_130 : validate cache_38141_130 38141 =
    some 38271 := by
  decide +kernel
theorem checked_38271_130 : validate cache_38271_130 38271 =
    some 38401 := by
  decide +kernel
theorem checked_38141_260 : validate cache_38141_260 38141 =
    some 38401 := by
  exact validate_branch 130 cache_38141_130 cache_38271_130
    38141 38271 38401
    checked_38141_130 rfl checked_38271_130
theorem checked_38401_130 : validate cache_38401_130 38401 =
    some 38531 := by
  decide +kernel
theorem checked_38531_130 : validate cache_38531_130 38531 =
    some 38661 := by
  decide +kernel
theorem checked_38401_260 : validate cache_38401_260 38401 =
    some 38661 := by
  exact validate_branch 130 cache_38401_130 cache_38531_130
    38401 38531 38661
    checked_38401_130 rfl checked_38531_130
theorem checked_38141_520 : validate cache_38141_520 38141 =
    some 38661 := by
  exact validate_branch 260 cache_38141_260 cache_38401_260
    38141 38401 38661
    checked_38141_260 rfl checked_38401_260

theorem checked : validate cache 38141 = some 38661 := checked_38141_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 38141 38661 checked
  omega

theorem within_body : 38661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 38141 38661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 38141 38661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 38141 38661 address = observedPair address :=
  cachedPair_eq cache 38141 38661 checked address

end SourceCache465Pilot
open LookupCachePilot
namespace SourceCache466Pilot
theorem checked_38661_143 : validate cache_38661_143 38661 =
    some 38804 := by
  decide +kernel
theorem checked_38804_144 : validate cache_38804_144 38804 =
    some 38948 := by
  decide +kernel
theorem checked_38661_287 : validate cache_38661_287 38661 =
    some 38948 := by
  exact validate_branch 143 cache_38661_143 cache_38804_144
    38661 38804 38948
    checked_38661_143 rfl checked_38804_144
theorem checked_38948_144 : validate cache_38948_144 38948 =
    some 39092 := by
  decide +kernel
theorem checked_39092_144 : validate cache_39092_144 39092 =
    some 39236 := by
  decide +kernel
theorem checked_38948_288 : validate cache_38948_288 38948 =
    some 39236 := by
  exact validate_branch 144 cache_38948_144 cache_39092_144
    38948 39092 39236
    checked_38948_144 rfl checked_39092_144
theorem checked_38661_575 : validate cache_38661_575 38661 =
    some 39236 := by
  exact validate_branch 287 cache_38661_287 cache_38948_288
    38661 38948 39236
    checked_38661_287 rfl checked_38948_288

theorem checked : validate cache 38661 = some 39236 := checked_38661_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 38661 39236 checked
  omega

theorem within_body : 39236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 38661 39236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 38661 39236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 38661 39236 address = observedPair address :=
  cachedPair_eq cache 38661 39236 checked address

end SourceCache466Pilot
open LookupCachePilot
namespace SourceCache467Pilot
theorem checked_39236_70 : validate cache_39236_70 39236 =
    some 39306 := by
  decide +kernel

theorem checked : validate cache 39236 = some 39306 := checked_39236_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 39236 39306 checked
  omega

theorem within_body : 39306 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 39236 39306 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 39236 39306 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 39236 39306 address = observedPair address :=
  cachedPair_eq cache 39236 39306 checked address

end SourceCache467Pilot
open LookupCachePilot
namespace SourceCache468Pilot
theorem checked_39306_195 : validate cache_39306_195 39306 =
    some 39501 := by
  decide +kernel

theorem checked : validate cache 39306 = some 39501 := checked_39306_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 39306 39501 checked
  omega

theorem within_body : 39501 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 39306 39501 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 39306 39501 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 39306 39501 address = observedPair address :=
  cachedPair_eq cache 39306 39501 checked address

end SourceCache468Pilot
open LookupCachePilot
namespace SourceCache469Pilot
theorem checked_39501_70 : validate cache_39501_70 39501 =
    some 39571 := by
  decide +kernel

theorem checked : validate cache 39501 = some 39571 := checked_39501_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 39501 39571 checked
  omega

theorem within_body : 39571 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 39501 39571 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 39501 39571 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 39501 39571 address = observedPair address :=
  cachedPair_eq cache 39501 39571 checked address

end SourceCache469Pilot
open LookupCachePilot
namespace SourceCache470Pilot
theorem checked_39571_133 : validate cache_39571_133 39571 =
    some 39704 := by
  decide +kernel
theorem checked_39704_134 : validate cache_39704_134 39704 =
    some 39838 := by
  decide +kernel
theorem checked_39571_267 : validate cache_39571_267 39571 =
    some 39838 := by
  exact validate_branch 133 cache_39571_133 cache_39704_134
    39571 39704 39838
    checked_39571_133 rfl checked_39704_134
theorem checked_39838_134 : validate cache_39838_134 39838 =
    some 39972 := by
  decide +kernel
theorem checked_39972_134 : validate cache_39972_134 39972 =
    some 40106 := by
  decide +kernel
theorem checked_39838_268 : validate cache_39838_268 39838 =
    some 40106 := by
  exact validate_branch 134 cache_39838_134 cache_39972_134
    39838 39972 40106
    checked_39838_134 rfl checked_39972_134
theorem checked_39571_535 : validate cache_39571_535 39571 =
    some 40106 := by
  exact validate_branch 267 cache_39571_267 cache_39838_268
    39571 39838 40106
    checked_39571_267 rfl checked_39838_268

theorem checked : validate cache 39571 = some 40106 := checked_39571_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 39571 40106 checked
  omega

theorem within_body : 40106 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 39571 40106 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 39571 40106 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 39571 40106 address = observedPair address :=
  cachedPair_eq cache 39571 40106 checked address

end SourceCache470Pilot
open LookupCachePilot
namespace SourceCache471Pilot
theorem checked_40106_5 : validate cache_40106_5 40106 =
    some 40111 := by
  decide +kernel

theorem checked : validate cache 40106 = some 40111 := checked_40106_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 40106 40111 checked
  omega

theorem within_body : 40111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 40106 40111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 40106 40111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 40106 40111 address = observedPair address :=
  cachedPair_eq cache 40106 40111 checked address

end SourceCache471Pilot
open LookupCachePilot
namespace SourceCache472Pilot
theorem checked_40111_70 : validate cache_40111_70 40111 =
    some 40181 := by
  decide +kernel

theorem checked : validate cache 40111 = some 40181 := checked_40111_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 40111 40181 checked
  omega

theorem within_body : 40181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 40111 40181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 40111 40181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 40111 40181 address = observedPair address :=
  cachedPair_eq cache 40111 40181 checked address

end SourceCache472Pilot
open LookupCachePilot
namespace SourceCache473Pilot
theorem checked_40181_167 : validate cache_40181_167 40181 =
    some 40348 := by
  decide +kernel
theorem checked_40348_168 : validate cache_40348_168 40348 =
    some 40516 := by
  decide +kernel
theorem checked_40181_335 : validate cache_40181_335 40181 =
    some 40516 := by
  exact validate_branch 167 cache_40181_167 cache_40348_168
    40181 40348 40516
    checked_40181_167 rfl checked_40348_168
theorem checked_40516_167 : validate cache_40516_167 40516 =
    some 40683 := by
  decide +kernel
theorem checked_40683_168 : validate cache_40683_168 40683 =
    some 40851 := by
  decide +kernel
theorem checked_40516_335 : validate cache_40516_335 40516 =
    some 40851 := by
  exact validate_branch 167 cache_40516_167 cache_40683_168
    40516 40683 40851
    checked_40516_167 rfl checked_40683_168
theorem checked_40181_670 : validate cache_40181_670 40181 =
    some 40851 := by
  exact validate_branch 335 cache_40181_335 cache_40516_335
    40181 40516 40851
    checked_40181_335 rfl checked_40516_335

theorem checked : validate cache 40181 = some 40851 := checked_40181_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 40181 40851 checked
  omega

theorem within_body : 40851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 40181 40851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 40181 40851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 40181 40851 address = observedPair address :=
  cachedPair_eq cache 40181 40851 checked address

end SourceCache473Pilot
open LookupCachePilot
namespace SourceCache474Pilot
theorem checked_40851_70 : validate cache_40851_70 40851 =
    some 40921 := by
  decide +kernel

theorem checked : validate cache 40851 = some 40921 := checked_40851_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 40851 40921 checked
  omega

theorem within_body : 40921 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 40851 40921 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 40851 40921 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 40851 40921 address = observedPair address :=
  cachedPair_eq cache 40851 40921 checked address

end SourceCache474Pilot
open LookupCachePilot
namespace SourceCache475Pilot
theorem checked_40921_167 : validate cache_40921_167 40921 =
    some 41088 := by
  decide +kernel
theorem checked_41088_168 : validate cache_41088_168 41088 =
    some 41256 := by
  decide +kernel
theorem checked_40921_335 : validate cache_40921_335 40921 =
    some 41256 := by
  exact validate_branch 167 cache_40921_167 cache_41088_168
    40921 41088 41256
    checked_40921_167 rfl checked_41088_168
theorem checked_41256_167 : validate cache_41256_167 41256 =
    some 41423 := by
  decide +kernel
theorem checked_41423_168 : validate cache_41423_168 41423 =
    some 41591 := by
  decide +kernel
theorem checked_41256_335 : validate cache_41256_335 41256 =
    some 41591 := by
  exact validate_branch 167 cache_41256_167 cache_41423_168
    41256 41423 41591
    checked_41256_167 rfl checked_41423_168
theorem checked_40921_670 : validate cache_40921_670 40921 =
    some 41591 := by
  exact validate_branch 335 cache_40921_335 cache_41256_335
    40921 41256 41591
    checked_40921_335 rfl checked_41256_335

theorem checked : validate cache 40921 = some 41591 := checked_40921_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 40921 41591 checked
  omega

theorem within_body : 41591 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 40921 41591 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 40921 41591 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 40921 41591 address = observedPair address :=
  cachedPair_eq cache 40921 41591 checked address

end SourceCache475Pilot
open LookupCachePilot
namespace SourceCache476Pilot
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

end SourceCache476Pilot
open LookupCachePilot
namespace SourceCache477Pilot
theorem checked_42261_5 : validate cache_42261_5 42261 =
    some 42266 := by
  decide +kernel

theorem checked : validate cache 42261 = some 42266 := checked_42261_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 42261 42266 checked
  omega

theorem within_body : 42266 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 42261 42266 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 42261 42266 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 42261 42266 address = observedPair address :=
  cachedPair_eq cache 42261 42266 checked address

end SourceCache477Pilot
open LookupCachePilot
namespace SourceCache478Pilot
theorem checked_42266_70 : validate cache_42266_70 42266 =
    some 42336 := by
  decide +kernel

theorem checked : validate cache 42266 = some 42336 := checked_42266_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 42266 42336 checked
  omega

theorem within_body : 42336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 42266 42336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 42266 42336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 42266 42336 address = observedPair address :=
  cachedPair_eq cache 42266 42336 checked address

end SourceCache478Pilot
open LookupCachePilot
namespace SourceCache479Pilot
theorem checked_42336_167 : validate cache_42336_167 42336 =
    some 42503 := by
  decide +kernel
theorem checked_42503_168 : validate cache_42503_168 42503 =
    some 42671 := by
  decide +kernel
theorem checked_42336_335 : validate cache_42336_335 42336 =
    some 42671 := by
  exact validate_branch 167 cache_42336_167 cache_42503_168
    42336 42503 42671
    checked_42336_167 rfl checked_42503_168
theorem checked_42671_167 : validate cache_42671_167 42671 =
    some 42838 := by
  decide +kernel
theorem checked_42838_168 : validate cache_42838_168 42838 =
    some 43006 := by
  decide +kernel
theorem checked_42671_335 : validate cache_42671_335 42671 =
    some 43006 := by
  exact validate_branch 167 cache_42671_167 cache_42838_168
    42671 42838 43006
    checked_42671_167 rfl checked_42838_168
theorem checked_42336_670 : validate cache_42336_670 42336 =
    some 43006 := by
  exact validate_branch 335 cache_42336_335 cache_42671_335
    42336 42671 43006
    checked_42336_335 rfl checked_42671_335

theorem checked : validate cache 42336 = some 43006 := checked_42336_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 42336 43006 checked
  omega

theorem within_body : 43006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 42336 43006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 42336 43006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 42336 43006 address = observedPair address :=
  cachedPair_eq cache 42336 43006 checked address

end SourceCache479Pilot
open LookupCachePilot
namespace SourceCache480Pilot
theorem checked_43006_5 : validate cache_43006_5 43006 =
    some 43011 := by
  decide +kernel

theorem checked : validate cache 43006 = some 43011 := checked_43006_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 43006 43011 checked
  omega

theorem within_body : 43011 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43006 43011 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43006 43011 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43006 43011 address = observedPair address :=
  cachedPair_eq cache 43006 43011 checked address

end SourceCache480Pilot
open LookupCachePilot
namespace SourceCache481Pilot
theorem checked_43011_10 : validate cache_43011_10 43011 =
    some 43021 := by
  decide +kernel

theorem checked : validate cache 43011 = some 43021 := checked_43011_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 43011 43021 checked
  omega

theorem within_body : 43021 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43011 43021 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43011 43021 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43011 43021 address = observedPair address :=
  cachedPair_eq cache 43011 43021 checked address

end SourceCache481Pilot
open LookupCachePilot
namespace SourceCache482Pilot
theorem checked_43021_185 : validate cache_43021_185 43021 =
    some 43206 := by
  decide +kernel
theorem checked_43206_185 : validate cache_43206_185 43206 =
    some 43391 := by
  decide +kernel
theorem checked_43021_370 : validate cache_43021_370 43021 =
    some 43391 := by
  exact validate_branch 185 cache_43021_185 cache_43206_185
    43021 43206 43391
    checked_43021_185 rfl checked_43206_185

theorem checked : validate cache 43021 = some 43391 := checked_43021_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 43021 43391 checked
  omega

theorem within_body : 43391 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43021 43391 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43021 43391 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43021 43391 address = observedPair address :=
  cachedPair_eq cache 43021 43391 checked address

end SourceCache482Pilot
open LookupCachePilot
namespace SourceCache483Pilot
theorem checked_43391_220 : validate cache_43391_220 43391 =
    some 43611 := by
  decide +kernel
theorem checked_43611_220 : validate cache_43611_220 43611 =
    some 43831 := by
  decide +kernel
theorem checked_43391_440 : validate cache_43391_440 43391 =
    some 43831 := by
  exact validate_branch 220 cache_43391_220 cache_43611_220
    43391 43611 43831
    checked_43391_220 rfl checked_43611_220

theorem checked : validate cache 43391 = some 43831 := checked_43391_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 43391 43831 checked
  omega

theorem within_body : 43831 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43391 43831 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43391 43831 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43391 43831 address = observedPair address :=
  cachedPair_eq cache 43391 43831 checked address

end SourceCache483Pilot
open LookupCachePilot
namespace SourceCache484Pilot
theorem checked_43831_70 : validate cache_43831_70 43831 =
    some 43901 := by
  decide +kernel

theorem checked : validate cache 43831 = some 43901 := checked_43831_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 43831 43901 checked
  omega

theorem within_body : 43901 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43831 43901 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43831 43901 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43831 43901 address = observedPair address :=
  cachedPair_eq cache 43831 43901 checked address

end SourceCache484Pilot
open LookupCachePilot
namespace SourceCache485Pilot
theorem checked_43901_195 : validate cache_43901_195 43901 =
    some 44096 := by
  decide +kernel

theorem checked : validate cache 43901 = some 44096 := checked_43901_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 43901 44096 checked
  omega

theorem within_body : 44096 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 43901 44096 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 43901 44096 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 43901 44096 address = observedPair address :=
  cachedPair_eq cache 43901 44096 checked address

end SourceCache485Pilot
open LookupCachePilot
namespace SourceCache486Pilot
theorem checked_44096_70 : validate cache_44096_70 44096 =
    some 44166 := by
  decide +kernel

theorem checked : validate cache 44096 = some 44166 := checked_44096_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 44096 44166 checked
  omega

theorem within_body : 44166 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 44096 44166 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 44096 44166 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 44096 44166 address = observedPair address :=
  cachedPair_eq cache 44096 44166 checked address

end SourceCache486Pilot
open LookupCachePilot
namespace SourceCache487Pilot
theorem checked_44166_200 : validate cache_44166_200 44166 =
    some 44366 := by
  decide +kernel
theorem checked_44366_200 : validate cache_44366_200 44366 =
    some 44566 := by
  decide +kernel
theorem checked_44166_400 : validate cache_44166_400 44166 =
    some 44566 := by
  exact validate_branch 200 cache_44166_200 cache_44366_200
    44166 44366 44566
    checked_44166_200 rfl checked_44366_200

theorem checked : validate cache 44166 = some 44566 := checked_44166_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 44166 44566 checked
  omega

theorem within_body : 44566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 44166 44566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 44166 44566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 44166 44566 address = observedPair address :=
  cachedPair_eq cache 44166 44566 checked address

end SourceCache487Pilot
open LookupCachePilot
namespace SourceCache488Pilot
theorem checked_44566_5 : validate cache_44566_5 44566 =
    some 44571 := by
  decide +kernel

theorem checked : validate cache 44566 = some 44571 := checked_44566_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 44566 44571 checked
  omega

theorem within_body : 44571 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 44566 44571 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 44566 44571 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 44566 44571 address = observedPair address :=
  cachedPair_eq cache 44566 44571 checked address

end SourceCache488Pilot
open LookupCachePilot
namespace SourceCache489Pilot
theorem checked_44571_70 : validate cache_44571_70 44571 =
    some 44641 := by
  decide +kernel

theorem checked : validate cache 44571 = some 44641 := checked_44571_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 44571 44641 checked
  omega

theorem within_body : 44641 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 44571 44641 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 44571 44641 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 44571 44641 address = observedPair address :=
  cachedPair_eq cache 44571 44641 checked address

end SourceCache489Pilot
open LookupCachePilot
namespace SourceCache490Pilot
theorem checked_44641_185 : validate cache_44641_185 44641 =
    some 44826 := by
  decide +kernel
theorem checked_44826_185 : validate cache_44826_185 44826 =
    some 45011 := by
  decide +kernel
theorem checked_44641_370 : validate cache_44641_370 44641 =
    some 45011 := by
  exact validate_branch 185 cache_44641_185 cache_44826_185
    44641 44826 45011
    checked_44641_185 rfl checked_44826_185

theorem checked : validate cache 44641 = some 45011 := checked_44641_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 44641 45011 checked
  omega

theorem within_body : 45011 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 44641 45011 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 44641 45011 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 44641 45011 address = observedPair address :=
  cachedPair_eq cache 44641 45011 checked address

end SourceCache490Pilot
open LookupCachePilot
namespace SourceCache491Pilot
theorem checked_45011_5 : validate cache_45011_5 45011 =
    some 45016 := by
  decide +kernel

theorem checked : validate cache 45011 = some 45016 := checked_45011_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 45011 45016 checked
  omega

theorem within_body : 45016 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45011 45016 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45011 45016 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45011 45016 address = observedPair address :=
  cachedPair_eq cache 45011 45016 checked address

end SourceCache491Pilot
open LookupCachePilot
namespace SourceCache492Pilot
theorem checked_45016_70 : validate cache_45016_70 45016 =
    some 45086 := by
  decide +kernel

theorem checked : validate cache 45016 = some 45086 := checked_45016_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 45016 45086 checked
  omega

theorem within_body : 45086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45016 45086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45016 45086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45016 45086 address = observedPair address :=
  cachedPair_eq cache 45016 45086 checked address

end SourceCache492Pilot
open LookupCachePilot
namespace SourceCache493Pilot
theorem checked_45086_200 : validate cache_45086_200 45086 =
    some 45286 := by
  decide +kernel
theorem checked_45286_200 : validate cache_45286_200 45286 =
    some 45486 := by
  decide +kernel
theorem checked_45086_400 : validate cache_45086_400 45086 =
    some 45486 := by
  exact validate_branch 200 cache_45086_200 cache_45286_200
    45086 45286 45486
    checked_45086_200 rfl checked_45286_200

theorem checked : validate cache 45086 = some 45486 := checked_45086_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 45086 45486 checked
  omega

theorem within_body : 45486 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45086 45486 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45086 45486 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45086 45486 address = observedPair address :=
  cachedPair_eq cache 45086 45486 checked address

end SourceCache493Pilot
open LookupCachePilot
namespace SourceCache494Pilot
theorem checked_45486_5 : validate cache_45486_5 45486 =
    some 45491 := by
  decide +kernel

theorem checked : validate cache 45486 = some 45491 := checked_45486_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 45486 45491 checked
  omega

theorem within_body : 45491 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45486 45491 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45486 45491 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45486 45491 address = observedPair address :=
  cachedPair_eq cache 45486 45491 checked address

end SourceCache494Pilot
open LookupCachePilot
namespace SourceCache495Pilot
theorem checked_45491_10 : validate cache_45491_10 45491 =
    some 45501 := by
  decide +kernel

theorem checked : validate cache 45491 = some 45501 := checked_45491_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 45491 45501 checked
  omega

theorem within_body : 45501 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45491 45501 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45491 45501 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45491 45501 address = observedPair address :=
  cachedPair_eq cache 45491 45501 checked address

end SourceCache495Pilot
open LookupCachePilot
namespace SourceCache496Pilot
theorem checked_45501_130 : validate cache_45501_130 45501 =
    some 45631 := by
  decide +kernel
theorem checked_45631_130 : validate cache_45631_130 45631 =
    some 45761 := by
  decide +kernel
theorem checked_45501_260 : validate cache_45501_260 45501 =
    some 45761 := by
  exact validate_branch 130 cache_45501_130 cache_45631_130
    45501 45631 45761
    checked_45501_130 rfl checked_45631_130
theorem checked_45761_130 : validate cache_45761_130 45761 =
    some 45891 := by
  decide +kernel
theorem checked_45891_130 : validate cache_45891_130 45891 =
    some 46021 := by
  decide +kernel
theorem checked_45761_260 : validate cache_45761_260 45761 =
    some 46021 := by
  exact validate_branch 130 cache_45761_130 cache_45891_130
    45761 45891 46021
    checked_45761_130 rfl checked_45891_130
theorem checked_45501_520 : validate cache_45501_520 45501 =
    some 46021 := by
  exact validate_branch 260 cache_45501_260 cache_45761_260
    45501 45761 46021
    checked_45501_260 rfl checked_45761_260

theorem checked : validate cache 45501 = some 46021 := checked_45501_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 45501 46021 checked
  omega

theorem within_body : 46021 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 45501 46021 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 45501 46021 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 45501 46021 address = observedPair address :=
  cachedPair_eq cache 45501 46021 checked address

end SourceCache496Pilot
open LookupCachePilot
namespace SourceCache497Pilot
theorem checked_46021_143 : validate cache_46021_143 46021 =
    some 46164 := by
  decide +kernel
theorem checked_46164_144 : validate cache_46164_144 46164 =
    some 46308 := by
  decide +kernel
theorem checked_46021_287 : validate cache_46021_287 46021 =
    some 46308 := by
  exact validate_branch 143 cache_46021_143 cache_46164_144
    46021 46164 46308
    checked_46021_143 rfl checked_46164_144
theorem checked_46308_144 : validate cache_46308_144 46308 =
    some 46452 := by
  decide +kernel
theorem checked_46452_144 : validate cache_46452_144 46452 =
    some 46596 := by
  decide +kernel
theorem checked_46308_288 : validate cache_46308_288 46308 =
    some 46596 := by
  exact validate_branch 144 cache_46308_144 cache_46452_144
    46308 46452 46596
    checked_46308_144 rfl checked_46452_144
theorem checked_46021_575 : validate cache_46021_575 46021 =
    some 46596 := by
  exact validate_branch 287 cache_46021_287 cache_46308_288
    46021 46308 46596
    checked_46021_287 rfl checked_46308_288

theorem checked : validate cache 46021 = some 46596 := checked_46021_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 46021 46596 checked
  omega

theorem within_body : 46596 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46021 46596 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46021 46596 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46021 46596 address = observedPair address :=
  cachedPair_eq cache 46021 46596 checked address

end SourceCache497Pilot
open LookupCachePilot
namespace SourceCache498Pilot
theorem checked_46596_70 : validate cache_46596_70 46596 =
    some 46666 := by
  decide +kernel

theorem checked : validate cache 46596 = some 46666 := checked_46596_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 46596 46666 checked
  omega

theorem within_body : 46666 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46596 46666 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46596 46666 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46596 46666 address = observedPair address :=
  cachedPair_eq cache 46596 46666 checked address

end SourceCache498Pilot
open LookupCachePilot
namespace SourceCache499Pilot
theorem checked_46666_195 : validate cache_46666_195 46666 =
    some 46861 := by
  decide +kernel

theorem checked : validate cache 46666 = some 46861 := checked_46666_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 46666 46861 checked
  omega

theorem within_body : 46861 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46666 46861 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46666 46861 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46666 46861 address = observedPair address :=
  cachedPair_eq cache 46666 46861 checked address

end SourceCache499Pilot
open LookupCachePilot
namespace SourceCache500Pilot
theorem checked_46861_70 : validate cache_46861_70 46861 =
    some 46931 := by
  decide +kernel

theorem checked : validate cache 46861 = some 46931 := checked_46861_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 46861 46931 checked
  omega

theorem within_body : 46931 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46861 46931 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46861 46931 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46861 46931 address = observedPair address :=
  cachedPair_eq cache 46861 46931 checked address

end SourceCache500Pilot
open LookupCachePilot
namespace SourceCache501Pilot
theorem checked_46931_133 : validate cache_46931_133 46931 =
    some 47064 := by
  decide +kernel
theorem checked_47064_134 : validate cache_47064_134 47064 =
    some 47198 := by
  decide +kernel
theorem checked_46931_267 : validate cache_46931_267 46931 =
    some 47198 := by
  exact validate_branch 133 cache_46931_133 cache_47064_134
    46931 47064 47198
    checked_46931_133 rfl checked_47064_134
theorem checked_47198_134 : validate cache_47198_134 47198 =
    some 47332 := by
  decide +kernel
theorem checked_47332_134 : validate cache_47332_134 47332 =
    some 47466 := by
  decide +kernel
theorem checked_47198_268 : validate cache_47198_268 47198 =
    some 47466 := by
  exact validate_branch 134 cache_47198_134 cache_47332_134
    47198 47332 47466
    checked_47198_134 rfl checked_47332_134
theorem checked_46931_535 : validate cache_46931_535 46931 =
    some 47466 := by
  exact validate_branch 267 cache_46931_267 cache_47198_268
    46931 47198 47466
    checked_46931_267 rfl checked_47198_268

theorem checked : validate cache 46931 = some 47466 := checked_46931_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 46931 47466 checked
  omega

theorem within_body : 47466 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46931 47466 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46931 47466 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46931 47466 address = observedPair address :=
  cachedPair_eq cache 46931 47466 checked address

end SourceCache501Pilot
open LookupCachePilot
namespace SourceCache502Pilot
theorem checked_47466_5 : validate cache_47466_5 47466 =
    some 47471 := by
  decide +kernel

theorem checked : validate cache 47466 = some 47471 := checked_47466_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 47466 47471 checked
  omega

theorem within_body : 47471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 47466 47471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 47466 47471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 47466 47471 address = observedPair address :=
  cachedPair_eq cache 47466 47471 checked address

end SourceCache502Pilot
open LookupCachePilot
namespace SourceCache503Pilot
theorem checked_47471_70 : validate cache_47471_70 47471 =
    some 47541 := by
  decide +kernel

theorem checked : validate cache 47471 = some 47541 := checked_47471_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 47471 47541 checked
  omega

theorem within_body : 47541 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 47471 47541 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 47471 47541 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 47471 47541 address = observedPair address :=
  cachedPair_eq cache 47471 47541 checked address

end SourceCache503Pilot
open LookupCachePilot
namespace SourceCache504Pilot
theorem checked_47541_167 : validate cache_47541_167 47541 =
    some 47708 := by
  decide +kernel
theorem checked_47708_168 : validate cache_47708_168 47708 =
    some 47876 := by
  decide +kernel
theorem checked_47541_335 : validate cache_47541_335 47541 =
    some 47876 := by
  exact validate_branch 167 cache_47541_167 cache_47708_168
    47541 47708 47876
    checked_47541_167 rfl checked_47708_168
theorem checked_47876_167 : validate cache_47876_167 47876 =
    some 48043 := by
  decide +kernel
theorem checked_48043_168 : validate cache_48043_168 48043 =
    some 48211 := by
  decide +kernel
theorem checked_47876_335 : validate cache_47876_335 47876 =
    some 48211 := by
  exact validate_branch 167 cache_47876_167 cache_48043_168
    47876 48043 48211
    checked_47876_167 rfl checked_48043_168
theorem checked_47541_670 : validate cache_47541_670 47541 =
    some 48211 := by
  exact validate_branch 335 cache_47541_335 cache_47876_335
    47541 47876 48211
    checked_47541_335 rfl checked_47876_335

theorem checked : validate cache 47541 = some 48211 := checked_47541_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 47541 48211 checked
  omega

theorem within_body : 48211 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 47541 48211 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 47541 48211 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 47541 48211 address = observedPair address :=
  cachedPair_eq cache 47541 48211 checked address

end SourceCache504Pilot
open LookupCachePilot
namespace SourceCache505Pilot
theorem checked_48211_70 : validate cache_48211_70 48211 =
    some 48281 := by
  decide +kernel

theorem checked : validate cache 48211 = some 48281 := checked_48211_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 48211 48281 checked
  omega

theorem within_body : 48281 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 48211 48281 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 48211 48281 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 48211 48281 address = observedPair address :=
  cachedPair_eq cache 48211 48281 checked address

end SourceCache505Pilot
open LookupCachePilot
namespace SourceCache506Pilot
theorem checked_48281_167 : validate cache_48281_167 48281 =
    some 48448 := by
  decide +kernel
theorem checked_48448_168 : validate cache_48448_168 48448 =
    some 48616 := by
  decide +kernel
theorem checked_48281_335 : validate cache_48281_335 48281 =
    some 48616 := by
  exact validate_branch 167 cache_48281_167 cache_48448_168
    48281 48448 48616
    checked_48281_167 rfl checked_48448_168
theorem checked_48616_167 : validate cache_48616_167 48616 =
    some 48783 := by
  decide +kernel
theorem checked_48783_168 : validate cache_48783_168 48783 =
    some 48951 := by
  decide +kernel
theorem checked_48616_335 : validate cache_48616_335 48616 =
    some 48951 := by
  exact validate_branch 167 cache_48616_167 cache_48783_168
    48616 48783 48951
    checked_48616_167 rfl checked_48783_168
theorem checked_48281_670 : validate cache_48281_670 48281 =
    some 48951 := by
  exact validate_branch 335 cache_48281_335 cache_48616_335
    48281 48616 48951
    checked_48281_335 rfl checked_48616_335

theorem checked : validate cache 48281 = some 48951 := checked_48281_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 48281 48951 checked
  omega

theorem within_body : 48951 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 48281 48951 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 48281 48951 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 48281 48951 address = observedPair address :=
  cachedPair_eq cache 48281 48951 checked address

end SourceCache506Pilot
open LookupCachePilot
namespace SourceCache507Pilot
theorem checked_48951_167 : validate cache_48951_167 48951 =
    some 49118 := by
  decide +kernel
theorem checked_49118_168 : validate cache_49118_168 49118 =
    some 49286 := by
  decide +kernel
theorem checked_48951_335 : validate cache_48951_335 48951 =
    some 49286 := by
  exact validate_branch 167 cache_48951_167 cache_49118_168
    48951 49118 49286
    checked_48951_167 rfl checked_49118_168
theorem checked_49286_167 : validate cache_49286_167 49286 =
    some 49453 := by
  decide +kernel
theorem checked_49453_168 : validate cache_49453_168 49453 =
    some 49621 := by
  decide +kernel
theorem checked_49286_335 : validate cache_49286_335 49286 =
    some 49621 := by
  exact validate_branch 167 cache_49286_167 cache_49453_168
    49286 49453 49621
    checked_49286_167 rfl checked_49453_168
theorem checked_48951_670 : validate cache_48951_670 48951 =
    some 49621 := by
  exact validate_branch 335 cache_48951_335 cache_49286_335
    48951 49286 49621
    checked_48951_335 rfl checked_49286_335

theorem checked : validate cache 48951 = some 49621 := checked_48951_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 48951 49621 checked
  omega

theorem within_body : 49621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 48951 49621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 48951 49621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 48951 49621 address = observedPair address :=
  cachedPair_eq cache 48951 49621 checked address

end SourceCache507Pilot
open LookupCachePilot
namespace SourceCache508Pilot
theorem checked_49621_5 : validate cache_49621_5 49621 =
    some 49626 := by
  decide +kernel

theorem checked : validate cache 49621 = some 49626 := checked_49621_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 49621 49626 checked
  omega

theorem within_body : 49626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 49621 49626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 49621 49626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 49621 49626 address = observedPair address :=
  cachedPair_eq cache 49621 49626 checked address

end SourceCache508Pilot
open LookupCachePilot
namespace SourceCache509Pilot
theorem checked_49626_70 : validate cache_49626_70 49626 =
    some 49696 := by
  decide +kernel

theorem checked : validate cache 49626 = some 49696 := checked_49626_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 49626 49696 checked
  omega

theorem within_body : 49696 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 49626 49696 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 49626 49696 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 49626 49696 address = observedPair address :=
  cachedPair_eq cache 49626 49696 checked address

end SourceCache509Pilot
namespace ScopeViews004Pilot
noncomputable def fromRaw_444 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache444Pilot.cache 33561 34231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache444Pilot.cache
    33561 34231 SourceCache444Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_445 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache445Pilot.cache 34231 34901)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache445Pilot.cache
    34231 34901 SourceCache445Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_446 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache446Pilot.cache 34901 34906)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache446Pilot.cache
    34901 34906 SourceCache446Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_447 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache447Pilot.cache 34906 34976)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache447Pilot.cache
    34906 34976 SourceCache447Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_448 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache448Pilot.cache 34976 35646)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache448Pilot.cache
    34976 35646 SourceCache448Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_449 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache449Pilot.cache 35646 35651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache449Pilot.cache
    35646 35651 SourceCache449Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_450 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache450Pilot.cache 35651 35661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache450Pilot.cache
    35651 35661 SourceCache450Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_451 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache451Pilot.cache 35661 36031)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache451Pilot.cache
    35661 36031 SourceCache451Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_452 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache452Pilot.cache 36031 36471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache452Pilot.cache
    36031 36471 SourceCache452Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_453 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache453Pilot.cache 36471 36541)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache453Pilot.cache
    36471 36541 SourceCache453Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_454 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache454Pilot.cache 36541 36736)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache454Pilot.cache
    36541 36736 SourceCache454Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_455 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache455Pilot.cache 36736 36806)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache455Pilot.cache
    36736 36806 SourceCache455Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_456 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache456Pilot.cache 36806 37206)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache456Pilot.cache
    36806 37206 SourceCache456Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_457 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache457Pilot.cache 37206 37211)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache457Pilot.cache
    37206 37211 SourceCache457Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_458 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache458Pilot.cache 37211 37281)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache458Pilot.cache
    37211 37281 SourceCache458Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_459 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache459Pilot.cache 37281 37651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache459Pilot.cache
    37281 37651 SourceCache459Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_460 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache460Pilot.cache 37651 37656)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache460Pilot.cache
    37651 37656 SourceCache460Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_461 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache461Pilot.cache 37656 37726)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache461Pilot.cache
    37656 37726 SourceCache461Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_462 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache462Pilot.cache 37726 38126)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache462Pilot.cache
    37726 38126 SourceCache462Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_463 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache463Pilot.cache 38126 38131)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache463Pilot.cache
    38126 38131 SourceCache463Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_464 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache464Pilot.cache 38131 38141)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache464Pilot.cache
    38131 38141 SourceCache464Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_465 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache465Pilot.cache 38141 38661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache465Pilot.cache
    38141 38661 SourceCache465Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_466 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache466Pilot.cache 38661 39236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache466Pilot.cache
    38661 39236 SourceCache466Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_467 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache467Pilot.cache 39236 39306)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache467Pilot.cache
    39236 39306 SourceCache467Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_468 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache468Pilot.cache 39306 39501)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache468Pilot.cache
    39306 39501 SourceCache468Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_469 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache469Pilot.cache 39501 39571)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache469Pilot.cache
    39501 39571 SourceCache469Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_470 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache470Pilot.cache 39571 40106)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache470Pilot.cache
    39571 40106 SourceCache470Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_471 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache471Pilot.cache 40106 40111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache471Pilot.cache
    40106 40111 SourceCache471Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_472 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache472Pilot.cache 40111 40181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache472Pilot.cache
    40111 40181 SourceCache472Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_473 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache473Pilot.cache 40181 40851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache473Pilot.cache
    40181 40851 SourceCache473Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_474 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache474Pilot.cache 40851 40921)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache474Pilot.cache
    40851 40921 SourceCache474Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_475 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache475Pilot.cache 40921 41591)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache475Pilot.cache
    40921 41591 SourceCache475Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_476 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache476Pilot.cache 41591 42261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache476Pilot.cache
    41591 42261 SourceCache476Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_477 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache477Pilot.cache 42261 42266)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache477Pilot.cache
    42261 42266 SourceCache477Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_478 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache478Pilot.cache 42266 42336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache478Pilot.cache
    42266 42336 SourceCache478Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_479 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache479Pilot.cache 42336 43006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache479Pilot.cache
    42336 43006 SourceCache479Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_480 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache480Pilot.cache 43006 43011)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache480Pilot.cache
    43006 43011 SourceCache480Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_481 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache481Pilot.cache 43011 43021)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache481Pilot.cache
    43011 43021 SourceCache481Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_482 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache482Pilot.cache 43021 43391)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache482Pilot.cache
    43021 43391 SourceCache482Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_483 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache483Pilot.cache 43391 43831)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache483Pilot.cache
    43391 43831 SourceCache483Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_484 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache484Pilot.cache 43831 43901)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache484Pilot.cache
    43831 43901 SourceCache484Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_485 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache485Pilot.cache 43901 44096)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache485Pilot.cache
    43901 44096 SourceCache485Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_486 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache486Pilot.cache 44096 44166)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache486Pilot.cache
    44096 44166 SourceCache486Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_487 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache487Pilot.cache 44166 44566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache487Pilot.cache
    44166 44566 SourceCache487Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_488 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache488Pilot.cache 44566 44571)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache488Pilot.cache
    44566 44571 SourceCache488Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_489 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache489Pilot.cache 44571 44641)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache489Pilot.cache
    44571 44641 SourceCache489Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_490 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache490Pilot.cache 44641 45011)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache490Pilot.cache
    44641 45011 SourceCache490Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_491 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache491Pilot.cache 45011 45016)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache491Pilot.cache
    45011 45016 SourceCache491Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_492 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache492Pilot.cache 45016 45086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache492Pilot.cache
    45016 45086 SourceCache492Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_493 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache493Pilot.cache 45086 45486)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache493Pilot.cache
    45086 45486 SourceCache493Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_494 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache494Pilot.cache 45486 45491)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache494Pilot.cache
    45486 45491 SourceCache494Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_495 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache495Pilot.cache 45491 45501)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache495Pilot.cache
    45491 45501 SourceCache495Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_496 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache496Pilot.cache 45501 46021)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache496Pilot.cache
    45501 46021 SourceCache496Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_497 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache497Pilot.cache 46021 46596)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache497Pilot.cache
    46021 46596 SourceCache497Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_498 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache498Pilot.cache 46596 46666)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache498Pilot.cache
    46596 46666 SourceCache498Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_499 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache499Pilot.cache 46666 46861)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache499Pilot.cache
    46666 46861 SourceCache499Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_500 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache500Pilot.cache 46861 46931)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache500Pilot.cache
    46861 46931 SourceCache500Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_501 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache501Pilot.cache 46931 47466)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache501Pilot.cache
    46931 47466 SourceCache501Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_502 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache502Pilot.cache 47466 47471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache502Pilot.cache
    47466 47471 SourceCache502Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_503 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache503Pilot.cache 47471 47541)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache503Pilot.cache
    47471 47541 SourceCache503Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_504 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache504Pilot.cache 47541 48211)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache504Pilot.cache
    47541 48211 SourceCache504Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_505 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache505Pilot.cache 48211 48281)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache505Pilot.cache
    48211 48281 SourceCache505Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_506 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache506Pilot.cache 48281 48951)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache506Pilot.cache
    48281 48951 SourceCache506Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_507 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache507Pilot.cache 48951 49621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache507Pilot.cache
    48951 49621 SourceCache507Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_508 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache508Pilot.cache 49621 49626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache508Pilot.cache
    49621 49626 SourceCache508Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_509 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache509Pilot.cache 49626 49696)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache509Pilot.cache
    49626 49696 SourceCache509Pilot.checked q raw nodes returns truth
end ScopeViews004Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
