module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Loaders
public import Cryptids.Chess.Optimisation.FieldSelective
public import Cryptids.Compilation.LocalCertificate

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
-- Check every raw leaf; no modulo conversion can conceal an out-of-range value.
def mapAllBelow : Balanced.RowTree Nat → Nat → Bool
  | .empty, _ => true
  | .leaf value, bound => decide (value < bound)
  | .branch _ left right, bound => mapAllBelow left bound && mapAllBelow right bound

theorem lookup_lt_of_allBelow (tree : Balanced.RowTree Nat) (bound fallback : Nat)
    (bounded : mapAllBelow tree bound = true) (fallback_lt : fallback < bound)
    (index : Nat) : tree.lookup index fallback < bound := by
  induction tree generalizing index with
  | empty => exact fallback_lt
  | leaf value =>
      have value_lt : value < bound := of_decide_eq_true bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact value_lt
      · exact fallback_lt
  | branch leftCount left right ihl ihr =>
      have both : mapAllBelow left bound = true ∧ mapAllBelow right bound = true := by
        simpa only [mapAllBelow, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

theorem map_count_branch (left right : Balanced.RowTree Nat) (nl nr : Nat)
    (hl : left.count = nl) (hr : right.count = nr) :
    (Balanced.RowTree.branch nl left right).count = nl + nr :=
  congrArg₂ Nat.add hl hr

theorem map_valid_branch (left right : Balanced.RowTree Nat) (nl : Nat)
    (hc : left.count = nl) (hl : left.WellFormed) (hr : right.WellFormed) :
    (Balanced.RowTree.branch nl left right).WellFormed :=
  ⟨hc.symm, hl, hr⟩

theorem map_bounded_branch (left right : Balanced.RowTree Nat) (nl bound : Nat)
    (hl : mapAllBelow left bound = true) (hr : mapAllBelow right bound = true) :
    mapAllBelow (Balanced.RowTree.branch nl left right) bound = true :=
  Bool.and_eq_true_iff.mpr ⟨hl, hr⟩

def MapFacts (tree : Balanced.RowTree Nat) (size bound : Nat) : Prop :=
  tree.count = size ∧ tree.WellFormed ∧ mapAllBelow tree bound = true

def checkMap : Balanced.RowTree Nat → Nat → Option Nat
  | .empty, _ => some 0
  | .leaf value, bound => if value < bound then some 1 else none
  | .branch cached left right, bound =>
      match checkMap left bound, checkMap right bound with
      | some nl, some nr => if cached = nl then some (nl + nr) else none
      | _, _ => none

theorem checkMap_sound (tree : Balanced.RowTree Nat) (bound size : Nat)
    (checked : checkMap tree bound = some size) : MapFacts tree size bound := by
  induction tree generalizing size with
  | empty =>
    have eq : 0 = size := Option.some.inj checked
    subst size
    exact ⟨rfl, trivial, rfl⟩
  | leaf value =>
    by_cases h : value < bound
    · have eq : 1 = size := Option.some.inj (by
        simpa only [checkMap, ite_eq_left h] using checked)
      subst size
      refine ⟨rfl, trivial, ?_⟩
      simpa only [mapAllBelow, decide_eq_true_eq] using h
    · simp only [checkMap, ite_eq_right h, reduceCtorEq] at checked
  | branch cached left right ihl ihr =>
    cases hl : checkMap left bound with
    | none => simp only [checkMap, hl, reduceCtorEq] at checked
    | some nl =>
      cases hr : checkMap right bound with
      | none => simp only [checkMap, hl, hr, reduceCtorEq] at checked
      | some nr =>
        by_cases hc : cached = nl
        · have eq : nl + nr = size := Option.some.inj (by
            simpa only [checkMap, hl, hr, ite_eq_left hc] using checked)
          subst size
          obtain ⟨hcl, hvl, hbl⟩ := ihl nl hl
          obtain ⟨hcr, hvr, hbr⟩ := ihr nr hr
          exact ⟨congrArg₂ Nat.add hcl hcr,
            ⟨hc.trans hcl.symm, hvl, hvr⟩, Bool.and_eq_true_iff.mpr ⟨hbl, hbr⟩⟩
        · simp only [checkMap, hl, hr, ite_eq_right hc, reduceCtorEq] at checked

theorem map_facts_branch (left right : Balanced.RowTree Nat) (nl nr bound : Nat)
    (hl : MapFacts left nl bound) (hr : MapFacts right nr bound) :
    MapFacts (.branch nl left right) (nl + nr) bound :=
  ⟨congrArg₂ Nat.add hl.1 hr.1, ⟨hl.1.symm, hl.2.1, hr.2.1⟩,
    Bool.and_eq_true_iff.mpr ⟨hl.2.2, hr.2.2⟩⟩

set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapChunk_000000 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeMap-chunks/000000-0001.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapChunk_000001 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeMap-chunks/000001-0001.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapNode_000000_000002 :
    Balanced.RowTree Nat :=
  .branch 1
    smokeMapChunk_000000
    smokeMapChunk_000001
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapChunk_000002 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeMap-chunks/000002-0001.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapChunk_000003 :
    Balanced.RowTree Nat :=
  load_body_map%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeMap-chunks/000003-0001.map"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapNode_000002_000002 :
    Balanced.RowTree Nat :=
  .branch 1
    smokeMapChunk_000002
    smokeMapChunk_000003
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapNode_000000_000004 :
    Balanced.RowTree Nat :=
  .branch 2
    smokeMapNode_000000_000002
    smokeMapNode_000002_000002
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
noncomputable def smokeMapTree :
    Balanced.RowTree Nat :=
  smokeMapNode_000000_000004
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000000_count :
    smokeMapChunk_000000.count = 1 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000001_count :
    smokeMapChunk_000001.count = 1 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000002_count :
    smokeMapNode_000000_000002.count = 2 :=
  map_count_branch
    smokeMapChunk_000000
    smokeMapChunk_000001
    1 1
    smokeMapChunk_000000_count
    smokeMapChunk_000001_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000002_count :
    smokeMapChunk_000002.count = 1 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000003_count :
    smokeMapChunk_000003.count = 1 :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000002_000002_count :
    smokeMapNode_000002_000002.count = 2 :=
  map_count_branch
    smokeMapChunk_000002
    smokeMapChunk_000003
    1 1
    smokeMapChunk_000002_count
    smokeMapChunk_000003_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000004_count :
    smokeMapNode_000000_000004.count = 4 :=
  map_count_branch
    smokeMapNode_000000_000002
    smokeMapNode_000002_000002
    2 2
    smokeMapNode_000000_000002_count
    smokeMapNode_000002_000002_count
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_count :
    smokeMapTree.count = 4 :=
  smokeMapNode_000000_000004_count
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/smoke-map-valid-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"valid\t0\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000000_valid :
    smokeMapChunk_000000.WellFormed :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000001_valid :
    smokeMapChunk_000001.WellFormed :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000002_valid :
    smokeMapNode_000000_000002.WellFormed :=
  map_valid_branch
    smokeMapChunk_000000
    smokeMapChunk_000001
    1
    smokeMapChunk_000000_count
    smokeMapChunk_000000_valid
    smokeMapChunk_000001_valid
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000002_valid :
    smokeMapChunk_000002.WellFormed :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000003_valid :
    smokeMapChunk_000003.WellFormed :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000002_000002_valid :
    smokeMapNode_000002_000002.WellFormed :=
  map_valid_branch
    smokeMapChunk_000002
    smokeMapChunk_000003
    1
    smokeMapChunk_000002_count
    smokeMapChunk_000002_valid
    smokeMapChunk_000003_valid
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000004_valid :
    smokeMapNode_000000_000004.WellFormed :=
  map_valid_branch
    smokeMapNode_000000_000002
    smokeMapNode_000002_000002
    2
    smokeMapNode_000000_000002_count
    smokeMapNode_000000_000002_valid
    smokeMapNode_000002_000002_valid
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_valid :
    smokeMapTree.WellFormed :=
  smokeMapNode_000000_000004_valid
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/smoke-map-valid-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"valid\t4\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000000_bounded :
    mapAllBelow smokeMapChunk_000000 2 = true :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000001_bounded :
    mapAllBelow smokeMapChunk_000001 2 = true :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000002_bounded :
    mapAllBelow smokeMapNode_000000_000002 2 = true :=
  map_bounded_branch
    smokeMapChunk_000000
    smokeMapChunk_000001
    1 2
    smokeMapChunk_000000_bounded
    smokeMapChunk_000001_bounded
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000002_bounded :
    mapAllBelow smokeMapChunk_000002 2 = true :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000003_bounded :
    mapAllBelow smokeMapChunk_000003 2 = true :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000002_000002_bounded :
    mapAllBelow smokeMapNode_000002_000002 2 = true :=
  map_bounded_branch
    smokeMapChunk_000002
    smokeMapChunk_000003
    1 2
    smokeMapChunk_000002_bounded
    smokeMapChunk_000003_bounded
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000004_bounded :
    mapAllBelow smokeMapNode_000000_000004 2 = true :=
  map_bounded_branch
    smokeMapNode_000000_000002
    smokeMapNode_000002_000002
    2 2
    smokeMapNode_000000_000002_bounded
    smokeMapNode_000002_000002_bounded
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_bounded :
    mapAllBelow smokeMapTree 2 = true :=
  smokeMapNode_000000_000004_bounded
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/smoke-map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t0\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000000_facts :
    MapFacts smokeMapChunk_000000 1 2 :=
  checkMap_sound smokeMapChunk_000000 2 1 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000001_facts :
    MapFacts smokeMapChunk_000001 1 2 :=
  checkMap_sound smokeMapChunk_000001 2 1 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000002_facts :
    MapFacts smokeMapNode_000000_000002 2 2 :=
  map_facts_branch
    smokeMapChunk_000000
    smokeMapChunk_000001
    1 1 2
    smokeMapChunk_000000_facts
    smokeMapChunk_000001_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000002_facts :
    MapFacts smokeMapChunk_000002 1 2 :=
  checkMap_sound smokeMapChunk_000002 2 1 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapChunk_000003_facts :
    MapFacts smokeMapChunk_000003 1 2 :=
  checkMap_sound smokeMapChunk_000003 2 1 (by decide +kernel)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000002_000002_facts :
    MapFacts smokeMapNode_000002_000002 2 2 :=
  map_facts_branch
    smokeMapChunk_000002
    smokeMapChunk_000003
    1 1 2
    smokeMapChunk_000002_facts
    smokeMapChunk_000003_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smokeMapNode_000000_000004_facts :
    MapFacts smokeMapNode_000000_000004 4 2 :=
  map_facts_branch
    smokeMapNode_000000_000002
    smokeMapNode_000002_000002
    2 2 2
    smokeMapNode_000000_000002_facts
    smokeMapNode_000002_000002_facts
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_facts :
    MapFacts smokeMapTree 4 2 :=
  smokeMapNode_000000_000004_facts
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/smoke-map-facts-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"facts\t4\t{now}"
      handle.flush
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientChunk_000000 :
    Balanced.RowTree (Nat × Nat) :=
  load_packed_rows%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeQuotient-chunks/000000-0001.rows"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientChunk_000001 :
    Balanced.RowTree (Nat × Nat) :=
  load_packed_rows%
    "Cryptids/Chess/Optimisation/BodyCertificatePilot/smokeQuotient-chunks/000001-0001.rows"
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
@[noinline] def smokeQuotientTree :
    Balanced.RowTree (Nat × Nat) :=
  (Balanced.RowTree.branch 1
    smokeQuotientChunk_000000
    smokeQuotientChunk_000001)
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_quotient_count : smokeQuotientTree.count = 2 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_quotient_valid : smokeQuotientTree.WellFormed := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_quotient_bounded : packedAllBounded smokeQuotientTree 8 = true := by decide +kernel
theorem smoke_lookup_lt (index : Nat) : smokeMapTree.lookup index 0 < 2 :=
  lookup_lt_of_allBelow smokeMapTree 2 0 smoke_map_bounded (by decide) index
noncomputable def smokeClassMap (s : Fin 4) : Fin 2 := Fin.ofNat 2 (smokeMapTree.lookup s.val 0)
theorem smokeClassMap_val (s : Fin 4) :
    (smokeClassMap s).val = smokeMapTree.lookup s.val 0 := by
  change (smokeMapTree.lookup s.val 0) % 2 = smokeMapTree.lookup s.val 0
  exact Nat.mod_eq_of_lt (smoke_lookup_lt s.val)
def smokeQuotient : Machine 2 2 := packedMachine 2 smokeQuotientTree
theorem smoke_quotient_fidelity (state : Fin 2) (bit : Fin 2) :
    packedEncode (smokeQuotient.transition state bit) =
      packedCodeAt smokeQuotientTree state bit :=
  packed_transition_fidelity 2 smokeQuotientTree smoke_quotient_bounded state bit
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_entry : smokeClassMap 0 = 0 := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_row :
    smokeQuotient.transition (smokeClassMap 0) 0 = some (0, Dir.right, 1) ∧
    smokeQuotient.transition (smokeClassMap 1) 1 = some (1, Dir.left, 0) := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_codec_boundaries :
    packedDecode 2 0 = none ∧
    packedDecode 2 1 = some (0, Dir.left, 0) ∧
    packedDecode 2 8 = some (1, Dir.right, 1) ∧
    packedAllBounded (.leaf (8, 0)) 8 = true ∧
    packedAllBounded (.leaf (9, 0)) 8 = false := by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_controls :
    mapAllBelow (.leaf 2) 2 = false ∧
    ¬ (Balanced.RowTree.branch 2 (.leaf (0 : Nat)) (.leaf 1)).WellFormed :=
  by decide +kernel
set_option maxHeartbeats 0 in
-- The driver bounds literal-data elaboration and kernel checking by wall time and RSS.
theorem smoke_map_checker_controls :
    checkMap .empty 0 = some 0 ∧
    checkMap (.leaf 0) 1 = some 1 ∧
    checkMap (.leaf 1) 1 = none ∧
    checkMap (.branch 2 (.leaf 0) (.leaf 0)) 1 = none ∧
    checkMap (.branch 1 (.leaf 0) (.leaf 0)) 1 = some 2 := by decide +kernel

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body certificate template smoke checked"
