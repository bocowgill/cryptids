/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Finite
public import Cryptids.Compilation.Block

/-! # Exact equality using captured finite observation lists

Coverage proofs justify extensional function equality. The executable comparison traverses the
supplied lists directly, avoiding reconstruction of a function-domain Fintype enumeration.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.ListEquality
open Turing

/-- Exact equality of dependent functions on an explicitly covered finite domain. -/
def dependentFunctionDecEq {α : Type*} {β : α → Type*} [∀ a, DecidableEq (β a)]
    (xs : List α) (cover : ∀ a, a ∈ xs) : DecidableEq (∀ a, β a) := fun f g ↦
  decidable_of_iff (∀ a ∈ xs, f a = g a) (by
    constructor
    · intro h
      funext a
      exact h a (cover a)
    · intro h a _
      exact congrFun h a)

/-- The ordinary function specialization retains the same explicit observation list. -/
def functionDecEq {α β : Type*} [DecidableEq β]
    (xs : List α) (cover : ∀ a, a ∈ xs) : DecidableEq (α → β) :=
  dependentFunctionDecEq xs cover

/-- Capture two observation lists for curried finite functions. -/
def tableDecEq {α β γ : Type*} [DecidableEq γ]
    (xs : List α) (cover : ∀ a, a ∈ xs) (ys : List β) (otherCover : ∀ b, b ∈ ys) :
    DecidableEq (α → β → γ) :=
  letI : DecidableEq (β → γ) := functionDecEq ys otherCover
  functionDecEq xs cover

section Statements
variable {Γ Λ σ : Type*} [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]

/-- Structural equality with captured explicit head/store lists for every function field. -/
def stmtDecEq (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (a b : TM1.Stmt Γ Λ σ) : Decidable (a = b) :=
  letI : DecidableEq (Γ → σ → Γ) := tableDecEq symbols cover stores storeCover
  letI : DecidableEq (Γ → σ → σ) := tableDecEq symbols cover stores storeCover
  letI : DecidableEq (Γ → σ → Bool) := tableDecEq symbols cover stores storeCover
  letI : DecidableEq (Γ → σ → Λ) := tableDecEq symbols cover stores storeCover
  withPtrEqDecEq a b fun _ ↦
    match a, b with
    | .move d q, .move d' q' => by
      letI := stmtDecEq symbols cover stores storeCover q q'
      exact decidable_of_iff (d = d' ∧ q = q') (by simp)
    | .move d q, .write f' q' => isFalse (by intro h; cases h)
    | .move d q, .load f' q' => isFalse (by intro h; cases h)
    | .move d q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .move d q, .goto f' => isFalse (by intro h; cases h)
    | .move d q, .halt => isFalse (by intro h; cases h)
    | .write f q, .move d' q' => isFalse (by intro h; cases h)
    | .write f q, .write f' q' => by
      letI := stmtDecEq symbols cover stores storeCover q q'
      exact decidable_of_iff (f = f' ∧ q = q') (by simp)
    | .write f q, .load f' q' => isFalse (by intro h; cases h)
    | .write f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .write f q, .goto f' => isFalse (by intro h; cases h)
    | .write f q, .halt => isFalse (by intro h; cases h)
    | .load f q, .move d' q' => isFalse (by intro h; cases h)
    | .load f q, .write f' q' => isFalse (by intro h; cases h)
    | .load f q, .load f' q' => by
      letI := stmtDecEq symbols cover stores storeCover q q'
      exact decidable_of_iff (f = f' ∧ q = q') (by simp)
    | .load f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .load f q, .goto f' => isFalse (by intro h; cases h)
    | .load f q, .halt => isFalse (by intro h; cases h)
    | .branch p q r, .move d' q' => isFalse (by intro h; cases h)
    | .branch p q r, .write f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .load f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .branch p' q' r' => by
      letI := stmtDecEq symbols cover stores storeCover q q'
      letI := stmtDecEq symbols cover stores storeCover r r'
      exact decidable_of_iff (p = p' ∧ q = q' ∧ r = r') (by simp)
    | .branch p q r, .goto f' => isFalse (by intro h; cases h)
    | .branch p q r, .halt => isFalse (by intro h; cases h)
    | .goto f, .move d' q' => isFalse (by intro h; cases h)
    | .goto f, .write f' q' => isFalse (by intro h; cases h)
    | .goto f, .load f' q' => isFalse (by intro h; cases h)
    | .goto f, .branch p' q' r' => isFalse (by intro h; cases h)
    | .goto f, .goto f' => by
      exact decidable_of_iff (f = f') (by simp)
    | .goto f, .halt => isFalse (by intro h; cases h)
    | .halt, .move d' q' => isFalse (by intro h; cases h)
    | .halt, .write f' q' => isFalse (by intro h; cases h)
    | .halt, .load f' q' => isFalse (by intro h; cases h)
    | .halt, .branch p' q' r' => isFalse (by intro h; cases h)
    | .halt, .goto f' => isFalse (by intro h; cases h)
    | .halt, .halt => by
      exact isTrue rfl
termination_by structural a

end Statements

/-- A covered alphabet extends constructively to its optional top-of-stack alphabet. -/
theorem optionCover {α : Type*} (xs : List α) (cover : ∀ a, a ∈ xs) :
    ∀ a, a ∈ none :: xs.map some := by
  intro a
  cases a <;> simp [cover]

section StackStatements
variable {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
variable [DecidableEq K] [∀ k, DecidableEq (Γ k)] [DecidableEq Λ] [DecidableEq σ]

/-- Exact stack syntax equality using only the supplied symbol and store observations. -/
def stackStmtDecEq (letters : ∀ k, List (Γ k)) (letterCover : ∀ k a, a ∈ letters k)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (a b : TM2.Stmt Γ Λ σ) : Decidable (a = b) :=
  letI : DecidableEq (σ → σ) := functionDecEq stores storeCover
  letI : DecidableEq (σ → Bool) := functionDecEq stores storeCover
  letI : DecidableEq (σ → Λ) := functionDecEq stores storeCover
  withPtrEqDecEq a b fun _ ↦
    match a, b with
    | .push k f q, .push k' f' q' => by
      by_cases hk : k = k'
      · subst k'
        letI : DecidableEq (σ → Γ k) := functionDecEq stores storeCover
        letI : DecidableEq (σ → Option (Γ k) → σ) :=
          tableDecEq stores storeCover _ (optionCover (letters k) (letterCover k))
        letI := stackStmtDecEq letters letterCover stores storeCover q q'
        exact decidable_of_iff (f = f' ∧ q = q') (by simp)
      · exact isFalse (fun h ↦ hk (by cases h; rfl))
    | .push k f q, .peek k' f' q' => isFalse (by intro h; cases h)
    | .push k f q, .pop k' f' q' => isFalse (by intro h; cases h)
    | .push k f q, .load f' q' => isFalse (by intro h; cases h)
    | .push k f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .push k f q, .goto f' => isFalse (by intro h; cases h)
    | .push k f q, .halt  => isFalse (by intro h; cases h)
    | .peek k f q, .push k' f' q' => isFalse (by intro h; cases h)
    | .peek k f q, .peek k' f' q' => by
      by_cases hk : k = k'
      · subst k'
        letI : DecidableEq (σ → Γ k) := functionDecEq stores storeCover
        letI : DecidableEq (σ → Option (Γ k) → σ) :=
          tableDecEq stores storeCover _ (optionCover (letters k) (letterCover k))
        letI := stackStmtDecEq letters letterCover stores storeCover q q'
        exact decidable_of_iff (f = f' ∧ q = q') (by simp)
      · exact isFalse (fun h ↦ hk (by cases h; rfl))
    | .peek k f q, .pop k' f' q' => isFalse (by intro h; cases h)
    | .peek k f q, .load f' q' => isFalse (by intro h; cases h)
    | .peek k f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .peek k f q, .goto f' => isFalse (by intro h; cases h)
    | .peek k f q, .halt  => isFalse (by intro h; cases h)
    | .pop k f q, .push k' f' q' => isFalse (by intro h; cases h)
    | .pop k f q, .peek k' f' q' => isFalse (by intro h; cases h)
    | .pop k f q, .pop k' f' q' => by
      by_cases hk : k = k'
      · subst k'
        letI : DecidableEq (σ → Γ k) := functionDecEq stores storeCover
        letI : DecidableEq (σ → Option (Γ k) → σ) :=
          tableDecEq stores storeCover _ (optionCover (letters k) (letterCover k))
        letI := stackStmtDecEq letters letterCover stores storeCover q q'
        exact decidable_of_iff (f = f' ∧ q = q') (by simp)
      · exact isFalse (fun h ↦ hk (by cases h; rfl))
    | .pop k f q, .load f' q' => isFalse (by intro h; cases h)
    | .pop k f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .pop k f q, .goto f' => isFalse (by intro h; cases h)
    | .pop k f q, .halt  => isFalse (by intro h; cases h)
    | .load f q, .push k' f' q' => isFalse (by intro h; cases h)
    | .load f q, .peek k' f' q' => isFalse (by intro h; cases h)
    | .load f q, .pop k' f' q' => isFalse (by intro h; cases h)
    | .load f q, .load f' q' => by
      letI := stackStmtDecEq letters letterCover stores storeCover q q'
      exact decidable_of_iff (f = f' ∧ q = q') (by simp)
    | .load f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .load f q, .goto f' => isFalse (by intro h; cases h)
    | .load f q, .halt  => isFalse (by intro h; cases h)
    | .branch p q r, .push k' f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .peek k' f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .pop k' f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .load f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .branch p' q' r' => by
      letI := stackStmtDecEq letters letterCover stores storeCover q q'
      letI := stackStmtDecEq letters letterCover stores storeCover r r'
      exact decidable_of_iff (p = p' ∧ q = q' ∧ r = r') (by simp)
    | .branch p q r, .goto f' => isFalse (by intro h; cases h)
    | .branch p q r, .halt  => isFalse (by intro h; cases h)
    | .goto f, .push k' f' q' => isFalse (by intro h; cases h)
    | .goto f, .peek k' f' q' => isFalse (by intro h; cases h)
    | .goto f, .pop k' f' q' => isFalse (by intro h; cases h)
    | .goto f, .load f' q' => isFalse (by intro h; cases h)
    | .goto f, .branch p' q' r' => isFalse (by intro h; cases h)
    | .goto f, .goto f' => by
      exact decidable_of_iff (f = f') (by simp)
    | .goto f, .halt  => isFalse (by intro h; cases h)
    | .halt, .push k' f' q' => isFalse (by intro h; cases h)
    | .halt, .peek k' f' q' => isFalse (by intro h; cases h)
    | .halt, .pop k' f' q' => isFalse (by intro h; cases h)
    | .halt, .load f' q' => isFalse (by intro h; cases h)
    | .halt, .branch p' q' r' => isFalse (by intro h; cases h)
    | .halt, .goto f' => isFalse (by intro h; cases h)
    | .halt, .halt  => by
      exact isTrue rfl
termination_by structural a


/-- Exact stack-action equality with a captured finite top/store table. -/
def stackActionDecEq (letters : ∀ k, List (Γ k)) (letterCover : ∀ k a, a ∈ letters k)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) {k : K} :
    DecidableEq (TM2to1.StAct K Γ σ k) :=
  letI : DecidableEq (σ → Γ k) := functionDecEq stores storeCover
  letI : DecidableEq (σ → Option (Γ k) → σ) :=
    tableDecEq stores storeCover _ (optionCover (letters k) (letterCover k))
  fun a b ↦ match a, b with
  | .push f, .push g => decidable_of_iff (f = g) (by simp)
  | .peek f, .peek g => decidable_of_iff (f = g) (by simp)
  | .pop f, .pop g => decidable_of_iff (f = g) (by simp)
  | .push _, .peek _ | .push _, .pop _ | .peek _, .push _ | .peek _, .pop _
  | .pop _, .push _ | .pop _, .peek _ => isFalse (by intro h; cases h)

/-- Exact emulator-label equality, including the recursive source statement payload. -/
def stackLabelDecEq (letters : ∀ k, List (Γ k)) (letterCover : ∀ k a, a ∈ letters k)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    DecidableEq (TM2to1.Λ' K Γ Λ σ) :=
  letI : DecidableEq (TM2.Stmt Γ Λ σ) := stackStmtDecEq letters letterCover stores storeCover
  fun a b ↦ match a, b with
  | .normal l, .normal m => decidable_of_iff (l = m) (by simp)
  | .ret q, .ret r => decidable_of_iff (q = r) (by simp)
  | .go k a q, .go k' a' q' => by
    by_cases hk : k = k'
    · subst k'
      letI : DecidableEq (TM2to1.StAct K Γ σ k) :=
        stackActionDecEq letters letterCover stores storeCover
      exact decidable_of_iff (a = a' ∧ q = q') (by simp)
    · exact isFalse (fun h ↦ hk (by cases h; rfl))
  | .normal _, .go _ _ _ | .normal _, .ret _ | .go _ _ _, .normal _
  | .go _ _ _, .ret _ | .ret _, .normal _ | .ret _, .go _ _ _ =>
    isFalse (by intro h; cases h)
end StackStatements

/-- Equality on the dependent finite stack-column alphabet without regenerating its Fintype. -/
def alphabetDecEq {K : Type*} {Γ : K → Type*} [∀ k, DecidableEq (Γ k)]
    (stackNames : List K) (cover : ∀ k, k ∈ stackNames) :
    DecidableEq (TM2to1.Γ' K Γ) :=
  letI : DecidableEq (∀ k, Option (Γ k)) := dependentFunctionDecEq stackNames cover
  inferInstanceAs (DecidableEq (Bool × ∀ k, Option (Γ k)))

/-- Complete shared-tape label equality composed entirely from captured observation lists. -/
def sharedLabelDecEq {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
    [DecidableEq K] [∀ k, DecidableEq (Γ k)] [DecidableEq Λ] [DecidableEq σ]
    (stackNames : List K) (stackCover : ∀ k, k ∈ stackNames)
    (letters : ∀ k, List (Γ k)) (letterCover : ∀ k a, a ∈ letters k)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    DecidableEq (TM1.Stmt (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ) :=
  letI : DecidableEq (TM2to1.Γ' K Γ) := alphabetDecEq stackNames stackCover
  letI : DecidableEq (TM2to1.Λ' K Γ Λ σ) :=
    stackLabelDecEq letters letterCover stores storeCover
  stmtDecEq symbols cover stores storeCover

section HeadFree
variable {Γ Λ σ : Type*} [Inhabited Γ]
variable [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]

/-- Exact equality on certified head-free syntax: only goto fields use their supplied proof. -/
def headFreeStmtDecEq (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (a b : TM1.Stmt Γ Λ σ) (ha : Block.AllHeadFree a) (hb : Block.AllHeadFree b) :
    Decidable (a = b) :=
  letI : DecidableEq (Γ → σ → Γ) := tableDecEq symbols cover stores storeCover
  letI : DecidableEq (Γ → σ → σ) := tableDecEq symbols cover stores storeCover
  letI : DecidableEq (Γ → σ → Bool) := tableDecEq symbols cover stores storeCover
  withPtrEqDecEq a b fun _ ↦
    match a, b with
    | .move d q, .move d' q' => by
      letI := headFreeStmtDecEq symbols cover stores storeCover q q' ha hb
      exact decidable_of_iff (d = d' ∧ q = q') (by simp)
    | .move d q, .write f' q' => isFalse (by intro h; cases h)
    | .move d q, .load f' q' => isFalse (by intro h; cases h)
    | .move d q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .move d q, .goto f' => isFalse (by intro h; cases h)
    | .move d q, .halt => isFalse (by intro h; cases h)
    | .write f q, .move d' q' => isFalse (by intro h; cases h)
    | .write f q, .write f' q' => by
      letI := headFreeStmtDecEq symbols cover stores storeCover q q' ha hb
      exact decidable_of_iff (f = f' ∧ q = q') (by simp)
    | .write f q, .load f' q' => isFalse (by intro h; cases h)
    | .write f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .write f q, .goto f' => isFalse (by intro h; cases h)
    | .write f q, .halt => isFalse (by intro h; cases h)
    | .load f q, .move d' q' => isFalse (by intro h; cases h)
    | .load f q, .write f' q' => isFalse (by intro h; cases h)
    | .load f q, .load f' q' => by
      letI := headFreeStmtDecEq symbols cover stores storeCover q q' ha hb
      exact decidable_of_iff (f = f' ∧ q = q') (by simp)
    | .load f q, .branch p' q' r' => isFalse (by intro h; cases h)
    | .load f q, .goto f' => isFalse (by intro h; cases h)
    | .load f q, .halt => isFalse (by intro h; cases h)
    | .branch p q r, .move d' q' => isFalse (by intro h; cases h)
    | .branch p q r, .write f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .load f' q' => isFalse (by intro h; cases h)
    | .branch p q r, .branch p' q' r' => by
      letI := headFreeStmtDecEq symbols cover stores storeCover q q' ha.1 hb.1
      letI := headFreeStmtDecEq symbols cover stores storeCover r r' ha.2 hb.2
      exact decidable_of_iff (p = p' ∧ q = q' ∧ r = r') (by simp)
    | .branch p q r, .goto f' => isFalse (by intro h; cases h)
    | .branch p q r, .halt => isFalse (by intro h; cases h)
    | .goto f, .move d' q' => isFalse (by intro h; cases h)
    | .goto f, .write f' q' => isFalse (by intro h; cases h)
    | .goto f, .load f' q' => isFalse (by intro h; cases h)
    | .goto f, .branch p' q' r' => isFalse (by intro h; cases h)
    | .goto f, .goto f' => by
      letI : DecidableEq (σ → Λ) := functionDecEq stores storeCover
      exact decidable_of_iff ((fun v ↦ f default v) = (fun v ↦ f' default v)) (by
        constructor
        · intro h
          apply congrArg TM1.Stmt.goto
          funext a v
          exact (ha a v).trans ((congrFun h v).trans (hb a v).symm)
        · intro h
          cases h
          rfl)
    | .goto f, .halt => isFalse (by intro h; cases h)
    | .halt, .move d' q' => isFalse (by intro h; cases h)
    | .halt, .write f' q' => isFalse (by intro h; cases h)
    | .halt, .load f' q' => isFalse (by intro h; cases h)
    | .halt, .branch p' q' r' => isFalse (by intro h; cases h)
    | .halt, .goto f' => isFalse (by intro h; cases h)
    | .halt, .halt => by
      exact isTrue rfl
termination_by structural a


/-- A proof-carrying label type makes the faster goto comparison applicable to every key. -/
def headFreeLabelDecEq (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    DecidableEq {q : TM1.Stmt Γ Λ σ // Block.AllHeadFree q} := fun a b ↦
  letI := headFreeStmtDecEq symbols cover stores storeCover a.val b.val a.property b.property
  decidable_of_iff (a.val = b.val) Subtype.ext_iff.symm
end HeadFree

/-- Complete certified shared-label equality: only proved head-free gotos omit head repetition. -/
def sharedHeadFreeLabelDecEq {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
    [DecidableEq K] [∀ k, DecidableEq (Γ k)] [DecidableEq Λ] [DecidableEq σ]
    (stackNames : List K) (stackCover : ∀ k, k ∈ stackNames)
    (letters : ∀ k, List (Γ k)) (letterCover : ∀ k a, a ∈ letters k)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    DecidableEq {q : TM1.Stmt (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ //
      Block.AllHeadFree q} :=
  letI : DecidableEq (TM2to1.Γ' K Γ) := alphabetDecEq stackNames stackCover
  letI : DecidableEq (TM2to1.Λ' K Γ Λ σ) :=
    stackLabelDecEq letters letterCover stores storeCover
  headFreeLabelDecEq symbols cover stores storeCover

/-- Binary write continuations carry the head-freedom certificate of their source statement. -/
def BinaryLabelFree {Γ Λ σ : Type*} [Inhabited Γ] : TM1to1.Λ' Γ Λ σ → Prop
  | .normal _ => True
  | .write _ q => Block.AllHeadFree q

/-- Exact equality on binary labels whose source continuation is certified head free. -/
def binaryCertifiedDecEq {Γ Λ σ : Type*} [Inhabited Γ]
    [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (a b : TM1to1.Λ' Γ Λ σ) (ha : BinaryLabelFree a) (hb : BinaryLabelFree b) :
    Decidable (a = b) :=
  match a, b with
  | .normal l, .normal m => decidable_of_iff (l = m) (by simp)
  | .write a q, .write b r =>
    letI := headFreeStmtDecEq symbols cover stores storeCover q r ha hb
    decidable_of_iff (a = b ∧ q = r) (by simp)
  | .normal _, .write _ _ | .write _ _, .normal _ => isFalse (by intro h; cases h)

/-- Proof-carrying binary keys support the faster complete continuation comparison. -/
def binaryFreeLabelDecEq {Γ Λ σ : Type*} [Inhabited Γ]
    [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    DecidableEq {q : TM1to1.Λ' Γ Λ σ // BinaryLabelFree q} := fun a b ↦
  letI := binaryCertifiedDecEq symbols cover stores storeCover a.val b.val a.property b.property
  decidable_of_iff (a.val = b.val) Subtype.ext_iff.symm

end ConjectureMachines.Compilation.ListEquality
