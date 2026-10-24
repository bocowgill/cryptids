module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingViews
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WorkingCacheData
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache445
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache476
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ProfileCache356

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
namespace WorkingSetsPilot
noncomputable def windows_445 : List WorkingViewPilot.Window := [
  ⟨34231, 34901, ProfileCache445Pilot.cache⟩,
  ⟨537517, 537597, Working445OwnPilot.cache⟩,
  ⟨537422, 537427, Working445D441Pilot.cache⟩,
  ⟨533341, 533342, Working445HaltPilot.cache⟩
]
theorem checked_445 : WorkingViewPilot.checks windows_445 = true := by
  decide +kernel
theorem fidelity_445 : ∀ w ∈ windows_445, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_445 checked_445
noncomputable def windows_476 : List WorkingViewPilot.Window := [
  ⟨41591, 42261, ProfileCache476Pilot.cache⟩,
  ⟨538047, 538127, Working476OwnPilot.cache⟩,
  ⟨537952, 537957, Working476D472Pilot.cache⟩,
  ⟨533341, 533342, Working476HaltPilot.cache⟩
]
theorem checked_476 : WorkingViewPilot.checks windows_476 = true := by
  decide +kernel
theorem fidelity_476 : ∀ w ∈ windows_476, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_476 checked_476
noncomputable def windows_356 : List WorkingViewPilot.Window := [
  ⟨17231, 17301, ProfileCache356Pilot.cache⟩,
  ⟨536097, 536102, Working356OwnPilot.cache⟩,
  ⟨536092, 536097, Working356D355Pilot.cache⟩,
  ⟨533341, 533342, Working356HaltPilot.cache⟩
]
theorem checked_356 : WorkingViewPilot.checks windows_356 = true := by
  decide +kernel
theorem fidelity_356 : ∀ w ∈ windows_356, WorkingViewPilot.Fidelity w :=
  WorkingViewPilot.all_properties windows_356 checked_356
end WorkingSetsPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "All proposed working-set windows certified as a family"
