/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.TableSeed.Correct
public import Cryptids.Compilation.TableSeed.ChessCodec
public import Cryptids.Chess.Optimisation.FieldSeed

/-! # Complete chess with a paid structured table packet

The writer installs the complete structured packet. Its verified decoder reconstructs the
exact accepted seed, then the retained expander, bridge and selective body execute unchanged.
Every writer, decoder, bridge and body control belongs to the complete allocation.
-/

@[expose] public section
namespace Chess.Optimisation.FieldTableSeed

open Turing StateTransition Relation ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] Compilation.Input.bits FieldAware.bits FieldPacked.bits
  FieldSelective.bits

def bits : Array (Fin 2) := TableSeed.ChessCodec.bits

theorem bits_size : bits.size = 173641 := TableSeed.ChessCodec.bits_size

/-- The table decoder and its bridge precede the complete accepted expander and body. -/
abbrev linked : BundledMachine 2 :=
  SeedLink.link TableSeed.machine TableSeed.done FieldSeed.linked

theorem linked_states : linked.states = 595702 := by
  change 21682 + 1 + FieldSeed.linked.states = 595702
  rw [FieldSeed.linked_states]

/-- The actual universal decoder reaches exactly the accepted seed tape and head. -/
theorem decoder_reaches :
    Reaches (step TableSeed.machine) ⟨0, Tape.mk₁ bits.toList⟩
      ⟨TableSeed.done, Tape.mk₁ FieldSeed.bits.toList⟩ := by
  have result := TableSeed.Correct.packet_reaches TableSeed.ChessCodec.pre
    TableSeed.ChessCodec.rows TableSeed.ChessCodec.post
  change Reaches (step TableSeed.machine)
    ⟨0, Tape.mk₁ (TableSeed.packet TableSeed.ChessCodec.pre
      TableSeed.ChessCodec.rows TableSeed.ChessCodec.post)⟩
    ⟨TableSeed.done, Tape.mk₁ (Seed.seed TableSeed.ChessCodec.letters)⟩ at result
  rw [TableSeed.ChessCodec.letters_eq] at result
  simpa only [bits, TableSeed.ChessCodec.bits_toList, FieldSeed.bits,
    Seed.ChessCodec.bits_toList] using result

theorem linked_halts_input :
    Init.HaltsOn linked.toMachine (Tape.mk₁ bits.toList) ↔
      ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (SeedLink.link_haltsOn TableSeed.machine TableSeed.done FieldSeed.linked
    TableSeed.terminal_done _ _ decoder_reaches).trans FieldSeed.linked_halts_input

attribute [local irreducible] bits

def actions : Array Init.Instruction := OpenEvolveWide.schedule bits

theorem prefix_states : actions.size = 173642 :=
  Seed.ChessCodec.counted_schedule bits 173641 bits_size

abbrev generated : BundledMachine 2 := ReverseInit.Schedule.initialise actions linked

instance generated_neZero : NeZero generated.states := generated.neZeroStates

theorem generated_states : generated.states = 769344 := by
  rw [ReverseInit.Schedule.initialise_states, linked_states, prefix_states]

/-- The writer turn, both decoders, both bridges and the full field body are all paid. -/
theorem complete_allocation :
    generated.states = 173642 + 21682 + 1 + 216 + 1 + 533341 + 40461 := by
  rw [generated_states]

/-- Ordinary binary control with state zero and an entirely blank starting tape. -/
def machine : Machine 769344 2 :=
  Compilation.Image.castMachine generated_states generated.toMachine

theorem generated_halts : generated.Halts ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) := by
  rw [ReverseInit.Schedule.initialise_halts]
  change Init.HaltsOn linked.toMachine
    (Init.executeList (OpenEvolveWide.schedule bits).toList (Tape.mk₁ [])) ↔ _
  rw [OpenEvolveWide.schedule_correct]
  exact linked_halts_input

theorem halts_iff : Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss) :=
  (Compilation.Image.cast_halts generated_states generated.toMachine).trans generated_halts

theorem equivalent : Halts machine ↔ Halts FieldSeed.machine :=
  halts_iff.trans FieldSeed.halts_iff.symm

theorem saved_states : FieldSeed.generated.states - generated.states = 228832 := by
  rw [FieldSeed.generated_states, generated_states]

theorem strict_reduction : generated.states < FieldSeed.generated.states := by
  rw [generated_states, FieldSeed.generated_states]
  decide

/-- Numeric assembly retains the accepted inner expander and body row specification. -/
def rowLinked : BundledMachine 2 :=
  SeedLink.link TableSeed.machine TableSeed.done FieldSeed.rowLinked

theorem rowLinked_eq : rowLinked = linked := by
  unfold rowLinked linked
  rw [FieldSeed.rowLinked_eq]

theorem rowGenerated_states :
    (ReverseInit.Schedule.initialise actions rowLinked).states = 769344 := by
  rw [rowLinked_eq]
  exact generated_states

/-- Every paid packet, decoder, bridge and body row belongs to the numeric image. -/
def rowMachine : Machine 769344 2 :=
  OpenEvolveWide.numericImage actions rowLinked rowGenerated_states

theorem rowMachine_eq : rowMachine = machine :=
  OpenEvolveWide.numericImage_congr actions rowLinked linked
    rowLinked_eq rowGenerated_states generated_states

end Chess.Optimisation.FieldTableSeed
