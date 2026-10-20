/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.RuntimeWire

namespace ConjectureMachines.Compilation.RuntimeWire.Fixtures

open Turing PartrecToTM2 K' StateTransition

-- A small actual shared table, with both zero words and a binary root PC.
def sample : CodeDAG.DAG := ⟨#[.zero, .succ, .cons 0 1], 2⟩

example : flatTriples sample.rows = [0, 0, 0, 1, 0, 0, 3, 0, 1] := rfl
example : (flatTriples sample.rows).length = 9 := rfl

-- Frame tags, saved lists (including zero), the unique list delimiter, and nested frames.
example : frameWire (.cons1 7 [0, 2] (.cons2 5 (.comp 9 (.fix 11 .halt)))) =
    trList [1] ++ trList [0, 2] ++ Γ'.consₗ ::
      (trList [7] ++ (trList [2, 5] ++ (trList [3, 9] ++ (trList [4, 11] ++ trList [0])))) := rfl
example : frameWire (.cons1 0 [] .halt) = trList [1] ++ Γ'.consₗ :: (trList [0] ++ trList [0]) := rfl

-- Numeric zero words never impersonate the saved-list/table marker.
example : splitAtPred Runtime.endFrame (trList [0, 0, 0] ++ Γ'.consₗ :: trList [0]) =
    (trList [0, 0, 0], some Γ'.consₗ, trList [0]) := by decide +kernel
example : splitAtPred Runtime.endFrame (Γ'.consₗ :: trList [0]) =
    ([], some Γ'.consₗ, trList [0]) := rfl

-- Live halt continuations retain tag zero; final VM configurations have consumed it.
example : (configWire sample.rows none (.ret .halt [7])).stk stack = trList [0] := rfl
example : (configWire sample.rows none (.halt [7])).stk stack = [] := rfl
example : (initial sample [0, 7]).stk aux = [] := rfl
example : (initial sample [0, 7]).stk stack = [] := rfl

/-- Recognize the concrete evaluate return label without comparing function-bearing labels. -/
def atEvaluate (cfg : Cfg') : Bool :=
  match cfg.l with
  | some (.ret (.cons₂ .halt)) => true
  | _ => false

/-- A bounded direct execution of the actual machine, used only for independent fixtures. -/
def seekEvaluate : Nat → Cfg' → Option Cfg'
  | 0, cfg => if atEvaluate cfg then some cfg else none
  | fuel + 1, cfg =>
    if atEvaluate cfg then some cfg
    else (TM2.step Runtime.machine cfg).bind (seekEvaluate fuel)

/-- A concrete observation avoids comparing function-bearing TM2 configurations. -/
structure Observation where
  evaluate : Bool
  store : Option Γ'
  mainSymbols : List Γ'
  reverseSymbols : List Γ'
  tableSymbols : List Γ'
  frameSymbols : List Γ'
  deriving DecidableEq

/-- Observe the phase, store and all four stacks of the computed actual machine state. -/
def snapshot (cfg : Cfg') : Observation :=
  ⟨atEvaluate cfg, cfg.var, cfg.stk main, cfg.stk rev, cfg.stk aux, cfg.stk stack⟩

-- Independent closed kernel computations run the actual TM2.step, not the startup theorem.
example : (seekEvaluate 200 (initial sample [0, 7])).map snapshot =
    some ⟨true, none, trList [2, 0, 7], [], trList [0, 0, 0, 1, 0, 0, 3, 0, 1], trList [0]⟩ := by
  decide +kernel

example : (seekEvaluate 80
      ⟨some (Runtime.label .start), none, K'.elim (rawInput 0 [] []) [] [] []⟩).map snapshot =
    some ⟨true, none, trList [0], [], [], trList [0]⟩ := by decide +kernel

-- Startup does not require a valid root PC, and it clears an arbitrary incoming store.
example : (seekEvaluate 100
      ⟨some (Runtime.label .start), some .bit1, K'.elim (rawInput 5 [] [0]) [] [] []⟩).map snapshot =
    some ⟨true, none, trList [5, 0], [], [], trList [0]⟩ := by decide +kernel

example (dag : CodeDAG.DAG) (values : List Nat) :
    Reaches₁ (TM2.step Runtime.machine) (initial dag values)
      (configWire dag.rows none (CodeVM.init dag values)) := initial_reaches dag values

end ConjectureMachines.Compilation.RuntimeWire.Fixtures

#eval IO.println "Runtime startup fixtures passed"
