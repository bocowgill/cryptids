/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Optimisation.OpenEvolve

open ConjectureMachines
open Chess.Optimisation.OpenEvolve

-- Universal equality of the table-side constructor and the actual paid blank machine.
example : rowMachine = machine := rowMachine_eq
example : terminal.val = 1 := terminal_index
example : generated.states = 392046821 := generated_states
example : Halts rowMachine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss) := by
  rw [rowMachine_eq]
  exact halts_iff

-- Bounds and offsets used by the fixed row artifact; not an enumeration substitute.
example : 3110360 + 194468231 + 1 = 197578592 := by decide
example : 3110360 + 1 = 3110361 := by decide
example : 3110360 + 388936461 = 392046821 := by decide
