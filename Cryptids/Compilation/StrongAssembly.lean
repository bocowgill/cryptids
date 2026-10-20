/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.AssemblyFast
public import Mathlib.Computability.TuringMachine.ToPartrec

/-! # Scalable constructive finite-control construction

Nominal first-occurrence indexes, captured goto tables, a second numeric control pass, and
streamed support collection preserve both halting directions. Every hash collision still uses
full decidable equality. The frozen compiler remains unchanged.
-/

@[expose] public section
namespace ConjectureMachines.Compilation.StrongAssembly
open Turing
set_option maxSynthPendingDepth 128
set_option backward.isDefEq.respectTransparency false

theorem mem_hashUniqueWith {α : Type*} [DecidableEq α] (hasher : Hashable α)
    (xs : List α) (a : α) : a ∈ @hashUnique α _ hasher xs ↔ a ∈ xs :=
  @mem_hashUnique α _ hasher xs a

theorem nodup_hashUniqueWith {α : Type*} [DecidableEq α] (hasher : Hashable α)
    (xs : List α) : (@hashUnique α _ hasher xs).Nodup := by
  let : Hashable α := hasher
  change (Std.HashSet.ofList xs).toList.Nodup
  exact (Std.HashSet.distinct_toList (m := Std.HashSet.ofList xs)).imp (by
    intro a b different equal
    simp [equal] at different)

/-- Hash a finite observation table. No equality conclusion is drawn from the hash. -/
def tableHash {Γ σ α : Type*} [Hashable α] (symbols : List Γ) (stores : List σ)
    (f : Γ → σ → α) : UInt64 :=
  symbols.foldl (fun h a ↦ stores.foldl (fun h v ↦ mixHash h (hash (f a v))) h) 0

/-- Structural hash retaining observations at every supplied symbol/store pair. -/
def stmtHash {Γ Λ σ : Type*} [Hashable Γ] [Hashable Λ] [Hashable σ]
    (symbols : List Γ) (stores : List σ) : TM1.Stmt Γ Λ σ → UInt64
  | .move d q => mixHash (if d = .left then 0 else 1) (stmtHash symbols stores q)
  | .write f q => mixHash 2 (mixHash (tableHash symbols stores f) (stmtHash symbols stores q))
  | .load f q => mixHash 3 (mixHash (tableHash symbols stores f) (stmtHash symbols stores q))
  | .branch f q r => mixHash 4 (mixHash (tableHash symbols stores f)
      (mixHash (stmtHash symbols stores q) (stmtHash symbols stores r)))
  | .goto f => mixHash 5 (tableHash symbols stores f)
  | .halt => 6

/-- A finite observation list for a store-only function. -/
def storeHash {σ β : Type*} [Hashable β] (stores : List σ) (f : σ → β) : UInt64 :=
  stores.foldl (fun h v ↦ mixHash h (hash (f v))) 0

/-- Structural source hashing observes every supplied store and stack-top symbol. -/
def tm2StmtHash {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
    [DecidableEq K] [∀ k, DecidableEq (Γ k)] [Hashable Λ] [Hashable σ]
    (stackNames : List K) (letters : ∀ k, List (Γ k)) (stores : List σ) :
    TM2.Stmt Γ Λ σ → UInt64
  | .push k f q => mixHash 0 (mixHash (hash (stackNames.idxOf k))
      (mixHash (storeHash stores (fun v ↦ (letters k).idxOf (f v)))
        (tm2StmtHash stackNames letters stores q)))
  | .peek k f q => mixHash 1 (mixHash (hash (stackNames.idxOf k))
      (mixHash (tableHash stores (none :: (letters k).map some) f)
        (tm2StmtHash stackNames letters stores q)))
  | .pop k f q => mixHash 2 (mixHash (hash (stackNames.idxOf k))
      (mixHash (tableHash stores (none :: (letters k).map some) f)
        (tm2StmtHash stackNames letters stores q)))
  | .load f q => mixHash 3 (mixHash (storeHash stores f) (tm2StmtHash stackNames letters stores q))
  | .branch f q r => mixHash 4 (mixHash (storeHash stores f)
      (mixHash (tm2StmtHash stackNames letters stores q) (tm2StmtHash stackNames letters stores r)))
  | .goto f => mixHash 5 (storeHash stores f)
  | .halt => 6

/-- Hash a travelling stack action without interpreting its successor. -/
def stackActHash {K : Type*} {Γ : K → Type*} {σ : Type*}
    [∀ k, DecidableEq (Γ k)] [Hashable σ]
    (letters : ∀ k, List (Γ k)) (stores : List σ) {k : K} : TM2to1.StAct K Γ σ k → UInt64
  | .push f => mixHash 0 (storeHash stores (fun v ↦ (letters k).idxOf (f v)))
  | .peek f => mixHash 1 (tableHash stores (none :: (letters k).map some) f)
  | .pop f => mixHash 2 (tableHash stores (none :: (letters k).map some) f)

/-- Hash stack-emulator labels structurally, leaving equality to the complete decision procedure. -/
def stackLabelHash {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
    [DecidableEq K] [∀ k, DecidableEq (Γ k)] [Hashable Λ] [Hashable σ]
    (stackNames : List K) (letters : ∀ k, List (Γ k)) (stores : List σ) :
    TM2to1.Λ' K Γ Λ σ → UInt64
  | .normal l => mixHash 0 (hash l)
  | .go k action q => mixHash 1 (mixHash (hash (stackNames.idxOf k))
      (mixHash (stackActHash letters stores action) (tm2StmtHash stackNames letters stores q)))
  | .ret q => mixHash 2 (tm2StmtHash stackNames letters stores q)

/-- A structural hash for normalized shared-tape labels. All stores are observed. -/
@[instance_reducible] def sharedLabelHasher {K : Type*} {Γ : K → Type*} {Λ σ : Type*}
    [DecidableEq K] [∀ k, DecidableEq (Γ k)] [Hashable Λ] [Hashable σ]
    [Hashable (TM2to1.Γ' K Γ)] (stackNames : List K) (letters : ∀ k, List (Γ k))
    (stores : List σ) : Hashable (TM1.Stmt (TM2to1.Γ' K Γ) (TM2to1.Λ' K Γ Λ σ) σ) :=
  letI : Hashable (TM2to1.Λ' K Γ Λ σ) := ⟨stackLabelHash stackNames letters stores⟩
  ⟨stmtHash [default] stores⟩

/-- A payload-insensitive continuation hash; collisions still use complete source equality. -/
def partrecContHash : PartrecToTM2.Cont' → UInt64
  | .halt => 0
  | .cons₁ _ k => mixHash 1 (partrecContHash k)
  | .cons₂ k => mixHash 2 (partrecContHash k)
  | .comp _ k => mixHash 3 (partrecContHash k)
  | .fix _ k => mixHash 4 (partrecContHash k)

/-- Structural Partrec macro-label hashing with explicit finite function observations. -/
def partrecLabelHash : PartrecToTM2.Λ' → UInt64
  | .move p k l q => mixHash 0 (mixHash (storeHash [.consₗ, .cons, .bit0, .bit1] p)
      (mixHash (partrecStackHash k) (mixHash (partrecStackHash l) (partrecLabelHash q))))
  | .clear p k q => mixHash 1 (mixHash (storeHash [.consₗ, .cons, .bit0, .bit1] p)
      (mixHash (partrecStackHash k) (partrecLabelHash q)))
  | .copy q => mixHash 2 (partrecLabelHash q)
  | .push k f q => mixHash 3 (mixHash (partrecStackHash k)
      (mixHash (storeHash [none, some .consₗ, some .cons, some .bit0, some .bit1]
        (fun v ↦ partrecSymbolHash (f v))) (partrecLabelHash q)))
  | .read f => mixHash 4
      ([none, some .consₗ, some .cons, some .bit0, some .bit1].foldl
        (fun h v ↦ mixHash h (partrecLabelHash (f v))) 0)
  | .succ q => mixHash 5 (partrecLabelHash q)
  | .pred q r => mixHash 6 (mixHash (partrecLabelHash q) (partrecLabelHash r))
  | .ret k => mixHash 7 (partrecContHash k)
where
  partrecStackHash : PartrecToTM2.K' → UInt64
    | .main => 0 | .rev => 1 | .aux => 2 | .stack => 3
  partrecSymbolHash : Option PartrecToTM2.Γ' → UInt64
    | none => 0 | some .consₗ => 1 | some .cons => 2 | some .bit0 => 3 | some .bit1 => 4

section FirstIndex
variable {α : Type*} [DecidableEq α] [Hashable α]

/-- Insert from right to left, so each key retains its first source occurrence. -/
def firstPositions : List α → Nat → Std.HashMap α Nat
  | [], _ => {}
  | x :: xs, start => (firstPositions xs (start + 1)).insert x start

theorem firstPositions_lookup (xs : List α) (start : Nat) (q : α) :
    (firstPositions xs start)[q]? = (xs.idxOf? q).map (start + ·) := by
  induction xs generalizing start with
  | nil => simp [firstPositions]
  | cons x xs ih =>
    by_cases same : x = q
    · simp [firstPositions, List.idxOf?_cons, same]
    · simp [firstPositions, Std.HashMap.getElem?_insert, List.idxOf?_cons, same,
        ih, Option.map_map, Function.comp_def, Nat.add_comm, Nat.add_left_comm]

omit [Hashable α] in
private theorem idxOf?_formula (xs : List α) (q : α) :
    xs.idxOf? q = if q ∈ xs then some (xs.idxOf q) else none := by
  induction xs with
  | nil => simp
  | cons x xs ih =>
    by_cases same : x = q
    · simp [List.idxOf?_cons, same]
    · simp [List.idxOf?_cons, same, Ne.symm same, ih]

variable [Inhabited α]

/-- Nominal first-occurrence index; correctness proofs are erased during execution. -/
structure FirstNumberIndex (labels : List α) where
  values : Std.HashMap α Nat
  correct : ∀ q, values[q]? = (default :: labels).idxOf? q

/-- Materialize the entire first-occurrence map once. -/
@[noinline] def firstNumberIndex (labels : List α) : FirstNumberIndex labels :=
  ⟨firstPositions (default :: labels) 0, by
    intro q
    simpa using firstPositions_lookup (default :: labels) 0 q⟩

/-- Hash lookup returns a bounded first index, with zero for an unsupported key. -/
def FirstNumberIndex.get {labels : List α} (index : FirstNumberIndex labels) (q : α) :
    Fin (labels.length + 1) :=
  ⟨(index.values[q]?).getD 0, by
    rw [index.correct]
    cases h : (default :: labels).idxOf? q with
    | none => simp
    | some i => exact (List.idxOf?_eq_some_iff.mp h).1⟩

/-- The cached lookup is exactly the original first-occurrence numbering. -/
theorem FirstNumberIndex.get_eq {labels : List α} (index : FirstNumberIndex labels) :
    index.get = numberLabel labels := by
  funext q
  apply Fin.ext
  simp only [FirstNumberIndex.get, index.correct, idxOf?_formula, numberLabel]
  split <;> simp_all

/-- Capture a first-occurrence hash index and an inverse array before constructing control. -/
@[noinline] def cachedNumberProgram {Γ σ : Type*} (M : α → TM1.Stmt Γ α σ)
    (labels : List α) : CachedFunction (Fin (labels.length + 1))
      (TM1.Stmt Γ (Fin (labels.length + 1)) σ) :=
  let index := firstNumberIndex labels
  let originals := (default :: labels).toArray
  ⟨originals.map (fun q ↦ TM1Number.mapStmt index.get (M q)), Fin.val, .halt⟩

/-- Materialized numeric control agrees with the original numbering at every row. -/
theorem cachedNumberProgram_eq {Γ σ : Type*} (M : α → TM1.Stmt Γ α σ)
    (labels : List α) : (cachedNumberProgram M labels).get = TM1Number.numberProgram M labels := by
  funext q
  simp only [cachedNumberProgram, CachedFunction.get, FirstNumberIndex.get_eq,
    TM1Number.numberProgram, unnumberLabel, List.get_eq_getElem, Array.getElem?_map,
    List.getElem?_toArray]
  rw [List.getElem?_eq_getElem (by simp)]
  rfl
end FirstIndex

section HeadCache
variable {Γ Λ σ : Type*} [Inhabited Γ] [Inhabited σ] [DecidableEq Γ] [DecidableEq σ]

/-- Cache goto destinations on the full supplied head/store table. -/
def headMemoStmt (symbols : List Γ) (stores : List σ) : TM1.Stmt Γ Λ σ → TM1.Stmt Γ Λ σ
  | .move d q => .move d (headMemoStmt symbols stores q)
  | .write f q => .write f (headMemoStmt symbols stores q)
  | .load f q => .load f (headMemoStmt symbols stores q)
  | .branch f q r => .branch f (headMemoStmt symbols stores q) (headMemoStmt symbols stores r)
  | .goto f =>
    let table := cachedStore (symbols.flatMap fun a ↦ stores.map fun v ↦ (a, v))
      (fun av ↦ f av.1 av.2)
    .goto fun a v ↦ table.get (a, v)
  | .halt => .halt

/-- Full head/store caching preserves arbitrary TM1 statements, including head-dependent jumps. -/
theorem headMemoStmt_eq (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (q : TM1.Stmt Γ Λ σ) :
    headMemoStmt symbols stores q = q := by
  induction q with
  | move d q ih => exact congrArg (TM1.Stmt.move d) ih
  | write f q ih => exact congrArg (TM1.Stmt.write f) ih
  | load f q ih => exact congrArg (TM1.Stmt.load f) ih
  | branch p q r ihq ihr => simp only [headMemoStmt, ihq, ihr]
  | goto f =>
    change TM1.Stmt.goto (fun a v ↦ memoStore
      (symbols.flatMap fun a ↦ stores.map fun v ↦ (a, v)) (fun av ↦ f av.1 av.2) (a, v)) = _
    rw [memoStore_eq _ (by
      intro av
      exact List.mem_flatMap.mpr ⟨av.1, cover av.1,
        List.mem_map.mpr ⟨av.2, storeCover av.2, rfl⟩⟩)]
  | halt => rfl

/-- Capture every numeric row after caching all of its head-dependent goto tables. -/
@[noinline] def cachedHeadProgram {n : Nat} (symbols : List Γ) (stores : List σ)
    (M : Fin n → TM1.Stmt Γ (Fin n) σ) :
    CachedFunction (Fin n) (TM1.Stmt Γ (Fin n) σ) :=
  ⟨Array.ofFn (fun q ↦ headMemoStmt symbols stores (M q)), Fin.val, .halt⟩

/-- Array materialization plus full goto caching leaves the program exactly unchanged. -/
theorem cachedHeadProgram_eq {n : Nat} (symbols : List Γ) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores)
    (M : Fin n → TM1.Stmt Γ (Fin n) σ) : (cachedHeadProgram symbols stores M).get = M := by
  funext q
  simp [cachedHeadProgram, CachedFunction.get, headMemoStmt_eq symbols cover stores storeCover]
end HeadCache

/-- Insert one small generated row at a time, avoiding a complete flattened support list. -/
def hashFoldRows {α β : Type*} [DecidableEq β] [Hashable β]
    (rows : α → List β) (labels : List α) (initial : Std.HashSet β) : Std.HashSet β :=
  labels.foldl (fun support label ↦ support.insertMany (rows label)) initial

theorem mem_hashFoldRows {α β : Type*} [DecidableEq β] [Hashable β]
    (rows : α → List β) (labels : List α) (initial : Std.HashSet β) (q : β) :
    q ∈ hashFoldRows rows labels initial ↔ q ∈ initial ∨ ∃ l ∈ labels, q ∈ rows l := by
  induction labels generalizing initial with
  | nil => simp [hashFoldRows]
  | cons l labels ih =>
    simp only [hashFoldRows, List.foldl_cons] at *
    rw [ih, Std.HashSet.mem_insertMany_list]
    simp only [List.mem_cons, List.contains_iff_mem]
    aesop

/-- Stream finite Post support through a hash set, allocating one procedure row at a time. -/
def streamedPostLabels {Λ σ : Type} [Inhabited Λ] [Inhabited σ]
    [DecidableEq Λ] [Fintype σ] [DecidableEq σ]
    (M : Λ → TM1.Stmt Bool Λ σ) [Hashable (TM1to0.Λ' M)]
    (labels : List Λ) (stores : List σ) : List (TM1to0.Λ' M) :=
  let initial : Std.HashSet (TM1to0.Λ' M) := .ofList (stores.map fun v ↦ ((none, v) : TM1to0.Λ' M))
  (hashFoldRows (β := TM1to0.Λ' M) (fun l ↦ (subtermList (M l)).flatMap
      fun q ↦ stores.map fun v ↦ ((some q, v) : TM1to0.Λ' M))
    labels initial).toList

/-- Streaming retains precisely the old support traversal's members. -/
theorem mem_streamedPostLabels {Λ σ : Type} [Inhabited Λ] [Inhabited σ]
    [DecidableEq Λ] [Fintype σ] [DecidableEq σ]
    (M : Λ → TM1.Stmt Bool Λ σ) [Hashable (TM1to0.Λ' M)]
    (labels : List Λ) (stores : List σ) (q : TM1to0.Λ' M) :
    q ∈ streamedPostLabels M labels stores ↔ q ∈ postSupportList M labels stores := by
  simp only [streamedPostLabels, Std.HashSet.mem_toList, mem_hashFoldRows,
    Std.HashSet.mem_ofList, List.mem_map, List.mem_flatMap, postSupportList]
  aesop

section BinaryNumber
variable {Λ σ : Type} [Inhabited Λ] [DecidableEq Λ] [Hashable Λ]
variable [Inhabited σ] [Fintype σ] [DecidableEq σ] [Hashable σ]

/-- Second numeric-control pass with both Boolean heads cached before Post conversion. -/
@[noinline] def cachedBoolProgram (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ)
    (stores : List σ) : CachedFunction (Fin (labels.length + 1))
      (TM1.Stmt Bool (Fin (labels.length + 1)) σ) :=
  let numbered := cachedNumberProgram M labels
  cachedHeadProgram [false, true] stores numbered.get

omit [Fintype σ] [Hashable σ] in
/-- The second numeric-control cache is exactly the existing proved renaming. -/
theorem cachedBoolProgram_eq (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ)
    (stores : List σ) (cover : ∀ v, v ∈ stores) :
    (cachedBoolProgram M labels stores).get = TM1Number.numberProgram M labels := by
  change (cachedHeadProgram [false, true] stores (cachedNumberProgram M labels).get).get = _
  rw [cachedHeadProgram_eq _ (by intro a; cases a <;> simp) _ cover, cachedNumberProgram_eq]

/-- After numeric control, Post-label hashing only observes Boolean heads and finite stores. -/
@[instance_reducible] def boolPostHasher (n : Nat) (stores : List σ) :
    Hashable (Option (TM1.Stmt Bool (Fin n) σ) × σ) :=
  letI : Hashable (Fin n) := ⟨fun q ↦ hash q.val⟩
  letI : Hashable (TM1.Stmt Bool (Fin n) σ) := ⟨stmtHash [false, true] stores⟩
  inferInstance

/-- Supported Post control after the second numbering pass. -/
def boolPostLabels (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ) (stores : List σ) :
    List (TM1to0.Λ' (cachedBoolProgram M labels stores).get) :=
  let numbered := cachedBoolProgram M labels stores
  letI : Hashable (TM1to0.Λ' numbered.get) := boolPostHasher (labels.length + 1) stores
  streamedPostLabels numbered.get (List.finRange (labels.length + 1)) stores

/-- Every constructed numeric Post row stays in the explicitly enumerated support. -/
theorem boolPost_supported (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ)
    (stores : List σ) (cover : ∀ v, v ∈ stores) :
    TM0.Supports (TM1to0.tr (cachedBoolProgram M labels stores).get)
      ↑(boolPostLabels M labels stores).toFinset := by
  have hp : (boolPostLabels M labels stores).toFinset =
      TM1to0.trStmts (cachedBoolProgram M labels stores).get Finset.univ := by
    ext q
    simp only [boolPostLabels, List.mem_toFinset, mem_streamedPostLabels,
      mem_postSupportList _ _ _ cover, List.toFinset_finRange]
  rw [hp]
  apply TM1to0.tr_supports
  rw [cachedBoolProgram_eq M labels stores cover]
  exact TM1Number.numberProgram_supports _ _

/-- Build a Post machine after removing function-valued binary control labels. -/
@[noinline] def binaryPost (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ)
    (stores : List σ) (input : List Bool) : NumberedPost :=
  let numbered := cachedBoolProgram M labels stores
  letI : Hashable (TM1to0.Λ' numbered.get) := boolPostHasher (labels.length + 1) stores
  let qs := streamedPostLabels numbered.get (List.finRange (labels.length + 1)) stores
  let packed := hashNumberPack (TM1to0.tr numbered.get) qs
  ⟨qs.length, packed.machine, input⟩

/-- Two numeric passes retain both halting directions on the identical binary tape. -/
theorem binaryPost_halts (M : Λ → TM1.Stmt Bool Λ σ) (labels : List Λ)
    (support : TM1.Supports M (default :: labels).toFinset)
    (stores : List σ) (cover : ∀ v, v ∈ stores) (input : List Bool) :
    (binaryPost M labels stores input).Halts ↔ (TM1.eval M input).Dom := by
  let : Hashable (TM1to0.Λ' (cachedBoolProgram M labels stores).get) :=
    boolPostHasher (labels.length + 1) stores
  have hn := hashNumberPack_dom (TM1to0.tr (cachedBoolProgram M labels stores).get)
    (boolPostLabels M labels stores) (↑(boolPostLabels M labels stores).toFinset)
    (boolPost_supported M labels stores cover)
    (by intro q hq; exact List.mem_cons_of_mem _ (List.mem_toFinset.mp hq)) input
  change (TM0.eval (hashNumberPack _ (boolPostLabels M labels stores)).machine input).Dom ↔ _
  refine hn.trans ?_
  rw [TM1to0.tr_eval, cachedBoolProgram_eq M labels stores cover]
  exact TM1Number.numberProgram_dom M labels support input
end BinaryNumber

section
variable {K : Type} {Γ : K → Type} {Λ σ : Type}
variable [Fintype K] [DecidableEq K] [∀ k, Fintype (Γ k)] [∀ k, DecidableEq (Γ k)]
variable [Fintype σ] [DecidableEq σ] [DecidableEq Λ] [Inhabited Λ] [Inhabited σ]
variable [Hashable σ] [Hashable (TM2to1.Γ' K Γ)]
variable (M : Λ → TM2.Stmt Γ Λ σ) (C : BlockCode (TM2to1.Γ' K Γ)) (labels : List Λ)

/-- Materialize source numbering and goto tables once, rather than searching per jump. -/
@[noinline] def cachedSharedProgram
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M))) (stores : List σ) :
    CachedFunction (Fin ((sharedTapeLabels M labels).length + 1))
      (TM1.Stmt (TM2to1.Γ' K Γ) (Fin ((sharedTapeLabels M labels).length + 1)) σ) :=
  letI := sourceHash
  let numbered := cachedNumberProgram (TM1Normalize.tr (TM2to1.tr M)) (sharedTapeLabels M labels)
  cachedProgram stores numbered.get

omit [Hashable σ] [Hashable (TM2to1.Γ' K Γ)] in
/-- The materialized table agrees exactly with the previous shared-tape control. -/
theorem cachedSharedProgram_eq
    (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (stores : List σ) (cover : ∀ v, v ∈ stores) :
    (cachedSharedProgram M labels sourceHash stores).get = fastTM1 M labels := by
  let := sourceHash
  change (cachedProgram stores (cachedNumberProgram
    (TM1Normalize.tr (TM2to1.tr M)) (sharedTapeLabels M labels)).get).get = _
  rw [cachedNumberProgram_eq]
  exact memoProgram_eq stores cover (fastTM1 M labels) (fastTM1_allFree M labels)

/-- Hash binary-emulator labels before their second numeric-control pass. -/
@[instance_reducible] def binaryLabelHasher (stores : List σ) :
    Hashable (TM1to1.Λ' (TM2to1.Γ' K Γ)
      (Fin ((sharedTapeLabels M labels).length + 1)) σ) :=
  letI : Hashable (Fin ((sharedTapeLabels M labels).length + 1)) := ⟨fun q ↦ hash q.val⟩
  letI : Hashable (TM1.Stmt (TM2to1.Γ' K Γ)
      (Fin ((sharedTapeLabels M labels).length + 1)) σ) := ⟨stmtHash [default] stores⟩
  blockLabelHashable

/-- Numeric labels hash by value. Source continuations sample all stores; binary instructions
sample both bits and all stores. These explicit instances do not alter the old compiler. -/
@[instance_reducible] def postHasher (stores : List σ) :
    Hashable (TM1to0.Λ' (fastBinary M C labels stores)) :=
  letI : Hashable (Fin ((sharedTapeLabels M labels).length + 1)) := ⟨fun q ↦ hash q.val⟩
  letI : Hashable (TM1.Stmt (TM2to1.Γ' K Γ)
      (Fin ((sharedTapeLabels M labels).length + 1)) σ) :=
    ⟨stmtHash [default] stores⟩
  letI : Hashable (TM1to1.Λ' (TM2to1.Γ' K Γ)
      (Fin ((sharedTapeLabels M labels).length + 1)) σ) := blockLabelHashable
  letI : Hashable (TM1.Stmt Bool (TM1to1.Λ' (TM2to1.Γ' K Γ)
      (Fin ((sharedTapeLabels M labels).length + 1)) σ) σ) :=
    ⟨stmtHash [false, true] stores⟩
  inferInstanceAs (Hashable (Option (TM1.Stmt Bool
    (TM1to1.Λ' (TM2to1.Γ' K Γ) (Fin ((sharedTapeLabels M labels).length + 1)) σ) σ) × σ))

/-- The same ordered traversal, deduplicated with the explicitly stronger hasher. -/
def postLabels (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) :
    List (TM1to0.Λ' (fastBinary M C labels stores)) :=
  let source := cachedProgram stores (fastTM1 M labels)
  let binary := Block.compilerFree C source.get
  let binaryLabels := binarySupportList source.get
    (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols
  letI := postHasher M C labels stores
  hashUnique (postSupportList binary binaryLabels stores)

theorem mem_postLabels (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ)
    (q : TM1to0.Λ' (fastBinary M C labels stores)) :
    q ∈ postLabels M C labels symbols stores ↔ q ∈ fastLabels M C labels symbols stores := by
  simp only [postLabels, fastLabels, mem_hashUniqueWith]

theorem postLabels_toFinset (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) :
    (postLabels M C labels symbols stores).toFinset =
      (fastLabels M C labels symbols stores).toFinset := by
  ext q
  simp only [List.mem_toFinset, mem_postLabels]

theorem postLabels_length (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) :
    (postLabels M C labels symbols stores).length =
      (fastLabels M C labels symbols stores).length := by
  have left : (postLabels M C labels symbols stores).Nodup := by
    unfold postLabels
    exact nodup_hashUniqueWith _ _
  have right : (fastLabels M C labels symbols stores).Nodup := by
    unfold fastLabels
    exact nodup_hashUniqueWith _ _
  rw [← List.toFinset_card_of_nodup left, ← List.toFinset_card_of_nodup right,
    postLabels_toFinset]

theorem supported (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) :
    TM0.Supports (fastPost M C labels stores)
      ↑(postLabels M C labels symbols stores).toFinset := by
  rw [postLabels_toFinset]
  exact fast_supported M C labels symbols cover stores storeCover

/-- Only finite renumbering order changes; all source control and primitive operations remain. -/
def stack (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K)
    (input : List (Γ k)) : NumberedPost :=
  let source := cachedProgram stores (fastTM1 M labels)
  let binary := Block.compilerFree C source.get
  let qs := postLabels M C labels symbols stores
  letI : Hashable (TM1to0.Λ' binary) := postHasher M C labels stores
  letI : DecidableEq (TM1to0.Λ' binary) := fastPostDecidableEq M C labels stores
  let packed := hashNumberPack (TM1to0.tr binary) qs
  { extraStates := qs.length
    machine := packed.machine
    input := blockInput C (TM2to1.trInit k input) }

theorem stack_extraStates (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K)
    (input : List (Γ k)) :
    (stack M C labels symbols stores k input).extraStates =
      (fastStack M C labels symbols stores k).extraStates :=
  postLabels_length M C labels symbols stores

theorem stack_halts (ss : TM2.Supports M labels.toFinset)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (k : K) (input : List (Γ k)) :
    (stack M C labels symbols stores k input).Halts ↔ (TM2.eval M k input).Dom := by
  let : Hashable (TM1to0.Λ' (fastBinary M C labels stores)) := postHasher M C labels stores
  let : DecidableEq (TM1to0.Λ' (fastBinary M C labels stores)) :=
    fastPostDecidableEq M C labels stores
  have hn := hashNumberPack_dom (fastPost M C labels stores)
    (postLabels M C labels symbols stores)
    (↑(postLabels M C labels symbols stores).toFinset)
    (supported M C labels symbols cover stores storeCover)
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
  exact hn.trans hp

/-- A constructive source-to-Post backend with captured first-occurrence indexes at both stages. -/
@[noinline] def twiceStack (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    NumberedPost :=
  let source := cachedSharedProgram M labels sourceHash stores
  let binary := Block.compilerFree C source.get
  let binaryLabels := binarySupportList source.get
    (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols
  letI := binaryLabelHasher M labels stores
  binaryPost binary binaryLabels stores (blockInput C (TM2to1.trInit k input))

/-- The scalable backend retains both halting directions for every supported finite source input. -/
theorem twiceStack_halts (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (ss : TM2.Supports M labels.toFinset)
    (symbols : List (TM2to1.Γ' K Γ)) (cover : ∀ a, a ∈ symbols)
    (stores : List σ) (storeCover : ∀ v, v ∈ stores) (k : K) (input : List (Γ k)) :
    (twiceStack M C labels sourceHash symbols stores k input).Halts ↔
      (TM2.eval M k input).Dom := by
  let : Hashable (TM1to1.Λ' (TM2to1.Γ' K Γ)
    (Fin ((sharedTapeLabels M labels).length + 1)) σ) := binaryLabelHasher M labels stores
  have hm := cachedSharedProgram_eq M labels sourceHash stores storeCover
  have hs : TM1.Supports (cachedSharedProgram M labels sourceHash stores).get Finset.univ := by
    rw [hm]
    exact fastTM1_supports M labels
  have hf : ∀ q, Block.AllHeadFree ((cachedSharedProgram M labels sourceHash stores).get q) := by
    rw [hm]
    exact fastTM1_allFree M labels
  have hb : (binarySupportList (cachedSharedProgram M labels sourceHash stores).get
      (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols).toFinset =
      binarySupport (cachedSharedProgram M labels sourceHash stores).get Finset.univ := by
    ext q
    simp only [List.mem_toFinset, mem_binarySupportList _ _ _ cover,
      List.toFinset_finRange, binarySupport_eq]
  have hbs : TM1.Supports
      (Block.compilerFree C (cachedSharedProgram M labels sourceHash stores).get)
      (binarySupportList (cachedSharedProgram M labels sourceHash stores).get
        (List.finRange ((sharedTapeLabels M labels).length + 1)) symbols).toFinset := by
    rw [hb]
    exact Block.free_supports C _ hs
  have hn := binaryPost_halts
    (Block.compilerFree C (cachedSharedProgram M labels sourceHash stores).get) _
    (TM1Number.initialFirst_support _ _ hbs) stores storeCover
    (blockInput C (TM2to1.trInit k input))
  change (binaryPost _ _ stores _).Halts ↔ _
  refine hn.trans ((Block.free_dom C _ hs (fun q _ ↦ hf q) _).trans ?_)
  rw [hm]
  exact (TM1Number.numberProgram_dom _ _ (normalized_supports M labels ss) _).trans
    ((TM1Normalize.tr_eval_dom _ _).trans (TM2to1.tr_eval_dom M k input))

/-- The input tape is unchanged by either finite-control numbering pass. -/
theorem twiceStack_input (sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr M)))
    (symbols : List (TM2to1.Γ' K Γ)) (stores : List σ) (k : K) (input : List (Γ k)) :
    (twiceStack M C labels sourceHash symbols stores k input).input =
      blockInput C (TM2to1.trInit k input) := rfl

end
end ConjectureMachines.Compilation.StrongAssembly
