/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Optimisation.FieldAware
public import Cryptids.Compilation.FieldPacking.Interface
public import Mathlib.Logic.Equiv.Sum
public import Mathlib.Algebra.BigOperators.Group.List.Basic

/-! # Exact ordered allocation of every frozen field-syntax node

The allocation folds the already certified balanced snapshot tree. At a branch it caches
both subtree totals in the resulting block and combines the two actual finite slot types.
Thus both directions of the equivalence follow a balanced path. No unused local slot,
reachability assumption, generated total, or proof-valued runtime callback is involved.
-/

@[expose] public section
namespace Chess.Optimisation.FieldPackedLayout
open ConjectureMachines.Compilation FieldCompiler

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 16384

/-- The inverse preserves numeric indices because the forward sigma map does so. -/
theorem sigmaCongrLeft_symm_val {α β : Type} (e : α ≃ β) (size : β → Nat)
    (s : Σ b : β, Fin (size b)) :
    ((Equiv.sigmaCongrLeft e).symm s).2.val = s.2.val := by
  obtain ⟨t, rfl⟩ :=
    (Equiv.sigmaCongrLeft (β := fun b ↦ Fin (size b)) e).surjective s
  rw [Equiv.symm_apply_apply]
  rfl

/-- A contiguous block of rows, together with its actual finite allocation. -/
structure Block where
  rows : Nat
  nodes : Nat
  size : Fin rows → Nat
  offset : Fin rows → Nat
  code : (Σ q : Fin rows, Fin (size q)) ≃ Fin nodes
  code_val : ∀ (q : Fin rows) (i : Fin (size q)),
    (code ⟨q, i⟩).val = offset q + i.val

namespace Block

def empty : Block where
  rows := 0
  nodes := 0
  size := Fin.elim0
  offset := Fin.elim0
  code :=
    { toFun := fun s ↦ Fin.elim0 s.1
      invFun := Fin.elim0
      left_inv := fun s ↦ Fin.elim0 s.1
      right_inv := fun i ↦ Fin.elim0 i }
  code_val := fun q ↦ Fin.elim0 q

def single (n : Nat) : Block where
  rows := 1
  nodes := n
  size := fun _ ↦ n
  offset := fun _ ↦ 0
  code :=
    { toFun := fun s ↦ s.2
      invFun := fun i ↦ ⟨0, i⟩
      left_inv := by
        rintro ⟨q, i⟩
        have same : q = 0 := Subsingleton.elim _ _
        subst q
        rfl
      right_inv := fun _ ↦ rfl }
  code_val := fun _ _ ↦ (Nat.zero_add _).symm

def appendSize (a b : Block) (q : Fin (a.rows + b.rows)) : Nat :=
  Sum.elim a.size b.size (finSumFinEquiv.symm q)

def appendOffset (a b : Block) (q : Fin (a.rows + b.rows)) : Nat :=
  Sum.elim a.offset (fun r ↦ a.nodes + b.offset r) (finSumFinEquiv.symm q)

/-- Split exactly the dependent row slots, preserving each local finite index. -/
def splitSlots (a b : Block) :
    (Σ q : Fin (a.rows + b.rows), Fin (appendSize a b q)) ≃
      (Σ q : Fin a.rows, Fin (a.size q)) ⊕ (Σ q : Fin b.rows, Fin (b.size q)) :=
  (Equiv.sigmaCongrLeft
    (finSumFinEquiv.symm : Fin (a.rows + b.rows) ≃ Fin a.rows ⊕ Fin b.rows)).trans
    (Equiv.sumSigmaDistrib (fun s ↦ Fin (Sum.elim a.size b.size s)))

/-- Inverse splitting preserves the local index, without reducing its dependent cast. -/
theorem splitSlots_symm_val (a b : Block)
    (t : (Σ q : Fin a.rows, Fin (a.size q)) ⊕ (Σ q : Fin b.rows, Fin (b.size q))) :
    ((splitSlots a b).symm t).2.val =
      Sum.elim (fun s ↦ s.2.val) (fun s ↦ s.2.val) t := by
  rcases t with ⟨r, j⟩ | ⟨r, j⟩
  · exact sigmaCongrLeft_symm_val
      (finSumFinEquiv.symm : Fin (a.rows + b.rows) ≃ Fin a.rows ⊕ Fin b.rows)
      (Sum.elim a.size b.size) ⟨Sum.inl r, j⟩
  · exact sigmaCongrLeft_symm_val
      (finSumFinEquiv.symm : Fin (a.rows + b.rows) ≃ Fin a.rows ⊕ Fin b.rows)
      (Sum.elim a.size b.size) ⟨Sum.inr r, j⟩

def appendCode (a b : Block) :
    (Σ q : Fin (a.rows + b.rows), Fin (appendSize a b q)) ≃
      Fin (a.nodes + b.nodes) :=
  ((splitSlots a b).trans (Equiv.sumCongr a.code b.code)).trans finSumFinEquiv

theorem appendCode_val (a b : Block) (q : Fin (a.rows + b.rows))
    (i : Fin (appendSize a b q)) :
    (appendCode a b ⟨q, i⟩).val = appendOffset a b q + i.val := by
  suffices ∀ s : Σ q : Fin (a.rows + b.rows), Fin (appendSize a b q),
      (appendCode a b s).val = appendOffset a b s.1 + s.2.val from this ⟨q, i⟩
  intro s
  obtain ⟨t, rfl⟩ := (splitSlots a b).symm.surjective s
  rcases t with ⟨r, j⟩ | ⟨r, j⟩
  · simp only [appendCode, Equiv.trans_apply, Equiv.apply_symm_apply,
      Equiv.sumCongr_apply, Sum.map_inl, finSumFinEquiv_apply_left, Fin.val_castAdd]
    rw [splitSlots_symm_val]
    simpa [splitSlots, Equiv.sigmaCongrLeft, Equiv.sumSigmaDistrib, appendOffset]
      using a.code_val r j
  · simp only [appendCode, Equiv.trans_apply, Equiv.apply_symm_apply,
      Equiv.sumCongr_apply, Sum.map_inr, finSumFinEquiv_apply_right, Fin.val_natAdd]
    rw [splitSlots_symm_val]
    simpa [splitSlots, Equiv.sigmaCongrLeft, Equiv.sumSigmaDistrib, appendOffset,
      Nat.add_assoc] using congrArg (a.nodes + ·) (b.code_val r j)

/-- Combining blocks adds their exact cardinalities; all branch fields are data. -/
def append (a b : Block) : Block where
  rows := a.rows + b.rows
  nodes := a.nodes + b.nodes
  size := appendSize a b
  offset := appendOffset a b
  code := appendCode a b
  code_val := appendCode_val a b

@[simp] theorem append_size_left (a b : Block) (q : Fin a.rows) :
    (append a b).size (q.castAdd b.rows) = a.size q := by
  simp [append, appendSize]

@[simp] theorem append_size_right (a b : Block) (q : Fin b.rows) :
    (append a b).size (Fin.natAdd a.rows q) = b.size q := by
  simp [append, appendSize]

/-- Fold the source tree once. The resulting functions descend through the same tree. -/
def ofTree {α : Type} (weight : α → Nat) : Balanced.RowTree α → Block
  | .empty => empty
  | .leaf row => single (weight row)
  | .branch _ left right => append (ofTree weight left) (ofTree weight right)

theorem ofTree_rows {α : Type} (weight : α → Nat) (tree : Balanced.RowTree α) :
    (ofTree weight tree).rows = tree.count := by
  induction tree with
  | empty => rfl
  | leaf row => rfl
  | branch _ left right ihl ihr =>
    simpa only [ofTree, append, Balanced.RowTree.count] using congrArg₂ (· + ·) ihl ihr

/-- Cached source-label lookup agrees with the weight at every actual row. -/
theorem ofTree_size {α : Type} (weight : α → Nat) (tree : Balanced.RowTree α)
    (valid : tree.WellFormed) (fallback : α) (q : Fin (ofTree weight tree).rows) :
    (ofTree weight tree).size q = weight (tree.lookup q.val fallback) := by
  induction tree with
  | empty => exact Fin.elim0 q
  | leaf row =>
    have zero : q.val = 0 := by have := q.isLt; change q.val < 1 at this; omega
    simp only [ofTree, single, Balanced.RowTree.lookup, zero, ↓reduceIte]
  | branch count left right ihl ihr =>
    obtain ⟨cache, vl, vr⟩ := valid
    change (append (ofTree weight left) (ofTree weight right)).size q = _
    refine Fin.addCases (fun r ↦ ?_) (fun r ↦ ?_) q
    · have before : r.val < count := by
        have := r.isLt
        have total := ofTree_rows weight left
        omega
      simpa only [append_size_left, Balanced.RowTree.lookup, Fin.val_castAdd,
        before, ↓reduceIte] using ihl vl r
    · have after : ¬(ofTree weight left).rows + r.val < (ofTree weight left).rows := by omega
      simpa only [append_size_right, Balanced.RowTree.lookup, Fin.val_natAdd,
        cache, ← ofTree_rows weight left, after, ↓reduceIte, Nat.add_sub_cancel_left]
        using ihr vr r

/-- The exact node total is also the ordinary sum of every leaf weight. -/
theorem ofTree_nodes {α : Type} (weight : α → Nat) (tree : Balanced.RowTree α) :
    (ofTree weight tree).nodes = (tree.flatten.map weight).sum := by
  induction tree <;> simp_all [ofTree, empty, single, append, Balanced.RowTree.flatten]

/-- The balanced arithmetic agrees with an ordinary left-to-right prefix sum. -/
theorem ofTree_offset {α : Type} (weight : α → Nat) (tree : Balanced.RowTree α)
    (q : Fin (ofTree weight tree).rows) :
    (ofTree weight tree).offset q = ((tree.flatten.map weight).take q.val).sum := by
  induction tree with
  | empty => exact Fin.elim0 q
  | leaf row =>
    simp [ofTree, single, Balanced.RowTree.flatten]
  | branch count left right ihl ihr =>
    change (append (ofTree weight left) (ofTree weight right)).offset q = _
    refine Fin.addCases (fun r ↦ ?_) (fun r ↦ ?_) q
    · have before : r.val ≤ (left.flatten.map weight).length := by
        have := r.isLt
        have total := ofTree_rows weight left
        have length_eq := Balanced.RowTree.count_eq_length left
        simp only [List.length_map]
        omega
      simpa only [append, appendOffset, finSumFinEquiv_symm_apply_castAdd,
        Sum.elim_inl, Fin.val_castAdd, Balanced.RowTree.flatten, List.map_append,
        List.take_append_of_le_length before] using ihl r
    · have count_eq : (ofTree weight left).rows = (left.flatten.map weight).length := by
        simp only [ofTree_rows, Balanced.RowTree.count_eq_length, List.length_map]
      simpa only [append, appendOffset, finSumFinEquiv_symm_apply_natAdd,
        Sum.elim_inr, Fin.val_natAdd, Balanced.RowTree.flatten, List.map_append,
        count_eq, List.take_length_add_append, List.sum_append, ← ofTree_nodes weight left]
        using congrArg ((ofTree weight left).nodes + ·) (ihr r)

end Block

/-- The source snapshot itself determines the allocation, including every leaf. -/
def packed : Block := Block.ofTree (fun row : Snapshot.Entry ↦ (lower row.1).size)
  Snapshot.entries

theorem packed_rows : packed.rows = 4042 :=
  (Block.ofTree_rows _ Snapshot.entries).trans Snapshot.entries_count

/-- Exact total is kernel reduction of the complete frozen syntax, not a native claim. -/
theorem packed_nodes : packed.nodes = 106668 := by
  rfl

def row (q : Fin 4042) : Fin packed.rows := q.cast packed_rows.symm

theorem packed_size (q : Fin 4042) : packed.size (row q) = (FieldAware.syntaxRows.get q).size := by
  rw [FieldAware.syntaxRows_get]
  exact Block.ofTree_size _ Snapshot.entries Snapshot.entries_wellFormed (.halt, .halt) (row q)

/-- Transport changes only the certified row and size bounds; all numeric data are retained. -/
def sourceSlots : FieldPacking.Slot FieldAware.syntaxRows ≃
    (Σ q : Fin packed.rows, Fin (packed.size q)) :=
  Equiv.sigmaCongr (finCongr packed_rows.symm) (fun q ↦ finCongr (packed_size q).symm)

theorem sourceSlots_fst (q : Fin 4042) (i : Fin (FieldAware.syntaxRows.get q).size) :
    (sourceSlots ⟨q, i⟩).1 = row q := by
  apply Fin.ext
  simp only [sourceSlots, Equiv.sigmaCongr, Equiv.trans_apply,
    Equiv.sigmaCongrRight_apply, Equiv.sigmaCongrLeft_apply, finCongr_apply, Fin.val_cast, row]

theorem sourceSlots_snd_val (q : Fin 4042) (i : Fin (FieldAware.syntaxRows.get q).size) :
    (sourceSlots ⟨q, i⟩).2.val = i.val := by
  change ((finCongr (packed_size q).symm) i).val = i.val
  simp only [finCongr_apply, Fin.val_cast]

/-- Exact padding-free allocation for all4042source labels. -/
def layout : FieldPacking.Layout FieldAware.syntaxRows 106668 where
  code := (sourceSlots.trans packed.code).trans (finCongr packed_nodes)
  ordered := by
    intro q i j below
    change ((finCongr packed_nodes) (packed.code (sourceSlots ⟨q, i⟩))).val <
      ((finCongr packed_nodes) (packed.code (sourceSlots ⟨q, j⟩))).val
    simp only [finCongr_apply, Fin.val_cast]
    change (packed.code ⟨row q, _⟩).val < (packed.code ⟨row q, _⟩).val
    rw [packed.code_val, packed.code_val]
    exact Nat.add_lt_add_left below _

/-- Prefix start of a source row in frozen source-label order. -/
def offset (q : Fin 4042) : Nat := packed.offset (row q)

/-- All row weights in the original source-label order, with no filtering. -/
def weights : List Nat := Snapshot.entries.flatten.map
  (fun row : Snapshot.Entry ↦ (lower row.1).size)

theorem weights_length : weights.length = 4042 := by
  simpa only [weights, List.length_map, ← Balanced.RowTree.count_eq_length]
    using Snapshot.entries_count

theorem weights_get (q : Fin 4042) :
    weights[q.val]'(by rw [weights_length]; exact q.isLt) =
      (FieldAware.syntaxRows.get q).size := by
  rw [← List.getD_eq_getElem weights 1 (by rw [weights_length]; exact q.isLt)]
  change (Snapshot.entries.flatten.map
    (fun row : Snapshot.Entry ↦ (lower row.1).size)).getD q.val
      ((lower (Op.halt : Op 4042)).size) = _
  rw [List.getD_map Snapshot.entries.flatten (.halt, .halt)
      (fun row : Snapshot.Entry ↦ (lower row.1).size),
    ← Balanced.RowTree.lookup_eq_getD Snapshot.entries Snapshot.entries_wellFormed]
  rw [FieldAware.syntaxRows_get]
  rfl

/-- Ordinary prefix arithmetic for independent numeric reconstructions. -/
def prefixSum (count : Nat) : Nat := (weights.take count).sum

theorem offset_eq_prefix (q : Fin 4042) : offset q = prefixSum q.val :=
  Block.ofTree_offset _ Snapshot.entries (row q)

theorem prefix_zero : prefixSum 0 = 0 := by simp [prefixSum]

theorem prefix_succ (q : Fin 4042) :
    prefixSum (q.val + 1) = prefixSum q.val + (FieldAware.syntaxRows.get q).size := by
  exact (List.sum_take_succ weights q.val (by rw [weights_length]; exact q.isLt)).trans
    (congrArg (prefixSum q.val + ·) (weights_get q))

/-- The final prefix is the exact total of all4042rows. -/
theorem prefix_end : prefixSum 4042 = 106668 := by
  change (weights.take 4042).sum = _
  rw [← weights_length, List.take_length]
  exact (Block.ofTree_nodes _ Snapshot.entries).symm.trans packed_nodes

theorem offset_zero : offset 0 = 0 := (offset_eq_prefix 0).trans prefix_zero

theorem offset_next (q : Fin 4041) :
    offset q.succ = offset q.castSucc + (FieldAware.syntaxRows.get q.castSucc).size := by
  simpa only [offset_eq_prefix, Fin.val_succ, Fin.val_castSucc] using prefix_succ q.castSucc

theorem offset_end :
    offset (Fin.last 4041) + (FieldAware.syntaxRows.get (Fin.last 4041)).size = 106668 := by
  rw [offset_eq_prefix, ← prefix_succ]
  exact prefix_end

/-- Numeric entrypoint used by independent complete-row reconstruction. -/
def index (q : Fin 4042) (i : Fin (FieldAware.syntaxRows.get q).size) : Fin 106668 :=
  layout.code ⟨q, i⟩

theorem code_val (q : Fin 4042) (i : Fin (FieldAware.syntaxRows.get q).size) :
    (layout.code ⟨q, i⟩).val = offset q + i.val := by
  change ((finCongr packed_nodes) (packed.code (sourceSlots ⟨q, i⟩))).val = _
  simp only [finCongr_apply, Fin.val_cast]
  change (packed.code ⟨(sourceSlots ⟨q, i⟩).1, (sourceSlots ⟨q, i⟩).2⟩).val = _
  rw [packed.code_val]
  exact congrArg₂ (· + ·) (congrArg packed.offset (sourceSlots_fst q i))
    (sourceSlots_snd_val q i)

theorem index_val (q : Fin 4042) (i : Fin (FieldAware.syntaxRows.get q).size) :
    (index q i).val = offset q + i.val := code_val q i

/-- Every paid global slot decodes to one actual source slot and round-trips exactly. -/
theorem complete (i : Fin 106668) : layout.code (layout.code.symm i) = i :=
  layout.code.apply_symm_apply i

/-- Different source/local slots never share an allocation. -/
theorem unique (a b : FieldPacking.Slot FieldAware.syntaxRows)
    (same : layout.code a = layout.code b) : a = b := layout.code.injective same

end Chess.Optimisation.FieldPackedLayout
