module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews000Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache0Pilot
theorem checked_0_6 : validate cache_0_6 0 =
    some 6 := by
  decide +kernel

theorem checked : validate cache 0 = some 6 := checked_0_6

theorem count_exact : cache.count = 6 := by
  have extent := validate_extent cache 0 6 checked
  omega

theorem within_body : 6 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 0 6 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 0 6 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 0 6 address = observedPair address :=
  cachedPair_eq cache 0 6 checked address

end SourceCache0Pilot
open LookupCachePilot
namespace SourceCache1Pilot
theorem checked_6_5 : validate cache_6_5 6 =
    some 11 := by
  decide +kernel

theorem checked : validate cache 6 = some 11 := checked_6_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 6 11 checked
  omega

theorem within_body : 11 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 6 11 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 6 11 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 6 11 address = observedPair address :=
  cachedPair_eq cache 6 11 checked address

end SourceCache1Pilot
open LookupCachePilot
namespace SourceCache2Pilot
theorem checked_11_5 : validate cache_11_5 11 =
    some 16 := by
  decide +kernel

theorem checked : validate cache 11 = some 16 := checked_11_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 11 16 checked
  omega

theorem within_body : 16 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 11 16 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 11 16 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 11 16 address = observedPair address :=
  cachedPair_eq cache 11 16 checked address

end SourceCache2Pilot
open LookupCachePilot
namespace SourceCache3Pilot
theorem checked_16_5 : validate cache_16_5 16 =
    some 21 := by
  decide +kernel

theorem checked : validate cache 16 = some 21 := checked_16_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 16 21 checked
  omega

theorem within_body : 21 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 16 21 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 16 21 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 16 21 address = observedPair address :=
  cachedPair_eq cache 16 21 checked address

end SourceCache3Pilot
open LookupCachePilot
namespace SourceCache4Pilot
theorem checked_21_15 : validate cache_21_15 21 =
    some 36 := by
  decide +kernel

theorem checked : validate cache 21 = some 36 := checked_21_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 21 36 checked
  omega

theorem within_body : 36 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 21 36 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 21 36 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 21 36 address = observedPair address :=
  cachedPair_eq cache 21 36 checked address

end SourceCache4Pilot
open LookupCachePilot
namespace SourceCache5Pilot
theorem checked_36_5 : validate cache_36_5 36 =
    some 41 := by
  decide +kernel

theorem checked : validate cache 36 = some 41 := checked_36_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 36 41 checked
  omega

theorem within_body : 41 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 36 41 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 36 41 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 36 41 address = observedPair address :=
  cachedPair_eq cache 36 41 checked address

end SourceCache5Pilot
open LookupCachePilot
namespace SourceCache6Pilot
theorem checked_41_5 : validate cache_41_5 41 =
    some 46 := by
  decide +kernel

theorem checked : validate cache 41 = some 46 := checked_41_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 41 46 checked
  omega

theorem within_body : 46 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 41 46 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 41 46 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 41 46 address = observedPair address :=
  cachedPair_eq cache 41 46 checked address

end SourceCache6Pilot
open LookupCachePilot
namespace SourceCache7Pilot
theorem checked_46_5 : validate cache_46_5 46 =
    some 51 := by
  decide +kernel

theorem checked : validate cache 46 = some 51 := checked_46_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 46 51 checked
  omega

theorem within_body : 51 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 46 51 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 46 51 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 46 51 address = observedPair address :=
  cachedPair_eq cache 46 51 checked address

end SourceCache7Pilot
open LookupCachePilot
namespace SourceCache8Pilot
theorem checked_51_5 : validate cache_51_5 51 =
    some 56 := by
  decide +kernel

theorem checked : validate cache 51 = some 56 := checked_51_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 51 56 checked
  omega

theorem within_body : 56 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 51 56 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 51 56 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 51 56 address = observedPair address :=
  cachedPair_eq cache 51 56 checked address

end SourceCache8Pilot
open LookupCachePilot
namespace SourceCache9Pilot
theorem checked_56_15 : validate cache_56_15 56 =
    some 71 := by
  decide +kernel

theorem checked : validate cache 56 = some 71 := checked_56_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 56 71 checked
  omega

theorem within_body : 71 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 56 71 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 56 71 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 56 71 address = observedPair address :=
  cachedPair_eq cache 56 71 checked address

end SourceCache9Pilot
open LookupCachePilot
namespace SourceCache10Pilot
theorem checked_71_5 : validate cache_71_5 71 =
    some 76 := by
  decide +kernel

theorem checked : validate cache 71 = some 76 := checked_71_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 71 76 checked
  omega

theorem within_body : 76 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 71 76 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 71 76 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 71 76 address = observedPair address :=
  cachedPair_eq cache 71 76 checked address

end SourceCache10Pilot
open LookupCachePilot
namespace SourceCache11Pilot
theorem checked_76_5 : validate cache_76_5 76 =
    some 81 := by
  decide +kernel

theorem checked : validate cache 76 = some 81 := checked_76_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 76 81 checked
  omega

theorem within_body : 81 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 76 81 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 76 81 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 76 81 address = observedPair address :=
  cachedPair_eq cache 76 81 checked address

end SourceCache11Pilot
open LookupCachePilot
namespace SourceCache12Pilot
theorem checked_81_5 : validate cache_81_5 81 =
    some 86 := by
  decide +kernel

theorem checked : validate cache 81 = some 86 := checked_81_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 81 86 checked
  omega

theorem within_body : 86 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 81 86 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 81 86 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 81 86 address = observedPair address :=
  cachedPair_eq cache 81 86 checked address

end SourceCache12Pilot
open LookupCachePilot
namespace SourceCache13Pilot
theorem checked_86_5 : validate cache_86_5 86 =
    some 91 := by
  decide +kernel

theorem checked : validate cache 86 = some 91 := checked_86_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 86 91 checked
  omega

theorem within_body : 91 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 86 91 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 86 91 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 86 91 address = observedPair address :=
  cachedPair_eq cache 86 91 checked address

end SourceCache13Pilot
open LookupCachePilot
namespace SourceCache14Pilot
theorem checked_91_5 : validate cache_91_5 91 =
    some 96 := by
  decide +kernel

theorem checked : validate cache 91 = some 96 := checked_91_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 91 96 checked
  omega

theorem within_body : 96 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 91 96 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 91 96 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 91 96 address = observedPair address :=
  cachedPair_eq cache 91 96 checked address

end SourceCache14Pilot
open LookupCachePilot
namespace SourceCache15Pilot
theorem checked_96_15 : validate cache_96_15 96 =
    some 111 := by
  decide +kernel

theorem checked : validate cache 96 = some 111 := checked_96_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 96 111 checked
  omega

theorem within_body : 111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 96 111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 96 111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 96 111 address = observedPair address :=
  cachedPair_eq cache 96 111 checked address

end SourceCache15Pilot
open LookupCachePilot
namespace SourceCache16Pilot
theorem checked_111_5 : validate cache_111_5 111 =
    some 116 := by
  decide +kernel

theorem checked : validate cache 111 = some 116 := checked_111_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 111 116 checked
  omega

theorem within_body : 116 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 111 116 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 111 116 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 111 116 address = observedPair address :=
  cachedPair_eq cache 111 116 checked address

end SourceCache16Pilot
open LookupCachePilot
namespace SourceCache17Pilot
theorem checked_116_5 : validate cache_116_5 116 =
    some 121 := by
  decide +kernel

theorem checked : validate cache 116 = some 121 := checked_116_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 116 121 checked
  omega

theorem within_body : 121 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116 121 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116 121 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116 121 address = observedPair address :=
  cachedPair_eq cache 116 121 checked address

end SourceCache17Pilot
open LookupCachePilot
namespace SourceCache18Pilot
theorem checked_121_5 : validate cache_121_5 121 =
    some 126 := by
  decide +kernel

theorem checked : validate cache 121 = some 126 := checked_121_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 121 126 checked
  omega

theorem within_body : 126 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121 126 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121 126 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121 126 address = observedPair address :=
  cachedPair_eq cache 121 126 checked address

end SourceCache18Pilot
open LookupCachePilot
namespace SourceCache19Pilot
theorem checked_126_15 : validate cache_126_15 126 =
    some 141 := by
  decide +kernel

theorem checked : validate cache 126 = some 141 := checked_126_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 126 141 checked
  omega

theorem within_body : 141 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126 141 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126 141 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126 141 address = observedPair address :=
  cachedPair_eq cache 126 141 checked address

end SourceCache19Pilot
open LookupCachePilot
namespace SourceCache20Pilot
theorem checked_141_5 : validate cache_141_5 141 =
    some 146 := by
  decide +kernel

theorem checked : validate cache 141 = some 146 := checked_141_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 141 146 checked
  omega

theorem within_body : 146 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 141 146 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 141 146 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 141 146 address = observedPair address :=
  cachedPair_eq cache 141 146 checked address

end SourceCache20Pilot
open LookupCachePilot
namespace SourceCache21Pilot
theorem checked_146_5 : validate cache_146_5 146 =
    some 151 := by
  decide +kernel

theorem checked : validate cache 146 = some 151 := checked_146_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 146 151 checked
  omega

theorem within_body : 151 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 146 151 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 146 151 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 146 151 address = observedPair address :=
  cachedPair_eq cache 146 151 checked address

end SourceCache21Pilot
open LookupCachePilot
namespace SourceCache22Pilot
theorem checked_151_5 : validate cache_151_5 151 =
    some 156 := by
  decide +kernel

theorem checked : validate cache 151 = some 156 := checked_151_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 151 156 checked
  omega

theorem within_body : 156 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 151 156 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 151 156 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 151 156 address = observedPair address :=
  cachedPair_eq cache 151 156 checked address

end SourceCache22Pilot
open LookupCachePilot
namespace SourceCache23Pilot
theorem checked_156_15 : validate cache_156_15 156 =
    some 171 := by
  decide +kernel

theorem checked : validate cache 156 = some 171 := checked_156_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 156 171 checked
  omega

theorem within_body : 171 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 156 171 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 156 171 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 156 171 address = observedPair address :=
  cachedPair_eq cache 156 171 checked address

end SourceCache23Pilot
open LookupCachePilot
namespace SourceCache24Pilot
theorem checked_171_5 : validate cache_171_5 171 =
    some 176 := by
  decide +kernel

theorem checked : validate cache 171 = some 176 := checked_171_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 171 176 checked
  omega

theorem within_body : 176 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 171 176 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 171 176 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 171 176 address = observedPair address :=
  cachedPair_eq cache 171 176 checked address

end SourceCache24Pilot
open LookupCachePilot
namespace SourceCache25Pilot
theorem checked_176_5 : validate cache_176_5 176 =
    some 181 := by
  decide +kernel

theorem checked : validate cache 176 = some 181 := checked_176_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 176 181 checked
  omega

theorem within_body : 181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 176 181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 176 181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 176 181 address = observedPair address :=
  cachedPair_eq cache 176 181 checked address

end SourceCache25Pilot
open LookupCachePilot
namespace SourceCache26Pilot
theorem checked_181_5 : validate cache_181_5 181 =
    some 186 := by
  decide +kernel

theorem checked : validate cache 181 = some 186 := checked_181_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 181 186 checked
  omega

theorem within_body : 186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 181 186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 181 186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 181 186 address = observedPair address :=
  cachedPair_eq cache 181 186 checked address

end SourceCache26Pilot
open LookupCachePilot
namespace SourceCache27Pilot
theorem checked_186_5 : validate cache_186_5 186 =
    some 191 := by
  decide +kernel

theorem checked : validate cache 186 = some 191 := checked_186_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 186 191 checked
  omega

theorem within_body : 191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 186 191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 186 191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 186 191 address = observedPair address :=
  cachedPair_eq cache 186 191 checked address

end SourceCache27Pilot
open LookupCachePilot
namespace SourceCache28Pilot
theorem checked_191_5 : validate cache_191_5 191 =
    some 196 := by
  decide +kernel

theorem checked : validate cache 191 = some 196 := checked_191_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 191 196 checked
  omega

theorem within_body : 196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 191 196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 191 196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 191 196 address = observedPair address :=
  cachedPair_eq cache 191 196 checked address

end SourceCache28Pilot
open LookupCachePilot
namespace SourceCache29Pilot
theorem checked_196_5 : validate cache_196_5 196 =
    some 201 := by
  decide +kernel

theorem checked : validate cache 196 = some 201 := checked_196_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 196 201 checked
  omega

theorem within_body : 201 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 196 201 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 196 201 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 196 201 address = observedPair address :=
  cachedPair_eq cache 196 201 checked address

end SourceCache29Pilot
open LookupCachePilot
namespace SourceCache30Pilot
theorem checked_201_5 : validate cache_201_5 201 =
    some 206 := by
  decide +kernel

theorem checked : validate cache 201 = some 206 := checked_201_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 201 206 checked
  omega

theorem within_body : 206 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 201 206 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 201 206 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 201 206 address = observedPair address :=
  cachedPair_eq cache 201 206 checked address

end SourceCache30Pilot
open LookupCachePilot
namespace SourceCache31Pilot
theorem checked_206_15 : validate cache_206_15 206 =
    some 221 := by
  decide +kernel

theorem checked : validate cache 206 = some 221 := checked_206_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 206 221 checked
  omega

theorem within_body : 221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 206 221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 206 221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 206 221 address = observedPair address :=
  cachedPair_eq cache 206 221 checked address

end SourceCache31Pilot
open LookupCachePilot
namespace SourceCache32Pilot
theorem checked_221_5 : validate cache_221_5 221 =
    some 226 := by
  decide +kernel

theorem checked : validate cache 221 = some 226 := checked_221_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 221 226 checked
  omega

theorem within_body : 226 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 221 226 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 221 226 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 221 226 address = observedPair address :=
  cachedPair_eq cache 221 226 checked address

end SourceCache32Pilot
open LookupCachePilot
namespace SourceCache33Pilot
theorem checked_226_5 : validate cache_226_5 226 =
    some 231 := by
  decide +kernel

theorem checked : validate cache 226 = some 231 := checked_226_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 226 231 checked
  omega

theorem within_body : 231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 226 231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 226 231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 226 231 address = observedPair address :=
  cachedPair_eq cache 226 231 checked address

end SourceCache33Pilot
open LookupCachePilot
namespace SourceCache34Pilot
theorem checked_231_5 : validate cache_231_5 231 =
    some 236 := by
  decide +kernel

theorem checked : validate cache 231 = some 236 := checked_231_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 231 236 checked
  omega

theorem within_body : 236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 231 236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 231 236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 231 236 address = observedPair address :=
  cachedPair_eq cache 231 236 checked address

end SourceCache34Pilot
open LookupCachePilot
namespace SourceCache35Pilot
theorem checked_236_5 : validate cache_236_5 236 =
    some 241 := by
  decide +kernel

theorem checked : validate cache 236 = some 241 := checked_236_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 236 241 checked
  omega

theorem within_body : 241 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 236 241 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 236 241 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 236 241 address = observedPair address :=
  cachedPair_eq cache 236 241 checked address

end SourceCache35Pilot
open LookupCachePilot
namespace SourceCache36Pilot
theorem checked_241_15 : validate cache_241_15 241 =
    some 256 := by
  decide +kernel

theorem checked : validate cache 241 = some 256 := checked_241_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 241 256 checked
  omega

theorem within_body : 256 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 241 256 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 241 256 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 241 256 address = observedPair address :=
  cachedPair_eq cache 241 256 checked address

end SourceCache36Pilot
open LookupCachePilot
namespace SourceCache37Pilot
theorem checked_256_5 : validate cache_256_5 256 =
    some 261 := by
  decide +kernel

theorem checked : validate cache 256 = some 261 := checked_256_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 256 261 checked
  omega

theorem within_body : 261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 256 261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 256 261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 256 261 address = observedPair address :=
  cachedPair_eq cache 256 261 checked address

end SourceCache37Pilot
open LookupCachePilot
namespace SourceCache38Pilot
theorem checked_261_5 : validate cache_261_5 261 =
    some 266 := by
  decide +kernel

theorem checked : validate cache 261 = some 266 := checked_261_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 261 266 checked
  omega

theorem within_body : 266 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 261 266 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 261 266 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 261 266 address = observedPair address :=
  cachedPair_eq cache 261 266 checked address

end SourceCache38Pilot
open LookupCachePilot
namespace SourceCache39Pilot
theorem checked_266_5 : validate cache_266_5 266 =
    some 271 := by
  decide +kernel

theorem checked : validate cache 266 = some 271 := checked_266_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 266 271 checked
  omega

theorem within_body : 271 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 266 271 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 266 271 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 266 271 address = observedPair address :=
  cachedPair_eq cache 266 271 checked address

end SourceCache39Pilot
open LookupCachePilot
namespace SourceCache40Pilot
theorem checked_271_5 : validate cache_271_5 271 =
    some 276 := by
  decide +kernel

theorem checked : validate cache 271 = some 276 := checked_271_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 271 276 checked
  omega

theorem within_body : 276 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 271 276 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 271 276 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 271 276 address = observedPair address :=
  cachedPair_eq cache 271 276 checked address

end SourceCache40Pilot
open LookupCachePilot
namespace SourceCache41Pilot
theorem checked_276_15 : validate cache_276_15 276 =
    some 291 := by
  decide +kernel

theorem checked : validate cache 276 = some 291 := checked_276_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 276 291 checked
  omega

theorem within_body : 291 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 276 291 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 276 291 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 276 291 address = observedPair address :=
  cachedPair_eq cache 276 291 checked address

end SourceCache41Pilot
open LookupCachePilot
namespace SourceCache42Pilot
theorem checked_291_5 : validate cache_291_5 291 =
    some 296 := by
  decide +kernel

theorem checked : validate cache 291 = some 296 := checked_291_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 291 296 checked
  omega

theorem within_body : 296 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 291 296 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 291 296 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 291 296 address = observedPair address :=
  cachedPair_eq cache 291 296 checked address

end SourceCache42Pilot
open LookupCachePilot
namespace SourceCache43Pilot
theorem checked_296_5 : validate cache_296_5 296 =
    some 301 := by
  decide +kernel

theorem checked : validate cache 296 = some 301 := checked_296_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 296 301 checked
  omega

theorem within_body : 301 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 296 301 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 296 301 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 296 301 address = observedPair address :=
  cachedPair_eq cache 296 301 checked address

end SourceCache43Pilot
open LookupCachePilot
namespace SourceCache44Pilot
theorem checked_301_5 : validate cache_301_5 301 =
    some 306 := by
  decide +kernel

theorem checked : validate cache 301 = some 306 := checked_301_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 301 306 checked
  omega

theorem within_body : 306 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 301 306 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 301 306 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 301 306 address = observedPair address :=
  cachedPair_eq cache 301 306 checked address

end SourceCache44Pilot
open LookupCachePilot
namespace SourceCache45Pilot
theorem checked_306_5 : validate cache_306_5 306 =
    some 311 := by
  decide +kernel

theorem checked : validate cache 306 = some 311 := checked_306_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 306 311 checked
  omega

theorem within_body : 311 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 306 311 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 306 311 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 306 311 address = observedPair address :=
  cachedPair_eq cache 306 311 checked address

end SourceCache45Pilot
open LookupCachePilot
namespace SourceCache46Pilot
theorem checked_311_15 : validate cache_311_15 311 =
    some 326 := by
  decide +kernel

theorem checked : validate cache 311 = some 326 := checked_311_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 311 326 checked
  omega

theorem within_body : 326 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 311 326 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 311 326 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 311 326 address = observedPair address :=
  cachedPair_eq cache 311 326 checked address

end SourceCache46Pilot
open LookupCachePilot
namespace SourceCache47Pilot
theorem checked_326_5 : validate cache_326_5 326 =
    some 331 := by
  decide +kernel

theorem checked : validate cache 326 = some 331 := checked_326_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 326 331 checked
  omega

theorem within_body : 331 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 326 331 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 326 331 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 326 331 address = observedPair address :=
  cachedPair_eq cache 326 331 checked address

end SourceCache47Pilot
open LookupCachePilot
namespace SourceCache48Pilot
theorem checked_331_5 : validate cache_331_5 331 =
    some 336 := by
  decide +kernel

theorem checked : validate cache 331 = some 336 := checked_331_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 331 336 checked
  omega

theorem within_body : 336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 331 336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 331 336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 331 336 address = observedPair address :=
  cachedPair_eq cache 331 336 checked address

end SourceCache48Pilot
open LookupCachePilot
namespace SourceCache49Pilot
theorem checked_336_15 : validate cache_336_15 336 =
    some 351 := by
  decide +kernel

theorem checked : validate cache 336 = some 351 := checked_336_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 336 351 checked
  omega

theorem within_body : 351 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 336 351 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 336 351 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 336 351 address = observedPair address :=
  cachedPair_eq cache 336 351 checked address

end SourceCache49Pilot
open LookupCachePilot
namespace SourceCache50Pilot
theorem checked_351_5 : validate cache_351_5 351 =
    some 356 := by
  decide +kernel

theorem checked : validate cache 351 = some 356 := checked_351_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 351 356 checked
  omega

theorem within_body : 356 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 351 356 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 351 356 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 351 356 address = observedPair address :=
  cachedPair_eq cache 351 356 checked address

end SourceCache50Pilot
open LookupCachePilot
namespace SourceCache51Pilot
theorem checked_356_5 : validate cache_356_5 356 =
    some 361 := by
  decide +kernel

theorem checked : validate cache 356 = some 361 := checked_356_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 356 361 checked
  omega

theorem within_body : 361 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 356 361 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 356 361 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 356 361 address = observedPair address :=
  cachedPair_eq cache 356 361 checked address

end SourceCache51Pilot
open LookupCachePilot
namespace SourceCache52Pilot
theorem checked_361_5 : validate cache_361_5 361 =
    some 366 := by
  decide +kernel

theorem checked : validate cache 361 = some 366 := checked_361_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 361 366 checked
  omega

theorem within_body : 366 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 361 366 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 361 366 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 361 366 address = observedPair address :=
  cachedPair_eq cache 361 366 checked address

end SourceCache52Pilot
open LookupCachePilot
namespace SourceCache53Pilot
theorem checked_366_5 : validate cache_366_5 366 =
    some 371 := by
  decide +kernel

theorem checked : validate cache 366 = some 371 := checked_366_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 366 371 checked
  omega

theorem within_body : 371 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 366 371 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 366 371 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 366 371 address = observedPair address :=
  cachedPair_eq cache 366 371 checked address

end SourceCache53Pilot
open LookupCachePilot
namespace SourceCache54Pilot
theorem checked_371_15 : validate cache_371_15 371 =
    some 386 := by
  decide +kernel

theorem checked : validate cache 371 = some 386 := checked_371_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 371 386 checked
  omega

theorem within_body : 386 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 371 386 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 371 386 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 371 386 address = observedPair address :=
  cachedPair_eq cache 371 386 checked address

end SourceCache54Pilot
open LookupCachePilot
namespace SourceCache55Pilot
theorem checked_386_5 : validate cache_386_5 386 =
    some 391 := by
  decide +kernel

theorem checked : validate cache 386 = some 391 := checked_386_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 386 391 checked
  omega

theorem within_body : 391 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 386 391 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 386 391 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 386 391 address = observedPair address :=
  cachedPair_eq cache 386 391 checked address

end SourceCache55Pilot
open LookupCachePilot
namespace SourceCache56Pilot
theorem checked_391_5 : validate cache_391_5 391 =
    some 396 := by
  decide +kernel

theorem checked : validate cache 391 = some 396 := checked_391_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 391 396 checked
  omega

theorem within_body : 396 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 391 396 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 391 396 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 391 396 address = observedPair address :=
  cachedPair_eq cache 391 396 checked address

end SourceCache56Pilot
open LookupCachePilot
namespace SourceCache57Pilot
theorem checked_396_15 : validate cache_396_15 396 =
    some 411 := by
  decide +kernel

theorem checked : validate cache 396 = some 411 := checked_396_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 396 411 checked
  omega

theorem within_body : 411 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 396 411 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 396 411 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 396 411 address = observedPair address :=
  cachedPair_eq cache 396 411 checked address

end SourceCache57Pilot
open LookupCachePilot
namespace SourceCache58Pilot
theorem checked_411_5 : validate cache_411_5 411 =
    some 416 := by
  decide +kernel

theorem checked : validate cache 411 = some 416 := checked_411_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 411 416 checked
  omega

theorem within_body : 416 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 411 416 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 411 416 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 411 416 address = observedPair address :=
  cachedPair_eq cache 411 416 checked address

end SourceCache58Pilot
open LookupCachePilot
namespace SourceCache59Pilot
theorem checked_416_5 : validate cache_416_5 416 =
    some 421 := by
  decide +kernel

theorem checked : validate cache 416 = some 421 := checked_416_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 416 421 checked
  omega

theorem within_body : 421 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 416 421 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 416 421 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 416 421 address = observedPair address :=
  cachedPair_eq cache 416 421 checked address

end SourceCache59Pilot
open LookupCachePilot
namespace SourceCache60Pilot
theorem checked_421_5 : validate cache_421_5 421 =
    some 426 := by
  decide +kernel

theorem checked : validate cache 421 = some 426 := checked_421_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 421 426 checked
  omega

theorem within_body : 426 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 421 426 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 421 426 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 421 426 address = observedPair address :=
  cachedPair_eq cache 421 426 checked address

end SourceCache60Pilot
open LookupCachePilot
namespace SourceCache61Pilot
theorem checked_426_5 : validate cache_426_5 426 =
    some 431 := by
  decide +kernel

theorem checked : validate cache 426 = some 431 := checked_426_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 426 431 checked
  omega

theorem within_body : 431 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 426 431 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 426 431 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 426 431 address = observedPair address :=
  cachedPair_eq cache 426 431 checked address

end SourceCache61Pilot
open LookupCachePilot
namespace SourceCache62Pilot
theorem checked_431_15 : validate cache_431_15 431 =
    some 446 := by
  decide +kernel

theorem checked : validate cache 431 = some 446 := checked_431_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 431 446 checked
  omega

theorem within_body : 446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 431 446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 431 446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 431 446 address = observedPair address :=
  cachedPair_eq cache 431 446 checked address

end SourceCache62Pilot
open LookupCachePilot
namespace SourceCache63Pilot
theorem checked_446_5 : validate cache_446_5 446 =
    some 451 := by
  decide +kernel

theorem checked : validate cache 446 = some 451 := checked_446_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 446 451 checked
  omega

theorem within_body : 451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 446 451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 446 451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 446 451 address = observedPair address :=
  cachedPair_eq cache 446 451 checked address

end SourceCache63Pilot
open LookupCachePilot
namespace SourceCache64Pilot
theorem checked_451_5 : validate cache_451_5 451 =
    some 456 := by
  decide +kernel

theorem checked : validate cache 451 = some 456 := checked_451_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 451 456 checked
  omega

theorem within_body : 456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 451 456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 451 456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 451 456 address = observedPair address :=
  cachedPair_eq cache 451 456 checked address

end SourceCache64Pilot
open LookupCachePilot
namespace SourceCache65Pilot
theorem checked_456_15 : validate cache_456_15 456 =
    some 471 := by
  decide +kernel

theorem checked : validate cache 456 = some 471 := checked_456_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 456 471 checked
  omega

theorem within_body : 471 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 456 471 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 456 471 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 456 471 address = observedPair address :=
  cachedPair_eq cache 456 471 checked address

end SourceCache65Pilot
open LookupCachePilot
namespace SourceCache66Pilot
theorem checked_471_5 : validate cache_471_5 471 =
    some 476 := by
  decide +kernel

theorem checked : validate cache 471 = some 476 := checked_471_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 471 476 checked
  omega

theorem within_body : 476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 471 476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 471 476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 471 476 address = observedPair address :=
  cachedPair_eq cache 471 476 checked address

end SourceCache66Pilot
open LookupCachePilot
namespace SourceCache67Pilot
theorem checked_476_5 : validate cache_476_5 476 =
    some 481 := by
  decide +kernel

theorem checked : validate cache 476 = some 481 := checked_476_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 476 481 checked
  omega

theorem within_body : 481 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 476 481 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 476 481 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 476 481 address = observedPair address :=
  cachedPair_eq cache 476 481 checked address

end SourceCache67Pilot
open LookupCachePilot
namespace SourceCache68Pilot
theorem checked_481_5 : validate cache_481_5 481 =
    some 486 := by
  decide +kernel

theorem checked : validate cache 481 = some 486 := checked_481_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 481 486 checked
  omega

theorem within_body : 486 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 481 486 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 481 486 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 481 486 address = observedPair address :=
  cachedPair_eq cache 481 486 checked address

end SourceCache68Pilot
open LookupCachePilot
namespace SourceCache69Pilot
theorem checked_486_5 : validate cache_486_5 486 =
    some 491 := by
  decide +kernel

theorem checked : validate cache 486 = some 491 := checked_486_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 486 491 checked
  omega

theorem within_body : 491 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 486 491 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 486 491 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 486 491 address = observedPair address :=
  cachedPair_eq cache 486 491 checked address

end SourceCache69Pilot
open LookupCachePilot
namespace SourceCache70Pilot
theorem checked_491_5 : validate cache_491_5 491 =
    some 496 := by
  decide +kernel

theorem checked : validate cache 491 = some 496 := checked_491_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 491 496 checked
  omega

theorem within_body : 496 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 491 496 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 491 496 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 491 496 address = observedPair address :=
  cachedPair_eq cache 491 496 checked address

end SourceCache70Pilot
open LookupCachePilot
namespace SourceCache71Pilot
theorem checked_496_5 : validate cache_496_5 496 =
    some 501 := by
  decide +kernel

theorem checked : validate cache 496 = some 501 := checked_496_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 496 501 checked
  omega

theorem within_body : 501 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 496 501 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 496 501 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 496 501 address = observedPair address :=
  cachedPair_eq cache 496 501 checked address

end SourceCache71Pilot
open LookupCachePilot
namespace SourceCache72Pilot
theorem checked_501_15 : validate cache_501_15 501 =
    some 516 := by
  decide +kernel

theorem checked : validate cache 501 = some 516 := checked_501_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 501 516 checked
  omega

theorem within_body : 516 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 501 516 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 501 516 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 501 516 address = observedPair address :=
  cachedPair_eq cache 501 516 checked address

end SourceCache72Pilot
open LookupCachePilot
namespace SourceCache73Pilot
theorem checked_516_5 : validate cache_516_5 516 =
    some 521 := by
  decide +kernel

theorem checked : validate cache 516 = some 521 := checked_516_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 516 521 checked
  omega

theorem within_body : 521 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 516 521 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 516 521 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 516 521 address = observedPair address :=
  cachedPair_eq cache 516 521 checked address

end SourceCache73Pilot
open LookupCachePilot
namespace SourceCache74Pilot
theorem checked_521_5 : validate cache_521_5 521 =
    some 526 := by
  decide +kernel

theorem checked : validate cache 521 = some 526 := checked_521_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 521 526 checked
  omega

theorem within_body : 526 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 521 526 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 521 526 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 521 526 address = observedPair address :=
  cachedPair_eq cache 521 526 checked address

end SourceCache74Pilot
open LookupCachePilot
namespace SourceCache75Pilot
theorem checked_526_5 : validate cache_526_5 526 =
    some 531 := by
  decide +kernel

theorem checked : validate cache 526 = some 531 := checked_526_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 526 531 checked
  omega

theorem within_body : 531 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 526 531 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 526 531 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 526 531 address = observedPair address :=
  cachedPair_eq cache 526 531 checked address

end SourceCache75Pilot
open LookupCachePilot
namespace SourceCache76Pilot
theorem checked_531_15 : validate cache_531_15 531 =
    some 546 := by
  decide +kernel

theorem checked : validate cache 531 = some 546 := checked_531_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 531 546 checked
  omega

theorem within_body : 546 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 531 546 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 531 546 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 531 546 address = observedPair address :=
  cachedPair_eq cache 531 546 checked address

end SourceCache76Pilot
open LookupCachePilot
namespace SourceCache77Pilot
theorem checked_546_5 : validate cache_546_5 546 =
    some 551 := by
  decide +kernel

theorem checked : validate cache 546 = some 551 := checked_546_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 546 551 checked
  omega

theorem within_body : 551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 546 551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 546 551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 546 551 address = observedPair address :=
  cachedPair_eq cache 546 551 checked address

end SourceCache77Pilot
open LookupCachePilot
namespace SourceCache78Pilot
theorem checked_551_5 : validate cache_551_5 551 =
    some 556 := by
  decide +kernel

theorem checked : validate cache 551 = some 556 := checked_551_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 551 556 checked
  omega

theorem within_body : 556 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 551 556 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 551 556 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 551 556 address = observedPair address :=
  cachedPair_eq cache 551 556 checked address

end SourceCache78Pilot
open LookupCachePilot
namespace SourceCache79Pilot
theorem checked_556_5 : validate cache_556_5 556 =
    some 561 := by
  decide +kernel

theorem checked : validate cache 556 = some 561 := checked_556_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 556 561 checked
  omega

theorem within_body : 561 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 556 561 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 556 561 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 556 561 address = observedPair address :=
  cachedPair_eq cache 556 561 checked address

end SourceCache79Pilot
open LookupCachePilot
namespace SourceCache80Pilot
theorem checked_561_5 : validate cache_561_5 561 =
    some 566 := by
  decide +kernel

theorem checked : validate cache 561 = some 566 := checked_561_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 561 566 checked
  omega

theorem within_body : 566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 561 566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 561 566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 561 566 address = observedPair address :=
  cachedPair_eq cache 561 566 checked address

end SourceCache80Pilot
open LookupCachePilot
namespace SourceCache81Pilot
theorem checked_566_15 : validate cache_566_15 566 =
    some 581 := by
  decide +kernel

theorem checked : validate cache 566 = some 581 := checked_566_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 566 581 checked
  omega

theorem within_body : 581 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 566 581 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 566 581 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 566 581 address = observedPair address :=
  cachedPair_eq cache 566 581 checked address

end SourceCache81Pilot
open LookupCachePilot
namespace SourceCache82Pilot
theorem checked_581_5 : validate cache_581_5 581 =
    some 586 := by
  decide +kernel

theorem checked : validate cache 581 = some 586 := checked_581_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 581 586 checked
  omega

theorem within_body : 586 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 581 586 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 581 586 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 581 586 address = observedPair address :=
  cachedPair_eq cache 581 586 checked address

end SourceCache82Pilot
open LookupCachePilot
namespace SourceCache83Pilot
theorem checked_586_5 : validate cache_586_5 586 =
    some 591 := by
  decide +kernel

theorem checked : validate cache 586 = some 591 := checked_586_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 586 591 checked
  omega

theorem within_body : 591 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 586 591 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 586 591 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 586 591 address = observedPair address :=
  cachedPair_eq cache 586 591 checked address

end SourceCache83Pilot
open LookupCachePilot
namespace SourceCache84Pilot
theorem checked_591_5 : validate cache_591_5 591 =
    some 596 := by
  decide +kernel

theorem checked : validate cache 591 = some 596 := checked_591_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 591 596 checked
  omega

theorem within_body : 596 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 591 596 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 591 596 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 591 596 address = observedPair address :=
  cachedPair_eq cache 591 596 checked address

end SourceCache84Pilot
open LookupCachePilot
namespace SourceCache85Pilot
theorem checked_596_5 : validate cache_596_5 596 =
    some 601 := by
  decide +kernel

theorem checked : validate cache 596 = some 601 := checked_596_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 596 601 checked
  omega

theorem within_body : 601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 596 601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 596 601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 596 601 address = observedPair address :=
  cachedPair_eq cache 596 601 checked address

end SourceCache85Pilot
open LookupCachePilot
namespace SourceCache86Pilot
theorem checked_601_15 : validate cache_601_15 601 =
    some 616 := by
  decide +kernel

theorem checked : validate cache 601 = some 616 := checked_601_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 601 616 checked
  omega

theorem within_body : 616 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 601 616 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 601 616 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 601 616 address = observedPair address :=
  cachedPair_eq cache 601 616 checked address

end SourceCache86Pilot
open LookupCachePilot
namespace SourceCache87Pilot
theorem checked_616_5 : validate cache_616_5 616 =
    some 621 := by
  decide +kernel

theorem checked : validate cache 616 = some 621 := checked_616_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 616 621 checked
  omega

theorem within_body : 621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 616 621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 616 621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 616 621 address = observedPair address :=
  cachedPair_eq cache 616 621 checked address

end SourceCache87Pilot
open LookupCachePilot
namespace SourceCache88Pilot
theorem checked_621_5 : validate cache_621_5 621 =
    some 626 := by
  decide +kernel

theorem checked : validate cache 621 = some 626 := checked_621_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 621 626 checked
  omega

theorem within_body : 626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 621 626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 621 626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 621 626 address = observedPair address :=
  cachedPair_eq cache 621 626 checked address

end SourceCache88Pilot
open LookupCachePilot
namespace SourceCache89Pilot
theorem checked_626_5 : validate cache_626_5 626 =
    some 631 := by
  decide +kernel

theorem checked : validate cache 626 = some 631 := checked_626_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 626 631 checked
  omega

theorem within_body : 631 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 626 631 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 626 631 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 626 631 address = observedPair address :=
  cachedPair_eq cache 626 631 checked address

end SourceCache89Pilot
open LookupCachePilot
namespace SourceCache90Pilot
theorem checked_631_5 : validate cache_631_5 631 =
    some 636 := by
  decide +kernel

theorem checked : validate cache 631 = some 636 := checked_631_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 631 636 checked
  omega

theorem within_body : 636 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 631 636 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 631 636 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 631 636 address = observedPair address :=
  cachedPair_eq cache 631 636 checked address

end SourceCache90Pilot
open LookupCachePilot
namespace SourceCache91Pilot
theorem checked_636_5 : validate cache_636_5 636 =
    some 641 := by
  decide +kernel

theorem checked : validate cache 636 = some 641 := checked_636_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 636 641 checked
  omega

theorem within_body : 641 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 636 641 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 636 641 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 636 641 address = observedPair address :=
  cachedPair_eq cache 636 641 checked address

end SourceCache91Pilot
open LookupCachePilot
namespace SourceCache92Pilot
theorem checked_641_5 : validate cache_641_5 641 =
    some 646 := by
  decide +kernel

theorem checked : validate cache 641 = some 646 := checked_641_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 641 646 checked
  omega

theorem within_body : 646 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 641 646 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 641 646 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 641 646 address = observedPair address :=
  cachedPair_eq cache 641 646 checked address

end SourceCache92Pilot
open LookupCachePilot
namespace SourceCache93Pilot
theorem checked_646_5 : validate cache_646_5 646 =
    some 651 := by
  decide +kernel

theorem checked : validate cache 646 = some 651 := checked_646_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 646 651 checked
  omega

theorem within_body : 651 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 646 651 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 646 651 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 646 651 address = observedPair address :=
  cachedPair_eq cache 646 651 checked address

end SourceCache93Pilot
open LookupCachePilot
namespace SourceCache94Pilot
theorem checked_651_5 : validate cache_651_5 651 =
    some 656 := by
  decide +kernel

theorem checked : validate cache 651 = some 656 := checked_651_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 651 656 checked
  omega

theorem within_body : 656 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 651 656 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 651 656 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 651 656 address = observedPair address :=
  cachedPair_eq cache 651 656 checked address

end SourceCache94Pilot
open LookupCachePilot
namespace SourceCache95Pilot
theorem checked_656_5 : validate cache_656_5 656 =
    some 661 := by
  decide +kernel

theorem checked : validate cache 656 = some 661 := checked_656_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 656 661 checked
  omega

theorem within_body : 661 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 656 661 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 656 661 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 656 661 address = observedPair address :=
  cachedPair_eq cache 656 661 checked address

end SourceCache95Pilot
open LookupCachePilot
namespace SourceCache96Pilot
theorem checked_661_5 : validate cache_661_5 661 =
    some 666 := by
  decide +kernel

theorem checked : validate cache 661 = some 666 := checked_661_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 661 666 checked
  omega

theorem within_body : 666 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 661 666 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 661 666 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 661 666 address = observedPair address :=
  cachedPair_eq cache 661 666 checked address

end SourceCache96Pilot
open LookupCachePilot
namespace SourceCache97Pilot
theorem checked_666_5 : validate cache_666_5 666 =
    some 671 := by
  decide +kernel

theorem checked : validate cache 666 = some 671 := checked_666_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 666 671 checked
  omega

theorem within_body : 671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 666 671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 666 671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 666 671 address = observedPair address :=
  cachedPair_eq cache 666 671 checked address

end SourceCache97Pilot
open LookupCachePilot
namespace SourceCache98Pilot
theorem checked_671_5 : validate cache_671_5 671 =
    some 676 := by
  decide +kernel

theorem checked : validate cache 671 = some 676 := checked_671_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 671 676 checked
  omega

theorem within_body : 676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 671 676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 671 676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 671 676 address = observedPair address :=
  cachedPair_eq cache 671 676 checked address

end SourceCache98Pilot
open LookupCachePilot
namespace SourceCache99Pilot
theorem checked_676_5 : validate cache_676_5 676 =
    some 681 := by
  decide +kernel

theorem checked : validate cache 676 = some 681 := checked_676_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 676 681 checked
  omega

theorem within_body : 681 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 676 681 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 676 681 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 676 681 address = observedPair address :=
  cachedPair_eq cache 676 681 checked address

end SourceCache99Pilot
open LookupCachePilot
namespace SourceCache100Pilot
theorem checked_681_5 : validate cache_681_5 681 =
    some 686 := by
  decide +kernel

theorem checked : validate cache 681 = some 686 := checked_681_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 681 686 checked
  omega

theorem within_body : 686 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 681 686 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 681 686 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 681 686 address = observedPair address :=
  cachedPair_eq cache 681 686 checked address

end SourceCache100Pilot
open LookupCachePilot
namespace SourceCache101Pilot
theorem checked_686_5 : validate cache_686_5 686 =
    some 691 := by
  decide +kernel

theorem checked : validate cache 686 = some 691 := checked_686_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 686 691 checked
  omega

theorem within_body : 691 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 686 691 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 686 691 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 686 691 address = observedPair address :=
  cachedPair_eq cache 686 691 checked address

end SourceCache101Pilot
open LookupCachePilot
namespace SourceCache102Pilot
theorem checked_691_5 : validate cache_691_5 691 =
    some 696 := by
  decide +kernel

theorem checked : validate cache 691 = some 696 := checked_691_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 691 696 checked
  omega

theorem within_body : 696 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 691 696 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 691 696 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 691 696 address = observedPair address :=
  cachedPair_eq cache 691 696 checked address

end SourceCache102Pilot
open LookupCachePilot
namespace SourceCache103Pilot
theorem checked_696_5 : validate cache_696_5 696 =
    some 701 := by
  decide +kernel

theorem checked : validate cache 696 = some 701 := checked_696_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 696 701 checked
  omega

theorem within_body : 701 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 696 701 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 696 701 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 696 701 address = observedPair address :=
  cachedPair_eq cache 696 701 checked address

end SourceCache103Pilot
open LookupCachePilot
namespace SourceCache104Pilot
theorem checked_701_5 : validate cache_701_5 701 =
    some 706 := by
  decide +kernel

theorem checked : validate cache 701 = some 706 := checked_701_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 701 706 checked
  omega

theorem within_body : 706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 701 706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 701 706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 701 706 address = observedPair address :=
  cachedPair_eq cache 701 706 checked address

end SourceCache104Pilot
open LookupCachePilot
namespace SourceCache105Pilot
theorem checked_706_5 : validate cache_706_5 706 =
    some 711 := by
  decide +kernel

theorem checked : validate cache 706 = some 711 := checked_706_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 706 711 checked
  omega

theorem within_body : 711 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 706 711 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 706 711 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 706 711 address = observedPair address :=
  cachedPair_eq cache 706 711 checked address

end SourceCache105Pilot
open LookupCachePilot
namespace SourceCache106Pilot
theorem checked_711_5 : validate cache_711_5 711 =
    some 716 := by
  decide +kernel

theorem checked : validate cache 711 = some 716 := checked_711_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 711 716 checked
  omega

theorem within_body : 716 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 711 716 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 711 716 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 711 716 address = observedPair address :=
  cachedPair_eq cache 711 716 checked address

end SourceCache106Pilot
open LookupCachePilot
namespace SourceCache107Pilot
theorem checked_716_5 : validate cache_716_5 716 =
    some 721 := by
  decide +kernel

theorem checked : validate cache 716 = some 721 := checked_716_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 716 721 checked
  omega

theorem within_body : 721 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 716 721 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 716 721 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 716 721 address = observedPair address :=
  cachedPair_eq cache 716 721 checked address

end SourceCache107Pilot
open LookupCachePilot
namespace SourceCache108Pilot
theorem checked_721_5 : validate cache_721_5 721 =
    some 726 := by
  decide +kernel

theorem checked : validate cache 721 = some 726 := checked_721_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 721 726 checked
  omega

theorem within_body : 726 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 721 726 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 721 726 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 721 726 address = observedPair address :=
  cachedPair_eq cache 721 726 checked address

end SourceCache108Pilot
open LookupCachePilot
namespace SourceCache109Pilot
theorem checked_726_5 : validate cache_726_5 726 =
    some 731 := by
  decide +kernel

theorem checked : validate cache 726 = some 731 := checked_726_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 726 731 checked
  omega

theorem within_body : 731 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 726 731 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 726 731 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 726 731 address = observedPair address :=
  cachedPair_eq cache 726 731 checked address

end SourceCache109Pilot
open LookupCachePilot
namespace SourceCache110Pilot
theorem checked_731_5 : validate cache_731_5 731 =
    some 736 := by
  decide +kernel

theorem checked : validate cache 731 = some 736 := checked_731_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 731 736 checked
  omega

theorem within_body : 736 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 731 736 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 731 736 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 731 736 address = observedPair address :=
  cachedPair_eq cache 731 736 checked address

end SourceCache110Pilot
open LookupCachePilot
namespace SourceCache111Pilot
theorem checked_736_5 : validate cache_736_5 736 =
    some 741 := by
  decide +kernel

theorem checked : validate cache 736 = some 741 := checked_736_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 736 741 checked
  omega

theorem within_body : 741 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 736 741 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 736 741 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 736 741 address = observedPair address :=
  cachedPair_eq cache 736 741 checked address

end SourceCache111Pilot
open LookupCachePilot
namespace SourceCache112Pilot
theorem checked_741_5 : validate cache_741_5 741 =
    some 746 := by
  decide +kernel

theorem checked : validate cache 741 = some 746 := checked_741_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 741 746 checked
  omega

theorem within_body : 746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 741 746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 741 746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 741 746 address = observedPair address :=
  cachedPair_eq cache 741 746 checked address

end SourceCache112Pilot
open LookupCachePilot
namespace SourceCache113Pilot
theorem checked_746_5 : validate cache_746_5 746 =
    some 751 := by
  decide +kernel

theorem checked : validate cache 746 = some 751 := checked_746_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 746 751 checked
  omega

theorem within_body : 751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 746 751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 746 751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 746 751 address = observedPair address :=
  cachedPair_eq cache 746 751 checked address

end SourceCache113Pilot
open LookupCachePilot
namespace SourceCache114Pilot
theorem checked_751_5 : validate cache_751_5 751 =
    some 756 := by
  decide +kernel

theorem checked : validate cache 751 = some 756 := checked_751_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 751 756 checked
  omega

theorem within_body : 756 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 751 756 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 751 756 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 751 756 address = observedPair address :=
  cachedPair_eq cache 751 756 checked address

end SourceCache114Pilot
open LookupCachePilot
namespace SourceCache115Pilot
theorem checked_756_15 : validate cache_756_15 756 =
    some 771 := by
  decide +kernel

theorem checked : validate cache 756 = some 771 := checked_756_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 756 771 checked
  omega

theorem within_body : 771 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 756 771 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 756 771 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 756 771 address = observedPair address :=
  cachedPair_eq cache 756 771 checked address

end SourceCache115Pilot
open LookupCachePilot
namespace SourceCache116Pilot
theorem checked_771_5 : validate cache_771_5 771 =
    some 776 := by
  decide +kernel

theorem checked : validate cache 771 = some 776 := checked_771_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 771 776 checked
  omega

theorem within_body : 776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 771 776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 771 776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 771 776 address = observedPair address :=
  cachedPair_eq cache 771 776 checked address

end SourceCache116Pilot
open LookupCachePilot
namespace SourceCache117Pilot
theorem checked_776_5 : validate cache_776_5 776 =
    some 781 := by
  decide +kernel

theorem checked : validate cache 776 = some 781 := checked_776_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 776 781 checked
  omega

theorem within_body : 781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 776 781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 776 781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 776 781 address = observedPair address :=
  cachedPair_eq cache 776 781 checked address

end SourceCache117Pilot
open LookupCachePilot
namespace SourceCache118Pilot
theorem checked_781_5 : validate cache_781_5 781 =
    some 786 := by
  decide +kernel

theorem checked : validate cache 781 = some 786 := checked_781_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 781 786 checked
  omega

theorem within_body : 786 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 781 786 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 781 786 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 781 786 address = observedPair address :=
  cachedPair_eq cache 781 786 checked address

end SourceCache118Pilot
open LookupCachePilot
namespace SourceCache119Pilot
theorem checked_786_5 : validate cache_786_5 786 =
    some 791 := by
  decide +kernel

theorem checked : validate cache 786 = some 791 := checked_786_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 786 791 checked
  omega

theorem within_body : 791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 786 791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 786 791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 786 791 address = observedPair address :=
  cachedPair_eq cache 786 791 checked address

end SourceCache119Pilot
open LookupCachePilot
namespace SourceCache120Pilot
theorem checked_791_5 : validate cache_791_5 791 =
    some 796 := by
  decide +kernel

theorem checked : validate cache 791 = some 796 := checked_791_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 791 796 checked
  omega

theorem within_body : 796 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 791 796 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 791 796 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 791 796 address = observedPair address :=
  cachedPair_eq cache 791 796 checked address

end SourceCache120Pilot
open LookupCachePilot
namespace SourceCache121Pilot
theorem checked_796_5 : validate cache_796_5 796 =
    some 801 := by
  decide +kernel

theorem checked : validate cache 796 = some 801 := checked_796_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 796 801 checked
  omega

theorem within_body : 801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 796 801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 796 801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 796 801 address = observedPair address :=
  cachedPair_eq cache 796 801 checked address

end SourceCache121Pilot
open LookupCachePilot
namespace SourceCache122Pilot
theorem checked_801_15 : validate cache_801_15 801 =
    some 816 := by
  decide +kernel

theorem checked : validate cache 801 = some 816 := checked_801_15

theorem count_exact : cache.count = 15 := by
  have extent := validate_extent cache 801 816 checked
  omega

theorem within_body : 816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 801 816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 801 816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 801 816 address = observedPair address :=
  cachedPair_eq cache 801 816 checked address

end SourceCache122Pilot
open LookupCachePilot
namespace SourceCache123Pilot
theorem checked_816_5 : validate cache_816_5 816 =
    some 821 := by
  decide +kernel

theorem checked : validate cache 816 = some 821 := checked_816_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 816 821 checked
  omega

theorem within_body : 821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 816 821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 816 821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 816 821 address = observedPair address :=
  cachedPair_eq cache 816 821 checked address

end SourceCache123Pilot
open LookupCachePilot
namespace SourceCache124Pilot
theorem checked_821_5 : validate cache_821_5 821 =
    some 826 := by
  decide +kernel

theorem checked : validate cache 821 = some 826 := checked_821_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 821 826 checked
  omega

theorem within_body : 826 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 821 826 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 821 826 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 821 826 address = observedPair address :=
  cachedPair_eq cache 821 826 checked address

end SourceCache124Pilot
open LookupCachePilot
namespace SourceCache125Pilot
theorem checked_826_5 : validate cache_826_5 826 =
    some 831 := by
  decide +kernel

theorem checked : validate cache 826 = some 831 := checked_826_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 826 831 checked
  omega

theorem within_body : 831 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 826 831 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 826 831 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 826 831 address = observedPair address :=
  cachedPair_eq cache 826 831 checked address

end SourceCache125Pilot
open LookupCachePilot
namespace SourceCache126Pilot
theorem checked_831_5 : validate cache_831_5 831 =
    some 836 := by
  decide +kernel

theorem checked : validate cache 831 = some 836 := checked_831_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 831 836 checked
  omega

theorem within_body : 836 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 831 836 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 831 836 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 831 836 address = observedPair address :=
  cachedPair_eq cache 831 836 checked address

end SourceCache126Pilot
open LookupCachePilot
namespace SourceCache127Pilot
theorem checked_836_5 : validate cache_836_5 836 =
    some 841 := by
  decide +kernel

theorem checked : validate cache 836 = some 841 := checked_836_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 836 841 checked
  omega

theorem within_body : 841 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 836 841 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 836 841 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 836 841 address = observedPair address :=
  cachedPair_eq cache 836 841 checked address

end SourceCache127Pilot
namespace ScopeViews000Pilot
noncomputable def fromRaw_0 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache0Pilot.cache 0 6)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache0Pilot.cache
    0 6 SourceCache0Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_1 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache1Pilot.cache 6 11)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache1Pilot.cache
    6 11 SourceCache1Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_2 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache2Pilot.cache 11 16)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache2Pilot.cache
    11 16 SourceCache2Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_3 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache3Pilot.cache 16 21)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache3Pilot.cache
    16 21 SourceCache3Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_4 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache4Pilot.cache 21 36)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache4Pilot.cache
    21 36 SourceCache4Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_5 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache5Pilot.cache 36 41)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache5Pilot.cache
    36 41 SourceCache5Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_6 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache6Pilot.cache 41 46)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache6Pilot.cache
    41 46 SourceCache6Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_7 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache7Pilot.cache 46 51)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache7Pilot.cache
    46 51 SourceCache7Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_8 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache8Pilot.cache 51 56)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache8Pilot.cache
    51 56 SourceCache8Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_9 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache9Pilot.cache 56 71)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache9Pilot.cache
    56 71 SourceCache9Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_10 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache10Pilot.cache 71 76)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache10Pilot.cache
    71 76 SourceCache10Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_11 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache11Pilot.cache 76 81)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache11Pilot.cache
    76 81 SourceCache11Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_12 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache12Pilot.cache 81 86)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache12Pilot.cache
    81 86 SourceCache12Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_13 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache13Pilot.cache 86 91)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache13Pilot.cache
    86 91 SourceCache13Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_14 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache14Pilot.cache 91 96)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache14Pilot.cache
    91 96 SourceCache14Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_15 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache15Pilot.cache 96 111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache15Pilot.cache
    96 111 SourceCache15Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_16 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache16Pilot.cache 111 116)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache16Pilot.cache
    111 116 SourceCache16Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_17 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache17Pilot.cache 116 121)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache17Pilot.cache
    116 121 SourceCache17Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_18 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache18Pilot.cache 121 126)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache18Pilot.cache
    121 126 SourceCache18Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_19 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache19Pilot.cache 126 141)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache19Pilot.cache
    126 141 SourceCache19Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_20 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache20Pilot.cache 141 146)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache20Pilot.cache
    141 146 SourceCache20Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_21 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache21Pilot.cache 146 151)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache21Pilot.cache
    146 151 SourceCache21Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_22 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache22Pilot.cache 151 156)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache22Pilot.cache
    151 156 SourceCache22Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_23 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache23Pilot.cache 156 171)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache23Pilot.cache
    156 171 SourceCache23Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_24 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache24Pilot.cache 171 176)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache24Pilot.cache
    171 176 SourceCache24Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_25 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache25Pilot.cache 176 181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache25Pilot.cache
    176 181 SourceCache25Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_26 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache26Pilot.cache 181 186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache26Pilot.cache
    181 186 SourceCache26Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_27 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache27Pilot.cache 186 191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache27Pilot.cache
    186 191 SourceCache27Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_28 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache28Pilot.cache 191 196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache28Pilot.cache
    191 196 SourceCache28Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_29 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache29Pilot.cache 196 201)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache29Pilot.cache
    196 201 SourceCache29Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_30 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache30Pilot.cache 201 206)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache30Pilot.cache
    201 206 SourceCache30Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_31 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache31Pilot.cache 206 221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache31Pilot.cache
    206 221 SourceCache31Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_32 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache32Pilot.cache 221 226)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache32Pilot.cache
    221 226 SourceCache32Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_33 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache33Pilot.cache 226 231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache33Pilot.cache
    226 231 SourceCache33Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_34 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache34Pilot.cache 231 236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache34Pilot.cache
    231 236 SourceCache34Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_35 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache35Pilot.cache 236 241)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache35Pilot.cache
    236 241 SourceCache35Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_36 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache36Pilot.cache 241 256)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache36Pilot.cache
    241 256 SourceCache36Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_37 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache37Pilot.cache 256 261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache37Pilot.cache
    256 261 SourceCache37Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_38 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache38Pilot.cache 261 266)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache38Pilot.cache
    261 266 SourceCache38Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_39 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache39Pilot.cache 266 271)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache39Pilot.cache
    266 271 SourceCache39Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_40 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache40Pilot.cache 271 276)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache40Pilot.cache
    271 276 SourceCache40Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_41 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache41Pilot.cache 276 291)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache41Pilot.cache
    276 291 SourceCache41Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_42 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache42Pilot.cache 291 296)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache42Pilot.cache
    291 296 SourceCache42Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_43 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache43Pilot.cache 296 301)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache43Pilot.cache
    296 301 SourceCache43Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_44 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache44Pilot.cache 301 306)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache44Pilot.cache
    301 306 SourceCache44Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_45 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache45Pilot.cache 306 311)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache45Pilot.cache
    306 311 SourceCache45Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_46 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache46Pilot.cache 311 326)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache46Pilot.cache
    311 326 SourceCache46Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_47 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache47Pilot.cache 326 331)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache47Pilot.cache
    326 331 SourceCache47Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_48 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache48Pilot.cache 331 336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache48Pilot.cache
    331 336 SourceCache48Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_49 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache49Pilot.cache 336 351)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache49Pilot.cache
    336 351 SourceCache49Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_50 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache50Pilot.cache 351 356)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache50Pilot.cache
    351 356 SourceCache50Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_51 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache51Pilot.cache 356 361)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache51Pilot.cache
    356 361 SourceCache51Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_52 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache52Pilot.cache 361 366)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache52Pilot.cache
    361 366 SourceCache52Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_53 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache53Pilot.cache 366 371)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache53Pilot.cache
    366 371 SourceCache53Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_54 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache54Pilot.cache 371 386)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache54Pilot.cache
    371 386 SourceCache54Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_55 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache55Pilot.cache 386 391)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache55Pilot.cache
    386 391 SourceCache55Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_56 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache56Pilot.cache 391 396)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache56Pilot.cache
    391 396 SourceCache56Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_57 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache57Pilot.cache 396 411)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache57Pilot.cache
    396 411 SourceCache57Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_58 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache58Pilot.cache 411 416)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache58Pilot.cache
    411 416 SourceCache58Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_59 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache59Pilot.cache 416 421)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache59Pilot.cache
    416 421 SourceCache59Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_60 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache60Pilot.cache 421 426)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache60Pilot.cache
    421 426 SourceCache60Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_61 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache61Pilot.cache 426 431)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache61Pilot.cache
    426 431 SourceCache61Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_62 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache62Pilot.cache 431 446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache62Pilot.cache
    431 446 SourceCache62Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_63 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache63Pilot.cache 446 451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache63Pilot.cache
    446 451 SourceCache63Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_64 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache64Pilot.cache 451 456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache64Pilot.cache
    451 456 SourceCache64Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_65 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache65Pilot.cache 456 471)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache65Pilot.cache
    456 471 SourceCache65Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_66 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache66Pilot.cache 471 476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache66Pilot.cache
    471 476 SourceCache66Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_67 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache67Pilot.cache 476 481)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache67Pilot.cache
    476 481 SourceCache67Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_68 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache68Pilot.cache 481 486)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache68Pilot.cache
    481 486 SourceCache68Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_69 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache69Pilot.cache 486 491)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache69Pilot.cache
    486 491 SourceCache69Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_70 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache70Pilot.cache 491 496)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache70Pilot.cache
    491 496 SourceCache70Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_71 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache71Pilot.cache 496 501)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache71Pilot.cache
    496 501 SourceCache71Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_72 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache72Pilot.cache 501 516)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache72Pilot.cache
    501 516 SourceCache72Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_73 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache73Pilot.cache 516 521)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache73Pilot.cache
    516 521 SourceCache73Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_74 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache74Pilot.cache 521 526)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache74Pilot.cache
    521 526 SourceCache74Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_75 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache75Pilot.cache 526 531)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache75Pilot.cache
    526 531 SourceCache75Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_76 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache76Pilot.cache 531 546)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache76Pilot.cache
    531 546 SourceCache76Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_77 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache77Pilot.cache 546 551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache77Pilot.cache
    546 551 SourceCache77Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_78 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache78Pilot.cache 551 556)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache78Pilot.cache
    551 556 SourceCache78Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_79 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache79Pilot.cache 556 561)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache79Pilot.cache
    556 561 SourceCache79Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_80 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache80Pilot.cache 561 566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache80Pilot.cache
    561 566 SourceCache80Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_81 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache81Pilot.cache 566 581)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache81Pilot.cache
    566 581 SourceCache81Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_82 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache82Pilot.cache 581 586)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache82Pilot.cache
    581 586 SourceCache82Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_83 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache83Pilot.cache 586 591)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache83Pilot.cache
    586 591 SourceCache83Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_84 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache84Pilot.cache 591 596)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache84Pilot.cache
    591 596 SourceCache84Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_85 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache85Pilot.cache 596 601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache85Pilot.cache
    596 601 SourceCache85Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_86 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache86Pilot.cache 601 616)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache86Pilot.cache
    601 616 SourceCache86Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_87 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache87Pilot.cache 616 621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache87Pilot.cache
    616 621 SourceCache87Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_88 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache88Pilot.cache 621 626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache88Pilot.cache
    621 626 SourceCache88Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_89 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache89Pilot.cache 626 631)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache89Pilot.cache
    626 631 SourceCache89Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_90 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache90Pilot.cache 631 636)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache90Pilot.cache
    631 636 SourceCache90Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_91 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache91Pilot.cache 636 641)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache91Pilot.cache
    636 641 SourceCache91Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_92 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache92Pilot.cache 641 646)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache92Pilot.cache
    641 646 SourceCache92Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_93 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache93Pilot.cache 646 651)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache93Pilot.cache
    646 651 SourceCache93Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_94 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache94Pilot.cache 651 656)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache94Pilot.cache
    651 656 SourceCache94Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_95 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache95Pilot.cache 656 661)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache95Pilot.cache
    656 661 SourceCache95Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_96 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache96Pilot.cache 661 666)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache96Pilot.cache
    661 666 SourceCache96Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_97 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache97Pilot.cache 666 671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache97Pilot.cache
    666 671 SourceCache97Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_98 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache98Pilot.cache 671 676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache98Pilot.cache
    671 676 SourceCache98Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_99 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache99Pilot.cache 676 681)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache99Pilot.cache
    676 681 SourceCache99Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_100 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache100Pilot.cache 681 686)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache100Pilot.cache
    681 686 SourceCache100Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_101 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache101Pilot.cache 686 691)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache101Pilot.cache
    686 691 SourceCache101Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_102 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache102Pilot.cache 691 696)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache102Pilot.cache
    691 696 SourceCache102Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_103 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache103Pilot.cache 696 701)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache103Pilot.cache
    696 701 SourceCache103Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_104 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache104Pilot.cache 701 706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache104Pilot.cache
    701 706 SourceCache104Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_105 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache105Pilot.cache 706 711)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache105Pilot.cache
    706 711 SourceCache105Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_106 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache106Pilot.cache 711 716)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache106Pilot.cache
    711 716 SourceCache106Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_107 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache107Pilot.cache 716 721)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache107Pilot.cache
    716 721 SourceCache107Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_108 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache108Pilot.cache 721 726)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache108Pilot.cache
    721 726 SourceCache108Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_109 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache109Pilot.cache 726 731)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache109Pilot.cache
    726 731 SourceCache109Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_110 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache110Pilot.cache 731 736)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache110Pilot.cache
    731 736 SourceCache110Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_111 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache111Pilot.cache 736 741)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache111Pilot.cache
    736 741 SourceCache111Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_112 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache112Pilot.cache 741 746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache112Pilot.cache
    741 746 SourceCache112Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_113 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache113Pilot.cache 746 751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache113Pilot.cache
    746 751 SourceCache113Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_114 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache114Pilot.cache 751 756)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache114Pilot.cache
    751 756 SourceCache114Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_115 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache115Pilot.cache 756 771)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache115Pilot.cache
    756 771 SourceCache115Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_116 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache116Pilot.cache 771 776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache116Pilot.cache
    771 776 SourceCache116Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_117 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache117Pilot.cache 776 781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache117Pilot.cache
    776 781 SourceCache117Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_118 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache118Pilot.cache 781 786)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache118Pilot.cache
    781 786 SourceCache118Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_119 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache119Pilot.cache 786 791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache119Pilot.cache
    786 791 SourceCache119Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_120 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache120Pilot.cache 791 796)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache120Pilot.cache
    791 796 SourceCache120Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_121 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache121Pilot.cache 796 801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache121Pilot.cache
    796 801 SourceCache121Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_122 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache122Pilot.cache 801 816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache122Pilot.cache
    801 816 SourceCache122Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_123 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache123Pilot.cache 816 821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache123Pilot.cache
    816 821 SourceCache123Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_124 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache124Pilot.cache 821 826)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache124Pilot.cache
    821 826 SourceCache124Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_125 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache125Pilot.cache 826 831)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache125Pilot.cache
    826 831 SourceCache125Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_126 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache126Pilot.cache 831 836)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache126Pilot.cache
    831 836 SourceCache126Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_127 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache127Pilot.cache 836 841)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache127Pilot.cache
    836 841 SourceCache127Pilot.checked q raw nodes returns truth
end ScopeViews000Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
