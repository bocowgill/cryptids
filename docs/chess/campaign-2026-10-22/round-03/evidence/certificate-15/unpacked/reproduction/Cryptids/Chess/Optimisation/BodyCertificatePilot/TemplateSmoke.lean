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

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body certificate template smoke checked"
