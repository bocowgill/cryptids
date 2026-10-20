/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.StrongAssembly
public import Cryptids.Compilation.ListEquality

/-! # Shared-tape construction with an explicitly captured equality algorithm

Every equality decision has the same mathematical result. Passing its implementation explicitly
changes construction cost while preserving the entire established numbered Post package.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.ListAssembly
open Turing
set_option maxSynthPendingDepth 128
set_option backward.isDefEq.respectTransparency false

namespace HeadFree
variable {Γ Λ σ : Type*} [Inhabited Γ]

abbrev Label (Γ Λ σ : Type*) [Inhabited Γ] :=
  {q : TM1.Stmt Γ Λ σ // Block.AllHeadFree q}

/-- Normalize certified syntax while carrying exact erased certificates into every destination. -/
def normalize (M : Λ → TM1.Stmt Γ Λ σ) (hM : ∀ l, Block.AllHeadFree (M l)) :
    Label Γ Λ σ → TM1.Stmt Γ (Label Γ Λ σ) σ
  | ⟨.move d q, hq⟩ => .move d (.goto fun _ _ ↦ ⟨q, hq⟩)
  | ⟨.write f q, hq⟩ => .write f (.goto fun _ _ ↦ ⟨q, hq⟩)
  | ⟨.load f q, hq⟩ => .load f (.goto fun _ _ ↦ ⟨q, hq⟩)
  | ⟨.branch p q r, hq⟩ => .branch p (.goto fun _ _ ↦ ⟨q, hq.1⟩)
      (.goto fun _ _ ↦ ⟨r, hq.2⟩)
  | ⟨.goto f, _⟩ => .goto fun a v ↦ ⟨M (f a v), hM _⟩
  | ⟨.halt, _⟩ => .halt

/-- Projection recovers the sealed normalization instruction exactly. -/
theorem project_normalize (M : Λ → TM1.Stmt Γ Λ σ)
    (hM : ∀ l, Block.AllHeadFree (M l)) (q : Label Γ Λ σ) :
    TM1Number.mapStmt (fun key : Label Γ Λ σ ↦ (key.val : TM1Normalize.Label M))
      (normalize M hM q) = TM1Normalize.tr M q.val := by
  rcases q with ⟨q, hq⟩
  cases q <;> rfl

omit [Inhabited Γ] in
/-- Control renaming composes without changing any primitive field. -/
theorem mapStmt_comp {A B C : Type*} (f : A → B) (g : B → C) (q : TM1.Stmt Γ A σ) :
    TM1Number.mapStmt g (TM1Number.mapStmt f q) = TM1Number.mapStmt (g ∘ f) q := by
  induction q <;> simp_all [TM1Number.mapStmt]

private theorem idxOf_map_injective {A B : Type*} [DecidableEq A] [DecidableEq B]
    (f : A → B) (injective : Function.Injective f) (xs : List A) (q : A) :
    (xs.map f).idxOf (f q) = xs.idxOf q := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [List.idxOf_cons, injective.eq_iff, ih]

/-- First-occurrence numeric values commute with an injective, initial-preserving projection. -/
theorem numberLabel_project {A B : Type*} [Inhabited A] [Inhabited B]
    [DecidableEq A] [DecidableEq B] (f : A → B) (injective : Function.Injective f)
    (initial : f default = default) (labels : List A) (q : A) :
    (numberLabel (labels.map f) (f q)).val = (numberLabel labels q).val := by
  have mem : f q ∈ (default : B) :: labels.map f ↔ q ∈ (default : A) :: labels := by
    rw [← initial, ← List.map_cons]
    simp [injective.eq_iff]
  simp only [numberLabel]
  split <;> split
  · simp only [← initial, ← List.map_cons, idxOf_map_injective f injective]
  · exact False.elim (‹¬ q ∈ default :: labels› (mem.mp ‹f q ∈ default :: labels.map f›))
  · exact False.elim (‹¬ f q ∈ default :: labels.map f› (mem.mpr ‹q ∈ default :: labels›))
  · rfl
/-- Add erased head-freedom certificates without checking the property at runtime. -/
def certify (labels : List (TM1.Stmt Γ Λ σ))
    (valid : ∀ q ∈ labels, Block.AllHeadFree q) : List (Label Γ Λ σ) :=
  labels.attach.map fun q ↦ ⟨q.val, valid q.val q.property⟩

theorem certify_project (labels : List (TM1.Stmt Γ Λ σ))
    (valid : ∀ q ∈ labels, Block.AllHeadFree q) :
    (certify labels valid).map Subtype.val = labels := by
  simp [certify, List.map_map, Function.comp_def]

variable [Inhabited Λ]
variable [Fintype Γ] [Fintype σ] [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]

/-- The certified initial key has the exact original initial statement as its data. -/
@[instance_reducible] def labelInhabited (M : Λ → TM1.Stmt Γ Λ σ)
    (hM : ∀ l, Block.AllHeadFree (M l)) : Inhabited (Label Γ Λ σ) :=
  ⟨⟨M default, hM default⟩⟩

/-- Build first-occurrence numbering using proof-carrying source keys and complete fast equality. -/
@[noinline] def cachedNormalizedProgram (M : Λ → TM1.Stmt Γ Λ σ)
    (hM : ∀ l, Block.AllHeadFree (M l))
    (labels : List (TM1Normalize.Label M))
    (valid : ∀ q ∈ labels, Block.AllHeadFree q)
    (sourceEq : DecidableEq (Label Γ Λ σ))
    (sourceHash : Hashable (TM1Normalize.Label M)) :
    CachedFunction (Fin (labels.length + 1)) (TM1.Stmt Γ (Fin (labels.length + 1)) σ) :=
  letI : Inhabited (Label Γ Λ σ) := labelInhabited M hM
  letI := sourceEq
  letI : Hashable (Label Γ Λ σ) := ⟨fun q ↦ sourceHash.hash q.val⟩
  let keys := certify labels valid
  let index := StrongAssembly.firstNumberIndex keys
  let lengthEq : keys.length + 1 = labels.length + 1 := by simp [keys, certify]
  let rename := fun q ↦ Fin.cast lengthEq (index.get q)
  ⟨((default :: keys).map fun q ↦ TM1Number.mapStmt rename (normalize M hM q)).toArray,
    Fin.val, .halt⟩

/-- Certified numbering produces exactly the original finite procedures. -/
theorem cachedNormalizedProgram_eq (M : Λ → TM1.Stmt Γ Λ σ)
    (hM : ∀ l, Block.AllHeadFree (M l))
    (labels : List (TM1Normalize.Label M))
    (valid : ∀ q ∈ labels, Block.AllHeadFree q)
    (sourceEq : DecidableEq (Label Γ Λ σ))
    (sourceHash : Hashable (TM1Normalize.Label M)) :
    (cachedNormalizedProgram M hM labels valid sourceEq sourceHash).get =
      TM1Number.numberProgram (TM1Normalize.tr M) labels := by
  let : Inhabited (Label Γ Λ σ) := labelInhabited M hM
  let := sourceEq
  let : Hashable (Label Γ Λ σ) := ⟨fun q ↦ sourceHash.hash q.val⟩
  let keys := certify labels valid
  let index := StrongAssembly.firstNumberIndex keys
  let lengthEq : keys.length + 1 = labels.length + 1 := by simp [keys, certify]
  have renameEq : (fun q ↦ Fin.cast lengthEq (index.get q)) =
      (fun q ↦ numberLabel labels q.val) := by
    funext q
    apply Fin.ext
    simp only [Fin.val_cast, StrongAssembly.FirstNumberIndex.get_eq]
    have h := numberLabel_project (B := TM1Normalize.Label M)
      (fun q : Label Γ Λ σ ↦ q.val)
      Subtype.val_injective (by rfl) keys q
    have project : keys.map (fun key ↦ (key.val : TM1Normalize.Label M)) = labels :=
      certify_project labels valid
    exact h.symm.trans (congrArg
      (fun xs : List (TM1Normalize.Label M) ↦ (numberLabel xs q.val).val) project)
  funext q
  change ((default :: keys).map (fun key ↦ TM1Number.mapStmt
    (fun key ↦ Fin.cast lengthEq (index.get key)) (normalize M hM key))).toArray[q.val]?.getD
      TM1.Stmt.halt = _
  rw [renameEq]
  simp only [List.getElem?_toArray, List.getElem?_map]
  have hq : q.val < (default :: keys).length := by simp [keys, certify]
  rw [List.getElem?_eq_getElem hq]
  simp only [Option.map_some, Option.getD_some]
  have renamed := mapStmt_comp (fun key : Label Γ Λ σ ↦ (key.val : TM1Normalize.Label M))
    (numberLabel labels) (normalize M hM ((default :: keys)[q.val]))
  have erased := congrArg (TM1Number.mapStmt (numberLabel labels))
    (project_normalize M hM ((default :: keys)[q.val]))
  have project := List.getElem_map (l := default :: keys) (f := Subtype.val)
    (i := q.val) (h := by simpa only [List.length_map] using hq)
  have source : ((default :: keys)[q.val]).val = unnumberLabel labels q := by
    change ((default :: keys)[q.val]).val = (M default :: labels)[q.val]
    have p := project.symm
    simp only [List.map_cons, keys, certify_project] at p
    change ((default :: keys)[q.val]).val = (M default :: labels)[q.val] at p
    exact p
  exact renamed.symm.trans (erased.trans (congrArg
    (fun key ↦ TM1Number.mapStmt (numberLabel labels) (TM1Normalize.tr M key)) source))

end HeadFree

namespace Certified
variable {Γ A B σ : Type*}

/-- Lift only certified goto destinations; finite support supplies each erased certificate. -/
def mapStmt (P : A → Prop) (S : Finset A) (valid : ∀ a ∈ S, P a)
    (rename : {a // P a} → B) :
    (q : TM1.Stmt Γ A σ) → TM1.SupportsStmt S q → TM1.Stmt Γ B σ
  | .move d q, hq => .move d (mapStmt P S valid rename q hq)
  | .write f q, hq => .write f (mapStmt P S valid rename q hq)
  | .load f q, hq => .load f (mapStmt P S valid rename q hq)
  | .branch p q r, hq => .branch p (mapStmt P S valid rename q hq.1)
      (mapStmt P S valid rename r hq.2)
  | .goto f, hq => .goto fun a v ↦ rename ⟨f a v, valid _ (hq a v)⟩
  | .halt, _ => .halt

/-- A certified renaming agrees exactly with the corresponding ordinary renaming. -/
theorem mapStmt_project (P : A → Prop) (S : Finset A) (valid : ∀ a ∈ S, P a)
    (rename : A → B) (q : TM1.Stmt Γ A σ) (hq : TM1.SupportsStmt S q) :
    mapStmt P S valid (fun a ↦ rename a.val) q hq = TM1Number.mapStmt rename q := by
  induction q with
  | move d q ih => exact congrArg (TM1.Stmt.move d) (ih hq)
  | write f q ih => exact congrArg (TM1.Stmt.write f) (ih hq)
  | load f q ih => exact congrArg (TM1.Stmt.load f) (ih hq)
  | branch p q r ihq ihr => simp only [mapStmt, TM1Number.mapStmt, ihq hq.1, ihr hq.2]
  | goto f => rfl
  | halt => rfl

/-- A finite ordered source support with proof-erased valid-key certificates. -/
def keys (P : A → Prop) (labels : List A) (valid : ∀ a ∈ labels, P a) : List {a // P a} :=
  labels.attach.map fun a ↦ ⟨a.val, valid a.val a.property⟩

theorem keys_project (P : A → Prop) (labels : List A) (valid : ∀ a ∈ labels, P a) :
    (keys P labels valid).map Subtype.val = labels := by
  simp [keys, List.map_map, Function.comp_def]

variable [Inhabited A] [DecidableEq A]

/-- The valid default key is chosen constructively from the supplied finite-support proof. -/
@[instance_reducible] def keyInhabited (P : A → Prop) (labels : List A)
    (valid : ∀ a ∈ default :: labels, P a) : Inhabited {a // P a} :=
  ⟨⟨default, valid _ List.mem_cons_self⟩⟩

/-- Number any finitely supported program using exact certified-key equality. -/
@[noinline] def cachedProgram (P : A → Prop) (M : A → TM1.Stmt Γ A σ) (labels : List A)
    (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) :
    CachedFunction (Fin (labels.length + 1)) (TM1.Stmt Γ (Fin (labels.length + 1)) σ) :=
  letI : Inhabited {a // P a} := keyInhabited P labels valid
  letI := keyEq
  letI : Hashable {a // P a} := ⟨fun a ↦ sourceHash.hash a.val⟩
  let certified := keys P labels (fun a ha ↦ valid a (List.mem_cons_of_mem _ ha))
  let index := StrongAssembly.firstNumberIndex certified
  let lengthEq : certified.length + 1 = labels.length + 1 := by simp [certified, keys]
  let rename := fun a ↦ Fin.cast lengthEq (index.get a)
  ⟨((default :: labels).attach.map fun a ↦
      mapStmt P (default :: labels).toFinset
        (fun a ha ↦ valid a (List.mem_toFinset.mp ha)) rename (M a.val)
        (support.2 a.val (List.mem_toFinset.mpr a.property))).toArray,
    Fin.val, .halt⟩

/-- Certified target packing preserves every original numeric row, including initial duplicates. -/
theorem cachedProgram_eq (P : A → Prop) (M : A → TM1.Stmt Γ A σ) (labels : List A)
    (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) :
    (cachedProgram P M labels support valid keyEq sourceHash).get =
      TM1Number.numberProgram M labels := by
  let : Inhabited {a // P a} := keyInhabited P labels valid
  let := keyEq
  let : Hashable {a // P a} := ⟨fun a ↦ sourceHash.hash a.val⟩
  let certified := keys P labels (fun a ha ↦ valid a (List.mem_cons_of_mem _ ha))
  let index := StrongAssembly.firstNumberIndex certified
  let lengthEq : certified.length + 1 = labels.length + 1 := by simp [certified, keys]
  have renameEq : (fun a ↦ Fin.cast lengthEq (index.get a)) =
      (fun a ↦ numberLabel labels a.val) := by
    funext a
    apply Fin.ext
    simp only [Fin.val_cast, StrongAssembly.FirstNumberIndex.get_eq]
    have h := HeadFree.numberLabel_project (fun a : {a // P a} ↦ a.val)
      Subtype.val_injective (by rfl) certified a
    have project : certified.map Subtype.val = labels := keys_project P labels _
    exact h.symm.trans (congrArg (fun xs ↦ (numberLabel xs a.val).val) project)
  funext q
  change ((default :: labels).attach.map (fun a ↦
    mapStmt P (default :: labels).toFinset
      (fun a ha ↦ valid a (List.mem_toFinset.mp ha))
      (fun a ↦ Fin.cast lengthEq (index.get a)) (M a.val)
      (support.2 a.val (List.mem_toFinset.mpr a.property)))).toArray[q.val]?.getD
        TM1.Stmt.halt = _
  rw [renameEq]
  simp only [mapStmt_project]
  simp only [List.attach_cons, List.map_cons, List.map_map, Function.comp_apply, List.map_subtype,
    List.unattach_attach, List.size_toArray, List.length_cons, List.length_map, Fin.is_lt,
    getElem?_pos, List.getElem_toArray, Option.getD_some, TM1Number.numberProgram,
    unnumberLabel, List.get_eq_getElem]
  change ((default :: labels).map (fun x ↦ TM1Number.mapStmt (numberLabel labels) (M x)))[q.val] = _
  exact List.getElem_map _
/-- Nominal per-row construction retains the finite index without retaining all expanded rows. -/
structure IndexedProgram (Γ σ : Type*) (n : Nat) where
  get : Fin n → TM1.Stmt Γ (Fin n) σ
  indexEntries : Nat
  sourceStates : Nat

/-- Capture a certified index and inverse array; construct only the requested numeric procedure. -/
@[noinline] def indexedProgram (P : A → Prop) (M : A → TM1.Stmt Γ A σ) (labels : List A)
    (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) : IndexedProgram Γ σ (labels.length + 1) :=
  letI : Inhabited {a // P a} := keyInhabited P labels valid
  letI := keyEq
  letI : Hashable {a // P a} := ⟨fun a ↦ sourceHash.hash a.val⟩
  let certified := keys P labels (fun a ha ↦ valid a (List.mem_cons_of_mem _ ha))
  let index := StrongAssembly.firstNumberIndex certified
  let lengthEq : certified.length + 1 = labels.length + 1 := by simp [certified, keys]
  let rename := fun a ↦ Fin.cast lengthEq (index.get a)
  let originals := (default :: labels).attach.toArray
  ⟨(fun q ↦
    let original := originals[q.val]'(by simp [originals])
    mapStmt P (default :: labels).toFinset
      (fun a ha ↦ valid a (List.mem_toFinset.mp ha)) rename (M original.val)
      (support.2 original.val (List.mem_toFinset.mpr original.property))),
    index.values.size, labels.length + 1⟩

/-- Per-row construction agrees with the established program at every numeric position. -/
theorem indexedProgram_eq (P : A → Prop) (M : A → TM1.Stmt Γ A σ) (labels : List A)
    (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) :
    (indexedProgram P M labels support valid keyEq sourceHash).get =
      TM1Number.numberProgram M labels := by
  let : Inhabited {a // P a} := keyInhabited P labels valid
  let := keyEq
  let : Hashable {a // P a} := ⟨fun a ↦ sourceHash.hash a.val⟩
  let certified := keys P labels (fun a ha ↦ valid a (List.mem_cons_of_mem _ ha))
  let index := StrongAssembly.firstNumberIndex certified
  let lengthEq : certified.length + 1 = labels.length + 1 := by simp [certified, keys]
  have renameEq : (fun a ↦ Fin.cast lengthEq (index.get a)) =
      (fun a ↦ numberLabel labels a.val) := by
    funext a
    apply Fin.ext
    simp only [Fin.val_cast, StrongAssembly.FirstNumberIndex.get_eq]
    have h := HeadFree.numberLabel_project (fun a : {a // P a} ↦ a.val)
      Subtype.val_injective (by rfl) certified a
    have project : certified.map Subtype.val = labels := keys_project P labels _
    exact h.symm.trans (congrArg (fun xs ↦ (numberLabel xs a.val).val) project)
  funext q
  change mapStmt P (default :: labels).toFinset _
    (fun a ↦ Fin.cast lengthEq (index.get a)) _ _ = _
  rw [renameEq, mapStmt_project]
  simp only [List.getElem_toArray, List.getElem_attach, TM1Number.numberProgram,
    unnumberLabel, List.get_eq_getElem]

variable [Inhabited σ] [DecidableEq σ]

/-- Cache each requested Boolean/store goto table, without retaining a whole expanded matrix. -/
@[noinline] def indexedBoolProgram (P : A → Prop) (M : A → TM1.Stmt Bool A σ)
    (labels : List A) (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) (stores : List σ) : IndexedProgram Bool σ (labels.length + 1) :=
  let indexed := indexedProgram P M labels support valid keyEq sourceHash
  ⟨(fun q ↦ StrongAssembly.headMemoStmt [false, true] stores (indexed.get q)),
    indexed.indexEntries, indexed.sourceStates⟩

/-- Per-row Boolean/store caching preserves exact numeric procedures. -/
theorem indexedBoolProgram_eq (P : A → Prop) (M : A → TM1.Stmt Bool A σ)
    (labels : List A) (support : TM1.Supports M (default :: labels).toFinset)
    (valid : ∀ a ∈ default :: labels, P a) (keyEq : DecidableEq {a // P a})
    (sourceHash : Hashable A) (stores : List σ) (cover : ∀ v, v ∈ stores) :
    (indexedBoolProgram P M labels support valid keyEq sourceHash stores).get =
      TM1Number.numberProgram M labels := by
  funext q
  change StrongAssembly.headMemoStmt [false, true] stores
    ((indexedProgram P M labels support valid keyEq sourceHash).get q) = _
  rw [indexedProgram_eq, StrongAssembly.headMemoStmt_eq _ (by intro a; cases a <;> simp) _ cover]

end Certified

namespace BinaryIndex
variable {Γ Λ σ : Type*} [Inhabited Γ]

/-- Every binary-write label retains a source continuation with proved head-free jumps. -/
theorem writes_valid (symbols : List Γ) (q : TM1.Stmt Γ Λ σ)
    (free : Block.AllHeadFree q) (label : TM1to1.Λ' Γ Λ σ)
    (member : label ∈ binaryWriteList symbols q) : ListEquality.BinaryLabelFree label := by
  induction q with
  | move d q ih => exact ih free member
  | load f q ih => exact ih free member
  | write f q ih =>
    rcases List.mem_append.mp member with h | h
    · obtain ⟨symbol, _, rfl⟩ := List.mem_map.mp h
      exact free
    · exact ih free h
  | branch p q r ihq ihr =>
    rcases List.mem_append.mp member with h | h
    · exact ihq free.1 h
    · exact ihr free.2 h
  | goto f => simp [binaryWriteList] at member
  | halt => simp [binaryWriteList] at member

/-- All ordered binary labels carry a valid erased continuation certificate. -/
theorem labels_valid (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (free : ∀ l ∈ labels, Block.AllHeadFree (source l)) (symbols : List Γ)
    (label : TM1to1.Λ' Γ Λ σ) (member : label ∈ binarySupportList source labels symbols) :
    ListEquality.BinaryLabelFree label := by
  obtain ⟨l, hl, member⟩ := List.mem_flatMap.mp member
  rcases List.mem_cons.mp member with same | member
  · subst label
    trivial
  · exact writes_valid symbols (source l) (free l hl) label member

variable [Inhabited Λ] [Fintype Γ] [Fintype σ]
variable [DecidableEq Γ] [DecidableEq Λ] [DecidableEq σ]

/-- Binary alphabet lowering retains the original ordered support. -/
theorem supports (C : BlockCode Γ) (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (ss : TM1.Supports source labels.toFinset) (symbols : List Γ) (cover : ∀ a, a ∈ symbols) :
    TM1.Supports (Block.compilerFree C source)
      (default :: binarySupportList source labels symbols).toFinset := by
  apply TM1Number.initialFirst_support
  have h : (binarySupportList source labels symbols).toFinset =
      binarySupport source labels.toFinset := by
    ext q
    simp only [List.mem_toFinset, mem_binarySupportList _ _ _ cover, binarySupport_eq]
  rw [h]
  exact Block.free_supports C source ss

variable [Inhabited σ]

/-- Construct a second-pass numeric getter with certified write keys and per-row goto caching. -/
@[noinline] def program (C : BlockCode Γ) (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (ss : TM1.Supports source labels.toFinset) (free : ∀ l ∈ labels, Block.AllHeadFree (source l))
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols) (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (sourceHash : Hashable (TM1to1.Λ' Γ Λ σ)) :
    Certified.IndexedProgram Bool σ ((binarySupportList source labels symbols).length + 1) :=
  let binary := Block.compilerFree C source
  let binaryLabels := binarySupportList source labels symbols
  let supported := supports C source labels ss symbols cover
  let valid : ∀ l ∈ default :: binaryLabels, ListEquality.BinaryLabelFree l := by
    intro l hl
    rcases List.mem_cons.mp hl with h | h
    · subst l
      trivial
    · exact labels_valid source labels free symbols l h
  let keyEq := ListEquality.binaryFreeLabelDecEq symbols cover stores storeCover
  Certified.indexedBoolProgram ListEquality.BinaryLabelFree binary binaryLabels supported valid
    keyEq sourceHash stores

/-- The scalable second-pass getter is exactly the established finite numeric program. -/
theorem program_eq (C : BlockCode Γ) (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (ss : TM1.Supports source labels.toFinset) (free : ∀ l ∈ labels, Block.AllHeadFree (source l))
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols) (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (sourceHash : Hashable (TM1to1.Λ' Γ Λ σ)) :
    (program C source labels ss free symbols cover stores storeCover sourceHash).get =
      TM1Number.numberProgram (Block.compilerFree C source)
        (binarySupportList source labels symbols) := by
  unfold program
  exact Certified.indexedBoolProgram_eq _ _ _ _ _ _ _ stores storeCover

/-- Both halting directions hold on the unchanged binary tape. -/
theorem program_dom (C : BlockCode Γ) (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (ss : TM1.Supports source labels.toFinset) (free : ∀ l ∈ labels, Block.AllHeadFree (source l))
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols) (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (sourceHash : Hashable (TM1to1.Λ' Γ Λ σ)) (input : List Bool) :
    (TM1.eval
      (program C source labels ss free symbols cover stores storeCover sourceHash).get input).Dom ↔
      (TM1.eval (Block.compilerFree C source) input).Dom := by
  rw [program_eq]
  exact TM1Number.numberProgram_dom _ _ (supports C source labels ss symbols cover) input

/-- The new numeric procedures have the same complete finite control support. -/
theorem program_supports (C : BlockCode Γ) (source : Λ → TM1.Stmt Γ Λ σ) (labels : List Λ)
    (ss : TM1.Supports source labels.toFinset) (free : ∀ l ∈ labels, Block.AllHeadFree (source l))
    (symbols : List Γ) (cover : ∀ a, a ∈ symbols) (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (sourceHash : Hashable (TM1to1.Λ' Γ Λ σ)) :
    TM1.Supports (program C source labels ss free symbols cover stores storeCover sourceHash).get
      Finset.univ := by
  rw [program_eq]
  exact TM1Number.numberProgram_supports _ _
end BinaryIndex

section
variable {K : Type} {Γ : K → Type} {Λ σ : Type}
variable [Fintype K] [DecidableEq K] [∀ k, Fintype (Γ k)] [∀ k, DecidableEq (Γ k)]
variable [Fintype σ] [DecidableEq σ] [DecidableEq Λ] [Inhabited Λ] [Inhabited σ]
variable [Hashable σ] [Hashable (TM2to1.Γ' K Γ)]
variable (M : Λ → TM2.Stmt Γ Λ σ) (C : BlockCode (TM2to1.Γ' K Γ)) (labels : List Λ)

/-- Capture the supplied exact equality procedure before constructing the first-occurrence map. -/
@[noinline] def cachedSharedProgram
    (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M))) (stores : List σ) :
    CachedFunction (Fin ((sharedTapeLabels M labels).length + 1))
      (TM1.Stmt (TM2to1.Γ' K Γ) (Fin ((sharedTapeLabels M labels).length + 1)) σ) :=
  letI := sourceEq
  letI := sourceHash
  let numbered := StrongAssembly.cachedNumberProgram
    (TM1Normalize.tr (TM2to1.tr M)) (sharedTapeLabels M labels)
  cachedProgram stores numbered.get

omit [Hashable σ] [Hashable (TM2to1.Γ' K Γ)] in
/-- Uniqueness of exact decisions makes the captured cache identical to the established cache. -/
theorem cachedSharedProgram_eq
    (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M))) (stores : List σ) :
    cachedSharedProgram M labels sourceEq sourceHash stores =
      StrongAssembly.cachedSharedProgram M labels sourceHash stores := by
  have h : sourceEq = (tm1StmtDecidableEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M))) :=
    Subsingleton.elim _ _
  unfold cachedSharedProgram StrongAssembly.cachedSharedProgram
  rw [h]

/-- Use explicit equality for first-pass indexing; retain the sealed binary/Post backend. -/
@[noinline] def stack (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    NumberedPost :=
  let source := cachedSharedProgram M labels sourceEq sourceHash stores
  let binary := Block.compilerFree C source.get
  let binaryLabels := binarySupportList source.get
    (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols
  letI := StrongAssembly.binaryLabelHasher M labels stores
  StrongAssembly.binaryPost binary binaryLabels stores (blockInput C (TM2to1.trInit k input))

/-- Equality coherence preserves the complete package, including its exact state count/order. -/
theorem stack_eq (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    stack M C labels sourceEq sourceHash symbols stores k input =
      StrongAssembly.twiceStack M C labels sourceHash symbols stores k input := by
  unfold stack StrongAssembly.twiceStack
  rw [cachedSharedProgram_eq]

/-- Both halting directions hold for every supported source and arbitrary finite stack input. -/
theorem stack_halts (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (ss : TM2.Supports M labels.toFinset)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (k : K) (input : List (Γ k)) :
    (stack M C labels sourceEq sourceHash symbols stores k input).Halts ↔
      (TM2.eval M k input).Dom := by
  rw [stack_eq]
  exact StrongAssembly.twiceStack_halts M C labels sourceHash ss symbols cover
    stores storeCover k input

omit [DecidableEq Λ] in
/-- Changing only the equality algorithm cannot change the paid input tape. -/
theorem stack_input (sourceEq : DecidableEq (TM1Normalize.Label (TM2to1.tr M)))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    (stack M C labels sourceEq sourceHash symbols stores k input).input =
      blockInput C (TM2to1.trInit k input) := rfl

omit [Fintype K] [∀ k, Fintype (Γ k)] [∀ k, DecidableEq (Γ k)]
  [Fintype σ] [DecidableEq σ] [DecidableEq Λ] [Inhabited Λ] [Inhabited σ]
  [Hashable σ] [Hashable (TM2to1.Γ' K Γ)] in
/-- Every ordered shared-tape source label is a certified substatement of an actual TM2 body. -/
theorem sharedLabels_headFree (q : TM1Normalize.Label (TM2to1.tr M))
    (hq : q ∈ sharedTapeLabels M labels) : Block.AllHeadFree q := by
  obtain ⟨l, _, subterm⟩ := (TM1Normalize.mem_supportList (TM2to1.tr M)
    (stackSupportList M labels) q).mp hq
  exact FreeNormalize.subterm_allFree (FreeNormalize.stack_allFree M l) subterm

/-- Materialize certified source numbering; certificates erase and never trigger runtime checks. -/
@[noinline] def cachedFreeSharedProgram
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M))) (stores : List σ) :
    CachedFunction (Fin ((sharedTapeLabels M labels).length + 1))
      (TM1.Stmt (TM2to1.Γ' K Γ) (Fin ((sharedTapeLabels M labels).length + 1)) σ) :=
  let numbered := HeadFree.cachedNormalizedProgram (TM2to1.tr M)
    (FreeNormalize.stack_allFree M) (sharedTapeLabels M labels)
    (sharedLabels_headFree M labels) sourceEq sourceHash
  cachedProgram stores numbered.get

omit [Hashable σ] [Hashable (TM2to1.Γ' K Γ)] in
/-- The certified fast key algorithm produces exactly the old finite shared-tape program. -/
theorem cachedFreeSharedProgram_eq
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (stores : List σ) (cover : ∀ v, v ∈ stores) :
    (cachedFreeSharedProgram M labels sourceEq sourceHash stores).get = fastTM1 M labels := by
  change (cachedProgram stores (HeadFree.cachedNormalizedProgram (TM2to1.tr M)
    (FreeNormalize.stack_allFree M) (sharedTapeLabels M labels)
    (sharedLabels_headFree M labels) sourceEq sourceHash).get).get = _
  rw [HeadFree.cachedNormalizedProgram_eq]
  exact memoProgram_eq stores cover (fastTM1 M labels) (fastTM1_allFree M labels)

/-- The certified route changes only equality cost and retains the sealed binary/Post backend. -/
@[noinline] def freeStack
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    NumberedPost :=
  let source := cachedFreeSharedProgram M labels sourceEq sourceHash stores
  let binary := Block.compilerFree C source.get
  let binaryLabels := binarySupportList source.get
    (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols
  letI := StrongAssembly.binaryLabelHasher M labels stores
  StrongAssembly.binaryPost binary binaryLabels stores (blockInput C (TM2to1.trInit k input))

/-- Even the proof-carrying route preserves the complete state package and ordering exactly. -/
theorem freeStack_eq
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (cover : ∀ v, v ∈ stores)
    (k : K) (input : List (Γ k)) :
    freeStack M C labels sourceEq sourceHash symbols stores k input =
      StrongAssembly.twiceStack M C labels sourceHash symbols stores k input := by
  have hm : (cachedFreeSharedProgram M labels sourceEq sourceHash stores).get =
      (StrongAssembly.cachedSharedProgram M labels sourceHash stores).get :=
    (cachedFreeSharedProgram_eq M labels sourceEq sourceHash stores cover).trans
      (StrongAssembly.cachedSharedProgram_eq M labels sourceHash stores cover).symm
  unfold freeStack StrongAssembly.twiceStack
  dsimp only
  rw [hm]

/-- Both halting directions survive the certified source-label equality implementation. -/
theorem freeStack_halts
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (ss : TM2.Supports M labels.toFinset)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (k : K) (input : List (Γ k)) :
    (freeStack M C labels sourceEq sourceHash symbols stores k input).Halts ↔
      (TM2.eval M k input).Dom := by
  rw [freeStack_eq M C labels sourceEq sourceHash symbols stores storeCover]
  exact StrongAssembly.twiceStack_halts M C labels sourceHash ss symbols cover
    stores storeCover k input

omit [DecidableEq Λ] in
theorem freeStack_input
    (sourceEq : DecidableEq (HeadFree.Label (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ))
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    (freeStack M C labels sourceEq sourceHash symbols stores k input).input =
      blockInput C (TM2to1.trInit k input) := rfl

end
end ConjectureMachines.Compilation.ListAssembly
