module
public import Cryptids.Chess.Optimisation.FieldSelective

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open Chess.Optimisation
open FieldCompiler
set_option backward.isDefEq.respectTransparency false

def WeightFacts {α : Type} (weight : α → Nat)
    (tree : Balanced.RowTree α) (values : List Nat) : Prop :=
  tree.flatten.map weight = values

theorem weight_map_branch {α : Type} (weight : α → Nat) (cache : Nat)
    (left right : Balanced.RowTree α) (a b : List Nat)
    (hl : WeightFacts weight left a) (hr : WeightFacts weight right b) :
    WeightFacts weight (Balanced.RowTree.branch cache left right) (a ++ b) := by
  have left_eq : left.flatten.map weight = a := hl
  have right_eq : right.flatten.map weight = b := hr
  simpa only [WeightFacts, Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ List.append left_eq right_eq
noncomputable def weight_source_0_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0000
noncomputable def node_w_0_1 : List Nat := [
  1, 1, 1, 1, 3, 1, 1, 1, 1, 3, 1, 1,
  1, 1, 1, 3, 1, 1, 1, 3, 1, 1, 1, 3,
  1, 1, 1, 1, 1, 1, 1, 3
]
noncomputable def return_w_0_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_0_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_1 node_w_0_1 := by rfl
theorem return_spec_0_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_1 return_w_0_1 := by rfl
noncomputable def weight_source_1_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0032
noncomputable def node_w_1_1 : List Nat := [
  1, 1, 1, 1, 3, 1, 1, 1, 1, 3, 1, 1,
  1, 1, 3, 1, 1, 3, 1, 1, 1, 1, 3, 1,
  1, 3, 1, 1, 1, 1, 3, 1
]
noncomputable def return_w_1_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_1_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_1_1 node_w_1_1 := by rfl
theorem return_spec_1_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_1_1 return_w_1_1 := by rfl
noncomputable def weight_source_2_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0064
noncomputable def node_w_2_1 : List Nat := [
  1, 3, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1,
  3, 1, 1, 1, 1, 3, 1, 1, 1, 1, 3, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
noncomputable def return_w_2_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_2_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_2_1 node_w_2_1 := by rfl
theorem return_spec_2_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_2_1 return_w_2_1 := by rfl
noncomputable def weight_source_1_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_1_1 weight_source_2_1
noncomputable def node_w_1_2 : List Nat := node_w_1_1 ++ node_w_2_1
noncomputable def return_w_1_2 : List Nat := return_w_1_1 ++ return_w_2_1
theorem node_spec_1_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_1_2 node_w_1_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_1_1 weight_source_2_1 node_w_1_1 node_w_2_1
    node_spec_1_1 node_spec_2_1
theorem return_spec_1_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_1_2 return_w_1_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_1_1 weight_source_2_1 return_w_1_1 return_w_2_1
    return_spec_1_1 return_spec_2_1
noncomputable def weight_source_0_3 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_0_1 weight_source_1_2
noncomputable def node_w_0_3 : List Nat := node_w_0_1 ++ node_w_1_2
noncomputable def return_w_0_3 : List Nat := return_w_0_1 ++ return_w_1_2
theorem node_spec_0_3 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_3 node_w_0_3 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_0_1 weight_source_1_2 node_w_0_1 node_w_1_2
    node_spec_0_1 node_spec_1_2
theorem return_spec_0_3 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_3 return_w_0_3 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_0_1 weight_source_1_2 return_w_0_1 return_w_1_2
    return_spec_0_1 return_spec_1_2
noncomputable def weight_source_3_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0096
noncomputable def node_w_3_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1,
  1, 1, 3, 1, 1, 1, 1, 1
]
noncomputable def return_w_3_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_3_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_3_1 node_w_3_1 := by rfl
theorem return_spec_3_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_3_1 return_w_3_1 := by rfl
noncomputable def weight_source_4_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0128
noncomputable def node_w_4_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1,
  1, 1, 1, 3, 1, 1, 3, 1, 1, 1, 3, 1,
  1, 1, 1, 3, 1, 1, 1, 1
]
noncomputable def return_w_4_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_4_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_4_1 node_w_4_1 := by rfl
theorem return_spec_4_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_4_1 return_w_4_1 := by rfl
noncomputable def weight_source_3_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_3_1 weight_source_4_1
noncomputable def node_w_3_2 : List Nat := node_w_3_1 ++ node_w_4_1
noncomputable def return_w_3_2 : List Nat := return_w_3_1 ++ return_w_4_1
theorem node_spec_3_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_3_2 node_w_3_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_3_1 weight_source_4_1 node_w_3_1 node_w_4_1
    node_spec_3_1 node_spec_4_1
theorem return_spec_3_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_3_2 return_w_3_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_3_1 weight_source_4_1 return_w_3_1 return_w_4_1
    return_spec_3_1 return_spec_4_1
noncomputable def weight_source_5_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0160
noncomputable def node_w_5_1 : List Nat := [
  3, 1, 1, 1, 1, 3, 1, 1, 1, 3, 1, 1,
  3, 1, 3, 1, 1, 1, 1, 3, 1, 1, 1, 1,
  1, 1, 1, 1, 3, 1, 1, 1
]
noncomputable def return_w_5_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_5_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_5_1 node_w_5_1 := by rfl
theorem return_spec_5_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_5_1 return_w_5_1 := by rfl
noncomputable def weight_source_6_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0192
noncomputable def node_w_6_1 : List Nat := [
  1, 1, 3, 1, 1, 3, 1, 1, 1, 3, 1, 1,
  3, 1, 1, 3, 1, 3, 1, 1, 1, 3, 1, 1,
  1, 2, 1, 1, 1, 1, 1, 1
]
noncomputable def return_w_6_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_6_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_6_1 node_w_6_1 := by rfl
theorem return_spec_6_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_6_1 return_w_6_1 := by rfl
noncomputable def weight_source_5_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_5_1 weight_source_6_1
noncomputable def node_w_5_2 : List Nat := node_w_5_1 ++ node_w_6_1
noncomputable def return_w_5_2 : List Nat := return_w_5_1 ++ return_w_6_1
theorem node_spec_5_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_5_2 node_w_5_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_5_1 weight_source_6_1 node_w_5_1 node_w_6_1
    node_spec_5_1 node_spec_6_1
theorem return_spec_5_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_5_2 return_w_5_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_5_1 weight_source_6_1 return_w_5_1 return_w_6_1
    return_spec_5_1 return_spec_6_1
noncomputable def weight_source_3_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_3_2 weight_source_5_2
noncomputable def node_w_3_4 : List Nat := node_w_3_2 ++ node_w_5_2
noncomputable def return_w_3_4 : List Nat := return_w_3_2 ++ return_w_5_2
theorem node_spec_3_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_3_4 node_w_3_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_3_2 weight_source_5_2 node_w_3_2 node_w_5_2
    node_spec_3_2 node_spec_5_2
theorem return_spec_3_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_3_4 return_w_3_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_3_2 weight_source_5_2 return_w_3_2 return_w_5_2
    return_spec_3_2 return_spec_5_2
noncomputable def weight_source_0_7 : Balanced.RowTree Snapshot.Entry :=
  .branch 96 weight_source_0_3 weight_source_3_4
noncomputable def node_w_0_7 : List Nat := node_w_0_3 ++ node_w_3_4
noncomputable def return_w_0_7 : List Nat := return_w_0_3 ++ return_w_3_4
theorem node_spec_0_7 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_7 node_w_0_7 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    96 weight_source_0_3 weight_source_3_4 node_w_0_3 node_w_3_4
    node_spec_0_3 node_spec_3_4
theorem return_spec_0_7 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_7 return_w_0_7 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    96 weight_source_0_3 weight_source_3_4 return_w_0_3 return_w_3_4
    return_spec_0_3 return_spec_3_4
noncomputable def weight_source_7_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0224
noncomputable def node_w_7_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1,
  1, 1, 1, 1, 3, 1, 1, 1, 1, 3, 1, 1,
  1, 1, 1, 3, 1, 1, 1, 1
]
noncomputable def return_w_7_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_7_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_7_1 node_w_7_1 := by rfl
theorem return_spec_7_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_7_1 return_w_7_1 := by rfl
noncomputable def weight_source_8_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0256
noncomputable def node_w_8_1 : List Nat := [
  3, 1, 1, 1, 3, 1, 3, 1, 1, 1, 3, 1,
  1, 1, 1, 1, 1, 1, 3, 1, 1, 14, 74, 1,
  14, 80, 1, 2, 44, 61, 14, 39
]
noncomputable def return_w_8_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_8_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_8_1 node_w_8_1 := by rfl
theorem return_spec_8_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_8_1 return_w_8_1 := by rfl
noncomputable def weight_source_7_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_7_1 weight_source_8_1
noncomputable def node_w_7_2 : List Nat := node_w_7_1 ++ node_w_8_1
noncomputable def return_w_7_2 : List Nat := return_w_7_1 ++ return_w_8_1
theorem node_spec_7_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_7_2 node_w_7_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_7_1 weight_source_8_1 node_w_7_1 node_w_8_1
    node_spec_7_1 node_spec_8_1
theorem return_spec_7_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_7_2 return_w_7_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_7_1 weight_source_8_1 return_w_7_1 return_w_8_1
    return_spec_7_1 return_spec_8_1
noncomputable def weight_source_9_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0288
noncomputable def node_w_9_1 : List Nat := [
  14, 53, 1, 14, 134, 14, 134, 134, 1, 14, 134, 1,
  2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14,
  80, 1, 2, 44, 61, 14, 39, 14
]
noncomputable def return_w_9_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_9_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_9_1 node_w_9_1 := by rfl
theorem return_spec_9_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_9_1 return_w_9_1 := by rfl
noncomputable def weight_source_10_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0320
noncomputable def node_w_10_1 : List Nat := [
  53, 1, 14, 44, 14, 53, 104, 1, 14, 107, 1, 2,
  74, 88, 14, 39, 14, 80, 1, 2, 44, 61, 14, 39,
  14, 53, 1, 14, 74, 1, 14, 80
]
noncomputable def return_w_10_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_10_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_10_1 node_w_10_1 := by rfl
theorem return_spec_10_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_10_1 return_w_10_1 := by rfl
noncomputable def weight_source_9_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_9_1 weight_source_10_1
noncomputable def node_w_9_2 : List Nat := node_w_9_1 ++ node_w_10_1
noncomputable def return_w_9_2 : List Nat := return_w_9_1 ++ return_w_10_1
theorem node_spec_9_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_9_2 node_w_9_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_9_1 weight_source_10_1 node_w_9_1 node_w_10_1
    node_spec_9_1 node_spec_10_1
theorem return_spec_9_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_9_2 return_w_9_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_9_1 weight_source_10_1 return_w_9_1 return_w_10_1
    return_spec_9_1 return_spec_10_1
noncomputable def weight_source_7_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_7_2 weight_source_9_2
noncomputable def node_w_7_4 : List Nat := node_w_7_2 ++ node_w_9_2
noncomputable def return_w_7_4 : List Nat := return_w_7_2 ++ return_w_9_2
theorem node_spec_7_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_7_4 node_w_7_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_7_2 weight_source_9_2 node_w_7_2 node_w_9_2
    node_spec_7_2 node_spec_9_2
theorem return_spec_7_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_7_4 return_w_7_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_7_2 weight_source_9_2 return_w_7_2 return_w_9_2
    return_spec_7_2 return_spec_9_2
noncomputable def weight_source_11_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0352
noncomputable def node_w_11_1 : List Nat := [
  1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 44, 14,
  53, 44, 1, 14, 53, 1, 2, 74, 88, 14, 39, 14,
  80, 1, 14, 134, 14, 134, 1, 14
]
noncomputable def return_w_11_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_11_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_11_1 node_w_11_1 := by rfl
theorem return_spec_11_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_11_1 return_w_11_1 := by rfl
noncomputable def weight_source_12_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0384
noncomputable def node_w_12_1 : List Nat := [
  134, 14, 134, 1, 14, 74, 1, 14, 80, 1, 14, 74,
  1, 14, 80, 1, 14, 61, 14, 1, 14, 53, 1, 2,
  44, 61, 14, 39, 14, 53, 44, 1
]
noncomputable def return_w_12_1 : List Nat := [
  16, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_12_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_12_1 node_w_12_1 := by rfl
theorem return_spec_12_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_12_1 return_w_12_1 := by rfl
noncomputable def weight_source_11_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_11_1 weight_source_12_1
noncomputable def node_w_11_2 : List Nat := node_w_11_1 ++ node_w_12_1
noncomputable def return_w_11_2 : List Nat := return_w_11_1 ++ return_w_12_1
theorem node_spec_11_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_11_2 node_w_11_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_11_1 weight_source_12_1 node_w_11_1 node_w_12_1
    node_spec_11_1 node_spec_12_1
theorem return_spec_11_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_11_2 return_w_11_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_11_1 weight_source_12_1 return_w_11_1 return_w_12_1
    return_spec_11_1 return_spec_12_1
noncomputable def weight_source_13_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0416
noncomputable def node_w_13_1 : List Nat := [
  14, 53, 1, 2, 74, 88, 14, 39, 14, 80, 1, 14,
  74, 1, 14, 80, 1, 2, 104, 115, 14, 39, 14, 107,
  1, 14, 134, 14, 134, 134, 1, 14
]
noncomputable def return_w_13_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 16, 1, 1
]
theorem node_spec_13_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_13_1 node_w_13_1 := by rfl
theorem return_spec_13_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_13_1 return_w_13_1 := by rfl
noncomputable def weight_source_14_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0448
noncomputable def node_w_14_1 : List Nat := [
  134, 1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 74,
  1, 14, 80, 1, 2, 104, 115, 14, 39, 14, 107, 1,
  14, 134, 14, 134, 134, 1, 14, 134
]
noncomputable def return_w_14_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 16, 1, 1, 16, 1, 1, 1
]
theorem node_spec_14_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_14_1 node_w_14_1 := by rfl
theorem return_spec_14_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_14_1 return_w_14_1 := by rfl
noncomputable def weight_source_13_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_13_1 weight_source_14_1
noncomputable def node_w_13_2 : List Nat := node_w_13_1 ++ node_w_14_1
noncomputable def return_w_13_2 : List Nat := return_w_13_1 ++ return_w_14_1
theorem node_spec_13_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_13_2 node_w_13_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_13_1 weight_source_14_1 node_w_13_1 node_w_14_1
    node_spec_13_1 node_spec_14_1
theorem return_spec_13_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_13_2 return_w_13_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_13_1 weight_source_14_1 return_w_13_1 return_w_14_1
    return_spec_13_1 return_spec_14_1
noncomputable def weight_source_11_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_11_2 weight_source_13_2
noncomputable def node_w_11_4 : List Nat := node_w_11_2 ++ node_w_13_2
noncomputable def return_w_11_4 : List Nat := return_w_11_2 ++ return_w_13_2
theorem node_spec_11_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_11_4 node_w_11_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_11_2 weight_source_13_2 node_w_11_2 node_w_13_2
    node_spec_11_2 node_spec_13_2
theorem return_spec_11_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_11_4 return_w_11_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_11_2 weight_source_13_2 return_w_11_2 return_w_13_2
    return_spec_11_2 return_spec_13_2
noncomputable def weight_source_7_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_7_4 weight_source_11_4
noncomputable def node_w_7_8 : List Nat := node_w_7_4 ++ node_w_11_4
noncomputable def return_w_7_8 : List Nat := return_w_7_4 ++ return_w_11_4
theorem node_spec_7_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_7_8 node_w_7_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_7_4 weight_source_11_4 node_w_7_4 node_w_11_4
    node_spec_7_4 node_spec_11_4
theorem return_spec_7_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_7_8 return_w_7_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_7_4 weight_source_11_4 return_w_7_4 return_w_11_4
    return_spec_7_4 return_spec_11_4
noncomputable def weight_source_0_15 : Balanced.RowTree Snapshot.Entry :=
  .branch 224 weight_source_0_7 weight_source_7_8
noncomputable def node_w_0_15 : List Nat := node_w_0_7 ++ node_w_7_8
noncomputable def return_w_0_15 : List Nat := return_w_0_7 ++ return_w_7_8
theorem node_spec_0_15 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_15 node_w_0_15 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    224 weight_source_0_7 weight_source_7_8 node_w_0_7 node_w_7_8
    node_spec_0_7 node_spec_7_8
theorem return_spec_0_15 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_15 return_w_0_15 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    224 weight_source_0_7 weight_source_7_8 return_w_0_7 return_w_7_8
    return_spec_0_7 return_spec_7_8
noncomputable def weight_source_15_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0480
noncomputable def node_w_15_1 : List Nat := [
  1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1,
  14, 80, 1, 2, 104, 115, 14, 39, 14, 107, 1, 14,
  134, 14, 134, 134, 1, 14, 134, 1
]
noncomputable def return_w_15_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_15_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_15_1 node_w_15_1 := by rfl
theorem return_spec_15_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_15_1 return_w_15_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t16\t{now}"
      handle.flush
noncomputable def weight_source_16_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0512
noncomputable def node_w_16_1 : List Nat := [
  2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14,
  80, 1, 2, 104, 115, 14, 39, 14, 107, 1, 14, 44,
  14, 53, 1, 14, 134, 14, 134, 134
]
noncomputable def return_w_16_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 16, 1, 1, 16
]
theorem node_spec_16_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_16_1 node_w_16_1 := by rfl
theorem return_spec_16_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_16_1 return_w_16_1 := by rfl
noncomputable def weight_source_15_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_15_1 weight_source_16_1
noncomputable def node_w_15_2 : List Nat := node_w_15_1 ++ node_w_16_1
noncomputable def return_w_15_2 : List Nat := return_w_15_1 ++ return_w_16_1
theorem node_spec_15_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_15_2 node_w_15_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_15_1 weight_source_16_1 node_w_15_1 node_w_16_1
    node_spec_15_1 node_spec_16_1
theorem return_spec_15_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_15_2 return_w_15_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_15_1 weight_source_16_1 return_w_15_1 return_w_16_1
    return_spec_15_1 return_spec_16_1
noncomputable def weight_source_17_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0544
noncomputable def node_w_17_1 : List Nat := [
  1, 14, 134, 1, 14, 44, 1, 14, 53, 1, 2, 74,
  88, 14, 39, 14, 80, 1, 14, 74, 1, 14, 80, 1,
  2, 104, 115, 14, 39, 14, 107, 1
]
noncomputable def return_w_17_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1
]
theorem node_spec_17_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_17_1 node_w_17_1 := by rfl
theorem return_spec_17_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_17_1 return_w_17_1 := by rfl
noncomputable def weight_source_18_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0576
noncomputable def node_w_18_1 : List Nat := [
  14, 44, 14, 53, 1, 14, 134, 14, 134, 134, 1, 14,
  134, 1, 14, 44, 1, 14, 53, 1, 2, 74, 88, 14,
  39, 14, 80, 1, 14, 74, 1, 14
]
noncomputable def return_w_18_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_18_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_18_1 node_w_18_1 := by rfl
theorem return_spec_18_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_18_1 return_w_18_1 := by rfl
noncomputable def weight_source_17_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_17_1 weight_source_18_1
noncomputable def node_w_17_2 : List Nat := node_w_17_1 ++ node_w_18_1
noncomputable def return_w_17_2 : List Nat := return_w_17_1 ++ return_w_18_1
theorem node_spec_17_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_17_2 node_w_17_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_17_1 weight_source_18_1 node_w_17_1 node_w_18_1
    node_spec_17_1 node_spec_18_1
theorem return_spec_17_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_17_2 return_w_17_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_17_1 weight_source_18_1 return_w_17_1 return_w_18_1
    return_spec_17_1 return_spec_18_1
noncomputable def weight_source_15_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_15_2 weight_source_17_2
noncomputable def node_w_15_4 : List Nat := node_w_15_2 ++ node_w_17_2
noncomputable def return_w_15_4 : List Nat := return_w_15_2 ++ return_w_17_2
theorem node_spec_15_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_15_4 node_w_15_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_15_2 weight_source_17_2 node_w_15_2 node_w_17_2
    node_spec_15_2 node_spec_17_2
theorem return_spec_15_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_15_4 return_w_15_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_15_2 weight_source_17_2 return_w_15_2 return_w_17_2
    return_spec_15_2 return_spec_17_2
noncomputable def weight_source_19_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0608
noncomputable def node_w_19_1 : List Nat := [
  80, 1, 2, 104, 115, 14, 39, 14, 107, 1, 14, 44,
  14, 53, 1, 14, 134, 14, 134, 134, 1, 14, 134, 1,
  14, 44, 1, 14, 53, 1, 2, 74
]
noncomputable def return_w_19_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 16
]
theorem node_spec_19_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_19_1 node_w_19_1 := by rfl
theorem return_spec_19_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_19_1 return_w_19_1 := by rfl
noncomputable def weight_source_20_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0640
noncomputable def node_w_20_1 : List Nat := [
  88, 14, 39, 14, 80, 1, 14, 74, 1, 14, 80, 1,
  2, 134, 142, 14, 39, 14, 134, 1, 14, 134, 14, 134,
  74, 1, 14, 80, 1, 2, 134, 142
]
noncomputable def return_w_20_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_20_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_20_1 node_w_20_1 := by rfl
theorem return_spec_20_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_20_1 return_w_20_1 := by rfl
noncomputable def weight_source_19_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_19_1 weight_source_20_1
noncomputable def node_w_19_2 : List Nat := node_w_19_1 ++ node_w_20_1
noncomputable def return_w_19_2 : List Nat := return_w_19_1 ++ return_w_20_1
theorem node_spec_19_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_19_2 node_w_19_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_19_1 weight_source_20_1 node_w_19_1 node_w_20_1
    node_spec_19_1 node_spec_20_1
theorem return_spec_19_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_19_2 return_w_19_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_19_1 weight_source_20_1 return_w_19_1 return_w_20_1
    return_spec_19_1 return_spec_20_1
noncomputable def weight_source_21_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0672
noncomputable def node_w_21_1 : List Nat := [
  14, 39, 14, 134, 1, 14, 104, 14, 107, 104, 1, 14,
  107, 1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 74,
  1, 14, 80, 1, 2, 44, 61, 14
]
noncomputable def return_w_21_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_21_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_21_1 node_w_21_1 := by rfl
theorem return_spec_21_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_21_1 return_w_21_1 := by rfl
noncomputable def weight_source_22_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0704
noncomputable def node_w_22_1 : List Nat := [
  39, 14, 53, 1, 14, 134, 14, 134, 134, 1, 14, 134,
  1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1,
  14, 80, 1, 2, 44, 61, 14, 39
]
noncomputable def return_w_22_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_22_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_22_1 node_w_22_1 := by rfl
theorem return_spec_22_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_22_1 return_w_22_1 := by rfl
noncomputable def weight_source_21_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_21_1 weight_source_22_1
noncomputable def node_w_21_2 : List Nat := node_w_21_1 ++ node_w_22_1
noncomputable def return_w_21_2 : List Nat := return_w_21_1 ++ return_w_22_1
theorem node_spec_21_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_21_2 node_w_21_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_21_1 weight_source_22_1 node_w_21_1 node_w_22_1
    node_spec_21_1 node_spec_22_1
theorem return_spec_21_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_21_2 return_w_21_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_21_1 weight_source_22_1 return_w_21_1 return_w_22_1
    return_spec_21_1 return_spec_22_1
noncomputable def weight_source_19_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_19_2 weight_source_21_2
noncomputable def node_w_19_4 : List Nat := node_w_19_2 ++ node_w_21_2
noncomputable def return_w_19_4 : List Nat := return_w_19_2 ++ return_w_21_2
theorem node_spec_19_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_19_4 node_w_19_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_19_2 weight_source_21_2 node_w_19_2 node_w_21_2
    node_spec_19_2 node_spec_21_2
theorem return_spec_19_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_19_4 return_w_19_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_19_2 weight_source_21_2 return_w_19_2 return_w_21_2
    return_spec_19_2 return_spec_21_2
noncomputable def weight_source_15_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_15_4 weight_source_19_4
noncomputable def node_w_15_8 : List Nat := node_w_15_4 ++ node_w_19_4
noncomputable def return_w_15_8 : List Nat := return_w_15_4 ++ return_w_19_4
theorem node_spec_15_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_15_8 node_w_15_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_15_4 weight_source_19_4 node_w_15_4 node_w_19_4
    node_spec_15_4 node_spec_19_4
theorem return_spec_15_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_15_8 return_w_15_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_15_4 weight_source_19_4 return_w_15_4 return_w_19_4
    return_spec_15_4 return_spec_19_4
noncomputable def weight_source_23_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0736
noncomputable def node_w_23_1 : List Nat := [
  14, 53, 1, 14, 134, 14, 134, 134, 1, 14, 134, 1,
  2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14,
  80, 1, 14, 74, 1, 14, 80, 1
]
noncomputable def return_w_23_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_23_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_23_1 node_w_23_1 := by rfl
theorem return_spec_23_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_23_1 return_w_23_1 := by rfl
noncomputable def weight_source_24_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0768
noncomputable def node_w_24_1 : List Nat := [
  14, 61, 14, 1, 14, 53, 1, 2, 44, 61, 14, 39,
  14, 53, 44, 1, 14, 53, 1, 2, 74, 88, 14, 39,
  14, 80, 1, 14, 74, 1, 14, 80
]
noncomputable def return_w_24_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_24_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_24_1 node_w_24_1 := by rfl
theorem return_spec_24_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_24_1 return_w_24_1 := by rfl
noncomputable def weight_source_23_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_23_1 weight_source_24_1
noncomputable def node_w_23_2 : List Nat := node_w_23_1 ++ node_w_24_1
noncomputable def return_w_23_2 : List Nat := return_w_23_1 ++ return_w_24_1
theorem node_spec_23_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_23_2 node_w_23_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_23_1 weight_source_24_1 node_w_23_1 node_w_24_1
    node_spec_23_1 node_spec_24_1
theorem return_spec_23_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_23_2 return_w_23_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_23_1 weight_source_24_1 return_w_23_1 return_w_24_1
    return_spec_23_1 return_spec_24_1
noncomputable def weight_source_25_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0800
noncomputable def node_w_25_1 : List Nat := [
  1, 14, 74, 1, 14, 80, 1, 14, 61, 14, 1, 14,
  53, 1, 2, 44, 61, 14, 39, 14, 53, 44, 1, 14,
  53, 1, 2, 74, 88, 14, 39, 14
]
noncomputable def return_w_25_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_25_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_25_1 node_w_25_1 := by rfl
theorem return_spec_25_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_25_1 return_w_25_1 := by rfl
noncomputable def weight_source_26_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0832
noncomputable def node_w_26_1 : List Nat := [
  80, 1, 14, 74, 1, 14, 80, 1, 14, 74, 1, 14,
  80, 1, 14, 61, 14, 1, 14, 53, 1, 2, 44, 61,
  14, 39, 14, 53, 44, 1, 14, 53
]
noncomputable def return_w_26_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_26_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_26_1 node_w_26_1 := by rfl
theorem return_spec_26_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_26_1 return_w_26_1 := by rfl
noncomputable def weight_source_25_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_25_1 weight_source_26_1
noncomputable def node_w_25_2 : List Nat := node_w_25_1 ++ node_w_26_1
noncomputable def return_w_25_2 : List Nat := return_w_25_1 ++ return_w_26_1
theorem node_spec_25_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_25_2 node_w_25_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_25_1 weight_source_26_1 node_w_25_1 node_w_26_1
    node_spec_25_1 node_spec_26_1
theorem return_spec_25_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_25_2 return_w_25_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_25_1 weight_source_26_1 return_w_25_1 return_w_26_1
    return_spec_25_1 return_spec_26_1
noncomputable def weight_source_23_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_23_2 weight_source_25_2
noncomputable def node_w_23_4 : List Nat := node_w_23_2 ++ node_w_25_2
noncomputable def return_w_23_4 : List Nat := return_w_23_2 ++ return_w_25_2
theorem node_spec_23_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_23_4 node_w_23_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_23_2 weight_source_25_2 node_w_23_2 node_w_25_2
    node_spec_23_2 node_spec_25_2
theorem return_spec_23_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_23_4 return_w_23_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_23_2 weight_source_25_2 return_w_23_2 return_w_25_2
    return_spec_23_2 return_spec_25_2
noncomputable def weight_source_27_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0864
noncomputable def node_w_27_1 : List Nat := [
  1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1,
  14, 80, 1, 14, 74, 1, 14, 80, 1, 14, 61, 14,
  1, 14, 53, 1, 2, 44, 61, 14
]
noncomputable def return_w_27_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_27_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_27_1 node_w_27_1 := by rfl
theorem return_spec_27_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_27_1 return_w_27_1 := by rfl
noncomputable def weight_source_28_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0896
noncomputable def node_w_28_1 : List Nat := [
  39, 14, 53, 44, 1, 14, 53, 1, 2, 74, 88, 14,
  39, 14, 80, 1, 14, 74, 1, 14, 80, 1, 14, 74,
  1, 14, 80, 1, 14, 61, 14, 1
]
noncomputable def return_w_28_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_28_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_28_1 node_w_28_1 := by rfl
theorem return_spec_28_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_28_1 return_w_28_1 := by rfl
noncomputable def weight_source_27_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_27_1 weight_source_28_1
noncomputable def node_w_27_2 : List Nat := node_w_27_1 ++ node_w_28_1
noncomputable def return_w_27_2 : List Nat := return_w_27_1 ++ return_w_28_1
theorem node_spec_27_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_27_2 node_w_27_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_27_1 weight_source_28_1 node_w_27_1 node_w_28_1
    node_spec_27_1 node_spec_28_1
theorem return_spec_27_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_27_2 return_w_27_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_27_1 weight_source_28_1 return_w_27_1 return_w_28_1
    return_spec_27_1 return_spec_28_1
noncomputable def weight_source_29_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0928
noncomputable def node_w_29_1 : List Nat := [
  14, 53, 1, 2, 44, 61, 14, 39, 14, 53, 44, 1,
  14, 53, 1, 2, 74, 88, 14, 39, 14, 80, 1, 14,
  74, 1, 14, 80, 1, 14, 74, 1
]
noncomputable def return_w_29_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_29_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_29_1 node_w_29_1 := by rfl
theorem return_spec_29_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_29_1 return_w_29_1 := by rfl
noncomputable def weight_source_30_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0960
noncomputable def node_w_30_1 : List Nat := [
  14, 80, 1, 14, 61, 14, 1, 14, 53, 1, 2, 44,
  61, 14, 39, 14, 53, 44, 1, 14, 53, 1, 2, 74,
  88, 14, 39, 14, 80, 1, 14, 74
]
noncomputable def return_w_30_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 16
]
theorem node_spec_30_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_30_1 node_w_30_1 := by rfl
theorem return_spec_30_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_30_1 return_w_30_1 := by rfl
noncomputable def weight_source_29_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_29_1 weight_source_30_1
noncomputable def node_w_29_2 : List Nat := node_w_29_1 ++ node_w_30_1
noncomputable def return_w_29_2 : List Nat := return_w_29_1 ++ return_w_30_1
theorem node_spec_29_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_29_2 node_w_29_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_29_1 weight_source_30_1 node_w_29_1 node_w_30_1
    node_spec_29_1 node_spec_30_1
theorem return_spec_29_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_29_2 return_w_29_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_29_1 weight_source_30_1 return_w_29_1 return_w_30_1
    return_spec_29_1 return_spec_30_1
noncomputable def weight_source_27_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_27_2 weight_source_29_2
noncomputable def node_w_27_4 : List Nat := node_w_27_2 ++ node_w_29_2
noncomputable def return_w_27_4 : List Nat := return_w_27_2 ++ return_w_29_2
theorem node_spec_27_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_27_4 node_w_27_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_27_2 weight_source_29_2 node_w_27_2 node_w_29_2
    node_spec_27_2 node_spec_29_2
theorem return_spec_27_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_27_4 return_w_27_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_27_2 weight_source_29_2 return_w_27_2 return_w_29_2
    return_spec_27_2 return_spec_29_2
noncomputable def weight_source_23_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_23_4 weight_source_27_4
noncomputable def node_w_23_8 : List Nat := node_w_23_4 ++ node_w_27_4
noncomputable def return_w_23_8 : List Nat := return_w_23_4 ++ return_w_27_4
theorem node_spec_23_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_23_8 node_w_23_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_23_4 weight_source_27_4 node_w_23_4 node_w_27_4
    node_spec_23_4 node_spec_27_4
theorem return_spec_23_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_23_8 return_w_23_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_23_4 weight_source_27_4 return_w_23_4 return_w_27_4
    return_spec_23_4 return_spec_27_4
noncomputable def weight_source_15_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_15_8 weight_source_23_8
noncomputable def node_w_15_16 : List Nat := node_w_15_8 ++ node_w_23_8
noncomputable def return_w_15_16 : List Nat := return_w_15_8 ++ return_w_23_8
theorem node_spec_15_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_15_16 node_w_15_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_15_8 weight_source_23_8 node_w_15_8 node_w_23_8
    node_spec_15_8 node_spec_23_8
theorem return_spec_15_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_15_16 return_w_15_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_15_8 weight_source_23_8 return_w_15_8 return_w_23_8
    return_spec_15_8 return_spec_23_8
noncomputable def weight_source_0_31 : Balanced.RowTree Snapshot.Entry :=
  .branch 480 weight_source_0_15 weight_source_15_16
noncomputable def node_w_0_31 : List Nat := node_w_0_15 ++ node_w_15_16
noncomputable def return_w_0_31 : List Nat := return_w_0_15 ++ return_w_15_16
theorem node_spec_0_31 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_31 node_w_0_31 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    480 weight_source_0_15 weight_source_15_16 node_w_0_15 node_w_15_16
    node_spec_0_15 node_spec_15_16
theorem return_spec_0_31 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_31 return_w_0_31 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    480 weight_source_0_15 weight_source_15_16 return_w_0_15 return_w_15_16
    return_spec_0_15 return_spec_15_16
noncomputable def weight_source_31_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0992
noncomputable def node_w_31_1 : List Nat := [
  1, 14, 80, 1, 14, 74, 1, 14, 80, 1, 14, 61,
  14, 1, 14, 53, 1, 2, 44, 61, 14, 39, 14, 53,
  44, 1, 14, 53, 1, 2, 74, 88
]
noncomputable def return_w_31_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_31_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_1 node_w_31_1 := by rfl
theorem return_spec_31_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_1 return_w_31_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t32\t{now}"
      handle.flush
noncomputable def weight_source_32_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1024
noncomputable def node_w_32_1 : List Nat := [
  14, 39, 14, 80, 1, 2, 134, 142, 14, 39, 14, 134,
  1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 44, 14,
  53, 1, 2, 134, 142, 14, 39, 14
]
noncomputable def return_w_32_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_32_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_32_1 node_w_32_1 := by rfl
theorem return_spec_32_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_32_1 return_w_32_1 := by rfl
noncomputable def weight_source_31_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_31_1 weight_source_32_1
noncomputable def node_w_31_2 : List Nat := node_w_31_1 ++ node_w_32_1
noncomputable def return_w_31_2 : List Nat := return_w_31_1 ++ return_w_32_1
theorem node_spec_31_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_2 node_w_31_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_31_1 weight_source_32_1 node_w_31_1 node_w_32_1
    node_spec_31_1 node_spec_32_1
theorem return_spec_31_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_2 return_w_31_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_31_1 weight_source_32_1 return_w_31_1 return_w_32_1
    return_spec_31_1 return_spec_32_1
noncomputable def weight_source_33_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1056
noncomputable def node_w_33_1 : List Nat := [
  134, 1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 74,
  1, 14, 80, 1, 2, 44, 61, 14, 39, 14, 53, 1,
  14, 74, 14, 80, 1, 2, 44, 61
]
noncomputable def return_w_33_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 16, 1
]
theorem node_spec_33_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_33_1 node_w_33_1 := by rfl
theorem return_spec_33_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_33_1 return_w_33_1 := by rfl
noncomputable def weight_source_34_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1088
noncomputable def node_w_34_1 : List Nat := [
  14, 39, 14, 53, 1, 14, 44, 1, 14, 53, 1, 2,
  74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14, 80,
  1, 14, 44, 1, 14, 53, 1, 14
]
noncomputable def return_w_34_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_34_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_34_1 node_w_34_1 := by rfl
theorem return_spec_34_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_34_1 return_w_34_1 := by rfl
noncomputable def weight_source_33_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_33_1 weight_source_34_1
noncomputable def node_w_33_2 : List Nat := node_w_33_1 ++ node_w_34_1
noncomputable def return_w_33_2 : List Nat := return_w_33_1 ++ return_w_34_1
theorem node_spec_33_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_33_2 node_w_33_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_33_1 weight_source_34_1 node_w_33_1 node_w_34_1
    node_spec_33_1 node_spec_34_1
theorem return_spec_33_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_33_2 return_w_33_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_33_1 weight_source_34_1 return_w_33_1 return_w_34_1
    return_spec_33_1 return_spec_34_1
noncomputable def weight_source_31_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_31_2 weight_source_33_2
noncomputable def node_w_31_4 : List Nat := node_w_31_2 ++ node_w_33_2
noncomputable def return_w_31_4 : List Nat := return_w_31_2 ++ return_w_33_2
theorem node_spec_31_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_4 node_w_31_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_31_2 weight_source_33_2 node_w_31_2 node_w_33_2
    node_spec_31_2 node_spec_33_2
theorem return_spec_31_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_4 return_w_31_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_31_2 weight_source_33_2 return_w_31_2 return_w_33_2
    return_spec_31_2 return_spec_33_2
noncomputable def weight_source_35_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1120
noncomputable def node_w_35_1 : List Nat := [
  44, 1, 14, 53, 1, 2, 44, 61, 14, 39, 14, 53,
  44, 1, 14, 53, 1, 2, 74, 88, 14, 39, 14, 80,
  1, 2, 134, 142, 14, 39, 14, 134
]
noncomputable def return_w_35_1 : List Nat := [
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_35_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_35_1 node_w_35_1 := by rfl
theorem return_spec_35_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_35_1 return_w_35_1 := by rfl
noncomputable def weight_source_36_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1152
noncomputable def node_w_36_1 : List Nat := [
  1, 2, 134, 142, 14, 39, 14, 134, 1, 2, 44, 61,
  14, 39, 14, 53, 1, 14, 74, 1, 14, 80, 1, 2,
  134, 142, 14, 39, 14, 134, 1, 14
]
noncomputable def return_w_36_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_36_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_36_1 node_w_36_1 := by rfl
theorem return_spec_36_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_36_1 return_w_36_1 := by rfl
noncomputable def weight_source_35_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_35_1 weight_source_36_1
noncomputable def node_w_35_2 : List Nat := node_w_35_1 ++ node_w_36_1
noncomputable def return_w_35_2 : List Nat := return_w_35_1 ++ return_w_36_1
theorem node_spec_35_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_35_2 node_w_35_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_35_1 weight_source_36_1 node_w_35_1 node_w_36_1
    node_spec_35_1 node_spec_36_1
theorem return_spec_35_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_35_2 return_w_35_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_35_1 weight_source_36_1 return_w_35_1 return_w_36_1
    return_spec_35_1 return_spec_36_1
noncomputable def weight_source_37_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1184
noncomputable def node_w_37_1 : List Nat := [
  104, 14, 107, 104, 1, 14, 107, 1, 2, 74, 88, 14,
  39, 14, 80, 1, 14, 134, 14, 134, 74, 1, 14, 80,
  1, 2, 44, 61, 14, 39, 14, 53
]
noncomputable def return_w_37_1 : List Nat := [
  16, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_37_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_37_1 node_w_37_1 := by rfl
theorem return_spec_37_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_37_1 return_w_37_1 := by rfl
noncomputable def weight_source_38_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1216
noncomputable def node_w_38_1 : List Nat := [
  1, 14, 134, 1, 14, 134, 1, 14, 44, 1, 14, 53,
  1, 2, 74, 88, 14, 39, 14, 80, 1, 14, 134, 14,
  134, 1, 14, 134, 14, 134, 74, 1
]
noncomputable def return_w_38_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 16, 1, 1, 16, 1
]
theorem node_spec_38_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_38_1 node_w_38_1 := by rfl
theorem return_spec_38_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_38_1 return_w_38_1 := by rfl
noncomputable def weight_source_37_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_37_1 weight_source_38_1
noncomputable def node_w_37_2 : List Nat := node_w_37_1 ++ node_w_38_1
noncomputable def return_w_37_2 : List Nat := return_w_37_1 ++ return_w_38_1
theorem node_spec_37_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_37_2 node_w_37_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_37_1 weight_source_38_1 node_w_37_1 node_w_38_1
    node_spec_37_1 node_spec_38_1
theorem return_spec_37_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_37_2 return_w_37_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_37_1 weight_source_38_1 return_w_37_1 return_w_38_1
    return_spec_37_1 return_spec_38_1
noncomputable def weight_source_35_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_35_2 weight_source_37_2
noncomputable def node_w_35_4 : List Nat := node_w_35_2 ++ node_w_37_2
noncomputable def return_w_35_4 : List Nat := return_w_35_2 ++ return_w_37_2
theorem node_spec_35_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_35_4 node_w_35_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_35_2 weight_source_37_2 node_w_35_2 node_w_37_2
    node_spec_35_2 node_spec_37_2
theorem return_spec_35_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_35_4 return_w_35_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_35_2 weight_source_37_2 return_w_35_2 return_w_37_2
    return_spec_35_2 return_spec_37_2
noncomputable def weight_source_31_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_31_4 weight_source_35_4
noncomputable def node_w_31_8 : List Nat := node_w_31_4 ++ node_w_35_4
noncomputable def return_w_31_8 : List Nat := return_w_31_4 ++ return_w_35_4
theorem node_spec_31_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_8 node_w_31_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_31_4 weight_source_35_4 node_w_31_4 node_w_35_4
    node_spec_31_4 node_spec_35_4
theorem return_spec_31_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_8 return_w_31_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_31_4 weight_source_35_4 return_w_31_4 return_w_35_4
    return_spec_31_4 return_spec_35_4
noncomputable def weight_source_39_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1248
noncomputable def node_w_39_1 : List Nat := [
  14, 80, 1, 2, 104, 115, 14, 39, 14, 107, 1, 14,
  44, 14, 53, 44, 1, 14, 53, 1, 2, 74, 88, 14,
  39, 14, 80, 1, 14, 74, 1, 14
]
noncomputable def return_w_39_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_39_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_39_1 node_w_39_1 := by rfl
theorem return_spec_39_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_39_1 return_w_39_1 := by rfl
noncomputable def weight_source_40_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1280
noncomputable def node_w_40_1 : List Nat := [
  80, 1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 104,
  14, 107, 104, 1, 14, 107, 1, 2, 74, 88, 14, 39,
  14, 80, 1, 14, 74, 1, 14, 80
]
noncomputable def return_w_40_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_40_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_40_1 node_w_40_1 := by rfl
theorem return_spec_40_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_40_1 return_w_40_1 := by rfl
noncomputable def weight_source_39_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_39_1 weight_source_40_1
noncomputable def node_w_39_2 : List Nat := node_w_39_1 ++ node_w_40_1
noncomputable def return_w_39_2 : List Nat := return_w_39_1 ++ return_w_40_1
theorem node_spec_39_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_39_2 node_w_39_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_39_1 weight_source_40_1 node_w_39_1 node_w_40_1
    node_spec_39_1 node_spec_40_1
theorem return_spec_39_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_39_2 return_w_39_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_39_1 weight_source_40_1 return_w_39_1 return_w_40_1
    return_spec_39_1 return_spec_40_1
noncomputable def weight_source_41_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1312
noncomputable def node_w_41_1 : List Nat := [
  1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 44, 14,
  53, 44, 1, 14, 53, 1, 2, 74, 88, 14, 39, 14,
  80, 1, 14, 74, 1, 14, 80, 1
]
noncomputable def return_w_41_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_41_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_41_1 node_w_41_1 := by rfl
theorem return_spec_41_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_41_1 return_w_41_1 := by rfl
noncomputable def weight_source_42_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1344
noncomputable def node_w_42_1 : List Nat := [
  2, 104, 115, 14, 39, 14, 107, 1, 14, 134, 14, 134,
  134, 1, 14, 134, 1, 2, 74, 88, 14, 39, 14, 80,
  1, 14, 134, 14, 134, 1, 14, 134
]
noncomputable def return_w_42_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 16
]
theorem node_spec_42_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_42_1 node_w_42_1 := by rfl
theorem return_spec_42_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_42_1 return_w_42_1 := by rfl
noncomputable def weight_source_41_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_41_1 weight_source_42_1
noncomputable def node_w_41_2 : List Nat := node_w_41_1 ++ node_w_42_1
noncomputable def return_w_41_2 : List Nat := return_w_41_1 ++ return_w_42_1
theorem node_spec_41_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_41_2 node_w_41_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_41_1 weight_source_42_1 node_w_41_1 node_w_42_1
    node_spec_41_1 node_spec_42_1
theorem return_spec_41_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_41_2 return_w_41_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_41_1 weight_source_42_1 return_w_41_1 return_w_42_1
    return_spec_41_1 return_spec_42_1
noncomputable def weight_source_39_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_39_2 weight_source_41_2
noncomputable def node_w_39_4 : List Nat := node_w_39_2 ++ node_w_41_2
noncomputable def return_w_39_4 : List Nat := return_w_39_2 ++ return_w_41_2
theorem node_spec_39_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_39_4 node_w_39_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_39_2 weight_source_41_2 node_w_39_2 node_w_41_2
    node_spec_39_2 node_spec_41_2
theorem return_spec_39_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_39_4 return_w_39_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_39_2 weight_source_41_2 return_w_39_2 return_w_41_2
    return_spec_39_2 return_spec_41_2
noncomputable def weight_source_43_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1376
noncomputable def node_w_43_1 : List Nat := [
  14, 134, 134, 14, 134, 1, 14, 74, 1, 14, 80, 1,
  14, 74, 1, 14, 80, 1, 14, 61, 14, 1, 14, 53,
  1, 2, 44, 61, 14, 39, 14, 53
]
noncomputable def return_w_43_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_43_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_43_1 node_w_43_1 := by rfl
theorem return_spec_43_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_43_1 return_w_43_1 := by rfl
noncomputable def weight_source_44_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1408
noncomputable def node_w_44_1 : List Nat := [
  1, 14, 74, 1, 14, 80, 1, 2, 134, 142, 14, 39,
  14, 134, 1, 14, 104, 14, 107, 104, 1, 14, 107, 1,
  2, 74, 88, 14, 39, 14, 80, 1
]
noncomputable def return_w_44_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1
]
theorem node_spec_44_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_44_1 node_w_44_1 := by rfl
theorem return_spec_44_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_44_1 return_w_44_1 := by rfl
noncomputable def weight_source_43_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_43_1 weight_source_44_1
noncomputable def node_w_43_2 : List Nat := node_w_43_1 ++ node_w_44_1
noncomputable def return_w_43_2 : List Nat := return_w_43_1 ++ return_w_44_1
theorem node_spec_43_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_43_2 node_w_43_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_43_1 weight_source_44_1 node_w_43_1 node_w_44_1
    node_spec_43_1 node_spec_44_1
theorem return_spec_43_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_43_2 return_w_43_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_43_1 weight_source_44_1 return_w_43_1 return_w_44_1
    return_spec_43_1 return_spec_44_1
noncomputable def weight_source_45_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1440
noncomputable def node_w_45_1 : List Nat := [
  2, 134, 142, 14, 39, 14, 134, 44, 1, 14, 53, 1,
  2, 74, 88, 14, 39, 14, 80, 1, 2, 134, 142, 14,
  39, 14, 134, 1, 14, 74, 1, 14
]
noncomputable def return_w_45_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_45_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_45_1 node_w_45_1 := by rfl
theorem return_spec_45_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_45_1 return_w_45_1 := by rfl
noncomputable def weight_source_46_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1472
noncomputable def node_w_46_1 : List Nat := [
  80, 1, 2, 134, 142, 14, 39, 14, 134, 1, 14, 74,
  1, 14, 80, 1, 2, 134, 142, 14, 39, 14, 134, 1,
  14, 104, 14, 107, 104, 1, 14, 107
]
noncomputable def return_w_46_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 16, 1, 1, 16, 1, 1, 1
]
theorem node_spec_46_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_46_1 node_w_46_1 := by rfl
theorem return_spec_46_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_46_1 return_w_46_1 := by rfl
noncomputable def weight_source_45_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_45_1 weight_source_46_1
noncomputable def node_w_45_2 : List Nat := node_w_45_1 ++ node_w_46_1
noncomputable def return_w_45_2 : List Nat := return_w_45_1 ++ return_w_46_1
theorem node_spec_45_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_45_2 node_w_45_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_45_1 weight_source_46_1 node_w_45_1 node_w_46_1
    node_spec_45_1 node_spec_46_1
theorem return_spec_45_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_45_2 return_w_45_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_45_1 weight_source_46_1 return_w_45_1 return_w_46_1
    return_spec_45_1 return_spec_46_1
noncomputable def weight_source_43_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_43_2 weight_source_45_2
noncomputable def node_w_43_4 : List Nat := node_w_43_2 ++ node_w_45_2
noncomputable def return_w_43_4 : List Nat := return_w_43_2 ++ return_w_45_2
theorem node_spec_43_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_43_4 node_w_43_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_43_2 weight_source_45_2 node_w_43_2 node_w_45_2
    node_spec_43_2 node_spec_45_2
theorem return_spec_43_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_43_4 return_w_43_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_43_2 weight_source_45_2 return_w_43_2 return_w_45_2
    return_spec_43_2 return_spec_45_2
noncomputable def weight_source_39_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_39_4 weight_source_43_4
noncomputable def node_w_39_8 : List Nat := node_w_39_4 ++ node_w_43_4
noncomputable def return_w_39_8 : List Nat := return_w_39_4 ++ return_w_43_4
theorem node_spec_39_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_39_8 node_w_39_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_39_4 weight_source_43_4 node_w_39_4 node_w_43_4
    node_spec_39_4 node_spec_43_4
theorem return_spec_39_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_39_8 return_w_39_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_39_4 weight_source_43_4 return_w_39_4 return_w_43_4
    return_spec_39_4 return_spec_43_4
noncomputable def weight_source_31_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_31_8 weight_source_39_8
noncomputable def node_w_31_16 : List Nat := node_w_31_8 ++ node_w_39_8
noncomputable def return_w_31_16 : List Nat := return_w_31_8 ++ return_w_39_8
theorem node_spec_31_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_16 node_w_31_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_31_8 weight_source_39_8 node_w_31_8 node_w_39_8
    node_spec_31_8 node_spec_39_8
theorem return_spec_31_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_16 return_w_31_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_31_8 weight_source_39_8 return_w_31_8 return_w_39_8
    return_spec_31_8 return_spec_39_8
noncomputable def weight_source_47_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1504
noncomputable def node_w_47_1 : List Nat := [
  1, 2, 74, 88, 14, 39, 14, 80, 1, 2, 134, 142,
  14, 39, 14, 134, 1, 14, 74, 1, 14, 80, 1, 2,
  104, 115, 14, 39, 14, 107, 1, 14
]
noncomputable def return_w_47_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_47_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_47_1 node_w_47_1 := by rfl
theorem return_spec_47_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_47_1 return_w_47_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t48\t{now}"
      handle.flush
noncomputable def weight_source_48_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1536
noncomputable def node_w_48_1 : List Nat := [
  44, 14, 53, 1, 14, 134, 14, 134, 134, 1, 14, 134,
  1, 14, 44, 1, 14, 53, 1, 2, 74, 88, 14, 39,
  14, 80, 1, 14, 134, 14, 134, 1
]
noncomputable def return_w_48_1 : List Nat := [
  16, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_48_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_48_1 node_w_48_1 := by rfl
theorem return_spec_48_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_48_1 return_w_48_1 := by rfl
noncomputable def weight_source_47_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_47_1 weight_source_48_1
noncomputable def node_w_47_2 : List Nat := node_w_47_1 ++ node_w_48_1
noncomputable def return_w_47_2 : List Nat := return_w_47_1 ++ return_w_48_1
theorem node_spec_47_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_47_2 node_w_47_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_47_1 weight_source_48_1 node_w_47_1 node_w_48_1
    node_spec_47_1 node_spec_48_1
theorem return_spec_47_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_47_2 return_w_47_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_47_1 weight_source_48_1 return_w_47_1 return_w_48_1
    return_spec_47_1 return_spec_48_1
noncomputable def weight_source_49_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1568
noncomputable def node_w_49_1 : List Nat := [
  14, 134, 14, 134, 1, 14, 134, 14, 134, 134, 14, 134,
  1, 14, 74, 1, 14, 80, 1, 2, 134, 142, 14, 39,
  14, 134, 1, 14, 44, 14, 53, 44
]
noncomputable def return_w_49_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 16, 1, 1, 16, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 16
]
theorem node_spec_49_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_49_1 node_w_49_1 := by rfl
theorem return_spec_49_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_49_1 return_w_49_1 := by rfl
noncomputable def weight_source_50_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1600
noncomputable def node_w_50_1 : List Nat := [
  1, 14, 53, 1, 2, 74, 88, 14, 39, 14, 80, 1,
  14, 74, 1, 14, 80, 1, 14, 74, 1, 14, 80, 1,
  14, 61, 14, 1, 14, 53, 1, 2
]
noncomputable def return_w_50_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_50_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_50_1 node_w_50_1 := by rfl
theorem return_spec_50_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_50_1 return_w_50_1 := by rfl
noncomputable def weight_source_49_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_49_1 weight_source_50_1
noncomputable def node_w_49_2 : List Nat := node_w_49_1 ++ node_w_50_1
noncomputable def return_w_49_2 : List Nat := return_w_49_1 ++ return_w_50_1
theorem node_spec_49_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_49_2 node_w_49_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_49_1 weight_source_50_1 node_w_49_1 node_w_50_1
    node_spec_49_1 node_spec_50_1
theorem return_spec_49_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_49_2 return_w_49_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_49_1 weight_source_50_1 return_w_49_1 return_w_50_1
    return_spec_49_1 return_spec_50_1
noncomputable def weight_source_47_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_47_2 weight_source_49_2
noncomputable def node_w_47_4 : List Nat := node_w_47_2 ++ node_w_49_2
noncomputable def return_w_47_4 : List Nat := return_w_47_2 ++ return_w_49_2
theorem node_spec_47_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_47_4 node_w_47_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_47_2 weight_source_49_2 node_w_47_2 node_w_49_2
    node_spec_47_2 node_spec_49_2
theorem return_spec_47_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_47_4 return_w_47_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_47_2 weight_source_49_2 return_w_47_2 return_w_49_2
    return_spec_47_2 return_spec_49_2
noncomputable def weight_source_51_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1632
noncomputable def node_w_51_1 : List Nat := [
  44, 61, 14, 39, 14, 53, 44, 1, 14, 53, 1, 2,
  74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14, 80,
  1, 14, 74, 1, 14, 80, 1, 14
]
noncomputable def return_w_51_1 : List Nat := [
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_51_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_51_1 node_w_51_1 := by rfl
theorem return_spec_51_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_51_1 return_w_51_1 := by rfl
noncomputable def weight_source_52_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1664
noncomputable def node_w_52_1 : List Nat := [
  61, 14, 1, 14, 53, 1, 2, 44, 61, 14, 39, 14,
  53, 44, 1, 14, 53, 1, 2, 74, 88, 14, 39, 14,
  80, 1, 14, 74, 1, 14, 80, 1
]
noncomputable def return_w_52_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_52_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_52_1 node_w_52_1 := by rfl
theorem return_spec_52_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_52_1 return_w_52_1 := by rfl
noncomputable def weight_source_51_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_51_1 weight_source_52_1
noncomputable def node_w_51_2 : List Nat := node_w_51_1 ++ node_w_52_1
noncomputable def return_w_51_2 : List Nat := return_w_51_1 ++ return_w_52_1
theorem node_spec_51_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_51_2 node_w_51_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_51_1 weight_source_52_1 node_w_51_1 node_w_52_1
    node_spec_51_1 node_spec_52_1
theorem return_spec_51_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_51_2 return_w_51_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_51_1 weight_source_52_1 return_w_51_1 return_w_52_1
    return_spec_51_1 return_spec_52_1
noncomputable def weight_source_53_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1696
noncomputable def node_w_53_1 : List Nat := [
  14, 74, 1, 14, 80, 1, 14, 61, 14, 1, 14, 53,
  1, 2, 44, 61, 14, 39, 14, 53, 44, 1, 14, 53,
  1, 2, 74, 88, 14, 39, 14, 80
]
noncomputable def return_w_53_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_53_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_53_1 node_w_53_1 := by rfl
theorem return_spec_53_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_53_1 return_w_53_1 := by rfl
noncomputable def weight_source_54_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1728
noncomputable def node_w_54_1 : List Nat := [
  1, 14, 74, 1, 14, 80, 1, 14, 74, 1, 14, 80,
  1, 14, 61, 14, 1, 14, 53, 1, 2, 44, 61, 14,
  39, 14, 53, 44, 1, 14, 53, 1
]
noncomputable def return_w_54_1 : List Nat := [
  1, 1, 16, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1
]
theorem node_spec_54_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_54_1 node_w_54_1 := by rfl
theorem return_spec_54_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_54_1 return_w_54_1 := by rfl
noncomputable def weight_source_53_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_53_1 weight_source_54_1
noncomputable def node_w_53_2 : List Nat := node_w_53_1 ++ node_w_54_1
noncomputable def return_w_53_2 : List Nat := return_w_53_1 ++ return_w_54_1
theorem node_spec_53_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_53_2 node_w_53_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_53_1 weight_source_54_1 node_w_53_1 node_w_54_1
    node_spec_53_1 node_spec_54_1
theorem return_spec_53_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_53_2 return_w_53_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_53_1 weight_source_54_1 return_w_53_1 return_w_54_1
    return_spec_53_1 return_spec_54_1
noncomputable def weight_source_51_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_51_2 weight_source_53_2
noncomputable def node_w_51_4 : List Nat := node_w_51_2 ++ node_w_53_2
noncomputable def return_w_51_4 : List Nat := return_w_51_2 ++ return_w_53_2
theorem node_spec_51_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_51_4 node_w_51_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_51_2 weight_source_53_2 node_w_51_2 node_w_53_2
    node_spec_51_2 node_spec_53_2
theorem return_spec_51_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_51_4 return_w_51_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_51_2 weight_source_53_2 return_w_51_2 return_w_53_2
    return_spec_51_2 return_spec_53_2
noncomputable def weight_source_47_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_47_4 weight_source_51_4
noncomputable def node_w_47_8 : List Nat := node_w_47_4 ++ node_w_51_4
noncomputable def return_w_47_8 : List Nat := return_w_47_4 ++ return_w_51_4
theorem node_spec_47_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_47_8 node_w_47_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_47_4 weight_source_51_4 node_w_47_4 node_w_51_4
    node_spec_47_4 node_spec_51_4
theorem return_spec_47_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_47_8 return_w_47_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_47_4 weight_source_51_4 return_w_47_4 return_w_51_4
    return_spec_47_4 return_spec_51_4
noncomputable def weight_source_55_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1760
noncomputable def node_w_55_1 : List Nat := [
  2, 74, 88, 14, 39, 14, 80, 1, 14, 74, 1, 14,
  80, 1, 2, 44, 61, 14, 39, 14, 53, 1, 14, 74,
  1, 14, 80, 1, 2, 44, 61, 14
]
noncomputable def return_w_55_1 : List Nat := [
  1, 16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1,
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_55_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_55_1 node_w_55_1 := by rfl
theorem return_spec_55_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_55_1 return_w_55_1 := by rfl
noncomputable def weight_source_56_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1792
noncomputable def node_w_56_1 : List Nat := [
  39, 14, 53, 1, 14, 74, 14, 80, 1, 2, 44, 61,
  14, 39, 14, 53, 1, 14, 44, 1, 14, 53, 1, 2,
  74, 88, 14, 39, 14, 80, 1, 14
]
noncomputable def return_w_56_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_56_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_56_1 node_w_56_1 := by rfl
theorem return_spec_56_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_56_1 return_w_56_1 := by rfl
noncomputable def weight_source_55_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_55_1 weight_source_56_1
noncomputable def node_w_55_2 : List Nat := node_w_55_1 ++ node_w_56_1
noncomputable def return_w_55_2 : List Nat := return_w_55_1 ++ return_w_56_1
theorem node_spec_55_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_55_2 node_w_55_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_55_1 weight_source_56_1 node_w_55_1 node_w_56_1
    node_spec_55_1 node_spec_56_1
theorem return_spec_55_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_55_2 return_w_55_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_55_1 weight_source_56_1 return_w_55_1 return_w_56_1
    return_spec_55_1 return_spec_56_1
noncomputable def weight_source_57_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1824
noncomputable def node_w_57_1 : List Nat := [
  74, 1, 14, 80, 1, 2, 44, 61, 14, 39, 14, 53,
  1, 14, 104, 14, 107, 104, 1, 14, 107, 1, 2, 74,
  88, 14, 39, 14, 80, 1, 14, 74
]
noncomputable def return_w_57_1 : List Nat := [
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  1, 1, 16, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 16
]
theorem node_spec_57_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_57_1 node_w_57_1 := by rfl
theorem return_spec_57_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_57_1 return_w_57_1 := by rfl
noncomputable def weight_source_58_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1856
noncomputable def node_w_58_1 : List Nat := [
  1, 14, 80, 1, 2, 134, 142, 14, 39, 14, 134, 1,
  14, 134, 14, 134, 44, 1, 14, 53, 1, 2, 74, 88,
  14, 39, 14, 80, 1, 2, 134, 142
]
noncomputable def return_w_58_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1,
  1, 16, 1, 1, 16, 1, 1, 1, 1, 1, 16, 1,
  1, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_58_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_58_1 node_w_58_1 := by rfl
theorem return_spec_58_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_58_1 return_w_58_1 := by rfl
noncomputable def weight_source_57_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_57_1 weight_source_58_1
noncomputable def node_w_57_2 : List Nat := node_w_57_1 ++ node_w_58_1
noncomputable def return_w_57_2 : List Nat := return_w_57_1 ++ return_w_58_1
theorem node_spec_57_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_57_2 node_w_57_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_57_1 weight_source_58_1 node_w_57_1 node_w_58_1
    node_spec_57_1 node_spec_58_1
theorem return_spec_57_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_57_2 return_w_57_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_57_1 weight_source_58_1 return_w_57_1 return_w_58_1
    return_spec_57_1 return_spec_58_1
noncomputable def weight_source_55_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_55_2 weight_source_57_2
noncomputable def node_w_55_4 : List Nat := node_w_55_2 ++ node_w_57_2
noncomputable def return_w_55_4 : List Nat := return_w_55_2 ++ return_w_57_2
theorem node_spec_55_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_55_4 node_w_55_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_55_2 weight_source_57_2 node_w_55_2 node_w_57_2
    node_spec_55_2 node_spec_57_2
theorem return_spec_55_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_55_4 return_w_55_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_55_2 weight_source_57_2 return_w_55_2 return_w_57_2
    return_spec_55_2 return_spec_57_2
noncomputable def weight_source_59_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1888
noncomputable def node_w_59_1 : List Nat := [
  14, 39, 14, 134, 1, 14, 74, 1, 14, 80, 1, 2,
  134, 142, 14, 39, 14, 134, 1, 14, 44, 14, 53, 44,
  1, 14, 53, 1, 2, 74, 88, 14
]
noncomputable def return_w_59_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 16,
  1, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_59_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_59_1 node_w_59_1 := by rfl
theorem return_spec_59_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_59_1 return_w_59_1 := by rfl
noncomputable def weight_source_60_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1920
noncomputable def node_w_60_1 : List Nat := [
  39, 14, 80, 1, 14, 74, 1, 14, 80, 1, 2, 104,
  115, 14, 39, 14, 107, 1, 14, 134, 14, 134, 134, 1,
  14, 134, 1, 2, 74, 88, 14, 39
]
noncomputable def return_w_60_1 : List Nat := [
  1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 16, 1,
  1, 1, 1, 1, 16, 1, 1, 1
]
theorem node_spec_60_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_60_1 node_w_60_1 := by rfl
theorem return_spec_60_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_60_1 return_w_60_1 := by rfl
noncomputable def weight_source_59_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_59_1 weight_source_60_1
noncomputable def node_w_59_2 : List Nat := node_w_59_1 ++ node_w_60_1
noncomputable def return_w_59_2 : List Nat := return_w_59_1 ++ return_w_60_1
theorem node_spec_59_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_59_2 node_w_59_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_59_1 weight_source_60_1 node_w_59_1 node_w_60_1
    node_spec_59_1 node_spec_60_1
theorem return_spec_59_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_59_2 return_w_59_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_59_1 weight_source_60_1 return_w_59_1 return_w_60_1
    return_spec_59_1 return_spec_60_1
noncomputable def weight_source_61_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1952
noncomputable def node_w_61_1 : List Nat := [
  14, 80, 1, 14, 134, 14, 134, 134, 14, 134, 1, 14,
  74, 1, 14, 80, 1, 2, 134, 142, 14, 39, 14, 134,
  44, 14, 53, 1, 14, 74, 1, 14
]
noncomputable def return_w_61_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 16, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 16, 1, 1
]
theorem node_spec_61_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_61_1 node_w_61_1 := by rfl
theorem return_spec_61_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_61_1 return_w_61_1 := by rfl
noncomputable def weight_source_62_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1984
noncomputable def node_w_62_1 : List Nat := [
  80, 1, 14, 74, 1, 14, 80, 1, 14, 61, 14, 1,
  14, 53, 1, 2, 44, 61, 14, 39, 14, 53, 1, 2,
  134, 142, 14, 39, 14, 134, 44, 1
]
noncomputable def return_w_62_1 : List Nat := [
  1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 16, 1
]
theorem node_spec_62_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_62_1 node_w_62_1 := by rfl
theorem return_spec_62_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_62_1 return_w_62_1 := by rfl
noncomputable def weight_source_61_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_61_1 weight_source_62_1
noncomputable def node_w_61_2 : List Nat := node_w_61_1 ++ node_w_62_1
noncomputable def return_w_61_2 : List Nat := return_w_61_1 ++ return_w_62_1
theorem node_spec_61_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_61_2 node_w_61_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_61_1 weight_source_62_1 node_w_61_1 node_w_62_1
    node_spec_61_1 node_spec_62_1
theorem return_spec_61_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_61_2 return_w_61_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_61_1 weight_source_62_1 return_w_61_1 return_w_62_1
    return_spec_61_1 return_spec_62_1
noncomputable def weight_source_59_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_59_2 weight_source_61_2
noncomputable def node_w_59_4 : List Nat := node_w_59_2 ++ node_w_61_2
noncomputable def return_w_59_4 : List Nat := return_w_59_2 ++ return_w_61_2
theorem node_spec_59_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_59_4 node_w_59_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_59_2 weight_source_61_2 node_w_59_2 node_w_61_2
    node_spec_59_2 node_spec_61_2
theorem return_spec_59_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_59_4 return_w_59_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_59_2 weight_source_61_2 return_w_59_2 return_w_61_2
    return_spec_59_2 return_spec_61_2
noncomputable def weight_source_55_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_55_4 weight_source_59_4
noncomputable def node_w_55_8 : List Nat := node_w_55_4 ++ node_w_59_4
noncomputable def return_w_55_8 : List Nat := return_w_55_4 ++ return_w_59_4
theorem node_spec_55_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_55_8 node_w_55_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_55_4 weight_source_59_4 node_w_55_4 node_w_59_4
    node_spec_55_4 node_spec_59_4
theorem return_spec_55_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_55_8 return_w_55_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_55_4 weight_source_59_4 return_w_55_4 return_w_59_4
    return_spec_55_4 return_spec_59_4
noncomputable def weight_source_47_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_47_8 weight_source_55_8
noncomputable def node_w_47_16 : List Nat := node_w_47_8 ++ node_w_55_8
noncomputable def return_w_47_16 : List Nat := return_w_47_8 ++ return_w_55_8
theorem node_spec_47_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_47_16 node_w_47_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_47_8 weight_source_55_8 node_w_47_8 node_w_55_8
    node_spec_47_8 node_spec_55_8
theorem return_spec_47_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_47_16 return_w_47_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_47_8 weight_source_55_8 return_w_47_8 return_w_55_8
    return_spec_47_8 return_spec_55_8
noncomputable def weight_source_31_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 weight_source_31_16 weight_source_47_16
noncomputable def node_w_31_32 : List Nat := node_w_31_16 ++ node_w_47_16
noncomputable def return_w_31_32 : List Nat := return_w_31_16 ++ return_w_47_16
theorem node_spec_31_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_31_32 node_w_31_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    512 weight_source_31_16 weight_source_47_16 node_w_31_16 node_w_47_16
    node_spec_31_16 node_spec_47_16
theorem return_spec_31_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_31_32 return_w_31_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    512 weight_source_31_16 weight_source_47_16 return_w_31_16 return_w_47_16
    return_spec_31_16 return_spec_47_16
noncomputable def weight_source_0_63 : Balanced.RowTree Snapshot.Entry :=
  .branch 992 weight_source_0_31 weight_source_31_32
noncomputable def node_w_0_63 : List Nat := node_w_0_31 ++ node_w_31_32
noncomputable def return_w_0_63 : List Nat := return_w_0_31 ++ return_w_31_32
theorem node_spec_0_63 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_63 node_w_0_63 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    992 weight_source_0_31 weight_source_31_32 node_w_0_31 node_w_31_32
    node_spec_0_31 node_spec_31_32
theorem return_spec_0_63 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_63 return_w_0_63 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    992 weight_source_0_31 weight_source_31_32 return_w_0_31 return_w_31_32
    return_spec_0_31 return_spec_31_32
noncomputable def weight_source_63_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2016
noncomputable def node_w_63_1 : List Nat := [
  14, 53, 1, 2, 74, 88, 14, 39, 14, 80, 1, 2,
  44, 61, 14, 39, 14, 53, 1, 14, 74, 1, 14, 80,
  1, 2, 134, 142, 14, 39, 14, 134
]
noncomputable def return_w_63_1 : List Nat := [
  1, 1, 1, 1, 16, 1, 1, 1, 1, 1, 1, 1,
  16, 1, 1, 1, 1, 1, 1, 1, 16, 1, 1, 1,
  1, 1, 16, 1, 1, 1, 1, 1
]
theorem node_spec_63_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_1 node_w_63_1 := by rfl
theorem return_spec_63_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_1 return_w_63_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t64\t{now}"
      handle.flush
noncomputable def weight_source_64_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2048
noncomputable def node_w_64_1 : List Nat := [
  1, 14, 104, 14, 107, 104, 1, 14, 107, 1, 2, 74,
  88, 14, 39, 14, 80, 14, 39, 1, 1, 14, 39, 1,
  14, 39, 3, 14, 39, 1, 14, 39
]
noncomputable def return_w_64_1 : List Nat := [
  1, 1, 16, 1, 1, 16, 1, 1, 1, 1, 1, 16,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_64_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_64_1 node_w_64_1 := by rfl
theorem return_spec_64_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_64_1 return_w_64_1 := by rfl
noncomputable def weight_source_63_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_63_1 weight_source_64_1
noncomputable def node_w_63_2 : List Nat := node_w_63_1 ++ node_w_64_1
noncomputable def return_w_63_2 : List Nat := return_w_63_1 ++ return_w_64_1
theorem node_spec_63_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_2 node_w_63_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_63_1 weight_source_64_1 node_w_63_1 node_w_64_1
    node_spec_63_1 node_spec_64_1
theorem return_spec_63_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_2 return_w_63_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_63_1 weight_source_64_1 return_w_63_1 return_w_64_1
    return_spec_63_1 return_spec_64_1
noncomputable def weight_source_65_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2080
noncomputable def node_w_65_1 : List Nat := [
  14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1,
  14, 39, 3, 14, 39, 1, 14, 39, 1, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_65_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_65_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_65_1 node_w_65_1 := by rfl
theorem return_spec_65_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_65_1 return_w_65_1 := by rfl
noncomputable def weight_source_66_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2112
noncomputable def node_w_66_1 : List Nat := [
  39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_66_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_66_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_66_1 node_w_66_1 := by rfl
theorem return_spec_66_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_66_1 return_w_66_1 := by rfl
noncomputable def weight_source_65_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_65_1 weight_source_66_1
noncomputable def node_w_65_2 : List Nat := node_w_65_1 ++ node_w_66_1
noncomputable def return_w_65_2 : List Nat := return_w_65_1 ++ return_w_66_1
theorem node_spec_65_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_65_2 node_w_65_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_65_1 weight_source_66_1 node_w_65_1 node_w_66_1
    node_spec_65_1 node_spec_66_1
theorem return_spec_65_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_65_2 return_w_65_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_65_1 weight_source_66_1 return_w_65_1 return_w_66_1
    return_spec_65_1 return_spec_66_1
noncomputable def weight_source_63_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_63_2 weight_source_65_2
noncomputable def node_w_63_4 : List Nat := node_w_63_2 ++ node_w_65_2
noncomputable def return_w_63_4 : List Nat := return_w_63_2 ++ return_w_65_2
theorem node_spec_63_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_4 node_w_63_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_63_2 weight_source_65_2 node_w_63_2 node_w_65_2
    node_spec_63_2 node_spec_65_2
theorem return_spec_63_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_4 return_w_63_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_63_2 weight_source_65_2 return_w_63_2 return_w_65_2
    return_spec_63_2 return_spec_65_2
noncomputable def weight_source_67_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2144
noncomputable def node_w_67_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  14, 39, 1, 14, 39, 1, 14, 39, 1, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_67_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_67_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_67_1 node_w_67_1 := by rfl
theorem return_spec_67_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_67_1 return_w_67_1 := by rfl
noncomputable def weight_source_68_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2176
noncomputable def node_w_68_1 : List Nat := [
  39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39,
  14, 39, 1, 14, 39, 1, 14, 39, 14, 39, 1, 14,
  39, 1, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_68_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_68_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_68_1 node_w_68_1 := by rfl
theorem return_spec_68_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_68_1 return_w_68_1 := by rfl
noncomputable def weight_source_67_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_67_1 weight_source_68_1
noncomputable def node_w_67_2 : List Nat := node_w_67_1 ++ node_w_68_1
noncomputable def return_w_67_2 : List Nat := return_w_67_1 ++ return_w_68_1
theorem node_spec_67_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_67_2 node_w_67_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_67_1 weight_source_68_1 node_w_67_1 node_w_68_1
    node_spec_67_1 node_spec_68_1
theorem return_spec_67_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_67_2 return_w_67_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_67_1 weight_source_68_1 return_w_67_1 return_w_68_1
    return_spec_67_1 return_spec_68_1
noncomputable def weight_source_69_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2208
noncomputable def node_w_69_1 : List Nat := [
  1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 3, 14,
  39, 3, 14, 39, 1, 14, 39, 14, 39, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_69_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_69_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_69_1 node_w_69_1 := by rfl
theorem return_spec_69_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_69_1 return_w_69_1 := by rfl
noncomputable def weight_source_70_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2240
noncomputable def node_w_70_1 : List Nat := [
  39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1
]
noncomputable def return_w_70_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_70_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_70_1 node_w_70_1 := by rfl
theorem return_spec_70_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_70_1 return_w_70_1 := by rfl
noncomputable def weight_source_69_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_69_1 weight_source_70_1
noncomputable def node_w_69_2 : List Nat := node_w_69_1 ++ node_w_70_1
noncomputable def return_w_69_2 : List Nat := return_w_69_1 ++ return_w_70_1
theorem node_spec_69_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_69_2 node_w_69_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_69_1 weight_source_70_1 node_w_69_1 node_w_70_1
    node_spec_69_1 node_spec_70_1
theorem return_spec_69_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_69_2 return_w_69_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_69_1 weight_source_70_1 return_w_69_1 return_w_70_1
    return_spec_69_1 return_spec_70_1
noncomputable def weight_source_67_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_67_2 weight_source_69_2
noncomputable def node_w_67_4 : List Nat := node_w_67_2 ++ node_w_69_2
noncomputable def return_w_67_4 : List Nat := return_w_67_2 ++ return_w_69_2
theorem node_spec_67_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_67_4 node_w_67_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_67_2 weight_source_69_2 node_w_67_2 node_w_69_2
    node_spec_67_2 node_spec_69_2
theorem return_spec_67_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_67_4 return_w_67_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_67_2 weight_source_69_2 return_w_67_2 return_w_69_2
    return_spec_67_2 return_spec_69_2
noncomputable def weight_source_63_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_63_4 weight_source_67_4
noncomputable def node_w_63_8 : List Nat := node_w_63_4 ++ node_w_67_4
noncomputable def return_w_63_8 : List Nat := return_w_63_4 ++ return_w_67_4
theorem node_spec_63_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_8 node_w_63_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_63_4 weight_source_67_4 node_w_63_4 node_w_67_4
    node_spec_63_4 node_spec_67_4
theorem return_spec_63_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_8 return_w_63_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_63_4 weight_source_67_4 return_w_63_4 return_w_67_4
    return_spec_63_4 return_spec_67_4
noncomputable def weight_source_71_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2272
noncomputable def node_w_71_1 : List Nat := [
  14, 39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1,
  14, 39, 1, 14, 39, 3, 14, 39
]
noncomputable def return_w_71_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_71_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_71_1 node_w_71_1 := by rfl
theorem return_spec_71_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_71_1 return_w_71_1 := by rfl
noncomputable def weight_source_72_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2304
noncomputable def node_w_72_1 : List Nat := [
  1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_72_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_72_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_72_1 node_w_72_1 := by rfl
theorem return_spec_72_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_72_1 return_w_72_1 := by rfl
noncomputable def weight_source_71_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_71_1 weight_source_72_1
noncomputable def node_w_71_2 : List Nat := node_w_71_1 ++ node_w_72_1
noncomputable def return_w_71_2 : List Nat := return_w_71_1 ++ return_w_72_1
theorem node_spec_71_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_71_2 node_w_71_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_71_1 weight_source_72_1 node_w_71_1 node_w_72_1
    node_spec_71_1 node_spec_72_1
theorem return_spec_71_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_71_2 return_w_71_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_71_1 weight_source_72_1 return_w_71_1 return_w_72_1
    return_spec_71_1 return_spec_72_1
noncomputable def weight_source_73_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2336
noncomputable def node_w_73_1 : List Nat := [
  39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 14, 39,
  1, 14, 39, 1, 14, 39, 14, 39
]
noncomputable def return_w_73_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_73_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_73_1 node_w_73_1 := by rfl
theorem return_spec_73_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_73_1 return_w_73_1 := by rfl
noncomputable def weight_source_74_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2368
noncomputable def node_w_74_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14,
  39, 14, 39, 1, 14, 39, 1, 14
]
noncomputable def return_w_74_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_74_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_74_1 node_w_74_1 := by rfl
theorem return_spec_74_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_74_1 return_w_74_1 := by rfl
noncomputable def weight_source_73_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_73_1 weight_source_74_1
noncomputable def node_w_73_2 : List Nat := node_w_73_1 ++ node_w_74_1
noncomputable def return_w_73_2 : List Nat := return_w_73_1 ++ return_w_74_1
theorem node_spec_73_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_73_2 node_w_73_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_73_1 weight_source_74_1 node_w_73_1 node_w_74_1
    node_spec_73_1 node_spec_74_1
theorem return_spec_73_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_73_2 return_w_73_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_73_1 weight_source_74_1 return_w_73_1 return_w_74_1
    return_spec_73_1 return_spec_74_1
noncomputable def weight_source_71_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_71_2 weight_source_73_2
noncomputable def node_w_71_4 : List Nat := node_w_71_2 ++ node_w_73_2
noncomputable def return_w_71_4 : List Nat := return_w_71_2 ++ return_w_73_2
theorem node_spec_71_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_71_4 node_w_71_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_71_2 weight_source_73_2 node_w_71_2 node_w_73_2
    node_spec_71_2 node_spec_73_2
theorem return_spec_71_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_71_4 return_w_71_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_71_2 weight_source_73_2 return_w_71_2 return_w_73_2
    return_spec_71_2 return_spec_73_2
noncomputable def weight_source_75_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2400
noncomputable def node_w_75_1 : List Nat := [
  39, 14, 39, 1, 14, 39, 1, 14, 39, 14, 39, 1,
  14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1,
  1, 14, 39, 1, 14, 39, 3, 14
]
noncomputable def return_w_75_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_75_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_75_1 node_w_75_1 := by rfl
theorem return_spec_75_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_75_1 return_w_75_1 := by rfl
noncomputable def weight_source_76_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2432
noncomputable def node_w_76_1 : List Nat := [
  39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39,
  14, 39, 1, 14, 39, 1, 14, 39, 14, 39, 1, 14,
  39, 1, 1, 14, 39, 3, 14, 39
]
noncomputable def return_w_76_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_76_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_76_1 node_w_76_1 := by rfl
theorem return_spec_76_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_76_1 return_w_76_1 := by rfl
noncomputable def weight_source_75_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_75_1 weight_source_76_1
noncomputable def node_w_75_2 : List Nat := node_w_75_1 ++ node_w_76_1
noncomputable def return_w_75_2 : List Nat := return_w_75_1 ++ return_w_76_1
theorem node_spec_75_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_75_2 node_w_75_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_75_1 weight_source_76_1 node_w_75_1 node_w_76_1
    node_spec_75_1 node_spec_76_1
theorem return_spec_75_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_75_2 return_w_75_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_75_1 weight_source_76_1 return_w_75_1 return_w_76_1
    return_spec_75_1 return_spec_76_1
noncomputable def weight_source_77_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2464
noncomputable def node_w_77_1 : List Nat := [
  1, 14, 39, 14, 39, 1, 1, 14, 39, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 1, 14, 39, 14, 39, 1,
  14, 39, 1, 14, 39, 1, 1, 14
]
noncomputable def return_w_77_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_77_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_77_1 node_w_77_1 := by rfl
theorem return_spec_77_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_77_1 return_w_77_1 := by rfl
noncomputable def weight_source_78_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2496
noncomputable def node_w_78_1 : List Nat := [
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 14, 39,
  1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 1, 14, 39, 1
]
noncomputable def return_w_78_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_78_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_78_1 node_w_78_1 := by rfl
theorem return_spec_78_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_78_1 return_w_78_1 := by rfl
noncomputable def weight_source_77_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_77_1 weight_source_78_1
noncomputable def node_w_77_2 : List Nat := node_w_77_1 ++ node_w_78_1
noncomputable def return_w_77_2 : List Nat := return_w_77_1 ++ return_w_78_1
theorem node_spec_77_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_77_2 node_w_77_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_77_1 weight_source_78_1 node_w_77_1 node_w_78_1
    node_spec_77_1 node_spec_78_1
theorem return_spec_77_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_77_2 return_w_77_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_77_1 weight_source_78_1 return_w_77_1 return_w_78_1
    return_spec_77_1 return_spec_78_1
noncomputable def weight_source_75_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_75_2 weight_source_77_2
noncomputable def node_w_75_4 : List Nat := node_w_75_2 ++ node_w_77_2
noncomputable def return_w_75_4 : List Nat := return_w_75_2 ++ return_w_77_2
theorem node_spec_75_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_75_4 node_w_75_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_75_2 weight_source_77_2 node_w_75_2 node_w_77_2
    node_spec_75_2 node_spec_77_2
theorem return_spec_75_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_75_4 return_w_75_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_75_2 weight_source_77_2 return_w_75_2 return_w_77_2
    return_spec_75_2 return_spec_77_2
noncomputable def weight_source_71_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_71_4 weight_source_75_4
noncomputable def node_w_71_8 : List Nat := node_w_71_4 ++ node_w_75_4
noncomputable def return_w_71_8 : List Nat := return_w_71_4 ++ return_w_75_4
theorem node_spec_71_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_71_8 node_w_71_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_71_4 weight_source_75_4 node_w_71_4 node_w_75_4
    node_spec_71_4 node_spec_75_4
theorem return_spec_71_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_71_8 return_w_71_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_71_4 weight_source_75_4 return_w_71_4 return_w_75_4
    return_spec_71_4 return_spec_75_4
noncomputable def weight_source_63_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_63_8 weight_source_71_8
noncomputable def node_w_63_16 : List Nat := node_w_63_8 ++ node_w_71_8
noncomputable def return_w_63_16 : List Nat := return_w_63_8 ++ return_w_71_8
theorem node_spec_63_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_16 node_w_63_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_63_8 weight_source_71_8 node_w_63_8 node_w_71_8
    node_spec_63_8 node_spec_71_8
theorem return_spec_63_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_16 return_w_63_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_63_8 weight_source_71_8 return_w_63_8 return_w_71_8
    return_spec_63_8 return_spec_71_8
noncomputable def weight_source_79_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2528
noncomputable def node_w_79_1 : List Nat := [
  14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 14,
  39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_79_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_79_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_79_1 node_w_79_1 := by rfl
theorem return_spec_79_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_79_1 return_w_79_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t80\t{now}"
      handle.flush
noncomputable def weight_source_80_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2560
noncomputable def node_w_80_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  14, 39, 1, 14, 39, 1, 14, 39, 1, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_80_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_80_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_80_1 node_w_80_1 := by rfl
theorem return_spec_80_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_80_1 return_w_80_1 := by rfl
noncomputable def weight_source_79_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_79_1 weight_source_80_1
noncomputable def node_w_79_2 : List Nat := node_w_79_1 ++ node_w_80_1
noncomputable def return_w_79_2 : List Nat := return_w_79_1 ++ return_w_80_1
theorem node_spec_79_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_79_2 node_w_79_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_79_1 weight_source_80_1 node_w_79_1 node_w_80_1
    node_spec_79_1 node_spec_80_1
theorem return_spec_79_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_79_2 return_w_79_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_79_1 weight_source_80_1 return_w_79_1 return_w_80_1
    return_spec_79_1 return_spec_80_1
noncomputable def weight_source_81_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2592
noncomputable def node_w_81_1 : List Nat := [
  39, 14, 39, 1, 14, 39, 1, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 3,
  14, 39, 3, 14, 39, 1, 14, 39
]
noncomputable def return_w_81_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_81_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_81_1 node_w_81_1 := by rfl
theorem return_spec_81_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_81_1 return_w_81_1 := by rfl
noncomputable def weight_source_82_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2624
noncomputable def node_w_82_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 14, 39, 1, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1
]
noncomputable def return_w_82_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_82_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_82_1 node_w_82_1 := by rfl
theorem return_spec_82_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_82_1 return_w_82_1 := by rfl
noncomputable def weight_source_81_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_81_1 weight_source_82_1
noncomputable def node_w_81_2 : List Nat := node_w_81_1 ++ node_w_82_1
noncomputable def return_w_81_2 : List Nat := return_w_81_1 ++ return_w_82_1
theorem node_spec_81_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_81_2 node_w_81_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_81_1 weight_source_82_1 node_w_81_1 node_w_82_1
    node_spec_81_1 node_spec_82_1
theorem return_spec_81_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_81_2 return_w_81_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_81_1 weight_source_82_1 return_w_81_1 return_w_82_1
    return_spec_81_1 return_spec_82_1
noncomputable def weight_source_79_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_79_2 weight_source_81_2
noncomputable def node_w_79_4 : List Nat := node_w_79_2 ++ node_w_81_2
noncomputable def return_w_79_4 : List Nat := return_w_79_2 ++ return_w_81_2
theorem node_spec_79_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_79_4 node_w_79_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_79_2 weight_source_81_2 node_w_79_2 node_w_81_2
    node_spec_79_2 node_spec_81_2
theorem return_spec_79_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_79_4 return_w_79_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_79_2 weight_source_81_2 return_w_79_2 return_w_81_2
    return_spec_79_2 return_spec_81_2
noncomputable def weight_source_83_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2656
noncomputable def node_w_83_1 : List Nat := [
  14, 39, 1, 3, 14, 39, 3, 14, 39, 1, 14, 39,
  1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 14, 39, 1, 1
]
noncomputable def return_w_83_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_83_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_83_1 node_w_83_1 := by rfl
theorem return_spec_83_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_83_1 return_w_83_1 := by rfl
noncomputable def weight_source_84_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2688
noncomputable def node_w_84_1 : List Nat := [
  14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 1, 3, 14, 39, 3, 14, 39, 1, 14, 39,
  1, 14, 39, 1, 14, 39, 1, 14
]
noncomputable def return_w_84_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_84_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_84_1 node_w_84_1 := by rfl
theorem return_spec_84_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_84_1 return_w_84_1 := by rfl
noncomputable def weight_source_83_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_83_1 weight_source_84_1
noncomputable def node_w_83_2 : List Nat := node_w_83_1 ++ node_w_84_1
noncomputable def return_w_83_2 : List Nat := return_w_83_1 ++ return_w_84_1
theorem node_spec_83_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_83_2 node_w_83_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_83_1 weight_source_84_1 node_w_83_1 node_w_84_1
    node_spec_83_1 node_spec_84_1
theorem return_spec_83_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_83_2 return_w_83_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_83_1 weight_source_84_1 return_w_83_1 return_w_84_1
    return_spec_83_1 return_spec_84_1
noncomputable def weight_source_85_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2720
noncomputable def node_w_85_1 : List Nat := [
  39, 3, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1,
  14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 1, 3, 14, 39, 3, 14
]
noncomputable def return_w_85_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_85_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_85_1 node_w_85_1 := by rfl
theorem return_spec_85_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_85_1 return_w_85_1 := by rfl
noncomputable def weight_source_86_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2752
noncomputable def node_w_86_1 : List Nat := [
  39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1, 14,
  39, 1, 14, 39, 1, 14, 39, 3
]
noncomputable def return_w_86_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_86_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_86_1 node_w_86_1 := by rfl
theorem return_spec_86_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_86_1 return_w_86_1 := by rfl
noncomputable def weight_source_85_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_85_1 weight_source_86_1
noncomputable def node_w_85_2 : List Nat := node_w_85_1 ++ node_w_86_1
noncomputable def return_w_85_2 : List Nat := return_w_85_1 ++ return_w_86_1
theorem node_spec_85_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_85_2 node_w_85_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_85_1 weight_source_86_1 node_w_85_1 node_w_86_1
    node_spec_85_1 node_spec_86_1
theorem return_spec_85_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_85_2 return_w_85_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_85_1 weight_source_86_1 return_w_85_1 return_w_86_1
    return_spec_85_1 return_spec_86_1
noncomputable def weight_source_83_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_83_2 weight_source_85_2
noncomputable def node_w_83_4 : List Nat := node_w_83_2 ++ node_w_85_2
noncomputable def return_w_83_4 : List Nat := return_w_83_2 ++ return_w_85_2
theorem node_spec_83_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_83_4 node_w_83_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_83_2 weight_source_85_2 node_w_83_2 node_w_85_2
    node_spec_83_2 node_spec_85_2
theorem return_spec_83_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_83_4 return_w_83_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_83_2 weight_source_85_2 return_w_83_2 return_w_85_2
    return_spec_83_2 return_spec_85_2
noncomputable def weight_source_79_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_79_4 weight_source_83_4
noncomputable def node_w_79_8 : List Nat := node_w_79_4 ++ node_w_83_4
noncomputable def return_w_79_8 : List Nat := return_w_79_4 ++ return_w_83_4
theorem node_spec_79_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_79_8 node_w_79_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_79_4 weight_source_83_4 node_w_79_4 node_w_83_4
    node_spec_79_4 node_spec_83_4
theorem return_spec_79_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_79_8 return_w_79_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_79_4 weight_source_83_4 return_w_79_4 return_w_83_4
    return_spec_79_4 return_spec_83_4
noncomputable def weight_source_87_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2784
noncomputable def node_w_87_1 : List Nat := [
  14, 39, 1, 14, 39, 1, 3, 14, 39, 3, 14, 39,
  1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_87_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_87_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_87_1 node_w_87_1 := by rfl
theorem return_spec_87_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_87_1 return_w_87_1 := by rfl
noncomputable def weight_source_88_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2816
noncomputable def node_w_88_1 : List Nat := [
  1, 1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 1, 3, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_88_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_88_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_88_1 node_w_88_1 := by rfl
theorem return_spec_88_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_88_1 return_w_88_1 := by rfl
noncomputable def weight_source_87_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_87_1 weight_source_88_1
noncomputable def node_w_87_2 : List Nat := node_w_87_1 ++ node_w_88_1
noncomputable def return_w_87_2 : List Nat := return_w_87_1 ++ return_w_88_1
theorem node_spec_87_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_87_2 node_w_87_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_87_1 weight_source_88_1 node_w_87_1 node_w_88_1
    node_spec_87_1 node_spec_88_1
theorem return_spec_87_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_87_2 return_w_87_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_87_1 weight_source_88_1 return_w_87_1 return_w_88_1
    return_spec_87_1 return_spec_88_1
noncomputable def weight_source_89_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2848
noncomputable def node_w_89_1 : List Nat := [
  14, 39, 3, 14, 39, 1, 14, 39, 1, 14, 39, 1,
  1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 3, 14, 39, 3
]
noncomputable def return_w_89_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_89_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_89_1 node_w_89_1 := by rfl
theorem return_spec_89_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_89_1 return_w_89_1 := by rfl
noncomputable def weight_source_90_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2880
noncomputable def node_w_90_1 : List Nat := [
  14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 1, 1, 14
]
noncomputable def return_w_90_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_90_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_90_1 node_w_90_1 := by rfl
theorem return_spec_90_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_90_1 return_w_90_1 := by rfl
noncomputable def weight_source_89_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_89_1 weight_source_90_1
noncomputable def node_w_89_2 : List Nat := node_w_89_1 ++ node_w_90_1
noncomputable def return_w_89_2 : List Nat := return_w_89_1 ++ return_w_90_1
theorem node_spec_89_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_89_2 node_w_89_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_89_1 weight_source_90_1 node_w_89_1 node_w_90_1
    node_spec_89_1 node_spec_90_1
theorem return_spec_89_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_89_2 return_w_89_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_89_1 weight_source_90_1 return_w_89_1 return_w_90_1
    return_spec_89_1 return_spec_90_1
noncomputable def weight_source_87_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_87_2 weight_source_89_2
noncomputable def node_w_87_4 : List Nat := node_w_87_2 ++ node_w_89_2
noncomputable def return_w_87_4 : List Nat := return_w_87_2 ++ return_w_89_2
theorem node_spec_87_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_87_4 node_w_87_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_87_2 weight_source_89_2 node_w_87_2 node_w_89_2
    node_spec_87_2 node_spec_89_2
theorem return_spec_87_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_87_4 return_w_87_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_87_2 weight_source_89_2 return_w_87_2 return_w_89_2
    return_spec_87_2 return_spec_89_2
noncomputable def weight_source_91_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2912
noncomputable def node_w_91_1 : List Nat := [
  39, 3, 14, 39, 1, 14, 39, 14, 39, 1, 14, 39,
  1, 14, 39, 14, 39, 1, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 14, 39, 3, 14
]
noncomputable def return_w_91_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_91_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_91_1 node_w_91_1 := by rfl
theorem return_spec_91_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_91_1 return_w_91_1 := by rfl
noncomputable def weight_source_92_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2944
noncomputable def node_w_92_1 : List Nat := [
  39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_92_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_92_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_92_1 node_w_92_1 := by rfl
theorem return_spec_92_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_92_1 return_w_92_1 := by rfl
noncomputable def weight_source_91_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_91_1 weight_source_92_1
noncomputable def node_w_91_2 : List Nat := node_w_91_1 ++ node_w_92_1
noncomputable def return_w_91_2 : List Nat := return_w_91_1 ++ return_w_92_1
theorem node_spec_91_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_91_2 node_w_91_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_91_1 weight_source_92_1 node_w_91_1 node_w_92_1
    node_spec_91_1 node_spec_92_1
theorem return_spec_91_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_91_2 return_w_91_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_91_1 weight_source_92_1 return_w_91_1 return_w_92_1
    return_spec_91_1 return_spec_92_1
noncomputable def weight_source_93_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2976
noncomputable def node_w_93_1 : List Nat := [
  1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 14, 39,
  14, 39, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_93_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_93_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_93_1 node_w_93_1 := by rfl
theorem return_spec_93_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_93_1 return_w_93_1 := by rfl
noncomputable def weight_source_94_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3008
noncomputable def node_w_94_1 : List Nat := [
  3, 14, 39, 3, 14, 39, 1, 14, 39, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 1, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 1, 1, 14, 39
]
noncomputable def return_w_94_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_94_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_94_1 node_w_94_1 := by rfl
theorem return_spec_94_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_94_1 return_w_94_1 := by rfl
noncomputable def weight_source_93_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_93_1 weight_source_94_1
noncomputable def node_w_93_2 : List Nat := node_w_93_1 ++ node_w_94_1
noncomputable def return_w_93_2 : List Nat := return_w_93_1 ++ return_w_94_1
theorem node_spec_93_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_93_2 node_w_93_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_93_1 weight_source_94_1 node_w_93_1 node_w_94_1
    node_spec_93_1 node_spec_94_1
theorem return_spec_93_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_93_2 return_w_93_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_93_1 weight_source_94_1 return_w_93_1 return_w_94_1
    return_spec_93_1 return_spec_94_1
noncomputable def weight_source_91_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_91_2 weight_source_93_2
noncomputable def node_w_91_4 : List Nat := node_w_91_2 ++ node_w_93_2
noncomputable def return_w_91_4 : List Nat := return_w_91_2 ++ return_w_93_2
theorem node_spec_91_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_91_4 node_w_91_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_91_2 weight_source_93_2 node_w_91_2 node_w_93_2
    node_spec_91_2 node_spec_93_2
theorem return_spec_91_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_91_4 return_w_91_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_91_2 weight_source_93_2 return_w_91_2 return_w_93_2
    return_spec_91_2 return_spec_93_2
noncomputable def weight_source_87_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_87_4 weight_source_91_4
noncomputable def node_w_87_8 : List Nat := node_w_87_4 ++ node_w_91_4
noncomputable def return_w_87_8 : List Nat := return_w_87_4 ++ return_w_91_4
theorem node_spec_87_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_87_8 node_w_87_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_87_4 weight_source_91_4 node_w_87_4 node_w_91_4
    node_spec_87_4 node_spec_91_4
theorem return_spec_87_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_87_8 return_w_87_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_87_4 weight_source_91_4 return_w_87_4 return_w_91_4
    return_spec_87_4 return_spec_91_4
noncomputable def weight_source_79_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_79_8 weight_source_87_8
noncomputable def node_w_79_16 : List Nat := node_w_79_8 ++ node_w_87_8
noncomputable def return_w_79_16 : List Nat := return_w_79_8 ++ return_w_87_8
theorem node_spec_79_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_79_16 node_w_79_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_79_8 weight_source_87_8 node_w_79_8 node_w_87_8
    node_spec_79_8 node_spec_87_8
theorem return_spec_79_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_79_16 return_w_79_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_79_8 weight_source_87_8 return_w_79_8 return_w_87_8
    return_spec_79_8 return_spec_87_8
noncomputable def weight_source_63_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 weight_source_63_16 weight_source_79_16
noncomputable def node_w_63_32 : List Nat := node_w_63_16 ++ node_w_79_16
noncomputable def return_w_63_32 : List Nat := return_w_63_16 ++ return_w_79_16
theorem node_spec_63_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_32 node_w_63_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    512 weight_source_63_16 weight_source_79_16 node_w_63_16 node_w_79_16
    node_spec_63_16 node_spec_79_16
theorem return_spec_63_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_32 return_w_63_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    512 weight_source_63_16 weight_source_79_16 return_w_63_16 return_w_79_16
    return_spec_63_16 return_spec_79_16
noncomputable def weight_source_95_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3040
noncomputable def node_w_95_1 : List Nat := [
  3, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14,
  39, 14, 39, 1, 14, 39, 1, 14
]
noncomputable def return_w_95_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_95_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_1 node_w_95_1 := by rfl
theorem return_spec_95_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_1 return_w_95_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t96\t{now}"
      handle.flush
noncomputable def weight_source_96_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3072
noncomputable def node_w_96_1 : List Nat := [
  39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1
]
noncomputable def return_w_96_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_96_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_96_1 node_w_96_1 := by rfl
theorem return_spec_96_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_96_1 return_w_96_1 := by rfl
noncomputable def weight_source_95_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_95_1 weight_source_96_1
noncomputable def node_w_95_2 : List Nat := node_w_95_1 ++ node_w_96_1
noncomputable def return_w_95_2 : List Nat := return_w_95_1 ++ return_w_96_1
theorem node_spec_95_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_2 node_w_95_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_95_1 weight_source_96_1 node_w_95_1 node_w_96_1
    node_spec_95_1 node_spec_96_1
theorem return_spec_95_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_2 return_w_95_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_95_1 weight_source_96_1 return_w_95_1 return_w_96_1
    return_spec_95_1 return_spec_96_1
noncomputable def weight_source_97_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3104
noncomputable def node_w_97_1 : List Nat := [
  14, 39, 14, 39, 1, 14, 39, 1, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14,
  39, 14, 39, 1, 14, 39, 1, 14
]
noncomputable def return_w_97_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_97_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_97_1 node_w_97_1 := by rfl
theorem return_spec_97_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_97_1 return_w_97_1 := by rfl
noncomputable def weight_source_98_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3136
noncomputable def node_w_98_1 : List Nat := [
  39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_98_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_98_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_98_1 node_w_98_1 := by rfl
theorem return_spec_98_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_98_1 return_w_98_1 := by rfl
noncomputable def weight_source_97_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_97_1 weight_source_98_1
noncomputable def node_w_97_2 : List Nat := node_w_97_1 ++ node_w_98_1
noncomputable def return_w_97_2 : List Nat := return_w_97_1 ++ return_w_98_1
theorem node_spec_97_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_97_2 node_w_97_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_97_1 weight_source_98_1 node_w_97_1 node_w_98_1
    node_spec_97_1 node_spec_98_1
theorem return_spec_97_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_97_2 return_w_97_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_97_1 weight_source_98_1 return_w_97_1 return_w_98_1
    return_spec_97_1 return_spec_98_1
noncomputable def weight_source_95_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_95_2 weight_source_97_2
noncomputable def node_w_95_4 : List Nat := node_w_95_2 ++ node_w_97_2
noncomputable def return_w_95_4 : List Nat := return_w_95_2 ++ return_w_97_2
theorem node_spec_95_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_4 node_w_95_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_95_2 weight_source_97_2 node_w_95_2 node_w_97_2
    node_spec_95_2 node_spec_97_2
theorem return_spec_95_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_4 return_w_95_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_95_2 weight_source_97_2 return_w_95_2 return_w_97_2
    return_spec_95_2 return_spec_97_2
noncomputable def weight_source_99_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3168
noncomputable def node_w_99_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1,
  14, 39, 3, 14, 39, 1, 14, 39
]
noncomputable def return_w_99_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_99_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_99_1 node_w_99_1 := by rfl
theorem return_spec_99_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_99_1 return_w_99_1 := by rfl
noncomputable def weight_source_100_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3200
noncomputable def node_w_100_1 : List Nat := [
  1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14,
  39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39,
  1, 14, 39, 3, 14, 39, 1, 14
]
noncomputable def return_w_100_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_100_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_100_1 node_w_100_1 := by rfl
theorem return_spec_100_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_100_1 return_w_100_1 := by rfl
noncomputable def weight_source_99_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_99_1 weight_source_100_1
noncomputable def node_w_99_2 : List Nat := node_w_99_1 ++ node_w_100_1
noncomputable def return_w_99_2 : List Nat := return_w_99_1 ++ return_w_100_1
theorem node_spec_99_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_99_2 node_w_99_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_99_1 weight_source_100_1 node_w_99_1 node_w_100_1
    node_spec_99_1 node_spec_100_1
theorem return_spec_99_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_99_2 return_w_99_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_99_1 weight_source_100_1 return_w_99_1 return_w_100_1
    return_spec_99_1 return_spec_100_1
noncomputable def weight_source_101_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3232
noncomputable def node_w_101_1 : List Nat := [
  39, 1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1,
  14, 39, 1, 14, 39, 3, 14, 39
]
noncomputable def return_w_101_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_101_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_101_1 node_w_101_1 := by rfl
theorem return_spec_101_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_101_1 return_w_101_1 := by rfl
noncomputable def weight_source_102_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3264
noncomputable def node_w_102_1 : List Nat := [
  1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 14,
  39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_102_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_102_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_102_1 node_w_102_1 := by rfl
theorem return_spec_102_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_102_1 return_w_102_1 := by rfl
noncomputable def weight_source_101_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_101_1 weight_source_102_1
noncomputable def node_w_101_2 : List Nat := node_w_101_1 ++ node_w_102_1
noncomputable def return_w_101_2 : List Nat := return_w_101_1 ++ return_w_102_1
theorem node_spec_101_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_101_2 node_w_101_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_101_1 weight_source_102_1 node_w_101_1 node_w_102_1
    node_spec_101_1 node_spec_102_1
theorem return_spec_101_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_101_2 return_w_101_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_101_1 weight_source_102_1 return_w_101_1 return_w_102_1
    return_spec_101_1 return_spec_102_1
noncomputable def weight_source_99_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_99_2 weight_source_101_2
noncomputable def node_w_99_4 : List Nat := node_w_99_2 ++ node_w_101_2
noncomputable def return_w_99_4 : List Nat := return_w_99_2 ++ return_w_101_2
theorem node_spec_99_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_99_4 node_w_99_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_99_2 weight_source_101_2 node_w_99_2 node_w_101_2
    node_spec_99_2 node_spec_101_2
theorem return_spec_99_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_99_4 return_w_99_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_99_2 weight_source_101_2 return_w_99_2 return_w_101_2
    return_spec_99_2 return_spec_101_2
noncomputable def weight_source_95_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_95_4 weight_source_99_4
noncomputable def node_w_95_8 : List Nat := node_w_95_4 ++ node_w_99_4
noncomputable def return_w_95_8 : List Nat := return_w_95_4 ++ return_w_99_4
theorem node_spec_95_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_8 node_w_95_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_95_4 weight_source_99_4 node_w_95_4 node_w_99_4
    node_spec_95_4 node_spec_99_4
theorem return_spec_95_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_8 return_w_95_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_95_4 weight_source_99_4 return_w_95_4 return_w_99_4
    return_spec_95_4 return_spec_99_4
noncomputable def weight_source_103_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3296
noncomputable def node_w_103_1 : List Nat := [
  14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1,
  3, 14, 39, 3, 14, 39, 1, 14, 39, 1, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1
]
noncomputable def return_w_103_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_103_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_103_1 node_w_103_1 := by rfl
theorem return_spec_103_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_103_1 return_w_103_1 := by rfl
noncomputable def weight_source_104_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3328
noncomputable def node_w_104_1 : List Nat := [
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1,
  14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 1, 1, 14
]
noncomputable def return_w_104_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_104_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_104_1 node_w_104_1 := by rfl
theorem return_spec_104_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_104_1 return_w_104_1 := by rfl
noncomputable def weight_source_103_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_103_1 weight_source_104_1
noncomputable def node_w_103_2 : List Nat := node_w_103_1 ++ node_w_104_1
noncomputable def return_w_103_2 : List Nat := return_w_103_1 ++ return_w_104_1
theorem node_spec_103_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_103_2 node_w_103_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_103_1 weight_source_104_1 node_w_103_1 node_w_104_1
    node_spec_103_1 node_spec_104_1
theorem return_spec_103_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_103_2 return_w_103_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_103_1 weight_source_104_1 return_w_103_1 return_w_104_1
    return_spec_103_1 return_spec_104_1
noncomputable def weight_source_105_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3360
noncomputable def node_w_105_1 : List Nat := [
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 14, 39,
  3, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 1, 14, 39, 1
]
noncomputable def return_w_105_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_105_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_105_1 node_w_105_1 := by rfl
theorem return_spec_105_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_105_1 return_w_105_1 := by rfl
noncomputable def weight_source_106_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3392
noncomputable def node_w_106_1 : List Nat := [
  14, 39, 3, 14, 39, 1, 14, 39, 14, 39, 1, 14,
  39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_106_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_106_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_106_1 node_w_106_1 := by rfl
theorem return_spec_106_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_106_1 return_w_106_1 := by rfl
noncomputable def weight_source_105_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_105_1 weight_source_106_1
noncomputable def node_w_105_2 : List Nat := node_w_105_1 ++ node_w_106_1
noncomputable def return_w_105_2 : List Nat := return_w_105_1 ++ return_w_106_1
theorem node_spec_105_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_105_2 node_w_105_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_105_1 weight_source_106_1 node_w_105_1 node_w_106_1
    node_spec_105_1 node_spec_106_1
theorem return_spec_105_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_105_2 return_w_105_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_105_1 weight_source_106_1 return_w_105_1 return_w_106_1
    return_spec_105_1 return_spec_106_1
noncomputable def weight_source_103_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_103_2 weight_source_105_2
noncomputable def node_w_103_4 : List Nat := node_w_103_2 ++ node_w_105_2
noncomputable def return_w_103_4 : List Nat := return_w_103_2 ++ return_w_105_2
theorem node_spec_103_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_103_4 node_w_103_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_103_2 weight_source_105_2 node_w_103_2 node_w_105_2
    node_spec_103_2 node_spec_105_2
theorem return_spec_103_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_103_4 return_w_103_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_103_2 weight_source_105_2 return_w_103_2 return_w_105_2
    return_spec_103_2 return_spec_105_2
noncomputable def weight_source_107_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3424
noncomputable def node_w_107_1 : List Nat := [
  3, 14, 39, 1, 14, 39, 1, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 14, 39, 1, 14, 39,
  1, 14, 39, 14, 39, 1, 14, 39
]
noncomputable def return_w_107_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_107_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_107_1 node_w_107_1 := by rfl
theorem return_spec_107_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_107_1 return_w_107_1 := by rfl
noncomputable def weight_source_108_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3456
noncomputable def node_w_108_1 : List Nat := [
  1, 14, 39, 14, 39, 1, 14, 39, 1, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1,
  14, 39, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_108_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_108_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_108_1 node_w_108_1 := by rfl
theorem return_spec_108_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_108_1 return_w_108_1 := by rfl
noncomputable def weight_source_107_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_107_1 weight_source_108_1
noncomputable def node_w_107_2 : List Nat := node_w_107_1 ++ node_w_108_1
noncomputable def return_w_107_2 : List Nat := return_w_107_1 ++ return_w_108_1
theorem node_spec_107_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_107_2 node_w_107_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_107_1 weight_source_108_1 node_w_107_1 node_w_108_1
    node_spec_107_1 node_spec_108_1
theorem return_spec_107_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_107_2 return_w_107_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_107_1 weight_source_108_1 return_w_107_1 return_w_108_1
    return_spec_107_1 return_spec_108_1
noncomputable def weight_source_109_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3488
noncomputable def node_w_109_1 : List Nat := [
  14, 39, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1
]
noncomputable def return_w_109_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_109_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_109_1 node_w_109_1 := by rfl
theorem return_spec_109_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_109_1 return_w_109_1 := by rfl
noncomputable def weight_source_110_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3520
noncomputable def node_w_110_1 : List Nat := [
  14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 1, 14, 39, 1, 1, 14, 39,
  1, 14, 39, 1, 14, 39, 3, 14
]
noncomputable def return_w_110_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_110_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_110_1 node_w_110_1 := by rfl
theorem return_spec_110_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_110_1 return_w_110_1 := by rfl
noncomputable def weight_source_109_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_109_1 weight_source_110_1
noncomputable def node_w_109_2 : List Nat := node_w_109_1 ++ node_w_110_1
noncomputable def return_w_109_2 : List Nat := return_w_109_1 ++ return_w_110_1
theorem node_spec_109_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_109_2 node_w_109_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_109_1 weight_source_110_1 node_w_109_1 node_w_110_1
    node_spec_109_1 node_spec_110_1
theorem return_spec_109_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_109_2 return_w_109_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_109_1 weight_source_110_1 return_w_109_1 return_w_110_1
    return_spec_109_1 return_spec_110_1
noncomputable def weight_source_107_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_107_2 weight_source_109_2
noncomputable def node_w_107_4 : List Nat := node_w_107_2 ++ node_w_109_2
noncomputable def return_w_107_4 : List Nat := return_w_107_2 ++ return_w_109_2
theorem node_spec_107_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_107_4 node_w_107_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_107_2 weight_source_109_2 node_w_107_2 node_w_109_2
    node_spec_107_2 node_spec_109_2
theorem return_spec_107_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_107_4 return_w_107_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_107_2 weight_source_109_2 return_w_107_2 return_w_109_2
    return_spec_107_2 return_spec_109_2
noncomputable def weight_source_103_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_103_4 weight_source_107_4
noncomputable def node_w_103_8 : List Nat := node_w_103_4 ++ node_w_107_4
noncomputable def return_w_103_8 : List Nat := return_w_103_4 ++ return_w_107_4
theorem node_spec_103_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_103_8 node_w_103_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_103_4 weight_source_107_4 node_w_103_4 node_w_107_4
    node_spec_103_4 node_spec_107_4
theorem return_spec_103_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_103_8 return_w_103_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_103_4 weight_source_107_4 return_w_103_4 return_w_107_4
    return_spec_103_4 return_spec_107_4
noncomputable def weight_source_95_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_95_8 weight_source_103_8
noncomputable def node_w_95_16 : List Nat := node_w_95_8 ++ node_w_103_8
noncomputable def return_w_95_16 : List Nat := return_w_95_8 ++ return_w_103_8
theorem node_spec_95_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_16 node_w_95_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_95_8 weight_source_103_8 node_w_95_8 node_w_103_8
    node_spec_95_8 node_spec_103_8
theorem return_spec_95_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_16 return_w_95_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_95_8 weight_source_103_8 return_w_95_8 return_w_103_8
    return_spec_95_8 return_spec_103_8
noncomputable def weight_source_111_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3552
noncomputable def node_w_111_1 : List Nat := [
  39, 1, 14, 39, 1, 3, 14, 39, 3, 14, 39, 1,
  14, 39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1,
  14, 39, 3, 14, 39, 1, 14, 39
]
noncomputable def return_w_111_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_111_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_111_1 node_w_111_1 := by rfl
theorem return_spec_111_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_111_1 return_w_111_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t112\t{now}"
      handle.flush
noncomputable def weight_source_112_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3584
noncomputable def node_w_112_1 : List Nat := [
  1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1, 3, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1
]
noncomputable def return_w_112_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_112_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_112_1 node_w_112_1 := by rfl
theorem return_spec_112_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_112_1 return_w_112_1 := by rfl
noncomputable def weight_source_111_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_111_1 weight_source_112_1
noncomputable def node_w_111_2 : List Nat := node_w_111_1 ++ node_w_112_1
noncomputable def return_w_111_2 : List Nat := return_w_111_1 ++ return_w_112_1
theorem node_spec_111_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_111_2 node_w_111_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_111_1 weight_source_112_1 node_w_111_1 node_w_112_1
    node_spec_111_1 node_spec_112_1
theorem return_spec_111_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_111_2 return_w_111_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_111_1 weight_source_112_1 return_w_111_1 return_w_112_1
    return_spec_111_1 return_spec_112_1
noncomputable def weight_source_113_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3616
noncomputable def node_w_113_1 : List Nat := [
  14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1,
  14, 39, 1, 1, 14, 39, 1, 14, 39, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 1, 3
]
noncomputable def return_w_113_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_113_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_113_1 node_w_113_1 := by rfl
theorem return_spec_113_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_113_1 return_w_113_1 := by rfl
noncomputable def weight_source_114_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3648
noncomputable def node_w_114_1 : List Nat := [
  14, 39, 3, 14, 39, 1, 14, 39, 14, 39, 1, 14,
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_114_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_114_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_114_1 node_w_114_1 := by rfl
theorem return_spec_114_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_114_1 return_w_114_1 := by rfl
noncomputable def weight_source_113_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_113_1 weight_source_114_1
noncomputable def node_w_113_2 : List Nat := node_w_113_1 ++ node_w_114_1
noncomputable def return_w_113_2 : List Nat := return_w_113_1 ++ return_w_114_1
theorem node_spec_113_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_113_2 node_w_113_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_113_1 weight_source_114_1 node_w_113_1 node_w_114_1
    node_spec_113_1 node_spec_114_1
theorem return_spec_113_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_113_2 return_w_113_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_113_1 weight_source_114_1 return_w_113_1 return_w_114_1
    return_spec_113_1 return_spec_114_1
noncomputable def weight_source_111_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_111_2 weight_source_113_2
noncomputable def node_w_111_4 : List Nat := node_w_111_2 ++ node_w_113_2
noncomputable def return_w_111_4 : List Nat := return_w_111_2 ++ return_w_113_2
theorem node_spec_111_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_111_4 node_w_111_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_111_2 weight_source_113_2 node_w_111_2 node_w_113_2
    node_spec_111_2 node_spec_113_2
theorem return_spec_111_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_111_4 return_w_111_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_111_2 weight_source_113_2 return_w_111_2 return_w_113_2
    return_spec_111_2 return_spec_113_2
noncomputable def weight_source_115_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3680
noncomputable def node_w_115_1 : List Nat := [
  1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 3, 14,
  39, 3, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 1
]
noncomputable def return_w_115_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_115_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_115_1 node_w_115_1 := by rfl
theorem return_spec_115_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_115_1 return_w_115_1 := by rfl
noncomputable def weight_source_116_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3712
noncomputable def node_w_116_1 : List Nat := [
  14, 39, 1, 1, 14, 39, 1, 3, 14, 39, 3, 14,
  39, 1, 14, 39, 14, 39, 1, 1, 14, 39, 1, 14,
  39, 3, 14, 39, 1, 14, 39, 14
]
noncomputable def return_w_116_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_116_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_116_1 node_w_116_1 := by rfl
theorem return_spec_116_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_116_1 return_w_116_1 := by rfl
noncomputable def weight_source_115_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_115_1 weight_source_116_1
noncomputable def node_w_115_2 : List Nat := node_w_115_1 ++ node_w_116_1
noncomputable def return_w_115_2 : List Nat := return_w_115_1 ++ return_w_116_1
theorem node_spec_115_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_115_2 node_w_115_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_115_1 weight_source_116_1 node_w_115_1 node_w_116_1
    node_spec_115_1 node_spec_116_1
theorem return_spec_115_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_115_2 return_w_115_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_115_1 weight_source_116_1 return_w_115_1 return_w_116_1
    return_spec_115_1 return_spec_116_1
noncomputable def weight_source_117_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3744
noncomputable def node_w_117_1 : List Nat := [
  39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1,
  14, 39, 1, 14, 39, 3, 14, 39
]
noncomputable def return_w_117_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_117_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_117_1 node_w_117_1 := by rfl
theorem return_spec_117_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_117_1 return_w_117_1 := by rfl
noncomputable def weight_source_118_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3776
noncomputable def node_w_118_1 : List Nat := [
  1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14, 39,
  1, 14, 39, 1, 14, 39, 3, 14
]
noncomputable def return_w_118_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_118_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_118_1 node_w_118_1 := by rfl
theorem return_spec_118_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_118_1 return_w_118_1 := by rfl
noncomputable def weight_source_117_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_117_1 weight_source_118_1
noncomputable def node_w_117_2 : List Nat := node_w_117_1 ++ node_w_118_1
noncomputable def return_w_117_2 : List Nat := return_w_117_1 ++ return_w_118_1
theorem node_spec_117_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_117_2 node_w_117_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_117_1 weight_source_118_1 node_w_117_1 node_w_118_1
    node_spec_117_1 node_spec_118_1
theorem return_spec_117_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_117_2 return_w_117_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_117_1 weight_source_118_1 return_w_117_1 return_w_118_1
    return_spec_117_1 return_spec_118_1
noncomputable def weight_source_115_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_115_2 weight_source_117_2
noncomputable def node_w_115_4 : List Nat := node_w_115_2 ++ node_w_117_2
noncomputable def return_w_115_4 : List Nat := return_w_115_2 ++ return_w_117_2
theorem node_spec_115_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_115_4 node_w_115_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_115_2 weight_source_117_2 node_w_115_2 node_w_117_2
    node_spec_115_2 node_spec_117_2
theorem return_spec_115_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_115_4 return_w_115_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_115_2 weight_source_117_2 return_w_115_2 return_w_117_2
    return_spec_115_2 return_spec_117_2
noncomputable def weight_source_111_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_111_4 weight_source_115_4
noncomputable def node_w_111_8 : List Nat := node_w_111_4 ++ node_w_115_4
noncomputable def return_w_111_8 : List Nat := return_w_111_4 ++ return_w_115_4
theorem node_spec_111_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_111_8 node_w_111_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_111_4 weight_source_115_4 node_w_111_4 node_w_115_4
    node_spec_111_4 node_spec_115_4
theorem return_spec_111_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_111_8 return_w_111_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_111_4 weight_source_115_4 return_w_111_4 return_w_115_4
    return_spec_111_4 return_spec_115_4
noncomputable def weight_source_119_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3808
noncomputable def node_w_119_1 : List Nat := [
  39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1, 14,
  39, 1, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_119_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_119_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_119_1 node_w_119_1 := by rfl
theorem return_spec_119_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_119_1 return_w_119_1 := by rfl
noncomputable def weight_source_120_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3840
noncomputable def node_w_120_1 : List Nat := [
  3, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14, 39,
  1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 14, 39, 1, 14
]
noncomputable def return_w_120_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_120_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_120_1 node_w_120_1 := by rfl
theorem return_spec_120_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_120_1 return_w_120_1 := by rfl
noncomputable def weight_source_119_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_119_1 weight_source_120_1
noncomputable def node_w_119_2 : List Nat := node_w_119_1 ++ node_w_120_1
noncomputable def return_w_119_2 : List Nat := return_w_119_1 ++ return_w_120_1
theorem node_spec_119_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_119_2 node_w_119_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_119_1 weight_source_120_1 node_w_119_1 node_w_120_1
    node_spec_119_1 node_spec_120_1
theorem return_spec_119_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_119_2 return_w_119_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_119_1 weight_source_120_1 return_w_119_1 return_w_120_1
    return_spec_119_1 return_spec_120_1
noncomputable def weight_source_121_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3872
noncomputable def node_w_121_1 : List Nat := [
  39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 3, 14,
  39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39, 3,
  14, 39, 1, 14, 39, 14, 39, 1
]
noncomputable def return_w_121_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_121_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_121_1 node_w_121_1 := by rfl
theorem return_spec_121_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_121_1 return_w_121_1 := by rfl
noncomputable def weight_source_122_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3904
noncomputable def node_w_122_1 : List Nat := [
  14, 39, 1, 14, 39, 1, 1, 14, 39, 1, 14, 39,
  3, 14, 39, 1, 14, 39, 14, 39, 1, 14, 39, 1,
  14, 39, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_122_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_122_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_122_1 node_w_122_1 := by rfl
theorem return_spec_122_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_122_1 return_w_122_1 := by rfl
noncomputable def weight_source_121_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_121_1 weight_source_122_1
noncomputable def node_w_121_2 : List Nat := node_w_121_1 ++ node_w_122_1
noncomputable def return_w_121_2 : List Nat := return_w_121_1 ++ return_w_122_1
theorem node_spec_121_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_121_2 node_w_121_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_121_1 weight_source_122_1 node_w_121_1 node_w_122_1
    node_spec_121_1 node_spec_122_1
theorem return_spec_121_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_121_2 return_w_121_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_121_1 weight_source_122_1 return_w_121_1 return_w_122_1
    return_spec_121_1 return_spec_122_1
noncomputable def weight_source_119_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_119_2 weight_source_121_2
noncomputable def node_w_119_4 : List Nat := node_w_119_2 ++ node_w_121_2
noncomputable def return_w_119_4 : List Nat := return_w_119_2 ++ return_w_121_2
theorem node_spec_119_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_119_4 node_w_119_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_119_2 weight_source_121_2 node_w_119_2 node_w_121_2
    node_spec_119_2 node_spec_121_2
theorem return_spec_119_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_119_4 return_w_119_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_119_2 weight_source_121_2 return_w_119_2 return_w_121_2
    return_spec_119_2 return_spec_121_2
noncomputable def weight_source_123_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3936
noncomputable def node_w_123_1 : List Nat := [
  1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14,
  39, 1, 14, 39, 1, 14, 39, 1, 14, 39, 1, 1,
  14, 39, 1, 14, 39, 1, 14, 39
]
noncomputable def return_w_123_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_123_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_123_1 node_w_123_1 := by rfl
theorem return_spec_123_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_123_1 return_w_123_1 := by rfl
noncomputable def weight_source_124_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3968
noncomputable def node_w_124_1 : List Nat := [
  3, 14, 39, 1, 14, 39, 1, 3, 14, 39, 3, 14,
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39, 1, 1,
  14, 39, 1, 14, 39, 3, 14, 39
]
noncomputable def return_w_124_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_124_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_124_1 node_w_124_1 := by rfl
theorem return_spec_124_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_124_1 return_w_124_1 := by rfl
noncomputable def weight_source_123_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_123_1 weight_source_124_1
noncomputable def node_w_123_2 : List Nat := node_w_123_1 ++ node_w_124_1
noncomputable def return_w_123_2 : List Nat := return_w_123_1 ++ return_w_124_1
theorem node_spec_123_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_123_2 node_w_123_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_123_1 weight_source_124_1 node_w_123_1 node_w_124_1
    node_spec_123_1 node_spec_124_1
theorem return_spec_123_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_123_2 return_w_123_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_123_1 weight_source_124_1 return_w_123_1 return_w_124_1
    return_spec_123_1 return_spec_124_1
noncomputable def weight_source_125_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4000
noncomputable def node_w_125_1 : List Nat := [
  1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14, 39,
  1, 1, 14, 39, 1, 14, 39, 3, 14, 39, 1, 14,
  39, 14, 39, 1, 14, 39, 1, 14
]
noncomputable def return_w_125_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_125_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_125_1 node_w_125_1 := by rfl
theorem return_spec_125_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_125_1 return_w_125_1 := by rfl
noncomputable def weight_source_126_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4032
noncomputable def node_w_126_1 : List Nat := [
  39, 1, 14, 39, 3, 14, 39, 1, 14, 39
]
noncomputable def return_w_126_1 : List Nat := [
  1, 1, 1, 1, 1, 1, 1, 1, 1, 1
]
theorem node_spec_126_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_126_1 node_w_126_1 := by rfl
theorem return_spec_126_1 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_126_1 return_w_126_1 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/weight-chunks-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"weight-chunk\t127\t{now}"
      handle.flush
noncomputable def weight_source_125_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 weight_source_125_1 weight_source_126_1
noncomputable def node_w_125_2 : List Nat := node_w_125_1 ++ node_w_126_1
noncomputable def return_w_125_2 : List Nat := return_w_125_1 ++ return_w_126_1
theorem node_spec_125_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_125_2 node_w_125_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    32 weight_source_125_1 weight_source_126_1 node_w_125_1 node_w_126_1
    node_spec_125_1 node_spec_126_1
theorem return_spec_125_2 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_125_2 return_w_125_2 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    32 weight_source_125_1 weight_source_126_1 return_w_125_1 return_w_126_1
    return_spec_125_1 return_spec_126_1
noncomputable def weight_source_123_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 weight_source_123_2 weight_source_125_2
noncomputable def node_w_123_4 : List Nat := node_w_123_2 ++ node_w_125_2
noncomputable def return_w_123_4 : List Nat := return_w_123_2 ++ return_w_125_2
theorem node_spec_123_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_123_4 node_w_123_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    64 weight_source_123_2 weight_source_125_2 node_w_123_2 node_w_125_2
    node_spec_123_2 node_spec_125_2
theorem return_spec_123_4 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_123_4 return_w_123_4 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    64 weight_source_123_2 weight_source_125_2 return_w_123_2 return_w_125_2
    return_spec_123_2 return_spec_125_2
noncomputable def weight_source_119_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 weight_source_119_4 weight_source_123_4
noncomputable def node_w_119_8 : List Nat := node_w_119_4 ++ node_w_123_4
noncomputable def return_w_119_8 : List Nat := return_w_119_4 ++ return_w_123_4
theorem node_spec_119_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_119_8 node_w_119_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    128 weight_source_119_4 weight_source_123_4 node_w_119_4 node_w_123_4
    node_spec_119_4 node_spec_123_4
theorem return_spec_119_8 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_119_8 return_w_119_8 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    128 weight_source_119_4 weight_source_123_4 return_w_119_4 return_w_123_4
    return_spec_119_4 return_spec_123_4
noncomputable def weight_source_111_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 weight_source_111_8 weight_source_119_8
noncomputable def node_w_111_16 : List Nat := node_w_111_8 ++ node_w_119_8
noncomputable def return_w_111_16 : List Nat := return_w_111_8 ++ return_w_119_8
theorem node_spec_111_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_111_16 node_w_111_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    256 weight_source_111_8 weight_source_119_8 node_w_111_8 node_w_119_8
    node_spec_111_8 node_spec_119_8
theorem return_spec_111_16 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_111_16 return_w_111_16 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    256 weight_source_111_8 weight_source_119_8 return_w_111_8 return_w_119_8
    return_spec_111_8 return_spec_119_8
noncomputable def weight_source_95_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 weight_source_95_16 weight_source_111_16
noncomputable def node_w_95_32 : List Nat := node_w_95_16 ++ node_w_111_16
noncomputable def return_w_95_32 : List Nat := return_w_95_16 ++ return_w_111_16
theorem node_spec_95_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_95_32 node_w_95_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    512 weight_source_95_16 weight_source_111_16 node_w_95_16 node_w_111_16
    node_spec_95_16 node_spec_111_16
theorem return_spec_95_32 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_95_32 return_w_95_32 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    512 weight_source_95_16 weight_source_111_16 return_w_95_16 return_w_111_16
    return_spec_95_16 return_spec_111_16
noncomputable def weight_source_63_64 : Balanced.RowTree Snapshot.Entry :=
  .branch 1024 weight_source_63_32 weight_source_95_32
noncomputable def node_w_63_64 : List Nat := node_w_63_32 ++ node_w_95_32
noncomputable def return_w_63_64 : List Nat := return_w_63_32 ++ return_w_95_32
theorem node_spec_63_64 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_63_64 node_w_63_64 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    1024 weight_source_63_32 weight_source_95_32 node_w_63_32 node_w_95_32
    node_spec_63_32 node_spec_95_32
theorem return_spec_63_64 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_63_64 return_w_63_64 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    1024 weight_source_63_32 weight_source_95_32 return_w_63_32 return_w_95_32
    return_spec_63_32 return_spec_95_32
noncomputable def weight_source_0_127 : Balanced.RowTree Snapshot.Entry :=
  .branch 2016 weight_source_0_63 weight_source_63_64
noncomputable def node_w_0_127 : List Nat := node_w_0_63 ++ node_w_63_64
noncomputable def return_w_0_127 : List Nat := return_w_0_63 ++ return_w_63_64
theorem node_spec_0_127 : WeightFacts
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    weight_source_0_127 node_w_0_127 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ (lower row.1).size)
    2016 weight_source_0_63 weight_source_63_64 node_w_0_63 node_w_63_64
    node_spec_0_63 node_spec_63_64
theorem return_spec_0_127 : WeightFacts
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    weight_source_0_127 return_w_0_127 :=
  weight_map_branch
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1))
    2016 weight_source_0_63 weight_source_63_64 return_w_0_63 return_w_63_64
    return_spec_0_63 return_spec_63_64
noncomputable def nodeWeights : List Nat := node_w_0_127
noncomputable def returnWeights : List Nat := return_w_0_127
theorem weight_source_eq : weight_source_0_127 = Snapshot.entries := by rfl
theorem node_weights_eq : FieldPackedLayout.weights = nodeWeights := by
  change Snapshot.entries.flatten.map
    (fun row : Snapshot.Entry ↦ (lower row.1).size) =
      node_w_0_127
  exact (congrArg
    (fun tree : Balanced.RowTree Snapshot.Entry ↦
      tree.flatten.map (fun row : Snapshot.Entry ↦ (lower row.1).size))
    weight_source_eq.symm).trans node_spec_0_127
theorem return_weights_eq : FieldSelectiveLayout.weights = returnWeights := by
  change Snapshot.entries.flatten.map
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1)) =
      return_w_0_127
  exact (congrArg
    (fun tree : Balanced.RowTree Snapshot.Entry ↦
      tree.flatten.map (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1)))
    weight_source_eq.symm).trans return_spec_0_127


theorem node_offset_fast (q : Fin 4042) :
    FieldPackedLayout.offset q = (nodeWeights.take q.val).sum := by
  rw [FieldPackedLayout.offset_eq_prefix, FieldPackedLayout.prefixSum, node_weights_eq]

theorem return_offset_fast (q : Fin 4042) :
    FieldSelectiveLayout.offset q = (returnWeights.take q.val).sum := by
  rw [FieldSelectiveLayout.offset_eq_prefix, FieldSelectiveLayout.prefixSum, return_weights_eq]

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete source weights and shared prefix correspondence checked"
