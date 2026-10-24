module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupWorld
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceReturnCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open LookupCachePilot LookupWorldPilot
namespace LocalViewPilot
set_option backward.isDefEq.respectTransparency false

noncomputable def world (main : Balanced.RowTree Cell) (start finish : Nat) : World where
  classAt address := if start ≤ address ∧ address < finish then
    cachedClass main start finish address else
    cachedClass SourceReturnCachePilot.cache 533341 573802 address
  pairAt address := if start ≤ address ∧ address < finish then
    cachedPair main start finish address else
    cachedPair SourceReturnCachePilot.cache 533341 573802 address

theorem world_correct (main : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate main start = some finish) : world main start finish = actualWorld := by
  have classes : (world main start finish).classAt = actualWorld.classAt := by
    funext address
    change (if start ≤ address ∧ address < finish then cachedClass main start finish address
      else cachedClass SourceReturnCachePilot.cache 533341 573802 address) =
        mapTree.lookup address 0
    simp only [cachedClass_eq main start finish checked,
      SourceReturnCachePilot.all_cached_classes, ite_self]
  have pairs : (world main start finish).pairAt = actualWorld.pairAt := by
    funext address
    change (if start ≤ address ∧ address < finish then cachedPair main start finish address
      else cachedPair SourceReturnCachePilot.cache 533341 573802 address) = observedPair address
    simp only [cachedPair_eq main start finish checked,
      SourceReturnCachePilot.all_cached_words, ite_self]
  exact congrArg₂ World.mk classes pairs

noncomputable def fromLocalRaw (main : Balanced.RowTree Cell) (start finish : Nat)
    (checked : validate main start = some finish) (q : Fin 4042)
    (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (truth : LookupWorldPilot.checkRecipe (world main start finish) q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw (world main start finish) (world_correct main start finish checked)
    q raw nodes returns truth

end LocalViewPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Operation-local views globally preserve original lookup coefficients"
