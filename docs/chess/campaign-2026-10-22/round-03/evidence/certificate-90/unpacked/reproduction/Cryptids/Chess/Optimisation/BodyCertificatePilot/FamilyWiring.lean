module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache128

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
namespace FamilyWiringPilot
noncomputable def windows : List WorkingViewPilot.Window := [
  ⟨0, 128, LookupCache128Pilot.cache⟩,
  ⟨0, 128, LookupCache128Pilot.cache⟩
]
theorem checked : WorkingViewPilot.checks windows = true :=
  Bool.and_eq_true_iff.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨0, 128, LookupCache128Pilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate LookupCache128Pilot.cache 0 =
          some 128 ∧ 128 ≤ 573802 from
          ⟨LookupCache128Pilot.checked, by decide +kernel⟩)),
    Bool.and_eq_true_iff.mpr ⟨(by
      show WorkingViewPilot.checkWindow
        ⟨0, 128, LookupCache128Pilot.cache⟩ = true
      simpa only [WorkingViewPilot.checkWindow, Bool.and_eq_true,
        decide_eq_true_eq] using
        (show LookupCachePilot.validate LookupCache128Pilot.cache 0 =
          some 128 ∧ 128 ≤ 573802 from
          ⟨LookupCache128Pilot.checked, by decide +kernel⟩)),
    rfl⟩⟩
theorem fidelity : ∀ w ∈ windows, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows checked
theorem world_exact : WorkingViewPilot.world windows = LookupWorldPilot.actualWorld :=
  WorkingViewPilot.world_correct windows checked
end FamilyWiringPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Compact family proof wiring checked before large batch preparation"
