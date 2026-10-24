#!/usr/bin/env python3
"""Remote-only universal local-certificate bridge to every paid binary control."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
namespace BinaryObservationPilot
open ObservedCachePilot
set_option backward.isDefEq.respectTransparency false

variable {n k labels returns target : Nat} [NeZero k] [NeZero labels]

def observe (g : LazyGraph.Graph n k labels)
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (bit : Bool) (result : Result n k) : Option (Fin 2 × Dir × Fin target) :=
  let next := CompactPost.encode g result.1
  match result.2 with
  | .move dir => some (Binary.encodeSymbol bit, dir, rename (SelectiveBinary.mainState next))
  | .write written => (findReturn next).map fun r ↦
      (Binary.encodeSymbol written, .right, rename (SelectiveBinary.bounceState r))

theorem main_observed (g : LazyGraph.Graph n k labels)
    (returnAt : Fin returns → Fin (CompactPost.stateCount n k))
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (bit : Bool) (pc : Fin n) (value : Fin k) :
    ((SelectiveBinary.compile (CompactPost.machine g) returnAt findReturn).transition
      (SelectiveBinary.mainState (CompactPost.encode g (some pc, value)))
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, rename next)) =
      observe g findReturn rename bit (LazyGraph.trAux g bit pc value) := by
  rewrite [SelectiveBinary.compile_main, Binary.decode_encode]
  simp only [CompactPost.machine, CompactPost.decode_encode, Option.map_some]
  rcases LazyGraph.trAux g bit pc value with ⟨descriptor, command⟩
  cases command with
  | move dir => rfl
  | write written => simp only [Option.bind_some, Option.map_map]; rfl

theorem halt_observed (g : LazyGraph.Graph n k labels)
    (returnAt : Fin returns → Fin (CompactPost.stateCount n k))
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target) (bit : Fin 2) :
    ((SelectiveBinary.compile (CompactPost.machine g) returnAt findReturn).transition
      (SelectiveBinary.mainState (CompactPost.encode g (none, 0))) bit).map
        (fun (b, d, next) ↦ (b, d, rename next)) = none := by
  rewrite [SelectiveBinary.compile_main]
  simp only [CompactPost.machine, CompactPost.decode_encode, Option.map_none,
    Option.bind_none]

theorem return_observed (g : LazyGraph.Graph n k labels)
    (returnAt : Fin returns → Fin (CompactPost.stateCount n k))
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (r : Fin returns) (bit : Fin 2) :
    ((SelectiveBinary.compile (CompactPost.machine g) returnAt findReturn).transition
      (SelectiveBinary.bounceState r) bit).map (fun (b, d, next) ↦ (b, d, rename next)) =
        some (bit, .left, rename (SelectiveBinary.mainState (returnAt r))) := by
  rewrite [SelectiveBinary.compile_bounce]
  rfl

theorem raw_control_cases (q : Fin (CompactPost.stateCount n k)) :
    q = CompactPost.rawEncode (none, (0 : Fin k)) ∨
      ∃ pc value, q = CompactPost.rawEncode (some pc, value) := by
  refine Fin.addCases (fun h ↦ ?_) (fun pair ↦ ?_) q
  · have zero : h = 0 := Subsingleton.elim _ _
    subst h
    exact Or.inl rfl
  · obtain ⟨⟨pc, value⟩, rfl⟩ := finProdFinEquiv.surjective pair
    exact Or.inr ⟨pc, value, rfl⟩

theorem control_cases (g : LazyGraph.Graph n k labels)
    (q : Fin (CompactPost.stateCount n k)) :
    q = CompactPost.encode g (none, (0 : Fin k)) ∨
      ∃ pc value, q = CompactPost.encode g (some pc, value) := by
  have swap_twice : ∀ s, CompactPost.permutation g (CompactPost.permutation g s) = s := by
    intro s
    exact Equiv.swap_apply_self _ _ s
  rcases raw_control_cases (CompactPost.permutation g q) with halted | ⟨pc, value, live⟩
  · exact Or.inl ((swap_twice q).symm.trans
      (congrArg (CompactPost.permutation g) halted))
  · exact Or.inr ⟨pc, value, (swap_twice q).symm.trans
      (congrArg (CompactPost.permutation g) live)⟩

def expected (g : LazyGraph.Graph n k labels)
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (quotient : Machine target 2) (bit : Bool) (pc : Fin n) (value : Fin k) :
    Option (Fin 2 × Dir × Fin target) :=
  quotient.transition (rename
    (SelectiveBinary.mainState (CompactPost.encode g (some pc, value))))
    (Binary.encodeSymbol bit)

theorem main_from_local (g : LazyGraph.Graph n k labels)
    (returnAt : Fin returns → Fin (CompactPost.stateCount n k))
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (quotient : Machine target 2)
    (checked : ∀ bit pc value, expected g rename quotient bit pc value =
      observedStep g.entry (observe g findReturn rename) (expected g rename quotient)
        bit (g.node pc) value)
    (bit : Bool) (pc : Fin n) (value : Fin k) :
    ((SelectiveBinary.compile (CompactPost.machine g) returnAt findReturn).transition
      (SelectiveBinary.mainState (CompactPost.encode g (some pc, value)))
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, rename next)) =
      quotient.transition (rename
        (SelectiveBinary.mainState (CompactPost.encode g (some pc, value))))
        (Binary.encodeSymbol bit) := by
  exact (main_observed g returnAt findReturn rename bit pc value).trans
    (observed_cache_sound g (observe g findReturn rename) (expected g rename quotient)
      checked bit pc value).symm

theorem all_rows_from_local (g : LazyGraph.Graph n k labels)
    (returnAt : Fin returns → Fin (CompactPost.stateCount n k))
    (findReturn : Fin (CompactPost.stateCount n k) → Option (Fin returns))
    (rename : Fin (CompactPost.stateCount n k + returns) → Fin target)
    (quotient : Machine target 2)
    (checked : ∀ bit pc value, expected g rename quotient bit pc value =
      observedStep g.entry (observe g findReturn rename) (expected g rename quotient)
        bit (g.node pc) value)
    (halted : ∀ bit, quotient.transition
      (rename (SelectiveBinary.mainState (CompactPost.encode g (none, 0)))) bit = none)
    (returned : ∀ r bit, quotient.transition (rename (SelectiveBinary.bounceState r)) bit =
      some (bit, .left, rename (SelectiveBinary.mainState (returnAt r)))) :
    LocalCertificate.Rows (SelectiveBinary.compile (CompactPost.machine g) returnAt findReturn)
      quotient rename := by
  intro state bit
  refine Fin.addCases (fun q ↦ ?_) (fun r ↦ ?_) state
  · rcases control_cases g q with rfl | ⟨pc, value, rfl⟩
    · exact (halt_observed g returnAt findReturn rename bit).trans (halted bit).symm
    · have row := main_from_local g returnAt findReturn rename quotient checked
        (Binary.decodeSymbol bit) pc value
      simpa only [Binary.encode_decode] using row
  · exact (return_observed g returnAt findReturn rename r bit).trans (returned r bit).symm

end BinaryObservationPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['observe', 'main_observed', 'halt_observed', 'return_observed',
             'raw_control_cases', 'control_cases', 'expected', 'main_from_local',
             'all_rows_from_local']
    driver.emit('BinaryObservation.lean', header([
        module + '.ObservedCache', 'Cryptids.Optimisation.CompactPost',
        'Cryptids.Optimisation.SelectiveBinary']) + SOURCE + audit_and_end(
            driver, 'BinaryObservation', ['BinaryObservationPilot.' + name for name in names],
            'Local equations cover every paid binary control'))
