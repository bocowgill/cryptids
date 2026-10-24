module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews006Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache585Pilot
theorem checked_65566_167 : validate cache_65566_167 65566 =
    some 65733 := by
  decide +kernel
theorem checked_65733_168 : validate cache_65733_168 65733 =
    some 65901 := by
  decide +kernel
theorem checked_65566_335 : validate cache_65566_335 65566 =
    some 65901 := by
  exact validate_branch 167 cache_65566_167 cache_65733_168
    65566 65733 65901
    checked_65566_167 rfl checked_65733_168
theorem checked_65901_167 : validate cache_65901_167 65901 =
    some 66068 := by
  decide +kernel
theorem checked_66068_168 : validate cache_66068_168 66068 =
    some 66236 := by
  decide +kernel
theorem checked_65901_335 : validate cache_65901_335 65901 =
    some 66236 := by
  exact validate_branch 167 cache_65901_167 cache_66068_168
    65901 66068 66236
    checked_65901_167 rfl checked_66068_168
theorem checked_65566_670 : validate cache_65566_670 65566 =
    some 66236 := by
  exact validate_branch 335 cache_65566_335 cache_65901_335
    65566 65901 66236
    checked_65566_335 rfl checked_65901_335

theorem checked : validate cache 65566 = some 66236 := checked_65566_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 65566 66236 checked
  omega

theorem within_body : 66236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 65566 66236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 65566 66236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 65566 66236 address = observedPair address :=
  cachedPair_eq cache 65566 66236 checked address

end SourceCache585Pilot
open LookupCachePilot
namespace SourceCache586Pilot
theorem checked_66236_5 : validate cache_66236_5 66236 =
    some 66241 := by
  decide +kernel

theorem checked : validate cache 66236 = some 66241 := checked_66236_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 66236 66241 checked
  omega

theorem within_body : 66241 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 66236 66241 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 66236 66241 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 66236 66241 address = observedPair address :=
  cachedPair_eq cache 66236 66241 checked address

end SourceCache586Pilot
open LookupCachePilot
namespace SourceCache587Pilot
theorem checked_66241_70 : validate cache_66241_70 66241 =
    some 66311 := by
  decide +kernel

theorem checked : validate cache 66241 = some 66311 := checked_66241_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 66241 66311 checked
  omega

theorem within_body : 66311 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 66241 66311 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 66241 66311 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 66241 66311 address = observedPair address :=
  cachedPair_eq cache 66241 66311 checked address

end SourceCache587Pilot
open LookupCachePilot
namespace SourceCache588Pilot
theorem checked_66311_167 : validate cache_66311_167 66311 =
    some 66478 := by
  decide +kernel
theorem checked_66478_168 : validate cache_66478_168 66478 =
    some 66646 := by
  decide +kernel
theorem checked_66311_335 : validate cache_66311_335 66311 =
    some 66646 := by
  exact validate_branch 167 cache_66311_167 cache_66478_168
    66311 66478 66646
    checked_66311_167 rfl checked_66478_168
theorem checked_66646_167 : validate cache_66646_167 66646 =
    some 66813 := by
  decide +kernel
theorem checked_66813_168 : validate cache_66813_168 66813 =
    some 66981 := by
  decide +kernel
theorem checked_66646_335 : validate cache_66646_335 66646 =
    some 66981 := by
  exact validate_branch 167 cache_66646_167 cache_66813_168
    66646 66813 66981
    checked_66646_167 rfl checked_66813_168
theorem checked_66311_670 : validate cache_66311_670 66311 =
    some 66981 := by
  exact validate_branch 335 cache_66311_335 cache_66646_335
    66311 66646 66981
    checked_66311_335 rfl checked_66646_335

theorem checked : validate cache 66311 = some 66981 := checked_66311_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 66311 66981 checked
  omega

theorem within_body : 66981 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 66311 66981 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 66311 66981 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 66311 66981 address = observedPair address :=
  cachedPair_eq cache 66311 66981 checked address

end SourceCache588Pilot
open LookupCachePilot
namespace SourceCache589Pilot
theorem checked_66981_5 : validate cache_66981_5 66981 =
    some 66986 := by
  decide +kernel

theorem checked : validate cache 66981 = some 66986 := checked_66981_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 66981 66986 checked
  omega

theorem within_body : 66986 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 66981 66986 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 66981 66986 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 66981 66986 address = observedPair address :=
  cachedPair_eq cache 66981 66986 checked address

end SourceCache589Pilot
open LookupCachePilot
namespace SourceCache590Pilot
theorem checked_66986_70 : validate cache_66986_70 66986 =
    some 67056 := by
  decide +kernel

theorem checked : validate cache 66986 = some 67056 := checked_66986_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 66986 67056 checked
  omega

theorem within_body : 67056 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 66986 67056 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 66986 67056 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 66986 67056 address = observedPair address :=
  cachedPair_eq cache 66986 67056 checked address

end SourceCache590Pilot
open LookupCachePilot
namespace SourceCache591Pilot
theorem checked_67056_220 : validate cache_67056_220 67056 =
    some 67276 := by
  decide +kernel

theorem checked : validate cache 67056 = some 67276 := checked_67056_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 67056 67276 checked
  omega

theorem within_body : 67276 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67056 67276 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67056 67276 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67056 67276 address = observedPair address :=
  cachedPair_eq cache 67056 67276 checked address

end SourceCache591Pilot
open LookupCachePilot
namespace SourceCache592Pilot
theorem checked_67276_5 : validate cache_67276_5 67276 =
    some 67281 := by
  decide +kernel

theorem checked : validate cache 67276 = some 67281 := checked_67276_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 67276 67281 checked
  omega

theorem within_body : 67281 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67276 67281 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67276 67281 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67276 67281 address = observedPair address :=
  cachedPair_eq cache 67276 67281 checked address

end SourceCache592Pilot
open LookupCachePilot
namespace SourceCache593Pilot
theorem checked_67281_70 : validate cache_67281_70 67281 =
    some 67351 := by
  decide +kernel

theorem checked : validate cache 67281 = some 67351 := checked_67281_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 67281 67351 checked
  omega

theorem within_body : 67351 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67281 67351 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67281 67351 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67281 67351 address = observedPair address :=
  cachedPair_eq cache 67281 67351 checked address

end SourceCache593Pilot
open LookupCachePilot
namespace SourceCache594Pilot
theorem checked_67351_132 : validate cache_67351_132 67351 =
    some 67483 := by
  decide +kernel
theorem checked_67483_133 : validate cache_67483_133 67483 =
    some 67616 := by
  decide +kernel
theorem checked_67351_265 : validate cache_67351_265 67351 =
    some 67616 := by
  exact validate_branch 132 cache_67351_132 cache_67483_133
    67351 67483 67616
    checked_67351_132 rfl checked_67483_133

theorem checked : validate cache 67351 = some 67616 := checked_67351_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 67351 67616 checked
  omega

theorem within_body : 67616 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67351 67616 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67351 67616 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67351 67616 address = observedPair address :=
  cachedPair_eq cache 67351 67616 checked address

end SourceCache594Pilot
open LookupCachePilot
namespace SourceCache595Pilot
theorem checked_67616_5 : validate cache_67616_5 67616 =
    some 67621 := by
  decide +kernel

theorem checked : validate cache 67616 = some 67621 := checked_67616_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 67616 67621 checked
  omega

theorem within_body : 67621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67616 67621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67616 67621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67616 67621 address = observedPair address :=
  cachedPair_eq cache 67616 67621 checked address

end SourceCache595Pilot
open LookupCachePilot
namespace SourceCache596Pilot
theorem checked_67621_10 : validate cache_67621_10 67621 =
    some 67631 := by
  decide +kernel

theorem checked : validate cache 67621 = some 67631 := checked_67621_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 67621 67631 checked
  omega

theorem within_body : 67631 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67621 67631 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67621 67631 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67621 67631 address = observedPair address :=
  cachedPair_eq cache 67621 67631 checked address

end SourceCache596Pilot
open LookupCachePilot
namespace SourceCache597Pilot
theorem checked_67631_185 : validate cache_67631_185 67631 =
    some 67816 := by
  decide +kernel
theorem checked_67816_185 : validate cache_67816_185 67816 =
    some 68001 := by
  decide +kernel
theorem checked_67631_370 : validate cache_67631_370 67631 =
    some 68001 := by
  exact validate_branch 185 cache_67631_185 cache_67816_185
    67631 67816 68001
    checked_67631_185 rfl checked_67816_185

theorem checked : validate cache 67631 = some 68001 := checked_67631_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 67631 68001 checked
  omega

theorem within_body : 68001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 67631 68001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 67631 68001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 67631 68001 address = observedPair address :=
  cachedPair_eq cache 67631 68001 checked address

end SourceCache597Pilot
open LookupCachePilot
namespace SourceCache598Pilot
theorem checked_68001_220 : validate cache_68001_220 68001 =
    some 68221 := by
  decide +kernel
theorem checked_68221_220 : validate cache_68221_220 68221 =
    some 68441 := by
  decide +kernel
theorem checked_68001_440 : validate cache_68001_440 68001 =
    some 68441 := by
  exact validate_branch 220 cache_68001_220 cache_68221_220
    68001 68221 68441
    checked_68001_220 rfl checked_68221_220

theorem checked : validate cache 68001 = some 68441 := checked_68001_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 68001 68441 checked
  omega

theorem within_body : 68441 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 68001 68441 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 68001 68441 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 68001 68441 address = observedPair address :=
  cachedPair_eq cache 68001 68441 checked address

end SourceCache598Pilot
open LookupCachePilot
namespace SourceCache599Pilot
theorem checked_68441_70 : validate cache_68441_70 68441 =
    some 68511 := by
  decide +kernel

theorem checked : validate cache 68441 = some 68511 := checked_68441_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 68441 68511 checked
  omega

theorem within_body : 68511 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 68441 68511 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 68441 68511 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 68441 68511 address = observedPair address :=
  cachedPair_eq cache 68441 68511 checked address

end SourceCache599Pilot
open LookupCachePilot
namespace SourceCache600Pilot
theorem checked_68511_195 : validate cache_68511_195 68511 =
    some 68706 := by
  decide +kernel

theorem checked : validate cache 68511 = some 68706 := checked_68511_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 68511 68706 checked
  omega

theorem within_body : 68706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 68511 68706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 68511 68706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 68511 68706 address = observedPair address :=
  cachedPair_eq cache 68511 68706 checked address

end SourceCache600Pilot
open LookupCachePilot
namespace SourceCache601Pilot
theorem checked_68706_70 : validate cache_68706_70 68706 =
    some 68776 := by
  decide +kernel

theorem checked : validate cache 68706 = some 68776 := checked_68706_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 68706 68776 checked
  omega

theorem within_body : 68776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 68706 68776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 68706 68776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 68706 68776 address = observedPair address :=
  cachedPair_eq cache 68706 68776 checked address

end SourceCache601Pilot
open LookupCachePilot
namespace SourceCache602Pilot
theorem checked_68776_200 : validate cache_68776_200 68776 =
    some 68976 := by
  decide +kernel
theorem checked_68976_200 : validate cache_68976_200 68976 =
    some 69176 := by
  decide +kernel
theorem checked_68776_400 : validate cache_68776_400 68776 =
    some 69176 := by
  exact validate_branch 200 cache_68776_200 cache_68976_200
    68776 68976 69176
    checked_68776_200 rfl checked_68976_200

theorem checked : validate cache 68776 = some 69176 := checked_68776_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 68776 69176 checked
  omega

theorem within_body : 69176 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 68776 69176 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 68776 69176 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 68776 69176 address = observedPair address :=
  cachedPair_eq cache 68776 69176 checked address

end SourceCache602Pilot
open LookupCachePilot
namespace SourceCache603Pilot
theorem checked_69176_5 : validate cache_69176_5 69176 =
    some 69181 := by
  decide +kernel

theorem checked : validate cache 69176 = some 69181 := checked_69176_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 69176 69181 checked
  omega

theorem within_body : 69181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69176 69181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69176 69181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69176 69181 address = observedPair address :=
  cachedPair_eq cache 69176 69181 checked address

end SourceCache603Pilot
open LookupCachePilot
namespace SourceCache604Pilot
theorem checked_69181_70 : validate cache_69181_70 69181 =
    some 69251 := by
  decide +kernel

theorem checked : validate cache 69181 = some 69251 := checked_69181_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 69181 69251 checked
  omega

theorem within_body : 69251 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69181 69251 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69181 69251 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69181 69251 address = observedPair address :=
  cachedPair_eq cache 69181 69251 checked address

end SourceCache604Pilot
open LookupCachePilot
namespace SourceCache605Pilot
theorem checked_69251_185 : validate cache_69251_185 69251 =
    some 69436 := by
  decide +kernel
theorem checked_69436_185 : validate cache_69436_185 69436 =
    some 69621 := by
  decide +kernel
theorem checked_69251_370 : validate cache_69251_370 69251 =
    some 69621 := by
  exact validate_branch 185 cache_69251_185 cache_69436_185
    69251 69436 69621
    checked_69251_185 rfl checked_69436_185

theorem checked : validate cache 69251 = some 69621 := checked_69251_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 69251 69621 checked
  omega

theorem within_body : 69621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69251 69621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69251 69621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69251 69621 address = observedPair address :=
  cachedPair_eq cache 69251 69621 checked address

end SourceCache605Pilot
open LookupCachePilot
namespace SourceCache606Pilot
theorem checked_69621_5 : validate cache_69621_5 69621 =
    some 69626 := by
  decide +kernel

theorem checked : validate cache 69621 = some 69626 := checked_69621_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 69621 69626 checked
  omega

theorem within_body : 69626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69621 69626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69621 69626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69621 69626 address = observedPair address :=
  cachedPair_eq cache 69621 69626 checked address

end SourceCache606Pilot
open LookupCachePilot
namespace SourceCache607Pilot
theorem checked_69626_70 : validate cache_69626_70 69626 =
    some 69696 := by
  decide +kernel

theorem checked : validate cache 69626 = some 69696 := checked_69626_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 69626 69696 checked
  omega

theorem within_body : 69696 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69626 69696 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69626 69696 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69626 69696 address = observedPair address :=
  cachedPair_eq cache 69626 69696 checked address

end SourceCache607Pilot
open LookupCachePilot
namespace SourceCache608Pilot
theorem checked_69696_200 : validate cache_69696_200 69696 =
    some 69896 := by
  decide +kernel
theorem checked_69896_200 : validate cache_69896_200 69896 =
    some 70096 := by
  decide +kernel
theorem checked_69696_400 : validate cache_69696_400 69696 =
    some 70096 := by
  exact validate_branch 200 cache_69696_200 cache_69896_200
    69696 69896 70096
    checked_69696_200 rfl checked_69896_200

theorem checked : validate cache 69696 = some 70096 := checked_69696_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 69696 70096 checked
  omega

theorem within_body : 70096 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 69696 70096 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 69696 70096 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 69696 70096 address = observedPair address :=
  cachedPair_eq cache 69696 70096 checked address

end SourceCache608Pilot
open LookupCachePilot
namespace SourceCache609Pilot
theorem checked_70096_5 : validate cache_70096_5 70096 =
    some 70101 := by
  decide +kernel

theorem checked : validate cache 70096 = some 70101 := checked_70096_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 70096 70101 checked
  omega

theorem within_body : 70101 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 70096 70101 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 70096 70101 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 70096 70101 address = observedPair address :=
  cachedPair_eq cache 70096 70101 checked address

end SourceCache609Pilot
open LookupCachePilot
namespace SourceCache610Pilot
theorem checked_70101_10 : validate cache_70101_10 70101 =
    some 70111 := by
  decide +kernel

theorem checked : validate cache 70101 = some 70111 := checked_70101_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 70101 70111 checked
  omega

theorem within_body : 70111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 70101 70111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 70101 70111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 70101 70111 address = observedPair address :=
  cachedPair_eq cache 70101 70111 checked address

end SourceCache610Pilot
open LookupCachePilot
namespace SourceCache611Pilot
theorem checked_70111_130 : validate cache_70111_130 70111 =
    some 70241 := by
  decide +kernel
theorem checked_70241_130 : validate cache_70241_130 70241 =
    some 70371 := by
  decide +kernel
theorem checked_70111_260 : validate cache_70111_260 70111 =
    some 70371 := by
  exact validate_branch 130 cache_70111_130 cache_70241_130
    70111 70241 70371
    checked_70111_130 rfl checked_70241_130
theorem checked_70371_130 : validate cache_70371_130 70371 =
    some 70501 := by
  decide +kernel
theorem checked_70501_130 : validate cache_70501_130 70501 =
    some 70631 := by
  decide +kernel
theorem checked_70371_260 : validate cache_70371_260 70371 =
    some 70631 := by
  exact validate_branch 130 cache_70371_130 cache_70501_130
    70371 70501 70631
    checked_70371_130 rfl checked_70501_130
theorem checked_70111_520 : validate cache_70111_520 70111 =
    some 70631 := by
  exact validate_branch 260 cache_70111_260 cache_70371_260
    70111 70371 70631
    checked_70111_260 rfl checked_70371_260

theorem checked : validate cache 70111 = some 70631 := checked_70111_520

theorem count_exact : cache.count = 520 := by
  have extent := validate_extent cache 70111 70631 checked
  omega

theorem within_body : 70631 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 70111 70631 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 70111 70631 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 70111 70631 address = observedPair address :=
  cachedPair_eq cache 70111 70631 checked address

end SourceCache611Pilot
open LookupCachePilot
namespace SourceCache612Pilot
theorem checked_70631_143 : validate cache_70631_143 70631 =
    some 70774 := by
  decide +kernel
theorem checked_70774_144 : validate cache_70774_144 70774 =
    some 70918 := by
  decide +kernel
theorem checked_70631_287 : validate cache_70631_287 70631 =
    some 70918 := by
  exact validate_branch 143 cache_70631_143 cache_70774_144
    70631 70774 70918
    checked_70631_143 rfl checked_70774_144
theorem checked_70918_144 : validate cache_70918_144 70918 =
    some 71062 := by
  decide +kernel
theorem checked_71062_144 : validate cache_71062_144 71062 =
    some 71206 := by
  decide +kernel
theorem checked_70918_288 : validate cache_70918_288 70918 =
    some 71206 := by
  exact validate_branch 144 cache_70918_144 cache_71062_144
    70918 71062 71206
    checked_70918_144 rfl checked_71062_144
theorem checked_70631_575 : validate cache_70631_575 70631 =
    some 71206 := by
  exact validate_branch 287 cache_70631_287 cache_70918_288
    70631 70918 71206
    checked_70631_287 rfl checked_70918_288

theorem checked : validate cache 70631 = some 71206 := checked_70631_575

theorem count_exact : cache.count = 575 := by
  have extent := validate_extent cache 70631 71206 checked
  omega

theorem within_body : 71206 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 70631 71206 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 70631 71206 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 70631 71206 address = observedPair address :=
  cachedPair_eq cache 70631 71206 checked address

end SourceCache612Pilot
open LookupCachePilot
namespace SourceCache613Pilot
theorem checked_71206_70 : validate cache_71206_70 71206 =
    some 71276 := by
  decide +kernel

theorem checked : validate cache 71206 = some 71276 := checked_71206_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 71206 71276 checked
  omega

theorem within_body : 71276 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 71206 71276 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 71206 71276 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 71206 71276 address = observedPair address :=
  cachedPair_eq cache 71206 71276 checked address

end SourceCache613Pilot
open LookupCachePilot
namespace SourceCache614Pilot
theorem checked_71276_195 : validate cache_71276_195 71276 =
    some 71471 := by
  decide +kernel

theorem checked : validate cache 71276 = some 71471 := checked_71276_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 71276 71471 checked
  omega

theorem within_body : 71471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 71276 71471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 71276 71471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 71276 71471 address = observedPair address :=
  cachedPair_eq cache 71276 71471 checked address

end SourceCache614Pilot
open LookupCachePilot
namespace SourceCache615Pilot
theorem checked_71471_70 : validate cache_71471_70 71471 =
    some 71541 := by
  decide +kernel

theorem checked : validate cache 71471 = some 71541 := checked_71471_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 71471 71541 checked
  omega

theorem within_body : 71541 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 71471 71541 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 71471 71541 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 71471 71541 address = observedPair address :=
  cachedPair_eq cache 71471 71541 checked address

end SourceCache615Pilot
open LookupCachePilot
namespace SourceCache616Pilot
theorem checked_71541_133 : validate cache_71541_133 71541 =
    some 71674 := by
  decide +kernel
theorem checked_71674_134 : validate cache_71674_134 71674 =
    some 71808 := by
  decide +kernel
theorem checked_71541_267 : validate cache_71541_267 71541 =
    some 71808 := by
  exact validate_branch 133 cache_71541_133 cache_71674_134
    71541 71674 71808
    checked_71541_133 rfl checked_71674_134
theorem checked_71808_134 : validate cache_71808_134 71808 =
    some 71942 := by
  decide +kernel
theorem checked_71942_134 : validate cache_71942_134 71942 =
    some 72076 := by
  decide +kernel
theorem checked_71808_268 : validate cache_71808_268 71808 =
    some 72076 := by
  exact validate_branch 134 cache_71808_134 cache_71942_134
    71808 71942 72076
    checked_71808_134 rfl checked_71942_134
theorem checked_71541_535 : validate cache_71541_535 71541 =
    some 72076 := by
  exact validate_branch 267 cache_71541_267 cache_71808_268
    71541 71808 72076
    checked_71541_267 rfl checked_71808_268

theorem checked : validate cache 71541 = some 72076 := checked_71541_535

theorem count_exact : cache.count = 535 := by
  have extent := validate_extent cache 71541 72076 checked
  omega

theorem within_body : 72076 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 71541 72076 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 71541 72076 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 71541 72076 address = observedPair address :=
  cachedPair_eq cache 71541 72076 checked address

end SourceCache616Pilot
open LookupCachePilot
namespace SourceCache617Pilot
theorem checked_72076_5 : validate cache_72076_5 72076 =
    some 72081 := by
  decide +kernel

theorem checked : validate cache 72076 = some 72081 := checked_72076_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 72076 72081 checked
  omega

theorem within_body : 72081 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72076 72081 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72076 72081 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72076 72081 address = observedPair address :=
  cachedPair_eq cache 72076 72081 checked address

end SourceCache617Pilot
open LookupCachePilot
namespace SourceCache618Pilot
theorem checked_72081_70 : validate cache_72081_70 72081 =
    some 72151 := by
  decide +kernel

theorem checked : validate cache 72081 = some 72151 := checked_72081_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 72081 72151 checked
  omega

theorem within_body : 72151 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72081 72151 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72081 72151 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72081 72151 address = observedPair address :=
  cachedPair_eq cache 72081 72151 checked address

end SourceCache618Pilot
open LookupCachePilot
namespace SourceCache619Pilot
theorem checked_72151_220 : validate cache_72151_220 72151 =
    some 72371 := by
  decide +kernel

theorem checked : validate cache 72151 = some 72371 := checked_72151_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 72151 72371 checked
  omega

theorem within_body : 72371 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72151 72371 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72151 72371 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72151 72371 address = observedPair address :=
  cachedPair_eq cache 72151 72371 checked address

end SourceCache619Pilot
open LookupCachePilot
namespace SourceCache620Pilot
theorem checked_72371_70 : validate cache_72371_70 72371 =
    some 72441 := by
  decide +kernel

theorem checked : validate cache 72371 = some 72441 := checked_72371_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 72371 72441 checked
  omega

theorem within_body : 72441 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72371 72441 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72371 72441 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72371 72441 address = observedPair address :=
  cachedPair_eq cache 72371 72441 checked address

end SourceCache620Pilot
open LookupCachePilot
namespace SourceCache621Pilot
theorem checked_72441_132 : validate cache_72441_132 72441 =
    some 72573 := by
  decide +kernel
theorem checked_72573_133 : validate cache_72573_133 72573 =
    some 72706 := by
  decide +kernel
theorem checked_72441_265 : validate cache_72441_265 72441 =
    some 72706 := by
  exact validate_branch 132 cache_72441_132 cache_72573_133
    72441 72573 72706
    checked_72441_132 rfl checked_72573_133

theorem checked : validate cache 72441 = some 72706 := checked_72441_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 72441 72706 checked
  omega

theorem within_body : 72706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72441 72706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72441 72706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72441 72706 address = observedPair address :=
  cachedPair_eq cache 72441 72706 checked address

end SourceCache621Pilot
open LookupCachePilot
namespace SourceCache622Pilot
theorem checked_72706_5 : validate cache_72706_5 72706 =
    some 72711 := by
  decide +kernel

theorem checked : validate cache 72706 = some 72711 := checked_72706_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 72706 72711 checked
  omega

theorem within_body : 72711 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72706 72711 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72706 72711 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72706 72711 address = observedPair address :=
  cachedPair_eq cache 72706 72711 checked address

end SourceCache622Pilot
open LookupCachePilot
namespace SourceCache623Pilot
theorem checked_72711_70 : validate cache_72711_70 72711 =
    some 72781 := by
  decide +kernel

theorem checked : validate cache 72711 = some 72781 := checked_72711_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 72711 72781 checked
  omega

theorem within_body : 72781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72711 72781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72711 72781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72711 72781 address = observedPair address :=
  cachedPair_eq cache 72711 72781 checked address

end SourceCache623Pilot
open LookupCachePilot
namespace SourceCache624Pilot
theorem checked_72781_167 : validate cache_72781_167 72781 =
    some 72948 := by
  decide +kernel
theorem checked_72948_168 : validate cache_72948_168 72948 =
    some 73116 := by
  decide +kernel
theorem checked_72781_335 : validate cache_72781_335 72781 =
    some 73116 := by
  exact validate_branch 167 cache_72781_167 cache_72948_168
    72781 72948 73116
    checked_72781_167 rfl checked_72948_168
theorem checked_73116_167 : validate cache_73116_167 73116 =
    some 73283 := by
  decide +kernel
theorem checked_73283_168 : validate cache_73283_168 73283 =
    some 73451 := by
  decide +kernel
theorem checked_73116_335 : validate cache_73116_335 73116 =
    some 73451 := by
  exact validate_branch 167 cache_73116_167 cache_73283_168
    73116 73283 73451
    checked_73116_167 rfl checked_73283_168
theorem checked_72781_670 : validate cache_72781_670 72781 =
    some 73451 := by
  exact validate_branch 335 cache_72781_335 cache_73116_335
    72781 73116 73451
    checked_72781_335 rfl checked_73116_335

theorem checked : validate cache 72781 = some 73451 := checked_72781_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 72781 73451 checked
  omega

theorem within_body : 73451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 72781 73451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 72781 73451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 72781 73451 address = observedPair address :=
  cachedPair_eq cache 72781 73451 checked address

end SourceCache624Pilot
open LookupCachePilot
namespace SourceCache625Pilot
theorem checked_73451_70 : validate cache_73451_70 73451 =
    some 73521 := by
  decide +kernel

theorem checked : validate cache 73451 = some 73521 := checked_73451_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 73451 73521 checked
  omega

theorem within_body : 73521 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 73451 73521 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 73451 73521 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 73451 73521 address = observedPair address :=
  cachedPair_eq cache 73451 73521 checked address

end SourceCache625Pilot
open LookupCachePilot
namespace SourceCache626Pilot
theorem checked_73521_167 : validate cache_73521_167 73521 =
    some 73688 := by
  decide +kernel
theorem checked_73688_168 : validate cache_73688_168 73688 =
    some 73856 := by
  decide +kernel
theorem checked_73521_335 : validate cache_73521_335 73521 =
    some 73856 := by
  exact validate_branch 167 cache_73521_167 cache_73688_168
    73521 73688 73856
    checked_73521_167 rfl checked_73688_168
theorem checked_73856_167 : validate cache_73856_167 73856 =
    some 74023 := by
  decide +kernel
theorem checked_74023_168 : validate cache_74023_168 74023 =
    some 74191 := by
  decide +kernel
theorem checked_73856_335 : validate cache_73856_335 73856 =
    some 74191 := by
  exact validate_branch 167 cache_73856_167 cache_74023_168
    73856 74023 74191
    checked_73856_167 rfl checked_74023_168
theorem checked_73521_670 : validate cache_73521_670 73521 =
    some 74191 := by
  exact validate_branch 335 cache_73521_335 cache_73856_335
    73521 73856 74191
    checked_73521_335 rfl checked_73856_335

theorem checked : validate cache 73521 = some 74191 := checked_73521_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 73521 74191 checked
  omega

theorem within_body : 74191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 73521 74191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 73521 74191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 73521 74191 address = observedPair address :=
  cachedPair_eq cache 73521 74191 checked address

end SourceCache626Pilot
open LookupCachePilot
namespace SourceCache627Pilot
theorem checked_74191_167 : validate cache_74191_167 74191 =
    some 74358 := by
  decide +kernel
theorem checked_74358_168 : validate cache_74358_168 74358 =
    some 74526 := by
  decide +kernel
theorem checked_74191_335 : validate cache_74191_335 74191 =
    some 74526 := by
  exact validate_branch 167 cache_74191_167 cache_74358_168
    74191 74358 74526
    checked_74191_167 rfl checked_74358_168
theorem checked_74526_167 : validate cache_74526_167 74526 =
    some 74693 := by
  decide +kernel
theorem checked_74693_168 : validate cache_74693_168 74693 =
    some 74861 := by
  decide +kernel
theorem checked_74526_335 : validate cache_74526_335 74526 =
    some 74861 := by
  exact validate_branch 167 cache_74526_167 cache_74693_168
    74526 74693 74861
    checked_74526_167 rfl checked_74693_168
theorem checked_74191_670 : validate cache_74191_670 74191 =
    some 74861 := by
  exact validate_branch 335 cache_74191_335 cache_74526_335
    74191 74526 74861
    checked_74191_335 rfl checked_74526_335

theorem checked : validate cache 74191 = some 74861 := checked_74191_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 74191 74861 checked
  omega

theorem within_body : 74861 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 74191 74861 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 74191 74861 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 74191 74861 address = observedPair address :=
  cachedPair_eq cache 74191 74861 checked address

end SourceCache627Pilot
open LookupCachePilot
namespace SourceCache628Pilot
theorem checked_74861_5 : validate cache_74861_5 74861 =
    some 74866 := by
  decide +kernel

theorem checked : validate cache 74861 = some 74866 := checked_74861_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 74861 74866 checked
  omega

theorem within_body : 74866 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 74861 74866 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 74861 74866 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 74861 74866 address = observedPair address :=
  cachedPair_eq cache 74861 74866 checked address

end SourceCache628Pilot
open LookupCachePilot
namespace SourceCache629Pilot
theorem checked_74866_70 : validate cache_74866_70 74866 =
    some 74936 := by
  decide +kernel

theorem checked : validate cache 74866 = some 74936 := checked_74866_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 74866 74936 checked
  omega

theorem within_body : 74936 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 74866 74936 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 74866 74936 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 74866 74936 address = observedPair address :=
  cachedPair_eq cache 74866 74936 checked address

end SourceCache629Pilot
open LookupCachePilot
namespace SourceCache630Pilot
theorem checked_74936_167 : validate cache_74936_167 74936 =
    some 75103 := by
  decide +kernel
theorem checked_75103_168 : validate cache_75103_168 75103 =
    some 75271 := by
  decide +kernel
theorem checked_74936_335 : validate cache_74936_335 74936 =
    some 75271 := by
  exact validate_branch 167 cache_74936_167 cache_75103_168
    74936 75103 75271
    checked_74936_167 rfl checked_75103_168
theorem checked_75271_167 : validate cache_75271_167 75271 =
    some 75438 := by
  decide +kernel
theorem checked_75438_168 : validate cache_75438_168 75438 =
    some 75606 := by
  decide +kernel
theorem checked_75271_335 : validate cache_75271_335 75271 =
    some 75606 := by
  exact validate_branch 167 cache_75271_167 cache_75438_168
    75271 75438 75606
    checked_75271_167 rfl checked_75438_168
theorem checked_74936_670 : validate cache_74936_670 74936 =
    some 75606 := by
  exact validate_branch 335 cache_74936_335 cache_75271_335
    74936 75271 75606
    checked_74936_335 rfl checked_75271_335

theorem checked : validate cache 74936 = some 75606 := checked_74936_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 74936 75606 checked
  omega

theorem within_body : 75606 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 74936 75606 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 74936 75606 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 74936 75606 address = observedPair address :=
  cachedPair_eq cache 74936 75606 checked address

end SourceCache630Pilot
open LookupCachePilot
namespace SourceCache631Pilot
theorem checked_75606_5 : validate cache_75606_5 75606 =
    some 75611 := by
  decide +kernel

theorem checked : validate cache 75606 = some 75611 := checked_75606_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 75606 75611 checked
  omega

theorem within_body : 75611 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75606 75611 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75606 75611 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75606 75611 address = observedPair address :=
  cachedPair_eq cache 75606 75611 checked address

end SourceCache631Pilot
open LookupCachePilot
namespace SourceCache632Pilot
theorem checked_75611_70 : validate cache_75611_70 75611 =
    some 75681 := by
  decide +kernel

theorem checked : validate cache 75611 = some 75681 := checked_75611_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 75611 75681 checked
  omega

theorem within_body : 75681 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75611 75681 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75611 75681 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75611 75681 address = observedPair address :=
  cachedPair_eq cache 75611 75681 checked address

end SourceCache632Pilot
open LookupCachePilot
namespace SourceCache633Pilot
theorem checked_75681_220 : validate cache_75681_220 75681 =
    some 75901 := by
  decide +kernel

theorem checked : validate cache 75681 = some 75901 := checked_75681_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 75681 75901 checked
  omega

theorem within_body : 75901 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75681 75901 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75681 75901 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75681 75901 address = observedPair address :=
  cachedPair_eq cache 75681 75901 checked address

end SourceCache633Pilot
open LookupCachePilot
namespace SourceCache634Pilot
theorem checked_75901_5 : validate cache_75901_5 75901 =
    some 75906 := by
  decide +kernel

theorem checked : validate cache 75901 = some 75906 := checked_75901_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 75901 75906 checked
  omega

theorem within_body : 75906 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75901 75906 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75901 75906 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75901 75906 address = observedPair address :=
  cachedPair_eq cache 75901 75906 checked address

end SourceCache634Pilot
open LookupCachePilot
namespace SourceCache635Pilot
theorem checked_75906_70 : validate cache_75906_70 75906 =
    some 75976 := by
  decide +kernel

theorem checked : validate cache 75906 = some 75976 := checked_75906_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 75906 75976 checked
  omega

theorem within_body : 75976 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75906 75976 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75906 75976 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75906 75976 address = observedPair address :=
  cachedPair_eq cache 75906 75976 checked address

end SourceCache635Pilot
open LookupCachePilot
namespace SourceCache636Pilot
theorem checked_75976_132 : validate cache_75976_132 75976 =
    some 76108 := by
  decide +kernel
theorem checked_76108_133 : validate cache_76108_133 76108 =
    some 76241 := by
  decide +kernel
theorem checked_75976_265 : validate cache_75976_265 75976 =
    some 76241 := by
  exact validate_branch 132 cache_75976_132 cache_76108_133
    75976 76108 76241
    checked_75976_132 rfl checked_76108_133

theorem checked : validate cache 75976 = some 76241 := checked_75976_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 75976 76241 checked
  omega

theorem within_body : 76241 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 75976 76241 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 75976 76241 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 75976 76241 address = observedPair address :=
  cachedPair_eq cache 75976 76241 checked address

end SourceCache636Pilot
open LookupCachePilot
namespace SourceCache637Pilot
theorem checked_76241_5 : validate cache_76241_5 76241 =
    some 76246 := by
  decide +kernel

theorem checked : validate cache 76241 = some 76246 := checked_76241_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 76241 76246 checked
  omega

theorem within_body : 76246 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 76241 76246 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 76241 76246 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 76241 76246 address = observedPair address :=
  cachedPair_eq cache 76241 76246 checked address

end SourceCache637Pilot
open LookupCachePilot
namespace SourceCache638Pilot
theorem checked_76246_10 : validate cache_76246_10 76246 =
    some 76256 := by
  decide +kernel

theorem checked : validate cache 76246 = some 76256 := checked_76246_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 76246 76256 checked
  omega

theorem within_body : 76256 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 76246 76256 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 76246 76256 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 76246 76256 address = observedPair address :=
  cachedPair_eq cache 76246 76256 checked address

end SourceCache638Pilot
open LookupCachePilot
namespace SourceCache639Pilot
theorem checked_76256_185 : validate cache_76256_185 76256 =
    some 76441 := by
  decide +kernel
theorem checked_76441_185 : validate cache_76441_185 76441 =
    some 76626 := by
  decide +kernel
theorem checked_76256_370 : validate cache_76256_370 76256 =
    some 76626 := by
  exact validate_branch 185 cache_76256_185 cache_76441_185
    76256 76441 76626
    checked_76256_185 rfl checked_76441_185

theorem checked : validate cache 76256 = some 76626 := checked_76256_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 76256 76626 checked
  omega

theorem within_body : 76626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 76256 76626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 76256 76626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 76256 76626 address = observedPair address :=
  cachedPair_eq cache 76256 76626 checked address

end SourceCache639Pilot
open LookupCachePilot
namespace SourceCache640Pilot
theorem checked_76626_220 : validate cache_76626_220 76626 =
    some 76846 := by
  decide +kernel
theorem checked_76846_220 : validate cache_76846_220 76846 =
    some 77066 := by
  decide +kernel
theorem checked_76626_440 : validate cache_76626_440 76626 =
    some 77066 := by
  exact validate_branch 220 cache_76626_220 cache_76846_220
    76626 76846 77066
    checked_76626_220 rfl checked_76846_220

theorem checked : validate cache 76626 = some 77066 := checked_76626_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 76626 77066 checked
  omega

theorem within_body : 77066 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 76626 77066 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 76626 77066 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 76626 77066 address = observedPair address :=
  cachedPair_eq cache 76626 77066 checked address

end SourceCache640Pilot
open LookupCachePilot
namespace SourceCache641Pilot
theorem checked_77066_70 : validate cache_77066_70 77066 =
    some 77136 := by
  decide +kernel

theorem checked : validate cache 77066 = some 77136 := checked_77066_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 77066 77136 checked
  omega

theorem within_body : 77136 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77066 77136 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77066 77136 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77066 77136 address = observedPair address :=
  cachedPair_eq cache 77066 77136 checked address

end SourceCache641Pilot
open LookupCachePilot
namespace SourceCache642Pilot
theorem checked_77136_195 : validate cache_77136_195 77136 =
    some 77331 := by
  decide +kernel

theorem checked : validate cache 77136 = some 77331 := checked_77136_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 77136 77331 checked
  omega

theorem within_body : 77331 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77136 77331 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77136 77331 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77136 77331 address = observedPair address :=
  cachedPair_eq cache 77136 77331 checked address

end SourceCache642Pilot
open LookupCachePilot
namespace SourceCache643Pilot
theorem checked_77331_70 : validate cache_77331_70 77331 =
    some 77401 := by
  decide +kernel

theorem checked : validate cache 77331 = some 77401 := checked_77331_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 77331 77401 checked
  omega

theorem within_body : 77401 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77331 77401 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77331 77401 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77331 77401 address = observedPair address :=
  cachedPair_eq cache 77331 77401 checked address

end SourceCache643Pilot
open LookupCachePilot
namespace SourceCache644Pilot
theorem checked_77401_200 : validate cache_77401_200 77401 =
    some 77601 := by
  decide +kernel
theorem checked_77601_200 : validate cache_77601_200 77601 =
    some 77801 := by
  decide +kernel
theorem checked_77401_400 : validate cache_77401_400 77401 =
    some 77801 := by
  exact validate_branch 200 cache_77401_200 cache_77601_200
    77401 77601 77801
    checked_77401_200 rfl checked_77601_200

theorem checked : validate cache 77401 = some 77801 := checked_77401_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 77401 77801 checked
  omega

theorem within_body : 77801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77401 77801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77401 77801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77401 77801 address = observedPair address :=
  cachedPair_eq cache 77401 77801 checked address

end SourceCache644Pilot
open LookupCachePilot
namespace SourceCache645Pilot
theorem checked_77801_5 : validate cache_77801_5 77801 =
    some 77806 := by
  decide +kernel

theorem checked : validate cache 77801 = some 77806 := checked_77801_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 77801 77806 checked
  omega

theorem within_body : 77806 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77801 77806 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77801 77806 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77801 77806 address = observedPair address :=
  cachedPair_eq cache 77801 77806 checked address

end SourceCache645Pilot
open LookupCachePilot
namespace SourceCache646Pilot
theorem checked_77806_70 : validate cache_77806_70 77806 =
    some 77876 := by
  decide +kernel

theorem checked : validate cache 77806 = some 77876 := checked_77806_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 77806 77876 checked
  omega

theorem within_body : 77876 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77806 77876 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77806 77876 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77806 77876 address = observedPair address :=
  cachedPair_eq cache 77806 77876 checked address

end SourceCache646Pilot
open LookupCachePilot
namespace SourceCache647Pilot
theorem checked_77876_185 : validate cache_77876_185 77876 =
    some 78061 := by
  decide +kernel
theorem checked_78061_185 : validate cache_78061_185 78061 =
    some 78246 := by
  decide +kernel
theorem checked_77876_370 : validate cache_77876_370 77876 =
    some 78246 := by
  exact validate_branch 185 cache_77876_185 cache_78061_185
    77876 78061 78246
    checked_77876_185 rfl checked_78061_185

theorem checked : validate cache 77876 = some 78246 := checked_77876_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 77876 78246 checked
  omega

theorem within_body : 78246 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 77876 78246 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 77876 78246 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 77876 78246 address = observedPair address :=
  cachedPair_eq cache 77876 78246 checked address

end SourceCache647Pilot
open LookupCachePilot
namespace SourceCache648Pilot
theorem checked_78246_5 : validate cache_78246_5 78246 =
    some 78251 := by
  decide +kernel

theorem checked : validate cache 78246 = some 78251 := checked_78246_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 78246 78251 checked
  omega

theorem within_body : 78251 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78246 78251 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78246 78251 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78246 78251 address = observedPair address :=
  cachedPair_eq cache 78246 78251 checked address

end SourceCache648Pilot
open LookupCachePilot
namespace SourceCache649Pilot
theorem checked_78251_70 : validate cache_78251_70 78251 =
    some 78321 := by
  decide +kernel

theorem checked : validate cache 78251 = some 78321 := checked_78251_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 78251 78321 checked
  omega

theorem within_body : 78321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78251 78321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78251 78321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78251 78321 address = observedPair address :=
  cachedPair_eq cache 78251 78321 checked address

end SourceCache649Pilot
open LookupCachePilot
namespace SourceCache650Pilot
theorem checked_78321_200 : validate cache_78321_200 78321 =
    some 78521 := by
  decide +kernel
theorem checked_78521_200 : validate cache_78521_200 78521 =
    some 78721 := by
  decide +kernel
theorem checked_78321_400 : validate cache_78321_400 78321 =
    some 78721 := by
  exact validate_branch 200 cache_78321_200 cache_78521_200
    78321 78521 78721
    checked_78321_200 rfl checked_78521_200

theorem checked : validate cache 78321 = some 78721 := checked_78321_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 78321 78721 checked
  omega

theorem within_body : 78721 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78321 78721 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78321 78721 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78321 78721 address = observedPair address :=
  cachedPair_eq cache 78321 78721 checked address

end SourceCache650Pilot
open LookupCachePilot
namespace SourceCache651Pilot
theorem checked_78721_5 : validate cache_78721_5 78721 =
    some 78726 := by
  decide +kernel

theorem checked : validate cache 78721 = some 78726 := checked_78721_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 78721 78726 checked
  omega

theorem within_body : 78726 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78721 78726 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78721 78726 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78721 78726 address = observedPair address :=
  cachedPair_eq cache 78721 78726 checked address

end SourceCache651Pilot
open LookupCachePilot
namespace SourceCache652Pilot
theorem checked_78726_10 : validate cache_78726_10 78726 =
    some 78736 := by
  decide +kernel

theorem checked : validate cache 78726 = some 78736 := checked_78726_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 78726 78736 checked
  omega

theorem within_body : 78736 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78726 78736 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78726 78736 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78726 78736 address = observedPair address :=
  cachedPair_eq cache 78726 78736 checked address

end SourceCache652Pilot
open LookupCachePilot
namespace SourceCache653Pilot
theorem checked_78736_167 : validate cache_78736_167 78736 =
    some 78903 := by
  decide +kernel
theorem checked_78903_168 : validate cache_78903_168 78903 =
    some 79071 := by
  decide +kernel
theorem checked_78736_335 : validate cache_78736_335 78736 =
    some 79071 := by
  exact validate_branch 167 cache_78736_167 cache_78903_168
    78736 78903 79071
    checked_78736_167 rfl checked_78903_168
theorem checked_79071_167 : validate cache_79071_167 79071 =
    some 79238 := by
  decide +kernel
theorem checked_79238_168 : validate cache_79238_168 79238 =
    some 79406 := by
  decide +kernel
theorem checked_79071_335 : validate cache_79071_335 79071 =
    some 79406 := by
  exact validate_branch 167 cache_79071_167 cache_79238_168
    79071 79238 79406
    checked_79071_167 rfl checked_79238_168
theorem checked_78736_670 : validate cache_78736_670 78736 =
    some 79406 := by
  exact validate_branch 335 cache_78736_335 cache_79071_335
    78736 79071 79406
    checked_78736_335 rfl checked_79071_335

theorem checked : validate cache 78736 = some 79406 := checked_78736_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 78736 79406 checked
  omega

theorem within_body : 79406 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 78736 79406 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 78736 79406 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 78736 79406 address = observedPair address :=
  cachedPair_eq cache 78736 79406 checked address

end SourceCache653Pilot
open LookupCachePilot
namespace SourceCache654Pilot
theorem checked_79406_177 : validate cache_79406_177 79406 =
    some 79583 := by
  decide +kernel
theorem checked_79583_178 : validate cache_79583_178 79583 =
    some 79761 := by
  decide +kernel
theorem checked_79406_355 : validate cache_79406_355 79406 =
    some 79761 := by
  exact validate_branch 177 cache_79406_177 cache_79583_178
    79406 79583 79761
    checked_79406_177 rfl checked_79583_178
theorem checked_79761_177 : validate cache_79761_177 79761 =
    some 79938 := by
  decide +kernel
theorem checked_79938_178 : validate cache_79938_178 79938 =
    some 80116 := by
  decide +kernel
theorem checked_79761_355 : validate cache_79761_355 79761 =
    some 80116 := by
  exact validate_branch 177 cache_79761_177 cache_79938_178
    79761 79938 80116
    checked_79761_177 rfl checked_79938_178
theorem checked_79406_710 : validate cache_79406_710 79406 =
    some 80116 := by
  exact validate_branch 355 cache_79406_355 cache_79761_355
    79406 79761 80116
    checked_79406_355 rfl checked_79761_355

theorem checked : validate cache 79406 = some 80116 := checked_79406_710

theorem count_exact : cache.count = 710 := by
  have extent := validate_extent cache 79406 80116 checked
  omega

theorem within_body : 80116 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 79406 80116 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 79406 80116 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 79406 80116 address = observedPair address :=
  cachedPair_eq cache 79406 80116 checked address

end SourceCache654Pilot
open LookupCachePilot
namespace SourceCache655Pilot
theorem checked_80116_70 : validate cache_80116_70 80116 =
    some 80186 := by
  decide +kernel

theorem checked : validate cache 80116 = some 80186 := checked_80116_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 80116 80186 checked
  omega

theorem within_body : 80186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 80116 80186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 80116 80186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 80116 80186 address = observedPair address :=
  cachedPair_eq cache 80116 80186 checked address

end SourceCache655Pilot
open LookupCachePilot
namespace SourceCache656Pilot
theorem checked_80186_195 : validate cache_80186_195 80186 =
    some 80381 := by
  decide +kernel

theorem checked : validate cache 80186 = some 80381 := checked_80186_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 80186 80381 checked
  omega

theorem within_body : 80381 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 80186 80381 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 80186 80381 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 80186 80381 address = observedPair address :=
  cachedPair_eq cache 80186 80381 checked address

end SourceCache656Pilot
open LookupCachePilot
namespace SourceCache657Pilot
theorem checked_80381_70 : validate cache_80381_70 80381 =
    some 80451 := by
  decide +kernel

theorem checked : validate cache 80381 = some 80451 := checked_80381_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 80381 80451 checked
  omega

theorem within_body : 80451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 80381 80451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 80381 80451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 80381 80451 address = observedPair address :=
  cachedPair_eq cache 80381 80451 checked address

end SourceCache657Pilot
open LookupCachePilot
namespace SourceCache658Pilot
theorem checked_80451_167 : validate cache_80451_167 80451 =
    some 80618 := by
  decide +kernel
theorem checked_80618_168 : validate cache_80618_168 80618 =
    some 80786 := by
  decide +kernel
theorem checked_80451_335 : validate cache_80451_335 80451 =
    some 80786 := by
  exact validate_branch 167 cache_80451_167 cache_80618_168
    80451 80618 80786
    checked_80451_167 rfl checked_80618_168
theorem checked_80786_167 : validate cache_80786_167 80786 =
    some 80953 := by
  decide +kernel
theorem checked_80953_168 : validate cache_80953_168 80953 =
    some 81121 := by
  decide +kernel
theorem checked_80786_335 : validate cache_80786_335 80786 =
    some 81121 := by
  exact validate_branch 167 cache_80786_167 cache_80953_168
    80786 80953 81121
    checked_80786_167 rfl checked_80953_168
theorem checked_80451_670 : validate cache_80451_670 80451 =
    some 81121 := by
  exact validate_branch 335 cache_80451_335 cache_80786_335
    80451 80786 81121
    checked_80451_335 rfl checked_80786_335

theorem checked : validate cache 80451 = some 81121 := checked_80451_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 80451 81121 checked
  omega

theorem within_body : 81121 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 80451 81121 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 80451 81121 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 80451 81121 address = observedPair address :=
  cachedPair_eq cache 80451 81121 checked address

end SourceCache658Pilot
open LookupCachePilot
namespace SourceCache659Pilot
theorem checked_81121_5 : validate cache_81121_5 81121 =
    some 81126 := by
  decide +kernel

theorem checked : validate cache 81121 = some 81126 := checked_81121_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 81121 81126 checked
  omega

theorem within_body : 81126 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81121 81126 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81121 81126 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81121 81126 address = observedPair address :=
  cachedPair_eq cache 81121 81126 checked address

end SourceCache659Pilot
open LookupCachePilot
namespace SourceCache660Pilot
theorem checked_81126_70 : validate cache_81126_70 81126 =
    some 81196 := by
  decide +kernel

theorem checked : validate cache 81126 = some 81196 := checked_81126_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 81126 81196 checked
  omega

theorem within_body : 81196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81126 81196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81126 81196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81126 81196 address = observedPair address :=
  cachedPair_eq cache 81126 81196 checked address

end SourceCache660Pilot
open LookupCachePilot
namespace SourceCache661Pilot
theorem checked_81196_167 : validate cache_81196_167 81196 =
    some 81363 := by
  decide +kernel
theorem checked_81363_168 : validate cache_81363_168 81363 =
    some 81531 := by
  decide +kernel
theorem checked_81196_335 : validate cache_81196_335 81196 =
    some 81531 := by
  exact validate_branch 167 cache_81196_167 cache_81363_168
    81196 81363 81531
    checked_81196_167 rfl checked_81363_168
theorem checked_81531_167 : validate cache_81531_167 81531 =
    some 81698 := by
  decide +kernel
theorem checked_81698_168 : validate cache_81698_168 81698 =
    some 81866 := by
  decide +kernel
theorem checked_81531_335 : validate cache_81531_335 81531 =
    some 81866 := by
  exact validate_branch 167 cache_81531_167 cache_81698_168
    81531 81698 81866
    checked_81531_167 rfl checked_81698_168
theorem checked_81196_670 : validate cache_81196_670 81196 =
    some 81866 := by
  exact validate_branch 335 cache_81196_335 cache_81531_335
    81196 81531 81866
    checked_81196_335 rfl checked_81531_335

theorem checked : validate cache 81196 = some 81866 := checked_81196_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 81196 81866 checked
  omega

theorem within_body : 81866 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81196 81866 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81196 81866 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81196 81866 address = observedPair address :=
  cachedPair_eq cache 81196 81866 checked address

end SourceCache661Pilot
open LookupCachePilot
namespace SourceCache662Pilot
theorem checked_81866_70 : validate cache_81866_70 81866 =
    some 81936 := by
  decide +kernel

theorem checked : validate cache 81866 = some 81936 := checked_81866_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 81866 81936 checked
  omega

theorem within_body : 81936 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81866 81936 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81866 81936 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81866 81936 address = observedPair address :=
  cachedPair_eq cache 81866 81936 checked address

end SourceCache662Pilot
namespace ScopeViews006Pilot
noncomputable def fromRaw_585 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache585Pilot.cache 65566 66236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache585Pilot.cache
    65566 66236 SourceCache585Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_586 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache586Pilot.cache 66236 66241)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache586Pilot.cache
    66236 66241 SourceCache586Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_587 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache587Pilot.cache 66241 66311)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache587Pilot.cache
    66241 66311 SourceCache587Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_588 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache588Pilot.cache 66311 66981)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache588Pilot.cache
    66311 66981 SourceCache588Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_589 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache589Pilot.cache 66981 66986)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache589Pilot.cache
    66981 66986 SourceCache589Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_590 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache590Pilot.cache 66986 67056)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache590Pilot.cache
    66986 67056 SourceCache590Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_591 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache591Pilot.cache 67056 67276)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache591Pilot.cache
    67056 67276 SourceCache591Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_592 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache592Pilot.cache 67276 67281)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache592Pilot.cache
    67276 67281 SourceCache592Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_593 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache593Pilot.cache 67281 67351)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache593Pilot.cache
    67281 67351 SourceCache593Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_594 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache594Pilot.cache 67351 67616)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache594Pilot.cache
    67351 67616 SourceCache594Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_595 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache595Pilot.cache 67616 67621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache595Pilot.cache
    67616 67621 SourceCache595Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_596 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache596Pilot.cache 67621 67631)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache596Pilot.cache
    67621 67631 SourceCache596Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_597 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache597Pilot.cache 67631 68001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache597Pilot.cache
    67631 68001 SourceCache597Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_598 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache598Pilot.cache 68001 68441)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache598Pilot.cache
    68001 68441 SourceCache598Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_599 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache599Pilot.cache 68441 68511)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache599Pilot.cache
    68441 68511 SourceCache599Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_600 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache600Pilot.cache 68511 68706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache600Pilot.cache
    68511 68706 SourceCache600Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_601 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache601Pilot.cache 68706 68776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache601Pilot.cache
    68706 68776 SourceCache601Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_602 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache602Pilot.cache 68776 69176)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache602Pilot.cache
    68776 69176 SourceCache602Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_603 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache603Pilot.cache 69176 69181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache603Pilot.cache
    69176 69181 SourceCache603Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_604 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache604Pilot.cache 69181 69251)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache604Pilot.cache
    69181 69251 SourceCache604Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_605 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache605Pilot.cache 69251 69621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache605Pilot.cache
    69251 69621 SourceCache605Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_606 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache606Pilot.cache 69621 69626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache606Pilot.cache
    69621 69626 SourceCache606Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_607 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache607Pilot.cache 69626 69696)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache607Pilot.cache
    69626 69696 SourceCache607Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_608 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache608Pilot.cache 69696 70096)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache608Pilot.cache
    69696 70096 SourceCache608Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_609 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache609Pilot.cache 70096 70101)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache609Pilot.cache
    70096 70101 SourceCache609Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_610 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache610Pilot.cache 70101 70111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache610Pilot.cache
    70101 70111 SourceCache610Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_611 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache611Pilot.cache 70111 70631)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache611Pilot.cache
    70111 70631 SourceCache611Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_612 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache612Pilot.cache 70631 71206)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache612Pilot.cache
    70631 71206 SourceCache612Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_613 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache613Pilot.cache 71206 71276)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache613Pilot.cache
    71206 71276 SourceCache613Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_614 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache614Pilot.cache 71276 71471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache614Pilot.cache
    71276 71471 SourceCache614Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_615 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache615Pilot.cache 71471 71541)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache615Pilot.cache
    71471 71541 SourceCache615Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_616 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache616Pilot.cache 71541 72076)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache616Pilot.cache
    71541 72076 SourceCache616Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_617 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache617Pilot.cache 72076 72081)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache617Pilot.cache
    72076 72081 SourceCache617Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_618 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache618Pilot.cache 72081 72151)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache618Pilot.cache
    72081 72151 SourceCache618Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_619 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache619Pilot.cache 72151 72371)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache619Pilot.cache
    72151 72371 SourceCache619Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_620 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache620Pilot.cache 72371 72441)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache620Pilot.cache
    72371 72441 SourceCache620Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_621 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache621Pilot.cache 72441 72706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache621Pilot.cache
    72441 72706 SourceCache621Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_622 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache622Pilot.cache 72706 72711)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache622Pilot.cache
    72706 72711 SourceCache622Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_623 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache623Pilot.cache 72711 72781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache623Pilot.cache
    72711 72781 SourceCache623Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_624 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache624Pilot.cache 72781 73451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache624Pilot.cache
    72781 73451 SourceCache624Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_625 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache625Pilot.cache 73451 73521)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache625Pilot.cache
    73451 73521 SourceCache625Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_626 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache626Pilot.cache 73521 74191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache626Pilot.cache
    73521 74191 SourceCache626Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_627 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache627Pilot.cache 74191 74861)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache627Pilot.cache
    74191 74861 SourceCache627Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_628 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache628Pilot.cache 74861 74866)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache628Pilot.cache
    74861 74866 SourceCache628Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_629 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache629Pilot.cache 74866 74936)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache629Pilot.cache
    74866 74936 SourceCache629Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_630 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache630Pilot.cache 74936 75606)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache630Pilot.cache
    74936 75606 SourceCache630Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_631 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache631Pilot.cache 75606 75611)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache631Pilot.cache
    75606 75611 SourceCache631Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_632 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache632Pilot.cache 75611 75681)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache632Pilot.cache
    75611 75681 SourceCache632Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_633 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache633Pilot.cache 75681 75901)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache633Pilot.cache
    75681 75901 SourceCache633Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_634 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache634Pilot.cache 75901 75906)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache634Pilot.cache
    75901 75906 SourceCache634Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_635 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache635Pilot.cache 75906 75976)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache635Pilot.cache
    75906 75976 SourceCache635Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_636 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache636Pilot.cache 75976 76241)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache636Pilot.cache
    75976 76241 SourceCache636Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_637 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache637Pilot.cache 76241 76246)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache637Pilot.cache
    76241 76246 SourceCache637Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_638 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache638Pilot.cache 76246 76256)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache638Pilot.cache
    76246 76256 SourceCache638Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_639 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache639Pilot.cache 76256 76626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache639Pilot.cache
    76256 76626 SourceCache639Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_640 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache640Pilot.cache 76626 77066)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache640Pilot.cache
    76626 77066 SourceCache640Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_641 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache641Pilot.cache 77066 77136)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache641Pilot.cache
    77066 77136 SourceCache641Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_642 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache642Pilot.cache 77136 77331)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache642Pilot.cache
    77136 77331 SourceCache642Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_643 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache643Pilot.cache 77331 77401)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache643Pilot.cache
    77331 77401 SourceCache643Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_644 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache644Pilot.cache 77401 77801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache644Pilot.cache
    77401 77801 SourceCache644Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_645 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache645Pilot.cache 77801 77806)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache645Pilot.cache
    77801 77806 SourceCache645Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_646 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache646Pilot.cache 77806 77876)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache646Pilot.cache
    77806 77876 SourceCache646Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_647 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache647Pilot.cache 77876 78246)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache647Pilot.cache
    77876 78246 SourceCache647Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_648 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache648Pilot.cache 78246 78251)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache648Pilot.cache
    78246 78251 SourceCache648Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_649 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache649Pilot.cache 78251 78321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache649Pilot.cache
    78251 78321 SourceCache649Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_650 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache650Pilot.cache 78321 78721)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache650Pilot.cache
    78321 78721 SourceCache650Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_651 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache651Pilot.cache 78721 78726)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache651Pilot.cache
    78721 78726 SourceCache651Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_652 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache652Pilot.cache 78726 78736)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache652Pilot.cache
    78726 78736 SourceCache652Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_653 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache653Pilot.cache 78736 79406)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache653Pilot.cache
    78736 79406 SourceCache653Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_654 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache654Pilot.cache 79406 80116)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache654Pilot.cache
    79406 80116 SourceCache654Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_655 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache655Pilot.cache 80116 80186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache655Pilot.cache
    80116 80186 SourceCache655Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_656 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache656Pilot.cache 80186 80381)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache656Pilot.cache
    80186 80381 SourceCache656Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_657 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache657Pilot.cache 80381 80451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache657Pilot.cache
    80381 80451 SourceCache657Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_658 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache658Pilot.cache 80451 81121)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache658Pilot.cache
    80451 81121 SourceCache658Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_659 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache659Pilot.cache 81121 81126)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache659Pilot.cache
    81121 81126 SourceCache659Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_660 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache660Pilot.cache 81126 81196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache660Pilot.cache
    81126 81196 SourceCache660Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_661 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache661Pilot.cache 81196 81866)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache661Pilot.cache
    81196 81866 SourceCache661Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_662 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache662Pilot.cache 81866 81936)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache662Pilot.cache
    81866 81936 SourceCache662Pilot.checked q raw nodes returns truth
end ScopeViews006Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
