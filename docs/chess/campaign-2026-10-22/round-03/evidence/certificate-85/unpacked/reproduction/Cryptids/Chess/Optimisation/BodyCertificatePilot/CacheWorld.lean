module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LookupWorld
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceMainCache0
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceMainCache65536
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceMainCache131072
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceReturnCache

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open LookupCachePilot LookupWorldPilot
namespace CacheWorldPilot
noncomputable def classes (address : Nat) : Nat :=
  if 0 ≤ address ∧ address < 65536 then
    cachedClass SourceMainCache0Pilot.cache 0 65536 address else
  if 65536 ≤ address ∧ address < 131072 then
    cachedClass SourceMainCache65536Pilot.cache 65536 131072 address else
  if 131072 ≤ address ∧ address < 133601 then
    cachedClass SourceMainCache131072Pilot.cache 131072 133601 address else
  if 533341 ≤ address ∧ address < 573802 then
    cachedClass SourceReturnCachePilot.cache 533341 573802 address else
  mapTree.lookup address 0
theorem classes_eq (address : Nat) : classes address = mapTree.lookup address 0 := by
  simp only [classes,
    SourceMainCache0Pilot.all_cached_classes,
    SourceMainCache65536Pilot.all_cached_classes,
    SourceMainCache131072Pilot.all_cached_classes,
    SourceReturnCachePilot.all_cached_classes,
    ite_self]
noncomputable def pairs (address : Nat) : Nat × Nat :=
  if 0 ≤ address ∧ address < 65536 then
    cachedPair SourceMainCache0Pilot.cache 0 65536 address else
  if 65536 ≤ address ∧ address < 131072 then
    cachedPair SourceMainCache65536Pilot.cache 65536 131072 address else
  if 131072 ≤ address ∧ address < 133601 then
    cachedPair SourceMainCache131072Pilot.cache 131072 133601 address else
  if 533341 ≤ address ∧ address < 573802 then
    cachedPair SourceReturnCachePilot.cache 533341 573802 address else
  observedPair address
theorem pairs_eq (address : Nat) : pairs address = observedPair address := by
  simp only [pairs,
    SourceMainCache0Pilot.all_cached_words,
    SourceMainCache65536Pilot.all_cached_words,
    SourceMainCache131072Pilot.all_cached_words,
    SourceReturnCachePilot.all_cached_words,
    ite_self]

noncomputable def cacheWorld : World := ⟨classes, pairs⟩

theorem cacheWorld_correct : cacheWorld = actualWorld := by
  have classFunctions := funext classes_eq
  have pairFunctions := funext pairs_eq
  exact congrArg₂ World.mk classFunctions pairFunctions

noncomputable def fromCachedRaw (q : Fin 4042) (raw : RawLabelPilot.RawOp)
    (nodes returns : Nat) (checked :
      LookupWorldPilot.checkRecipe cacheWorld q raw nodes returns = true) :
    SourceScopeToolsPilot.SourceCertificate :=
  LookupWorldPilot.fromRaw cacheWorld cacheWorld_correct q raw nodes returns checked

end CacheWorldPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Validated cache coefficients yield unchanged source certificates"
