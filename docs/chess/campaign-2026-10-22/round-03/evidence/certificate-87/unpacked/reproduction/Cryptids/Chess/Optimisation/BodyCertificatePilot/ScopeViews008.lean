module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews008Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache737Pilot
theorem checked_98056_132 : validate cache_98056_132 98056 =
    some 98188 := by
  decide +kernel
theorem checked_98188_133 : validate cache_98188_133 98188 =
    some 98321 := by
  decide +kernel
theorem checked_98056_265 : validate cache_98056_265 98056 =
    some 98321 := by
  exact validate_branch 132 cache_98056_132 cache_98188_133
    98056 98188 98321
    checked_98056_132 rfl checked_98188_133

theorem checked : validate cache 98056 = some 98321 := checked_98056_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 98056 98321 checked
  omega

theorem within_body : 98321 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 98056 98321 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 98056 98321 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 98056 98321 address = observedPair address :=
  cachedPair_eq cache 98056 98321 checked address

end SourceCache737Pilot
open LookupCachePilot
namespace SourceCache738Pilot
theorem checked_98321_5 : validate cache_98321_5 98321 =
    some 98326 := by
  decide +kernel

theorem checked : validate cache 98321 = some 98326 := checked_98321_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 98321 98326 checked
  omega

theorem within_body : 98326 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 98321 98326 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 98321 98326 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 98321 98326 address = observedPair address :=
  cachedPair_eq cache 98321 98326 checked address

end SourceCache738Pilot
open LookupCachePilot
namespace SourceCache739Pilot
theorem checked_98326_70 : validate cache_98326_70 98326 =
    some 98396 := by
  decide +kernel

theorem checked : validate cache 98326 = some 98396 := checked_98326_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 98326 98396 checked
  omega

theorem within_body : 98396 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 98326 98396 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 98326 98396 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 98326 98396 address = observedPair address :=
  cachedPair_eq cache 98326 98396 checked address

end SourceCache739Pilot
open LookupCachePilot
namespace SourceCache740Pilot
theorem checked_98396_167 : validate cache_98396_167 98396 =
    some 98563 := by
  decide +kernel
theorem checked_98563_168 : validate cache_98563_168 98563 =
    some 98731 := by
  decide +kernel
theorem checked_98396_335 : validate cache_98396_335 98396 =
    some 98731 := by
  exact validate_branch 167 cache_98396_167 cache_98563_168
    98396 98563 98731
    checked_98396_167 rfl checked_98563_168
theorem checked_98731_167 : validate cache_98731_167 98731 =
    some 98898 := by
  decide +kernel
theorem checked_98898_168 : validate cache_98898_168 98898 =
    some 99066 := by
  decide +kernel
theorem checked_98731_335 : validate cache_98731_335 98731 =
    some 99066 := by
  exact validate_branch 167 cache_98731_167 cache_98898_168
    98731 98898 99066
    checked_98731_167 rfl checked_98898_168
theorem checked_98396_670 : validate cache_98396_670 98396 =
    some 99066 := by
  exact validate_branch 335 cache_98396_335 cache_98731_335
    98396 98731 99066
    checked_98396_335 rfl checked_98731_335

theorem checked : validate cache 98396 = some 99066 := checked_98396_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 98396 99066 checked
  omega

theorem within_body : 99066 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 98396 99066 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 98396 99066 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 98396 99066 address = observedPair address :=
  cachedPair_eq cache 98396 99066 checked address

end SourceCache740Pilot
open LookupCachePilot
namespace SourceCache741Pilot
theorem checked_99066_70 : validate cache_99066_70 99066 =
    some 99136 := by
  decide +kernel

theorem checked : validate cache 99066 = some 99136 := checked_99066_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 99066 99136 checked
  omega

theorem within_body : 99136 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 99066 99136 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 99066 99136 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 99066 99136 address = observedPair address :=
  cachedPair_eq cache 99066 99136 checked address

end SourceCache741Pilot
open LookupCachePilot
namespace SourceCache742Pilot
theorem checked_99136_167 : validate cache_99136_167 99136 =
    some 99303 := by
  decide +kernel
theorem checked_99303_168 : validate cache_99303_168 99303 =
    some 99471 := by
  decide +kernel
theorem checked_99136_335 : validate cache_99136_335 99136 =
    some 99471 := by
  exact validate_branch 167 cache_99136_167 cache_99303_168
    99136 99303 99471
    checked_99136_167 rfl checked_99303_168
theorem checked_99471_167 : validate cache_99471_167 99471 =
    some 99638 := by
  decide +kernel
theorem checked_99638_168 : validate cache_99638_168 99638 =
    some 99806 := by
  decide +kernel
theorem checked_99471_335 : validate cache_99471_335 99471 =
    some 99806 := by
  exact validate_branch 167 cache_99471_167 cache_99638_168
    99471 99638 99806
    checked_99471_167 rfl checked_99638_168
theorem checked_99136_670 : validate cache_99136_670 99136 =
    some 99806 := by
  exact validate_branch 335 cache_99136_335 cache_99471_335
    99136 99471 99806
    checked_99136_335 rfl checked_99471_335

theorem checked : validate cache 99136 = some 99806 := checked_99136_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 99136 99806 checked
  omega

theorem within_body : 99806 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 99136 99806 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 99136 99806 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 99136 99806 address = observedPair address :=
  cachedPair_eq cache 99136 99806 checked address

end SourceCache742Pilot
open LookupCachePilot
namespace SourceCache743Pilot
theorem checked_99806_167 : validate cache_99806_167 99806 =
    some 99973 := by
  decide +kernel
theorem checked_99973_168 : validate cache_99973_168 99973 =
    some 100141 := by
  decide +kernel
theorem checked_99806_335 : validate cache_99806_335 99806 =
    some 100141 := by
  exact validate_branch 167 cache_99806_167 cache_99973_168
    99806 99973 100141
    checked_99806_167 rfl checked_99973_168
theorem checked_100141_167 : validate cache_100141_167 100141 =
    some 100308 := by
  decide +kernel
theorem checked_100308_168 : validate cache_100308_168 100308 =
    some 100476 := by
  decide +kernel
theorem checked_100141_335 : validate cache_100141_335 100141 =
    some 100476 := by
  exact validate_branch 167 cache_100141_167 cache_100308_168
    100141 100308 100476
    checked_100141_167 rfl checked_100308_168
theorem checked_99806_670 : validate cache_99806_670 99806 =
    some 100476 := by
  exact validate_branch 335 cache_99806_335 cache_100141_335
    99806 100141 100476
    checked_99806_335 rfl checked_100141_335

theorem checked : validate cache 99806 = some 100476 := checked_99806_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 99806 100476 checked
  omega

theorem within_body : 100476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 99806 100476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 99806 100476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 99806 100476 address = observedPair address :=
  cachedPair_eq cache 99806 100476 checked address

end SourceCache743Pilot
open LookupCachePilot
namespace SourceCache744Pilot
theorem checked_100476_5 : validate cache_100476_5 100476 =
    some 100481 := by
  decide +kernel

theorem checked : validate cache 100476 = some 100481 := checked_100476_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 100476 100481 checked
  omega

theorem within_body : 100481 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 100476 100481 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 100476 100481 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 100476 100481 address = observedPair address :=
  cachedPair_eq cache 100476 100481 checked address

end SourceCache744Pilot
open LookupCachePilot
namespace SourceCache745Pilot
theorem checked_100481_70 : validate cache_100481_70 100481 =
    some 100551 := by
  decide +kernel

theorem checked : validate cache 100481 = some 100551 := checked_100481_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 100481 100551 checked
  omega

theorem within_body : 100551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 100481 100551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 100481 100551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 100481 100551 address = observedPair address :=
  cachedPair_eq cache 100481 100551 checked address

end SourceCache745Pilot
open LookupCachePilot
namespace SourceCache746Pilot
theorem checked_100551_167 : validate cache_100551_167 100551 =
    some 100718 := by
  decide +kernel
theorem checked_100718_168 : validate cache_100718_168 100718 =
    some 100886 := by
  decide +kernel
theorem checked_100551_335 : validate cache_100551_335 100551 =
    some 100886 := by
  exact validate_branch 167 cache_100551_167 cache_100718_168
    100551 100718 100886
    checked_100551_167 rfl checked_100718_168
theorem checked_100886_167 : validate cache_100886_167 100886 =
    some 101053 := by
  decide +kernel
theorem checked_101053_168 : validate cache_101053_168 101053 =
    some 101221 := by
  decide +kernel
theorem checked_100886_335 : validate cache_100886_335 100886 =
    some 101221 := by
  exact validate_branch 167 cache_100886_167 cache_101053_168
    100886 101053 101221
    checked_100886_167 rfl checked_101053_168
theorem checked_100551_670 : validate cache_100551_670 100551 =
    some 101221 := by
  exact validate_branch 335 cache_100551_335 cache_100886_335
    100551 100886 101221
    checked_100551_335 rfl checked_100886_335

theorem checked : validate cache 100551 = some 101221 := checked_100551_670

theorem count_exact : cache.count = 670 := by
  have extent := validate_extent cache 100551 101221 checked
  omega

theorem within_body : 101221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 100551 101221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 100551 101221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 100551 101221 address = observedPair address :=
  cachedPair_eq cache 100551 101221 checked address

end SourceCache746Pilot
open LookupCachePilot
namespace SourceCache747Pilot
theorem checked_101221_5 : validate cache_101221_5 101221 =
    some 101226 := by
  decide +kernel

theorem checked : validate cache 101221 = some 101226 := checked_101221_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 101221 101226 checked
  omega

theorem within_body : 101226 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 101221 101226 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 101221 101226 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 101221 101226 address = observedPair address :=
  cachedPair_eq cache 101221 101226 checked address

end SourceCache747Pilot
open LookupCachePilot
namespace SourceCache748Pilot
theorem checked_101226_10 : validate cache_101226_10 101226 =
    some 101236 := by
  decide +kernel

theorem checked : validate cache 101226 = some 101236 := checked_101226_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 101226 101236 checked
  omega

theorem within_body : 101236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 101226 101236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 101226 101236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 101226 101236 address = observedPair address :=
  cachedPair_eq cache 101226 101236 checked address

end SourceCache748Pilot
open LookupCachePilot
namespace SourceCache749Pilot
theorem checked_101236_185 : validate cache_101236_185 101236 =
    some 101421 := by
  decide +kernel
theorem checked_101421_185 : validate cache_101421_185 101421 =
    some 101606 := by
  decide +kernel
theorem checked_101236_370 : validate cache_101236_370 101236 =
    some 101606 := by
  exact validate_branch 185 cache_101236_185 cache_101421_185
    101236 101421 101606
    checked_101236_185 rfl checked_101421_185

theorem checked : validate cache 101236 = some 101606 := checked_101236_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 101236 101606 checked
  omega

theorem within_body : 101606 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 101236 101606 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 101236 101606 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 101236 101606 address = observedPair address :=
  cachedPair_eq cache 101236 101606 checked address

end SourceCache749Pilot
open LookupCachePilot
namespace SourceCache750Pilot
theorem checked_101606_220 : validate cache_101606_220 101606 =
    some 101826 := by
  decide +kernel
theorem checked_101826_220 : validate cache_101826_220 101826 =
    some 102046 := by
  decide +kernel
theorem checked_101606_440 : validate cache_101606_440 101606 =
    some 102046 := by
  exact validate_branch 220 cache_101606_220 cache_101826_220
    101606 101826 102046
    checked_101606_220 rfl checked_101826_220

theorem checked : validate cache 101606 = some 102046 := checked_101606_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 101606 102046 checked
  omega

theorem within_body : 102046 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 101606 102046 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 101606 102046 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 101606 102046 address = observedPair address :=
  cachedPair_eq cache 101606 102046 checked address

end SourceCache750Pilot
open LookupCachePilot
namespace SourceCache751Pilot
theorem checked_102046_70 : validate cache_102046_70 102046 =
    some 102116 := by
  decide +kernel

theorem checked : validate cache 102046 = some 102116 := checked_102046_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 102046 102116 checked
  omega

theorem within_body : 102116 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102046 102116 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102046 102116 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102046 102116 address = observedPair address :=
  cachedPair_eq cache 102046 102116 checked address

end SourceCache751Pilot
open LookupCachePilot
namespace SourceCache752Pilot
theorem checked_102116_195 : validate cache_102116_195 102116 =
    some 102311 := by
  decide +kernel

theorem checked : validate cache 102116 = some 102311 := checked_102116_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 102116 102311 checked
  omega

theorem within_body : 102311 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102116 102311 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102116 102311 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102116 102311 address = observedPair address :=
  cachedPair_eq cache 102116 102311 checked address

end SourceCache752Pilot
open LookupCachePilot
namespace SourceCache753Pilot
theorem checked_102311_70 : validate cache_102311_70 102311 =
    some 102381 := by
  decide +kernel

theorem checked : validate cache 102311 = some 102381 := checked_102311_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 102311 102381 checked
  omega

theorem within_body : 102381 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102311 102381 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102311 102381 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102311 102381 address = observedPair address :=
  cachedPair_eq cache 102311 102381 checked address

end SourceCache753Pilot
open LookupCachePilot
namespace SourceCache754Pilot
theorem checked_102381_200 : validate cache_102381_200 102381 =
    some 102581 := by
  decide +kernel
theorem checked_102581_200 : validate cache_102581_200 102581 =
    some 102781 := by
  decide +kernel
theorem checked_102381_400 : validate cache_102381_400 102381 =
    some 102781 := by
  exact validate_branch 200 cache_102381_200 cache_102581_200
    102381 102581 102781
    checked_102381_200 rfl checked_102581_200

theorem checked : validate cache 102381 = some 102781 := checked_102381_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 102381 102781 checked
  omega

theorem within_body : 102781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102381 102781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102381 102781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102381 102781 address = observedPair address :=
  cachedPair_eq cache 102381 102781 checked address

end SourceCache754Pilot
open LookupCachePilot
namespace SourceCache755Pilot
theorem checked_102781_5 : validate cache_102781_5 102781 =
    some 102786 := by
  decide +kernel

theorem checked : validate cache 102781 = some 102786 := checked_102781_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 102781 102786 checked
  omega

theorem within_body : 102786 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102781 102786 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102781 102786 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102781 102786 address = observedPair address :=
  cachedPair_eq cache 102781 102786 checked address

end SourceCache755Pilot
open LookupCachePilot
namespace SourceCache756Pilot
theorem checked_102786_70 : validate cache_102786_70 102786 =
    some 102856 := by
  decide +kernel

theorem checked : validate cache 102786 = some 102856 := checked_102786_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 102786 102856 checked
  omega

theorem within_body : 102856 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102786 102856 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102786 102856 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102786 102856 address = observedPair address :=
  cachedPair_eq cache 102786 102856 checked address

end SourceCache756Pilot
open LookupCachePilot
namespace SourceCache757Pilot
theorem checked_102856_185 : validate cache_102856_185 102856 =
    some 103041 := by
  decide +kernel
theorem checked_103041_185 : validate cache_103041_185 103041 =
    some 103226 := by
  decide +kernel
theorem checked_102856_370 : validate cache_102856_370 102856 =
    some 103226 := by
  exact validate_branch 185 cache_102856_185 cache_103041_185
    102856 103041 103226
    checked_102856_185 rfl checked_103041_185

theorem checked : validate cache 102856 = some 103226 := checked_102856_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 102856 103226 checked
  omega

theorem within_body : 103226 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 102856 103226 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 102856 103226 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 102856 103226 address = observedPair address :=
  cachedPair_eq cache 102856 103226 checked address

end SourceCache757Pilot
open LookupCachePilot
namespace SourceCache758Pilot
theorem checked_103226_5 : validate cache_103226_5 103226 =
    some 103231 := by
  decide +kernel

theorem checked : validate cache 103226 = some 103231 := checked_103226_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 103226 103231 checked
  omega

theorem within_body : 103231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103226 103231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103226 103231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103226 103231 address = observedPair address :=
  cachedPair_eq cache 103226 103231 checked address

end SourceCache758Pilot
open LookupCachePilot
namespace SourceCache759Pilot
theorem checked_103231_70 : validate cache_103231_70 103231 =
    some 103301 := by
  decide +kernel

theorem checked : validate cache 103231 = some 103301 := checked_103231_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 103231 103301 checked
  omega

theorem within_body : 103301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103231 103301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103231 103301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103231 103301 address = observedPair address :=
  cachedPair_eq cache 103231 103301 checked address

end SourceCache759Pilot
open LookupCachePilot
namespace SourceCache760Pilot
theorem checked_103301_200 : validate cache_103301_200 103301 =
    some 103501 := by
  decide +kernel
theorem checked_103501_200 : validate cache_103501_200 103501 =
    some 103701 := by
  decide +kernel
theorem checked_103301_400 : validate cache_103301_400 103301 =
    some 103701 := by
  exact validate_branch 200 cache_103301_200 cache_103501_200
    103301 103501 103701
    checked_103301_200 rfl checked_103501_200

theorem checked : validate cache 103301 = some 103701 := checked_103301_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 103301 103701 checked
  omega

theorem within_body : 103701 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103301 103701 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103301 103701 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103301 103701 address = observedPair address :=
  cachedPair_eq cache 103301 103701 checked address

end SourceCache760Pilot
open LookupCachePilot
namespace SourceCache761Pilot
theorem checked_103701_5 : validate cache_103701_5 103701 =
    some 103706 := by
  decide +kernel

theorem checked : validate cache 103701 = some 103706 := checked_103701_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 103701 103706 checked
  omega

theorem within_body : 103706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103701 103706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103701 103706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103701 103706 address = observedPair address :=
  cachedPair_eq cache 103701 103706 checked address

end SourceCache761Pilot
open LookupCachePilot
namespace SourceCache762Pilot
theorem checked_103706_70 : validate cache_103706_70 103706 =
    some 103776 := by
  decide +kernel

theorem checked : validate cache 103706 = some 103776 := checked_103706_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 103706 103776 checked
  omega

theorem within_body : 103776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103706 103776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103706 103776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103706 103776 address = observedPair address :=
  cachedPair_eq cache 103706 103776 checked address

end SourceCache762Pilot
open LookupCachePilot
namespace SourceCache763Pilot
theorem checked_103776_185 : validate cache_103776_185 103776 =
    some 103961 := by
  decide +kernel
theorem checked_103961_185 : validate cache_103961_185 103961 =
    some 104146 := by
  decide +kernel
theorem checked_103776_370 : validate cache_103776_370 103776 =
    some 104146 := by
  exact validate_branch 185 cache_103776_185 cache_103961_185
    103776 103961 104146
    checked_103776_185 rfl checked_103961_185

theorem checked : validate cache 103776 = some 104146 := checked_103776_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 103776 104146 checked
  omega

theorem within_body : 104146 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 103776 104146 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 103776 104146 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 103776 104146 address = observedPair address :=
  cachedPair_eq cache 103776 104146 checked address

end SourceCache763Pilot
open LookupCachePilot
namespace SourceCache764Pilot
theorem checked_104146_5 : validate cache_104146_5 104146 =
    some 104151 := by
  decide +kernel

theorem checked : validate cache 104146 = some 104151 := checked_104146_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 104146 104151 checked
  omega

theorem within_body : 104151 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104146 104151 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104146 104151 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104146 104151 address = observedPair address :=
  cachedPair_eq cache 104146 104151 checked address

end SourceCache764Pilot
open LookupCachePilot
namespace SourceCache765Pilot
theorem checked_104151_70 : validate cache_104151_70 104151 =
    some 104221 := by
  decide +kernel

theorem checked : validate cache 104151 = some 104221 := checked_104151_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 104151 104221 checked
  omega

theorem within_body : 104221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104151 104221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104151 104221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104151 104221 address = observedPair address :=
  cachedPair_eq cache 104151 104221 checked address

end SourceCache765Pilot
open LookupCachePilot
namespace SourceCache766Pilot
theorem checked_104221_200 : validate cache_104221_200 104221 =
    some 104421 := by
  decide +kernel
theorem checked_104421_200 : validate cache_104421_200 104421 =
    some 104621 := by
  decide +kernel
theorem checked_104221_400 : validate cache_104221_400 104221 =
    some 104621 := by
  exact validate_branch 200 cache_104221_200 cache_104421_200
    104221 104421 104621
    checked_104221_200 rfl checked_104421_200

theorem checked : validate cache 104221 = some 104621 := checked_104221_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 104221 104621 checked
  omega

theorem within_body : 104621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104221 104621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104221 104621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104221 104621 address = observedPair address :=
  cachedPair_eq cache 104221 104621 checked address

end SourceCache766Pilot
open LookupCachePilot
namespace SourceCache767Pilot
theorem checked_104621_5 : validate cache_104621_5 104621 =
    some 104626 := by
  decide +kernel

theorem checked : validate cache 104621 = some 104626 := checked_104621_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 104621 104626 checked
  omega

theorem within_body : 104626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104621 104626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104621 104626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104621 104626 address = observedPair address :=
  cachedPair_eq cache 104621 104626 checked address

end SourceCache767Pilot
open LookupCachePilot
namespace SourceCache768Pilot
theorem checked_104626_70 : validate cache_104626_70 104626 =
    some 104696 := by
  decide +kernel

theorem checked : validate cache 104626 = some 104696 := checked_104626_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 104626 104696 checked
  omega

theorem within_body : 104696 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104626 104696 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104626 104696 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104626 104696 address = observedPair address :=
  cachedPair_eq cache 104626 104696 checked address

end SourceCache768Pilot
open LookupCachePilot
namespace SourceCache769Pilot
theorem checked_104696_152 : validate cache_104696_152 104696 =
    some 104848 := by
  decide +kernel
theorem checked_104848_153 : validate cache_104848_153 104848 =
    some 105001 := by
  decide +kernel
theorem checked_104696_305 : validate cache_104696_305 104696 =
    some 105001 := by
  exact validate_branch 152 cache_104696_152 cache_104848_153
    104696 104848 105001
    checked_104696_152 rfl checked_104848_153

theorem checked : validate cache 104696 = some 105001 := checked_104696_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 104696 105001 checked
  omega

theorem within_body : 105001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 104696 105001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 104696 105001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 104696 105001 address = observedPair address :=
  cachedPair_eq cache 104696 105001 checked address

end SourceCache769Pilot
open LookupCachePilot
namespace SourceCache770Pilot
theorem checked_105001_70 : validate cache_105001_70 105001 =
    some 105071 := by
  decide +kernel

theorem checked : validate cache 105001 = some 105071 := checked_105001_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 105001 105071 checked
  omega

theorem within_body : 105071 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105001 105071 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105001 105071 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105001 105071 address = observedPair address :=
  cachedPair_eq cache 105001 105071 checked address

end SourceCache770Pilot
open LookupCachePilot
namespace SourceCache771Pilot
theorem checked_105071_5 : validate cache_105071_5 105071 =
    some 105076 := by
  decide +kernel

theorem checked : validate cache 105071 = some 105076 := checked_105071_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 105071 105076 checked
  omega

theorem within_body : 105076 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105071 105076 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105071 105076 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105071 105076 address = observedPair address :=
  cachedPair_eq cache 105071 105076 checked address

end SourceCache771Pilot
open LookupCachePilot
namespace SourceCache772Pilot
theorem checked_105076_70 : validate cache_105076_70 105076 =
    some 105146 := by
  decide +kernel

theorem checked : validate cache 105076 = some 105146 := checked_105076_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 105076 105146 checked
  omega

theorem within_body : 105146 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105076 105146 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105076 105146 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105076 105146 address = observedPair address :=
  cachedPair_eq cache 105076 105146 checked address

end SourceCache772Pilot
open LookupCachePilot
namespace SourceCache773Pilot
theorem checked_105146_132 : validate cache_105146_132 105146 =
    some 105278 := by
  decide +kernel
theorem checked_105278_133 : validate cache_105278_133 105278 =
    some 105411 := by
  decide +kernel
theorem checked_105146_265 : validate cache_105146_265 105146 =
    some 105411 := by
  exact validate_branch 132 cache_105146_132 cache_105278_133
    105146 105278 105411
    checked_105146_132 rfl checked_105278_133

theorem checked : validate cache 105146 = some 105411 := checked_105146_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 105146 105411 checked
  omega

theorem within_body : 105411 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105146 105411 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105146 105411 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105146 105411 address = observedPair address :=
  cachedPair_eq cache 105146 105411 checked address

end SourceCache773Pilot
open LookupCachePilot
namespace SourceCache774Pilot
theorem checked_105411_5 : validate cache_105411_5 105411 =
    some 105416 := by
  decide +kernel

theorem checked : validate cache 105411 = some 105416 := checked_105411_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 105411 105416 checked
  omega

theorem within_body : 105416 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105411 105416 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105411 105416 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105411 105416 address = observedPair address :=
  cachedPair_eq cache 105411 105416 checked address

end SourceCache774Pilot
open LookupCachePilot
namespace SourceCache775Pilot
theorem checked_105416_10 : validate cache_105416_10 105416 =
    some 105426 := by
  decide +kernel

theorem checked : validate cache 105416 = some 105426 := checked_105416_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 105416 105426 checked
  omega

theorem within_body : 105426 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105416 105426 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105416 105426 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105416 105426 address = observedPair address :=
  cachedPair_eq cache 105416 105426 checked address

end SourceCache775Pilot
open LookupCachePilot
namespace SourceCache776Pilot
theorem checked_105426_220 : validate cache_105426_220 105426 =
    some 105646 := by
  decide +kernel

theorem checked : validate cache 105426 = some 105646 := checked_105426_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 105426 105646 checked
  omega

theorem within_body : 105646 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105426 105646 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105426 105646 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105426 105646 address = observedPair address :=
  cachedPair_eq cache 105426 105646 checked address

end SourceCache776Pilot
open LookupCachePilot
namespace SourceCache777Pilot
theorem checked_105646_152 : validate cache_105646_152 105646 =
    some 105798 := by
  decide +kernel
theorem checked_105798_153 : validate cache_105798_153 105798 =
    some 105951 := by
  decide +kernel
theorem checked_105646_305 : validate cache_105646_305 105646 =
    some 105951 := by
  exact validate_branch 152 cache_105646_152 cache_105798_153
    105646 105798 105951
    checked_105646_152 rfl checked_105798_153

theorem checked : validate cache 105646 = some 105951 := checked_105646_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 105646 105951 checked
  omega

theorem within_body : 105951 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105646 105951 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105646 105951 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105646 105951 address = observedPair address :=
  cachedPair_eq cache 105646 105951 checked address

end SourceCache777Pilot
open LookupCachePilot
namespace SourceCache778Pilot
theorem checked_105951_70 : validate cache_105951_70 105951 =
    some 106021 := by
  decide +kernel

theorem checked : validate cache 105951 = some 106021 := checked_105951_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 105951 106021 checked
  omega

theorem within_body : 106021 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 105951 106021 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 105951 106021 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 105951 106021 address = observedPair address :=
  cachedPair_eq cache 105951 106021 checked address

end SourceCache778Pilot
open LookupCachePilot
namespace SourceCache779Pilot
theorem checked_106021_195 : validate cache_106021_195 106021 =
    some 106216 := by
  decide +kernel

theorem checked : validate cache 106021 = some 106216 := checked_106021_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 106021 106216 checked
  omega

theorem within_body : 106216 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106021 106216 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106021 106216 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106021 106216 address = observedPair address :=
  cachedPair_eq cache 106021 106216 checked address

end SourceCache779Pilot
open LookupCachePilot
namespace SourceCache780Pilot
theorem checked_106216_70 : validate cache_106216_70 106216 =
    some 106286 := by
  decide +kernel

theorem checked : validate cache 106216 = some 106286 := checked_106216_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 106216 106286 checked
  omega

theorem within_body : 106286 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106216 106286 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106216 106286 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106216 106286 address = observedPair address :=
  cachedPair_eq cache 106216 106286 checked address

end SourceCache780Pilot
open LookupCachePilot
namespace SourceCache781Pilot
theorem checked_106286_132 : validate cache_106286_132 106286 =
    some 106418 := by
  decide +kernel
theorem checked_106418_133 : validate cache_106418_133 106418 =
    some 106551 := by
  decide +kernel
theorem checked_106286_265 : validate cache_106286_265 106286 =
    some 106551 := by
  exact validate_branch 132 cache_106286_132 cache_106418_133
    106286 106418 106551
    checked_106286_132 rfl checked_106418_133

theorem checked : validate cache 106286 = some 106551 := checked_106286_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 106286 106551 checked
  omega

theorem within_body : 106551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106286 106551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106286 106551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106286 106551 address = observedPair address :=
  cachedPair_eq cache 106286 106551 checked address

end SourceCache781Pilot
open LookupCachePilot
namespace SourceCache782Pilot
theorem checked_106551_220 : validate cache_106551_220 106551 =
    some 106771 := by
  decide +kernel

theorem checked : validate cache 106551 = some 106771 := checked_106551_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 106551 106771 checked
  omega

theorem within_body : 106771 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106551 106771 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106551 106771 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106551 106771 address = observedPair address :=
  cachedPair_eq cache 106551 106771 checked address

end SourceCache782Pilot
open LookupCachePilot
namespace SourceCache783Pilot
theorem checked_106771_5 : validate cache_106771_5 106771 =
    some 106776 := by
  decide +kernel

theorem checked : validate cache 106771 = some 106776 := checked_106771_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 106771 106776 checked
  omega

theorem within_body : 106776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106771 106776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106771 106776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106771 106776 address = observedPair address :=
  cachedPair_eq cache 106771 106776 checked address

end SourceCache783Pilot
open LookupCachePilot
namespace SourceCache784Pilot
theorem checked_106776_70 : validate cache_106776_70 106776 =
    some 106846 := by
  decide +kernel

theorem checked : validate cache 106776 = some 106846 := checked_106776_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 106776 106846 checked
  omega

theorem within_body : 106846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106776 106846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106776 106846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106776 106846 address = observedPair address :=
  cachedPair_eq cache 106776 106846 checked address

end SourceCache784Pilot
open LookupCachePilot
namespace SourceCache785Pilot
theorem checked_106846_132 : validate cache_106846_132 106846 =
    some 106978 := by
  decide +kernel
theorem checked_106978_133 : validate cache_106978_133 106978 =
    some 107111 := by
  decide +kernel
theorem checked_106846_265 : validate cache_106846_265 106846 =
    some 107111 := by
  exact validate_branch 132 cache_106846_132 cache_106978_133
    106846 106978 107111
    checked_106846_132 rfl checked_106978_133

theorem checked : validate cache 106846 = some 107111 := checked_106846_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 106846 107111 checked
  omega

theorem within_body : 107111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 106846 107111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 106846 107111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 106846 107111 address = observedPair address :=
  cachedPair_eq cache 106846 107111 checked address

end SourceCache785Pilot
open LookupCachePilot
namespace SourceCache786Pilot
theorem checked_107111_5 : validate cache_107111_5 107111 =
    some 107116 := by
  decide +kernel

theorem checked : validate cache 107111 = some 107116 := checked_107111_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 107111 107116 checked
  omega

theorem within_body : 107116 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 107111 107116 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 107111 107116 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 107111 107116 address = observedPair address :=
  cachedPair_eq cache 107111 107116 checked address

end SourceCache786Pilot
open LookupCachePilot
namespace SourceCache787Pilot
theorem checked_107116_10 : validate cache_107116_10 107116 =
    some 107126 := by
  decide +kernel

theorem checked : validate cache 107116 = some 107126 := checked_107116_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 107116 107126 checked
  omega

theorem within_body : 107126 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 107116 107126 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 107116 107126 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 107116 107126 address = observedPair address :=
  cachedPair_eq cache 107116 107126 checked address

end SourceCache787Pilot
open LookupCachePilot
namespace SourceCache788Pilot
theorem checked_107126_185 : validate cache_107126_185 107126 =
    some 107311 := by
  decide +kernel
theorem checked_107311_185 : validate cache_107311_185 107311 =
    some 107496 := by
  decide +kernel
theorem checked_107126_370 : validate cache_107126_370 107126 =
    some 107496 := by
  exact validate_branch 185 cache_107126_185 cache_107311_185
    107126 107311 107496
    checked_107126_185 rfl checked_107311_185

theorem checked : validate cache 107126 = some 107496 := checked_107126_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 107126 107496 checked
  omega

theorem within_body : 107496 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 107126 107496 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 107126 107496 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 107126 107496 address = observedPair address :=
  cachedPair_eq cache 107126 107496 checked address

end SourceCache788Pilot
open LookupCachePilot
namespace SourceCache789Pilot
theorem checked_107496_220 : validate cache_107496_220 107496 =
    some 107716 := by
  decide +kernel
theorem checked_107716_220 : validate cache_107716_220 107716 =
    some 107936 := by
  decide +kernel
theorem checked_107496_440 : validate cache_107496_440 107496 =
    some 107936 := by
  exact validate_branch 220 cache_107496_220 cache_107716_220
    107496 107716 107936
    checked_107496_220 rfl checked_107716_220

theorem checked : validate cache 107496 = some 107936 := checked_107496_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 107496 107936 checked
  omega

theorem within_body : 107936 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 107496 107936 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 107496 107936 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 107496 107936 address = observedPair address :=
  cachedPair_eq cache 107496 107936 checked address

end SourceCache789Pilot
open LookupCachePilot
namespace SourceCache790Pilot
theorem checked_107936_70 : validate cache_107936_70 107936 =
    some 108006 := by
  decide +kernel

theorem checked : validate cache 107936 = some 108006 := checked_107936_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 107936 108006 checked
  omega

theorem within_body : 108006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 107936 108006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 107936 108006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 107936 108006 address = observedPair address :=
  cachedPair_eq cache 107936 108006 checked address

end SourceCache790Pilot
open LookupCachePilot
namespace SourceCache791Pilot
theorem checked_108006_195 : validate cache_108006_195 108006 =
    some 108201 := by
  decide +kernel

theorem checked : validate cache 108006 = some 108201 := checked_108006_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 108006 108201 checked
  omega

theorem within_body : 108201 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108006 108201 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108006 108201 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108006 108201 address = observedPair address :=
  cachedPair_eq cache 108006 108201 checked address

end SourceCache791Pilot
open LookupCachePilot
namespace SourceCache792Pilot
theorem checked_108201_70 : validate cache_108201_70 108201 =
    some 108271 := by
  decide +kernel

theorem checked : validate cache 108201 = some 108271 := checked_108201_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 108201 108271 checked
  omega

theorem within_body : 108271 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108201 108271 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108201 108271 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108201 108271 address = observedPair address :=
  cachedPair_eq cache 108201 108271 checked address

end SourceCache792Pilot
open LookupCachePilot
namespace SourceCache793Pilot
theorem checked_108271_200 : validate cache_108271_200 108271 =
    some 108471 := by
  decide +kernel
theorem checked_108471_200 : validate cache_108471_200 108471 =
    some 108671 := by
  decide +kernel
theorem checked_108271_400 : validate cache_108271_400 108271 =
    some 108671 := by
  exact validate_branch 200 cache_108271_200 cache_108471_200
    108271 108471 108671
    checked_108271_200 rfl checked_108471_200

theorem checked : validate cache 108271 = some 108671 := checked_108271_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 108271 108671 checked
  omega

theorem within_body : 108671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108271 108671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108271 108671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108271 108671 address = observedPair address :=
  cachedPair_eq cache 108271 108671 checked address

end SourceCache793Pilot
open LookupCachePilot
namespace SourceCache794Pilot
theorem checked_108671_5 : validate cache_108671_5 108671 =
    some 108676 := by
  decide +kernel

theorem checked : validate cache 108671 = some 108676 := checked_108671_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 108671 108676 checked
  omega

theorem within_body : 108676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108671 108676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108671 108676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108671 108676 address = observedPair address :=
  cachedPair_eq cache 108671 108676 checked address

end SourceCache794Pilot
open LookupCachePilot
namespace SourceCache795Pilot
theorem checked_108676_70 : validate cache_108676_70 108676 =
    some 108746 := by
  decide +kernel

theorem checked : validate cache 108676 = some 108746 := checked_108676_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 108676 108746 checked
  omega

theorem within_body : 108746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108676 108746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108676 108746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108676 108746 address = observedPair address :=
  cachedPair_eq cache 108676 108746 checked address

end SourceCache795Pilot
open LookupCachePilot
namespace SourceCache796Pilot
theorem checked_108746_185 : validate cache_108746_185 108746 =
    some 108931 := by
  decide +kernel
theorem checked_108931_185 : validate cache_108931_185 108931 =
    some 109116 := by
  decide +kernel
theorem checked_108746_370 : validate cache_108746_370 108746 =
    some 109116 := by
  exact validate_branch 185 cache_108746_185 cache_108931_185
    108746 108931 109116
    checked_108746_185 rfl checked_108931_185

theorem checked : validate cache 108746 = some 109116 := checked_108746_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 108746 109116 checked
  omega

theorem within_body : 109116 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 108746 109116 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 108746 109116 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 108746 109116 address = observedPair address :=
  cachedPair_eq cache 108746 109116 checked address

end SourceCache796Pilot
open LookupCachePilot
namespace SourceCache797Pilot
theorem checked_109116_5 : validate cache_109116_5 109116 =
    some 109121 := by
  decide +kernel

theorem checked : validate cache 109116 = some 109121 := checked_109116_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 109116 109121 checked
  omega

theorem within_body : 109121 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109116 109121 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109116 109121 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109116 109121 address = observedPair address :=
  cachedPair_eq cache 109116 109121 checked address

end SourceCache797Pilot
open LookupCachePilot
namespace SourceCache798Pilot
theorem checked_109121_70 : validate cache_109121_70 109121 =
    some 109191 := by
  decide +kernel

theorem checked : validate cache 109121 = some 109191 := checked_109121_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 109121 109191 checked
  omega

theorem within_body : 109191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109121 109191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109121 109191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109121 109191 address = observedPair address :=
  cachedPair_eq cache 109121 109191 checked address

end SourceCache798Pilot
open LookupCachePilot
namespace SourceCache799Pilot
theorem checked_109191_200 : validate cache_109191_200 109191 =
    some 109391 := by
  decide +kernel
theorem checked_109391_200 : validate cache_109391_200 109391 =
    some 109591 := by
  decide +kernel
theorem checked_109191_400 : validate cache_109191_400 109191 =
    some 109591 := by
  exact validate_branch 200 cache_109191_200 cache_109391_200
    109191 109391 109591
    checked_109191_200 rfl checked_109391_200

theorem checked : validate cache 109191 = some 109591 := checked_109191_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 109191 109591 checked
  omega

theorem within_body : 109591 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109191 109591 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109191 109591 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109191 109591 address = observedPair address :=
  cachedPair_eq cache 109191 109591 checked address

end SourceCache799Pilot
open LookupCachePilot
namespace SourceCache800Pilot
theorem checked_109591_5 : validate cache_109591_5 109591 =
    some 109596 := by
  decide +kernel

theorem checked : validate cache 109591 = some 109596 := checked_109591_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 109591 109596 checked
  omega

theorem within_body : 109596 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109591 109596 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109591 109596 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109591 109596 address = observedPair address :=
  cachedPair_eq cache 109591 109596 checked address

end SourceCache800Pilot
open LookupCachePilot
namespace SourceCache801Pilot
theorem checked_109596_70 : validate cache_109596_70 109596 =
    some 109666 := by
  decide +kernel

theorem checked : validate cache 109596 = some 109666 := checked_109596_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 109596 109666 checked
  omega

theorem within_body : 109666 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109596 109666 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109596 109666 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109596 109666 address = observedPair address :=
  cachedPair_eq cache 109596 109666 checked address

end SourceCache801Pilot
open LookupCachePilot
namespace SourceCache802Pilot
theorem checked_109666_185 : validate cache_109666_185 109666 =
    some 109851 := by
  decide +kernel
theorem checked_109851_185 : validate cache_109851_185 109851 =
    some 110036 := by
  decide +kernel
theorem checked_109666_370 : validate cache_109666_370 109666 =
    some 110036 := by
  exact validate_branch 185 cache_109666_185 cache_109851_185
    109666 109851 110036
    checked_109666_185 rfl checked_109851_185

theorem checked : validate cache 109666 = some 110036 := checked_109666_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 109666 110036 checked
  omega

theorem within_body : 110036 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 109666 110036 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 109666 110036 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 109666 110036 address = observedPair address :=
  cachedPair_eq cache 109666 110036 checked address

end SourceCache802Pilot
open LookupCachePilot
namespace SourceCache803Pilot
theorem checked_110036_5 : validate cache_110036_5 110036 =
    some 110041 := by
  decide +kernel

theorem checked : validate cache 110036 = some 110041 := checked_110036_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 110036 110041 checked
  omega

theorem within_body : 110041 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110036 110041 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110036 110041 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110036 110041 address = observedPair address :=
  cachedPair_eq cache 110036 110041 checked address

end SourceCache803Pilot
open LookupCachePilot
namespace SourceCache804Pilot
theorem checked_110041_70 : validate cache_110041_70 110041 =
    some 110111 := by
  decide +kernel

theorem checked : validate cache 110041 = some 110111 := checked_110041_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 110041 110111 checked
  omega

theorem within_body : 110111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110041 110111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110041 110111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110041 110111 address = observedPair address :=
  cachedPair_eq cache 110041 110111 checked address

end SourceCache804Pilot
open LookupCachePilot
namespace SourceCache805Pilot
theorem checked_110111_200 : validate cache_110111_200 110111 =
    some 110311 := by
  decide +kernel
theorem checked_110311_200 : validate cache_110311_200 110311 =
    some 110511 := by
  decide +kernel
theorem checked_110111_400 : validate cache_110111_400 110111 =
    some 110511 := by
  exact validate_branch 200 cache_110111_200 cache_110311_200
    110111 110311 110511
    checked_110111_200 rfl checked_110311_200

theorem checked : validate cache 110111 = some 110511 := checked_110111_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 110111 110511 checked
  omega

theorem within_body : 110511 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110111 110511 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110111 110511 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110111 110511 address = observedPair address :=
  cachedPair_eq cache 110111 110511 checked address

end SourceCache805Pilot
open LookupCachePilot
namespace SourceCache806Pilot
theorem checked_110511_5 : validate cache_110511_5 110511 =
    some 110516 := by
  decide +kernel

theorem checked : validate cache 110511 = some 110516 := checked_110511_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 110511 110516 checked
  omega

theorem within_body : 110516 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110511 110516 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110511 110516 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110511 110516 address = observedPair address :=
  cachedPair_eq cache 110511 110516 checked address

end SourceCache806Pilot
open LookupCachePilot
namespace SourceCache807Pilot
theorem checked_110516_70 : validate cache_110516_70 110516 =
    some 110586 := by
  decide +kernel

theorem checked : validate cache 110516 = some 110586 := checked_110516_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 110516 110586 checked
  omega

theorem within_body : 110586 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110516 110586 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110516 110586 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110516 110586 address = observedPair address :=
  cachedPair_eq cache 110516 110586 checked address

end SourceCache807Pilot
open LookupCachePilot
namespace SourceCache808Pilot
theorem checked_110586_152 : validate cache_110586_152 110586 =
    some 110738 := by
  decide +kernel
theorem checked_110738_153 : validate cache_110738_153 110738 =
    some 110891 := by
  decide +kernel
theorem checked_110586_305 : validate cache_110586_305 110586 =
    some 110891 := by
  exact validate_branch 152 cache_110586_152 cache_110738_153
    110586 110738 110891
    checked_110586_152 rfl checked_110738_153

theorem checked : validate cache 110586 = some 110891 := checked_110586_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 110586 110891 checked
  omega

theorem within_body : 110891 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110586 110891 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110586 110891 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110586 110891 address = observedPair address :=
  cachedPair_eq cache 110586 110891 checked address

end SourceCache808Pilot
open LookupCachePilot
namespace SourceCache809Pilot
theorem checked_110891_70 : validate cache_110891_70 110891 =
    some 110961 := by
  decide +kernel

theorem checked : validate cache 110891 = some 110961 := checked_110891_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 110891 110961 checked
  omega

theorem within_body : 110961 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110891 110961 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110891 110961 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110891 110961 address = observedPair address :=
  cachedPair_eq cache 110891 110961 checked address

end SourceCache809Pilot
open LookupCachePilot
namespace SourceCache810Pilot
theorem checked_110961_5 : validate cache_110961_5 110961 =
    some 110966 := by
  decide +kernel

theorem checked : validate cache 110961 = some 110966 := checked_110961_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 110961 110966 checked
  omega

theorem within_body : 110966 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110961 110966 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110961 110966 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110961 110966 address = observedPair address :=
  cachedPair_eq cache 110961 110966 checked address

end SourceCache810Pilot
open LookupCachePilot
namespace SourceCache811Pilot
theorem checked_110966_70 : validate cache_110966_70 110966 =
    some 111036 := by
  decide +kernel

theorem checked : validate cache 110966 = some 111036 := checked_110966_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 110966 111036 checked
  omega

theorem within_body : 111036 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 110966 111036 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 110966 111036 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 110966 111036 address = observedPair address :=
  cachedPair_eq cache 110966 111036 checked address

end SourceCache811Pilot
open LookupCachePilot
namespace SourceCache812Pilot
theorem checked_111036_132 : validate cache_111036_132 111036 =
    some 111168 := by
  decide +kernel
theorem checked_111168_133 : validate cache_111168_133 111168 =
    some 111301 := by
  decide +kernel
theorem checked_111036_265 : validate cache_111036_265 111036 =
    some 111301 := by
  exact validate_branch 132 cache_111036_132 cache_111168_133
    111036 111168 111301
    checked_111036_132 rfl checked_111168_133

theorem checked : validate cache 111036 = some 111301 := checked_111036_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 111036 111301 checked
  omega

theorem within_body : 111301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111036 111301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111036 111301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111036 111301 address = observedPair address :=
  cachedPair_eq cache 111036 111301 checked address

end SourceCache812Pilot
open LookupCachePilot
namespace SourceCache813Pilot
theorem checked_111301_5 : validate cache_111301_5 111301 =
    some 111306 := by
  decide +kernel

theorem checked : validate cache 111301 = some 111306 := checked_111301_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 111301 111306 checked
  omega

theorem within_body : 111306 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111301 111306 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111301 111306 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111301 111306 address = observedPair address :=
  cachedPair_eq cache 111301 111306 checked address

end SourceCache813Pilot
open LookupCachePilot
namespace SourceCache814Pilot
theorem checked_111306_10 : validate cache_111306_10 111306 =
    some 111316 := by
  decide +kernel

theorem checked : validate cache 111306 = some 111316 := checked_111306_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 111306 111316 checked
  omega

theorem within_body : 111316 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111306 111316 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111306 111316 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111306 111316 address = observedPair address :=
  cachedPair_eq cache 111306 111316 checked address

end SourceCache814Pilot
open LookupCachePilot
namespace SourceCache815Pilot
theorem checked_111316_220 : validate cache_111316_220 111316 =
    some 111536 := by
  decide +kernel

theorem checked : validate cache 111316 = some 111536 := checked_111316_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 111316 111536 checked
  omega

theorem within_body : 111536 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111316 111536 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111316 111536 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111316 111536 address = observedPair address :=
  cachedPair_eq cache 111316 111536 checked address

end SourceCache815Pilot
open LookupCachePilot
namespace SourceCache816Pilot
theorem checked_111536_152 : validate cache_111536_152 111536 =
    some 111688 := by
  decide +kernel
theorem checked_111688_153 : validate cache_111688_153 111688 =
    some 111841 := by
  decide +kernel
theorem checked_111536_305 : validate cache_111536_305 111536 =
    some 111841 := by
  exact validate_branch 152 cache_111536_152 cache_111688_153
    111536 111688 111841
    checked_111536_152 rfl checked_111688_153

theorem checked : validate cache 111536 = some 111841 := checked_111536_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 111536 111841 checked
  omega

theorem within_body : 111841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111536 111841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111536 111841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111536 111841 address = observedPair address :=
  cachedPair_eq cache 111536 111841 checked address

end SourceCache816Pilot
open LookupCachePilot
namespace SourceCache817Pilot
theorem checked_111841_70 : validate cache_111841_70 111841 =
    some 111911 := by
  decide +kernel

theorem checked : validate cache 111841 = some 111911 := checked_111841_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 111841 111911 checked
  omega

theorem within_body : 111911 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111841 111911 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111841 111911 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111841 111911 address = observedPair address :=
  cachedPair_eq cache 111841 111911 checked address

end SourceCache817Pilot
open LookupCachePilot
namespace SourceCache818Pilot
theorem checked_111911_195 : validate cache_111911_195 111911 =
    some 112106 := by
  decide +kernel

theorem checked : validate cache 111911 = some 112106 := checked_111911_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 111911 112106 checked
  omega

theorem within_body : 112106 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111911 112106 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111911 112106 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111911 112106 address = observedPair address :=
  cachedPair_eq cache 111911 112106 checked address

end SourceCache818Pilot
open LookupCachePilot
namespace SourceCache819Pilot
theorem checked_112106_70 : validate cache_112106_70 112106 =
    some 112176 := by
  decide +kernel

theorem checked : validate cache 112106 = some 112176 := checked_112106_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 112106 112176 checked
  omega

theorem within_body : 112176 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112106 112176 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112106 112176 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112106 112176 address = observedPair address :=
  cachedPair_eq cache 112106 112176 checked address

end SourceCache819Pilot
open LookupCachePilot
namespace SourceCache820Pilot
theorem checked_112176_132 : validate cache_112176_132 112176 =
    some 112308 := by
  decide +kernel
theorem checked_112308_133 : validate cache_112308_133 112308 =
    some 112441 := by
  decide +kernel
theorem checked_112176_265 : validate cache_112176_265 112176 =
    some 112441 := by
  exact validate_branch 132 cache_112176_132 cache_112308_133
    112176 112308 112441
    checked_112176_132 rfl checked_112308_133

theorem checked : validate cache 112176 = some 112441 := checked_112176_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 112176 112441 checked
  omega

theorem within_body : 112441 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112176 112441 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112176 112441 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112176 112441 address = observedPair address :=
  cachedPair_eq cache 112176 112441 checked address

end SourceCache820Pilot
open LookupCachePilot
namespace SourceCache821Pilot
theorem checked_112441_220 : validate cache_112441_220 112441 =
    some 112661 := by
  decide +kernel

theorem checked : validate cache 112441 = some 112661 := checked_112441_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 112441 112661 checked
  omega

theorem within_body : 112661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112441 112661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112441 112661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112441 112661 address = observedPair address :=
  cachedPair_eq cache 112441 112661 checked address

end SourceCache821Pilot
open LookupCachePilot
namespace SourceCache822Pilot
theorem checked_112661_5 : validate cache_112661_5 112661 =
    some 112666 := by
  decide +kernel

theorem checked : validate cache 112661 = some 112666 := checked_112661_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 112661 112666 checked
  omega

theorem within_body : 112666 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112661 112666 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112661 112666 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112661 112666 address = observedPair address :=
  cachedPair_eq cache 112661 112666 checked address

end SourceCache822Pilot
open LookupCachePilot
namespace SourceCache823Pilot
theorem checked_112666_70 : validate cache_112666_70 112666 =
    some 112736 := by
  decide +kernel

theorem checked : validate cache 112666 = some 112736 := checked_112666_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 112666 112736 checked
  omega

theorem within_body : 112736 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112666 112736 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112666 112736 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112666 112736 address = observedPair address :=
  cachedPair_eq cache 112666 112736 checked address

end SourceCache823Pilot
open LookupCachePilot
namespace SourceCache824Pilot
theorem checked_112736_132 : validate cache_112736_132 112736 =
    some 112868 := by
  decide +kernel
theorem checked_112868_133 : validate cache_112868_133 112868 =
    some 113001 := by
  decide +kernel
theorem checked_112736_265 : validate cache_112736_265 112736 =
    some 113001 := by
  exact validate_branch 132 cache_112736_132 cache_112868_133
    112736 112868 113001
    checked_112736_132 rfl checked_112868_133

theorem checked : validate cache 112736 = some 113001 := checked_112736_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 112736 113001 checked
  omega

theorem within_body : 113001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 112736 113001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 112736 113001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 112736 113001 address = observedPair address :=
  cachedPair_eq cache 112736 113001 checked address

end SourceCache824Pilot
open LookupCachePilot
namespace SourceCache825Pilot
theorem checked_113001_5 : validate cache_113001_5 113001 =
    some 113006 := by
  decide +kernel

theorem checked : validate cache 113001 = some 113006 := checked_113001_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 113001 113006 checked
  omega

theorem within_body : 113006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113001 113006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113001 113006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113001 113006 address = observedPair address :=
  cachedPair_eq cache 113001 113006 checked address

end SourceCache825Pilot
open LookupCachePilot
namespace SourceCache826Pilot
theorem checked_113006_10 : validate cache_113006_10 113006 =
    some 113016 := by
  decide +kernel

theorem checked : validate cache 113006 = some 113016 := checked_113006_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 113006 113016 checked
  omega

theorem within_body : 113016 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113006 113016 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113006 113016 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113006 113016 address = observedPair address :=
  cachedPair_eq cache 113006 113016 checked address

end SourceCache826Pilot
open LookupCachePilot
namespace SourceCache827Pilot
theorem checked_113016_185 : validate cache_113016_185 113016 =
    some 113201 := by
  decide +kernel
theorem checked_113201_185 : validate cache_113201_185 113201 =
    some 113386 := by
  decide +kernel
theorem checked_113016_370 : validate cache_113016_370 113016 =
    some 113386 := by
  exact validate_branch 185 cache_113016_185 cache_113201_185
    113016 113201 113386
    checked_113016_185 rfl checked_113201_185

theorem checked : validate cache 113016 = some 113386 := checked_113016_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 113016 113386 checked
  omega

theorem within_body : 113386 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113016 113386 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113016 113386 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113016 113386 address = observedPair address :=
  cachedPair_eq cache 113016 113386 checked address

end SourceCache827Pilot
open LookupCachePilot
namespace SourceCache828Pilot
theorem checked_113386_220 : validate cache_113386_220 113386 =
    some 113606 := by
  decide +kernel
theorem checked_113606_220 : validate cache_113606_220 113606 =
    some 113826 := by
  decide +kernel
theorem checked_113386_440 : validate cache_113386_440 113386 =
    some 113826 := by
  exact validate_branch 220 cache_113386_220 cache_113606_220
    113386 113606 113826
    checked_113386_220 rfl checked_113606_220

theorem checked : validate cache 113386 = some 113826 := checked_113386_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 113386 113826 checked
  omega

theorem within_body : 113826 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113386 113826 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113386 113826 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113386 113826 address = observedPair address :=
  cachedPair_eq cache 113386 113826 checked address

end SourceCache828Pilot
open LookupCachePilot
namespace SourceCache829Pilot
theorem checked_113826_70 : validate cache_113826_70 113826 =
    some 113896 := by
  decide +kernel

theorem checked : validate cache 113826 = some 113896 := checked_113826_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 113826 113896 checked
  omega

theorem within_body : 113896 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113826 113896 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113826 113896 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113826 113896 address = observedPair address :=
  cachedPair_eq cache 113826 113896 checked address

end SourceCache829Pilot
open LookupCachePilot
namespace SourceCache830Pilot
theorem checked_113896_195 : validate cache_113896_195 113896 =
    some 114091 := by
  decide +kernel

theorem checked : validate cache 113896 = some 114091 := checked_113896_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 113896 114091 checked
  omega

theorem within_body : 114091 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 113896 114091 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 113896 114091 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 113896 114091 address = observedPair address :=
  cachedPair_eq cache 113896 114091 checked address

end SourceCache830Pilot
open LookupCachePilot
namespace SourceCache831Pilot
theorem checked_114091_70 : validate cache_114091_70 114091 =
    some 114161 := by
  decide +kernel

theorem checked : validate cache 114091 = some 114161 := checked_114091_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 114091 114161 checked
  omega

theorem within_body : 114161 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 114091 114161 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 114091 114161 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 114091 114161 address = observedPair address :=
  cachedPair_eq cache 114091 114161 checked address

end SourceCache831Pilot
namespace ScopeViews008Pilot
noncomputable def fromRaw_737 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache737Pilot.cache 98056 98321)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache737Pilot.cache
    98056 98321 SourceCache737Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_738 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache738Pilot.cache 98321 98326)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache738Pilot.cache
    98321 98326 SourceCache738Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_739 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache739Pilot.cache 98326 98396)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache739Pilot.cache
    98326 98396 SourceCache739Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_740 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache740Pilot.cache 98396 99066)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache740Pilot.cache
    98396 99066 SourceCache740Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_741 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache741Pilot.cache 99066 99136)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache741Pilot.cache
    99066 99136 SourceCache741Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_742 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache742Pilot.cache 99136 99806)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache742Pilot.cache
    99136 99806 SourceCache742Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_743 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache743Pilot.cache 99806 100476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache743Pilot.cache
    99806 100476 SourceCache743Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_744 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache744Pilot.cache 100476 100481)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache744Pilot.cache
    100476 100481 SourceCache744Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_745 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache745Pilot.cache 100481 100551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache745Pilot.cache
    100481 100551 SourceCache745Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_746 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache746Pilot.cache 100551 101221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache746Pilot.cache
    100551 101221 SourceCache746Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_747 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache747Pilot.cache 101221 101226)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache747Pilot.cache
    101221 101226 SourceCache747Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_748 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache748Pilot.cache 101226 101236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache748Pilot.cache
    101226 101236 SourceCache748Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_749 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache749Pilot.cache 101236 101606)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache749Pilot.cache
    101236 101606 SourceCache749Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_750 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache750Pilot.cache 101606 102046)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache750Pilot.cache
    101606 102046 SourceCache750Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_751 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache751Pilot.cache 102046 102116)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache751Pilot.cache
    102046 102116 SourceCache751Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_752 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache752Pilot.cache 102116 102311)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache752Pilot.cache
    102116 102311 SourceCache752Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_753 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache753Pilot.cache 102311 102381)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache753Pilot.cache
    102311 102381 SourceCache753Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_754 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache754Pilot.cache 102381 102781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache754Pilot.cache
    102381 102781 SourceCache754Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_755 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache755Pilot.cache 102781 102786)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache755Pilot.cache
    102781 102786 SourceCache755Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_756 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache756Pilot.cache 102786 102856)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache756Pilot.cache
    102786 102856 SourceCache756Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_757 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache757Pilot.cache 102856 103226)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache757Pilot.cache
    102856 103226 SourceCache757Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_758 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache758Pilot.cache 103226 103231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache758Pilot.cache
    103226 103231 SourceCache758Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_759 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache759Pilot.cache 103231 103301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache759Pilot.cache
    103231 103301 SourceCache759Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_760 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache760Pilot.cache 103301 103701)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache760Pilot.cache
    103301 103701 SourceCache760Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_761 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache761Pilot.cache 103701 103706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache761Pilot.cache
    103701 103706 SourceCache761Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_762 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache762Pilot.cache 103706 103776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache762Pilot.cache
    103706 103776 SourceCache762Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_763 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache763Pilot.cache 103776 104146)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache763Pilot.cache
    103776 104146 SourceCache763Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_764 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache764Pilot.cache 104146 104151)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache764Pilot.cache
    104146 104151 SourceCache764Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_765 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache765Pilot.cache 104151 104221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache765Pilot.cache
    104151 104221 SourceCache765Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_766 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache766Pilot.cache 104221 104621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache766Pilot.cache
    104221 104621 SourceCache766Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_767 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache767Pilot.cache 104621 104626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache767Pilot.cache
    104621 104626 SourceCache767Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_768 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache768Pilot.cache 104626 104696)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache768Pilot.cache
    104626 104696 SourceCache768Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_769 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache769Pilot.cache 104696 105001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache769Pilot.cache
    104696 105001 SourceCache769Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_770 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache770Pilot.cache 105001 105071)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache770Pilot.cache
    105001 105071 SourceCache770Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_771 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache771Pilot.cache 105071 105076)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache771Pilot.cache
    105071 105076 SourceCache771Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_772 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache772Pilot.cache 105076 105146)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache772Pilot.cache
    105076 105146 SourceCache772Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_773 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache773Pilot.cache 105146 105411)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache773Pilot.cache
    105146 105411 SourceCache773Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_774 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache774Pilot.cache 105411 105416)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache774Pilot.cache
    105411 105416 SourceCache774Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_775 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache775Pilot.cache 105416 105426)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache775Pilot.cache
    105416 105426 SourceCache775Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_776 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache776Pilot.cache 105426 105646)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache776Pilot.cache
    105426 105646 SourceCache776Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_777 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache777Pilot.cache 105646 105951)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache777Pilot.cache
    105646 105951 SourceCache777Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_778 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache778Pilot.cache 105951 106021)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache778Pilot.cache
    105951 106021 SourceCache778Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_779 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache779Pilot.cache 106021 106216)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache779Pilot.cache
    106021 106216 SourceCache779Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_780 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache780Pilot.cache 106216 106286)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache780Pilot.cache
    106216 106286 SourceCache780Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_781 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache781Pilot.cache 106286 106551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache781Pilot.cache
    106286 106551 SourceCache781Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_782 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache782Pilot.cache 106551 106771)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache782Pilot.cache
    106551 106771 SourceCache782Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_783 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache783Pilot.cache 106771 106776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache783Pilot.cache
    106771 106776 SourceCache783Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_784 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache784Pilot.cache 106776 106846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache784Pilot.cache
    106776 106846 SourceCache784Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_785 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache785Pilot.cache 106846 107111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache785Pilot.cache
    106846 107111 SourceCache785Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_786 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache786Pilot.cache 107111 107116)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache786Pilot.cache
    107111 107116 SourceCache786Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_787 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache787Pilot.cache 107116 107126)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache787Pilot.cache
    107116 107126 SourceCache787Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_788 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache788Pilot.cache 107126 107496)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache788Pilot.cache
    107126 107496 SourceCache788Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_789 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache789Pilot.cache 107496 107936)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache789Pilot.cache
    107496 107936 SourceCache789Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_790 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache790Pilot.cache 107936 108006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache790Pilot.cache
    107936 108006 SourceCache790Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_791 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache791Pilot.cache 108006 108201)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache791Pilot.cache
    108006 108201 SourceCache791Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_792 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache792Pilot.cache 108201 108271)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache792Pilot.cache
    108201 108271 SourceCache792Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_793 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache793Pilot.cache 108271 108671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache793Pilot.cache
    108271 108671 SourceCache793Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_794 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache794Pilot.cache 108671 108676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache794Pilot.cache
    108671 108676 SourceCache794Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_795 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache795Pilot.cache 108676 108746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache795Pilot.cache
    108676 108746 SourceCache795Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_796 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache796Pilot.cache 108746 109116)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache796Pilot.cache
    108746 109116 SourceCache796Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_797 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache797Pilot.cache 109116 109121)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache797Pilot.cache
    109116 109121 SourceCache797Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_798 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache798Pilot.cache 109121 109191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache798Pilot.cache
    109121 109191 SourceCache798Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_799 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache799Pilot.cache 109191 109591)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache799Pilot.cache
    109191 109591 SourceCache799Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_800 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache800Pilot.cache 109591 109596)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache800Pilot.cache
    109591 109596 SourceCache800Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_801 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache801Pilot.cache 109596 109666)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache801Pilot.cache
    109596 109666 SourceCache801Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_802 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache802Pilot.cache 109666 110036)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache802Pilot.cache
    109666 110036 SourceCache802Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_803 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache803Pilot.cache 110036 110041)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache803Pilot.cache
    110036 110041 SourceCache803Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_804 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache804Pilot.cache 110041 110111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache804Pilot.cache
    110041 110111 SourceCache804Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_805 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache805Pilot.cache 110111 110511)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache805Pilot.cache
    110111 110511 SourceCache805Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_806 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache806Pilot.cache 110511 110516)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache806Pilot.cache
    110511 110516 SourceCache806Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_807 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache807Pilot.cache 110516 110586)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache807Pilot.cache
    110516 110586 SourceCache807Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_808 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache808Pilot.cache 110586 110891)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache808Pilot.cache
    110586 110891 SourceCache808Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_809 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache809Pilot.cache 110891 110961)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache809Pilot.cache
    110891 110961 SourceCache809Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_810 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache810Pilot.cache 110961 110966)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache810Pilot.cache
    110961 110966 SourceCache810Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_811 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache811Pilot.cache 110966 111036)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache811Pilot.cache
    110966 111036 SourceCache811Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_812 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache812Pilot.cache 111036 111301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache812Pilot.cache
    111036 111301 SourceCache812Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_813 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache813Pilot.cache 111301 111306)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache813Pilot.cache
    111301 111306 SourceCache813Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_814 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache814Pilot.cache 111306 111316)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache814Pilot.cache
    111306 111316 SourceCache814Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_815 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache815Pilot.cache 111316 111536)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache815Pilot.cache
    111316 111536 SourceCache815Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_816 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache816Pilot.cache 111536 111841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache816Pilot.cache
    111536 111841 SourceCache816Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_817 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache817Pilot.cache 111841 111911)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache817Pilot.cache
    111841 111911 SourceCache817Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_818 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache818Pilot.cache 111911 112106)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache818Pilot.cache
    111911 112106 SourceCache818Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_819 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache819Pilot.cache 112106 112176)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache819Pilot.cache
    112106 112176 SourceCache819Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_820 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache820Pilot.cache 112176 112441)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache820Pilot.cache
    112176 112441 SourceCache820Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_821 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache821Pilot.cache 112441 112661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache821Pilot.cache
    112441 112661 SourceCache821Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_822 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache822Pilot.cache 112661 112666)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache822Pilot.cache
    112661 112666 SourceCache822Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_823 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache823Pilot.cache 112666 112736)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache823Pilot.cache
    112666 112736 SourceCache823Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_824 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache824Pilot.cache 112736 113001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache824Pilot.cache
    112736 113001 SourceCache824Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_825 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache825Pilot.cache 113001 113006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache825Pilot.cache
    113001 113006 SourceCache825Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_826 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache826Pilot.cache 113006 113016)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache826Pilot.cache
    113006 113016 SourceCache826Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_827 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache827Pilot.cache 113016 113386)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache827Pilot.cache
    113016 113386 SourceCache827Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_828 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache828Pilot.cache 113386 113826)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache828Pilot.cache
    113386 113826 SourceCache828Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_829 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache829Pilot.cache 113826 113896)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache829Pilot.cache
    113826 113896 SourceCache829Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_830 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache830Pilot.cache 113896 114091)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache830Pilot.cache
    113896 114091 SourceCache830Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_831 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache831Pilot.cache 114091 114161)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache831Pilot.cache
    114091 114161 SourceCache831Pilot.checked q raw nodes returns truth
end ScopeViews008Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
