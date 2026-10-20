/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Code

/-! # Explicit finite input to the constructive Code backend

The compiled control is independent of the input. All input bits are written by the verified
blank-tape initializer and included in the machine's state count.
-/

@[expose] public section
namespace ConjectureMachines.Compilation
open Turing

section
variable {K : Type} {Γ : K → Type} {Λ σ : Type}
variable [Fintype K] [DecidableEq K] [∀ k, Fintype (Γ k)] [∀ k, DecidableEq (Γ k)]
variable [Fintype σ] [DecidableEq σ] [DecidableEq Λ] [Inhabited Λ] [Inhabited σ]
variable [Hashable σ] [Hashable (TM2to1.Γ' K Γ)]
variable (M : Λ → TM2.Stmt Γ Λ σ) (C : BlockCode (TM2to1.Γ' K Γ)) (labels : List Λ)

/-- The existing finite compiled control works for every finite source-stack input. -/
theorem fastStack_halts_input (ss : TM2.Supports M labels.toFinset)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (k : K) (input : List (Γ k)) :
    (TM0.eval (fastStack M C labels symbols stores k).machine
      (blockInput C (TM2to1.trInit k input))).Dom ↔ (TM2.eval M k input).Dom := by
  have hn := hashNumberMachine_dom (fastPost M C labels stores)
    (fastLabels M C labels symbols stores)
    (↑(fastLabels M C labels symbols stores).toFinset)
    (fast_supported M C labels symbols cover stores storeCover)
    (by intro q hq; exact List.mem_cons_of_mem _ (List.mem_toFinset.mp hq))
    (blockInput C (TM2to1.trInit k input))
  have hm := memoProgram_eq stores storeCover (fastTM1 M labels) (fastTM1_allFree M labels)
  have hp : (TM0.eval (fastPost M C labels stores)
      (blockInput C (TM2to1.trInit k input))).Dom ↔ (TM2.eval M k input).Dom := by
    rw [fastPost, TM1to0.tr_eval, fastBinary, hm]
    exact (Block.free_dom C _ (fastTM1_supports M labels)
      (fun q _ ↦ fastTM1_allFree M labels q) _).trans
      ((TM1Number.numberProgram_dom _ _ (normalized_supports M labels ss) _).trans
        ((TM1Normalize.tr_eval_dom _ _).trans (TM2to1.tr_eval_dom M k input)))
  change (TM0.eval (hashNumberPack (fastPost M C labels stores)
    (fastLabels M C labels symbols stores)).machine _).Dom ↔ _
  rw [hashNumberPack_machine]
  exact hn.trans hp
end

namespace CodeBackend
open PartrecToTM2 K'

/-- The input is data for the unchanged compiled program, encoded into its starting tape. -/
def inputBits (v : List Nat) : List Bool :=
  blockInput blockCode (TM2to1.trInit main (trList v))

set_option backward.isDefEq.respectTransparency false in
/-- One block per encoded stack symbol, with one bottom marker even for empty input. -/
theorem inputBits_length (v : List Nat) :
    (inputBits v).length = 11 * max 1 (trList v).length := by
  have hb (l : List Adequacy.PartrecAlphabet) :
      (blockInput blockCode l).length = 11 * l.length := by
    induction l with
    | nil => rfl
    | cons a l ih =>
      simp only [blockInput, List.flatMap_cons, List.length_append,
        List.Vector.toList_length, blockCode_width, List.length_cons] at *
      omega
  have hi : (TM2to1.trInit (Γ := fun _ : K' ↦ Γ') main (trList v)).length =
      max 1 (trList v).length := by
    simp only [TM2to1.trInit, List.length_cons, List.length_tail, List.length_map,
      List.length_reverse]
    omega
  rw [inputBits, hb, hi]

/-- The existing numbered machine with a separately supplied finite input. -/
def postWithInput (c : ToPartrec.Code) (v : List Nat) : NumberedPost :=
  { post c with input := inputBits v }

theorem postWithInput_extraStates (c : ToPartrec.Code) (v : List Nat) :
    (postWithInput c v).extraStates = (post c).extraStates := rfl

theorem postWithInput_machine (c : ToPartrec.Code) (v : List Nat) :
    (postWithInput c v).machine = (post c).machine := rfl

theorem postWithInput_nil (c : ToPartrec.Code) : postWithInput c [] = post c := rfl

theorem postWithInput_halts (c : ToPartrec.Code) (v : List Nat) :
    (postWithInput c v).Halts ↔ (c.eval v).Dom := by
  let : Inhabited Λ' := ⟨trNormal c .halt⟩
  have support : TM2.Supports tr (codeSuppList c .halt).toFinset := by
    rw [codeSuppList_toFinset]
    exact tr_supports c .halt
  have hc := fastStack_halts_input tr blockCode (codeSuppList c .halt) support
    symbols symbols_cover stores mem_stores main (trList v)
  have hi : (TM2.init main (trList v) : TM2.Cfg (fun _ ↦ Γ') Λ' (Option Γ')) =
      PartrecToTM2.init c v := by
    change TM2.Cfg.mk _ _ _ = TM2.Cfg.mk _ _ _
    congr 1
    funext k
    cases k <;> simp
  have hp : (TM2.eval tr main (trList v)).Dom ↔ (c.eval v).Dom := by
    change (StateTransition.eval (TM2.step tr) (TM2.init main (trList v))).Dom ↔ _
    rw [hi, PartrecToTM2.tr_eval]
    rfl
  exact hc.trans hp

/-- Every input bit is written by finite control, starting in state zero on the blank tape. -/
def generatedWithInput (c : ToPartrec.Code) (v : List Nat) : BundledMachine 2 :=
  let p := postWithInput c v
  Init.initialise (p.input.map Binary.encodeSymbol) (body p)

theorem body_postWithInput (c : ToPartrec.Code) (v : List Nat) :
    body (postWithInput c v) = body (post c) := rfl

theorem generatedWithInput_nil (c : ToPartrec.Code) :
    generatedWithInput c [] = generated c := rfl

theorem generatedWithInput_halts (c : ToPartrec.Code) (v : List Nat) :
    (generatedWithInput c v).Halts ↔ (c.eval v).Dom :=
  (Init.initialise_halts _ _).trans
    ((Binary.compile_halts_input _ _).trans (postWithInput_halts c v))

theorem generatedWithInput_states (c : ToPartrec.Code) (v : List Nat) :
    (generatedWithInput c v).states =
      2 * ((post c).extraStates + 1) + 2 * (inputBits v).length := by
  simp only [generatedWithInput, Init.initialise_states, body, postWithInput, List.length_map]
  omega

/-- The initializer reaches the unchanged body with the exact encoded input and head position. -/
theorem generatedWithInput_reaches (c : ToPartrec.Code) (v : List Nat) :
    StateTransition.Reaches (step (generatedWithInput c v).toMachine) ConjectureMachines.init
      (Init.embedAll (Init.writer ((inputBits v).map Binary.encodeSymbol))
        (body (postWithInput c v))
        ⟨0, Tape.mk₁ ((inputBits v).map Binary.encodeSymbol)⟩) :=
  Init.initialise_reaches _ _

/-- Arbitrary finite input, including repeated zeros, is accepted by the constant-zero code. -/
theorem zero_haltsWithInput (v : List Nat) : (generatedWithInput .zero' v).Halts :=
  (generatedWithInput_halts .zero' v).mpr trivial

/-- Positive fixpoint flags preserve nontermination for every finite input. -/
theorem spin_not_haltsWithInput (v : List Nat) :
    ¬ (generatedWithInput (.fix (.cons .succ .nil)) v).Halts := by
  intro h
  obtain ⟨w, hw⟩ := Part.dom_iff_mem.mp ((generatedWithInput_halts _ _).mp h)
  rw [ToPartrec.Code.fix_eval] at hw
  apply PFun.fixInduction' (C := fun _ ↦ False) hw
  · intro x hx
    simp [ToPartrec.Code.cons_eval, ToPartrec.Code.succ_eval, ToPartrec.Code.nil_eval,
      Bind.bind] at hx
  · exact fun _ _ _ _ ih ↦ ih

end CodeBackend
end ConjectureMachines.Compilation
