/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.RuntimeLookup

open Turing PartrecToTM2 K' StateTransition
open ConjectureMachines.Compilation
open ConjectureMachines.Compilation.Runtime

set_option backward.isDefEq.respectTransparency false

example (store : Option Γ') (values : List Nat) (frames : List Γ') :
    Reaches₁ (TM2.step machine)
      (dataCfg .evaluate store (0 :: values) [99, 0, 16] frames)
      (dataCfg .dispatch none (99 :: values) [99, 0, 16] (trList [0, 16] ++ frames)) :=
  RuntimeLookup.lookup_triple 0 [] store values [] 99 0 16 frames rfl

example (store : Option Γ') (values : List Nat) (frames : List Γ') :
    Reaches₁ (TM2.step machine)
      (dataCfg .evaluate store (2 :: values) [1, 0, 0, 2, 0, 0, 6, 4, 0, 0, 0, 0] frames)
      (dataCfg .dispatch none (6 :: values) [1, 0, 0, 2, 0, 0, 6, 4, 0, 0, 0, 0]
        (trList [4, 0] ++ frames)) :=
  RuntimeLookup.lookup_triple 2 [1, 0, 0, 2, 0, 0] store values [0, 0, 0] 6 4 0 frames rfl

example (store : Option Γ') (values : List Nat) (frames : List Γ') :
    Reaches₁ (TM2.step machine)
      (dataCfg .evaluate store (1 :: values)
        ([CodeDAG.Node.zero, .branch 123 456, .fix 9].flatMap CodeDAG.Node.words) frames)
      (dataCfg .dispatch none (5 :: values)
        ([CodeDAG.Node.zero, .branch 123 456, .fix 9].flatMap CodeDAG.Node.words)
        (trList [123, 456] ++ frames)) :=
  RuntimeLookup.lookup_node #[.zero, .branch 123 456, .fix 9] 1 (.branch 123 456)
    rfl 5 123 456 rfl store values frames

example (rows : Array CodeDAG.Node) (index : Nat) (node : CodeDAG.Node)
    (row : rows[index]? = some node) (tag left right : Nat)
    (words : node.words = [tag, left, right]) (store : Option Γ')
    (values : List Nat) (frames : List Γ') :
    ∃ out, Reaches₁ (TM2.step machine)
      (dataCfg .evaluate store (index :: values) (rows.toList.flatMap CodeDAG.Node.words) frames)
      (dataCfg .dispatch out (tag :: values) (rows.toList.flatMap CodeDAG.Node.words)
        (trList [left, right] ++ frames)) :=
  ⟨none, RuntimeLookup.lookup_node rows index node row tag left right words store values frames⟩

-- These bounded experiments execute the actual TM2 machine independently of the proofs.
def runToDispatch : Nat → Cfg' → Option (Nat × Cfg')
  | 0, _ => none
  | fuel + 1, current =>
    if current.l = some (label .dispatch) then some (0, current)
    else do
      let next ← TM2.step machine current
      let result ← runToDispatch fuel next
      return (result.1 + 1, result.2)

def checkLookup (index : Nat) (table values : List Nat) (frames : List Γ')
    (tag left right : Nat) : Bool × Nat :=
  match runToDispatch 10000 (dataCfg .evaluate (some .bit0) (index :: values) table frames) with
  | none => (false, 0)
  | some (steps, result) =>
    (decide (result.l = some (label .dispatch) ∧ result.var = none ∧
      result.stk main = trList (tag :: values) ∧ result.stk rev = [] ∧
      result.stk aux = trList table ∧ result.stk stack = trList [left, right] ++ frames), steps)

#eval do
  let results := [
    checkLookup 0 [0, 0, 0] [] [] 0 0 0,
    checkLookup 1 [3, 17, 29, 5, 9, 7, 6, 0, 0] [123, 0, 456]
      [.bit1, .consₗ, .cons, .bit0, .consₗ] 5 9 7,
    checkLookup 3 [1, 0, 0, 2, 0, 0, 3, 1, 2, 6, 4, 0, 0, 0, 0] [55]
      [.consₗ, .bit0, .consₗ, .cons] 6 4 0,
    checkLookup 0 [99, 0, 16] [65535, 0] [.consₗ, .consₗ, .bit1] 99 0 16]
  IO.println results
  unless results.all Prod.fst do throw (IO.userError "Actual runtime lookup fixture failed")
  IO.println "Runtime lookup fixtures passed"
