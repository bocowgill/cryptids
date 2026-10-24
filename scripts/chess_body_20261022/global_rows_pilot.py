#!/usr/bin/env python3
"""Unwired remote-only assembly of every old body row; hypotheses stay explicit."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler SourceScopeToolsPilot NumericLocalPilot
namespace GlobalRowsPilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code

def sharedBounce : Fin 573802 :=
  SelectiveBinary.bounceState (q := 533341) FieldSelectiveLayout.haltReturn

theorem shared_halt_row (bit : Bool) : RowAt haltedMain (Binary.encodeSymbol bit) := by
  change ((SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
      (SelectiveBinary.mainState (CompactPost.encode FieldPacked.getter (none, 0)))
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, classMap next)) = _
  rewrite [SelectiveBinary.compile_main, Binary.decode_encode, post_halted]
  change none = quotient.transition (classMap haltedMain) (Binary.encodeSymbol bit)
  apply packed_injective
  rewrite [expected_word, haltedMain_address]
  cases bit <;> decide +kernel

theorem shared_return_row (bit : Bool) : RowAt sharedBounce (Binary.encodeSymbol bit) := by
  change ((SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
      (SelectiveBinary.bounceState (q := 533341) FieldSelectiveLayout.haltReturn)
      (Binary.encodeSymbol bit)).map (fun (b, d, next) ↦ (b, d, classMap next)) = _
  rewrite [SelectiveBinary.compile_bounce, Option.map_some,
    FieldSelectiveLayout.returnAt_halt (0 : Fin 5)]
  apply packed_injective
  change packedEncode (some (Binary.encodeSymbol bit, Dir.left, classMap haltedMain)) =
    packedEncode (quotient.transition (classMap sharedBounce) (Binary.encodeSymbol bit))
  rewrite [command_word, expected_word, haltedMain_address]
  change commandWord bit .left 1 = rowWord 533341 bit
  cases bit <;> decide +kernel

theorem all_rows_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    LocalCertificate.Rows FieldSelective.body.toMachine quotient classMap := by
  intro state bit
  refine Fin.addCases (fun q ↦ ?_) (fun r ↦ ?_) state
  · rcases BinaryObservationPilot.control_cases FieldPacked.getter q with rfl | ⟨pc, value, rfl⟩
    · change RowAt haltedMain bit
      simpa only [Binary.encode_decode] using shared_halt_row (Binary.decodeSymbol bit)
    · change RowAt (mainIndex pc value) bit
      obtain ⟨⟨label, slot⟩, rfl⟩ := FieldPacked.layout.code.surjective pc
      have row := (sources label).1 slot (Binary.decodeSymbol bit) value
      simpa only [FieldSelectiveLayout.nodeIndex, Binary.encode_decode] using row
  · change RowAt (SelectiveBinary.bounceState (q := 533341) r) bit
    refine Fin.addCases (fun h ↦ ?_) (fun pair ↦ ?_) r
    · have zero : h = 0 := Subsingleton.elim _ _
      subst h
      change RowAt sharedBounce bit
      simpa only [Binary.encode_decode] using shared_return_row (Binary.decodeSymbol bit)
    · obtain ⟨⟨index, value⟩, rfl⟩ := finProdFinEquiv.surjective pair
      obtain ⟨⟨label, rank⟩, rfl⟩ := FieldSelectiveLayout.code.surjective index
      change RowAt (SelectiveBinary.bounceState (q := 533341)
        (FieldSelectiveLayout.liveReturn label rank value)) bit
      simpa only [Binary.encode_decode] using
        (sources label).2 rank (Binary.decodeSymbol bit) value

-- This theorem has an explicit complete-source hypothesis until every source is checked.
theorem body_halts_on (sources : ∀ q : Fin 4042, SourceRows q) (tape : Tape (Fin 2)) :
    Init.HaltsOn FieldSelective.body.toMachine tape ↔ Init.HaltsOn quotient tape := by
  exact (StateTransition.tr_eval_dom
    (LocalCertificate.respects _ _ classMap (all_rows_of_sources sources))
    (show LocalCertificate.decodeCfg classMap (⟨0, tape⟩ : Cfg 573802 2) =
      (⟨0, tape⟩ : Cfg 114487 2) from by
        simp only [LocalCertificate.decodeCfg, entry])).symm

end GlobalRowsPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['sharedBounce', 'shared_halt_row', 'shared_return_row',
             'all_rows_of_sources', 'body_halts_on']
    driver.emit('GlobalRows.lean', header([module + '.SourceScopeTools']) + SOURCE + audit_and_end(
        driver, 'GlobalRows', ['GlobalRowsPilot.' + name for name in names],
        'Shared controls and complete-source to global-row assembly checked'))
