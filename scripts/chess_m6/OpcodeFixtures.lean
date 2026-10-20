/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.RuntimeEval

namespace RuntimeEvalFixtures

open Turing PartrecToTM2 K'
open ConjectureMachines.Compilation.Runtime

/-- A bounded observation of the actual TM2 transition function, stopping at phase entry. -/
def runTo (last : Λ') : Nat → Cfg' → Option (Nat × Cfg')
  | 0, cfg => if cfg.l = some last then some (0, cfg) else none
  | fuel + 1, cfg =>
    if cfg.l = some last then some (0, cfg)
    else (TM2.step machine cfg).bind fun next =>
      (runTo last fuel next).map fun result => (result.1 + 1, result.2)

def symbol : Γ' → Nat
  | .consₗ => 0
  | .cons => 1
  | .bit0 => 2
  | .bit1 => 3

def snapshot (cfg : Cfg') : Option Nat × List Nat × List Nat × List Nat × List Nat :=
  (cfg.var.map symbol, (cfg.stk main).map symbol, (cfg.stk rev).map symbol,
    (cfg.stk aux).map symbol, (cfg.stk stack).map symbol)

def observe (name : String) (phase finalPhase : Phase) (s outStore : Option Γ')
    (v table : List Nat) (left right : Nat) (frames : List Γ')
    (outValues : List Nat) (outFrames : List Γ') : String × Option (Nat × Bool) :=
  (name, (runTo (label finalPhase) 1000
    (dataCfg phase s v table (trList [left, right] ++ frames))).map fun result =>
      (result.1, snapshot result.2 = snapshot
        (dataCfg finalPhase outStore outValues table outFrames)))

def frames : List Γ' := [.bit0, .consₗ, .cons, .bit1, .consₗ]
def table : List Nat := [0, 19, 0, 63, 1, 37]

def tests : List (String × Option (Nat × Bool)) :=
  [observe "zero: empty values, arbitrary children, raw frames" .zero .returned
      (some .bit0) (some .cons) [] table 37 0 frames [0] frames,
   observe "zero: complete values retained" .zero .returned
      none (some .cons) [2, 0, 9] table 0 63 frames [0, 2, 0, 9] frames,
   observe "successor: empty default head" .successor .returned
      (some .consₗ) none [] table 0 0 frames [1] frames,
   observe "successor: binary carry, later values removed" .successor .returned
      none none [7, 2, 0] table 37 63 frames [8] frames,
   observe "successor: zero head" .successor .returned
      (some .bit1) none [0, 99] [] 0 1 [] [1] [],
   observe "tail: empty values" .tail .returned
      (some .bit1) none [] table 63 37 frames [] frames,
   observe "tail: zero delimiter consumed" .tail .returned
      none (some .cons) [0, 37, 0] table 1 0 frames [37, 0] frames,
   observe "tail: nonzero word consumed" .tail .returned
      (some .consₗ) (some .cons) [63, 0, 37] table 0 2 frames [0, 37] frames,
   observe "cons: empty values and program" .cons .evaluate
      none none [] [] 0 0 frames [0]
      (trList [1] ++ .consₗ :: (trList [0] ++ frames)),
   observe "cons: input copied exactly before delimiter" .cons .evaluate
      (some .bit0) none [0, 37, 2] table 63 19 frames [63, 0, 37, 2]
      (trList [1] ++ trList [0, 37, 2] ++ .consₗ :: (trList [19] ++ frames)),
   observe "comp: empty values" .comp .evaluate
      (some .bit1) none [] table 37 0 frames [0] (trList [3, 37] ++ frames),
   observe "comp: left saved, right evaluated" .comp .evaluate
      none none [4, 0] table 0 63 frames [63, 4, 0] (trList [3, 0] ++ frames),
   observe "branch: empty defaults to zero" .branch .evaluate
      (some .consₗ) none [] table 37 63 frames [37] frames,
   observe "branch: zero dropped" .branch .evaluate
      none none [0, 19, 0] table 0 37 frames [0, 19, 0] frames,
   observe "branch: one decrements to zero" .branch .evaluate
      (some .bit0) none [1, 19] table 37 63 frames [63, 0, 19] frames,
   observe "branch: binary borrow, later values retained" .branch .evaluate
      (some .bit1) none [8, 19, 0] table 37 63 frames [63, 7, 19, 0] frames,
   observe "fix: empty values, arbitrary unused child" .fix .evaluate
      none none [] table 0 63 frames [0] (trList [4, 0] ++ frames),
   observe "fix: child copied into frame and values" .fix .evaluate
      (some .consₗ) none [0, 37, 2] table 63 19 frames [63, 0, 37, 2]
      (trList [4, 63] ++ frames)]

#eval tests
#eval tests.all (fun test => test.2.any (fun result => result.1 > 0 && result.2))

set_option maxRecDepth 20000 in
set_option maxHeartbeats 400000 in
theorem fixtures_pass :
    tests.all (fun test => test.2.any (fun result => result.1 > 0 && result.2)) = true := by
  decide

#print axioms fixtures_pass

-- Kernel-checked instances of the general boundary theorems, without execution fuel premises.
example : ∃ outStore, StateTransition.Reaches₁ (TM2.step machine)
    (dataCfg .successor (some .bit0) [] table (trList [37, 0] ++ frames))
    (dataCfg .returned outStore [1] table frames) :=
  successor_reaches (some .bit0) [] table 37 0 frames

example : ∃ outStore, StateTransition.Reaches₁ (TM2.step machine)
    (dataCfg .branch none [] table (trList [37, 63] ++ frames))
    (dataCfg .evaluate outStore [37] table frames) :=
  branch_zero_reaches none [] table 37 63 frames rfl

example : ∃ outStore, StateTransition.Reaches₁ (TM2.step machine)
    (dataCfg .branch (some .consₗ) [8, 19, 0] table (trList [37, 63] ++ frames))
    (dataCfg .evaluate outStore [63, 7, 19, 0] table frames) :=
  branch_succ_reaches (some .consₗ) [8, 19, 0] table 37 63 frames (by decide)

example : ∃ outStore, StateTransition.Reaches₁ (TM2.step machine)
    (dataCfg .cons none [] [] (trList [0, 0] ++ frames))
    (dataCfg .evaluate outStore [0] []
      (trList [1] ++ Γ'.consₗ :: (trList [0] ++ frames))) :=
  cons_reaches none [] [] 0 0 frames

end RuntimeEvalFixtures

#eval IO.println "Runtime opcode fixtures passed"
