module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache128

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation LookupCachePilot WorkingViewPilot
namespace FamilyConstructorsPilot
set_option backward.isDefEq.respectTransparency false

theorem window_checked (start finish : Nat) (cache : Balanced.RowTree Cell)
    (valid : validate cache start = some finish) (bound : finish ≤ 573802) :
    checkWindow ⟨start, finish, cache⟩ = true := by
  have parts : validate cache start = some finish ∧ finish ≤ 573802 := ⟨valid, bound⟩
  simpa only [checkWindow, Bool.and_eq_true, decide_eq_true_eq] using parts

theorem cons_checked (w : Window) (windows : List Window)
    (head : checkWindow w = true) (tail : checks windows = true) :
    checks (w :: windows) = true := by
  have parts : checkWindow w = true ∧ checks windows = true := ⟨head, tail⟩
  simpa only [checks, List.all_cons, Bool.and_eq_true] using parts

end FamilyConstructorsPilot
namespace FamilyWiringPilot
noncomputable def windows : List WorkingViewPilot.Window := [
  ⟨0, 128, LookupCache128Pilot.cache⟩,
  ⟨0, 128, LookupCache128Pilot.cache⟩
]
theorem checked : WorkingViewPilot.checks windows = true :=
  FamilyConstructorsPilot.cons_checked
    ⟨0, 128, LookupCache128Pilot.cache⟩
    (⟨0, 128, LookupCache128Pilot.cache⟩ ::
      [])
    (FamilyConstructorsPilot.window_checked
      0 128 LookupCache128Pilot.cache
      LookupCache128Pilot.checked (by decide +kernel))
    (FamilyConstructorsPilot.cons_checked
    ⟨0, 128, LookupCache128Pilot.cache⟩
    ([])
    (FamilyConstructorsPilot.window_checked
      0 128 LookupCache128Pilot.cache
      LookupCache128Pilot.checked (by decide +kernel))
    (rfl))
theorem fidelity : ∀ w ∈ windows, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows checked
theorem world_exact : WorkingViewPilot.world windows = LookupWorldPilot.actualWorld :=
  WorkingViewPilot.world_correct windows checked
end FamilyWiringPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Compact family proof wiring checked before large batch preparation"
