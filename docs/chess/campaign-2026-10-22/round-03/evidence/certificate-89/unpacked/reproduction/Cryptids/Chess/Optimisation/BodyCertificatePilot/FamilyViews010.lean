module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyViews010Data
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.FamilyReturns

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open LookupCachePilot
namespace Family941MainPilot
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
theorem checked : validate cache 130406 = some 130671 :=
  checked_130406_265
end Family941MainPilot
open LookupCachePilot
namespace Family942MainPilot
theorem checked_130671_5 : validate cache_130671_5 130671 =
    some 130676 := by
  decide +kernel
theorem checked : validate cache 130671 = some 130676 :=
  checked_130671_5
end Family942MainPilot
open LookupCachePilot
namespace Family943MainPilot
theorem checked_130676_10 : validate cache_130676_10 130676 =
    some 130686 := by
  decide +kernel
theorem checked : validate cache 130676 = some 130686 :=
  checked_130676_10
end Family943MainPilot
open LookupCachePilot
namespace Family944MainPilot
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
theorem checked : validate cache 130686 = some 131056 :=
  checked_130686_370
end Family944MainPilot
open LookupCachePilot
namespace Family945MainPilot
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
theorem checked : validate cache 131056 = some 131496 :=
  checked_131056_440
end Family945MainPilot
open LookupCachePilot
namespace Family946MainPilot
theorem checked_131496_70 : validate cache_131496_70 131496 =
    some 131566 := by
  decide +kernel
theorem checked : validate cache 131496 = some 131566 :=
  checked_131496_70
end Family946MainPilot
open LookupCachePilot
namespace Family947MainPilot
theorem checked_131566_195 : validate cache_131566_195 131566 =
    some 131761 := by
  decide +kernel
theorem checked : validate cache 131566 = some 131761 :=
  checked_131566_195
end Family947MainPilot
open LookupCachePilot
namespace Family948MainPilot
theorem checked_131761_70 : validate cache_131761_70 131761 =
    some 131831 := by
  decide +kernel
theorem checked : validate cache 131761 = some 131831 :=
  checked_131761_70
end Family948MainPilot
open LookupCachePilot
namespace Family949MainPilot
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
theorem checked : validate cache 131831 = some 132231 :=
  checked_131831_400
end Family949MainPilot
open LookupCachePilot
namespace Family950MainPilot
theorem checked_132231_5 : validate cache_132231_5 132231 =
    some 132236 := by
  decide +kernel
theorem checked : validate cache 132231 = some 132236 :=
  checked_132231_5
end Family950MainPilot
open LookupCachePilot
namespace Family951MainPilot
theorem checked_132236_70 : validate cache_132236_70 132236 =
    some 132306 := by
  decide +kernel
theorem checked : validate cache 132236 = some 132306 :=
  checked_132236_70
end Family951MainPilot
open LookupCachePilot
namespace Family952MainPilot
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
theorem checked : validate cache 132306 = some 132676 :=
  checked_132306_370
end Family952MainPilot
open LookupCachePilot
namespace Family953MainPilot
theorem checked_132676_5 : validate cache_132676_5 132676 =
    some 132681 := by
  decide +kernel
theorem checked : validate cache 132676 = some 132681 :=
  checked_132676_5
end Family953MainPilot
open LookupCachePilot
namespace Family954MainPilot
theorem checked_132681_70 : validate cache_132681_70 132681 =
    some 132751 := by
  decide +kernel
theorem checked : validate cache 132681 = some 132751 :=
  checked_132681_70
end Family954MainPilot
open LookupCachePilot
namespace Family955MainPilot
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
theorem checked : validate cache 132751 = some 133151 :=
  checked_132751_400
end Family955MainPilot
open LookupCachePilot
namespace Family956MainPilot
theorem checked_133151_5 : validate cache_133151_5 133151 =
    some 133156 := by
  decide +kernel
theorem checked : validate cache 133151 = some 133156 :=
  checked_133151_5
end Family956MainPilot
open LookupCachePilot
namespace Family957MainPilot
theorem checked_133156_70 : validate cache_133156_70 133156 =
    some 133226 := by
  decide +kernel
theorem checked : validate cache 133156 = some 133226 :=
  checked_133156_70
end Family957MainPilot
open LookupCachePilot
namespace Family958MainPilot
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
theorem checked : validate cache 133226 = some 133596 :=
  checked_133226_370
end Family958MainPilot
open LookupCachePilot
namespace Family959MainPilot
theorem checked_133596_5 : validate cache_133596_5 133596 =
    some 133601 := by
  decide +kernel
theorem checked : validate cache 133596 = some 133601 :=
  checked_133596_5
end Family959MainPilot
namespace FamilyViews010Pilot
noncomputable def windows_941 : List WorkingViewPilot.Window := [
  ⟨130406, 130671, Family941MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_941 : WorkingViewPilot.checks windows_941 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨130406, 130671, Family941MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family941MainPilot.cache 130406 =
          some 130671 ∧ 130671 ≤ 573802 from
          ⟨Family941MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_941 : ∀ w ∈ windows_941, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_941 checked_941
noncomputable def fromRaw_941 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_941) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_941 checked_941 q raw nodes returns truth
noncomputable def windows_942 : List WorkingViewPilot.Window := [
  ⟨130671, 130676, Family942MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_942 : WorkingViewPilot.checks windows_942 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨130671, 130676, Family942MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family942MainPilot.cache 130671 =
          some 130676 ∧ 130676 ≤ 573802 from
          ⟨Family942MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_942 : ∀ w ∈ windows_942, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_942 checked_942
noncomputable def fromRaw_942 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_942) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_942 checked_942 q raw nodes returns truth
noncomputable def windows_943 : List WorkingViewPilot.Window := [
  ⟨130676, 130686, Family943MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_943 : WorkingViewPilot.checks windows_943 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨130676, 130686, Family943MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family943MainPilot.cache 130676 =
          some 130686 ∧ 130686 ≤ 573802 from
          ⟨Family943MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_943 : ∀ w ∈ windows_943, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_943 checked_943
noncomputable def fromRaw_943 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_943) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_943 checked_943 q raw nodes returns truth
noncomputable def windows_944 : List WorkingViewPilot.Window := [
  ⟨130686, 131056, Family944MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_944 : WorkingViewPilot.checks windows_944 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨130686, 131056, Family944MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family944MainPilot.cache 130686 =
          some 131056 ∧ 131056 ≤ 573802 from
          ⟨Family944MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_944 : ∀ w ∈ windows_944, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_944 checked_944
noncomputable def fromRaw_944 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_944) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_944 checked_944 q raw nodes returns truth
noncomputable def windows_945 : List WorkingViewPilot.Window := [
  ⟨131056, 131496, Family945MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_945 : WorkingViewPilot.checks windows_945 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨131056, 131496, Family945MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family945MainPilot.cache 131056 =
          some 131496 ∧ 131496 ≤ 573802 from
          ⟨Family945MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_945 : ∀ w ∈ windows_945, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_945 checked_945
noncomputable def fromRaw_945 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_945) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_945 checked_945 q raw nodes returns truth
noncomputable def windows_946 : List WorkingViewPilot.Window := [
  ⟨131496, 131566, Family946MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_946 : WorkingViewPilot.checks windows_946 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨131496, 131566, Family946MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family946MainPilot.cache 131496 =
          some 131566 ∧ 131566 ≤ 573802 from
          ⟨Family946MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_946 : ∀ w ∈ windows_946, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_946 checked_946
noncomputable def fromRaw_946 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_946) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_946 checked_946 q raw nodes returns truth
noncomputable def windows_947 : List WorkingViewPilot.Window := [
  ⟨131566, 131761, Family947MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_947 : WorkingViewPilot.checks windows_947 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨131566, 131761, Family947MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family947MainPilot.cache 131566 =
          some 131761 ∧ 131761 ≤ 573802 from
          ⟨Family947MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_947 : ∀ w ∈ windows_947, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_947 checked_947
noncomputable def fromRaw_947 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_947) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_947 checked_947 q raw nodes returns truth
noncomputable def windows_948 : List WorkingViewPilot.Window := [
  ⟨131761, 131831, Family948MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_948 : WorkingViewPilot.checks windows_948 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨131761, 131831, Family948MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family948MainPilot.cache 131761 =
          some 131831 ∧ 131831 ≤ 573802 from
          ⟨Family948MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_948 : ∀ w ∈ windows_948, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_948 checked_948
noncomputable def fromRaw_948 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_948) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_948 checked_948 q raw nodes returns truth
noncomputable def windows_949 : List WorkingViewPilot.Window := [
  ⟨131831, 132231, Family949MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_949 : WorkingViewPilot.checks windows_949 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨131831, 132231, Family949MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family949MainPilot.cache 131831 =
          some 132231 ∧ 132231 ≤ 573802 from
          ⟨Family949MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_949 : ∀ w ∈ windows_949, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_949 checked_949
noncomputable def fromRaw_949 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_949) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_949 checked_949 q raw nodes returns truth
noncomputable def windows_950 : List WorkingViewPilot.Window := [
  ⟨132231, 132236, Family950MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_950 : WorkingViewPilot.checks windows_950 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132231, 132236, Family950MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family950MainPilot.cache 132231 =
          some 132236 ∧ 132236 ≤ 573802 from
          ⟨Family950MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_950 : ∀ w ∈ windows_950, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_950 checked_950
noncomputable def fromRaw_950 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_950) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_950 checked_950 q raw nodes returns truth
noncomputable def windows_951 : List WorkingViewPilot.Window := [
  ⟨132236, 132306, Family951MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_951 : WorkingViewPilot.checks windows_951 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132236, 132306, Family951MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family951MainPilot.cache 132236 =
          some 132306 ∧ 132306 ≤ 573802 from
          ⟨Family951MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_951 : ∀ w ∈ windows_951, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_951 checked_951
noncomputable def fromRaw_951 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_951) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_951 checked_951 q raw nodes returns truth
noncomputable def windows_952 : List WorkingViewPilot.Window := [
  ⟨132306, 132676, Family952MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_952 : WorkingViewPilot.checks windows_952 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132306, 132676, Family952MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family952MainPilot.cache 132306 =
          some 132676 ∧ 132676 ≤ 573802 from
          ⟨Family952MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_952 : ∀ w ∈ windows_952, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_952 checked_952
noncomputable def fromRaw_952 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_952) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_952 checked_952 q raw nodes returns truth
noncomputable def windows_953 : List WorkingViewPilot.Window := [
  ⟨132676, 132681, Family953MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_953 : WorkingViewPilot.checks windows_953 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132676, 132681, Family953MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family953MainPilot.cache 132676 =
          some 132681 ∧ 132681 ≤ 573802 from
          ⟨Family953MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_953 : ∀ w ∈ windows_953, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_953 checked_953
noncomputable def fromRaw_953 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_953) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_953 checked_953 q raw nodes returns truth
noncomputable def windows_954 : List WorkingViewPilot.Window := [
  ⟨132681, 132751, Family954MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_954 : WorkingViewPilot.checks windows_954 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132681, 132751, Family954MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family954MainPilot.cache 132681 =
          some 132751 ∧ 132751 ≤ 573802 from
          ⟨Family954MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_954 : ∀ w ∈ windows_954, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_954 checked_954
noncomputable def fromRaw_954 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_954) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_954 checked_954 q raw nodes returns truth
noncomputable def windows_955 : List WorkingViewPilot.Window := [
  ⟨132751, 133151, Family955MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_955 : WorkingViewPilot.checks windows_955 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨132751, 133151, Family955MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family955MainPilot.cache 132751 =
          some 133151 ∧ 133151 ≤ 573802 from
          ⟨Family955MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_955 : ∀ w ∈ windows_955, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_955 checked_955
noncomputable def fromRaw_955 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_955) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_955 checked_955 q raw nodes returns truth
noncomputable def windows_956 : List WorkingViewPilot.Window := [
  ⟨133151, 133156, Family956MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_956 : WorkingViewPilot.checks windows_956 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨133151, 133156, Family956MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family956MainPilot.cache 133151 =
          some 133156 ∧ 133156 ≤ 573802 from
          ⟨Family956MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_956 : ∀ w ∈ windows_956, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_956 checked_956
noncomputable def fromRaw_956 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_956) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_956 checked_956 q raw nodes returns truth
noncomputable def windows_957 : List WorkingViewPilot.Window := [
  ⟨133156, 133226, Family957MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_957 : WorkingViewPilot.checks windows_957 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨133156, 133226, Family957MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family957MainPilot.cache 133156 =
          some 133226 ∧ 133226 ≤ 573802 from
          ⟨Family957MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_957 : ∀ w ∈ windows_957, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_957 checked_957
noncomputable def fromRaw_957 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_957) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_957 checked_957 q raw nodes returns truth
noncomputable def windows_958 : List WorkingViewPilot.Window := [
  ⟨133226, 133596, Family958MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_958 : WorkingViewPilot.checks windows_958 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨133226, 133596, Family958MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family958MainPilot.cache 133226 =
          some 133596 ∧ 133596 ≤ 573802 from
          ⟨Family958MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_958 : ∀ w ∈ windows_958, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_958 checked_958
noncomputable def fromRaw_958 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_958) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_958 checked_958 q raw nodes returns truth
noncomputable def windows_959 : List WorkingViewPilot.Window := [
  ⟨133596, 133601, Family959MainPilot.cache⟩,
  ⟨533341, 573802, FamilyReturnsPilot.cache⟩
]
theorem checked_959 : WorkingViewPilot.checks windows_959 = true :=
  Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨133596, 133601, Family959MainPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate Family959MainPilot.cache 133596 =
          some 133601 ∧ 133601 ≤ 573802 from
          ⟨Family959MainPilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨533341, 573802, FamilyReturnsPilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate FamilyReturnsPilot.cache 533341 =
          some 573802 ∧ 573802 ≤ 573802 from
          ⟨FamilyReturnsPilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity_959 : ∀ w ∈ windows_959, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_959 checked_959
noncomputable def fromRaw_959 (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe
      (WorkingViewPilot.world windows_959) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  WorkingViewPilot.fromRaw windows_959 checked_959 q raw nodes returns truth
end FamilyViews010Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Quantified working-set batch fidelity checked"
