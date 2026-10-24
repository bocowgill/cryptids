#!/usr/bin/env python3
"""Unwired full-machine assembly proposal; complete-source hypothesis is explicit."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation SourceScopeToolsPilot
namespace FullLinkPilot
set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] FieldTableSeed.bits FieldSeed.bits FieldSelective.bits

abbrev body : BundledMachine 2 := ⟨114487, quotient⟩
abbrev expanded : BundledMachine 2 := SeedLink.link Seed.machine Seed.done body
abbrev linked : BundledMachine 2 := SeedLink.link TableSeed.machine TableSeed.done expanded
abbrev generated : BundledMachine 2 :=
  ReverseInit.Schedule.initialise FieldTableSeed.actions linked

theorem linked_states : linked.states = 136387 := rfl

theorem complete_allocation :
    generated.states = 173642 + 21682 + 1 + 216 + 1 + 114487 := by
  rewrite [ReverseInit.Schedule.initialise_states, linked_states, FieldTableSeed.prefix_states]
  rfl

theorem generated_states : generated.states = 310029 := complete_allocation

def machine : Machine 310029 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem body_correct_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    Init.HaltsOn body.toMachine (Tape.mk₁ FieldSelective.bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (GlobalRowsPilot.body_halts_on sources _).symm.trans FieldSelective.body_halts_input

theorem expanded_correct_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    Init.HaltsOn expanded.toMachine (Tape.mk₁ FieldSeed.bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (SeedLink.link_haltsOn Seed.machine Seed.done body Seed.terminal_done
    _ _ FieldSeed.expander_reaches).trans (body_correct_of_sources sources)

theorem linked_correct_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    Init.HaltsOn linked.toMachine (Tape.mk₁ FieldTableSeed.bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (SeedLink.link_haltsOn TableSeed.machine TableSeed.done expanded TableSeed.terminal_done
    _ _ FieldTableSeed.decoder_reaches).trans (expanded_correct_of_sources sources)

theorem generated_correct_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rewrite [ReverseInit.Schedule.initialise_halts]
  change Init.HaltsOn linked.toMachine
    (Init.executeList (OpenEvolveWide.schedule FieldTableSeed.bits).toList (Tape.mk₁ [])) ↔ _
  rewrite [OpenEvolveWide.schedule_correct]
  exact linked_correct_of_sources sources

-- This is CONDITIONAL, not the final accepted no-extra-hypothesis chess theorem.
theorem machine_correct_of_sources (sources : ∀ q : Fin 4042, SourceRows q) :
    Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans
    (generated_correct_of_sources sources)

end FullLinkPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['body', 'expanded', 'linked', 'generated', 'linked_states', 'complete_allocation',
             'generated_states', 'machine', 'body_correct_of_sources',
             'expanded_correct_of_sources', 'linked_correct_of_sources',
             'generated_correct_of_sources', 'machine_correct_of_sources']
    driver.emit('FullLink.lean', header([module + '.GlobalRows',
                'Cryptids.Chess.Optimisation.FieldTableSeed']) + SOURCE + audit_and_end(
                    driver, 'FullLink', ['FullLinkPilot.' + name for name in names],
                    'Full paid allocation and conditional frozen-decoder linkage checked'))
