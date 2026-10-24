module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews007Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache663Pilot
theorem checked_81936_167 : validate cache_81936_167 81936 =
    some 82103 := by
  decide +kernel
theorem checked_82103_168 : validate cache_82103_168 82103 =
    some 82271 := by
  decide +kernel
theorem checked_81936_335 : validate cache_81936_335 81936 =
    some 82271 := by
  exact validate_branch 167 cache_81936_167 cache_82103_168
    81936 82103 82271
    checked_81936_167 rfl checked_82103_168
theorem checked_82271_167 : validate cache_82271_167 82271 =
    some 82438 := by
  decide +kernel
theorem checked_82438_168 : validate cache_82438_168 82438 =
    some 82606 := by
  decide +kernel
theorem checked_82271_335 : validate cache_82271_335 82271 =
    some 82606 := by
  exact validate_branch 167 cache_82271_167 cache_82438_168
    82271 82438 82606
    checked_82271_167 rfl checked_82438_168
theorem checked_81936_670 : validate cache_81936_670 81936 =
    some 82606 := by
  exact validate_branch 335 cache_81936_335 cache_82271_335
    81936 82271 82606
    checked_81936_335 rfl checked_82271_335

theorem checked : validate cache 81936 = some 82606 := checked_81936_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 81936 82606 checked
  omega

theorem within_body : 82606 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81936 82606 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81936 82606 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81936 82606 address = observedPair address :=
  cachedPair_eq cache 81936 82606 checked address

end SourceCache663Pilot
open LookupCachePilot
namespace SourceCache664Pilot
theorem checked_82606_185 : validate cache_82606_185 82606 =
    some 82791 := by
  decide +kernel
theorem checked_82791_185 : validate cache_82791_185 82791 =
    some 82976 := by
  decide +kernel
theorem checked_82606_370 : validate cache_82606_370 82606 =
    some 82976 := by
  exact validate_branch 185 cache_82606_185 cache_82791_185
    82606 82791 82976
    checked_82606_185 rfl checked_82791_185

theorem checked : validate cache 82606 = some 82976 := checked_82606_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 82606 82976 checked
  omega

theorem within_body : 82976 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 82606 82976 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 82606 82976 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 82606 82976 address = observedPair address :=
  cachedPair_eq cache 82606 82976 checked address

end SourceCache664Pilot
open LookupCachePilot
namespace SourceCache665Pilot
theorem checked_82976_5 : validate cache_82976_5 82976 =
    some 82981 := by
  decide +kernel

theorem checked : validate cache 82976 = some 82981 := checked_82976_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 82976 82981 checked
  omega

theorem within_body : 82981 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 82976 82981 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 82976 82981 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 82976 82981 address = observedPair address :=
  cachedPair_eq cache 82976 82981 checked address

end SourceCache665Pilot
open LookupCachePilot
namespace SourceCache666Pilot
theorem checked_82981_70 : validate cache_82981_70 82981 =
    some 83051 := by
  decide +kernel

theorem checked : validate cache 82981 = some 83051 := checked_82981_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 82981 83051 checked
  omega

theorem within_body : 83051 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 82981 83051 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 82981 83051 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 82981 83051 address = observedPair address :=
  cachedPair_eq cache 82981 83051 checked address

end SourceCache666Pilot
open LookupCachePilot
namespace SourceCache667Pilot
theorem checked_83051_200 : validate cache_83051_200 83051 =
    some 83251 := by
  decide +kernel
theorem checked_83251_200 : validate cache_83251_200 83251 =
    some 83451 := by
  decide +kernel
theorem checked_83051_400 : validate cache_83051_400 83051 =
    some 83451 := by
  exact validate_branch 200 cache_83051_200 cache_83251_200
    83051 83251 83451
    checked_83051_200 rfl checked_83251_200

theorem checked : validate cache 83051 = some 83451 := checked_83051_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 83051 83451 checked
  omega

theorem within_body : 83451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 83051 83451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 83051 83451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 83051 83451 address = observedPair address :=
  cachedPair_eq cache 83051 83451 checked address

end SourceCache667Pilot
open LookupCachePilot
namespace SourceCache668Pilot
theorem checked_83451_5 : validate cache_83451_5 83451 =
    some 83456 := by
  decide +kernel

theorem checked : validate cache 83451 = some 83456 := checked_83451_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 83451 83456 checked
  omega

theorem within_body : 83456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 83451 83456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 83451 83456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 83451 83456 address = observedPair address :=
  cachedPair_eq cache 83451 83456 checked address

end SourceCache668Pilot
open LookupCachePilot
namespace SourceCache669Pilot
theorem checked_83456_10 : validate cache_83456_10 83456 =
    some 83466 := by
  decide +kernel

theorem checked : validate cache 83456 = some 83466 := checked_83456_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 83456 83466 checked
  omega

theorem within_body : 83466 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 83456 83466 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 83456 83466 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 83456 83466 address = observedPair address :=
  cachedPair_eq cache 83456 83466 checked address

end SourceCache669Pilot
open LookupCachePilot
namespace SourceCache670Pilot
theorem checked_83466_167 : validate cache_83466_167 83466 =
    some 83633 := by
  decide +kernel
theorem checked_83633_168 : validate cache_83633_168 83633 =
    some 83801 := by
  decide +kernel
theorem checked_83466_335 : validate cache_83466_335 83466 =
    some 83801 := by
  exact validate_branch 167 cache_83466_167 cache_83633_168
    83466 83633 83801
    checked_83466_167 rfl checked_83633_168
theorem checked_83801_167 : validate cache_83801_167 83801 =
    some 83968 := by
  decide +kernel
theorem checked_83968_168 : validate cache_83968_168 83968 =
    some 84136 := by
  decide +kernel
theorem checked_83801_335 : validate cache_83801_335 83801 =
    some 84136 := by
  exact validate_branch 167 cache_83801_167 cache_83968_168
    83801 83968 84136
    checked_83801_167 rfl checked_83968_168
theorem checked_83466_670 : validate cache_83466_670 83466 =
    some 84136 := by
  exact validate_branch 335 cache_83466_335 cache_83801_335
    83466 83801 84136
    checked_83466_335 rfl checked_83801_335

theorem checked : validate cache 83466 = some 84136 := checked_83466_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 83466 84136 checked
  omega

theorem within_body : 84136 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 83466 84136 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 83466 84136 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 83466 84136 address = observedPair address :=
  cachedPair_eq cache 83466 84136 checked address

end SourceCache670Pilot
open LookupCachePilot
namespace SourceCache671Pilot
theorem checked_84136_177 : validate cache_84136_177 84136 =
    some 84313 := by
  decide +kernel
theorem checked_84313_178 : validate cache_84313_178 84313 =
    some 84491 := by
  decide +kernel
theorem checked_84136_355 : validate cache_84136_355 84136 =
    some 84491 := by
  exact validate_branch 177 cache_84136_177 cache_84313_178
    84136 84313 84491
    checked_84136_177 rfl checked_84313_178
theorem checked_84491_177 : validate cache_84491_177 84491 =
    some 84668 := by
  decide +kernel
theorem checked_84668_178 : validate cache_84668_178 84668 =
    some 84846 := by
  decide +kernel
theorem checked_84491_355 : validate cache_84491_355 84491 =
    some 84846 := by
  exact validate_branch 177 cache_84491_177 cache_84668_178
    84491 84668 84846
    checked_84491_177 rfl checked_84668_178
theorem checked_84136_710 : validate cache_84136_710 84136 =
    some 84846 := by
  exact validate_branch 355 cache_84136_355 cache_84491_355
    84136 84491 84846
    checked_84136_355 rfl checked_84491_355

theorem checked : validate cache 84136 = some 84846 := checked_84136_710

theorem count_exact : cache.count = 710 := by
  have extent := validate_extent cache 84136 84846 checked
  omega

theorem within_body : 84846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 84136 84846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 84136 84846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 84136 84846 address = observedPair address :=
  cachedPair_eq cache 84136 84846 checked address

end SourceCache671Pilot
open LookupCachePilot
namespace SourceCache672Pilot
theorem checked_84846_70 : validate cache_84846_70 84846 =
    some 84916 := by
  decide +kernel

theorem checked : validate cache 84846 = some 84916 := checked_84846_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 84846 84916 checked
  omega

theorem within_body : 84916 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 84846 84916 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 84846 84916 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 84846 84916 address = observedPair address :=
  cachedPair_eq cache 84846 84916 checked address

end SourceCache672Pilot
open LookupCachePilot
namespace SourceCache673Pilot
theorem checked_84916_195 : validate cache_84916_195 84916 =
    some 85111 := by
  decide +kernel

theorem checked : validate cache 84916 = some 85111 := checked_84916_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 84916 85111 checked
  omega

theorem within_body : 85111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 84916 85111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 84916 85111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 84916 85111 address = observedPair address :=
  cachedPair_eq cache 84916 85111 checked address

end SourceCache673Pilot
open LookupCachePilot
namespace SourceCache674Pilot
theorem checked_85111_70 : validate cache_85111_70 85111 =
    some 85181 := by
  decide +kernel

theorem checked : validate cache 85111 = some 85181 := checked_85111_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 85111 85181 checked
  omega

theorem within_body : 85181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 85111 85181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 85111 85181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 85111 85181 address = observedPair address :=
  cachedPair_eq cache 85111 85181 checked address

end SourceCache674Pilot
open LookupCachePilot
namespace SourceCache675Pilot
theorem checked_85181_167 : validate cache_85181_167 85181 =
    some 85348 := by
  decide +kernel
theorem checked_85348_168 : validate cache_85348_168 85348 =
    some 85516 := by
  decide +kernel
theorem checked_85181_335 : validate cache_85181_335 85181 =
    some 85516 := by
  exact validate_branch 167 cache_85181_167 cache_85348_168
    85181 85348 85516
    checked_85181_167 rfl checked_85348_168
theorem checked_85516_167 : validate cache_85516_167 85516 =
    some 85683 := by
  decide +kernel
theorem checked_85683_168 : validate cache_85683_168 85683 =
    some 85851 := by
  decide +kernel
theorem checked_85516_335 : validate cache_85516_335 85516 =
    some 85851 := by
  exact validate_branch 167 cache_85516_167 cache_85683_168
    85516 85683 85851
    checked_85516_167 rfl checked_85683_168
theorem checked_85181_670 : validate cache_85181_670 85181 =
    some 85851 := by
  exact validate_branch 335 cache_85181_335 cache_85516_335
    85181 85516 85851
    checked_85181_335 rfl checked_85516_335

theorem checked : validate cache 85181 = some 85851 := checked_85181_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 85181 85851 checked
  omega

theorem within_body : 85851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 85181 85851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 85181 85851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 85181 85851 address = observedPair address :=
  cachedPair_eq cache 85181 85851 checked address

end SourceCache675Pilot
open LookupCachePilot
namespace SourceCache676Pilot
theorem checked_85851_5 : validate cache_85851_5 85851 =
    some 85856 := by
  decide +kernel

theorem checked : validate cache 85851 = some 85856 := checked_85851_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 85851 85856 checked
  omega

theorem within_body : 85856 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 85851 85856 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 85851 85856 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 85851 85856 address = observedPair address :=
  cachedPair_eq cache 85851 85856 checked address

end SourceCache676Pilot
open LookupCachePilot
namespace SourceCache677Pilot
theorem checked_85856_70 : validate cache_85856_70 85856 =
    some 85926 := by
  decide +kernel

theorem checked : validate cache 85856 = some 85926 := checked_85856_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 85856 85926 checked
  omega

theorem within_body : 85926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 85856 85926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 85856 85926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 85856 85926 address = observedPair address :=
  cachedPair_eq cache 85856 85926 checked address

end SourceCache677Pilot
open LookupCachePilot
namespace SourceCache678Pilot
theorem checked_85926_130 : validate cache_85926_130 85926 =
    some 86056 := by
  decide +kernel
theorem checked_86056_130 : validate cache_86056_130 86056 =
    some 86186 := by
  decide +kernel
theorem checked_85926_260 : validate cache_85926_260 85926 =
    some 86186 := by
  exact validate_branch 130 cache_85926_130 cache_86056_130
    85926 86056 86186
    checked_85926_130 rfl checked_86056_130
theorem checked_86186_130 : validate cache_86186_130 86186 =
    some 86316 := by
  decide +kernel
theorem checked_86316_130 : validate cache_86316_130 86316 =
    some 86446 := by
  decide +kernel
theorem checked_86186_260 : validate cache_86186_260 86186 =
    some 86446 := by
  exact validate_branch 130 cache_86186_130 cache_86316_130
    86186 86316 86446
    checked_86186_130 rfl checked_86316_130
theorem checked_85926_520 : validate cache_85926_520 85926 =
    some 86446 := by
  exact validate_branch 260 cache_85926_260 cache_86186_260
    85926 86186 86446
    checked_85926_260 rfl checked_86186_260

theorem checked : validate cache 85926 = some 86446 := checked_85926_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 85926 86446 checked
  omega

theorem within_body : 86446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 85926 86446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 85926 86446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 85926 86446 address = observedPair address :=
  cachedPair_eq cache 85926 86446 checked address

end SourceCache678Pilot
open LookupCachePilot
namespace SourceCache679Pilot
theorem checked_86446_70 : validate cache_86446_70 86446 =
    some 86516 := by
  decide +kernel

theorem checked : validate cache 86446 = some 86516 := checked_86446_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 86446 86516 checked
  omega

theorem within_body : 86516 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 86446 86516 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 86446 86516 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 86446 86516 address = observedPair address :=
  cachedPair_eq cache 86446 86516 checked address

end SourceCache679Pilot
open LookupCachePilot
namespace SourceCache680Pilot
theorem checked_86516_133 : validate cache_86516_133 86516 =
    some 86649 := by
  decide +kernel
theorem checked_86649_134 : validate cache_86649_134 86649 =
    some 86783 := by
  decide +kernel
theorem checked_86516_267 : validate cache_86516_267 86516 =
    some 86783 := by
  exact validate_branch 133 cache_86516_133 cache_86649_134
    86516 86649 86783
    checked_86516_133 rfl checked_86649_134
theorem checked_86783_134 : validate cache_86783_134 86783 =
    some 86917 := by
  decide +kernel
theorem checked_86917_134 : validate cache_86917_134 86917 =
    some 87051 := by
  decide +kernel
theorem checked_86783_268 : validate cache_86783_268 86783 =
    some 87051 := by
  exact validate_branch 134 cache_86783_134 cache_86917_134
    86783 86917 87051
    checked_86783_134 rfl checked_86917_134
theorem checked_86516_535 : validate cache_86516_535 86516 =
    some 87051 := by
  exact validate_branch 267 cache_86516_267 cache_86783_268
    86516 86783 87051
    checked_86516_267 rfl checked_86783_268

theorem checked : validate cache 86516 = some 87051 := checked_86516_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 86516 87051 checked
  omega

theorem within_body : 87051 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 86516 87051 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 86516 87051 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 86516 87051 address = observedPair address :=
  cachedPair_eq cache 86516 87051 checked address

end SourceCache680Pilot
open LookupCachePilot
namespace SourceCache681Pilot
theorem checked_87051_130 : validate cache_87051_130 87051 =
    some 87181 := by
  decide +kernel
theorem checked_87181_130 : validate cache_87181_130 87181 =
    some 87311 := by
  decide +kernel
theorem checked_87051_260 : validate cache_87051_260 87051 =
    some 87311 := by
  exact validate_branch 130 cache_87051_130 cache_87181_130
    87051 87181 87311
    checked_87051_130 rfl checked_87181_130
theorem checked_87311_130 : validate cache_87311_130 87311 =
    some 87441 := by
  decide +kernel
theorem checked_87441_130 : validate cache_87441_130 87441 =
    some 87571 := by
  decide +kernel
theorem checked_87311_260 : validate cache_87311_260 87311 =
    some 87571 := by
  exact validate_branch 130 cache_87311_130 cache_87441_130
    87311 87441 87571
    checked_87311_130 rfl checked_87441_130
theorem checked_87051_520 : validate cache_87051_520 87051 =
    some 87571 := by
  exact validate_branch 260 cache_87051_260 cache_87311_260
    87051 87311 87571
    checked_87051_260 rfl checked_87311_260

theorem checked : validate cache 87051 = some 87571 := checked_87051_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 87051 87571 checked
  omega

theorem within_body : 87571 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 87051 87571 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 87051 87571 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 87051 87571 address = observedPair address :=
  cachedPair_eq cache 87051 87571 checked address

end SourceCache681Pilot
open LookupCachePilot
namespace SourceCache682Pilot
theorem checked_87571_5 : validate cache_87571_5 87571 =
    some 87576 := by
  decide +kernel

theorem checked : validate cache 87571 = some 87576 := checked_87571_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 87571 87576 checked
  omega

theorem within_body : 87576 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 87571 87576 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 87571 87576 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 87571 87576 address = observedPair address :=
  cachedPair_eq cache 87571 87576 checked address

end SourceCache682Pilot
open LookupCachePilot
namespace SourceCache683Pilot
theorem checked_87576_70 : validate cache_87576_70 87576 =
    some 87646 := by
  decide +kernel

theorem checked : validate cache 87576 = some 87646 := checked_87576_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 87576 87646 checked
  omega

theorem within_body : 87646 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 87576 87646 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 87576 87646 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 87576 87646 address = observedPair address :=
  cachedPair_eq cache 87576 87646 checked address

end SourceCache683Pilot
open LookupCachePilot
namespace SourceCache684Pilot
theorem checked_87646_133 : validate cache_87646_133 87646 =
    some 87779 := by
  decide +kernel
theorem checked_87779_134 : validate cache_87779_134 87779 =
    some 87913 := by
  decide +kernel
theorem checked_87646_267 : validate cache_87646_267 87646 =
    some 87913 := by
  exact validate_branch 133 cache_87646_133 cache_87779_134
    87646 87779 87913
    checked_87646_133 rfl checked_87779_134
theorem checked_87913_134 : validate cache_87913_134 87913 =
    some 88047 := by
  decide +kernel
theorem checked_88047_134 : validate cache_88047_134 88047 =
    some 88181 := by
  decide +kernel
theorem checked_87913_268 : validate cache_87913_268 87913 =
    some 88181 := by
  exact validate_branch 134 cache_87913_134 cache_88047_134
    87913 88047 88181
    checked_87913_134 rfl checked_88047_134
theorem checked_87646_535 : validate cache_87646_535 87646 =
    some 88181 := by
  exact validate_branch 267 cache_87646_267 cache_87913_268
    87646 87913 88181
    checked_87646_267 rfl checked_87913_268

theorem checked : validate cache 87646 = some 88181 := checked_87646_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 87646 88181 checked
  omega

theorem within_body : 88181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 87646 88181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 87646 88181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 87646 88181 address = observedPair address :=
  cachedPair_eq cache 87646 88181 checked address

end SourceCache684Pilot
open LookupCachePilot
namespace SourceCache685Pilot
theorem checked_88181_5 : validate cache_88181_5 88181 =
    some 88186 := by
  decide +kernel

theorem checked : validate cache 88181 = some 88186 := checked_88181_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 88181 88186 checked
  omega

theorem within_body : 88186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 88181 88186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 88181 88186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 88181 88186 address = observedPair address :=
  cachedPair_eq cache 88181 88186 checked address

end SourceCache685Pilot
open LookupCachePilot
namespace SourceCache686Pilot
theorem checked_88186_10 : validate cache_88186_10 88186 =
    some 88196 := by
  decide +kernel

theorem checked : validate cache 88186 = some 88196 := checked_88186_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 88186 88196 checked
  omega

theorem within_body : 88196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 88186 88196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 88186 88196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 88186 88196 address = observedPair address :=
  cachedPair_eq cache 88186 88196 checked address

end SourceCache686Pilot
open LookupCachePilot
namespace SourceCache687Pilot
theorem checked_88196_185 : validate cache_88196_185 88196 =
    some 88381 := by
  decide +kernel
theorem checked_88381_185 : validate cache_88381_185 88381 =
    some 88566 := by
  decide +kernel
theorem checked_88196_370 : validate cache_88196_370 88196 =
    some 88566 := by
  exact validate_branch 185 cache_88196_185 cache_88381_185
    88196 88381 88566
    checked_88196_185 rfl checked_88381_185

theorem checked : validate cache 88196 = some 88566 := checked_88196_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 88196 88566 checked
  omega

theorem within_body : 88566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 88196 88566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 88196 88566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 88196 88566 address = observedPair address :=
  cachedPair_eq cache 88196 88566 checked address

end SourceCache687Pilot
open LookupCachePilot
namespace SourceCache688Pilot
theorem checked_88566_220 : validate cache_88566_220 88566 =
    some 88786 := by
  decide +kernel
theorem checked_88786_220 : validate cache_88786_220 88786 =
    some 89006 := by
  decide +kernel
theorem checked_88566_440 : validate cache_88566_440 88566 =
    some 89006 := by
  exact validate_branch 220 cache_88566_220 cache_88786_220
    88566 88786 89006
    checked_88566_220 rfl checked_88786_220

theorem checked : validate cache 88566 = some 89006 := checked_88566_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 88566 89006 checked
  omega

theorem within_body : 89006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 88566 89006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 88566 89006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 88566 89006 address = observedPair address :=
  cachedPair_eq cache 88566 89006 checked address

end SourceCache688Pilot
open LookupCachePilot
namespace SourceCache689Pilot
theorem checked_89006_70 : validate cache_89006_70 89006 =
    some 89076 := by
  decide +kernel

theorem checked : validate cache 89006 = some 89076 := checked_89006_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 89006 89076 checked
  omega

theorem within_body : 89076 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89006 89076 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89006 89076 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89006 89076 address = observedPair address :=
  cachedPair_eq cache 89006 89076 checked address

end SourceCache689Pilot
open LookupCachePilot
namespace SourceCache690Pilot
theorem checked_89076_195 : validate cache_89076_195 89076 =
    some 89271 := by
  decide +kernel

theorem checked : validate cache 89076 = some 89271 := checked_89076_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 89076 89271 checked
  omega

theorem within_body : 89271 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89076 89271 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89076 89271 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89076 89271 address = observedPair address :=
  cachedPair_eq cache 89076 89271 checked address

end SourceCache690Pilot
open LookupCachePilot
namespace SourceCache691Pilot
theorem checked_89271_70 : validate cache_89271_70 89271 =
    some 89341 := by
  decide +kernel

theorem checked : validate cache 89271 = some 89341 := checked_89271_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 89271 89341 checked
  omega

theorem within_body : 89341 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89271 89341 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89271 89341 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89271 89341 address = observedPair address :=
  cachedPair_eq cache 89271 89341 checked address

end SourceCache691Pilot
open LookupCachePilot
namespace SourceCache692Pilot
theorem checked_89341_200 : validate cache_89341_200 89341 =
    some 89541 := by
  decide +kernel
theorem checked_89541_200 : validate cache_89541_200 89541 =
    some 89741 := by
  decide +kernel
theorem checked_89341_400 : validate cache_89341_400 89341 =
    some 89741 := by
  exact validate_branch 200 cache_89341_200 cache_89541_200
    89341 89541 89741
    checked_89341_200 rfl checked_89541_200

theorem checked : validate cache 89341 = some 89741 := checked_89341_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 89341 89741 checked
  omega

theorem within_body : 89741 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89341 89741 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89341 89741 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89341 89741 address = observedPair address :=
  cachedPair_eq cache 89341 89741 checked address

end SourceCache692Pilot
open LookupCachePilot
namespace SourceCache693Pilot
theorem checked_89741_5 : validate cache_89741_5 89741 =
    some 89746 := by
  decide +kernel

theorem checked : validate cache 89741 = some 89746 := checked_89741_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 89741 89746 checked
  omega

theorem within_body : 89746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89741 89746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89741 89746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89741 89746 address = observedPair address :=
  cachedPair_eq cache 89741 89746 checked address

end SourceCache693Pilot
open LookupCachePilot
namespace SourceCache694Pilot
theorem checked_89746_70 : validate cache_89746_70 89746 =
    some 89816 := by
  decide +kernel

theorem checked : validate cache 89746 = some 89816 := checked_89746_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 89746 89816 checked
  omega

theorem within_body : 89816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89746 89816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89746 89816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89746 89816 address = observedPair address :=
  cachedPair_eq cache 89746 89816 checked address

end SourceCache694Pilot
open LookupCachePilot
namespace SourceCache695Pilot
theorem checked_89816_185 : validate cache_89816_185 89816 =
    some 90001 := by
  decide +kernel
theorem checked_90001_185 : validate cache_90001_185 90001 =
    some 90186 := by
  decide +kernel
theorem checked_89816_370 : validate cache_89816_370 89816 =
    some 90186 := by
  exact validate_branch 185 cache_89816_185 cache_90001_185
    89816 90001 90186
    checked_89816_185 rfl checked_90001_185

theorem checked : validate cache 89816 = some 90186 := checked_89816_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 89816 90186 checked
  omega

theorem within_body : 90186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 89816 90186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 89816 90186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 89816 90186 address = observedPair address :=
  cachedPair_eq cache 89816 90186 checked address

end SourceCache695Pilot
open LookupCachePilot
namespace SourceCache696Pilot
theorem checked_90186_5 : validate cache_90186_5 90186 =
    some 90191 := by
  decide +kernel

theorem checked : validate cache 90186 = some 90191 := checked_90186_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 90186 90191 checked
  omega

theorem within_body : 90191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90186 90191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90186 90191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90186 90191 address = observedPair address :=
  cachedPair_eq cache 90186 90191 checked address

end SourceCache696Pilot
open LookupCachePilot
namespace SourceCache697Pilot
theorem checked_90191_70 : validate cache_90191_70 90191 =
    some 90261 := by
  decide +kernel

theorem checked : validate cache 90191 = some 90261 := checked_90191_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 90191 90261 checked
  omega

theorem within_body : 90261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90191 90261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90191 90261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90191 90261 address = observedPair address :=
  cachedPair_eq cache 90191 90261 checked address

end SourceCache697Pilot
open LookupCachePilot
namespace SourceCache698Pilot
theorem checked_90261_200 : validate cache_90261_200 90261 =
    some 90461 := by
  decide +kernel
theorem checked_90461_200 : validate cache_90461_200 90461 =
    some 90661 := by
  decide +kernel
theorem checked_90261_400 : validate cache_90261_400 90261 =
    some 90661 := by
  exact validate_branch 200 cache_90261_200 cache_90461_200
    90261 90461 90661
    checked_90261_200 rfl checked_90461_200

theorem checked : validate cache 90261 = some 90661 := checked_90261_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 90261 90661 checked
  omega

theorem within_body : 90661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90261 90661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90261 90661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90261 90661 address = observedPair address :=
  cachedPair_eq cache 90261 90661 checked address

end SourceCache698Pilot
open LookupCachePilot
namespace SourceCache699Pilot
theorem checked_90661_5 : validate cache_90661_5 90661 =
    some 90666 := by
  decide +kernel

theorem checked : validate cache 90661 = some 90666 := checked_90661_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 90661 90666 checked
  omega

theorem within_body : 90666 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90661 90666 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90661 90666 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90661 90666 address = observedPair address :=
  cachedPair_eq cache 90661 90666 checked address

end SourceCache699Pilot
open LookupCachePilot
namespace SourceCache700Pilot
theorem checked_90666_10 : validate cache_90666_10 90666 =
    some 90676 := by
  decide +kernel

theorem checked : validate cache 90666 = some 90676 := checked_90666_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 90666 90676 checked
  omega

theorem within_body : 90676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90666 90676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90666 90676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90666 90676 address = observedPair address :=
  cachedPair_eq cache 90666 90676 checked address

end SourceCache700Pilot
open LookupCachePilot
namespace SourceCache701Pilot
theorem checked_90676_220 : validate cache_90676_220 90676 =
    some 90896 := by
  decide +kernel

theorem checked : validate cache 90676 = some 90896 := checked_90676_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 90676 90896 checked
  omega

theorem within_body : 90896 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90676 90896 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90676 90896 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90676 90896 address = observedPair address :=
  cachedPair_eq cache 90676 90896 checked address

end SourceCache701Pilot
open LookupCachePilot
namespace SourceCache702Pilot
theorem checked_90896_152 : validate cache_90896_152 90896 =
    some 91048 := by
  decide +kernel
theorem checked_91048_153 : validate cache_91048_153 91048 =
    some 91201 := by
  decide +kernel
theorem checked_90896_305 : validate cache_90896_305 90896 =
    some 91201 := by
  exact validate_branch 152 cache_90896_152 cache_91048_153
    90896 91048 91201
    checked_90896_152 rfl checked_91048_153

theorem checked : validate cache 90896 = some 91201 := checked_90896_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 90896 91201 checked
  omega

theorem within_body : 91201 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 90896 91201 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 90896 91201 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 90896 91201 address = observedPair address :=
  cachedPair_eq cache 90896 91201 checked address

end SourceCache702Pilot
open LookupCachePilot
namespace SourceCache703Pilot
theorem checked_91201_70 : validate cache_91201_70 91201 =
    some 91271 := by
  decide +kernel

theorem checked : validate cache 91201 = some 91271 := checked_91201_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 91201 91271 checked
  omega

theorem within_body : 91271 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91201 91271 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91201 91271 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91201 91271 address = observedPair address :=
  cachedPair_eq cache 91201 91271 checked address

end SourceCache703Pilot
open LookupCachePilot
namespace SourceCache704Pilot
theorem checked_91271_195 : validate cache_91271_195 91271 =
    some 91466 := by
  decide +kernel

theorem checked : validate cache 91271 = some 91466 := checked_91271_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 91271 91466 checked
  omega

theorem within_body : 91466 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91271 91466 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91271 91466 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91271 91466 address = observedPair address :=
  cachedPair_eq cache 91271 91466 checked address

end SourceCache704Pilot
open LookupCachePilot
namespace SourceCache705Pilot
theorem checked_91466_70 : validate cache_91466_70 91466 =
    some 91536 := by
  decide +kernel

theorem checked : validate cache 91466 = some 91536 := checked_91466_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 91466 91536 checked
  omega

theorem within_body : 91536 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91466 91536 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91466 91536 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91466 91536 address = observedPair address :=
  cachedPair_eq cache 91466 91536 checked address

end SourceCache705Pilot
open LookupCachePilot
namespace SourceCache706Pilot
theorem checked_91536_132 : validate cache_91536_132 91536 =
    some 91668 := by
  decide +kernel
theorem checked_91668_133 : validate cache_91668_133 91668 =
    some 91801 := by
  decide +kernel
theorem checked_91536_265 : validate cache_91536_265 91536 =
    some 91801 := by
  exact validate_branch 132 cache_91536_132 cache_91668_133
    91536 91668 91801
    checked_91536_132 rfl checked_91668_133

theorem checked : validate cache 91536 = some 91801 := checked_91536_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 91536 91801 checked
  omega

theorem within_body : 91801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91536 91801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91536 91801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91536 91801 address = observedPair address :=
  cachedPair_eq cache 91536 91801 checked address

end SourceCache706Pilot
open LookupCachePilot
namespace SourceCache707Pilot
theorem checked_91801_5 : validate cache_91801_5 91801 =
    some 91806 := by
  decide +kernel

theorem checked : validate cache 91801 = some 91806 := checked_91801_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 91801 91806 checked
  omega

theorem within_body : 91806 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91801 91806 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91801 91806 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91801 91806 address = observedPair address :=
  cachedPair_eq cache 91801 91806 checked address

end SourceCache707Pilot
open LookupCachePilot
namespace SourceCache708Pilot
theorem checked_91806_70 : validate cache_91806_70 91806 =
    some 91876 := by
  decide +kernel

theorem checked : validate cache 91806 = some 91876 := checked_91806_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 91806 91876 checked
  omega

theorem within_body : 91876 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91806 91876 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91806 91876 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91806 91876 address = observedPair address :=
  cachedPair_eq cache 91806 91876 checked address

end SourceCache708Pilot
open LookupCachePilot
namespace SourceCache709Pilot
theorem checked_91876_167 : validate cache_91876_167 91876 =
    some 92043 := by
  decide +kernel
theorem checked_92043_168 : validate cache_92043_168 92043 =
    some 92211 := by
  decide +kernel
theorem checked_91876_335 : validate cache_91876_335 91876 =
    some 92211 := by
  exact validate_branch 167 cache_91876_167 cache_92043_168
    91876 92043 92211
    checked_91876_167 rfl checked_92043_168
theorem checked_92211_167 : validate cache_92211_167 92211 =
    some 92378 := by
  decide +kernel
theorem checked_92378_168 : validate cache_92378_168 92378 =
    some 92546 := by
  decide +kernel
theorem checked_92211_335 : validate cache_92211_335 92211 =
    some 92546 := by
  exact validate_branch 167 cache_92211_167 cache_92378_168
    92211 92378 92546
    checked_92211_167 rfl checked_92378_168
theorem checked_91876_670 : validate cache_91876_670 91876 =
    some 92546 := by
  exact validate_branch 335 cache_91876_335 cache_92211_335
    91876 92211 92546
    checked_91876_335 rfl checked_92211_335

theorem checked : validate cache 91876 = some 92546 := checked_91876_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 91876 92546 checked
  omega

theorem within_body : 92546 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91876 92546 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91876 92546 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91876 92546 address = observedPair address :=
  cachedPair_eq cache 91876 92546 checked address

end SourceCache709Pilot
open LookupCachePilot
namespace SourceCache710Pilot
theorem checked_92546_70 : validate cache_92546_70 92546 =
    some 92616 := by
  decide +kernel

theorem checked : validate cache 92546 = some 92616 := checked_92546_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 92546 92616 checked
  omega

theorem within_body : 92616 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 92546 92616 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 92546 92616 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 92546 92616 address = observedPair address :=
  cachedPair_eq cache 92546 92616 checked address

end SourceCache710Pilot
open LookupCachePilot
namespace SourceCache711Pilot
theorem checked_92616_167 : validate cache_92616_167 92616 =
    some 92783 := by
  decide +kernel
theorem checked_92783_168 : validate cache_92783_168 92783 =
    some 92951 := by
  decide +kernel
theorem checked_92616_335 : validate cache_92616_335 92616 =
    some 92951 := by
  exact validate_branch 167 cache_92616_167 cache_92783_168
    92616 92783 92951
    checked_92616_167 rfl checked_92783_168
theorem checked_92951_167 : validate cache_92951_167 92951 =
    some 93118 := by
  decide +kernel
theorem checked_93118_168 : validate cache_93118_168 93118 =
    some 93286 := by
  decide +kernel
theorem checked_92951_335 : validate cache_92951_335 92951 =
    some 93286 := by
  exact validate_branch 167 cache_92951_167 cache_93118_168
    92951 93118 93286
    checked_92951_167 rfl checked_93118_168
theorem checked_92616_670 : validate cache_92616_670 92616 =
    some 93286 := by
  exact validate_branch 335 cache_92616_335 cache_92951_335
    92616 92951 93286
    checked_92616_335 rfl checked_92951_335

theorem checked : validate cache 92616 = some 93286 := checked_92616_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 92616 93286 checked
  omega

theorem within_body : 93286 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 92616 93286 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 92616 93286 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 92616 93286 address = observedPair address :=
  cachedPair_eq cache 92616 93286 checked address

end SourceCache711Pilot
open LookupCachePilot
namespace SourceCache712Pilot
theorem checked_93286_167 : validate cache_93286_167 93286 =
    some 93453 := by
  decide +kernel
theorem checked_93453_168 : validate cache_93453_168 93453 =
    some 93621 := by
  decide +kernel
theorem checked_93286_335 : validate cache_93286_335 93286 =
    some 93621 := by
  exact validate_branch 167 cache_93286_167 cache_93453_168
    93286 93453 93621
    checked_93286_167 rfl checked_93453_168
theorem checked_93621_167 : validate cache_93621_167 93621 =
    some 93788 := by
  decide +kernel
theorem checked_93788_168 : validate cache_93788_168 93788 =
    some 93956 := by
  decide +kernel
theorem checked_93621_335 : validate cache_93621_335 93621 =
    some 93956 := by
  exact validate_branch 167 cache_93621_167 cache_93788_168
    93621 93788 93956
    checked_93621_167 rfl checked_93788_168
theorem checked_93286_670 : validate cache_93286_670 93286 =
    some 93956 := by
  exact validate_branch 335 cache_93286_335 cache_93621_335
    93286 93621 93956
    checked_93286_335 rfl checked_93621_335

theorem checked : validate cache 93286 = some 93956 := checked_93286_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 93286 93956 checked
  omega

theorem within_body : 93956 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 93286 93956 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 93286 93956 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 93286 93956 address = observedPair address :=
  cachedPair_eq cache 93286 93956 checked address

end SourceCache712Pilot
open LookupCachePilot
namespace SourceCache713Pilot
theorem checked_93956_5 : validate cache_93956_5 93956 =
    some 93961 := by
  decide +kernel

theorem checked : validate cache 93956 = some 93961 := checked_93956_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 93956 93961 checked
  omega

theorem within_body : 93961 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 93956 93961 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 93956 93961 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 93956 93961 address = observedPair address :=
  cachedPair_eq cache 93956 93961 checked address

end SourceCache713Pilot
open LookupCachePilot
namespace SourceCache714Pilot
theorem checked_93961_70 : validate cache_93961_70 93961 =
    some 94031 := by
  decide +kernel

theorem checked : validate cache 93961 = some 94031 := checked_93961_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 93961 94031 checked
  omega

theorem within_body : 94031 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 93961 94031 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 93961 94031 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 93961 94031 address = observedPair address :=
  cachedPair_eq cache 93961 94031 checked address

end SourceCache714Pilot
open LookupCachePilot
namespace SourceCache715Pilot
theorem checked_94031_167 : validate cache_94031_167 94031 =
    some 94198 := by
  decide +kernel
theorem checked_94198_168 : validate cache_94198_168 94198 =
    some 94366 := by
  decide +kernel
theorem checked_94031_335 : validate cache_94031_335 94031 =
    some 94366 := by
  exact validate_branch 167 cache_94031_167 cache_94198_168
    94031 94198 94366
    checked_94031_167 rfl checked_94198_168
theorem checked_94366_167 : validate cache_94366_167 94366 =
    some 94533 := by
  decide +kernel
theorem checked_94533_168 : validate cache_94533_168 94533 =
    some 94701 := by
  decide +kernel
theorem checked_94366_335 : validate cache_94366_335 94366 =
    some 94701 := by
  exact validate_branch 167 cache_94366_167 cache_94533_168
    94366 94533 94701
    checked_94366_167 rfl checked_94533_168
theorem checked_94031_670 : validate cache_94031_670 94031 =
    some 94701 := by
  exact validate_branch 335 cache_94031_335 cache_94366_335
    94031 94366 94701
    checked_94031_335 rfl checked_94366_335

theorem checked : validate cache 94031 = some 94701 := checked_94031_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 94031 94701 checked
  omega

theorem within_body : 94701 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 94031 94701 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 94031 94701 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 94031 94701 address = observedPair address :=
  cachedPair_eq cache 94031 94701 checked address

end SourceCache715Pilot
open LookupCachePilot
namespace SourceCache716Pilot
theorem checked_94701_5 : validate cache_94701_5 94701 =
    some 94706 := by
  decide +kernel

theorem checked : validate cache 94701 = some 94706 := checked_94701_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 94701 94706 checked
  omega

theorem within_body : 94706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 94701 94706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 94701 94706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 94701 94706 address = observedPair address :=
  cachedPair_eq cache 94701 94706 checked address

end SourceCache716Pilot
open LookupCachePilot
namespace SourceCache717Pilot
theorem checked_94706_10 : validate cache_94706_10 94706 =
    some 94716 := by
  decide +kernel

theorem checked : validate cache 94706 = some 94716 := checked_94706_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 94706 94716 checked
  omega

theorem within_body : 94716 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 94706 94716 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 94706 94716 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 94706 94716 address = observedPair address :=
  cachedPair_eq cache 94706 94716 checked address

end SourceCache717Pilot
open LookupCachePilot
namespace SourceCache718Pilot
theorem checked_94716_185 : validate cache_94716_185 94716 =
    some 94901 := by
  decide +kernel
theorem checked_94901_185 : validate cache_94901_185 94901 =
    some 95086 := by
  decide +kernel
theorem checked_94716_370 : validate cache_94716_370 94716 =
    some 95086 := by
  exact validate_branch 185 cache_94716_185 cache_94901_185
    94716 94901 95086
    checked_94716_185 rfl checked_94901_185

theorem checked : validate cache 94716 = some 95086 := checked_94716_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 94716 95086 checked
  omega

theorem within_body : 95086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 94716 95086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 94716 95086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 94716 95086 address = observedPair address :=
  cachedPair_eq cache 94716 95086 checked address

end SourceCache718Pilot
open LookupCachePilot
namespace SourceCache719Pilot
theorem checked_95086_220 : validate cache_95086_220 95086 =
    some 95306 := by
  decide +kernel
theorem checked_95306_220 : validate cache_95306_220 95306 =
    some 95526 := by
  decide +kernel
theorem checked_95086_440 : validate cache_95086_440 95086 =
    some 95526 := by
  exact validate_branch 220 cache_95086_220 cache_95306_220
    95086 95306 95526
    checked_95086_220 rfl checked_95306_220

theorem checked : validate cache 95086 = some 95526 := checked_95086_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 95086 95526 checked
  omega

theorem within_body : 95526 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 95086 95526 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 95086 95526 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 95086 95526 address = observedPair address :=
  cachedPair_eq cache 95086 95526 checked address

end SourceCache719Pilot
open LookupCachePilot
namespace SourceCache720Pilot
theorem checked_95526_70 : validate cache_95526_70 95526 =
    some 95596 := by
  decide +kernel

theorem checked : validate cache 95526 = some 95596 := checked_95526_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 95526 95596 checked
  omega

theorem within_body : 95596 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 95526 95596 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 95526 95596 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 95526 95596 address = observedPair address :=
  cachedPair_eq cache 95526 95596 checked address

end SourceCache720Pilot
open LookupCachePilot
namespace SourceCache721Pilot
theorem checked_95596_195 : validate cache_95596_195 95596 =
    some 95791 := by
  decide +kernel

theorem checked : validate cache 95596 = some 95791 := checked_95596_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 95596 95791 checked
  omega

theorem within_body : 95791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 95596 95791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 95596 95791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 95596 95791 address = observedPair address :=
  cachedPair_eq cache 95596 95791 checked address

end SourceCache721Pilot
open LookupCachePilot
namespace SourceCache722Pilot
theorem checked_95791_70 : validate cache_95791_70 95791 =
    some 95861 := by
  decide +kernel

theorem checked : validate cache 95791 = some 95861 := checked_95791_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 95791 95861 checked
  omega

theorem within_body : 95861 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 95791 95861 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 95791 95861 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 95791 95861 address = observedPair address :=
  cachedPair_eq cache 95791 95861 checked address

end SourceCache722Pilot
open LookupCachePilot
namespace SourceCache723Pilot
theorem checked_95861_200 : validate cache_95861_200 95861 =
    some 96061 := by
  decide +kernel
theorem checked_96061_200 : validate cache_96061_200 96061 =
    some 96261 := by
  decide +kernel
theorem checked_95861_400 : validate cache_95861_400 95861 =
    some 96261 := by
  exact validate_branch 200 cache_95861_200 cache_96061_200
    95861 96061 96261
    checked_95861_200 rfl checked_96061_200

theorem checked : validate cache 95861 = some 96261 := checked_95861_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 95861 96261 checked
  omega

theorem within_body : 96261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 95861 96261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 95861 96261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 95861 96261 address = observedPair address :=
  cachedPair_eq cache 95861 96261 checked address

end SourceCache723Pilot
open LookupCachePilot
namespace SourceCache724Pilot
theorem checked_96261_5 : validate cache_96261_5 96261 =
    some 96266 := by
  decide +kernel

theorem checked : validate cache 96261 = some 96266 := checked_96261_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 96261 96266 checked
  omega

theorem within_body : 96266 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96261 96266 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96261 96266 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96261 96266 address = observedPair address :=
  cachedPair_eq cache 96261 96266 checked address

end SourceCache724Pilot
open LookupCachePilot
namespace SourceCache725Pilot
theorem checked_96266_70 : validate cache_96266_70 96266 =
    some 96336 := by
  decide +kernel

theorem checked : validate cache 96266 = some 96336 := checked_96266_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 96266 96336 checked
  omega

theorem within_body : 96336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96266 96336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96266 96336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96266 96336 address = observedPair address :=
  cachedPair_eq cache 96266 96336 checked address

end SourceCache725Pilot
open LookupCachePilot
namespace SourceCache726Pilot
theorem checked_96336_185 : validate cache_96336_185 96336 =
    some 96521 := by
  decide +kernel
theorem checked_96521_185 : validate cache_96521_185 96521 =
    some 96706 := by
  decide +kernel
theorem checked_96336_370 : validate cache_96336_370 96336 =
    some 96706 := by
  exact validate_branch 185 cache_96336_185 cache_96521_185
    96336 96521 96706
    checked_96336_185 rfl checked_96521_185

theorem checked : validate cache 96336 = some 96706 := checked_96336_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 96336 96706 checked
  omega

theorem within_body : 96706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96336 96706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96336 96706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96336 96706 address = observedPair address :=
  cachedPair_eq cache 96336 96706 checked address

end SourceCache726Pilot
open LookupCachePilot
namespace SourceCache727Pilot
theorem checked_96706_5 : validate cache_96706_5 96706 =
    some 96711 := by
  decide +kernel

theorem checked : validate cache 96706 = some 96711 := checked_96706_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 96706 96711 checked
  omega

theorem within_body : 96711 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96706 96711 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96706 96711 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96706 96711 address = observedPair address :=
  cachedPair_eq cache 96706 96711 checked address

end SourceCache727Pilot
open LookupCachePilot
namespace SourceCache728Pilot
theorem checked_96711_70 : validate cache_96711_70 96711 =
    some 96781 := by
  decide +kernel

theorem checked : validate cache 96711 = some 96781 := checked_96711_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 96711 96781 checked
  omega

theorem within_body : 96781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96711 96781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96711 96781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96711 96781 address = observedPair address :=
  cachedPair_eq cache 96711 96781 checked address

end SourceCache728Pilot
open LookupCachePilot
namespace SourceCache729Pilot
theorem checked_96781_200 : validate cache_96781_200 96781 =
    some 96981 := by
  decide +kernel
theorem checked_96981_200 : validate cache_96981_200 96981 =
    some 97181 := by
  decide +kernel
theorem checked_96781_400 : validate cache_96781_400 96781 =
    some 97181 := by
  exact validate_branch 200 cache_96781_200 cache_96981_200
    96781 96981 97181
    checked_96781_200 rfl checked_96981_200

theorem checked : validate cache 96781 = some 97181 := checked_96781_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 96781 97181 checked
  omega

theorem within_body : 97181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96781 97181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96781 97181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96781 97181 address = observedPair address :=
  cachedPair_eq cache 96781 97181 checked address

end SourceCache729Pilot
open LookupCachePilot
namespace SourceCache730Pilot
theorem checked_97181_5 : validate cache_97181_5 97181 =
    some 97186 := by
  decide +kernel

theorem checked : validate cache 97181 = some 97186 := checked_97181_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 97181 97186 checked
  omega

theorem within_body : 97186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97181 97186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97181 97186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97181 97186 address = observedPair address :=
  cachedPair_eq cache 97181 97186 checked address

end SourceCache730Pilot
open LookupCachePilot
namespace SourceCache731Pilot
theorem checked_97186_10 : validate cache_97186_10 97186 =
    some 97196 := by
  decide +kernel

theorem checked : validate cache 97186 = some 97196 := checked_97186_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 97186 97196 checked
  omega

theorem within_body : 97196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97186 97196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97186 97196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97186 97196 address = observedPair address :=
  cachedPair_eq cache 97186 97196 checked address

end SourceCache731Pilot
open LookupCachePilot
namespace SourceCache732Pilot
theorem checked_97196_220 : validate cache_97196_220 97196 =
    some 97416 := by
  decide +kernel

theorem checked : validate cache 97196 = some 97416 := checked_97196_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 97196 97416 checked
  omega

theorem within_body : 97416 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97196 97416 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97196 97416 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97196 97416 address = observedPair address :=
  cachedPair_eq cache 97196 97416 checked address

end SourceCache732Pilot
open LookupCachePilot
namespace SourceCache733Pilot
theorem checked_97416_152 : validate cache_97416_152 97416 =
    some 97568 := by
  decide +kernel
theorem checked_97568_153 : validate cache_97568_153 97568 =
    some 97721 := by
  decide +kernel
theorem checked_97416_305 : validate cache_97416_305 97416 =
    some 97721 := by
  exact validate_branch 152 cache_97416_152 cache_97568_153
    97416 97568 97721
    checked_97416_152 rfl checked_97568_153

theorem checked : validate cache 97416 = some 97721 := checked_97416_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 97416 97721 checked
  omega

theorem within_body : 97721 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97416 97721 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97416 97721 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97416 97721 address = observedPair address :=
  cachedPair_eq cache 97416 97721 checked address

end SourceCache733Pilot
open LookupCachePilot
namespace SourceCache734Pilot
theorem checked_97721_70 : validate cache_97721_70 97721 =
    some 97791 := by
  decide +kernel

theorem checked : validate cache 97721 = some 97791 := checked_97721_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 97721 97791 checked
  omega

theorem within_body : 97791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97721 97791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97721 97791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97721 97791 address = observedPair address :=
  cachedPair_eq cache 97721 97791 checked address

end SourceCache734Pilot
open LookupCachePilot
namespace SourceCache735Pilot
theorem checked_97791_195 : validate cache_97791_195 97791 =
    some 97986 := by
  decide +kernel

theorem checked : validate cache 97791 = some 97986 := checked_97791_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 97791 97986 checked
  omega

theorem within_body : 97986 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97791 97986 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97791 97986 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97791 97986 address = observedPair address :=
  cachedPair_eq cache 97791 97986 checked address

end SourceCache735Pilot
open LookupCachePilot
namespace SourceCache736Pilot
theorem checked_97986_70 : validate cache_97986_70 97986 =
    some 98056 := by
  decide +kernel

theorem checked : validate cache 97986 = some 98056 := checked_97986_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 97986 98056 checked
  omega

theorem within_body : 98056 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 97986 98056 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 97986 98056 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 97986 98056 address = observedPair address :=
  cachedPair_eq cache 97986 98056 checked address

end SourceCache736Pilot
namespace ScopeViews007Pilot
noncomputable def fromRaw_663 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache663Pilot.cache 81936 82606)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache663Pilot.cache
    81936 82606 SourceCache663Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_664 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache664Pilot.cache 82606 82976)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache664Pilot.cache
    82606 82976 SourceCache664Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_665 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache665Pilot.cache 82976 82981)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache665Pilot.cache
    82976 82981 SourceCache665Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_666 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache666Pilot.cache 82981 83051)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache666Pilot.cache
    82981 83051 SourceCache666Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_667 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache667Pilot.cache 83051 83451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache667Pilot.cache
    83051 83451 SourceCache667Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_668 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache668Pilot.cache 83451 83456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache668Pilot.cache
    83451 83456 SourceCache668Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_669 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache669Pilot.cache 83456 83466)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache669Pilot.cache
    83456 83466 SourceCache669Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_670 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache670Pilot.cache 83466 84136)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache670Pilot.cache
    83466 84136 SourceCache670Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_671 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache671Pilot.cache 84136 84846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache671Pilot.cache
    84136 84846 SourceCache671Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_672 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache672Pilot.cache 84846 84916)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache672Pilot.cache
    84846 84916 SourceCache672Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_673 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache673Pilot.cache 84916 85111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache673Pilot.cache
    84916 85111 SourceCache673Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_674 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache674Pilot.cache 85111 85181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache674Pilot.cache
    85111 85181 SourceCache674Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_675 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache675Pilot.cache 85181 85851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache675Pilot.cache
    85181 85851 SourceCache675Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_676 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache676Pilot.cache 85851 85856)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache676Pilot.cache
    85851 85856 SourceCache676Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_677 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache677Pilot.cache 85856 85926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache677Pilot.cache
    85856 85926 SourceCache677Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_678 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache678Pilot.cache 85926 86446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache678Pilot.cache
    85926 86446 SourceCache678Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_679 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache679Pilot.cache 86446 86516)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache679Pilot.cache
    86446 86516 SourceCache679Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_680 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache680Pilot.cache 86516 87051)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache680Pilot.cache
    86516 87051 SourceCache680Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_681 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache681Pilot.cache 87051 87571)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache681Pilot.cache
    87051 87571 SourceCache681Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_682 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache682Pilot.cache 87571 87576)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache682Pilot.cache
    87571 87576 SourceCache682Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_683 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache683Pilot.cache 87576 87646)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache683Pilot.cache
    87576 87646 SourceCache683Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_684 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache684Pilot.cache 87646 88181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache684Pilot.cache
    87646 88181 SourceCache684Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_685 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache685Pilot.cache 88181 88186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache685Pilot.cache
    88181 88186 SourceCache685Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_686 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache686Pilot.cache 88186 88196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache686Pilot.cache
    88186 88196 SourceCache686Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_687 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache687Pilot.cache 88196 88566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache687Pilot.cache
    88196 88566 SourceCache687Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_688 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache688Pilot.cache 88566 89006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache688Pilot.cache
    88566 89006 SourceCache688Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_689 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache689Pilot.cache 89006 89076)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache689Pilot.cache
    89006 89076 SourceCache689Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_690 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache690Pilot.cache 89076 89271)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache690Pilot.cache
    89076 89271 SourceCache690Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_691 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache691Pilot.cache 89271 89341)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache691Pilot.cache
    89271 89341 SourceCache691Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_692 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache692Pilot.cache 89341 89741)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache692Pilot.cache
    89341 89741 SourceCache692Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_693 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache693Pilot.cache 89741 89746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache693Pilot.cache
    89741 89746 SourceCache693Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_694 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache694Pilot.cache 89746 89816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache694Pilot.cache
    89746 89816 SourceCache694Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_695 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache695Pilot.cache 89816 90186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache695Pilot.cache
    89816 90186 SourceCache695Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_696 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache696Pilot.cache 90186 90191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache696Pilot.cache
    90186 90191 SourceCache696Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_697 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache697Pilot.cache 90191 90261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache697Pilot.cache
    90191 90261 SourceCache697Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_698 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache698Pilot.cache 90261 90661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache698Pilot.cache
    90261 90661 SourceCache698Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_699 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache699Pilot.cache 90661 90666)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache699Pilot.cache
    90661 90666 SourceCache699Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_700 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache700Pilot.cache 90666 90676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache700Pilot.cache
    90666 90676 SourceCache700Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_701 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache701Pilot.cache 90676 90896)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache701Pilot.cache
    90676 90896 SourceCache701Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_702 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache702Pilot.cache 90896 91201)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache702Pilot.cache
    90896 91201 SourceCache702Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_703 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache703Pilot.cache 91201 91271)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache703Pilot.cache
    91201 91271 SourceCache703Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_704 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache704Pilot.cache 91271 91466)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache704Pilot.cache
    91271 91466 SourceCache704Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_705 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache705Pilot.cache 91466 91536)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache705Pilot.cache
    91466 91536 SourceCache705Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_706 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache706Pilot.cache 91536 91801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache706Pilot.cache
    91536 91801 SourceCache706Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_707 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache707Pilot.cache 91801 91806)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache707Pilot.cache
    91801 91806 SourceCache707Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_708 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache708Pilot.cache 91806 91876)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache708Pilot.cache
    91806 91876 SourceCache708Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_709 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache709Pilot.cache 91876 92546)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache709Pilot.cache
    91876 92546 SourceCache709Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_710 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache710Pilot.cache 92546 92616)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache710Pilot.cache
    92546 92616 SourceCache710Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_711 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache711Pilot.cache 92616 93286)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache711Pilot.cache
    92616 93286 SourceCache711Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_712 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache712Pilot.cache 93286 93956)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache712Pilot.cache
    93286 93956 SourceCache712Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_713 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache713Pilot.cache 93956 93961)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache713Pilot.cache
    93956 93961 SourceCache713Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_714 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache714Pilot.cache 93961 94031)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache714Pilot.cache
    93961 94031 SourceCache714Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_715 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache715Pilot.cache 94031 94701)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache715Pilot.cache
    94031 94701 SourceCache715Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_716 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache716Pilot.cache 94701 94706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache716Pilot.cache
    94701 94706 SourceCache716Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_717 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache717Pilot.cache 94706 94716)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache717Pilot.cache
    94706 94716 SourceCache717Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_718 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache718Pilot.cache 94716 95086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache718Pilot.cache
    94716 95086 SourceCache718Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_719 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache719Pilot.cache 95086 95526)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache719Pilot.cache
    95086 95526 SourceCache719Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_720 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache720Pilot.cache 95526 95596)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache720Pilot.cache
    95526 95596 SourceCache720Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_721 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache721Pilot.cache 95596 95791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache721Pilot.cache
    95596 95791 SourceCache721Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_722 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache722Pilot.cache 95791 95861)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache722Pilot.cache
    95791 95861 SourceCache722Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_723 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache723Pilot.cache 95861 96261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache723Pilot.cache
    95861 96261 SourceCache723Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_724 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache724Pilot.cache 96261 96266)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache724Pilot.cache
    96261 96266 SourceCache724Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_725 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache725Pilot.cache 96266 96336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache725Pilot.cache
    96266 96336 SourceCache725Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_726 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache726Pilot.cache 96336 96706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache726Pilot.cache
    96336 96706 SourceCache726Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_727 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache727Pilot.cache 96706 96711)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache727Pilot.cache
    96706 96711 SourceCache727Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_728 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache728Pilot.cache 96711 96781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache728Pilot.cache
    96711 96781 SourceCache728Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_729 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache729Pilot.cache 96781 97181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache729Pilot.cache
    96781 97181 SourceCache729Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_730 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache730Pilot.cache 97181 97186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache730Pilot.cache
    97181 97186 SourceCache730Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_731 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache731Pilot.cache 97186 97196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache731Pilot.cache
    97186 97196 SourceCache731Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_732 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache732Pilot.cache 97196 97416)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache732Pilot.cache
    97196 97416 SourceCache732Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_733 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache733Pilot.cache 97416 97721)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache733Pilot.cache
    97416 97721 SourceCache733Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_734 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache734Pilot.cache 97721 97791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache734Pilot.cache
    97721 97791 SourceCache734Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_735 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache735Pilot.cache 97791 97986)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache735Pilot.cache
    97791 97986 SourceCache735Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_736 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache736Pilot.cache 97986 98056)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache736Pilot.cache
    97986 98056 SourceCache736Pilot.checked q raw nodes returns truth
end ScopeViews007Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
