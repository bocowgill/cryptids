module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews010Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViews

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace SourceCache941Pilot
theorem checked_130406_132 : validate cache_130406_132 130406 =
    some 130538 := by
  decide +kernel
theorem checked_130538_133 : validate cache_130538_133 130538 =
    some 130671 := by
  decide +kernel
theorem checked_130406_265 : validate cache_130406_265 130406 =
    some 130671 := by
  exact validate_branch 132 cache_130406_132 cache_130538_133
    130406 130538 130671
    checked_130406_132 rfl checked_130538_133

theorem checked : validate cache 130406 = some 130671 := checked_130406_265

theorem count_exact : cache.count = 265 := by
  have extent := validate_extent cache 130406 130671 checked
  omega

theorem within_body : 130671 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130406 130671 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130406 130671 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130406 130671 address = observedPair address :=
  cachedPair_eq cache 130406 130671 checked address

end SourceCache941Pilot
open LookupCachePilot
namespace SourceCache942Pilot
theorem checked_130671_5 : validate cache_130671_5 130671 =
    some 130676 := by
  decide +kernel

theorem checked : validate cache 130671 = some 130676 := checked_130671_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 130671 130676 checked
  omega

theorem within_body : 130676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130671 130676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130671 130676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130671 130676 address = observedPair address :=
  cachedPair_eq cache 130671 130676 checked address

end SourceCache942Pilot
open LookupCachePilot
namespace SourceCache943Pilot
theorem checked_130676_10 : validate cache_130676_10 130676 =
    some 130686 := by
  decide +kernel

theorem checked : validate cache 130676 = some 130686 := checked_130676_10

theorem count_exact : cache.count = 10 := by
  have extent := validate_extent cache 130676 130686 checked
  omega

theorem within_body : 130686 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130676 130686 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130676 130686 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130676 130686 address = observedPair address :=
  cachedPair_eq cache 130676 130686 checked address

end SourceCache943Pilot
open LookupCachePilot
namespace SourceCache944Pilot
theorem checked_130686_185 : validate cache_130686_185 130686 =
    some 130871 := by
  decide +kernel
theorem checked_130871_185 : validate cache_130871_185 130871 =
    some 131056 := by
  decide +kernel
theorem checked_130686_370 : validate cache_130686_370 130686 =
    some 131056 := by
  exact validate_branch 185 cache_130686_185 cache_130871_185
    130686 130871 131056
    checked_130686_185 rfl checked_130871_185

theorem checked : validate cache 130686 = some 131056 := checked_130686_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 130686 131056 checked
  omega

theorem within_body : 131056 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 130686 131056 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 130686 131056 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 130686 131056 address = observedPair address :=
  cachedPair_eq cache 130686 131056 checked address

end SourceCache944Pilot
open LookupCachePilot
namespace SourceCache945Pilot
theorem checked_131056_220 : validate cache_131056_220 131056 =
    some 131276 := by
  decide +kernel
theorem checked_131276_220 : validate cache_131276_220 131276 =
    some 131496 := by
  decide +kernel
theorem checked_131056_440 : validate cache_131056_440 131056 =
    some 131496 := by
  exact validate_branch 220 cache_131056_220 cache_131276_220
    131056 131276 131496
    checked_131056_220 rfl checked_131276_220

theorem checked : validate cache 131056 = some 131496 := checked_131056_440

theorem count_exact : cache.count = 440 := by
  have extent := validate_extent cache 131056 131496 checked
  omega

theorem within_body : 131496 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131056 131496 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131056 131496 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131056 131496 address = observedPair address :=
  cachedPair_eq cache 131056 131496 checked address

end SourceCache945Pilot
open LookupCachePilot
namespace SourceCache946Pilot
theorem checked_131496_70 : validate cache_131496_70 131496 =
    some 131566 := by
  decide +kernel

theorem checked : validate cache 131496 = some 131566 := checked_131496_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 131496 131566 checked
  omega

theorem within_body : 131566 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131496 131566 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131496 131566 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131496 131566 address = observedPair address :=
  cachedPair_eq cache 131496 131566 checked address

end SourceCache946Pilot
open LookupCachePilot
namespace SourceCache947Pilot
theorem checked_131566_195 : validate cache_131566_195 131566 =
    some 131761 := by
  decide +kernel

theorem checked : validate cache 131566 = some 131761 := checked_131566_195

theorem count_exact : cache.count = 195 := by
  have extent := validate_extent cache 131566 131761 checked
  omega

theorem within_body : 131761 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131566 131761 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131566 131761 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131566 131761 address = observedPair address :=
  cachedPair_eq cache 131566 131761 checked address

end SourceCache947Pilot
open LookupCachePilot
namespace SourceCache948Pilot
theorem checked_131761_70 : validate cache_131761_70 131761 =
    some 131831 := by
  decide +kernel

theorem checked : validate cache 131761 = some 131831 := checked_131761_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 131761 131831 checked
  omega

theorem within_body : 131831 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131761 131831 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131761 131831 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131761 131831 address = observedPair address :=
  cachedPair_eq cache 131761 131831 checked address

end SourceCache948Pilot
open LookupCachePilot
namespace SourceCache949Pilot
theorem checked_131831_200 : validate cache_131831_200 131831 =
    some 132031 := by
  decide +kernel
theorem checked_132031_200 : validate cache_132031_200 132031 =
    some 132231 := by
  decide +kernel
theorem checked_131831_400 : validate cache_131831_400 131831 =
    some 132231 := by
  exact validate_branch 200 cache_131831_200 cache_132031_200
    131831 132031 132231
    checked_131831_200 rfl checked_132031_200

theorem checked : validate cache 131831 = some 132231 := checked_131831_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 131831 132231 checked
  omega

theorem within_body : 132231 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 131831 132231 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 131831 132231 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 131831 132231 address = observedPair address :=
  cachedPair_eq cache 131831 132231 checked address

end SourceCache949Pilot
open LookupCachePilot
namespace SourceCache950Pilot
theorem checked_132231_5 : validate cache_132231_5 132231 =
    some 132236 := by
  decide +kernel

theorem checked : validate cache 132231 = some 132236 := checked_132231_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 132231 132236 checked
  omega

theorem within_body : 132236 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132231 132236 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132231 132236 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132231 132236 address = observedPair address :=
  cachedPair_eq cache 132231 132236 checked address

end SourceCache950Pilot
open LookupCachePilot
namespace SourceCache951Pilot
theorem checked_132236_70 : validate cache_132236_70 132236 =
    some 132306 := by
  decide +kernel

theorem checked : validate cache 132236 = some 132306 := checked_132236_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 132236 132306 checked
  omega

theorem within_body : 132306 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132236 132306 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132236 132306 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132236 132306 address = observedPair address :=
  cachedPair_eq cache 132236 132306 checked address

end SourceCache951Pilot
open LookupCachePilot
namespace SourceCache952Pilot
theorem checked_132306_185 : validate cache_132306_185 132306 =
    some 132491 := by
  decide +kernel
theorem checked_132491_185 : validate cache_132491_185 132491 =
    some 132676 := by
  decide +kernel
theorem checked_132306_370 : validate cache_132306_370 132306 =
    some 132676 := by
  exact validate_branch 185 cache_132306_185 cache_132491_185
    132306 132491 132676
    checked_132306_185 rfl checked_132491_185

theorem checked : validate cache 132306 = some 132676 := checked_132306_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 132306 132676 checked
  omega

theorem within_body : 132676 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132306 132676 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132306 132676 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132306 132676 address = observedPair address :=
  cachedPair_eq cache 132306 132676 checked address

end SourceCache952Pilot
open LookupCachePilot
namespace SourceCache953Pilot
theorem checked_132676_5 : validate cache_132676_5 132676 =
    some 132681 := by
  decide +kernel

theorem checked : validate cache 132676 = some 132681 := checked_132676_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 132676 132681 checked
  omega

theorem within_body : 132681 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132676 132681 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132676 132681 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132676 132681 address = observedPair address :=
  cachedPair_eq cache 132676 132681 checked address

end SourceCache953Pilot
open LookupCachePilot
namespace SourceCache954Pilot
theorem checked_132681_70 : validate cache_132681_70 132681 =
    some 132751 := by
  decide +kernel

theorem checked : validate cache 132681 = some 132751 := checked_132681_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 132681 132751 checked
  omega

theorem within_body : 132751 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132681 132751 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132681 132751 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132681 132751 address = observedPair address :=
  cachedPair_eq cache 132681 132751 checked address

end SourceCache954Pilot
open LookupCachePilot
namespace SourceCache955Pilot
theorem checked_132751_200 : validate cache_132751_200 132751 =
    some 132951 := by
  decide +kernel
theorem checked_132951_200 : validate cache_132951_200 132951 =
    some 133151 := by
  decide +kernel
theorem checked_132751_400 : validate cache_132751_400 132751 =
    some 133151 := by
  exact validate_branch 200 cache_132751_200 cache_132951_200
    132751 132951 133151
    checked_132751_200 rfl checked_132951_200

theorem checked : validate cache 132751 = some 133151 := checked_132751_400

theorem count_exact : cache.count = 400 := by
  have extent := validate_extent cache 132751 133151 checked
  omega

theorem within_body : 133151 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 132751 133151 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 132751 133151 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 132751 133151 address = observedPair address :=
  cachedPair_eq cache 132751 133151 checked address

end SourceCache955Pilot
open LookupCachePilot
namespace SourceCache956Pilot
theorem checked_133151_5 : validate cache_133151_5 133151 =
    some 133156 := by
  decide +kernel

theorem checked : validate cache 133151 = some 133156 := checked_133151_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 133151 133156 checked
  omega

theorem within_body : 133156 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 133151 133156 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 133151 133156 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 133151 133156 address = observedPair address :=
  cachedPair_eq cache 133151 133156 checked address

end SourceCache956Pilot
open LookupCachePilot
namespace SourceCache957Pilot
theorem checked_133156_70 : validate cache_133156_70 133156 =
    some 133226 := by
  decide +kernel

theorem checked : validate cache 133156 = some 133226 := checked_133156_70

theorem count_exact : cache.count = 70 := by
  have extent := validate_extent cache 133156 133226 checked
  omega

theorem within_body : 133226 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 133156 133226 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 133156 133226 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 133156 133226 address = observedPair address :=
  cachedPair_eq cache 133156 133226 checked address

end SourceCache957Pilot
open LookupCachePilot
namespace SourceCache958Pilot
theorem checked_133226_185 : validate cache_133226_185 133226 =
    some 133411 := by
  decide +kernel
theorem checked_133411_185 : validate cache_133411_185 133411 =
    some 133596 := by
  decide +kernel
theorem checked_133226_370 : validate cache_133226_370 133226 =
    some 133596 := by
  exact validate_branch 185 cache_133226_185 cache_133411_185
    133226 133411 133596
    checked_133226_185 rfl checked_133411_185

theorem checked : validate cache 133226 = some 133596 := checked_133226_370

theorem count_exact : cache.count = 370 := by
  have extent := validate_extent cache 133226 133596 checked
  omega

theorem within_body : 133596 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 133226 133596 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 133226 133596 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 133226 133596 address = observedPair address :=
  cachedPair_eq cache 133226 133596 checked address

end SourceCache958Pilot
open LookupCachePilot
namespace SourceCache959Pilot
theorem checked_133596_5 : validate cache_133596_5 133596 =
    some 133601 := by
  decide +kernel

theorem checked : validate cache 133596 = some 133601 := checked_133596_5

theorem count_exact : cache.count = 5 := by
  have extent := validate_extent cache 133596 133601 checked
  omega

theorem within_body : 133601 ≤ 573802 := by decide +kernel

theorem all_cached_classes (address : Nat) :
    cachedClass cache 133596 133601 address = mapTree.lookup address 0 :=
  cachedClass_eq cache 133596 133601 checked address

theorem all_cached_words (address : Nat) :
    cachedPair cache 133596 133601 address = observedPair address :=
  cachedPair_eq cache 133596 133601 checked address

end SourceCache959Pilot
namespace ScopeViews010Pilot
noncomputable def fromRaw_941 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache941Pilot.cache 130406 130671)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache941Pilot.cache
    130406 130671 SourceCache941Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_942 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache942Pilot.cache 130671 130676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache942Pilot.cache
    130671 130676 SourceCache942Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_943 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache943Pilot.cache 130676 130686)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache943Pilot.cache
    130676 130686 SourceCache943Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_944 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache944Pilot.cache 130686 131056)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache944Pilot.cache
    130686 131056 SourceCache944Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_945 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache945Pilot.cache 131056 131496)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache945Pilot.cache
    131056 131496 SourceCache945Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_946 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache946Pilot.cache 131496 131566)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache946Pilot.cache
    131496 131566 SourceCache946Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_947 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache947Pilot.cache 131566 131761)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache947Pilot.cache
    131566 131761 SourceCache947Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_948 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache948Pilot.cache 131761 131831)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache948Pilot.cache
    131761 131831 SourceCache948Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_949 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache949Pilot.cache 131831 132231)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache949Pilot.cache
    131831 132231 SourceCache949Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_950 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache950Pilot.cache 132231 132236)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache950Pilot.cache
    132231 132236 SourceCache950Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_951 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache951Pilot.cache 132236 132306)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache951Pilot.cache
    132236 132306 SourceCache951Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_952 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache952Pilot.cache 132306 132676)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache952Pilot.cache
    132306 132676 SourceCache952Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_953 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache953Pilot.cache 132676 132681)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache953Pilot.cache
    132676 132681 SourceCache953Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_954 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache954Pilot.cache 132681 132751)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache954Pilot.cache
    132681 132751 SourceCache954Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_955 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache955Pilot.cache 132751 133151)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache955Pilot.cache
    132751 133151 SourceCache955Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_956 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache956Pilot.cache 133151 133156)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache956Pilot.cache
    133151 133156 SourceCache956Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_957 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache957Pilot.cache 133156 133226)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache957Pilot.cache
    133156 133226 SourceCache957Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_958 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache958Pilot.cache 133226 133596)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache958Pilot.cache
    133226 133596 SourceCache958Pilot.checked q raw nodes returns truth
noncomputable def fromRaw_959 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (LocalViewPilot.world SourceCache959Pilot.cache 133596 133601)
      q raw nodes returns = true) : SourceScopeToolsPilot.SourceCertificate :=
  LocalViewPilot.fromLocalRaw SourceCache959Pilot.cache
    133596 133601 SourceCache959Pilot.checked q raw nodes returns truth
end ScopeViews010Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Batched operation-local cache fidelity checked"
