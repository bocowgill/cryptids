module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews003Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache359Pilot
theorem checked_17566_167 : validate cache_17566_167 17566 =
    some 17733 := by
  decide +kernel
theorem checked_17733_168 : validate cache_17733_168 17733 =
    some 17901 := by
  decide +kernel
theorem checked_17566_335 : validate cache_17566_335 17566 =
    some 17901 := by
  exact validate_branch 167 cache_17566_167 cache_17733_168
    17566 17733 17901
    checked_17566_167 rfl checked_17733_168
theorem checked_17901_167 : validate cache_17901_167 17901 =
    some 18068 := by
  decide +kernel
theorem checked_18068_168 : validate cache_18068_168 18068 =
    some 18236 := by
  decide +kernel
theorem checked_17901_335 : validate cache_17901_335 17901 =
    some 18236 := by
  exact validate_branch 167 cache_17901_167 cache_18068_168
    17901 18068 18236
    checked_17901_167 rfl checked_18068_168
theorem checked_17566_670 : validate cache_17566_670 17566 =
    some 18236 := by
  exact validate_branch 335 cache_17566_335 cache_17901_335
    17566 17901 18236
    checked_17566_335 rfl checked_17901_335

theorem checked : validate cache 17566 = some 18236 := checked_17566_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 17566 18236 checked
  omega

theorem within_body : 18236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 17566 18236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 17566 18236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 17566 18236 address = observedPair address :=
  cachedPair_eq cache 17566 18236 checked address

end SourceCache359Pilot
open LookupCachePilot
namespace SourceCache360Pilot
theorem checked_18236_5 : validate cache_18236_5 18236 =
    some 18241 := by
  decide +kernel

theorem checked : validate cache 18236 = some 18241 := checked_18236_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 18236 18241 checked
  omega

theorem within_body : 18241 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18236 18241 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18236 18241 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18236 18241 address = observedPair address :=
  cachedPair_eq cache 18236 18241 checked address

end SourceCache360Pilot
open LookupCachePilot
namespace SourceCache361Pilot
theorem checked_18241_70 : validate cache_18241_70 18241 =
    some 18311 := by
  decide +kernel

theorem checked : validate cache 18241 = some 18311 := checked_18241_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 18241 18311 checked
  omega

theorem within_body : 18311 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18241 18311 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18241 18311 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18241 18311 address = observedPair address :=
  cachedPair_eq cache 18241 18311 checked address

end SourceCache361Pilot
open LookupCachePilot
namespace SourceCache362Pilot
theorem checked_18311_220 : validate cache_18311_220 18311 =
    some 18531 := by
  decide +kernel

theorem checked : validate cache 18311 = some 18531 := checked_18311_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 18311 18531 checked
  omega

theorem within_body : 18531 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18311 18531 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18311 18531 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18311 18531 address = observedPair address :=
  cachedPair_eq cache 18311 18531 checked address

end SourceCache362Pilot
open LookupCachePilot
namespace SourceCache363Pilot
theorem checked_18531_70 : validate cache_18531_70 18531 =
    some 18601 := by
  decide +kernel

theorem checked : validate cache 18531 = some 18601 := checked_18531_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 18531 18601 checked
  omega

theorem within_body : 18601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18531 18601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18531 18601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18531 18601 address = observedPair address :=
  cachedPair_eq cache 18531 18601 checked address

end SourceCache363Pilot
open LookupCachePilot
namespace SourceCache364Pilot
theorem checked_18601_132 : validate cache_18601_132 18601 =
    some 18733 := by
  decide +kernel
theorem checked_18733_133 : validate cache_18733_133 18733 =
    some 18866 := by
  decide +kernel
theorem checked_18601_265 : validate cache_18601_265 18601 =
    some 18866 := by
  exact validate_branch 132 cache_18601_132 cache_18733_133
    18601 18733 18866
    checked_18601_132 rfl checked_18733_133

theorem checked : validate cache 18601 = some 18866 := checked_18601_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 18601 18866 checked
  omega

theorem within_body : 18866 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18601 18866 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18601 18866 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18601 18866 address = observedPair address :=
  cachedPair_eq cache 18601 18866 checked address

end SourceCache364Pilot
open LookupCachePilot
namespace SourceCache365Pilot
theorem checked_18866_220 : validate cache_18866_220 18866 =
    some 19086 := by
  decide +kernel

theorem checked : validate cache 18866 = some 19086 := checked_18866_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 18866 19086 checked
  omega

theorem within_body : 19086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 18866 19086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 18866 19086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 18866 19086 address = observedPair address :=
  cachedPair_eq cache 18866 19086 checked address

end SourceCache365Pilot
open LookupCachePilot
namespace SourceCache366Pilot
theorem checked_19086_5 : validate cache_19086_5 19086 =
    some 19091 := by
  decide +kernel

theorem checked : validate cache 19086 = some 19091 := checked_19086_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 19086 19091 checked
  omega

theorem within_body : 19091 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19086 19091 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19086 19091 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19086 19091 address = observedPair address :=
  cachedPair_eq cache 19086 19091 checked address

end SourceCache366Pilot
open LookupCachePilot
namespace SourceCache367Pilot
theorem checked_19091_70 : validate cache_19091_70 19091 =
    some 19161 := by
  decide +kernel

theorem checked : validate cache 19091 = some 19161 := checked_19091_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 19091 19161 checked
  omega

theorem within_body : 19161 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19091 19161 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19091 19161 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19091 19161 address = observedPair address :=
  cachedPair_eq cache 19091 19161 checked address

end SourceCache367Pilot
open LookupCachePilot
namespace SourceCache368Pilot
theorem checked_19161_132 : validate cache_19161_132 19161 =
    some 19293 := by
  decide +kernel
theorem checked_19293_133 : validate cache_19293_133 19293 =
    some 19426 := by
  decide +kernel
theorem checked_19161_265 : validate cache_19161_265 19161 =
    some 19426 := by
  exact validate_branch 132 cache_19161_132 cache_19293_133
    19161 19293 19426
    checked_19161_132 rfl checked_19293_133

theorem checked : validate cache 19161 = some 19426 := checked_19161_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 19161 19426 checked
  omega

theorem within_body : 19426 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19161 19426 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19161 19426 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19161 19426 address = observedPair address :=
  cachedPair_eq cache 19161 19426 checked address

end SourceCache368Pilot
open LookupCachePilot
namespace SourceCache369Pilot
theorem checked_19426_5 : validate cache_19426_5 19426 =
    some 19431 := by
  decide +kernel

theorem checked : validate cache 19426 = some 19431 := checked_19426_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 19426 19431 checked
  omega

theorem within_body : 19431 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19426 19431 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19426 19431 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19426 19431 address = observedPair address :=
  cachedPair_eq cache 19426 19431 checked address

end SourceCache369Pilot
open LookupCachePilot
namespace SourceCache370Pilot
theorem checked_19431_10 : validate cache_19431_10 19431 =
    some 19441 := by
  decide +kernel

theorem checked : validate cache 19431 = some 19441 := checked_19431_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 19431 19441 checked
  omega

theorem within_body : 19441 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19431 19441 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19431 19441 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19431 19441 address = observedPair address :=
  cachedPair_eq cache 19431 19441 checked address

end SourceCache370Pilot
open LookupCachePilot
namespace SourceCache371Pilot
theorem checked_19441_185 : validate cache_19441_185 19441 =
    some 19626 := by
  decide +kernel
theorem checked_19626_185 : validate cache_19626_185 19626 =
    some 19811 := by
  decide +kernel
theorem checked_19441_370 : validate cache_19441_370 19441 =
    some 19811 := by
  exact validate_branch 185 cache_19441_185 cache_19626_185
    19441 19626 19811
    checked_19441_185 rfl checked_19626_185

theorem checked : validate cache 19441 = some 19811 := checked_19441_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 19441 19811 checked
  omega

theorem within_body : 19811 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19441 19811 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19441 19811 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19441 19811 address = observedPair address :=
  cachedPair_eq cache 19441 19811 checked address

end SourceCache371Pilot
open LookupCachePilot
namespace SourceCache372Pilot
theorem checked_19811_220 : validate cache_19811_220 19811 =
    some 20031 := by
  decide +kernel
theorem checked_20031_220 : validate cache_20031_220 20031 =
    some 20251 := by
  decide +kernel
theorem checked_19811_440 : validate cache_19811_440 19811 =
    some 20251 := by
  exact validate_branch 220 cache_19811_220 cache_20031_220
    19811 20031 20251
    checked_19811_220 rfl checked_20031_220

theorem checked : validate cache 19811 = some 20251 := checked_19811_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 19811 20251 checked
  omega

theorem within_body : 20251 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 19811 20251 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 19811 20251 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 19811 20251 address = observedPair address :=
  cachedPair_eq cache 19811 20251 checked address

end SourceCache372Pilot
open LookupCachePilot
namespace SourceCache373Pilot
theorem checked_20251_70 : validate cache_20251_70 20251 =
    some 20321 := by
  decide +kernel

theorem checked : validate cache 20251 = some 20321 := checked_20251_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 20251 20321 checked
  omega

theorem within_body : 20321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20251 20321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20251 20321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20251 20321 address = observedPair address :=
  cachedPair_eq cache 20251 20321 checked address

end SourceCache373Pilot
open LookupCachePilot
namespace SourceCache374Pilot
theorem checked_20321_195 : validate cache_20321_195 20321 =
    some 20516 := by
  decide +kernel

theorem checked : validate cache 20321 = some 20516 := checked_20321_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 20321 20516 checked
  omega

theorem within_body : 20516 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20321 20516 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20321 20516 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20321 20516 address = observedPair address :=
  cachedPair_eq cache 20321 20516 checked address

end SourceCache374Pilot
open LookupCachePilot
namespace SourceCache375Pilot
theorem checked_20516_70 : validate cache_20516_70 20516 =
    some 20586 := by
  decide +kernel

theorem checked : validate cache 20516 = some 20586 := checked_20516_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 20516 20586 checked
  omega

theorem within_body : 20586 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20516 20586 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20516 20586 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20516 20586 address = observedPair address :=
  cachedPair_eq cache 20516 20586 checked address

end SourceCache375Pilot
open LookupCachePilot
namespace SourceCache376Pilot
theorem checked_20586_200 : validate cache_20586_200 20586 =
    some 20786 := by
  decide +kernel
theorem checked_20786_200 : validate cache_20786_200 20786 =
    some 20986 := by
  decide +kernel
theorem checked_20586_400 : validate cache_20586_400 20586 =
    some 20986 := by
  exact validate_branch 200 cache_20586_200 cache_20786_200
    20586 20786 20986
    checked_20586_200 rfl checked_20786_200

theorem checked : validate cache 20586 = some 20986 := checked_20586_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 20586 20986 checked
  omega

theorem within_body : 20986 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20586 20986 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20586 20986 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20586 20986 address = observedPair address :=
  cachedPair_eq cache 20586 20986 checked address

end SourceCache376Pilot
open LookupCachePilot
namespace SourceCache377Pilot
theorem checked_20986_5 : validate cache_20986_5 20986 =
    some 20991 := by
  decide +kernel

theorem checked : validate cache 20986 = some 20991 := checked_20986_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 20986 20991 checked
  omega

theorem within_body : 20991 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20986 20991 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20986 20991 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20986 20991 address = observedPair address :=
  cachedPair_eq cache 20986 20991 checked address

end SourceCache377Pilot
open LookupCachePilot
namespace SourceCache378Pilot
theorem checked_20991_70 : validate cache_20991_70 20991 =
    some 21061 := by
  decide +kernel

theorem checked : validate cache 20991 = some 21061 := checked_20991_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 20991 21061 checked
  omega

theorem within_body : 21061 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 20991 21061 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 20991 21061 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 20991 21061 address = observedPair address :=
  cachedPair_eq cache 20991 21061 checked address

end SourceCache378Pilot
open LookupCachePilot
namespace SourceCache379Pilot
theorem checked_21061_167 : validate cache_21061_167 21061 =
    some 21228 := by
  decide +kernel
theorem checked_21228_168 : validate cache_21228_168 21228 =
    some 21396 := by
  decide +kernel
theorem checked_21061_335 : validate cache_21061_335 21061 =
    some 21396 := by
  exact validate_branch 167 cache_21061_167 cache_21228_168
    21061 21228 21396
    checked_21061_167 rfl checked_21228_168
theorem checked_21396_167 : validate cache_21396_167 21396 =
    some 21563 := by
  decide +kernel
theorem checked_21563_168 : validate cache_21563_168 21563 =
    some 21731 := by
  decide +kernel
theorem checked_21396_335 : validate cache_21396_335 21396 =
    some 21731 := by
  exact validate_branch 167 cache_21396_167 cache_21563_168
    21396 21563 21731
    checked_21396_167 rfl checked_21563_168
theorem checked_21061_670 : validate cache_21061_670 21061 =
    some 21731 := by
  exact validate_branch 335 cache_21061_335 cache_21396_335
    21061 21396 21731
    checked_21061_335 rfl checked_21396_335

theorem checked : validate cache 21061 = some 21731 := checked_21061_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 21061 21731 checked
  omega

theorem within_body : 21731 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 21061 21731 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 21061 21731 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 21061 21731 address = observedPair address :=
  cachedPair_eq cache 21061 21731 checked address

end SourceCache379Pilot
open LookupCachePilot
namespace SourceCache380Pilot
theorem checked_21731_70 : validate cache_21731_70 21731 =
    some 21801 := by
  decide +kernel

theorem checked : validate cache 21731 = some 21801 := checked_21731_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 21731 21801 checked
  omega

theorem within_body : 21801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 21731 21801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 21731 21801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 21731 21801 address = observedPair address :=
  cachedPair_eq cache 21731 21801 checked address

end SourceCache380Pilot
open LookupCachePilot
namespace SourceCache381Pilot
theorem checked_21801_167 : validate cache_21801_167 21801 =
    some 21968 := by
  decide +kernel
theorem checked_21968_168 : validate cache_21968_168 21968 =
    some 22136 := by
  decide +kernel
theorem checked_21801_335 : validate cache_21801_335 21801 =
    some 22136 := by
  exact validate_branch 167 cache_21801_167 cache_21968_168
    21801 21968 22136
    checked_21801_167 rfl checked_21968_168
theorem checked_22136_167 : validate cache_22136_167 22136 =
    some 22303 := by
  decide +kernel
theorem checked_22303_168 : validate cache_22303_168 22303 =
    some 22471 := by
  decide +kernel
theorem checked_22136_335 : validate cache_22136_335 22136 =
    some 22471 := by
  exact validate_branch 167 cache_22136_167 cache_22303_168
    22136 22303 22471
    checked_22136_167 rfl checked_22303_168
theorem checked_21801_670 : validate cache_21801_670 21801 =
    some 22471 := by
  exact validate_branch 335 cache_21801_335 cache_22136_335
    21801 22136 22471
    checked_21801_335 rfl checked_22136_335

theorem checked : validate cache 21801 = some 22471 := checked_21801_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 21801 22471 checked
  omega

theorem within_body : 22471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 21801 22471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 21801 22471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 21801 22471 address = observedPair address :=
  cachedPair_eq cache 21801 22471 checked address

end SourceCache381Pilot
open LookupCachePilot
namespace SourceCache382Pilot
theorem checked_22471_5 : validate cache_22471_5 22471 =
    some 22476 := by
  decide +kernel

theorem checked : validate cache 22471 = some 22476 := checked_22471_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 22471 22476 checked
  omega

theorem within_body : 22476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 22471 22476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 22471 22476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 22471 22476 address = observedPair address :=
  cachedPair_eq cache 22471 22476 checked address

end SourceCache382Pilot
open LookupCachePilot
namespace SourceCache383Pilot
theorem checked_22476_70 : validate cache_22476_70 22476 =
    some 22546 := by
  decide +kernel

theorem checked : validate cache 22476 = some 22546 := checked_22476_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 22476 22546 checked
  omega

theorem within_body : 22546 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 22476 22546 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 22476 22546 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 22476 22546 address = observedPair address :=
  cachedPair_eq cache 22476 22546 checked address

end SourceCache383Pilot
open LookupCachePilot
namespace SourceCache384Pilot
theorem checked_22546_167 : validate cache_22546_167 22546 =
    some 22713 := by
  decide +kernel
theorem checked_22713_168 : validate cache_22713_168 22713 =
    some 22881 := by
  decide +kernel
theorem checked_22546_335 : validate cache_22546_335 22546 =
    some 22881 := by
  exact validate_branch 167 cache_22546_167 cache_22713_168
    22546 22713 22881
    checked_22546_167 rfl checked_22713_168
theorem checked_22881_167 : validate cache_22881_167 22881 =
    some 23048 := by
  decide +kernel
theorem checked_23048_168 : validate cache_23048_168 23048 =
    some 23216 := by
  decide +kernel
theorem checked_22881_335 : validate cache_22881_335 22881 =
    some 23216 := by
  exact validate_branch 167 cache_22881_167 cache_23048_168
    22881 23048 23216
    checked_22881_167 rfl checked_23048_168
theorem checked_22546_670 : validate cache_22546_670 22546 =
    some 23216 := by
  exact validate_branch 335 cache_22546_335 cache_22881_335
    22546 22881 23216
    checked_22546_335 rfl checked_22881_335

theorem checked : validate cache 22546 = some 23216 := checked_22546_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 22546 23216 checked
  omega

theorem within_body : 23216 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 22546 23216 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 22546 23216 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 22546 23216 address = observedPair address :=
  cachedPair_eq cache 22546 23216 checked address

end SourceCache384Pilot
open LookupCachePilot
namespace SourceCache385Pilot
theorem checked_23216_70 : validate cache_23216_70 23216 =
    some 23286 := by
  decide +kernel

theorem checked : validate cache 23216 = some 23286 := checked_23216_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 23216 23286 checked
  omega

theorem within_body : 23286 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 23216 23286 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 23216 23286 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 23216 23286 address = observedPair address :=
  cachedPair_eq cache 23216 23286 checked address

end SourceCache385Pilot
open LookupCachePilot
namespace SourceCache386Pilot
theorem checked_23286_167 : validate cache_23286_167 23286 =
    some 23453 := by
  decide +kernel
theorem checked_23453_168 : validate cache_23453_168 23453 =
    some 23621 := by
  decide +kernel
theorem checked_23286_335 : validate cache_23286_335 23286 =
    some 23621 := by
  exact validate_branch 167 cache_23286_167 cache_23453_168
    23286 23453 23621
    checked_23286_167 rfl checked_23453_168
theorem checked_23621_167 : validate cache_23621_167 23621 =
    some 23788 := by
  decide +kernel
theorem checked_23788_168 : validate cache_23788_168 23788 =
    some 23956 := by
  decide +kernel
theorem checked_23621_335 : validate cache_23621_335 23621 =
    some 23956 := by
  exact validate_branch 167 cache_23621_167 cache_23788_168
    23621 23788 23956
    checked_23621_167 rfl checked_23788_168
theorem checked_23286_670 : validate cache_23286_670 23286 =
    some 23956 := by
  exact validate_branch 335 cache_23286_335 cache_23621_335
    23286 23621 23956
    checked_23286_335 rfl checked_23621_335

theorem checked : validate cache 23286 = some 23956 := checked_23286_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 23286 23956 checked
  omega

theorem within_body : 23956 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 23286 23956 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 23286 23956 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 23286 23956 address = observedPair address :=
  cachedPair_eq cache 23286 23956 checked address

end SourceCache386Pilot
open LookupCachePilot
namespace SourceCache387Pilot
theorem checked_23956_5 : validate cache_23956_5 23956 =
    some 23961 := by
  decide +kernel

theorem checked : validate cache 23956 = some 23961 := checked_23956_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 23956 23961 checked
  omega

theorem within_body : 23961 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 23956 23961 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 23956 23961 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 23956 23961 address = observedPair address :=
  cachedPair_eq cache 23956 23961 checked address

end SourceCache387Pilot
open LookupCachePilot
namespace SourceCache388Pilot
theorem checked_23961_70 : validate cache_23961_70 23961 =
    some 24031 := by
  decide +kernel

theorem checked : validate cache 23961 = some 24031 := checked_23961_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 23961 24031 checked
  omega

theorem within_body : 24031 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 23961 24031 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 23961 24031 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 23961 24031 address = observedPair address :=
  cachedPair_eq cache 23961 24031 checked address

end SourceCache388Pilot
open LookupCachePilot
namespace SourceCache389Pilot
theorem checked_24031_185 : validate cache_24031_185 24031 =
    some 24216 := by
  decide +kernel
theorem checked_24216_185 : validate cache_24216_185 24216 =
    some 24401 := by
  decide +kernel
theorem checked_24031_370 : validate cache_24031_370 24031 =
    some 24401 := by
  exact validate_branch 185 cache_24031_185 cache_24216_185
    24031 24216 24401
    checked_24031_185 rfl checked_24216_185

theorem checked : validate cache 24031 = some 24401 := checked_24031_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 24031 24401 checked
  omega

theorem within_body : 24401 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24031 24401 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24031 24401 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24031 24401 address = observedPair address :=
  cachedPair_eq cache 24031 24401 checked address

end SourceCache389Pilot
open LookupCachePilot
namespace SourceCache390Pilot
theorem checked_24401_5 : validate cache_24401_5 24401 =
    some 24406 := by
  decide +kernel

theorem checked : validate cache 24401 = some 24406 := checked_24401_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 24401 24406 checked
  omega

theorem within_body : 24406 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24401 24406 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24401 24406 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24401 24406 address = observedPair address :=
  cachedPair_eq cache 24401 24406 checked address

end SourceCache390Pilot
open LookupCachePilot
namespace SourceCache391Pilot
theorem checked_24406_70 : validate cache_24406_70 24406 =
    some 24476 := by
  decide +kernel

theorem checked : validate cache 24406 = some 24476 := checked_24406_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 24406 24476 checked
  omega

theorem within_body : 24476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24406 24476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24406 24476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24406 24476 address = observedPair address :=
  cachedPair_eq cache 24406 24476 checked address

end SourceCache391Pilot
open LookupCachePilot
namespace SourceCache392Pilot
theorem checked_24476_200 : validate cache_24476_200 24476 =
    some 24676 := by
  decide +kernel
theorem checked_24676_200 : validate cache_24676_200 24676 =
    some 24876 := by
  decide +kernel
theorem checked_24476_400 : validate cache_24476_400 24476 =
    some 24876 := by
  exact validate_branch 200 cache_24476_200 cache_24676_200
    24476 24676 24876
    checked_24476_200 rfl checked_24676_200

theorem checked : validate cache 24476 = some 24876 := checked_24476_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 24476 24876 checked
  omega

theorem within_body : 24876 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24476 24876 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24476 24876 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24476 24876 address = observedPair address :=
  cachedPair_eq cache 24476 24876 checked address

end SourceCache392Pilot
open LookupCachePilot
namespace SourceCache393Pilot
theorem checked_24876_5 : validate cache_24876_5 24876 =
    some 24881 := by
  decide +kernel

theorem checked : validate cache 24876 = some 24881 := checked_24876_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 24876 24881 checked
  omega

theorem within_body : 24881 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24876 24881 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24876 24881 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24876 24881 address = observedPair address :=
  cachedPair_eq cache 24876 24881 checked address

end SourceCache393Pilot
open LookupCachePilot
namespace SourceCache394Pilot
theorem checked_24881_70 : validate cache_24881_70 24881 =
    some 24951 := by
  decide +kernel

theorem checked : validate cache 24881 = some 24951 := checked_24881_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 24881 24951 checked
  omega

theorem within_body : 24951 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24881 24951 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24881 24951 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24881 24951 address = observedPair address :=
  cachedPair_eq cache 24881 24951 checked address

end SourceCache394Pilot
open LookupCachePilot
namespace SourceCache395Pilot
theorem checked_24951_185 : validate cache_24951_185 24951 =
    some 25136 := by
  decide +kernel
theorem checked_25136_185 : validate cache_25136_185 25136 =
    some 25321 := by
  decide +kernel
theorem checked_24951_370 : validate cache_24951_370 24951 =
    some 25321 := by
  exact validate_branch 185 cache_24951_185 cache_25136_185
    24951 25136 25321
    checked_24951_185 rfl checked_25136_185

theorem checked : validate cache 24951 = some 25321 := checked_24951_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 24951 25321 checked
  omega

theorem within_body : 25321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 24951 25321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 24951 25321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 24951 25321 address = observedPair address :=
  cachedPair_eq cache 24951 25321 checked address

end SourceCache395Pilot
open LookupCachePilot
namespace SourceCache396Pilot
theorem checked_25321_5 : validate cache_25321_5 25321 =
    some 25326 := by
  decide +kernel

theorem checked : validate cache 25321 = some 25326 := checked_25321_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 25321 25326 checked
  omega

theorem within_body : 25326 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25321 25326 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25321 25326 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25321 25326 address = observedPair address :=
  cachedPair_eq cache 25321 25326 checked address

end SourceCache396Pilot
open LookupCachePilot
namespace SourceCache397Pilot
theorem checked_25326_70 : validate cache_25326_70 25326 =
    some 25396 := by
  decide +kernel

theorem checked : validate cache 25326 = some 25396 := checked_25326_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 25326 25396 checked
  omega

theorem within_body : 25396 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25326 25396 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25326 25396 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25326 25396 address = observedPair address :=
  cachedPair_eq cache 25326 25396 checked address

end SourceCache397Pilot
open LookupCachePilot
namespace SourceCache398Pilot
theorem checked_25396_200 : validate cache_25396_200 25396 =
    some 25596 := by
  decide +kernel
theorem checked_25596_200 : validate cache_25596_200 25596 =
    some 25796 := by
  decide +kernel
theorem checked_25396_400 : validate cache_25396_400 25396 =
    some 25796 := by
  exact validate_branch 200 cache_25396_200 cache_25596_200
    25396 25596 25796
    checked_25396_200 rfl checked_25596_200

theorem checked : validate cache 25396 = some 25796 := checked_25396_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 25396 25796 checked
  omega

theorem within_body : 25796 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25396 25796 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25396 25796 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25396 25796 address = observedPair address :=
  cachedPair_eq cache 25396 25796 checked address

end SourceCache398Pilot
open LookupCachePilot
namespace SourceCache399Pilot
theorem checked_25796_5 : validate cache_25796_5 25796 =
    some 25801 := by
  decide +kernel

theorem checked : validate cache 25796 = some 25801 := checked_25796_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 25796 25801 checked
  omega

theorem within_body : 25801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25796 25801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25796 25801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25796 25801 address = observedPair address :=
  cachedPair_eq cache 25796 25801 checked address

end SourceCache399Pilot
open LookupCachePilot
namespace SourceCache400Pilot
theorem checked_25801_70 : validate cache_25801_70 25801 =
    some 25871 := by
  decide +kernel

theorem checked : validate cache 25801 = some 25871 := checked_25801_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 25801 25871 checked
  omega

theorem within_body : 25871 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25801 25871 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25801 25871 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25801 25871 address = observedPair address :=
  cachedPair_eq cache 25801 25871 checked address

end SourceCache400Pilot
open LookupCachePilot
namespace SourceCache401Pilot
theorem checked_25871_152 : validate cache_25871_152 25871 =
    some 26023 := by
  decide +kernel
theorem checked_26023_153 : validate cache_26023_153 26023 =
    some 26176 := by
  decide +kernel
theorem checked_25871_305 : validate cache_25871_305 25871 =
    some 26176 := by
  exact validate_branch 152 cache_25871_152 cache_26023_153
    25871 26023 26176
    checked_25871_152 rfl checked_26023_153

theorem checked : validate cache 25871 = some 26176 := checked_25871_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 25871 26176 checked
  omega

theorem within_body : 26176 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 25871 26176 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 25871 26176 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 25871 26176 address = observedPair address :=
  cachedPair_eq cache 25871 26176 checked address

end SourceCache401Pilot
open LookupCachePilot
namespace SourceCache402Pilot
theorem checked_26176_70 : validate cache_26176_70 26176 =
    some 26246 := by
  decide +kernel

theorem checked : validate cache 26176 = some 26246 := checked_26176_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 26176 26246 checked
  omega

theorem within_body : 26246 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26176 26246 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26176 26246 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26176 26246 address = observedPair address :=
  cachedPair_eq cache 26176 26246 checked address

end SourceCache402Pilot
open LookupCachePilot
namespace SourceCache403Pilot
theorem checked_26246_5 : validate cache_26246_5 26246 =
    some 26251 := by
  decide +kernel

theorem checked : validate cache 26246 = some 26251 := checked_26246_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 26246 26251 checked
  omega

theorem within_body : 26251 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26246 26251 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26246 26251 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26246 26251 address = observedPair address :=
  cachedPair_eq cache 26246 26251 checked address

end SourceCache403Pilot
open LookupCachePilot
namespace SourceCache404Pilot
theorem checked_26251_70 : validate cache_26251_70 26251 =
    some 26321 := by
  decide +kernel

theorem checked : validate cache 26251 = some 26321 := checked_26251_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 26251 26321 checked
  omega

theorem within_body : 26321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26251 26321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26251 26321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26251 26321 address = observedPair address :=
  cachedPair_eq cache 26251 26321 checked address

end SourceCache404Pilot
open LookupCachePilot
namespace SourceCache405Pilot
theorem checked_26321_132 : validate cache_26321_132 26321 =
    some 26453 := by
  decide +kernel
theorem checked_26453_133 : validate cache_26453_133 26453 =
    some 26586 := by
  decide +kernel
theorem checked_26321_265 : validate cache_26321_265 26321 =
    some 26586 := by
  exact validate_branch 132 cache_26321_132 cache_26453_133
    26321 26453 26586
    checked_26321_132 rfl checked_26453_133

theorem checked : validate cache 26321 = some 26586 := checked_26321_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 26321 26586 checked
  omega

theorem within_body : 26586 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26321 26586 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26321 26586 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26321 26586 address = observedPair address :=
  cachedPair_eq cache 26321 26586 checked address

end SourceCache405Pilot
open LookupCachePilot
namespace SourceCache406Pilot
theorem checked_26586_5 : validate cache_26586_5 26586 =
    some 26591 := by
  decide +kernel

theorem checked : validate cache 26586 = some 26591 := checked_26586_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 26586 26591 checked
  omega

theorem within_body : 26591 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26586 26591 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26586 26591 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26586 26591 address = observedPair address :=
  cachedPair_eq cache 26586 26591 checked address

end SourceCache406Pilot
open LookupCachePilot
namespace SourceCache407Pilot
theorem checked_26591_10 : validate cache_26591_10 26591 =
    some 26601 := by
  decide +kernel

theorem checked : validate cache 26591 = some 26601 := checked_26591_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 26591 26601 checked
  omega

theorem within_body : 26601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26591 26601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26591 26601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26591 26601 address = observedPair address :=
  cachedPair_eq cache 26591 26601 checked address

end SourceCache407Pilot
open LookupCachePilot
namespace SourceCache408Pilot
theorem checked_26601_220 : validate cache_26601_220 26601 =
    some 26821 := by
  decide +kernel

theorem checked : validate cache 26601 = some 26821 := checked_26601_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 26601 26821 checked
  omega

theorem within_body : 26821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26601 26821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26601 26821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26601 26821 address = observedPair address :=
  cachedPair_eq cache 26601 26821 checked address

end SourceCache408Pilot
open LookupCachePilot
namespace SourceCache409Pilot
theorem checked_26821_152 : validate cache_26821_152 26821 =
    some 26973 := by
  decide +kernel
theorem checked_26973_153 : validate cache_26973_153 26973 =
    some 27126 := by
  decide +kernel
theorem checked_26821_305 : validate cache_26821_305 26821 =
    some 27126 := by
  exact validate_branch 152 cache_26821_152 cache_26973_153
    26821 26973 27126
    checked_26821_152 rfl checked_26973_153

theorem checked : validate cache 26821 = some 27126 := checked_26821_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 26821 27126 checked
  omega

theorem within_body : 27126 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 26821 27126 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 26821 27126 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 26821 27126 address = observedPair address :=
  cachedPair_eq cache 26821 27126 checked address

end SourceCache409Pilot
open LookupCachePilot
namespace SourceCache410Pilot
theorem checked_27126_70 : validate cache_27126_70 27126 =
    some 27196 := by
  decide +kernel

theorem checked : validate cache 27126 = some 27196 := checked_27126_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 27126 27196 checked
  omega

theorem within_body : 27196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27126 27196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27126 27196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27126 27196 address = observedPair address :=
  cachedPair_eq cache 27126 27196 checked address

end SourceCache410Pilot
open LookupCachePilot
namespace SourceCache411Pilot
theorem checked_27196_195 : validate cache_27196_195 27196 =
    some 27391 := by
  decide +kernel

theorem checked : validate cache 27196 = some 27391 := checked_27196_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 27196 27391 checked
  omega

theorem within_body : 27391 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27196 27391 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27196 27391 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27196 27391 address = observedPair address :=
  cachedPair_eq cache 27196 27391 checked address

end SourceCache411Pilot
open LookupCachePilot
namespace SourceCache412Pilot
theorem checked_27391_70 : validate cache_27391_70 27391 =
    some 27461 := by
  decide +kernel

theorem checked : validate cache 27391 = some 27461 := checked_27391_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 27391 27461 checked
  omega

theorem within_body : 27461 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27391 27461 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27391 27461 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27391 27461 address = observedPair address :=
  cachedPair_eq cache 27391 27461 checked address

end SourceCache412Pilot
open LookupCachePilot
namespace SourceCache413Pilot
theorem checked_27461_132 : validate cache_27461_132 27461 =
    some 27593 := by
  decide +kernel
theorem checked_27593_133 : validate cache_27593_133 27593 =
    some 27726 := by
  decide +kernel
theorem checked_27461_265 : validate cache_27461_265 27461 =
    some 27726 := by
  exact validate_branch 132 cache_27461_132 cache_27593_133
    27461 27593 27726
    checked_27461_132 rfl checked_27593_133

theorem checked : validate cache 27461 = some 27726 := checked_27461_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 27461 27726 checked
  omega

theorem within_body : 27726 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27461 27726 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27461 27726 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27461 27726 address = observedPair address :=
  cachedPair_eq cache 27461 27726 checked address

end SourceCache413Pilot
open LookupCachePilot
namespace SourceCache414Pilot
theorem checked_27726_220 : validate cache_27726_220 27726 =
    some 27946 := by
  decide +kernel

theorem checked : validate cache 27726 = some 27946 := checked_27726_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 27726 27946 checked
  omega

theorem within_body : 27946 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27726 27946 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27726 27946 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27726 27946 address = observedPair address :=
  cachedPair_eq cache 27726 27946 checked address

end SourceCache414Pilot
open LookupCachePilot
namespace SourceCache415Pilot
theorem checked_27946_5 : validate cache_27946_5 27946 =
    some 27951 := by
  decide +kernel

theorem checked : validate cache 27946 = some 27951 := checked_27946_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 27946 27951 checked
  omega

theorem within_body : 27951 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27946 27951 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27946 27951 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27946 27951 address = observedPair address :=
  cachedPair_eq cache 27946 27951 checked address

end SourceCache415Pilot
open LookupCachePilot
namespace SourceCache416Pilot
theorem checked_27951_70 : validate cache_27951_70 27951 =
    some 28021 := by
  decide +kernel

theorem checked : validate cache 27951 = some 28021 := checked_27951_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 27951 28021 checked
  omega

theorem within_body : 28021 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 27951 28021 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 27951 28021 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 27951 28021 address = observedPair address :=
  cachedPair_eq cache 27951 28021 checked address

end SourceCache416Pilot
open LookupCachePilot
namespace SourceCache417Pilot
theorem checked_28021_132 : validate cache_28021_132 28021 =
    some 28153 := by
  decide +kernel
theorem checked_28153_133 : validate cache_28153_133 28153 =
    some 28286 := by
  decide +kernel
theorem checked_28021_265 : validate cache_28021_265 28021 =
    some 28286 := by
  exact validate_branch 132 cache_28021_132 cache_28153_133
    28021 28153 28286
    checked_28021_132 rfl checked_28153_133

theorem checked : validate cache 28021 = some 28286 := checked_28021_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 28021 28286 checked
  omega

theorem within_body : 28286 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 28021 28286 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 28021 28286 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 28021 28286 address = observedPair address :=
  cachedPair_eq cache 28021 28286 checked address

end SourceCache417Pilot
open LookupCachePilot
namespace SourceCache418Pilot
theorem checked_28286_5 : validate cache_28286_5 28286 =
    some 28291 := by
  decide +kernel

theorem checked : validate cache 28286 = some 28291 := checked_28286_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 28286 28291 checked
  omega

theorem within_body : 28291 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 28286 28291 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 28286 28291 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 28286 28291 address = observedPair address :=
  cachedPair_eq cache 28286 28291 checked address

end SourceCache418Pilot
open LookupCachePilot
namespace SourceCache419Pilot
theorem checked_28291_10 : validate cache_28291_10 28291 =
    some 28301 := by
  decide +kernel

theorem checked : validate cache 28291 = some 28301 := checked_28291_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 28291 28301 checked
  omega

theorem within_body : 28301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 28291 28301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 28291 28301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 28291 28301 address = observedPair address :=
  cachedPair_eq cache 28291 28301 checked address

end SourceCache419Pilot
open LookupCachePilot
namespace SourceCache420Pilot
theorem checked_28301_185 : validate cache_28301_185 28301 =
    some 28486 := by
  decide +kernel
theorem checked_28486_185 : validate cache_28486_185 28486 =
    some 28671 := by
  decide +kernel
theorem checked_28301_370 : validate cache_28301_370 28301 =
    some 28671 := by
  exact validate_branch 185 cache_28301_185 cache_28486_185
    28301 28486 28671
    checked_28301_185 rfl checked_28486_185

theorem checked : validate cache 28301 = some 28671 := checked_28301_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 28301 28671 checked
  omega

theorem within_body : 28671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 28301 28671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 28301 28671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 28301 28671 address = observedPair address :=
  cachedPair_eq cache 28301 28671 checked address

end SourceCache420Pilot
open LookupCachePilot
namespace SourceCache421Pilot
theorem checked_28671_220 : validate cache_28671_220 28671 =
    some 28891 := by
  decide +kernel
theorem checked_28891_220 : validate cache_28891_220 28891 =
    some 29111 := by
  decide +kernel
theorem checked_28671_440 : validate cache_28671_440 28671 =
    some 29111 := by
  exact validate_branch 220 cache_28671_220 cache_28891_220
    28671 28891 29111
    checked_28671_220 rfl checked_28891_220

theorem checked : validate cache 28671 = some 29111 := checked_28671_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 28671 29111 checked
  omega

theorem within_body : 29111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 28671 29111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 28671 29111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 28671 29111 address = observedPair address :=
  cachedPair_eq cache 28671 29111 checked address

end SourceCache421Pilot
open LookupCachePilot
namespace SourceCache422Pilot
theorem checked_29111_70 : validate cache_29111_70 29111 =
    some 29181 := by
  decide +kernel

theorem checked : validate cache 29111 = some 29181 := checked_29111_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 29111 29181 checked
  omega

theorem within_body : 29181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29111 29181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29111 29181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29111 29181 address = observedPair address :=
  cachedPair_eq cache 29111 29181 checked address

end SourceCache422Pilot
open LookupCachePilot
namespace SourceCache423Pilot
theorem checked_29181_195 : validate cache_29181_195 29181 =
    some 29376 := by
  decide +kernel

theorem checked : validate cache 29181 = some 29376 := checked_29181_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 29181 29376 checked
  omega

theorem within_body : 29376 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29181 29376 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29181 29376 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29181 29376 address = observedPair address :=
  cachedPair_eq cache 29181 29376 checked address

end SourceCache423Pilot
open LookupCachePilot
namespace SourceCache424Pilot
theorem checked_29376_70 : validate cache_29376_70 29376 =
    some 29446 := by
  decide +kernel

theorem checked : validate cache 29376 = some 29446 := checked_29376_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 29376 29446 checked
  omega

theorem within_body : 29446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29376 29446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29376 29446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29376 29446 address = observedPair address :=
  cachedPair_eq cache 29376 29446 checked address

end SourceCache424Pilot
open LookupCachePilot
namespace SourceCache425Pilot
theorem checked_29446_200 : validate cache_29446_200 29446 =
    some 29646 := by
  decide +kernel
theorem checked_29646_200 : validate cache_29646_200 29646 =
    some 29846 := by
  decide +kernel
theorem checked_29446_400 : validate cache_29446_400 29446 =
    some 29846 := by
  exact validate_branch 200 cache_29446_200 cache_29646_200
    29446 29646 29846
    checked_29446_200 rfl checked_29646_200

theorem checked : validate cache 29446 = some 29846 := checked_29446_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 29446 29846 checked
  omega

theorem within_body : 29846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29446 29846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29446 29846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29446 29846 address = observedPair address :=
  cachedPair_eq cache 29446 29846 checked address

end SourceCache425Pilot
open LookupCachePilot
namespace SourceCache426Pilot
theorem checked_29846_5 : validate cache_29846_5 29846 =
    some 29851 := by
  decide +kernel

theorem checked : validate cache 29846 = some 29851 := checked_29846_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 29846 29851 checked
  omega

theorem within_body : 29851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29846 29851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29846 29851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29846 29851 address = observedPair address :=
  cachedPair_eq cache 29846 29851 checked address

end SourceCache426Pilot
open LookupCachePilot
namespace SourceCache427Pilot
theorem checked_29851_70 : validate cache_29851_70 29851 =
    some 29921 := by
  decide +kernel

theorem checked : validate cache 29851 = some 29921 := checked_29851_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 29851 29921 checked
  omega

theorem within_body : 29921 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29851 29921 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29851 29921 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29851 29921 address = observedPair address :=
  cachedPair_eq cache 29851 29921 checked address

end SourceCache427Pilot
open LookupCachePilot
namespace SourceCache428Pilot
theorem checked_29921_185 : validate cache_29921_185 29921 =
    some 30106 := by
  decide +kernel
theorem checked_30106_185 : validate cache_30106_185 30106 =
    some 30291 := by
  decide +kernel
theorem checked_29921_370 : validate cache_29921_370 29921 =
    some 30291 := by
  exact validate_branch 185 cache_29921_185 cache_30106_185
    29921 30106 30291
    checked_29921_185 rfl checked_30106_185

theorem checked : validate cache 29921 = some 30291 := checked_29921_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 29921 30291 checked
  omega

theorem within_body : 30291 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 29921 30291 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 29921 30291 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 29921 30291 address = observedPair address :=
  cachedPair_eq cache 29921 30291 checked address

end SourceCache428Pilot
open LookupCachePilot
namespace SourceCache429Pilot
theorem checked_30291_5 : validate cache_30291_5 30291 =
    some 30296 := by
  decide +kernel

theorem checked : validate cache 30291 = some 30296 := checked_30291_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 30291 30296 checked
  omega

theorem within_body : 30296 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30291 30296 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30291 30296 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30291 30296 address = observedPair address :=
  cachedPair_eq cache 30291 30296 checked address

end SourceCache429Pilot
open LookupCachePilot
namespace SourceCache430Pilot
theorem checked_30296_70 : validate cache_30296_70 30296 =
    some 30366 := by
  decide +kernel

theorem checked : validate cache 30296 = some 30366 := checked_30296_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 30296 30366 checked
  omega

theorem within_body : 30366 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30296 30366 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30296 30366 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30296 30366 address = observedPair address :=
  cachedPair_eq cache 30296 30366 checked address

end SourceCache430Pilot
open LookupCachePilot
namespace SourceCache431Pilot
theorem checked_30366_200 : validate cache_30366_200 30366 =
    some 30566 := by
  decide +kernel
theorem checked_30566_200 : validate cache_30566_200 30566 =
    some 30766 := by
  decide +kernel
theorem checked_30366_400 : validate cache_30366_400 30366 =
    some 30766 := by
  exact validate_branch 200 cache_30366_200 cache_30566_200
    30366 30566 30766
    checked_30366_200 rfl checked_30566_200

theorem checked : validate cache 30366 = some 30766 := checked_30366_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 30366 30766 checked
  omega

theorem within_body : 30766 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30366 30766 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30366 30766 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30366 30766 address = observedPair address :=
  cachedPair_eq cache 30366 30766 checked address

end SourceCache431Pilot
open LookupCachePilot
namespace SourceCache432Pilot
theorem checked_30766_5 : validate cache_30766_5 30766 =
    some 30771 := by
  decide +kernel

theorem checked : validate cache 30766 = some 30771 := checked_30766_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 30766 30771 checked
  omega

theorem within_body : 30771 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30766 30771 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30766 30771 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30766 30771 address = observedPair address :=
  cachedPair_eq cache 30766 30771 checked address

end SourceCache432Pilot
open LookupCachePilot
namespace SourceCache433Pilot
theorem checked_30771_10 : validate cache_30771_10 30771 =
    some 30781 := by
  decide +kernel

theorem checked : validate cache 30771 = some 30781 := checked_30771_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 30771 30781 checked
  omega

theorem within_body : 30781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30771 30781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30771 30781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30771 30781 address = observedPair address :=
  cachedPair_eq cache 30771 30781 checked address

end SourceCache433Pilot
open LookupCachePilot
namespace SourceCache434Pilot
theorem checked_30781_130 : validate cache_30781_130 30781 =
    some 30911 := by
  decide +kernel
theorem checked_30911_130 : validate cache_30911_130 30911 =
    some 31041 := by
  decide +kernel
theorem checked_30781_260 : validate cache_30781_260 30781 =
    some 31041 := by
  exact validate_branch 130 cache_30781_130 cache_30911_130
    30781 30911 31041
    checked_30781_130 rfl checked_30911_130
theorem checked_31041_130 : validate cache_31041_130 31041 =
    some 31171 := by
  decide +kernel
theorem checked_31171_130 : validate cache_31171_130 31171 =
    some 31301 := by
  decide +kernel
theorem checked_31041_260 : validate cache_31041_260 31041 =
    some 31301 := by
  exact validate_branch 130 cache_31041_130 cache_31171_130
    31041 31171 31301
    checked_31041_130 rfl checked_31171_130
theorem checked_30781_520 : validate cache_30781_520 30781 =
    some 31301 := by
  exact validate_branch 260 cache_30781_260 cache_31041_260
    30781 31041 31301
    checked_30781_260 rfl checked_31041_260

theorem checked : validate cache 30781 = some 31301 := checked_30781_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 30781 31301 checked
  omega

theorem within_body : 31301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 30781 31301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 30781 31301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 30781 31301 address = observedPair address :=
  cachedPair_eq cache 30781 31301 checked address

end SourceCache434Pilot
open LookupCachePilot
namespace SourceCache435Pilot
theorem checked_31301_143 : validate cache_31301_143 31301 =
    some 31444 := by
  decide +kernel
theorem checked_31444_144 : validate cache_31444_144 31444 =
    some 31588 := by
  decide +kernel
theorem checked_31301_287 : validate cache_31301_287 31301 =
    some 31588 := by
  exact validate_branch 143 cache_31301_143 cache_31444_144
    31301 31444 31588
    checked_31301_143 rfl checked_31444_144
theorem checked_31588_144 : validate cache_31588_144 31588 =
    some 31732 := by
  decide +kernel
theorem checked_31732_144 : validate cache_31732_144 31732 =
    some 31876 := by
  decide +kernel
theorem checked_31588_288 : validate cache_31588_288 31588 =
    some 31876 := by
  exact validate_branch 144 cache_31588_144 cache_31732_144
    31588 31732 31876
    checked_31588_144 rfl checked_31732_144
theorem checked_31301_575 : validate cache_31301_575 31301 =
    some 31876 := by
  exact validate_branch 287 cache_31301_287 cache_31588_288
    31301 31588 31876
    checked_31301_287 rfl checked_31588_288

theorem checked : validate cache 31301 = some 31876 := checked_31301_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 31301 31876 checked
  omega

theorem within_body : 31876 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 31301 31876 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 31301 31876 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 31301 31876 address = observedPair address :=
  cachedPair_eq cache 31301 31876 checked address

end SourceCache435Pilot
open LookupCachePilot
namespace SourceCache436Pilot
theorem checked_31876_70 : validate cache_31876_70 31876 =
    some 31946 := by
  decide +kernel

theorem checked : validate cache 31876 = some 31946 := checked_31876_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 31876 31946 checked
  omega

theorem within_body : 31946 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 31876 31946 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 31876 31946 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 31876 31946 address = observedPair address :=
  cachedPair_eq cache 31876 31946 checked address

end SourceCache436Pilot
open LookupCachePilot
namespace SourceCache437Pilot
theorem checked_31946_195 : validate cache_31946_195 31946 =
    some 32141 := by
  decide +kernel

theorem checked : validate cache 31946 = some 32141 := checked_31946_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 31946 32141 checked
  omega

theorem within_body : 32141 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 31946 32141 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 31946 32141 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 31946 32141 address = observedPair address :=
  cachedPair_eq cache 31946 32141 checked address

end SourceCache437Pilot
open LookupCachePilot
namespace SourceCache438Pilot
theorem checked_32141_70 : validate cache_32141_70 32141 =
    some 32211 := by
  decide +kernel

theorem checked : validate cache 32141 = some 32211 := checked_32141_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 32141 32211 checked
  omega

theorem within_body : 32211 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 32141 32211 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 32141 32211 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 32141 32211 address = observedPair address :=
  cachedPair_eq cache 32141 32211 checked address

end SourceCache438Pilot
open LookupCachePilot
namespace SourceCache439Pilot
theorem checked_32211_133 : validate cache_32211_133 32211 =
    some 32344 := by
  decide +kernel
theorem checked_32344_134 : validate cache_32344_134 32344 =
    some 32478 := by
  decide +kernel
theorem checked_32211_267 : validate cache_32211_267 32211 =
    some 32478 := by
  exact validate_branch 133 cache_32211_133 cache_32344_134
    32211 32344 32478
    checked_32211_133 rfl checked_32344_134
theorem checked_32478_134 : validate cache_32478_134 32478 =
    some 32612 := by
  decide +kernel
theorem checked_32612_134 : validate cache_32612_134 32612 =
    some 32746 := by
  decide +kernel
theorem checked_32478_268 : validate cache_32478_268 32478 =
    some 32746 := by
  exact validate_branch 134 cache_32478_134 cache_32612_134
    32478 32612 32746
    checked_32478_134 rfl checked_32612_134
theorem checked_32211_535 : validate cache_32211_535 32211 =
    some 32746 := by
  exact validate_branch 267 cache_32211_267 cache_32478_268
    32211 32478 32746
    checked_32211_267 rfl checked_32478_268

theorem checked : validate cache 32211 = some 32746 := checked_32211_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 32211 32746 checked
  omega

theorem within_body : 32746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 32211 32746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 32211 32746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 32211 32746 address = observedPair address :=
  cachedPair_eq cache 32211 32746 checked address

end SourceCache439Pilot
open LookupCachePilot
namespace SourceCache440Pilot
theorem checked_32746_5 : validate cache_32746_5 32746 =
    some 32751 := by
  decide +kernel

theorem checked : validate cache 32746 = some 32751 := checked_32746_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 32746 32751 checked
  omega

theorem within_body : 32751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 32746 32751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 32746 32751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 32746 32751 address = observedPair address :=
  cachedPair_eq cache 32746 32751 checked address

end SourceCache440Pilot
open LookupCachePilot
namespace SourceCache441Pilot
theorem checked_32751_70 : validate cache_32751_70 32751 =
    some 32821 := by
  decide +kernel

theorem checked : validate cache 32751 = some 32821 := checked_32751_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 32751 32821 checked
  omega

theorem within_body : 32821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 32751 32821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 32751 32821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 32751 32821 address = observedPair address :=
  cachedPair_eq cache 32751 32821 checked address

end SourceCache441Pilot
open LookupCachePilot
namespace SourceCache442Pilot
theorem checked_32821_167 : validate cache_32821_167 32821 =
    some 32988 := by
  decide +kernel
theorem checked_32988_168 : validate cache_32988_168 32988 =
    some 33156 := by
  decide +kernel
theorem checked_32821_335 : validate cache_32821_335 32821 =
    some 33156 := by
  exact validate_branch 167 cache_32821_167 cache_32988_168
    32821 32988 33156
    checked_32821_167 rfl checked_32988_168
theorem checked_33156_167 : validate cache_33156_167 33156 =
    some 33323 := by
  decide +kernel
theorem checked_33323_168 : validate cache_33323_168 33323 =
    some 33491 := by
  decide +kernel
theorem checked_33156_335 : validate cache_33156_335 33156 =
    some 33491 := by
  exact validate_branch 167 cache_33156_167 cache_33323_168
    33156 33323 33491
    checked_33156_167 rfl checked_33323_168
theorem checked_32821_670 : validate cache_32821_670 32821 =
    some 33491 := by
  exact validate_branch 335 cache_32821_335 cache_33156_335
    32821 33156 33491
    checked_32821_335 rfl checked_33156_335

theorem checked : validate cache 32821 = some 33491 := checked_32821_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 32821 33491 checked
  omega

theorem within_body : 33491 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 32821 33491 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 32821 33491 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 32821 33491 address = observedPair address :=
  cachedPair_eq cache 32821 33491 checked address

end SourceCache442Pilot
open LookupCachePilot
namespace SourceCache443Pilot
theorem checked_33491_70 : validate cache_33491_70 33491 =
    some 33561 := by
  decide +kernel

theorem checked : validate cache 33491 = some 33561 := checked_33491_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 33491 33561 checked
  omega

theorem within_body : 33561 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 33491 33561 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 33491 33561 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 33491 33561 address = observedPair address :=
  cachedPair_eq cache 33491 33561 checked address

end SourceCache443Pilot
namespace ScopeViews003Pilot
noncomputable def fromRaw_359 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache359Pilot.cache 17566 18236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache359Pilot.cache
    17566 18236 SourceCache359Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_360 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache360Pilot.cache 18236 18241)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache360Pilot.cache
    18236 18241 SourceCache360Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_361 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache361Pilot.cache 18241 18311)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache361Pilot.cache
    18241 18311 SourceCache361Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_362 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache362Pilot.cache 18311 18531)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache362Pilot.cache
    18311 18531 SourceCache362Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_363 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache363Pilot.cache 18531 18601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache363Pilot.cache
    18531 18601 SourceCache363Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_364 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache364Pilot.cache 18601 18866)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache364Pilot.cache
    18601 18866 SourceCache364Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_365 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache365Pilot.cache 18866 19086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache365Pilot.cache
    18866 19086 SourceCache365Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_366 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache366Pilot.cache 19086 19091)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache366Pilot.cache
    19086 19091 SourceCache366Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_367 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache367Pilot.cache 19091 19161)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache367Pilot.cache
    19091 19161 SourceCache367Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_368 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache368Pilot.cache 19161 19426)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache368Pilot.cache
    19161 19426 SourceCache368Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_369 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache369Pilot.cache 19426 19431)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache369Pilot.cache
    19426 19431 SourceCache369Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_370 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache370Pilot.cache 19431 19441)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache370Pilot.cache
    19431 19441 SourceCache370Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_371 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache371Pilot.cache 19441 19811)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache371Pilot.cache
    19441 19811 SourceCache371Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_372 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache372Pilot.cache 19811 20251)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache372Pilot.cache
    19811 20251 SourceCache372Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_373 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache373Pilot.cache 20251 20321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache373Pilot.cache
    20251 20321 SourceCache373Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_374 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache374Pilot.cache 20321 20516)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache374Pilot.cache
    20321 20516 SourceCache374Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_375 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache375Pilot.cache 20516 20586)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache375Pilot.cache
    20516 20586 SourceCache375Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_376 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache376Pilot.cache 20586 20986)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache376Pilot.cache
    20586 20986 SourceCache376Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_377 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache377Pilot.cache 20986 20991)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache377Pilot.cache
    20986 20991 SourceCache377Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_378 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache378Pilot.cache 20991 21061)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache378Pilot.cache
    20991 21061 SourceCache378Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_379 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache379Pilot.cache 21061 21731)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache379Pilot.cache
    21061 21731 SourceCache379Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_380 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache380Pilot.cache 21731 21801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache380Pilot.cache
    21731 21801 SourceCache380Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_381 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache381Pilot.cache 21801 22471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache381Pilot.cache
    21801 22471 SourceCache381Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_382 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache382Pilot.cache 22471 22476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache382Pilot.cache
    22471 22476 SourceCache382Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_383 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache383Pilot.cache 22476 22546)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache383Pilot.cache
    22476 22546 SourceCache383Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_384 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache384Pilot.cache 22546 23216)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache384Pilot.cache
    22546 23216 SourceCache384Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_385 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache385Pilot.cache 23216 23286)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache385Pilot.cache
    23216 23286 SourceCache385Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_386 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache386Pilot.cache 23286 23956)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache386Pilot.cache
    23286 23956 SourceCache386Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_387 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache387Pilot.cache 23956 23961)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache387Pilot.cache
    23956 23961 SourceCache387Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_388 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache388Pilot.cache 23961 24031)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache388Pilot.cache
    23961 24031 SourceCache388Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_389 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache389Pilot.cache 24031 24401)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache389Pilot.cache
    24031 24401 SourceCache389Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_390 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache390Pilot.cache 24401 24406)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache390Pilot.cache
    24401 24406 SourceCache390Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_391 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache391Pilot.cache 24406 24476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache391Pilot.cache
    24406 24476 SourceCache391Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_392 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache392Pilot.cache 24476 24876)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache392Pilot.cache
    24476 24876 SourceCache392Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_393 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache393Pilot.cache 24876 24881)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache393Pilot.cache
    24876 24881 SourceCache393Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_394 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache394Pilot.cache 24881 24951)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache394Pilot.cache
    24881 24951 SourceCache394Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_395 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache395Pilot.cache 24951 25321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache395Pilot.cache
    24951 25321 SourceCache395Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_396 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache396Pilot.cache 25321 25326)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache396Pilot.cache
    25321 25326 SourceCache396Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_397 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache397Pilot.cache 25326 25396)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache397Pilot.cache
    25326 25396 SourceCache397Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_398 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache398Pilot.cache 25396 25796)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache398Pilot.cache
    25396 25796 SourceCache398Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_399 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache399Pilot.cache 25796 25801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache399Pilot.cache
    25796 25801 SourceCache399Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_400 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache400Pilot.cache 25801 25871)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache400Pilot.cache
    25801 25871 SourceCache400Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_401 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache401Pilot.cache 25871 26176)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache401Pilot.cache
    25871 26176 SourceCache401Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_402 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache402Pilot.cache 26176 26246)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache402Pilot.cache
    26176 26246 SourceCache402Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_403 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache403Pilot.cache 26246 26251)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache403Pilot.cache
    26246 26251 SourceCache403Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_404 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache404Pilot.cache 26251 26321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache404Pilot.cache
    26251 26321 SourceCache404Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_405 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache405Pilot.cache 26321 26586)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache405Pilot.cache
    26321 26586 SourceCache405Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_406 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache406Pilot.cache 26586 26591)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache406Pilot.cache
    26586 26591 SourceCache406Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_407 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache407Pilot.cache 26591 26601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache407Pilot.cache
    26591 26601 SourceCache407Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_408 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache408Pilot.cache 26601 26821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache408Pilot.cache
    26601 26821 SourceCache408Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_409 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache409Pilot.cache 26821 27126)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache409Pilot.cache
    26821 27126 SourceCache409Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_410 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache410Pilot.cache 27126 27196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache410Pilot.cache
    27126 27196 SourceCache410Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_411 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache411Pilot.cache 27196 27391)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache411Pilot.cache
    27196 27391 SourceCache411Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_412 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache412Pilot.cache 27391 27461)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache412Pilot.cache
    27391 27461 SourceCache412Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_413 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache413Pilot.cache 27461 27726)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache413Pilot.cache
    27461 27726 SourceCache413Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_414 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache414Pilot.cache 27726 27946)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache414Pilot.cache
    27726 27946 SourceCache414Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_415 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache415Pilot.cache 27946 27951)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache415Pilot.cache
    27946 27951 SourceCache415Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_416 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache416Pilot.cache 27951 28021)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache416Pilot.cache
    27951 28021 SourceCache416Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_417 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache417Pilot.cache 28021 28286)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache417Pilot.cache
    28021 28286 SourceCache417Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_418 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache418Pilot.cache 28286 28291)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache418Pilot.cache
    28286 28291 SourceCache418Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_419 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache419Pilot.cache 28291 28301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache419Pilot.cache
    28291 28301 SourceCache419Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_420 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache420Pilot.cache 28301 28671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache420Pilot.cache
    28301 28671 SourceCache420Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_421 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache421Pilot.cache 28671 29111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache421Pilot.cache
    28671 29111 SourceCache421Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_422 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache422Pilot.cache 29111 29181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache422Pilot.cache
    29111 29181 SourceCache422Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_423 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache423Pilot.cache 29181 29376)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache423Pilot.cache
    29181 29376 SourceCache423Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_424 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache424Pilot.cache 29376 29446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache424Pilot.cache
    29376 29446 SourceCache424Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_425 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache425Pilot.cache 29446 29846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache425Pilot.cache
    29446 29846 SourceCache425Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_426 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache426Pilot.cache 29846 29851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache426Pilot.cache
    29846 29851 SourceCache426Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_427 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache427Pilot.cache 29851 29921)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache427Pilot.cache
    29851 29921 SourceCache427Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_428 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache428Pilot.cache 29921 30291)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache428Pilot.cache
    29921 30291 SourceCache428Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_429 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache429Pilot.cache 30291 30296)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache429Pilot.cache
    30291 30296 SourceCache429Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_430 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache430Pilot.cache 30296 30366)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache430Pilot.cache
    30296 30366 SourceCache430Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_431 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache431Pilot.cache 30366 30766)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache431Pilot.cache
    30366 30766 SourceCache431Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_432 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache432Pilot.cache 30766 30771)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache432Pilot.cache
    30766 30771 SourceCache432Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_433 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache433Pilot.cache 30771 30781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache433Pilot.cache
    30771 30781 SourceCache433Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_434 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache434Pilot.cache 30781 31301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache434Pilot.cache
    30781 31301 SourceCache434Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_435 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache435Pilot.cache 31301 31876)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache435Pilot.cache
    31301 31876 SourceCache435Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_436 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache436Pilot.cache 31876 31946)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache436Pilot.cache
    31876 31946 SourceCache436Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_437 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache437Pilot.cache 31946 32141)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache437Pilot.cache
    31946 32141 SourceCache437Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_438 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache438Pilot.cache 32141 32211)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache438Pilot.cache
    32141 32211 SourceCache438Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_439 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache439Pilot.cache 32211 32746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache439Pilot.cache
    32211 32746 SourceCache439Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_440 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache440Pilot.cache 32746 32751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache440Pilot.cache
    32746 32751 SourceCache440Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_441 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache441Pilot.cache 32751 32821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache441Pilot.cache
    32751 32821 SourceCache441Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_442 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache442Pilot.cache 32821 33491)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache442Pilot.cache
    32821 33491 SourceCache442Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_443 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache443Pilot.cache 33491 33561)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache443Pilot.cache
    33491 33561 SourceCache443Pilot.checked q raw nodes returns truth
end ScopeViews003Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
