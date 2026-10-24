module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews005Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache510Pilot
theorem checked_49696_167 : validate cache_49696_167 49696 =
    some 49863 := by
  decide +kernel
theorem checked_49863_168 : validate cache_49863_168 49863 =
    some 50031 := by
  decide +kernel
theorem checked_49696_335 : validate cache_49696_335 49696 =
    some 50031 := by
  exact validate_branch 167 cache_49696_167 cache_49863_168
    49696 49863 50031
    checked_49696_167 rfl checked_49863_168
theorem checked_50031_167 : validate cache_50031_167 50031 =
    some 50198 := by
  decide +kernel
theorem checked_50198_168 : validate cache_50198_168 50198 =
    some 50366 := by
  decide +kernel
theorem checked_50031_335 : validate cache_50031_335 50031 =
    some 50366 := by
  exact validate_branch 167 cache_50031_167 cache_50198_168
    50031 50198 50366
    checked_50031_167 rfl checked_50198_168
theorem checked_49696_670 : validate cache_49696_670 49696 =
    some 50366 := by
  exact validate_branch 335 cache_49696_335 cache_50031_335
    49696 50031 50366
    checked_49696_335 rfl checked_50031_335

theorem checked : validate cache 49696 = some 50366 := checked_49696_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 49696 50366 checked
  omega

theorem within_body : 50366 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 49696 50366 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 49696 50366 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 49696 50366 address = observedPair address :=
  cachedPair_eq cache 49696 50366 checked address

end SourceCache510Pilot
open LookupCachePilot
namespace SourceCache511Pilot
theorem checked_50366_5 : validate cache_50366_5 50366 =
    some 50371 := by
  decide +kernel

theorem checked : validate cache 50366 = some 50371 := checked_50366_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 50366 50371 checked
  omega

theorem within_body : 50371 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 50366 50371 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 50366 50371 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 50366 50371 address = observedPair address :=
  cachedPair_eq cache 50366 50371 checked address

end SourceCache511Pilot
open LookupCachePilot
namespace SourceCache512Pilot
theorem checked_50371_10 : validate cache_50371_10 50371 =
    some 50381 := by
  decide +kernel

theorem checked : validate cache 50371 = some 50381 := checked_50371_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 50371 50381 checked
  omega

theorem within_body : 50381 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 50371 50381 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 50371 50381 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 50371 50381 address = observedPair address :=
  cachedPair_eq cache 50371 50381 checked address

end SourceCache512Pilot
open LookupCachePilot
namespace SourceCache513Pilot
theorem checked_50381_185 : validate cache_50381_185 50381 =
    some 50566 := by
  decide +kernel
theorem checked_50566_185 : validate cache_50566_185 50566 =
    some 50751 := by
  decide +kernel
theorem checked_50381_370 : validate cache_50381_370 50381 =
    some 50751 := by
  exact validate_branch 185 cache_50381_185 cache_50566_185
    50381 50566 50751
    checked_50381_185 rfl checked_50566_185

theorem checked : validate cache 50381 = some 50751 := checked_50381_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 50381 50751 checked
  omega

theorem within_body : 50751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 50381 50751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 50381 50751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 50381 50751 address = observedPair address :=
  cachedPair_eq cache 50381 50751 checked address

end SourceCache513Pilot
open LookupCachePilot
namespace SourceCache514Pilot
theorem checked_50751_220 : validate cache_50751_220 50751 =
    some 50971 := by
  decide +kernel
theorem checked_50971_220 : validate cache_50971_220 50971 =
    some 51191 := by
  decide +kernel
theorem checked_50751_440 : validate cache_50751_440 50751 =
    some 51191 := by
  exact validate_branch 220 cache_50751_220 cache_50971_220
    50751 50971 51191
    checked_50751_220 rfl checked_50971_220

theorem checked : validate cache 50751 = some 51191 := checked_50751_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 50751 51191 checked
  omega

theorem within_body : 51191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 50751 51191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 50751 51191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 50751 51191 address = observedPair address :=
  cachedPair_eq cache 50751 51191 checked address

end SourceCache514Pilot
open LookupCachePilot
namespace SourceCache515Pilot
theorem checked_51191_70 : validate cache_51191_70 51191 =
    some 51261 := by
  decide +kernel

theorem checked : validate cache 51191 = some 51261 := checked_51191_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 51191 51261 checked
  omega

theorem within_body : 51261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51191 51261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51191 51261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51191 51261 address = observedPair address :=
  cachedPair_eq cache 51191 51261 checked address

end SourceCache515Pilot
open LookupCachePilot
namespace SourceCache516Pilot
theorem checked_51261_195 : validate cache_51261_195 51261 =
    some 51456 := by
  decide +kernel

theorem checked : validate cache 51261 = some 51456 := checked_51261_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 51261 51456 checked
  omega

theorem within_body : 51456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51261 51456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51261 51456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51261 51456 address = observedPair address :=
  cachedPair_eq cache 51261 51456 checked address

end SourceCache516Pilot
open LookupCachePilot
namespace SourceCache517Pilot
theorem checked_51456_70 : validate cache_51456_70 51456 =
    some 51526 := by
  decide +kernel

theorem checked : validate cache 51456 = some 51526 := checked_51456_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 51456 51526 checked
  omega

theorem within_body : 51526 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51456 51526 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51456 51526 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51456 51526 address = observedPair address :=
  cachedPair_eq cache 51456 51526 checked address

end SourceCache517Pilot
open LookupCachePilot
namespace SourceCache518Pilot
theorem checked_51526_200 : validate cache_51526_200 51526 =
    some 51726 := by
  decide +kernel
theorem checked_51726_200 : validate cache_51726_200 51726 =
    some 51926 := by
  decide +kernel
theorem checked_51526_400 : validate cache_51526_400 51526 =
    some 51926 := by
  exact validate_branch 200 cache_51526_200 cache_51726_200
    51526 51726 51926
    checked_51526_200 rfl checked_51726_200

theorem checked : validate cache 51526 = some 51926 := checked_51526_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 51526 51926 checked
  omega

theorem within_body : 51926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51526 51926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51526 51926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51526 51926 address = observedPair address :=
  cachedPair_eq cache 51526 51926 checked address

end SourceCache518Pilot
open LookupCachePilot
namespace SourceCache519Pilot
theorem checked_51926_5 : validate cache_51926_5 51926 =
    some 51931 := by
  decide +kernel

theorem checked : validate cache 51926 = some 51931 := checked_51926_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 51926 51931 checked
  omega

theorem within_body : 51931 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51926 51931 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51926 51931 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51926 51931 address = observedPair address :=
  cachedPair_eq cache 51926 51931 checked address

end SourceCache519Pilot
open LookupCachePilot
namespace SourceCache520Pilot
theorem checked_51931_70 : validate cache_51931_70 51931 =
    some 52001 := by
  decide +kernel

theorem checked : validate cache 51931 = some 52001 := checked_51931_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 51931 52001 checked
  omega

theorem within_body : 52001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51931 52001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51931 52001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51931 52001 address = observedPair address :=
  cachedPair_eq cache 51931 52001 checked address

end SourceCache520Pilot
open LookupCachePilot
namespace SourceCache521Pilot
theorem checked_52001_185 : validate cache_52001_185 52001 =
    some 52186 := by
  decide +kernel
theorem checked_52186_185 : validate cache_52186_185 52186 =
    some 52371 := by
  decide +kernel
theorem checked_52001_370 : validate cache_52001_370 52001 =
    some 52371 := by
  exact validate_branch 185 cache_52001_185 cache_52186_185
    52001 52186 52371
    checked_52001_185 rfl checked_52186_185

theorem checked : validate cache 52001 = some 52371 := checked_52001_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 52001 52371 checked
  omega

theorem within_body : 52371 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52001 52371 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52001 52371 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52001 52371 address = observedPair address :=
  cachedPair_eq cache 52001 52371 checked address

end SourceCache521Pilot
open LookupCachePilot
namespace SourceCache522Pilot
theorem checked_52371_5 : validate cache_52371_5 52371 =
    some 52376 := by
  decide +kernel

theorem checked : validate cache 52371 = some 52376 := checked_52371_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 52371 52376 checked
  omega

theorem within_body : 52376 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52371 52376 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52371 52376 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52371 52376 address = observedPair address :=
  cachedPair_eq cache 52371 52376 checked address

end SourceCache522Pilot
open LookupCachePilot
namespace SourceCache523Pilot
theorem checked_52376_70 : validate cache_52376_70 52376 =
    some 52446 := by
  decide +kernel

theorem checked : validate cache 52376 = some 52446 := checked_52376_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 52376 52446 checked
  omega

theorem within_body : 52446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52376 52446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52376 52446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52376 52446 address = observedPair address :=
  cachedPair_eq cache 52376 52446 checked address

end SourceCache523Pilot
open LookupCachePilot
namespace SourceCache524Pilot
theorem checked_52446_200 : validate cache_52446_200 52446 =
    some 52646 := by
  decide +kernel
theorem checked_52646_200 : validate cache_52646_200 52646 =
    some 52846 := by
  decide +kernel
theorem checked_52446_400 : validate cache_52446_400 52446 =
    some 52846 := by
  exact validate_branch 200 cache_52446_200 cache_52646_200
    52446 52646 52846
    checked_52446_200 rfl checked_52646_200

theorem checked : validate cache 52446 = some 52846 := checked_52446_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 52446 52846 checked
  omega

theorem within_body : 52846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52446 52846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52446 52846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52446 52846 address = observedPair address :=
  cachedPair_eq cache 52446 52846 checked address

end SourceCache524Pilot
open LookupCachePilot
namespace SourceCache525Pilot
theorem checked_52846_5 : validate cache_52846_5 52846 =
    some 52851 := by
  decide +kernel

theorem checked : validate cache 52846 = some 52851 := checked_52846_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 52846 52851 checked
  omega

theorem within_body : 52851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52846 52851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52846 52851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52846 52851 address = observedPair address :=
  cachedPair_eq cache 52846 52851 checked address

end SourceCache525Pilot
open LookupCachePilot
namespace SourceCache526Pilot
theorem checked_52851_10 : validate cache_52851_10 52851 =
    some 52861 := by
  decide +kernel

theorem checked : validate cache 52851 = some 52861 := checked_52851_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 52851 52861 checked
  omega

theorem within_body : 52861 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52851 52861 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52851 52861 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52851 52861 address = observedPair address :=
  cachedPair_eq cache 52851 52861 checked address

end SourceCache526Pilot
open LookupCachePilot
namespace SourceCache527Pilot
theorem checked_52861_130 : validate cache_52861_130 52861 =
    some 52991 := by
  decide +kernel
theorem checked_52991_130 : validate cache_52991_130 52991 =
    some 53121 := by
  decide +kernel
theorem checked_52861_260 : validate cache_52861_260 52861 =
    some 53121 := by
  exact validate_branch 130 cache_52861_130 cache_52991_130
    52861 52991 53121
    checked_52861_130 rfl checked_52991_130
theorem checked_53121_130 : validate cache_53121_130 53121 =
    some 53251 := by
  decide +kernel
theorem checked_53251_130 : validate cache_53251_130 53251 =
    some 53381 := by
  decide +kernel
theorem checked_53121_260 : validate cache_53121_260 53121 =
    some 53381 := by
  exact validate_branch 130 cache_53121_130 cache_53251_130
    53121 53251 53381
    checked_53121_130 rfl checked_53251_130
theorem checked_52861_520 : validate cache_52861_520 52861 =
    some 53381 := by
  exact validate_branch 260 cache_52861_260 cache_53121_260
    52861 53121 53381
    checked_52861_260 rfl checked_53121_260

theorem checked : validate cache 52861 = some 53381 := checked_52861_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 52861 53381 checked
  omega

theorem within_body : 53381 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 52861 53381 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 52861 53381 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 52861 53381 address = observedPair address :=
  cachedPair_eq cache 52861 53381 checked address

end SourceCache527Pilot
open LookupCachePilot
namespace SourceCache528Pilot
theorem checked_53381_143 : validate cache_53381_143 53381 =
    some 53524 := by
  decide +kernel
theorem checked_53524_144 : validate cache_53524_144 53524 =
    some 53668 := by
  decide +kernel
theorem checked_53381_287 : validate cache_53381_287 53381 =
    some 53668 := by
  exact validate_branch 143 cache_53381_143 cache_53524_144
    53381 53524 53668
    checked_53381_143 rfl checked_53524_144
theorem checked_53668_144 : validate cache_53668_144 53668 =
    some 53812 := by
  decide +kernel
theorem checked_53812_144 : validate cache_53812_144 53812 =
    some 53956 := by
  decide +kernel
theorem checked_53668_288 : validate cache_53668_288 53668 =
    some 53956 := by
  exact validate_branch 144 cache_53668_144 cache_53812_144
    53668 53812 53956
    checked_53668_144 rfl checked_53812_144
theorem checked_53381_575 : validate cache_53381_575 53381 =
    some 53956 := by
  exact validate_branch 287 cache_53381_287 cache_53668_288
    53381 53668 53956
    checked_53381_287 rfl checked_53668_288

theorem checked : validate cache 53381 = some 53956 := checked_53381_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 53381 53956 checked
  omega

theorem within_body : 53956 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 53381 53956 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 53381 53956 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 53381 53956 address = observedPair address :=
  cachedPair_eq cache 53381 53956 checked address

end SourceCache528Pilot
open LookupCachePilot
namespace SourceCache529Pilot
theorem checked_53956_70 : validate cache_53956_70 53956 =
    some 54026 := by
  decide +kernel

theorem checked : validate cache 53956 = some 54026 := checked_53956_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 53956 54026 checked
  omega

theorem within_body : 54026 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 53956 54026 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 53956 54026 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 53956 54026 address = observedPair address :=
  cachedPair_eq cache 53956 54026 checked address

end SourceCache529Pilot
open LookupCachePilot
namespace SourceCache530Pilot
theorem checked_54026_195 : validate cache_54026_195 54026 =
    some 54221 := by
  decide +kernel

theorem checked : validate cache 54026 = some 54221 := checked_54026_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 54026 54221 checked
  omega

theorem within_body : 54221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54026 54221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54026 54221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54026 54221 address = observedPair address :=
  cachedPair_eq cache 54026 54221 checked address

end SourceCache530Pilot
open LookupCachePilot
namespace SourceCache531Pilot
theorem checked_54221_70 : validate cache_54221_70 54221 =
    some 54291 := by
  decide +kernel

theorem checked : validate cache 54221 = some 54291 := checked_54221_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 54221 54291 checked
  omega

theorem within_body : 54291 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54221 54291 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54221 54291 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54221 54291 address = observedPair address :=
  cachedPair_eq cache 54221 54291 checked address

end SourceCache531Pilot
open LookupCachePilot
namespace SourceCache532Pilot
theorem checked_54291_133 : validate cache_54291_133 54291 =
    some 54424 := by
  decide +kernel
theorem checked_54424_134 : validate cache_54424_134 54424 =
    some 54558 := by
  decide +kernel
theorem checked_54291_267 : validate cache_54291_267 54291 =
    some 54558 := by
  exact validate_branch 133 cache_54291_133 cache_54424_134
    54291 54424 54558
    checked_54291_133 rfl checked_54424_134
theorem checked_54558_134 : validate cache_54558_134 54558 =
    some 54692 := by
  decide +kernel
theorem checked_54692_134 : validate cache_54692_134 54692 =
    some 54826 := by
  decide +kernel
theorem checked_54558_268 : validate cache_54558_268 54558 =
    some 54826 := by
  exact validate_branch 134 cache_54558_134 cache_54692_134
    54558 54692 54826
    checked_54558_134 rfl checked_54692_134
theorem checked_54291_535 : validate cache_54291_535 54291 =
    some 54826 := by
  exact validate_branch 267 cache_54291_267 cache_54558_268
    54291 54558 54826
    checked_54291_267 rfl checked_54558_268

theorem checked : validate cache 54291 = some 54826 := checked_54291_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 54291 54826 checked
  omega

theorem within_body : 54826 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54291 54826 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54291 54826 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54291 54826 address = observedPair address :=
  cachedPair_eq cache 54291 54826 checked address

end SourceCache532Pilot
open LookupCachePilot
namespace SourceCache533Pilot
theorem checked_54826_5 : validate cache_54826_5 54826 =
    some 54831 := by
  decide +kernel

theorem checked : validate cache 54826 = some 54831 := checked_54826_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 54826 54831 checked
  omega

theorem within_body : 54831 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54826 54831 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54826 54831 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54826 54831 address = observedPair address :=
  cachedPair_eq cache 54826 54831 checked address

end SourceCache533Pilot
open LookupCachePilot
namespace SourceCache534Pilot
theorem checked_54831_70 : validate cache_54831_70 54831 =
    some 54901 := by
  decide +kernel

theorem checked : validate cache 54831 = some 54901 := checked_54831_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 54831 54901 checked
  omega

theorem within_body : 54901 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54831 54901 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54831 54901 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54831 54901 address = observedPair address :=
  cachedPair_eq cache 54831 54901 checked address

end SourceCache534Pilot
open LookupCachePilot
namespace SourceCache535Pilot
theorem checked_54901_220 : validate cache_54901_220 54901 =
    some 55121 := by
  decide +kernel

theorem checked : validate cache 54901 = some 55121 := checked_54901_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 54901 55121 checked
  omega

theorem within_body : 55121 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 54901 55121 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 54901 55121 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 54901 55121 address = observedPair address :=
  cachedPair_eq cache 54901 55121 checked address

end SourceCache535Pilot
open LookupCachePilot
namespace SourceCache536Pilot
theorem checked_55121_70 : validate cache_55121_70 55121 =
    some 55191 := by
  decide +kernel

theorem checked : validate cache 55121 = some 55191 := checked_55121_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 55121 55191 checked
  omega

theorem within_body : 55191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 55121 55191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 55121 55191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 55121 55191 address = observedPair address :=
  cachedPair_eq cache 55121 55191 checked address

end SourceCache536Pilot
open LookupCachePilot
namespace SourceCache537Pilot
theorem checked_55191_132 : validate cache_55191_132 55191 =
    some 55323 := by
  decide +kernel
theorem checked_55323_133 : validate cache_55323_133 55323 =
    some 55456 := by
  decide +kernel
theorem checked_55191_265 : validate cache_55191_265 55191 =
    some 55456 := by
  exact validate_branch 132 cache_55191_132 cache_55323_133
    55191 55323 55456
    checked_55191_132 rfl checked_55323_133

theorem checked : validate cache 55191 = some 55456 := checked_55191_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 55191 55456 checked
  omega

theorem within_body : 55456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 55191 55456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 55191 55456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 55191 55456 address = observedPair address :=
  cachedPair_eq cache 55191 55456 checked address

end SourceCache537Pilot
open LookupCachePilot
namespace SourceCache538Pilot
theorem checked_55456_5 : validate cache_55456_5 55456 =
    some 55461 := by
  decide +kernel

theorem checked : validate cache 55456 = some 55461 := checked_55456_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 55456 55461 checked
  omega

theorem within_body : 55461 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 55456 55461 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 55456 55461 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 55456 55461 address = observedPair address :=
  cachedPair_eq cache 55456 55461 checked address

end SourceCache538Pilot
open LookupCachePilot
namespace SourceCache539Pilot
theorem checked_55461_70 : validate cache_55461_70 55461 =
    some 55531 := by
  decide +kernel

theorem checked : validate cache 55461 = some 55531 := checked_55461_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 55461 55531 checked
  omega

theorem within_body : 55531 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 55461 55531 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 55461 55531 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 55461 55531 address = observedPair address :=
  cachedPair_eq cache 55461 55531 checked address

end SourceCache539Pilot
open LookupCachePilot
namespace SourceCache540Pilot
theorem checked_55531_167 : validate cache_55531_167 55531 =
    some 55698 := by
  decide +kernel
theorem checked_55698_168 : validate cache_55698_168 55698 =
    some 55866 := by
  decide +kernel
theorem checked_55531_335 : validate cache_55531_335 55531 =
    some 55866 := by
  exact validate_branch 167 cache_55531_167 cache_55698_168
    55531 55698 55866
    checked_55531_167 rfl checked_55698_168
theorem checked_55866_167 : validate cache_55866_167 55866 =
    some 56033 := by
  decide +kernel
theorem checked_56033_168 : validate cache_56033_168 56033 =
    some 56201 := by
  decide +kernel
theorem checked_55866_335 : validate cache_55866_335 55866 =
    some 56201 := by
  exact validate_branch 167 cache_55866_167 cache_56033_168
    55866 56033 56201
    checked_55866_167 rfl checked_56033_168
theorem checked_55531_670 : validate cache_55531_670 55531 =
    some 56201 := by
  exact validate_branch 335 cache_55531_335 cache_55866_335
    55531 55866 56201
    checked_55531_335 rfl checked_55866_335

theorem checked : validate cache 55531 = some 56201 := checked_55531_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 55531 56201 checked
  omega

theorem within_body : 56201 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 55531 56201 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 55531 56201 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 55531 56201 address = observedPair address :=
  cachedPair_eq cache 55531 56201 checked address

end SourceCache540Pilot
open LookupCachePilot
namespace SourceCache541Pilot
theorem checked_56201_70 : validate cache_56201_70 56201 =
    some 56271 := by
  decide +kernel

theorem checked : validate cache 56201 = some 56271 := checked_56201_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 56201 56271 checked
  omega

theorem within_body : 56271 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 56201 56271 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 56201 56271 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 56201 56271 address = observedPair address :=
  cachedPair_eq cache 56201 56271 checked address

end SourceCache541Pilot
open LookupCachePilot
namespace SourceCache542Pilot
theorem checked_56271_167 : validate cache_56271_167 56271 =
    some 56438 := by
  decide +kernel
theorem checked_56438_168 : validate cache_56438_168 56438 =
    some 56606 := by
  decide +kernel
theorem checked_56271_335 : validate cache_56271_335 56271 =
    some 56606 := by
  exact validate_branch 167 cache_56271_167 cache_56438_168
    56271 56438 56606
    checked_56271_167 rfl checked_56438_168
theorem checked_56606_167 : validate cache_56606_167 56606 =
    some 56773 := by
  decide +kernel
theorem checked_56773_168 : validate cache_56773_168 56773 =
    some 56941 := by
  decide +kernel
theorem checked_56606_335 : validate cache_56606_335 56606 =
    some 56941 := by
  exact validate_branch 167 cache_56606_167 cache_56773_168
    56606 56773 56941
    checked_56606_167 rfl checked_56773_168
theorem checked_56271_670 : validate cache_56271_670 56271 =
    some 56941 := by
  exact validate_branch 335 cache_56271_335 cache_56606_335
    56271 56606 56941
    checked_56271_335 rfl checked_56606_335

theorem checked : validate cache 56271 = some 56941 := checked_56271_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 56271 56941 checked
  omega

theorem within_body : 56941 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 56271 56941 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 56271 56941 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 56271 56941 address = observedPair address :=
  cachedPair_eq cache 56271 56941 checked address

end SourceCache542Pilot
open LookupCachePilot
namespace SourceCache543Pilot
theorem checked_56941_167 : validate cache_56941_167 56941 =
    some 57108 := by
  decide +kernel
theorem checked_57108_168 : validate cache_57108_168 57108 =
    some 57276 := by
  decide +kernel
theorem checked_56941_335 : validate cache_56941_335 56941 =
    some 57276 := by
  exact validate_branch 167 cache_56941_167 cache_57108_168
    56941 57108 57276
    checked_56941_167 rfl checked_57108_168
theorem checked_57276_167 : validate cache_57276_167 57276 =
    some 57443 := by
  decide +kernel
theorem checked_57443_168 : validate cache_57443_168 57443 =
    some 57611 := by
  decide +kernel
theorem checked_57276_335 : validate cache_57276_335 57276 =
    some 57611 := by
  exact validate_branch 167 cache_57276_167 cache_57443_168
    57276 57443 57611
    checked_57276_167 rfl checked_57443_168
theorem checked_56941_670 : validate cache_56941_670 56941 =
    some 57611 := by
  exact validate_branch 335 cache_56941_335 cache_57276_335
    56941 57276 57611
    checked_56941_335 rfl checked_57276_335

theorem checked : validate cache 56941 = some 57611 := checked_56941_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 56941 57611 checked
  omega

theorem within_body : 57611 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 56941 57611 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 56941 57611 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 56941 57611 address = observedPair address :=
  cachedPair_eq cache 56941 57611 checked address

end SourceCache543Pilot
open LookupCachePilot
namespace SourceCache544Pilot
theorem checked_57611_5 : validate cache_57611_5 57611 =
    some 57616 := by
  decide +kernel

theorem checked : validate cache 57611 = some 57616 := checked_57611_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 57611 57616 checked
  omega

theorem within_body : 57616 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 57611 57616 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 57611 57616 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 57611 57616 address = observedPair address :=
  cachedPair_eq cache 57611 57616 checked address

end SourceCache544Pilot
open LookupCachePilot
namespace SourceCache545Pilot
theorem checked_57616_70 : validate cache_57616_70 57616 =
    some 57686 := by
  decide +kernel

theorem checked : validate cache 57616 = some 57686 := checked_57616_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 57616 57686 checked
  omega

theorem within_body : 57686 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 57616 57686 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 57616 57686 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 57616 57686 address = observedPair address :=
  cachedPair_eq cache 57616 57686 checked address

end SourceCache545Pilot
open LookupCachePilot
namespace SourceCache546Pilot
theorem checked_57686_167 : validate cache_57686_167 57686 =
    some 57853 := by
  decide +kernel
theorem checked_57853_168 : validate cache_57853_168 57853 =
    some 58021 := by
  decide +kernel
theorem checked_57686_335 : validate cache_57686_335 57686 =
    some 58021 := by
  exact validate_branch 167 cache_57686_167 cache_57853_168
    57686 57853 58021
    checked_57686_167 rfl checked_57853_168
theorem checked_58021_167 : validate cache_58021_167 58021 =
    some 58188 := by
  decide +kernel
theorem checked_58188_168 : validate cache_58188_168 58188 =
    some 58356 := by
  decide +kernel
theorem checked_58021_335 : validate cache_58021_335 58021 =
    some 58356 := by
  exact validate_branch 167 cache_58021_167 cache_58188_168
    58021 58188 58356
    checked_58021_167 rfl checked_58188_168
theorem checked_57686_670 : validate cache_57686_670 57686 =
    some 58356 := by
  exact validate_branch 335 cache_57686_335 cache_58021_335
    57686 58021 58356
    checked_57686_335 rfl checked_58021_335

theorem checked : validate cache 57686 = some 58356 := checked_57686_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 57686 58356 checked
  omega

theorem within_body : 58356 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 57686 58356 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 57686 58356 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 57686 58356 address = observedPair address :=
  cachedPair_eq cache 57686 58356 checked address

end SourceCache546Pilot
open LookupCachePilot
namespace SourceCache547Pilot
theorem checked_58356_5 : validate cache_58356_5 58356 =
    some 58361 := by
  decide +kernel

theorem checked : validate cache 58356 = some 58361 := checked_58356_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 58356 58361 checked
  omega

theorem within_body : 58361 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58356 58361 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58356 58361 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58356 58361 address = observedPair address :=
  cachedPair_eq cache 58356 58361 checked address

end SourceCache547Pilot
open LookupCachePilot
namespace SourceCache548Pilot
theorem checked_58361_70 : validate cache_58361_70 58361 =
    some 58431 := by
  decide +kernel

theorem checked : validate cache 58361 = some 58431 := checked_58361_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 58361 58431 checked
  omega

theorem within_body : 58431 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58361 58431 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58361 58431 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58361 58431 address = observedPair address :=
  cachedPair_eq cache 58361 58431 checked address

end SourceCache548Pilot
open LookupCachePilot
namespace SourceCache549Pilot
theorem checked_58431_220 : validate cache_58431_220 58431 =
    some 58651 := by
  decide +kernel

theorem checked : validate cache 58431 = some 58651 := checked_58431_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 58431 58651 checked
  omega

theorem within_body : 58651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58431 58651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58431 58651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58431 58651 address = observedPair address :=
  cachedPair_eq cache 58431 58651 checked address

end SourceCache549Pilot
open LookupCachePilot
namespace SourceCache550Pilot
theorem checked_58651_5 : validate cache_58651_5 58651 =
    some 58656 := by
  decide +kernel

theorem checked : validate cache 58651 = some 58656 := checked_58651_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 58651 58656 checked
  omega

theorem within_body : 58656 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58651 58656 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58651 58656 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58651 58656 address = observedPair address :=
  cachedPair_eq cache 58651 58656 checked address

end SourceCache550Pilot
open LookupCachePilot
namespace SourceCache551Pilot
theorem checked_58656_70 : validate cache_58656_70 58656 =
    some 58726 := by
  decide +kernel

theorem checked : validate cache 58656 = some 58726 := checked_58656_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 58656 58726 checked
  omega

theorem within_body : 58726 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58656 58726 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58656 58726 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58656 58726 address = observedPair address :=
  cachedPair_eq cache 58656 58726 checked address

end SourceCache551Pilot
open LookupCachePilot
namespace SourceCache552Pilot
theorem checked_58726_132 : validate cache_58726_132 58726 =
    some 58858 := by
  decide +kernel
theorem checked_58858_133 : validate cache_58858_133 58858 =
    some 58991 := by
  decide +kernel
theorem checked_58726_265 : validate cache_58726_265 58726 =
    some 58991 := by
  exact validate_branch 132 cache_58726_132 cache_58858_133
    58726 58858 58991
    checked_58726_132 rfl checked_58858_133

theorem checked : validate cache 58726 = some 58991 := checked_58726_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 58726 58991 checked
  omega

theorem within_body : 58991 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58726 58991 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58726 58991 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58726 58991 address = observedPair address :=
  cachedPair_eq cache 58726 58991 checked address

end SourceCache552Pilot
open LookupCachePilot
namespace SourceCache553Pilot
theorem checked_58991_5 : validate cache_58991_5 58991 =
    some 58996 := by
  decide +kernel

theorem checked : validate cache 58991 = some 58996 := checked_58991_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 58991 58996 checked
  omega

theorem within_body : 58996 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58991 58996 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58991 58996 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58991 58996 address = observedPair address :=
  cachedPair_eq cache 58991 58996 checked address

end SourceCache553Pilot
open LookupCachePilot
namespace SourceCache554Pilot
theorem checked_58996_10 : validate cache_58996_10 58996 =
    some 59006 := by
  decide +kernel

theorem checked : validate cache 58996 = some 59006 := checked_58996_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 58996 59006 checked
  omega

theorem within_body : 59006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 58996 59006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 58996 59006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 58996 59006 address = observedPair address :=
  cachedPair_eq cache 58996 59006 checked address

end SourceCache554Pilot
open LookupCachePilot
namespace SourceCache555Pilot
theorem checked_59006_185 : validate cache_59006_185 59006 =
    some 59191 := by
  decide +kernel
theorem checked_59191_185 : validate cache_59191_185 59191 =
    some 59376 := by
  decide +kernel
theorem checked_59006_370 : validate cache_59006_370 59006 =
    some 59376 := by
  exact validate_branch 185 cache_59006_185 cache_59191_185
    59006 59191 59376
    checked_59006_185 rfl checked_59191_185

theorem checked : validate cache 59006 = some 59376 := checked_59006_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 59006 59376 checked
  omega

theorem within_body : 59376 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 59006 59376 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 59006 59376 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 59006 59376 address = observedPair address :=
  cachedPair_eq cache 59006 59376 checked address

end SourceCache555Pilot
open LookupCachePilot
namespace SourceCache556Pilot
theorem checked_59376_220 : validate cache_59376_220 59376 =
    some 59596 := by
  decide +kernel
theorem checked_59596_220 : validate cache_59596_220 59596 =
    some 59816 := by
  decide +kernel
theorem checked_59376_440 : validate cache_59376_440 59376 =
    some 59816 := by
  exact validate_branch 220 cache_59376_220 cache_59596_220
    59376 59596 59816
    checked_59376_220 rfl checked_59596_220

theorem checked : validate cache 59376 = some 59816 := checked_59376_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 59376 59816 checked
  omega

theorem within_body : 59816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 59376 59816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 59376 59816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 59376 59816 address = observedPair address :=
  cachedPair_eq cache 59376 59816 checked address

end SourceCache556Pilot
open LookupCachePilot
namespace SourceCache557Pilot
theorem checked_59816_70 : validate cache_59816_70 59816 =
    some 59886 := by
  decide +kernel

theorem checked : validate cache 59816 = some 59886 := checked_59816_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 59816 59886 checked
  omega

theorem within_body : 59886 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 59816 59886 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 59816 59886 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 59816 59886 address = observedPair address :=
  cachedPair_eq cache 59816 59886 checked address

end SourceCache557Pilot
open LookupCachePilot
namespace SourceCache558Pilot
theorem checked_59886_195 : validate cache_59886_195 59886 =
    some 60081 := by
  decide +kernel

theorem checked : validate cache 59886 = some 60081 := checked_59886_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 59886 60081 checked
  omega

theorem within_body : 60081 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 59886 60081 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 59886 60081 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 59886 60081 address = observedPair address :=
  cachedPair_eq cache 59886 60081 checked address

end SourceCache558Pilot
open LookupCachePilot
namespace SourceCache559Pilot
theorem checked_60081_70 : validate cache_60081_70 60081 =
    some 60151 := by
  decide +kernel

theorem checked : validate cache 60081 = some 60151 := checked_60081_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 60081 60151 checked
  omega

theorem within_body : 60151 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60081 60151 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60081 60151 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60081 60151 address = observedPair address :=
  cachedPair_eq cache 60081 60151 checked address

end SourceCache559Pilot
open LookupCachePilot
namespace SourceCache560Pilot
theorem checked_60151_200 : validate cache_60151_200 60151 =
    some 60351 := by
  decide +kernel
theorem checked_60351_200 : validate cache_60351_200 60351 =
    some 60551 := by
  decide +kernel
theorem checked_60151_400 : validate cache_60151_400 60151 =
    some 60551 := by
  exact validate_branch 200 cache_60151_200 cache_60351_200
    60151 60351 60551
    checked_60151_200 rfl checked_60351_200

theorem checked : validate cache 60151 = some 60551 := checked_60151_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 60151 60551 checked
  omega

theorem within_body : 60551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60151 60551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60151 60551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60151 60551 address = observedPair address :=
  cachedPair_eq cache 60151 60551 checked address

end SourceCache560Pilot
open LookupCachePilot
namespace SourceCache561Pilot
theorem checked_60551_5 : validate cache_60551_5 60551 =
    some 60556 := by
  decide +kernel

theorem checked : validate cache 60551 = some 60556 := checked_60551_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 60551 60556 checked
  omega

theorem within_body : 60556 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60551 60556 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60551 60556 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60551 60556 address = observedPair address :=
  cachedPair_eq cache 60551 60556 checked address

end SourceCache561Pilot
open LookupCachePilot
namespace SourceCache562Pilot
theorem checked_60556_70 : validate cache_60556_70 60556 =
    some 60626 := by
  decide +kernel

theorem checked : validate cache 60556 = some 60626 := checked_60556_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 60556 60626 checked
  omega

theorem within_body : 60626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60556 60626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60556 60626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60556 60626 address = observedPair address :=
  cachedPair_eq cache 60556 60626 checked address

end SourceCache562Pilot
open LookupCachePilot
namespace SourceCache563Pilot
theorem checked_60626_185 : validate cache_60626_185 60626 =
    some 60811 := by
  decide +kernel
theorem checked_60811_185 : validate cache_60811_185 60811 =
    some 60996 := by
  decide +kernel
theorem checked_60626_370 : validate cache_60626_370 60626 =
    some 60996 := by
  exact validate_branch 185 cache_60626_185 cache_60811_185
    60626 60811 60996
    checked_60626_185 rfl checked_60811_185

theorem checked : validate cache 60626 = some 60996 := checked_60626_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 60626 60996 checked
  omega

theorem within_body : 60996 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60626 60996 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60626 60996 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60626 60996 address = observedPair address :=
  cachedPair_eq cache 60626 60996 checked address

end SourceCache563Pilot
open LookupCachePilot
namespace SourceCache564Pilot
theorem checked_60996_5 : validate cache_60996_5 60996 =
    some 61001 := by
  decide +kernel

theorem checked : validate cache 60996 = some 61001 := checked_60996_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 60996 61001 checked
  omega

theorem within_body : 61001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 60996 61001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 60996 61001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 60996 61001 address = observedPair address :=
  cachedPair_eq cache 60996 61001 checked address

end SourceCache564Pilot
open LookupCachePilot
namespace SourceCache565Pilot
theorem checked_61001_70 : validate cache_61001_70 61001 =
    some 61071 := by
  decide +kernel

theorem checked : validate cache 61001 = some 61071 := checked_61001_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 61001 61071 checked
  omega

theorem within_body : 61071 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 61001 61071 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 61001 61071 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 61001 61071 address = observedPair address :=
  cachedPair_eq cache 61001 61071 checked address

end SourceCache565Pilot
open LookupCachePilot
namespace SourceCache566Pilot
theorem checked_61071_200 : validate cache_61071_200 61071 =
    some 61271 := by
  decide +kernel
theorem checked_61271_200 : validate cache_61271_200 61271 =
    some 61471 := by
  decide +kernel
theorem checked_61071_400 : validate cache_61071_400 61071 =
    some 61471 := by
  exact validate_branch 200 cache_61071_200 cache_61271_200
    61071 61271 61471
    checked_61071_200 rfl checked_61271_200

theorem checked : validate cache 61071 = some 61471 := checked_61071_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 61071 61471 checked
  omega

theorem within_body : 61471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 61071 61471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 61071 61471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 61071 61471 address = observedPair address :=
  cachedPair_eq cache 61071 61471 checked address

end SourceCache566Pilot
open LookupCachePilot
namespace SourceCache567Pilot
theorem checked_61471_5 : validate cache_61471_5 61471 =
    some 61476 := by
  decide +kernel

theorem checked : validate cache 61471 = some 61476 := checked_61471_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 61471 61476 checked
  omega

theorem within_body : 61476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 61471 61476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 61471 61476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 61471 61476 address = observedPair address :=
  cachedPair_eq cache 61471 61476 checked address

end SourceCache567Pilot
open LookupCachePilot
namespace SourceCache568Pilot
theorem checked_61476_10 : validate cache_61476_10 61476 =
    some 61486 := by
  decide +kernel

theorem checked : validate cache 61476 = some 61486 := checked_61476_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 61476 61486 checked
  omega

theorem within_body : 61486 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 61476 61486 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 61476 61486 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 61476 61486 address = observedPair address :=
  cachedPair_eq cache 61476 61486 checked address

end SourceCache568Pilot
open LookupCachePilot
namespace SourceCache569Pilot
theorem checked_61486_130 : validate cache_61486_130 61486 =
    some 61616 := by
  decide +kernel
theorem checked_61616_130 : validate cache_61616_130 61616 =
    some 61746 := by
  decide +kernel
theorem checked_61486_260 : validate cache_61486_260 61486 =
    some 61746 := by
  exact validate_branch 130 cache_61486_130 cache_61616_130
    61486 61616 61746
    checked_61486_130 rfl checked_61616_130
theorem checked_61746_130 : validate cache_61746_130 61746 =
    some 61876 := by
  decide +kernel
theorem checked_61876_130 : validate cache_61876_130 61876 =
    some 62006 := by
  decide +kernel
theorem checked_61746_260 : validate cache_61746_260 61746 =
    some 62006 := by
  exact validate_branch 130 cache_61746_130 cache_61876_130
    61746 61876 62006
    checked_61746_130 rfl checked_61876_130
theorem checked_61486_520 : validate cache_61486_520 61486 =
    some 62006 := by
  exact validate_branch 260 cache_61486_260 cache_61746_260
    61486 61746 62006
    checked_61486_260 rfl checked_61746_260

theorem checked : validate cache 61486 = some 62006 := checked_61486_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 61486 62006 checked
  omega

theorem within_body : 62006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 61486 62006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 61486 62006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 61486 62006 address = observedPair address :=
  cachedPair_eq cache 61486 62006 checked address

end SourceCache569Pilot
open LookupCachePilot
namespace SourceCache570Pilot
theorem checked_62006_143 : validate cache_62006_143 62006 =
    some 62149 := by
  decide +kernel
theorem checked_62149_144 : validate cache_62149_144 62149 =
    some 62293 := by
  decide +kernel
theorem checked_62006_287 : validate cache_62006_287 62006 =
    some 62293 := by
  exact validate_branch 143 cache_62006_143 cache_62149_144
    62006 62149 62293
    checked_62006_143 rfl checked_62149_144
theorem checked_62293_144 : validate cache_62293_144 62293 =
    some 62437 := by
  decide +kernel
theorem checked_62437_144 : validate cache_62437_144 62437 =
    some 62581 := by
  decide +kernel
theorem checked_62293_288 : validate cache_62293_288 62293 =
    some 62581 := by
  exact validate_branch 144 cache_62293_144 cache_62437_144
    62293 62437 62581
    checked_62293_144 rfl checked_62437_144
theorem checked_62006_575 : validate cache_62006_575 62006 =
    some 62581 := by
  exact validate_branch 287 cache_62006_287 cache_62293_288
    62006 62293 62581
    checked_62006_287 rfl checked_62293_288

theorem checked : validate cache 62006 = some 62581 := checked_62006_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 62006 62581 checked
  omega

theorem within_body : 62581 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 62006 62581 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 62006 62581 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 62006 62581 address = observedPair address :=
  cachedPair_eq cache 62006 62581 checked address

end SourceCache570Pilot
open LookupCachePilot
namespace SourceCache571Pilot
theorem checked_62581_70 : validate cache_62581_70 62581 =
    some 62651 := by
  decide +kernel

theorem checked : validate cache 62581 = some 62651 := checked_62581_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 62581 62651 checked
  omega

theorem within_body : 62651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 62581 62651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 62581 62651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 62581 62651 address = observedPair address :=
  cachedPair_eq cache 62581 62651 checked address

end SourceCache571Pilot
open LookupCachePilot
namespace SourceCache572Pilot
theorem checked_62651_195 : validate cache_62651_195 62651 =
    some 62846 := by
  decide +kernel

theorem checked : validate cache 62651 = some 62846 := checked_62651_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 62651 62846 checked
  omega

theorem within_body : 62846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 62651 62846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 62651 62846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 62651 62846 address = observedPair address :=
  cachedPair_eq cache 62651 62846 checked address

end SourceCache572Pilot
open LookupCachePilot
namespace SourceCache573Pilot
theorem checked_62846_70 : validate cache_62846_70 62846 =
    some 62916 := by
  decide +kernel

theorem checked : validate cache 62846 = some 62916 := checked_62846_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 62846 62916 checked
  omega

theorem within_body : 62916 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 62846 62916 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 62846 62916 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 62846 62916 address = observedPair address :=
  cachedPair_eq cache 62846 62916 checked address

end SourceCache573Pilot
open LookupCachePilot
namespace SourceCache574Pilot
theorem checked_62916_133 : validate cache_62916_133 62916 =
    some 63049 := by
  decide +kernel
theorem checked_63049_134 : validate cache_63049_134 63049 =
    some 63183 := by
  decide +kernel
theorem checked_62916_267 : validate cache_62916_267 62916 =
    some 63183 := by
  exact validate_branch 133 cache_62916_133 cache_63049_134
    62916 63049 63183
    checked_62916_133 rfl checked_63049_134
theorem checked_63183_134 : validate cache_63183_134 63183 =
    some 63317 := by
  decide +kernel
theorem checked_63317_134 : validate cache_63317_134 63317 =
    some 63451 := by
  decide +kernel
theorem checked_63183_268 : validate cache_63183_268 63183 =
    some 63451 := by
  exact validate_branch 134 cache_63183_134 cache_63317_134
    63183 63317 63451
    checked_63183_134 rfl checked_63317_134
theorem checked_62916_535 : validate cache_62916_535 62916 =
    some 63451 := by
  exact validate_branch 267 cache_62916_267 cache_63183_268
    62916 63183 63451
    checked_62916_267 rfl checked_63183_268

theorem checked : validate cache 62916 = some 63451 := checked_62916_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 62916 63451 checked
  omega

theorem within_body : 63451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 62916 63451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 62916 63451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 62916 63451 address = observedPair address :=
  cachedPair_eq cache 62916 63451 checked address

end SourceCache574Pilot
open LookupCachePilot
namespace SourceCache575Pilot
theorem checked_63451_5 : validate cache_63451_5 63451 =
    some 63456 := by
  decide +kernel

theorem checked : validate cache 63451 = some 63456 := checked_63451_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 63451 63456 checked
  omega

theorem within_body : 63456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 63451 63456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 63451 63456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 63451 63456 address = observedPair address :=
  cachedPair_eq cache 63451 63456 checked address

end SourceCache575Pilot
open LookupCachePilot
namespace SourceCache576Pilot
theorem checked_63456_70 : validate cache_63456_70 63456 =
    some 63526 := by
  decide +kernel

theorem checked : validate cache 63456 = some 63526 := checked_63456_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 63456 63526 checked
  omega

theorem within_body : 63526 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 63456 63526 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 63456 63526 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 63456 63526 address = observedPair address :=
  cachedPair_eq cache 63456 63526 checked address

end SourceCache576Pilot
open LookupCachePilot
namespace SourceCache577Pilot
theorem checked_63526_220 : validate cache_63526_220 63526 =
    some 63746 := by
  decide +kernel

theorem checked : validate cache 63526 = some 63746 := checked_63526_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 63526 63746 checked
  omega

theorem within_body : 63746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 63526 63746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 63526 63746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 63526 63746 address = observedPair address :=
  cachedPair_eq cache 63526 63746 checked address

end SourceCache577Pilot
open LookupCachePilot
namespace SourceCache578Pilot
theorem checked_63746_70 : validate cache_63746_70 63746 =
    some 63816 := by
  decide +kernel

theorem checked : validate cache 63746 = some 63816 := checked_63746_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 63746 63816 checked
  omega

theorem within_body : 63816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 63746 63816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 63746 63816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 63746 63816 address = observedPair address :=
  cachedPair_eq cache 63746 63816 checked address

end SourceCache578Pilot
open LookupCachePilot
namespace SourceCache579Pilot
theorem checked_63816_132 : validate cache_63816_132 63816 =
    some 63948 := by
  decide +kernel
theorem checked_63948_133 : validate cache_63948_133 63948 =
    some 64081 := by
  decide +kernel
theorem checked_63816_265 : validate cache_63816_265 63816 =
    some 64081 := by
  exact validate_branch 132 cache_63816_132 cache_63948_133
    63816 63948 64081
    checked_63816_132 rfl checked_63948_133

theorem checked : validate cache 63816 = some 64081 := checked_63816_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 63816 64081 checked
  omega

theorem within_body : 64081 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 63816 64081 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 63816 64081 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 63816 64081 address = observedPair address :=
  cachedPair_eq cache 63816 64081 checked address

end SourceCache579Pilot
open LookupCachePilot
namespace SourceCache580Pilot
theorem checked_64081_5 : validate cache_64081_5 64081 =
    some 64086 := by
  decide +kernel

theorem checked : validate cache 64081 = some 64086 := checked_64081_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 64081 64086 checked
  omega

theorem within_body : 64086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 64081 64086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 64081 64086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 64081 64086 address = observedPair address :=
  cachedPair_eq cache 64081 64086 checked address

end SourceCache580Pilot
open LookupCachePilot
namespace SourceCache581Pilot
theorem checked_64086_70 : validate cache_64086_70 64086 =
    some 64156 := by
  decide +kernel

theorem checked : validate cache 64086 = some 64156 := checked_64086_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 64086 64156 checked
  omega

theorem within_body : 64156 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 64086 64156 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 64086 64156 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 64086 64156 address = observedPair address :=
  cachedPair_eq cache 64086 64156 checked address

end SourceCache581Pilot
open LookupCachePilot
namespace SourceCache582Pilot
theorem checked_64156_167 : validate cache_64156_167 64156 =
    some 64323 := by
  decide +kernel
theorem checked_64323_168 : validate cache_64323_168 64323 =
    some 64491 := by
  decide +kernel
theorem checked_64156_335 : validate cache_64156_335 64156 =
    some 64491 := by
  exact validate_branch 167 cache_64156_167 cache_64323_168
    64156 64323 64491
    checked_64156_167 rfl checked_64323_168
theorem checked_64491_167 : validate cache_64491_167 64491 =
    some 64658 := by
  decide +kernel
theorem checked_64658_168 : validate cache_64658_168 64658 =
    some 64826 := by
  decide +kernel
theorem checked_64491_335 : validate cache_64491_335 64491 =
    some 64826 := by
  exact validate_branch 167 cache_64491_167 cache_64658_168
    64491 64658 64826
    checked_64491_167 rfl checked_64658_168
theorem checked_64156_670 : validate cache_64156_670 64156 =
    some 64826 := by
  exact validate_branch 335 cache_64156_335 cache_64491_335
    64156 64491 64826
    checked_64156_335 rfl checked_64491_335

theorem checked : validate cache 64156 = some 64826 := checked_64156_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 64156 64826 checked
  omega

theorem within_body : 64826 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 64156 64826 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 64156 64826 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 64156 64826 address = observedPair address :=
  cachedPair_eq cache 64156 64826 checked address

end SourceCache582Pilot
open LookupCachePilot
namespace SourceCache583Pilot
theorem checked_64826_70 : validate cache_64826_70 64826 =
    some 64896 := by
  decide +kernel

theorem checked : validate cache 64826 = some 64896 := checked_64826_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 64826 64896 checked
  omega

theorem within_body : 64896 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 64826 64896 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 64826 64896 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 64826 64896 address = observedPair address :=
  cachedPair_eq cache 64826 64896 checked address

end SourceCache583Pilot
open LookupCachePilot
namespace SourceCache584Pilot
theorem checked_64896_167 : validate cache_64896_167 64896 =
    some 65063 := by
  decide +kernel
theorem checked_65063_168 : validate cache_65063_168 65063 =
    some 65231 := by
  decide +kernel
theorem checked_64896_335 : validate cache_64896_335 64896 =
    some 65231 := by
  exact validate_branch 167 cache_64896_167 cache_65063_168
    64896 65063 65231
    checked_64896_167 rfl checked_65063_168
theorem checked_65231_167 : validate cache_65231_167 65231 =
    some 65398 := by
  decide +kernel
theorem checked_65398_168 : validate cache_65398_168 65398 =
    some 65566 := by
  decide +kernel
theorem checked_65231_335 : validate cache_65231_335 65231 =
    some 65566 := by
  exact validate_branch 167 cache_65231_167 cache_65398_168
    65231 65398 65566
    checked_65231_167 rfl checked_65398_168
theorem checked_64896_670 : validate cache_64896_670 64896 =
    some 65566 := by
  exact validate_branch 335 cache_64896_335 cache_65231_335
    64896 65231 65566
    checked_64896_335 rfl checked_65231_335

theorem checked : validate cache 64896 = some 65566 := checked_64896_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 64896 65566 checked
  omega

theorem within_body : 65566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 64896 65566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 64896 65566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 64896 65566 address = observedPair address :=
  cachedPair_eq cache 64896 65566 checked address

end SourceCache584Pilot
namespace ScopeViews005Pilot
noncomputable def fromRaw_510 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache510Pilot.cache 49696 50366)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache510Pilot.cache
    49696 50366 SourceCache510Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_511 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache511Pilot.cache 50366 50371)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache511Pilot.cache
    50366 50371 SourceCache511Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_512 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache512Pilot.cache 50371 50381)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache512Pilot.cache
    50371 50381 SourceCache512Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_513 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache513Pilot.cache 50381 50751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache513Pilot.cache
    50381 50751 SourceCache513Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_514 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache514Pilot.cache 50751 51191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache514Pilot.cache
    50751 51191 SourceCache514Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_515 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache515Pilot.cache 51191 51261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache515Pilot.cache
    51191 51261 SourceCache515Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_516 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache516Pilot.cache 51261 51456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache516Pilot.cache
    51261 51456 SourceCache516Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_517 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache517Pilot.cache 51456 51526)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache517Pilot.cache
    51456 51526 SourceCache517Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_518 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache518Pilot.cache 51526 51926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache518Pilot.cache
    51526 51926 SourceCache518Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_519 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache519Pilot.cache 51926 51931)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache519Pilot.cache
    51926 51931 SourceCache519Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_520 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache520Pilot.cache 51931 52001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache520Pilot.cache
    51931 52001 SourceCache520Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_521 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache521Pilot.cache 52001 52371)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache521Pilot.cache
    52001 52371 SourceCache521Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_522 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache522Pilot.cache 52371 52376)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache522Pilot.cache
    52371 52376 SourceCache522Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_523 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache523Pilot.cache 52376 52446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache523Pilot.cache
    52376 52446 SourceCache523Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_524 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache524Pilot.cache 52446 52846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache524Pilot.cache
    52446 52846 SourceCache524Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_525 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache525Pilot.cache 52846 52851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache525Pilot.cache
    52846 52851 SourceCache525Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_526 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache526Pilot.cache 52851 52861)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache526Pilot.cache
    52851 52861 SourceCache526Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_527 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache527Pilot.cache 52861 53381)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache527Pilot.cache
    52861 53381 SourceCache527Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_528 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache528Pilot.cache 53381 53956)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache528Pilot.cache
    53381 53956 SourceCache528Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_529 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache529Pilot.cache 53956 54026)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache529Pilot.cache
    53956 54026 SourceCache529Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_530 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache530Pilot.cache 54026 54221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache530Pilot.cache
    54026 54221 SourceCache530Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_531 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache531Pilot.cache 54221 54291)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache531Pilot.cache
    54221 54291 SourceCache531Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_532 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache532Pilot.cache 54291 54826)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache532Pilot.cache
    54291 54826 SourceCache532Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_533 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache533Pilot.cache 54826 54831)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache533Pilot.cache
    54826 54831 SourceCache533Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_534 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache534Pilot.cache 54831 54901)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache534Pilot.cache
    54831 54901 SourceCache534Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_535 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache535Pilot.cache 54901 55121)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache535Pilot.cache
    54901 55121 SourceCache535Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_536 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache536Pilot.cache 55121 55191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache536Pilot.cache
    55121 55191 SourceCache536Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_537 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache537Pilot.cache 55191 55456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache537Pilot.cache
    55191 55456 SourceCache537Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_538 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache538Pilot.cache 55456 55461)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache538Pilot.cache
    55456 55461 SourceCache538Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_539 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache539Pilot.cache 55461 55531)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache539Pilot.cache
    55461 55531 SourceCache539Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_540 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache540Pilot.cache 55531 56201)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache540Pilot.cache
    55531 56201 SourceCache540Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_541 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache541Pilot.cache 56201 56271)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache541Pilot.cache
    56201 56271 SourceCache541Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_542 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache542Pilot.cache 56271 56941)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache542Pilot.cache
    56271 56941 SourceCache542Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_543 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache543Pilot.cache 56941 57611)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache543Pilot.cache
    56941 57611 SourceCache543Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_544 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache544Pilot.cache 57611 57616)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache544Pilot.cache
    57611 57616 SourceCache544Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_545 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache545Pilot.cache 57616 57686)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache545Pilot.cache
    57616 57686 SourceCache545Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_546 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache546Pilot.cache 57686 58356)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache546Pilot.cache
    57686 58356 SourceCache546Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_547 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache547Pilot.cache 58356 58361)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache547Pilot.cache
    58356 58361 SourceCache547Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_548 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache548Pilot.cache 58361 58431)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache548Pilot.cache
    58361 58431 SourceCache548Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_549 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache549Pilot.cache 58431 58651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache549Pilot.cache
    58431 58651 SourceCache549Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_550 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache550Pilot.cache 58651 58656)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache550Pilot.cache
    58651 58656 SourceCache550Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_551 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache551Pilot.cache 58656 58726)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache551Pilot.cache
    58656 58726 SourceCache551Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_552 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache552Pilot.cache 58726 58991)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache552Pilot.cache
    58726 58991 SourceCache552Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_553 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache553Pilot.cache 58991 58996)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache553Pilot.cache
    58991 58996 SourceCache553Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_554 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache554Pilot.cache 58996 59006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache554Pilot.cache
    58996 59006 SourceCache554Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_555 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache555Pilot.cache 59006 59376)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache555Pilot.cache
    59006 59376 SourceCache555Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_556 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache556Pilot.cache 59376 59816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache556Pilot.cache
    59376 59816 SourceCache556Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_557 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache557Pilot.cache 59816 59886)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache557Pilot.cache
    59816 59886 SourceCache557Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_558 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache558Pilot.cache 59886 60081)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache558Pilot.cache
    59886 60081 SourceCache558Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_559 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache559Pilot.cache 60081 60151)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache559Pilot.cache
    60081 60151 SourceCache559Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_560 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache560Pilot.cache 60151 60551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache560Pilot.cache
    60151 60551 SourceCache560Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_561 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache561Pilot.cache 60551 60556)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache561Pilot.cache
    60551 60556 SourceCache561Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_562 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache562Pilot.cache 60556 60626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache562Pilot.cache
    60556 60626 SourceCache562Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_563 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache563Pilot.cache 60626 60996)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache563Pilot.cache
    60626 60996 SourceCache563Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_564 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache564Pilot.cache 60996 61001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache564Pilot.cache
    60996 61001 SourceCache564Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_565 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache565Pilot.cache 61001 61071)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache565Pilot.cache
    61001 61071 SourceCache565Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_566 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache566Pilot.cache 61071 61471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache566Pilot.cache
    61071 61471 SourceCache566Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_567 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache567Pilot.cache 61471 61476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache567Pilot.cache
    61471 61476 SourceCache567Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_568 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache568Pilot.cache 61476 61486)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache568Pilot.cache
    61476 61486 SourceCache568Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_569 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache569Pilot.cache 61486 62006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache569Pilot.cache
    61486 62006 SourceCache569Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_570 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache570Pilot.cache 62006 62581)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache570Pilot.cache
    62006 62581 SourceCache570Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_571 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache571Pilot.cache 62581 62651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache571Pilot.cache
    62581 62651 SourceCache571Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_572 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache572Pilot.cache 62651 62846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache572Pilot.cache
    62651 62846 SourceCache572Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_573 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache573Pilot.cache 62846 62916)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache573Pilot.cache
    62846 62916 SourceCache573Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_574 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache574Pilot.cache 62916 63451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache574Pilot.cache
    62916 63451 SourceCache574Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_575 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache575Pilot.cache 63451 63456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache575Pilot.cache
    63451 63456 SourceCache575Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_576 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache576Pilot.cache 63456 63526)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache576Pilot.cache
    63456 63526 SourceCache576Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_577 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache577Pilot.cache 63526 63746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache577Pilot.cache
    63526 63746 SourceCache577Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_578 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache578Pilot.cache 63746 63816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache578Pilot.cache
    63746 63816 SourceCache578Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_579 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache579Pilot.cache 63816 64081)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache579Pilot.cache
    63816 64081 SourceCache579Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_580 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache580Pilot.cache 64081 64086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache580Pilot.cache
    64081 64086 SourceCache580Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_581 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache581Pilot.cache 64086 64156)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache581Pilot.cache
    64086 64156 SourceCache581Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_582 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache582Pilot.cache 64156 64826)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache582Pilot.cache
    64156 64826 SourceCache582Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_583 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache583Pilot.cache 64826 64896)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache583Pilot.cache
    64826 64896 SourceCache583Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_584 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache584Pilot.cache 64896 65566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache584Pilot.cache
    64896 65566 SourceCache584Pilot.checked q raw nodes returns truth
end ScopeViews005Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
