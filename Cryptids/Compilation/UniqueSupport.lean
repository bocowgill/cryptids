/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.HashSupport

/-! # Memoized structural statement support

Subtrees are inserted only after their children. A previously visited statement
can then be skipped because the accumulated set is closed under subterms.
-/

@[expose] public section

namespace ConjectureMachines.Compilation.UniqueSupport

open Turing

set_option backward.isDefEq.respectTransparency false

variable {Γ Λ σ : Type*}
variable [DecidableEq (TM1.Stmt Γ Λ σ)] [Hashable (TM1.Stmt Γ Λ σ)]

/-- Every stored statement already has its whole structural subtree stored. -/
def SubtreeClosed (seen : Std.HashSet (TM1.Stmt Γ Λ σ)) : Prop :=
  ∀ q ∈ seen, ∀ r ∈ subtermList q, r ∈ seen

theorem empty_closed : SubtreeClosed (∅ : Std.HashSet (TM1.Stmt Γ Λ σ)) := by
  simp [SubtreeClosed]

/-- The cache is queried before descending, and new parents are inserted postorder. -/
def collect (q : TM1.Stmt Γ Λ σ) (seen : Std.HashSet (TM1.Stmt Γ Λ σ)) :
    Std.HashSet (TM1.Stmt Γ Λ σ) :=
  if q ∈ seen then seen else
    match q with
    | .move _ child | .write _ child | .load _ child => (collect child seen).insert q
    | .branch _ left right => (collect right (collect left seen)).insert q
    | .goto _ | .halt => seen.insert q
termination_by structural q

omit [DecidableEq (TM1.Stmt Γ Λ σ)] [Hashable (TM1.Stmt Γ Λ σ)] in
private theorem subterm_trans {q r t : TM1.Stmt Γ Λ σ}
    (r_in_q : r ∈ subtermList q) (t_in_r : t ∈ subtermList r) : t ∈ subtermList q :=
  (mem_subtermList q t).mpr
    (TM1.stmts₁_trans ((mem_subtermList q r).mp r_in_q)
      ((mem_subtermList r t).mp t_in_r))

private theorem closed_of_membership (seen result : Std.HashSet (TM1.Stmt Γ Λ σ))
    (q : TM1.Stmt Γ Λ σ) (closed : SubtreeClosed seen)
    (members : ∀ r, r ∈ result ↔ r ∈ seen ∨ r ∈ subtermList q) :
    SubtreeClosed result := by
  intro r hr t ht
  rcases (members r).mp hr with old | new
  · exact (members t).mpr (Or.inl (closed r old t ht))
  · exact (members t).mpr (Or.inr (subterm_trans new ht))

private theorem already_seen (seen : Std.HashSet (TM1.Stmt Γ Λ σ))
    (q : TM1.Stmt Γ Λ σ) (closed : SubtreeClosed seen) (found : q ∈ seen)
    (r : TM1.Stmt Γ Λ σ) : r ∈ seen ↔ r ∈ seen ∨ r ∈ subtermList q :=
  ⟨Or.inl, fun h ↦ h.elim id (closed q found r)⟩

/-- Exact union with the subtree requires the cache's subterm-closure invariant. -/
theorem collect_mem (q : TM1.Stmt Γ Λ σ) (seen : Std.HashSet (TM1.Stmt Γ Λ σ))
    (closed : SubtreeClosed seen) (r : TM1.Stmt Γ Λ σ) :
    r ∈ collect q seen ↔ r ∈ seen ∨ r ∈ subtermList q := by
  induction q generalizing seen r with
  | move d child ih | write d child ih | load d child ih =>
    rw [collect]
    split
    · exact already_seen _ _ closed ‹_› r
    · simp only [Std.HashSet.mem_insert, beq_iff_eq, ih seen closed,
        subtermList, List.mem_cons]
      aesop
  | branch predicate left right ihl ihr =>
    rw [collect]
    split
    · exact already_seen _ _ closed ‹_› r
    · have left_closed := closed_of_membership seen (collect left seen) left closed
        (ihl seen closed)
      simp only [Std.HashSet.mem_insert, beq_iff_eq, ihr _ left_closed, ihl seen closed,
        subtermList, List.mem_cons, List.mem_append]
      aesop
  | goto target | halt =>
    rw [collect]
    split
    · exact already_seen _ _ closed ‹_› r
    · simp only [Std.HashSet.mem_insert, beq_iff_eq, subtermList, List.mem_singleton]
      aesop

/-- Postorder collection keeps the invariant needed by later cache hits. -/
theorem collect_closed (q : TM1.Stmt Γ Λ σ) (seen : Std.HashSet (TM1.Stmt Γ Λ σ))
    (closed : SubtreeClosed seen) : SubtreeClosed (collect q seen) :=
  closed_of_membership seen (collect q seen) q closed (collect_mem q seen closed)

/-- Fold procedure bodies through the same retained structural cache. -/
def collectMany (bodies : List (TM1.Stmt Γ Λ σ))
    (initial : Std.HashSet (TM1.Stmt Γ Λ σ)) : Std.HashSet (TM1.Stmt Γ Λ σ) :=
  bodies.foldl (fun seen body ↦ collect body seen) initial

theorem collectMany_closed (bodies : List (TM1.Stmt Γ Λ σ))
    (initial : Std.HashSet (TM1.Stmt Γ Λ σ)) (closed : SubtreeClosed initial) :
    SubtreeClosed (collectMany bodies initial) := by
  induction bodies generalizing initial with
  | nil => exact closed
  | cons body bodies ih => exact ih _ (collect_closed body initial closed)

theorem collectMany_mem (bodies : List (TM1.Stmt Γ Λ σ))
    (initial : Std.HashSet (TM1.Stmt Γ Λ σ)) (closed : SubtreeClosed initial)
    (q : TM1.Stmt Γ Λ σ) :
    q ∈ collectMany bodies initial ↔ q ∈ initial ∨ ∃ body ∈ bodies, q ∈ subtermList body := by
  induction bodies generalizing initial with
  | nil => simp [collectMany]
  | cons body bodies ih =>
    simp only [collectMany, List.foldl_cons] at *
    rw [ih _ (collect_closed body initial closed), collect_mem body initial closed]
    simp only [List.mem_cons]
    aesop

/-- Collect all procedure subtrees once, from an empty closed cache. -/
def statements (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) :
    Std.HashSet (TM1.Stmt Γ Λ σ) :=
  labels.foldl (fun seen label ↦ collect (M label) seen) ∅

/-- The streamed root fold has the same mathematical result without allocating every body. -/
theorem statements_eq_collectMany (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) :
    statements M labels = collectMany (labels.map M) ∅ := by
  simp only [statements, collectMany, List.foldl_map]

theorem statements_closed (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) :
    SubtreeClosed (statements M labels) := by
  rw [statements_eq_collectMany]
  exact collectMany_closed _ _ empty_closed

theorem statements_mem (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (q : TM1.Stmt Γ Λ σ) :
    q ∈ statements M labels ↔ ∃ label ∈ labels, q ∈ subtermList (M label) := by
  simp only [statements_eq_collectMany, collectMany_mem _ _ empty_closed, Std.HashSet.not_mem_empty,
    false_or, List.mem_map]
  aesop

omit [DecidableEq (TM1.Stmt Γ Λ σ)] [Hashable (TM1.Stmt Γ Λ σ)] in
private theorem hashSet_nodup {α : Type*} [DecidableEq α] [Hashable α]
    (set : Std.HashSet α) : set.toList.Nodup :=
  (Std.HashSet.distinct_toList (m := set)).imp (by
    intro a b different equal
    simp [equal] at different)

section Post
variable [DecidableEq σ] [Hashable σ]

/-- Pair each distinct statement and the absent control with every distinct supplied store. -/
def postLabels (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) (stores : List σ) :
    List (Option (TM1.Stmt Γ Λ σ) × σ) :=
  (none :: (statements M labels).toList.map some) ×ˢ (hashUnique stores)

theorem postLabels_nodup (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) (stores : List σ) :
    (postLabels M labels stores).Nodup := by
  apply List.Nodup.product
  · exact List.nodup_cons.mpr ⟨by simp,
      (hashSet_nodup (statements M labels)).map (fun _ _ h ↦ Option.some.inj h)⟩
  · exact hashSet_nodup (.ofList stores)

theorem postLabels_mem (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) (stores : List σ)
    (q : Option (TM1.Stmt Γ Λ σ) × σ) :
    q ∈ postLabels M labels stores ↔ q ∈ postSupportList M labels stores := by
  rcases q with ⟨q, store⟩
  cases q <;>
    simp only [postLabels, List.mem_product, List.mem_cons, List.mem_map,
      Std.HashSet.mem_toList, statements_mem, mem_hashUnique, postSupportList,
      List.mem_flatMap, List.mem_cons, Prod.mk.injEq] <;> aesop

theorem postLabels_length (M : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ) (stores : List σ) :
    (postLabels M labels stores).length =
      ((statements M labels).size + 1) * (hashUnique stores).length := by
  simp [postLabels, List.length_product, Std.HashSet.length_toList, Nat.add_mul, Nat.add_comm]

end Post

end ConjectureMachines.Compilation.UniqueSupport
