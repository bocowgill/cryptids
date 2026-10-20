/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.UniqueSupport
public import Cryptids.Compilation.StrongAssembly

/-! # Post packaging from structurally memoized support

The supplied numeric machine is not numbered again. Structural caching changes
support construction and its order, while exact membership and cardinality agree
with the sealed streamed collector. The finite machine retains both halting directions.
-/

@[expose] public section

namespace ConjectureMachines.Compilation.UniqueAssembly

open Turing

set_option backward.isDefEq.respectTransparency false

variable {Λ σ : Type} [Inhabited Λ] [Inhabited σ]
variable [DecidableEq Λ] [DecidableEq σ] [Hashable σ]

/-- The Post key uses the supplied complete structural decision procedure. -/
@[instance_reducible] def postKeyEq (M : Λ → TM1.Stmt Bool Λ σ)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ)) : DecidableEq (TM1to0.Λ' M) :=
  letI := statementEq
  inferInstanceAs (DecidableEq (Option (TM1.Stmt Bool Λ σ) × σ))

/-- Post-key hashing is structural statement hashing paired with local-store hashing. -/
@[instance_reducible] def postKeyHash (M : Λ → TM1.Stmt Bool Λ σ)
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) : Hashable (TM1to0.Λ' M) :=
  letI := statementHash
  inferInstanceAs (Hashable (Option (TM1.Stmt Bool Λ σ) × σ))

/-- Capture complete statement equality and its performance-only hash explicitly. -/
def postLabels (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ) (stores : List σ)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) : List (TM1to0.Λ' M) :=
  letI := statementEq
  letI := statementHash
  UniqueSupport.postLabels M procedures stores

omit [Inhabited Λ] [Inhabited σ] [DecidableEq Λ] in
theorem postLabels_nodup (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    (postLabels M procedures stores statementEq statementHash).Nodup := by
  let := statementEq
  let := statementHash
  exact UniqueSupport.postLabels_nodup M procedures stores

section FiniteStores
variable [Fintype σ]

omit [Inhabited Λ] [Inhabited σ] in
theorem postLabels_toFinset (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (cover : ∀ v, v ∈ stores)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    letI := postKeyEq M statementEq
    (postLabels M procedures stores statementEq statementHash).toFinset =
      TM1to0.trStmts M procedures.toFinset := by
  let := statementEq
  let := statementHash
  let := postKeyEq M statementEq
  ext q
  simp only [List.mem_toFinset]
  change q ∈ UniqueSupport.postLabels M procedures stores ↔ _
  exact (UniqueSupport.postLabels_mem M procedures stores q).trans
    (mem_postSupportList M procedures stores cover q)

omit [Fintype σ] in
theorem postLabels_supported [Finite σ] (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (support : TM1.Supports M procedures.toFinset) (stores : List σ)
    (cover : ∀ v, v ∈ stores) (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    letI := postKeyEq M statementEq
    TM0.Supports (TM1to0.tr M)
      ↑(postLabels M procedures stores statementEq statementHash).toFinset := by
  let := postKeyEq M statementEq
  let := Fintype.ofFinite σ
  rw [postLabels_toFinset M procedures stores cover statementEq statementHash]
  exact TM1to0.tr_supports M support

/-- Both collectors enumerate the same support, even when the supplied lists repeat entries. -/
theorem postLabels_streamed_members (M : Λ → TM1.Stmt Bool Λ σ)
    (procedures : List Λ) (stores : List σ)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) (q : TM1to0.Λ' M) :
    letI := statementEq
    letI := statementHash
    letI := postKeyEq M statementEq
    letI := postKeyHash M statementHash
    q ∈ postLabels M procedures stores statementEq statementHash ↔
      q ∈ StrongAssembly.streamedPostLabels M procedures stores := by
  let := statementEq
  let := statementHash
  let := postKeyEq M statementEq
  let := postKeyHash M statementHash
  exact (UniqueSupport.postLabels_mem M procedures stores q).trans
    (StrongAssembly.mem_streamedPostLabels M procedures stores q).symm

/-- State counts agree with the original deduplicated streamed traversal. -/
theorem postLabels_streamed_length (M : Λ → TM1.Stmt Bool Λ σ)
    (procedures : List Λ) (stores : List σ)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    letI := statementEq
    letI := statementHash
    letI := postKeyEq M statementEq
    letI := postKeyHash M statementHash
    (postLabels M procedures stores statementEq statementHash).length =
      (StrongAssembly.streamedPostLabels M procedures stores).length := by
  let := statementEq
  let := statementHash
  let := postKeyEq M statementEq
  let := postKeyHash M statementHash
  have old_nodup : (StrongAssembly.streamedPostLabels M procedures stores).Nodup :=
    (Std.HashSet.distinct_toList (m := _)).imp (by
      intro a b different equal
      simp [equal] at different)
  rw [← List.toFinset_card_of_nodup
    (postLabels_nodup M procedures stores statementEq statementHash),
    ← List.toFinset_card_of_nodup old_nodup]
  congr 1
  ext q
  simpa only [List.mem_toFinset] using
    postLabels_streamed_members M procedures stores statementEq statementHash q

end FiniteStores

/-- Package already-lowered Boolean control directly, without a second numbering pass. -/
@[noinline] def binaryPost (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) : NumberedPost :=
  letI := statementEq
  letI := statementHash
  letI := postKeyEq M statementEq
  letI := postKeyHash M statementHash
  let labels := postLabels M procedures stores statementEq statementHash
  let packed := hashNumberPack (TM1to0.tr M) labels
  ⟨labels.length, packed.machine, input⟩

omit [DecidableEq Λ] in
theorem binaryPost_input (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    (binaryPost M procedures stores input statementEq statementHash).input = input := rfl

omit [DecidableEq Λ] in
theorem binaryPost_extraStates (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    (binaryPost M procedures stores input statementEq statementHash).extraStates =
      (postLabels M procedures stores statementEq statementHash).length := rfl

omit [DecidableEq Λ] in
/-- The extra initial slot is included in the complete finite-machine state count. -/
theorem binaryPost_stateCount (M : Λ → TM1.Stmt Bool Λ σ) (procedures : List Λ)
    (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    letI := statementEq
    letI := statementHash
    (binaryPost M procedures stores input statementEq statementHash).extraStates + 1 =
      ((UniqueSupport.statements M procedures).size + 1) * (hashUnique stores).length + 1 := by
  let := statementEq
  let := statementHash
  change (UniqueSupport.postLabels M procedures stores).length + 1 = _
  rw [UniqueSupport.postLabels_length]

theorem binaryPost_halts [Finite σ] (M : Λ → TM1.Stmt Bool Λ σ)
    (procedures : List Λ) (support : TM1.Supports M procedures.toFinset)
    (stores : List σ) (cover : ∀ v, v ∈ stores) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool Λ σ))
    (statementHash : Hashable (TM1.Stmt Bool Λ σ)) :
    (binaryPost M procedures stores input statementEq statementHash).Halts ↔
      (TM1.eval M input).Dom := by
  let := statementEq
  let := statementHash
  let := postKeyEq M statementEq
  let := postKeyHash M statementHash
  let := Fintype.ofFinite σ
  have numbered := hashNumberPack_dom (TM1to0.tr M)
    (postLabels M procedures stores statementEq statementHash)
    (↑(postLabels M procedures stores statementEq statementHash).toFinset)
    (postLabels_supported M procedures support stores cover statementEq statementHash)
    (by intro q hq; exact List.mem_cons_of_mem _ (List.mem_toFinset.mp hq)) input
  change (TM0.eval (hashNumberPack _ _).machine input).Dom ↔ _
  exact numbered.trans (by rw [TM1to0.tr_eval])

/-- Numeric control uses every finite procedure exactly once as its root list. -/
@[noinline] def post {n : Nat} [Inhabited (Fin n)]
    (M : Fin n → TM1.Stmt Bool (Fin n) σ) (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool (Fin n) σ))
    (statementHash : Hashable (TM1.Stmt Bool (Fin n) σ)) : NumberedPost :=
  binaryPost M (List.finRange n) stores input statementEq statementHash

theorem post_input {n : Nat} [Inhabited (Fin n)]
    (M : Fin n → TM1.Stmt Bool (Fin n) σ) (stores : List σ) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool (Fin n) σ))
    (statementHash : Hashable (TM1.Stmt Bool (Fin n) σ)) :
    (post M stores input statementEq statementHash).input = input := rfl

theorem post_halts {n : Nat} [Inhabited (Fin n)] [Finite σ]
    (M : Fin n → TM1.Stmt Bool (Fin n) σ) (support : TM1.Supports M Finset.univ)
    (stores : List σ) (cover : ∀ v, v ∈ stores) (input : List Bool)
    (statementEq : DecidableEq (TM1.Stmt Bool (Fin n) σ))
    (statementHash : Hashable (TM1.Stmt Bool (Fin n) σ)) :
    (post M stores input statementEq statementHash).Halts ↔ (TM1.eval M input).Dom := by
  apply binaryPost_halts M (List.finRange n) _ stores cover input statementEq statementHash
  simpa using support

end ConjectureMachines.Compilation.UniqueAssembly
