module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupWorld
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open LookupCachePilot LookupWorldPilot
namespace WorkingViewPilot
set_option backward.isDefEq.respectTransparency false

structure Window where
  start : Nat
  finish : Nat
  cache : Balanced.RowTree Cell

noncomputable def checkWindow (w : Window) : Bool :=
  decide (validate w.cache w.start = some w.finish) && decide (w.finish ≤ 573802)

noncomputable def checks (windows : List Window) : Bool := windows.all checkWindow

def Fidelity (w : Window) : Prop :=
  validate w.cache w.start = some w.finish ∧
    w.cache.count = w.finish - w.start ∧ w.finish ≤ 573802 ∧
    (∀ address, cachedClass w.cache w.start w.finish address = mapTree.lookup address 0) ∧
    (∀ address, cachedPair w.cache w.start w.finish address = observedPair address)

theorem window_properties (w : Window) (checked : checkWindow w = true) : Fidelity w := by
  have parts : decide (validate w.cache w.start = some w.finish) = true ∧
      decide (w.finish ≤ 573802) = true := by
    simpa only [checkWindow, Bool.and_eq_true] using checked
  have valid := of_decide_eq_true parts.1
  have extent := validate_extent w.cache w.start w.finish valid
  have exactCount : w.cache.count = w.finish - w.start := by omega
  exact ⟨valid, exactCount, of_decide_eq_true parts.2,
    cachedClass_eq w.cache w.start w.finish valid,
    cachedPair_eq w.cache w.start w.finish valid⟩

theorem all_properties (windows : List Window) (checked : checks windows = true) :
    ∀ w ∈ windows, Fidelity w := by
  intro w member
  have allChecked : windows.all checkWindow = true := checked
  exact window_properties w (List.all_eq_true.mp allChecked w member)

noncomputable def overlay (base : World) (w : Window) : World where
  classAt address := if w.start ≤ address ∧ address < w.finish then
    cachedClass w.cache w.start w.finish address else base.classAt address
  pairAt address := if w.start ≤ address ∧ address < w.finish then
    cachedPair w.cache w.start w.finish address else base.pairAt address

theorem overlay_correct (base : World) (correct : base = actualWorld)
    (w : Window) (checked : checkWindow w = true) : overlay base w = actualWorld := by
  cases correct
  have valid := (window_properties w checked).1
  have classes : (overlay actualWorld w).classAt = actualWorld.classAt := by
    funext address
    change (if w.start ≤ address ∧ address < w.finish then
      cachedClass w.cache w.start w.finish address else mapTree.lookup address 0) =
        mapTree.lookup address 0
    simp only [cachedClass_eq w.cache w.start w.finish valid, ite_self]
  have pairs : (overlay actualWorld w).pairAt = actualWorld.pairAt := by
    funext address
    change (if w.start ≤ address ∧ address < w.finish then
      cachedPair w.cache w.start w.finish address else observedPair address) = observedPair address
    simp only [cachedPair_eq w.cache w.start w.finish valid, ite_self]
  exact congrArg₂ World.mk classes pairs

noncomputable def world : List Window → World
  | [] => actualWorld
  | w :: windows => overlay (world windows) w

theorem world_correct (windows : List Window) (checked : checks windows = true) :
    world windows = actualWorld := by
  induction windows with
  | nil => rfl
  | cons w windows ih =>
    have parts : checkWindow w = true ∧ checks windows = true := by
      simpa only [checks, List.all_cons, Bool.and_eq_true] using checked
    exact overlay_correct (world windows) (ih parts.2) w parts.1

noncomputable def fromRaw (windows : List Window) (checked : checks windows = true)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe (world windows) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw (world windows) (world_correct windows checked)
    q raw nodes returns truth

end WorkingViewPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Universal window-list fidelity and working-set source transport checked"
