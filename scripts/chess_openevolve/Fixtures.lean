/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Optimisation.TerminalBinary

open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation.TerminalBinary

private def source (h : Fin 3) : TM0.Machine Bool (Fin 3) := fun i bit ↦
  if i = h then none else
    some (⟨(i.val + 1) % 3, Nat.mod_lt _ (by decide)⟩,
      if bit then .move .left else .write true)

example (h : Fin 3) (input : List Bool) :
    (StateTransition.eval (step (compile h (source h)))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval (source h) input).Dom :=
  halts_input h (source h) (fun _ ↦ by simp [source]) input

-- Edge case: the sole control is terminal, and the return block is empty.
example (input : List Bool) :
    (StateTransition.eval (step (compile (0 : Fin 1) (fun _ _ ↦ none)))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔
      (TM0.eval (fun (_ : Fin 1) (_ : Bool) ↦ none) input).Dom :=
  halts_input 0 (fun _ _ ↦ none) (fun _ ↦ rfl) input

def main : IO Unit := do
  let mut corners := 0
  for terminal in [:3] do
    if hh : terminal < 3 then
      let h : Fin 3 := ⟨terminal, hh⟩
      for state in [:5] do
        if hs : state < 5 then
          let s : Fin 5 := ⟨state, hs⟩
          for symbol in [:2] do
            if ha : symbol < 2 then
              let a : Fin 2 := ⟨symbol, ha⟩
              unless (compile h (source h)).transition s a ==
                  (table h (Binary.compile (source h))).transition s a do
                throw <| IO.userError "Compiler and literal table recipe disagree"
              corners := corners + 1
  unless corners == 30 do throw <| IO.userError "Incomplete corner enumeration"
  IO.println "Terminal binary fixtures passed: 30 corners, singleton edge, all-input theorem"
