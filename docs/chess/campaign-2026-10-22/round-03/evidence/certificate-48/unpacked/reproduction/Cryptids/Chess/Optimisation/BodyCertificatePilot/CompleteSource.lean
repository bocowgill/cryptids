module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceChunk
public meta import Lean

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler
namespace CompleteSourcePilot

theorem source_tables_branch (cache : Nat)
    (left right : Balanced.RowTree Snapshot.Entry) (a b : List (TableOp 4042))
    (hl : left.flatten.map (fun row ↦ toTableOp row.1) = a)
    (hr : right.flatten.map (fun row ↦ toTableOp row.1) = b) :
    (Balanced.RowTree.branch cache left right).flatten.map
      (fun row ↦ toTableOp row.1) = a ++ b := by
  simpa only [Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ (fun xs ys : List (TableOp 4042) ↦ xs ++ ys) hl hr

theorem restore_source_tables (ops : List (Op 4042)) :
    (ops.map toTableOp).map fromTableOp = ops := by
  induction ops with
  | nil => rfl
  | cons op ops ih => simp only [List.map_cons, from_toTableOp, ih]
noncomputable def source_0_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0000
noncomputable def tables_0_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨289, by decide +kernel⟩,
      ⟨289, by decide +kernel⟩,
      ⟨289, by decide +kernel⟩,
      ⟨289, by decide +kernel⟩,
      ⟨289, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨294, by decide +kernel⟩,
      ⟨294, by decide +kernel⟩,
      ⟨294, by decide +kernel⟩,
      ⟨294, by decide +kernel⟩,
      ⟨294, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨5, by decide +kernel⟩,
      ⟨5, by decide +kernel⟩,
      ⟨5, by decide +kernel⟩,
      ⟨5, by decide +kernel⟩,
      ⟨5, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨2, by decide +kernel⟩
    ⟨3, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨306, by decide +kernel⟩,
      ⟨306, by decide +kernel⟩,
      ⟨306, by decide +kernel⟩,
      ⟨306, by decide +kernel⟩,
      ⟨306, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨320, by decide +kernel⟩,
      ⟨320, by decide +kernel⟩,
      ⟨320, by decide +kernel⟩,
      ⟨320, by decide +kernel⟩,
      ⟨320, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨325, by decide +kernel⟩,
      ⟨325, by decide +kernel⟩,
      ⟨325, by decide +kernel⟩,
      ⟨325, by decide +kernel⟩,
      ⟨325, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨10, by decide +kernel⟩,
      ⟨10, by decide +kernel⟩,
      ⟨10, by decide +kernel⟩,
      ⟨10, by decide +kernel⟩,
      ⟨10, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨7, by decide +kernel⟩
    ⟨8, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨337, by decide +kernel⟩,
      ⟨337, by decide +kernel⟩,
      ⟨337, by decide +kernel⟩,
      ⟨337, by decide +kernel⟩,
      ⟨337, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨345, by decide +kernel⟩,
      ⟨345, by decide +kernel⟩,
      ⟨345, by decide +kernel⟩,
      ⟨345, by decide +kernel⟩,
      ⟨345, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨359, by decide +kernel⟩,
      ⟨359, by decide +kernel⟩,
      ⟨359, by decide +kernel⟩,
      ⟨359, by decide +kernel⟩,
      ⟨359, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨364, by decide +kernel⟩,
      ⟨364, by decide +kernel⟩,
      ⟨364, by decide +kernel⟩,
      ⟨364, by decide +kernel⟩,
      ⟨364, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨16, by decide +kernel⟩,
      ⟨16, by decide +kernel⟩,
      ⟨16, by decide +kernel⟩,
      ⟨16, by decide +kernel⟩,
      ⟨16, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨13, by decide +kernel⟩
    ⟨14, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨376, by decide +kernel⟩,
      ⟨376, by decide +kernel⟩,
      ⟨376, by decide +kernel⟩,
      ⟨376, by decide +kernel⟩,
      ⟨376, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨381, by decide +kernel⟩,
      ⟨381, by decide +kernel⟩,
      ⟨381, by decide +kernel⟩,
      ⟨381, by decide +kernel⟩,
      ⟨381, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨20, by decide +kernel⟩,
      ⟨20, by decide +kernel⟩,
      ⟨20, by decide +kernel⟩,
      ⟨20, by decide +kernel⟩,
      ⟨20, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨17, by decide +kernel⟩
    ⟨18, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨23, by decide +kernel⟩,
      ⟨23, by decide +kernel⟩,
      ⟨23, by decide +kernel⟩,
      ⟨23, by decide +kernel⟩,
      ⟨23, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨386, by decide +kernel⟩,
      ⟨386, by decide +kernel⟩,
      ⟨386, by decide +kernel⟩,
      ⟨386, by decide +kernel⟩,
      ⟨386, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨24, by decide +kernel⟩,
      ⟨24, by decide +kernel⟩,
      ⟨24, by decide +kernel⟩,
      ⟨24, by decide +kernel⟩,
      ⟨24, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨21, by decide +kernel⟩
    ⟨22, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨25, by decide +kernel⟩,
      ⟨25, by decide +kernel⟩,
      ⟨25, by decide +kernel⟩,
      ⟨25, by decide +kernel⟩,
      ⟨25, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨413, by decide +kernel⟩,
      ⟨413, by decide +kernel⟩,
      ⟨413, by decide +kernel⟩,
      ⟨413, by decide +kernel⟩,
      ⟨413, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨43, by decide +kernel⟩,
      ⟨43, by decide +kernel⟩,
      ⟨43, by decide +kernel⟩,
      ⟨43, by decide +kernel⟩,
      ⟨43, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨425, by decide +kernel⟩,
      ⟨425, by decide +kernel⟩,
      ⟨425, by decide +kernel⟩,
      ⟨425, by decide +kernel⟩,
      ⟨425, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨439, by decide +kernel⟩,
      ⟨439, by decide +kernel⟩,
      ⟨439, by decide +kernel⟩,
      ⟨439, by decide +kernel⟩,
      ⟨439, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨444, by decide +kernel⟩,
      ⟨444, by decide +kernel⟩,
      ⟨444, by decide +kernel⟩,
      ⟨444, by decide +kernel⟩,
      ⟨444, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨32, by decide +kernel⟩,
      ⟨32, by decide +kernel⟩,
      ⟨32, by decide +kernel⟩,
      ⟨32, by decide +kernel⟩,
      ⟨32, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨29, by decide +kernel⟩
    ⟨30, by decide +kernel⟩
]
theorem fact_0_1 : source_0_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_1 := by
  decide +kernel
noncomputable def source_1_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0032
noncomputable def tables_1_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨456, by decide +kernel⟩,
      ⟨456, by decide +kernel⟩,
      ⟨456, by decide +kernel⟩,
      ⟨456, by decide +kernel⟩,
      ⟨456, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨470, by decide +kernel⟩,
      ⟨470, by decide +kernel⟩,
      ⟨470, by decide +kernel⟩,
      ⟨470, by decide +kernel⟩,
      ⟨470, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨475, by decide +kernel⟩,
      ⟨475, by decide +kernel⟩,
      ⟨475, by decide +kernel⟩,
      ⟨475, by decide +kernel⟩,
      ⟨475, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨37, by decide +kernel⟩,
      ⟨37, by decide +kernel⟩,
      ⟨37, by decide +kernel⟩,
      ⟨37, by decide +kernel⟩,
      ⟨37, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨34, by decide +kernel⟩
    ⟨35, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨487, by decide +kernel⟩,
      ⟨487, by decide +kernel⟩,
      ⟨487, by decide +kernel⟩,
      ⟨487, by decide +kernel⟩,
      ⟨487, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨501, by decide +kernel⟩,
      ⟨501, by decide +kernel⟩,
      ⟨501, by decide +kernel⟩,
      ⟨501, by decide +kernel⟩,
      ⟨501, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨506, by decide +kernel⟩,
      ⟨506, by decide +kernel⟩,
      ⟨506, by decide +kernel⟩,
      ⟨506, by decide +kernel⟩,
      ⟨506, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨42, by decide +kernel⟩,
      ⟨42, by decide +kernel⟩,
      ⟨42, by decide +kernel⟩,
      ⟨42, by decide +kernel⟩,
      ⟨42, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨39, by decide +kernel⟩
    ⟨40, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨518, by decide +kernel⟩,
      ⟨518, by decide +kernel⟩,
      ⟨518, by decide +kernel⟩,
      ⟨518, by decide +kernel⟩,
      ⟨518, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨532, by decide +kernel⟩,
      ⟨532, by decide +kernel⟩,
      ⟨532, by decide +kernel⟩,
      ⟨532, by decide +kernel⟩,
      ⟨532, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨537, by decide +kernel⟩,
      ⟨537, by decide +kernel⟩,
      ⟨537, by decide +kernel⟩,
      ⟨537, by decide +kernel⟩,
      ⟨537, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨49, by decide +kernel⟩,
      ⟨49, by decide +kernel⟩,
      ⟨49, by decide +kernel⟩,
      ⟨49, by decide +kernel⟩,
      ⟨49, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨44, by decide +kernel⟩
    ⟨45, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨542, by decide +kernel⟩,
      ⟨542, by decide +kernel⟩,
      ⟨542, by decide +kernel⟩,
      ⟨542, by decide +kernel⟩,
      ⟨542, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨50, by decide +kernel⟩,
      ⟨50, by decide +kernel⟩,
      ⟨50, by decide +kernel⟩,
      ⟨50, by decide +kernel⟩,
      ⟨50, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨47, by decide +kernel⟩
    ⟨48, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨560, by decide +kernel⟩,
      ⟨560, by decide +kernel⟩,
      ⟨560, by decide +kernel⟩,
      ⟨560, by decide +kernel⟩,
      ⟨560, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨574, by decide +kernel⟩,
      ⟨574, by decide +kernel⟩,
      ⟨574, by decide +kernel⟩,
      ⟨574, by decide +kernel⟩,
      ⟨574, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨579, by decide +kernel⟩,
      ⟨579, by decide +kernel⟩,
      ⟨579, by decide +kernel⟩,
      ⟨579, by decide +kernel⟩,
      ⟨579, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨57, by decide +kernel⟩,
      ⟨57, by decide +kernel⟩,
      ⟨57, by decide +kernel⟩,
      ⟨57, by decide +kernel⟩,
      ⟨57, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨52, by decide +kernel⟩
    ⟨53, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨584, by decide +kernel⟩,
      ⟨584, by decide +kernel⟩,
      ⟨584, by decide +kernel⟩,
      ⟨584, by decide +kernel⟩,
      ⟨584, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨58, by decide +kernel⟩,
      ⟨58, by decide +kernel⟩,
      ⟨58, by decide +kernel⟩,
      ⟨58, by decide +kernel⟩,
      ⟨58, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨55, by decide +kernel⟩
    ⟨56, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨602, by decide +kernel⟩,
      ⟨602, by decide +kernel⟩,
      ⟨602, by decide +kernel⟩,
      ⟨602, by decide +kernel⟩,
      ⟨602, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨616, by decide +kernel⟩,
      ⟨616, by decide +kernel⟩,
      ⟨616, by decide +kernel⟩,
      ⟨616, by decide +kernel⟩,
      ⟨616, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨621, by decide +kernel⟩,
      ⟨621, by decide +kernel⟩,
      ⟨621, by decide +kernel⟩,
      ⟨621, by decide +kernel⟩,
      ⟨621, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨65, by decide +kernel⟩,
      ⟨65, by decide +kernel⟩,
      ⟨65, by decide +kernel⟩,
      ⟨65, by decide +kernel⟩,
      ⟨65, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨60, by decide +kernel⟩
    ⟨61, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨626, by decide +kernel⟩,
      ⟨626, by decide +kernel⟩,
      ⟨626, by decide +kernel⟩,
      ⟨626, by decide +kernel⟩,
      ⟨626, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_1_1 : source_1_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_1_1 := by
  decide +kernel
noncomputable def source_2_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0064
noncomputable def tables_2_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨66, by decide +kernel⟩,
      ⟨66, by decide +kernel⟩,
      ⟨66, by decide +kernel⟩,
      ⟨66, by decide +kernel⟩,
      ⟨66, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨63, by decide +kernel⟩
    ⟨64, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨644, by decide +kernel⟩,
      ⟨644, by decide +kernel⟩,
      ⟨644, by decide +kernel⟩,
      ⟨644, by decide +kernel⟩,
      ⟨644, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨68, by decide +kernel⟩,
      ⟨68, by decide +kernel⟩,
      ⟨68, by decide +kernel⟩,
      ⟨68, by decide +kernel⟩,
      ⟨68, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨658, by decide +kernel⟩,
      ⟨658, by decide +kernel⟩,
      ⟨658, by decide +kernel⟩,
      ⟨658, by decide +kernel⟩,
      ⟨658, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨72, by decide +kernel⟩,
      ⟨78, by decide +kernel⟩,
      ⟨72, by decide +kernel⟩,
      ⟨72, by decide +kernel⟩,
      ⟨72, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨663, by decide +kernel⟩,
      ⟨663, by decide +kernel⟩,
      ⟨663, by decide +kernel⟩,
      ⟨663, by decide +kernel⟩,
      ⟨663, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨73, by decide +kernel⟩,
      ⟨73, by decide +kernel⟩,
      ⟨73, by decide +kernel⟩,
      ⟨73, by decide +kernel⟩,
      ⟨73, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨70, by decide +kernel⟩
    ⟨71, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨675, by decide +kernel⟩,
      ⟨675, by decide +kernel⟩,
      ⟨675, by decide +kernel⟩,
      ⟨675, by decide +kernel⟩,
      ⟨675, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨680, by decide +kernel⟩,
      ⟨680, by decide +kernel⟩,
      ⟨680, by decide +kernel⟩,
      ⟨680, by decide +kernel⟩,
      ⟨680, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨77, by decide +kernel⟩,
      ⟨77, by decide +kernel⟩,
      ⟨77, by decide +kernel⟩,
      ⟨77, by decide +kernel⟩,
      ⟨77, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨74, by decide +kernel⟩
    ⟨75, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨692, by decide +kernel⟩,
      ⟨692, by decide +kernel⟩,
      ⟨692, by decide +kernel⟩,
      ⟨692, by decide +kernel⟩,
      ⟨692, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨706, by decide +kernel⟩,
      ⟨706, by decide +kernel⟩,
      ⟨706, by decide +kernel⟩,
      ⟨706, by decide +kernel⟩,
      ⟨706, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨711, by decide +kernel⟩,
      ⟨711, by decide +kernel⟩,
      ⟨711, by decide +kernel⟩,
      ⟨711, by decide +kernel⟩,
      ⟨711, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨82, by decide +kernel⟩,
      ⟨82, by decide +kernel⟩,
      ⟨82, by decide +kernel⟩,
      ⟨82, by decide +kernel⟩,
      ⟨82, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨79, by decide +kernel⟩
    ⟨80, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨723, by decide +kernel⟩,
      ⟨723, by decide +kernel⟩,
      ⟨723, by decide +kernel⟩,
      ⟨723, by decide +kernel⟩,
      ⟨723, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨737, by decide +kernel⟩,
      ⟨737, by decide +kernel⟩,
      ⟨737, by decide +kernel⟩,
      ⟨737, by decide +kernel⟩,
      ⟨737, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨742, by decide +kernel⟩,
      ⟨742, by decide +kernel⟩,
      ⟨742, by decide +kernel⟩,
      ⟨742, by decide +kernel⟩,
      ⟨742, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨87, by decide +kernel⟩,
      ⟨87, by decide +kernel⟩,
      ⟨87, by decide +kernel⟩,
      ⟨87, by decide +kernel⟩,
      ⟨87, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨84, by decide +kernel⟩
    ⟨85, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨754, by decide +kernel⟩,
      ⟨754, by decide +kernel⟩,
      ⟨754, by decide +kernel⟩,
      ⟨754, by decide +kernel⟩,
      ⟨754, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨89, by decide +kernel⟩,
      ⟨89, by decide +kernel⟩,
      ⟨89, by decide +kernel⟩,
      ⟨89, by decide +kernel⟩,
      ⟨89, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨781, by decide +kernel⟩,
      ⟨781, by decide +kernel⟩,
      ⟨781, by decide +kernel⟩,
      ⟨781, by decide +kernel⟩,
      ⟨781, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨111, by decide +kernel⟩,
      ⟨111, by decide +kernel⟩,
      ⟨111, by decide +kernel⟩,
      ⟨111, by decide +kernel⟩,
      ⟨111, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨793, by decide +kernel⟩,
      ⟨793, by decide +kernel⟩,
      ⟨793, by decide +kernel⟩,
      ⟨793, by decide +kernel⟩,
      ⟨793, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨820, by decide +kernel⟩,
      ⟨820, by decide +kernel⟩,
      ⟨820, by decide +kernel⟩,
      ⟨820, by decide +kernel⟩,
      ⟨820, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨117, by decide +kernel⟩,
      ⟨117, by decide +kernel⟩,
      ⟨117, by decide +kernel⟩,
      ⟨117, by decide +kernel⟩,
      ⟨117, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨832, by decide +kernel⟩,
      ⟨832, by decide +kernel⟩,
      ⟨832, by decide +kernel⟩,
      ⟨832, by decide +kernel⟩,
      ⟨832, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨859, by decide +kernel⟩,
      ⟨859, by decide +kernel⟩,
      ⟨859, by decide +kernel⟩,
      ⟨859, by decide +kernel⟩,
      ⟨859, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_2_1 : source_2_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_2_1 := by
  decide +kernel
noncomputable def source_1_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_1_1 source_2_1
noncomputable def tables_1_2 : List (TableOp 4042) := tables_1_1 ++ tables_2_1
theorem fact_1_2 : source_1_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_1_2 :=
  source_tables_branch 32 source_1_1 source_2_1
    tables_1_1 tables_2_1 fact_1_1 fact_2_1
noncomputable def source_0_3 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_0_1 source_1_2
noncomputable def tables_0_3 : List (TableOp 4042) := tables_0_1 ++ tables_1_2
theorem fact_0_3 : source_0_3.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_3 :=
  source_tables_branch 32 source_0_1 source_1_2
    tables_0_1 tables_1_2 fact_0_1 fact_1_2
noncomputable def source_3_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0096
noncomputable def tables_3_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨128, by decide +kernel⟩,
      ⟨128, by decide +kernel⟩,
      ⟨128, by decide +kernel⟩,
      ⟨128, by decide +kernel⟩,
      ⟨128, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨871, by decide +kernel⟩,
      ⟨871, by decide +kernel⟩,
      ⟨871, by decide +kernel⟩,
      ⟨871, by decide +kernel⟩,
      ⟨871, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨898, by decide +kernel⟩,
      ⟨898, by decide +kernel⟩,
      ⟨898, by decide +kernel⟩,
      ⟨898, by decide +kernel⟩,
      ⟨898, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨131, by decide +kernel⟩,
      ⟨131, by decide +kernel⟩,
      ⟨131, by decide +kernel⟩,
      ⟨131, by decide +kernel⟩,
      ⟨131, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨910, by decide +kernel⟩,
      ⟨910, by decide +kernel⟩,
      ⟨910, by decide +kernel⟩,
      ⟨910, by decide +kernel⟩,
      ⟨910, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨937, by decide +kernel⟩,
      ⟨937, by decide +kernel⟩,
      ⟨937, by decide +kernel⟩,
      ⟨937, by decide +kernel⟩,
      ⟨937, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨152, by decide +kernel⟩,
      ⟨152, by decide +kernel⟩,
      ⟨152, by decide +kernel⟩,
      ⟨152, by decide +kernel⟩,
      ⟨152, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨949, by decide +kernel⟩,
      ⟨949, by decide +kernel⟩,
      ⟨949, by decide +kernel⟩,
      ⟨949, by decide +kernel⟩,
      ⟨949, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨976, by decide +kernel⟩,
      ⟨976, by decide +kernel⟩,
      ⟨976, by decide +kernel⟩,
      ⟨976, by decide +kernel⟩,
      ⟨976, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨175, by decide +kernel⟩,
      ⟨175, by decide +kernel⟩,
      ⟨175, by decide +kernel⟩,
      ⟨175, by decide +kernel⟩,
      ⟨175, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨988, by decide +kernel⟩,
      ⟨988, by decide +kernel⟩,
      ⟨988, by decide +kernel⟩,
      ⟨988, by decide +kernel⟩,
      ⟨988, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1015, by decide +kernel⟩,
      ⟨1015, by decide +kernel⟩,
      ⟨1015, by decide +kernel⟩,
      ⟨1015, by decide +kernel⟩,
      ⟨1015, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨185, by decide +kernel⟩,
      ⟨185, by decide +kernel⟩,
      ⟨185, by decide +kernel⟩,
      ⟨185, by decide +kernel⟩,
      ⟨185, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1027, by decide +kernel⟩,
      ⟨1027, by decide +kernel⟩,
      ⟨1027, by decide +kernel⟩,
      ⟨1027, by decide +kernel⟩,
      ⟨1027, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨110, by decide +kernel⟩,
      ⟨110, by decide +kernel⟩,
      ⟨110, by decide +kernel⟩,
      ⟨110, by decide +kernel⟩,
      ⟨110, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1035, by decide +kernel⟩,
      ⟨1035, by decide +kernel⟩,
      ⟨1035, by decide +kernel⟩,
      ⟨1035, by decide +kernel⟩,
      ⟨1035, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1043, by decide +kernel⟩,
      ⟨1043, by decide +kernel⟩,
      ⟨1043, by decide +kernel⟩,
      ⟨1043, by decide +kernel⟩,
      ⟨1043, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1048, by decide +kernel⟩,
      ⟨1048, by decide +kernel⟩,
      ⟨1048, by decide +kernel⟩,
      ⟨1048, by decide +kernel⟩,
      ⟨1048, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨116, by decide +kernel⟩,
      ⟨116, by decide +kernel⟩,
      ⟨116, by decide +kernel⟩,
      ⟨116, by decide +kernel⟩,
      ⟨116, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨113, by decide +kernel⟩
    ⟨114, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨210, by decide +kernel⟩,
      ⟨210, by decide +kernel⟩,
      ⟨210, by decide +kernel⟩,
      ⟨210, by decide +kernel⟩,
      ⟨210, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1056, by decide +kernel⟩,
      ⟨1056, by decide +kernel⟩,
      ⟨1056, by decide +kernel⟩,
      ⟨1056, by decide +kernel⟩,
      ⟨1056, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1064, by decide +kernel⟩,
      ⟨1064, by decide +kernel⟩,
      ⟨1064, by decide +kernel⟩,
      ⟨1064, by decide +kernel⟩,
      ⟨1064, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1078, by decide +kernel⟩,
      ⟨1078, by decide +kernel⟩,
      ⟨1078, by decide +kernel⟩,
      ⟨1078, by decide +kernel⟩,
      ⟨1078, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1083, by decide +kernel⟩,
      ⟨1083, by decide +kernel⟩,
      ⟨1083, by decide +kernel⟩,
      ⟨1083, by decide +kernel⟩,
      ⟨1083, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨123, by decide +kernel⟩,
      ⟨123, by decide +kernel⟩,
      ⟨123, by decide +kernel⟩,
      ⟨123, by decide +kernel⟩,
      ⟨123, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨120, by decide +kernel⟩
    ⟨121, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨124, by decide +kernel⟩,
      ⟨125, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1091, by decide +kernel⟩,
      ⟨1091, by decide +kernel⟩,
      ⟨1091, by decide +kernel⟩,
      ⟨1091, by decide +kernel⟩,
      ⟨1091, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1105, by decide +kernel⟩,
      ⟨1105, by decide +kernel⟩,
      ⟨1105, by decide +kernel⟩,
      ⟨1105, by decide +kernel⟩,
      ⟨1105, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1131, by decide +kernel⟩,
      ⟨1131, by decide +kernel⟩,
      ⟨1131, by decide +kernel⟩,
      ⟨1131, by decide +kernel⟩,
      ⟨1131, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1143, by decide +kernel⟩,
      ⟨1143, by decide +kernel⟩,
      ⟨1143, by decide +kernel⟩,
      ⟨1143, by decide +kernel⟩,
      ⟨1143, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_3_1 : source_3_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_3_1 := by
  decide +kernel
noncomputable def source_4_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0128
noncomputable def tables_4_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1151, by decide +kernel⟩,
      ⟨1151, by decide +kernel⟩,
      ⟨1151, by decide +kernel⟩,
      ⟨1151, by decide +kernel⟩,
      ⟨1151, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1159, by decide +kernel⟩,
      ⟨1159, by decide +kernel⟩,
      ⟨1159, by decide +kernel⟩,
      ⟨1159, by decide +kernel⟩,
      ⟨1159, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1167, by decide +kernel⟩,
      ⟨1167, by decide +kernel⟩,
      ⟨1167, by decide +kernel⟩,
      ⟨1167, by decide +kernel⟩,
      ⟨1167, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1181, by decide +kernel⟩,
      ⟨1181, by decide +kernel⟩,
      ⟨1181, by decide +kernel⟩,
      ⟨1181, by decide +kernel⟩,
      ⟨1181, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1186, by decide +kernel⟩,
      ⟨1186, by decide +kernel⟩,
      ⟨1186, by decide +kernel⟩,
      ⟨1186, by decide +kernel⟩,
      ⟨1186, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨135, by decide +kernel⟩,
      ⟨135, by decide +kernel⟩,
      ⟨135, by decide +kernel⟩,
      ⟨135, by decide +kernel⟩,
      ⟨135, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨132, by decide +kernel⟩
    ⟨133, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1198, by decide +kernel⟩,
      ⟨1198, by decide +kernel⟩,
      ⟨1198, by decide +kernel⟩,
      ⟨1198, by decide +kernel⟩,
      ⟨1198, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1203, by decide +kernel⟩,
      ⟨1203, by decide +kernel⟩,
      ⟨1203, by decide +kernel⟩,
      ⟨1203, by decide +kernel⟩,
      ⟨1203, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨139, by decide +kernel⟩,
      ⟨139, by decide +kernel⟩,
      ⟨139, by decide +kernel⟩,
      ⟨139, by decide +kernel⟩,
      ⟨139, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨136, by decide +kernel⟩
    ⟨137, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1215, by decide +kernel⟩,
      ⟨1215, by decide +kernel⟩,
      ⟨1215, by decide +kernel⟩,
      ⟨1215, by decide +kernel⟩,
      ⟨1215, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1235, by decide +kernel⟩,
      ⟨1235, by decide +kernel⟩,
      ⟨1235, by decide +kernel⟩,
      ⟨1235, by decide +kernel⟩,
      ⟨1235, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1240, by decide +kernel⟩,
      ⟨1240, by decide +kernel⟩,
      ⟨1240, by decide +kernel⟩,
      ⟨1240, by decide +kernel⟩,
      ⟨1240, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨146, by decide +kernel⟩,
      ⟨146, by decide +kernel⟩,
      ⟨146, by decide +kernel⟩,
      ⟨146, by decide +kernel⟩,
      ⟨146, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨141, by decide +kernel⟩
    ⟨142, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1245, by decide +kernel⟩,
      ⟨1245, by decide +kernel⟩,
      ⟨1245, by decide +kernel⟩,
      ⟨1245, by decide +kernel⟩,
      ⟨1245, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨147, by decide +kernel⟩,
      ⟨147, by decide +kernel⟩,
      ⟨147, by decide +kernel⟩,
      ⟨147, by decide +kernel⟩,
      ⟨147, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨144, by decide +kernel⟩
    ⟨145, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1257, by decide +kernel⟩,
      ⟨1257, by decide +kernel⟩,
      ⟨1257, by decide +kernel⟩,
      ⟨1257, by decide +kernel⟩,
      ⟨1257, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1262, by decide +kernel⟩,
      ⟨1262, by decide +kernel⟩,
      ⟨1262, by decide +kernel⟩,
      ⟨1262, by decide +kernel⟩,
      ⟨1262, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨151, by decide +kernel⟩,
      ⟨151, by decide +kernel⟩,
      ⟨151, by decide +kernel⟩,
      ⟨151, by decide +kernel⟩,
      ⟨151, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨148, by decide +kernel⟩
    ⟨149, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1274, by decide +kernel⟩,
      ⟨1274, by decide +kernel⟩,
      ⟨1274, by decide +kernel⟩,
      ⟨1274, by decide +kernel⟩,
      ⟨1274, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1288, by decide +kernel⟩,
      ⟨1288, by decide +kernel⟩,
      ⟨1288, by decide +kernel⟩,
      ⟨1288, by decide +kernel⟩,
      ⟨1288, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1293, by decide +kernel⟩,
      ⟨1293, by decide +kernel⟩,
      ⟨1293, by decide +kernel⟩,
      ⟨1293, by decide +kernel⟩,
      ⟨1293, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨156, by decide +kernel⟩,
      ⟨156, by decide +kernel⟩,
      ⟨156, by decide +kernel⟩,
      ⟨156, by decide +kernel⟩,
      ⟨156, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨153, by decide +kernel⟩
    ⟨154, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1305, by decide +kernel⟩,
      ⟨1305, by decide +kernel⟩,
      ⟨1305, by decide +kernel⟩,
      ⟨1305, by decide +kernel⟩,
      ⟨1305, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1319, by decide +kernel⟩,
      ⟨1319, by decide +kernel⟩,
      ⟨1319, by decide +kernel⟩,
      ⟨1319, by decide +kernel⟩,
      ⟨1319, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1324, by decide +kernel⟩,
      ⟨1324, by decide +kernel⟩,
      ⟨1324, by decide +kernel⟩,
      ⟨1324, by decide +kernel⟩,
      ⟨1324, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨161, by decide +kernel⟩,
      ⟨161, by decide +kernel⟩,
      ⟨161, by decide +kernel⟩,
      ⟨161, by decide +kernel⟩,
      ⟨161, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_4_1 : source_4_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_4_1 := by
  decide +kernel
noncomputable def source_3_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_3_1 source_4_1
noncomputable def tables_3_2 : List (TableOp 4042) := tables_3_1 ++ tables_4_1
theorem fact_3_2 : source_3_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_3_2 :=
  source_tables_branch 32 source_3_1 source_4_1
    tables_3_1 tables_4_1 fact_3_1 fact_4_1
noncomputable def source_5_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0160
noncomputable def tables_5_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨158, by decide +kernel⟩
    ⟨159, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1336, by decide +kernel⟩,
      ⟨1336, by decide +kernel⟩,
      ⟨1336, by decide +kernel⟩,
      ⟨1336, by decide +kernel⟩,
      ⟨1336, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1350, by decide +kernel⟩,
      ⟨1350, by decide +kernel⟩,
      ⟨1350, by decide +kernel⟩,
      ⟨1350, by decide +kernel⟩,
      ⟨1350, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1355, by decide +kernel⟩,
      ⟨1355, by decide +kernel⟩,
      ⟨1355, by decide +kernel⟩,
      ⟨1355, by decide +kernel⟩,
      ⟨1355, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨166, by decide +kernel⟩,
      ⟨166, by decide +kernel⟩,
      ⟨166, by decide +kernel⟩,
      ⟨166, by decide +kernel⟩,
      ⟨166, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨163, by decide +kernel⟩
    ⟨164, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1367, by decide +kernel⟩,
      ⟨1367, by decide +kernel⟩,
      ⟨1367, by decide +kernel⟩,
      ⟨1367, by decide +kernel⟩,
      ⟨1367, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1372, by decide +kernel⟩,
      ⟨1372, by decide +kernel⟩,
      ⟨1372, by decide +kernel⟩,
      ⟨1372, by decide +kernel⟩,
      ⟨1372, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨172, by decide +kernel⟩,
      ⟨172, by decide +kernel⟩,
      ⟨172, by decide +kernel⟩,
      ⟨172, by decide +kernel⟩,
      ⟨172, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨167, by decide +kernel⟩
    ⟨168, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1377, by decide +kernel⟩,
      ⟨1377, by decide +kernel⟩,
      ⟨1377, by decide +kernel⟩,
      ⟨1377, by decide +kernel⟩,
      ⟨1377, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨174, by decide +kernel⟩,
      ⟨174, by decide +kernel⟩,
      ⟨174, by decide +kernel⟩,
      ⟨174, by decide +kernel⟩,
      ⟨174, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨170, by decide +kernel⟩
    ⟨171, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1380, by decide +kernel⟩,
      ⟨1380, by decide +kernel⟩,
      ⟨1380, by decide +kernel⟩,
      ⟨1380, by decide +kernel⟩,
      ⟨1380, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨173, by decide +kernel⟩
    ⟨18, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1407, by decide +kernel⟩,
      ⟨1407, by decide +kernel⟩,
      ⟨1407, by decide +kernel⟩,
      ⟨1407, by decide +kernel⟩,
      ⟨1407, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1421, by decide +kernel⟩,
      ⟨1421, by decide +kernel⟩,
      ⟨1421, by decide +kernel⟩,
      ⟨1421, by decide +kernel⟩,
      ⟨1421, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1426, by decide +kernel⟩,
      ⟨1426, by decide +kernel⟩,
      ⟨1426, by decide +kernel⟩,
      ⟨1426, by decide +kernel⟩,
      ⟨1426, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨180, by decide +kernel⟩,
      ⟨180, by decide +kernel⟩,
      ⟨180, by decide +kernel⟩,
      ⟨180, by decide +kernel⟩,
      ⟨180, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨177, by decide +kernel⟩
    ⟨178, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1438, by decide +kernel⟩,
      ⟨1438, by decide +kernel⟩,
      ⟨1438, by decide +kernel⟩,
      ⟨1438, by decide +kernel⟩,
      ⟨1438, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1446, by decide +kernel⟩,
      ⟨1446, by decide +kernel⟩,
      ⟨1446, by decide +kernel⟩,
      ⟨1446, by decide +kernel⟩,
      ⟨1446, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1458, by decide +kernel⟩,
      ⟨1458, by decide +kernel⟩,
      ⟨1458, by decide +kernel⟩,
      ⟨1458, by decide +kernel⟩,
      ⟨1458, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1466, by decide +kernel⟩,
      ⟨1466, by decide +kernel⟩,
      ⟨1466, by decide +kernel⟩,
      ⟨1466, by decide +kernel⟩,
      ⟨1466, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1480, by decide +kernel⟩,
      ⟨1480, by decide +kernel⟩,
      ⟨1480, by decide +kernel⟩,
      ⟨1480, by decide +kernel⟩,
      ⟨1480, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1494, by decide +kernel⟩,
      ⟨1494, by decide +kernel⟩,
      ⟨1494, by decide +kernel⟩,
      ⟨1494, by decide +kernel⟩,
      ⟨1494, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1499, by decide +kernel⟩,
      ⟨1499, by decide +kernel⟩,
      ⟨1499, by decide +kernel⟩,
      ⟨1499, by decide +kernel⟩,
      ⟨1499, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨189, by decide +kernel⟩,
      ⟨189, by decide +kernel⟩,
      ⟨189, by decide +kernel⟩,
      ⟨189, by decide +kernel⟩,
      ⟨189, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨186, by decide +kernel⟩
    ⟨187, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1511, by decide +kernel⟩,
      ⟨1511, by decide +kernel⟩,
      ⟨1511, by decide +kernel⟩,
      ⟨1511, by decide +kernel⟩,
      ⟨1511, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1519, by decide +kernel⟩,
      ⟨1519, by decide +kernel⟩,
      ⟨1519, by decide +kernel⟩,
      ⟨1519, by decide +kernel⟩,
      ⟨1519, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1533, by decide +kernel⟩,
      ⟨1533, by decide +kernel⟩,
      ⟨1533, by decide +kernel⟩,
      ⟨1533, by decide +kernel⟩,
      ⟨1533, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_5_1 : source_5_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_5_1 := by
  decide +kernel
noncomputable def source_6_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0192
noncomputable def tables_6_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1538, by decide +kernel⟩,
      ⟨1538, by decide +kernel⟩,
      ⟨1538, by decide +kernel⟩,
      ⟨1538, by decide +kernel⟩,
      ⟨1538, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨197, by decide +kernel⟩,
      ⟨197, by decide +kernel⟩,
      ⟨197, by decide +kernel⟩,
      ⟨197, by decide +kernel⟩,
      ⟨197, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨192, by decide +kernel⟩
    ⟨193, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1543, by decide +kernel⟩,
      ⟨1543, by decide +kernel⟩,
      ⟨1543, by decide +kernel⟩,
      ⟨1543, by decide +kernel⟩,
      ⟨1543, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨198, by decide +kernel⟩,
      ⟨198, by decide +kernel⟩,
      ⟨198, by decide +kernel⟩,
      ⟨198, by decide +kernel⟩,
      ⟨198, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨195, by decide +kernel⟩
    ⟨196, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1561, by decide +kernel⟩,
      ⟨1561, by decide +kernel⟩,
      ⟨1561, by decide +kernel⟩,
      ⟨1561, by decide +kernel⟩,
      ⟨1561, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1566, by decide +kernel⟩,
      ⟨1566, by decide +kernel⟩,
      ⟨1566, by decide +kernel⟩,
      ⟨1566, by decide +kernel⟩,
      ⟨1566, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨204, by decide +kernel⟩,
      ⟨204, by decide +kernel⟩,
      ⟨204, by decide +kernel⟩,
      ⟨204, by decide +kernel⟩,
      ⟨204, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨199, by decide +kernel⟩
    ⟨200, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1571, by decide +kernel⟩,
      ⟨1571, by decide +kernel⟩,
      ⟨1571, by decide +kernel⟩,
      ⟨1571, by decide +kernel⟩,
      ⟨1571, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨207, by decide +kernel⟩,
      ⟨207, by decide +kernel⟩,
      ⟨207, by decide +kernel⟩,
      ⟨207, by decide +kernel⟩,
      ⟨207, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨202, by decide +kernel⟩
    ⟨203, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1576, by decide +kernel⟩,
      ⟨1576, by decide +kernel⟩,
      ⟨1576, by decide +kernel⟩,
      ⟨1576, by decide +kernel⟩,
      ⟨1576, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨209, by decide +kernel⟩,
      ⟨209, by decide +kernel⟩,
      ⟨209, by decide +kernel⟩,
      ⟨209, by decide +kernel⟩,
      ⟨209, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨205, by decide +kernel⟩
    ⟨206, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1579, by decide +kernel⟩,
      ⟨1579, by decide +kernel⟩,
      ⟨1579, by decide +kernel⟩,
      ⟨1579, by decide +kernel⟩,
      ⟨1579, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨208, by decide +kernel⟩
    ⟨18, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1593, by decide +kernel⟩,
      ⟨1593, by decide +kernel⟩,
      ⟨1593, by decide +kernel⟩,
      ⟨1593, by decide +kernel⟩,
      ⟨1593, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1598, by decide +kernel⟩,
      ⟨1598, by decide +kernel⟩,
      ⟨1598, by decide +kernel⟩,
      ⟨1598, by decide +kernel⟩,
      ⟨1598, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨214, by decide +kernel⟩,
      ⟨214, by decide +kernel⟩,
      ⟨214, by decide +kernel⟩,
      ⟨214, by decide +kernel⟩,
      ⟨214, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨211, by decide +kernel⟩
    ⟨212, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1610, by decide +kernel⟩,
      ⟨1610, by decide +kernel⟩,
      ⟨1610, by decide +kernel⟩,
      ⟨1610, by decide +kernel⟩,
      ⟨1610, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1637, by decide +kernel⟩,
      ⟨1637, by decide +kernel⟩,
      ⟨1637, by decide +kernel⟩,
      ⟨1637, by decide +kernel⟩,
      ⟨1637, by decide +kernel⟩
    ], rfl⟩,
  TableOp.halt,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨216, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1649, by decide +kernel⟩,
      ⟨1649, by decide +kernel⟩,
      ⟨1649, by decide +kernel⟩,
      ⟨1649, by decide +kernel⟩,
      ⟨1649, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1676, by decide +kernel⟩,
      ⟨1676, by decide +kernel⟩,
      ⟨1676, by decide +kernel⟩,
      ⟨1676, by decide +kernel⟩,
      ⟨1676, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨230, by decide +kernel⟩,
      ⟨230, by decide +kernel⟩,
      ⟨230, by decide +kernel⟩,
      ⟨230, by decide +kernel⟩,
      ⟨230, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1688, by decide +kernel⟩,
      ⟨1688, by decide +kernel⟩,
      ⟨1688, by decide +kernel⟩,
      ⟨1688, by decide +kernel⟩,
      ⟨1688, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1715, by decide +kernel⟩,
      ⟨1715, by decide +kernel⟩,
      ⟨1715, by decide +kernel⟩,
      ⟨1715, by decide +kernel⟩,
      ⟨1715, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨263, by decide +kernel⟩,
      ⟨263, by decide +kernel⟩,
      ⟨263, by decide +kernel⟩,
      ⟨263, by decide +kernel⟩,
      ⟨263, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_6_1 : source_6_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_6_1 := by
  decide +kernel
noncomputable def source_5_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_5_1 source_6_1
noncomputable def tables_5_2 : List (TableOp 4042) := tables_5_1 ++ tables_6_1
theorem fact_5_2 : source_5_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_5_2 :=
  source_tables_branch 32 source_5_1 source_6_1
    tables_5_1 tables_6_1 fact_5_1 fact_6_1
noncomputable def source_3_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_3_2 source_5_2
noncomputable def tables_3_4 : List (TableOp 4042) := tables_3_2 ++ tables_5_2
theorem fact_3_4 : source_3_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_3_4 :=
  source_tables_branch 64 source_3_2 source_5_2
    tables_3_2 tables_5_2 fact_3_2 fact_5_2
noncomputable def source_0_7 : Balanced.RowTree Snapshot.Entry :=
  .branch 96 source_0_3 source_3_4
noncomputable def tables_0_7 : List (TableOp 4042) := tables_0_3 ++ tables_3_4
theorem fact_0_7 : source_0_7.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_7 :=
  source_tables_branch 96 source_0_3 source_3_4
    tables_0_3 tables_3_4 fact_0_3 fact_3_4
noncomputable def source_7_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0224
noncomputable def tables_7_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1727, by decide +kernel⟩,
      ⟨1727, by decide +kernel⟩,
      ⟨1727, by decide +kernel⟩,
      ⟨1727, by decide +kernel⟩,
      ⟨1727, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1754, by decide +kernel⟩,
      ⟨1754, by decide +kernel⟩,
      ⟨1754, by decide +kernel⟩,
      ⟨1754, by decide +kernel⟩,
      ⟨1754, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨184, by decide +kernel⟩,
      ⟨184, by decide +kernel⟩,
      ⟨184, by decide +kernel⟩,
      ⟨184, by decide +kernel⟩,
      ⟨184, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1766, by decide +kernel⟩,
      ⟨1766, by decide +kernel⟩,
      ⟨1766, by decide +kernel⟩,
      ⟨1766, by decide +kernel⟩,
      ⟨1766, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1780, by decide +kernel⟩,
      ⟨1780, by decide +kernel⟩,
      ⟨1780, by decide +kernel⟩,
      ⟨1780, by decide +kernel⟩,
      ⟨1780, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨267, by decide +kernel⟩,
      ⟨267, by decide +kernel⟩,
      ⟨267, by decide +kernel⟩,
      ⟨267, by decide +kernel⟩,
      ⟨267, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1794, by decide +kernel⟩,
      ⟨1794, by decide +kernel⟩,
      ⟨1794, by decide +kernel⟩,
      ⟨1794, by decide +kernel⟩,
      ⟨1794, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1799, by decide +kernel⟩,
      ⟨1799, by decide +kernel⟩,
      ⟨1799, by decide +kernel⟩,
      ⟨1799, by decide +kernel⟩,
      ⟨1799, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨234, by decide +kernel⟩,
      ⟨234, by decide +kernel⟩,
      ⟨234, by decide +kernel⟩,
      ⟨234, by decide +kernel⟩,
      ⟨234, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨231, by decide +kernel⟩
    ⟨232, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨235, by decide +kernel⟩,
      ⟨236, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1807, by decide +kernel⟩,
      ⟨1807, by decide +kernel⟩,
      ⟨1807, by decide +kernel⟩,
      ⟨1807, by decide +kernel⟩,
      ⟨1807, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1821, by decide +kernel⟩,
      ⟨1821, by decide +kernel⟩,
      ⟨1821, by decide +kernel⟩,
      ⟨1821, by decide +kernel⟩,
      ⟨1821, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1835, by decide +kernel⟩,
      ⟨1835, by decide +kernel⟩,
      ⟨1835, by decide +kernel⟩,
      ⟨1835, by decide +kernel⟩,
      ⟨1835, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1840, by decide +kernel⟩,
      ⟨1840, by decide +kernel⟩,
      ⟨1840, by decide +kernel⟩,
      ⟨1840, by decide +kernel⟩,
      ⟨1840, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨241, by decide +kernel⟩,
      ⟨241, by decide +kernel⟩,
      ⟨241, by decide +kernel⟩,
      ⟨241, by decide +kernel⟩,
      ⟨241, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨238, by decide +kernel⟩
    ⟨239, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1852, by decide +kernel⟩,
      ⟨1852, by decide +kernel⟩,
      ⟨1852, by decide +kernel⟩,
      ⟨1852, by decide +kernel⟩,
      ⟨1852, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1866, by decide +kernel⟩,
      ⟨1866, by decide +kernel⟩,
      ⟨1866, by decide +kernel⟩,
      ⟨1866, by decide +kernel⟩,
      ⟨1866, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1871, by decide +kernel⟩,
      ⟨1871, by decide +kernel⟩,
      ⟨1871, by decide +kernel⟩,
      ⟨1871, by decide +kernel⟩,
      ⟨1871, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨246, by decide +kernel⟩,
      ⟨246, by decide +kernel⟩,
      ⟨246, by decide +kernel⟩,
      ⟨246, by decide +kernel⟩,
      ⟨246, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨243, by decide +kernel⟩
    ⟨244, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1883, by decide +kernel⟩,
      ⟨1883, by decide +kernel⟩,
      ⟨1883, by decide +kernel⟩,
      ⟨1883, by decide +kernel⟩,
      ⟨1883, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1891, by decide +kernel⟩,
      ⟨1891, by decide +kernel⟩,
      ⟨1891, by decide +kernel⟩,
      ⟨1891, by decide +kernel⟩,
      ⟨1891, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1905, by decide +kernel⟩,
      ⟨1905, by decide +kernel⟩,
      ⟨1905, by decide +kernel⟩,
      ⟨1905, by decide +kernel⟩,
      ⟨1905, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1910, by decide +kernel⟩,
      ⟨1910, by decide +kernel⟩,
      ⟨1910, by decide +kernel⟩,
      ⟨1910, by decide +kernel⟩,
      ⟨1910, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨252, by decide +kernel⟩,
      ⟨252, by decide +kernel⟩,
      ⟨252, by decide +kernel⟩,
      ⟨252, by decide +kernel⟩,
      ⟨252, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨249, by decide +kernel⟩
    ⟨250, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1922, by decide +kernel⟩,
      ⟨1922, by decide +kernel⟩,
      ⟨1922, by decide +kernel⟩,
      ⟨1922, by decide +kernel⟩,
      ⟨1922, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1936, by decide +kernel⟩,
      ⟨1936, by decide +kernel⟩,
      ⟨1936, by decide +kernel⟩,
      ⟨1936, by decide +kernel⟩,
      ⟨1936, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1941, by decide +kernel⟩,
      ⟨1941, by decide +kernel⟩,
      ⟨1941, by decide +kernel⟩,
      ⟨1941, by decide +kernel⟩,
      ⟨1941, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨257, by decide +kernel⟩,
      ⟨257, by decide +kernel⟩,
      ⟨257, by decide +kernel⟩,
      ⟨257, by decide +kernel⟩,
      ⟨257, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_7_1 : source_7_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_7_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t8\t{now}"
      handle.flush
noncomputable def source_8_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0256
noncomputable def tables_8_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨254, by decide +kernel⟩
    ⟨255, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1953, by decide +kernel⟩,
      ⟨1953, by decide +kernel⟩,
      ⟨1953, by decide +kernel⟩,
      ⟨1953, by decide +kernel⟩,
      ⟨1953, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1958, by decide +kernel⟩,
      ⟨1958, by decide +kernel⟩,
      ⟨1958, by decide +kernel⟩,
      ⟨1958, by decide +kernel⟩,
      ⟨1958, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨262, by decide +kernel⟩,
      ⟨262, by decide +kernel⟩,
      ⟨262, by decide +kernel⟩,
      ⟨262, by decide +kernel⟩,
      ⟨262, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨258, by decide +kernel⟩
    ⟨259, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1961, by decide +kernel⟩,
      ⟨1961, by decide +kernel⟩,
      ⟨1961, by decide +kernel⟩,
      ⟨1961, by decide +kernel⟩,
      ⟨1961, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨261, by decide +kernel⟩
    ⟨206, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1975, by decide +kernel⟩,
      ⟨1975, by decide +kernel⟩,
      ⟨1975, by decide +kernel⟩,
      ⟨1975, by decide +kernel⟩,
      ⟨1975, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨1978, by decide +kernel⟩,
      ⟨1978, by decide +kernel⟩,
      ⟨1978, by decide +kernel⟩,
      ⟨1978, by decide +kernel⟩,
      ⟨1978, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨127, by decide +kernel⟩,
      ⟨127, by decide +kernel⟩,
      ⟨127, by decide +kernel⟩,
      ⟨127, by decide +kernel⟩,
      ⟨127, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨264, by decide +kernel⟩
    ⟨265, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2005, by decide +kernel⟩,
      ⟨2005, by decide +kernel⟩,
      ⟨2005, by decide +kernel⟩,
      ⟨2005, by decide +kernel⟩,
      ⟨2005, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2013, by decide +kernel⟩,
      ⟨2013, by decide +kernel⟩,
      ⟨2013, by decide +kernel⟩,
      ⟨2013, by decide +kernel⟩,
      ⟨2013, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2025, by decide +kernel⟩,
      ⟨2025, by decide +kernel⟩,
      ⟨2025, by decide +kernel⟩,
      ⟨2025, by decide +kernel⟩,
      ⟨2025, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2033, by decide +kernel⟩,
      ⟨2033, by decide +kernel⟩,
      ⟨2033, by decide +kernel⟩,
      ⟨2033, by decide +kernel⟩,
      ⟨2033, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2047, by decide +kernel⟩,
      ⟨2047, by decide +kernel⟩,
      ⟨2047, by decide +kernel⟩,
      ⟨2047, by decide +kernel⟩,
      ⟨2047, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2052, by decide +kernel⟩,
      ⟨2052, by decide +kernel⟩,
      ⟨2052, by decide +kernel⟩,
      ⟨2052, by decide +kernel⟩,
      ⟨2052, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨275, by decide +kernel⟩,
      ⟨275, by decide +kernel⟩,
      ⟨275, by decide +kernel⟩,
      ⟨275, by decide +kernel⟩,
      ⟨275, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨272, by decide +kernel⟩
    ⟨273, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2064, by decide +kernel⟩,
      ⟨2064, by decide +kernel⟩,
      ⟨2064, by decide +kernel⟩,
      ⟨2064, by decide +kernel⟩,
      ⟨2064, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨2066, by decide +kernel⟩,
      ⟨2066, by decide +kernel⟩,
      ⟨2066, by decide +kernel⟩,
      ⟨2066, by decide +kernel⟩,
      ⟨2066, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨276, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨277, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨281, by decide +kernel⟩,
      ⟨281, by decide +kernel⟩,
      ⟨281, by decide +kernel⟩,
      ⟨281, by decide +kernel⟩,
      ⟨281, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨279, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨278, by decide +kernel⟩
    ⟨280, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2076, by decide +kernel⟩,
      ⟨2076, by decide +kernel⟩,
      ⟨2076, by decide +kernel⟩,
      ⟨2076, by decide +kernel⟩,
      ⟨2076, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨282, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨282, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨284, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨285, by decide +kernel⟩,
  TableOp.marker
    ⟨283, by decide +kernel⟩
    ⟨286, by decide +kernel⟩
]
theorem fact_8_1 : source_8_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_8_1 := by
  decide +kernel
noncomputable def source_7_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_7_1 source_8_1
noncomputable def tables_7_2 : List (TableOp 4042) := tables_7_1 ++ tables_8_1
theorem fact_7_2 : source_7_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_7_2 :=
  source_tables_branch 32 source_7_1 source_8_1
    tables_7_1 tables_8_1 fact_7_1 fact_8_1
noncomputable def source_9_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0288
noncomputable def tables_9_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨1, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨287, by decide +kernel⟩
    ⟨288, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2081, by decide +kernel⟩,
      ⟨2081, by decide +kernel⟩,
      ⟨2081, by decide +kernel⟩,
      ⟨2081, by decide +kernel⟩,
      ⟨2081, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨290, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨291, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨2, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨292, by decide +kernel⟩
    ⟨293, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨291, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨298, by decide +kernel⟩,
      ⟨298, by decide +kernel⟩,
      ⟨298, by decide +kernel⟩,
      ⟨298, by decide +kernel⟩,
      ⟨298, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨296, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨295, by decide +kernel⟩
    ⟨297, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2096, by decide +kernel⟩,
      ⟨2096, by decide +kernel⟩,
      ⟨2096, by decide +kernel⟩,
      ⟨2096, by decide +kernel⟩,
      ⟨2096, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨299, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨299, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨301, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨302, by decide +kernel⟩,
  TableOp.marker
    ⟨300, by decide +kernel⟩
    ⟨303, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨5, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨304, by decide +kernel⟩
    ⟨305, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2090, by decide +kernel⟩,
      ⟨2090, by decide +kernel⟩,
      ⟨2090, by decide +kernel⟩,
      ⟨2090, by decide +kernel⟩,
      ⟨2090, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨307, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨308, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨312, by decide +kernel⟩,
      ⟨312, by decide +kernel⟩,
      ⟨312, by decide +kernel⟩,
      ⟨312, by decide +kernel⟩,
      ⟨312, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨310, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨309, by decide +kernel⟩
    ⟨311, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2109, by decide +kernel⟩,
      ⟨2109, by decide +kernel⟩,
      ⟨2109, by decide +kernel⟩,
      ⟨2109, by decide +kernel⟩,
      ⟨2109, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨313, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨313, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨315, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨316, by decide +kernel⟩,
  TableOp.marker
    ⟨314, by decide +kernel⟩
    ⟨317, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨6, by decide +kernel⟩
]
theorem fact_9_1 : source_9_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_9_1 := by
  decide +kernel
noncomputable def source_10_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0320
noncomputable def tables_10_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨318, by decide +kernel⟩
    ⟨319, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2114, by decide +kernel⟩,
      ⟨2114, by decide +kernel⟩,
      ⟨2114, by decide +kernel⟩,
      ⟨2114, by decide +kernel⟩,
      ⟨2114, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨321, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨322, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨7, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨323, by decide +kernel⟩
    ⟨324, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨322, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨329, by decide +kernel⟩,
      ⟨329, by decide +kernel⟩,
      ⟨329, by decide +kernel⟩,
      ⟨329, by decide +kernel⟩,
      ⟨329, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨327, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨326, by decide +kernel⟩
    ⟨328, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2130, by decide +kernel⟩,
      ⟨2130, by decide +kernel⟩,
      ⟨2130, by decide +kernel⟩,
      ⟨2130, by decide +kernel⟩,
      ⟨2130, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨330, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨330, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨332, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨333, by decide +kernel⟩,
  TableOp.marker
    ⟨331, by decide +kernel⟩
    ⟨334, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨10, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨335, by decide +kernel⟩
    ⟨336, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2139, by decide +kernel⟩,
      ⟨2139, by decide +kernel⟩,
      ⟨2139, by decide +kernel⟩,
      ⟨2139, by decide +kernel⟩,
      ⟨2139, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨338, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨338, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨340, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨341, by decide +kernel⟩,
  TableOp.marker
    ⟨339, by decide +kernel⟩
    ⟨342, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨11, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨343, by decide +kernel⟩
    ⟨344, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2136, by decide +kernel⟩,
      ⟨2136, by decide +kernel⟩,
      ⟨2136, by decide +kernel⟩,
      ⟨2136, by decide +kernel⟩,
      ⟨2136, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨346, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨347, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨351, by decide +kernel⟩,
      ⟨351, by decide +kernel⟩,
      ⟨351, by decide +kernel⟩,
      ⟨351, by decide +kernel⟩,
      ⟨351, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨349, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨348, by decide +kernel⟩
    ⟨350, by decide +kernel⟩
]
theorem fact_10_1 : source_10_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_10_1 := by
  decide +kernel
noncomputable def source_9_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_9_1 source_10_1
noncomputable def tables_9_2 : List (TableOp 4042) := tables_9_1 ++ tables_10_1
theorem fact_9_2 : source_9_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_9_2 :=
  source_tables_branch 32 source_9_1 source_10_1
    tables_9_1 tables_10_1 fact_9_1 fact_10_1
noncomputable def source_7_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_7_2 source_9_2
noncomputable def tables_7_4 : List (TableOp 4042) := tables_7_2 ++ tables_9_2
theorem fact_7_4 : source_7_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_7_4 :=
  source_tables_branch 64 source_7_2 source_9_2
    tables_7_2 tables_9_2 fact_7_2 fact_9_2
noncomputable def source_11_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0352
noncomputable def tables_11_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2152, by decide +kernel⟩,
      ⟨2152, by decide +kernel⟩,
      ⟨2152, by decide +kernel⟩,
      ⟨2152, by decide +kernel⟩,
      ⟨2152, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨352, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨352, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨354, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨355, by decide +kernel⟩,
  TableOp.marker
    ⟨353, by decide +kernel⟩
    ⟨356, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨12, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨357, by decide +kernel⟩
    ⟨358, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2157, by decide +kernel⟩,
      ⟨2157, by decide +kernel⟩,
      ⟨2157, by decide +kernel⟩,
      ⟨2157, by decide +kernel⟩,
      ⟨2157, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨360, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨361, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨13, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨362, by decide +kernel⟩
    ⟨363, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨361, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨368, by decide +kernel⟩,
      ⟨368, by decide +kernel⟩,
      ⟨368, by decide +kernel⟩,
      ⟨368, by decide +kernel⟩,
      ⟨368, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨366, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨365, by decide +kernel⟩
    ⟨367, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2173, by decide +kernel⟩,
      ⟨2173, by decide +kernel⟩,
      ⟨2173, by decide +kernel⟩,
      ⟨2173, by decide +kernel⟩,
      ⟨2173, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨369, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨369, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨371, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨372, by decide +kernel⟩,
  TableOp.marker
    ⟨370, by decide +kernel⟩
    ⟨373, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨16, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨374, by decide +kernel⟩
    ⟨375, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2178, by decide +kernel⟩,
      ⟨2178, by decide +kernel⟩,
      ⟨2178, by decide +kernel⟩,
      ⟨2178, by decide +kernel⟩,
      ⟨2178, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨377, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨378, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨17, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨379, by decide +kernel⟩
    ⟨380, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2189, by decide +kernel⟩,
      ⟨2189, by decide +kernel⟩,
      ⟨2189, by decide +kernel⟩,
      ⟨2189, by decide +kernel⟩,
      ⟨2189, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨382, by decide +kernel⟩
]
theorem fact_11_1 : source_11_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_11_1 := by
  decide +kernel
noncomputable def source_12_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0384
noncomputable def tables_12_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩
    ], rfl⟩
    ⟨383, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨21, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨384, by decide +kernel⟩
    ⟨385, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2197, by decide +kernel⟩,
      ⟨2197, by decide +kernel⟩,
      ⟨2197, by decide +kernel⟩,
      ⟨2197, by decide +kernel⟩,
      ⟨2197, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨387, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨388, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨392, by decide +kernel⟩,
      ⟨392, by decide +kernel⟩,
      ⟨392, by decide +kernel⟩,
      ⟨392, by decide +kernel⟩,
      ⟨392, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨390, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨389, by decide +kernel⟩
    ⟨391, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2207, by decide +kernel⟩,
      ⟨2207, by decide +kernel⟩,
      ⟨2207, by decide +kernel⟩,
      ⟨2207, by decide +kernel⟩,
      ⟨2207, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨393, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨394, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨398, by decide +kernel⟩,
      ⟨398, by decide +kernel⟩,
      ⟨398, by decide +kernel⟩,
      ⟨398, by decide +kernel⟩,
      ⟨398, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨396, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨395, by decide +kernel⟩
    ⟨397, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2213, by decide +kernel⟩,
      ⟨2213, by decide +kernel⟩,
      ⟨2213, by decide +kernel⟩,
      ⟨2213, by decide +kernel⟩,
      ⟨2213, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨399, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨400, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨401, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨405, by decide +kernel⟩,
      ⟨405, by decide +kernel⟩,
      ⟨405, by decide +kernel⟩,
      ⟨405, by decide +kernel⟩,
      ⟨405, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨403, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨402, by decide +kernel⟩
    ⟨404, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2223, by decide +kernel⟩,
      ⟨2223, by decide +kernel⟩,
      ⟨2223, by decide +kernel⟩,
      ⟨2223, by decide +kernel⟩,
      ⟨2223, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨406, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨406, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨408, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨409, by decide +kernel⟩,
  TableOp.marker
    ⟨407, by decide +kernel⟩
    ⟨410, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨25, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨411, by decide +kernel⟩
    ⟨412, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨394, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨417, by decide +kernel⟩,
      ⟨417, by decide +kernel⟩,
      ⟨417, by decide +kernel⟩,
      ⟨417, by decide +kernel⟩,
      ⟨417, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_12_1 : source_12_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_12_1 := by
  decide +kernel
noncomputable def source_11_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_11_1 source_12_1
noncomputable def tables_11_2 : List (TableOp 4042) := tables_11_1 ++ tables_12_1
theorem fact_11_2 : source_11_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_11_2 :=
  source_tables_branch 32 source_11_1 source_12_1
    tables_11_1 tables_12_1 fact_11_1 fact_12_1
noncomputable def source_13_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0416
noncomputable def tables_13_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨415, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨414, by decide +kernel⟩
    ⟨416, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2237, by decide +kernel⟩,
      ⟨2237, by decide +kernel⟩,
      ⟨2237, by decide +kernel⟩,
      ⟨2237, by decide +kernel⟩,
      ⟨2237, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨418, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨418, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨420, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨421, by decide +kernel⟩,
  TableOp.marker
    ⟨419, by decide +kernel⟩
    ⟨422, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨27, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨423, by decide +kernel⟩
    ⟨424, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2231, by decide +kernel⟩,
      ⟨2231, by decide +kernel⟩,
      ⟨2231, by decide +kernel⟩,
      ⟨2231, by decide +kernel⟩,
      ⟨2231, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨426, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨427, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨431, by decide +kernel⟩,
      ⟨431, by decide +kernel⟩,
      ⟨431, by decide +kernel⟩,
      ⟨431, by decide +kernel⟩,
      ⟨431, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨429, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨428, by decide +kernel⟩
    ⟨430, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2250, by decide +kernel⟩,
      ⟨2250, by decide +kernel⟩,
      ⟨2250, by decide +kernel⟩,
      ⟨2250, by decide +kernel⟩,
      ⟨2250, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨432, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨432, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨434, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨435, by decide +kernel⟩,
  TableOp.marker
    ⟨433, by decide +kernel⟩
    ⟨436, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨28, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨437, by decide +kernel⟩
    ⟨438, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2255, by decide +kernel⟩,
      ⟨2255, by decide +kernel⟩,
      ⟨2255, by decide +kernel⟩,
      ⟨2255, by decide +kernel⟩,
      ⟨2255, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨440, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨441, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨29, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨442, by decide +kernel⟩
    ⟨443, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨441, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨448, by decide +kernel⟩,
      ⟨448, by decide +kernel⟩,
      ⟨448, by decide +kernel⟩,
      ⟨448, by decide +kernel⟩,
      ⟨448, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨446, by decide +kernel⟩
]
theorem fact_13_1 : source_13_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_13_1 := by
  decide +kernel
noncomputable def source_14_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0448
noncomputable def tables_14_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨445, by decide +kernel⟩
    ⟨447, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2270, by decide +kernel⟩,
      ⟨2270, by decide +kernel⟩,
      ⟨2270, by decide +kernel⟩,
      ⟨2270, by decide +kernel⟩,
      ⟨2270, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨449, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨449, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨451, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨452, by decide +kernel⟩,
  TableOp.marker
    ⟨450, by decide +kernel⟩
    ⟨453, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨32, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨454, by decide +kernel⟩
    ⟨455, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2264, by decide +kernel⟩,
      ⟨2264, by decide +kernel⟩,
      ⟨2264, by decide +kernel⟩,
      ⟨2264, by decide +kernel⟩,
      ⟨2264, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨457, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨458, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨462, by decide +kernel⟩,
      ⟨462, by decide +kernel⟩,
      ⟨462, by decide +kernel⟩,
      ⟨462, by decide +kernel⟩,
      ⟨462, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨460, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨459, by decide +kernel⟩
    ⟨461, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2283, by decide +kernel⟩,
      ⟨2283, by decide +kernel⟩,
      ⟨2283, by decide +kernel⟩,
      ⟨2283, by decide +kernel⟩,
      ⟨2283, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨463, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨463, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨465, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨466, by decide +kernel⟩,
  TableOp.marker
    ⟨464, by decide +kernel⟩
    ⟨467, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨33, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨468, by decide +kernel⟩
    ⟨469, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2288, by decide +kernel⟩,
      ⟨2288, by decide +kernel⟩,
      ⟨2288, by decide +kernel⟩,
      ⟨2288, by decide +kernel⟩,
      ⟨2288, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨471, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨472, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨34, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨473, by decide +kernel⟩
    ⟨474, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨472, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨479, by decide +kernel⟩,
      ⟨479, by decide +kernel⟩,
      ⟨479, by decide +kernel⟩,
      ⟨479, by decide +kernel⟩,
      ⟨479, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨477, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨476, by decide +kernel⟩
    ⟨478, by decide +kernel⟩
]
theorem fact_14_1 : source_14_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_14_1 := by
  decide +kernel
noncomputable def source_13_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_13_1 source_14_1
noncomputable def tables_13_2 : List (TableOp 4042) := tables_13_1 ++ tables_14_1
theorem fact_13_2 : source_13_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_13_2 :=
  source_tables_branch 32 source_13_1 source_14_1
    tables_13_1 tables_14_1 fact_13_1 fact_14_1
noncomputable def source_11_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_11_2 source_13_2
noncomputable def tables_11_4 : List (TableOp 4042) := tables_11_2 ++ tables_13_2
theorem fact_11_4 : source_11_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_11_4 :=
  source_tables_branch 64 source_11_2 source_13_2
    tables_11_2 tables_13_2 fact_11_2 fact_13_2
noncomputable def source_7_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_7_4 source_11_4
noncomputable def tables_7_8 : List (TableOp 4042) := tables_7_4 ++ tables_11_4
theorem fact_7_8 : source_7_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_7_8 :=
  source_tables_branch 128 source_7_4 source_11_4
    tables_7_4 tables_11_4 fact_7_4 fact_11_4
noncomputable def source_0_15 : Balanced.RowTree Snapshot.Entry :=
  .branch 224 source_0_7 source_7_8
noncomputable def tables_0_15 : List (TableOp 4042) := tables_0_7 ++ tables_7_8
theorem fact_0_15 : source_0_15.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_15 :=
  source_tables_branch 224 source_0_7 source_7_8
    tables_0_7 tables_7_8 fact_0_7 fact_7_8
noncomputable def source_15_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0480
noncomputable def tables_15_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2303, by decide +kernel⟩,
      ⟨2303, by decide +kernel⟩,
      ⟨2303, by decide +kernel⟩,
      ⟨2303, by decide +kernel⟩,
      ⟨2303, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨480, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨480, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨482, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨483, by decide +kernel⟩,
  TableOp.marker
    ⟨481, by decide +kernel⟩
    ⟨484, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨37, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨485, by decide +kernel⟩
    ⟨486, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2297, by decide +kernel⟩,
      ⟨2297, by decide +kernel⟩,
      ⟨2297, by decide +kernel⟩,
      ⟨2297, by decide +kernel⟩,
      ⟨2297, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨488, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨489, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨493, by decide +kernel⟩,
      ⟨493, by decide +kernel⟩,
      ⟨493, by decide +kernel⟩,
      ⟨493, by decide +kernel⟩,
      ⟨493, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨491, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨490, by decide +kernel⟩
    ⟨492, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2316, by decide +kernel⟩,
      ⟨2316, by decide +kernel⟩,
      ⟨2316, by decide +kernel⟩,
      ⟨2316, by decide +kernel⟩,
      ⟨2316, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨494, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨494, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨496, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨497, by decide +kernel⟩,
  TableOp.marker
    ⟨495, by decide +kernel⟩
    ⟨498, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨38, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨499, by decide +kernel⟩
    ⟨500, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2321, by decide +kernel⟩,
      ⟨2321, by decide +kernel⟩,
      ⟨2321, by decide +kernel⟩,
      ⟨2321, by decide +kernel⟩,
      ⟨2321, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨502, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨503, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨39, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨504, by decide +kernel⟩
    ⟨505, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨503, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨510, by decide +kernel⟩,
      ⟨510, by decide +kernel⟩,
      ⟨510, by decide +kernel⟩,
      ⟨510, by decide +kernel⟩,
      ⟨510, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨508, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨507, by decide +kernel⟩
    ⟨509, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2333, by decide +kernel⟩,
      ⟨2333, by decide +kernel⟩,
      ⟨2333, by decide +kernel⟩,
      ⟨2333, by decide +kernel⟩,
      ⟨2333, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_15_1 : source_15_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_15_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t16\t{now}"
      handle.flush
noncomputable def source_16_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0512
noncomputable def tables_16_1 : List (TableOp 4042) := [
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨511, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨511, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨513, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨514, by decide +kernel⟩,
  TableOp.marker
    ⟨512, by decide +kernel⟩
    ⟨515, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨42, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨516, by decide +kernel⟩
    ⟨517, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2228, by decide +kernel⟩,
      ⟨2228, by decide +kernel⟩,
      ⟨2228, by decide +kernel⟩,
      ⟨2228, by decide +kernel⟩,
      ⟨2228, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨519, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨520, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨524, by decide +kernel⟩,
      ⟨524, by decide +kernel⟩,
      ⟨524, by decide +kernel⟩,
      ⟨524, by decide +kernel⟩,
      ⟨524, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨522, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨521, by decide +kernel⟩
    ⟨523, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2346, by decide +kernel⟩,
      ⟨2346, by decide +kernel⟩,
      ⟨2346, by decide +kernel⟩,
      ⟨2346, by decide +kernel⟩,
      ⟨2346, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨525, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨525, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨527, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨528, by decide +kernel⟩,
  TableOp.marker
    ⟨526, by decide +kernel⟩
    ⟨529, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨43, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨530, by decide +kernel⟩
    ⟨531, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2351, by decide +kernel⟩,
      ⟨2351, by decide +kernel⟩,
      ⟨2351, by decide +kernel⟩,
      ⟨2351, by decide +kernel⟩,
      ⟨2351, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨533, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨534, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨44, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨535, by decide +kernel⟩
    ⟨536, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2359, by decide +kernel⟩,
      ⟨2359, by decide +kernel⟩,
      ⟨2359, by decide +kernel⟩,
      ⟨2359, by decide +kernel⟩,
      ⟨2359, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨538, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨539, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨47, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨540, by decide +kernel⟩
    ⟨541, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨539, by decide +kernel⟩
]
theorem fact_16_1 : source_16_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_16_1 := by
  decide +kernel
noncomputable def source_15_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_15_1 source_16_1
noncomputable def tables_15_2 : List (TableOp 4042) := tables_15_1 ++ tables_16_1
theorem fact_15_2 : source_15_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_15_2 :=
  source_tables_branch 32 source_15_1 source_16_1
    tables_15_1 tables_16_1 fact_15_1 fact_16_1
noncomputable def source_17_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0544
noncomputable def tables_17_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨546, by decide +kernel⟩,
      ⟨546, by decide +kernel⟩,
      ⟨546, by decide +kernel⟩,
      ⟨546, by decide +kernel⟩,
      ⟨546, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨544, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨543, by decide +kernel⟩
    ⟨545, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2367, by decide +kernel⟩,
      ⟨2367, by decide +kernel⟩,
      ⟨2367, by decide +kernel⟩,
      ⟨2367, by decide +kernel⟩,
      ⟨2367, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨547, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨548, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨552, by decide +kernel⟩,
      ⟨552, by decide +kernel⟩,
      ⟨552, by decide +kernel⟩,
      ⟨552, by decide +kernel⟩,
      ⟨552, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨550, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨549, by decide +kernel⟩
    ⟨551, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2376, by decide +kernel⟩,
      ⟨2376, by decide +kernel⟩,
      ⟨2376, by decide +kernel⟩,
      ⟨2376, by decide +kernel⟩,
      ⟨2376, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨553, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨553, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨555, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨556, by decide +kernel⟩,
  TableOp.marker
    ⟨554, by decide +kernel⟩
    ⟨557, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨50, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨558, by decide +kernel⟩
    ⟨559, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2373, by decide +kernel⟩,
      ⟨2373, by decide +kernel⟩,
      ⟨2373, by decide +kernel⟩,
      ⟨2373, by decide +kernel⟩,
      ⟨2373, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨561, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨562, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨566, by decide +kernel⟩,
      ⟨566, by decide +kernel⟩,
      ⟨566, by decide +kernel⟩,
      ⟨566, by decide +kernel⟩,
      ⟨566, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨564, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨563, by decide +kernel⟩
    ⟨565, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2389, by decide +kernel⟩,
      ⟨2389, by decide +kernel⟩,
      ⟨2389, by decide +kernel⟩,
      ⟨2389, by decide +kernel⟩,
      ⟨2389, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨567, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨567, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨569, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨570, by decide +kernel⟩,
  TableOp.marker
    ⟨568, by decide +kernel⟩
    ⟨571, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨51, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨572, by decide +kernel⟩
    ⟨573, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2394, by decide +kernel⟩,
      ⟨2394, by decide +kernel⟩,
      ⟨2394, by decide +kernel⟩,
      ⟨2394, by decide +kernel⟩,
      ⟨2394, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_17_1 : source_17_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_17_1 := by
  decide +kernel
noncomputable def source_18_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0576
noncomputable def tables_18_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨575, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨576, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨52, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨577, by decide +kernel⟩
    ⟨578, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2402, by decide +kernel⟩,
      ⟨2402, by decide +kernel⟩,
      ⟨2402, by decide +kernel⟩,
      ⟨2402, by decide +kernel⟩,
      ⟨2402, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨580, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨581, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨55, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨582, by decide +kernel⟩
    ⟨583, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨581, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨588, by decide +kernel⟩,
      ⟨588, by decide +kernel⟩,
      ⟨588, by decide +kernel⟩,
      ⟨588, by decide +kernel⟩,
      ⟨588, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨586, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨585, by decide +kernel⟩
    ⟨587, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2410, by decide +kernel⟩,
      ⟨2410, by decide +kernel⟩,
      ⟨2410, by decide +kernel⟩,
      ⟨2410, by decide +kernel⟩,
      ⟨2410, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨589, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨590, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨594, by decide +kernel⟩,
      ⟨594, by decide +kernel⟩,
      ⟨594, by decide +kernel⟩,
      ⟨594, by decide +kernel⟩,
      ⟨594, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨592, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨591, by decide +kernel⟩
    ⟨593, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2419, by decide +kernel⟩,
      ⟨2419, by decide +kernel⟩,
      ⟨2419, by decide +kernel⟩,
      ⟨2419, by decide +kernel⟩,
      ⟨2419, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨595, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨595, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨597, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨598, by decide +kernel⟩,
  TableOp.marker
    ⟨596, by decide +kernel⟩
    ⟨599, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨58, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨600, by decide +kernel⟩
    ⟨601, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2416, by decide +kernel⟩,
      ⟨2416, by decide +kernel⟩,
      ⟨2416, by decide +kernel⟩,
      ⟨2416, by decide +kernel⟩,
      ⟨2416, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨603, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨604, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨608, by decide +kernel⟩,
      ⟨608, by decide +kernel⟩,
      ⟨608, by decide +kernel⟩,
      ⟨608, by decide +kernel⟩,
      ⟨608, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨606, by decide +kernel⟩
]
theorem fact_18_1 : source_18_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_18_1 := by
  decide +kernel
noncomputable def source_17_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_17_1 source_18_1
noncomputable def tables_17_2 : List (TableOp 4042) := tables_17_1 ++ tables_18_1
theorem fact_17_2 : source_17_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_17_2 :=
  source_tables_branch 32 source_17_1 source_18_1
    tables_17_1 tables_18_1 fact_17_1 fact_18_1
noncomputable def source_15_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_15_2 source_17_2
noncomputable def tables_15_4 : List (TableOp 4042) := tables_15_2 ++ tables_17_2
theorem fact_15_4 : source_15_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_15_4 :=
  source_tables_branch 64 source_15_2 source_17_2
    tables_15_2 tables_17_2 fact_15_2 fact_17_2
noncomputable def source_19_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0608
noncomputable def tables_19_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨605, by decide +kernel⟩
    ⟨607, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2432, by decide +kernel⟩,
      ⟨2432, by decide +kernel⟩,
      ⟨2432, by decide +kernel⟩,
      ⟨2432, by decide +kernel⟩,
      ⟨2432, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨609, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨609, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨611, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨612, by decide +kernel⟩,
  TableOp.marker
    ⟨610, by decide +kernel⟩
    ⟨613, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨59, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨614, by decide +kernel⟩
    ⟨615, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2437, by decide +kernel⟩,
      ⟨2437, by decide +kernel⟩,
      ⟨2437, by decide +kernel⟩,
      ⟨2437, by decide +kernel⟩,
      ⟨2437, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨617, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨618, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨60, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨619, by decide +kernel⟩
    ⟨620, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2445, by decide +kernel⟩,
      ⟨2445, by decide +kernel⟩,
      ⟨2445, by decide +kernel⟩,
      ⟨2445, by decide +kernel⟩,
      ⟨2445, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨622, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨623, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨63, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨624, by decide +kernel⟩
    ⟨625, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨623, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨630, by decide +kernel⟩,
      ⟨630, by decide +kernel⟩,
      ⟨630, by decide +kernel⟩,
      ⟨630, by decide +kernel⟩,
      ⟨630, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨628, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨627, by decide +kernel⟩
    ⟨629, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2453, by decide +kernel⟩,
      ⟨2453, by decide +kernel⟩,
      ⟨2453, by decide +kernel⟩,
      ⟨2453, by decide +kernel⟩,
      ⟨2453, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨631, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨632, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨636, by decide +kernel⟩,
      ⟨636, by decide +kernel⟩,
      ⟨636, by decide +kernel⟩,
      ⟨636, by decide +kernel⟩,
      ⟨636, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨634, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨633, by decide +kernel⟩
    ⟨635, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2463, by decide +kernel⟩,
      ⟨2463, by decide +kernel⟩,
      ⟨2463, by decide +kernel⟩,
      ⟨2463, by decide +kernel⟩,
      ⟨2463, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨637, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨637, by decide +kernel⟩
]
theorem fact_19_1 : source_19_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_19_1 := by
  decide +kernel
noncomputable def source_20_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0640
noncomputable def tables_20_1 : List (TableOp 4042) := [
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨639, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨640, by decide +kernel⟩,
  TableOp.marker
    ⟨638, by decide +kernel⟩
    ⟨641, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨66, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨642, by decide +kernel⟩
    ⟨643, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2468, by decide +kernel⟩,
      ⟨2468, by decide +kernel⟩,
      ⟨2468, by decide +kernel⟩,
      ⟨2468, by decide +kernel⟩,
      ⟨2468, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨645, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨646, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨650, by decide +kernel⟩,
      ⟨650, by decide +kernel⟩,
      ⟨650, by decide +kernel⟩,
      ⟨650, by decide +kernel⟩,
      ⟨650, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨648, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨647, by decide +kernel⟩
    ⟨649, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2478, by decide +kernel⟩,
      ⟨2478, by decide +kernel⟩,
      ⟨2478, by decide +kernel⟩,
      ⟨2478, by decide +kernel⟩,
      ⟨2478, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨651, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨651, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨653, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨654, by decide +kernel⟩,
  TableOp.marker
    ⟨652, by decide +kernel⟩
    ⟨655, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨68, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨656, by decide +kernel⟩
    ⟨657, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2486, by decide +kernel⟩,
      ⟨2486, by decide +kernel⟩,
      ⟨2486, by decide +kernel⟩,
      ⟨2486, by decide +kernel⟩,
      ⟨2486, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨659, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨660, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨70, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨661, by decide +kernel⟩
    ⟨662, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨660, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨667, by decide +kernel⟩,
      ⟨667, by decide +kernel⟩,
      ⟨667, by decide +kernel⟩,
      ⟨667, by decide +kernel⟩,
      ⟨667, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨665, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨664, by decide +kernel⟩
    ⟨666, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2502, by decide +kernel⟩,
      ⟨2502, by decide +kernel⟩,
      ⟨2502, by decide +kernel⟩,
      ⟨2502, by decide +kernel⟩,
      ⟨2502, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨668, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨668, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨670, by decide +kernel⟩
]
theorem fact_20_1 : source_20_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_20_1 := by
  decide +kernel
noncomputable def source_19_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_19_1 source_20_1
noncomputable def tables_19_2 : List (TableOp 4042) := tables_19_1 ++ tables_20_1
theorem fact_19_2 : source_19_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_19_2 :=
  source_tables_branch 32 source_19_1 source_20_1
    tables_19_1 tables_20_1 fact_19_1 fact_20_1
noncomputable def source_21_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0672
noncomputable def tables_21_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨671, by decide +kernel⟩,
  TableOp.marker
    ⟨669, by decide +kernel⟩
    ⟨672, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨73, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨673, by decide +kernel⟩
    ⟨674, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2507, by decide +kernel⟩,
      ⟨2507, by decide +kernel⟩,
      ⟨2507, by decide +kernel⟩,
      ⟨2507, by decide +kernel⟩,
      ⟨2507, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨676, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨677, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨74, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨678, by decide +kernel⟩
    ⟨679, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨677, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨684, by decide +kernel⟩,
      ⟨684, by decide +kernel⟩,
      ⟨684, by decide +kernel⟩,
      ⟨684, by decide +kernel⟩,
      ⟨684, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨682, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨681, by decide +kernel⟩
    ⟨683, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2519, by decide +kernel⟩,
      ⟨2519, by decide +kernel⟩,
      ⟨2519, by decide +kernel⟩,
      ⟨2519, by decide +kernel⟩,
      ⟨2519, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨685, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨685, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨687, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨688, by decide +kernel⟩,
  TableOp.marker
    ⟨686, by decide +kernel⟩
    ⟨689, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨77, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨690, by decide +kernel⟩
    ⟨691, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2529, by decide +kernel⟩,
      ⟨2529, by decide +kernel⟩,
      ⟨2529, by decide +kernel⟩,
      ⟨2529, by decide +kernel⟩,
      ⟨2529, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨693, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨694, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨698, by decide +kernel⟩,
      ⟨698, by decide +kernel⟩,
      ⟨698, by decide +kernel⟩,
      ⟨698, by decide +kernel⟩,
      ⟨698, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨696, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨695, by decide +kernel⟩
    ⟨697, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2535, by decide +kernel⟩,
      ⟨2535, by decide +kernel⟩,
      ⟨2535, by decide +kernel⟩,
      ⟨2535, by decide +kernel⟩,
      ⟨2535, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨699, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨699, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨701, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨702, by decide +kernel⟩
]
theorem fact_21_1 : source_21_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_21_1 := by
  decide +kernel
noncomputable def source_22_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0704
noncomputable def tables_22_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨700, by decide +kernel⟩
    ⟨703, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨78, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨704, by decide +kernel⟩
    ⟨705, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2540, by decide +kernel⟩,
      ⟨2540, by decide +kernel⟩,
      ⟨2540, by decide +kernel⟩,
      ⟨2540, by decide +kernel⟩,
      ⟨2540, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨707, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨708, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨79, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨709, by decide +kernel⟩
    ⟨710, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨708, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨715, by decide +kernel⟩,
      ⟨715, by decide +kernel⟩,
      ⟨715, by decide +kernel⟩,
      ⟨715, by decide +kernel⟩,
      ⟨715, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨713, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨712, by decide +kernel⟩
    ⟨714, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2555, by decide +kernel⟩,
      ⟨2555, by decide +kernel⟩,
      ⟨2555, by decide +kernel⟩,
      ⟨2555, by decide +kernel⟩,
      ⟨2555, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨716, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨716, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨718, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨719, by decide +kernel⟩,
  TableOp.marker
    ⟨717, by decide +kernel⟩
    ⟨720, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨82, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨721, by decide +kernel⟩
    ⟨722, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2549, by decide +kernel⟩,
      ⟨2549, by decide +kernel⟩,
      ⟨2549, by decide +kernel⟩,
      ⟨2549, by decide +kernel⟩,
      ⟨2549, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨724, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨725, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨729, by decide +kernel⟩,
      ⟨729, by decide +kernel⟩,
      ⟨729, by decide +kernel⟩,
      ⟨729, by decide +kernel⟩,
      ⟨729, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨727, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨726, by decide +kernel⟩
    ⟨728, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2568, by decide +kernel⟩,
      ⟨2568, by decide +kernel⟩,
      ⟨2568, by decide +kernel⟩,
      ⟨2568, by decide +kernel⟩,
      ⟨2568, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨730, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨730, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨732, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨733, by decide +kernel⟩,
  TableOp.marker
    ⟨731, by decide +kernel⟩
    ⟨734, by decide +kernel⟩
]
theorem fact_22_1 : source_22_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_22_1 := by
  decide +kernel
noncomputable def source_21_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_21_1 source_22_1
noncomputable def tables_21_2 : List (TableOp 4042) := tables_21_1 ++ tables_22_1
theorem fact_21_2 : source_21_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_21_2 :=
  source_tables_branch 32 source_21_1 source_22_1
    tables_21_1 tables_22_1 fact_21_1 fact_22_1
noncomputable def source_19_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_19_2 source_21_2
noncomputable def tables_19_4 : List (TableOp 4042) := tables_19_2 ++ tables_21_2
theorem fact_19_4 : source_19_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_19_4 :=
  source_tables_branch 64 source_19_2 source_21_2
    tables_19_2 tables_21_2 fact_19_2 fact_21_2
noncomputable def source_15_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_15_4 source_19_4
noncomputable def tables_15_8 : List (TableOp 4042) := tables_15_4 ++ tables_19_4
theorem fact_15_8 : source_15_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_15_8 :=
  source_tables_branch 128 source_15_4 source_19_4
    tables_15_4 tables_19_4 fact_15_4 fact_19_4
noncomputable def source_23_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0736
noncomputable def tables_23_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨83, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨735, by decide +kernel⟩
    ⟨736, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2573, by decide +kernel⟩,
      ⟨2573, by decide +kernel⟩,
      ⟨2573, by decide +kernel⟩,
      ⟨2573, by decide +kernel⟩,
      ⟨2573, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨738, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨739, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨84, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨740, by decide +kernel⟩
    ⟨741, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨739, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨746, by decide +kernel⟩,
      ⟨746, by decide +kernel⟩,
      ⟨746, by decide +kernel⟩,
      ⟨746, by decide +kernel⟩,
      ⟨746, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨744, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨743, by decide +kernel⟩
    ⟨745, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2589, by decide +kernel⟩,
      ⟨2589, by decide +kernel⟩,
      ⟨2589, by decide +kernel⟩,
      ⟨2589, by decide +kernel⟩,
      ⟨2589, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨747, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨747, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨749, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨750, by decide +kernel⟩,
  TableOp.marker
    ⟨748, by decide +kernel⟩
    ⟨751, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨87, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨752, by decide +kernel⟩
    ⟨753, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2594, by decide +kernel⟩,
      ⟨2594, by decide +kernel⟩,
      ⟨2594, by decide +kernel⟩,
      ⟨2594, by decide +kernel⟩,
      ⟨2594, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨755, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨756, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨760, by decide +kernel⟩,
      ⟨760, by decide +kernel⟩,
      ⟨760, by decide +kernel⟩,
      ⟨760, by decide +kernel⟩,
      ⟨760, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨758, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨757, by decide +kernel⟩
    ⟨759, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2604, by decide +kernel⟩,
      ⟨2604, by decide +kernel⟩,
      ⟨2604, by decide +kernel⟩,
      ⟨2604, by decide +kernel⟩,
      ⟨2604, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨761, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨762, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨766, by decide +kernel⟩,
      ⟨766, by decide +kernel⟩,
      ⟨766, by decide +kernel⟩,
      ⟨766, by decide +kernel⟩,
      ⟨766, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨764, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨763, by decide +kernel⟩
    ⟨765, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2610, by decide +kernel⟩,
      ⟨2610, by decide +kernel⟩,
      ⟨2610, by decide +kernel⟩,
      ⟨2610, by decide +kernel⟩,
      ⟨2610, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_23_1 : source_23_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_23_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t24\t{now}"
      handle.flush
noncomputable def source_24_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0768
noncomputable def tables_24_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨767, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨768, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨769, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨773, by decide +kernel⟩,
      ⟨773, by decide +kernel⟩,
      ⟨773, by decide +kernel⟩,
      ⟨773, by decide +kernel⟩,
      ⟨773, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨771, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨770, by decide +kernel⟩
    ⟨772, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2620, by decide +kernel⟩,
      ⟨2620, by decide +kernel⟩,
      ⟨2620, by decide +kernel⟩,
      ⟨2620, by decide +kernel⟩,
      ⟨2620, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨774, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨774, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨776, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨777, by decide +kernel⟩,
  TableOp.marker
    ⟨775, by decide +kernel⟩
    ⟨778, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨89, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨779, by decide +kernel⟩
    ⟨780, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨762, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨785, by decide +kernel⟩,
      ⟨785, by decide +kernel⟩,
      ⟨785, by decide +kernel⟩,
      ⟨785, by decide +kernel⟩,
      ⟨785, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨783, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨782, by decide +kernel⟩
    ⟨784, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2635, by decide +kernel⟩,
      ⟨2635, by decide +kernel⟩,
      ⟨2635, by decide +kernel⟩,
      ⟨2635, by decide +kernel⟩,
      ⟨2635, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨786, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨786, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨788, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨789, by decide +kernel⟩,
  TableOp.marker
    ⟨787, by decide +kernel⟩
    ⟨790, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨91, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨791, by decide +kernel⟩
    ⟨792, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2629, by decide +kernel⟩,
      ⟨2629, by decide +kernel⟩,
      ⟨2629, by decide +kernel⟩,
      ⟨2629, by decide +kernel⟩,
      ⟨2629, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨794, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨795, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨799, by decide +kernel⟩,
      ⟨799, by decide +kernel⟩,
      ⟨799, by decide +kernel⟩,
      ⟨799, by decide +kernel⟩,
      ⟨799, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨797, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨796, by decide +kernel⟩
    ⟨798, by decide +kernel⟩
]
theorem fact_24_1 : source_24_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_24_1 := by
  decide +kernel
noncomputable def source_23_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_23_1 source_24_1
noncomputable def tables_23_2 : List (TableOp 4042) := tables_23_1 ++ tables_24_1
theorem fact_23_2 : source_23_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_23_2 :=
  source_tables_branch 32 source_23_1 source_24_1
    tables_23_1 tables_24_1 fact_23_1 fact_24_1
noncomputable def source_25_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0800
noncomputable def tables_25_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2648, by decide +kernel⟩,
      ⟨2648, by decide +kernel⟩,
      ⟨2648, by decide +kernel⟩,
      ⟨2648, by decide +kernel⟩,
      ⟨2648, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨800, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨801, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨805, by decide +kernel⟩,
      ⟨805, by decide +kernel⟩,
      ⟨805, by decide +kernel⟩,
      ⟨805, by decide +kernel⟩,
      ⟨805, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨803, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨802, by decide +kernel⟩
    ⟨804, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2654, by decide +kernel⟩,
      ⟨2654, by decide +kernel⟩,
      ⟨2654, by decide +kernel⟩,
      ⟨2654, by decide +kernel⟩,
      ⟨2654, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨806, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨807, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨808, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨812, by decide +kernel⟩,
      ⟨812, by decide +kernel⟩,
      ⟨812, by decide +kernel⟩,
      ⟨812, by decide +kernel⟩,
      ⟨812, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨810, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨809, by decide +kernel⟩
    ⟨811, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2664, by decide +kernel⟩,
      ⟨2664, by decide +kernel⟩,
      ⟨2664, by decide +kernel⟩,
      ⟨2664, by decide +kernel⟩,
      ⟨2664, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨813, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨813, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨815, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨816, by decide +kernel⟩,
  TableOp.marker
    ⟨814, by decide +kernel⟩
    ⟨817, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨92, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨818, by decide +kernel⟩
    ⟨819, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨801, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨824, by decide +kernel⟩,
      ⟨824, by decide +kernel⟩,
      ⟨824, by decide +kernel⟩,
      ⟨824, by decide +kernel⟩,
      ⟨824, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨822, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨821, by decide +kernel⟩
    ⟨823, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2679, by decide +kernel⟩,
      ⟨2679, by decide +kernel⟩,
      ⟨2679, by decide +kernel⟩,
      ⟨2679, by decide +kernel⟩,
      ⟨2679, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨825, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨825, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨827, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨828, by decide +kernel⟩,
  TableOp.marker
    ⟨826, by decide +kernel⟩
    ⟨829, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨94, by decide +kernel⟩
]
theorem fact_25_1 : source_25_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_25_1 := by
  decide +kernel
noncomputable def source_26_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0832
noncomputable def tables_26_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨830, by decide +kernel⟩
    ⟨831, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2673, by decide +kernel⟩,
      ⟨2673, by decide +kernel⟩,
      ⟨2673, by decide +kernel⟩,
      ⟨2673, by decide +kernel⟩,
      ⟨2673, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨833, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨834, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨838, by decide +kernel⟩,
      ⟨838, by decide +kernel⟩,
      ⟨838, by decide +kernel⟩,
      ⟨838, by decide +kernel⟩,
      ⟨838, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨836, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨835, by decide +kernel⟩
    ⟨837, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2692, by decide +kernel⟩,
      ⟨2692, by decide +kernel⟩,
      ⟨2692, by decide +kernel⟩,
      ⟨2692, by decide +kernel⟩,
      ⟨2692, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨839, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨840, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨844, by decide +kernel⟩,
      ⟨844, by decide +kernel⟩,
      ⟨844, by decide +kernel⟩,
      ⟨844, by decide +kernel⟩,
      ⟨844, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨842, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨841, by decide +kernel⟩
    ⟨843, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2698, by decide +kernel⟩,
      ⟨2698, by decide +kernel⟩,
      ⟨2698, by decide +kernel⟩,
      ⟨2698, by decide +kernel⟩,
      ⟨2698, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨845, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨846, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨847, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨851, by decide +kernel⟩,
      ⟨851, by decide +kernel⟩,
      ⟨851, by decide +kernel⟩,
      ⟨851, by decide +kernel⟩,
      ⟨851, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨849, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨848, by decide +kernel⟩
    ⟨850, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2708, by decide +kernel⟩,
      ⟨2708, by decide +kernel⟩,
      ⟨2708, by decide +kernel⟩,
      ⟨2708, by decide +kernel⟩,
      ⟨2708, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨852, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨852, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨854, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨855, by decide +kernel⟩,
  TableOp.marker
    ⟨853, by decide +kernel⟩
    ⟨856, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨95, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨857, by decide +kernel⟩
    ⟨858, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨840, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨863, by decide +kernel⟩,
      ⟨863, by decide +kernel⟩,
      ⟨863, by decide +kernel⟩,
      ⟨863, by decide +kernel⟩,
      ⟨863, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨861, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨860, by decide +kernel⟩
    ⟨862, by decide +kernel⟩
]
theorem fact_26_1 : source_26_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_26_1 := by
  decide +kernel
noncomputable def source_25_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_25_1 source_26_1
noncomputable def tables_25_2 : List (TableOp 4042) := tables_25_1 ++ tables_26_1
theorem fact_25_2 : source_25_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_25_2 :=
  source_tables_branch 32 source_25_1 source_26_1
    tables_25_1 tables_26_1 fact_25_1 fact_26_1
noncomputable def source_23_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_23_2 source_25_2
noncomputable def tables_23_4 : List (TableOp 4042) := tables_23_2 ++ tables_25_2
theorem fact_23_4 : source_23_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_23_4 :=
  source_tables_branch 64 source_23_2 source_25_2
    tables_23_2 tables_25_2 fact_23_2 fact_25_2
noncomputable def source_27_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0864
noncomputable def tables_27_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2723, by decide +kernel⟩,
      ⟨2723, by decide +kernel⟩,
      ⟨2723, by decide +kernel⟩,
      ⟨2723, by decide +kernel⟩,
      ⟨2723, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨864, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨864, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨866, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨867, by decide +kernel⟩,
  TableOp.marker
    ⟨865, by decide +kernel⟩
    ⟨868, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨97, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨869, by decide +kernel⟩
    ⟨870, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2717, by decide +kernel⟩,
      ⟨2717, by decide +kernel⟩,
      ⟨2717, by decide +kernel⟩,
      ⟨2717, by decide +kernel⟩,
      ⟨2717, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨872, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨873, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨877, by decide +kernel⟩,
      ⟨877, by decide +kernel⟩,
      ⟨877, by decide +kernel⟩,
      ⟨877, by decide +kernel⟩,
      ⟨877, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨875, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨874, by decide +kernel⟩
    ⟨876, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2736, by decide +kernel⟩,
      ⟨2736, by decide +kernel⟩,
      ⟨2736, by decide +kernel⟩,
      ⟨2736, by decide +kernel⟩,
      ⟨2736, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨878, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨879, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨883, by decide +kernel⟩,
      ⟨883, by decide +kernel⟩,
      ⟨883, by decide +kernel⟩,
      ⟨883, by decide +kernel⟩,
      ⟨883, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨881, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨880, by decide +kernel⟩
    ⟨882, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2742, by decide +kernel⟩,
      ⟨2742, by decide +kernel⟩,
      ⟨2742, by decide +kernel⟩,
      ⟨2742, by decide +kernel⟩,
      ⟨2742, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨884, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨885, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨886, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨890, by decide +kernel⟩,
      ⟨890, by decide +kernel⟩,
      ⟨890, by decide +kernel⟩,
      ⟨890, by decide +kernel⟩,
      ⟨890, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨888, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨887, by decide +kernel⟩
    ⟨889, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2752, by decide +kernel⟩,
      ⟨2752, by decide +kernel⟩,
      ⟨2752, by decide +kernel⟩,
      ⟨2752, by decide +kernel⟩,
      ⟨2752, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨891, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨891, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨893, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨894, by decide +kernel⟩
]
theorem fact_27_1 : source_27_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_27_1 := by
  decide +kernel
noncomputable def source_28_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0896
noncomputable def tables_28_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨892, by decide +kernel⟩
    ⟨895, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨98, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨896, by decide +kernel⟩
    ⟨897, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨879, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨902, by decide +kernel⟩,
      ⟨902, by decide +kernel⟩,
      ⟨902, by decide +kernel⟩,
      ⟨902, by decide +kernel⟩,
      ⟨902, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨900, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨899, by decide +kernel⟩
    ⟨901, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2766, by decide +kernel⟩,
      ⟨2766, by decide +kernel⟩,
      ⟨2766, by decide +kernel⟩,
      ⟨2766, by decide +kernel⟩,
      ⟨2766, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨903, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨903, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨905, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨906, by decide +kernel⟩,
  TableOp.marker
    ⟨904, by decide +kernel⟩
    ⟨907, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨100, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨908, by decide +kernel⟩
    ⟨909, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2760, by decide +kernel⟩,
      ⟨2760, by decide +kernel⟩,
      ⟨2760, by decide +kernel⟩,
      ⟨2760, by decide +kernel⟩,
      ⟨2760, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨911, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨912, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨916, by decide +kernel⟩,
      ⟨916, by decide +kernel⟩,
      ⟨916, by decide +kernel⟩,
      ⟨916, by decide +kernel⟩,
      ⟨916, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨914, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨913, by decide +kernel⟩
    ⟨915, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2779, by decide +kernel⟩,
      ⟨2779, by decide +kernel⟩,
      ⟨2779, by decide +kernel⟩,
      ⟨2779, by decide +kernel⟩,
      ⟨2779, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨917, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨918, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨922, by decide +kernel⟩,
      ⟨922, by decide +kernel⟩,
      ⟨922, by decide +kernel⟩,
      ⟨922, by decide +kernel⟩,
      ⟨922, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨920, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨919, by decide +kernel⟩
    ⟨921, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2785, by decide +kernel⟩,
      ⟨2785, by decide +kernel⟩,
      ⟨2785, by decide +kernel⟩,
      ⟨2785, by decide +kernel⟩,
      ⟨2785, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨923, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨924, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨925, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨929, by decide +kernel⟩,
      ⟨929, by decide +kernel⟩,
      ⟨929, by decide +kernel⟩,
      ⟨929, by decide +kernel⟩,
      ⟨929, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_28_1 : source_28_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_28_1 := by
  decide +kernel
noncomputable def source_27_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_27_1 source_28_1
noncomputable def tables_27_2 : List (TableOp 4042) := tables_27_1 ++ tables_28_1
theorem fact_27_2 : source_27_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_27_2 :=
  source_tables_branch 32 source_27_1 source_28_1
    tables_27_1 tables_28_1 fact_27_1 fact_28_1
noncomputable def source_29_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0928
noncomputable def tables_29_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨927, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨926, by decide +kernel⟩
    ⟨928, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2795, by decide +kernel⟩,
      ⟨2795, by decide +kernel⟩,
      ⟨2795, by decide +kernel⟩,
      ⟨2795, by decide +kernel⟩,
      ⟨2795, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨930, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨930, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨932, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨933, by decide +kernel⟩,
  TableOp.marker
    ⟨931, by decide +kernel⟩
    ⟨934, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨101, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨935, by decide +kernel⟩
    ⟨936, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨918, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨941, by decide +kernel⟩,
      ⟨941, by decide +kernel⟩,
      ⟨941, by decide +kernel⟩,
      ⟨941, by decide +kernel⟩,
      ⟨941, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨939, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨938, by decide +kernel⟩
    ⟨940, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2809, by decide +kernel⟩,
      ⟨2809, by decide +kernel⟩,
      ⟨2809, by decide +kernel⟩,
      ⟨2809, by decide +kernel⟩,
      ⟨2809, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨942, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨942, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨944, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨945, by decide +kernel⟩,
  TableOp.marker
    ⟨943, by decide +kernel⟩
    ⟨946, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨103, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨947, by decide +kernel⟩
    ⟨948, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2803, by decide +kernel⟩,
      ⟨2803, by decide +kernel⟩,
      ⟨2803, by decide +kernel⟩,
      ⟨2803, by decide +kernel⟩,
      ⟨2803, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨950, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨951, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨955, by decide +kernel⟩,
      ⟨955, by decide +kernel⟩,
      ⟨955, by decide +kernel⟩,
      ⟨955, by decide +kernel⟩,
      ⟨955, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨953, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨952, by decide +kernel⟩
    ⟨954, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2822, by decide +kernel⟩,
      ⟨2822, by decide +kernel⟩,
      ⟨2822, by decide +kernel⟩,
      ⟨2822, by decide +kernel⟩,
      ⟨2822, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨956, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨957, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨961, by decide +kernel⟩,
      ⟨961, by decide +kernel⟩,
      ⟨961, by decide +kernel⟩,
      ⟨961, by decide +kernel⟩,
      ⟨961, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_29_1 : source_29_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_29_1 := by
  decide +kernel
noncomputable def source_30_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0960
noncomputable def tables_30_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨959, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨958, by decide +kernel⟩
    ⟨960, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2828, by decide +kernel⟩,
      ⟨2828, by decide +kernel⟩,
      ⟨2828, by decide +kernel⟩,
      ⟨2828, by decide +kernel⟩,
      ⟨2828, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨962, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨963, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨964, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨968, by decide +kernel⟩,
      ⟨968, by decide +kernel⟩,
      ⟨968, by decide +kernel⟩,
      ⟨968, by decide +kernel⟩,
      ⟨968, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨966, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨965, by decide +kernel⟩
    ⟨967, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2838, by decide +kernel⟩,
      ⟨2838, by decide +kernel⟩,
      ⟨2838, by decide +kernel⟩,
      ⟨2838, by decide +kernel⟩,
      ⟨2838, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨969, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨969, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨971, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨972, by decide +kernel⟩,
  TableOp.marker
    ⟨970, by decide +kernel⟩
    ⟨973, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨104, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨974, by decide +kernel⟩
    ⟨975, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨957, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨980, by decide +kernel⟩,
      ⟨980, by decide +kernel⟩,
      ⟨980, by decide +kernel⟩,
      ⟨980, by decide +kernel⟩,
      ⟨980, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨978, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨977, by decide +kernel⟩
    ⟨979, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2852, by decide +kernel⟩,
      ⟨2852, by decide +kernel⟩,
      ⟨2852, by decide +kernel⟩,
      ⟨2852, by decide +kernel⟩,
      ⟨2852, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨981, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨981, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨983, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨984, by decide +kernel⟩,
  TableOp.marker
    ⟨982, by decide +kernel⟩
    ⟨985, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨106, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨986, by decide +kernel⟩
    ⟨987, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2846, by decide +kernel⟩,
      ⟨2846, by decide +kernel⟩,
      ⟨2846, by decide +kernel⟩,
      ⟨2846, by decide +kernel⟩,
      ⟨2846, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨989, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨990, by decide +kernel⟩
]
theorem fact_30_1 : source_30_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_30_1 := by
  decide +kernel
noncomputable def source_29_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_29_1 source_30_1
noncomputable def tables_29_2 : List (TableOp 4042) := tables_29_1 ++ tables_30_1
theorem fact_29_2 : source_29_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_29_2 :=
  source_tables_branch 32 source_29_1 source_30_1
    tables_29_1 tables_30_1 fact_29_1 fact_30_1
noncomputable def source_27_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_27_2 source_29_2
noncomputable def tables_27_4 : List (TableOp 4042) := tables_27_2 ++ tables_29_2
theorem fact_27_4 : source_27_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_27_4 :=
  source_tables_branch 64 source_27_2 source_29_2
    tables_27_2 tables_29_2 fact_27_2 fact_29_2
noncomputable def source_23_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_23_4 source_27_4
noncomputable def tables_23_8 : List (TableOp 4042) := tables_23_4 ++ tables_27_4
theorem fact_23_8 : source_23_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_23_8 :=
  source_tables_branch 128 source_23_4 source_27_4
    tables_23_4 tables_27_4 fact_23_4 fact_27_4
noncomputable def source_15_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_15_8 source_23_8
noncomputable def tables_15_16 : List (TableOp 4042) := tables_15_8 ++ tables_23_8
theorem fact_15_16 : source_15_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_15_16 :=
  source_tables_branch 256 source_15_8 source_23_8
    tables_15_8 tables_23_8 fact_15_8 fact_23_8
noncomputable def source_0_31 : Balanced.RowTree Snapshot.Entry :=
  .branch 480 source_0_15 source_15_16
noncomputable def tables_0_31 : List (TableOp 4042) := tables_0_15 ++ tables_15_16
theorem fact_0_31 : source_0_31.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_31 :=
  source_tables_branch 480 source_0_15 source_15_16
    tables_0_15 tables_15_16 fact_0_15 fact_15_16
noncomputable def source_31_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0992
noncomputable def tables_31_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨994, by decide +kernel⟩,
      ⟨994, by decide +kernel⟩,
      ⟨994, by decide +kernel⟩,
      ⟨994, by decide +kernel⟩,
      ⟨994, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨992, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨991, by decide +kernel⟩
    ⟨993, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2865, by decide +kernel⟩,
      ⟨2865, by decide +kernel⟩,
      ⟨2865, by decide +kernel⟩,
      ⟨2865, by decide +kernel⟩,
      ⟨2865, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨995, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨996, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1000, by decide +kernel⟩,
      ⟨1000, by decide +kernel⟩,
      ⟨1000, by decide +kernel⟩,
      ⟨1000, by decide +kernel⟩,
      ⟨1000, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨998, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨997, by decide +kernel⟩
    ⟨999, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2871, by decide +kernel⟩,
      ⟨2871, by decide +kernel⟩,
      ⟨2871, by decide +kernel⟩,
      ⟨2871, by decide +kernel⟩,
      ⟨2871, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1001, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1002, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1003, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1007, by decide +kernel⟩,
      ⟨1007, by decide +kernel⟩,
      ⟨1007, by decide +kernel⟩,
      ⟨1007, by decide +kernel⟩,
      ⟨1007, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1005, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1004, by decide +kernel⟩
    ⟨1006, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2881, by decide +kernel⟩,
      ⟨2881, by decide +kernel⟩,
      ⟨2881, by decide +kernel⟩,
      ⟨2881, by decide +kernel⟩,
      ⟨2881, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1008, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1008, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1010, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1011, by decide +kernel⟩,
  TableOp.marker
    ⟨1009, by decide +kernel⟩
    ⟨1012, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨107, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1013, by decide +kernel⟩
    ⟨1014, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨996, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1019, by decide +kernel⟩,
      ⟨1019, by decide +kernel⟩,
      ⟨1019, by decide +kernel⟩,
      ⟨1019, by decide +kernel⟩,
      ⟨1019, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1017, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1016, by decide +kernel⟩
    ⟨1018, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2895, by decide +kernel⟩,
      ⟨2895, by decide +kernel⟩,
      ⟨2895, by decide +kernel⟩,
      ⟨2895, by decide +kernel⟩,
      ⟨2895, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1020, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1020, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1022, by decide +kernel⟩
]
theorem fact_31_1 : source_31_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t32\t{now}"
      handle.flush
noncomputable def source_32_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1024
noncomputable def tables_32_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1023, by decide +kernel⟩,
  TableOp.marker
    ⟨1021, by decide +kernel⟩
    ⟨1024, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨109, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1025, by decide +kernel⟩
    ⟨1026, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2905, by decide +kernel⟩,
      ⟨2905, by decide +kernel⟩,
      ⟨2905, by decide +kernel⟩,
      ⟨2905, by decide +kernel⟩,
      ⟨2905, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1028, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1028, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1030, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1031, by decide +kernel⟩,
  TableOp.marker
    ⟨1029, by decide +kernel⟩
    ⟨1032, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨111, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1033, by decide +kernel⟩
    ⟨1034, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2915, by decide +kernel⟩,
      ⟨2915, by decide +kernel⟩,
      ⟨2915, by decide +kernel⟩,
      ⟨2915, by decide +kernel⟩,
      ⟨2915, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1036, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1036, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1038, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1039, by decide +kernel⟩,
  TableOp.marker
    ⟨1037, by decide +kernel⟩
    ⟨1040, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨112, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1041, by decide +kernel⟩
    ⟨1042, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2920, by decide +kernel⟩,
      ⟨2920, by decide +kernel⟩,
      ⟨2920, by decide +kernel⟩,
      ⟨2920, by decide +kernel⟩,
      ⟨2920, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1044, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1045, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨113, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1046, by decide +kernel⟩
    ⟨1047, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2935, by decide +kernel⟩,
      ⟨2935, by decide +kernel⟩,
      ⟨2935, by decide +kernel⟩,
      ⟨2935, by decide +kernel⟩,
      ⟨2935, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1049, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1049, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1051, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1052, by decide +kernel⟩,
  TableOp.marker
    ⟨1050, by decide +kernel⟩
    ⟨1053, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨117, by decide +kernel⟩
]
theorem fact_32_1 : source_32_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_32_1 := by
  decide +kernel
noncomputable def source_31_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_31_1 source_32_1
noncomputable def tables_31_2 : List (TableOp 4042) := tables_31_1 ++ tables_32_1
theorem fact_31_2 : source_31_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_2 :=
  source_tables_branch 32 source_31_1 source_32_1
    tables_31_1 tables_32_1 fact_31_1 fact_32_1
noncomputable def source_33_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1056
noncomputable def tables_33_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1054, by decide +kernel⟩
    ⟨1055, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2944, by decide +kernel⟩,
      ⟨2944, by decide +kernel⟩,
      ⟨2944, by decide +kernel⟩,
      ⟨2944, by decide +kernel⟩,
      ⟨2944, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1057, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1057, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1059, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1060, by decide +kernel⟩,
  TableOp.marker
    ⟨1058, by decide +kernel⟩
    ⟨1061, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨118, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1062, by decide +kernel⟩
    ⟨1063, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2941, by decide +kernel⟩,
      ⟨2941, by decide +kernel⟩,
      ⟨2941, by decide +kernel⟩,
      ⟨2941, by decide +kernel⟩,
      ⟨2941, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1065, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1066, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1070, by decide +kernel⟩,
      ⟨1070, by decide +kernel⟩,
      ⟨1070, by decide +kernel⟩,
      ⟨1070, by decide +kernel⟩,
      ⟨1070, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1068, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1067, by decide +kernel⟩
    ⟨1069, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2957, by decide +kernel⟩,
      ⟨2957, by decide +kernel⟩,
      ⟨2957, by decide +kernel⟩,
      ⟨2957, by decide +kernel⟩,
      ⟨2957, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1071, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1071, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1073, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1074, by decide +kernel⟩,
  TableOp.marker
    ⟨1072, by decide +kernel⟩
    ⟨1075, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨119, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1076, by decide +kernel⟩
    ⟨1077, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2962, by decide +kernel⟩,
      ⟨2962, by decide +kernel⟩,
      ⟨2962, by decide +kernel⟩,
      ⟨2962, by decide +kernel⟩,
      ⟨2962, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1079, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1080, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨120, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1081, by decide +kernel⟩
    ⟨1082, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2981, by decide +kernel⟩,
      ⟨2981, by decide +kernel⟩,
      ⟨2981, by decide +kernel⟩,
      ⟨2981, by decide +kernel⟩,
      ⟨2981, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1084, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1084, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1086, by decide +kernel⟩
]
theorem fact_33_1 : source_33_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_33_1 := by
  decide +kernel
noncomputable def source_34_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1088
noncomputable def tables_34_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1087, by decide +kernel⟩,
  TableOp.marker
    ⟨1085, by decide +kernel⟩
    ⟨1088, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨124, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1089, by decide +kernel⟩
    ⟨1090, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2974, by decide +kernel⟩,
      ⟨2974, by decide +kernel⟩,
      ⟨2974, by decide +kernel⟩,
      ⟨2974, by decide +kernel⟩,
      ⟨2974, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1092, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1093, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1097, by decide +kernel⟩,
      ⟨1097, by decide +kernel⟩,
      ⟨1097, by decide +kernel⟩,
      ⟨1097, by decide +kernel⟩,
      ⟨1097, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1095, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1094, by decide +kernel⟩
    ⟨1096, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2993, by decide +kernel⟩,
      ⟨2993, by decide +kernel⟩,
      ⟨2993, by decide +kernel⟩,
      ⟨2993, by decide +kernel⟩,
      ⟨2993, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1098, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1098, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1100, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1101, by decide +kernel⟩,
  TableOp.marker
    ⟨1099, by decide +kernel⟩
    ⟨1102, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨125, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1103, by decide +kernel⟩
    ⟨1104, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2987, by decide +kernel⟩,
      ⟨2987, by decide +kernel⟩,
      ⟨2987, by decide +kernel⟩,
      ⟨2987, by decide +kernel⟩,
      ⟨2987, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1106, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1107, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1111, by decide +kernel⟩,
      ⟨1111, by decide +kernel⟩,
      ⟨1111, by decide +kernel⟩,
      ⟨1111, by decide +kernel⟩,
      ⟨1111, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1109, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1108, by decide +kernel⟩
    ⟨1110, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3001, by decide +kernel⟩,
      ⟨3001, by decide +kernel⟩,
      ⟨3001, by decide +kernel⟩,
      ⟨3001, by decide +kernel⟩,
      ⟨3001, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1112, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1113, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1117, by decide +kernel⟩,
      ⟨1117, by decide +kernel⟩,
      ⟨1117, by decide +kernel⟩,
      ⟨1117, by decide +kernel⟩,
      ⟨1117, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1115, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1114, by decide +kernel⟩
    ⟨1116, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3003, by decide +kernel⟩,
      ⟨3003, by decide +kernel⟩,
      ⟨3003, by decide +kernel⟩,
      ⟨3003, by decide +kernel⟩,
      ⟨3003, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1118, by decide +kernel⟩
]
theorem fact_34_1 : source_34_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_34_1 := by
  decide +kernel
noncomputable def source_33_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_33_1 source_34_1
noncomputable def tables_33_2 : List (TableOp 4042) := tables_33_1 ++ tables_34_1
theorem fact_33_2 : source_33_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_33_2 :=
  source_tables_branch 32 source_33_1 source_34_1
    tables_33_1 tables_34_1 fact_33_1 fact_34_1
noncomputable def source_31_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_31_2 source_33_2
noncomputable def tables_31_4 : List (TableOp 4042) := tables_31_2 ++ tables_33_2
theorem fact_31_4 : source_31_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_4 :=
  source_tables_branch 64 source_31_2 source_33_2
    tables_31_2 tables_33_2 fact_31_2 fact_33_2
noncomputable def source_35_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1120
noncomputable def tables_35_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1119, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1123, by decide +kernel⟩,
      ⟨1123, by decide +kernel⟩,
      ⟨1123, by decide +kernel⟩,
      ⟨1123, by decide +kernel⟩,
      ⟨1123, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1121, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1120, by decide +kernel⟩
    ⟨1122, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3013, by decide +kernel⟩,
      ⟨3013, by decide +kernel⟩,
      ⟨3013, by decide +kernel⟩,
      ⟨3013, by decide +kernel⟩,
      ⟨3013, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1124, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1124, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1126, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1127, by decide +kernel⟩,
  TableOp.marker
    ⟨1125, by decide +kernel⟩
    ⟨1128, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨126, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1129, by decide +kernel⟩
    ⟨1130, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1113, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1135, by decide +kernel⟩,
      ⟨1135, by decide +kernel⟩,
      ⟨1135, by decide +kernel⟩,
      ⟨1135, by decide +kernel⟩,
      ⟨1135, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1133, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1132, by decide +kernel⟩
    ⟨1134, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3022, by decide +kernel⟩,
      ⟨3022, by decide +kernel⟩,
      ⟨3022, by decide +kernel⟩,
      ⟨3022, by decide +kernel⟩,
      ⟨3022, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1136, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1136, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1138, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1139, by decide +kernel⟩,
  TableOp.marker
    ⟨1137, by decide +kernel⟩
    ⟨1140, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨127, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1141, by decide +kernel⟩
    ⟨1142, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3032, by decide +kernel⟩,
      ⟨3032, by decide +kernel⟩,
      ⟨3032, by decide +kernel⟩,
      ⟨3032, by decide +kernel⟩,
      ⟨3032, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1144, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1144, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1146, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1147, by decide +kernel⟩,
  TableOp.marker
    ⟨1145, by decide +kernel⟩
    ⟨1148, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨128, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1149, by decide +kernel⟩
    ⟨1150, by decide +kernel⟩
]
theorem fact_35_1 : source_35_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_35_1 := by
  decide +kernel
noncomputable def source_36_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1152
noncomputable def tables_36_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3042, by decide +kernel⟩,
      ⟨3042, by decide +kernel⟩,
      ⟨3042, by decide +kernel⟩,
      ⟨3042, by decide +kernel⟩,
      ⟨3042, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1152, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1152, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1154, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1155, by decide +kernel⟩,
  TableOp.marker
    ⟨1153, by decide +kernel⟩
    ⟨1156, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨129, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1157, by decide +kernel⟩
    ⟨1158, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3048, by decide +kernel⟩,
      ⟨3048, by decide +kernel⟩,
      ⟨3048, by decide +kernel⟩,
      ⟨3048, by decide +kernel⟩,
      ⟨3048, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1160, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1160, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1162, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1163, by decide +kernel⟩,
  TableOp.marker
    ⟨1161, by decide +kernel⟩
    ⟨1164, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨130, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1165, by decide +kernel⟩
    ⟨1166, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2757, by decide +kernel⟩,
      ⟨2757, by decide +kernel⟩,
      ⟨2757, by decide +kernel⟩,
      ⟨2757, by decide +kernel⟩,
      ⟨2757, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1168, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1169, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1173, by decide +kernel⟩,
      ⟨1173, by decide +kernel⟩,
      ⟨1173, by decide +kernel⟩,
      ⟨1173, by decide +kernel⟩,
      ⟨1173, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1171, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1170, by decide +kernel⟩
    ⟨1172, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3061, by decide +kernel⟩,
      ⟨3061, by decide +kernel⟩,
      ⟨3061, by decide +kernel⟩,
      ⟨3061, by decide +kernel⟩,
      ⟨3061, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1174, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1174, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1176, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1177, by decide +kernel⟩,
  TableOp.marker
    ⟨1175, by decide +kernel⟩
    ⟨1178, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨131, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1179, by decide +kernel⟩
    ⟨1180, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3066, by decide +kernel⟩,
      ⟨3066, by decide +kernel⟩,
      ⟨3066, by decide +kernel⟩,
      ⟨3066, by decide +kernel⟩,
      ⟨3066, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1182, by decide +kernel⟩
]
theorem fact_36_1 : source_36_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_36_1 := by
  decide +kernel
noncomputable def source_35_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_35_1 source_36_1
noncomputable def tables_35_2 : List (TableOp 4042) := tables_35_1 ++ tables_36_1
theorem fact_35_2 : source_35_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_35_2 :=
  source_tables_branch 32 source_35_1 source_36_1
    tables_35_1 tables_36_1 fact_35_1 fact_36_1
noncomputable def source_37_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1184
noncomputable def tables_37_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1183, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨132, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1184, by decide +kernel⟩
    ⟨1185, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1183, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1190, by decide +kernel⟩,
      ⟨1190, by decide +kernel⟩,
      ⟨1190, by decide +kernel⟩,
      ⟨1190, by decide +kernel⟩,
      ⟨1190, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1188, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1187, by decide +kernel⟩
    ⟨1189, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3082, by decide +kernel⟩,
      ⟨3082, by decide +kernel⟩,
      ⟨3082, by decide +kernel⟩,
      ⟨3082, by decide +kernel⟩,
      ⟨3082, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1191, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1191, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1193, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1194, by decide +kernel⟩,
  TableOp.marker
    ⟨1192, by decide +kernel⟩
    ⟨1195, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨135, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1196, by decide +kernel⟩
    ⟨1197, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3087, by decide +kernel⟩,
      ⟨3087, by decide +kernel⟩,
      ⟨3087, by decide +kernel⟩,
      ⟨3087, by decide +kernel⟩,
      ⟨3087, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1199, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩
    ], rfl⟩
    ⟨1200, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨136, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1201, by decide +kernel⟩
    ⟨1202, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1200, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1207, by decide +kernel⟩,
      ⟨1207, by decide +kernel⟩,
      ⟨1207, by decide +kernel⟩,
      ⟨1207, by decide +kernel⟩,
      ⟨1207, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1205, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1204, by decide +kernel⟩
    ⟨1206, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3102, by decide +kernel⟩,
      ⟨3102, by decide +kernel⟩,
      ⟨3102, by decide +kernel⟩,
      ⟨3102, by decide +kernel⟩,
      ⟨3102, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1208, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1208, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1210, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1211, by decide +kernel⟩,
  TableOp.marker
    ⟨1209, by decide +kernel⟩
    ⟨1212, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨139, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1213, by decide +kernel⟩
    ⟨1214, by decide +kernel⟩
]
theorem fact_37_1 : source_37_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_37_1 := by
  decide +kernel
noncomputable def source_38_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1216
noncomputable def tables_38_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3096, by decide +kernel⟩,
      ⟨3096, by decide +kernel⟩,
      ⟨3096, by decide +kernel⟩,
      ⟨3096, by decide +kernel⟩,
      ⟨3096, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1216, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1217, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1221, by decide +kernel⟩,
      ⟨1221, by decide +kernel⟩,
      ⟨1221, by decide +kernel⟩,
      ⟨1221, by decide +kernel⟩,
      ⟨1221, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1219, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1218, by decide +kernel⟩
    ⟨1220, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3107, by decide +kernel⟩,
      ⟨3107, by decide +kernel⟩,
      ⟨3107, by decide +kernel⟩,
      ⟨3107, by decide +kernel⟩,
      ⟨3107, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1222, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1223, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1227, by decide +kernel⟩,
      ⟨1227, by decide +kernel⟩,
      ⟨1227, by decide +kernel⟩,
      ⟨1227, by decide +kernel⟩,
      ⟨1227, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1225, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1224, by decide +kernel⟩
    ⟨1226, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3117, by decide +kernel⟩,
      ⟨3117, by decide +kernel⟩,
      ⟨3117, by decide +kernel⟩,
      ⟨3117, by decide +kernel⟩,
      ⟨3117, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1228, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1228, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1230, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1231, by decide +kernel⟩,
  TableOp.marker
    ⟨1229, by decide +kernel⟩
    ⟨1232, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨140, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1233, by decide +kernel⟩
    ⟨1234, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3122, by decide +kernel⟩,
      ⟨3122, by decide +kernel⟩,
      ⟨3122, by decide +kernel⟩,
      ⟨3122, by decide +kernel⟩,
      ⟨3122, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1236, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1237, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨141, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1238, by decide +kernel⟩
    ⟨1239, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3130, by decide +kernel⟩,
      ⟨3130, by decide +kernel⟩,
      ⟨3130, by decide +kernel⟩,
      ⟨3130, by decide +kernel⟩,
      ⟨3130, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1241, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1242, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨144, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1243, by decide +kernel⟩
    ⟨1244, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1242, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1249, by decide +kernel⟩,
      ⟨1249, by decide +kernel⟩,
      ⟨1249, by decide +kernel⟩,
      ⟨1249, by decide +kernel⟩,
      ⟨1249, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_38_1 : source_38_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_38_1 := by
  decide +kernel
noncomputable def source_37_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_37_1 source_38_1
noncomputable def tables_37_2 : List (TableOp 4042) := tables_37_1 ++ tables_38_1
theorem fact_37_2 : source_37_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_37_2 :=
  source_tables_branch 32 source_37_1 source_38_1
    tables_37_1 tables_38_1 fact_37_1 fact_38_1
noncomputable def source_35_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_35_2 source_37_2
noncomputable def tables_35_4 : List (TableOp 4042) := tables_35_2 ++ tables_37_2
theorem fact_35_4 : source_35_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_35_4 :=
  source_tables_branch 64 source_35_2 source_37_2
    tables_35_2 tables_37_2 fact_35_2 fact_37_2
noncomputable def source_31_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_31_4 source_35_4
noncomputable def tables_31_8 : List (TableOp 4042) := tables_31_4 ++ tables_35_4
theorem fact_31_8 : source_31_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_8 :=
  source_tables_branch 128 source_31_4 source_35_4
    tables_31_4 tables_35_4 fact_31_4 fact_35_4
noncomputable def source_39_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1248
noncomputable def tables_39_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨1247, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1246, by decide +kernel⟩
    ⟨1248, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3146, by decide +kernel⟩,
      ⟨3146, by decide +kernel⟩,
      ⟨3146, by decide +kernel⟩,
      ⟨3146, by decide +kernel⟩,
      ⟨3146, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1250, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1250, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1252, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1253, by decide +kernel⟩,
  TableOp.marker
    ⟨1251, by decide +kernel⟩
    ⟨1254, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨147, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1255, by decide +kernel⟩
    ⟨1256, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3151, by decide +kernel⟩,
      ⟨3151, by decide +kernel⟩,
      ⟨3151, by decide +kernel⟩,
      ⟨3151, by decide +kernel⟩,
      ⟨3151, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1258, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1259, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨148, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1260, by decide +kernel⟩
    ⟨1261, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1259, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1266, by decide +kernel⟩,
      ⟨1266, by decide +kernel⟩,
      ⟨1266, by decide +kernel⟩,
      ⟨1266, by decide +kernel⟩,
      ⟨1266, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1264, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1263, by decide +kernel⟩
    ⟨1265, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3163, by decide +kernel⟩,
      ⟨3163, by decide +kernel⟩,
      ⟨3163, by decide +kernel⟩,
      ⟨3163, by decide +kernel⟩,
      ⟨3163, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1267, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1267, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1269, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1270, by decide +kernel⟩,
  TableOp.marker
    ⟨1268, by decide +kernel⟩
    ⟨1271, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨151, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1272, by decide +kernel⟩
    ⟨1273, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2800, by decide +kernel⟩,
      ⟨2800, by decide +kernel⟩,
      ⟨2800, by decide +kernel⟩,
      ⟨2800, by decide +kernel⟩,
      ⟨2800, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1275, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1276, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1280, by decide +kernel⟩,
      ⟨1280, by decide +kernel⟩,
      ⟨1280, by decide +kernel⟩,
      ⟨1280, by decide +kernel⟩,
      ⟨1280, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1278, by decide +kernel⟩
]
theorem fact_39_1 : source_39_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_39_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t40\t{now}"
      handle.flush
noncomputable def source_40_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1280
noncomputable def tables_40_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1277, by decide +kernel⟩
    ⟨1279, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3176, by decide +kernel⟩,
      ⟨3176, by decide +kernel⟩,
      ⟨3176, by decide +kernel⟩,
      ⟨3176, by decide +kernel⟩,
      ⟨3176, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1281, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1281, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1283, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1284, by decide +kernel⟩,
  TableOp.marker
    ⟨1282, by decide +kernel⟩
    ⟨1285, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨152, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1286, by decide +kernel⟩
    ⟨1287, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3181, by decide +kernel⟩,
      ⟨3181, by decide +kernel⟩,
      ⟨3181, by decide +kernel⟩,
      ⟨3181, by decide +kernel⟩,
      ⟨3181, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1289, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1290, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨153, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1291, by decide +kernel⟩
    ⟨1292, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1290, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1297, by decide +kernel⟩,
      ⟨1297, by decide +kernel⟩,
      ⟨1297, by decide +kernel⟩,
      ⟨1297, by decide +kernel⟩,
      ⟨1297, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1295, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1294, by decide +kernel⟩
    ⟨1296, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3196, by decide +kernel⟩,
      ⟨3196, by decide +kernel⟩,
      ⟨3196, by decide +kernel⟩,
      ⟨3196, by decide +kernel⟩,
      ⟨3196, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1298, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1298, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1300, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1301, by decide +kernel⟩,
  TableOp.marker
    ⟨1299, by decide +kernel⟩
    ⟨1302, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨156, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1303, by decide +kernel⟩
    ⟨1304, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3190, by decide +kernel⟩,
      ⟨3190, by decide +kernel⟩,
      ⟨3190, by decide +kernel⟩,
      ⟨3190, by decide +kernel⟩,
      ⟨3190, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1306, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1307, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1311, by decide +kernel⟩,
      ⟨1311, by decide +kernel⟩,
      ⟨1311, by decide +kernel⟩,
      ⟨1311, by decide +kernel⟩,
      ⟨1311, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1309, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1308, by decide +kernel⟩
    ⟨1310, by decide +kernel⟩
]
theorem fact_40_1 : source_40_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_40_1 := by
  decide +kernel
noncomputable def source_39_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_39_1 source_40_1
noncomputable def tables_39_2 : List (TableOp 4042) := tables_39_1 ++ tables_40_1
theorem fact_39_2 : source_39_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_39_2 :=
  source_tables_branch 32 source_39_1 source_40_1
    tables_39_1 tables_40_1 fact_39_1 fact_40_1
noncomputable def source_41_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1312
noncomputable def tables_41_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3209, by decide +kernel⟩,
      ⟨3209, by decide +kernel⟩,
      ⟨3209, by decide +kernel⟩,
      ⟨3209, by decide +kernel⟩,
      ⟨3209, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1312, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1312, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1314, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1315, by decide +kernel⟩,
  TableOp.marker
    ⟨1313, by decide +kernel⟩
    ⟨1316, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨157, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1317, by decide +kernel⟩
    ⟨1318, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3214, by decide +kernel⟩,
      ⟨3214, by decide +kernel⟩,
      ⟨3214, by decide +kernel⟩,
      ⟨3214, by decide +kernel⟩,
      ⟨3214, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1320, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1321, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨158, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1322, by decide +kernel⟩
    ⟨1323, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1321, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1328, by decide +kernel⟩,
      ⟨1328, by decide +kernel⟩,
      ⟨1328, by decide +kernel⟩,
      ⟨1328, by decide +kernel⟩,
      ⟨1328, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1326, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1325, by decide +kernel⟩
    ⟨1327, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3229, by decide +kernel⟩,
      ⟨3229, by decide +kernel⟩,
      ⟨3229, by decide +kernel⟩,
      ⟨3229, by decide +kernel⟩,
      ⟨3229, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1329, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1329, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1331, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1332, by decide +kernel⟩,
  TableOp.marker
    ⟨1330, by decide +kernel⟩
    ⟨1333, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨161, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1334, by decide +kernel⟩
    ⟨1335, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3223, by decide +kernel⟩,
      ⟨3223, by decide +kernel⟩,
      ⟨3223, by decide +kernel⟩,
      ⟨3223, by decide +kernel⟩,
      ⟨3223, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1337, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1338, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1342, by decide +kernel⟩,
      ⟨1342, by decide +kernel⟩,
      ⟨1342, by decide +kernel⟩,
      ⟨1342, by decide +kernel⟩,
      ⟨1342, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1340, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1339, by decide +kernel⟩
    ⟨1341, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3242, by decide +kernel⟩,
      ⟨3242, by decide +kernel⟩,
      ⟨3242, by decide +kernel⟩,
      ⟨3242, by decide +kernel⟩,
      ⟨3242, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_41_1 : source_41_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_41_1 := by
  decide +kernel
noncomputable def source_42_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1344
noncomputable def tables_42_1 : List (TableOp 4042) := [
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1343, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1343, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1345, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1346, by decide +kernel⟩,
  TableOp.marker
    ⟨1344, by decide +kernel⟩
    ⟨1347, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨162, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1348, by decide +kernel⟩
    ⟨1349, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3247, by decide +kernel⟩,
      ⟨3247, by decide +kernel⟩,
      ⟨3247, by decide +kernel⟩,
      ⟨3247, by decide +kernel⟩,
      ⟨3247, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1351, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1352, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨163, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1353, by decide +kernel⟩
    ⟨1354, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1352, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1359, by decide +kernel⟩,
      ⟨1359, by decide +kernel⟩,
      ⟨1359, by decide +kernel⟩,
      ⟨1359, by decide +kernel⟩,
      ⟨1359, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1357, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1356, by decide +kernel⟩
    ⟨1358, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3263, by decide +kernel⟩,
      ⟨3263, by decide +kernel⟩,
      ⟨3263, by decide +kernel⟩,
      ⟨3263, by decide +kernel⟩,
      ⟨3263, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1360, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1360, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1362, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1363, by decide +kernel⟩,
  TableOp.marker
    ⟨1361, by decide +kernel⟩
    ⟨1364, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨166, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1365, by decide +kernel⟩
    ⟨1366, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3268, by decide +kernel⟩,
      ⟨3268, by decide +kernel⟩,
      ⟨3268, by decide +kernel⟩,
      ⟨3268, by decide +kernel⟩,
      ⟨3268, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1368, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1369, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨167, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1370, by decide +kernel⟩
    ⟨1371, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3276, by decide +kernel⟩,
      ⟨3276, by decide +kernel⟩,
      ⟨3276, by decide +kernel⟩,
      ⟨3276, by decide +kernel⟩,
      ⟨3276, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1373, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1374, by decide +kernel⟩
]
theorem fact_42_1 : source_42_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_42_1 := by
  decide +kernel
noncomputable def source_41_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_41_1 source_42_1
noncomputable def tables_41_2 : List (TableOp 4042) := tables_41_1 ++ tables_42_1
theorem fact_41_2 : source_41_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_41_2 :=
  source_tables_branch 32 source_41_1 source_42_1
    tables_41_1 tables_42_1 fact_41_1 fact_42_1
noncomputable def source_39_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_39_2 source_41_2
noncomputable def tables_39_4 : List (TableOp 4042) := tables_39_2 ++ tables_41_2
theorem fact_39_4 : source_39_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_39_4 :=
  source_tables_branch 64 source_39_2 source_41_2
    tables_39_2 tables_41_2 fact_39_2 fact_41_2
noncomputable def source_43_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1376
noncomputable def tables_43_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨170, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1375, by decide +kernel⟩
    ⟨1376, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨378, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨173, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1378, by decide +kernel⟩
    ⟨1379, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2843, by decide +kernel⟩,
      ⟨2843, by decide +kernel⟩,
      ⟨2843, by decide +kernel⟩,
      ⟨2843, by decide +kernel⟩,
      ⟨2843, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1381, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1382, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1386, by decide +kernel⟩,
      ⟨1386, by decide +kernel⟩,
      ⟨1386, by decide +kernel⟩,
      ⟨1386, by decide +kernel⟩,
      ⟨1386, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1384, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1383, by decide +kernel⟩
    ⟨1385, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3297, by decide +kernel⟩,
      ⟨3297, by decide +kernel⟩,
      ⟨3297, by decide +kernel⟩,
      ⟨3297, by decide +kernel⟩,
      ⟨3297, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1387, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1388, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1392, by decide +kernel⟩,
      ⟨1392, by decide +kernel⟩,
      ⟨1392, by decide +kernel⟩,
      ⟨1392, by decide +kernel⟩,
      ⟨1392, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1390, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1389, by decide +kernel⟩
    ⟨1391, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3303, by decide +kernel⟩,
      ⟨3303, by decide +kernel⟩,
      ⟨3303, by decide +kernel⟩,
      ⟨3303, by decide +kernel⟩,
      ⟨3303, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1393, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1394, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1395, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1399, by decide +kernel⟩,
      ⟨1399, by decide +kernel⟩,
      ⟨1399, by decide +kernel⟩,
      ⟨1399, by decide +kernel⟩,
      ⟨1399, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1397, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1396, by decide +kernel⟩
    ⟨1398, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3313, by decide +kernel⟩,
      ⟨3313, by decide +kernel⟩,
      ⟨3313, by decide +kernel⟩,
      ⟨3313, by decide +kernel⟩,
      ⟨3313, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1400, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1400, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1402, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1403, by decide +kernel⟩,
  TableOp.marker
    ⟨1401, by decide +kernel⟩
    ⟨1404, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨175, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1405, by decide +kernel⟩
    ⟨1406, by decide +kernel⟩
]
theorem fact_43_1 : source_43_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_43_1 := by
  decide +kernel
noncomputable def source_44_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1408
noncomputable def tables_44_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3294, by decide +kernel⟩,
      ⟨3294, by decide +kernel⟩,
      ⟨3294, by decide +kernel⟩,
      ⟨3294, by decide +kernel⟩,
      ⟨3294, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1408, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1409, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1413, by decide +kernel⟩,
      ⟨1413, by decide +kernel⟩,
      ⟨1413, by decide +kernel⟩,
      ⟨1413, by decide +kernel⟩,
      ⟨1413, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1411, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1410, by decide +kernel⟩
    ⟨1412, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3326, by decide +kernel⟩,
      ⟨3326, by decide +kernel⟩,
      ⟨3326, by decide +kernel⟩,
      ⟨3326, by decide +kernel⟩,
      ⟨3326, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1414, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1414, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1416, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1417, by decide +kernel⟩,
  TableOp.marker
    ⟨1415, by decide +kernel⟩
    ⟨1418, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨176, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1419, by decide +kernel⟩
    ⟨1420, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3331, by decide +kernel⟩,
      ⟨3331, by decide +kernel⟩,
      ⟨3331, by decide +kernel⟩,
      ⟨3331, by decide +kernel⟩,
      ⟨3331, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1422, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1423, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨177, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1424, by decide +kernel⟩
    ⟨1425, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1423, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1430, by decide +kernel⟩,
      ⟨1430, by decide +kernel⟩,
      ⟨1430, by decide +kernel⟩,
      ⟨1430, by decide +kernel⟩,
      ⟨1430, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1428, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1427, by decide +kernel⟩
    ⟨1429, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3347, by decide +kernel⟩,
      ⟨3347, by decide +kernel⟩,
      ⟨3347, by decide +kernel⟩,
      ⟨3347, by decide +kernel⟩,
      ⟨3347, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1431, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1431, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1433, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1434, by decide +kernel⟩,
  TableOp.marker
    ⟨1432, by decide +kernel⟩
    ⟨1435, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨180, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1436, by decide +kernel⟩
    ⟨1437, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3353, by decide +kernel⟩,
      ⟨3353, by decide +kernel⟩,
      ⟨3353, by decide +kernel⟩,
      ⟨3353, by decide +kernel⟩,
      ⟨3353, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_44_1 : source_44_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_44_1 := by
  decide +kernel
noncomputable def source_43_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_43_1 source_44_1
noncomputable def tables_43_2 : List (TableOp 4042) := tables_43_1 ++ tables_44_1
theorem fact_43_2 : source_43_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_43_2 :=
  source_tables_branch 32 source_43_1 source_44_1
    tables_43_1 tables_44_1 fact_43_1 fact_44_1
noncomputable def source_45_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1440
noncomputable def tables_45_1 : List (TableOp 4042) := [
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1439, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1439, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1441, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1442, by decide +kernel⟩,
  TableOp.marker
    ⟨1440, by decide +kernel⟩
    ⟨1443, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨181, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1444, by decide +kernel⟩
    ⟨1445, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1388, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1450, by decide +kernel⟩,
      ⟨1450, by decide +kernel⟩,
      ⟨1450, by decide +kernel⟩,
      ⟨1450, by decide +kernel⟩,
      ⟨1450, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1448, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1447, by decide +kernel⟩
    ⟨1449, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3366, by decide +kernel⟩,
      ⟨3366, by decide +kernel⟩,
      ⟨3366, by decide +kernel⟩,
      ⟨3366, by decide +kernel⟩,
      ⟨3366, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1451, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1451, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1453, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1454, by decide +kernel⟩,
  TableOp.marker
    ⟨1452, by decide +kernel⟩
    ⟨1455, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨182, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1456, by decide +kernel⟩
    ⟨1457, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3374, by decide +kernel⟩,
      ⟨3374, by decide +kernel⟩,
      ⟨3374, by decide +kernel⟩,
      ⟨3374, by decide +kernel⟩,
      ⟨3374, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1459, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1459, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1461, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1462, by decide +kernel⟩,
  TableOp.marker
    ⟨1460, by decide +kernel⟩
    ⟨1463, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨183, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1464, by decide +kernel⟩
    ⟨1465, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3371, by decide +kernel⟩,
      ⟨3371, by decide +kernel⟩,
      ⟨3371, by decide +kernel⟩,
      ⟨3371, by decide +kernel⟩,
      ⟨3371, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1467, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1468, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1472, by decide +kernel⟩,
      ⟨1472, by decide +kernel⟩,
      ⟨1472, by decide +kernel⟩,
      ⟨1472, by decide +kernel⟩,
      ⟨1472, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1470, by decide +kernel⟩
]
theorem fact_45_1 : source_45_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_45_1 := by
  decide +kernel
noncomputable def source_46_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1472
noncomputable def tables_46_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1469, by decide +kernel⟩
    ⟨1471, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3383, by decide +kernel⟩,
      ⟨3383, by decide +kernel⟩,
      ⟨3383, by decide +kernel⟩,
      ⟨3383, by decide +kernel⟩,
      ⟨3383, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1473, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1473, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1475, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1476, by decide +kernel⟩,
  TableOp.marker
    ⟨1474, by decide +kernel⟩
    ⟨1477, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨184, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1478, by decide +kernel⟩
    ⟨1479, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2886, by decide +kernel⟩,
      ⟨2886, by decide +kernel⟩,
      ⟨2886, by decide +kernel⟩,
      ⟨2886, by decide +kernel⟩,
      ⟨2886, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1481, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1482, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1486, by decide +kernel⟩,
      ⟨1486, by decide +kernel⟩,
      ⟨1486, by decide +kernel⟩,
      ⟨1486, by decide +kernel⟩,
      ⟨1486, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1484, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1483, by decide +kernel⟩
    ⟨1485, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3396, by decide +kernel⟩,
      ⟨3396, by decide +kernel⟩,
      ⟨3396, by decide +kernel⟩,
      ⟨3396, by decide +kernel⟩,
      ⟨3396, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1487, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1487, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1489, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1490, by decide +kernel⟩,
  TableOp.marker
    ⟨1488, by decide +kernel⟩
    ⟨1491, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨185, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1492, by decide +kernel⟩
    ⟨1493, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3401, by decide +kernel⟩,
      ⟨3401, by decide +kernel⟩,
      ⟨3401, by decide +kernel⟩,
      ⟨3401, by decide +kernel⟩,
      ⟨3401, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1495, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1496, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨186, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1497, by decide +kernel⟩
    ⟨1498, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1496, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1503, by decide +kernel⟩,
      ⟨1503, by decide +kernel⟩,
      ⟨1503, by decide +kernel⟩,
      ⟨1503, by decide +kernel⟩,
      ⟨1503, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1501, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1500, by decide +kernel⟩
    ⟨1502, by decide +kernel⟩
]
theorem fact_46_1 : source_46_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_46_1 := by
  decide +kernel
noncomputable def source_45_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_45_1 source_46_1
noncomputable def tables_45_2 : List (TableOp 4042) := tables_45_1 ++ tables_46_1
theorem fact_45_2 : source_45_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_45_2 :=
  source_tables_branch 32 source_45_1 source_46_1
    tables_45_1 tables_46_1 fact_45_1 fact_46_1
noncomputable def source_43_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_43_2 source_45_2
noncomputable def tables_43_4 : List (TableOp 4042) := tables_43_2 ++ tables_45_2
theorem fact_43_4 : source_43_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_43_4 :=
  source_tables_branch 64 source_43_2 source_45_2
    tables_43_2 tables_45_2 fact_43_2 fact_45_2
noncomputable def source_39_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_39_4 source_43_4
noncomputable def tables_39_8 : List (TableOp 4042) := tables_39_4 ++ tables_43_4
theorem fact_39_8 : source_39_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_39_8 :=
  source_tables_branch 128 source_39_4 source_43_4
    tables_39_4 tables_43_4 fact_39_4 fact_43_4
noncomputable def source_31_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_31_8 source_39_8
noncomputable def tables_31_16 : List (TableOp 4042) := tables_31_8 ++ tables_39_8
theorem fact_31_16 : source_31_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_16 :=
  source_tables_branch 256 source_31_8 source_39_8
    tables_31_8 tables_39_8 fact_31_8 fact_39_8
noncomputable def source_47_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1504
noncomputable def tables_47_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3417, by decide +kernel⟩,
      ⟨3417, by decide +kernel⟩,
      ⟨3417, by decide +kernel⟩,
      ⟨3417, by decide +kernel⟩,
      ⟨3417, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1504, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1504, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1506, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1507, by decide +kernel⟩,
  TableOp.marker
    ⟨1505, by decide +kernel⟩
    ⟨1508, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨189, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1509, by decide +kernel⟩
    ⟨1510, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3426, by decide +kernel⟩,
      ⟨3426, by decide +kernel⟩,
      ⟨3426, by decide +kernel⟩,
      ⟨3426, by decide +kernel⟩,
      ⟨3426, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1512, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1512, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1514, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1515, by decide +kernel⟩,
  TableOp.marker
    ⟨1513, by decide +kernel⟩
    ⟨1516, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨190, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1517, by decide +kernel⟩
    ⟨1518, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3423, by decide +kernel⟩,
      ⟨3423, by decide +kernel⟩,
      ⟨3423, by decide +kernel⟩,
      ⟨3423, by decide +kernel⟩,
      ⟨3423, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1520, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1521, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1525, by decide +kernel⟩,
      ⟨1525, by decide +kernel⟩,
      ⟨1525, by decide +kernel⟩,
      ⟨1525, by decide +kernel⟩,
      ⟨1525, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1523, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1522, by decide +kernel⟩
    ⟨1524, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3439, by decide +kernel⟩,
      ⟨3439, by decide +kernel⟩,
      ⟨3439, by decide +kernel⟩,
      ⟨3439, by decide +kernel⟩,
      ⟨3439, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1526, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1526, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1528, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1529, by decide +kernel⟩,
  TableOp.marker
    ⟨1527, by decide +kernel⟩
    ⟨1530, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨191, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1531, by decide +kernel⟩
    ⟨1532, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3444, by decide +kernel⟩,
      ⟨3444, by decide +kernel⟩,
      ⟨3444, by decide +kernel⟩,
      ⟨3444, by decide +kernel⟩,
      ⟨3444, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1534, by decide +kernel⟩
]
theorem fact_47_1 : source_47_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_47_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t48\t{now}"
      handle.flush
noncomputable def source_48_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1536
noncomputable def tables_48_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1535, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨192, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1536, by decide +kernel⟩
    ⟨1537, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3452, by decide +kernel⟩,
      ⟨3452, by decide +kernel⟩,
      ⟨3452, by decide +kernel⟩,
      ⟨3452, by decide +kernel⟩,
      ⟨3452, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1539, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1540, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨195, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1541, by decide +kernel⟩
    ⟨1542, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1540, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1547, by decide +kernel⟩,
      ⟨1547, by decide +kernel⟩,
      ⟨1547, by decide +kernel⟩,
      ⟨1547, by decide +kernel⟩,
      ⟨1547, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1545, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1544, by decide +kernel⟩
    ⟨1546, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3460, by decide +kernel⟩,
      ⟨3460, by decide +kernel⟩,
      ⟨3460, by decide +kernel⟩,
      ⟨3460, by decide +kernel⟩,
      ⟨3460, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1548, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1549, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1553, by decide +kernel⟩,
      ⟨1553, by decide +kernel⟩,
      ⟨1553, by decide +kernel⟩,
      ⟨1553, by decide +kernel⟩,
      ⟨1553, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1551, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1550, by decide +kernel⟩
    ⟨1552, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3470, by decide +kernel⟩,
      ⟨3470, by decide +kernel⟩,
      ⟨3470, by decide +kernel⟩,
      ⟨3470, by decide +kernel⟩,
      ⟨3470, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1554, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1554, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1556, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1557, by decide +kernel⟩,
  TableOp.marker
    ⟨1555, by decide +kernel⟩
    ⟨1558, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨198, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1559, by decide +kernel⟩
    ⟨1560, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3475, by decide +kernel⟩,
      ⟨3475, by decide +kernel⟩,
      ⟨3475, by decide +kernel⟩,
      ⟨3475, by decide +kernel⟩,
      ⟨3475, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1562, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1563, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨199, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1564, by decide +kernel⟩
    ⟨1565, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3483, by decide +kernel⟩,
      ⟨3483, by decide +kernel⟩,
      ⟨3483, by decide +kernel⟩,
      ⟨3483, by decide +kernel⟩,
      ⟨3483, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_48_1 : source_48_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_48_1 := by
  decide +kernel
noncomputable def source_47_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_47_1 source_48_1
noncomputable def tables_47_2 : List (TableOp 4042) := tables_47_1 ++ tables_48_1
theorem fact_47_2 : source_47_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_47_2 :=
  source_tables_branch 32 source_47_1 source_48_1
    tables_47_1 tables_48_1 fact_47_1 fact_48_1
noncomputable def source_49_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1568
noncomputable def tables_49_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨1567, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1568, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨202, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1569, by decide +kernel⟩
    ⟨1570, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3491, by decide +kernel⟩,
      ⟨3491, by decide +kernel⟩,
      ⟨3491, by decide +kernel⟩,
      ⟨3491, by decide +kernel⟩,
      ⟨3491, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1572, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1573, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨205, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1574, by decide +kernel⟩
    ⟨1575, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨378, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨208, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1577, by decide +kernel⟩
    ⟨1578, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2928, by decide +kernel⟩,
      ⟨2928, by decide +kernel⟩,
      ⟨2928, by decide +kernel⟩,
      ⟨2928, by decide +kernel⟩,
      ⟨2928, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1580, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1581, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1585, by decide +kernel⟩,
      ⟨1585, by decide +kernel⟩,
      ⟨1585, by decide +kernel⟩,
      ⟨1585, by decide +kernel⟩,
      ⟨1585, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1583, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1582, by decide +kernel⟩
    ⟨1584, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3513, by decide +kernel⟩,
      ⟨3513, by decide +kernel⟩,
      ⟨3513, by decide +kernel⟩,
      ⟨3513, by decide +kernel⟩,
      ⟨3513, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1586, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1586, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1588, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1589, by decide +kernel⟩,
  TableOp.marker
    ⟨1587, by decide +kernel⟩
    ⟨1590, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨210, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1591, by decide +kernel⟩
    ⟨1592, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3518, by decide +kernel⟩,
      ⟨3518, by decide +kernel⟩,
      ⟨3518, by decide +kernel⟩,
      ⟨3518, by decide +kernel⟩,
      ⟨3518, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1594, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1595, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨211, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1596, by decide +kernel⟩
    ⟨1597, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1595, by decide +kernel⟩
]
theorem fact_49_1 : source_49_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_49_1 := by
  decide +kernel
noncomputable def source_50_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1600
noncomputable def tables_50_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1602, by decide +kernel⟩,
      ⟨1602, by decide +kernel⟩,
      ⟨1602, by decide +kernel⟩,
      ⟨1602, by decide +kernel⟩,
      ⟨1602, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1600, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1599, by decide +kernel⟩
    ⟨1601, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3533, by decide +kernel⟩,
      ⟨3533, by decide +kernel⟩,
      ⟨3533, by decide +kernel⟩,
      ⟨3533, by decide +kernel⟩,
      ⟨3533, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1603, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1603, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1605, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1606, by decide +kernel⟩,
  TableOp.marker
    ⟨1604, by decide +kernel⟩
    ⟨1607, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨214, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1608, by decide +kernel⟩
    ⟨1609, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3527, by decide +kernel⟩,
      ⟨3527, by decide +kernel⟩,
      ⟨3527, by decide +kernel⟩,
      ⟨3527, by decide +kernel⟩,
      ⟨3527, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1611, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1612, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1616, by decide +kernel⟩,
      ⟨1616, by decide +kernel⟩,
      ⟨1616, by decide +kernel⟩,
      ⟨1616, by decide +kernel⟩,
      ⟨1616, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1614, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1613, by decide +kernel⟩
    ⟨1615, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3546, by decide +kernel⟩,
      ⟨3546, by decide +kernel⟩,
      ⟨3546, by decide +kernel⟩,
      ⟨3546, by decide +kernel⟩,
      ⟨3546, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1617, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1618, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1622, by decide +kernel⟩,
      ⟨1622, by decide +kernel⟩,
      ⟨1622, by decide +kernel⟩,
      ⟨1622, by decide +kernel⟩,
      ⟨1622, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1620, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1619, by decide +kernel⟩
    ⟨1621, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3552, by decide +kernel⟩,
      ⟨3552, by decide +kernel⟩,
      ⟨3552, by decide +kernel⟩,
      ⟨3552, by decide +kernel⟩,
      ⟨3552, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1623, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1624, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1625, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1629, by decide +kernel⟩,
      ⟨1629, by decide +kernel⟩,
      ⟨1629, by decide +kernel⟩,
      ⟨1629, by decide +kernel⟩,
      ⟨1629, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1627, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1626, by decide +kernel⟩
    ⟨1628, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3562, by decide +kernel⟩,
      ⟨3562, by decide +kernel⟩,
      ⟨3562, by decide +kernel⟩,
      ⟨3562, by decide +kernel⟩,
      ⟨3562, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1630, by decide +kernel⟩
]
theorem fact_50_1 : source_50_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_50_1 := by
  decide +kernel
noncomputable def source_49_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_49_1 source_50_1
noncomputable def tables_49_2 : List (TableOp 4042) := tables_49_1 ++ tables_50_1
theorem fact_49_2 : source_49_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_49_2 :=
  source_tables_branch 32 source_49_1 source_50_1
    tables_49_1 tables_50_1 fact_49_1 fact_50_1
noncomputable def source_47_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_47_2 source_49_2
noncomputable def tables_47_4 : List (TableOp 4042) := tables_47_2 ++ tables_49_2
theorem fact_47_4 : source_47_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_47_4 :=
  source_tables_branch 64 source_47_2 source_49_2
    tables_47_2 tables_49_2 fact_47_2 fact_49_2
noncomputable def source_51_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1632
noncomputable def tables_51_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1630, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1632, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1633, by decide +kernel⟩,
  TableOp.marker
    ⟨1631, by decide +kernel⟩
    ⟨1634, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨215, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1635, by decide +kernel⟩
    ⟨1636, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1618, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1641, by decide +kernel⟩,
      ⟨1641, by decide +kernel⟩,
      ⟨1641, by decide +kernel⟩,
      ⟨1641, by decide +kernel⟩,
      ⟨1641, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1639, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1638, by decide +kernel⟩
    ⟨1640, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3580, by decide +kernel⟩,
      ⟨3580, by decide +kernel⟩,
      ⟨3580, by decide +kernel⟩,
      ⟨3580, by decide +kernel⟩,
      ⟨3580, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1642, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1642, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1644, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1645, by decide +kernel⟩,
  TableOp.marker
    ⟨1643, by decide +kernel⟩
    ⟨1646, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨218, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1647, by decide +kernel⟩
    ⟨1648, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3574, by decide +kernel⟩,
      ⟨3574, by decide +kernel⟩,
      ⟨3574, by decide +kernel⟩,
      ⟨3574, by decide +kernel⟩,
      ⟨3574, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1650, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1651, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1655, by decide +kernel⟩,
      ⟨1655, by decide +kernel⟩,
      ⟨1655, by decide +kernel⟩,
      ⟨1655, by decide +kernel⟩,
      ⟨1655, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1653, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1652, by decide +kernel⟩
    ⟨1654, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3593, by decide +kernel⟩,
      ⟨3593, by decide +kernel⟩,
      ⟨3593, by decide +kernel⟩,
      ⟨3593, by decide +kernel⟩,
      ⟨3593, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1656, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1657, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1661, by decide +kernel⟩,
      ⟨1661, by decide +kernel⟩,
      ⟨1661, by decide +kernel⟩,
      ⟨1661, by decide +kernel⟩,
      ⟨1661, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1659, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1658, by decide +kernel⟩
    ⟨1660, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3599, by decide +kernel⟩,
      ⟨3599, by decide +kernel⟩,
      ⟨3599, by decide +kernel⟩,
      ⟨3599, by decide +kernel⟩,
      ⟨3599, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1662, by decide +kernel⟩
]
theorem fact_51_1 : source_51_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_51_1 := by
  decide +kernel
noncomputable def source_52_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1664
noncomputable def tables_52_1 : List (TableOp 4042) := [
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1663, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1664, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1668, by decide +kernel⟩,
      ⟨1668, by decide +kernel⟩,
      ⟨1668, by decide +kernel⟩,
      ⟨1668, by decide +kernel⟩,
      ⟨1668, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1666, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1665, by decide +kernel⟩
    ⟨1667, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3609, by decide +kernel⟩,
      ⟨3609, by decide +kernel⟩,
      ⟨3609, by decide +kernel⟩,
      ⟨3609, by decide +kernel⟩,
      ⟨3609, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1669, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1669, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1671, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1672, by decide +kernel⟩,
  TableOp.marker
    ⟨1670, by decide +kernel⟩
    ⟨1673, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨219, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1674, by decide +kernel⟩
    ⟨1675, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1657, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1680, by decide +kernel⟩,
      ⟨1680, by decide +kernel⟩,
      ⟨1680, by decide +kernel⟩,
      ⟨1680, by decide +kernel⟩,
      ⟨1680, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1678, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1677, by decide +kernel⟩
    ⟨1679, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3623, by decide +kernel⟩,
      ⟨3623, by decide +kernel⟩,
      ⟨3623, by decide +kernel⟩,
      ⟨3623, by decide +kernel⟩,
      ⟨3623, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1681, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1681, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1683, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1684, by decide +kernel⟩,
  TableOp.marker
    ⟨1682, by decide +kernel⟩
    ⟨1685, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨221, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1686, by decide +kernel⟩
    ⟨1687, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3617, by decide +kernel⟩,
      ⟨3617, by decide +kernel⟩,
      ⟨3617, by decide +kernel⟩,
      ⟨3617, by decide +kernel⟩,
      ⟨3617, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1689, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1690, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1694, by decide +kernel⟩,
      ⟨1694, by decide +kernel⟩,
      ⟨1694, by decide +kernel⟩,
      ⟨1694, by decide +kernel⟩,
      ⟨1694, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1692, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1691, by decide +kernel⟩
    ⟨1693, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3636, by decide +kernel⟩,
      ⟨3636, by decide +kernel⟩,
      ⟨3636, by decide +kernel⟩,
      ⟨3636, by decide +kernel⟩,
      ⟨3636, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_52_1 : source_52_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_52_1 := by
  decide +kernel
noncomputable def source_51_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_51_1 source_52_1
noncomputable def tables_51_2 : List (TableOp 4042) := tables_51_1 ++ tables_52_1
theorem fact_51_2 : source_51_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_51_2 :=
  source_tables_branch 32 source_51_1 source_52_1
    tables_51_1 tables_52_1 fact_51_1 fact_52_1
noncomputable def source_53_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1696
noncomputable def tables_53_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨1695, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1696, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1700, by decide +kernel⟩,
      ⟨1700, by decide +kernel⟩,
      ⟨1700, by decide +kernel⟩,
      ⟨1700, by decide +kernel⟩,
      ⟨1700, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1698, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1697, by decide +kernel⟩
    ⟨1699, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3642, by decide +kernel⟩,
      ⟨3642, by decide +kernel⟩,
      ⟨3642, by decide +kernel⟩,
      ⟨3642, by decide +kernel⟩,
      ⟨3642, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1701, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1702, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1703, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1707, by decide +kernel⟩,
      ⟨1707, by decide +kernel⟩,
      ⟨1707, by decide +kernel⟩,
      ⟨1707, by decide +kernel⟩,
      ⟨1707, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1705, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1704, by decide +kernel⟩
    ⟨1706, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3652, by decide +kernel⟩,
      ⟨3652, by decide +kernel⟩,
      ⟨3652, by decide +kernel⟩,
      ⟨3652, by decide +kernel⟩,
      ⟨3652, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1708, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1708, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1710, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1711, by decide +kernel⟩,
  TableOp.marker
    ⟨1709, by decide +kernel⟩
    ⟨1712, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨222, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1713, by decide +kernel⟩
    ⟨1714, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1696, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1719, by decide +kernel⟩,
      ⟨1719, by decide +kernel⟩,
      ⟨1719, by decide +kernel⟩,
      ⟨1719, by decide +kernel⟩,
      ⟨1719, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1717, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1716, by decide +kernel⟩
    ⟨1718, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3666, by decide +kernel⟩,
      ⟨3666, by decide +kernel⟩,
      ⟨3666, by decide +kernel⟩,
      ⟨3666, by decide +kernel⟩,
      ⟨3666, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1720, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1720, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1722, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1723, by decide +kernel⟩,
  TableOp.marker
    ⟨1721, by decide +kernel⟩
    ⟨1724, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨224, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1725, by decide +kernel⟩
    ⟨1726, by decide +kernel⟩
]
theorem fact_53_1 : source_53_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_53_1 := by
  decide +kernel
noncomputable def source_54_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1728
noncomputable def tables_54_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3660, by decide +kernel⟩,
      ⟨3660, by decide +kernel⟩,
      ⟨3660, by decide +kernel⟩,
      ⟨3660, by decide +kernel⟩,
      ⟨3660, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1728, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1729, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1733, by decide +kernel⟩,
      ⟨1733, by decide +kernel⟩,
      ⟨1733, by decide +kernel⟩,
      ⟨1733, by decide +kernel⟩,
      ⟨1733, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1731, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1730, by decide +kernel⟩
    ⟨1732, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3679, by decide +kernel⟩,
      ⟨3679, by decide +kernel⟩,
      ⟨3679, by decide +kernel⟩,
      ⟨3679, by decide +kernel⟩,
      ⟨3679, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1734, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1735, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1739, by decide +kernel⟩,
      ⟨1739, by decide +kernel⟩,
      ⟨1739, by decide +kernel⟩,
      ⟨1739, by decide +kernel⟩,
      ⟨1739, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1737, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1736, by decide +kernel⟩
    ⟨1738, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3685, by decide +kernel⟩,
      ⟨3685, by decide +kernel⟩,
      ⟨3685, by decide +kernel⟩,
      ⟨3685, by decide +kernel⟩,
      ⟨3685, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1740, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1741, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1742, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1746, by decide +kernel⟩,
      ⟨1746, by decide +kernel⟩,
      ⟨1746, by decide +kernel⟩,
      ⟨1746, by decide +kernel⟩,
      ⟨1746, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1744, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1743, by decide +kernel⟩
    ⟨1745, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3695, by decide +kernel⟩,
      ⟨3695, by decide +kernel⟩,
      ⟨3695, by decide +kernel⟩,
      ⟨3695, by decide +kernel⟩,
      ⟨3695, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1747, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1747, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1749, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1750, by decide +kernel⟩,
  TableOp.marker
    ⟨1748, by decide +kernel⟩
    ⟨1751, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨225, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1752, by decide +kernel⟩
    ⟨1753, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1735, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1758, by decide +kernel⟩,
      ⟨1758, by decide +kernel⟩,
      ⟨1758, by decide +kernel⟩,
      ⟨1758, by decide +kernel⟩,
      ⟨1758, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1756, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1755, by decide +kernel⟩
    ⟨1757, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3707, by decide +kernel⟩,
      ⟨3707, by decide +kernel⟩,
      ⟨3707, by decide +kernel⟩,
      ⟨3707, by decide +kernel⟩,
      ⟨3707, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_54_1 : source_54_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_54_1 := by
  decide +kernel
noncomputable def source_53_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_53_1 source_54_1
noncomputable def tables_53_2 : List (TableOp 4042) := tables_53_1 ++ tables_54_1
theorem fact_53_2 : source_53_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_53_2 :=
  source_tables_branch 32 source_53_1 source_54_1
    tables_53_1 tables_54_1 fact_53_1 fact_54_1
noncomputable def source_51_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_51_2 source_53_2
noncomputable def tables_51_4 : List (TableOp 4042) := tables_51_2 ++ tables_53_2
theorem fact_51_4 : source_51_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_51_4 :=
  source_tables_branch 64 source_51_2 source_53_2
    tables_51_2 tables_53_2 fact_51_2 fact_53_2
noncomputable def source_47_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_47_4 source_51_4
noncomputable def tables_47_8 : List (TableOp 4042) := tables_47_4 ++ tables_51_4
theorem fact_47_8 : source_47_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_47_8 :=
  source_tables_branch 128 source_47_4 source_51_4
    tables_47_4 tables_51_4 fact_47_4 fact_51_4
noncomputable def source_55_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1760
noncomputable def tables_55_1 : List (TableOp 4042) := [
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1759, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1759, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1761, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1762, by decide +kernel⟩,
  TableOp.marker
    ⟨1760, by decide +kernel⟩
    ⟨1763, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨227, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1764, by decide +kernel⟩
    ⟨1765, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3701, by decide +kernel⟩,
      ⟨3701, by decide +kernel⟩,
      ⟨3701, by decide +kernel⟩,
      ⟨3701, by decide +kernel⟩,
      ⟨3701, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1767, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1768, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1772, by decide +kernel⟩,
      ⟨1772, by decide +kernel⟩,
      ⟨1772, by decide +kernel⟩,
      ⟨1772, by decide +kernel⟩,
      ⟨1772, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1770, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1769, by decide +kernel⟩
    ⟨1771, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3724, by decide +kernel⟩,
      ⟨3724, by decide +kernel⟩,
      ⟨3724, by decide +kernel⟩,
      ⟨3724, by decide +kernel⟩,
      ⟨3724, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1773, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1773, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1775, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1776, by decide +kernel⟩,
  TableOp.marker
    ⟨1774, by decide +kernel⟩
    ⟨1777, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨228, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1778, by decide +kernel⟩
    ⟨1779, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3614, by decide +kernel⟩,
      ⟨3614, by decide +kernel⟩,
      ⟨3614, by decide +kernel⟩,
      ⟨3614, by decide +kernel⟩,
      ⟨3614, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1781, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1782, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1786, by decide +kernel⟩,
      ⟨1786, by decide +kernel⟩,
      ⟨1786, by decide +kernel⟩,
      ⟨1786, by decide +kernel⟩,
      ⟨1786, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1784, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1783, by decide +kernel⟩
    ⟨1785, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3739, by decide +kernel⟩,
      ⟨3739, by decide +kernel⟩,
      ⟨3739, by decide +kernel⟩,
      ⟨3739, by decide +kernel⟩,
      ⟨3739, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1787, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1787, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1789, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1790, by decide +kernel⟩
]
theorem fact_55_1 : source_55_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_55_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t56\t{now}"
      handle.flush
noncomputable def source_56_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1792
noncomputable def tables_56_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨1788, by decide +kernel⟩
    ⟨1791, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨230, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1792, by decide +kernel⟩
    ⟨1793, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3744, by decide +kernel⟩,
      ⟨3744, by decide +kernel⟩,
      ⟨3744, by decide +kernel⟩,
      ⟨3744, by decide +kernel⟩,
      ⟨3744, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1795, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1796, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨231, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1797, by decide +kernel⟩
    ⟨1798, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3763, by decide +kernel⟩,
      ⟨3763, by decide +kernel⟩,
      ⟨3763, by decide +kernel⟩,
      ⟨3763, by decide +kernel⟩,
      ⟨3763, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1800, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1800, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1802, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1803, by decide +kernel⟩,
  TableOp.marker
    ⟨1801, by decide +kernel⟩
    ⟨1804, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨235, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1805, by decide +kernel⟩
    ⟨1806, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3756, by decide +kernel⟩,
      ⟨3756, by decide +kernel⟩,
      ⟨3756, by decide +kernel⟩,
      ⟨3756, by decide +kernel⟩,
      ⟨3756, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1808, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1809, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1813, by decide +kernel⟩,
      ⟨1813, by decide +kernel⟩,
      ⟨1813, by decide +kernel⟩,
      ⟨1813, by decide +kernel⟩,
      ⟨1813, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1811, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1810, by decide +kernel⟩
    ⟨1812, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3775, by decide +kernel⟩,
      ⟨3775, by decide +kernel⟩,
      ⟨3775, by decide +kernel⟩,
      ⟨3775, by decide +kernel⟩,
      ⟨3775, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1814, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1814, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1816, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1817, by decide +kernel⟩,
  TableOp.marker
    ⟨1815, by decide +kernel⟩
    ⟨1818, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨236, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1819, by decide +kernel⟩
    ⟨1820, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3769, by decide +kernel⟩,
      ⟨3769, by decide +kernel⟩,
      ⟨3769, by decide +kernel⟩,
      ⟨3769, by decide +kernel⟩,
      ⟨3769, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1822, by decide +kernel⟩
]
theorem fact_56_1 : source_56_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_56_1 := by
  decide +kernel
noncomputable def source_55_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_55_1 source_56_1
noncomputable def tables_55_2 : List (TableOp 4042) := tables_55_1 ++ tables_56_1
theorem fact_55_2 : source_55_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_55_2 :=
  source_tables_branch 32 source_55_1 source_56_1
    tables_55_1 tables_56_1 fact_55_1 fact_56_1
noncomputable def source_57_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1824
noncomputable def tables_57_1 : List (TableOp 4042) := [
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1823, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1827, by decide +kernel⟩,
      ⟨1827, by decide +kernel⟩,
      ⟨1827, by decide +kernel⟩,
      ⟨1827, by decide +kernel⟩,
      ⟨1827, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1825, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1824, by decide +kernel⟩
    ⟨1826, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3788, by decide +kernel⟩,
      ⟨3788, by decide +kernel⟩,
      ⟨3788, by decide +kernel⟩,
      ⟨3788, by decide +kernel⟩,
      ⟨3788, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1828, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1828, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1830, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1831, by decide +kernel⟩,
  TableOp.marker
    ⟨1829, by decide +kernel⟩
    ⟨1832, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨237, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1833, by decide +kernel⟩
    ⟨1834, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3793, by decide +kernel⟩,
      ⟨3793, by decide +kernel⟩,
      ⟨3793, by decide +kernel⟩,
      ⟨3793, by decide +kernel⟩,
      ⟨3793, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1836, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1837, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨238, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1838, by decide +kernel⟩
    ⟨1839, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1837, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1844, by decide +kernel⟩,
      ⟨1844, by decide +kernel⟩,
      ⟨1844, by decide +kernel⟩,
      ⟨1844, by decide +kernel⟩,
      ⟨1844, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1842, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1841, by decide +kernel⟩
    ⟨1843, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3808, by decide +kernel⟩,
      ⟨3808, by decide +kernel⟩,
      ⟨3808, by decide +kernel⟩,
      ⟨3808, by decide +kernel⟩,
      ⟨3808, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1845, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1845, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1847, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1848, by decide +kernel⟩,
  TableOp.marker
    ⟨1846, by decide +kernel⟩
    ⟨1849, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨241, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1850, by decide +kernel⟩
    ⟨1851, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3802, by decide +kernel⟩,
      ⟨3802, by decide +kernel⟩,
      ⟨3802, by decide +kernel⟩,
      ⟨3802, by decide +kernel⟩,
      ⟨3802, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1853, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1854, by decide +kernel⟩
]
theorem fact_57_1 : source_57_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_57_1 := by
  decide +kernel
noncomputable def source_58_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1856
noncomputable def tables_58_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨1858, by decide +kernel⟩,
      ⟨1858, by decide +kernel⟩,
      ⟨1858, by decide +kernel⟩,
      ⟨1858, by decide +kernel⟩,
      ⟨1858, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1856, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1855, by decide +kernel⟩
    ⟨1857, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3821, by decide +kernel⟩,
      ⟨3821, by decide +kernel⟩,
      ⟨3821, by decide +kernel⟩,
      ⟨3821, by decide +kernel⟩,
      ⟨3821, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1859, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1859, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1861, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1862, by decide +kernel⟩,
  TableOp.marker
    ⟨1860, by decide +kernel⟩
    ⟨1863, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨242, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1864, by decide +kernel⟩
    ⟨1865, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3826, by decide +kernel⟩,
      ⟨3826, by decide +kernel⟩,
      ⟨3826, by decide +kernel⟩,
      ⟨3826, by decide +kernel⟩,
      ⟨3826, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1867, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1868, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨243, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1869, by decide +kernel⟩
    ⟨1870, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1868, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1875, by decide +kernel⟩,
      ⟨1875, by decide +kernel⟩,
      ⟨1875, by decide +kernel⟩,
      ⟨1875, by decide +kernel⟩,
      ⟨1875, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1873, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1872, by decide +kernel⟩
    ⟨1874, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3842, by decide +kernel⟩,
      ⟨3842, by decide +kernel⟩,
      ⟨3842, by decide +kernel⟩,
      ⟨3842, by decide +kernel⟩,
      ⟨3842, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1876, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1876, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1878, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1879, by decide +kernel⟩,
  TableOp.marker
    ⟨1877, by decide +kernel⟩
    ⟨1880, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨246, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1881, by decide +kernel⟩
    ⟨1882, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3851, by decide +kernel⟩,
      ⟨3851, by decide +kernel⟩,
      ⟨3851, by decide +kernel⟩,
      ⟨3851, by decide +kernel⟩,
      ⟨3851, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1884, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1884, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1886, by decide +kernel⟩
]
theorem fact_58_1 : source_58_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_58_1 := by
  decide +kernel
noncomputable def source_57_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_57_1 source_58_1
noncomputable def tables_57_2 : List (TableOp 4042) := tables_57_1 ++ tables_58_1
theorem fact_57_2 : source_57_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_57_2 :=
  source_tables_branch 32 source_57_1 source_58_1
    tables_57_1 tables_58_1 fact_57_1 fact_58_1
noncomputable def source_55_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_55_2 source_57_2
noncomputable def tables_55_4 : List (TableOp 4042) := tables_55_2 ++ tables_57_2
theorem fact_55_4 : source_55_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_55_4 :=
  source_tables_branch 64 source_55_2 source_57_2
    tables_55_2 tables_57_2 fact_55_2 fact_57_2
noncomputable def source_59_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1888
noncomputable def tables_59_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1887, by decide +kernel⟩,
  TableOp.marker
    ⟨1885, by decide +kernel⟩
    ⟨1888, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨247, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1889, by decide +kernel⟩
    ⟨1890, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3848, by decide +kernel⟩,
      ⟨3848, by decide +kernel⟩,
      ⟨3848, by decide +kernel⟩,
      ⟨3848, by decide +kernel⟩,
      ⟨3848, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1892, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1893, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1897, by decide +kernel⟩,
      ⟨1897, by decide +kernel⟩,
      ⟨1897, by decide +kernel⟩,
      ⟨1897, by decide +kernel⟩,
      ⟨1897, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1895, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1894, by decide +kernel⟩
    ⟨1896, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3864, by decide +kernel⟩,
      ⟨3864, by decide +kernel⟩,
      ⟨3864, by decide +kernel⟩,
      ⟨3864, by decide +kernel⟩,
      ⟨3864, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1898, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1898, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1900, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1901, by decide +kernel⟩,
  TableOp.marker
    ⟨1899, by decide +kernel⟩
    ⟨1902, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨248, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1903, by decide +kernel⟩
    ⟨1904, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3869, by decide +kernel⟩,
      ⟨3869, by decide +kernel⟩,
      ⟨3869, by decide +kernel⟩,
      ⟨3869, by decide +kernel⟩,
      ⟨3869, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1906, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1907, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨249, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1908, by decide +kernel⟩
    ⟨1909, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1907, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1914, by decide +kernel⟩,
      ⟨1914, by decide +kernel⟩,
      ⟨1914, by decide +kernel⟩,
      ⟨1914, by decide +kernel⟩,
      ⟨1914, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1912, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1911, by decide +kernel⟩
    ⟨1913, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3884, by decide +kernel⟩,
      ⟨3884, by decide +kernel⟩,
      ⟨3884, by decide +kernel⟩,
      ⟨3884, by decide +kernel⟩,
      ⟨3884, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1915, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1915, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1917, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1918, by decide +kernel⟩
]
theorem fact_59_1 : source_59_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_59_1 := by
  decide +kernel
noncomputable def source_60_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1920
noncomputable def tables_60_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨1916, by decide +kernel⟩
    ⟨1919, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨252, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1920, by decide +kernel⟩
    ⟨1921, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3878, by decide +kernel⟩,
      ⟨3878, by decide +kernel⟩,
      ⟨3878, by decide +kernel⟩,
      ⟨3878, by decide +kernel⟩,
      ⟨3878, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1923, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1924, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1928, by decide +kernel⟩,
      ⟨1928, by decide +kernel⟩,
      ⟨1928, by decide +kernel⟩,
      ⟨1928, by decide +kernel⟩,
      ⟨1928, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1926, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1925, by decide +kernel⟩
    ⟨1927, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3897, by decide +kernel⟩,
      ⟨3897, by decide +kernel⟩,
      ⟨3897, by decide +kernel⟩,
      ⟨3897, by decide +kernel⟩,
      ⟨3897, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1929, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1929, by decide +kernel⟩,
  TableOp.load
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1931, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1932, by decide +kernel⟩,
  TableOp.marker
    ⟨1930, by decide +kernel⟩
    ⟨1933, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨253, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨1934, by decide +kernel⟩
    ⟨1935, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3902, by decide +kernel⟩,
      ⟨3902, by decide +kernel⟩,
      ⟨3902, by decide +kernel⟩,
      ⟨3902, by decide +kernel⟩,
      ⟨3902, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1937, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1938, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨254, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1939, by decide +kernel⟩
    ⟨1940, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1938, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1945, by decide +kernel⟩,
      ⟨1945, by decide +kernel⟩,
      ⟨1945, by decide +kernel⟩,
      ⟨1945, by decide +kernel⟩,
      ⟨1945, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1943, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1942, by decide +kernel⟩
    ⟨1944, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3918, by decide +kernel⟩,
      ⟨3918, by decide +kernel⟩,
      ⟨3918, by decide +kernel⟩,
      ⟨3918, by decide +kernel⟩,
      ⟨3918, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1946, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1946, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1948, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1949, by decide +kernel⟩,
  TableOp.marker
    ⟨1947, by decide +kernel⟩
    ⟨1950, by decide +kernel⟩
]
theorem fact_60_1 : source_60_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_60_1 := by
  decide +kernel
noncomputable def source_59_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_59_1 source_60_1
noncomputable def tables_59_2 : List (TableOp 4042) := tables_59_1 ++ tables_60_1
theorem fact_59_2 : source_59_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_59_2 :=
  source_tables_branch 32 source_59_1 source_60_1
    tables_59_1 tables_60_1 fact_59_1 fact_60_1
noncomputable def source_61_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1952
noncomputable def tables_61_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨257, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1951, by decide +kernel⟩
    ⟨1952, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3923, by decide +kernel⟩,
      ⟨3923, by decide +kernel⟩,
      ⟨3923, by decide +kernel⟩,
      ⟨3923, by decide +kernel⟩,
      ⟨3923, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1954, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1955, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨258, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1956, by decide +kernel⟩
    ⟨1957, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1573, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨261, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1959, by decide +kernel⟩
    ⟨1960, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3657, by decide +kernel⟩,
      ⟨3657, by decide +kernel⟩,
      ⟨3657, by decide +kernel⟩,
      ⟨3657, by decide +kernel⟩,
      ⟨3657, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1962, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1963, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1967, by decide +kernel⟩,
      ⟨1967, by decide +kernel⟩,
      ⟨1967, by decide +kernel⟩,
      ⟨1967, by decide +kernel⟩,
      ⟨1967, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1965, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1964, by decide +kernel⟩
    ⟨1966, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3945, by decide +kernel⟩,
      ⟨3945, by decide +kernel⟩,
      ⟨3945, by decide +kernel⟩,
      ⟨3945, by decide +kernel⟩,
      ⟨3945, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1968, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1968, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1970, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1971, by decide +kernel⟩,
  TableOp.marker
    ⟨1969, by decide +kernel⟩
    ⟨1972, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨263, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨1973, by decide +kernel⟩
    ⟨1974, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨1113, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨264, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1976, by decide +kernel⟩
    ⟨1977, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3729, by decide +kernel⟩,
      ⟨3729, by decide +kernel⟩,
      ⟨3729, by decide +kernel⟩,
      ⟨3729, by decide +kernel⟩,
      ⟨3729, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1979, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1980, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1984, by decide +kernel⟩,
      ⟨1984, by decide +kernel⟩,
      ⟨1984, by decide +kernel⟩,
      ⟨1984, by decide +kernel⟩,
      ⟨1984, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1982, by decide +kernel⟩
]
theorem fact_61_1 : source_61_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_61_1 := by
  decide +kernel
noncomputable def source_62_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1984
noncomputable def tables_62_1 : List (TableOp 4042) := [
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1981, by decide +kernel⟩
    ⟨1983, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3964, by decide +kernel⟩,
      ⟨3964, by decide +kernel⟩,
      ⟨3964, by decide +kernel⟩,
      ⟨3964, by decide +kernel⟩,
      ⟨3964, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1985, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩
    ], rfl⟩
    ⟨1986, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1990, by decide +kernel⟩,
      ⟨1990, by decide +kernel⟩,
      ⟨1990, by decide +kernel⟩,
      ⟨1990, by decide +kernel⟩,
      ⟨1990, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1988, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨1987, by decide +kernel⟩
    ⟨1989, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3970, by decide +kernel⟩,
      ⟨3970, by decide +kernel⟩,
      ⟨3970, by decide +kernel⟩,
      ⟨3970, by decide +kernel⟩,
      ⟨3970, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1991, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨1992, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1993, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨1997, by decide +kernel⟩,
      ⟨1997, by decide +kernel⟩,
      ⟨1997, by decide +kernel⟩,
      ⟨1997, by decide +kernel⟩,
      ⟨1997, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨1995, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨1994, by decide +kernel⟩
    ⟨1996, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3980, by decide +kernel⟩,
      ⟨3980, by decide +kernel⟩,
      ⟨3980, by decide +kernel⟩,
      ⟨3980, by decide +kernel⟩,
      ⟨3980, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1998, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨1998, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2000, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2001, by decide +kernel⟩,
  TableOp.marker
    ⟨1999, by decide +kernel⟩
    ⟨2002, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨267, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨2003, by decide +kernel⟩
    ⟨2004, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3986, by decide +kernel⟩,
      ⟨3986, by decide +kernel⟩,
      ⟨3986, by decide +kernel⟩,
      ⟨3986, by decide +kernel⟩,
      ⟨3986, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2006, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2006, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2008, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2009, by decide +kernel⟩,
  TableOp.marker
    ⟨2007, by decide +kernel⟩
    ⟨2010, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨268, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨2011, by decide +kernel⟩
    ⟨2012, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨1986, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2017, by decide +kernel⟩,
      ⟨2017, by decide +kernel⟩,
      ⟨2017, by decide +kernel⟩,
      ⟨2017, by decide +kernel⟩,
      ⟨2017, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_62_1 : source_62_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_62_1 := by
  decide +kernel
noncomputable def source_61_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_61_1 source_62_1
noncomputable def tables_61_2 : List (TableOp 4042) := tables_61_1 ++ tables_62_1
theorem fact_61_2 : source_61_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_61_2 :=
  source_tables_branch 32 source_61_1 source_62_1
    tables_61_1 tables_62_1 fact_61_1 fact_62_1
noncomputable def source_59_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_59_2 source_61_2
noncomputable def tables_59_4 : List (TableOp 4042) := tables_59_2 ++ tables_61_2
theorem fact_59_4 : source_59_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_59_4 :=
  source_tables_branch 64 source_59_2 source_61_2
    tables_59_2 tables_61_2 fact_59_2 fact_61_2
noncomputable def source_55_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_55_4 source_59_4
noncomputable def tables_55_8 : List (TableOp 4042) := tables_55_4 ++ tables_59_4
theorem fact_55_8 : source_55_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_55_8 :=
  source_tables_branch 128 source_55_4 source_59_4
    tables_55_4 tables_59_4 fact_55_4 fact_59_4
noncomputable def source_47_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_47_8 source_55_8
noncomputable def tables_47_16 : List (TableOp 4042) := tables_47_8 ++ tables_55_8
theorem fact_47_16 : source_47_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_47_16 :=
  source_tables_branch 256 source_47_8 source_55_8
    tables_47_8 tables_55_8 fact_47_8 fact_55_8
noncomputable def source_31_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_31_16 source_47_16
noncomputable def tables_31_32 : List (TableOp 4042) := tables_31_16 ++ tables_47_16
theorem fact_31_32 : source_31_32.flatten.map
    (fun row ↦ toTableOp row.1) = tables_31_32 :=
  source_tables_branch 512 source_31_16 source_47_16
    tables_31_16 tables_47_16 fact_31_16 fact_47_16
noncomputable def source_0_63 : Balanced.RowTree Snapshot.Entry :=
  .branch 992 source_0_31 source_31_32
noncomputable def tables_0_63 : List (TableOp 4042) := tables_0_31 ++ tables_31_32
theorem fact_0_63 : source_0_63.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_63 :=
  source_tables_branch 992 source_0_31 source_31_32
    tables_0_31 tables_31_32 fact_0_31 fact_31_32
noncomputable def source_63_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2016
noncomputable def tables_63_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.right
    ⟨2015, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨2014, by decide +kernel⟩
    ⟨2016, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3999, by decide +kernel⟩,
      ⟨3999, by decide +kernel⟩,
      ⟨3999, by decide +kernel⟩,
      ⟨3999, by decide +kernel⟩,
      ⟨3999, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2018, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2018, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2020, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2021, by decide +kernel⟩,
  TableOp.marker
    ⟨2019, by decide +kernel⟩
    ⟨2022, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨269, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨2023, by decide +kernel⟩
    ⟨2024, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4008, by decide +kernel⟩,
      ⟨4008, by decide +kernel⟩,
      ⟨4008, by decide +kernel⟩,
      ⟨4008, by decide +kernel⟩,
      ⟨4008, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2026, by decide +kernel⟩,
  TableOp.write
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2026, by decide +kernel⟩,
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2028, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2029, by decide +kernel⟩,
  TableOp.marker
    ⟨2027, by decide +kernel⟩
    ⟨2030, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨270, by decide +kernel⟩,
  TableOp.absent
    ⟨0, by decide +kernel⟩
    ⟨2031, by decide +kernel⟩
    ⟨2032, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4005, by decide +kernel⟩,
      ⟨4005, by decide +kernel⟩,
      ⟨4005, by decide +kernel⟩,
      ⟨4005, by decide +kernel⟩,
      ⟨4005, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨2034, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨2035, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2039, by decide +kernel⟩,
      ⟨2039, by decide +kernel⟩,
      ⟨2039, by decide +kernel⟩,
      ⟨2039, by decide +kernel⟩,
      ⟨2039, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨2037, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨2036, by decide +kernel⟩
    ⟨2038, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4021, by decide +kernel⟩,
      ⟨4021, by decide +kernel⟩,
      ⟨4021, by decide +kernel⟩,
      ⟨4021, by decide +kernel⟩,
      ⟨4021, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2040, by decide +kernel⟩,
  TableOp.write
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2040, by decide +kernel⟩,
  TableOp.load
    ⟨3, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2042, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2043, by decide +kernel⟩,
  TableOp.marker
    ⟨2041, by decide +kernel⟩
    ⟨2044, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨271, by decide +kernel⟩,
  TableOp.absent
    ⟨3, by decide +kernel⟩
    ⟨2045, by decide +kernel⟩
    ⟨2046, by decide +kernel⟩
]
theorem fact_63_1 : source_63_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t64\t{now}"
      handle.flush
noncomputable def source_64_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2048
noncomputable def tables_64_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨4026, by decide +kernel⟩,
      ⟨4026, by decide +kernel⟩,
      ⟨4026, by decide +kernel⟩,
      ⟨4026, by decide +kernel⟩,
      ⟨4026, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨2048, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩
    ], rfl⟩
    ⟨2049, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨272, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨2050, by decide +kernel⟩
    ⟨2051, by decide +kernel⟩,
  TableOp.write
    ⟨2, by decide +kernel⟩
    ⟨#[
      ⟨1, by decide +kernel⟩,
      ⟨1, by decide +kernel⟩,
      ⟨2, by decide +kernel⟩,
      ⟨3, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩
    ⟨2049, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2056, by decide +kernel⟩,
      ⟨2056, by decide +kernel⟩,
      ⟨2056, by decide +kernel⟩,
      ⟨2056, by decide +kernel⟩,
      ⟨2056, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.right
    ⟨2054, by decide +kernel⟩,
  TableOp.absent
    ⟨2, by decide +kernel⟩
    ⟨2053, by decide +kernel⟩
    ⟨2055, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4038, by decide +kernel⟩,
      ⟨4038, by decide +kernel⟩,
      ⟨4038, by decide +kernel⟩,
      ⟨4038, by decide +kernel⟩,
      ⟨4038, by decide +kernel⟩
    ], rfl⟩,
  TableOp.pureLoad
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2057, by decide +kernel⟩,
  TableOp.write
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩,
      ⟨0, by decide +kernel⟩
    ], rfl⟩
    ⟨2057, by decide +kernel⟩,
  TableOp.load
    ⟨1, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩
    ], rfl⟩
    ⟨2059, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2060, by decide +kernel⟩,
  TableOp.marker
    ⟨2058, by decide +kernel⟩
    ⟨2061, by decide +kernel⟩,
  TableOp.move
    Dir.right
    ⟨275, by decide +kernel⟩,
  TableOp.absent
    ⟨1, by decide +kernel⟩
    ⟨2062, by decide +kernel⟩
    ⟨2063, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨276, by decide +kernel⟩,
  TableOp.marker
    ⟨0, by decide +kernel⟩
    ⟨2065, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2070, by decide +kernel⟩,
      ⟨2070, by decide +kernel⟩,
      ⟨2070, by decide +kernel⟩,
      ⟨2070, by decide +kernel⟩,
      ⟨2070, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩,
      ⟨4, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2067, by decide +kernel⟩,
  TableOp.marker
    ⟨2068, by decide +kernel⟩
    ⟨2069, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2073, by decide +kernel⟩,
      ⟨2073, by decide +kernel⟩,
      ⟨2073, by decide +kernel⟩,
      ⟨2073, by decide +kernel⟩,
      ⟨2073, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2071, by decide +kernel⟩,
  TableOp.marker
    ⟨279, by decide +kernel⟩
    ⟨2072, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2068, by decide +kernel⟩
    ⟨279, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨282, by decide +kernel⟩,
  TableOp.marker
    ⟨2074, by decide +kernel⟩
    ⟨2075, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2079, by decide +kernel⟩,
      ⟨2079, by decide +kernel⟩,
      ⟨2079, by decide +kernel⟩,
      ⟨2079, by decide +kernel⟩,
      ⟨2079, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2077, by decide +kernel⟩,
  TableOp.marker
    ⟨1, by decide +kernel⟩
    ⟨2078, by decide +kernel⟩
]
theorem fact_64_1 : source_64_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_64_1 := by
  decide +kernel
noncomputable def source_63_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_63_1 source_64_1
noncomputable def tables_63_2 : List (TableOp 4042) := tables_63_1 ++ tables_64_1
theorem fact_63_2 : source_63_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_2 :=
  source_tables_branch 32 source_63_1 source_64_1
    tables_63_1 tables_64_1 fact_63_1 fact_64_1
noncomputable def source_65_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2080
noncomputable def tables_65_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨290, by decide +kernel⟩,
  TableOp.marker
    ⟨3, by decide +kernel⟩
    ⟨2080, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2084, by decide +kernel⟩,
      ⟨2084, by decide +kernel⟩,
      ⟨2084, by decide +kernel⟩,
      ⟨2084, by decide +kernel⟩,
      ⟨2084, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2082, by decide +kernel⟩,
  TableOp.marker
    ⟨2, by decide +kernel⟩
    ⟨2083, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2087, by decide +kernel⟩,
      ⟨2087, by decide +kernel⟩,
      ⟨2087, by decide +kernel⟩,
      ⟨2087, by decide +kernel⟩,
      ⟨2087, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2085, by decide +kernel⟩,
  TableOp.marker
    ⟨4, by decide +kernel⟩
    ⟨2086, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨6, by decide +kernel⟩,
      ⟨6, by decide +kernel⟩,
      ⟨6, by decide +kernel⟩,
      ⟨6, by decide +kernel⟩,
      ⟨6, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨307, by decide +kernel⟩,
  TableOp.marker
    ⟨2088, by decide +kernel⟩
    ⟨2089, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2093, by decide +kernel⟩,
      ⟨2093, by decide +kernel⟩,
      ⟨2093, by decide +kernel⟩,
      ⟨2093, by decide +kernel⟩,
      ⟨2093, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2091, by decide +kernel⟩,
  TableOp.marker
    ⟨296, by decide +kernel⟩
    ⟨2092, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2088, by decide +kernel⟩
    ⟨296, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨299, by decide +kernel⟩,
  TableOp.marker
    ⟨2094, by decide +kernel⟩
    ⟨2095, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2099, by decide +kernel⟩,
      ⟨2099, by decide +kernel⟩,
      ⟨2099, by decide +kernel⟩,
      ⟨2099, by decide +kernel⟩,
      ⟨2099, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2097, by decide +kernel⟩,
  TableOp.marker
    ⟨5, by decide +kernel⟩
    ⟨2098, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2103, by decide +kernel⟩,
      ⟨2103, by decide +kernel⟩,
      ⟨2103, by decide +kernel⟩,
      ⟨2103, by decide +kernel⟩,
      ⟨2103, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨9, by decide +kernel⟩,
      ⟨9, by decide +kernel⟩,
      ⟨9, by decide +kernel⟩,
      ⟨9, by decide +kernel⟩,
      ⟨9, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2100, by decide +kernel⟩,
  TableOp.marker
    ⟨2101, by decide +kernel⟩
    ⟨2102, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2106, by decide +kernel⟩,
      ⟨2106, by decide +kernel⟩,
      ⟨2106, by decide +kernel⟩,
      ⟨2106, by decide +kernel⟩,
      ⟨2106, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2104, by decide +kernel⟩,
  TableOp.marker
    ⟨310, by decide +kernel⟩
    ⟨2105, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    ⟨2101, by decide +kernel⟩
    ⟨310, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨313, by decide +kernel⟩,
  TableOp.marker
    ⟨2107, by decide +kernel⟩
    ⟨2108, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2112, by decide +kernel⟩,
      ⟨2112, by decide +kernel⟩,
      ⟨2112, by decide +kernel⟩,
      ⟨2112, by decide +kernel⟩,
      ⟨2112, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2110, by decide +kernel⟩
]
theorem fact_65_1 : source_65_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_65_1 := by
  decide +kernel
noncomputable def source_66_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2112
noncomputable def tables_66_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨6, by decide +kernel⟩
    ⟨2111, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨321, by decide +kernel⟩,
  TableOp.marker
    ⟨8, by decide +kernel⟩
    ⟨2113, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2117, by decide +kernel⟩,
      ⟨2117, by decide +kernel⟩,
      ⟨2117, by decide +kernel⟩,
      ⟨2117, by decide +kernel⟩,
      ⟨2117, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2115, by decide +kernel⟩,
  TableOp.marker
    ⟨7, by decide +kernel⟩
    ⟨2116, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2120, by decide +kernel⟩,
      ⟨2120, by decide +kernel⟩,
      ⟨2120, by decide +kernel⟩,
      ⟨2120, by decide +kernel⟩,
      ⟨2120, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2118, by decide +kernel⟩,
  TableOp.marker
    ⟨9, by decide +kernel⟩
    ⟨2119, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2124, by decide +kernel⟩,
      ⟨2124, by decide +kernel⟩,
      ⟨2124, by decide +kernel⟩,
      ⟨2124, by decide +kernel⟩,
      ⟨2124, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨11, by decide +kernel⟩,
      ⟨11, by decide +kernel⟩,
      ⟨11, by decide +kernel⟩,
      ⟨11, by decide +kernel⟩,
      ⟨11, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2121, by decide +kernel⟩,
  TableOp.marker
    ⟨2122, by decide +kernel⟩
    ⟨2123, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2127, by decide +kernel⟩,
      ⟨2127, by decide +kernel⟩,
      ⟨2127, by decide +kernel⟩,
      ⟨2127, by decide +kernel⟩,
      ⟨2127, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2125, by decide +kernel⟩,
  TableOp.marker
    ⟨327, by decide +kernel⟩
    ⟨2126, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2122, by decide +kernel⟩
    ⟨327, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨330, by decide +kernel⟩,
  TableOp.marker
    ⟨2128, by decide +kernel⟩
    ⟨2129, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2133, by decide +kernel⟩,
      ⟨2133, by decide +kernel⟩,
      ⟨2133, by decide +kernel⟩,
      ⟨2133, by decide +kernel⟩,
      ⟨2133, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2131, by decide +kernel⟩,
  TableOp.marker
    ⟨10, by decide +kernel⟩
    ⟨2132, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨12, by decide +kernel⟩,
      ⟨12, by decide +kernel⟩,
      ⟨12, by decide +kernel⟩,
      ⟨12, by decide +kernel⟩,
      ⟨12, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨346, by decide +kernel⟩,
  TableOp.marker
    ⟨2134, by decide +kernel⟩
    ⟨2135, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨2134, by decide +kernel⟩
    ⟨2122, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨338, by decide +kernel⟩,
  TableOp.marker
    ⟨2137, by decide +kernel⟩
    ⟨2138, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2142, by decide +kernel⟩,
      ⟨2142, by decide +kernel⟩,
      ⟨2142, by decide +kernel⟩,
      ⟨2142, by decide +kernel⟩,
      ⟨2142, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2140, by decide +kernel⟩,
  TableOp.marker
    ⟨11, by decide +kernel⟩
    ⟨2141, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2146, by decide +kernel⟩,
      ⟨2146, by decide +kernel⟩,
      ⟨2146, by decide +kernel⟩,
      ⟨2146, by decide +kernel⟩,
      ⟨2146, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_66_1 : source_66_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_66_1 := by
  decide +kernel
noncomputable def source_65_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_65_1 source_66_1
noncomputable def tables_65_2 : List (TableOp 4042) := tables_65_1 ++ tables_66_1
theorem fact_65_2 : source_65_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_65_2 :=
  source_tables_branch 32 source_65_1 source_66_1
    tables_65_1 tables_66_1 fact_65_1 fact_66_1
noncomputable def source_63_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_63_2 source_65_2
noncomputable def tables_63_4 : List (TableOp 4042) := tables_63_2 ++ tables_65_2
theorem fact_63_4 : source_63_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_4 :=
  source_tables_branch 64 source_63_2 source_65_2
    tables_63_2 tables_65_2 fact_63_2 fact_65_2
noncomputable def source_67_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2144
noncomputable def tables_67_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨15, by decide +kernel⟩,
      ⟨15, by decide +kernel⟩,
      ⟨15, by decide +kernel⟩,
      ⟨15, by decide +kernel⟩,
      ⟨15, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2143, by decide +kernel⟩,
  TableOp.marker
    ⟨2144, by decide +kernel⟩
    ⟨2145, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2149, by decide +kernel⟩,
      ⟨2149, by decide +kernel⟩,
      ⟨2149, by decide +kernel⟩,
      ⟨2149, by decide +kernel⟩,
      ⟨2149, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2147, by decide +kernel⟩,
  TableOp.marker
    ⟨349, by decide +kernel⟩
    ⟨2148, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2144, by decide +kernel⟩
    ⟨349, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨352, by decide +kernel⟩,
  TableOp.marker
    ⟨2150, by decide +kernel⟩
    ⟨2151, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2155, by decide +kernel⟩,
      ⟨2155, by decide +kernel⟩,
      ⟨2155, by decide +kernel⟩,
      ⟨2155, by decide +kernel⟩,
      ⟨2155, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2153, by decide +kernel⟩,
  TableOp.marker
    ⟨12, by decide +kernel⟩
    ⟨2154, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨360, by decide +kernel⟩,
  TableOp.marker
    ⟨14, by decide +kernel⟩
    ⟨2156, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2160, by decide +kernel⟩,
      ⟨2160, by decide +kernel⟩,
      ⟨2160, by decide +kernel⟩,
      ⟨2160, by decide +kernel⟩,
      ⟨2160, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2158, by decide +kernel⟩,
  TableOp.marker
    ⟨13, by decide +kernel⟩
    ⟨2159, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2163, by decide +kernel⟩,
      ⟨2163, by decide +kernel⟩,
      ⟨2163, by decide +kernel⟩,
      ⟨2163, by decide +kernel⟩,
      ⟨2163, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2161, by decide +kernel⟩,
  TableOp.marker
    ⟨15, by decide +kernel⟩
    ⟨2162, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2167, by decide +kernel⟩,
      ⟨2167, by decide +kernel⟩,
      ⟨2167, by decide +kernel⟩,
      ⟨2167, by decide +kernel⟩,
      ⟨2167, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨19, by decide +kernel⟩,
      ⟨19, by decide +kernel⟩,
      ⟨19, by decide +kernel⟩,
      ⟨19, by decide +kernel⟩,
      ⟨19, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2164, by decide +kernel⟩,
  TableOp.marker
    ⟨2165, by decide +kernel⟩
    ⟨2166, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2170, by decide +kernel⟩,
      ⟨2170, by decide +kernel⟩,
      ⟨2170, by decide +kernel⟩,
      ⟨2170, by decide +kernel⟩,
      ⟨2170, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2168, by decide +kernel⟩,
  TableOp.marker
    ⟨366, by decide +kernel⟩
    ⟨2169, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2165, by decide +kernel⟩
    ⟨366, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨369, by decide +kernel⟩,
  TableOp.marker
    ⟨2171, by decide +kernel⟩
    ⟨2172, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2176, by decide +kernel⟩,
      ⟨2176, by decide +kernel⟩,
      ⟨2176, by decide +kernel⟩,
      ⟨2176, by decide +kernel⟩,
      ⟨2176, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2174, by decide +kernel⟩
]
theorem fact_67_1 : source_67_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_67_1 := by
  decide +kernel
noncomputable def source_68_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2176
noncomputable def tables_68_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨16, by decide +kernel⟩
    ⟨2175, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨377, by decide +kernel⟩,
  TableOp.marker
    ⟨18, by decide +kernel⟩
    ⟨2177, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2181, by decide +kernel⟩,
      ⟨2181, by decide +kernel⟩,
      ⟨2181, by decide +kernel⟩,
      ⟨2181, by decide +kernel⟩,
      ⟨2181, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2179, by decide +kernel⟩,
  TableOp.marker
    ⟨17, by decide +kernel⟩
    ⟨2180, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2184, by decide +kernel⟩,
      ⟨2184, by decide +kernel⟩,
      ⟨2184, by decide +kernel⟩,
      ⟨2184, by decide +kernel⟩,
      ⟨2184, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2182, by decide +kernel⟩,
  TableOp.marker
    ⟨19, by decide +kernel⟩
    ⟨2183, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2187, by decide +kernel⟩,
      ⟨2187, by decide +kernel⟩,
      ⟨2187, by decide +kernel⟩,
      ⟨2187, by decide +kernel⟩,
      ⟨2187, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2185, by decide +kernel⟩,
  TableOp.marker
    ⟨20, by decide +kernel⟩
    ⟨2186, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨382, by decide +kernel⟩,
  TableOp.marker
    ⟨22, by decide +kernel⟩
    ⟨2188, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2192, by decide +kernel⟩,
      ⟨2192, by decide +kernel⟩,
      ⟨2192, by decide +kernel⟩,
      ⟨2192, by decide +kernel⟩,
      ⟨2192, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2190, by decide +kernel⟩,
  TableOp.marker
    ⟨21, by decide +kernel⟩
    ⟨2191, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2195, by decide +kernel⟩,
      ⟨2195, by decide +kernel⟩,
      ⟨2195, by decide +kernel⟩,
      ⟨2195, by decide +kernel⟩,
      ⟨2195, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2193, by decide +kernel⟩,
  TableOp.marker
    ⟨23, by decide +kernel⟩
    ⟨2194, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨387, by decide +kernel⟩,
  TableOp.marker
    ⟨24, by decide +kernel⟩
    ⟨2196, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2200, by decide +kernel⟩,
      ⟨2200, by decide +kernel⟩,
      ⟨2200, by decide +kernel⟩,
      ⟨2200, by decide +kernel⟩,
      ⟨2200, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2198, by decide +kernel⟩,
  TableOp.marker
    ⟨390, by decide +kernel⟩
    ⟨2199, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2204, by decide +kernel⟩,
      ⟨2204, by decide +kernel⟩,
      ⟨2204, by decide +kernel⟩,
      ⟨2204, by decide +kernel⟩,
      ⟨2204, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨26, by decide +kernel⟩,
      ⟨26, by decide +kernel⟩,
      ⟨26, by decide +kernel⟩,
      ⟨26, by decide +kernel⟩,
      ⟨26, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2201, by decide +kernel⟩,
  TableOp.marker
    ⟨2202, by decide +kernel⟩
    ⟨2203, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨27, by decide +kernel⟩,
      ⟨27, by decide +kernel⟩,
      ⟨27, by decide +kernel⟩,
      ⟨27, by decide +kernel⟩,
      ⟨27, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨393, by decide +kernel⟩,
  TableOp.marker
    ⟨2205, by decide +kernel⟩
    ⟨2206, by decide +kernel⟩
]
theorem fact_68_1 : source_68_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_68_1 := by
  decide +kernel
noncomputable def source_67_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_67_1 source_68_1
noncomputable def tables_67_2 : List (TableOp 4042) := tables_67_1 ++ tables_68_1
theorem fact_67_2 : source_67_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_67_2 :=
  source_tables_branch 32 source_67_1 source_68_1
    tables_67_1 tables_68_1 fact_67_1 fact_68_1
noncomputable def source_69_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2208
noncomputable def tables_69_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2210, by decide +kernel⟩,
      ⟨2210, by decide +kernel⟩,
      ⟨2210, by decide +kernel⟩,
      ⟨2210, by decide +kernel⟩,
      ⟨2210, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2208, by decide +kernel⟩,
  TableOp.marker
    ⟨396, by decide +kernel⟩
    ⟨2209, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2205, by decide +kernel⟩
    ⟨396, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨399, by decide +kernel⟩,
  TableOp.marker
    ⟨2211, by decide +kernel⟩
    ⟨2212, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2216, by decide +kernel⟩,
      ⟨2216, by decide +kernel⟩,
      ⟨2216, by decide +kernel⟩,
      ⟨2216, by decide +kernel⟩,
      ⟨2216, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2214, by decide +kernel⟩,
  TableOp.marker
    ⟨403, by decide +kernel⟩
    ⟨2215, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2220, by decide +kernel⟩,
      ⟨2220, by decide +kernel⟩,
      ⟨2220, by decide +kernel⟩,
      ⟨2220, by decide +kernel⟩,
      ⟨2220, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2202, by decide +kernel⟩
    ⟨403, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2217, by decide +kernel⟩,
  TableOp.marker
    ⟨2218, by decide +kernel⟩
    ⟨2219, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨390, by decide +kernel⟩
    ⟨2218, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨406, by decide +kernel⟩,
  TableOp.marker
    ⟨2221, by decide +kernel⟩
    ⟨2222, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2226, by decide +kernel⟩,
      ⟨2226, by decide +kernel⟩,
      ⟨2226, by decide +kernel⟩,
      ⟨2226, by decide +kernel⟩,
      ⟨2226, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2224, by decide +kernel⟩,
  TableOp.marker
    ⟨25, by decide +kernel⟩
    ⟨2225, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨519, by decide +kernel⟩,
  TableOp.marker
    ⟨26, by decide +kernel⟩
    ⟨2227, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨28, by decide +kernel⟩,
      ⟨28, by decide +kernel⟩,
      ⟨28, by decide +kernel⟩,
      ⟨28, by decide +kernel⟩,
      ⟨28, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨426, by decide +kernel⟩,
  TableOp.marker
    ⟨2229, by decide +kernel⟩
    ⟨2230, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2234, by decide +kernel⟩,
      ⟨2234, by decide +kernel⟩,
      ⟨2234, by decide +kernel⟩,
      ⟨2234, by decide +kernel⟩,
      ⟨2234, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2232, by decide +kernel⟩,
  TableOp.marker
    ⟨415, by decide +kernel⟩
    ⟨2233, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2229, by decide +kernel⟩
    ⟨415, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨418, by decide +kernel⟩,
  TableOp.marker
    ⟨2235, by decide +kernel⟩
    ⟨2236, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2240, by decide +kernel⟩,
      ⟨2240, by decide +kernel⟩,
      ⟨2240, by decide +kernel⟩,
      ⟨2240, by decide +kernel⟩,
      ⟨2240, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2238, by decide +kernel⟩
]
theorem fact_69_1 : source_69_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_69_1 := by
  decide +kernel
noncomputable def source_70_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2240
noncomputable def tables_70_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨27, by decide +kernel⟩
    ⟨2239, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2244, by decide +kernel⟩,
      ⟨2244, by decide +kernel⟩,
      ⟨2244, by decide +kernel⟩,
      ⟨2244, by decide +kernel⟩,
      ⟨2244, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨31, by decide +kernel⟩,
      ⟨31, by decide +kernel⟩,
      ⟨31, by decide +kernel⟩,
      ⟨31, by decide +kernel⟩,
      ⟨31, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2241, by decide +kernel⟩,
  TableOp.marker
    ⟨2242, by decide +kernel⟩
    ⟨2243, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2247, by decide +kernel⟩,
      ⟨2247, by decide +kernel⟩,
      ⟨2247, by decide +kernel⟩,
      ⟨2247, by decide +kernel⟩,
      ⟨2247, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2245, by decide +kernel⟩,
  TableOp.marker
    ⟨429, by decide +kernel⟩
    ⟨2246, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2242, by decide +kernel⟩
    ⟨429, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨432, by decide +kernel⟩,
  TableOp.marker
    ⟨2248, by decide +kernel⟩
    ⟨2249, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2253, by decide +kernel⟩,
      ⟨2253, by decide +kernel⟩,
      ⟨2253, by decide +kernel⟩,
      ⟨2253, by decide +kernel⟩,
      ⟨2253, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2251, by decide +kernel⟩,
  TableOp.marker
    ⟨28, by decide +kernel⟩
    ⟨2252, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨440, by decide +kernel⟩,
  TableOp.marker
    ⟨30, by decide +kernel⟩
    ⟨2254, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2258, by decide +kernel⟩,
      ⟨2258, by decide +kernel⟩,
      ⟨2258, by decide +kernel⟩,
      ⟨2258, by decide +kernel⟩,
      ⟨2258, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2256, by decide +kernel⟩,
  TableOp.marker
    ⟨29, by decide +kernel⟩
    ⟨2257, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2261, by decide +kernel⟩,
      ⟨2261, by decide +kernel⟩,
      ⟨2261, by decide +kernel⟩,
      ⟨2261, by decide +kernel⟩,
      ⟨2261, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2259, by decide +kernel⟩,
  TableOp.marker
    ⟨31, by decide +kernel⟩
    ⟨2260, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨33, by decide +kernel⟩,
      ⟨33, by decide +kernel⟩,
      ⟨33, by decide +kernel⟩,
      ⟨33, by decide +kernel⟩,
      ⟨33, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨457, by decide +kernel⟩,
  TableOp.marker
    ⟨2262, by decide +kernel⟩
    ⟨2263, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2267, by decide +kernel⟩,
      ⟨2267, by decide +kernel⟩,
      ⟨2267, by decide +kernel⟩,
      ⟨2267, by decide +kernel⟩,
      ⟨2267, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2265, by decide +kernel⟩,
  TableOp.marker
    ⟨446, by decide +kernel⟩
    ⟨2266, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2262, by decide +kernel⟩
    ⟨446, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨449, by decide +kernel⟩,
  TableOp.marker
    ⟨2268, by decide +kernel⟩
    ⟨2269, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2273, by decide +kernel⟩,
      ⟨2273, by decide +kernel⟩,
      ⟨2273, by decide +kernel⟩,
      ⟨2273, by decide +kernel⟩,
      ⟨2273, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_70_1 : source_70_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_70_1 := by
  decide +kernel
noncomputable def source_69_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_69_1 source_70_1
noncomputable def tables_69_2 : List (TableOp 4042) := tables_69_1 ++ tables_70_1
theorem fact_69_2 : source_69_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_69_2 :=
  source_tables_branch 32 source_69_1 source_70_1
    tables_69_1 tables_70_1 fact_69_1 fact_70_1
noncomputable def source_67_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_67_2 source_69_2
noncomputable def tables_67_4 : List (TableOp 4042) := tables_67_2 ++ tables_69_2
theorem fact_67_4 : source_67_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_67_4 :=
  source_tables_branch 64 source_67_2 source_69_2
    tables_67_2 tables_69_2 fact_67_2 fact_69_2
noncomputable def source_63_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_63_4 source_67_4
noncomputable def tables_63_8 : List (TableOp 4042) := tables_63_4 ++ tables_67_4
theorem fact_63_8 : source_63_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_8 :=
  source_tables_branch 128 source_63_4 source_67_4
    tables_63_4 tables_67_4 fact_63_4 fact_67_4
noncomputable def source_71_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2272
noncomputable def tables_71_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨2271, by decide +kernel⟩,
  TableOp.marker
    ⟨32, by decide +kernel⟩
    ⟨2272, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2277, by decide +kernel⟩,
      ⟨2277, by decide +kernel⟩,
      ⟨2277, by decide +kernel⟩,
      ⟨2277, by decide +kernel⟩,
      ⟨2277, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨36, by decide +kernel⟩,
      ⟨36, by decide +kernel⟩,
      ⟨36, by decide +kernel⟩,
      ⟨36, by decide +kernel⟩,
      ⟨36, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2274, by decide +kernel⟩,
  TableOp.marker
    ⟨2275, by decide +kernel⟩
    ⟨2276, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2280, by decide +kernel⟩,
      ⟨2280, by decide +kernel⟩,
      ⟨2280, by decide +kernel⟩,
      ⟨2280, by decide +kernel⟩,
      ⟨2280, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2278, by decide +kernel⟩,
  TableOp.marker
    ⟨460, by decide +kernel⟩
    ⟨2279, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2275, by decide +kernel⟩
    ⟨460, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨463, by decide +kernel⟩,
  TableOp.marker
    ⟨2281, by decide +kernel⟩
    ⟨2282, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2286, by decide +kernel⟩,
      ⟨2286, by decide +kernel⟩,
      ⟨2286, by decide +kernel⟩,
      ⟨2286, by decide +kernel⟩,
      ⟨2286, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2284, by decide +kernel⟩,
  TableOp.marker
    ⟨33, by decide +kernel⟩
    ⟨2285, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨471, by decide +kernel⟩,
  TableOp.marker
    ⟨35, by decide +kernel⟩
    ⟨2287, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2291, by decide +kernel⟩,
      ⟨2291, by decide +kernel⟩,
      ⟨2291, by decide +kernel⟩,
      ⟨2291, by decide +kernel⟩,
      ⟨2291, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2289, by decide +kernel⟩,
  TableOp.marker
    ⟨34, by decide +kernel⟩
    ⟨2290, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2294, by decide +kernel⟩,
      ⟨2294, by decide +kernel⟩,
      ⟨2294, by decide +kernel⟩,
      ⟨2294, by decide +kernel⟩,
      ⟨2294, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2292, by decide +kernel⟩,
  TableOp.marker
    ⟨36, by decide +kernel⟩
    ⟨2293, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨38, by decide +kernel⟩,
      ⟨38, by decide +kernel⟩,
      ⟨38, by decide +kernel⟩,
      ⟨38, by decide +kernel⟩,
      ⟨38, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨488, by decide +kernel⟩,
  TableOp.marker
    ⟨2295, by decide +kernel⟩
    ⟨2296, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2300, by decide +kernel⟩,
      ⟨2300, by decide +kernel⟩,
      ⟨2300, by decide +kernel⟩,
      ⟨2300, by decide +kernel⟩,
      ⟨2300, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2298, by decide +kernel⟩,
  TableOp.marker
    ⟨477, by decide +kernel⟩
    ⟨2299, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2295, by decide +kernel⟩
    ⟨477, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨480, by decide +kernel⟩,
  TableOp.marker
    ⟨2301, by decide +kernel⟩
    ⟨2302, by decide +kernel⟩
]
theorem fact_71_1 : source_71_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_71_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t72\t{now}"
      handle.flush
noncomputable def source_72_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2304
noncomputable def tables_72_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2306, by decide +kernel⟩,
      ⟨2306, by decide +kernel⟩,
      ⟨2306, by decide +kernel⟩,
      ⟨2306, by decide +kernel⟩,
      ⟨2306, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2304, by decide +kernel⟩,
  TableOp.marker
    ⟨37, by decide +kernel⟩
    ⟨2305, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2310, by decide +kernel⟩,
      ⟨2310, by decide +kernel⟩,
      ⟨2310, by decide +kernel⟩,
      ⟨2310, by decide +kernel⟩,
      ⟨2310, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨41, by decide +kernel⟩,
      ⟨41, by decide +kernel⟩,
      ⟨41, by decide +kernel⟩,
      ⟨41, by decide +kernel⟩,
      ⟨41, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2307, by decide +kernel⟩,
  TableOp.marker
    ⟨2308, by decide +kernel⟩
    ⟨2309, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2313, by decide +kernel⟩,
      ⟨2313, by decide +kernel⟩,
      ⟨2313, by decide +kernel⟩,
      ⟨2313, by decide +kernel⟩,
      ⟨2313, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2311, by decide +kernel⟩,
  TableOp.marker
    ⟨491, by decide +kernel⟩
    ⟨2312, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2308, by decide +kernel⟩
    ⟨491, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨494, by decide +kernel⟩,
  TableOp.marker
    ⟨2314, by decide +kernel⟩
    ⟨2315, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2319, by decide +kernel⟩,
      ⟨2319, by decide +kernel⟩,
      ⟨2319, by decide +kernel⟩,
      ⟨2319, by decide +kernel⟩,
      ⟨2319, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2317, by decide +kernel⟩,
  TableOp.marker
    ⟨38, by decide +kernel⟩
    ⟨2318, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨502, by decide +kernel⟩,
  TableOp.marker
    ⟨40, by decide +kernel⟩
    ⟨2320, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2324, by decide +kernel⟩,
      ⟨2324, by decide +kernel⟩,
      ⟨2324, by decide +kernel⟩,
      ⟨2324, by decide +kernel⟩,
      ⟨2324, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2322, by decide +kernel⟩,
  TableOp.marker
    ⟨39, by decide +kernel⟩
    ⟨2323, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2327, by decide +kernel⟩,
      ⟨2327, by decide +kernel⟩,
      ⟨2327, by decide +kernel⟩,
      ⟨2327, by decide +kernel⟩,
      ⟨2327, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2325, by decide +kernel⟩,
  TableOp.marker
    ⟨41, by decide +kernel⟩
    ⟨2326, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2330, by decide +kernel⟩,
      ⟨2330, by decide +kernel⟩,
      ⟨2330, by decide +kernel⟩,
      ⟨2330, by decide +kernel⟩,
      ⟨2330, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2328, by decide +kernel⟩,
  TableOp.marker
    ⟨508, by decide +kernel⟩
    ⟨2329, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨22, by decide +kernel⟩
    ⟨508, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨511, by decide +kernel⟩,
  TableOp.marker
    ⟨2331, by decide +kernel⟩
    ⟨2332, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2336, by decide +kernel⟩,
      ⟨2336, by decide +kernel⟩,
      ⟨2336, by decide +kernel⟩,
      ⟨2336, by decide +kernel⟩,
      ⟨2336, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2334, by decide +kernel⟩
]
theorem fact_72_1 : source_72_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_72_1 := by
  decide +kernel
noncomputable def source_71_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_71_1 source_72_1
noncomputable def tables_71_2 : List (TableOp 4042) := tables_71_1 ++ tables_72_1
theorem fact_71_2 : source_71_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_71_2 :=
  source_tables_branch 32 source_71_1 source_72_1
    tables_71_1 tables_72_1 fact_71_1 fact_72_1
noncomputable def source_73_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2336
noncomputable def tables_73_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨42, by decide +kernel⟩
    ⟨2335, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2340, by decide +kernel⟩,
      ⟨2340, by decide +kernel⟩,
      ⟨2340, by decide +kernel⟩,
      ⟨2340, by decide +kernel⟩,
      ⟨2340, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨46, by decide +kernel⟩,
      ⟨46, by decide +kernel⟩,
      ⟨46, by decide +kernel⟩,
      ⟨46, by decide +kernel⟩,
      ⟨46, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2337, by decide +kernel⟩,
  TableOp.marker
    ⟨2338, by decide +kernel⟩
    ⟨2339, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2343, by decide +kernel⟩,
      ⟨2343, by decide +kernel⟩,
      ⟨2343, by decide +kernel⟩,
      ⟨2343, by decide +kernel⟩,
      ⟨2343, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2341, by decide +kernel⟩,
  TableOp.marker
    ⟨522, by decide +kernel⟩
    ⟨2342, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2338, by decide +kernel⟩
    ⟨522, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨525, by decide +kernel⟩,
  TableOp.marker
    ⟨2344, by decide +kernel⟩
    ⟨2345, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2349, by decide +kernel⟩,
      ⟨2349, by decide +kernel⟩,
      ⟨2349, by decide +kernel⟩,
      ⟨2349, by decide +kernel⟩,
      ⟨2349, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2347, by decide +kernel⟩,
  TableOp.marker
    ⟨43, by decide +kernel⟩
    ⟨2348, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨533, by decide +kernel⟩,
  TableOp.marker
    ⟨45, by decide +kernel⟩
    ⟨2350, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2354, by decide +kernel⟩,
      ⟨2354, by decide +kernel⟩,
      ⟨2354, by decide +kernel⟩,
      ⟨2354, by decide +kernel⟩,
      ⟨2354, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2352, by decide +kernel⟩,
  TableOp.marker
    ⟨44, by decide +kernel⟩
    ⟨2353, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2357, by decide +kernel⟩,
      ⟨2357, by decide +kernel⟩,
      ⟨2357, by decide +kernel⟩,
      ⟨2357, by decide +kernel⟩,
      ⟨2357, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2355, by decide +kernel⟩,
  TableOp.marker
    ⟨46, by decide +kernel⟩
    ⟨2356, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨538, by decide +kernel⟩,
  TableOp.marker
    ⟨48, by decide +kernel⟩
    ⟨2358, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2362, by decide +kernel⟩,
      ⟨2362, by decide +kernel⟩,
      ⟨2362, by decide +kernel⟩,
      ⟨2362, by decide +kernel⟩,
      ⟨2362, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2360, by decide +kernel⟩,
  TableOp.marker
    ⟨47, by decide +kernel⟩
    ⟨2361, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2365, by decide +kernel⟩,
      ⟨2365, by decide +kernel⟩,
      ⟨2365, by decide +kernel⟩,
      ⟨2365, by decide +kernel⟩,
      ⟨2365, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2363, by decide +kernel⟩,
  TableOp.marker
    ⟨49, by decide +kernel⟩
    ⟨2364, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨547, by decide +kernel⟩,
  TableOp.marker
    ⟨544, by decide +kernel⟩
    ⟨2366, by decide +kernel⟩
]
theorem fact_73_1 : source_73_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_73_1 := by
  decide +kernel
noncomputable def source_74_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2368
noncomputable def tables_74_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2370, by decide +kernel⟩,
      ⟨2370, by decide +kernel⟩,
      ⟨2370, by decide +kernel⟩,
      ⟨2370, by decide +kernel⟩,
      ⟨2370, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2368, by decide +kernel⟩,
  TableOp.marker
    ⟨550, by decide +kernel⟩
    ⟨2369, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨51, by decide +kernel⟩,
      ⟨51, by decide +kernel⟩,
      ⟨51, by decide +kernel⟩,
      ⟨51, by decide +kernel⟩,
      ⟨51, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨561, by decide +kernel⟩,
  TableOp.marker
    ⟨2371, by decide +kernel⟩
    ⟨2372, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨550, by decide +kernel⟩
    ⟨2371, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨553, by decide +kernel⟩,
  TableOp.marker
    ⟨2374, by decide +kernel⟩
    ⟨2375, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2379, by decide +kernel⟩,
      ⟨2379, by decide +kernel⟩,
      ⟨2379, by decide +kernel⟩,
      ⟨2379, by decide +kernel⟩,
      ⟨2379, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2377, by decide +kernel⟩,
  TableOp.marker
    ⟨50, by decide +kernel⟩
    ⟨2378, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2383, by decide +kernel⟩,
      ⟨2383, by decide +kernel⟩,
      ⟨2383, by decide +kernel⟩,
      ⟨2383, by decide +kernel⟩,
      ⟨2383, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨54, by decide +kernel⟩,
      ⟨54, by decide +kernel⟩,
      ⟨54, by decide +kernel⟩,
      ⟨54, by decide +kernel⟩,
      ⟨54, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2380, by decide +kernel⟩,
  TableOp.marker
    ⟨2381, by decide +kernel⟩
    ⟨2382, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2386, by decide +kernel⟩,
      ⟨2386, by decide +kernel⟩,
      ⟨2386, by decide +kernel⟩,
      ⟨2386, by decide +kernel⟩,
      ⟨2386, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2384, by decide +kernel⟩,
  TableOp.marker
    ⟨564, by decide +kernel⟩
    ⟨2385, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2381, by decide +kernel⟩
    ⟨564, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨567, by decide +kernel⟩,
  TableOp.marker
    ⟨2387, by decide +kernel⟩
    ⟨2388, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2392, by decide +kernel⟩,
      ⟨2392, by decide +kernel⟩,
      ⟨2392, by decide +kernel⟩,
      ⟨2392, by decide +kernel⟩,
      ⟨2392, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2390, by decide +kernel⟩,
  TableOp.marker
    ⟨51, by decide +kernel⟩
    ⟨2391, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨575, by decide +kernel⟩,
  TableOp.marker
    ⟨53, by decide +kernel⟩
    ⟨2393, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2397, by decide +kernel⟩,
      ⟨2397, by decide +kernel⟩,
      ⟨2397, by decide +kernel⟩,
      ⟨2397, by decide +kernel⟩,
      ⟨2397, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2395, by decide +kernel⟩,
  TableOp.marker
    ⟨52, by decide +kernel⟩
    ⟨2396, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2400, by decide +kernel⟩,
      ⟨2400, by decide +kernel⟩,
      ⟨2400, by decide +kernel⟩,
      ⟨2400, by decide +kernel⟩,
      ⟨2400, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2398, by decide +kernel⟩
]
theorem fact_74_1 : source_74_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_74_1 := by
  decide +kernel
noncomputable def source_73_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_73_1 source_74_1
noncomputable def tables_73_2 : List (TableOp 4042) := tables_73_1 ++ tables_74_1
theorem fact_73_2 : source_73_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_73_2 :=
  source_tables_branch 32 source_73_1 source_74_1
    tables_73_1 tables_74_1 fact_73_1 fact_74_1
noncomputable def source_71_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_71_2 source_73_2
noncomputable def tables_71_4 : List (TableOp 4042) := tables_71_2 ++ tables_73_2
theorem fact_71_4 : source_71_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_71_4 :=
  source_tables_branch 64 source_71_2 source_73_2
    tables_71_2 tables_73_2 fact_71_2 fact_73_2
noncomputable def source_75_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2400
noncomputable def tables_75_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨54, by decide +kernel⟩
    ⟨2399, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨580, by decide +kernel⟩,
  TableOp.marker
    ⟨56, by decide +kernel⟩
    ⟨2401, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2405, by decide +kernel⟩,
      ⟨2405, by decide +kernel⟩,
      ⟨2405, by decide +kernel⟩,
      ⟨2405, by decide +kernel⟩,
      ⟨2405, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2403, by decide +kernel⟩,
  TableOp.marker
    ⟨55, by decide +kernel⟩
    ⟨2404, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2408, by decide +kernel⟩,
      ⟨2408, by decide +kernel⟩,
      ⟨2408, by decide +kernel⟩,
      ⟨2408, by decide +kernel⟩,
      ⟨2408, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2406, by decide +kernel⟩,
  TableOp.marker
    ⟨57, by decide +kernel⟩
    ⟨2407, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨589, by decide +kernel⟩,
  TableOp.marker
    ⟨586, by decide +kernel⟩
    ⟨2409, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2413, by decide +kernel⟩,
      ⟨2413, by decide +kernel⟩,
      ⟨2413, by decide +kernel⟩,
      ⟨2413, by decide +kernel⟩,
      ⟨2413, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2411, by decide +kernel⟩,
  TableOp.marker
    ⟨592, by decide +kernel⟩
    ⟨2412, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨59, by decide +kernel⟩,
      ⟨59, by decide +kernel⟩,
      ⟨59, by decide +kernel⟩,
      ⟨59, by decide +kernel⟩,
      ⟨59, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨603, by decide +kernel⟩,
  TableOp.marker
    ⟨2414, by decide +kernel⟩
    ⟨2415, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨592, by decide +kernel⟩
    ⟨2414, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨595, by decide +kernel⟩,
  TableOp.marker
    ⟨2417, by decide +kernel⟩
    ⟨2418, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2422, by decide +kernel⟩,
      ⟨2422, by decide +kernel⟩,
      ⟨2422, by decide +kernel⟩,
      ⟨2422, by decide +kernel⟩,
      ⟨2422, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2420, by decide +kernel⟩,
  TableOp.marker
    ⟨58, by decide +kernel⟩
    ⟨2421, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2426, by decide +kernel⟩,
      ⟨2426, by decide +kernel⟩,
      ⟨2426, by decide +kernel⟩,
      ⟨2426, by decide +kernel⟩,
      ⟨2426, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨62, by decide +kernel⟩,
      ⟨62, by decide +kernel⟩,
      ⟨62, by decide +kernel⟩,
      ⟨62, by decide +kernel⟩,
      ⟨62, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2423, by decide +kernel⟩,
  TableOp.marker
    ⟨2424, by decide +kernel⟩
    ⟨2425, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2429, by decide +kernel⟩,
      ⟨2429, by decide +kernel⟩,
      ⟨2429, by decide +kernel⟩,
      ⟨2429, by decide +kernel⟩,
      ⟨2429, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2427, by decide +kernel⟩,
  TableOp.marker
    ⟨606, by decide +kernel⟩
    ⟨2428, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2424, by decide +kernel⟩
    ⟨606, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨609, by decide +kernel⟩
]
theorem fact_75_1 : source_75_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_75_1 := by
  decide +kernel
noncomputable def source_76_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2432
noncomputable def tables_76_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨2430, by decide +kernel⟩
    ⟨2431, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2435, by decide +kernel⟩,
      ⟨2435, by decide +kernel⟩,
      ⟨2435, by decide +kernel⟩,
      ⟨2435, by decide +kernel⟩,
      ⟨2435, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2433, by decide +kernel⟩,
  TableOp.marker
    ⟨59, by decide +kernel⟩
    ⟨2434, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨617, by decide +kernel⟩,
  TableOp.marker
    ⟨61, by decide +kernel⟩
    ⟨2436, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2440, by decide +kernel⟩,
      ⟨2440, by decide +kernel⟩,
      ⟨2440, by decide +kernel⟩,
      ⟨2440, by decide +kernel⟩,
      ⟨2440, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2438, by decide +kernel⟩,
  TableOp.marker
    ⟨60, by decide +kernel⟩
    ⟨2439, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2443, by decide +kernel⟩,
      ⟨2443, by decide +kernel⟩,
      ⟨2443, by decide +kernel⟩,
      ⟨2443, by decide +kernel⟩,
      ⟨2443, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2441, by decide +kernel⟩,
  TableOp.marker
    ⟨62, by decide +kernel⟩
    ⟨2442, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨622, by decide +kernel⟩,
  TableOp.marker
    ⟨64, by decide +kernel⟩
    ⟨2444, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2448, by decide +kernel⟩,
      ⟨2448, by decide +kernel⟩,
      ⟨2448, by decide +kernel⟩,
      ⟨2448, by decide +kernel⟩,
      ⟨2448, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2446, by decide +kernel⟩,
  TableOp.marker
    ⟨63, by decide +kernel⟩
    ⟨2447, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2451, by decide +kernel⟩,
      ⟨2451, by decide +kernel⟩,
      ⟨2451, by decide +kernel⟩,
      ⟨2451, by decide +kernel⟩,
      ⟨2451, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2449, by decide +kernel⟩,
  TableOp.marker
    ⟨65, by decide +kernel⟩
    ⟨2450, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨631, by decide +kernel⟩,
  TableOp.marker
    ⟨628, by decide +kernel⟩
    ⟨2452, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2456, by decide +kernel⟩,
      ⟨2456, by decide +kernel⟩,
      ⟨2456, by decide +kernel⟩,
      ⟨2456, by decide +kernel⟩,
      ⟨2456, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2454, by decide +kernel⟩,
  TableOp.marker
    ⟨634, by decide +kernel⟩
    ⟨2455, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2460, by decide +kernel⟩,
      ⟨2460, by decide +kernel⟩,
      ⟨2460, by decide +kernel⟩,
      ⟨2460, by decide +kernel⟩,
      ⟨2460, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨67, by decide +kernel⟩,
      ⟨67, by decide +kernel⟩,
      ⟨67, by decide +kernel⟩,
      ⟨67, by decide +kernel⟩,
      ⟨67, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2457, by decide +kernel⟩,
  TableOp.marker
    ⟨2458, by decide +kernel⟩
    ⟨2459, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨634, by decide +kernel⟩
    ⟨2458, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨637, by decide +kernel⟩,
  TableOp.marker
    ⟨2461, by decide +kernel⟩
    ⟨2462, by decide +kernel⟩
]
theorem fact_76_1 : source_76_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_76_1 := by
  decide +kernel
noncomputable def source_75_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_75_1 source_76_1
noncomputable def tables_75_2 : List (TableOp 4042) := tables_75_1 ++ tables_76_1
theorem fact_75_2 : source_75_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_75_2 :=
  source_tables_branch 32 source_75_1 source_76_1
    tables_75_1 tables_76_1 fact_75_1 fact_76_1
noncomputable def source_77_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2464
noncomputable def tables_77_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2466, by decide +kernel⟩,
      ⟨2466, by decide +kernel⟩,
      ⟨2466, by decide +kernel⟩,
      ⟨2466, by decide +kernel⟩,
      ⟨2466, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2464, by decide +kernel⟩,
  TableOp.marker
    ⟨66, by decide +kernel⟩
    ⟨2465, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨645, by decide +kernel⟩,
  TableOp.marker
    ⟨67, by decide +kernel⟩
    ⟨2467, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2472, by decide +kernel⟩,
      ⟨2472, by decide +kernel⟩,
      ⟨2472, by decide +kernel⟩,
      ⟨2472, by decide +kernel⟩,
      ⟨2472, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨69, by decide +kernel⟩,
      ⟨69, by decide +kernel⟩,
      ⟨69, by decide +kernel⟩,
      ⟨69, by decide +kernel⟩,
      ⟨69, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2469, by decide +kernel⟩,
  TableOp.marker
    ⟨2470, by decide +kernel⟩
    ⟨2471, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2475, by decide +kernel⟩,
      ⟨2475, by decide +kernel⟩,
      ⟨2475, by decide +kernel⟩,
      ⟨2475, by decide +kernel⟩,
      ⟨2475, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2473, by decide +kernel⟩,
  TableOp.marker
    ⟨648, by decide +kernel⟩
    ⟨2474, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨2470, by decide +kernel⟩
    ⟨648, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨651, by decide +kernel⟩,
  TableOp.marker
    ⟨2476, by decide +kernel⟩
    ⟨2477, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2481, by decide +kernel⟩,
      ⟨2481, by decide +kernel⟩,
      ⟨2481, by decide +kernel⟩,
      ⟨2481, by decide +kernel⟩,
      ⟨2481, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2479, by decide +kernel⟩,
  TableOp.marker
    ⟨68, by decide +kernel⟩
    ⟨2480, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2484, by decide +kernel⟩,
      ⟨2484, by decide +kernel⟩,
      ⟨2484, by decide +kernel⟩,
      ⟨2484, by decide +kernel⟩,
      ⟨2484, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2482, by decide +kernel⟩,
  TableOp.marker
    ⟨69, by decide +kernel⟩
    ⟨2483, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨659, by decide +kernel⟩,
  TableOp.marker
    ⟨71, by decide +kernel⟩
    ⟨2485, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2489, by decide +kernel⟩,
      ⟨2489, by decide +kernel⟩,
      ⟨2489, by decide +kernel⟩,
      ⟨2489, by decide +kernel⟩,
      ⟨2489, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2487, by decide +kernel⟩,
  TableOp.marker
    ⟨70, by decide +kernel⟩
    ⟨2488, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2492, by decide +kernel⟩,
      ⟨2492, by decide +kernel⟩,
      ⟨2492, by decide +kernel⟩,
      ⟨2492, by decide +kernel⟩,
      ⟨2492, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2490, by decide +kernel⟩,
  TableOp.marker
    ⟨72, by decide +kernel⟩
    ⟨2491, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2496, by decide +kernel⟩,
      ⟨2496, by decide +kernel⟩,
      ⟨2496, by decide +kernel⟩,
      ⟨2496, by decide +kernel⟩,
      ⟨2496, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨76, by decide +kernel⟩,
      ⟨76, by decide +kernel⟩,
      ⟨76, by decide +kernel⟩,
      ⟨76, by decide +kernel⟩,
      ⟨76, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2493, by decide +kernel⟩
]
theorem fact_77_1 : source_77_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_77_1 := by
  decide +kernel
noncomputable def source_78_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2496
noncomputable def tables_78_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨2494, by decide +kernel⟩
    ⟨2495, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2499, by decide +kernel⟩,
      ⟨2499, by decide +kernel⟩,
      ⟨2499, by decide +kernel⟩,
      ⟨2499, by decide +kernel⟩,
      ⟨2499, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2497, by decide +kernel⟩,
  TableOp.marker
    ⟨665, by decide +kernel⟩
    ⟨2498, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2494, by decide +kernel⟩
    ⟨665, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨668, by decide +kernel⟩,
  TableOp.marker
    ⟨2500, by decide +kernel⟩
    ⟨2501, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2505, by decide +kernel⟩,
      ⟨2505, by decide +kernel⟩,
      ⟨2505, by decide +kernel⟩,
      ⟨2505, by decide +kernel⟩,
      ⟨2505, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2503, by decide +kernel⟩,
  TableOp.marker
    ⟨73, by decide +kernel⟩
    ⟨2504, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨676, by decide +kernel⟩,
  TableOp.marker
    ⟨75, by decide +kernel⟩
    ⟨2506, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2510, by decide +kernel⟩,
      ⟨2510, by decide +kernel⟩,
      ⟨2510, by decide +kernel⟩,
      ⟨2510, by decide +kernel⟩,
      ⟨2510, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2508, by decide +kernel⟩,
  TableOp.marker
    ⟨74, by decide +kernel⟩
    ⟨2509, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2513, by decide +kernel⟩,
      ⟨2513, by decide +kernel⟩,
      ⟨2513, by decide +kernel⟩,
      ⟨2513, by decide +kernel⟩,
      ⟨2513, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2511, by decide +kernel⟩,
  TableOp.marker
    ⟨76, by decide +kernel⟩
    ⟨2512, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2516, by decide +kernel⟩,
      ⟨2516, by decide +kernel⟩,
      ⟨2516, by decide +kernel⟩,
      ⟨2516, by decide +kernel⟩,
      ⟨2516, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2514, by decide +kernel⟩,
  TableOp.marker
    ⟨682, by decide +kernel⟩
    ⟨2515, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2458, by decide +kernel⟩
    ⟨682, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨685, by decide +kernel⟩,
  TableOp.marker
    ⟨2517, by decide +kernel⟩
    ⟨2518, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2522, by decide +kernel⟩,
      ⟨2522, by decide +kernel⟩,
      ⟨2522, by decide +kernel⟩,
      ⟨2522, by decide +kernel⟩,
      ⟨2522, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2520, by decide +kernel⟩,
  TableOp.marker
    ⟨77, by decide +kernel⟩
    ⟨2521, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2526, by decide +kernel⟩,
      ⟨2526, by decide +kernel⟩,
      ⟨2526, by decide +kernel⟩,
      ⟨2526, by decide +kernel⟩,
      ⟨2526, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨81, by decide +kernel⟩,
      ⟨81, by decide +kernel⟩,
      ⟨81, by decide +kernel⟩,
      ⟨81, by decide +kernel⟩,
      ⟨81, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2523, by decide +kernel⟩,
  TableOp.marker
    ⟨2524, by decide +kernel⟩
    ⟨2525, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨78, by decide +kernel⟩,
      ⟨78, by decide +kernel⟩,
      ⟨78, by decide +kernel⟩,
      ⟨78, by decide +kernel⟩,
      ⟨78, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_78_1 : source_78_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_78_1 := by
  decide +kernel
noncomputable def source_77_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_77_1 source_78_1
noncomputable def tables_77_2 : List (TableOp 4042) := tables_77_1 ++ tables_78_1
theorem fact_77_2 : source_77_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_77_2 :=
  source_tables_branch 32 source_77_1 source_78_1
    tables_77_1 tables_78_1 fact_77_1 fact_78_1
noncomputable def source_75_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_75_2 source_77_2
noncomputable def tables_75_4 : List (TableOp 4042) := tables_75_2 ++ tables_77_2
theorem fact_75_4 : source_75_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_75_4 :=
  source_tables_branch 64 source_75_2 source_77_2
    tables_75_2 tables_77_2 fact_75_2 fact_77_2
noncomputable def source_71_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_71_4 source_75_4
noncomputable def tables_71_8 : List (TableOp 4042) := tables_71_4 ++ tables_75_4
theorem fact_71_8 : source_71_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_71_8 :=
  source_tables_branch 128 source_71_4 source_75_4
    tables_71_4 tables_75_4 fact_71_4 fact_75_4
noncomputable def source_63_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_63_8 source_71_8
noncomputable def tables_63_16 : List (TableOp 4042) := tables_63_8 ++ tables_71_8
theorem fact_63_16 : source_63_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_16 :=
  source_tables_branch 256 source_63_8 source_71_8
    tables_63_8 tables_71_8 fact_63_8 fact_71_8
noncomputable def source_79_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2528
noncomputable def tables_79_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨693, by decide +kernel⟩,
  TableOp.marker
    ⟨2527, by decide +kernel⟩
    ⟨2528, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2532, by decide +kernel⟩,
      ⟨2532, by decide +kernel⟩,
      ⟨2532, by decide +kernel⟩,
      ⟨2532, by decide +kernel⟩,
      ⟨2532, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2530, by decide +kernel⟩,
  TableOp.marker
    ⟨696, by decide +kernel⟩
    ⟨2531, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2524, by decide +kernel⟩
    ⟨696, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨699, by decide +kernel⟩,
  TableOp.marker
    ⟨2533, by decide +kernel⟩
    ⟨2534, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2538, by decide +kernel⟩,
      ⟨2538, by decide +kernel⟩,
      ⟨2538, by decide +kernel⟩,
      ⟨2538, by decide +kernel⟩,
      ⟨2538, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2536, by decide +kernel⟩,
  TableOp.marker
    ⟨78, by decide +kernel⟩
    ⟨2537, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨707, by decide +kernel⟩,
  TableOp.marker
    ⟨80, by decide +kernel⟩
    ⟨2539, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2543, by decide +kernel⟩,
      ⟨2543, by decide +kernel⟩,
      ⟨2543, by decide +kernel⟩,
      ⟨2543, by decide +kernel⟩,
      ⟨2543, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2541, by decide +kernel⟩,
  TableOp.marker
    ⟨79, by decide +kernel⟩
    ⟨2542, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2546, by decide +kernel⟩,
      ⟨2546, by decide +kernel⟩,
      ⟨2546, by decide +kernel⟩,
      ⟨2546, by decide +kernel⟩,
      ⟨2546, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2544, by decide +kernel⟩,
  TableOp.marker
    ⟨81, by decide +kernel⟩
    ⟨2545, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨83, by decide +kernel⟩,
      ⟨83, by decide +kernel⟩,
      ⟨83, by decide +kernel⟩,
      ⟨83, by decide +kernel⟩,
      ⟨83, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨724, by decide +kernel⟩,
  TableOp.marker
    ⟨2547, by decide +kernel⟩
    ⟨2548, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2552, by decide +kernel⟩,
      ⟨2552, by decide +kernel⟩,
      ⟨2552, by decide +kernel⟩,
      ⟨2552, by decide +kernel⟩,
      ⟨2552, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2550, by decide +kernel⟩,
  TableOp.marker
    ⟨713, by decide +kernel⟩
    ⟨2551, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2547, by decide +kernel⟩
    ⟨713, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨716, by decide +kernel⟩,
  TableOp.marker
    ⟨2553, by decide +kernel⟩
    ⟨2554, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2558, by decide +kernel⟩,
      ⟨2558, by decide +kernel⟩,
      ⟨2558, by decide +kernel⟩,
      ⟨2558, by decide +kernel⟩,
      ⟨2558, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2556, by decide +kernel⟩,
  TableOp.marker
    ⟨82, by decide +kernel⟩
    ⟨2557, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2562, by decide +kernel⟩,
      ⟨2562, by decide +kernel⟩,
      ⟨2562, by decide +kernel⟩,
      ⟨2562, by decide +kernel⟩,
      ⟨2562, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_79_1 : source_79_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_79_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t80\t{now}"
      handle.flush
noncomputable def source_80_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2560
noncomputable def tables_80_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨86, by decide +kernel⟩,
      ⟨86, by decide +kernel⟩,
      ⟨86, by decide +kernel⟩,
      ⟨86, by decide +kernel⟩,
      ⟨86, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2559, by decide +kernel⟩,
  TableOp.marker
    ⟨2560, by decide +kernel⟩
    ⟨2561, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2565, by decide +kernel⟩,
      ⟨2565, by decide +kernel⟩,
      ⟨2565, by decide +kernel⟩,
      ⟨2565, by decide +kernel⟩,
      ⟨2565, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2563, by decide +kernel⟩,
  TableOp.marker
    ⟨727, by decide +kernel⟩
    ⟨2564, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2560, by decide +kernel⟩
    ⟨727, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨730, by decide +kernel⟩,
  TableOp.marker
    ⟨2566, by decide +kernel⟩
    ⟨2567, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2571, by decide +kernel⟩,
      ⟨2571, by decide +kernel⟩,
      ⟨2571, by decide +kernel⟩,
      ⟨2571, by decide +kernel⟩,
      ⟨2571, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2569, by decide +kernel⟩,
  TableOp.marker
    ⟨83, by decide +kernel⟩
    ⟨2570, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨738, by decide +kernel⟩,
  TableOp.marker
    ⟨85, by decide +kernel⟩
    ⟨2572, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2576, by decide +kernel⟩,
      ⟨2576, by decide +kernel⟩,
      ⟨2576, by decide +kernel⟩,
      ⟨2576, by decide +kernel⟩,
      ⟨2576, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2574, by decide +kernel⟩,
  TableOp.marker
    ⟨84, by decide +kernel⟩
    ⟨2575, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2579, by decide +kernel⟩,
      ⟨2579, by decide +kernel⟩,
      ⟨2579, by decide +kernel⟩,
      ⟨2579, by decide +kernel⟩,
      ⟨2579, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2577, by decide +kernel⟩,
  TableOp.marker
    ⟨86, by decide +kernel⟩
    ⟨2578, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2583, by decide +kernel⟩,
      ⟨2583, by decide +kernel⟩,
      ⟨2583, by decide +kernel⟩,
      ⟨2583, by decide +kernel⟩,
      ⟨2583, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨88, by decide +kernel⟩,
      ⟨88, by decide +kernel⟩,
      ⟨88, by decide +kernel⟩,
      ⟨88, by decide +kernel⟩,
      ⟨88, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2580, by decide +kernel⟩,
  TableOp.marker
    ⟨2581, by decide +kernel⟩
    ⟨2582, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2586, by decide +kernel⟩,
      ⟨2586, by decide +kernel⟩,
      ⟨2586, by decide +kernel⟩,
      ⟨2586, by decide +kernel⟩,
      ⟨2586, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2584, by decide +kernel⟩,
  TableOp.marker
    ⟨744, by decide +kernel⟩
    ⟨2585, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2581, by decide +kernel⟩
    ⟨744, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨747, by decide +kernel⟩,
  TableOp.marker
    ⟨2587, by decide +kernel⟩
    ⟨2588, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2592, by decide +kernel⟩,
      ⟨2592, by decide +kernel⟩,
      ⟨2592, by decide +kernel⟩,
      ⟨2592, by decide +kernel⟩,
      ⟨2592, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2590, by decide +kernel⟩
]
theorem fact_80_1 : source_80_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_80_1 := by
  decide +kernel
noncomputable def source_79_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_79_1 source_80_1
noncomputable def tables_79_2 : List (TableOp 4042) := tables_79_1 ++ tables_80_1
theorem fact_79_2 : source_79_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_79_2 :=
  source_tables_branch 32 source_79_1 source_80_1
    tables_79_1 tables_80_1 fact_79_1 fact_80_1
noncomputable def source_81_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2592
noncomputable def tables_81_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨87, by decide +kernel⟩
    ⟨2591, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨755, by decide +kernel⟩,
  TableOp.marker
    ⟨88, by decide +kernel⟩
    ⟨2593, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2597, by decide +kernel⟩,
      ⟨2597, by decide +kernel⟩,
      ⟨2597, by decide +kernel⟩,
      ⟨2597, by decide +kernel⟩,
      ⟨2597, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2595, by decide +kernel⟩,
  TableOp.marker
    ⟨758, by decide +kernel⟩
    ⟨2596, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2601, by decide +kernel⟩,
      ⟨2601, by decide +kernel⟩,
      ⟨2601, by decide +kernel⟩,
      ⟨2601, by decide +kernel⟩,
      ⟨2601, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨90, by decide +kernel⟩,
      ⟨90, by decide +kernel⟩,
      ⟨90, by decide +kernel⟩,
      ⟨90, by decide +kernel⟩,
      ⟨90, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2598, by decide +kernel⟩,
  TableOp.marker
    ⟨2599, by decide +kernel⟩
    ⟨2600, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨91, by decide +kernel⟩,
      ⟨91, by decide +kernel⟩,
      ⟨91, by decide +kernel⟩,
      ⟨91, by decide +kernel⟩,
      ⟨91, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨761, by decide +kernel⟩,
  TableOp.marker
    ⟨2602, by decide +kernel⟩
    ⟨2603, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2607, by decide +kernel⟩,
      ⟨2607, by decide +kernel⟩,
      ⟨2607, by decide +kernel⟩,
      ⟨2607, by decide +kernel⟩,
      ⟨2607, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2605, by decide +kernel⟩,
  TableOp.marker
    ⟨764, by decide +kernel⟩
    ⟨2606, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2602, by decide +kernel⟩
    ⟨764, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨767, by decide +kernel⟩,
  TableOp.marker
    ⟨2608, by decide +kernel⟩
    ⟨2609, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2613, by decide +kernel⟩,
      ⟨2613, by decide +kernel⟩,
      ⟨2613, by decide +kernel⟩,
      ⟨2613, by decide +kernel⟩,
      ⟨2613, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2611, by decide +kernel⟩,
  TableOp.marker
    ⟨771, by decide +kernel⟩
    ⟨2612, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2617, by decide +kernel⟩,
      ⟨2617, by decide +kernel⟩,
      ⟨2617, by decide +kernel⟩,
      ⟨2617, by decide +kernel⟩,
      ⟨2617, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2599, by decide +kernel⟩
    ⟨771, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2614, by decide +kernel⟩,
  TableOp.marker
    ⟨2615, by decide +kernel⟩
    ⟨2616, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨758, by decide +kernel⟩
    ⟨2615, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨774, by decide +kernel⟩,
  TableOp.marker
    ⟨2618, by decide +kernel⟩
    ⟨2619, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2623, by decide +kernel⟩,
      ⟨2623, by decide +kernel⟩,
      ⟨2623, by decide +kernel⟩,
      ⟨2623, by decide +kernel⟩,
      ⟨2623, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2621, by decide +kernel⟩,
  TableOp.marker
    ⟨89, by decide +kernel⟩
    ⟨2622, by decide +kernel⟩
]
theorem fact_81_1 : source_81_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_81_1 := by
  decide +kernel
noncomputable def source_82_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2624
noncomputable def tables_82_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2626, by decide +kernel⟩,
      ⟨2626, by decide +kernel⟩,
      ⟨2626, by decide +kernel⟩,
      ⟨2626, by decide +kernel⟩,
      ⟨2626, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2624, by decide +kernel⟩,
  TableOp.marker
    ⟨90, by decide +kernel⟩
    ⟨2625, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨92, by decide +kernel⟩,
      ⟨92, by decide +kernel⟩,
      ⟨92, by decide +kernel⟩,
      ⟨92, by decide +kernel⟩,
      ⟨92, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨794, by decide +kernel⟩,
  TableOp.marker
    ⟨2627, by decide +kernel⟩
    ⟨2628, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2632, by decide +kernel⟩,
      ⟨2632, by decide +kernel⟩,
      ⟨2632, by decide +kernel⟩,
      ⟨2632, by decide +kernel⟩,
      ⟨2632, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2630, by decide +kernel⟩,
  TableOp.marker
    ⟨783, by decide +kernel⟩
    ⟨2631, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2627, by decide +kernel⟩
    ⟨783, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨786, by decide +kernel⟩,
  TableOp.marker
    ⟨2633, by decide +kernel⟩
    ⟨2634, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2638, by decide +kernel⟩,
      ⟨2638, by decide +kernel⟩,
      ⟨2638, by decide +kernel⟩,
      ⟨2638, by decide +kernel⟩,
      ⟨2638, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2636, by decide +kernel⟩,
  TableOp.marker
    ⟨91, by decide +kernel⟩
    ⟨2637, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2641, by decide +kernel⟩,
      ⟨2641, by decide +kernel⟩,
      ⟨2641, by decide +kernel⟩,
      ⟨2641, by decide +kernel⟩,
      ⟨2641, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2639, by decide +kernel⟩,
  TableOp.marker
    ⟨797, by decide +kernel⟩
    ⟨2640, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2645, by decide +kernel⟩,
      ⟨2645, by decide +kernel⟩,
      ⟨2645, by decide +kernel⟩,
      ⟨2645, by decide +kernel⟩,
      ⟨2645, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨93, by decide +kernel⟩,
      ⟨93, by decide +kernel⟩,
      ⟨93, by decide +kernel⟩,
      ⟨93, by decide +kernel⟩,
      ⟨93, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2642, by decide +kernel⟩,
  TableOp.marker
    ⟨2643, by decide +kernel⟩
    ⟨2644, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨94, by decide +kernel⟩,
      ⟨94, by decide +kernel⟩,
      ⟨94, by decide +kernel⟩,
      ⟨94, by decide +kernel⟩,
      ⟨94, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨800, by decide +kernel⟩,
  TableOp.marker
    ⟨2646, by decide +kernel⟩
    ⟨2647, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2651, by decide +kernel⟩,
      ⟨2651, by decide +kernel⟩,
      ⟨2651, by decide +kernel⟩,
      ⟨2651, by decide +kernel⟩,
      ⟨2651, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2649, by decide +kernel⟩,
  TableOp.marker
    ⟨803, by decide +kernel⟩
    ⟨2650, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2646, by decide +kernel⟩
    ⟨803, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨806, by decide +kernel⟩,
  TableOp.marker
    ⟨2652, by decide +kernel⟩
    ⟨2653, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2657, by decide +kernel⟩,
      ⟨2657, by decide +kernel⟩,
      ⟨2657, by decide +kernel⟩,
      ⟨2657, by decide +kernel⟩,
      ⟨2657, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_82_1 : source_82_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_82_1 := by
  decide +kernel
noncomputable def source_81_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_81_1 source_82_1
noncomputable def tables_81_2 : List (TableOp 4042) := tables_81_1 ++ tables_82_1
theorem fact_81_2 : source_81_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_81_2 :=
  source_tables_branch 32 source_81_1 source_82_1
    tables_81_1 tables_82_1 fact_81_1 fact_82_1
noncomputable def source_79_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_79_2 source_81_2
noncomputable def tables_79_4 : List (TableOp 4042) := tables_79_2 ++ tables_81_2
theorem fact_79_4 : source_79_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_79_4 :=
  source_tables_branch 64 source_79_2 source_81_2
    tables_79_2 tables_81_2 fact_79_2 fact_81_2
noncomputable def source_83_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2656
noncomputable def tables_83_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨2655, by decide +kernel⟩,
  TableOp.marker
    ⟨810, by decide +kernel⟩
    ⟨2656, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2661, by decide +kernel⟩,
      ⟨2661, by decide +kernel⟩,
      ⟨2661, by decide +kernel⟩,
      ⟨2661, by decide +kernel⟩,
      ⟨2661, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2643, by decide +kernel⟩
    ⟨810, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2658, by decide +kernel⟩,
  TableOp.marker
    ⟨2659, by decide +kernel⟩
    ⟨2660, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨797, by decide +kernel⟩
    ⟨2659, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨813, by decide +kernel⟩,
  TableOp.marker
    ⟨2662, by decide +kernel⟩
    ⟨2663, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2667, by decide +kernel⟩,
      ⟨2667, by decide +kernel⟩,
      ⟨2667, by decide +kernel⟩,
      ⟨2667, by decide +kernel⟩,
      ⟨2667, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2665, by decide +kernel⟩,
  TableOp.marker
    ⟨92, by decide +kernel⟩
    ⟨2666, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2670, by decide +kernel⟩,
      ⟨2670, by decide +kernel⟩,
      ⟨2670, by decide +kernel⟩,
      ⟨2670, by decide +kernel⟩,
      ⟨2670, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2668, by decide +kernel⟩,
  TableOp.marker
    ⟨93, by decide +kernel⟩
    ⟨2669, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨95, by decide +kernel⟩,
      ⟨95, by decide +kernel⟩,
      ⟨95, by decide +kernel⟩,
      ⟨95, by decide +kernel⟩,
      ⟨95, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨833, by decide +kernel⟩,
  TableOp.marker
    ⟨2671, by decide +kernel⟩
    ⟨2672, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2676, by decide +kernel⟩,
      ⟨2676, by decide +kernel⟩,
      ⟨2676, by decide +kernel⟩,
      ⟨2676, by decide +kernel⟩,
      ⟨2676, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2674, by decide +kernel⟩,
  TableOp.marker
    ⟨822, by decide +kernel⟩
    ⟨2675, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2671, by decide +kernel⟩
    ⟨822, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨825, by decide +kernel⟩,
  TableOp.marker
    ⟨2677, by decide +kernel⟩
    ⟨2678, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2682, by decide +kernel⟩,
      ⟨2682, by decide +kernel⟩,
      ⟨2682, by decide +kernel⟩,
      ⟨2682, by decide +kernel⟩,
      ⟨2682, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2680, by decide +kernel⟩,
  TableOp.marker
    ⟨94, by decide +kernel⟩
    ⟨2681, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2685, by decide +kernel⟩,
      ⟨2685, by decide +kernel⟩,
      ⟨2685, by decide +kernel⟩,
      ⟨2685, by decide +kernel⟩,
      ⟨2685, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2683, by decide +kernel⟩,
  TableOp.marker
    ⟨836, by decide +kernel⟩
    ⟨2684, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2689, by decide +kernel⟩,
      ⟨2689, by decide +kernel⟩,
      ⟨2689, by decide +kernel⟩,
      ⟨2689, by decide +kernel⟩,
      ⟨2689, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨96, by decide +kernel⟩,
      ⟨96, by decide +kernel⟩,
      ⟨96, by decide +kernel⟩,
      ⟨96, by decide +kernel⟩,
      ⟨96, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_83_1 : source_83_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_83_1 := by
  decide +kernel
noncomputable def source_84_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2688
noncomputable def tables_84_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨2686, by decide +kernel⟩,
  TableOp.marker
    ⟨2687, by decide +kernel⟩
    ⟨2688, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨97, by decide +kernel⟩,
      ⟨97, by decide +kernel⟩,
      ⟨97, by decide +kernel⟩,
      ⟨97, by decide +kernel⟩,
      ⟨97, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨839, by decide +kernel⟩,
  TableOp.marker
    ⟨2690, by decide +kernel⟩
    ⟨2691, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2695, by decide +kernel⟩,
      ⟨2695, by decide +kernel⟩,
      ⟨2695, by decide +kernel⟩,
      ⟨2695, by decide +kernel⟩,
      ⟨2695, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2693, by decide +kernel⟩,
  TableOp.marker
    ⟨842, by decide +kernel⟩
    ⟨2694, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2690, by decide +kernel⟩
    ⟨842, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨845, by decide +kernel⟩,
  TableOp.marker
    ⟨2696, by decide +kernel⟩
    ⟨2697, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2701, by decide +kernel⟩,
      ⟨2701, by decide +kernel⟩,
      ⟨2701, by decide +kernel⟩,
      ⟨2701, by decide +kernel⟩,
      ⟨2701, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2699, by decide +kernel⟩,
  TableOp.marker
    ⟨849, by decide +kernel⟩
    ⟨2700, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2705, by decide +kernel⟩,
      ⟨2705, by decide +kernel⟩,
      ⟨2705, by decide +kernel⟩,
      ⟨2705, by decide +kernel⟩,
      ⟨2705, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2687, by decide +kernel⟩
    ⟨849, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2702, by decide +kernel⟩,
  TableOp.marker
    ⟨2703, by decide +kernel⟩
    ⟨2704, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨836, by decide +kernel⟩
    ⟨2703, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨852, by decide +kernel⟩,
  TableOp.marker
    ⟨2706, by decide +kernel⟩
    ⟨2707, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2711, by decide +kernel⟩,
      ⟨2711, by decide +kernel⟩,
      ⟨2711, by decide +kernel⟩,
      ⟨2711, by decide +kernel⟩,
      ⟨2711, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2709, by decide +kernel⟩,
  TableOp.marker
    ⟨95, by decide +kernel⟩
    ⟨2710, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2714, by decide +kernel⟩,
      ⟨2714, by decide +kernel⟩,
      ⟨2714, by decide +kernel⟩,
      ⟨2714, by decide +kernel⟩,
      ⟨2714, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2712, by decide +kernel⟩,
  TableOp.marker
    ⟨96, by decide +kernel⟩
    ⟨2713, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨98, by decide +kernel⟩,
      ⟨98, by decide +kernel⟩,
      ⟨98, by decide +kernel⟩,
      ⟨98, by decide +kernel⟩,
      ⟨98, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨872, by decide +kernel⟩,
  TableOp.marker
    ⟨2715, by decide +kernel⟩
    ⟨2716, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2720, by decide +kernel⟩,
      ⟨2720, by decide +kernel⟩,
      ⟨2720, by decide +kernel⟩,
      ⟨2720, by decide +kernel⟩,
      ⟨2720, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2718, by decide +kernel⟩
]
theorem fact_84_1 : source_84_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_84_1 := by
  decide +kernel
noncomputable def source_83_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_83_1 source_84_1
noncomputable def tables_83_2 : List (TableOp 4042) := tables_83_1 ++ tables_84_1
theorem fact_83_2 : source_83_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_83_2 :=
  source_tables_branch 32 source_83_1 source_84_1
    tables_83_1 tables_84_1 fact_83_1 fact_84_1
noncomputable def source_85_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2720
noncomputable def tables_85_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨861, by decide +kernel⟩
    ⟨2719, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2715, by decide +kernel⟩
    ⟨861, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨864, by decide +kernel⟩,
  TableOp.marker
    ⟨2721, by decide +kernel⟩
    ⟨2722, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2726, by decide +kernel⟩,
      ⟨2726, by decide +kernel⟩,
      ⟨2726, by decide +kernel⟩,
      ⟨2726, by decide +kernel⟩,
      ⟨2726, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2724, by decide +kernel⟩,
  TableOp.marker
    ⟨97, by decide +kernel⟩
    ⟨2725, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2729, by decide +kernel⟩,
      ⟨2729, by decide +kernel⟩,
      ⟨2729, by decide +kernel⟩,
      ⟨2729, by decide +kernel⟩,
      ⟨2729, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2727, by decide +kernel⟩,
  TableOp.marker
    ⟨875, by decide +kernel⟩
    ⟨2728, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2733, by decide +kernel⟩,
      ⟨2733, by decide +kernel⟩,
      ⟨2733, by decide +kernel⟩,
      ⟨2733, by decide +kernel⟩,
      ⟨2733, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨99, by decide +kernel⟩,
      ⟨99, by decide +kernel⟩,
      ⟨99, by decide +kernel⟩,
      ⟨99, by decide +kernel⟩,
      ⟨99, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2730, by decide +kernel⟩,
  TableOp.marker
    ⟨2731, by decide +kernel⟩
    ⟨2732, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨100, by decide +kernel⟩,
      ⟨100, by decide +kernel⟩,
      ⟨100, by decide +kernel⟩,
      ⟨100, by decide +kernel⟩,
      ⟨100, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨878, by decide +kernel⟩,
  TableOp.marker
    ⟨2734, by decide +kernel⟩
    ⟨2735, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2739, by decide +kernel⟩,
      ⟨2739, by decide +kernel⟩,
      ⟨2739, by decide +kernel⟩,
      ⟨2739, by decide +kernel⟩,
      ⟨2739, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2737, by decide +kernel⟩,
  TableOp.marker
    ⟨881, by decide +kernel⟩
    ⟨2738, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2734, by decide +kernel⟩
    ⟨881, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨884, by decide +kernel⟩,
  TableOp.marker
    ⟨2740, by decide +kernel⟩
    ⟨2741, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2745, by decide +kernel⟩,
      ⟨2745, by decide +kernel⟩,
      ⟨2745, by decide +kernel⟩,
      ⟨2745, by decide +kernel⟩,
      ⟨2745, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2743, by decide +kernel⟩,
  TableOp.marker
    ⟨888, by decide +kernel⟩
    ⟨2744, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2749, by decide +kernel⟩,
      ⟨2749, by decide +kernel⟩,
      ⟨2749, by decide +kernel⟩,
      ⟨2749, by decide +kernel⟩,
      ⟨2749, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2731, by decide +kernel⟩
    ⟨888, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2746, by decide +kernel⟩,
  TableOp.marker
    ⟨2747, by decide +kernel⟩
    ⟨2748, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨875, by decide +kernel⟩
    ⟨2747, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨891, by decide +kernel⟩
]
theorem fact_85_1 : source_85_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_85_1 := by
  decide +kernel
noncomputable def source_86_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2752
noncomputable def tables_86_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨2750, by decide +kernel⟩
    ⟨2751, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2755, by decide +kernel⟩,
      ⟨2755, by decide +kernel⟩,
      ⟨2755, by decide +kernel⟩,
      ⟨2755, by decide +kernel⟩,
      ⟨2755, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2753, by decide +kernel⟩,
  TableOp.marker
    ⟨98, by decide +kernel⟩
    ⟨2754, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1168, by decide +kernel⟩,
  TableOp.marker
    ⟨99, by decide +kernel⟩
    ⟨2756, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨101, by decide +kernel⟩,
      ⟨101, by decide +kernel⟩,
      ⟨101, by decide +kernel⟩,
      ⟨101, by decide +kernel⟩,
      ⟨101, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨911, by decide +kernel⟩,
  TableOp.marker
    ⟨2758, by decide +kernel⟩
    ⟨2759, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2763, by decide +kernel⟩,
      ⟨2763, by decide +kernel⟩,
      ⟨2763, by decide +kernel⟩,
      ⟨2763, by decide +kernel⟩,
      ⟨2763, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2761, by decide +kernel⟩,
  TableOp.marker
    ⟨900, by decide +kernel⟩
    ⟨2762, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2758, by decide +kernel⟩
    ⟨900, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨903, by decide +kernel⟩,
  TableOp.marker
    ⟨2764, by decide +kernel⟩
    ⟨2765, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2769, by decide +kernel⟩,
      ⟨2769, by decide +kernel⟩,
      ⟨2769, by decide +kernel⟩,
      ⟨2769, by decide +kernel⟩,
      ⟨2769, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2767, by decide +kernel⟩,
  TableOp.marker
    ⟨100, by decide +kernel⟩
    ⟨2768, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2772, by decide +kernel⟩,
      ⟨2772, by decide +kernel⟩,
      ⟨2772, by decide +kernel⟩,
      ⟨2772, by decide +kernel⟩,
      ⟨2772, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2770, by decide +kernel⟩,
  TableOp.marker
    ⟨914, by decide +kernel⟩
    ⟨2771, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2776, by decide +kernel⟩,
      ⟨2776, by decide +kernel⟩,
      ⟨2776, by decide +kernel⟩,
      ⟨2776, by decide +kernel⟩,
      ⟨2776, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨102, by decide +kernel⟩,
      ⟨102, by decide +kernel⟩,
      ⟨102, by decide +kernel⟩,
      ⟨102, by decide +kernel⟩,
      ⟨102, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2773, by decide +kernel⟩,
  TableOp.marker
    ⟨2774, by decide +kernel⟩
    ⟨2775, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨103, by decide +kernel⟩,
      ⟨103, by decide +kernel⟩,
      ⟨103, by decide +kernel⟩,
      ⟨103, by decide +kernel⟩,
      ⟨103, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨917, by decide +kernel⟩,
  TableOp.marker
    ⟨2777, by decide +kernel⟩
    ⟨2778, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2782, by decide +kernel⟩,
      ⟨2782, by decide +kernel⟩,
      ⟨2782, by decide +kernel⟩,
      ⟨2782, by decide +kernel⟩,
      ⟨2782, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2780, by decide +kernel⟩,
  TableOp.marker
    ⟨920, by decide +kernel⟩
    ⟨2781, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2777, by decide +kernel⟩
    ⟨920, by decide +kernel⟩
]
theorem fact_86_1 : source_86_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_86_1 := by
  decide +kernel
noncomputable def source_85_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_85_1 source_86_1
noncomputable def tables_85_2 : List (TableOp 4042) := tables_85_1 ++ tables_86_1
theorem fact_85_2 : source_85_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_85_2 :=
  source_tables_branch 32 source_85_1 source_86_1
    tables_85_1 tables_86_1 fact_85_1 fact_86_1
noncomputable def source_83_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_83_2 source_85_2
noncomputable def tables_83_4 : List (TableOp 4042) := tables_83_2 ++ tables_85_2
theorem fact_83_4 : source_83_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_83_4 :=
  source_tables_branch 64 source_83_2 source_85_2
    tables_83_2 tables_85_2 fact_83_2 fact_85_2
noncomputable def source_79_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_79_4 source_83_4
noncomputable def tables_79_8 : List (TableOp 4042) := tables_79_4 ++ tables_83_4
theorem fact_79_8 : source_79_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_79_8 :=
  source_tables_branch 128 source_79_4 source_83_4
    tables_79_4 tables_83_4 fact_79_4 fact_83_4
noncomputable def source_87_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2784
noncomputable def tables_87_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨923, by decide +kernel⟩,
  TableOp.marker
    ⟨2783, by decide +kernel⟩
    ⟨2784, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2788, by decide +kernel⟩,
      ⟨2788, by decide +kernel⟩,
      ⟨2788, by decide +kernel⟩,
      ⟨2788, by decide +kernel⟩,
      ⟨2788, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2786, by decide +kernel⟩,
  TableOp.marker
    ⟨927, by decide +kernel⟩
    ⟨2787, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2792, by decide +kernel⟩,
      ⟨2792, by decide +kernel⟩,
      ⟨2792, by decide +kernel⟩,
      ⟨2792, by decide +kernel⟩,
      ⟨2792, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2774, by decide +kernel⟩
    ⟨927, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2789, by decide +kernel⟩,
  TableOp.marker
    ⟨2790, by decide +kernel⟩
    ⟨2791, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨914, by decide +kernel⟩
    ⟨2790, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨930, by decide +kernel⟩,
  TableOp.marker
    ⟨2793, by decide +kernel⟩
    ⟨2794, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2798, by decide +kernel⟩,
      ⟨2798, by decide +kernel⟩,
      ⟨2798, by decide +kernel⟩,
      ⟨2798, by decide +kernel⟩,
      ⟨2798, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2796, by decide +kernel⟩,
  TableOp.marker
    ⟨101, by decide +kernel⟩
    ⟨2797, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1275, by decide +kernel⟩,
  TableOp.marker
    ⟨102, by decide +kernel⟩
    ⟨2799, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨104, by decide +kernel⟩,
      ⟨104, by decide +kernel⟩,
      ⟨104, by decide +kernel⟩,
      ⟨104, by decide +kernel⟩,
      ⟨104, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨950, by decide +kernel⟩,
  TableOp.marker
    ⟨2801, by decide +kernel⟩
    ⟨2802, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2806, by decide +kernel⟩,
      ⟨2806, by decide +kernel⟩,
      ⟨2806, by decide +kernel⟩,
      ⟨2806, by decide +kernel⟩,
      ⟨2806, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2804, by decide +kernel⟩,
  TableOp.marker
    ⟨939, by decide +kernel⟩
    ⟨2805, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2801, by decide +kernel⟩
    ⟨939, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨942, by decide +kernel⟩,
  TableOp.marker
    ⟨2807, by decide +kernel⟩
    ⟨2808, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2812, by decide +kernel⟩,
      ⟨2812, by decide +kernel⟩,
      ⟨2812, by decide +kernel⟩,
      ⟨2812, by decide +kernel⟩,
      ⟨2812, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2810, by decide +kernel⟩,
  TableOp.marker
    ⟨103, by decide +kernel⟩
    ⟨2811, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2815, by decide +kernel⟩,
      ⟨2815, by decide +kernel⟩,
      ⟨2815, by decide +kernel⟩,
      ⟨2815, by decide +kernel⟩,
      ⟨2815, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2813, by decide +kernel⟩,
  TableOp.marker
    ⟨953, by decide +kernel⟩
    ⟨2814, by decide +kernel⟩
]
theorem fact_87_1 : source_87_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_87_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t88\t{now}"
      handle.flush
noncomputable def source_88_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2816
noncomputable def tables_88_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨2819, by decide +kernel⟩,
      ⟨2819, by decide +kernel⟩,
      ⟨2819, by decide +kernel⟩,
      ⟨2819, by decide +kernel⟩,
      ⟨2819, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨105, by decide +kernel⟩,
      ⟨105, by decide +kernel⟩,
      ⟨105, by decide +kernel⟩,
      ⟨105, by decide +kernel⟩,
      ⟨105, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2816, by decide +kernel⟩,
  TableOp.marker
    ⟨2817, by decide +kernel⟩
    ⟨2818, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨106, by decide +kernel⟩,
      ⟨106, by decide +kernel⟩,
      ⟨106, by decide +kernel⟩,
      ⟨106, by decide +kernel⟩,
      ⟨106, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨956, by decide +kernel⟩,
  TableOp.marker
    ⟨2820, by decide +kernel⟩
    ⟨2821, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2825, by decide +kernel⟩,
      ⟨2825, by decide +kernel⟩,
      ⟨2825, by decide +kernel⟩,
      ⟨2825, by decide +kernel⟩,
      ⟨2825, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2823, by decide +kernel⟩,
  TableOp.marker
    ⟨959, by decide +kernel⟩
    ⟨2824, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2820, by decide +kernel⟩
    ⟨959, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨962, by decide +kernel⟩,
  TableOp.marker
    ⟨2826, by decide +kernel⟩
    ⟨2827, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2831, by decide +kernel⟩,
      ⟨2831, by decide +kernel⟩,
      ⟨2831, by decide +kernel⟩,
      ⟨2831, by decide +kernel⟩,
      ⟨2831, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2829, by decide +kernel⟩,
  TableOp.marker
    ⟨966, by decide +kernel⟩
    ⟨2830, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2835, by decide +kernel⟩,
      ⟨2835, by decide +kernel⟩,
      ⟨2835, by decide +kernel⟩,
      ⟨2835, by decide +kernel⟩,
      ⟨2835, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2817, by decide +kernel⟩
    ⟨966, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2832, by decide +kernel⟩,
  TableOp.marker
    ⟨2833, by decide +kernel⟩
    ⟨2834, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨953, by decide +kernel⟩
    ⟨2833, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨969, by decide +kernel⟩,
  TableOp.marker
    ⟨2836, by decide +kernel⟩
    ⟨2837, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2841, by decide +kernel⟩,
      ⟨2841, by decide +kernel⟩,
      ⟨2841, by decide +kernel⟩,
      ⟨2841, by decide +kernel⟩,
      ⟨2841, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2839, by decide +kernel⟩,
  TableOp.marker
    ⟨104, by decide +kernel⟩
    ⟨2840, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1381, by decide +kernel⟩,
  TableOp.marker
    ⟨105, by decide +kernel⟩
    ⟨2842, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨107, by decide +kernel⟩,
      ⟨107, by decide +kernel⟩,
      ⟨107, by decide +kernel⟩,
      ⟨107, by decide +kernel⟩,
      ⟨107, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨989, by decide +kernel⟩,
  TableOp.marker
    ⟨2844, by decide +kernel⟩
    ⟨2845, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2849, by decide +kernel⟩,
      ⟨2849, by decide +kernel⟩,
      ⟨2849, by decide +kernel⟩,
      ⟨2849, by decide +kernel⟩,
      ⟨2849, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_88_1 : source_88_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_88_1 := by
  decide +kernel
noncomputable def source_87_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_87_1 source_88_1
noncomputable def tables_87_2 : List (TableOp 4042) := tables_87_1 ++ tables_88_1
theorem fact_87_2 : source_87_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_87_2 :=
  source_tables_branch 32 source_87_1 source_88_1
    tables_87_1 tables_88_1 fact_87_1 fact_88_1
noncomputable def source_89_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2848
noncomputable def tables_89_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨2847, by decide +kernel⟩,
  TableOp.marker
    ⟨978, by decide +kernel⟩
    ⟨2848, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2844, by decide +kernel⟩
    ⟨978, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨981, by decide +kernel⟩,
  TableOp.marker
    ⟨2850, by decide +kernel⟩
    ⟨2851, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2855, by decide +kernel⟩,
      ⟨2855, by decide +kernel⟩,
      ⟨2855, by decide +kernel⟩,
      ⟨2855, by decide +kernel⟩,
      ⟨2855, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2853, by decide +kernel⟩,
  TableOp.marker
    ⟨106, by decide +kernel⟩
    ⟨2854, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2858, by decide +kernel⟩,
      ⟨2858, by decide +kernel⟩,
      ⟨2858, by decide +kernel⟩,
      ⟨2858, by decide +kernel⟩,
      ⟨2858, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2856, by decide +kernel⟩,
  TableOp.marker
    ⟨992, by decide +kernel⟩
    ⟨2857, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2862, by decide +kernel⟩,
      ⟨2862, by decide +kernel⟩,
      ⟨2862, by decide +kernel⟩,
      ⟨2862, by decide +kernel⟩,
      ⟨2862, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨108, by decide +kernel⟩,
      ⟨108, by decide +kernel⟩,
      ⟨108, by decide +kernel⟩,
      ⟨108, by decide +kernel⟩,
      ⟨108, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2859, by decide +kernel⟩,
  TableOp.marker
    ⟨2860, by decide +kernel⟩
    ⟨2861, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨109, by decide +kernel⟩,
      ⟨109, by decide +kernel⟩,
      ⟨109, by decide +kernel⟩,
      ⟨109, by decide +kernel⟩,
      ⟨109, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨995, by decide +kernel⟩,
  TableOp.marker
    ⟨2863, by decide +kernel⟩
    ⟨2864, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2868, by decide +kernel⟩,
      ⟨2868, by decide +kernel⟩,
      ⟨2868, by decide +kernel⟩,
      ⟨2868, by decide +kernel⟩,
      ⟨2868, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2866, by decide +kernel⟩,
  TableOp.marker
    ⟨998, by decide +kernel⟩
    ⟨2867, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2863, by decide +kernel⟩
    ⟨998, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1001, by decide +kernel⟩,
  TableOp.marker
    ⟨2869, by decide +kernel⟩
    ⟨2870, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2874, by decide +kernel⟩,
      ⟨2874, by decide +kernel⟩,
      ⟨2874, by decide +kernel⟩,
      ⟨2874, by decide +kernel⟩,
      ⟨2874, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2872, by decide +kernel⟩,
  TableOp.marker
    ⟨1005, by decide +kernel⟩
    ⟨2873, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2878, by decide +kernel⟩,
      ⟨2878, by decide +kernel⟩,
      ⟨2878, by decide +kernel⟩,
      ⟨2878, by decide +kernel⟩,
      ⟨2878, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2860, by decide +kernel⟩
    ⟨1005, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2875, by decide +kernel⟩,
  TableOp.marker
    ⟨2876, by decide +kernel⟩
    ⟨2877, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨992, by decide +kernel⟩
    ⟨2876, by decide +kernel⟩
]
theorem fact_89_1 : source_89_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_89_1 := by
  decide +kernel
noncomputable def source_90_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2880
noncomputable def tables_90_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1008, by decide +kernel⟩,
  TableOp.marker
    ⟨2879, by decide +kernel⟩
    ⟨2880, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2884, by decide +kernel⟩,
      ⟨2884, by decide +kernel⟩,
      ⟨2884, by decide +kernel⟩,
      ⟨2884, by decide +kernel⟩,
      ⟨2884, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2882, by decide +kernel⟩,
  TableOp.marker
    ⟨107, by decide +kernel⟩
    ⟨2883, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1481, by decide +kernel⟩,
  TableOp.marker
    ⟨108, by decide +kernel⟩
    ⟨2885, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2889, by decide +kernel⟩,
      ⟨2889, by decide +kernel⟩,
      ⟨2889, by decide +kernel⟩,
      ⟨2889, by decide +kernel⟩,
      ⟨2889, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2887, by decide +kernel⟩,
  TableOp.marker
    ⟨110, by decide +kernel⟩
    ⟨2888, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2892, by decide +kernel⟩,
      ⟨2892, by decide +kernel⟩,
      ⟨2892, by decide +kernel⟩,
      ⟨2892, by decide +kernel⟩,
      ⟨2892, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2890, by decide +kernel⟩,
  TableOp.marker
    ⟨1017, by decide +kernel⟩
    ⟨2891, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨110, by decide +kernel⟩
    ⟨1017, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1020, by decide +kernel⟩,
  TableOp.marker
    ⟨2893, by decide +kernel⟩
    ⟨2894, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2898, by decide +kernel⟩,
      ⟨2898, by decide +kernel⟩,
      ⟨2898, by decide +kernel⟩,
      ⟨2898, by decide +kernel⟩,
      ⟨2898, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2896, by decide +kernel⟩,
  TableOp.marker
    ⟨109, by decide +kernel⟩
    ⟨2897, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2902, by decide +kernel⟩,
      ⟨2902, by decide +kernel⟩,
      ⟨2902, by decide +kernel⟩,
      ⟨2902, by decide +kernel⟩,
      ⟨2902, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨112, by decide +kernel⟩,
      ⟨112, by decide +kernel⟩,
      ⟨112, by decide +kernel⟩,
      ⟨112, by decide +kernel⟩,
      ⟨112, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2899, by decide +kernel⟩,
  TableOp.marker
    ⟨2900, by decide +kernel⟩
    ⟨2901, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2900, by decide +kernel⟩
    ⟨90, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1028, by decide +kernel⟩,
  TableOp.marker
    ⟨2903, by decide +kernel⟩
    ⟨2904, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2908, by decide +kernel⟩,
      ⟨2908, by decide +kernel⟩,
      ⟨2908, by decide +kernel⟩,
      ⟨2908, by decide +kernel⟩,
      ⟨2908, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2906, by decide +kernel⟩,
  TableOp.marker
    ⟨111, by decide +kernel⟩
    ⟨2907, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2912, by decide +kernel⟩,
      ⟨2912, by decide +kernel⟩,
      ⟨2912, by decide +kernel⟩,
      ⟨2912, by decide +kernel⟩,
      ⟨2912, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨115, by decide +kernel⟩,
      ⟨115, by decide +kernel⟩,
      ⟨115, by decide +kernel⟩,
      ⟨115, by decide +kernel⟩,
      ⟨115, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2909, by decide +kernel⟩
]
theorem fact_90_1 : source_90_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_90_1 := by
  decide +kernel
noncomputable def source_89_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_89_1 source_90_1
noncomputable def tables_89_2 : List (TableOp 4042) := tables_89_1 ++ tables_90_1
theorem fact_89_2 : source_89_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_89_2 :=
  source_tables_branch 32 source_89_1 source_90_1
    tables_89_1 tables_90_1 fact_89_1 fact_90_1
noncomputable def source_87_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_87_2 source_89_2
noncomputable def tables_87_4 : List (TableOp 4042) := tables_87_2 ++ tables_89_2
theorem fact_87_4 : source_87_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_87_4 :=
  source_tables_branch 64 source_87_2 source_89_2
    tables_87_2 tables_89_2 fact_87_2 fact_89_2
noncomputable def source_91_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2912
noncomputable def tables_91_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨2910, by decide +kernel⟩
    ⟨2911, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2910, by decide +kernel⟩
    ⟨2900, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1036, by decide +kernel⟩,
  TableOp.marker
    ⟨2913, by decide +kernel⟩
    ⟨2914, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2918, by decide +kernel⟩,
      ⟨2918, by decide +kernel⟩,
      ⟨2918, by decide +kernel⟩,
      ⟨2918, by decide +kernel⟩,
      ⟨2918, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2916, by decide +kernel⟩,
  TableOp.marker
    ⟨112, by decide +kernel⟩
    ⟨2917, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1044, by decide +kernel⟩,
  TableOp.marker
    ⟨114, by decide +kernel⟩
    ⟨2919, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2923, by decide +kernel⟩,
      ⟨2923, by decide +kernel⟩,
      ⟨2923, by decide +kernel⟩,
      ⟨2923, by decide +kernel⟩,
      ⟨2923, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2921, by decide +kernel⟩,
  TableOp.marker
    ⟨113, by decide +kernel⟩
    ⟨2922, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2926, by decide +kernel⟩,
      ⟨2926, by decide +kernel⟩,
      ⟨2926, by decide +kernel⟩,
      ⟨2926, by decide +kernel⟩,
      ⟨2926, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2924, by decide +kernel⟩,
  TableOp.marker
    ⟨115, by decide +kernel⟩
    ⟨2925, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1580, by decide +kernel⟩,
  TableOp.marker
    ⟨116, by decide +kernel⟩
    ⟨2927, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2932, by decide +kernel⟩,
      ⟨2932, by decide +kernel⟩,
      ⟨2932, by decide +kernel⟩,
      ⟨2932, by decide +kernel⟩,
      ⟨2932, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨118, by decide +kernel⟩,
      ⟨118, by decide +kernel⟩,
      ⟨118, by decide +kernel⟩,
      ⟨118, by decide +kernel⟩,
      ⟨118, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2929, by decide +kernel⟩,
  TableOp.marker
    ⟨2930, by decide +kernel⟩
    ⟨2931, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2930, by decide +kernel⟩
    ⟨93, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1049, by decide +kernel⟩,
  TableOp.marker
    ⟨2933, by decide +kernel⟩
    ⟨2934, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2938, by decide +kernel⟩,
      ⟨2938, by decide +kernel⟩,
      ⟨2938, by decide +kernel⟩,
      ⟨2938, by decide +kernel⟩,
      ⟨2938, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2936, by decide +kernel⟩,
  TableOp.marker
    ⟨117, by decide +kernel⟩
    ⟨2937, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨119, by decide +kernel⟩,
      ⟨119, by decide +kernel⟩,
      ⟨119, by decide +kernel⟩,
      ⟨119, by decide +kernel⟩,
      ⟨119, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1065, by decide +kernel⟩,
  TableOp.marker
    ⟨2939, by decide +kernel⟩
    ⟨2940, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2939, by decide +kernel⟩
    ⟨2930, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1057, by decide +kernel⟩
]
theorem fact_91_1 : source_91_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_91_1 := by
  decide +kernel
noncomputable def source_92_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2944
noncomputable def tables_92_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨2942, by decide +kernel⟩
    ⟨2943, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2947, by decide +kernel⟩,
      ⟨2947, by decide +kernel⟩,
      ⟨2947, by decide +kernel⟩,
      ⟨2947, by decide +kernel⟩,
      ⟨2947, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2945, by decide +kernel⟩,
  TableOp.marker
    ⟨118, by decide +kernel⟩
    ⟨2946, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2951, by decide +kernel⟩,
      ⟨2951, by decide +kernel⟩,
      ⟨2951, by decide +kernel⟩,
      ⟨2951, by decide +kernel⟩,
      ⟨2951, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨122, by decide +kernel⟩,
      ⟨122, by decide +kernel⟩,
      ⟨122, by decide +kernel⟩,
      ⟨122, by decide +kernel⟩,
      ⟨122, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2948, by decide +kernel⟩,
  TableOp.marker
    ⟨2949, by decide +kernel⟩
    ⟨2950, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2954, by decide +kernel⟩,
      ⟨2954, by decide +kernel⟩,
      ⟨2954, by decide +kernel⟩,
      ⟨2954, by decide +kernel⟩,
      ⟨2954, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2952, by decide +kernel⟩,
  TableOp.marker
    ⟨1068, by decide +kernel⟩
    ⟨2953, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨2949, by decide +kernel⟩
    ⟨1068, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1071, by decide +kernel⟩,
  TableOp.marker
    ⟨2955, by decide +kernel⟩
    ⟨2956, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2960, by decide +kernel⟩,
      ⟨2960, by decide +kernel⟩,
      ⟨2960, by decide +kernel⟩,
      ⟨2960, by decide +kernel⟩,
      ⟨2960, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2958, by decide +kernel⟩,
  TableOp.marker
    ⟨119, by decide +kernel⟩
    ⟨2959, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1079, by decide +kernel⟩,
  TableOp.marker
    ⟨121, by decide +kernel⟩
    ⟨2961, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2965, by decide +kernel⟩,
      ⟨2965, by decide +kernel⟩,
      ⟨2965, by decide +kernel⟩,
      ⟨2965, by decide +kernel⟩,
      ⟨2965, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2963, by decide +kernel⟩,
  TableOp.marker
    ⟨120, by decide +kernel⟩
    ⟨2964, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2968, by decide +kernel⟩,
      ⟨2968, by decide +kernel⟩,
      ⟨2968, by decide +kernel⟩,
      ⟨2968, by decide +kernel⟩,
      ⟨2968, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2966, by decide +kernel⟩,
  TableOp.marker
    ⟨122, by decide +kernel⟩
    ⟨2967, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2971, by decide +kernel⟩,
      ⟨2971, by decide +kernel⟩,
      ⟨2971, by decide +kernel⟩,
      ⟨2971, by decide +kernel⟩,
      ⟨2971, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2969, by decide +kernel⟩,
  TableOp.marker
    ⟨123, by decide +kernel⟩
    ⟨2970, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨125, by decide +kernel⟩,
      ⟨125, by decide +kernel⟩,
      ⟨125, by decide +kernel⟩,
      ⟨125, by decide +kernel⟩,
      ⟨125, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1092, by decide +kernel⟩,
  TableOp.marker
    ⟨2972, by decide +kernel⟩
    ⟨2973, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2978, by decide +kernel⟩,
      ⟨2978, by decide +kernel⟩,
      ⟨2978, by decide +kernel⟩,
      ⟨2978, by decide +kernel⟩,
      ⟨2978, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_92_1 : source_92_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_92_1 := by
  decide +kernel
noncomputable def source_91_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_91_1 source_92_1
noncomputable def tables_91_2 : List (TableOp 4042) := tables_91_1 ++ tables_92_1
theorem fact_91_2 : source_91_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_91_2 :=
  source_tables_branch 32 source_91_1 source_92_1
    tables_91_1 tables_92_1 fact_91_1 fact_92_1
noncomputable def source_93_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2976
noncomputable def tables_93_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩,
      ⟨124, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2975, by decide +kernel⟩,
  TableOp.marker
    ⟨2976, by decide +kernel⟩
    ⟨2977, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    ⟨2972, by decide +kernel⟩
    ⟨2976, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1084, by decide +kernel⟩,
  TableOp.marker
    ⟨2979, by decide +kernel⟩
    ⟨2980, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2984, by decide +kernel⟩,
      ⟨2984, by decide +kernel⟩,
      ⟨2984, by decide +kernel⟩,
      ⟨2984, by decide +kernel⟩,
      ⟨2984, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2982, by decide +kernel⟩,
  TableOp.marker
    ⟨124, by decide +kernel⟩
    ⟨2983, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨126, by decide +kernel⟩,
      ⟨126, by decide +kernel⟩,
      ⟨126, by decide +kernel⟩,
      ⟨126, by decide +kernel⟩,
      ⟨126, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1106, by decide +kernel⟩,
  TableOp.marker
    ⟨2985, by decide +kernel⟩
    ⟨2986, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2990, by decide +kernel⟩,
      ⟨2990, by decide +kernel⟩,
      ⟨2990, by decide +kernel⟩,
      ⟨2990, by decide +kernel⟩,
      ⟨2990, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2988, by decide +kernel⟩,
  TableOp.marker
    ⟨1095, by decide +kernel⟩
    ⟨2989, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨2985, by decide +kernel⟩
    ⟨1095, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1098, by decide +kernel⟩,
  TableOp.marker
    ⟨2991, by decide +kernel⟩
    ⟨2992, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2996, by decide +kernel⟩,
      ⟨2996, by decide +kernel⟩,
      ⟨2996, by decide +kernel⟩,
      ⟨2996, by decide +kernel⟩,
      ⟨2996, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2994, by decide +kernel⟩,
  TableOp.marker
    ⟨125, by decide +kernel⟩
    ⟨2995, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨2999, by decide +kernel⟩,
      ⟨2999, by decide +kernel⟩,
      ⟨2999, by decide +kernel⟩,
      ⟨2999, by decide +kernel⟩,
      ⟨2999, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2997, by decide +kernel⟩,
  TableOp.marker
    ⟨1109, by decide +kernel⟩
    ⟨2998, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1112, by decide +kernel⟩,
  TableOp.marker
    ⟨265, by decide +kernel⟩
    ⟨3000, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1118, by decide +kernel⟩,
  TableOp.marker
    ⟨1115, by decide +kernel⟩
    ⟨3002, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3006, by decide +kernel⟩,
      ⟨3006, by decide +kernel⟩,
      ⟨3006, by decide +kernel⟩,
      ⟨3006, by decide +kernel⟩,
      ⟨3006, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3004, by decide +kernel⟩,
  TableOp.marker
    ⟨1121, by decide +kernel⟩
    ⟨3005, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3010, by decide +kernel⟩,
      ⟨3010, by decide +kernel⟩,
      ⟨3010, by decide +kernel⟩,
      ⟨3010, by decide +kernel⟩,
      ⟨3010, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_93_1 : source_93_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_93_1 := by
  decide +kernel
noncomputable def source_94_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3008
noncomputable def tables_94_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      false,
      false,
      true,
      false,
      false
    ], rfl⟩
    ⟨1121, by decide +kernel⟩
    ⟨1115, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3007, by decide +kernel⟩,
  TableOp.marker
    ⟨3008, by decide +kernel⟩
    ⟨3009, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      false,
      true
    ], rfl⟩
    ⟨1109, by decide +kernel⟩
    ⟨3008, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1124, by decide +kernel⟩,
  TableOp.marker
    ⟨3011, by decide +kernel⟩
    ⟨3012, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3016, by decide +kernel⟩,
      ⟨3016, by decide +kernel⟩,
      ⟨3016, by decide +kernel⟩,
      ⟨3016, by decide +kernel⟩,
      ⟨3016, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3014, by decide +kernel⟩,
  TableOp.marker
    ⟨126, by decide +kernel⟩
    ⟨3015, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3019, by decide +kernel⟩,
      ⟨3019, by decide +kernel⟩,
      ⟨3019, by decide +kernel⟩,
      ⟨3019, by decide +kernel⟩,
      ⟨3019, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3017, by decide +kernel⟩,
  TableOp.marker
    ⟨1133, by decide +kernel⟩
    ⟨3018, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨114, by decide +kernel⟩
    ⟨1133, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1136, by decide +kernel⟩,
  TableOp.marker
    ⟨3020, by decide +kernel⟩
    ⟨3021, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3025, by decide +kernel⟩,
      ⟨3025, by decide +kernel⟩,
      ⟨3025, by decide +kernel⟩,
      ⟨3025, by decide +kernel⟩,
      ⟨3025, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3023, by decide +kernel⟩,
  TableOp.marker
    ⟨127, by decide +kernel⟩
    ⟨3024, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3029, by decide +kernel⟩,
      ⟨3029, by decide +kernel⟩,
      ⟨3029, by decide +kernel⟩,
      ⟨3029, by decide +kernel⟩,
      ⟨3029, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨129, by decide +kernel⟩,
      ⟨129, by decide +kernel⟩,
      ⟨129, by decide +kernel⟩,
      ⟨129, by decide +kernel⟩,
      ⟨129, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3026, by decide +kernel⟩,
  TableOp.marker
    ⟨3027, by decide +kernel⟩
    ⟨3028, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3027, by decide +kernel⟩
    ⟨96, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1144, by decide +kernel⟩,
  TableOp.marker
    ⟨3030, by decide +kernel⟩
    ⟨3031, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3035, by decide +kernel⟩,
      ⟨3035, by decide +kernel⟩,
      ⟨3035, by decide +kernel⟩,
      ⟨3035, by decide +kernel⟩,
      ⟨3035, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3033, by decide +kernel⟩,
  TableOp.marker
    ⟨128, by decide +kernel⟩
    ⟨3034, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3039, by decide +kernel⟩,
      ⟨3039, by decide +kernel⟩,
      ⟨3039, by decide +kernel⟩,
      ⟨3039, by decide +kernel⟩,
      ⟨3039, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨130, by decide +kernel⟩,
      ⟨130, by decide +kernel⟩,
      ⟨130, by decide +kernel⟩,
      ⟨130, by decide +kernel⟩,
      ⟨130, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3036, by decide +kernel⟩,
  TableOp.marker
    ⟨3037, by decide +kernel⟩
    ⟨3038, by decide +kernel⟩
]
theorem fact_94_1 : source_94_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_94_1 := by
  decide +kernel
noncomputable def source_93_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_93_1 source_94_1
noncomputable def tables_93_2 : List (TableOp 4042) := tables_93_1 ++ tables_94_1
theorem fact_93_2 : source_93_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_93_2 :=
  source_tables_branch 32 source_93_1 source_94_1
    tables_93_1 tables_94_1 fact_93_1 fact_94_1
noncomputable def source_91_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_91_2 source_93_2
noncomputable def tables_91_4 : List (TableOp 4042) := tables_91_2 ++ tables_93_2
theorem fact_91_4 : source_91_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_91_4 :=
  source_tables_branch 64 source_91_2 source_93_2
    tables_91_2 tables_93_2 fact_91_2 fact_93_2
noncomputable def source_87_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_87_4 source_91_4
noncomputable def tables_87_8 : List (TableOp 4042) := tables_87_4 ++ tables_91_4
theorem fact_87_8 : source_87_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_87_8 :=
  source_tables_branch 128 source_87_4 source_91_4
    tables_87_4 tables_91_4 fact_87_4 fact_91_4
noncomputable def source_79_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_79_8 source_87_8
noncomputable def tables_79_16 : List (TableOp 4042) := tables_79_8 ++ tables_87_8
theorem fact_79_16 : source_79_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_79_16 :=
  source_tables_branch 256 source_79_8 source_87_8
    tables_79_8 tables_87_8 fact_79_8 fact_87_8
noncomputable def source_63_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_63_16 source_79_16
noncomputable def tables_63_32 : List (TableOp 4042) := tables_63_16 ++ tables_79_16
theorem fact_63_32 : source_63_32.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_32 :=
  source_tables_branch 512 source_63_16 source_79_16
    tables_63_16 tables_79_16 fact_63_16 fact_79_16
noncomputable def source_95_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3040
noncomputable def tables_95_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3037, by decide +kernel⟩
    ⟨3027, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1152, by decide +kernel⟩,
  TableOp.marker
    ⟨3040, by decide +kernel⟩
    ⟨3041, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3045, by decide +kernel⟩,
      ⟨3045, by decide +kernel⟩,
      ⟨3045, by decide +kernel⟩,
      ⟨3045, by decide +kernel⟩,
      ⟨3045, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3043, by decide +kernel⟩,
  TableOp.marker
    ⟨129, by decide +kernel⟩
    ⟨3044, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨114, by decide +kernel⟩
    ⟨3037, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1160, by decide +kernel⟩,
  TableOp.marker
    ⟨3046, by decide +kernel⟩
    ⟨3047, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3051, by decide +kernel⟩,
      ⟨3051, by decide +kernel⟩,
      ⟨3051, by decide +kernel⟩,
      ⟨3051, by decide +kernel⟩,
      ⟨3051, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3049, by decide +kernel⟩,
  TableOp.marker
    ⟨130, by decide +kernel⟩
    ⟨3050, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3055, by decide +kernel⟩,
      ⟨3055, by decide +kernel⟩,
      ⟨3055, by decide +kernel⟩,
      ⟨3055, by decide +kernel⟩,
      ⟨3055, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨134, by decide +kernel⟩,
      ⟨134, by decide +kernel⟩,
      ⟨134, by decide +kernel⟩,
      ⟨134, by decide +kernel⟩,
      ⟨134, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3052, by decide +kernel⟩,
  TableOp.marker
    ⟨3053, by decide +kernel⟩
    ⟨3054, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3058, by decide +kernel⟩,
      ⟨3058, by decide +kernel⟩,
      ⟨3058, by decide +kernel⟩,
      ⟨3058, by decide +kernel⟩,
      ⟨3058, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3056, by decide +kernel⟩,
  TableOp.marker
    ⟨1171, by decide +kernel⟩
    ⟨3057, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3053, by decide +kernel⟩
    ⟨1171, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1174, by decide +kernel⟩,
  TableOp.marker
    ⟨3059, by decide +kernel⟩
    ⟨3060, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3064, by decide +kernel⟩,
      ⟨3064, by decide +kernel⟩,
      ⟨3064, by decide +kernel⟩,
      ⟨3064, by decide +kernel⟩,
      ⟨3064, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3062, by decide +kernel⟩,
  TableOp.marker
    ⟨131, by decide +kernel⟩
    ⟨3063, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1182, by decide +kernel⟩,
  TableOp.marker
    ⟨133, by decide +kernel⟩
    ⟨3065, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3069, by decide +kernel⟩,
      ⟨3069, by decide +kernel⟩,
      ⟨3069, by decide +kernel⟩,
      ⟨3069, by decide +kernel⟩,
      ⟨3069, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3067, by decide +kernel⟩,
  TableOp.marker
    ⟨132, by decide +kernel⟩
    ⟨3068, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3072, by decide +kernel⟩,
      ⟨3072, by decide +kernel⟩,
      ⟨3072, by decide +kernel⟩,
      ⟨3072, by decide +kernel⟩,
      ⟨3072, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3070, by decide +kernel⟩
]
theorem fact_95_1 : source_95_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t96\t{now}"
      handle.flush
noncomputable def source_96_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3072
noncomputable def tables_96_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨134, by decide +kernel⟩
    ⟨3071, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3076, by decide +kernel⟩,
      ⟨3076, by decide +kernel⟩,
      ⟨3076, by decide +kernel⟩,
      ⟨3076, by decide +kernel⟩,
      ⟨3076, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨138, by decide +kernel⟩,
      ⟨138, by decide +kernel⟩,
      ⟨138, by decide +kernel⟩,
      ⟨138, by decide +kernel⟩,
      ⟨138, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3073, by decide +kernel⟩,
  TableOp.marker
    ⟨3074, by decide +kernel⟩
    ⟨3075, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3079, by decide +kernel⟩,
      ⟨3079, by decide +kernel⟩,
      ⟨3079, by decide +kernel⟩,
      ⟨3079, by decide +kernel⟩,
      ⟨3079, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3077, by decide +kernel⟩,
  TableOp.marker
    ⟨1188, by decide +kernel⟩
    ⟨3078, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3074, by decide +kernel⟩
    ⟨1188, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1191, by decide +kernel⟩,
  TableOp.marker
    ⟨3080, by decide +kernel⟩
    ⟨3081, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3085, by decide +kernel⟩,
      ⟨3085, by decide +kernel⟩,
      ⟨3085, by decide +kernel⟩,
      ⟨3085, by decide +kernel⟩,
      ⟨3085, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3083, by decide +kernel⟩,
  TableOp.marker
    ⟨135, by decide +kernel⟩
    ⟨3084, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1199, by decide +kernel⟩,
  TableOp.marker
    ⟨137, by decide +kernel⟩
    ⟨3086, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3090, by decide +kernel⟩,
      ⟨3090, by decide +kernel⟩,
      ⟨3090, by decide +kernel⟩,
      ⟨3090, by decide +kernel⟩,
      ⟨3090, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3088, by decide +kernel⟩,
  TableOp.marker
    ⟨136, by decide +kernel⟩
    ⟨3089, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3093, by decide +kernel⟩,
      ⟨3093, by decide +kernel⟩,
      ⟨3093, by decide +kernel⟩,
      ⟨3093, by decide +kernel⟩,
      ⟨3093, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3091, by decide +kernel⟩,
  TableOp.marker
    ⟨138, by decide +kernel⟩
    ⟨3092, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨140, by decide +kernel⟩,
      ⟨140, by decide +kernel⟩,
      ⟨140, by decide +kernel⟩,
      ⟨140, by decide +kernel⟩,
      ⟨140, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1216, by decide +kernel⟩,
  TableOp.marker
    ⟨3094, by decide +kernel⟩
    ⟨3095, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3099, by decide +kernel⟩,
      ⟨3099, by decide +kernel⟩,
      ⟨3099, by decide +kernel⟩,
      ⟨3099, by decide +kernel⟩,
      ⟨3099, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3097, by decide +kernel⟩,
  TableOp.marker
    ⟨1205, by decide +kernel⟩
    ⟨3098, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3094, by decide +kernel⟩
    ⟨1205, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1208, by decide +kernel⟩,
  TableOp.marker
    ⟨3100, by decide +kernel⟩
    ⟨3101, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3105, by decide +kernel⟩,
      ⟨3105, by decide +kernel⟩,
      ⟨3105, by decide +kernel⟩,
      ⟨3105, by decide +kernel⟩,
      ⟨3105, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_96_1 : source_96_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_96_1 := by
  decide +kernel
noncomputable def source_95_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_95_1 source_96_1
noncomputable def tables_95_2 : List (TableOp 4042) := tables_95_1 ++ tables_96_1
theorem fact_95_2 : source_95_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_2 :=
  source_tables_branch 32 source_95_1 source_96_1
    tables_95_1 tables_96_1 fact_95_1 fact_96_1
noncomputable def source_97_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3104
noncomputable def tables_97_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3103, by decide +kernel⟩,
  TableOp.marker
    ⟨139, by decide +kernel⟩
    ⟨3104, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1222, by decide +kernel⟩,
  TableOp.marker
    ⟨1219, by decide +kernel⟩
    ⟨3106, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3110, by decide +kernel⟩,
      ⟨3110, by decide +kernel⟩,
      ⟨3110, by decide +kernel⟩,
      ⟨3110, by decide +kernel⟩,
      ⟨3110, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3108, by decide +kernel⟩,
  TableOp.marker
    ⟨1225, by decide +kernel⟩
    ⟨3109, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3114, by decide +kernel⟩,
      ⟨3114, by decide +kernel⟩,
      ⟨3114, by decide +kernel⟩,
      ⟨3114, by decide +kernel⟩,
      ⟨3114, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨143, by decide +kernel⟩,
      ⟨143, by decide +kernel⟩,
      ⟨143, by decide +kernel⟩,
      ⟨143, by decide +kernel⟩,
      ⟨143, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3111, by decide +kernel⟩,
  TableOp.marker
    ⟨3112, by decide +kernel⟩
    ⟨3113, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨1225, by decide +kernel⟩
    ⟨3112, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1228, by decide +kernel⟩,
  TableOp.marker
    ⟨3115, by decide +kernel⟩
    ⟨3116, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3120, by decide +kernel⟩,
      ⟨3120, by decide +kernel⟩,
      ⟨3120, by decide +kernel⟩,
      ⟨3120, by decide +kernel⟩,
      ⟨3120, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3118, by decide +kernel⟩,
  TableOp.marker
    ⟨140, by decide +kernel⟩
    ⟨3119, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1236, by decide +kernel⟩,
  TableOp.marker
    ⟨142, by decide +kernel⟩
    ⟨3121, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3125, by decide +kernel⟩,
      ⟨3125, by decide +kernel⟩,
      ⟨3125, by decide +kernel⟩,
      ⟨3125, by decide +kernel⟩,
      ⟨3125, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3123, by decide +kernel⟩,
  TableOp.marker
    ⟨141, by decide +kernel⟩
    ⟨3124, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3128, by decide +kernel⟩,
      ⟨3128, by decide +kernel⟩,
      ⟨3128, by decide +kernel⟩,
      ⟨3128, by decide +kernel⟩,
      ⟨3128, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3126, by decide +kernel⟩,
  TableOp.marker
    ⟨143, by decide +kernel⟩
    ⟨3127, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1241, by decide +kernel⟩,
  TableOp.marker
    ⟨145, by decide +kernel⟩
    ⟨3129, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3133, by decide +kernel⟩,
      ⟨3133, by decide +kernel⟩,
      ⟨3133, by decide +kernel⟩,
      ⟨3133, by decide +kernel⟩,
      ⟨3133, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3131, by decide +kernel⟩,
  TableOp.marker
    ⟨144, by decide +kernel⟩
    ⟨3132, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3136, by decide +kernel⟩,
      ⟨3136, by decide +kernel⟩,
      ⟨3136, by decide +kernel⟩,
      ⟨3136, by decide +kernel⟩,
      ⟨3136, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3134, by decide +kernel⟩
]
theorem fact_97_1 : source_97_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_97_1 := by
  decide +kernel
noncomputable def source_98_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3136
noncomputable def tables_98_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨146, by decide +kernel⟩
    ⟨3135, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3140, by decide +kernel⟩,
      ⟨3140, by decide +kernel⟩,
      ⟨3140, by decide +kernel⟩,
      ⟨3140, by decide +kernel⟩,
      ⟨3140, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨150, by decide +kernel⟩,
      ⟨150, by decide +kernel⟩,
      ⟨150, by decide +kernel⟩,
      ⟨150, by decide +kernel⟩,
      ⟨150, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3137, by decide +kernel⟩,
  TableOp.marker
    ⟨3138, by decide +kernel⟩
    ⟨3139, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3143, by decide +kernel⟩,
      ⟨3143, by decide +kernel⟩,
      ⟨3143, by decide +kernel⟩,
      ⟨3143, by decide +kernel⟩,
      ⟨3143, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3141, by decide +kernel⟩,
  TableOp.marker
    ⟨1247, by decide +kernel⟩
    ⟨3142, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3138, by decide +kernel⟩
    ⟨1247, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1250, by decide +kernel⟩,
  TableOp.marker
    ⟨3144, by decide +kernel⟩
    ⟨3145, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3149, by decide +kernel⟩,
      ⟨3149, by decide +kernel⟩,
      ⟨3149, by decide +kernel⟩,
      ⟨3149, by decide +kernel⟩,
      ⟨3149, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3147, by decide +kernel⟩,
  TableOp.marker
    ⟨147, by decide +kernel⟩
    ⟨3148, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1258, by decide +kernel⟩,
  TableOp.marker
    ⟨149, by decide +kernel⟩
    ⟨3150, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3154, by decide +kernel⟩,
      ⟨3154, by decide +kernel⟩,
      ⟨3154, by decide +kernel⟩,
      ⟨3154, by decide +kernel⟩,
      ⟨3154, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3152, by decide +kernel⟩,
  TableOp.marker
    ⟨148, by decide +kernel⟩
    ⟨3153, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3157, by decide +kernel⟩,
      ⟨3157, by decide +kernel⟩,
      ⟨3157, by decide +kernel⟩,
      ⟨3157, by decide +kernel⟩,
      ⟨3157, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3155, by decide +kernel⟩,
  TableOp.marker
    ⟨150, by decide +kernel⟩
    ⟨3156, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3160, by decide +kernel⟩,
      ⟨3160, by decide +kernel⟩,
      ⟨3160, by decide +kernel⟩,
      ⟨3160, by decide +kernel⟩,
      ⟨3160, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3158, by decide +kernel⟩,
  TableOp.marker
    ⟨1264, by decide +kernel⟩
    ⟨3159, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨18, by decide +kernel⟩
    ⟨1264, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1267, by decide +kernel⟩,
  TableOp.marker
    ⟨3161, by decide +kernel⟩
    ⟨3162, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3166, by decide +kernel⟩,
      ⟨3166, by decide +kernel⟩,
      ⟨3166, by decide +kernel⟩,
      ⟨3166, by decide +kernel⟩,
      ⟨3166, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3164, by decide +kernel⟩,
  TableOp.marker
    ⟨151, by decide +kernel⟩
    ⟨3165, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3170, by decide +kernel⟩,
      ⟨3170, by decide +kernel⟩,
      ⟨3170, by decide +kernel⟩,
      ⟨3170, by decide +kernel⟩,
      ⟨3170, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_98_1 : source_98_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_98_1 := by
  decide +kernel
noncomputable def source_97_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_97_1 source_98_1
noncomputable def tables_97_2 : List (TableOp 4042) := tables_97_1 ++ tables_98_1
theorem fact_97_2 : source_97_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_97_2 :=
  source_tables_branch 32 source_97_1 source_98_1
    tables_97_1 tables_98_1 fact_97_1 fact_98_1
noncomputable def source_95_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_95_2 source_97_2
noncomputable def tables_95_4 : List (TableOp 4042) := tables_95_2 ++ tables_97_2
theorem fact_95_4 : source_95_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_4 :=
  source_tables_branch 64 source_95_2 source_97_2
    tables_95_2 tables_97_2 fact_95_2 fact_97_2
noncomputable def source_99_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3168
noncomputable def tables_99_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨155, by decide +kernel⟩,
      ⟨155, by decide +kernel⟩,
      ⟨155, by decide +kernel⟩,
      ⟨155, by decide +kernel⟩,
      ⟨155, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3167, by decide +kernel⟩,
  TableOp.marker
    ⟨3168, by decide +kernel⟩
    ⟨3169, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3173, by decide +kernel⟩,
      ⟨3173, by decide +kernel⟩,
      ⟨3173, by decide +kernel⟩,
      ⟨3173, by decide +kernel⟩,
      ⟨3173, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3171, by decide +kernel⟩,
  TableOp.marker
    ⟨1278, by decide +kernel⟩
    ⟨3172, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3168, by decide +kernel⟩
    ⟨1278, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1281, by decide +kernel⟩,
  TableOp.marker
    ⟨3174, by decide +kernel⟩
    ⟨3175, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3179, by decide +kernel⟩,
      ⟨3179, by decide +kernel⟩,
      ⟨3179, by decide +kernel⟩,
      ⟨3179, by decide +kernel⟩,
      ⟨3179, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3177, by decide +kernel⟩,
  TableOp.marker
    ⟨152, by decide +kernel⟩
    ⟨3178, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1289, by decide +kernel⟩,
  TableOp.marker
    ⟨154, by decide +kernel⟩
    ⟨3180, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3184, by decide +kernel⟩,
      ⟨3184, by decide +kernel⟩,
      ⟨3184, by decide +kernel⟩,
      ⟨3184, by decide +kernel⟩,
      ⟨3184, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3182, by decide +kernel⟩,
  TableOp.marker
    ⟨153, by decide +kernel⟩
    ⟨3183, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3187, by decide +kernel⟩,
      ⟨3187, by decide +kernel⟩,
      ⟨3187, by decide +kernel⟩,
      ⟨3187, by decide +kernel⟩,
      ⟨3187, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3185, by decide +kernel⟩,
  TableOp.marker
    ⟨155, by decide +kernel⟩
    ⟨3186, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨157, by decide +kernel⟩,
      ⟨157, by decide +kernel⟩,
      ⟨157, by decide +kernel⟩,
      ⟨157, by decide +kernel⟩,
      ⟨157, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1306, by decide +kernel⟩,
  TableOp.marker
    ⟨3188, by decide +kernel⟩
    ⟨3189, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3193, by decide +kernel⟩,
      ⟨3193, by decide +kernel⟩,
      ⟨3193, by decide +kernel⟩,
      ⟨3193, by decide +kernel⟩,
      ⟨3193, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3191, by decide +kernel⟩,
  TableOp.marker
    ⟨1295, by decide +kernel⟩
    ⟨3192, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3188, by decide +kernel⟩
    ⟨1295, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1298, by decide +kernel⟩,
  TableOp.marker
    ⟨3194, by decide +kernel⟩
    ⟨3195, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3199, by decide +kernel⟩,
      ⟨3199, by decide +kernel⟩,
      ⟨3199, by decide +kernel⟩,
      ⟨3199, by decide +kernel⟩,
      ⟨3199, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3197, by decide +kernel⟩,
  TableOp.marker
    ⟨156, by decide +kernel⟩
    ⟨3198, by decide +kernel⟩
]
theorem fact_99_1 : source_99_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_99_1 := by
  decide +kernel
noncomputable def source_100_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3200
noncomputable def tables_100_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3203, by decide +kernel⟩,
      ⟨3203, by decide +kernel⟩,
      ⟨3203, by decide +kernel⟩,
      ⟨3203, by decide +kernel⟩,
      ⟨3203, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨160, by decide +kernel⟩,
      ⟨160, by decide +kernel⟩,
      ⟨160, by decide +kernel⟩,
      ⟨160, by decide +kernel⟩,
      ⟨160, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3200, by decide +kernel⟩,
  TableOp.marker
    ⟨3201, by decide +kernel⟩
    ⟨3202, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3206, by decide +kernel⟩,
      ⟨3206, by decide +kernel⟩,
      ⟨3206, by decide +kernel⟩,
      ⟨3206, by decide +kernel⟩,
      ⟨3206, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3204, by decide +kernel⟩,
  TableOp.marker
    ⟨1309, by decide +kernel⟩
    ⟨3205, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3201, by decide +kernel⟩
    ⟨1309, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1312, by decide +kernel⟩,
  TableOp.marker
    ⟨3207, by decide +kernel⟩
    ⟨3208, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3212, by decide +kernel⟩,
      ⟨3212, by decide +kernel⟩,
      ⟨3212, by decide +kernel⟩,
      ⟨3212, by decide +kernel⟩,
      ⟨3212, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3210, by decide +kernel⟩,
  TableOp.marker
    ⟨157, by decide +kernel⟩
    ⟨3211, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1320, by decide +kernel⟩,
  TableOp.marker
    ⟨159, by decide +kernel⟩
    ⟨3213, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3217, by decide +kernel⟩,
      ⟨3217, by decide +kernel⟩,
      ⟨3217, by decide +kernel⟩,
      ⟨3217, by decide +kernel⟩,
      ⟨3217, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3215, by decide +kernel⟩,
  TableOp.marker
    ⟨158, by decide +kernel⟩
    ⟨3216, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3220, by decide +kernel⟩,
      ⟨3220, by decide +kernel⟩,
      ⟨3220, by decide +kernel⟩,
      ⟨3220, by decide +kernel⟩,
      ⟨3220, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3218, by decide +kernel⟩,
  TableOp.marker
    ⟨160, by decide +kernel⟩
    ⟨3219, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨162, by decide +kernel⟩,
      ⟨162, by decide +kernel⟩,
      ⟨162, by decide +kernel⟩,
      ⟨162, by decide +kernel⟩,
      ⟨162, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1337, by decide +kernel⟩,
  TableOp.marker
    ⟨3221, by decide +kernel⟩
    ⟨3222, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3226, by decide +kernel⟩,
      ⟨3226, by decide +kernel⟩,
      ⟨3226, by decide +kernel⟩,
      ⟨3226, by decide +kernel⟩,
      ⟨3226, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3224, by decide +kernel⟩,
  TableOp.marker
    ⟨1326, by decide +kernel⟩
    ⟨3225, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3221, by decide +kernel⟩
    ⟨1326, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1329, by decide +kernel⟩,
  TableOp.marker
    ⟨3227, by decide +kernel⟩
    ⟨3228, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3232, by decide +kernel⟩,
      ⟨3232, by decide +kernel⟩,
      ⟨3232, by decide +kernel⟩,
      ⟨3232, by decide +kernel⟩,
      ⟨3232, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3230, by decide +kernel⟩
]
theorem fact_100_1 : source_100_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_100_1 := by
  decide +kernel
noncomputable def source_99_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_99_1 source_100_1
noncomputable def tables_99_2 : List (TableOp 4042) := tables_99_1 ++ tables_100_1
theorem fact_99_2 : source_99_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_99_2 :=
  source_tables_branch 32 source_99_1 source_100_1
    tables_99_1 tables_100_1 fact_99_1 fact_100_1
noncomputable def source_101_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3232
noncomputable def tables_101_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨161, by decide +kernel⟩
    ⟨3231, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3236, by decide +kernel⟩,
      ⟨3236, by decide +kernel⟩,
      ⟨3236, by decide +kernel⟩,
      ⟨3236, by decide +kernel⟩,
      ⟨3236, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨165, by decide +kernel⟩,
      ⟨165, by decide +kernel⟩,
      ⟨165, by decide +kernel⟩,
      ⟨165, by decide +kernel⟩,
      ⟨165, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3233, by decide +kernel⟩,
  TableOp.marker
    ⟨3234, by decide +kernel⟩
    ⟨3235, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3239, by decide +kernel⟩,
      ⟨3239, by decide +kernel⟩,
      ⟨3239, by decide +kernel⟩,
      ⟨3239, by decide +kernel⟩,
      ⟨3239, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3237, by decide +kernel⟩,
  TableOp.marker
    ⟨1340, by decide +kernel⟩
    ⟨3238, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3234, by decide +kernel⟩
    ⟨1340, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1343, by decide +kernel⟩,
  TableOp.marker
    ⟨3240, by decide +kernel⟩
    ⟨3241, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3245, by decide +kernel⟩,
      ⟨3245, by decide +kernel⟩,
      ⟨3245, by decide +kernel⟩,
      ⟨3245, by decide +kernel⟩,
      ⟨3245, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3243, by decide +kernel⟩,
  TableOp.marker
    ⟨162, by decide +kernel⟩
    ⟨3244, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1351, by decide +kernel⟩,
  TableOp.marker
    ⟨164, by decide +kernel⟩
    ⟨3246, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3250, by decide +kernel⟩,
      ⟨3250, by decide +kernel⟩,
      ⟨3250, by decide +kernel⟩,
      ⟨3250, by decide +kernel⟩,
      ⟨3250, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3248, by decide +kernel⟩,
  TableOp.marker
    ⟨163, by decide +kernel⟩
    ⟨3249, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3253, by decide +kernel⟩,
      ⟨3253, by decide +kernel⟩,
      ⟨3253, by decide +kernel⟩,
      ⟨3253, by decide +kernel⟩,
      ⟨3253, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3251, by decide +kernel⟩,
  TableOp.marker
    ⟨165, by decide +kernel⟩
    ⟨3252, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3257, by decide +kernel⟩,
      ⟨3257, by decide +kernel⟩,
      ⟨3257, by decide +kernel⟩,
      ⟨3257, by decide +kernel⟩,
      ⟨3257, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨169, by decide +kernel⟩,
      ⟨169, by decide +kernel⟩,
      ⟨169, by decide +kernel⟩,
      ⟨169, by decide +kernel⟩,
      ⟨169, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3254, by decide +kernel⟩,
  TableOp.marker
    ⟨3255, by decide +kernel⟩
    ⟨3256, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3260, by decide +kernel⟩,
      ⟨3260, by decide +kernel⟩,
      ⟨3260, by decide +kernel⟩,
      ⟨3260, by decide +kernel⟩,
      ⟨3260, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3258, by decide +kernel⟩,
  TableOp.marker
    ⟨1357, by decide +kernel⟩
    ⟨3259, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3255, by decide +kernel⟩
    ⟨1357, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1360, by decide +kernel⟩,
  TableOp.marker
    ⟨3261, by decide +kernel⟩
    ⟨3262, by decide +kernel⟩
]
theorem fact_101_1 : source_101_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_101_1 := by
  decide +kernel
noncomputable def source_102_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3264
noncomputable def tables_102_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3266, by decide +kernel⟩,
      ⟨3266, by decide +kernel⟩,
      ⟨3266, by decide +kernel⟩,
      ⟨3266, by decide +kernel⟩,
      ⟨3266, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3264, by decide +kernel⟩,
  TableOp.marker
    ⟨166, by decide +kernel⟩
    ⟨3265, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1368, by decide +kernel⟩,
  TableOp.marker
    ⟨168, by decide +kernel⟩
    ⟨3267, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3271, by decide +kernel⟩,
      ⟨3271, by decide +kernel⟩,
      ⟨3271, by decide +kernel⟩,
      ⟨3271, by decide +kernel⟩,
      ⟨3271, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3269, by decide +kernel⟩,
  TableOp.marker
    ⟨167, by decide +kernel⟩
    ⟨3270, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3274, by decide +kernel⟩,
      ⟨3274, by decide +kernel⟩,
      ⟨3274, by decide +kernel⟩,
      ⟨3274, by decide +kernel⟩,
      ⟨3274, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3272, by decide +kernel⟩,
  TableOp.marker
    ⟨169, by decide +kernel⟩
    ⟨3273, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1373, by decide +kernel⟩,
  TableOp.marker
    ⟨171, by decide +kernel⟩
    ⟨3275, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3279, by decide +kernel⟩,
      ⟨3279, by decide +kernel⟩,
      ⟨3279, by decide +kernel⟩,
      ⟨3279, by decide +kernel⟩,
      ⟨3279, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3277, by decide +kernel⟩,
  TableOp.marker
    ⟨170, by decide +kernel⟩
    ⟨3278, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3282, by decide +kernel⟩,
      ⟨3282, by decide +kernel⟩,
      ⟨3282, by decide +kernel⟩,
      ⟨3282, by decide +kernel⟩,
      ⟨3282, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3280, by decide +kernel⟩,
  TableOp.marker
    ⟨172, by decide +kernel⟩
    ⟨3281, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3285, by decide +kernel⟩,
      ⟨3285, by decide +kernel⟩,
      ⟨3285, by decide +kernel⟩,
      ⟨3285, by decide +kernel⟩,
      ⟨3285, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3283, by decide +kernel⟩,
  TableOp.marker
    ⟨173, by decide +kernel⟩
    ⟨3284, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3288, by decide +kernel⟩,
      ⟨3288, by decide +kernel⟩,
      ⟨3288, by decide +kernel⟩,
      ⟨3288, by decide +kernel⟩,
      ⟨3288, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3286, by decide +kernel⟩,
  TableOp.marker
    ⟨174, by decide +kernel⟩
    ⟨3287, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3291, by decide +kernel⟩,
      ⟨3291, by decide +kernel⟩,
      ⟨3291, by decide +kernel⟩,
      ⟨3291, by decide +kernel⟩,
      ⟨3291, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3289, by decide +kernel⟩,
  TableOp.marker
    ⟨1384, by decide +kernel⟩
    ⟨3290, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨176, by decide +kernel⟩,
      ⟨176, by decide +kernel⟩,
      ⟨176, by decide +kernel⟩,
      ⟨176, by decide +kernel⟩,
      ⟨176, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1408, by decide +kernel⟩,
  TableOp.marker
    ⟨3292, by decide +kernel⟩
    ⟨3293, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨182, by decide +kernel⟩,
      ⟨182, by decide +kernel⟩,
      ⟨182, by decide +kernel⟩,
      ⟨182, by decide +kernel⟩,
      ⟨182, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_102_1 : source_102_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_102_1 := by
  decide +kernel
noncomputable def source_101_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_101_1 source_102_1
noncomputable def tables_101_2 : List (TableOp 4042) := tables_101_1 ++ tables_102_1
theorem fact_101_2 : source_101_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_101_2 :=
  source_tables_branch 32 source_101_1 source_102_1
    tables_101_1 tables_102_1 fact_101_1 fact_102_1
noncomputable def source_99_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_99_2 source_101_2
noncomputable def tables_99_4 : List (TableOp 4042) := tables_99_2 ++ tables_101_2
theorem fact_99_4 : source_99_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_99_4 :=
  source_tables_branch 64 source_99_2 source_101_2
    tables_99_2 tables_101_2 fact_99_2 fact_101_2
noncomputable def source_95_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_95_4 source_99_4
noncomputable def tables_95_8 : List (TableOp 4042) := tables_95_4 ++ tables_99_4
theorem fact_95_8 : source_95_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_8 :=
  source_tables_branch 128 source_95_4 source_99_4
    tables_95_4 tables_99_4 fact_95_4 fact_99_4
noncomputable def source_103_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3296
noncomputable def tables_103_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1387, by decide +kernel⟩,
  TableOp.marker
    ⟨3295, by decide +kernel⟩
    ⟨3296, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3300, by decide +kernel⟩,
      ⟨3300, by decide +kernel⟩,
      ⟨3300, by decide +kernel⟩,
      ⟨3300, by decide +kernel⟩,
      ⟨3300, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3298, by decide +kernel⟩,
  TableOp.marker
    ⟨1390, by decide +kernel⟩
    ⟨3299, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3295, by decide +kernel⟩
    ⟨1390, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1393, by decide +kernel⟩,
  TableOp.marker
    ⟨3301, by decide +kernel⟩
    ⟨3302, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3306, by decide +kernel⟩,
      ⟨3306, by decide +kernel⟩,
      ⟨3306, by decide +kernel⟩,
      ⟨3306, by decide +kernel⟩,
      ⟨3306, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3304, by decide +kernel⟩,
  TableOp.marker
    ⟨1397, by decide +kernel⟩
    ⟨3305, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3310, by decide +kernel⟩,
      ⟨3310, by decide +kernel⟩,
      ⟨3310, by decide +kernel⟩,
      ⟨3310, by decide +kernel⟩,
      ⟨3310, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3292, by decide +kernel⟩
    ⟨1397, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3307, by decide +kernel⟩,
  TableOp.marker
    ⟨3308, by decide +kernel⟩
    ⟨3309, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1384, by decide +kernel⟩
    ⟨3308, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1400, by decide +kernel⟩,
  TableOp.marker
    ⟨3311, by decide +kernel⟩
    ⟨3312, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3316, by decide +kernel⟩,
      ⟨3316, by decide +kernel⟩,
      ⟨3316, by decide +kernel⟩,
      ⟨3316, by decide +kernel⟩,
      ⟨3316, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3314, by decide +kernel⟩,
  TableOp.marker
    ⟨175, by decide +kernel⟩
    ⟨3315, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3320, by decide +kernel⟩,
      ⟨3320, by decide +kernel⟩,
      ⟨3320, by decide +kernel⟩,
      ⟨3320, by decide +kernel⟩,
      ⟨3320, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨179, by decide +kernel⟩,
      ⟨179, by decide +kernel⟩,
      ⟨179, by decide +kernel⟩,
      ⟨179, by decide +kernel⟩,
      ⟨179, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3317, by decide +kernel⟩,
  TableOp.marker
    ⟨3318, by decide +kernel⟩
    ⟨3319, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3323, by decide +kernel⟩,
      ⟨3323, by decide +kernel⟩,
      ⟨3323, by decide +kernel⟩,
      ⟨3323, by decide +kernel⟩,
      ⟨3323, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3321, by decide +kernel⟩,
  TableOp.marker
    ⟨1411, by decide +kernel⟩
    ⟨3322, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3318, by decide +kernel⟩
    ⟨1411, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1414, by decide +kernel⟩,
  TableOp.marker
    ⟨3324, by decide +kernel⟩
    ⟨3325, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3329, by decide +kernel⟩,
      ⟨3329, by decide +kernel⟩,
      ⟨3329, by decide +kernel⟩,
      ⟨3329, by decide +kernel⟩,
      ⟨3329, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_103_1 : source_103_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_103_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t104\t{now}"
      handle.flush
noncomputable def source_104_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3328
noncomputable def tables_104_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3327, by decide +kernel⟩,
  TableOp.marker
    ⟨176, by decide +kernel⟩
    ⟨3328, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1422, by decide +kernel⟩,
  TableOp.marker
    ⟨178, by decide +kernel⟩
    ⟨3330, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3334, by decide +kernel⟩,
      ⟨3334, by decide +kernel⟩,
      ⟨3334, by decide +kernel⟩,
      ⟨3334, by decide +kernel⟩,
      ⟨3334, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3332, by decide +kernel⟩,
  TableOp.marker
    ⟨177, by decide +kernel⟩
    ⟨3333, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3337, by decide +kernel⟩,
      ⟨3337, by decide +kernel⟩,
      ⟨3337, by decide +kernel⟩,
      ⟨3337, by decide +kernel⟩,
      ⟨3337, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3335, by decide +kernel⟩,
  TableOp.marker
    ⟨179, by decide +kernel⟩
    ⟨3336, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3341, by decide +kernel⟩,
      ⟨3341, by decide +kernel⟩,
      ⟨3341, by decide +kernel⟩,
      ⟨3341, by decide +kernel⟩,
      ⟨3341, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨181, by decide +kernel⟩,
      ⟨181, by decide +kernel⟩,
      ⟨181, by decide +kernel⟩,
      ⟨181, by decide +kernel⟩,
      ⟨181, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3338, by decide +kernel⟩,
  TableOp.marker
    ⟨3339, by decide +kernel⟩
    ⟨3340, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3344, by decide +kernel⟩,
      ⟨3344, by decide +kernel⟩,
      ⟨3344, by decide +kernel⟩,
      ⟨3344, by decide +kernel⟩,
      ⟨3344, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3342, by decide +kernel⟩,
  TableOp.marker
    ⟨1428, by decide +kernel⟩
    ⟨3343, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3339, by decide +kernel⟩
    ⟨1428, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1431, by decide +kernel⟩,
  TableOp.marker
    ⟨3345, by decide +kernel⟩
    ⟨3346, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3350, by decide +kernel⟩,
      ⟨3350, by decide +kernel⟩,
      ⟨3350, by decide +kernel⟩,
      ⟨3350, by decide +kernel⟩,
      ⟨3350, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3348, by decide +kernel⟩,
  TableOp.marker
    ⟨180, by decide +kernel⟩
    ⟨3349, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨145, by decide +kernel⟩
    ⟨3339, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1439, by decide +kernel⟩,
  TableOp.marker
    ⟨3351, by decide +kernel⟩
    ⟨3352, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3356, by decide +kernel⟩,
      ⟨3356, by decide +kernel⟩,
      ⟨3356, by decide +kernel⟩,
      ⟨3356, by decide +kernel⟩,
      ⟨3356, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3354, by decide +kernel⟩,
  TableOp.marker
    ⟨181, by decide +kernel⟩
    ⟨3355, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3360, by decide +kernel⟩,
      ⟨3360, by decide +kernel⟩,
      ⟨3360, by decide +kernel⟩,
      ⟨3360, by decide +kernel⟩,
      ⟨3360, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨183, by decide +kernel⟩,
      ⟨183, by decide +kernel⟩,
      ⟨183, by decide +kernel⟩,
      ⟨183, by decide +kernel⟩,
      ⟨183, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3357, by decide +kernel⟩
]
theorem fact_104_1 : source_104_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_104_1 := by
  decide +kernel
noncomputable def source_103_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_103_1 source_104_1
noncomputable def tables_103_2 : List (TableOp 4042) := tables_103_1 ++ tables_104_1
theorem fact_103_2 : source_103_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_103_2 :=
  source_tables_branch 32 source_103_1 source_104_1
    tables_103_1 tables_104_1 fact_103_1 fact_104_1
noncomputable def source_105_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3360
noncomputable def tables_105_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨3358, by decide +kernel⟩
    ⟨3359, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3363, by decide +kernel⟩,
      ⟨3363, by decide +kernel⟩,
      ⟨3363, by decide +kernel⟩,
      ⟨3363, by decide +kernel⟩,
      ⟨3363, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3361, by decide +kernel⟩,
  TableOp.marker
    ⟨1448, by decide +kernel⟩
    ⟨3362, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3358, by decide +kernel⟩
    ⟨1448, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1451, by decide +kernel⟩,
  TableOp.marker
    ⟨3364, by decide +kernel⟩
    ⟨3365, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3369, by decide +kernel⟩,
      ⟨3369, by decide +kernel⟩,
      ⟨3369, by decide +kernel⟩,
      ⟨3369, by decide +kernel⟩,
      ⟨3369, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3367, by decide +kernel⟩,
  TableOp.marker
    ⟨182, by decide +kernel⟩
    ⟨3368, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1467, by decide +kernel⟩,
  TableOp.marker
    ⟨226, by decide +kernel⟩
    ⟨3370, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨226, by decide +kernel⟩
    ⟨3358, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1459, by decide +kernel⟩,
  TableOp.marker
    ⟨3372, by decide +kernel⟩
    ⟨3373, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3377, by decide +kernel⟩,
      ⟨3377, by decide +kernel⟩,
      ⟨3377, by decide +kernel⟩,
      ⟨3377, by decide +kernel⟩,
      ⟨3377, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3375, by decide +kernel⟩,
  TableOp.marker
    ⟨183, by decide +kernel⟩
    ⟨3376, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3380, by decide +kernel⟩,
      ⟨3380, by decide +kernel⟩,
      ⟨3380, by decide +kernel⟩,
      ⟨3380, by decide +kernel⟩,
      ⟨3380, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3378, by decide +kernel⟩,
  TableOp.marker
    ⟨1470, by decide +kernel⟩
    ⟨3379, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3138, by decide +kernel⟩
    ⟨1470, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1473, by decide +kernel⟩,
  TableOp.marker
    ⟨3381, by decide +kernel⟩
    ⟨3382, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3386, by decide +kernel⟩,
      ⟨3386, by decide +kernel⟩,
      ⟨3386, by decide +kernel⟩,
      ⟨3386, by decide +kernel⟩,
      ⟨3386, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3384, by decide +kernel⟩,
  TableOp.marker
    ⟨184, by decide +kernel⟩
    ⟨3385, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3390, by decide +kernel⟩,
      ⟨3390, by decide +kernel⟩,
      ⟨3390, by decide +kernel⟩,
      ⟨3390, by decide +kernel⟩,
      ⟨3390, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨188, by decide +kernel⟩,
      ⟨188, by decide +kernel⟩,
      ⟨188, by decide +kernel⟩,
      ⟨188, by decide +kernel⟩,
      ⟨188, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3387, by decide +kernel⟩,
  TableOp.marker
    ⟨3388, by decide +kernel⟩
    ⟨3389, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3393, by decide +kernel⟩,
      ⟨3393, by decide +kernel⟩,
      ⟨3393, by decide +kernel⟩,
      ⟨3393, by decide +kernel⟩,
      ⟨3393, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_105_1 : source_105_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_105_1 := by
  decide +kernel
noncomputable def source_106_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3392
noncomputable def tables_106_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3391, by decide +kernel⟩,
  TableOp.marker
    ⟨1484, by decide +kernel⟩
    ⟨3392, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3388, by decide +kernel⟩
    ⟨1484, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1487, by decide +kernel⟩,
  TableOp.marker
    ⟨3394, by decide +kernel⟩
    ⟨3395, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3399, by decide +kernel⟩,
      ⟨3399, by decide +kernel⟩,
      ⟨3399, by decide +kernel⟩,
      ⟨3399, by decide +kernel⟩,
      ⟨3399, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3397, by decide +kernel⟩,
  TableOp.marker
    ⟨185, by decide +kernel⟩
    ⟨3398, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1495, by decide +kernel⟩,
  TableOp.marker
    ⟨187, by decide +kernel⟩
    ⟨3400, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3404, by decide +kernel⟩,
      ⟨3404, by decide +kernel⟩,
      ⟨3404, by decide +kernel⟩,
      ⟨3404, by decide +kernel⟩,
      ⟨3404, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3402, by decide +kernel⟩,
  TableOp.marker
    ⟨186, by decide +kernel⟩
    ⟨3403, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3407, by decide +kernel⟩,
      ⟨3407, by decide +kernel⟩,
      ⟨3407, by decide +kernel⟩,
      ⟨3407, by decide +kernel⟩,
      ⟨3407, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3405, by decide +kernel⟩,
  TableOp.marker
    ⟨188, by decide +kernel⟩
    ⟨3406, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3411, by decide +kernel⟩,
      ⟨3411, by decide +kernel⟩,
      ⟨3411, by decide +kernel⟩,
      ⟨3411, by decide +kernel⟩,
      ⟨3411, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨190, by decide +kernel⟩,
      ⟨190, by decide +kernel⟩,
      ⟨190, by decide +kernel⟩,
      ⟨190, by decide +kernel⟩,
      ⟨190, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3408, by decide +kernel⟩,
  TableOp.marker
    ⟨3409, by decide +kernel⟩
    ⟨3410, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3414, by decide +kernel⟩,
      ⟨3414, by decide +kernel⟩,
      ⟨3414, by decide +kernel⟩,
      ⟨3414, by decide +kernel⟩,
      ⟨3414, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3412, by decide +kernel⟩,
  TableOp.marker
    ⟨1501, by decide +kernel⟩
    ⟨3413, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3409, by decide +kernel⟩
    ⟨1501, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1504, by decide +kernel⟩,
  TableOp.marker
    ⟨3415, by decide +kernel⟩
    ⟨3416, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3420, by decide +kernel⟩,
      ⟨3420, by decide +kernel⟩,
      ⟨3420, by decide +kernel⟩,
      ⟨3420, by decide +kernel⟩,
      ⟨3420, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3418, by decide +kernel⟩,
  TableOp.marker
    ⟨189, by decide +kernel⟩
    ⟨3419, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨191, by decide +kernel⟩,
      ⟨191, by decide +kernel⟩,
      ⟨191, by decide +kernel⟩,
      ⟨191, by decide +kernel⟩,
      ⟨191, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1520, by decide +kernel⟩,
  TableOp.marker
    ⟨3421, by decide +kernel⟩
    ⟨3422, by decide +kernel⟩
]
theorem fact_106_1 : source_106_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_106_1 := by
  decide +kernel
noncomputable def source_105_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_105_1 source_106_1
noncomputable def tables_105_2 : List (TableOp 4042) := tables_105_1 ++ tables_106_1
theorem fact_105_2 : source_105_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_105_2 :=
  source_tables_branch 32 source_105_1 source_106_1
    tables_105_1 tables_106_1 fact_105_1 fact_106_1
noncomputable def source_103_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_103_2 source_105_2
noncomputable def tables_103_4 : List (TableOp 4042) := tables_103_2 ++ tables_105_2
theorem fact_103_4 : source_103_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_103_4 :=
  source_tables_branch 64 source_103_2 source_105_2
    tables_103_2 tables_105_2 fact_103_2 fact_105_2
noncomputable def source_107_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3424
noncomputable def tables_107_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3421, by decide +kernel⟩
    ⟨3409, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1512, by decide +kernel⟩,
  TableOp.marker
    ⟨3424, by decide +kernel⟩
    ⟨3425, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3429, by decide +kernel⟩,
      ⟨3429, by decide +kernel⟩,
      ⟨3429, by decide +kernel⟩,
      ⟨3429, by decide +kernel⟩,
      ⟨3429, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3427, by decide +kernel⟩,
  TableOp.marker
    ⟨190, by decide +kernel⟩
    ⟨3428, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3433, by decide +kernel⟩,
      ⟨3433, by decide +kernel⟩,
      ⟨3433, by decide +kernel⟩,
      ⟨3433, by decide +kernel⟩,
      ⟨3433, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨194, by decide +kernel⟩,
      ⟨194, by decide +kernel⟩,
      ⟨194, by decide +kernel⟩,
      ⟨194, by decide +kernel⟩,
      ⟨194, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3430, by decide +kernel⟩,
  TableOp.marker
    ⟨3431, by decide +kernel⟩
    ⟨3432, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3436, by decide +kernel⟩,
      ⟨3436, by decide +kernel⟩,
      ⟨3436, by decide +kernel⟩,
      ⟨3436, by decide +kernel⟩,
      ⟨3436, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3434, by decide +kernel⟩,
  TableOp.marker
    ⟨1523, by decide +kernel⟩
    ⟨3435, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3431, by decide +kernel⟩
    ⟨1523, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1526, by decide +kernel⟩,
  TableOp.marker
    ⟨3437, by decide +kernel⟩
    ⟨3438, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3442, by decide +kernel⟩,
      ⟨3442, by decide +kernel⟩,
      ⟨3442, by decide +kernel⟩,
      ⟨3442, by decide +kernel⟩,
      ⟨3442, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3440, by decide +kernel⟩,
  TableOp.marker
    ⟨191, by decide +kernel⟩
    ⟨3441, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1534, by decide +kernel⟩,
  TableOp.marker
    ⟨193, by decide +kernel⟩
    ⟨3443, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3447, by decide +kernel⟩,
      ⟨3447, by decide +kernel⟩,
      ⟨3447, by decide +kernel⟩,
      ⟨3447, by decide +kernel⟩,
      ⟨3447, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3445, by decide +kernel⟩,
  TableOp.marker
    ⟨192, by decide +kernel⟩
    ⟨3446, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3450, by decide +kernel⟩,
      ⟨3450, by decide +kernel⟩,
      ⟨3450, by decide +kernel⟩,
      ⟨3450, by decide +kernel⟩,
      ⟨3450, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3448, by decide +kernel⟩,
  TableOp.marker
    ⟨194, by decide +kernel⟩
    ⟨3449, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1539, by decide +kernel⟩,
  TableOp.marker
    ⟨196, by decide +kernel⟩
    ⟨3451, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3455, by decide +kernel⟩,
      ⟨3455, by decide +kernel⟩,
      ⟨3455, by decide +kernel⟩,
      ⟨3455, by decide +kernel⟩,
      ⟨3455, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3453, by decide +kernel⟩,
  TableOp.marker
    ⟨195, by decide +kernel⟩
    ⟨3454, by decide +kernel⟩
]
theorem fact_107_1 : source_107_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_107_1 := by
  decide +kernel
noncomputable def source_108_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3456
noncomputable def tables_108_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3458, by decide +kernel⟩,
      ⟨3458, by decide +kernel⟩,
      ⟨3458, by decide +kernel⟩,
      ⟨3458, by decide +kernel⟩,
      ⟨3458, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3456, by decide +kernel⟩,
  TableOp.marker
    ⟨197, by decide +kernel⟩
    ⟨3457, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1548, by decide +kernel⟩,
  TableOp.marker
    ⟨1545, by decide +kernel⟩
    ⟨3459, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3463, by decide +kernel⟩,
      ⟨3463, by decide +kernel⟩,
      ⟨3463, by decide +kernel⟩,
      ⟨3463, by decide +kernel⟩,
      ⟨3463, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3461, by decide +kernel⟩,
  TableOp.marker
    ⟨1551, by decide +kernel⟩
    ⟨3462, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3467, by decide +kernel⟩,
      ⟨3467, by decide +kernel⟩,
      ⟨3467, by decide +kernel⟩,
      ⟨3467, by decide +kernel⟩,
      ⟨3467, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨201, by decide +kernel⟩,
      ⟨201, by decide +kernel⟩,
      ⟨201, by decide +kernel⟩,
      ⟨201, by decide +kernel⟩,
      ⟨201, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3464, by decide +kernel⟩,
  TableOp.marker
    ⟨3465, by decide +kernel⟩
    ⟨3466, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨1551, by decide +kernel⟩
    ⟨3465, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1554, by decide +kernel⟩,
  TableOp.marker
    ⟨3468, by decide +kernel⟩
    ⟨3469, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3473, by decide +kernel⟩,
      ⟨3473, by decide +kernel⟩,
      ⟨3473, by decide +kernel⟩,
      ⟨3473, by decide +kernel⟩,
      ⟨3473, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3471, by decide +kernel⟩,
  TableOp.marker
    ⟨198, by decide +kernel⟩
    ⟨3472, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1562, by decide +kernel⟩,
  TableOp.marker
    ⟨200, by decide +kernel⟩
    ⟨3474, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3478, by decide +kernel⟩,
      ⟨3478, by decide +kernel⟩,
      ⟨3478, by decide +kernel⟩,
      ⟨3478, by decide +kernel⟩,
      ⟨3478, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3476, by decide +kernel⟩,
  TableOp.marker
    ⟨199, by decide +kernel⟩
    ⟨3477, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3481, by decide +kernel⟩,
      ⟨3481, by decide +kernel⟩,
      ⟨3481, by decide +kernel⟩,
      ⟨3481, by decide +kernel⟩,
      ⟨3481, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3479, by decide +kernel⟩,
  TableOp.marker
    ⟨201, by decide +kernel⟩
    ⟨3480, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1567, by decide +kernel⟩,
  TableOp.marker
    ⟨203, by decide +kernel⟩
    ⟨3482, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3486, by decide +kernel⟩,
      ⟨3486, by decide +kernel⟩,
      ⟨3486, by decide +kernel⟩,
      ⟨3486, by decide +kernel⟩,
      ⟨3486, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3484, by decide +kernel⟩,
  TableOp.marker
    ⟨202, by decide +kernel⟩
    ⟨3485, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3489, by decide +kernel⟩,
      ⟨3489, by decide +kernel⟩,
      ⟨3489, by decide +kernel⟩,
      ⟨3489, by decide +kernel⟩,
      ⟨3489, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_108_1 : source_108_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_108_1 := by
  decide +kernel
noncomputable def source_107_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_107_1 source_108_1
noncomputable def tables_107_2 : List (TableOp 4042) := tables_107_1 ++ tables_108_1
theorem fact_107_2 : source_107_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_107_2 :=
  source_tables_branch 32 source_107_1 source_108_1
    tables_107_1 tables_108_1 fact_107_1 fact_108_1
noncomputable def source_109_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3488
noncomputable def tables_109_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3487, by decide +kernel⟩,
  TableOp.marker
    ⟨204, by decide +kernel⟩
    ⟨3488, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1572, by decide +kernel⟩,
  TableOp.marker
    ⟨206, by decide +kernel⟩
    ⟨3490, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3494, by decide +kernel⟩,
      ⟨3494, by decide +kernel⟩,
      ⟨3494, by decide +kernel⟩,
      ⟨3494, by decide +kernel⟩,
      ⟨3494, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3492, by decide +kernel⟩,
  TableOp.marker
    ⟨205, by decide +kernel⟩
    ⟨3493, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3497, by decide +kernel⟩,
      ⟨3497, by decide +kernel⟩,
      ⟨3497, by decide +kernel⟩,
      ⟨3497, by decide +kernel⟩,
      ⟨3497, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3495, by decide +kernel⟩,
  TableOp.marker
    ⟨207, by decide +kernel⟩
    ⟨3496, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3500, by decide +kernel⟩,
      ⟨3500, by decide +kernel⟩,
      ⟨3500, by decide +kernel⟩,
      ⟨3500, by decide +kernel⟩,
      ⟨3500, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3498, by decide +kernel⟩,
  TableOp.marker
    ⟨208, by decide +kernel⟩
    ⟨3499, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3503, by decide +kernel⟩,
      ⟨3503, by decide +kernel⟩,
      ⟨3503, by decide +kernel⟩,
      ⟨3503, by decide +kernel⟩,
      ⟨3503, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3501, by decide +kernel⟩,
  TableOp.marker
    ⟨209, by decide +kernel⟩
    ⟨3502, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3507, by decide +kernel⟩,
      ⟨3507, by decide +kernel⟩,
      ⟨3507, by decide +kernel⟩,
      ⟨3507, by decide +kernel⟩,
      ⟨3507, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨213, by decide +kernel⟩,
      ⟨213, by decide +kernel⟩,
      ⟨213, by decide +kernel⟩,
      ⟨213, by decide +kernel⟩,
      ⟨213, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3504, by decide +kernel⟩,
  TableOp.marker
    ⟨3505, by decide +kernel⟩
    ⟨3506, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3510, by decide +kernel⟩,
      ⟨3510, by decide +kernel⟩,
      ⟨3510, by decide +kernel⟩,
      ⟨3510, by decide +kernel⟩,
      ⟨3510, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3508, by decide +kernel⟩,
  TableOp.marker
    ⟨1583, by decide +kernel⟩
    ⟨3509, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3505, by decide +kernel⟩
    ⟨1583, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1586, by decide +kernel⟩,
  TableOp.marker
    ⟨3511, by decide +kernel⟩
    ⟨3512, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3516, by decide +kernel⟩,
      ⟨3516, by decide +kernel⟩,
      ⟨3516, by decide +kernel⟩,
      ⟨3516, by decide +kernel⟩,
      ⟨3516, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3514, by decide +kernel⟩,
  TableOp.marker
    ⟨210, by decide +kernel⟩
    ⟨3515, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1594, by decide +kernel⟩,
  TableOp.marker
    ⟨212, by decide +kernel⟩
    ⟨3517, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3521, by decide +kernel⟩,
      ⟨3521, by decide +kernel⟩,
      ⟨3521, by decide +kernel⟩,
      ⟨3521, by decide +kernel⟩,
      ⟨3521, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_109_1 : source_109_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_109_1 := by
  decide +kernel
noncomputable def source_110_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3520
noncomputable def tables_110_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3519, by decide +kernel⟩,
  TableOp.marker
    ⟨211, by decide +kernel⟩
    ⟨3520, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3524, by decide +kernel⟩,
      ⟨3524, by decide +kernel⟩,
      ⟨3524, by decide +kernel⟩,
      ⟨3524, by decide +kernel⟩,
      ⟨3524, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3522, by decide +kernel⟩,
  TableOp.marker
    ⟨213, by decide +kernel⟩
    ⟨3523, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨215, by decide +kernel⟩,
      ⟨215, by decide +kernel⟩,
      ⟨215, by decide +kernel⟩,
      ⟨215, by decide +kernel⟩,
      ⟨215, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1611, by decide +kernel⟩,
  TableOp.marker
    ⟨3525, by decide +kernel⟩
    ⟨3526, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3530, by decide +kernel⟩,
      ⟨3530, by decide +kernel⟩,
      ⟨3530, by decide +kernel⟩,
      ⟨3530, by decide +kernel⟩,
      ⟨3530, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3528, by decide +kernel⟩,
  TableOp.marker
    ⟨1600, by decide +kernel⟩
    ⟨3529, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3525, by decide +kernel⟩
    ⟨1600, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1603, by decide +kernel⟩,
  TableOp.marker
    ⟨3531, by decide +kernel⟩
    ⟨3532, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3536, by decide +kernel⟩,
      ⟨3536, by decide +kernel⟩,
      ⟨3536, by decide +kernel⟩,
      ⟨3536, by decide +kernel⟩,
      ⟨3536, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3534, by decide +kernel⟩,
  TableOp.marker
    ⟨214, by decide +kernel⟩
    ⟨3535, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3539, by decide +kernel⟩,
      ⟨3539, by decide +kernel⟩,
      ⟨3539, by decide +kernel⟩,
      ⟨3539, by decide +kernel⟩,
      ⟨3539, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3537, by decide +kernel⟩,
  TableOp.marker
    ⟨1614, by decide +kernel⟩
    ⟨3538, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3543, by decide +kernel⟩,
      ⟨3543, by decide +kernel⟩,
      ⟨3543, by decide +kernel⟩,
      ⟨3543, by decide +kernel⟩,
      ⟨3543, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨217, by decide +kernel⟩,
      ⟨217, by decide +kernel⟩,
      ⟨217, by decide +kernel⟩,
      ⟨217, by decide +kernel⟩,
      ⟨217, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3540, by decide +kernel⟩,
  TableOp.marker
    ⟨3541, by decide +kernel⟩
    ⟨3542, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨218, by decide +kernel⟩,
      ⟨218, by decide +kernel⟩,
      ⟨218, by decide +kernel⟩,
      ⟨218, by decide +kernel⟩,
      ⟨218, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1617, by decide +kernel⟩,
  TableOp.marker
    ⟨3544, by decide +kernel⟩
    ⟨3545, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3549, by decide +kernel⟩,
      ⟨3549, by decide +kernel⟩,
      ⟨3549, by decide +kernel⟩,
      ⟨3549, by decide +kernel⟩,
      ⟨3549, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3547, by decide +kernel⟩,
  TableOp.marker
    ⟨1620, by decide +kernel⟩
    ⟨3548, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3544, by decide +kernel⟩
    ⟨1620, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1623, by decide +kernel⟩
]
theorem fact_110_1 : source_110_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_110_1 := by
  decide +kernel
noncomputable def source_109_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_109_1 source_110_1
noncomputable def tables_109_2 : List (TableOp 4042) := tables_109_1 ++ tables_110_1
theorem fact_109_2 : source_109_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_109_2 :=
  source_tables_branch 32 source_109_1 source_110_1
    tables_109_1 tables_110_1 fact_109_1 fact_110_1
noncomputable def source_107_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_107_2 source_109_2
noncomputable def tables_107_4 : List (TableOp 4042) := tables_107_2 ++ tables_109_2
theorem fact_107_4 : source_107_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_107_4 :=
  source_tables_branch 64 source_107_2 source_109_2
    tables_107_2 tables_109_2 fact_107_2 fact_109_2
noncomputable def source_103_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_103_4 source_107_4
noncomputable def tables_103_8 : List (TableOp 4042) := tables_103_4 ++ tables_107_4
theorem fact_103_8 : source_103_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_103_8 :=
  source_tables_branch 128 source_103_4 source_107_4
    tables_103_4 tables_107_4 fact_103_4 fact_107_4
noncomputable def source_95_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_95_8 source_103_8
noncomputable def tables_95_16 : List (TableOp 4042) := tables_95_8 ++ tables_103_8
theorem fact_95_16 : source_95_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_16 :=
  source_tables_branch 256 source_95_8 source_103_8
    tables_95_8 tables_103_8 fact_95_8 fact_103_8
noncomputable def source_111_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3552
noncomputable def tables_111_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨3550, by decide +kernel⟩
    ⟨3551, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3555, by decide +kernel⟩,
      ⟨3555, by decide +kernel⟩,
      ⟨3555, by decide +kernel⟩,
      ⟨3555, by decide +kernel⟩,
      ⟨3555, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3553, by decide +kernel⟩,
  TableOp.marker
    ⟨1627, by decide +kernel⟩
    ⟨3554, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3559, by decide +kernel⟩,
      ⟨3559, by decide +kernel⟩,
      ⟨3559, by decide +kernel⟩,
      ⟨3559, by decide +kernel⟩,
      ⟨3559, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3541, by decide +kernel⟩
    ⟨1627, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3556, by decide +kernel⟩,
  TableOp.marker
    ⟨3557, by decide +kernel⟩
    ⟨3558, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1614, by decide +kernel⟩
    ⟨3557, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1630, by decide +kernel⟩,
  TableOp.marker
    ⟨3560, by decide +kernel⟩
    ⟨3561, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3565, by decide +kernel⟩,
      ⟨3565, by decide +kernel⟩,
      ⟨3565, by decide +kernel⟩,
      ⟨3565, by decide +kernel⟩,
      ⟨3565, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3563, by decide +kernel⟩,
  TableOp.marker
    ⟨215, by decide +kernel⟩
    ⟨3564, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3568, by decide +kernel⟩,
      ⟨3568, by decide +kernel⟩,
      ⟨3568, by decide +kernel⟩,
      ⟨3568, by decide +kernel⟩,
      ⟨3568, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3566, by decide +kernel⟩,
  TableOp.marker
    ⟨216, by decide +kernel⟩
    ⟨3567, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3571, by decide +kernel⟩,
      ⟨3571, by decide +kernel⟩,
      ⟨3571, by decide +kernel⟩,
      ⟨3571, by decide +kernel⟩,
      ⟨3571, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3569, by decide +kernel⟩,
  TableOp.marker
    ⟨217, by decide +kernel⟩
    ⟨3570, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨219, by decide +kernel⟩,
      ⟨219, by decide +kernel⟩,
      ⟨219, by decide +kernel⟩,
      ⟨219, by decide +kernel⟩,
      ⟨219, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1650, by decide +kernel⟩,
  TableOp.marker
    ⟨3572, by decide +kernel⟩
    ⟨3573, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3577, by decide +kernel⟩,
      ⟨3577, by decide +kernel⟩,
      ⟨3577, by decide +kernel⟩,
      ⟨3577, by decide +kernel⟩,
      ⟨3577, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3575, by decide +kernel⟩,
  TableOp.marker
    ⟨1639, by decide +kernel⟩
    ⟨3576, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3572, by decide +kernel⟩
    ⟨1639, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1642, by decide +kernel⟩,
  TableOp.marker
    ⟨3578, by decide +kernel⟩
    ⟨3579, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3583, by decide +kernel⟩,
      ⟨3583, by decide +kernel⟩,
      ⟨3583, by decide +kernel⟩,
      ⟨3583, by decide +kernel⟩,
      ⟨3583, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3581, by decide +kernel⟩,
  TableOp.marker
    ⟨218, by decide +kernel⟩
    ⟨3582, by decide +kernel⟩
]
theorem fact_111_1 : source_111_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_111_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t112\t{now}"
      handle.flush
noncomputable def source_112_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3584
noncomputable def tables_112_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3586, by decide +kernel⟩,
      ⟨3586, by decide +kernel⟩,
      ⟨3586, by decide +kernel⟩,
      ⟨3586, by decide +kernel⟩,
      ⟨3586, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3584, by decide +kernel⟩,
  TableOp.marker
    ⟨1653, by decide +kernel⟩
    ⟨3585, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3590, by decide +kernel⟩,
      ⟨3590, by decide +kernel⟩,
      ⟨3590, by decide +kernel⟩,
      ⟨3590, by decide +kernel⟩,
      ⟨3590, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨220, by decide +kernel⟩,
      ⟨220, by decide +kernel⟩,
      ⟨220, by decide +kernel⟩,
      ⟨220, by decide +kernel⟩,
      ⟨220, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3587, by decide +kernel⟩,
  TableOp.marker
    ⟨3588, by decide +kernel⟩
    ⟨3589, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨221, by decide +kernel⟩,
      ⟨221, by decide +kernel⟩,
      ⟨221, by decide +kernel⟩,
      ⟨221, by decide +kernel⟩,
      ⟨221, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1656, by decide +kernel⟩,
  TableOp.marker
    ⟨3591, by decide +kernel⟩
    ⟨3592, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3596, by decide +kernel⟩,
      ⟨3596, by decide +kernel⟩,
      ⟨3596, by decide +kernel⟩,
      ⟨3596, by decide +kernel⟩,
      ⟨3596, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3594, by decide +kernel⟩,
  TableOp.marker
    ⟨1659, by decide +kernel⟩
    ⟨3595, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3591, by decide +kernel⟩
    ⟨1659, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1662, by decide +kernel⟩,
  TableOp.marker
    ⟨3597, by decide +kernel⟩
    ⟨3598, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3602, by decide +kernel⟩,
      ⟨3602, by decide +kernel⟩,
      ⟨3602, by decide +kernel⟩,
      ⟨3602, by decide +kernel⟩,
      ⟨3602, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3600, by decide +kernel⟩,
  TableOp.marker
    ⟨1666, by decide +kernel⟩
    ⟨3601, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3606, by decide +kernel⟩,
      ⟨3606, by decide +kernel⟩,
      ⟨3606, by decide +kernel⟩,
      ⟨3606, by decide +kernel⟩,
      ⟨3606, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3588, by decide +kernel⟩
    ⟨1666, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3603, by decide +kernel⟩,
  TableOp.marker
    ⟨3604, by decide +kernel⟩
    ⟨3605, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1653, by decide +kernel⟩
    ⟨3604, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1669, by decide +kernel⟩,
  TableOp.marker
    ⟨3607, by decide +kernel⟩
    ⟨3608, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3612, by decide +kernel⟩,
      ⟨3612, by decide +kernel⟩,
      ⟨3612, by decide +kernel⟩,
      ⟨3612, by decide +kernel⟩,
      ⟨3612, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3610, by decide +kernel⟩,
  TableOp.marker
    ⟨219, by decide +kernel⟩
    ⟨3611, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1781, by decide +kernel⟩,
  TableOp.marker
    ⟨220, by decide +kernel⟩
    ⟨3613, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨222, by decide +kernel⟩,
      ⟨222, by decide +kernel⟩,
      ⟨222, by decide +kernel⟩,
      ⟨222, by decide +kernel⟩,
      ⟨222, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_112_1 : source_112_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_112_1 := by
  decide +kernel
noncomputable def source_111_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_111_1 source_112_1
noncomputable def tables_111_2 : List (TableOp 4042) := tables_111_1 ++ tables_112_1
theorem fact_111_2 : source_111_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_111_2 :=
  source_tables_branch 32 source_111_1 source_112_1
    tables_111_1 tables_112_1 fact_111_1 fact_112_1
noncomputable def source_113_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3616
noncomputable def tables_113_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨1689, by decide +kernel⟩,
  TableOp.marker
    ⟨3615, by decide +kernel⟩
    ⟨3616, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3620, by decide +kernel⟩,
      ⟨3620, by decide +kernel⟩,
      ⟨3620, by decide +kernel⟩,
      ⟨3620, by decide +kernel⟩,
      ⟨3620, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3618, by decide +kernel⟩,
  TableOp.marker
    ⟨1678, by decide +kernel⟩
    ⟨3619, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3615, by decide +kernel⟩
    ⟨1678, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1681, by decide +kernel⟩,
  TableOp.marker
    ⟨3621, by decide +kernel⟩
    ⟨3622, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3626, by decide +kernel⟩,
      ⟨3626, by decide +kernel⟩,
      ⟨3626, by decide +kernel⟩,
      ⟨3626, by decide +kernel⟩,
      ⟨3626, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3624, by decide +kernel⟩,
  TableOp.marker
    ⟨221, by decide +kernel⟩
    ⟨3625, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3629, by decide +kernel⟩,
      ⟨3629, by decide +kernel⟩,
      ⟨3629, by decide +kernel⟩,
      ⟨3629, by decide +kernel⟩,
      ⟨3629, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3627, by decide +kernel⟩,
  TableOp.marker
    ⟨1692, by decide +kernel⟩
    ⟨3628, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3633, by decide +kernel⟩,
      ⟨3633, by decide +kernel⟩,
      ⟨3633, by decide +kernel⟩,
      ⟨3633, by decide +kernel⟩,
      ⟨3633, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨223, by decide +kernel⟩,
      ⟨223, by decide +kernel⟩,
      ⟨223, by decide +kernel⟩,
      ⟨223, by decide +kernel⟩,
      ⟨223, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3630, by decide +kernel⟩,
  TableOp.marker
    ⟨3631, by decide +kernel⟩
    ⟨3632, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨224, by decide +kernel⟩,
      ⟨224, by decide +kernel⟩,
      ⟨224, by decide +kernel⟩,
      ⟨224, by decide +kernel⟩,
      ⟨224, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1695, by decide +kernel⟩,
  TableOp.marker
    ⟨3634, by decide +kernel⟩
    ⟨3635, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3639, by decide +kernel⟩,
      ⟨3639, by decide +kernel⟩,
      ⟨3639, by decide +kernel⟩,
      ⟨3639, by decide +kernel⟩,
      ⟨3639, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3637, by decide +kernel⟩,
  TableOp.marker
    ⟨1698, by decide +kernel⟩
    ⟨3638, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3634, by decide +kernel⟩
    ⟨1698, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1701, by decide +kernel⟩,
  TableOp.marker
    ⟨3640, by decide +kernel⟩
    ⟨3641, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3645, by decide +kernel⟩,
      ⟨3645, by decide +kernel⟩,
      ⟨3645, by decide +kernel⟩,
      ⟨3645, by decide +kernel⟩,
      ⟨3645, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3643, by decide +kernel⟩,
  TableOp.marker
    ⟨1705, by decide +kernel⟩
    ⟨3644, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3649, by decide +kernel⟩,
      ⟨3649, by decide +kernel⟩,
      ⟨3649, by decide +kernel⟩,
      ⟨3649, by decide +kernel⟩,
      ⟨3649, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3631, by decide +kernel⟩
    ⟨1705, by decide +kernel⟩
]
theorem fact_113_1 : source_113_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_113_1 := by
  decide +kernel
noncomputable def source_114_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3648
noncomputable def tables_114_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3646, by decide +kernel⟩,
  TableOp.marker
    ⟨3647, by decide +kernel⟩
    ⟨3648, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1692, by decide +kernel⟩
    ⟨3647, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1708, by decide +kernel⟩,
  TableOp.marker
    ⟨3650, by decide +kernel⟩
    ⟨3651, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3655, by decide +kernel⟩,
      ⟨3655, by decide +kernel⟩,
      ⟨3655, by decide +kernel⟩,
      ⟨3655, by decide +kernel⟩,
      ⟨3655, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3653, by decide +kernel⟩,
  TableOp.marker
    ⟨222, by decide +kernel⟩
    ⟨3654, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1962, by decide +kernel⟩,
  TableOp.marker
    ⟨223, by decide +kernel⟩
    ⟨3656, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨225, by decide +kernel⟩,
      ⟨225, by decide +kernel⟩,
      ⟨225, by decide +kernel⟩,
      ⟨225, by decide +kernel⟩,
      ⟨225, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1728, by decide +kernel⟩,
  TableOp.marker
    ⟨3658, by decide +kernel⟩
    ⟨3659, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3663, by decide +kernel⟩,
      ⟨3663, by decide +kernel⟩,
      ⟨3663, by decide +kernel⟩,
      ⟨3663, by decide +kernel⟩,
      ⟨3663, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3661, by decide +kernel⟩,
  TableOp.marker
    ⟨1717, by decide +kernel⟩
    ⟨3662, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3658, by decide +kernel⟩
    ⟨1717, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1720, by decide +kernel⟩,
  TableOp.marker
    ⟨3664, by decide +kernel⟩
    ⟨3665, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3669, by decide +kernel⟩,
      ⟨3669, by decide +kernel⟩,
      ⟨3669, by decide +kernel⟩,
      ⟨3669, by decide +kernel⟩,
      ⟨3669, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3667, by decide +kernel⟩,
  TableOp.marker
    ⟨224, by decide +kernel⟩
    ⟨3668, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3672, by decide +kernel⟩,
      ⟨3672, by decide +kernel⟩,
      ⟨3672, by decide +kernel⟩,
      ⟨3672, by decide +kernel⟩,
      ⟨3672, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3670, by decide +kernel⟩,
  TableOp.marker
    ⟨1731, by decide +kernel⟩
    ⟨3671, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3676, by decide +kernel⟩,
      ⟨3676, by decide +kernel⟩,
      ⟨3676, by decide +kernel⟩,
      ⟨3676, by decide +kernel⟩,
      ⟨3676, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨226, by decide +kernel⟩,
      ⟨226, by decide +kernel⟩,
      ⟨226, by decide +kernel⟩,
      ⟨226, by decide +kernel⟩,
      ⟨226, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3673, by decide +kernel⟩,
  TableOp.marker
    ⟨3674, by decide +kernel⟩
    ⟨3675, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨227, by decide +kernel⟩,
      ⟨227, by decide +kernel⟩,
      ⟨227, by decide +kernel⟩,
      ⟨227, by decide +kernel⟩,
      ⟨227, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1734, by decide +kernel⟩,
  TableOp.marker
    ⟨3677, by decide +kernel⟩
    ⟨3678, by decide +kernel⟩
]
theorem fact_114_1 : source_114_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_114_1 := by
  decide +kernel
noncomputable def source_113_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_113_1 source_114_1
noncomputable def tables_113_2 : List (TableOp 4042) := tables_113_1 ++ tables_114_1
theorem fact_113_2 : source_113_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_113_2 :=
  source_tables_branch 32 source_113_1 source_114_1
    tables_113_1 tables_114_1 fact_113_1 fact_114_1
noncomputable def source_111_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_111_2 source_113_2
noncomputable def tables_111_4 : List (TableOp 4042) := tables_111_2 ++ tables_113_2
theorem fact_111_4 : source_111_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_111_4 :=
  source_tables_branch 64 source_111_2 source_113_2
    tables_111_2 tables_113_2 fact_111_2 fact_113_2
noncomputable def source_115_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3680
noncomputable def tables_115_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3682, by decide +kernel⟩,
      ⟨3682, by decide +kernel⟩,
      ⟨3682, by decide +kernel⟩,
      ⟨3682, by decide +kernel⟩,
      ⟨3682, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3680, by decide +kernel⟩,
  TableOp.marker
    ⟨1737, by decide +kernel⟩
    ⟨3681, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3677, by decide +kernel⟩
    ⟨1737, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1740, by decide +kernel⟩,
  TableOp.marker
    ⟨3683, by decide +kernel⟩
    ⟨3684, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3688, by decide +kernel⟩,
      ⟨3688, by decide +kernel⟩,
      ⟨3688, by decide +kernel⟩,
      ⟨3688, by decide +kernel⟩,
      ⟨3688, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3686, by decide +kernel⟩,
  TableOp.marker
    ⟨1744, by decide +kernel⟩
    ⟨3687, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3692, by decide +kernel⟩,
      ⟨3692, by decide +kernel⟩,
      ⟨3692, by decide +kernel⟩,
      ⟨3692, by decide +kernel⟩,
      ⟨3692, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3674, by decide +kernel⟩
    ⟨1744, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3689, by decide +kernel⟩,
  TableOp.marker
    ⟨3690, by decide +kernel⟩
    ⟨3691, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1731, by decide +kernel⟩
    ⟨3690, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1747, by decide +kernel⟩,
  TableOp.marker
    ⟨3693, by decide +kernel⟩
    ⟨3694, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3698, by decide +kernel⟩,
      ⟨3698, by decide +kernel⟩,
      ⟨3698, by decide +kernel⟩,
      ⟨3698, by decide +kernel⟩,
      ⟨3698, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3696, by decide +kernel⟩,
  TableOp.marker
    ⟨225, by decide +kernel⟩
    ⟨3697, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨228, by decide +kernel⟩,
      ⟨228, by decide +kernel⟩,
      ⟨228, by decide +kernel⟩,
      ⟨228, by decide +kernel⟩,
      ⟨228, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1767, by decide +kernel⟩,
  TableOp.marker
    ⟨3699, by decide +kernel⟩
    ⟨3700, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3704, by decide +kernel⟩,
      ⟨3704, by decide +kernel⟩,
      ⟨3704, by decide +kernel⟩,
      ⟨3704, by decide +kernel⟩,
      ⟨3704, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3702, by decide +kernel⟩,
  TableOp.marker
    ⟨1756, by decide +kernel⟩
    ⟨3703, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3699, by decide +kernel⟩
    ⟨1756, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1759, by decide +kernel⟩,
  TableOp.marker
    ⟨3705, by decide +kernel⟩
    ⟨3706, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3710, by decide +kernel⟩,
      ⟨3710, by decide +kernel⟩,
      ⟨3710, by decide +kernel⟩,
      ⟨3710, by decide +kernel⟩,
      ⟨3710, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3708, by decide +kernel⟩,
  TableOp.marker
    ⟨227, by decide +kernel⟩
    ⟨3709, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3713, by decide +kernel⟩,
      ⟨3713, by decide +kernel⟩,
      ⟨3713, by decide +kernel⟩,
      ⟨3713, by decide +kernel⟩,
      ⟨3713, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_115_1 : source_115_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_115_1 := by
  decide +kernel
noncomputable def source_116_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3712
noncomputable def tables_116_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3711, by decide +kernel⟩,
  TableOp.marker
    ⟨1770, by decide +kernel⟩
    ⟨3712, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3717, by decide +kernel⟩,
      ⟨3717, by decide +kernel⟩,
      ⟨3717, by decide +kernel⟩,
      ⟨3717, by decide +kernel⟩,
      ⟨3717, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨229, by decide +kernel⟩,
      ⟨229, by decide +kernel⟩,
      ⟨229, by decide +kernel⟩,
      ⟨229, by decide +kernel⟩,
      ⟨229, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3714, by decide +kernel⟩,
  TableOp.marker
    ⟨3715, by decide +kernel⟩
    ⟨3716, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3721, by decide +kernel⟩,
      ⟨3721, by decide +kernel⟩,
      ⟨3721, by decide +kernel⟩,
      ⟨3721, by decide +kernel⟩,
      ⟨3721, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3715, by decide +kernel⟩
    ⟨1005, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3718, by decide +kernel⟩,
  TableOp.marker
    ⟨3719, by decide +kernel⟩
    ⟨3720, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1770, by decide +kernel⟩
    ⟨3719, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1773, by decide +kernel⟩,
  TableOp.marker
    ⟨3722, by decide +kernel⟩
    ⟨3723, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3727, by decide +kernel⟩,
      ⟨3727, by decide +kernel⟩,
      ⟨3727, by decide +kernel⟩,
      ⟨3727, by decide +kernel⟩,
      ⟨3727, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3725, by decide +kernel⟩,
  TableOp.marker
    ⟨228, by decide +kernel⟩
    ⟨3726, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1979, by decide +kernel⟩,
  TableOp.marker
    ⟨229, by decide +kernel⟩
    ⟨3728, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3733, by decide +kernel⟩,
      ⟨3733, by decide +kernel⟩,
      ⟨3733, by decide +kernel⟩,
      ⟨3733, by decide +kernel⟩,
      ⟨3733, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨233, by decide +kernel⟩,
      ⟨233, by decide +kernel⟩,
      ⟨233, by decide +kernel⟩,
      ⟨233, by decide +kernel⟩,
      ⟨233, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3730, by decide +kernel⟩,
  TableOp.marker
    ⟨3731, by decide +kernel⟩
    ⟨3732, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3736, by decide +kernel⟩,
      ⟨3736, by decide +kernel⟩,
      ⟨3736, by decide +kernel⟩,
      ⟨3736, by decide +kernel⟩,
      ⟨3736, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3734, by decide +kernel⟩,
  TableOp.marker
    ⟨1784, by decide +kernel⟩
    ⟨3735, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3731, by decide +kernel⟩
    ⟨1784, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1787, by decide +kernel⟩,
  TableOp.marker
    ⟨3737, by decide +kernel⟩
    ⟨3738, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3742, by decide +kernel⟩,
      ⟨3742, by decide +kernel⟩,
      ⟨3742, by decide +kernel⟩,
      ⟨3742, by decide +kernel⟩,
      ⟨3742, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3740, by decide +kernel⟩,
  TableOp.marker
    ⟨230, by decide +kernel⟩
    ⟨3741, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1795, by decide +kernel⟩
]
theorem fact_116_1 : source_116_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_116_1 := by
  decide +kernel
noncomputable def source_115_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_115_1 source_116_1
noncomputable def tables_115_2 : List (TableOp 4042) := tables_115_1 ++ tables_116_1
theorem fact_115_2 : source_115_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_115_2 :=
  source_tables_branch 32 source_115_1 source_116_1
    tables_115_1 tables_116_1 fact_115_1 fact_116_1
noncomputable def source_117_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3744
noncomputable def tables_117_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨232, by decide +kernel⟩
    ⟨3743, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3747, by decide +kernel⟩,
      ⟨3747, by decide +kernel⟩,
      ⟨3747, by decide +kernel⟩,
      ⟨3747, by decide +kernel⟩,
      ⟨3747, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3745, by decide +kernel⟩,
  TableOp.marker
    ⟨231, by decide +kernel⟩
    ⟨3746, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3750, by decide +kernel⟩,
      ⟨3750, by decide +kernel⟩,
      ⟨3750, by decide +kernel⟩,
      ⟨3750, by decide +kernel⟩,
      ⟨3750, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3748, by decide +kernel⟩,
  TableOp.marker
    ⟨233, by decide +kernel⟩
    ⟨3749, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3753, by decide +kernel⟩,
      ⟨3753, by decide +kernel⟩,
      ⟨3753, by decide +kernel⟩,
      ⟨3753, by decide +kernel⟩,
      ⟨3753, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3751, by decide +kernel⟩,
  TableOp.marker
    ⟨234, by decide +kernel⟩
    ⟨3752, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨236, by decide +kernel⟩,
      ⟨236, by decide +kernel⟩,
      ⟨236, by decide +kernel⟩,
      ⟨236, by decide +kernel⟩,
      ⟨236, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1808, by decide +kernel⟩,
  TableOp.marker
    ⟨3754, by decide +kernel⟩
    ⟨3755, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3760, by decide +kernel⟩,
      ⟨3760, by decide +kernel⟩,
      ⟨3760, by decide +kernel⟩,
      ⟨3760, by decide +kernel⟩,
      ⟨3760, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩,
      ⟨235, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3757, by decide +kernel⟩,
  TableOp.marker
    ⟨3758, by decide +kernel⟩
    ⟨3759, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    ⟨3754, by decide +kernel⟩
    ⟨3758, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1800, by decide +kernel⟩,
  TableOp.marker
    ⟨3761, by decide +kernel⟩
    ⟨3762, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3766, by decide +kernel⟩,
      ⟨3766, by decide +kernel⟩,
      ⟨3766, by decide +kernel⟩,
      ⟨3766, by decide +kernel⟩,
      ⟨3766, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3764, by decide +kernel⟩,
  TableOp.marker
    ⟨235, by decide +kernel⟩
    ⟨3765, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨237, by decide +kernel⟩,
      ⟨237, by decide +kernel⟩,
      ⟨237, by decide +kernel⟩,
      ⟨237, by decide +kernel⟩,
      ⟨237, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1822, by decide +kernel⟩,
  TableOp.marker
    ⟨3767, by decide +kernel⟩
    ⟨3768, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3772, by decide +kernel⟩,
      ⟨3772, by decide +kernel⟩,
      ⟨3772, by decide +kernel⟩,
      ⟨3772, by decide +kernel⟩,
      ⟨3772, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3770, by decide +kernel⟩,
  TableOp.marker
    ⟨1811, by decide +kernel⟩
    ⟨3771, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3767, by decide +kernel⟩
    ⟨1811, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1814, by decide +kernel⟩,
  TableOp.marker
    ⟨3773, by decide +kernel⟩
    ⟨3774, by decide +kernel⟩
]
theorem fact_117_1 : source_117_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_117_1 := by
  decide +kernel
noncomputable def source_118_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3776
noncomputable def tables_118_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3778, by decide +kernel⟩,
      ⟨3778, by decide +kernel⟩,
      ⟨3778, by decide +kernel⟩,
      ⟨3778, by decide +kernel⟩,
      ⟨3778, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3776, by decide +kernel⟩,
  TableOp.marker
    ⟨236, by decide +kernel⟩
    ⟨3777, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3782, by decide +kernel⟩,
      ⟨3782, by decide +kernel⟩,
      ⟨3782, by decide +kernel⟩,
      ⟨3782, by decide +kernel⟩,
      ⟨3782, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨240, by decide +kernel⟩,
      ⟨240, by decide +kernel⟩,
      ⟨240, by decide +kernel⟩,
      ⟨240, by decide +kernel⟩,
      ⟨240, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3779, by decide +kernel⟩,
  TableOp.marker
    ⟨3780, by decide +kernel⟩
    ⟨3781, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3785, by decide +kernel⟩,
      ⟨3785, by decide +kernel⟩,
      ⟨3785, by decide +kernel⟩,
      ⟨3785, by decide +kernel⟩,
      ⟨3785, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3783, by decide +kernel⟩,
  TableOp.marker
    ⟨1825, by decide +kernel⟩
    ⟨3784, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3780, by decide +kernel⟩
    ⟨1825, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1828, by decide +kernel⟩,
  TableOp.marker
    ⟨3786, by decide +kernel⟩
    ⟨3787, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3791, by decide +kernel⟩,
      ⟨3791, by decide +kernel⟩,
      ⟨3791, by decide +kernel⟩,
      ⟨3791, by decide +kernel⟩,
      ⟨3791, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3789, by decide +kernel⟩,
  TableOp.marker
    ⟨237, by decide +kernel⟩
    ⟨3790, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1836, by decide +kernel⟩,
  TableOp.marker
    ⟨239, by decide +kernel⟩
    ⟨3792, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3796, by decide +kernel⟩,
      ⟨3796, by decide +kernel⟩,
      ⟨3796, by decide +kernel⟩,
      ⟨3796, by decide +kernel⟩,
      ⟨3796, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3794, by decide +kernel⟩,
  TableOp.marker
    ⟨238, by decide +kernel⟩
    ⟨3795, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3799, by decide +kernel⟩,
      ⟨3799, by decide +kernel⟩,
      ⟨3799, by decide +kernel⟩,
      ⟨3799, by decide +kernel⟩,
      ⟨3799, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3797, by decide +kernel⟩,
  TableOp.marker
    ⟨240, by decide +kernel⟩
    ⟨3798, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨242, by decide +kernel⟩,
      ⟨242, by decide +kernel⟩,
      ⟨242, by decide +kernel⟩,
      ⟨242, by decide +kernel⟩,
      ⟨242, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1853, by decide +kernel⟩,
  TableOp.marker
    ⟨3800, by decide +kernel⟩
    ⟨3801, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3805, by decide +kernel⟩,
      ⟨3805, by decide +kernel⟩,
      ⟨3805, by decide +kernel⟩,
      ⟨3805, by decide +kernel⟩,
      ⟨3805, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3803, by decide +kernel⟩,
  TableOp.marker
    ⟨1842, by decide +kernel⟩
    ⟨3804, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3800, by decide +kernel⟩
    ⟨1842, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1845, by decide +kernel⟩
]
theorem fact_118_1 : source_118_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_118_1 := by
  decide +kernel
noncomputable def source_117_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_117_1 source_118_1
noncomputable def tables_117_2 : List (TableOp 4042) := tables_117_1 ++ tables_118_1
theorem fact_117_2 : source_117_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_117_2 :=
  source_tables_branch 32 source_117_1 source_118_1
    tables_117_1 tables_118_1 fact_117_1 fact_118_1
noncomputable def source_115_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_115_2 source_117_2
noncomputable def tables_115_4 : List (TableOp 4042) := tables_115_2 ++ tables_117_2
theorem fact_115_4 : source_115_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_115_4 :=
  source_tables_branch 64 source_115_2 source_117_2
    tables_115_2 tables_117_2 fact_115_2 fact_117_2
noncomputable def source_111_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_111_4 source_115_4
noncomputable def tables_111_8 : List (TableOp 4042) := tables_111_4 ++ tables_115_4
theorem fact_111_8 : source_111_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_111_8 :=
  source_tables_branch 128 source_111_4 source_115_4
    tables_111_4 tables_115_4 fact_111_4 fact_115_4
noncomputable def source_119_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3808
noncomputable def tables_119_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨3806, by decide +kernel⟩
    ⟨3807, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3811, by decide +kernel⟩,
      ⟨3811, by decide +kernel⟩,
      ⟨3811, by decide +kernel⟩,
      ⟨3811, by decide +kernel⟩,
      ⟨3811, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3809, by decide +kernel⟩,
  TableOp.marker
    ⟨241, by decide +kernel⟩
    ⟨3810, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3815, by decide +kernel⟩,
      ⟨3815, by decide +kernel⟩,
      ⟨3815, by decide +kernel⟩,
      ⟨3815, by decide +kernel⟩,
      ⟨3815, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨245, by decide +kernel⟩,
      ⟨245, by decide +kernel⟩,
      ⟨245, by decide +kernel⟩,
      ⟨245, by decide +kernel⟩,
      ⟨245, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3812, by decide +kernel⟩,
  TableOp.marker
    ⟨3813, by decide +kernel⟩
    ⟨3814, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3818, by decide +kernel⟩,
      ⟨3818, by decide +kernel⟩,
      ⟨3818, by decide +kernel⟩,
      ⟨3818, by decide +kernel⟩,
      ⟨3818, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3816, by decide +kernel⟩,
  TableOp.marker
    ⟨1856, by decide +kernel⟩
    ⟨3817, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    ⟨3813, by decide +kernel⟩
    ⟨1856, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1859, by decide +kernel⟩,
  TableOp.marker
    ⟨3819, by decide +kernel⟩
    ⟨3820, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3824, by decide +kernel⟩,
      ⟨3824, by decide +kernel⟩,
      ⟨3824, by decide +kernel⟩,
      ⟨3824, by decide +kernel⟩,
      ⟨3824, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3822, by decide +kernel⟩,
  TableOp.marker
    ⟨242, by decide +kernel⟩
    ⟨3823, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1867, by decide +kernel⟩,
  TableOp.marker
    ⟨244, by decide +kernel⟩
    ⟨3825, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3829, by decide +kernel⟩,
      ⟨3829, by decide +kernel⟩,
      ⟨3829, by decide +kernel⟩,
      ⟨3829, by decide +kernel⟩,
      ⟨3829, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3827, by decide +kernel⟩,
  TableOp.marker
    ⟨243, by decide +kernel⟩
    ⟨3828, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3832, by decide +kernel⟩,
      ⟨3832, by decide +kernel⟩,
      ⟨3832, by decide +kernel⟩,
      ⟨3832, by decide +kernel⟩,
      ⟨3832, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3830, by decide +kernel⟩,
  TableOp.marker
    ⟨245, by decide +kernel⟩
    ⟨3831, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3836, by decide +kernel⟩,
      ⟨3836, by decide +kernel⟩,
      ⟨3836, by decide +kernel⟩,
      ⟨3836, by decide +kernel⟩,
      ⟨3836, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨247, by decide +kernel⟩,
      ⟨247, by decide +kernel⟩,
      ⟨247, by decide +kernel⟩,
      ⟨247, by decide +kernel⟩,
      ⟨247, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3833, by decide +kernel⟩,
  TableOp.marker
    ⟨3834, by decide +kernel⟩
    ⟨3835, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3839, by decide +kernel⟩,
      ⟨3839, by decide +kernel⟩,
      ⟨3839, by decide +kernel⟩,
      ⟨3839, by decide +kernel⟩,
      ⟨3839, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3837, by decide +kernel⟩,
  TableOp.marker
    ⟨1873, by decide +kernel⟩
    ⟨3838, by decide +kernel⟩
]
theorem fact_119_1 : source_119_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_119_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t120\t{now}"
      handle.flush
noncomputable def source_120_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3840
noncomputable def tables_120_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3834, by decide +kernel⟩
    ⟨1873, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1876, by decide +kernel⟩,
  TableOp.marker
    ⟨3840, by decide +kernel⟩
    ⟨3841, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3845, by decide +kernel⟩,
      ⟨3845, by decide +kernel⟩,
      ⟨3845, by decide +kernel⟩,
      ⟨3845, by decide +kernel⟩,
      ⟨3845, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3843, by decide +kernel⟩,
  TableOp.marker
    ⟨246, by decide +kernel⟩
    ⟨3844, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨248, by decide +kernel⟩,
      ⟨248, by decide +kernel⟩,
      ⟨248, by decide +kernel⟩,
      ⟨248, by decide +kernel⟩,
      ⟨248, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1892, by decide +kernel⟩,
  TableOp.marker
    ⟨3846, by decide +kernel⟩
    ⟨3847, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    ⟨3846, by decide +kernel⟩
    ⟨3834, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1884, by decide +kernel⟩,
  TableOp.marker
    ⟨3849, by decide +kernel⟩
    ⟨3850, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3854, by decide +kernel⟩,
      ⟨3854, by decide +kernel⟩,
      ⟨3854, by decide +kernel⟩,
      ⟨3854, by decide +kernel⟩,
      ⟨3854, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3852, by decide +kernel⟩,
  TableOp.marker
    ⟨247, by decide +kernel⟩
    ⟨3853, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3858, by decide +kernel⟩,
      ⟨3858, by decide +kernel⟩,
      ⟨3858, by decide +kernel⟩,
      ⟨3858, by decide +kernel⟩,
      ⟨3858, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨251, by decide +kernel⟩,
      ⟨251, by decide +kernel⟩,
      ⟨251, by decide +kernel⟩,
      ⟨251, by decide +kernel⟩,
      ⟨251, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3855, by decide +kernel⟩,
  TableOp.marker
    ⟨3856, by decide +kernel⟩
    ⟨3857, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3861, by decide +kernel⟩,
      ⟨3861, by decide +kernel⟩,
      ⟨3861, by decide +kernel⟩,
      ⟨3861, by decide +kernel⟩,
      ⟨3861, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3859, by decide +kernel⟩,
  TableOp.marker
    ⟨1895, by decide +kernel⟩
    ⟨3860, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3856, by decide +kernel⟩
    ⟨1895, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1898, by decide +kernel⟩,
  TableOp.marker
    ⟨3862, by decide +kernel⟩
    ⟨3863, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3867, by decide +kernel⟩,
      ⟨3867, by decide +kernel⟩,
      ⟨3867, by decide +kernel⟩,
      ⟨3867, by decide +kernel⟩,
      ⟨3867, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3865, by decide +kernel⟩,
  TableOp.marker
    ⟨248, by decide +kernel⟩
    ⟨3866, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1906, by decide +kernel⟩,
  TableOp.marker
    ⟨250, by decide +kernel⟩
    ⟨3868, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3872, by decide +kernel⟩,
      ⟨3872, by decide +kernel⟩,
      ⟨3872, by decide +kernel⟩,
      ⟨3872, by decide +kernel⟩,
      ⟨3872, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3870, by decide +kernel⟩
]
theorem fact_120_1 : source_120_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_120_1 := by
  decide +kernel
noncomputable def source_119_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_119_1 source_120_1
noncomputable def tables_119_2 : List (TableOp 4042) := tables_119_1 ++ tables_120_1
theorem fact_119_2 : source_119_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_119_2 :=
  source_tables_branch 32 source_119_1 source_120_1
    tables_119_1 tables_120_1 fact_119_1 fact_120_1
noncomputable def source_121_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3872
noncomputable def tables_121_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨249, by decide +kernel⟩
    ⟨3871, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3875, by decide +kernel⟩,
      ⟨3875, by decide +kernel⟩,
      ⟨3875, by decide +kernel⟩,
      ⟨3875, by decide +kernel⟩,
      ⟨3875, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3873, by decide +kernel⟩,
  TableOp.marker
    ⟨251, by decide +kernel⟩
    ⟨3874, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨253, by decide +kernel⟩,
      ⟨253, by decide +kernel⟩,
      ⟨253, by decide +kernel⟩,
      ⟨253, by decide +kernel⟩,
      ⟨253, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1923, by decide +kernel⟩,
  TableOp.marker
    ⟨3876, by decide +kernel⟩
    ⟨3877, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3881, by decide +kernel⟩,
      ⟨3881, by decide +kernel⟩,
      ⟨3881, by decide +kernel⟩,
      ⟨3881, by decide +kernel⟩,
      ⟨3881, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3879, by decide +kernel⟩,
  TableOp.marker
    ⟨1912, by decide +kernel⟩
    ⟨3880, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3876, by decide +kernel⟩
    ⟨1912, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1915, by decide +kernel⟩,
  TableOp.marker
    ⟨3882, by decide +kernel⟩
    ⟨3883, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3887, by decide +kernel⟩,
      ⟨3887, by decide +kernel⟩,
      ⟨3887, by decide +kernel⟩,
      ⟨3887, by decide +kernel⟩,
      ⟨3887, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3885, by decide +kernel⟩,
  TableOp.marker
    ⟨252, by decide +kernel⟩
    ⟨3886, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3891, by decide +kernel⟩,
      ⟨3891, by decide +kernel⟩,
      ⟨3891, by decide +kernel⟩,
      ⟨3891, by decide +kernel⟩,
      ⟨3891, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨256, by decide +kernel⟩,
      ⟨256, by decide +kernel⟩,
      ⟨256, by decide +kernel⟩,
      ⟨256, by decide +kernel⟩,
      ⟨256, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3888, by decide +kernel⟩,
  TableOp.marker
    ⟨3889, by decide +kernel⟩
    ⟨3890, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3894, by decide +kernel⟩,
      ⟨3894, by decide +kernel⟩,
      ⟨3894, by decide +kernel⟩,
      ⟨3894, by decide +kernel⟩,
      ⟨3894, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3892, by decide +kernel⟩,
  TableOp.marker
    ⟨1926, by decide +kernel⟩
    ⟨3893, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3889, by decide +kernel⟩
    ⟨1926, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1929, by decide +kernel⟩,
  TableOp.marker
    ⟨3895, by decide +kernel⟩
    ⟨3896, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3900, by decide +kernel⟩,
      ⟨3900, by decide +kernel⟩,
      ⟨3900, by decide +kernel⟩,
      ⟨3900, by decide +kernel⟩,
      ⟨3900, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3898, by decide +kernel⟩,
  TableOp.marker
    ⟨253, by decide +kernel⟩
    ⟨3899, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1937, by decide +kernel⟩,
  TableOp.marker
    ⟨255, by decide +kernel⟩
    ⟨3901, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3905, by decide +kernel⟩,
      ⟨3905, by decide +kernel⟩,
      ⟨3905, by decide +kernel⟩,
      ⟨3905, by decide +kernel⟩,
      ⟨3905, by decide +kernel⟩
    ], rfl⟩
]
theorem fact_121_1 : source_121_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_121_1 := by
  decide +kernel
noncomputable def source_122_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3904
noncomputable def tables_122_1 : List (TableOp 4042) := [
  TableOp.move
    Dir.left
    ⟨3903, by decide +kernel⟩,
  TableOp.marker
    ⟨254, by decide +kernel⟩
    ⟨3904, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3908, by decide +kernel⟩,
      ⟨3908, by decide +kernel⟩,
      ⟨3908, by decide +kernel⟩,
      ⟨3908, by decide +kernel⟩,
      ⟨3908, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3906, by decide +kernel⟩,
  TableOp.marker
    ⟨256, by decide +kernel⟩
    ⟨3907, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3912, by decide +kernel⟩,
      ⟨3912, by decide +kernel⟩,
      ⟨3912, by decide +kernel⟩,
      ⟨3912, by decide +kernel⟩,
      ⟨3912, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨260, by decide +kernel⟩,
      ⟨260, by decide +kernel⟩,
      ⟨260, by decide +kernel⟩,
      ⟨260, by decide +kernel⟩,
      ⟨260, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3909, by decide +kernel⟩,
  TableOp.marker
    ⟨3910, by decide +kernel⟩
    ⟨3911, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3915, by decide +kernel⟩,
      ⟨3915, by decide +kernel⟩,
      ⟨3915, by decide +kernel⟩,
      ⟨3915, by decide +kernel⟩,
      ⟨3915, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3913, by decide +kernel⟩,
  TableOp.marker
    ⟨1943, by decide +kernel⟩
    ⟨3914, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3910, by decide +kernel⟩
    ⟨1943, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1946, by decide +kernel⟩,
  TableOp.marker
    ⟨3916, by decide +kernel⟩
    ⟨3917, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3921, by decide +kernel⟩,
      ⟨3921, by decide +kernel⟩,
      ⟨3921, by decide +kernel⟩,
      ⟨3921, by decide +kernel⟩,
      ⟨3921, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3919, by decide +kernel⟩,
  TableOp.marker
    ⟨257, by decide +kernel⟩
    ⟨3920, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1954, by decide +kernel⟩,
  TableOp.marker
    ⟨259, by decide +kernel⟩
    ⟨3922, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3926, by decide +kernel⟩,
      ⟨3926, by decide +kernel⟩,
      ⟨3926, by decide +kernel⟩,
      ⟨3926, by decide +kernel⟩,
      ⟨3926, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3924, by decide +kernel⟩,
  TableOp.marker
    ⟨258, by decide +kernel⟩
    ⟨3925, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3929, by decide +kernel⟩,
      ⟨3929, by decide +kernel⟩,
      ⟨3929, by decide +kernel⟩,
      ⟨3929, by decide +kernel⟩,
      ⟨3929, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3927, by decide +kernel⟩,
  TableOp.marker
    ⟨260, by decide +kernel⟩
    ⟨3928, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3932, by decide +kernel⟩,
      ⟨3932, by decide +kernel⟩,
      ⟨3932, by decide +kernel⟩,
      ⟨3932, by decide +kernel⟩,
      ⟨3932, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3930, by decide +kernel⟩,
  TableOp.marker
    ⟨261, by decide +kernel⟩
    ⟨3931, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3935, by decide +kernel⟩,
      ⟨3935, by decide +kernel⟩,
      ⟨3935, by decide +kernel⟩,
      ⟨3935, by decide +kernel⟩,
      ⟨3935, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3933, by decide +kernel⟩,
  TableOp.marker
    ⟨262, by decide +kernel⟩
    ⟨3934, by decide +kernel⟩
]
theorem fact_122_1 : source_122_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_122_1 := by
  decide +kernel
noncomputable def source_121_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_121_1 source_122_1
noncomputable def tables_121_2 : List (TableOp 4042) := tables_121_1 ++ tables_122_1
theorem fact_121_2 : source_121_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_121_2 :=
  source_tables_branch 32 source_121_1 source_122_1
    tables_121_1 tables_122_1 fact_121_1 fact_122_1
noncomputable def source_119_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_119_2 source_121_2
noncomputable def tables_119_4 : List (TableOp 4042) := tables_119_2 ++ tables_121_2
theorem fact_119_4 : source_119_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_119_4 :=
  source_tables_branch 64 source_119_2 source_121_2
    tables_119_2 tables_121_2 fact_119_2 fact_121_2
noncomputable def source_123_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3936
noncomputable def tables_123_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨3939, by decide +kernel⟩,
      ⟨3939, by decide +kernel⟩,
      ⟨3939, by decide +kernel⟩,
      ⟨3939, by decide +kernel⟩,
      ⟨3939, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨266, by decide +kernel⟩,
      ⟨266, by decide +kernel⟩,
      ⟨266, by decide +kernel⟩,
      ⟨266, by decide +kernel⟩,
      ⟨266, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3936, by decide +kernel⟩,
  TableOp.marker
    ⟨3937, by decide +kernel⟩
    ⟨3938, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3942, by decide +kernel⟩,
      ⟨3942, by decide +kernel⟩,
      ⟨3942, by decide +kernel⟩,
      ⟨3942, by decide +kernel⟩,
      ⟨3942, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3940, by decide +kernel⟩,
  TableOp.marker
    ⟨1965, by decide +kernel⟩
    ⟨3941, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3937, by decide +kernel⟩
    ⟨1965, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1968, by decide +kernel⟩,
  TableOp.marker
    ⟨3943, by decide +kernel⟩
    ⟨3944, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3948, by decide +kernel⟩,
      ⟨3948, by decide +kernel⟩,
      ⟨3948, by decide +kernel⟩,
      ⟨3948, by decide +kernel⟩,
      ⟨3948, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3946, by decide +kernel⟩,
  TableOp.marker
    ⟨263, by decide +kernel⟩
    ⟨3947, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3951, by decide +kernel⟩,
      ⟨3951, by decide +kernel⟩,
      ⟨3951, by decide +kernel⟩,
      ⟨3951, by decide +kernel⟩,
      ⟨3951, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3949, by decide +kernel⟩,
  TableOp.marker
    ⟨264, by decide +kernel⟩
    ⟨3950, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3954, by decide +kernel⟩,
      ⟨3954, by decide +kernel⟩,
      ⟨3954, by decide +kernel⟩,
      ⟨3954, by decide +kernel⟩,
      ⟨3954, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3952, by decide +kernel⟩,
  TableOp.marker
    ⟨266, by decide +kernel⟩
    ⟨3953, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3957, by decide +kernel⟩,
      ⟨3957, by decide +kernel⟩,
      ⟨3957, by decide +kernel⟩,
      ⟨3957, by decide +kernel⟩,
      ⟨3957, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3955, by decide +kernel⟩,
  TableOp.marker
    ⟨1982, by decide +kernel⟩
    ⟨3956, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3961, by decide +kernel⟩,
      ⟨3961, by decide +kernel⟩,
      ⟨3961, by decide +kernel⟩,
      ⟨3961, by decide +kernel⟩,
      ⟨3961, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨268, by decide +kernel⟩,
      ⟨268, by decide +kernel⟩,
      ⟨268, by decide +kernel⟩,
      ⟨268, by decide +kernel⟩,
      ⟨268, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3958, by decide +kernel⟩,
  TableOp.marker
    ⟨3959, by decide +kernel⟩
    ⟨3960, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨269, by decide +kernel⟩,
      ⟨269, by decide +kernel⟩,
      ⟨269, by decide +kernel⟩,
      ⟨269, by decide +kernel⟩,
      ⟨269, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨1985, by decide +kernel⟩,
  TableOp.marker
    ⟨3962, by decide +kernel⟩
    ⟨3963, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3967, by decide +kernel⟩,
      ⟨3967, by decide +kernel⟩,
      ⟨3967, by decide +kernel⟩,
      ⟨3967, by decide +kernel⟩,
      ⟨3967, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3965, by decide +kernel⟩,
  TableOp.marker
    ⟨1988, by decide +kernel⟩
    ⟨3966, by decide +kernel⟩
]
theorem fact_123_1 : source_123_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_123_1 := by
  decide +kernel
noncomputable def source_124_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3968
noncomputable def tables_124_1 : List (TableOp 4042) := [
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3962, by decide +kernel⟩
    ⟨1988, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1991, by decide +kernel⟩,
  TableOp.marker
    ⟨3968, by decide +kernel⟩
    ⟨3969, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3973, by decide +kernel⟩,
      ⟨3973, by decide +kernel⟩,
      ⟨3973, by decide +kernel⟩,
      ⟨3973, by decide +kernel⟩,
      ⟨3973, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3971, by decide +kernel⟩,
  TableOp.marker
    ⟨1995, by decide +kernel⟩
    ⟨3972, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3977, by decide +kernel⟩,
      ⟨3977, by decide +kernel⟩,
      ⟨3977, by decide +kernel⟩,
      ⟨3977, by decide +kernel⟩,
      ⟨3977, by decide +kernel⟩
    ], rfl⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨3959, by decide +kernel⟩
    ⟨1995, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨3974, by decide +kernel⟩,
  TableOp.marker
    ⟨3975, by decide +kernel⟩
    ⟨3976, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    ⟨1982, by decide +kernel⟩
    ⟨3975, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨1998, by decide +kernel⟩,
  TableOp.marker
    ⟨3978, by decide +kernel⟩
    ⟨3979, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3983, by decide +kernel⟩,
      ⟨3983, by decide +kernel⟩,
      ⟨3983, by decide +kernel⟩,
      ⟨3983, by decide +kernel⟩,
      ⟨3983, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3981, by decide +kernel⟩,
  TableOp.marker
    ⟨267, by decide +kernel⟩
    ⟨3982, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨114, by decide +kernel⟩
    ⟨3959, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2006, by decide +kernel⟩,
  TableOp.marker
    ⟨3984, by decide +kernel⟩
    ⟨3985, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3989, by decide +kernel⟩,
      ⟨3989, by decide +kernel⟩,
      ⟨3989, by decide +kernel⟩,
      ⟨3989, by decide +kernel⟩,
      ⟨3989, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3987, by decide +kernel⟩,
  TableOp.marker
    ⟨268, by decide +kernel⟩
    ⟨3988, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3993, by decide +kernel⟩,
      ⟨3993, by decide +kernel⟩,
      ⟨3993, by decide +kernel⟩,
      ⟨3993, by decide +kernel⟩,
      ⟨3993, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨270, by decide +kernel⟩,
      ⟨270, by decide +kernel⟩,
      ⟨270, by decide +kernel⟩,
      ⟨270, by decide +kernel⟩,
      ⟨270, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3990, by decide +kernel⟩,
  TableOp.marker
    ⟨3991, by decide +kernel⟩
    ⟨3992, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨3996, by decide +kernel⟩,
      ⟨3996, by decide +kernel⟩,
      ⟨3996, by decide +kernel⟩,
      ⟨3996, by decide +kernel⟩,
      ⟨3996, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨3994, by decide +kernel⟩,
  TableOp.marker
    ⟨2015, by decide +kernel⟩
    ⟨3995, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3991, by decide +kernel⟩
    ⟨2015, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2018, by decide +kernel⟩,
  TableOp.marker
    ⟨3997, by decide +kernel⟩
    ⟨3998, by decide +kernel⟩
]
theorem fact_124_1 : source_124_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_124_1 := by
  decide +kernel
noncomputable def source_123_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_123_1 source_124_1
noncomputable def tables_123_2 : List (TableOp 4042) := tables_123_1 ++ tables_124_1
theorem fact_123_2 : source_123_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_123_2 :=
  source_tables_branch 32 source_123_1 source_124_1
    tables_123_1 tables_124_1 fact_123_1 fact_124_1
noncomputable def source_125_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4000
noncomputable def tables_125_1 : List (TableOp 4042) := [
  TableOp.jump
    ⟨#[
      ⟨4002, by decide +kernel⟩,
      ⟨4002, by decide +kernel⟩,
      ⟨4002, by decide +kernel⟩,
      ⟨4002, by decide +kernel⟩,
      ⟨4002, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4000, by decide +kernel⟩,
  TableOp.marker
    ⟨269, by decide +kernel⟩
    ⟨4001, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨271, by decide +kernel⟩,
      ⟨271, by decide +kernel⟩,
      ⟨271, by decide +kernel⟩,
      ⟨271, by decide +kernel⟩,
      ⟨271, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨2034, by decide +kernel⟩,
  TableOp.marker
    ⟨4003, by decide +kernel⟩
    ⟨4004, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨4003, by decide +kernel⟩
    ⟨3991, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2026, by decide +kernel⟩,
  TableOp.marker
    ⟨4006, by decide +kernel⟩
    ⟨4007, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4011, by decide +kernel⟩,
      ⟨4011, by decide +kernel⟩,
      ⟨4011, by decide +kernel⟩,
      ⟨4011, by decide +kernel⟩,
      ⟨4011, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4009, by decide +kernel⟩,
  TableOp.marker
    ⟨270, by decide +kernel⟩
    ⟨4010, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4015, by decide +kernel⟩,
      ⟨4015, by decide +kernel⟩,
      ⟨4015, by decide +kernel⟩,
      ⟨4015, by decide +kernel⟩,
      ⟨4015, by decide +kernel⟩
    ], rfl⟩,
  TableOp.jump
    ⟨#[
      ⟨274, by decide +kernel⟩,
      ⟨274, by decide +kernel⟩,
      ⟨274, by decide +kernel⟩,
      ⟨274, by decide +kernel⟩,
      ⟨274, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4012, by decide +kernel⟩,
  TableOp.marker
    ⟨4013, by decide +kernel⟩
    ⟨4014, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4018, by decide +kernel⟩,
      ⟨4018, by decide +kernel⟩,
      ⟨4018, by decide +kernel⟩,
      ⟨4018, by decide +kernel⟩,
      ⟨4018, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4016, by decide +kernel⟩,
  TableOp.marker
    ⟨2037, by decide +kernel⟩
    ⟨4017, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    ⟨4013, by decide +kernel⟩
    ⟨2037, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2040, by decide +kernel⟩,
  TableOp.marker
    ⟨4019, by decide +kernel⟩
    ⟨4020, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4024, by decide +kernel⟩,
      ⟨4024, by decide +kernel⟩,
      ⟨4024, by decide +kernel⟩,
      ⟨4024, by decide +kernel⟩,
      ⟨4024, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4022, by decide +kernel⟩,
  TableOp.marker
    ⟨271, by decide +kernel⟩
    ⟨4023, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2048, by decide +kernel⟩,
  TableOp.marker
    ⟨273, by decide +kernel⟩
    ⟨4025, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4029, by decide +kernel⟩,
      ⟨4029, by decide +kernel⟩,
      ⟨4029, by decide +kernel⟩,
      ⟨4029, by decide +kernel⟩,
      ⟨4029, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4027, by decide +kernel⟩,
  TableOp.marker
    ⟨272, by decide +kernel⟩
    ⟨4028, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4032, by decide +kernel⟩,
      ⟨4032, by decide +kernel⟩,
      ⟨4032, by decide +kernel⟩,
      ⟨4032, by decide +kernel⟩,
      ⟨4032, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4030, by decide +kernel⟩
]
theorem fact_125_1 : source_125_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_125_1 := by
  decide +kernel
noncomputable def source_126_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4032
noncomputable def tables_126_1 : List (TableOp 4042) := [
  TableOp.marker
    ⟨274, by decide +kernel⟩
    ⟨4031, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4035, by decide +kernel⟩,
      ⟨4035, by decide +kernel⟩,
      ⟨4035, by decide +kernel⟩,
      ⟨4035, by decide +kernel⟩,
      ⟨4035, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4033, by decide +kernel⟩,
  TableOp.marker
    ⟨2054, by decide +kernel⟩
    ⟨4034, by decide +kernel⟩,
  TableOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    ⟨3421, by decide +kernel⟩
    ⟨2054, by decide +kernel⟩,
  TableOp.move
    Dir.left
    ⟨2057, by decide +kernel⟩,
  TableOp.marker
    ⟨4036, by decide +kernel⟩
    ⟨4037, by decide +kernel⟩,
  TableOp.jump
    ⟨#[
      ⟨4041, by decide +kernel⟩,
      ⟨4041, by decide +kernel⟩,
      ⟨4041, by decide +kernel⟩,
      ⟨4041, by decide +kernel⟩,
      ⟨4041, by decide +kernel⟩
    ], rfl⟩,
  TableOp.move
    Dir.left
    ⟨4039, by decide +kernel⟩,
  TableOp.marker
    ⟨275, by decide +kernel⟩
    ⟨4040, by decide +kernel⟩
]
theorem fact_126_1 : source_126_1.flatten.map
    (fun row ↦ toTableOp row.1) = tables_126_1 := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/complete-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-source-chunks\t127\t{now}"
      handle.flush
noncomputable def source_125_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_125_1 source_126_1
noncomputable def tables_125_2 : List (TableOp 4042) := tables_125_1 ++ tables_126_1
theorem fact_125_2 : source_125_2.flatten.map
    (fun row ↦ toTableOp row.1) = tables_125_2 :=
  source_tables_branch 32 source_125_1 source_126_1
    tables_125_1 tables_126_1 fact_125_1 fact_126_1
noncomputable def source_123_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_123_2 source_125_2
noncomputable def tables_123_4 : List (TableOp 4042) := tables_123_2 ++ tables_125_2
theorem fact_123_4 : source_123_4.flatten.map
    (fun row ↦ toTableOp row.1) = tables_123_4 :=
  source_tables_branch 64 source_123_2 source_125_2
    tables_123_2 tables_125_2 fact_123_2 fact_125_2
noncomputable def source_119_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_119_4 source_123_4
noncomputable def tables_119_8 : List (TableOp 4042) := tables_119_4 ++ tables_123_4
theorem fact_119_8 : source_119_8.flatten.map
    (fun row ↦ toTableOp row.1) = tables_119_8 :=
  source_tables_branch 128 source_119_4 source_123_4
    tables_119_4 tables_123_4 fact_119_4 fact_123_4
noncomputable def source_111_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_111_8 source_119_8
noncomputable def tables_111_16 : List (TableOp 4042) := tables_111_8 ++ tables_119_8
theorem fact_111_16 : source_111_16.flatten.map
    (fun row ↦ toTableOp row.1) = tables_111_16 :=
  source_tables_branch 256 source_111_8 source_119_8
    tables_111_8 tables_119_8 fact_111_8 fact_119_8
noncomputable def source_95_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_95_16 source_111_16
noncomputable def tables_95_32 : List (TableOp 4042) := tables_95_16 ++ tables_111_16
theorem fact_95_32 : source_95_32.flatten.map
    (fun row ↦ toTableOp row.1) = tables_95_32 :=
  source_tables_branch 512 source_95_16 source_111_16
    tables_95_16 tables_111_16 fact_95_16 fact_111_16
noncomputable def source_63_64 : Balanced.RowTree Snapshot.Entry :=
  .branch 1024 source_63_32 source_95_32
noncomputable def tables_63_64 : List (TableOp 4042) := tables_63_32 ++ tables_95_32
theorem fact_63_64 : source_63_64.flatten.map
    (fun row ↦ toTableOp row.1) = tables_63_64 :=
  source_tables_branch 1024 source_63_32 source_95_32
    tables_63_32 tables_95_32 fact_63_32 fact_95_32
noncomputable def source_0_127 : Balanced.RowTree Snapshot.Entry :=
  .branch 2016 source_0_63 source_63_64
noncomputable def tables_0_127 : List (TableOp 4042) := tables_0_63 ++ tables_63_64
theorem fact_0_127 : source_0_127.flatten.map
    (fun row ↦ toTableOp row.1) = tables_0_127 :=
  source_tables_branch 2016 source_0_63 source_63_64
    tables_0_63 tables_63_64 fact_0_63 fact_63_64
noncomputable def tableOps : List (TableOp 4042) := tables_0_127
theorem source_tree_eq : source_0_127 = Snapshot.entries := by rfl
theorem complete_source_tables : Snapshot.entries.flatten.map
    (fun row ↦ toTableOp row.1) = tableOps := by
  change Snapshot.entries.flatten.map _ = tables_0_127
  exact (congrArg
    (fun tree : Balanced.RowTree Snapshot.Entry ↦
      tree.flatten.map (fun row ↦ toTableOp row.1))
    source_tree_eq.symm).trans fact_0_127

theorem complete_source_restored :
    tableOps.map fromTableOp = Snapshot.entries.flatten.map Prod.fst := by
  rewrite [← complete_source_tables]
  have same := restore_source_tables (Snapshot.entries.flatten.map Prod.fst)
  simpa only [List.map_map, Function.comp_def] using same

theorem complete_source_lowered :
    tableOps.map (fun op ↦ lower (fromTableOp op)) =
      Snapshot.entries.flatten.map (fun row ↦ lower row.1) := by
  have same := congrArg (List.map lower) complete_source_restored
  simpa only [List.map_map, Function.comp_def] using same

theorem complete_source_length : tableOps.length = 4042 := by
  have same := congrArg List.length complete_source_tables
  simpa only [List.length_map, ← Balanced.RowTree.count_eq_length,
    Snapshot.entries_count] using same.symm

theorem complete_source_at (q : Fin 4042) :
    (tableOps.map fromTableOp).getD q.val .halt = Snapshot.program q := by
  rewrite [complete_source_restored]
  change (Snapshot.entries.flatten.map Prod.fst).getD q.val
    ((.halt, .halt) : Snapshot.Entry).1 = _
  rewrite [List.getD_map]
  exact (congrArg Prod.fst (Balanced.RowTree.lookup_eq_getD Snapshot.entries
    Snapshot.entries_wellFormed q.val (.halt, .halt))).symm

theorem complete_source_meaning (q : Fin 4042) :
    source ((tableOps.map fromTableOp).getD q.val .halt) = SharedModel.machine q := by
  rewrite [complete_source_at]
  exact Snapshot.source_program q

end CompleteSourcePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "All frozen source-operation tables reconstructed exactly"
