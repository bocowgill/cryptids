module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews009Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache832Pilot
theorem checked_114161_200 : validate cache_114161_200 114161 =
    some 114361 := by
  decide +kernel
theorem checked_114361_200 : validate cache_114361_200 114361 =
    some 114561 := by
  decide +kernel
theorem checked_114161_400 : validate cache_114161_400 114161 =
    some 114561 := by
  exact validate_branch 200 cache_114161_200 cache_114361_200
    114161 114361 114561
    checked_114161_200 rfl checked_114361_200

theorem checked : validate cache 114161 = some 114561 := checked_114161_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 114161 114561 checked
  omega

theorem within_body : 114561 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 114161 114561 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 114161 114561 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 114161 114561 address = observedPair address :=
  cachedPair_eq cache 114161 114561 checked address

end SourceCache832Pilot
open LookupCachePilot
namespace SourceCache833Pilot
theorem checked_114561_5 : validate cache_114561_5 114561 =
    some 114566 := by
  decide +kernel

theorem checked : validate cache 114561 = some 114566 := checked_114561_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 114561 114566 checked
  omega

theorem within_body : 114566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 114561 114566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 114561 114566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 114561 114566 address = observedPair address :=
  cachedPair_eq cache 114561 114566 checked address

end SourceCache833Pilot
open LookupCachePilot
namespace SourceCache834Pilot
theorem checked_114566_70 : validate cache_114566_70 114566 =
    some 114636 := by
  decide +kernel

theorem checked : validate cache 114566 = some 114636 := checked_114566_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 114566 114636 checked
  omega

theorem within_body : 114636 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 114566 114636 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 114566 114636 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 114566 114636 address = observedPair address :=
  cachedPair_eq cache 114566 114636 checked address

end SourceCache834Pilot
open LookupCachePilot
namespace SourceCache835Pilot
theorem checked_114636_185 : validate cache_114636_185 114636 =
    some 114821 := by
  decide +kernel
theorem checked_114821_185 : validate cache_114821_185 114821 =
    some 115006 := by
  decide +kernel
theorem checked_114636_370 : validate cache_114636_370 114636 =
    some 115006 := by
  exact validate_branch 185 cache_114636_185 cache_114821_185
    114636 114821 115006
    checked_114636_185 rfl checked_114821_185

theorem checked : validate cache 114636 = some 115006 := checked_114636_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 114636 115006 checked
  omega

theorem within_body : 115006 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 114636 115006 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 114636 115006 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 114636 115006 address = observedPair address :=
  cachedPair_eq cache 114636 115006 checked address

end SourceCache835Pilot
open LookupCachePilot
namespace SourceCache836Pilot
theorem checked_115006_5 : validate cache_115006_5 115006 =
    some 115011 := by
  decide +kernel

theorem checked : validate cache 115006 = some 115011 := checked_115006_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 115006 115011 checked
  omega

theorem within_body : 115011 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115006 115011 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115006 115011 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115006 115011 address = observedPair address :=
  cachedPair_eq cache 115006 115011 checked address

end SourceCache836Pilot
open LookupCachePilot
namespace SourceCache837Pilot
theorem checked_115011_70 : validate cache_115011_70 115011 =
    some 115081 := by
  decide +kernel

theorem checked : validate cache 115011 = some 115081 := checked_115011_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 115011 115081 checked
  omega

theorem within_body : 115081 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115011 115081 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115011 115081 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115011 115081 address = observedPair address :=
  cachedPair_eq cache 115011 115081 checked address

end SourceCache837Pilot
open LookupCachePilot
namespace SourceCache838Pilot
theorem checked_115081_200 : validate cache_115081_200 115081 =
    some 115281 := by
  decide +kernel
theorem checked_115281_200 : validate cache_115281_200 115281 =
    some 115481 := by
  decide +kernel
theorem checked_115081_400 : validate cache_115081_400 115081 =
    some 115481 := by
  exact validate_branch 200 cache_115081_200 cache_115281_200
    115081 115281 115481
    checked_115081_200 rfl checked_115281_200

theorem checked : validate cache 115081 = some 115481 := checked_115081_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 115081 115481 checked
  omega

theorem within_body : 115481 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115081 115481 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115081 115481 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115081 115481 address = observedPair address :=
  cachedPair_eq cache 115081 115481 checked address

end SourceCache838Pilot
open LookupCachePilot
namespace SourceCache839Pilot
theorem checked_115481_5 : validate cache_115481_5 115481 =
    some 115486 := by
  decide +kernel

theorem checked : validate cache 115481 = some 115486 := checked_115481_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 115481 115486 checked
  omega

theorem within_body : 115486 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115481 115486 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115481 115486 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115481 115486 address = observedPair address :=
  cachedPair_eq cache 115481 115486 checked address

end SourceCache839Pilot
open LookupCachePilot
namespace SourceCache840Pilot
theorem checked_115486_70 : validate cache_115486_70 115486 =
    some 115556 := by
  decide +kernel

theorem checked : validate cache 115486 = some 115556 := checked_115486_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 115486 115556 checked
  omega

theorem within_body : 115556 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115486 115556 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115486 115556 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115486 115556 address = observedPair address :=
  cachedPair_eq cache 115486 115556 checked address

end SourceCache840Pilot
open LookupCachePilot
namespace SourceCache841Pilot
theorem checked_115556_185 : validate cache_115556_185 115556 =
    some 115741 := by
  decide +kernel
theorem checked_115741_185 : validate cache_115741_185 115741 =
    some 115926 := by
  decide +kernel
theorem checked_115556_370 : validate cache_115556_370 115556 =
    some 115926 := by
  exact validate_branch 185 cache_115556_185 cache_115741_185
    115556 115741 115926
    checked_115556_185 rfl checked_115741_185

theorem checked : validate cache 115556 = some 115926 := checked_115556_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 115556 115926 checked
  omega

theorem within_body : 115926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115556 115926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115556 115926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115556 115926 address = observedPair address :=
  cachedPair_eq cache 115556 115926 checked address

end SourceCache841Pilot
open LookupCachePilot
namespace SourceCache842Pilot
theorem checked_115926_5 : validate cache_115926_5 115926 =
    some 115931 := by
  decide +kernel

theorem checked : validate cache 115926 = some 115931 := checked_115926_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 115926 115931 checked
  omega

theorem within_body : 115931 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115926 115931 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115926 115931 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115926 115931 address = observedPair address :=
  cachedPair_eq cache 115926 115931 checked address

end SourceCache842Pilot
open LookupCachePilot
namespace SourceCache843Pilot
theorem checked_115931_70 : validate cache_115931_70 115931 =
    some 116001 := by
  decide +kernel

theorem checked : validate cache 115931 = some 116001 := checked_115931_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 115931 116001 checked
  omega

theorem within_body : 116001 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 115931 116001 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 115931 116001 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 115931 116001 address = observedPair address :=
  cachedPair_eq cache 115931 116001 checked address

end SourceCache843Pilot
open LookupCachePilot
namespace SourceCache844Pilot
theorem checked_116001_200 : validate cache_116001_200 116001 =
    some 116201 := by
  decide +kernel
theorem checked_116201_200 : validate cache_116201_200 116201 =
    some 116401 := by
  decide +kernel
theorem checked_116001_400 : validate cache_116001_400 116001 =
    some 116401 := by
  exact validate_branch 200 cache_116001_200 cache_116201_200
    116001 116201 116401
    checked_116001_200 rfl checked_116201_200

theorem checked : validate cache 116001 = some 116401 := checked_116001_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 116001 116401 checked
  omega

theorem within_body : 116401 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116001 116401 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116001 116401 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116001 116401 address = observedPair address :=
  cachedPair_eq cache 116001 116401 checked address

end SourceCache844Pilot
open LookupCachePilot
namespace SourceCache845Pilot
theorem checked_116401_5 : validate cache_116401_5 116401 =
    some 116406 := by
  decide +kernel

theorem checked : validate cache 116401 = some 116406 := checked_116401_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 116401 116406 checked
  omega

theorem within_body : 116406 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116401 116406 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116401 116406 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116401 116406 address = observedPair address :=
  cachedPair_eq cache 116401 116406 checked address

end SourceCache845Pilot
open LookupCachePilot
namespace SourceCache846Pilot
theorem checked_116406_70 : validate cache_116406_70 116406 =
    some 116476 := by
  decide +kernel

theorem checked : validate cache 116406 = some 116476 := checked_116406_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 116406 116476 checked
  omega

theorem within_body : 116476 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116406 116476 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116406 116476 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116406 116476 address = observedPair address :=
  cachedPair_eq cache 116406 116476 checked address

end SourceCache846Pilot
open LookupCachePilot
namespace SourceCache847Pilot
theorem checked_116476_152 : validate cache_116476_152 116476 =
    some 116628 := by
  decide +kernel
theorem checked_116628_153 : validate cache_116628_153 116628 =
    some 116781 := by
  decide +kernel
theorem checked_116476_305 : validate cache_116476_305 116476 =
    some 116781 := by
  exact validate_branch 152 cache_116476_152 cache_116628_153
    116476 116628 116781
    checked_116476_152 rfl checked_116628_153

theorem checked : validate cache 116476 = some 116781 := checked_116476_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 116476 116781 checked
  omega

theorem within_body : 116781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116476 116781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116476 116781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116476 116781 address = observedPair address :=
  cachedPair_eq cache 116476 116781 checked address

end SourceCache847Pilot
open LookupCachePilot
namespace SourceCache848Pilot
theorem checked_116781_70 : validate cache_116781_70 116781 =
    some 116851 := by
  decide +kernel

theorem checked : validate cache 116781 = some 116851 := checked_116781_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 116781 116851 checked
  omega

theorem within_body : 116851 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116781 116851 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116781 116851 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116781 116851 address = observedPair address :=
  cachedPair_eq cache 116781 116851 checked address

end SourceCache848Pilot
open LookupCachePilot
namespace SourceCache849Pilot
theorem checked_116851_5 : validate cache_116851_5 116851 =
    some 116856 := by
  decide +kernel

theorem checked : validate cache 116851 = some 116856 := checked_116851_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 116851 116856 checked
  omega

theorem within_body : 116856 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116851 116856 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116851 116856 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116851 116856 address = observedPair address :=
  cachedPair_eq cache 116851 116856 checked address

end SourceCache849Pilot
open LookupCachePilot
namespace SourceCache850Pilot
theorem checked_116856_70 : validate cache_116856_70 116856 =
    some 116926 := by
  decide +kernel

theorem checked : validate cache 116856 = some 116926 := checked_116856_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 116856 116926 checked
  omega

theorem within_body : 116926 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116856 116926 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116856 116926 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116856 116926 address = observedPair address :=
  cachedPair_eq cache 116856 116926 checked address

end SourceCache850Pilot
open LookupCachePilot
namespace SourceCache851Pilot
theorem checked_116926_132 : validate cache_116926_132 116926 =
    some 117058 := by
  decide +kernel
theorem checked_117058_133 : validate cache_117058_133 117058 =
    some 117191 := by
  decide +kernel
theorem checked_116926_265 : validate cache_116926_265 116926 =
    some 117191 := by
  exact validate_branch 132 cache_116926_132 cache_117058_133
    116926 117058 117191
    checked_116926_132 rfl checked_117058_133

theorem checked : validate cache 116926 = some 117191 := checked_116926_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 116926 117191 checked
  omega

theorem within_body : 117191 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 116926 117191 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 116926 117191 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 116926 117191 address = observedPair address :=
  cachedPair_eq cache 116926 117191 checked address

end SourceCache851Pilot
open LookupCachePilot
namespace SourceCache852Pilot
theorem checked_117191_5 : validate cache_117191_5 117191 =
    some 117196 := by
  decide +kernel

theorem checked : validate cache 117191 = some 117196 := checked_117191_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 117191 117196 checked
  omega

theorem within_body : 117196 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117191 117196 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117191 117196 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117191 117196 address = observedPair address :=
  cachedPair_eq cache 117191 117196 checked address

end SourceCache852Pilot
open LookupCachePilot
namespace SourceCache853Pilot
theorem checked_117196_10 : validate cache_117196_10 117196 =
    some 117206 := by
  decide +kernel

theorem checked : validate cache 117196 = some 117206 := checked_117196_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 117196 117206 checked
  omega

theorem within_body : 117206 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117196 117206 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117196 117206 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117196 117206 address = observedPair address :=
  cachedPair_eq cache 117196 117206 checked address

end SourceCache853Pilot
open LookupCachePilot
namespace SourceCache854Pilot
theorem checked_117206_220 : validate cache_117206_220 117206 =
    some 117426 := by
  decide +kernel

theorem checked : validate cache 117206 = some 117426 := checked_117206_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 117206 117426 checked
  omega

theorem within_body : 117426 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117206 117426 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117206 117426 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117206 117426 address = observedPair address :=
  cachedPair_eq cache 117206 117426 checked address

end SourceCache854Pilot
open LookupCachePilot
namespace SourceCache855Pilot
theorem checked_117426_152 : validate cache_117426_152 117426 =
    some 117578 := by
  decide +kernel
theorem checked_117578_153 : validate cache_117578_153 117578 =
    some 117731 := by
  decide +kernel
theorem checked_117426_305 : validate cache_117426_305 117426 =
    some 117731 := by
  exact validate_branch 152 cache_117426_152 cache_117578_153
    117426 117578 117731
    checked_117426_152 rfl checked_117578_153

theorem checked : validate cache 117426 = some 117731 := checked_117426_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 117426 117731 checked
  omega

theorem within_body : 117731 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117426 117731 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117426 117731 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117426 117731 address = observedPair address :=
  cachedPair_eq cache 117426 117731 checked address

end SourceCache855Pilot
open LookupCachePilot
namespace SourceCache856Pilot
theorem checked_117731_70 : validate cache_117731_70 117731 =
    some 117801 := by
  decide +kernel

theorem checked : validate cache 117731 = some 117801 := checked_117731_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 117731 117801 checked
  omega

theorem within_body : 117801 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117731 117801 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117731 117801 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117731 117801 address = observedPair address :=
  cachedPair_eq cache 117731 117801 checked address

end SourceCache856Pilot
open LookupCachePilot
namespace SourceCache857Pilot
theorem checked_117801_195 : validate cache_117801_195 117801 =
    some 117996 := by
  decide +kernel

theorem checked : validate cache 117801 = some 117996 := checked_117801_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 117801 117996 checked
  omega

theorem within_body : 117996 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117801 117996 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117801 117996 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117801 117996 address = observedPair address :=
  cachedPair_eq cache 117801 117996 checked address

end SourceCache857Pilot
open LookupCachePilot
namespace SourceCache858Pilot
theorem checked_117996_70 : validate cache_117996_70 117996 =
    some 118066 := by
  decide +kernel

theorem checked : validate cache 117996 = some 118066 := checked_117996_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 117996 118066 checked
  omega

theorem within_body : 118066 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 117996 118066 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 117996 118066 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 117996 118066 address = observedPair address :=
  cachedPair_eq cache 117996 118066 checked address

end SourceCache858Pilot
open LookupCachePilot
namespace SourceCache859Pilot
theorem checked_118066_132 : validate cache_118066_132 118066 =
    some 118198 := by
  decide +kernel
theorem checked_118198_133 : validate cache_118198_133 118198 =
    some 118331 := by
  decide +kernel
theorem checked_118066_265 : validate cache_118066_265 118066 =
    some 118331 := by
  exact validate_branch 132 cache_118066_132 cache_118198_133
    118066 118198 118331
    checked_118066_132 rfl checked_118198_133

theorem checked : validate cache 118066 = some 118331 := checked_118066_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 118066 118331 checked
  omega

theorem within_body : 118331 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118066 118331 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118066 118331 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118066 118331 address = observedPair address :=
  cachedPair_eq cache 118066 118331 checked address

end SourceCache859Pilot
open LookupCachePilot
namespace SourceCache860Pilot
theorem checked_118331_220 : validate cache_118331_220 118331 =
    some 118551 := by
  decide +kernel

theorem checked : validate cache 118331 = some 118551 := checked_118331_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 118331 118551 checked
  omega

theorem within_body : 118551 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118331 118551 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118331 118551 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118331 118551 address = observedPair address :=
  cachedPair_eq cache 118331 118551 checked address

end SourceCache860Pilot
open LookupCachePilot
namespace SourceCache861Pilot
theorem checked_118551_5 : validate cache_118551_5 118551 =
    some 118556 := by
  decide +kernel

theorem checked : validate cache 118551 = some 118556 := checked_118551_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 118551 118556 checked
  omega

theorem within_body : 118556 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118551 118556 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118551 118556 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118551 118556 address = observedPair address :=
  cachedPair_eq cache 118551 118556 checked address

end SourceCache861Pilot
open LookupCachePilot
namespace SourceCache862Pilot
theorem checked_118556_70 : validate cache_118556_70 118556 =
    some 118626 := by
  decide +kernel

theorem checked : validate cache 118556 = some 118626 := checked_118556_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 118556 118626 checked
  omega

theorem within_body : 118626 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118556 118626 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118556 118626 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118556 118626 address = observedPair address :=
  cachedPair_eq cache 118556 118626 checked address

end SourceCache862Pilot
open LookupCachePilot
namespace SourceCache863Pilot
theorem checked_118626_132 : validate cache_118626_132 118626 =
    some 118758 := by
  decide +kernel
theorem checked_118758_133 : validate cache_118758_133 118758 =
    some 118891 := by
  decide +kernel
theorem checked_118626_265 : validate cache_118626_265 118626 =
    some 118891 := by
  exact validate_branch 132 cache_118626_132 cache_118758_133
    118626 118758 118891
    checked_118626_132 rfl checked_118758_133

theorem checked : validate cache 118626 = some 118891 := checked_118626_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 118626 118891 checked
  omega

theorem within_body : 118891 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118626 118891 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118626 118891 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118626 118891 address = observedPair address :=
  cachedPair_eq cache 118626 118891 checked address

end SourceCache863Pilot
open LookupCachePilot
namespace SourceCache864Pilot
theorem checked_118891_5 : validate cache_118891_5 118891 =
    some 118896 := by
  decide +kernel

theorem checked : validate cache 118891 = some 118896 := checked_118891_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 118891 118896 checked
  omega

theorem within_body : 118896 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118891 118896 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118891 118896 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118891 118896 address = observedPair address :=
  cachedPair_eq cache 118891 118896 checked address

end SourceCache864Pilot
open LookupCachePilot
namespace SourceCache865Pilot
theorem checked_118896_10 : validate cache_118896_10 118896 =
    some 118906 := by
  decide +kernel

theorem checked : validate cache 118896 = some 118906 := checked_118896_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 118896 118906 checked
  omega

theorem within_body : 118906 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118896 118906 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118896 118906 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118896 118906 address = observedPair address :=
  cachedPair_eq cache 118896 118906 checked address

end SourceCache865Pilot
open LookupCachePilot
namespace SourceCache866Pilot
theorem checked_118906_185 : validate cache_118906_185 118906 =
    some 119091 := by
  decide +kernel
theorem checked_119091_185 : validate cache_119091_185 119091 =
    some 119276 := by
  decide +kernel
theorem checked_118906_370 : validate cache_118906_370 118906 =
    some 119276 := by
  exact validate_branch 185 cache_118906_185 cache_119091_185
    118906 119091 119276
    checked_118906_185 rfl checked_119091_185

theorem checked : validate cache 118906 = some 119276 := checked_118906_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 118906 119276 checked
  omega

theorem within_body : 119276 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 118906 119276 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 118906 119276 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 118906 119276 address = observedPair address :=
  cachedPair_eq cache 118906 119276 checked address

end SourceCache866Pilot
open LookupCachePilot
namespace SourceCache867Pilot
theorem checked_119276_220 : validate cache_119276_220 119276 =
    some 119496 := by
  decide +kernel
theorem checked_119496_220 : validate cache_119496_220 119496 =
    some 119716 := by
  decide +kernel
theorem checked_119276_440 : validate cache_119276_440 119276 =
    some 119716 := by
  exact validate_branch 220 cache_119276_220 cache_119496_220
    119276 119496 119716
    checked_119276_220 rfl checked_119496_220

theorem checked : validate cache 119276 = some 119716 := checked_119276_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 119276 119716 checked
  omega

theorem within_body : 119716 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 119276 119716 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 119276 119716 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 119276 119716 address = observedPair address :=
  cachedPair_eq cache 119276 119716 checked address

end SourceCache867Pilot
open LookupCachePilot
namespace SourceCache868Pilot
theorem checked_119716_70 : validate cache_119716_70 119716 =
    some 119786 := by
  decide +kernel

theorem checked : validate cache 119716 = some 119786 := checked_119716_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 119716 119786 checked
  omega

theorem within_body : 119786 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 119716 119786 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 119716 119786 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 119716 119786 address = observedPair address :=
  cachedPair_eq cache 119716 119786 checked address

end SourceCache868Pilot
open LookupCachePilot
namespace SourceCache869Pilot
theorem checked_119786_195 : validate cache_119786_195 119786 =
    some 119981 := by
  decide +kernel

theorem checked : validate cache 119786 = some 119981 := checked_119786_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 119786 119981 checked
  omega

theorem within_body : 119981 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 119786 119981 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 119786 119981 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 119786 119981 address = observedPair address :=
  cachedPair_eq cache 119786 119981 checked address

end SourceCache869Pilot
open LookupCachePilot
namespace SourceCache870Pilot
theorem checked_119981_70 : validate cache_119981_70 119981 =
    some 120051 := by
  decide +kernel

theorem checked : validate cache 119981 = some 120051 := checked_119981_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 119981 120051 checked
  omega

theorem within_body : 120051 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 119981 120051 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 119981 120051 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 119981 120051 address = observedPair address :=
  cachedPair_eq cache 119981 120051 checked address

end SourceCache870Pilot
open LookupCachePilot
namespace SourceCache871Pilot
theorem checked_120051_200 : validate cache_120051_200 120051 =
    some 120251 := by
  decide +kernel
theorem checked_120251_200 : validate cache_120251_200 120251 =
    some 120451 := by
  decide +kernel
theorem checked_120051_400 : validate cache_120051_400 120051 =
    some 120451 := by
  exact validate_branch 200 cache_120051_200 cache_120251_200
    120051 120251 120451
    checked_120051_200 rfl checked_120251_200

theorem checked : validate cache 120051 = some 120451 := checked_120051_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 120051 120451 checked
  omega

theorem within_body : 120451 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120051 120451 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120051 120451 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120051 120451 address = observedPair address :=
  cachedPair_eq cache 120051 120451 checked address

end SourceCache871Pilot
open LookupCachePilot
namespace SourceCache872Pilot
theorem checked_120451_5 : validate cache_120451_5 120451 =
    some 120456 := by
  decide +kernel

theorem checked : validate cache 120451 = some 120456 := checked_120451_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 120451 120456 checked
  omega

theorem within_body : 120456 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120451 120456 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120451 120456 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120451 120456 address = observedPair address :=
  cachedPair_eq cache 120451 120456 checked address

end SourceCache872Pilot
open LookupCachePilot
namespace SourceCache873Pilot
theorem checked_120456_70 : validate cache_120456_70 120456 =
    some 120526 := by
  decide +kernel

theorem checked : validate cache 120456 = some 120526 := checked_120456_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 120456 120526 checked
  omega

theorem within_body : 120526 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120456 120526 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120456 120526 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120456 120526 address = observedPair address :=
  cachedPair_eq cache 120456 120526 checked address

end SourceCache873Pilot
open LookupCachePilot
namespace SourceCache874Pilot
theorem checked_120526_185 : validate cache_120526_185 120526 =
    some 120711 := by
  decide +kernel
theorem checked_120711_185 : validate cache_120711_185 120711 =
    some 120896 := by
  decide +kernel
theorem checked_120526_370 : validate cache_120526_370 120526 =
    some 120896 := by
  exact validate_branch 185 cache_120526_185 cache_120711_185
    120526 120711 120896
    checked_120526_185 rfl checked_120711_185

theorem checked : validate cache 120526 = some 120896 := checked_120526_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 120526 120896 checked
  omega

theorem within_body : 120896 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120526 120896 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120526 120896 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120526 120896 address = observedPair address :=
  cachedPair_eq cache 120526 120896 checked address

end SourceCache874Pilot
open LookupCachePilot
namespace SourceCache875Pilot
theorem checked_120896_5 : validate cache_120896_5 120896 =
    some 120901 := by
  decide +kernel

theorem checked : validate cache 120896 = some 120901 := checked_120896_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 120896 120901 checked
  omega

theorem within_body : 120901 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120896 120901 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120896 120901 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120896 120901 address = observedPair address :=
  cachedPair_eq cache 120896 120901 checked address

end SourceCache875Pilot
open LookupCachePilot
namespace SourceCache876Pilot
theorem checked_120901_70 : validate cache_120901_70 120901 =
    some 120971 := by
  decide +kernel

theorem checked : validate cache 120901 = some 120971 := checked_120901_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 120901 120971 checked
  omega

theorem within_body : 120971 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120901 120971 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120901 120971 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120901 120971 address = observedPair address :=
  cachedPair_eq cache 120901 120971 checked address

end SourceCache876Pilot
open LookupCachePilot
namespace SourceCache877Pilot
theorem checked_120971_200 : validate cache_120971_200 120971 =
    some 121171 := by
  decide +kernel
theorem checked_121171_200 : validate cache_121171_200 121171 =
    some 121371 := by
  decide +kernel
theorem checked_120971_400 : validate cache_120971_400 120971 =
    some 121371 := by
  exact validate_branch 200 cache_120971_200 cache_121171_200
    120971 121171 121371
    checked_120971_200 rfl checked_121171_200

theorem checked : validate cache 120971 = some 121371 := checked_120971_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 120971 121371 checked
  omega

theorem within_body : 121371 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 120971 121371 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 120971 121371 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 120971 121371 address = observedPair address :=
  cachedPair_eq cache 120971 121371 checked address

end SourceCache877Pilot
open LookupCachePilot
namespace SourceCache878Pilot
theorem checked_121371_5 : validate cache_121371_5 121371 =
    some 121376 := by
  decide +kernel

theorem checked : validate cache 121371 = some 121376 := checked_121371_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 121371 121376 checked
  omega

theorem within_body : 121376 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121371 121376 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121371 121376 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121371 121376 address = observedPair address :=
  cachedPair_eq cache 121371 121376 checked address

end SourceCache878Pilot
open LookupCachePilot
namespace SourceCache879Pilot
theorem checked_121376_70 : validate cache_121376_70 121376 =
    some 121446 := by
  decide +kernel

theorem checked : validate cache 121376 = some 121446 := checked_121376_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 121376 121446 checked
  omega

theorem within_body : 121446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121376 121446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121376 121446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121376 121446 address = observedPair address :=
  cachedPair_eq cache 121376 121446 checked address

end SourceCache879Pilot
open LookupCachePilot
namespace SourceCache880Pilot
theorem checked_121446_185 : validate cache_121446_185 121446 =
    some 121631 := by
  decide +kernel
theorem checked_121631_185 : validate cache_121631_185 121631 =
    some 121816 := by
  decide +kernel
theorem checked_121446_370 : validate cache_121446_370 121446 =
    some 121816 := by
  exact validate_branch 185 cache_121446_185 cache_121631_185
    121446 121631 121816
    checked_121446_185 rfl checked_121631_185

theorem checked : validate cache 121446 = some 121816 := checked_121446_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 121446 121816 checked
  omega

theorem within_body : 121816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121446 121816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121446 121816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121446 121816 address = observedPair address :=
  cachedPair_eq cache 121446 121816 checked address

end SourceCache880Pilot
open LookupCachePilot
namespace SourceCache881Pilot
theorem checked_121816_5 : validate cache_121816_5 121816 =
    some 121821 := by
  decide +kernel

theorem checked : validate cache 121816 = some 121821 := checked_121816_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 121816 121821 checked
  omega

theorem within_body : 121821 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121816 121821 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121816 121821 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121816 121821 address = observedPair address :=
  cachedPair_eq cache 121816 121821 checked address

end SourceCache881Pilot
open LookupCachePilot
namespace SourceCache882Pilot
theorem checked_121821_70 : validate cache_121821_70 121821 =
    some 121891 := by
  decide +kernel

theorem checked : validate cache 121821 = some 121891 := checked_121821_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 121821 121891 checked
  omega

theorem within_body : 121891 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121821 121891 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121821 121891 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121821 121891 address = observedPair address :=
  cachedPair_eq cache 121821 121891 checked address

end SourceCache882Pilot
open LookupCachePilot
namespace SourceCache883Pilot
theorem checked_121891_200 : validate cache_121891_200 121891 =
    some 122091 := by
  decide +kernel
theorem checked_122091_200 : validate cache_122091_200 122091 =
    some 122291 := by
  decide +kernel
theorem checked_121891_400 : validate cache_121891_400 121891 =
    some 122291 := by
  exact validate_branch 200 cache_121891_200 cache_122091_200
    121891 122091 122291
    checked_121891_200 rfl checked_122091_200

theorem checked : validate cache 121891 = some 122291 := checked_121891_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 121891 122291 checked
  omega

theorem within_body : 122291 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 121891 122291 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 121891 122291 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 121891 122291 address = observedPair address :=
  cachedPair_eq cache 121891 122291 checked address

end SourceCache883Pilot
open LookupCachePilot
namespace SourceCache884Pilot
theorem checked_122291_5 : validate cache_122291_5 122291 =
    some 122296 := by
  decide +kernel

theorem checked : validate cache 122291 = some 122296 := checked_122291_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 122291 122296 checked
  omega

theorem within_body : 122296 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122291 122296 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122291 122296 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122291 122296 address = observedPair address :=
  cachedPair_eq cache 122291 122296 checked address

end SourceCache884Pilot
open LookupCachePilot
namespace SourceCache885Pilot
theorem checked_122296_70 : validate cache_122296_70 122296 =
    some 122366 := by
  decide +kernel

theorem checked : validate cache 122296 = some 122366 := checked_122296_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 122296 122366 checked
  omega

theorem within_body : 122366 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122296 122366 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122296 122366 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122296 122366 address = observedPair address :=
  cachedPair_eq cache 122296 122366 checked address

end SourceCache885Pilot
open LookupCachePilot
namespace SourceCache886Pilot
theorem checked_122366_152 : validate cache_122366_152 122366 =
    some 122518 := by
  decide +kernel
theorem checked_122518_153 : validate cache_122518_153 122518 =
    some 122671 := by
  decide +kernel
theorem checked_122366_305 : validate cache_122366_305 122366 =
    some 122671 := by
  exact validate_branch 152 cache_122366_152 cache_122518_153
    122366 122518 122671
    checked_122366_152 rfl checked_122518_153

theorem checked : validate cache 122366 = some 122671 := checked_122366_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 122366 122671 checked
  omega

theorem within_body : 122671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122366 122671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122366 122671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122366 122671 address = observedPair address :=
  cachedPair_eq cache 122366 122671 checked address

end SourceCache886Pilot
open LookupCachePilot
namespace SourceCache887Pilot
theorem checked_122671_70 : validate cache_122671_70 122671 =
    some 122741 := by
  decide +kernel

theorem checked : validate cache 122671 = some 122741 := checked_122671_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 122671 122741 checked
  omega

theorem within_body : 122741 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122671 122741 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122671 122741 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122671 122741 address = observedPair address :=
  cachedPair_eq cache 122671 122741 checked address

end SourceCache887Pilot
open LookupCachePilot
namespace SourceCache888Pilot
theorem checked_122741_5 : validate cache_122741_5 122741 =
    some 122746 := by
  decide +kernel

theorem checked : validate cache 122741 = some 122746 := checked_122741_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 122741 122746 checked
  omega

theorem within_body : 122746 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122741 122746 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122741 122746 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122741 122746 address = observedPair address :=
  cachedPair_eq cache 122741 122746 checked address

end SourceCache888Pilot
open LookupCachePilot
namespace SourceCache889Pilot
theorem checked_122746_70 : validate cache_122746_70 122746 =
    some 122816 := by
  decide +kernel

theorem checked : validate cache 122746 = some 122816 := checked_122746_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 122746 122816 checked
  omega

theorem within_body : 122816 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122746 122816 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122746 122816 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122746 122816 address = observedPair address :=
  cachedPair_eq cache 122746 122816 checked address

end SourceCache889Pilot
open LookupCachePilot
namespace SourceCache890Pilot
theorem checked_122816_132 : validate cache_122816_132 122816 =
    some 122948 := by
  decide +kernel
theorem checked_122948_133 : validate cache_122948_133 122948 =
    some 123081 := by
  decide +kernel
theorem checked_122816_265 : validate cache_122816_265 122816 =
    some 123081 := by
  exact validate_branch 132 cache_122816_132 cache_122948_133
    122816 122948 123081
    checked_122816_132 rfl checked_122948_133

theorem checked : validate cache 122816 = some 123081 := checked_122816_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 122816 123081 checked
  omega

theorem within_body : 123081 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 122816 123081 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 122816 123081 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 122816 123081 address = observedPair address :=
  cachedPair_eq cache 122816 123081 checked address

end SourceCache890Pilot
open LookupCachePilot
namespace SourceCache891Pilot
theorem checked_123081_5 : validate cache_123081_5 123081 =
    some 123086 := by
  decide +kernel

theorem checked : validate cache 123081 = some 123086 := checked_123081_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 123081 123086 checked
  omega

theorem within_body : 123086 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123081 123086 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123081 123086 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123081 123086 address = observedPair address :=
  cachedPair_eq cache 123081 123086 checked address

end SourceCache891Pilot
open LookupCachePilot
namespace SourceCache892Pilot
theorem checked_123086_10 : validate cache_123086_10 123086 =
    some 123096 := by
  decide +kernel

theorem checked : validate cache 123086 = some 123096 := checked_123086_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 123086 123096 checked
  omega

theorem within_body : 123096 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123086 123096 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123086 123096 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123086 123096 address = observedPair address :=
  cachedPair_eq cache 123086 123096 checked address

end SourceCache892Pilot
open LookupCachePilot
namespace SourceCache893Pilot
theorem checked_123096_220 : validate cache_123096_220 123096 =
    some 123316 := by
  decide +kernel

theorem checked : validate cache 123096 = some 123316 := checked_123096_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 123096 123316 checked
  omega

theorem within_body : 123316 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123096 123316 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123096 123316 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123096 123316 address = observedPair address :=
  cachedPair_eq cache 123096 123316 checked address

end SourceCache893Pilot
open LookupCachePilot
namespace SourceCache894Pilot
theorem checked_123316_152 : validate cache_123316_152 123316 =
    some 123468 := by
  decide +kernel
theorem checked_123468_153 : validate cache_123468_153 123468 =
    some 123621 := by
  decide +kernel
theorem checked_123316_305 : validate cache_123316_305 123316 =
    some 123621 := by
  exact validate_branch 152 cache_123316_152 cache_123468_153
    123316 123468 123621
    checked_123316_152 rfl checked_123468_153

theorem checked : validate cache 123316 = some 123621 := checked_123316_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 123316 123621 checked
  omega

theorem within_body : 123621 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123316 123621 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123316 123621 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123316 123621 address = observedPair address :=
  cachedPair_eq cache 123316 123621 checked address

end SourceCache894Pilot
open LookupCachePilot
namespace SourceCache895Pilot
theorem checked_123621_70 : validate cache_123621_70 123621 =
    some 123691 := by
  decide +kernel

theorem checked : validate cache 123621 = some 123691 := checked_123621_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 123621 123691 checked
  omega

theorem within_body : 123691 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123621 123691 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123621 123691 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123621 123691 address = observedPair address :=
  cachedPair_eq cache 123621 123691 checked address

end SourceCache895Pilot
open LookupCachePilot
namespace SourceCache896Pilot
theorem checked_123691_195 : validate cache_123691_195 123691 =
    some 123886 := by
  decide +kernel

theorem checked : validate cache 123691 = some 123886 := checked_123691_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 123691 123886 checked
  omega

theorem within_body : 123886 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123691 123886 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123691 123886 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123691 123886 address = observedPair address :=
  cachedPair_eq cache 123691 123886 checked address

end SourceCache896Pilot
open LookupCachePilot
namespace SourceCache897Pilot
theorem checked_123886_70 : validate cache_123886_70 123886 =
    some 123956 := by
  decide +kernel

theorem checked : validate cache 123886 = some 123956 := checked_123886_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 123886 123956 checked
  omega

theorem within_body : 123956 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123886 123956 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123886 123956 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123886 123956 address = observedPair address :=
  cachedPair_eq cache 123886 123956 checked address

end SourceCache897Pilot
open LookupCachePilot
namespace SourceCache898Pilot
theorem checked_123956_132 : validate cache_123956_132 123956 =
    some 124088 := by
  decide +kernel
theorem checked_124088_133 : validate cache_124088_133 124088 =
    some 124221 := by
  decide +kernel
theorem checked_123956_265 : validate cache_123956_265 123956 =
    some 124221 := by
  exact validate_branch 132 cache_123956_132 cache_124088_133
    123956 124088 124221
    checked_123956_132 rfl checked_124088_133

theorem checked : validate cache 123956 = some 124221 := checked_123956_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 123956 124221 checked
  omega

theorem within_body : 124221 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 123956 124221 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 123956 124221 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 123956 124221 address = observedPair address :=
  cachedPair_eq cache 123956 124221 checked address

end SourceCache898Pilot
open LookupCachePilot
namespace SourceCache899Pilot
theorem checked_124221_220 : validate cache_124221_220 124221 =
    some 124441 := by
  decide +kernel

theorem checked : validate cache 124221 = some 124441 := checked_124221_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 124221 124441 checked
  omega

theorem within_body : 124441 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124221 124441 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124221 124441 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124221 124441 address = observedPair address :=
  cachedPair_eq cache 124221 124441 checked address

end SourceCache899Pilot
open LookupCachePilot
namespace SourceCache900Pilot
theorem checked_124441_5 : validate cache_124441_5 124441 =
    some 124446 := by
  decide +kernel

theorem checked : validate cache 124441 = some 124446 := checked_124441_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 124441 124446 checked
  omega

theorem within_body : 124446 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124441 124446 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124441 124446 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124441 124446 address = observedPair address :=
  cachedPair_eq cache 124441 124446 checked address

end SourceCache900Pilot
open LookupCachePilot
namespace SourceCache901Pilot
theorem checked_124446_70 : validate cache_124446_70 124446 =
    some 124516 := by
  decide +kernel

theorem checked : validate cache 124446 = some 124516 := checked_124446_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 124446 124516 checked
  omega

theorem within_body : 124516 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124446 124516 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124446 124516 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124446 124516 address = observedPair address :=
  cachedPair_eq cache 124446 124516 checked address

end SourceCache901Pilot
open LookupCachePilot
namespace SourceCache902Pilot
theorem checked_124516_132 : validate cache_124516_132 124516 =
    some 124648 := by
  decide +kernel
theorem checked_124648_133 : validate cache_124648_133 124648 =
    some 124781 := by
  decide +kernel
theorem checked_124516_265 : validate cache_124516_265 124516 =
    some 124781 := by
  exact validate_branch 132 cache_124516_132 cache_124648_133
    124516 124648 124781
    checked_124516_132 rfl checked_124648_133

theorem checked : validate cache 124516 = some 124781 := checked_124516_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 124516 124781 checked
  omega

theorem within_body : 124781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124516 124781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124516 124781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124516 124781 address = observedPair address :=
  cachedPair_eq cache 124516 124781 checked address

end SourceCache902Pilot
open LookupCachePilot
namespace SourceCache903Pilot
theorem checked_124781_5 : validate cache_124781_5 124781 =
    some 124786 := by
  decide +kernel

theorem checked : validate cache 124781 = some 124786 := checked_124781_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 124781 124786 checked
  omega

theorem within_body : 124786 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124781 124786 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124781 124786 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124781 124786 address = observedPair address :=
  cachedPair_eq cache 124781 124786 checked address

end SourceCache903Pilot
open LookupCachePilot
namespace SourceCache904Pilot
theorem checked_124786_10 : validate cache_124786_10 124786 =
    some 124796 := by
  decide +kernel

theorem checked : validate cache 124786 = some 124796 := checked_124786_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 124786 124796 checked
  omega

theorem within_body : 124796 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124786 124796 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124786 124796 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124786 124796 address = observedPair address :=
  cachedPair_eq cache 124786 124796 checked address

end SourceCache904Pilot
open LookupCachePilot
namespace SourceCache905Pilot
theorem checked_124796_185 : validate cache_124796_185 124796 =
    some 124981 := by
  decide +kernel
theorem checked_124981_185 : validate cache_124981_185 124981 =
    some 125166 := by
  decide +kernel
theorem checked_124796_370 : validate cache_124796_370 124796 =
    some 125166 := by
  exact validate_branch 185 cache_124796_185 cache_124981_185
    124796 124981 125166
    checked_124796_185 rfl checked_124981_185

theorem checked : validate cache 124796 = some 125166 := checked_124796_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 124796 125166 checked
  omega

theorem within_body : 125166 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 124796 125166 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 124796 125166 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 124796 125166 address = observedPair address :=
  cachedPair_eq cache 124796 125166 checked address

end SourceCache905Pilot
open LookupCachePilot
namespace SourceCache906Pilot
theorem checked_125166_220 : validate cache_125166_220 125166 =
    some 125386 := by
  decide +kernel
theorem checked_125386_220 : validate cache_125386_220 125386 =
    some 125606 := by
  decide +kernel
theorem checked_125166_440 : validate cache_125166_440 125166 =
    some 125606 := by
  exact validate_branch 220 cache_125166_220 cache_125386_220
    125166 125386 125606
    checked_125166_220 rfl checked_125386_220

theorem checked : validate cache 125166 = some 125606 := checked_125166_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 125166 125606 checked
  omega

theorem within_body : 125606 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 125166 125606 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 125166 125606 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 125166 125606 address = observedPair address :=
  cachedPair_eq cache 125166 125606 checked address

end SourceCache906Pilot
open LookupCachePilot
namespace SourceCache907Pilot
theorem checked_125606_70 : validate cache_125606_70 125606 =
    some 125676 := by
  decide +kernel

theorem checked : validate cache 125606 = some 125676 := checked_125606_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 125606 125676 checked
  omega

theorem within_body : 125676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 125606 125676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 125606 125676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 125606 125676 address = observedPair address :=
  cachedPair_eq cache 125606 125676 checked address

end SourceCache907Pilot
open LookupCachePilot
namespace SourceCache908Pilot
theorem checked_125676_195 : validate cache_125676_195 125676 =
    some 125871 := by
  decide +kernel

theorem checked : validate cache 125676 = some 125871 := checked_125676_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 125676 125871 checked
  omega

theorem within_body : 125871 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 125676 125871 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 125676 125871 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 125676 125871 address = observedPair address :=
  cachedPair_eq cache 125676 125871 checked address

end SourceCache908Pilot
open LookupCachePilot
namespace SourceCache909Pilot
theorem checked_125871_70 : validate cache_125871_70 125871 =
    some 125941 := by
  decide +kernel

theorem checked : validate cache 125871 = some 125941 := checked_125871_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 125871 125941 checked
  omega

theorem within_body : 125941 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 125871 125941 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 125871 125941 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 125871 125941 address = observedPair address :=
  cachedPair_eq cache 125871 125941 checked address

end SourceCache909Pilot
open LookupCachePilot
namespace SourceCache910Pilot
theorem checked_125941_200 : validate cache_125941_200 125941 =
    some 126141 := by
  decide +kernel
theorem checked_126141_200 : validate cache_126141_200 126141 =
    some 126341 := by
  decide +kernel
theorem checked_125941_400 : validate cache_125941_400 125941 =
    some 126341 := by
  exact validate_branch 200 cache_125941_200 cache_126141_200
    125941 126141 126341
    checked_125941_200 rfl checked_126141_200

theorem checked : validate cache 125941 = some 126341 := checked_125941_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 125941 126341 checked
  omega

theorem within_body : 126341 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 125941 126341 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 125941 126341 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 125941 126341 address = observedPair address :=
  cachedPair_eq cache 125941 126341 checked address

end SourceCache910Pilot
open LookupCachePilot
namespace SourceCache911Pilot
theorem checked_126341_5 : validate cache_126341_5 126341 =
    some 126346 := by
  decide +kernel

theorem checked : validate cache 126341 = some 126346 := checked_126341_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 126341 126346 checked
  omega

theorem within_body : 126346 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126341 126346 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126341 126346 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126341 126346 address = observedPair address :=
  cachedPair_eq cache 126341 126346 checked address

end SourceCache911Pilot
open LookupCachePilot
namespace SourceCache912Pilot
theorem checked_126346_70 : validate cache_126346_70 126346 =
    some 126416 := by
  decide +kernel

theorem checked : validate cache 126346 = some 126416 := checked_126346_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 126346 126416 checked
  omega

theorem within_body : 126416 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126346 126416 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126346 126416 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126346 126416 address = observedPair address :=
  cachedPair_eq cache 126346 126416 checked address

end SourceCache912Pilot
open LookupCachePilot
namespace SourceCache913Pilot
theorem checked_126416_185 : validate cache_126416_185 126416 =
    some 126601 := by
  decide +kernel
theorem checked_126601_185 : validate cache_126601_185 126601 =
    some 126786 := by
  decide +kernel
theorem checked_126416_370 : validate cache_126416_370 126416 =
    some 126786 := by
  exact validate_branch 185 cache_126416_185 cache_126601_185
    126416 126601 126786
    checked_126416_185 rfl checked_126601_185

theorem checked : validate cache 126416 = some 126786 := checked_126416_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 126416 126786 checked
  omega

theorem within_body : 126786 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126416 126786 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126416 126786 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126416 126786 address = observedPair address :=
  cachedPair_eq cache 126416 126786 checked address

end SourceCache913Pilot
open LookupCachePilot
namespace SourceCache914Pilot
theorem checked_126786_5 : validate cache_126786_5 126786 =
    some 126791 := by
  decide +kernel

theorem checked : validate cache 126786 = some 126791 := checked_126786_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 126786 126791 checked
  omega

theorem within_body : 126791 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126786 126791 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126786 126791 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126786 126791 address = observedPair address :=
  cachedPair_eq cache 126786 126791 checked address

end SourceCache914Pilot
open LookupCachePilot
namespace SourceCache915Pilot
theorem checked_126791_70 : validate cache_126791_70 126791 =
    some 126861 := by
  decide +kernel

theorem checked : validate cache 126791 = some 126861 := checked_126791_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 126791 126861 checked
  omega

theorem within_body : 126861 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126791 126861 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126791 126861 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126791 126861 address = observedPair address :=
  cachedPair_eq cache 126791 126861 checked address

end SourceCache915Pilot
open LookupCachePilot
namespace SourceCache916Pilot
theorem checked_126861_200 : validate cache_126861_200 126861 =
    some 127061 := by
  decide +kernel
theorem checked_127061_200 : validate cache_127061_200 127061 =
    some 127261 := by
  decide +kernel
theorem checked_126861_400 : validate cache_126861_400 126861 =
    some 127261 := by
  exact validate_branch 200 cache_126861_200 cache_127061_200
    126861 127061 127261
    checked_126861_200 rfl checked_127061_200

theorem checked : validate cache 126861 = some 127261 := checked_126861_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 126861 127261 checked
  omega

theorem within_body : 127261 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 126861 127261 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 126861 127261 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 126861 127261 address = observedPair address :=
  cachedPair_eq cache 126861 127261 checked address

end SourceCache916Pilot
open LookupCachePilot
namespace SourceCache917Pilot
theorem checked_127261_5 : validate cache_127261_5 127261 =
    some 127266 := by
  decide +kernel

theorem checked : validate cache 127261 = some 127266 := checked_127261_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 127261 127266 checked
  omega

theorem within_body : 127266 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127261 127266 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127261 127266 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127261 127266 address = observedPair address :=
  cachedPair_eq cache 127261 127266 checked address

end SourceCache917Pilot
open LookupCachePilot
namespace SourceCache918Pilot
theorem checked_127266_70 : validate cache_127266_70 127266 =
    some 127336 := by
  decide +kernel

theorem checked : validate cache 127266 = some 127336 := checked_127266_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 127266 127336 checked
  omega

theorem within_body : 127336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127266 127336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127266 127336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127266 127336 address = observedPair address :=
  cachedPair_eq cache 127266 127336 checked address

end SourceCache918Pilot
open LookupCachePilot
namespace SourceCache919Pilot
theorem checked_127336_185 : validate cache_127336_185 127336 =
    some 127521 := by
  decide +kernel
theorem checked_127521_185 : validate cache_127521_185 127521 =
    some 127706 := by
  decide +kernel
theorem checked_127336_370 : validate cache_127336_370 127336 =
    some 127706 := by
  exact validate_branch 185 cache_127336_185 cache_127521_185
    127336 127521 127706
    checked_127336_185 rfl checked_127521_185

theorem checked : validate cache 127336 = some 127706 := checked_127336_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 127336 127706 checked
  omega

theorem within_body : 127706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127336 127706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127336 127706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127336 127706 address = observedPair address :=
  cachedPair_eq cache 127336 127706 checked address

end SourceCache919Pilot
open LookupCachePilot
namespace SourceCache920Pilot
theorem checked_127706_5 : validate cache_127706_5 127706 =
    some 127711 := by
  decide +kernel

theorem checked : validate cache 127706 = some 127711 := checked_127706_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 127706 127711 checked
  omega

theorem within_body : 127711 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127706 127711 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127706 127711 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127706 127711 address = observedPair address :=
  cachedPair_eq cache 127706 127711 checked address

end SourceCache920Pilot
open LookupCachePilot
namespace SourceCache921Pilot
theorem checked_127711_70 : validate cache_127711_70 127711 =
    some 127781 := by
  decide +kernel

theorem checked : validate cache 127711 = some 127781 := checked_127711_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 127711 127781 checked
  omega

theorem within_body : 127781 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127711 127781 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127711 127781 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127711 127781 address = observedPair address :=
  cachedPair_eq cache 127711 127781 checked address

end SourceCache921Pilot
open LookupCachePilot
namespace SourceCache922Pilot
theorem checked_127781_200 : validate cache_127781_200 127781 =
    some 127981 := by
  decide +kernel
theorem checked_127981_200 : validate cache_127981_200 127981 =
    some 128181 := by
  decide +kernel
theorem checked_127781_400 : validate cache_127781_400 127781 =
    some 128181 := by
  exact validate_branch 200 cache_127781_200 cache_127981_200
    127781 127981 128181
    checked_127781_200 rfl checked_127981_200

theorem checked : validate cache 127781 = some 128181 := checked_127781_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 127781 128181 checked
  omega

theorem within_body : 128181 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 127781 128181 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 127781 128181 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 127781 128181 address = observedPair address :=
  cachedPair_eq cache 127781 128181 checked address

end SourceCache922Pilot
open LookupCachePilot
namespace SourceCache923Pilot
theorem checked_128181_5 : validate cache_128181_5 128181 =
    some 128186 := by
  decide +kernel

theorem checked : validate cache 128181 = some 128186 := checked_128181_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 128181 128186 checked
  omega

theorem within_body : 128186 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128181 128186 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128181 128186 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128181 128186 address = observedPair address :=
  cachedPair_eq cache 128181 128186 checked address

end SourceCache923Pilot
open LookupCachePilot
namespace SourceCache924Pilot
theorem checked_128186_70 : validate cache_128186_70 128186 =
    some 128256 := by
  decide +kernel

theorem checked : validate cache 128186 = some 128256 := checked_128186_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 128186 128256 checked
  omega

theorem within_body : 128256 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128186 128256 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128186 128256 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128186 128256 address = observedPair address :=
  cachedPair_eq cache 128186 128256 checked address

end SourceCache924Pilot
open LookupCachePilot
namespace SourceCache925Pilot
theorem checked_128256_152 : validate cache_128256_152 128256 =
    some 128408 := by
  decide +kernel
theorem checked_128408_153 : validate cache_128408_153 128408 =
    some 128561 := by
  decide +kernel
theorem checked_128256_305 : validate cache_128256_305 128256 =
    some 128561 := by
  exact validate_branch 152 cache_128256_152 cache_128408_153
    128256 128408 128561
    checked_128256_152 rfl checked_128408_153

theorem checked : validate cache 128256 = some 128561 := checked_128256_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 128256 128561 checked
  omega

theorem within_body : 128561 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128256 128561 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128256 128561 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128256 128561 address = observedPair address :=
  cachedPair_eq cache 128256 128561 checked address

end SourceCache925Pilot
open LookupCachePilot
namespace SourceCache926Pilot
theorem checked_128561_70 : validate cache_128561_70 128561 =
    some 128631 := by
  decide +kernel

theorem checked : validate cache 128561 = some 128631 := checked_128561_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 128561 128631 checked
  omega

theorem within_body : 128631 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128561 128631 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128561 128631 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128561 128631 address = observedPair address :=
  cachedPair_eq cache 128561 128631 checked address

end SourceCache926Pilot
open LookupCachePilot
namespace SourceCache927Pilot
theorem checked_128631_5 : validate cache_128631_5 128631 =
    some 128636 := by
  decide +kernel

theorem checked : validate cache 128631 = some 128636 := checked_128631_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 128631 128636 checked
  omega

theorem within_body : 128636 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128631 128636 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128631 128636 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128631 128636 address = observedPair address :=
  cachedPair_eq cache 128631 128636 checked address

end SourceCache927Pilot
open LookupCachePilot
namespace SourceCache928Pilot
theorem checked_128636_70 : validate cache_128636_70 128636 =
    some 128706 := by
  decide +kernel

theorem checked : validate cache 128636 = some 128706 := checked_128636_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 128636 128706 checked
  omega

theorem within_body : 128706 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128636 128706 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128636 128706 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128636 128706 address = observedPair address :=
  cachedPair_eq cache 128636 128706 checked address

end SourceCache928Pilot
open LookupCachePilot
namespace SourceCache929Pilot
theorem checked_128706_132 : validate cache_128706_132 128706 =
    some 128838 := by
  decide +kernel
theorem checked_128838_133 : validate cache_128838_133 128838 =
    some 128971 := by
  decide +kernel
theorem checked_128706_265 : validate cache_128706_265 128706 =
    some 128971 := by
  exact validate_branch 132 cache_128706_132 cache_128838_133
    128706 128838 128971
    checked_128706_132 rfl checked_128838_133

theorem checked : validate cache 128706 = some 128971 := checked_128706_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 128706 128971 checked
  omega

theorem within_body : 128971 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128706 128971 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128706 128971 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128706 128971 address = observedPair address :=
  cachedPair_eq cache 128706 128971 checked address

end SourceCache929Pilot
open LookupCachePilot
namespace SourceCache930Pilot
theorem checked_128971_5 : validate cache_128971_5 128971 =
    some 128976 := by
  decide +kernel

theorem checked : validate cache 128971 = some 128976 := checked_128971_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 128971 128976 checked
  omega

theorem within_body : 128976 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128971 128976 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128971 128976 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128971 128976 address = observedPair address :=
  cachedPair_eq cache 128971 128976 checked address

end SourceCache930Pilot
open LookupCachePilot
namespace SourceCache931Pilot
theorem checked_128976_10 : validate cache_128976_10 128976 =
    some 128986 := by
  decide +kernel

theorem checked : validate cache 128976 = some 128986 := checked_128976_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 128976 128986 checked
  omega

theorem within_body : 128986 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128976 128986 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128976 128986 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128976 128986 address = observedPair address :=
  cachedPair_eq cache 128976 128986 checked address

end SourceCache931Pilot
open LookupCachePilot
namespace SourceCache932Pilot
theorem checked_128986_220 : validate cache_128986_220 128986 =
    some 129206 := by
  decide +kernel

theorem checked : validate cache 128986 = some 129206 := checked_128986_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 128986 129206 checked
  omega

theorem within_body : 129206 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 128986 129206 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 128986 129206 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 128986 129206 address = observedPair address :=
  cachedPair_eq cache 128986 129206 checked address

end SourceCache932Pilot
open LookupCachePilot
namespace SourceCache933Pilot
theorem checked_129206_152 : validate cache_129206_152 129206 =
    some 129358 := by
  decide +kernel
theorem checked_129358_153 : validate cache_129358_153 129358 =
    some 129511 := by
  decide +kernel
theorem checked_129206_305 : validate cache_129206_305 129206 =
    some 129511 := by
  exact validate_branch 152 cache_129206_152 cache_129358_153
    129206 129358 129511
    checked_129206_152 rfl checked_129358_153

theorem checked : validate cache 129206 = some 129511 := checked_129206_305

theorem count_exact : cache.count = 305 := by
  have extent := validate_extent cache 129206 129511 checked
  omega

theorem within_body : 129511 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 129206 129511 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 129206 129511 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 129206 129511 address = observedPair address :=
  cachedPair_eq cache 129206 129511 checked address

end SourceCache933Pilot
open LookupCachePilot
namespace SourceCache934Pilot
theorem checked_129511_70 : validate cache_129511_70 129511 =
    some 129581 := by
  decide +kernel

theorem checked : validate cache 129511 = some 129581 := checked_129511_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 129511 129581 checked
  omega

theorem within_body : 129581 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 129511 129581 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 129511 129581 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 129511 129581 address = observedPair address :=
  cachedPair_eq cache 129511 129581 checked address

end SourceCache934Pilot
open LookupCachePilot
namespace SourceCache935Pilot
theorem checked_129581_195 : validate cache_129581_195 129581 =
    some 129776 := by
  decide +kernel

theorem checked : validate cache 129581 = some 129776 := checked_129581_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 129581 129776 checked
  omega

theorem within_body : 129776 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 129581 129776 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 129581 129776 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 129581 129776 address = observedPair address :=
  cachedPair_eq cache 129581 129776 checked address

end SourceCache935Pilot
open LookupCachePilot
namespace SourceCache936Pilot
theorem checked_129776_70 : validate cache_129776_70 129776 =
    some 129846 := by
  decide +kernel

theorem checked : validate cache 129776 = some 129846 := checked_129776_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 129776 129846 checked
  omega

theorem within_body : 129846 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 129776 129846 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 129776 129846 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 129776 129846 address = observedPair address :=
  cachedPair_eq cache 129776 129846 checked address

end SourceCache936Pilot
open LookupCachePilot
namespace SourceCache937Pilot
theorem checked_129846_132 : validate cache_129846_132 129846 =
    some 129978 := by
  decide +kernel
theorem checked_129978_133 : validate cache_129978_133 129978 =
    some 130111 := by
  decide +kernel
theorem checked_129846_265 : validate cache_129846_265 129846 =
    some 130111 := by
  exact validate_branch 132 cache_129846_132 cache_129978_133
    129846 129978 130111
    checked_129846_132 rfl checked_129978_133

theorem checked : validate cache 129846 = some 130111 := checked_129846_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 129846 130111 checked
  omega

theorem within_body : 130111 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 129846 130111 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 129846 130111 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 129846 130111 address = observedPair address :=
  cachedPair_eq cache 129846 130111 checked address

end SourceCache937Pilot
open LookupCachePilot
namespace SourceCache938Pilot
theorem checked_130111_220 : validate cache_130111_220 130111 =
    some 130331 := by
  decide +kernel

theorem checked : validate cache 130111 = some 130331 := checked_130111_220

theorem count_exact : cache.count = 220 := by
  have extent := validate_extent cache 130111 130331 checked
  omega

theorem within_body : 130331 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130111 130331 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130111 130331 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130111 130331 address = observedPair address :=
  cachedPair_eq cache 130111 130331 checked address

end SourceCache938Pilot
open LookupCachePilot
namespace SourceCache939Pilot
theorem checked_130331_5 : validate cache_130331_5 130331 =
    some 130336 := by
  decide +kernel

theorem checked : validate cache 130331 = some 130336 := checked_130331_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 130331 130336 checked
  omega

theorem within_body : 130336 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130331 130336 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130331 130336 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130331 130336 address = observedPair address :=
  cachedPair_eq cache 130331 130336 checked address

end SourceCache939Pilot
open LookupCachePilot
namespace SourceCache940Pilot
theorem checked_130336_70 : validate cache_130336_70 130336 =
    some 130406 := by
  decide +kernel

theorem checked : validate cache 130336 = some 130406 := checked_130336_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 130336 130406 checked
  omega

theorem within_body : 130406 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130336 130406 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130336 130406 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130336 130406 address = observedPair address :=
  cachedPair_eq cache 130336 130406 checked address

end SourceCache940Pilot
namespace ScopeViews009Pilot
noncomputable def fromRaw_832 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache832Pilot.cache 114161 114561)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache832Pilot.cache
    114161 114561 SourceCache832Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_833 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache833Pilot.cache 114561 114566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache833Pilot.cache
    114561 114566 SourceCache833Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_834 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache834Pilot.cache 114566 114636)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache834Pilot.cache
    114566 114636 SourceCache834Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_835 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache835Pilot.cache 114636 115006)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache835Pilot.cache
    114636 115006 SourceCache835Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_836 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache836Pilot.cache 115006 115011)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache836Pilot.cache
    115006 115011 SourceCache836Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_837 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache837Pilot.cache 115011 115081)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache837Pilot.cache
    115011 115081 SourceCache837Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_838 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache838Pilot.cache 115081 115481)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache838Pilot.cache
    115081 115481 SourceCache838Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_839 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache839Pilot.cache 115481 115486)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache839Pilot.cache
    115481 115486 SourceCache839Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_840 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache840Pilot.cache 115486 115556)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache840Pilot.cache
    115486 115556 SourceCache840Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_841 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache841Pilot.cache 115556 115926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache841Pilot.cache
    115556 115926 SourceCache841Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_842 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache842Pilot.cache 115926 115931)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache842Pilot.cache
    115926 115931 SourceCache842Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_843 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache843Pilot.cache 115931 116001)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache843Pilot.cache
    115931 116001 SourceCache843Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_844 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache844Pilot.cache 116001 116401)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache844Pilot.cache
    116001 116401 SourceCache844Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_845 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache845Pilot.cache 116401 116406)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache845Pilot.cache
    116401 116406 SourceCache845Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_846 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache846Pilot.cache 116406 116476)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache846Pilot.cache
    116406 116476 SourceCache846Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_847 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache847Pilot.cache 116476 116781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache847Pilot.cache
    116476 116781 SourceCache847Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_848 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache848Pilot.cache 116781 116851)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache848Pilot.cache
    116781 116851 SourceCache848Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_849 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache849Pilot.cache 116851 116856)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache849Pilot.cache
    116851 116856 SourceCache849Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_850 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache850Pilot.cache 116856 116926)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache850Pilot.cache
    116856 116926 SourceCache850Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_851 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache851Pilot.cache 116926 117191)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache851Pilot.cache
    116926 117191 SourceCache851Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_852 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache852Pilot.cache 117191 117196)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache852Pilot.cache
    117191 117196 SourceCache852Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_853 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache853Pilot.cache 117196 117206)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache853Pilot.cache
    117196 117206 SourceCache853Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_854 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache854Pilot.cache 117206 117426)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache854Pilot.cache
    117206 117426 SourceCache854Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_855 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache855Pilot.cache 117426 117731)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache855Pilot.cache
    117426 117731 SourceCache855Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_856 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache856Pilot.cache 117731 117801)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache856Pilot.cache
    117731 117801 SourceCache856Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_857 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache857Pilot.cache 117801 117996)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache857Pilot.cache
    117801 117996 SourceCache857Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_858 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache858Pilot.cache 117996 118066)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache858Pilot.cache
    117996 118066 SourceCache858Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_859 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache859Pilot.cache 118066 118331)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache859Pilot.cache
    118066 118331 SourceCache859Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_860 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache860Pilot.cache 118331 118551)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache860Pilot.cache
    118331 118551 SourceCache860Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_861 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache861Pilot.cache 118551 118556)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache861Pilot.cache
    118551 118556 SourceCache861Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_862 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache862Pilot.cache 118556 118626)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache862Pilot.cache
    118556 118626 SourceCache862Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_863 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache863Pilot.cache 118626 118891)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache863Pilot.cache
    118626 118891 SourceCache863Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_864 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache864Pilot.cache 118891 118896)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache864Pilot.cache
    118891 118896 SourceCache864Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_865 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache865Pilot.cache 118896 118906)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache865Pilot.cache
    118896 118906 SourceCache865Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_866 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache866Pilot.cache 118906 119276)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache866Pilot.cache
    118906 119276 SourceCache866Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_867 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache867Pilot.cache 119276 119716)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache867Pilot.cache
    119276 119716 SourceCache867Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_868 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache868Pilot.cache 119716 119786)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache868Pilot.cache
    119716 119786 SourceCache868Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_869 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache869Pilot.cache 119786 119981)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache869Pilot.cache
    119786 119981 SourceCache869Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_870 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache870Pilot.cache 119981 120051)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache870Pilot.cache
    119981 120051 SourceCache870Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_871 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache871Pilot.cache 120051 120451)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache871Pilot.cache
    120051 120451 SourceCache871Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_872 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache872Pilot.cache 120451 120456)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache872Pilot.cache
    120451 120456 SourceCache872Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_873 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache873Pilot.cache 120456 120526)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache873Pilot.cache
    120456 120526 SourceCache873Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_874 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache874Pilot.cache 120526 120896)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache874Pilot.cache
    120526 120896 SourceCache874Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_875 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache875Pilot.cache 120896 120901)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache875Pilot.cache
    120896 120901 SourceCache875Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_876 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache876Pilot.cache 120901 120971)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache876Pilot.cache
    120901 120971 SourceCache876Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_877 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache877Pilot.cache 120971 121371)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache877Pilot.cache
    120971 121371 SourceCache877Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_878 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache878Pilot.cache 121371 121376)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache878Pilot.cache
    121371 121376 SourceCache878Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_879 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache879Pilot.cache 121376 121446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache879Pilot.cache
    121376 121446 SourceCache879Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_880 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache880Pilot.cache 121446 121816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache880Pilot.cache
    121446 121816 SourceCache880Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_881 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache881Pilot.cache 121816 121821)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache881Pilot.cache
    121816 121821 SourceCache881Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_882 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache882Pilot.cache 121821 121891)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache882Pilot.cache
    121821 121891 SourceCache882Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_883 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache883Pilot.cache 121891 122291)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache883Pilot.cache
    121891 122291 SourceCache883Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_884 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache884Pilot.cache 122291 122296)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache884Pilot.cache
    122291 122296 SourceCache884Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_885 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache885Pilot.cache 122296 122366)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache885Pilot.cache
    122296 122366 SourceCache885Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_886 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache886Pilot.cache 122366 122671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache886Pilot.cache
    122366 122671 SourceCache886Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_887 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache887Pilot.cache 122671 122741)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache887Pilot.cache
    122671 122741 SourceCache887Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_888 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache888Pilot.cache 122741 122746)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache888Pilot.cache
    122741 122746 SourceCache888Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_889 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache889Pilot.cache 122746 122816)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache889Pilot.cache
    122746 122816 SourceCache889Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_890 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache890Pilot.cache 122816 123081)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache890Pilot.cache
    122816 123081 SourceCache890Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_891 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache891Pilot.cache 123081 123086)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache891Pilot.cache
    123081 123086 SourceCache891Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_892 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache892Pilot.cache 123086 123096)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache892Pilot.cache
    123086 123096 SourceCache892Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_893 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache893Pilot.cache 123096 123316)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache893Pilot.cache
    123096 123316 SourceCache893Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_894 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache894Pilot.cache 123316 123621)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache894Pilot.cache
    123316 123621 SourceCache894Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_895 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache895Pilot.cache 123621 123691)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache895Pilot.cache
    123621 123691 SourceCache895Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_896 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache896Pilot.cache 123691 123886)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache896Pilot.cache
    123691 123886 SourceCache896Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_897 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache897Pilot.cache 123886 123956)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache897Pilot.cache
    123886 123956 SourceCache897Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_898 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache898Pilot.cache 123956 124221)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache898Pilot.cache
    123956 124221 SourceCache898Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_899 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache899Pilot.cache 124221 124441)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache899Pilot.cache
    124221 124441 SourceCache899Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_900 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache900Pilot.cache 124441 124446)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache900Pilot.cache
    124441 124446 SourceCache900Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_901 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache901Pilot.cache 124446 124516)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache901Pilot.cache
    124446 124516 SourceCache901Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_902 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache902Pilot.cache 124516 124781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache902Pilot.cache
    124516 124781 SourceCache902Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_903 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache903Pilot.cache 124781 124786)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache903Pilot.cache
    124781 124786 SourceCache903Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_904 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache904Pilot.cache 124786 124796)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache904Pilot.cache
    124786 124796 SourceCache904Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_905 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache905Pilot.cache 124796 125166)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache905Pilot.cache
    124796 125166 SourceCache905Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_906 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache906Pilot.cache 125166 125606)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache906Pilot.cache
    125166 125606 SourceCache906Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_907 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache907Pilot.cache 125606 125676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache907Pilot.cache
    125606 125676 SourceCache907Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_908 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache908Pilot.cache 125676 125871)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache908Pilot.cache
    125676 125871 SourceCache908Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_909 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache909Pilot.cache 125871 125941)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache909Pilot.cache
    125871 125941 SourceCache909Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_910 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache910Pilot.cache 125941 126341)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache910Pilot.cache
    125941 126341 SourceCache910Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_911 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache911Pilot.cache 126341 126346)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache911Pilot.cache
    126341 126346 SourceCache911Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_912 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache912Pilot.cache 126346 126416)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache912Pilot.cache
    126346 126416 SourceCache912Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_913 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache913Pilot.cache 126416 126786)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache913Pilot.cache
    126416 126786 SourceCache913Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_914 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache914Pilot.cache 126786 126791)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache914Pilot.cache
    126786 126791 SourceCache914Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_915 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache915Pilot.cache 126791 126861)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache915Pilot.cache
    126791 126861 SourceCache915Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_916 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache916Pilot.cache 126861 127261)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache916Pilot.cache
    126861 127261 SourceCache916Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_917 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache917Pilot.cache 127261 127266)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache917Pilot.cache
    127261 127266 SourceCache917Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_918 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache918Pilot.cache 127266 127336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache918Pilot.cache
    127266 127336 SourceCache918Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_919 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache919Pilot.cache 127336 127706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache919Pilot.cache
    127336 127706 SourceCache919Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_920 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache920Pilot.cache 127706 127711)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache920Pilot.cache
    127706 127711 SourceCache920Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_921 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache921Pilot.cache 127711 127781)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache921Pilot.cache
    127711 127781 SourceCache921Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_922 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache922Pilot.cache 127781 128181)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache922Pilot.cache
    127781 128181 SourceCache922Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_923 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache923Pilot.cache 128181 128186)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache923Pilot.cache
    128181 128186 SourceCache923Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_924 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache924Pilot.cache 128186 128256)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache924Pilot.cache
    128186 128256 SourceCache924Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_925 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache925Pilot.cache 128256 128561)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache925Pilot.cache
    128256 128561 SourceCache925Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_926 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache926Pilot.cache 128561 128631)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache926Pilot.cache
    128561 128631 SourceCache926Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_927 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache927Pilot.cache 128631 128636)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache927Pilot.cache
    128631 128636 SourceCache927Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_928 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache928Pilot.cache 128636 128706)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache928Pilot.cache
    128636 128706 SourceCache928Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_929 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache929Pilot.cache 128706 128971)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache929Pilot.cache
    128706 128971 SourceCache929Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_930 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache930Pilot.cache 128971 128976)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache930Pilot.cache
    128971 128976 SourceCache930Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_931 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache931Pilot.cache 128976 128986)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache931Pilot.cache
    128976 128986 SourceCache931Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_932 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache932Pilot.cache 128986 129206)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache932Pilot.cache
    128986 129206 SourceCache932Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_933 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache933Pilot.cache 129206 129511)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache933Pilot.cache
    129206 129511 SourceCache933Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_934 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache934Pilot.cache 129511 129581)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache934Pilot.cache
    129511 129581 SourceCache934Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_935 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache935Pilot.cache 129581 129776)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache935Pilot.cache
    129581 129776 SourceCache935Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_936 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache936Pilot.cache 129776 129846)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache936Pilot.cache
    129776 129846 SourceCache936Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_937 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache937Pilot.cache 129846 130111)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache937Pilot.cache
    129846 130111 SourceCache937Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_938 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache938Pilot.cache 130111 130331)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache938Pilot.cache
    130111 130331 SourceCache938Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_939 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache939Pilot.cache 130331 130336)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache939Pilot.cache
    130331 130336 SourceCache939Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_940 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache940Pilot.cache 130336 130406)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache940Pilot.cache
    130336 130406 SourceCache940Pilot.checked q raw nodes returns truth
end ScopeViews009Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
