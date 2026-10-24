module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.RawChunk
public meta import Lean

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler RawLabelPilot RawChunkPilot
namespace CompleteRawSourcePilot

def rawSource (op : Op 4042) : RawOp := erase (toTableOp op)

theorem source_branch (cache : Nat)
    (left right : Balanced.RowTree Snapshot.Entry) (a b : List RawOp)
    (hl : left.flatten.map (fun row ↦ rawSource row.1) = a)
    (hr : right.flatten.map (fun row ↦ rawSource row.1) = b) :
    (Balanced.RowTree.branch cache left right).flatten.map
      (fun row ↦ rawSource row.1) = a ++ b := by
  simpa only [Balanced.RowTree.flatten, List.map_append] using
    congrArg₂ (fun xs ys : List RawOp ↦ xs ++ ys) hl hr

theorem bounds_append (a b : List RawOp)
    (ha : a.all (labelsBounded 4042) = true)
    (hb : b.all (labelsBounded 4042) = true) :
    (a ++ b).all (labelsBounded 4042) = true := by
  rewrite [List.all_append]
  exact congrArg₂ (· && ·) ha hb

theorem restore_entries (entries : List Snapshot.Entry) :
    (entries.map (fun row ↦ rawSource row.1)).map (restore 4042) =
      entries.map (fun row ↦ some row.1) := by
  have restored := restore_source_list (entries.map Prod.fst)
  simpa only [List.map_map, Function.comp_def, rawSource] using restored

theorem raw_lookup (entries : List Snapshot.Entry) (raws : List RawOp)
    (same : entries.map (fun row ↦ rawSource row.1) = raws) (index : Nat) :
    raws.getD index .halt = rawSource (entries.getD index (.halt, .halt)).1 := by
  calc
    raws.getD index .halt =
        (entries.map (fun row ↦ rawSource row.1)).getD index
          ((fun row : Snapshot.Entry ↦ rawSource row.1) (.halt, .halt)) :=
      congrArg (fun ops : List RawOp ↦ ops.getD index .halt) same.symm
    _ = rawSource (entries.getD index (.halt, .halt)).1 :=
      List.getD_map entries (.halt, .halt) (fun row : Snapshot.Entry ↦ rawSource row.1)
noncomputable def source_0_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0000
noncomputable def raws_0_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1,
      1,
      1,
      1,
      1
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      289,
      289,
      289,
      289,
      289
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      294,
      294,
      294,
      294,
      294
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      5,
      5,
      5,
      5,
      5
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    2
    3,
  RawOp.jump
    ⟨#[
      306,
      306,
      306,
      306,
      306
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      320,
      320,
      320,
      320,
      320
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      325,
      325,
      325,
      325,
      325
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      10,
      10,
      10,
      10,
      10
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    7
    8,
  RawOp.jump
    ⟨#[
      337,
      337,
      337,
      337,
      337
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      345,
      345,
      345,
      345,
      345
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      359,
      359,
      359,
      359,
      359
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      364,
      364,
      364,
      364,
      364
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      16,
      16,
      16,
      16,
      16
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    13
    14,
  RawOp.jump
    ⟨#[
      376,
      376,
      376,
      376,
      376
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      381,
      381,
      381,
      381,
      381
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      20,
      20,
      20,
      20,
      20
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    17
    18,
  RawOp.jump
    ⟨#[
      23,
      23,
      23,
      23,
      23
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      386,
      386,
      386,
      386,
      386
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      24,
      24,
      24,
      24,
      24
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    21
    22,
  RawOp.jump
    ⟨#[
      25,
      25,
      25,
      25,
      25
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      413,
      413,
      413,
      413,
      413
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      43,
      43,
      43,
      43,
      43
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      425,
      425,
      425,
      425,
      425
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      439,
      439,
      439,
      439,
      439
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      444,
      444,
      444,
      444,
      444
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      32,
      32,
      32,
      32,
      32
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    29
    30
]
theorem fact_0_1 : source_0_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_1 := by decide +kernel
theorem bounds_0_1 : raws_0_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_1_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0032
noncomputable def raws_1_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      456,
      456,
      456,
      456,
      456
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      470,
      470,
      470,
      470,
      470
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      475,
      475,
      475,
      475,
      475
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      37,
      37,
      37,
      37,
      37
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    34
    35,
  RawOp.jump
    ⟨#[
      487,
      487,
      487,
      487,
      487
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      501,
      501,
      501,
      501,
      501
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      506,
      506,
      506,
      506,
      506
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      42,
      42,
      42,
      42,
      42
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    39
    40,
  RawOp.jump
    ⟨#[
      518,
      518,
      518,
      518,
      518
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      532,
      532,
      532,
      532,
      532
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      537,
      537,
      537,
      537,
      537
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      49,
      49,
      49,
      49,
      49
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    44
    45,
  RawOp.jump
    ⟨#[
      542,
      542,
      542,
      542,
      542
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      50,
      50,
      50,
      50,
      50
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    47
    48,
  RawOp.jump
    ⟨#[
      560,
      560,
      560,
      560,
      560
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      574,
      574,
      574,
      574,
      574
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      579,
      579,
      579,
      579,
      579
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      57,
      57,
      57,
      57,
      57
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    52
    53,
  RawOp.jump
    ⟨#[
      584,
      584,
      584,
      584,
      584
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      58,
      58,
      58,
      58,
      58
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    55
    56,
  RawOp.jump
    ⟨#[
      602,
      602,
      602,
      602,
      602
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      616,
      616,
      616,
      616,
      616
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      621,
      621,
      621,
      621,
      621
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      65,
      65,
      65,
      65,
      65
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    60
    61,
  RawOp.jump
    ⟨#[
      626,
      626,
      626,
      626,
      626
    ], rfl⟩
]
theorem fact_1_1 : source_1_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_1_1 := by decide +kernel
theorem bounds_1_1 : raws_1_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_2_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0064
noncomputable def raws_2_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      66,
      66,
      66,
      66,
      66
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    63
    64,
  RawOp.jump
    ⟨#[
      644,
      644,
      644,
      644,
      644
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      68,
      68,
      68,
      68,
      68
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      658,
      658,
      658,
      658,
      658
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      72,
      78,
      72,
      72,
      72
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      663,
      663,
      663,
      663,
      663
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      73,
      73,
      73,
      73,
      73
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    70
    71,
  RawOp.jump
    ⟨#[
      675,
      675,
      675,
      675,
      675
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      680,
      680,
      680,
      680,
      680
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      77,
      77,
      77,
      77,
      77
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    74
    75,
  RawOp.jump
    ⟨#[
      692,
      692,
      692,
      692,
      692
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      706,
      706,
      706,
      706,
      706
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      711,
      711,
      711,
      711,
      711
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      82,
      82,
      82,
      82,
      82
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    79
    80,
  RawOp.jump
    ⟨#[
      723,
      723,
      723,
      723,
      723
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      737,
      737,
      737,
      737,
      737
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      742,
      742,
      742,
      742,
      742
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      87,
      87,
      87,
      87,
      87
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    84
    85,
  RawOp.jump
    ⟨#[
      754,
      754,
      754,
      754,
      754
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      89,
      89,
      89,
      89,
      89
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      781,
      781,
      781,
      781,
      781
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      111,
      111,
      111,
      111,
      111
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      793,
      793,
      793,
      793,
      793
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      820,
      820,
      820,
      820,
      820
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      117,
      117,
      117,
      117,
      117
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      832,
      832,
      832,
      832,
      832
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      859,
      859,
      859,
      859,
      859
    ], rfl⟩
]
theorem fact_2_1 : source_2_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_2_1 := by decide +kernel
theorem bounds_2_1 : raws_2_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_1_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_1_1 source_2_1
noncomputable def raws_1_2 : List RawOp := raws_1_1 ++ raws_2_1
theorem fact_1_2 : source_1_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_1_2 :=
  source_branch 32 source_1_1 source_2_1 raws_1_1 raws_2_1 fact_1_1 fact_2_1
theorem bounds_1_2 : raws_1_2.all (labelsBounded 4042) = true :=
  bounds_append raws_1_1 raws_2_1 bounds_1_1 bounds_2_1
noncomputable def source_0_3 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_0_1 source_1_2
noncomputable def raws_0_3 : List RawOp := raws_0_1 ++ raws_1_2
theorem fact_0_3 : source_0_3.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_3 :=
  source_branch 32 source_0_1 source_1_2 raws_0_1 raws_1_2 fact_0_1 fact_1_2
theorem bounds_0_3 : raws_0_3.all (labelsBounded 4042) = true :=
  bounds_append raws_0_1 raws_1_2 bounds_0_1 bounds_1_2
noncomputable def source_3_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0096
noncomputable def raws_3_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      128,
      128,
      128,
      128,
      128
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      871,
      871,
      871,
      871,
      871
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      898,
      898,
      898,
      898,
      898
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      131,
      131,
      131,
      131,
      131
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      910,
      910,
      910,
      910,
      910
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      937,
      937,
      937,
      937,
      937
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      152,
      152,
      152,
      152,
      152
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      949,
      949,
      949,
      949,
      949
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      976,
      976,
      976,
      976,
      976
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      175,
      175,
      175,
      175,
      175
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      988,
      988,
      988,
      988,
      988
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1015,
      1015,
      1015,
      1015,
      1015
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      185,
      185,
      185,
      185,
      185
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1027,
      1027,
      1027,
      1027,
      1027
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      110,
      110,
      110,
      110,
      110
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1035,
      1035,
      1035,
      1035,
      1035
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1043,
      1043,
      1043,
      1043,
      1043
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1048,
      1048,
      1048,
      1048,
      1048
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      116,
      116,
      116,
      116,
      116
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    113
    114,
  RawOp.jump
    ⟨#[
      210,
      210,
      210,
      210,
      210
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1056,
      1056,
      1056,
      1056,
      1056
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1064,
      1064,
      1064,
      1064,
      1064
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1078,
      1078,
      1078,
      1078,
      1078
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1083,
      1083,
      1083,
      1083,
      1083
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      123,
      123,
      123,
      123,
      123
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    120
    121,
  RawOp.jump
    ⟨#[
      124,
      125,
      124,
      124,
      124
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1091,
      1091,
      1091,
      1091,
      1091
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1105,
      1105,
      1105,
      1105,
      1105
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1131,
      1131,
      1131,
      1131,
      1131
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1143,
      1143,
      1143,
      1143,
      1143
    ], rfl⟩
]
theorem fact_3_1 : source_3_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_3_1 := by decide +kernel
theorem bounds_3_1 : raws_3_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_4_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0128
noncomputable def raws_4_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1151,
      1151,
      1151,
      1151,
      1151
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1159,
      1159,
      1159,
      1159,
      1159
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1167,
      1167,
      1167,
      1167,
      1167
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1181,
      1181,
      1181,
      1181,
      1181
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1186,
      1186,
      1186,
      1186,
      1186
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      135,
      135,
      135,
      135,
      135
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    132
    133,
  RawOp.jump
    ⟨#[
      1198,
      1198,
      1198,
      1198,
      1198
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1203,
      1203,
      1203,
      1203,
      1203
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      139,
      139,
      139,
      139,
      139
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    136
    137,
  RawOp.jump
    ⟨#[
      1215,
      1215,
      1215,
      1215,
      1215
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1235,
      1235,
      1235,
      1235,
      1235
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1240,
      1240,
      1240,
      1240,
      1240
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      146,
      146,
      146,
      146,
      146
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    141
    142,
  RawOp.jump
    ⟨#[
      1245,
      1245,
      1245,
      1245,
      1245
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      147,
      147,
      147,
      147,
      147
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    144
    145,
  RawOp.jump
    ⟨#[
      1257,
      1257,
      1257,
      1257,
      1257
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1262,
      1262,
      1262,
      1262,
      1262
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      151,
      151,
      151,
      151,
      151
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    148
    149,
  RawOp.jump
    ⟨#[
      1274,
      1274,
      1274,
      1274,
      1274
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1288,
      1288,
      1288,
      1288,
      1288
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1293,
      1293,
      1293,
      1293,
      1293
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      156,
      156,
      156,
      156,
      156
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    153
    154,
  RawOp.jump
    ⟨#[
      1305,
      1305,
      1305,
      1305,
      1305
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1319,
      1319,
      1319,
      1319,
      1319
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1324,
      1324,
      1324,
      1324,
      1324
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      161,
      161,
      161,
      161,
      161
    ], rfl⟩
]
theorem fact_4_1 : source_4_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_4_1 := by decide +kernel
theorem bounds_4_1 : raws_4_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_3_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_3_1 source_4_1
noncomputable def raws_3_2 : List RawOp := raws_3_1 ++ raws_4_1
theorem fact_3_2 : source_3_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_3_2 :=
  source_branch 32 source_3_1 source_4_1 raws_3_1 raws_4_1 fact_3_1 fact_4_1
theorem bounds_3_2 : raws_3_2.all (labelsBounded 4042) = true :=
  bounds_append raws_3_1 raws_4_1 bounds_3_1 bounds_4_1
noncomputable def source_5_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0160
noncomputable def raws_5_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    158
    159,
  RawOp.jump
    ⟨#[
      1336,
      1336,
      1336,
      1336,
      1336
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1350,
      1350,
      1350,
      1350,
      1350
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1355,
      1355,
      1355,
      1355,
      1355
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      166,
      166,
      166,
      166,
      166
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    163
    164,
  RawOp.jump
    ⟨#[
      1367,
      1367,
      1367,
      1367,
      1367
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1372,
      1372,
      1372,
      1372,
      1372
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      172,
      172,
      172,
      172,
      172
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    167
    168,
  RawOp.jump
    ⟨#[
      1377,
      1377,
      1377,
      1377,
      1377
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      174,
      174,
      174,
      174,
      174
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    170
    171,
  RawOp.jump
    ⟨#[
      1380,
      1380,
      1380,
      1380,
      1380
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    173
    18,
  RawOp.jump
    ⟨#[
      1407,
      1407,
      1407,
      1407,
      1407
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1421,
      1421,
      1421,
      1421,
      1421
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1426,
      1426,
      1426,
      1426,
      1426
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      180,
      180,
      180,
      180,
      180
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    177
    178,
  RawOp.jump
    ⟨#[
      1438,
      1438,
      1438,
      1438,
      1438
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1446,
      1446,
      1446,
      1446,
      1446
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1458,
      1458,
      1458,
      1458,
      1458
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1466,
      1466,
      1466,
      1466,
      1466
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1480,
      1480,
      1480,
      1480,
      1480
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1494,
      1494,
      1494,
      1494,
      1494
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1499,
      1499,
      1499,
      1499,
      1499
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      189,
      189,
      189,
      189,
      189
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    186
    187,
  RawOp.jump
    ⟨#[
      1511,
      1511,
      1511,
      1511,
      1511
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1519,
      1519,
      1519,
      1519,
      1519
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1533,
      1533,
      1533,
      1533,
      1533
    ], rfl⟩
]
theorem fact_5_1 : source_5_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_5_1 := by decide +kernel
theorem bounds_5_1 : raws_5_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_6_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0192
noncomputable def raws_6_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1538,
      1538,
      1538,
      1538,
      1538
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      197,
      197,
      197,
      197,
      197
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    192
    193,
  RawOp.jump
    ⟨#[
      1543,
      1543,
      1543,
      1543,
      1543
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      198,
      198,
      198,
      198,
      198
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    195
    196,
  RawOp.jump
    ⟨#[
      1561,
      1561,
      1561,
      1561,
      1561
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1566,
      1566,
      1566,
      1566,
      1566
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      204,
      204,
      204,
      204,
      204
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    199
    200,
  RawOp.jump
    ⟨#[
      1571,
      1571,
      1571,
      1571,
      1571
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      207,
      207,
      207,
      207,
      207
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    202
    203,
  RawOp.jump
    ⟨#[
      1576,
      1576,
      1576,
      1576,
      1576
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      209,
      209,
      209,
      209,
      209
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    205
    206,
  RawOp.jump
    ⟨#[
      1579,
      1579,
      1579,
      1579,
      1579
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    208
    18,
  RawOp.jump
    ⟨#[
      1593,
      1593,
      1593,
      1593,
      1593
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1598,
      1598,
      1598,
      1598,
      1598
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      214,
      214,
      214,
      214,
      214
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    211
    212,
  RawOp.jump
    ⟨#[
      1610,
      1610,
      1610,
      1610,
      1610
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1637,
      1637,
      1637,
      1637,
      1637
    ], rfl⟩,
  RawOp.halt,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    216,
  RawOp.jump
    ⟨#[
      1649,
      1649,
      1649,
      1649,
      1649
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1676,
      1676,
      1676,
      1676,
      1676
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      230,
      230,
      230,
      230,
      230
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1688,
      1688,
      1688,
      1688,
      1688
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1715,
      1715,
      1715,
      1715,
      1715
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      263,
      263,
      263,
      263,
      263
    ], rfl⟩
]
theorem fact_6_1 : source_6_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_6_1 := by decide +kernel
theorem bounds_6_1 : raws_6_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_5_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_5_1 source_6_1
noncomputable def raws_5_2 : List RawOp := raws_5_1 ++ raws_6_1
theorem fact_5_2 : source_5_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_5_2 :=
  source_branch 32 source_5_1 source_6_1 raws_5_1 raws_6_1 fact_5_1 fact_6_1
theorem bounds_5_2 : raws_5_2.all (labelsBounded 4042) = true :=
  bounds_append raws_5_1 raws_6_1 bounds_5_1 bounds_6_1
noncomputable def source_3_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_3_2 source_5_2
noncomputable def raws_3_4 : List RawOp := raws_3_2 ++ raws_5_2
theorem fact_3_4 : source_3_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_3_4 :=
  source_branch 64 source_3_2 source_5_2 raws_3_2 raws_5_2 fact_3_2 fact_5_2
theorem bounds_3_4 : raws_3_4.all (labelsBounded 4042) = true :=
  bounds_append raws_3_2 raws_5_2 bounds_3_2 bounds_5_2
noncomputable def source_0_7 : Balanced.RowTree Snapshot.Entry :=
  .branch 96 source_0_3 source_3_4
noncomputable def raws_0_7 : List RawOp := raws_0_3 ++ raws_3_4
theorem fact_0_7 : source_0_7.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_7 :=
  source_branch 96 source_0_3 source_3_4 raws_0_3 raws_3_4 fact_0_3 fact_3_4
theorem bounds_0_7 : raws_0_7.all (labelsBounded 4042) = true :=
  bounds_append raws_0_3 raws_3_4 bounds_0_3 bounds_3_4
noncomputable def source_7_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0224
noncomputable def raws_7_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1727,
      1727,
      1727,
      1727,
      1727
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1754,
      1754,
      1754,
      1754,
      1754
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      184,
      184,
      184,
      184,
      184
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1766,
      1766,
      1766,
      1766,
      1766
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1780,
      1780,
      1780,
      1780,
      1780
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      267,
      267,
      267,
      267,
      267
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1794,
      1794,
      1794,
      1794,
      1794
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1799,
      1799,
      1799,
      1799,
      1799
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      234,
      234,
      234,
      234,
      234
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    231
    232,
  RawOp.jump
    ⟨#[
      235,
      236,
      235,
      235,
      235
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1807,
      1807,
      1807,
      1807,
      1807
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1821,
      1821,
      1821,
      1821,
      1821
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1835,
      1835,
      1835,
      1835,
      1835
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1840,
      1840,
      1840,
      1840,
      1840
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      241,
      241,
      241,
      241,
      241
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    238
    239,
  RawOp.jump
    ⟨#[
      1852,
      1852,
      1852,
      1852,
      1852
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1866,
      1866,
      1866,
      1866,
      1866
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1871,
      1871,
      1871,
      1871,
      1871
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      246,
      246,
      246,
      246,
      246
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    243
    244,
  RawOp.jump
    ⟨#[
      1883,
      1883,
      1883,
      1883,
      1883
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1891,
      1891,
      1891,
      1891,
      1891
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1905,
      1905,
      1905,
      1905,
      1905
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1910,
      1910,
      1910,
      1910,
      1910
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      252,
      252,
      252,
      252,
      252
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    249
    250,
  RawOp.jump
    ⟨#[
      1922,
      1922,
      1922,
      1922,
      1922
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1936,
      1936,
      1936,
      1936,
      1936
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1941,
      1941,
      1941,
      1941,
      1941
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      257,
      257,
      257,
      257,
      257
    ], rfl⟩
]
theorem fact_7_1 : source_7_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_7_1 := by decide +kernel
theorem bounds_7_1 : raws_7_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t8\t{now}"
      handle.flush
noncomputable def source_8_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0256
noncomputable def raws_8_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    254
    255,
  RawOp.jump
    ⟨#[
      1953,
      1953,
      1953,
      1953,
      1953
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1958,
      1958,
      1958,
      1958,
      1958
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      262,
      262,
      262,
      262,
      262
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    258
    259,
  RawOp.jump
    ⟨#[
      1961,
      1961,
      1961,
      1961,
      1961
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    261
    206,
  RawOp.jump
    ⟨#[
      1975,
      1975,
      1975,
      1975,
      1975
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      1978,
      1978,
      1978,
      1978,
      1978
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      127,
      127,
      127,
      127,
      127
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    264
    265,
  RawOp.jump
    ⟨#[
      2005,
      2005,
      2005,
      2005,
      2005
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2013,
      2013,
      2013,
      2013,
      2013
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2025,
      2025,
      2025,
      2025,
      2025
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2033,
      2033,
      2033,
      2033,
      2033
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2047,
      2047,
      2047,
      2047,
      2047
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2052,
      2052,
      2052,
      2052,
      2052
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      275,
      275,
      275,
      275,
      275
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    272
    273,
  RawOp.jump
    ⟨#[
      2064,
      2064,
      2064,
      2064,
      2064
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      2066,
      2066,
      2066,
      2066,
      2066
    ], rfl⟩,
  RawOp.move
    Dir.right
    276,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    277,
  RawOp.jump
    ⟨#[
      281,
      281,
      281,
      281,
      281
    ], rfl⟩,
  RawOp.move
    Dir.right
    279,
  RawOp.absent
    bounded_4_1
    278
    280,
  RawOp.jump
    ⟨#[
      2076,
      2076,
      2076,
      2076,
      2076
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    282,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    282,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    284,
  RawOp.move
    Dir.left
    285,
  RawOp.marker
    283
    286
]
theorem fact_8_1 : source_8_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_8_1 := by decide +kernel
theorem bounds_8_1 : raws_8_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_7_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_7_1 source_8_1
noncomputable def raws_7_2 : List RawOp := raws_7_1 ++ raws_8_1
theorem fact_7_2 : source_7_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_7_2 :=
  source_branch 32 source_7_1 source_8_1 raws_7_1 raws_8_1 fact_7_1 fact_8_1
theorem bounds_7_2 : raws_7_2.all (labelsBounded 4042) = true :=
  bounds_append raws_7_1 raws_8_1 bounds_7_1 bounds_8_1
noncomputable def source_9_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0288
noncomputable def raws_9_1 : List RawOp := [
  RawOp.move
    Dir.right
    1,
  RawOp.absent
    bounded_4_0
    287
    288,
  RawOp.jump
    ⟨#[
      2081,
      2081,
      2081,
      2081,
      2081
    ], rfl⟩,
  RawOp.move
    Dir.right
    290,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    291,
  RawOp.move
    Dir.right
    2,
  RawOp.absent
    bounded_4_3
    292
    293,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    291,
  RawOp.jump
    ⟨#[
      298,
      298,
      298,
      298,
      298
    ], rfl⟩,
  RawOp.move
    Dir.right
    296,
  RawOp.absent
    bounded_4_3
    295
    297,
  RawOp.jump
    ⟨#[
      2096,
      2096,
      2096,
      2096,
      2096
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    299,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    299,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    301,
  RawOp.move
    Dir.left
    302,
  RawOp.marker
    300
    303,
  RawOp.move
    Dir.right
    5,
  RawOp.absent
    bounded_4_1
    304
    305,
  RawOp.jump
    ⟨#[
      2090,
      2090,
      2090,
      2090,
      2090
    ], rfl⟩,
  RawOp.move
    Dir.right
    307,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    308,
  RawOp.jump
    ⟨#[
      312,
      312,
      312,
      312,
      312
    ], rfl⟩,
  RawOp.move
    Dir.right
    310,
  RawOp.absent
    bounded_4_1
    309
    311,
  RawOp.jump
    ⟨#[
      2109,
      2109,
      2109,
      2109,
      2109
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    313,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    313,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    315,
  RawOp.move
    Dir.left
    316,
  RawOp.marker
    314
    317,
  RawOp.move
    Dir.right
    6
]
theorem fact_9_1 : source_9_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_9_1 := by decide +kernel
theorem bounds_9_1 : raws_9_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_10_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0320
noncomputable def raws_10_1 : List RawOp := [
  RawOp.absent
    bounded_4_0
    318
    319,
  RawOp.jump
    ⟨#[
      2114,
      2114,
      2114,
      2114,
      2114
    ], rfl⟩,
  RawOp.move
    Dir.right
    321,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    322,
  RawOp.move
    Dir.right
    7,
  RawOp.absent
    bounded_4_0
    323
    324,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    322,
  RawOp.jump
    ⟨#[
      329,
      329,
      329,
      329,
      329
    ], rfl⟩,
  RawOp.move
    Dir.right
    327,
  RawOp.absent
    bounded_4_2
    326
    328,
  RawOp.jump
    ⟨#[
      2130,
      2130,
      2130,
      2130,
      2130
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    330,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    330,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    332,
  RawOp.move
    Dir.left
    333,
  RawOp.marker
    331
    334,
  RawOp.move
    Dir.right
    10,
  RawOp.absent
    bounded_4_1
    335
    336,
  RawOp.jump
    ⟨#[
      2139,
      2139,
      2139,
      2139,
      2139
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    338,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    338,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    340,
  RawOp.move
    Dir.left
    341,
  RawOp.marker
    339
    342,
  RawOp.move
    Dir.right
    11,
  RawOp.absent
    bounded_4_0
    343
    344,
  RawOp.jump
    ⟨#[
      2136,
      2136,
      2136,
      2136,
      2136
    ], rfl⟩,
  RawOp.move
    Dir.right
    346,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    347,
  RawOp.jump
    ⟨#[
      351,
      351,
      351,
      351,
      351
    ], rfl⟩,
  RawOp.move
    Dir.right
    349,
  RawOp.absent
    bounded_4_1
    348
    350
]
theorem fact_10_1 : source_10_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_10_1 := by decide +kernel
theorem bounds_10_1 : raws_10_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_9_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_9_1 source_10_1
noncomputable def raws_9_2 : List RawOp := raws_9_1 ++ raws_10_1
theorem fact_9_2 : source_9_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_9_2 :=
  source_branch 32 source_9_1 source_10_1 raws_9_1 raws_10_1 fact_9_1 fact_10_1
theorem bounds_9_2 : raws_9_2.all (labelsBounded 4042) = true :=
  bounds_append raws_9_1 raws_10_1 bounds_9_1 bounds_10_1
noncomputable def source_7_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_7_2 source_9_2
noncomputable def raws_7_4 : List RawOp := raws_7_2 ++ raws_9_2
theorem fact_7_4 : source_7_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_7_4 :=
  source_branch 64 source_7_2 source_9_2 raws_7_2 raws_9_2 fact_7_2 fact_9_2
theorem bounds_7_4 : raws_7_4.all (labelsBounded 4042) = true :=
  bounds_append raws_7_2 raws_9_2 bounds_7_2 bounds_9_2
noncomputable def source_11_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0352
noncomputable def raws_11_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2152,
      2152,
      2152,
      2152,
      2152
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    352,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    352,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    354,
  RawOp.move
    Dir.left
    355,
  RawOp.marker
    353
    356,
  RawOp.move
    Dir.right
    12,
  RawOp.absent
    bounded_4_3
    357
    358,
  RawOp.jump
    ⟨#[
      2157,
      2157,
      2157,
      2157,
      2157
    ], rfl⟩,
  RawOp.move
    Dir.right
    360,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    361,
  RawOp.move
    Dir.right
    13,
  RawOp.absent
    bounded_4_0
    362
    363,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    361,
  RawOp.jump
    ⟨#[
      368,
      368,
      368,
      368,
      368
    ], rfl⟩,
  RawOp.move
    Dir.right
    366,
  RawOp.absent
    bounded_4_0
    365
    367,
  RawOp.jump
    ⟨#[
      2173,
      2173,
      2173,
      2173,
      2173
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    369,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    369,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    371,
  RawOp.move
    Dir.left
    372,
  RawOp.marker
    370
    373,
  RawOp.move
    Dir.right
    16,
  RawOp.absent
    bounded_4_1
    374
    375,
  RawOp.jump
    ⟨#[
      2178,
      2178,
      2178,
      2178,
      2178
    ], rfl⟩,
  RawOp.move
    Dir.right
    377,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    378,
  RawOp.move
    Dir.right
    17,
  RawOp.absent
    bounded_4_3
    379
    380,
  RawOp.jump
    ⟨#[
      2189,
      2189,
      2189,
      2189,
      2189
    ], rfl⟩,
  RawOp.move
    Dir.right
    382
]
theorem fact_11_1 : source_11_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_11_1 := by decide +kernel
theorem bounds_11_1 : raws_11_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_12_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0384
noncomputable def raws_12_1 : List RawOp := [
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1
    ], rfl⟩
    383,
  RawOp.move
    Dir.right
    21,
  RawOp.absent
    bounded_4_3
    384
    385,
  RawOp.jump
    ⟨#[
      2197,
      2197,
      2197,
      2197,
      2197
    ], rfl⟩,
  RawOp.move
    Dir.right
    387,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    388,
  RawOp.jump
    ⟨#[
      392,
      392,
      392,
      392,
      392
    ], rfl⟩,
  RawOp.move
    Dir.right
    390,
  RawOp.absent
    bounded_4_1
    389
    391,
  RawOp.jump
    ⟨#[
      2207,
      2207,
      2207,
      2207,
      2207
    ], rfl⟩,
  RawOp.move
    Dir.right
    393,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    394,
  RawOp.jump
    ⟨#[
      398,
      398,
      398,
      398,
      398
    ], rfl⟩,
  RawOp.move
    Dir.right
    396,
  RawOp.absent
    bounded_4_1
    395
    397,
  RawOp.jump
    ⟨#[
      2213,
      2213,
      2213,
      2213,
      2213
    ], rfl⟩,
  RawOp.move
    Dir.right
    399,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    400,
  RawOp.move
    Dir.left
    401,
  RawOp.jump
    ⟨#[
      405,
      405,
      405,
      405,
      405
    ], rfl⟩,
  RawOp.move
    Dir.right
    403,
  RawOp.absent
    bounded_4_0
    402
    404,
  RawOp.jump
    ⟨#[
      2223,
      2223,
      2223,
      2223,
      2223
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    406,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    406,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    408,
  RawOp.move
    Dir.left
    409,
  RawOp.marker
    407
    410,
  RawOp.move
    Dir.right
    25,
  RawOp.absent
    bounded_4_0
    411
    412,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    394,
  RawOp.jump
    ⟨#[
      417,
      417,
      417,
      417,
      417
    ], rfl⟩
]
theorem fact_12_1 : source_12_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_12_1 := by decide +kernel
theorem bounds_12_1 : raws_12_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_11_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_11_1 source_12_1
noncomputable def raws_11_2 : List RawOp := raws_11_1 ++ raws_12_1
theorem fact_11_2 : source_11_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_11_2 :=
  source_branch 32 source_11_1 source_12_1 raws_11_1 raws_12_1 fact_11_1 fact_12_1
theorem bounds_11_2 : raws_11_2.all (labelsBounded 4042) = true :=
  bounds_append raws_11_1 raws_12_1 bounds_11_1 bounds_12_1
noncomputable def source_13_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0416
noncomputable def raws_13_1 : List RawOp := [
  RawOp.move
    Dir.right
    415,
  RawOp.absent
    bounded_4_0
    414
    416,
  RawOp.jump
    ⟨#[
      2237,
      2237,
      2237,
      2237,
      2237
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    418,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    418,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    420,
  RawOp.move
    Dir.left
    421,
  RawOp.marker
    419
    422,
  RawOp.move
    Dir.right
    27,
  RawOp.absent
    bounded_4_1
    423
    424,
  RawOp.jump
    ⟨#[
      2231,
      2231,
      2231,
      2231,
      2231
    ], rfl⟩,
  RawOp.move
    Dir.right
    426,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    427,
  RawOp.jump
    ⟨#[
      431,
      431,
      431,
      431,
      431
    ], rfl⟩,
  RawOp.move
    Dir.right
    429,
  RawOp.absent
    bounded_4_1
    428
    430,
  RawOp.jump
    ⟨#[
      2250,
      2250,
      2250,
      2250,
      2250
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    432,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    432,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    434,
  RawOp.move
    Dir.left
    435,
  RawOp.marker
    433
    436,
  RawOp.move
    Dir.right
    28,
  RawOp.absent
    bounded_4_2
    437
    438,
  RawOp.jump
    ⟨#[
      2255,
      2255,
      2255,
      2255,
      2255
    ], rfl⟩,
  RawOp.move
    Dir.right
    440,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    441,
  RawOp.move
    Dir.right
    29,
  RawOp.absent
    bounded_4_3
    442
    443,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    441,
  RawOp.jump
    ⟨#[
      448,
      448,
      448,
      448,
      448
    ], rfl⟩,
  RawOp.move
    Dir.right
    446
]
theorem fact_13_1 : source_13_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_13_1 := by decide +kernel
theorem bounds_13_1 : raws_13_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_14_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0448
noncomputable def raws_14_1 : List RawOp := [
  RawOp.absent
    bounded_4_3
    445
    447,
  RawOp.jump
    ⟨#[
      2270,
      2270,
      2270,
      2270,
      2270
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    449,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    449,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    451,
  RawOp.move
    Dir.left
    452,
  RawOp.marker
    450
    453,
  RawOp.move
    Dir.right
    32,
  RawOp.absent
    bounded_4_1
    454
    455,
  RawOp.jump
    ⟨#[
      2264,
      2264,
      2264,
      2264,
      2264
    ], rfl⟩,
  RawOp.move
    Dir.right
    457,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    458,
  RawOp.jump
    ⟨#[
      462,
      462,
      462,
      462,
      462
    ], rfl⟩,
  RawOp.move
    Dir.right
    460,
  RawOp.absent
    bounded_4_1
    459
    461,
  RawOp.jump
    ⟨#[
      2283,
      2283,
      2283,
      2283,
      2283
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    463,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    463,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    465,
  RawOp.move
    Dir.left
    466,
  RawOp.marker
    464
    467,
  RawOp.move
    Dir.right
    33,
  RawOp.absent
    bounded_4_2
    468
    469,
  RawOp.jump
    ⟨#[
      2288,
      2288,
      2288,
      2288,
      2288
    ], rfl⟩,
  RawOp.move
    Dir.right
    471,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    472,
  RawOp.move
    Dir.right
    34,
  RawOp.absent
    bounded_4_3
    473
    474,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    472,
  RawOp.jump
    ⟨#[
      479,
      479,
      479,
      479,
      479
    ], rfl⟩,
  RawOp.move
    Dir.right
    477,
  RawOp.absent
    bounded_4_3
    476
    478
]
theorem fact_14_1 : source_14_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_14_1 := by decide +kernel
theorem bounds_14_1 : raws_14_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_13_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_13_1 source_14_1
noncomputable def raws_13_2 : List RawOp := raws_13_1 ++ raws_14_1
theorem fact_13_2 : source_13_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_13_2 :=
  source_branch 32 source_13_1 source_14_1 raws_13_1 raws_14_1 fact_13_1 fact_14_1
theorem bounds_13_2 : raws_13_2.all (labelsBounded 4042) = true :=
  bounds_append raws_13_1 raws_14_1 bounds_13_1 bounds_14_1
noncomputable def source_11_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_11_2 source_13_2
noncomputable def raws_11_4 : List RawOp := raws_11_2 ++ raws_13_2
theorem fact_11_4 : source_11_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_11_4 :=
  source_branch 64 source_11_2 source_13_2 raws_11_2 raws_13_2 fact_11_2 fact_13_2
theorem bounds_11_4 : raws_11_4.all (labelsBounded 4042) = true :=
  bounds_append raws_11_2 raws_13_2 bounds_11_2 bounds_13_2
noncomputable def source_7_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_7_4 source_11_4
noncomputable def raws_7_8 : List RawOp := raws_7_4 ++ raws_11_4
theorem fact_7_8 : source_7_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_7_8 :=
  source_branch 128 source_7_4 source_11_4 raws_7_4 raws_11_4 fact_7_4 fact_11_4
theorem bounds_7_8 : raws_7_8.all (labelsBounded 4042) = true :=
  bounds_append raws_7_4 raws_11_4 bounds_7_4 bounds_11_4
noncomputable def source_0_15 : Balanced.RowTree Snapshot.Entry :=
  .branch 224 source_0_7 source_7_8
noncomputable def raws_0_15 : List RawOp := raws_0_7 ++ raws_7_8
theorem fact_0_15 : source_0_15.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_15 :=
  source_branch 224 source_0_7 source_7_8 raws_0_7 raws_7_8 fact_0_7 fact_7_8
theorem bounds_0_15 : raws_0_15.all (labelsBounded 4042) = true :=
  bounds_append raws_0_7 raws_7_8 bounds_0_7 bounds_7_8
noncomputable def source_15_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0480
noncomputable def raws_15_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2303,
      2303,
      2303,
      2303,
      2303
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    480,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    480,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    482,
  RawOp.move
    Dir.left
    483,
  RawOp.marker
    481
    484,
  RawOp.move
    Dir.right
    37,
  RawOp.absent
    bounded_4_1
    485
    486,
  RawOp.jump
    ⟨#[
      2297,
      2297,
      2297,
      2297,
      2297
    ], rfl⟩,
  RawOp.move
    Dir.right
    488,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    489,
  RawOp.jump
    ⟨#[
      493,
      493,
      493,
      493,
      493
    ], rfl⟩,
  RawOp.move
    Dir.right
    491,
  RawOp.absent
    bounded_4_1
    490
    492,
  RawOp.jump
    ⟨#[
      2316,
      2316,
      2316,
      2316,
      2316
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    494,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    494,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    496,
  RawOp.move
    Dir.left
    497,
  RawOp.marker
    495
    498,
  RawOp.move
    Dir.right
    38,
  RawOp.absent
    bounded_4_2
    499
    500,
  RawOp.jump
    ⟨#[
      2321,
      2321,
      2321,
      2321,
      2321
    ], rfl⟩,
  RawOp.move
    Dir.right
    502,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    503,
  RawOp.move
    Dir.right
    39,
  RawOp.absent
    bounded_4_3
    504
    505,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    503,
  RawOp.jump
    ⟨#[
      510,
      510,
      510,
      510,
      510
    ], rfl⟩,
  RawOp.move
    Dir.right
    508,
  RawOp.absent
    bounded_4_3
    507
    509,
  RawOp.jump
    ⟨#[
      2333,
      2333,
      2333,
      2333,
      2333
    ], rfl⟩
]
theorem fact_15_1 : source_15_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_15_1 := by decide +kernel
theorem bounds_15_1 : raws_15_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t16\t{now}"
      handle.flush
noncomputable def source_16_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0512
noncomputable def raws_16_1 : List RawOp := [
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    511,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    511,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    513,
  RawOp.move
    Dir.left
    514,
  RawOp.marker
    512
    515,
  RawOp.move
    Dir.right
    42,
  RawOp.absent
    bounded_4_1
    516
    517,
  RawOp.jump
    ⟨#[
      2228,
      2228,
      2228,
      2228,
      2228
    ], rfl⟩,
  RawOp.move
    Dir.right
    519,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    520,
  RawOp.jump
    ⟨#[
      524,
      524,
      524,
      524,
      524
    ], rfl⟩,
  RawOp.move
    Dir.right
    522,
  RawOp.absent
    bounded_4_1
    521
    523,
  RawOp.jump
    ⟨#[
      2346,
      2346,
      2346,
      2346,
      2346
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    525,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    525,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    527,
  RawOp.move
    Dir.left
    528,
  RawOp.marker
    526
    529,
  RawOp.move
    Dir.right
    43,
  RawOp.absent
    bounded_4_2
    530
    531,
  RawOp.jump
    ⟨#[
      2351,
      2351,
      2351,
      2351,
      2351
    ], rfl⟩,
  RawOp.move
    Dir.right
    533,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    534,
  RawOp.move
    Dir.right
    44,
  RawOp.absent
    bounded_4_0
    535
    536,
  RawOp.jump
    ⟨#[
      2359,
      2359,
      2359,
      2359,
      2359
    ], rfl⟩,
  RawOp.move
    Dir.right
    538,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    539,
  RawOp.move
    Dir.right
    47,
  RawOp.absent
    bounded_4_3
    540
    541,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    539
]
theorem fact_16_1 : source_16_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_16_1 := by decide +kernel
theorem bounds_16_1 : raws_16_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_15_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_15_1 source_16_1
noncomputable def raws_15_2 : List RawOp := raws_15_1 ++ raws_16_1
theorem fact_15_2 : source_15_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_15_2 :=
  source_branch 32 source_15_1 source_16_1 raws_15_1 raws_16_1 fact_15_1 fact_16_1
theorem bounds_15_2 : raws_15_2.all (labelsBounded 4042) = true :=
  bounds_append raws_15_1 raws_16_1 bounds_15_1 bounds_16_1
noncomputable def source_17_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0544
noncomputable def raws_17_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      546,
      546,
      546,
      546,
      546
    ], rfl⟩,
  RawOp.move
    Dir.right
    544,
  RawOp.absent
    bounded_4_3
    543
    545,
  RawOp.jump
    ⟨#[
      2367,
      2367,
      2367,
      2367,
      2367
    ], rfl⟩,
  RawOp.move
    Dir.right
    547,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    548,
  RawOp.jump
    ⟨#[
      552,
      552,
      552,
      552,
      552
    ], rfl⟩,
  RawOp.move
    Dir.right
    550,
  RawOp.absent
    bounded_4_0
    549
    551,
  RawOp.jump
    ⟨#[
      2376,
      2376,
      2376,
      2376,
      2376
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    553,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    553,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    555,
  RawOp.move
    Dir.left
    556,
  RawOp.marker
    554
    557,
  RawOp.move
    Dir.right
    50,
  RawOp.absent
    bounded_4_1
    558
    559,
  RawOp.jump
    ⟨#[
      2373,
      2373,
      2373,
      2373,
      2373
    ], rfl⟩,
  RawOp.move
    Dir.right
    561,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    562,
  RawOp.jump
    ⟨#[
      566,
      566,
      566,
      566,
      566
    ], rfl⟩,
  RawOp.move
    Dir.right
    564,
  RawOp.absent
    bounded_4_1
    563
    565,
  RawOp.jump
    ⟨#[
      2389,
      2389,
      2389,
      2389,
      2389
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    567,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    567,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    569,
  RawOp.move
    Dir.left
    570,
  RawOp.marker
    568
    571,
  RawOp.move
    Dir.right
    51,
  RawOp.absent
    bounded_4_2
    572
    573,
  RawOp.jump
    ⟨#[
      2394,
      2394,
      2394,
      2394,
      2394
    ], rfl⟩
]
theorem fact_17_1 : source_17_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_17_1 := by decide +kernel
theorem bounds_17_1 : raws_17_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_18_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0576
noncomputable def raws_18_1 : List RawOp := [
  RawOp.move
    Dir.right
    575,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    576,
  RawOp.move
    Dir.right
    52,
  RawOp.absent
    bounded_4_0
    577
    578,
  RawOp.jump
    ⟨#[
      2402,
      2402,
      2402,
      2402,
      2402
    ], rfl⟩,
  RawOp.move
    Dir.right
    580,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    581,
  RawOp.move
    Dir.right
    55,
  RawOp.absent
    bounded_4_3
    582
    583,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    581,
  RawOp.jump
    ⟨#[
      588,
      588,
      588,
      588,
      588
    ], rfl⟩,
  RawOp.move
    Dir.right
    586,
  RawOp.absent
    bounded_4_3
    585
    587,
  RawOp.jump
    ⟨#[
      2410,
      2410,
      2410,
      2410,
      2410
    ], rfl⟩,
  RawOp.move
    Dir.right
    589,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    590,
  RawOp.jump
    ⟨#[
      594,
      594,
      594,
      594,
      594
    ], rfl⟩,
  RawOp.move
    Dir.right
    592,
  RawOp.absent
    bounded_4_0
    591
    593,
  RawOp.jump
    ⟨#[
      2419,
      2419,
      2419,
      2419,
      2419
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    595,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    595,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    597,
  RawOp.move
    Dir.left
    598,
  RawOp.marker
    596
    599,
  RawOp.move
    Dir.right
    58,
  RawOp.absent
    bounded_4_1
    600
    601,
  RawOp.jump
    ⟨#[
      2416,
      2416,
      2416,
      2416,
      2416
    ], rfl⟩,
  RawOp.move
    Dir.right
    603,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    604,
  RawOp.jump
    ⟨#[
      608,
      608,
      608,
      608,
      608
    ], rfl⟩,
  RawOp.move
    Dir.right
    606
]
theorem fact_18_1 : source_18_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_18_1 := by decide +kernel
theorem bounds_18_1 : raws_18_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_17_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_17_1 source_18_1
noncomputable def raws_17_2 : List RawOp := raws_17_1 ++ raws_18_1
theorem fact_17_2 : source_17_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_17_2 :=
  source_branch 32 source_17_1 source_18_1 raws_17_1 raws_18_1 fact_17_1 fact_18_1
theorem bounds_17_2 : raws_17_2.all (labelsBounded 4042) = true :=
  bounds_append raws_17_1 raws_18_1 bounds_17_1 bounds_18_1
noncomputable def source_15_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_15_2 source_17_2
noncomputable def raws_15_4 : List RawOp := raws_15_2 ++ raws_17_2
theorem fact_15_4 : source_15_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_15_4 :=
  source_branch 64 source_15_2 source_17_2 raws_15_2 raws_17_2 fact_15_2 fact_17_2
theorem bounds_15_4 : raws_15_4.all (labelsBounded 4042) = true :=
  bounds_append raws_15_2 raws_17_2 bounds_15_2 bounds_17_2
noncomputable def source_19_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0608
noncomputable def raws_19_1 : List RawOp := [
  RawOp.absent
    bounded_4_1
    605
    607,
  RawOp.jump
    ⟨#[
      2432,
      2432,
      2432,
      2432,
      2432
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    609,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    609,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    611,
  RawOp.move
    Dir.left
    612,
  RawOp.marker
    610
    613,
  RawOp.move
    Dir.right
    59,
  RawOp.absent
    bounded_4_2
    614
    615,
  RawOp.jump
    ⟨#[
      2437,
      2437,
      2437,
      2437,
      2437
    ], rfl⟩,
  RawOp.move
    Dir.right
    617,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    618,
  RawOp.move
    Dir.right
    60,
  RawOp.absent
    bounded_4_0
    619
    620,
  RawOp.jump
    ⟨#[
      2445,
      2445,
      2445,
      2445,
      2445
    ], rfl⟩,
  RawOp.move
    Dir.right
    622,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    623,
  RawOp.move
    Dir.right
    63,
  RawOp.absent
    bounded_4_3
    624
    625,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    623,
  RawOp.jump
    ⟨#[
      630,
      630,
      630,
      630,
      630
    ], rfl⟩,
  RawOp.move
    Dir.right
    628,
  RawOp.absent
    bounded_4_3
    627
    629,
  RawOp.jump
    ⟨#[
      2453,
      2453,
      2453,
      2453,
      2453
    ], rfl⟩,
  RawOp.move
    Dir.right
    631,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    632,
  RawOp.jump
    ⟨#[
      636,
      636,
      636,
      636,
      636
    ], rfl⟩,
  RawOp.move
    Dir.right
    634,
  RawOp.absent
    bounded_4_0
    633
    635,
  RawOp.jump
    ⟨#[
      2463,
      2463,
      2463,
      2463,
      2463
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    637,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    637
]
theorem fact_19_1 : source_19_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_19_1 := by decide +kernel
theorem bounds_19_1 : raws_19_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_20_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0640
noncomputable def raws_20_1 : List RawOp := [
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    639,
  RawOp.move
    Dir.left
    640,
  RawOp.marker
    638
    641,
  RawOp.move
    Dir.right
    66,
  RawOp.absent
    bounded_4_1
    642
    643,
  RawOp.jump
    ⟨#[
      2468,
      2468,
      2468,
      2468,
      2468
    ], rfl⟩,
  RawOp.move
    Dir.right
    645,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    646,
  RawOp.jump
    ⟨#[
      650,
      650,
      650,
      650,
      650
    ], rfl⟩,
  RawOp.move
    Dir.right
    648,
  RawOp.absent
    bounded_4_1
    647
    649,
  RawOp.jump
    ⟨#[
      2478,
      2478,
      2478,
      2478,
      2478
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    651,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    651,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    653,
  RawOp.move
    Dir.left
    654,
  RawOp.marker
    652
    655,
  RawOp.move
    Dir.right
    68,
  RawOp.absent
    bounded_4_3
    656
    657,
  RawOp.jump
    ⟨#[
      2486,
      2486,
      2486,
      2486,
      2486
    ], rfl⟩,
  RawOp.move
    Dir.right
    659,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    660,
  RawOp.move
    Dir.right
    70,
  RawOp.absent
    bounded_4_3
    661
    662,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    660,
  RawOp.jump
    ⟨#[
      667,
      667,
      667,
      667,
      667
    ], rfl⟩,
  RawOp.move
    Dir.right
    665,
  RawOp.absent
    bounded_4_1
    664
    666,
  RawOp.jump
    ⟨#[
      2502,
      2502,
      2502,
      2502,
      2502
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    668,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    668,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    670
]
theorem fact_20_1 : source_20_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_20_1 := by decide +kernel
theorem bounds_20_1 : raws_20_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_19_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_19_1 source_20_1
noncomputable def raws_19_2 : List RawOp := raws_19_1 ++ raws_20_1
theorem fact_19_2 : source_19_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_19_2 :=
  source_branch 32 source_19_1 source_20_1 raws_19_1 raws_20_1 fact_19_1 fact_20_1
theorem bounds_19_2 : raws_19_2.all (labelsBounded 4042) = true :=
  bounds_append raws_19_1 raws_20_1 bounds_19_1 bounds_20_1
noncomputable def source_21_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0672
noncomputable def raws_21_1 : List RawOp := [
  RawOp.move
    Dir.left
    671,
  RawOp.marker
    669
    672,
  RawOp.move
    Dir.right
    73,
  RawOp.absent
    bounded_4_3
    673
    674,
  RawOp.jump
    ⟨#[
      2507,
      2507,
      2507,
      2507,
      2507
    ], rfl⟩,
  RawOp.move
    Dir.right
    676,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    677,
  RawOp.move
    Dir.right
    74,
  RawOp.absent
    bounded_4_2
    678
    679,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    677,
  RawOp.jump
    ⟨#[
      684,
      684,
      684,
      684,
      684
    ], rfl⟩,
  RawOp.move
    Dir.right
    682,
  RawOp.absent
    bounded_4_2
    681
    683,
  RawOp.jump
    ⟨#[
      2519,
      2519,
      2519,
      2519,
      2519
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    685,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    685,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    687,
  RawOp.move
    Dir.left
    688,
  RawOp.marker
    686
    689,
  RawOp.move
    Dir.right
    77,
  RawOp.absent
    bounded_4_1
    690
    691,
  RawOp.jump
    ⟨#[
      2529,
      2529,
      2529,
      2529,
      2529
    ], rfl⟩,
  RawOp.move
    Dir.right
    693,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    694,
  RawOp.jump
    ⟨#[
      698,
      698,
      698,
      698,
      698
    ], rfl⟩,
  RawOp.move
    Dir.right
    696,
  RawOp.absent
    bounded_4_1
    695
    697,
  RawOp.jump
    ⟨#[
      2535,
      2535,
      2535,
      2535,
      2535
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    699,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    699,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    701,
  RawOp.move
    Dir.left
    702
]
theorem fact_21_1 : source_21_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_21_1 := by decide +kernel
theorem bounds_21_1 : raws_21_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_22_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0704
noncomputable def raws_22_1 : List RawOp := [
  RawOp.marker
    700
    703,
  RawOp.move
    Dir.right
    78,
  RawOp.absent
    bounded_4_0
    704
    705,
  RawOp.jump
    ⟨#[
      2540,
      2540,
      2540,
      2540,
      2540
    ], rfl⟩,
  RawOp.move
    Dir.right
    707,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    708,
  RawOp.move
    Dir.right
    79,
  RawOp.absent
    bounded_4_3
    709
    710,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    708,
  RawOp.jump
    ⟨#[
      715,
      715,
      715,
      715,
      715
    ], rfl⟩,
  RawOp.move
    Dir.right
    713,
  RawOp.absent
    bounded_4_3
    712
    714,
  RawOp.jump
    ⟨#[
      2555,
      2555,
      2555,
      2555,
      2555
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    716,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    716,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    718,
  RawOp.move
    Dir.left
    719,
  RawOp.marker
    717
    720,
  RawOp.move
    Dir.right
    82,
  RawOp.absent
    bounded_4_1
    721
    722,
  RawOp.jump
    ⟨#[
      2549,
      2549,
      2549,
      2549,
      2549
    ], rfl⟩,
  RawOp.move
    Dir.right
    724,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    725,
  RawOp.jump
    ⟨#[
      729,
      729,
      729,
      729,
      729
    ], rfl⟩,
  RawOp.move
    Dir.right
    727,
  RawOp.absent
    bounded_4_1
    726
    728,
  RawOp.jump
    ⟨#[
      2568,
      2568,
      2568,
      2568,
      2568
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    730,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    730,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    732,
  RawOp.move
    Dir.left
    733,
  RawOp.marker
    731
    734
]
theorem fact_22_1 : source_22_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_22_1 := by decide +kernel
theorem bounds_22_1 : raws_22_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_21_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_21_1 source_22_1
noncomputable def raws_21_2 : List RawOp := raws_21_1 ++ raws_22_1
theorem fact_21_2 : source_21_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_21_2 :=
  source_branch 32 source_21_1 source_22_1 raws_21_1 raws_22_1 fact_21_1 fact_22_1
theorem bounds_21_2 : raws_21_2.all (labelsBounded 4042) = true :=
  bounds_append raws_21_1 raws_22_1 bounds_21_1 bounds_22_1
noncomputable def source_19_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_19_2 source_21_2
noncomputable def raws_19_4 : List RawOp := raws_19_2 ++ raws_21_2
theorem fact_19_4 : source_19_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_19_4 :=
  source_branch 64 source_19_2 source_21_2 raws_19_2 raws_21_2 fact_19_2 fact_21_2
theorem bounds_19_4 : raws_19_4.all (labelsBounded 4042) = true :=
  bounds_append raws_19_2 raws_21_2 bounds_19_2 bounds_21_2
noncomputable def source_15_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_15_4 source_19_4
noncomputable def raws_15_8 : List RawOp := raws_15_4 ++ raws_19_4
theorem fact_15_8 : source_15_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_15_8 :=
  source_branch 128 source_15_4 source_19_4 raws_15_4 raws_19_4 fact_15_4 fact_19_4
theorem bounds_15_8 : raws_15_8.all (labelsBounded 4042) = true :=
  bounds_append raws_15_4 raws_19_4 bounds_15_4 bounds_19_4
noncomputable def source_23_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0736
noncomputable def raws_23_1 : List RawOp := [
  RawOp.move
    Dir.right
    83,
  RawOp.absent
    bounded_4_0
    735
    736,
  RawOp.jump
    ⟨#[
      2573,
      2573,
      2573,
      2573,
      2573
    ], rfl⟩,
  RawOp.move
    Dir.right
    738,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    739,
  RawOp.move
    Dir.right
    84,
  RawOp.absent
    bounded_4_3
    740
    741,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    739,
  RawOp.jump
    ⟨#[
      746,
      746,
      746,
      746,
      746
    ], rfl⟩,
  RawOp.move
    Dir.right
    744,
  RawOp.absent
    bounded_4_3
    743
    745,
  RawOp.jump
    ⟨#[
      2589,
      2589,
      2589,
      2589,
      2589
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    747,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    747,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    749,
  RawOp.move
    Dir.left
    750,
  RawOp.marker
    748
    751,
  RawOp.move
    Dir.right
    87,
  RawOp.absent
    bounded_4_1
    752
    753,
  RawOp.jump
    ⟨#[
      2594,
      2594,
      2594,
      2594,
      2594
    ], rfl⟩,
  RawOp.move
    Dir.right
    755,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    756,
  RawOp.jump
    ⟨#[
      760,
      760,
      760,
      760,
      760
    ], rfl⟩,
  RawOp.move
    Dir.right
    758,
  RawOp.absent
    bounded_4_1
    757
    759,
  RawOp.jump
    ⟨#[
      2604,
      2604,
      2604,
      2604,
      2604
    ], rfl⟩,
  RawOp.move
    Dir.right
    761,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    762,
  RawOp.jump
    ⟨#[
      766,
      766,
      766,
      766,
      766
    ], rfl⟩,
  RawOp.move
    Dir.right
    764,
  RawOp.absent
    bounded_4_1
    763
    765,
  RawOp.jump
    ⟨#[
      2610,
      2610,
      2610,
      2610,
      2610
    ], rfl⟩
]
theorem fact_23_1 : source_23_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_23_1 := by decide +kernel
theorem bounds_23_1 : raws_23_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t24\t{now}"
      handle.flush
noncomputable def source_24_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0768
noncomputable def raws_24_1 : List RawOp := [
  RawOp.move
    Dir.right
    767,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    768,
  RawOp.move
    Dir.left
    769,
  RawOp.jump
    ⟨#[
      773,
      773,
      773,
      773,
      773
    ], rfl⟩,
  RawOp.move
    Dir.right
    771,
  RawOp.absent
    bounded_4_0
    770
    772,
  RawOp.jump
    ⟨#[
      2620,
      2620,
      2620,
      2620,
      2620
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    774,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    774,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    776,
  RawOp.move
    Dir.left
    777,
  RawOp.marker
    775
    778,
  RawOp.move
    Dir.right
    89,
  RawOp.absent
    bounded_4_0
    779
    780,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    762,
  RawOp.jump
    ⟨#[
      785,
      785,
      785,
      785,
      785
    ], rfl⟩,
  RawOp.move
    Dir.right
    783,
  RawOp.absent
    bounded_4_0
    782
    784,
  RawOp.jump
    ⟨#[
      2635,
      2635,
      2635,
      2635,
      2635
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    786,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    786,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    788,
  RawOp.move
    Dir.left
    789,
  RawOp.marker
    787
    790,
  RawOp.move
    Dir.right
    91,
  RawOp.absent
    bounded_4_1
    791
    792,
  RawOp.jump
    ⟨#[
      2629,
      2629,
      2629,
      2629,
      2629
    ], rfl⟩,
  RawOp.move
    Dir.right
    794,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    795,
  RawOp.jump
    ⟨#[
      799,
      799,
      799,
      799,
      799
    ], rfl⟩,
  RawOp.move
    Dir.right
    797,
  RawOp.absent
    bounded_4_1
    796
    798
]
theorem fact_24_1 : source_24_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_24_1 := by decide +kernel
theorem bounds_24_1 : raws_24_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_23_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_23_1 source_24_1
noncomputable def raws_23_2 : List RawOp := raws_23_1 ++ raws_24_1
theorem fact_23_2 : source_23_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_23_2 :=
  source_branch 32 source_23_1 source_24_1 raws_23_1 raws_24_1 fact_23_1 fact_24_1
theorem bounds_23_2 : raws_23_2.all (labelsBounded 4042) = true :=
  bounds_append raws_23_1 raws_24_1 bounds_23_1 bounds_24_1
noncomputable def source_25_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0800
noncomputable def raws_25_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2648,
      2648,
      2648,
      2648,
      2648
    ], rfl⟩,
  RawOp.move
    Dir.right
    800,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    801,
  RawOp.jump
    ⟨#[
      805,
      805,
      805,
      805,
      805
    ], rfl⟩,
  RawOp.move
    Dir.right
    803,
  RawOp.absent
    bounded_4_1
    802
    804,
  RawOp.jump
    ⟨#[
      2654,
      2654,
      2654,
      2654,
      2654
    ], rfl⟩,
  RawOp.move
    Dir.right
    806,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    807,
  RawOp.move
    Dir.left
    808,
  RawOp.jump
    ⟨#[
      812,
      812,
      812,
      812,
      812
    ], rfl⟩,
  RawOp.move
    Dir.right
    810,
  RawOp.absent
    bounded_4_0
    809
    811,
  RawOp.jump
    ⟨#[
      2664,
      2664,
      2664,
      2664,
      2664
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    813,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    813,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    815,
  RawOp.move
    Dir.left
    816,
  RawOp.marker
    814
    817,
  RawOp.move
    Dir.right
    92,
  RawOp.absent
    bounded_4_0
    818
    819,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    801,
  RawOp.jump
    ⟨#[
      824,
      824,
      824,
      824,
      824
    ], rfl⟩,
  RawOp.move
    Dir.right
    822,
  RawOp.absent
    bounded_4_0
    821
    823,
  RawOp.jump
    ⟨#[
      2679,
      2679,
      2679,
      2679,
      2679
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    825,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    825,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    827,
  RawOp.move
    Dir.left
    828,
  RawOp.marker
    826
    829,
  RawOp.move
    Dir.right
    94
]
theorem fact_25_1 : source_25_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_25_1 := by decide +kernel
theorem bounds_25_1 : raws_25_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_26_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0832
noncomputable def raws_26_1 : List RawOp := [
  RawOp.absent
    bounded_4_1
    830
    831,
  RawOp.jump
    ⟨#[
      2673,
      2673,
      2673,
      2673,
      2673
    ], rfl⟩,
  RawOp.move
    Dir.right
    833,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    834,
  RawOp.jump
    ⟨#[
      838,
      838,
      838,
      838,
      838
    ], rfl⟩,
  RawOp.move
    Dir.right
    836,
  RawOp.absent
    bounded_4_1
    835
    837,
  RawOp.jump
    ⟨#[
      2692,
      2692,
      2692,
      2692,
      2692
    ], rfl⟩,
  RawOp.move
    Dir.right
    839,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    840,
  RawOp.jump
    ⟨#[
      844,
      844,
      844,
      844,
      844
    ], rfl⟩,
  RawOp.move
    Dir.right
    842,
  RawOp.absent
    bounded_4_1
    841
    843,
  RawOp.jump
    ⟨#[
      2698,
      2698,
      2698,
      2698,
      2698
    ], rfl⟩,
  RawOp.move
    Dir.right
    845,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    846,
  RawOp.move
    Dir.left
    847,
  RawOp.jump
    ⟨#[
      851,
      851,
      851,
      851,
      851
    ], rfl⟩,
  RawOp.move
    Dir.right
    849,
  RawOp.absent
    bounded_4_0
    848
    850,
  RawOp.jump
    ⟨#[
      2708,
      2708,
      2708,
      2708,
      2708
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    852,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    852,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    854,
  RawOp.move
    Dir.left
    855,
  RawOp.marker
    853
    856,
  RawOp.move
    Dir.right
    95,
  RawOp.absent
    bounded_4_0
    857
    858,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    840,
  RawOp.jump
    ⟨#[
      863,
      863,
      863,
      863,
      863
    ], rfl⟩,
  RawOp.move
    Dir.right
    861,
  RawOp.absent
    bounded_4_0
    860
    862
]
theorem fact_26_1 : source_26_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_26_1 := by decide +kernel
theorem bounds_26_1 : raws_26_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_25_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_25_1 source_26_1
noncomputable def raws_25_2 : List RawOp := raws_25_1 ++ raws_26_1
theorem fact_25_2 : source_25_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_25_2 :=
  source_branch 32 source_25_1 source_26_1 raws_25_1 raws_26_1 fact_25_1 fact_26_1
theorem bounds_25_2 : raws_25_2.all (labelsBounded 4042) = true :=
  bounds_append raws_25_1 raws_26_1 bounds_25_1 bounds_26_1
noncomputable def source_23_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_23_2 source_25_2
noncomputable def raws_23_4 : List RawOp := raws_23_2 ++ raws_25_2
theorem fact_23_4 : source_23_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_23_4 :=
  source_branch 64 source_23_2 source_25_2 raws_23_2 raws_25_2 fact_23_2 fact_25_2
theorem bounds_23_4 : raws_23_4.all (labelsBounded 4042) = true :=
  bounds_append raws_23_2 raws_25_2 bounds_23_2 bounds_25_2
noncomputable def source_27_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0864
noncomputable def raws_27_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2723,
      2723,
      2723,
      2723,
      2723
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    864,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    864,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    866,
  RawOp.move
    Dir.left
    867,
  RawOp.marker
    865
    868,
  RawOp.move
    Dir.right
    97,
  RawOp.absent
    bounded_4_1
    869
    870,
  RawOp.jump
    ⟨#[
      2717,
      2717,
      2717,
      2717,
      2717
    ], rfl⟩,
  RawOp.move
    Dir.right
    872,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    873,
  RawOp.jump
    ⟨#[
      877,
      877,
      877,
      877,
      877
    ], rfl⟩,
  RawOp.move
    Dir.right
    875,
  RawOp.absent
    bounded_4_1
    874
    876,
  RawOp.jump
    ⟨#[
      2736,
      2736,
      2736,
      2736,
      2736
    ], rfl⟩,
  RawOp.move
    Dir.right
    878,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    879,
  RawOp.jump
    ⟨#[
      883,
      883,
      883,
      883,
      883
    ], rfl⟩,
  RawOp.move
    Dir.right
    881,
  RawOp.absent
    bounded_4_1
    880
    882,
  RawOp.jump
    ⟨#[
      2742,
      2742,
      2742,
      2742,
      2742
    ], rfl⟩,
  RawOp.move
    Dir.right
    884,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    885,
  RawOp.move
    Dir.left
    886,
  RawOp.jump
    ⟨#[
      890,
      890,
      890,
      890,
      890
    ], rfl⟩,
  RawOp.move
    Dir.right
    888,
  RawOp.absent
    bounded_4_0
    887
    889,
  RawOp.jump
    ⟨#[
      2752,
      2752,
      2752,
      2752,
      2752
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    891,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    891,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    893,
  RawOp.move
    Dir.left
    894
]
theorem fact_27_1 : source_27_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_27_1 := by decide +kernel
theorem bounds_27_1 : raws_27_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_28_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0896
noncomputable def raws_28_1 : List RawOp := [
  RawOp.marker
    892
    895,
  RawOp.move
    Dir.right
    98,
  RawOp.absent
    bounded_4_0
    896
    897,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    879,
  RawOp.jump
    ⟨#[
      902,
      902,
      902,
      902,
      902
    ], rfl⟩,
  RawOp.move
    Dir.right
    900,
  RawOp.absent
    bounded_4_0
    899
    901,
  RawOp.jump
    ⟨#[
      2766,
      2766,
      2766,
      2766,
      2766
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    903,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    903,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    905,
  RawOp.move
    Dir.left
    906,
  RawOp.marker
    904
    907,
  RawOp.move
    Dir.right
    100,
  RawOp.absent
    bounded_4_1
    908
    909,
  RawOp.jump
    ⟨#[
      2760,
      2760,
      2760,
      2760,
      2760
    ], rfl⟩,
  RawOp.move
    Dir.right
    911,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    912,
  RawOp.jump
    ⟨#[
      916,
      916,
      916,
      916,
      916
    ], rfl⟩,
  RawOp.move
    Dir.right
    914,
  RawOp.absent
    bounded_4_1
    913
    915,
  RawOp.jump
    ⟨#[
      2779,
      2779,
      2779,
      2779,
      2779
    ], rfl⟩,
  RawOp.move
    Dir.right
    917,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    918,
  RawOp.jump
    ⟨#[
      922,
      922,
      922,
      922,
      922
    ], rfl⟩,
  RawOp.move
    Dir.right
    920,
  RawOp.absent
    bounded_4_1
    919
    921,
  RawOp.jump
    ⟨#[
      2785,
      2785,
      2785,
      2785,
      2785
    ], rfl⟩,
  RawOp.move
    Dir.right
    923,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    924,
  RawOp.move
    Dir.left
    925,
  RawOp.jump
    ⟨#[
      929,
      929,
      929,
      929,
      929
    ], rfl⟩
]
theorem fact_28_1 : source_28_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_28_1 := by decide +kernel
theorem bounds_28_1 : raws_28_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_27_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_27_1 source_28_1
noncomputable def raws_27_2 : List RawOp := raws_27_1 ++ raws_28_1
theorem fact_27_2 : source_27_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_27_2 :=
  source_branch 32 source_27_1 source_28_1 raws_27_1 raws_28_1 fact_27_1 fact_28_1
theorem bounds_27_2 : raws_27_2.all (labelsBounded 4042) = true :=
  bounds_append raws_27_1 raws_28_1 bounds_27_1 bounds_28_1
noncomputable def source_29_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0928
noncomputable def raws_29_1 : List RawOp := [
  RawOp.move
    Dir.right
    927,
  RawOp.absent
    bounded_4_0
    926
    928,
  RawOp.jump
    ⟨#[
      2795,
      2795,
      2795,
      2795,
      2795
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    930,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    930,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    932,
  RawOp.move
    Dir.left
    933,
  RawOp.marker
    931
    934,
  RawOp.move
    Dir.right
    101,
  RawOp.absent
    bounded_4_0
    935
    936,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    918,
  RawOp.jump
    ⟨#[
      941,
      941,
      941,
      941,
      941
    ], rfl⟩,
  RawOp.move
    Dir.right
    939,
  RawOp.absent
    bounded_4_0
    938
    940,
  RawOp.jump
    ⟨#[
      2809,
      2809,
      2809,
      2809,
      2809
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    942,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    942,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    944,
  RawOp.move
    Dir.left
    945,
  RawOp.marker
    943
    946,
  RawOp.move
    Dir.right
    103,
  RawOp.absent
    bounded_4_1
    947
    948,
  RawOp.jump
    ⟨#[
      2803,
      2803,
      2803,
      2803,
      2803
    ], rfl⟩,
  RawOp.move
    Dir.right
    950,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    951,
  RawOp.jump
    ⟨#[
      955,
      955,
      955,
      955,
      955
    ], rfl⟩,
  RawOp.move
    Dir.right
    953,
  RawOp.absent
    bounded_4_1
    952
    954,
  RawOp.jump
    ⟨#[
      2822,
      2822,
      2822,
      2822,
      2822
    ], rfl⟩,
  RawOp.move
    Dir.right
    956,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    957,
  RawOp.jump
    ⟨#[
      961,
      961,
      961,
      961,
      961
    ], rfl⟩
]
theorem fact_29_1 : source_29_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_29_1 := by decide +kernel
theorem bounds_29_1 : raws_29_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_30_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0960
noncomputable def raws_30_1 : List RawOp := [
  RawOp.move
    Dir.right
    959,
  RawOp.absent
    bounded_4_1
    958
    960,
  RawOp.jump
    ⟨#[
      2828,
      2828,
      2828,
      2828,
      2828
    ], rfl⟩,
  RawOp.move
    Dir.right
    962,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    963,
  RawOp.move
    Dir.left
    964,
  RawOp.jump
    ⟨#[
      968,
      968,
      968,
      968,
      968
    ], rfl⟩,
  RawOp.move
    Dir.right
    966,
  RawOp.absent
    bounded_4_0
    965
    967,
  RawOp.jump
    ⟨#[
      2838,
      2838,
      2838,
      2838,
      2838
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    969,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    969,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    971,
  RawOp.move
    Dir.left
    972,
  RawOp.marker
    970
    973,
  RawOp.move
    Dir.right
    104,
  RawOp.absent
    bounded_4_0
    974
    975,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    957,
  RawOp.jump
    ⟨#[
      980,
      980,
      980,
      980,
      980
    ], rfl⟩,
  RawOp.move
    Dir.right
    978,
  RawOp.absent
    bounded_4_0
    977
    979,
  RawOp.jump
    ⟨#[
      2852,
      2852,
      2852,
      2852,
      2852
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    981,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    981,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    983,
  RawOp.move
    Dir.left
    984,
  RawOp.marker
    982
    985,
  RawOp.move
    Dir.right
    106,
  RawOp.absent
    bounded_4_1
    986
    987,
  RawOp.jump
    ⟨#[
      2846,
      2846,
      2846,
      2846,
      2846
    ], rfl⟩,
  RawOp.move
    Dir.right
    989,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    990
]
theorem fact_30_1 : source_30_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_30_1 := by decide +kernel
theorem bounds_30_1 : raws_30_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_29_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_29_1 source_30_1
noncomputable def raws_29_2 : List RawOp := raws_29_1 ++ raws_30_1
theorem fact_29_2 : source_29_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_29_2 :=
  source_branch 32 source_29_1 source_30_1 raws_29_1 raws_30_1 fact_29_1 fact_30_1
theorem bounds_29_2 : raws_29_2.all (labelsBounded 4042) = true :=
  bounds_append raws_29_1 raws_30_1 bounds_29_1 bounds_30_1
noncomputable def source_27_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_27_2 source_29_2
noncomputable def raws_27_4 : List RawOp := raws_27_2 ++ raws_29_2
theorem fact_27_4 : source_27_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_27_4 :=
  source_branch 64 source_27_2 source_29_2 raws_27_2 raws_29_2 fact_27_2 fact_29_2
theorem bounds_27_4 : raws_27_4.all (labelsBounded 4042) = true :=
  bounds_append raws_27_2 raws_29_2 bounds_27_2 bounds_29_2
noncomputable def source_23_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_23_4 source_27_4
noncomputable def raws_23_8 : List RawOp := raws_23_4 ++ raws_27_4
theorem fact_23_8 : source_23_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_23_8 :=
  source_branch 128 source_23_4 source_27_4 raws_23_4 raws_27_4 fact_23_4 fact_27_4
theorem bounds_23_8 : raws_23_8.all (labelsBounded 4042) = true :=
  bounds_append raws_23_4 raws_27_4 bounds_23_4 bounds_27_4
noncomputable def source_15_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_15_8 source_23_8
noncomputable def raws_15_16 : List RawOp := raws_15_8 ++ raws_23_8
theorem fact_15_16 : source_15_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_15_16 :=
  source_branch 256 source_15_8 source_23_8 raws_15_8 raws_23_8 fact_15_8 fact_23_8
theorem bounds_15_16 : raws_15_16.all (labelsBounded 4042) = true :=
  bounds_append raws_15_8 raws_23_8 bounds_15_8 bounds_23_8
noncomputable def source_0_31 : Balanced.RowTree Snapshot.Entry :=
  .branch 480 source_0_15 source_15_16
noncomputable def raws_0_31 : List RawOp := raws_0_15 ++ raws_15_16
theorem fact_0_31 : source_0_31.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_31 :=
  source_branch 480 source_0_15 source_15_16 raws_0_15 raws_15_16 fact_0_15 fact_15_16
theorem bounds_0_31 : raws_0_31.all (labelsBounded 4042) = true :=
  bounds_append raws_0_15 raws_15_16 bounds_0_15 bounds_15_16
noncomputable def source_31_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk0992
noncomputable def raws_31_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      994,
      994,
      994,
      994,
      994
    ], rfl⟩,
  RawOp.move
    Dir.right
    992,
  RawOp.absent
    bounded_4_1
    991
    993,
  RawOp.jump
    ⟨#[
      2865,
      2865,
      2865,
      2865,
      2865
    ], rfl⟩,
  RawOp.move
    Dir.right
    995,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    996,
  RawOp.jump
    ⟨#[
      1000,
      1000,
      1000,
      1000,
      1000
    ], rfl⟩,
  RawOp.move
    Dir.right
    998,
  RawOp.absent
    bounded_4_1
    997
    999,
  RawOp.jump
    ⟨#[
      2871,
      2871,
      2871,
      2871,
      2871
    ], rfl⟩,
  RawOp.move
    Dir.right
    1001,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1002,
  RawOp.move
    Dir.left
    1003,
  RawOp.jump
    ⟨#[
      1007,
      1007,
      1007,
      1007,
      1007
    ], rfl⟩,
  RawOp.move
    Dir.right
    1005,
  RawOp.absent
    bounded_4_0
    1004
    1006,
  RawOp.jump
    ⟨#[
      2881,
      2881,
      2881,
      2881,
      2881
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1008,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1008,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1010,
  RawOp.move
    Dir.left
    1011,
  RawOp.marker
    1009
    1012,
  RawOp.move
    Dir.right
    107,
  RawOp.absent
    bounded_4_0
    1013
    1014,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    996,
  RawOp.jump
    ⟨#[
      1019,
      1019,
      1019,
      1019,
      1019
    ], rfl⟩,
  RawOp.move
    Dir.right
    1017,
  RawOp.absent
    bounded_4_0
    1016
    1018,
  RawOp.jump
    ⟨#[
      2895,
      2895,
      2895,
      2895,
      2895
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1020,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1020,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1022
]
theorem fact_31_1 : source_31_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_1 := by decide +kernel
theorem bounds_31_1 : raws_31_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t32\t{now}"
      handle.flush
noncomputable def source_32_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1024
noncomputable def raws_32_1 : List RawOp := [
  RawOp.move
    Dir.left
    1023,
  RawOp.marker
    1021
    1024,
  RawOp.move
    Dir.right
    109,
  RawOp.absent
    bounded_4_1
    1025
    1026,
  RawOp.jump
    ⟨#[
      2905,
      2905,
      2905,
      2905,
      2905
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1028,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1028,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1030,
  RawOp.move
    Dir.left
    1031,
  RawOp.marker
    1029
    1032,
  RawOp.move
    Dir.right
    111,
  RawOp.absent
    bounded_4_3
    1033
    1034,
  RawOp.jump
    ⟨#[
      2915,
      2915,
      2915,
      2915,
      2915
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1036,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1036,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1038,
  RawOp.move
    Dir.left
    1039,
  RawOp.marker
    1037
    1040,
  RawOp.move
    Dir.right
    112,
  RawOp.absent
    bounded_4_3
    1041
    1042,
  RawOp.jump
    ⟨#[
      2920,
      2920,
      2920,
      2920,
      2920
    ], rfl⟩,
  RawOp.move
    Dir.right
    1044,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1045,
  RawOp.move
    Dir.right
    113,
  RawOp.absent
    bounded_4_0
    1046
    1047,
  RawOp.jump
    ⟨#[
      2935,
      2935,
      2935,
      2935,
      2935
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1049,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1049,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1051,
  RawOp.move
    Dir.left
    1052,
  RawOp.marker
    1050
    1053,
  RawOp.move
    Dir.right
    117
]
theorem fact_32_1 : source_32_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_32_1 := by decide +kernel
theorem bounds_32_1 : raws_32_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_31_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_31_1 source_32_1
noncomputable def raws_31_2 : List RawOp := raws_31_1 ++ raws_32_1
theorem fact_31_2 : source_31_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_2 :=
  source_branch 32 source_31_1 source_32_1 raws_31_1 raws_32_1 fact_31_1 fact_32_1
theorem bounds_31_2 : raws_31_2.all (labelsBounded 4042) = true :=
  bounds_append raws_31_1 raws_32_1 bounds_31_1 bounds_32_1
noncomputable def source_33_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1056
noncomputable def raws_33_1 : List RawOp := [
  RawOp.absent
    bounded_4_3
    1054
    1055,
  RawOp.jump
    ⟨#[
      2944,
      2944,
      2944,
      2944,
      2944
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1057,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1057,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1059,
  RawOp.move
    Dir.left
    1060,
  RawOp.marker
    1058
    1061,
  RawOp.move
    Dir.right
    118,
  RawOp.absent
    bounded_4_3
    1062
    1063,
  RawOp.jump
    ⟨#[
      2941,
      2941,
      2941,
      2941,
      2941
    ], rfl⟩,
  RawOp.move
    Dir.right
    1065,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1066,
  RawOp.jump
    ⟨#[
      1070,
      1070,
      1070,
      1070,
      1070
    ], rfl⟩,
  RawOp.move
    Dir.right
    1068,
  RawOp.absent
    bounded_4_1
    1067
    1069,
  RawOp.jump
    ⟨#[
      2957,
      2957,
      2957,
      2957,
      2957
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1071,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1071,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1073,
  RawOp.move
    Dir.left
    1074,
  RawOp.marker
    1072
    1075,
  RawOp.move
    Dir.right
    119,
  RawOp.absent
    bounded_4_0
    1076
    1077,
  RawOp.jump
    ⟨#[
      2962,
      2962,
      2962,
      2962,
      2962
    ], rfl⟩,
  RawOp.move
    Dir.right
    1079,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1080,
  RawOp.move
    Dir.right
    120,
  RawOp.absent
    bounded_4_1
    1081
    1082,
  RawOp.jump
    ⟨#[
      2981,
      2981,
      2981,
      2981,
      2981
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1084,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1084,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1086
]
theorem fact_33_1 : source_33_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_33_1 := by decide +kernel
theorem bounds_33_1 : raws_33_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_34_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1088
noncomputable def raws_34_1 : List RawOp := [
  RawOp.move
    Dir.left
    1087,
  RawOp.marker
    1085
    1088,
  RawOp.move
    Dir.right
    124,
  RawOp.absent
    bounded_4_0
    1089
    1090,
  RawOp.jump
    ⟨#[
      2974,
      2974,
      2974,
      2974,
      2974
    ], rfl⟩,
  RawOp.move
    Dir.right
    1092,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1093,
  RawOp.jump
    ⟨#[
      1097,
      1097,
      1097,
      1097,
      1097
    ], rfl⟩,
  RawOp.move
    Dir.right
    1095,
  RawOp.absent
    bounded_4_0
    1094
    1096,
  RawOp.jump
    ⟨#[
      2993,
      2993,
      2993,
      2993,
      2993
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1098,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1098,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1100,
  RawOp.move
    Dir.left
    1101,
  RawOp.marker
    1099
    1102,
  RawOp.move
    Dir.right
    125,
  RawOp.absent
    bounded_4_1
    1103
    1104,
  RawOp.jump
    ⟨#[
      2987,
      2987,
      2987,
      2987,
      2987
    ], rfl⟩,
  RawOp.move
    Dir.right
    1106,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1107,
  RawOp.jump
    ⟨#[
      1111,
      1111,
      1111,
      1111,
      1111
    ], rfl⟩,
  RawOp.move
    Dir.right
    1109,
  RawOp.absent
    bounded_4_1
    1108
    1110,
  RawOp.jump
    ⟨#[
      3001,
      3001,
      3001,
      3001,
      3001
    ], rfl⟩,
  RawOp.move
    Dir.right
    1112,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1113,
  RawOp.jump
    ⟨#[
      1117,
      1117,
      1117,
      1117,
      1117
    ], rfl⟩,
  RawOp.move
    Dir.right
    1115,
  RawOp.absent
    bounded_4_0
    1114
    1116,
  RawOp.jump
    ⟨#[
      3003,
      3003,
      3003,
      3003,
      3003
    ], rfl⟩,
  RawOp.move
    Dir.right
    1118
]
theorem fact_34_1 : source_34_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_34_1 := by decide +kernel
theorem bounds_34_1 : raws_34_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_33_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_33_1 source_34_1
noncomputable def raws_33_2 : List RawOp := raws_33_1 ++ raws_34_1
theorem fact_33_2 : source_33_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_33_2 :=
  source_branch 32 source_33_1 source_34_1 raws_33_1 raws_34_1 fact_33_1 fact_34_1
theorem bounds_33_2 : raws_33_2.all (labelsBounded 4042) = true :=
  bounds_append raws_33_1 raws_34_1 bounds_33_1 bounds_34_1
noncomputable def source_31_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_31_2 source_33_2
noncomputable def raws_31_4 : List RawOp := raws_31_2 ++ raws_33_2
theorem fact_31_4 : source_31_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_4 :=
  source_branch 64 source_31_2 source_33_2 raws_31_2 raws_33_2 fact_31_2 fact_33_2
theorem bounds_31_4 : raws_31_4.all (labelsBounded 4042) = true :=
  bounds_append raws_31_2 raws_33_2 bounds_31_2 bounds_33_2
noncomputable def source_35_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1120
noncomputable def raws_35_1 : List RawOp := [
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1119,
  RawOp.jump
    ⟨#[
      1123,
      1123,
      1123,
      1123,
      1123
    ], rfl⟩,
  RawOp.move
    Dir.right
    1121,
  RawOp.absent
    bounded_4_0
    1120
    1122,
  RawOp.jump
    ⟨#[
      3013,
      3013,
      3013,
      3013,
      3013
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1124,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1124,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1126,
  RawOp.move
    Dir.left
    1127,
  RawOp.marker
    1125
    1128,
  RawOp.move
    Dir.right
    126,
  RawOp.absent
    bounded_4_0
    1129
    1130,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1113,
  RawOp.jump
    ⟨#[
      1135,
      1135,
      1135,
      1135,
      1135
    ], rfl⟩,
  RawOp.move
    Dir.right
    1133,
  RawOp.absent
    bounded_4_0
    1132
    1134,
  RawOp.jump
    ⟨#[
      3022,
      3022,
      3022,
      3022,
      3022
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1136,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1136,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1138,
  RawOp.move
    Dir.left
    1139,
  RawOp.marker
    1137
    1140,
  RawOp.move
    Dir.right
    127,
  RawOp.absent
    bounded_4_1
    1141
    1142,
  RawOp.jump
    ⟨#[
      3032,
      3032,
      3032,
      3032,
      3032
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1144,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1144,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1146,
  RawOp.move
    Dir.left
    1147,
  RawOp.marker
    1145
    1148,
  RawOp.move
    Dir.right
    128,
  RawOp.absent
    bounded_4_3
    1149
    1150
]
theorem fact_35_1 : source_35_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_35_1 := by decide +kernel
theorem bounds_35_1 : raws_35_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_36_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1152
noncomputable def raws_36_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3042,
      3042,
      3042,
      3042,
      3042
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1152,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1152,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1154,
  RawOp.move
    Dir.left
    1155,
  RawOp.marker
    1153
    1156,
  RawOp.move
    Dir.right
    129,
  RawOp.absent
    bounded_4_3
    1157
    1158,
  RawOp.jump
    ⟨#[
      3048,
      3048,
      3048,
      3048,
      3048
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1160,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1160,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1162,
  RawOp.move
    Dir.left
    1163,
  RawOp.marker
    1161
    1164,
  RawOp.move
    Dir.right
    130,
  RawOp.absent
    bounded_4_0
    1165
    1166,
  RawOp.jump
    ⟨#[
      2757,
      2757,
      2757,
      2757,
      2757
    ], rfl⟩,
  RawOp.move
    Dir.right
    1168,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1169,
  RawOp.jump
    ⟨#[
      1173,
      1173,
      1173,
      1173,
      1173
    ], rfl⟩,
  RawOp.move
    Dir.right
    1171,
  RawOp.absent
    bounded_4_1
    1170
    1172,
  RawOp.jump
    ⟨#[
      3061,
      3061,
      3061,
      3061,
      3061
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1174,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1174,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1176,
  RawOp.move
    Dir.left
    1177,
  RawOp.marker
    1175
    1178,
  RawOp.move
    Dir.right
    131,
  RawOp.absent
    bounded_4_3
    1179
    1180,
  RawOp.jump
    ⟨#[
      3066,
      3066,
      3066,
      3066,
      3066
    ], rfl⟩,
  RawOp.move
    Dir.right
    1182
]
theorem fact_36_1 : source_36_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_36_1 := by decide +kernel
theorem bounds_36_1 : raws_36_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_35_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_35_1 source_36_1
noncomputable def raws_35_2 : List RawOp := raws_35_1 ++ raws_36_1
theorem fact_35_2 : source_35_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_35_2 :=
  source_branch 32 source_35_1 source_36_1 raws_35_1 raws_36_1 fact_35_1 fact_36_1
theorem bounds_35_2 : raws_35_2.all (labelsBounded 4042) = true :=
  bounds_append raws_35_1 raws_36_1 bounds_35_1 bounds_36_1
noncomputable def source_37_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1184
noncomputable def raws_37_1 : List RawOp := [
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1183,
  RawOp.move
    Dir.right
    132,
  RawOp.absent
    bounded_4_2
    1184
    1185,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1183,
  RawOp.jump
    ⟨#[
      1190,
      1190,
      1190,
      1190,
      1190
    ], rfl⟩,
  RawOp.move
    Dir.right
    1188,
  RawOp.absent
    bounded_4_2
    1187
    1189,
  RawOp.jump
    ⟨#[
      3082,
      3082,
      3082,
      3082,
      3082
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1191,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1191,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1193,
  RawOp.move
    Dir.left
    1194,
  RawOp.marker
    1192
    1195,
  RawOp.move
    Dir.right
    135,
  RawOp.absent
    bounded_4_1
    1196
    1197,
  RawOp.jump
    ⟨#[
      3087,
      3087,
      3087,
      3087,
      3087
    ], rfl⟩,
  RawOp.move
    Dir.right
    1199,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1
    ], rfl⟩
    1200,
  RawOp.move
    Dir.right
    136,
  RawOp.absent
    bounded_4_3
    1201
    1202,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1200,
  RawOp.jump
    ⟨#[
      1207,
      1207,
      1207,
      1207,
      1207
    ], rfl⟩,
  RawOp.move
    Dir.right
    1205,
  RawOp.absent
    bounded_4_1
    1204
    1206,
  RawOp.jump
    ⟨#[
      3102,
      3102,
      3102,
      3102,
      3102
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1208,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1208,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1210,
  RawOp.move
    Dir.left
    1211,
  RawOp.marker
    1209
    1212,
  RawOp.move
    Dir.right
    139,
  RawOp.absent
    bounded_4_0
    1213
    1214
]
theorem fact_37_1 : source_37_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_37_1 := by decide +kernel
theorem bounds_37_1 : raws_37_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_38_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1216
noncomputable def raws_38_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3096,
      3096,
      3096,
      3096,
      3096
    ], rfl⟩,
  RawOp.move
    Dir.right
    1216,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1217,
  RawOp.jump
    ⟨#[
      1221,
      1221,
      1221,
      1221,
      1221
    ], rfl⟩,
  RawOp.move
    Dir.right
    1219,
  RawOp.absent
    bounded_4_3
    1218
    1220,
  RawOp.jump
    ⟨#[
      3107,
      3107,
      3107,
      3107,
      3107
    ], rfl⟩,
  RawOp.move
    Dir.right
    1222,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1223,
  RawOp.jump
    ⟨#[
      1227,
      1227,
      1227,
      1227,
      1227
    ], rfl⟩,
  RawOp.move
    Dir.right
    1225,
  RawOp.absent
    bounded_4_0
    1224
    1226,
  RawOp.jump
    ⟨#[
      3117,
      3117,
      3117,
      3117,
      3117
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1228,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1228,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1230,
  RawOp.move
    Dir.left
    1231,
  RawOp.marker
    1229
    1232,
  RawOp.move
    Dir.right
    140,
  RawOp.absent
    bounded_4_1
    1233
    1234,
  RawOp.jump
    ⟨#[
      3122,
      3122,
      3122,
      3122,
      3122
    ], rfl⟩,
  RawOp.move
    Dir.right
    1236,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1237,
  RawOp.move
    Dir.right
    141,
  RawOp.absent
    bounded_4_3
    1238
    1239,
  RawOp.jump
    ⟨#[
      3130,
      3130,
      3130,
      3130,
      3130
    ], rfl⟩,
  RawOp.move
    Dir.right
    1241,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1242,
  RawOp.move
    Dir.right
    144,
  RawOp.absent
    bounded_4_3
    1243
    1244,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1242,
  RawOp.jump
    ⟨#[
      1249,
      1249,
      1249,
      1249,
      1249
    ], rfl⟩
]
theorem fact_38_1 : source_38_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_38_1 := by decide +kernel
theorem bounds_38_1 : raws_38_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_37_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_37_1 source_38_1
noncomputable def raws_37_2 : List RawOp := raws_37_1 ++ raws_38_1
theorem fact_37_2 : source_37_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_37_2 :=
  source_branch 32 source_37_1 source_38_1 raws_37_1 raws_38_1 fact_37_1 fact_38_1
theorem bounds_37_2 : raws_37_2.all (labelsBounded 4042) = true :=
  bounds_append raws_37_1 raws_38_1 bounds_37_1 bounds_38_1
noncomputable def source_35_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_35_2 source_37_2
noncomputable def raws_35_4 : List RawOp := raws_35_2 ++ raws_37_2
theorem fact_35_4 : source_35_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_35_4 :=
  source_branch 64 source_35_2 source_37_2 raws_35_2 raws_37_2 fact_35_2 fact_37_2
theorem bounds_35_4 : raws_35_4.all (labelsBounded 4042) = true :=
  bounds_append raws_35_2 raws_37_2 bounds_35_2 bounds_37_2
noncomputable def source_31_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_31_4 source_35_4
noncomputable def raws_31_8 : List RawOp := raws_31_4 ++ raws_35_4
theorem fact_31_8 : source_31_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_8 :=
  source_branch 128 source_31_4 source_35_4 raws_31_4 raws_35_4 fact_31_4 fact_35_4
theorem bounds_31_8 : raws_31_8.all (labelsBounded 4042) = true :=
  bounds_append raws_31_4 raws_35_4 bounds_31_4 bounds_35_4
noncomputable def source_39_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1248
noncomputable def raws_39_1 : List RawOp := [
  RawOp.move
    Dir.right
    1247,
  RawOp.absent
    bounded_4_1
    1246
    1248,
  RawOp.jump
    ⟨#[
      3146,
      3146,
      3146,
      3146,
      3146
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1250,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1250,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1252,
  RawOp.move
    Dir.left
    1253,
  RawOp.marker
    1251
    1254,
  RawOp.move
    Dir.right
    147,
  RawOp.absent
    bounded_4_2
    1255
    1256,
  RawOp.jump
    ⟨#[
      3151,
      3151,
      3151,
      3151,
      3151
    ], rfl⟩,
  RawOp.move
    Dir.right
    1258,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1259,
  RawOp.move
    Dir.right
    148,
  RawOp.absent
    bounded_4_0
    1260
    1261,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1259,
  RawOp.jump
    ⟨#[
      1266,
      1266,
      1266,
      1266,
      1266
    ], rfl⟩,
  RawOp.move
    Dir.right
    1264,
  RawOp.absent
    bounded_4_0
    1263
    1265,
  RawOp.jump
    ⟨#[
      3163,
      3163,
      3163,
      3163,
      3163
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1267,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1267,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1269,
  RawOp.move
    Dir.left
    1270,
  RawOp.marker
    1268
    1271,
  RawOp.move
    Dir.right
    151,
  RawOp.absent
    bounded_4_1
    1272
    1273,
  RawOp.jump
    ⟨#[
      2800,
      2800,
      2800,
      2800,
      2800
    ], rfl⟩,
  RawOp.move
    Dir.right
    1275,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1276,
  RawOp.jump
    ⟨#[
      1280,
      1280,
      1280,
      1280,
      1280
    ], rfl⟩,
  RawOp.move
    Dir.right
    1278
]
theorem fact_39_1 : source_39_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_39_1 := by decide +kernel
theorem bounds_39_1 : raws_39_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t40\t{now}"
      handle.flush
noncomputable def source_40_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1280
noncomputable def raws_40_1 : List RawOp := [
  RawOp.absent
    bounded_4_1
    1277
    1279,
  RawOp.jump
    ⟨#[
      3176,
      3176,
      3176,
      3176,
      3176
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1281,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1281,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1283,
  RawOp.move
    Dir.left
    1284,
  RawOp.marker
    1282
    1285,
  RawOp.move
    Dir.right
    152,
  RawOp.absent
    bounded_4_3
    1286
    1287,
  RawOp.jump
    ⟨#[
      3181,
      3181,
      3181,
      3181,
      3181
    ], rfl⟩,
  RawOp.move
    Dir.right
    1289,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1290,
  RawOp.move
    Dir.right
    153,
  RawOp.absent
    bounded_4_2
    1291
    1292,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1290,
  RawOp.jump
    ⟨#[
      1297,
      1297,
      1297,
      1297,
      1297
    ], rfl⟩,
  RawOp.move
    Dir.right
    1295,
  RawOp.absent
    bounded_4_2
    1294
    1296,
  RawOp.jump
    ⟨#[
      3196,
      3196,
      3196,
      3196,
      3196
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1298,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1298,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1300,
  RawOp.move
    Dir.left
    1301,
  RawOp.marker
    1299
    1302,
  RawOp.move
    Dir.right
    156,
  RawOp.absent
    bounded_4_1
    1303
    1304,
  RawOp.jump
    ⟨#[
      3190,
      3190,
      3190,
      3190,
      3190
    ], rfl⟩,
  RawOp.move
    Dir.right
    1306,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1307,
  RawOp.jump
    ⟨#[
      1311,
      1311,
      1311,
      1311,
      1311
    ], rfl⟩,
  RawOp.move
    Dir.right
    1309,
  RawOp.absent
    bounded_4_1
    1308
    1310
]
theorem fact_40_1 : source_40_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_40_1 := by decide +kernel
theorem bounds_40_1 : raws_40_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_39_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_39_1 source_40_1
noncomputable def raws_39_2 : List RawOp := raws_39_1 ++ raws_40_1
theorem fact_39_2 : source_39_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_39_2 :=
  source_branch 32 source_39_1 source_40_1 raws_39_1 raws_40_1 fact_39_1 fact_40_1
theorem bounds_39_2 : raws_39_2.all (labelsBounded 4042) = true :=
  bounds_append raws_39_1 raws_40_1 bounds_39_1 bounds_40_1
noncomputable def source_41_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1312
noncomputable def raws_41_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3209,
      3209,
      3209,
      3209,
      3209
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1312,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1312,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1314,
  RawOp.move
    Dir.left
    1315,
  RawOp.marker
    1313
    1316,
  RawOp.move
    Dir.right
    157,
  RawOp.absent
    bounded_4_3
    1317
    1318,
  RawOp.jump
    ⟨#[
      3214,
      3214,
      3214,
      3214,
      3214
    ], rfl⟩,
  RawOp.move
    Dir.right
    1320,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1321,
  RawOp.move
    Dir.right
    158,
  RawOp.absent
    bounded_4_0
    1322
    1323,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1321,
  RawOp.jump
    ⟨#[
      1328,
      1328,
      1328,
      1328,
      1328
    ], rfl⟩,
  RawOp.move
    Dir.right
    1326,
  RawOp.absent
    bounded_4_0
    1325
    1327,
  RawOp.jump
    ⟨#[
      3229,
      3229,
      3229,
      3229,
      3229
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1329,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1329,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1331,
  RawOp.move
    Dir.left
    1332,
  RawOp.marker
    1330
    1333,
  RawOp.move
    Dir.right
    161,
  RawOp.absent
    bounded_4_1
    1334
    1335,
  RawOp.jump
    ⟨#[
      3223,
      3223,
      3223,
      3223,
      3223
    ], rfl⟩,
  RawOp.move
    Dir.right
    1337,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1338,
  RawOp.jump
    ⟨#[
      1342,
      1342,
      1342,
      1342,
      1342
    ], rfl⟩,
  RawOp.move
    Dir.right
    1340,
  RawOp.absent
    bounded_4_1
    1339
    1341,
  RawOp.jump
    ⟨#[
      3242,
      3242,
      3242,
      3242,
      3242
    ], rfl⟩
]
theorem fact_41_1 : source_41_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_41_1 := by decide +kernel
theorem bounds_41_1 : raws_41_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_42_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1344
noncomputable def raws_42_1 : List RawOp := [
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1343,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1343,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1345,
  RawOp.move
    Dir.left
    1346,
  RawOp.marker
    1344
    1347,
  RawOp.move
    Dir.right
    162,
  RawOp.absent
    bounded_4_2
    1348
    1349,
  RawOp.jump
    ⟨#[
      3247,
      3247,
      3247,
      3247,
      3247
    ], rfl⟩,
  RawOp.move
    Dir.right
    1351,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1352,
  RawOp.move
    Dir.right
    163,
  RawOp.absent
    bounded_4_3
    1353
    1354,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1352,
  RawOp.jump
    ⟨#[
      1359,
      1359,
      1359,
      1359,
      1359
    ], rfl⟩,
  RawOp.move
    Dir.right
    1357,
  RawOp.absent
    bounded_4_3
    1356
    1358,
  RawOp.jump
    ⟨#[
      3263,
      3263,
      3263,
      3263,
      3263
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1360,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1360,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1362,
  RawOp.move
    Dir.left
    1363,
  RawOp.marker
    1361
    1364,
  RawOp.move
    Dir.right
    166,
  RawOp.absent
    bounded_4_1
    1365
    1366,
  RawOp.jump
    ⟨#[
      3268,
      3268,
      3268,
      3268,
      3268
    ], rfl⟩,
  RawOp.move
    Dir.right
    1368,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1369,
  RawOp.move
    Dir.right
    167,
  RawOp.absent
    bounded_4_3
    1370
    1371,
  RawOp.jump
    ⟨#[
      3276,
      3276,
      3276,
      3276,
      3276
    ], rfl⟩,
  RawOp.move
    Dir.right
    1373,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1374
]
theorem fact_42_1 : source_42_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_42_1 := by decide +kernel
theorem bounds_42_1 : raws_42_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_41_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_41_1 source_42_1
noncomputable def raws_41_2 : List RawOp := raws_41_1 ++ raws_42_1
theorem fact_41_2 : source_41_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_41_2 :=
  source_branch 32 source_41_1 source_42_1 raws_41_1 raws_42_1 fact_41_1 fact_42_1
theorem bounds_41_2 : raws_41_2.all (labelsBounded 4042) = true :=
  bounds_append raws_41_1 raws_42_1 bounds_41_1 bounds_42_1
noncomputable def source_39_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_39_2 source_41_2
noncomputable def raws_39_4 : List RawOp := raws_39_2 ++ raws_41_2
theorem fact_39_4 : source_39_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_39_4 :=
  source_branch 64 source_39_2 source_41_2 raws_39_2 raws_41_2 fact_39_2 fact_41_2
theorem bounds_39_4 : raws_39_4.all (labelsBounded 4042) = true :=
  bounds_append raws_39_2 raws_41_2 bounds_39_2 bounds_41_2
noncomputable def source_43_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1376
noncomputable def raws_43_1 : List RawOp := [
  RawOp.move
    Dir.right
    170,
  RawOp.absent
    bounded_4_3
    1375
    1376,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    378,
  RawOp.move
    Dir.right
    173,
  RawOp.absent
    bounded_4_3
    1378
    1379,
  RawOp.jump
    ⟨#[
      2843,
      2843,
      2843,
      2843,
      2843
    ], rfl⟩,
  RawOp.move
    Dir.right
    1381,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1382,
  RawOp.jump
    ⟨#[
      1386,
      1386,
      1386,
      1386,
      1386
    ], rfl⟩,
  RawOp.move
    Dir.right
    1384,
  RawOp.absent
    bounded_4_1
    1383
    1385,
  RawOp.jump
    ⟨#[
      3297,
      3297,
      3297,
      3297,
      3297
    ], rfl⟩,
  RawOp.move
    Dir.right
    1387,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1388,
  RawOp.jump
    ⟨#[
      1392,
      1392,
      1392,
      1392,
      1392
    ], rfl⟩,
  RawOp.move
    Dir.right
    1390,
  RawOp.absent
    bounded_4_1
    1389
    1391,
  RawOp.jump
    ⟨#[
      3303,
      3303,
      3303,
      3303,
      3303
    ], rfl⟩,
  RawOp.move
    Dir.right
    1393,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1394,
  RawOp.move
    Dir.left
    1395,
  RawOp.jump
    ⟨#[
      1399,
      1399,
      1399,
      1399,
      1399
    ], rfl⟩,
  RawOp.move
    Dir.right
    1397,
  RawOp.absent
    bounded_4_0
    1396
    1398,
  RawOp.jump
    ⟨#[
      3313,
      3313,
      3313,
      3313,
      3313
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1400,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1400,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1402,
  RawOp.move
    Dir.left
    1403,
  RawOp.marker
    1401
    1404,
  RawOp.move
    Dir.right
    175,
  RawOp.absent
    bounded_4_0
    1405
    1406
]
theorem fact_43_1 : source_43_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_43_1 := by decide +kernel
theorem bounds_43_1 : raws_43_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_44_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1408
noncomputable def raws_44_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3294,
      3294,
      3294,
      3294,
      3294
    ], rfl⟩,
  RawOp.move
    Dir.right
    1408,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1409,
  RawOp.jump
    ⟨#[
      1413,
      1413,
      1413,
      1413,
      1413
    ], rfl⟩,
  RawOp.move
    Dir.right
    1411,
  RawOp.absent
    bounded_4_1
    1410
    1412,
  RawOp.jump
    ⟨#[
      3326,
      3326,
      3326,
      3326,
      3326
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1414,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1414,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1416,
  RawOp.move
    Dir.left
    1417,
  RawOp.marker
    1415
    1418,
  RawOp.move
    Dir.right
    176,
  RawOp.absent
    bounded_4_3
    1419
    1420,
  RawOp.jump
    ⟨#[
      3331,
      3331,
      3331,
      3331,
      3331
    ], rfl⟩,
  RawOp.move
    Dir.right
    1422,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1423,
  RawOp.move
    Dir.right
    177,
  RawOp.absent
    bounded_4_2
    1424
    1425,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1423,
  RawOp.jump
    ⟨#[
      1430,
      1430,
      1430,
      1430,
      1430
    ], rfl⟩,
  RawOp.move
    Dir.right
    1428,
  RawOp.absent
    bounded_4_2
    1427
    1429,
  RawOp.jump
    ⟨#[
      3347,
      3347,
      3347,
      3347,
      3347
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1431,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1431,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1433,
  RawOp.move
    Dir.left
    1434,
  RawOp.marker
    1432
    1435,
  RawOp.move
    Dir.right
    180,
  RawOp.absent
    bounded_4_1
    1436
    1437,
  RawOp.jump
    ⟨#[
      3353,
      3353,
      3353,
      3353,
      3353
    ], rfl⟩
]
theorem fact_44_1 : source_44_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_44_1 := by decide +kernel
theorem bounds_44_1 : raws_44_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_43_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_43_1 source_44_1
noncomputable def raws_43_2 : List RawOp := raws_43_1 ++ raws_44_1
theorem fact_43_2 : source_43_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_43_2 :=
  source_branch 32 source_43_1 source_44_1 raws_43_1 raws_44_1 fact_43_1 fact_44_1
theorem bounds_43_2 : raws_43_2.all (labelsBounded 4042) = true :=
  bounds_append raws_43_1 raws_44_1 bounds_43_1 bounds_44_1
noncomputable def source_45_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1440
noncomputable def raws_45_1 : List RawOp := [
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1439,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1439,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1441,
  RawOp.move
    Dir.left
    1442,
  RawOp.marker
    1440
    1443,
  RawOp.move
    Dir.right
    181,
  RawOp.absent
    bounded_4_3
    1444
    1445,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1388,
  RawOp.jump
    ⟨#[
      1450,
      1450,
      1450,
      1450,
      1450
    ], rfl⟩,
  RawOp.move
    Dir.right
    1448,
  RawOp.absent
    bounded_4_0
    1447
    1449,
  RawOp.jump
    ⟨#[
      3366,
      3366,
      3366,
      3366,
      3366
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1451,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1451,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1453,
  RawOp.move
    Dir.left
    1454,
  RawOp.marker
    1452
    1455,
  RawOp.move
    Dir.right
    182,
  RawOp.absent
    bounded_4_1
    1456
    1457,
  RawOp.jump
    ⟨#[
      3374,
      3374,
      3374,
      3374,
      3374
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1459,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1459,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1461,
  RawOp.move
    Dir.left
    1462,
  RawOp.marker
    1460
    1463,
  RawOp.move
    Dir.right
    183,
  RawOp.absent
    bounded_4_3
    1464
    1465,
  RawOp.jump
    ⟨#[
      3371,
      3371,
      3371,
      3371,
      3371
    ], rfl⟩,
  RawOp.move
    Dir.right
    1467,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1468,
  RawOp.jump
    ⟨#[
      1472,
      1472,
      1472,
      1472,
      1472
    ], rfl⟩,
  RawOp.move
    Dir.right
    1470
]
theorem fact_45_1 : source_45_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_45_1 := by decide +kernel
theorem bounds_45_1 : raws_45_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_46_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1472
noncomputable def raws_46_1 : List RawOp := [
  RawOp.absent
    bounded_4_1
    1469
    1471,
  RawOp.jump
    ⟨#[
      3383,
      3383,
      3383,
      3383,
      3383
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1473,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1473,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1475,
  RawOp.move
    Dir.left
    1476,
  RawOp.marker
    1474
    1477,
  RawOp.move
    Dir.right
    184,
  RawOp.absent
    bounded_4_3
    1478
    1479,
  RawOp.jump
    ⟨#[
      2886,
      2886,
      2886,
      2886,
      2886
    ], rfl⟩,
  RawOp.move
    Dir.right
    1481,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1482,
  RawOp.jump
    ⟨#[
      1486,
      1486,
      1486,
      1486,
      1486
    ], rfl⟩,
  RawOp.move
    Dir.right
    1484,
  RawOp.absent
    bounded_4_1
    1483
    1485,
  RawOp.jump
    ⟨#[
      3396,
      3396,
      3396,
      3396,
      3396
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1487,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1487,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1489,
  RawOp.move
    Dir.left
    1490,
  RawOp.marker
    1488
    1491,
  RawOp.move
    Dir.right
    185,
  RawOp.absent
    bounded_4_3
    1492
    1493,
  RawOp.jump
    ⟨#[
      3401,
      3401,
      3401,
      3401,
      3401
    ], rfl⟩,
  RawOp.move
    Dir.right
    1495,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1496,
  RawOp.move
    Dir.right
    186,
  RawOp.absent
    bounded_4_2
    1497
    1498,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1496,
  RawOp.jump
    ⟨#[
      1503,
      1503,
      1503,
      1503,
      1503
    ], rfl⟩,
  RawOp.move
    Dir.right
    1501,
  RawOp.absent
    bounded_4_2
    1500
    1502
]
theorem fact_46_1 : source_46_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_46_1 := by decide +kernel
theorem bounds_46_1 : raws_46_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_45_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_45_1 source_46_1
noncomputable def raws_45_2 : List RawOp := raws_45_1 ++ raws_46_1
theorem fact_45_2 : source_45_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_45_2 :=
  source_branch 32 source_45_1 source_46_1 raws_45_1 raws_46_1 fact_45_1 fact_46_1
theorem bounds_45_2 : raws_45_2.all (labelsBounded 4042) = true :=
  bounds_append raws_45_1 raws_46_1 bounds_45_1 bounds_46_1
noncomputable def source_43_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_43_2 source_45_2
noncomputable def raws_43_4 : List RawOp := raws_43_2 ++ raws_45_2
theorem fact_43_4 : source_43_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_43_4 :=
  source_branch 64 source_43_2 source_45_2 raws_43_2 raws_45_2 fact_43_2 fact_45_2
theorem bounds_43_4 : raws_43_4.all (labelsBounded 4042) = true :=
  bounds_append raws_43_2 raws_45_2 bounds_43_2 bounds_45_2
noncomputable def source_39_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_39_4 source_43_4
noncomputable def raws_39_8 : List RawOp := raws_39_4 ++ raws_43_4
theorem fact_39_8 : source_39_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_39_8 :=
  source_branch 128 source_39_4 source_43_4 raws_39_4 raws_43_4 fact_39_4 fact_43_4
theorem bounds_39_8 : raws_39_8.all (labelsBounded 4042) = true :=
  bounds_append raws_39_4 raws_43_4 bounds_39_4 bounds_43_4
noncomputable def source_31_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_31_8 source_39_8
noncomputable def raws_31_16 : List RawOp := raws_31_8 ++ raws_39_8
theorem fact_31_16 : source_31_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_16 :=
  source_branch 256 source_31_8 source_39_8 raws_31_8 raws_39_8 fact_31_8 fact_39_8
theorem bounds_31_16 : raws_31_16.all (labelsBounded 4042) = true :=
  bounds_append raws_31_8 raws_39_8 bounds_31_8 bounds_39_8
noncomputable def source_47_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1504
noncomputable def raws_47_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3417,
      3417,
      3417,
      3417,
      3417
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1504,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1504,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1506,
  RawOp.move
    Dir.left
    1507,
  RawOp.marker
    1505
    1508,
  RawOp.move
    Dir.right
    189,
  RawOp.absent
    bounded_4_1
    1509
    1510,
  RawOp.jump
    ⟨#[
      3426,
      3426,
      3426,
      3426,
      3426
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1512,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1512,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1514,
  RawOp.move
    Dir.left
    1515,
  RawOp.marker
    1513
    1516,
  RawOp.move
    Dir.right
    190,
  RawOp.absent
    bounded_4_3
    1517
    1518,
  RawOp.jump
    ⟨#[
      3423,
      3423,
      3423,
      3423,
      3423
    ], rfl⟩,
  RawOp.move
    Dir.right
    1520,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1521,
  RawOp.jump
    ⟨#[
      1525,
      1525,
      1525,
      1525,
      1525
    ], rfl⟩,
  RawOp.move
    Dir.right
    1523,
  RawOp.absent
    bounded_4_1
    1522
    1524,
  RawOp.jump
    ⟨#[
      3439,
      3439,
      3439,
      3439,
      3439
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1526,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1526,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1528,
  RawOp.move
    Dir.left
    1529,
  RawOp.marker
    1527
    1530,
  RawOp.move
    Dir.right
    191,
  RawOp.absent
    bounded_4_2
    1531
    1532,
  RawOp.jump
    ⟨#[
      3444,
      3444,
      3444,
      3444,
      3444
    ], rfl⟩,
  RawOp.move
    Dir.right
    1534
]
theorem fact_47_1 : source_47_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_47_1 := by decide +kernel
theorem bounds_47_1 : raws_47_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t48\t{now}"
      handle.flush
noncomputable def source_48_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1536
noncomputable def raws_48_1 : List RawOp := [
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1535,
  RawOp.move
    Dir.right
    192,
  RawOp.absent
    bounded_4_0
    1536
    1537,
  RawOp.jump
    ⟨#[
      3452,
      3452,
      3452,
      3452,
      3452
    ], rfl⟩,
  RawOp.move
    Dir.right
    1539,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1540,
  RawOp.move
    Dir.right
    195,
  RawOp.absent
    bounded_4_3
    1541
    1542,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1540,
  RawOp.jump
    ⟨#[
      1547,
      1547,
      1547,
      1547,
      1547
    ], rfl⟩,
  RawOp.move
    Dir.right
    1545,
  RawOp.absent
    bounded_4_3
    1544
    1546,
  RawOp.jump
    ⟨#[
      3460,
      3460,
      3460,
      3460,
      3460
    ], rfl⟩,
  RawOp.move
    Dir.right
    1548,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1549,
  RawOp.jump
    ⟨#[
      1553,
      1553,
      1553,
      1553,
      1553
    ], rfl⟩,
  RawOp.move
    Dir.right
    1551,
  RawOp.absent
    bounded_4_0
    1550
    1552,
  RawOp.jump
    ⟨#[
      3470,
      3470,
      3470,
      3470,
      3470
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1554,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1554,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1556,
  RawOp.move
    Dir.left
    1557,
  RawOp.marker
    1555
    1558,
  RawOp.move
    Dir.right
    198,
  RawOp.absent
    bounded_4_1
    1559
    1560,
  RawOp.jump
    ⟨#[
      3475,
      3475,
      3475,
      3475,
      3475
    ], rfl⟩,
  RawOp.move
    Dir.right
    1562,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1563,
  RawOp.move
    Dir.right
    199,
  RawOp.absent
    bounded_4_3
    1564
    1565,
  RawOp.jump
    ⟨#[
      3483,
      3483,
      3483,
      3483,
      3483
    ], rfl⟩
]
theorem fact_48_1 : source_48_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_48_1 := by decide +kernel
theorem bounds_48_1 : raws_48_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_47_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_47_1 source_48_1
noncomputable def raws_47_2 : List RawOp := raws_47_1 ++ raws_48_1
theorem fact_47_2 : source_47_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_47_2 :=
  source_branch 32 source_47_1 source_48_1 raws_47_1 raws_48_1 fact_47_1 fact_48_1
theorem bounds_47_2 : raws_47_2.all (labelsBounded 4042) = true :=
  bounds_append raws_47_1 raws_48_1 bounds_47_1 bounds_48_1
noncomputable def source_49_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1568
noncomputable def raws_49_1 : List RawOp := [
  RawOp.move
    Dir.right
    1567,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1568,
  RawOp.move
    Dir.right
    202,
  RawOp.absent
    bounded_4_3
    1569
    1570,
  RawOp.jump
    ⟨#[
      3491,
      3491,
      3491,
      3491,
      3491
    ], rfl⟩,
  RawOp.move
    Dir.right
    1572,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1573,
  RawOp.move
    Dir.right
    205,
  RawOp.absent
    bounded_4_3
    1574
    1575,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    378,
  RawOp.move
    Dir.right
    208,
  RawOp.absent
    bounded_4_3
    1577
    1578,
  RawOp.jump
    ⟨#[
      2928,
      2928,
      2928,
      2928,
      2928
    ], rfl⟩,
  RawOp.move
    Dir.right
    1580,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1581,
  RawOp.jump
    ⟨#[
      1585,
      1585,
      1585,
      1585,
      1585
    ], rfl⟩,
  RawOp.move
    Dir.right
    1583,
  RawOp.absent
    bounded_4_1
    1582
    1584,
  RawOp.jump
    ⟨#[
      3513,
      3513,
      3513,
      3513,
      3513
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1586,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1586,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1588,
  RawOp.move
    Dir.left
    1589,
  RawOp.marker
    1587
    1590,
  RawOp.move
    Dir.right
    210,
  RawOp.absent
    bounded_4_3
    1591
    1592,
  RawOp.jump
    ⟨#[
      3518,
      3518,
      3518,
      3518,
      3518
    ], rfl⟩,
  RawOp.move
    Dir.right
    1594,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1595,
  RawOp.move
    Dir.right
    211,
  RawOp.absent
    bounded_4_0
    1596
    1597,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1595
]
theorem fact_49_1 : source_49_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_49_1 := by decide +kernel
theorem bounds_49_1 : raws_49_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_50_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1600
noncomputable def raws_50_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1602,
      1602,
      1602,
      1602,
      1602
    ], rfl⟩,
  RawOp.move
    Dir.right
    1600,
  RawOp.absent
    bounded_4_0
    1599
    1601,
  RawOp.jump
    ⟨#[
      3533,
      3533,
      3533,
      3533,
      3533
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1603,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1603,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1605,
  RawOp.move
    Dir.left
    1606,
  RawOp.marker
    1604
    1607,
  RawOp.move
    Dir.right
    214,
  RawOp.absent
    bounded_4_1
    1608
    1609,
  RawOp.jump
    ⟨#[
      3527,
      3527,
      3527,
      3527,
      3527
    ], rfl⟩,
  RawOp.move
    Dir.right
    1611,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1612,
  RawOp.jump
    ⟨#[
      1616,
      1616,
      1616,
      1616,
      1616
    ], rfl⟩,
  RawOp.move
    Dir.right
    1614,
  RawOp.absent
    bounded_4_1
    1613
    1615,
  RawOp.jump
    ⟨#[
      3546,
      3546,
      3546,
      3546,
      3546
    ], rfl⟩,
  RawOp.move
    Dir.right
    1617,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1618,
  RawOp.jump
    ⟨#[
      1622,
      1622,
      1622,
      1622,
      1622
    ], rfl⟩,
  RawOp.move
    Dir.right
    1620,
  RawOp.absent
    bounded_4_1
    1619
    1621,
  RawOp.jump
    ⟨#[
      3552,
      3552,
      3552,
      3552,
      3552
    ], rfl⟩,
  RawOp.move
    Dir.right
    1623,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1624,
  RawOp.move
    Dir.left
    1625,
  RawOp.jump
    ⟨#[
      1629,
      1629,
      1629,
      1629,
      1629
    ], rfl⟩,
  RawOp.move
    Dir.right
    1627,
  RawOp.absent
    bounded_4_0
    1626
    1628,
  RawOp.jump
    ⟨#[
      3562,
      3562,
      3562,
      3562,
      3562
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1630
]
theorem fact_50_1 : source_50_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_50_1 := by decide +kernel
theorem bounds_50_1 : raws_50_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_49_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_49_1 source_50_1
noncomputable def raws_49_2 : List RawOp := raws_49_1 ++ raws_50_1
theorem fact_49_2 : source_49_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_49_2 :=
  source_branch 32 source_49_1 source_50_1 raws_49_1 raws_50_1 fact_49_1 fact_50_1
theorem bounds_49_2 : raws_49_2.all (labelsBounded 4042) = true :=
  bounds_append raws_49_1 raws_50_1 bounds_49_1 bounds_50_1
noncomputable def source_47_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_47_2 source_49_2
noncomputable def raws_47_4 : List RawOp := raws_47_2 ++ raws_49_2
theorem fact_47_4 : source_47_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_47_4 :=
  source_branch 64 source_47_2 source_49_2 raws_47_2 raws_49_2 fact_47_2 fact_49_2
theorem bounds_47_4 : raws_47_4.all (labelsBounded 4042) = true :=
  bounds_append raws_47_2 raws_49_2 bounds_47_2 bounds_49_2
noncomputable def source_51_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1632
noncomputable def raws_51_1 : List RawOp := [
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1630,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1632,
  RawOp.move
    Dir.left
    1633,
  RawOp.marker
    1631
    1634,
  RawOp.move
    Dir.right
    215,
  RawOp.absent
    bounded_4_0
    1635
    1636,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1618,
  RawOp.jump
    ⟨#[
      1641,
      1641,
      1641,
      1641,
      1641
    ], rfl⟩,
  RawOp.move
    Dir.right
    1639,
  RawOp.absent
    bounded_4_0
    1638
    1640,
  RawOp.jump
    ⟨#[
      3580,
      3580,
      3580,
      3580,
      3580
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1642,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1642,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1644,
  RawOp.move
    Dir.left
    1645,
  RawOp.marker
    1643
    1646,
  RawOp.move
    Dir.right
    218,
  RawOp.absent
    bounded_4_1
    1647
    1648,
  RawOp.jump
    ⟨#[
      3574,
      3574,
      3574,
      3574,
      3574
    ], rfl⟩,
  RawOp.move
    Dir.right
    1650,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1651,
  RawOp.jump
    ⟨#[
      1655,
      1655,
      1655,
      1655,
      1655
    ], rfl⟩,
  RawOp.move
    Dir.right
    1653,
  RawOp.absent
    bounded_4_1
    1652
    1654,
  RawOp.jump
    ⟨#[
      3593,
      3593,
      3593,
      3593,
      3593
    ], rfl⟩,
  RawOp.move
    Dir.right
    1656,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1657,
  RawOp.jump
    ⟨#[
      1661,
      1661,
      1661,
      1661,
      1661
    ], rfl⟩,
  RawOp.move
    Dir.right
    1659,
  RawOp.absent
    bounded_4_1
    1658
    1660,
  RawOp.jump
    ⟨#[
      3599,
      3599,
      3599,
      3599,
      3599
    ], rfl⟩,
  RawOp.move
    Dir.right
    1662
]
theorem fact_51_1 : source_51_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_51_1 := by decide +kernel
theorem bounds_51_1 : raws_51_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_52_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1664
noncomputable def raws_52_1 : List RawOp := [
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1663,
  RawOp.move
    Dir.left
    1664,
  RawOp.jump
    ⟨#[
      1668,
      1668,
      1668,
      1668,
      1668
    ], rfl⟩,
  RawOp.move
    Dir.right
    1666,
  RawOp.absent
    bounded_4_0
    1665
    1667,
  RawOp.jump
    ⟨#[
      3609,
      3609,
      3609,
      3609,
      3609
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1669,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1669,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1671,
  RawOp.move
    Dir.left
    1672,
  RawOp.marker
    1670
    1673,
  RawOp.move
    Dir.right
    219,
  RawOp.absent
    bounded_4_0
    1674
    1675,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1657,
  RawOp.jump
    ⟨#[
      1680,
      1680,
      1680,
      1680,
      1680
    ], rfl⟩,
  RawOp.move
    Dir.right
    1678,
  RawOp.absent
    bounded_4_0
    1677
    1679,
  RawOp.jump
    ⟨#[
      3623,
      3623,
      3623,
      3623,
      3623
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1681,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1681,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1683,
  RawOp.move
    Dir.left
    1684,
  RawOp.marker
    1682
    1685,
  RawOp.move
    Dir.right
    221,
  RawOp.absent
    bounded_4_1
    1686
    1687,
  RawOp.jump
    ⟨#[
      3617,
      3617,
      3617,
      3617,
      3617
    ], rfl⟩,
  RawOp.move
    Dir.right
    1689,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1690,
  RawOp.jump
    ⟨#[
      1694,
      1694,
      1694,
      1694,
      1694
    ], rfl⟩,
  RawOp.move
    Dir.right
    1692,
  RawOp.absent
    bounded_4_1
    1691
    1693,
  RawOp.jump
    ⟨#[
      3636,
      3636,
      3636,
      3636,
      3636
    ], rfl⟩
]
theorem fact_52_1 : source_52_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_52_1 := by decide +kernel
theorem bounds_52_1 : raws_52_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_51_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_51_1 source_52_1
noncomputable def raws_51_2 : List RawOp := raws_51_1 ++ raws_52_1
theorem fact_51_2 : source_51_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_51_2 :=
  source_branch 32 source_51_1 source_52_1 raws_51_1 raws_52_1 fact_51_1 fact_52_1
theorem bounds_51_2 : raws_51_2.all (labelsBounded 4042) = true :=
  bounds_append raws_51_1 raws_52_1 bounds_51_1 bounds_52_1
noncomputable def source_53_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1696
noncomputable def raws_53_1 : List RawOp := [
  RawOp.move
    Dir.right
    1695,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1696,
  RawOp.jump
    ⟨#[
      1700,
      1700,
      1700,
      1700,
      1700
    ], rfl⟩,
  RawOp.move
    Dir.right
    1698,
  RawOp.absent
    bounded_4_1
    1697
    1699,
  RawOp.jump
    ⟨#[
      3642,
      3642,
      3642,
      3642,
      3642
    ], rfl⟩,
  RawOp.move
    Dir.right
    1701,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1702,
  RawOp.move
    Dir.left
    1703,
  RawOp.jump
    ⟨#[
      1707,
      1707,
      1707,
      1707,
      1707
    ], rfl⟩,
  RawOp.move
    Dir.right
    1705,
  RawOp.absent
    bounded_4_0
    1704
    1706,
  RawOp.jump
    ⟨#[
      3652,
      3652,
      3652,
      3652,
      3652
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1708,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1708,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1710,
  RawOp.move
    Dir.left
    1711,
  RawOp.marker
    1709
    1712,
  RawOp.move
    Dir.right
    222,
  RawOp.absent
    bounded_4_0
    1713
    1714,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1696,
  RawOp.jump
    ⟨#[
      1719,
      1719,
      1719,
      1719,
      1719
    ], rfl⟩,
  RawOp.move
    Dir.right
    1717,
  RawOp.absent
    bounded_4_0
    1716
    1718,
  RawOp.jump
    ⟨#[
      3666,
      3666,
      3666,
      3666,
      3666
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1720,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1720,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1722,
  RawOp.move
    Dir.left
    1723,
  RawOp.marker
    1721
    1724,
  RawOp.move
    Dir.right
    224,
  RawOp.absent
    bounded_4_1
    1725
    1726
]
theorem fact_53_1 : source_53_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_53_1 := by decide +kernel
theorem bounds_53_1 : raws_53_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_54_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1728
noncomputable def raws_54_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3660,
      3660,
      3660,
      3660,
      3660
    ], rfl⟩,
  RawOp.move
    Dir.right
    1728,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1729,
  RawOp.jump
    ⟨#[
      1733,
      1733,
      1733,
      1733,
      1733
    ], rfl⟩,
  RawOp.move
    Dir.right
    1731,
  RawOp.absent
    bounded_4_1
    1730
    1732,
  RawOp.jump
    ⟨#[
      3679,
      3679,
      3679,
      3679,
      3679
    ], rfl⟩,
  RawOp.move
    Dir.right
    1734,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1735,
  RawOp.jump
    ⟨#[
      1739,
      1739,
      1739,
      1739,
      1739
    ], rfl⟩,
  RawOp.move
    Dir.right
    1737,
  RawOp.absent
    bounded_4_1
    1736
    1738,
  RawOp.jump
    ⟨#[
      3685,
      3685,
      3685,
      3685,
      3685
    ], rfl⟩,
  RawOp.move
    Dir.right
    1740,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1741,
  RawOp.move
    Dir.left
    1742,
  RawOp.jump
    ⟨#[
      1746,
      1746,
      1746,
      1746,
      1746
    ], rfl⟩,
  RawOp.move
    Dir.right
    1744,
  RawOp.absent
    bounded_4_0
    1743
    1745,
  RawOp.jump
    ⟨#[
      3695,
      3695,
      3695,
      3695,
      3695
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1747,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1747,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1749,
  RawOp.move
    Dir.left
    1750,
  RawOp.marker
    1748
    1751,
  RawOp.move
    Dir.right
    225,
  RawOp.absent
    bounded_4_0
    1752
    1753,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1735,
  RawOp.jump
    ⟨#[
      1758,
      1758,
      1758,
      1758,
      1758
    ], rfl⟩,
  RawOp.move
    Dir.right
    1756,
  RawOp.absent
    bounded_4_0
    1755
    1757,
  RawOp.jump
    ⟨#[
      3707,
      3707,
      3707,
      3707,
      3707
    ], rfl⟩
]
theorem fact_54_1 : source_54_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_54_1 := by decide +kernel
theorem bounds_54_1 : raws_54_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_53_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_53_1 source_54_1
noncomputable def raws_53_2 : List RawOp := raws_53_1 ++ raws_54_1
theorem fact_53_2 : source_53_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_53_2 :=
  source_branch 32 source_53_1 source_54_1 raws_53_1 raws_54_1 fact_53_1 fact_54_1
theorem bounds_53_2 : raws_53_2.all (labelsBounded 4042) = true :=
  bounds_append raws_53_1 raws_54_1 bounds_53_1 bounds_54_1
noncomputable def source_51_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_51_2 source_53_2
noncomputable def raws_51_4 : List RawOp := raws_51_2 ++ raws_53_2
theorem fact_51_4 : source_51_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_51_4 :=
  source_branch 64 source_51_2 source_53_2 raws_51_2 raws_53_2 fact_51_2 fact_53_2
theorem bounds_51_4 : raws_51_4.all (labelsBounded 4042) = true :=
  bounds_append raws_51_2 raws_53_2 bounds_51_2 bounds_53_2
noncomputable def source_47_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_47_4 source_51_4
noncomputable def raws_47_8 : List RawOp := raws_47_4 ++ raws_51_4
theorem fact_47_8 : source_47_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_47_8 :=
  source_branch 128 source_47_4 source_51_4 raws_47_4 raws_51_4 fact_47_4 fact_51_4
theorem bounds_47_8 : raws_47_8.all (labelsBounded 4042) = true :=
  bounds_append raws_47_4 raws_51_4 bounds_47_4 bounds_51_4
noncomputable def source_55_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1760
noncomputable def raws_55_1 : List RawOp := [
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1759,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1759,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1761,
  RawOp.move
    Dir.left
    1762,
  RawOp.marker
    1760
    1763,
  RawOp.move
    Dir.right
    227,
  RawOp.absent
    bounded_4_1
    1764
    1765,
  RawOp.jump
    ⟨#[
      3701,
      3701,
      3701,
      3701,
      3701
    ], rfl⟩,
  RawOp.move
    Dir.right
    1767,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1768,
  RawOp.jump
    ⟨#[
      1772,
      1772,
      1772,
      1772,
      1772
    ], rfl⟩,
  RawOp.move
    Dir.right
    1770,
  RawOp.absent
    bounded_4_1
    1769
    1771,
  RawOp.jump
    ⟨#[
      3724,
      3724,
      3724,
      3724,
      3724
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1773,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1773,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1775,
  RawOp.move
    Dir.left
    1776,
  RawOp.marker
    1774
    1777,
  RawOp.move
    Dir.right
    228,
  RawOp.absent
    bounded_4_0
    1778
    1779,
  RawOp.jump
    ⟨#[
      3614,
      3614,
      3614,
      3614,
      3614
    ], rfl⟩,
  RawOp.move
    Dir.right
    1781,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1782,
  RawOp.jump
    ⟨#[
      1786,
      1786,
      1786,
      1786,
      1786
    ], rfl⟩,
  RawOp.move
    Dir.right
    1784,
  RawOp.absent
    bounded_4_1
    1783
    1785,
  RawOp.jump
    ⟨#[
      3739,
      3739,
      3739,
      3739,
      3739
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1787,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1787,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1789,
  RawOp.move
    Dir.left
    1790
]
theorem fact_55_1 : source_55_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_55_1 := by decide +kernel
theorem bounds_55_1 : raws_55_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t56\t{now}"
      handle.flush
noncomputable def source_56_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1792
noncomputable def raws_56_1 : List RawOp := [
  RawOp.marker
    1788
    1791,
  RawOp.move
    Dir.right
    230,
  RawOp.absent
    bounded_4_0
    1792
    1793,
  RawOp.jump
    ⟨#[
      3744,
      3744,
      3744,
      3744,
      3744
    ], rfl⟩,
  RawOp.move
    Dir.right
    1795,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1796,
  RawOp.move
    Dir.right
    231,
  RawOp.absent
    bounded_4_1
    1797
    1798,
  RawOp.jump
    ⟨#[
      3763,
      3763,
      3763,
      3763,
      3763
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1800,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1800,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1802,
  RawOp.move
    Dir.left
    1803,
  RawOp.marker
    1801
    1804,
  RawOp.move
    Dir.right
    235,
  RawOp.absent
    bounded_4_0
    1805
    1806,
  RawOp.jump
    ⟨#[
      3756,
      3756,
      3756,
      3756,
      3756
    ], rfl⟩,
  RawOp.move
    Dir.right
    1808,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1809,
  RawOp.jump
    ⟨#[
      1813,
      1813,
      1813,
      1813,
      1813
    ], rfl⟩,
  RawOp.move
    Dir.right
    1811,
  RawOp.absent
    bounded_4_0
    1810
    1812,
  RawOp.jump
    ⟨#[
      3775,
      3775,
      3775,
      3775,
      3775
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1814,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1814,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1816,
  RawOp.move
    Dir.left
    1817,
  RawOp.marker
    1815
    1818,
  RawOp.move
    Dir.right
    236,
  RawOp.absent
    bounded_4_1
    1819
    1820,
  RawOp.jump
    ⟨#[
      3769,
      3769,
      3769,
      3769,
      3769
    ], rfl⟩,
  RawOp.move
    Dir.right
    1822
]
theorem fact_56_1 : source_56_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_56_1 := by decide +kernel
theorem bounds_56_1 : raws_56_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_55_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_55_1 source_56_1
noncomputable def raws_55_2 : List RawOp := raws_55_1 ++ raws_56_1
theorem fact_55_2 : source_55_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_55_2 :=
  source_branch 32 source_55_1 source_56_1 raws_55_1 raws_56_1 fact_55_1 fact_56_1
theorem bounds_55_2 : raws_55_2.all (labelsBounded 4042) = true :=
  bounds_append raws_55_1 raws_56_1 bounds_55_1 bounds_56_1
noncomputable def source_57_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1824
noncomputable def raws_57_1 : List RawOp := [
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1823,
  RawOp.jump
    ⟨#[
      1827,
      1827,
      1827,
      1827,
      1827
    ], rfl⟩,
  RawOp.move
    Dir.right
    1825,
  RawOp.absent
    bounded_4_1
    1824
    1826,
  RawOp.jump
    ⟨#[
      3788,
      3788,
      3788,
      3788,
      3788
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1828,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1828,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1830,
  RawOp.move
    Dir.left
    1831,
  RawOp.marker
    1829
    1832,
  RawOp.move
    Dir.right
    237,
  RawOp.absent
    bounded_4_0
    1833
    1834,
  RawOp.jump
    ⟨#[
      3793,
      3793,
      3793,
      3793,
      3793
    ], rfl⟩,
  RawOp.move
    Dir.right
    1836,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1837,
  RawOp.move
    Dir.right
    238,
  RawOp.absent
    bounded_4_2
    1838
    1839,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1837,
  RawOp.jump
    ⟨#[
      1844,
      1844,
      1844,
      1844,
      1844
    ], rfl⟩,
  RawOp.move
    Dir.right
    1842,
  RawOp.absent
    bounded_4_2
    1841
    1843,
  RawOp.jump
    ⟨#[
      3808,
      3808,
      3808,
      3808,
      3808
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1845,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1845,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1847,
  RawOp.move
    Dir.left
    1848,
  RawOp.marker
    1846
    1849,
  RawOp.move
    Dir.right
    241,
  RawOp.absent
    bounded_4_1
    1850
    1851,
  RawOp.jump
    ⟨#[
      3802,
      3802,
      3802,
      3802,
      3802
    ], rfl⟩,
  RawOp.move
    Dir.right
    1853,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1854
]
theorem fact_57_1 : source_57_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_57_1 := by decide +kernel
theorem bounds_57_1 : raws_57_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_58_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1856
noncomputable def raws_58_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      1858,
      1858,
      1858,
      1858,
      1858
    ], rfl⟩,
  RawOp.move
    Dir.right
    1856,
  RawOp.absent
    bounded_4_1
    1855
    1857,
  RawOp.jump
    ⟨#[
      3821,
      3821,
      3821,
      3821,
      3821
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1859,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1859,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1861,
  RawOp.move
    Dir.left
    1862,
  RawOp.marker
    1860
    1863,
  RawOp.move
    Dir.right
    242,
  RawOp.absent
    bounded_4_3
    1864
    1865,
  RawOp.jump
    ⟨#[
      3826,
      3826,
      3826,
      3826,
      3826
    ], rfl⟩,
  RawOp.move
    Dir.right
    1867,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1868,
  RawOp.move
    Dir.right
    243,
  RawOp.absent
    bounded_4_3
    1869
    1870,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1868,
  RawOp.jump
    ⟨#[
      1875,
      1875,
      1875,
      1875,
      1875
    ], rfl⟩,
  RawOp.move
    Dir.right
    1873,
  RawOp.absent
    bounded_4_0
    1872
    1874,
  RawOp.jump
    ⟨#[
      3842,
      3842,
      3842,
      3842,
      3842
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1876,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1876,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1878,
  RawOp.move
    Dir.left
    1879,
  RawOp.marker
    1877
    1880,
  RawOp.move
    Dir.right
    246,
  RawOp.absent
    bounded_4_1
    1881
    1882,
  RawOp.jump
    ⟨#[
      3851,
      3851,
      3851,
      3851,
      3851
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1884,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1884,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1886
]
theorem fact_58_1 : source_58_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_58_1 := by decide +kernel
theorem bounds_58_1 : raws_58_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_57_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_57_1 source_58_1
noncomputable def raws_57_2 : List RawOp := raws_57_1 ++ raws_58_1
theorem fact_57_2 : source_57_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_57_2 :=
  source_branch 32 source_57_1 source_58_1 raws_57_1 raws_58_1 fact_57_1 fact_58_1
theorem bounds_57_2 : raws_57_2.all (labelsBounded 4042) = true :=
  bounds_append raws_57_1 raws_58_1 bounds_57_1 bounds_58_1
noncomputable def source_55_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_55_2 source_57_2
noncomputable def raws_55_4 : List RawOp := raws_55_2 ++ raws_57_2
theorem fact_55_4 : source_55_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_55_4 :=
  source_branch 64 source_55_2 source_57_2 raws_55_2 raws_57_2 fact_55_2 fact_57_2
theorem bounds_55_4 : raws_55_4.all (labelsBounded 4042) = true :=
  bounds_append raws_55_2 raws_57_2 bounds_55_2 bounds_57_2
noncomputable def source_59_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1888
noncomputable def raws_59_1 : List RawOp := [
  RawOp.move
    Dir.left
    1887,
  RawOp.marker
    1885
    1888,
  RawOp.move
    Dir.right
    247,
  RawOp.absent
    bounded_4_3
    1889
    1890,
  RawOp.jump
    ⟨#[
      3848,
      3848,
      3848,
      3848,
      3848
    ], rfl⟩,
  RawOp.move
    Dir.right
    1892,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1893,
  RawOp.jump
    ⟨#[
      1897,
      1897,
      1897,
      1897,
      1897
    ], rfl⟩,
  RawOp.move
    Dir.right
    1895,
  RawOp.absent
    bounded_4_1
    1894
    1896,
  RawOp.jump
    ⟨#[
      3864,
      3864,
      3864,
      3864,
      3864
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1898,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1898,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1900,
  RawOp.move
    Dir.left
    1901,
  RawOp.marker
    1899
    1902,
  RawOp.move
    Dir.right
    248,
  RawOp.absent
    bounded_4_3
    1903
    1904,
  RawOp.jump
    ⟨#[
      3869,
      3869,
      3869,
      3869,
      3869
    ], rfl⟩,
  RawOp.move
    Dir.right
    1906,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1907,
  RawOp.move
    Dir.right
    249,
  RawOp.absent
    bounded_4_0
    1908
    1909,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1907,
  RawOp.jump
    ⟨#[
      1914,
      1914,
      1914,
      1914,
      1914
    ], rfl⟩,
  RawOp.move
    Dir.right
    1912,
  RawOp.absent
    bounded_4_0
    1911
    1913,
  RawOp.jump
    ⟨#[
      3884,
      3884,
      3884,
      3884,
      3884
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1915,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1915,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1917,
  RawOp.move
    Dir.left
    1918
]
theorem fact_59_1 : source_59_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_59_1 := by decide +kernel
theorem bounds_59_1 : raws_59_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_60_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1920
noncomputable def raws_60_1 : List RawOp := [
  RawOp.marker
    1916
    1919,
  RawOp.move
    Dir.right
    252,
  RawOp.absent
    bounded_4_1
    1920
    1921,
  RawOp.jump
    ⟨#[
      3878,
      3878,
      3878,
      3878,
      3878
    ], rfl⟩,
  RawOp.move
    Dir.right
    1923,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1924,
  RawOp.jump
    ⟨#[
      1928,
      1928,
      1928,
      1928,
      1928
    ], rfl⟩,
  RawOp.move
    Dir.right
    1926,
  RawOp.absent
    bounded_4_1
    1925
    1927,
  RawOp.jump
    ⟨#[
      3897,
      3897,
      3897,
      3897,
      3897
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1929,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1929,
  RawOp.load
    bounded_4_2
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1931,
  RawOp.move
    Dir.left
    1932,
  RawOp.marker
    1930
    1933,
  RawOp.move
    Dir.right
    253,
  RawOp.absent
    bounded_4_2
    1934
    1935,
  RawOp.jump
    ⟨#[
      3902,
      3902,
      3902,
      3902,
      3902
    ], rfl⟩,
  RawOp.move
    Dir.right
    1937,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1938,
  RawOp.move
    Dir.right
    254,
  RawOp.absent
    bounded_4_3
    1939
    1940,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1938,
  RawOp.jump
    ⟨#[
      1945,
      1945,
      1945,
      1945,
      1945
    ], rfl⟩,
  RawOp.move
    Dir.right
    1943,
  RawOp.absent
    bounded_4_3
    1942
    1944,
  RawOp.jump
    ⟨#[
      3918,
      3918,
      3918,
      3918,
      3918
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1946,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1946,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1948,
  RawOp.move
    Dir.left
    1949,
  RawOp.marker
    1947
    1950
]
theorem fact_60_1 : source_60_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_60_1 := by decide +kernel
theorem bounds_60_1 : raws_60_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_59_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_59_1 source_60_1
noncomputable def raws_59_2 : List RawOp := raws_59_1 ++ raws_60_1
theorem fact_59_2 : source_59_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_59_2 :=
  source_branch 32 source_59_1 source_60_1 raws_59_1 raws_60_1 fact_59_1 fact_60_1
theorem bounds_59_2 : raws_59_2.all (labelsBounded 4042) = true :=
  bounds_append raws_59_1 raws_60_1 bounds_59_1 bounds_60_1
noncomputable def source_61_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1952
noncomputable def raws_61_1 : List RawOp := [
  RawOp.move
    Dir.right
    257,
  RawOp.absent
    bounded_4_1
    1951
    1952,
  RawOp.jump
    ⟨#[
      3923,
      3923,
      3923,
      3923,
      3923
    ], rfl⟩,
  RawOp.move
    Dir.right
    1954,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1955,
  RawOp.move
    Dir.right
    258,
  RawOp.absent
    bounded_4_3
    1956
    1957,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1573,
  RawOp.move
    Dir.right
    261,
  RawOp.absent
    bounded_4_3
    1959
    1960,
  RawOp.jump
    ⟨#[
      3657,
      3657,
      3657,
      3657,
      3657
    ], rfl⟩,
  RawOp.move
    Dir.right
    1962,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1963,
  RawOp.jump
    ⟨#[
      1967,
      1967,
      1967,
      1967,
      1967
    ], rfl⟩,
  RawOp.move
    Dir.right
    1965,
  RawOp.absent
    bounded_4_1
    1964
    1966,
  RawOp.jump
    ⟨#[
      3945,
      3945,
      3945,
      3945,
      3945
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1968,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1968,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1970,
  RawOp.move
    Dir.left
    1971,
  RawOp.marker
    1969
    1972,
  RawOp.move
    Dir.right
    263,
  RawOp.absent
    bounded_4_3
    1973
    1974,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    1113,
  RawOp.move
    Dir.right
    264,
  RawOp.absent
    bounded_4_0
    1976
    1977,
  RawOp.jump
    ⟨#[
      3729,
      3729,
      3729,
      3729,
      3729
    ], rfl⟩,
  RawOp.move
    Dir.right
    1979,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    1980,
  RawOp.jump
    ⟨#[
      1984,
      1984,
      1984,
      1984,
      1984
    ], rfl⟩,
  RawOp.move
    Dir.right
    1982
]
theorem fact_61_1 : source_61_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_61_1 := by decide +kernel
theorem bounds_61_1 : raws_61_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_62_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk1984
noncomputable def raws_62_1 : List RawOp := [
  RawOp.absent
    bounded_4_1
    1981
    1983,
  RawOp.jump
    ⟨#[
      3964,
      3964,
      3964,
      3964,
      3964
    ], rfl⟩,
  RawOp.move
    Dir.right
    1985,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    1986,
  RawOp.jump
    ⟨#[
      1990,
      1990,
      1990,
      1990,
      1990
    ], rfl⟩,
  RawOp.move
    Dir.right
    1988,
  RawOp.absent
    bounded_4_1
    1987
    1989,
  RawOp.jump
    ⟨#[
      3970,
      3970,
      3970,
      3970,
      3970
    ], rfl⟩,
  RawOp.move
    Dir.right
    1991,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    1992,
  RawOp.move
    Dir.left
    1993,
  RawOp.jump
    ⟨#[
      1997,
      1997,
      1997,
      1997,
      1997
    ], rfl⟩,
  RawOp.move
    Dir.right
    1995,
  RawOp.absent
    bounded_4_0
    1994
    1996,
  RawOp.jump
    ⟨#[
      3980,
      3980,
      3980,
      3980,
      3980
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1998,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    1998,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2000,
  RawOp.move
    Dir.left
    2001,
  RawOp.marker
    1999
    2002,
  RawOp.move
    Dir.right
    267,
  RawOp.absent
    bounded_4_0
    2003
    2004,
  RawOp.jump
    ⟨#[
      3986,
      3986,
      3986,
      3986,
      3986
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2006,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2006,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2008,
  RawOp.move
    Dir.left
    2009,
  RawOp.marker
    2007
    2010,
  RawOp.move
    Dir.right
    268,
  RawOp.absent
    bounded_4_3
    2011
    2012,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    1986,
  RawOp.jump
    ⟨#[
      2017,
      2017,
      2017,
      2017,
      2017
    ], rfl⟩
]
theorem fact_62_1 : source_62_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_62_1 := by decide +kernel
theorem bounds_62_1 : raws_62_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_61_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_61_1 source_62_1
noncomputable def raws_61_2 : List RawOp := raws_61_1 ++ raws_62_1
theorem fact_61_2 : source_61_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_61_2 :=
  source_branch 32 source_61_1 source_62_1 raws_61_1 raws_62_1 fact_61_1 fact_62_1
theorem bounds_61_2 : raws_61_2.all (labelsBounded 4042) = true :=
  bounds_append raws_61_1 raws_62_1 bounds_61_1 bounds_62_1
noncomputable def source_59_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_59_2 source_61_2
noncomputable def raws_59_4 : List RawOp := raws_59_2 ++ raws_61_2
theorem fact_59_4 : source_59_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_59_4 :=
  source_branch 64 source_59_2 source_61_2 raws_59_2 raws_61_2 fact_59_2 fact_61_2
theorem bounds_59_4 : raws_59_4.all (labelsBounded 4042) = true :=
  bounds_append raws_59_2 raws_61_2 bounds_59_2 bounds_61_2
noncomputable def source_55_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_55_4 source_59_4
noncomputable def raws_55_8 : List RawOp := raws_55_4 ++ raws_59_4
theorem fact_55_8 : source_55_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_55_8 :=
  source_branch 128 source_55_4 source_59_4 raws_55_4 raws_59_4 fact_55_4 fact_59_4
theorem bounds_55_8 : raws_55_8.all (labelsBounded 4042) = true :=
  bounds_append raws_55_4 raws_59_4 bounds_55_4 bounds_59_4
noncomputable def source_47_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_47_8 source_55_8
noncomputable def raws_47_16 : List RawOp := raws_47_8 ++ raws_55_8
theorem fact_47_16 : source_47_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_47_16 :=
  source_branch 256 source_47_8 source_55_8 raws_47_8 raws_55_8 fact_47_8 fact_55_8
theorem bounds_47_16 : raws_47_16.all (labelsBounded 4042) = true :=
  bounds_append raws_47_8 raws_55_8 bounds_47_8 bounds_55_8
noncomputable def source_31_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_31_16 source_47_16
noncomputable def raws_31_32 : List RawOp := raws_31_16 ++ raws_47_16
theorem fact_31_32 : source_31_32.flatten.map
    (fun row ↦ rawSource row.1) = raws_31_32 :=
  source_branch 512 source_31_16 source_47_16 raws_31_16 raws_47_16 fact_31_16 fact_47_16
theorem bounds_31_32 : raws_31_32.all (labelsBounded 4042) = true :=
  bounds_append raws_31_16 raws_47_16 bounds_31_16 bounds_47_16
noncomputable def source_0_63 : Balanced.RowTree Snapshot.Entry :=
  .branch 992 source_0_31 source_31_32
noncomputable def raws_0_63 : List RawOp := raws_0_31 ++ raws_31_32
theorem fact_0_63 : source_0_63.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_63 :=
  source_branch 992 source_0_31 source_31_32 raws_0_31 raws_31_32 fact_0_31 fact_31_32
theorem bounds_0_63 : raws_0_63.all (labelsBounded 4042) = true :=
  bounds_append raws_0_31 raws_31_32 bounds_0_31 bounds_31_32
noncomputable def source_63_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2016
noncomputable def raws_63_1 : List RawOp := [
  RawOp.move
    Dir.right
    2015,
  RawOp.absent
    bounded_4_0
    2014
    2016,
  RawOp.jump
    ⟨#[
      3999,
      3999,
      3999,
      3999,
      3999
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2018,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2018,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2020,
  RawOp.move
    Dir.left
    2021,
  RawOp.marker
    2019
    2022,
  RawOp.move
    Dir.right
    269,
  RawOp.absent
    bounded_4_1
    2023
    2024,
  RawOp.jump
    ⟨#[
      4008,
      4008,
      4008,
      4008,
      4008
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2026,
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2026,
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2028,
  RawOp.move
    Dir.left
    2029,
  RawOp.marker
    2027
    2030,
  RawOp.move
    Dir.right
    270,
  RawOp.absent
    bounded_4_0
    2031
    2032,
  RawOp.jump
    ⟨#[
      4005,
      4005,
      4005,
      4005,
      4005
    ], rfl⟩,
  RawOp.move
    Dir.right
    2034,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    2035,
  RawOp.jump
    ⟨#[
      2039,
      2039,
      2039,
      2039,
      2039
    ], rfl⟩,
  RawOp.move
    Dir.right
    2037,
  RawOp.absent
    bounded_4_1
    2036
    2038,
  RawOp.jump
    ⟨#[
      4021,
      4021,
      4021,
      4021,
      4021
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2040,
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2040,
  RawOp.load
    bounded_4_3
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2042,
  RawOp.move
    Dir.left
    2043,
  RawOp.marker
    2041
    2044,
  RawOp.move
    Dir.right
    271,
  RawOp.absent
    bounded_4_3
    2045
    2046
]
theorem fact_63_1 : source_63_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_1 := by decide +kernel
theorem bounds_63_1 : raws_63_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t64\t{now}"
      handle.flush
noncomputable def source_64_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2048
noncomputable def raws_64_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      4026,
      4026,
      4026,
      4026,
      4026
    ], rfl⟩,
  RawOp.move
    Dir.right
    2048,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    2049,
  RawOp.move
    Dir.right
    272,
  RawOp.absent
    bounded_4_2
    2050
    2051,
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    2049,
  RawOp.jump
    ⟨#[
      2056,
      2056,
      2056,
      2056,
      2056
    ], rfl⟩,
  RawOp.move
    Dir.right
    2054,
  RawOp.absent
    bounded_4_2
    2053
    2055,
  RawOp.jump
    ⟨#[
      4038,
      4038,
      4038,
      4038,
      4038
    ], rfl⟩,
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2057,
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    2057,
  RawOp.load
    bounded_4_1
    ⟨#[
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩
    ], rfl⟩
    2059,
  RawOp.move
    Dir.left
    2060,
  RawOp.marker
    2058
    2061,
  RawOp.move
    Dir.right
    275,
  RawOp.absent
    bounded_4_1
    2062
    2063,
  RawOp.move
    Dir.left
    276,
  RawOp.marker
    0
    2065,
  RawOp.jump
    ⟨#[
      2070,
      2070,
      2070,
      2070,
      2070
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      4,
      4,
      4,
      4,
      4
    ], rfl⟩,
  RawOp.move
    Dir.left
    2067,
  RawOp.marker
    2068
    2069,
  RawOp.jump
    ⟨#[
      2073,
      2073,
      2073,
      2073,
      2073
    ], rfl⟩,
  RawOp.move
    Dir.left
    2071,
  RawOp.marker
    279
    2072,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2068
    279,
  RawOp.move
    Dir.left
    282,
  RawOp.marker
    2074
    2075,
  RawOp.jump
    ⟨#[
      2079,
      2079,
      2079,
      2079,
      2079
    ], rfl⟩,
  RawOp.move
    Dir.left
    2077,
  RawOp.marker
    1
    2078
]
theorem fact_64_1 : source_64_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_64_1 := by decide +kernel
theorem bounds_64_1 : raws_64_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_63_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_63_1 source_64_1
noncomputable def raws_63_2 : List RawOp := raws_63_1 ++ raws_64_1
theorem fact_63_2 : source_63_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_2 :=
  source_branch 32 source_63_1 source_64_1 raws_63_1 raws_64_1 fact_63_1 fact_64_1
theorem bounds_63_2 : raws_63_2.all (labelsBounded 4042) = true :=
  bounds_append raws_63_1 raws_64_1 bounds_63_1 bounds_64_1
noncomputable def source_65_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2080
noncomputable def raws_65_1 : List RawOp := [
  RawOp.move
    Dir.left
    290,
  RawOp.marker
    3
    2080,
  RawOp.jump
    ⟨#[
      2084,
      2084,
      2084,
      2084,
      2084
    ], rfl⟩,
  RawOp.move
    Dir.left
    2082,
  RawOp.marker
    2
    2083,
  RawOp.jump
    ⟨#[
      2087,
      2087,
      2087,
      2087,
      2087
    ], rfl⟩,
  RawOp.move
    Dir.left
    2085,
  RawOp.marker
    4
    2086,
  RawOp.jump
    ⟨#[
      6,
      6,
      6,
      6,
      6
    ], rfl⟩,
  RawOp.move
    Dir.left
    307,
  RawOp.marker
    2088
    2089,
  RawOp.jump
    ⟨#[
      2093,
      2093,
      2093,
      2093,
      2093
    ], rfl⟩,
  RawOp.move
    Dir.left
    2091,
  RawOp.marker
    296
    2092,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2088
    296,
  RawOp.move
    Dir.left
    299,
  RawOp.marker
    2094
    2095,
  RawOp.jump
    ⟨#[
      2099,
      2099,
      2099,
      2099,
      2099
    ], rfl⟩,
  RawOp.move
    Dir.left
    2097,
  RawOp.marker
    5
    2098,
  RawOp.jump
    ⟨#[
      2103,
      2103,
      2103,
      2103,
      2103
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      9,
      9,
      9,
      9,
      9
    ], rfl⟩,
  RawOp.move
    Dir.left
    2100,
  RawOp.marker
    2101
    2102,
  RawOp.jump
    ⟨#[
      2106,
      2106,
      2106,
      2106,
      2106
    ], rfl⟩,
  RawOp.move
    Dir.left
    2104,
  RawOp.marker
    310
    2105,
  RawOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    2101
    310,
  RawOp.move
    Dir.left
    313,
  RawOp.marker
    2107
    2108,
  RawOp.jump
    ⟨#[
      2112,
      2112,
      2112,
      2112,
      2112
    ], rfl⟩,
  RawOp.move
    Dir.left
    2110
]
theorem fact_65_1 : source_65_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_65_1 := by decide +kernel
theorem bounds_65_1 : raws_65_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_66_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2112
noncomputable def raws_66_1 : List RawOp := [
  RawOp.marker
    6
    2111,
  RawOp.move
    Dir.left
    321,
  RawOp.marker
    8
    2113,
  RawOp.jump
    ⟨#[
      2117,
      2117,
      2117,
      2117,
      2117
    ], rfl⟩,
  RawOp.move
    Dir.left
    2115,
  RawOp.marker
    7
    2116,
  RawOp.jump
    ⟨#[
      2120,
      2120,
      2120,
      2120,
      2120
    ], rfl⟩,
  RawOp.move
    Dir.left
    2118,
  RawOp.marker
    9
    2119,
  RawOp.jump
    ⟨#[
      2124,
      2124,
      2124,
      2124,
      2124
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      11,
      11,
      11,
      11,
      11
    ], rfl⟩,
  RawOp.move
    Dir.left
    2121,
  RawOp.marker
    2122
    2123,
  RawOp.jump
    ⟨#[
      2127,
      2127,
      2127,
      2127,
      2127
    ], rfl⟩,
  RawOp.move
    Dir.left
    2125,
  RawOp.marker
    327
    2126,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2122
    327,
  RawOp.move
    Dir.left
    330,
  RawOp.marker
    2128
    2129,
  RawOp.jump
    ⟨#[
      2133,
      2133,
      2133,
      2133,
      2133
    ], rfl⟩,
  RawOp.move
    Dir.left
    2131,
  RawOp.marker
    10
    2132,
  RawOp.jump
    ⟨#[
      12,
      12,
      12,
      12,
      12
    ], rfl⟩,
  RawOp.move
    Dir.left
    346,
  RawOp.marker
    2134
    2135,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    2134
    2122,
  RawOp.move
    Dir.left
    338,
  RawOp.marker
    2137
    2138,
  RawOp.jump
    ⟨#[
      2142,
      2142,
      2142,
      2142,
      2142
    ], rfl⟩,
  RawOp.move
    Dir.left
    2140,
  RawOp.marker
    11
    2141,
  RawOp.jump
    ⟨#[
      2146,
      2146,
      2146,
      2146,
      2146
    ], rfl⟩
]
theorem fact_66_1 : source_66_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_66_1 := by decide +kernel
theorem bounds_66_1 : raws_66_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_65_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_65_1 source_66_1
noncomputable def raws_65_2 : List RawOp := raws_65_1 ++ raws_66_1
theorem fact_65_2 : source_65_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_65_2 :=
  source_branch 32 source_65_1 source_66_1 raws_65_1 raws_66_1 fact_65_1 fact_66_1
theorem bounds_65_2 : raws_65_2.all (labelsBounded 4042) = true :=
  bounds_append raws_65_1 raws_66_1 bounds_65_1 bounds_66_1
noncomputable def source_63_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_63_2 source_65_2
noncomputable def raws_63_4 : List RawOp := raws_63_2 ++ raws_65_2
theorem fact_63_4 : source_63_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_4 :=
  source_branch 64 source_63_2 source_65_2 raws_63_2 raws_65_2 fact_63_2 fact_65_2
theorem bounds_63_4 : raws_63_4.all (labelsBounded 4042) = true :=
  bounds_append raws_63_2 raws_65_2 bounds_63_2 bounds_65_2
noncomputable def source_67_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2144
noncomputable def raws_67_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      15,
      15,
      15,
      15,
      15
    ], rfl⟩,
  RawOp.move
    Dir.left
    2143,
  RawOp.marker
    2144
    2145,
  RawOp.jump
    ⟨#[
      2149,
      2149,
      2149,
      2149,
      2149
    ], rfl⟩,
  RawOp.move
    Dir.left
    2147,
  RawOp.marker
    349
    2148,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2144
    349,
  RawOp.move
    Dir.left
    352,
  RawOp.marker
    2150
    2151,
  RawOp.jump
    ⟨#[
      2155,
      2155,
      2155,
      2155,
      2155
    ], rfl⟩,
  RawOp.move
    Dir.left
    2153,
  RawOp.marker
    12
    2154,
  RawOp.move
    Dir.left
    360,
  RawOp.marker
    14
    2156,
  RawOp.jump
    ⟨#[
      2160,
      2160,
      2160,
      2160,
      2160
    ], rfl⟩,
  RawOp.move
    Dir.left
    2158,
  RawOp.marker
    13
    2159,
  RawOp.jump
    ⟨#[
      2163,
      2163,
      2163,
      2163,
      2163
    ], rfl⟩,
  RawOp.move
    Dir.left
    2161,
  RawOp.marker
    15
    2162,
  RawOp.jump
    ⟨#[
      2167,
      2167,
      2167,
      2167,
      2167
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      19,
      19,
      19,
      19,
      19
    ], rfl⟩,
  RawOp.move
    Dir.left
    2164,
  RawOp.marker
    2165
    2166,
  RawOp.jump
    ⟨#[
      2170,
      2170,
      2170,
      2170,
      2170
    ], rfl⟩,
  RawOp.move
    Dir.left
    2168,
  RawOp.marker
    366
    2169,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2165
    366,
  RawOp.move
    Dir.left
    369,
  RawOp.marker
    2171
    2172,
  RawOp.jump
    ⟨#[
      2176,
      2176,
      2176,
      2176,
      2176
    ], rfl⟩,
  RawOp.move
    Dir.left
    2174
]
theorem fact_67_1 : source_67_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_67_1 := by decide +kernel
theorem bounds_67_1 : raws_67_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_68_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2176
noncomputable def raws_68_1 : List RawOp := [
  RawOp.marker
    16
    2175,
  RawOp.move
    Dir.left
    377,
  RawOp.marker
    18
    2177,
  RawOp.jump
    ⟨#[
      2181,
      2181,
      2181,
      2181,
      2181
    ], rfl⟩,
  RawOp.move
    Dir.left
    2179,
  RawOp.marker
    17
    2180,
  RawOp.jump
    ⟨#[
      2184,
      2184,
      2184,
      2184,
      2184
    ], rfl⟩,
  RawOp.move
    Dir.left
    2182,
  RawOp.marker
    19
    2183,
  RawOp.jump
    ⟨#[
      2187,
      2187,
      2187,
      2187,
      2187
    ], rfl⟩,
  RawOp.move
    Dir.left
    2185,
  RawOp.marker
    20
    2186,
  RawOp.move
    Dir.left
    382,
  RawOp.marker
    22
    2188,
  RawOp.jump
    ⟨#[
      2192,
      2192,
      2192,
      2192,
      2192
    ], rfl⟩,
  RawOp.move
    Dir.left
    2190,
  RawOp.marker
    21
    2191,
  RawOp.jump
    ⟨#[
      2195,
      2195,
      2195,
      2195,
      2195
    ], rfl⟩,
  RawOp.move
    Dir.left
    2193,
  RawOp.marker
    23
    2194,
  RawOp.move
    Dir.left
    387,
  RawOp.marker
    24
    2196,
  RawOp.jump
    ⟨#[
      2200,
      2200,
      2200,
      2200,
      2200
    ], rfl⟩,
  RawOp.move
    Dir.left
    2198,
  RawOp.marker
    390
    2199,
  RawOp.jump
    ⟨#[
      2204,
      2204,
      2204,
      2204,
      2204
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      26,
      26,
      26,
      26,
      26
    ], rfl⟩,
  RawOp.move
    Dir.left
    2201,
  RawOp.marker
    2202
    2203,
  RawOp.jump
    ⟨#[
      27,
      27,
      27,
      27,
      27
    ], rfl⟩,
  RawOp.move
    Dir.left
    393,
  RawOp.marker
    2205
    2206
]
theorem fact_68_1 : source_68_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_68_1 := by decide +kernel
theorem bounds_68_1 : raws_68_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_67_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_67_1 source_68_1
noncomputable def raws_67_2 : List RawOp := raws_67_1 ++ raws_68_1
theorem fact_67_2 : source_67_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_67_2 :=
  source_branch 32 source_67_1 source_68_1 raws_67_1 raws_68_1 fact_67_1 fact_68_1
theorem bounds_67_2 : raws_67_2.all (labelsBounded 4042) = true :=
  bounds_append raws_67_1 raws_68_1 bounds_67_1 bounds_68_1
noncomputable def source_69_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2208
noncomputable def raws_69_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2210,
      2210,
      2210,
      2210,
      2210
    ], rfl⟩,
  RawOp.move
    Dir.left
    2208,
  RawOp.marker
    396
    2209,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2205
    396,
  RawOp.move
    Dir.left
    399,
  RawOp.marker
    2211
    2212,
  RawOp.jump
    ⟨#[
      2216,
      2216,
      2216,
      2216,
      2216
    ], rfl⟩,
  RawOp.move
    Dir.left
    2214,
  RawOp.marker
    403
    2215,
  RawOp.jump
    ⟨#[
      2220,
      2220,
      2220,
      2220,
      2220
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2202
    403,
  RawOp.move
    Dir.left
    2217,
  RawOp.marker
    2218
    2219,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    390
    2218,
  RawOp.move
    Dir.left
    406,
  RawOp.marker
    2221
    2222,
  RawOp.jump
    ⟨#[
      2226,
      2226,
      2226,
      2226,
      2226
    ], rfl⟩,
  RawOp.move
    Dir.left
    2224,
  RawOp.marker
    25
    2225,
  RawOp.move
    Dir.left
    519,
  RawOp.marker
    26
    2227,
  RawOp.jump
    ⟨#[
      28,
      28,
      28,
      28,
      28
    ], rfl⟩,
  RawOp.move
    Dir.left
    426,
  RawOp.marker
    2229
    2230,
  RawOp.jump
    ⟨#[
      2234,
      2234,
      2234,
      2234,
      2234
    ], rfl⟩,
  RawOp.move
    Dir.left
    2232,
  RawOp.marker
    415
    2233,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2229
    415,
  RawOp.move
    Dir.left
    418,
  RawOp.marker
    2235
    2236,
  RawOp.jump
    ⟨#[
      2240,
      2240,
      2240,
      2240,
      2240
    ], rfl⟩,
  RawOp.move
    Dir.left
    2238
]
theorem fact_69_1 : source_69_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_69_1 := by decide +kernel
theorem bounds_69_1 : raws_69_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_70_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2240
noncomputable def raws_70_1 : List RawOp := [
  RawOp.marker
    27
    2239,
  RawOp.jump
    ⟨#[
      2244,
      2244,
      2244,
      2244,
      2244
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      31,
      31,
      31,
      31,
      31
    ], rfl⟩,
  RawOp.move
    Dir.left
    2241,
  RawOp.marker
    2242
    2243,
  RawOp.jump
    ⟨#[
      2247,
      2247,
      2247,
      2247,
      2247
    ], rfl⟩,
  RawOp.move
    Dir.left
    2245,
  RawOp.marker
    429
    2246,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2242
    429,
  RawOp.move
    Dir.left
    432,
  RawOp.marker
    2248
    2249,
  RawOp.jump
    ⟨#[
      2253,
      2253,
      2253,
      2253,
      2253
    ], rfl⟩,
  RawOp.move
    Dir.left
    2251,
  RawOp.marker
    28
    2252,
  RawOp.move
    Dir.left
    440,
  RawOp.marker
    30
    2254,
  RawOp.jump
    ⟨#[
      2258,
      2258,
      2258,
      2258,
      2258
    ], rfl⟩,
  RawOp.move
    Dir.left
    2256,
  RawOp.marker
    29
    2257,
  RawOp.jump
    ⟨#[
      2261,
      2261,
      2261,
      2261,
      2261
    ], rfl⟩,
  RawOp.move
    Dir.left
    2259,
  RawOp.marker
    31
    2260,
  RawOp.jump
    ⟨#[
      33,
      33,
      33,
      33,
      33
    ], rfl⟩,
  RawOp.move
    Dir.left
    457,
  RawOp.marker
    2262
    2263,
  RawOp.jump
    ⟨#[
      2267,
      2267,
      2267,
      2267,
      2267
    ], rfl⟩,
  RawOp.move
    Dir.left
    2265,
  RawOp.marker
    446
    2266,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2262
    446,
  RawOp.move
    Dir.left
    449,
  RawOp.marker
    2268
    2269,
  RawOp.jump
    ⟨#[
      2273,
      2273,
      2273,
      2273,
      2273
    ], rfl⟩
]
theorem fact_70_1 : source_70_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_70_1 := by decide +kernel
theorem bounds_70_1 : raws_70_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_69_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_69_1 source_70_1
noncomputable def raws_69_2 : List RawOp := raws_69_1 ++ raws_70_1
theorem fact_69_2 : source_69_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_69_2 :=
  source_branch 32 source_69_1 source_70_1 raws_69_1 raws_70_1 fact_69_1 fact_70_1
theorem bounds_69_2 : raws_69_2.all (labelsBounded 4042) = true :=
  bounds_append raws_69_1 raws_70_1 bounds_69_1 bounds_70_1
noncomputable def source_67_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_67_2 source_69_2
noncomputable def raws_67_4 : List RawOp := raws_67_2 ++ raws_69_2
theorem fact_67_4 : source_67_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_67_4 :=
  source_branch 64 source_67_2 source_69_2 raws_67_2 raws_69_2 fact_67_2 fact_69_2
theorem bounds_67_4 : raws_67_4.all (labelsBounded 4042) = true :=
  bounds_append raws_67_2 raws_69_2 bounds_67_2 bounds_69_2
noncomputable def source_63_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_63_4 source_67_4
noncomputable def raws_63_8 : List RawOp := raws_63_4 ++ raws_67_4
theorem fact_63_8 : source_63_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_8 :=
  source_branch 128 source_63_4 source_67_4 raws_63_4 raws_67_4 fact_63_4 fact_67_4
theorem bounds_63_8 : raws_63_8.all (labelsBounded 4042) = true :=
  bounds_append raws_63_4 raws_67_4 bounds_63_4 bounds_67_4
noncomputable def source_71_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2272
noncomputable def raws_71_1 : List RawOp := [
  RawOp.move
    Dir.left
    2271,
  RawOp.marker
    32
    2272,
  RawOp.jump
    ⟨#[
      2277,
      2277,
      2277,
      2277,
      2277
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      36,
      36,
      36,
      36,
      36
    ], rfl⟩,
  RawOp.move
    Dir.left
    2274,
  RawOp.marker
    2275
    2276,
  RawOp.jump
    ⟨#[
      2280,
      2280,
      2280,
      2280,
      2280
    ], rfl⟩,
  RawOp.move
    Dir.left
    2278,
  RawOp.marker
    460
    2279,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2275
    460,
  RawOp.move
    Dir.left
    463,
  RawOp.marker
    2281
    2282,
  RawOp.jump
    ⟨#[
      2286,
      2286,
      2286,
      2286,
      2286
    ], rfl⟩,
  RawOp.move
    Dir.left
    2284,
  RawOp.marker
    33
    2285,
  RawOp.move
    Dir.left
    471,
  RawOp.marker
    35
    2287,
  RawOp.jump
    ⟨#[
      2291,
      2291,
      2291,
      2291,
      2291
    ], rfl⟩,
  RawOp.move
    Dir.left
    2289,
  RawOp.marker
    34
    2290,
  RawOp.jump
    ⟨#[
      2294,
      2294,
      2294,
      2294,
      2294
    ], rfl⟩,
  RawOp.move
    Dir.left
    2292,
  RawOp.marker
    36
    2293,
  RawOp.jump
    ⟨#[
      38,
      38,
      38,
      38,
      38
    ], rfl⟩,
  RawOp.move
    Dir.left
    488,
  RawOp.marker
    2295
    2296,
  RawOp.jump
    ⟨#[
      2300,
      2300,
      2300,
      2300,
      2300
    ], rfl⟩,
  RawOp.move
    Dir.left
    2298,
  RawOp.marker
    477
    2299,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2295
    477,
  RawOp.move
    Dir.left
    480,
  RawOp.marker
    2301
    2302
]
theorem fact_71_1 : source_71_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_71_1 := by decide +kernel
theorem bounds_71_1 : raws_71_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t72\t{now}"
      handle.flush
noncomputable def source_72_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2304
noncomputable def raws_72_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2306,
      2306,
      2306,
      2306,
      2306
    ], rfl⟩,
  RawOp.move
    Dir.left
    2304,
  RawOp.marker
    37
    2305,
  RawOp.jump
    ⟨#[
      2310,
      2310,
      2310,
      2310,
      2310
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      41,
      41,
      41,
      41,
      41
    ], rfl⟩,
  RawOp.move
    Dir.left
    2307,
  RawOp.marker
    2308
    2309,
  RawOp.jump
    ⟨#[
      2313,
      2313,
      2313,
      2313,
      2313
    ], rfl⟩,
  RawOp.move
    Dir.left
    2311,
  RawOp.marker
    491
    2312,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2308
    491,
  RawOp.move
    Dir.left
    494,
  RawOp.marker
    2314
    2315,
  RawOp.jump
    ⟨#[
      2319,
      2319,
      2319,
      2319,
      2319
    ], rfl⟩,
  RawOp.move
    Dir.left
    2317,
  RawOp.marker
    38
    2318,
  RawOp.move
    Dir.left
    502,
  RawOp.marker
    40
    2320,
  RawOp.jump
    ⟨#[
      2324,
      2324,
      2324,
      2324,
      2324
    ], rfl⟩,
  RawOp.move
    Dir.left
    2322,
  RawOp.marker
    39
    2323,
  RawOp.jump
    ⟨#[
      2327,
      2327,
      2327,
      2327,
      2327
    ], rfl⟩,
  RawOp.move
    Dir.left
    2325,
  RawOp.marker
    41
    2326,
  RawOp.jump
    ⟨#[
      2330,
      2330,
      2330,
      2330,
      2330
    ], rfl⟩,
  RawOp.move
    Dir.left
    2328,
  RawOp.marker
    508
    2329,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    22
    508,
  RawOp.move
    Dir.left
    511,
  RawOp.marker
    2331
    2332,
  RawOp.jump
    ⟨#[
      2336,
      2336,
      2336,
      2336,
      2336
    ], rfl⟩,
  RawOp.move
    Dir.left
    2334
]
theorem fact_72_1 : source_72_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_72_1 := by decide +kernel
theorem bounds_72_1 : raws_72_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_71_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_71_1 source_72_1
noncomputable def raws_71_2 : List RawOp := raws_71_1 ++ raws_72_1
theorem fact_71_2 : source_71_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_71_2 :=
  source_branch 32 source_71_1 source_72_1 raws_71_1 raws_72_1 fact_71_1 fact_72_1
theorem bounds_71_2 : raws_71_2.all (labelsBounded 4042) = true :=
  bounds_append raws_71_1 raws_72_1 bounds_71_1 bounds_72_1
noncomputable def source_73_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2336
noncomputable def raws_73_1 : List RawOp := [
  RawOp.marker
    42
    2335,
  RawOp.jump
    ⟨#[
      2340,
      2340,
      2340,
      2340,
      2340
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      46,
      46,
      46,
      46,
      46
    ], rfl⟩,
  RawOp.move
    Dir.left
    2337,
  RawOp.marker
    2338
    2339,
  RawOp.jump
    ⟨#[
      2343,
      2343,
      2343,
      2343,
      2343
    ], rfl⟩,
  RawOp.move
    Dir.left
    2341,
  RawOp.marker
    522
    2342,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2338
    522,
  RawOp.move
    Dir.left
    525,
  RawOp.marker
    2344
    2345,
  RawOp.jump
    ⟨#[
      2349,
      2349,
      2349,
      2349,
      2349
    ], rfl⟩,
  RawOp.move
    Dir.left
    2347,
  RawOp.marker
    43
    2348,
  RawOp.move
    Dir.left
    533,
  RawOp.marker
    45
    2350,
  RawOp.jump
    ⟨#[
      2354,
      2354,
      2354,
      2354,
      2354
    ], rfl⟩,
  RawOp.move
    Dir.left
    2352,
  RawOp.marker
    44
    2353,
  RawOp.jump
    ⟨#[
      2357,
      2357,
      2357,
      2357,
      2357
    ], rfl⟩,
  RawOp.move
    Dir.left
    2355,
  RawOp.marker
    46
    2356,
  RawOp.move
    Dir.left
    538,
  RawOp.marker
    48
    2358,
  RawOp.jump
    ⟨#[
      2362,
      2362,
      2362,
      2362,
      2362
    ], rfl⟩,
  RawOp.move
    Dir.left
    2360,
  RawOp.marker
    47
    2361,
  RawOp.jump
    ⟨#[
      2365,
      2365,
      2365,
      2365,
      2365
    ], rfl⟩,
  RawOp.move
    Dir.left
    2363,
  RawOp.marker
    49
    2364,
  RawOp.move
    Dir.left
    547,
  RawOp.marker
    544
    2366
]
theorem fact_73_1 : source_73_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_73_1 := by decide +kernel
theorem bounds_73_1 : raws_73_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_74_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2368
noncomputable def raws_74_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2370,
      2370,
      2370,
      2370,
      2370
    ], rfl⟩,
  RawOp.move
    Dir.left
    2368,
  RawOp.marker
    550
    2369,
  RawOp.jump
    ⟨#[
      51,
      51,
      51,
      51,
      51
    ], rfl⟩,
  RawOp.move
    Dir.left
    561,
  RawOp.marker
    2371
    2372,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    550
    2371,
  RawOp.move
    Dir.left
    553,
  RawOp.marker
    2374
    2375,
  RawOp.jump
    ⟨#[
      2379,
      2379,
      2379,
      2379,
      2379
    ], rfl⟩,
  RawOp.move
    Dir.left
    2377,
  RawOp.marker
    50
    2378,
  RawOp.jump
    ⟨#[
      2383,
      2383,
      2383,
      2383,
      2383
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      54,
      54,
      54,
      54,
      54
    ], rfl⟩,
  RawOp.move
    Dir.left
    2380,
  RawOp.marker
    2381
    2382,
  RawOp.jump
    ⟨#[
      2386,
      2386,
      2386,
      2386,
      2386
    ], rfl⟩,
  RawOp.move
    Dir.left
    2384,
  RawOp.marker
    564
    2385,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2381
    564,
  RawOp.move
    Dir.left
    567,
  RawOp.marker
    2387
    2388,
  RawOp.jump
    ⟨#[
      2392,
      2392,
      2392,
      2392,
      2392
    ], rfl⟩,
  RawOp.move
    Dir.left
    2390,
  RawOp.marker
    51
    2391,
  RawOp.move
    Dir.left
    575,
  RawOp.marker
    53
    2393,
  RawOp.jump
    ⟨#[
      2397,
      2397,
      2397,
      2397,
      2397
    ], rfl⟩,
  RawOp.move
    Dir.left
    2395,
  RawOp.marker
    52
    2396,
  RawOp.jump
    ⟨#[
      2400,
      2400,
      2400,
      2400,
      2400
    ], rfl⟩,
  RawOp.move
    Dir.left
    2398
]
theorem fact_74_1 : source_74_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_74_1 := by decide +kernel
theorem bounds_74_1 : raws_74_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_73_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_73_1 source_74_1
noncomputable def raws_73_2 : List RawOp := raws_73_1 ++ raws_74_1
theorem fact_73_2 : source_73_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_73_2 :=
  source_branch 32 source_73_1 source_74_1 raws_73_1 raws_74_1 fact_73_1 fact_74_1
theorem bounds_73_2 : raws_73_2.all (labelsBounded 4042) = true :=
  bounds_append raws_73_1 raws_74_1 bounds_73_1 bounds_74_1
noncomputable def source_71_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_71_2 source_73_2
noncomputable def raws_71_4 : List RawOp := raws_71_2 ++ raws_73_2
theorem fact_71_4 : source_71_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_71_4 :=
  source_branch 64 source_71_2 source_73_2 raws_71_2 raws_73_2 fact_71_2 fact_73_2
theorem bounds_71_4 : raws_71_4.all (labelsBounded 4042) = true :=
  bounds_append raws_71_2 raws_73_2 bounds_71_2 bounds_73_2
noncomputable def source_75_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2400
noncomputable def raws_75_1 : List RawOp := [
  RawOp.marker
    54
    2399,
  RawOp.move
    Dir.left
    580,
  RawOp.marker
    56
    2401,
  RawOp.jump
    ⟨#[
      2405,
      2405,
      2405,
      2405,
      2405
    ], rfl⟩,
  RawOp.move
    Dir.left
    2403,
  RawOp.marker
    55
    2404,
  RawOp.jump
    ⟨#[
      2408,
      2408,
      2408,
      2408,
      2408
    ], rfl⟩,
  RawOp.move
    Dir.left
    2406,
  RawOp.marker
    57
    2407,
  RawOp.move
    Dir.left
    589,
  RawOp.marker
    586
    2409,
  RawOp.jump
    ⟨#[
      2413,
      2413,
      2413,
      2413,
      2413
    ], rfl⟩,
  RawOp.move
    Dir.left
    2411,
  RawOp.marker
    592
    2412,
  RawOp.jump
    ⟨#[
      59,
      59,
      59,
      59,
      59
    ], rfl⟩,
  RawOp.move
    Dir.left
    603,
  RawOp.marker
    2414
    2415,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    592
    2414,
  RawOp.move
    Dir.left
    595,
  RawOp.marker
    2417
    2418,
  RawOp.jump
    ⟨#[
      2422,
      2422,
      2422,
      2422,
      2422
    ], rfl⟩,
  RawOp.move
    Dir.left
    2420,
  RawOp.marker
    58
    2421,
  RawOp.jump
    ⟨#[
      2426,
      2426,
      2426,
      2426,
      2426
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      62,
      62,
      62,
      62,
      62
    ], rfl⟩,
  RawOp.move
    Dir.left
    2423,
  RawOp.marker
    2424
    2425,
  RawOp.jump
    ⟨#[
      2429,
      2429,
      2429,
      2429,
      2429
    ], rfl⟩,
  RawOp.move
    Dir.left
    2427,
  RawOp.marker
    606
    2428,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2424
    606,
  RawOp.move
    Dir.left
    609
]
theorem fact_75_1 : source_75_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_75_1 := by decide +kernel
theorem bounds_75_1 : raws_75_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_76_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2432
noncomputable def raws_76_1 : List RawOp := [
  RawOp.marker
    2430
    2431,
  RawOp.jump
    ⟨#[
      2435,
      2435,
      2435,
      2435,
      2435
    ], rfl⟩,
  RawOp.move
    Dir.left
    2433,
  RawOp.marker
    59
    2434,
  RawOp.move
    Dir.left
    617,
  RawOp.marker
    61
    2436,
  RawOp.jump
    ⟨#[
      2440,
      2440,
      2440,
      2440,
      2440
    ], rfl⟩,
  RawOp.move
    Dir.left
    2438,
  RawOp.marker
    60
    2439,
  RawOp.jump
    ⟨#[
      2443,
      2443,
      2443,
      2443,
      2443
    ], rfl⟩,
  RawOp.move
    Dir.left
    2441,
  RawOp.marker
    62
    2442,
  RawOp.move
    Dir.left
    622,
  RawOp.marker
    64
    2444,
  RawOp.jump
    ⟨#[
      2448,
      2448,
      2448,
      2448,
      2448
    ], rfl⟩,
  RawOp.move
    Dir.left
    2446,
  RawOp.marker
    63
    2447,
  RawOp.jump
    ⟨#[
      2451,
      2451,
      2451,
      2451,
      2451
    ], rfl⟩,
  RawOp.move
    Dir.left
    2449,
  RawOp.marker
    65
    2450,
  RawOp.move
    Dir.left
    631,
  RawOp.marker
    628
    2452,
  RawOp.jump
    ⟨#[
      2456,
      2456,
      2456,
      2456,
      2456
    ], rfl⟩,
  RawOp.move
    Dir.left
    2454,
  RawOp.marker
    634
    2455,
  RawOp.jump
    ⟨#[
      2460,
      2460,
      2460,
      2460,
      2460
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      67,
      67,
      67,
      67,
      67
    ], rfl⟩,
  RawOp.move
    Dir.left
    2457,
  RawOp.marker
    2458
    2459,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    634
    2458,
  RawOp.move
    Dir.left
    637,
  RawOp.marker
    2461
    2462
]
theorem fact_76_1 : source_76_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_76_1 := by decide +kernel
theorem bounds_76_1 : raws_76_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_75_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_75_1 source_76_1
noncomputable def raws_75_2 : List RawOp := raws_75_1 ++ raws_76_1
theorem fact_75_2 : source_75_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_75_2 :=
  source_branch 32 source_75_1 source_76_1 raws_75_1 raws_76_1 fact_75_1 fact_76_1
theorem bounds_75_2 : raws_75_2.all (labelsBounded 4042) = true :=
  bounds_append raws_75_1 raws_76_1 bounds_75_1 bounds_76_1
noncomputable def source_77_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2464
noncomputable def raws_77_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2466,
      2466,
      2466,
      2466,
      2466
    ], rfl⟩,
  RawOp.move
    Dir.left
    2464,
  RawOp.marker
    66
    2465,
  RawOp.move
    Dir.left
    645,
  RawOp.marker
    67
    2467,
  RawOp.jump
    ⟨#[
      2472,
      2472,
      2472,
      2472,
      2472
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      69,
      69,
      69,
      69,
      69
    ], rfl⟩,
  RawOp.move
    Dir.left
    2469,
  RawOp.marker
    2470
    2471,
  RawOp.jump
    ⟨#[
      2475,
      2475,
      2475,
      2475,
      2475
    ], rfl⟩,
  RawOp.move
    Dir.left
    2473,
  RawOp.marker
    648
    2474,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    2470
    648,
  RawOp.move
    Dir.left
    651,
  RawOp.marker
    2476
    2477,
  RawOp.jump
    ⟨#[
      2481,
      2481,
      2481,
      2481,
      2481
    ], rfl⟩,
  RawOp.move
    Dir.left
    2479,
  RawOp.marker
    68
    2480,
  RawOp.jump
    ⟨#[
      2484,
      2484,
      2484,
      2484,
      2484
    ], rfl⟩,
  RawOp.move
    Dir.left
    2482,
  RawOp.marker
    69
    2483,
  RawOp.move
    Dir.left
    659,
  RawOp.marker
    71
    2485,
  RawOp.jump
    ⟨#[
      2489,
      2489,
      2489,
      2489,
      2489
    ], rfl⟩,
  RawOp.move
    Dir.left
    2487,
  RawOp.marker
    70
    2488,
  RawOp.jump
    ⟨#[
      2492,
      2492,
      2492,
      2492,
      2492
    ], rfl⟩,
  RawOp.move
    Dir.left
    2490,
  RawOp.marker
    72
    2491,
  RawOp.jump
    ⟨#[
      2496,
      2496,
      2496,
      2496,
      2496
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      76,
      76,
      76,
      76,
      76
    ], rfl⟩,
  RawOp.move
    Dir.left
    2493
]
theorem fact_77_1 : source_77_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_77_1 := by decide +kernel
theorem bounds_77_1 : raws_77_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_78_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2496
noncomputable def raws_78_1 : List RawOp := [
  RawOp.marker
    2494
    2495,
  RawOp.jump
    ⟨#[
      2499,
      2499,
      2499,
      2499,
      2499
    ], rfl⟩,
  RawOp.move
    Dir.left
    2497,
  RawOp.marker
    665
    2498,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2494
    665,
  RawOp.move
    Dir.left
    668,
  RawOp.marker
    2500
    2501,
  RawOp.jump
    ⟨#[
      2505,
      2505,
      2505,
      2505,
      2505
    ], rfl⟩,
  RawOp.move
    Dir.left
    2503,
  RawOp.marker
    73
    2504,
  RawOp.move
    Dir.left
    676,
  RawOp.marker
    75
    2506,
  RawOp.jump
    ⟨#[
      2510,
      2510,
      2510,
      2510,
      2510
    ], rfl⟩,
  RawOp.move
    Dir.left
    2508,
  RawOp.marker
    74
    2509,
  RawOp.jump
    ⟨#[
      2513,
      2513,
      2513,
      2513,
      2513
    ], rfl⟩,
  RawOp.move
    Dir.left
    2511,
  RawOp.marker
    76
    2512,
  RawOp.jump
    ⟨#[
      2516,
      2516,
      2516,
      2516,
      2516
    ], rfl⟩,
  RawOp.move
    Dir.left
    2514,
  RawOp.marker
    682
    2515,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2458
    682,
  RawOp.move
    Dir.left
    685,
  RawOp.marker
    2517
    2518,
  RawOp.jump
    ⟨#[
      2522,
      2522,
      2522,
      2522,
      2522
    ], rfl⟩,
  RawOp.move
    Dir.left
    2520,
  RawOp.marker
    77
    2521,
  RawOp.jump
    ⟨#[
      2526,
      2526,
      2526,
      2526,
      2526
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      81,
      81,
      81,
      81,
      81
    ], rfl⟩,
  RawOp.move
    Dir.left
    2523,
  RawOp.marker
    2524
    2525,
  RawOp.jump
    ⟨#[
      78,
      78,
      78,
      78,
      78
    ], rfl⟩
]
theorem fact_78_1 : source_78_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_78_1 := by decide +kernel
theorem bounds_78_1 : raws_78_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_77_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_77_1 source_78_1
noncomputable def raws_77_2 : List RawOp := raws_77_1 ++ raws_78_1
theorem fact_77_2 : source_77_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_77_2 :=
  source_branch 32 source_77_1 source_78_1 raws_77_1 raws_78_1 fact_77_1 fact_78_1
theorem bounds_77_2 : raws_77_2.all (labelsBounded 4042) = true :=
  bounds_append raws_77_1 raws_78_1 bounds_77_1 bounds_78_1
noncomputable def source_75_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_75_2 source_77_2
noncomputable def raws_75_4 : List RawOp := raws_75_2 ++ raws_77_2
theorem fact_75_4 : source_75_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_75_4 :=
  source_branch 64 source_75_2 source_77_2 raws_75_2 raws_77_2 fact_75_2 fact_77_2
theorem bounds_75_4 : raws_75_4.all (labelsBounded 4042) = true :=
  bounds_append raws_75_2 raws_77_2 bounds_75_2 bounds_77_2
noncomputable def source_71_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_71_4 source_75_4
noncomputable def raws_71_8 : List RawOp := raws_71_4 ++ raws_75_4
theorem fact_71_8 : source_71_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_71_8 :=
  source_branch 128 source_71_4 source_75_4 raws_71_4 raws_75_4 fact_71_4 fact_75_4
theorem bounds_71_8 : raws_71_8.all (labelsBounded 4042) = true :=
  bounds_append raws_71_4 raws_75_4 bounds_71_4 bounds_75_4
noncomputable def source_63_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_63_8 source_71_8
noncomputable def raws_63_16 : List RawOp := raws_63_8 ++ raws_71_8
theorem fact_63_16 : source_63_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_16 :=
  source_branch 256 source_63_8 source_71_8 raws_63_8 raws_71_8 fact_63_8 fact_71_8
theorem bounds_63_16 : raws_63_16.all (labelsBounded 4042) = true :=
  bounds_append raws_63_8 raws_71_8 bounds_63_8 bounds_71_8
noncomputable def source_79_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2528
noncomputable def raws_79_1 : List RawOp := [
  RawOp.move
    Dir.left
    693,
  RawOp.marker
    2527
    2528,
  RawOp.jump
    ⟨#[
      2532,
      2532,
      2532,
      2532,
      2532
    ], rfl⟩,
  RawOp.move
    Dir.left
    2530,
  RawOp.marker
    696
    2531,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2524
    696,
  RawOp.move
    Dir.left
    699,
  RawOp.marker
    2533
    2534,
  RawOp.jump
    ⟨#[
      2538,
      2538,
      2538,
      2538,
      2538
    ], rfl⟩,
  RawOp.move
    Dir.left
    2536,
  RawOp.marker
    78
    2537,
  RawOp.move
    Dir.left
    707,
  RawOp.marker
    80
    2539,
  RawOp.jump
    ⟨#[
      2543,
      2543,
      2543,
      2543,
      2543
    ], rfl⟩,
  RawOp.move
    Dir.left
    2541,
  RawOp.marker
    79
    2542,
  RawOp.jump
    ⟨#[
      2546,
      2546,
      2546,
      2546,
      2546
    ], rfl⟩,
  RawOp.move
    Dir.left
    2544,
  RawOp.marker
    81
    2545,
  RawOp.jump
    ⟨#[
      83,
      83,
      83,
      83,
      83
    ], rfl⟩,
  RawOp.move
    Dir.left
    724,
  RawOp.marker
    2547
    2548,
  RawOp.jump
    ⟨#[
      2552,
      2552,
      2552,
      2552,
      2552
    ], rfl⟩,
  RawOp.move
    Dir.left
    2550,
  RawOp.marker
    713
    2551,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2547
    713,
  RawOp.move
    Dir.left
    716,
  RawOp.marker
    2553
    2554,
  RawOp.jump
    ⟨#[
      2558,
      2558,
      2558,
      2558,
      2558
    ], rfl⟩,
  RawOp.move
    Dir.left
    2556,
  RawOp.marker
    82
    2557,
  RawOp.jump
    ⟨#[
      2562,
      2562,
      2562,
      2562,
      2562
    ], rfl⟩
]
theorem fact_79_1 : source_79_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_79_1 := by decide +kernel
theorem bounds_79_1 : raws_79_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t80\t{now}"
      handle.flush
noncomputable def source_80_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2560
noncomputable def raws_80_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      86,
      86,
      86,
      86,
      86
    ], rfl⟩,
  RawOp.move
    Dir.left
    2559,
  RawOp.marker
    2560
    2561,
  RawOp.jump
    ⟨#[
      2565,
      2565,
      2565,
      2565,
      2565
    ], rfl⟩,
  RawOp.move
    Dir.left
    2563,
  RawOp.marker
    727
    2564,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2560
    727,
  RawOp.move
    Dir.left
    730,
  RawOp.marker
    2566
    2567,
  RawOp.jump
    ⟨#[
      2571,
      2571,
      2571,
      2571,
      2571
    ], rfl⟩,
  RawOp.move
    Dir.left
    2569,
  RawOp.marker
    83
    2570,
  RawOp.move
    Dir.left
    738,
  RawOp.marker
    85
    2572,
  RawOp.jump
    ⟨#[
      2576,
      2576,
      2576,
      2576,
      2576
    ], rfl⟩,
  RawOp.move
    Dir.left
    2574,
  RawOp.marker
    84
    2575,
  RawOp.jump
    ⟨#[
      2579,
      2579,
      2579,
      2579,
      2579
    ], rfl⟩,
  RawOp.move
    Dir.left
    2577,
  RawOp.marker
    86
    2578,
  RawOp.jump
    ⟨#[
      2583,
      2583,
      2583,
      2583,
      2583
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      88,
      88,
      88,
      88,
      88
    ], rfl⟩,
  RawOp.move
    Dir.left
    2580,
  RawOp.marker
    2581
    2582,
  RawOp.jump
    ⟨#[
      2586,
      2586,
      2586,
      2586,
      2586
    ], rfl⟩,
  RawOp.move
    Dir.left
    2584,
  RawOp.marker
    744
    2585,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2581
    744,
  RawOp.move
    Dir.left
    747,
  RawOp.marker
    2587
    2588,
  RawOp.jump
    ⟨#[
      2592,
      2592,
      2592,
      2592,
      2592
    ], rfl⟩,
  RawOp.move
    Dir.left
    2590
]
theorem fact_80_1 : source_80_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_80_1 := by decide +kernel
theorem bounds_80_1 : raws_80_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_79_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_79_1 source_80_1
noncomputable def raws_79_2 : List RawOp := raws_79_1 ++ raws_80_1
theorem fact_79_2 : source_79_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_79_2 :=
  source_branch 32 source_79_1 source_80_1 raws_79_1 raws_80_1 fact_79_1 fact_80_1
theorem bounds_79_2 : raws_79_2.all (labelsBounded 4042) = true :=
  bounds_append raws_79_1 raws_80_1 bounds_79_1 bounds_80_1
noncomputable def source_81_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2592
noncomputable def raws_81_1 : List RawOp := [
  RawOp.marker
    87
    2591,
  RawOp.move
    Dir.left
    755,
  RawOp.marker
    88
    2593,
  RawOp.jump
    ⟨#[
      2597,
      2597,
      2597,
      2597,
      2597
    ], rfl⟩,
  RawOp.move
    Dir.left
    2595,
  RawOp.marker
    758
    2596,
  RawOp.jump
    ⟨#[
      2601,
      2601,
      2601,
      2601,
      2601
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      90,
      90,
      90,
      90,
      90
    ], rfl⟩,
  RawOp.move
    Dir.left
    2598,
  RawOp.marker
    2599
    2600,
  RawOp.jump
    ⟨#[
      91,
      91,
      91,
      91,
      91
    ], rfl⟩,
  RawOp.move
    Dir.left
    761,
  RawOp.marker
    2602
    2603,
  RawOp.jump
    ⟨#[
      2607,
      2607,
      2607,
      2607,
      2607
    ], rfl⟩,
  RawOp.move
    Dir.left
    2605,
  RawOp.marker
    764
    2606,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2602
    764,
  RawOp.move
    Dir.left
    767,
  RawOp.marker
    2608
    2609,
  RawOp.jump
    ⟨#[
      2613,
      2613,
      2613,
      2613,
      2613
    ], rfl⟩,
  RawOp.move
    Dir.left
    2611,
  RawOp.marker
    771
    2612,
  RawOp.jump
    ⟨#[
      2617,
      2617,
      2617,
      2617,
      2617
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2599
    771,
  RawOp.move
    Dir.left
    2614,
  RawOp.marker
    2615
    2616,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    758
    2615,
  RawOp.move
    Dir.left
    774,
  RawOp.marker
    2618
    2619,
  RawOp.jump
    ⟨#[
      2623,
      2623,
      2623,
      2623,
      2623
    ], rfl⟩,
  RawOp.move
    Dir.left
    2621,
  RawOp.marker
    89
    2622
]
theorem fact_81_1 : source_81_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_81_1 := by decide +kernel
theorem bounds_81_1 : raws_81_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_82_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2624
noncomputable def raws_82_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2626,
      2626,
      2626,
      2626,
      2626
    ], rfl⟩,
  RawOp.move
    Dir.left
    2624,
  RawOp.marker
    90
    2625,
  RawOp.jump
    ⟨#[
      92,
      92,
      92,
      92,
      92
    ], rfl⟩,
  RawOp.move
    Dir.left
    794,
  RawOp.marker
    2627
    2628,
  RawOp.jump
    ⟨#[
      2632,
      2632,
      2632,
      2632,
      2632
    ], rfl⟩,
  RawOp.move
    Dir.left
    2630,
  RawOp.marker
    783
    2631,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2627
    783,
  RawOp.move
    Dir.left
    786,
  RawOp.marker
    2633
    2634,
  RawOp.jump
    ⟨#[
      2638,
      2638,
      2638,
      2638,
      2638
    ], rfl⟩,
  RawOp.move
    Dir.left
    2636,
  RawOp.marker
    91
    2637,
  RawOp.jump
    ⟨#[
      2641,
      2641,
      2641,
      2641,
      2641
    ], rfl⟩,
  RawOp.move
    Dir.left
    2639,
  RawOp.marker
    797
    2640,
  RawOp.jump
    ⟨#[
      2645,
      2645,
      2645,
      2645,
      2645
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      93,
      93,
      93,
      93,
      93
    ], rfl⟩,
  RawOp.move
    Dir.left
    2642,
  RawOp.marker
    2643
    2644,
  RawOp.jump
    ⟨#[
      94,
      94,
      94,
      94,
      94
    ], rfl⟩,
  RawOp.move
    Dir.left
    800,
  RawOp.marker
    2646
    2647,
  RawOp.jump
    ⟨#[
      2651,
      2651,
      2651,
      2651,
      2651
    ], rfl⟩,
  RawOp.move
    Dir.left
    2649,
  RawOp.marker
    803
    2650,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2646
    803,
  RawOp.move
    Dir.left
    806,
  RawOp.marker
    2652
    2653,
  RawOp.jump
    ⟨#[
      2657,
      2657,
      2657,
      2657,
      2657
    ], rfl⟩
]
theorem fact_82_1 : source_82_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_82_1 := by decide +kernel
theorem bounds_82_1 : raws_82_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_81_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_81_1 source_82_1
noncomputable def raws_81_2 : List RawOp := raws_81_1 ++ raws_82_1
theorem fact_81_2 : source_81_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_81_2 :=
  source_branch 32 source_81_1 source_82_1 raws_81_1 raws_82_1 fact_81_1 fact_82_1
theorem bounds_81_2 : raws_81_2.all (labelsBounded 4042) = true :=
  bounds_append raws_81_1 raws_82_1 bounds_81_1 bounds_82_1
noncomputable def source_79_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_79_2 source_81_2
noncomputable def raws_79_4 : List RawOp := raws_79_2 ++ raws_81_2
theorem fact_79_4 : source_79_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_79_4 :=
  source_branch 64 source_79_2 source_81_2 raws_79_2 raws_81_2 fact_79_2 fact_81_2
theorem bounds_79_4 : raws_79_4.all (labelsBounded 4042) = true :=
  bounds_append raws_79_2 raws_81_2 bounds_79_2 bounds_81_2
noncomputable def source_83_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2656
noncomputable def raws_83_1 : List RawOp := [
  RawOp.move
    Dir.left
    2655,
  RawOp.marker
    810
    2656,
  RawOp.jump
    ⟨#[
      2661,
      2661,
      2661,
      2661,
      2661
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2643
    810,
  RawOp.move
    Dir.left
    2658,
  RawOp.marker
    2659
    2660,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    797
    2659,
  RawOp.move
    Dir.left
    813,
  RawOp.marker
    2662
    2663,
  RawOp.jump
    ⟨#[
      2667,
      2667,
      2667,
      2667,
      2667
    ], rfl⟩,
  RawOp.move
    Dir.left
    2665,
  RawOp.marker
    92
    2666,
  RawOp.jump
    ⟨#[
      2670,
      2670,
      2670,
      2670,
      2670
    ], rfl⟩,
  RawOp.move
    Dir.left
    2668,
  RawOp.marker
    93
    2669,
  RawOp.jump
    ⟨#[
      95,
      95,
      95,
      95,
      95
    ], rfl⟩,
  RawOp.move
    Dir.left
    833,
  RawOp.marker
    2671
    2672,
  RawOp.jump
    ⟨#[
      2676,
      2676,
      2676,
      2676,
      2676
    ], rfl⟩,
  RawOp.move
    Dir.left
    2674,
  RawOp.marker
    822
    2675,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2671
    822,
  RawOp.move
    Dir.left
    825,
  RawOp.marker
    2677
    2678,
  RawOp.jump
    ⟨#[
      2682,
      2682,
      2682,
      2682,
      2682
    ], rfl⟩,
  RawOp.move
    Dir.left
    2680,
  RawOp.marker
    94
    2681,
  RawOp.jump
    ⟨#[
      2685,
      2685,
      2685,
      2685,
      2685
    ], rfl⟩,
  RawOp.move
    Dir.left
    2683,
  RawOp.marker
    836
    2684,
  RawOp.jump
    ⟨#[
      2689,
      2689,
      2689,
      2689,
      2689
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      96,
      96,
      96,
      96,
      96
    ], rfl⟩
]
theorem fact_83_1 : source_83_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_83_1 := by decide +kernel
theorem bounds_83_1 : raws_83_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_84_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2688
noncomputable def raws_84_1 : List RawOp := [
  RawOp.move
    Dir.left
    2686,
  RawOp.marker
    2687
    2688,
  RawOp.jump
    ⟨#[
      97,
      97,
      97,
      97,
      97
    ], rfl⟩,
  RawOp.move
    Dir.left
    839,
  RawOp.marker
    2690
    2691,
  RawOp.jump
    ⟨#[
      2695,
      2695,
      2695,
      2695,
      2695
    ], rfl⟩,
  RawOp.move
    Dir.left
    2693,
  RawOp.marker
    842
    2694,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2690
    842,
  RawOp.move
    Dir.left
    845,
  RawOp.marker
    2696
    2697,
  RawOp.jump
    ⟨#[
      2701,
      2701,
      2701,
      2701,
      2701
    ], rfl⟩,
  RawOp.move
    Dir.left
    2699,
  RawOp.marker
    849
    2700,
  RawOp.jump
    ⟨#[
      2705,
      2705,
      2705,
      2705,
      2705
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2687
    849,
  RawOp.move
    Dir.left
    2702,
  RawOp.marker
    2703
    2704,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    836
    2703,
  RawOp.move
    Dir.left
    852,
  RawOp.marker
    2706
    2707,
  RawOp.jump
    ⟨#[
      2711,
      2711,
      2711,
      2711,
      2711
    ], rfl⟩,
  RawOp.move
    Dir.left
    2709,
  RawOp.marker
    95
    2710,
  RawOp.jump
    ⟨#[
      2714,
      2714,
      2714,
      2714,
      2714
    ], rfl⟩,
  RawOp.move
    Dir.left
    2712,
  RawOp.marker
    96
    2713,
  RawOp.jump
    ⟨#[
      98,
      98,
      98,
      98,
      98
    ], rfl⟩,
  RawOp.move
    Dir.left
    872,
  RawOp.marker
    2715
    2716,
  RawOp.jump
    ⟨#[
      2720,
      2720,
      2720,
      2720,
      2720
    ], rfl⟩,
  RawOp.move
    Dir.left
    2718
]
theorem fact_84_1 : source_84_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_84_1 := by decide +kernel
theorem bounds_84_1 : raws_84_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_83_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_83_1 source_84_1
noncomputable def raws_83_2 : List RawOp := raws_83_1 ++ raws_84_1
theorem fact_83_2 : source_83_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_83_2 :=
  source_branch 32 source_83_1 source_84_1 raws_83_1 raws_84_1 fact_83_1 fact_84_1
theorem bounds_83_2 : raws_83_2.all (labelsBounded 4042) = true :=
  bounds_append raws_83_1 raws_84_1 bounds_83_1 bounds_84_1
noncomputable def source_85_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2720
noncomputable def raws_85_1 : List RawOp := [
  RawOp.marker
    861
    2719,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2715
    861,
  RawOp.move
    Dir.left
    864,
  RawOp.marker
    2721
    2722,
  RawOp.jump
    ⟨#[
      2726,
      2726,
      2726,
      2726,
      2726
    ], rfl⟩,
  RawOp.move
    Dir.left
    2724,
  RawOp.marker
    97
    2725,
  RawOp.jump
    ⟨#[
      2729,
      2729,
      2729,
      2729,
      2729
    ], rfl⟩,
  RawOp.move
    Dir.left
    2727,
  RawOp.marker
    875
    2728,
  RawOp.jump
    ⟨#[
      2733,
      2733,
      2733,
      2733,
      2733
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      99,
      99,
      99,
      99,
      99
    ], rfl⟩,
  RawOp.move
    Dir.left
    2730,
  RawOp.marker
    2731
    2732,
  RawOp.jump
    ⟨#[
      100,
      100,
      100,
      100,
      100
    ], rfl⟩,
  RawOp.move
    Dir.left
    878,
  RawOp.marker
    2734
    2735,
  RawOp.jump
    ⟨#[
      2739,
      2739,
      2739,
      2739,
      2739
    ], rfl⟩,
  RawOp.move
    Dir.left
    2737,
  RawOp.marker
    881
    2738,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2734
    881,
  RawOp.move
    Dir.left
    884,
  RawOp.marker
    2740
    2741,
  RawOp.jump
    ⟨#[
      2745,
      2745,
      2745,
      2745,
      2745
    ], rfl⟩,
  RawOp.move
    Dir.left
    2743,
  RawOp.marker
    888
    2744,
  RawOp.jump
    ⟨#[
      2749,
      2749,
      2749,
      2749,
      2749
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2731
    888,
  RawOp.move
    Dir.left
    2746,
  RawOp.marker
    2747
    2748,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    875
    2747,
  RawOp.move
    Dir.left
    891
]
theorem fact_85_1 : source_85_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_85_1 := by decide +kernel
theorem bounds_85_1 : raws_85_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_86_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2752
noncomputable def raws_86_1 : List RawOp := [
  RawOp.marker
    2750
    2751,
  RawOp.jump
    ⟨#[
      2755,
      2755,
      2755,
      2755,
      2755
    ], rfl⟩,
  RawOp.move
    Dir.left
    2753,
  RawOp.marker
    98
    2754,
  RawOp.move
    Dir.left
    1168,
  RawOp.marker
    99
    2756,
  RawOp.jump
    ⟨#[
      101,
      101,
      101,
      101,
      101
    ], rfl⟩,
  RawOp.move
    Dir.left
    911,
  RawOp.marker
    2758
    2759,
  RawOp.jump
    ⟨#[
      2763,
      2763,
      2763,
      2763,
      2763
    ], rfl⟩,
  RawOp.move
    Dir.left
    2761,
  RawOp.marker
    900
    2762,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2758
    900,
  RawOp.move
    Dir.left
    903,
  RawOp.marker
    2764
    2765,
  RawOp.jump
    ⟨#[
      2769,
      2769,
      2769,
      2769,
      2769
    ], rfl⟩,
  RawOp.move
    Dir.left
    2767,
  RawOp.marker
    100
    2768,
  RawOp.jump
    ⟨#[
      2772,
      2772,
      2772,
      2772,
      2772
    ], rfl⟩,
  RawOp.move
    Dir.left
    2770,
  RawOp.marker
    914
    2771,
  RawOp.jump
    ⟨#[
      2776,
      2776,
      2776,
      2776,
      2776
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      102,
      102,
      102,
      102,
      102
    ], rfl⟩,
  RawOp.move
    Dir.left
    2773,
  RawOp.marker
    2774
    2775,
  RawOp.jump
    ⟨#[
      103,
      103,
      103,
      103,
      103
    ], rfl⟩,
  RawOp.move
    Dir.left
    917,
  RawOp.marker
    2777
    2778,
  RawOp.jump
    ⟨#[
      2782,
      2782,
      2782,
      2782,
      2782
    ], rfl⟩,
  RawOp.move
    Dir.left
    2780,
  RawOp.marker
    920
    2781,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2777
    920
]
theorem fact_86_1 : source_86_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_86_1 := by decide +kernel
theorem bounds_86_1 : raws_86_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_85_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_85_1 source_86_1
noncomputable def raws_85_2 : List RawOp := raws_85_1 ++ raws_86_1
theorem fact_85_2 : source_85_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_85_2 :=
  source_branch 32 source_85_1 source_86_1 raws_85_1 raws_86_1 fact_85_1 fact_86_1
theorem bounds_85_2 : raws_85_2.all (labelsBounded 4042) = true :=
  bounds_append raws_85_1 raws_86_1 bounds_85_1 bounds_86_1
noncomputable def source_83_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_83_2 source_85_2
noncomputable def raws_83_4 : List RawOp := raws_83_2 ++ raws_85_2
theorem fact_83_4 : source_83_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_83_4 :=
  source_branch 64 source_83_2 source_85_2 raws_83_2 raws_85_2 fact_83_2 fact_85_2
theorem bounds_83_4 : raws_83_4.all (labelsBounded 4042) = true :=
  bounds_append raws_83_2 raws_85_2 bounds_83_2 bounds_85_2
noncomputable def source_79_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_79_4 source_83_4
noncomputable def raws_79_8 : List RawOp := raws_79_4 ++ raws_83_4
theorem fact_79_8 : source_79_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_79_8 :=
  source_branch 128 source_79_4 source_83_4 raws_79_4 raws_83_4 fact_79_4 fact_83_4
theorem bounds_79_8 : raws_79_8.all (labelsBounded 4042) = true :=
  bounds_append raws_79_4 raws_83_4 bounds_79_4 bounds_83_4
noncomputable def source_87_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2784
noncomputable def raws_87_1 : List RawOp := [
  RawOp.move
    Dir.left
    923,
  RawOp.marker
    2783
    2784,
  RawOp.jump
    ⟨#[
      2788,
      2788,
      2788,
      2788,
      2788
    ], rfl⟩,
  RawOp.move
    Dir.left
    2786,
  RawOp.marker
    927
    2787,
  RawOp.jump
    ⟨#[
      2792,
      2792,
      2792,
      2792,
      2792
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2774
    927,
  RawOp.move
    Dir.left
    2789,
  RawOp.marker
    2790
    2791,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    914
    2790,
  RawOp.move
    Dir.left
    930,
  RawOp.marker
    2793
    2794,
  RawOp.jump
    ⟨#[
      2798,
      2798,
      2798,
      2798,
      2798
    ], rfl⟩,
  RawOp.move
    Dir.left
    2796,
  RawOp.marker
    101
    2797,
  RawOp.move
    Dir.left
    1275,
  RawOp.marker
    102
    2799,
  RawOp.jump
    ⟨#[
      104,
      104,
      104,
      104,
      104
    ], rfl⟩,
  RawOp.move
    Dir.left
    950,
  RawOp.marker
    2801
    2802,
  RawOp.jump
    ⟨#[
      2806,
      2806,
      2806,
      2806,
      2806
    ], rfl⟩,
  RawOp.move
    Dir.left
    2804,
  RawOp.marker
    939
    2805,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2801
    939,
  RawOp.move
    Dir.left
    942,
  RawOp.marker
    2807
    2808,
  RawOp.jump
    ⟨#[
      2812,
      2812,
      2812,
      2812,
      2812
    ], rfl⟩,
  RawOp.move
    Dir.left
    2810,
  RawOp.marker
    103
    2811,
  RawOp.jump
    ⟨#[
      2815,
      2815,
      2815,
      2815,
      2815
    ], rfl⟩,
  RawOp.move
    Dir.left
    2813,
  RawOp.marker
    953
    2814
]
theorem fact_87_1 : source_87_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_87_1 := by decide +kernel
theorem bounds_87_1 : raws_87_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t88\t{now}"
      handle.flush
noncomputable def source_88_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2816
noncomputable def raws_88_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      2819,
      2819,
      2819,
      2819,
      2819
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      105,
      105,
      105,
      105,
      105
    ], rfl⟩,
  RawOp.move
    Dir.left
    2816,
  RawOp.marker
    2817
    2818,
  RawOp.jump
    ⟨#[
      106,
      106,
      106,
      106,
      106
    ], rfl⟩,
  RawOp.move
    Dir.left
    956,
  RawOp.marker
    2820
    2821,
  RawOp.jump
    ⟨#[
      2825,
      2825,
      2825,
      2825,
      2825
    ], rfl⟩,
  RawOp.move
    Dir.left
    2823,
  RawOp.marker
    959
    2824,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2820
    959,
  RawOp.move
    Dir.left
    962,
  RawOp.marker
    2826
    2827,
  RawOp.jump
    ⟨#[
      2831,
      2831,
      2831,
      2831,
      2831
    ], rfl⟩,
  RawOp.move
    Dir.left
    2829,
  RawOp.marker
    966
    2830,
  RawOp.jump
    ⟨#[
      2835,
      2835,
      2835,
      2835,
      2835
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2817
    966,
  RawOp.move
    Dir.left
    2832,
  RawOp.marker
    2833
    2834,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    953
    2833,
  RawOp.move
    Dir.left
    969,
  RawOp.marker
    2836
    2837,
  RawOp.jump
    ⟨#[
      2841,
      2841,
      2841,
      2841,
      2841
    ], rfl⟩,
  RawOp.move
    Dir.left
    2839,
  RawOp.marker
    104
    2840,
  RawOp.move
    Dir.left
    1381,
  RawOp.marker
    105
    2842,
  RawOp.jump
    ⟨#[
      107,
      107,
      107,
      107,
      107
    ], rfl⟩,
  RawOp.move
    Dir.left
    989,
  RawOp.marker
    2844
    2845,
  RawOp.jump
    ⟨#[
      2849,
      2849,
      2849,
      2849,
      2849
    ], rfl⟩
]
theorem fact_88_1 : source_88_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_88_1 := by decide +kernel
theorem bounds_88_1 : raws_88_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_87_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_87_1 source_88_1
noncomputable def raws_87_2 : List RawOp := raws_87_1 ++ raws_88_1
theorem fact_87_2 : source_87_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_87_2 :=
  source_branch 32 source_87_1 source_88_1 raws_87_1 raws_88_1 fact_87_1 fact_88_1
theorem bounds_87_2 : raws_87_2.all (labelsBounded 4042) = true :=
  bounds_append raws_87_1 raws_88_1 bounds_87_1 bounds_88_1
noncomputable def source_89_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2848
noncomputable def raws_89_1 : List RawOp := [
  RawOp.move
    Dir.left
    2847,
  RawOp.marker
    978
    2848,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2844
    978,
  RawOp.move
    Dir.left
    981,
  RawOp.marker
    2850
    2851,
  RawOp.jump
    ⟨#[
      2855,
      2855,
      2855,
      2855,
      2855
    ], rfl⟩,
  RawOp.move
    Dir.left
    2853,
  RawOp.marker
    106
    2854,
  RawOp.jump
    ⟨#[
      2858,
      2858,
      2858,
      2858,
      2858
    ], rfl⟩,
  RawOp.move
    Dir.left
    2856,
  RawOp.marker
    992
    2857,
  RawOp.jump
    ⟨#[
      2862,
      2862,
      2862,
      2862,
      2862
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      108,
      108,
      108,
      108,
      108
    ], rfl⟩,
  RawOp.move
    Dir.left
    2859,
  RawOp.marker
    2860
    2861,
  RawOp.jump
    ⟨#[
      109,
      109,
      109,
      109,
      109
    ], rfl⟩,
  RawOp.move
    Dir.left
    995,
  RawOp.marker
    2863
    2864,
  RawOp.jump
    ⟨#[
      2868,
      2868,
      2868,
      2868,
      2868
    ], rfl⟩,
  RawOp.move
    Dir.left
    2866,
  RawOp.marker
    998
    2867,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2863
    998,
  RawOp.move
    Dir.left
    1001,
  RawOp.marker
    2869
    2870,
  RawOp.jump
    ⟨#[
      2874,
      2874,
      2874,
      2874,
      2874
    ], rfl⟩,
  RawOp.move
    Dir.left
    2872,
  RawOp.marker
    1005
    2873,
  RawOp.jump
    ⟨#[
      2878,
      2878,
      2878,
      2878,
      2878
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2860
    1005,
  RawOp.move
    Dir.left
    2875,
  RawOp.marker
    2876
    2877,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    992
    2876
]
theorem fact_89_1 : source_89_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_89_1 := by decide +kernel
theorem bounds_89_1 : raws_89_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_90_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2880
noncomputable def raws_90_1 : List RawOp := [
  RawOp.move
    Dir.left
    1008,
  RawOp.marker
    2879
    2880,
  RawOp.jump
    ⟨#[
      2884,
      2884,
      2884,
      2884,
      2884
    ], rfl⟩,
  RawOp.move
    Dir.left
    2882,
  RawOp.marker
    107
    2883,
  RawOp.move
    Dir.left
    1481,
  RawOp.marker
    108
    2885,
  RawOp.jump
    ⟨#[
      2889,
      2889,
      2889,
      2889,
      2889
    ], rfl⟩,
  RawOp.move
    Dir.left
    2887,
  RawOp.marker
    110
    2888,
  RawOp.jump
    ⟨#[
      2892,
      2892,
      2892,
      2892,
      2892
    ], rfl⟩,
  RawOp.move
    Dir.left
    2890,
  RawOp.marker
    1017
    2891,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    110
    1017,
  RawOp.move
    Dir.left
    1020,
  RawOp.marker
    2893
    2894,
  RawOp.jump
    ⟨#[
      2898,
      2898,
      2898,
      2898,
      2898
    ], rfl⟩,
  RawOp.move
    Dir.left
    2896,
  RawOp.marker
    109
    2897,
  RawOp.jump
    ⟨#[
      2902,
      2902,
      2902,
      2902,
      2902
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      112,
      112,
      112,
      112,
      112
    ], rfl⟩,
  RawOp.move
    Dir.left
    2899,
  RawOp.marker
    2900
    2901,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2900
    90,
  RawOp.move
    Dir.left
    1028,
  RawOp.marker
    2903
    2904,
  RawOp.jump
    ⟨#[
      2908,
      2908,
      2908,
      2908,
      2908
    ], rfl⟩,
  RawOp.move
    Dir.left
    2906,
  RawOp.marker
    111
    2907,
  RawOp.jump
    ⟨#[
      2912,
      2912,
      2912,
      2912,
      2912
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      115,
      115,
      115,
      115,
      115
    ], rfl⟩,
  RawOp.move
    Dir.left
    2909
]
theorem fact_90_1 : source_90_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_90_1 := by decide +kernel
theorem bounds_90_1 : raws_90_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_89_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_89_1 source_90_1
noncomputable def raws_89_2 : List RawOp := raws_89_1 ++ raws_90_1
theorem fact_89_2 : source_89_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_89_2 :=
  source_branch 32 source_89_1 source_90_1 raws_89_1 raws_90_1 fact_89_1 fact_90_1
theorem bounds_89_2 : raws_89_2.all (labelsBounded 4042) = true :=
  bounds_append raws_89_1 raws_90_1 bounds_89_1 bounds_90_1
noncomputable def source_87_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_87_2 source_89_2
noncomputable def raws_87_4 : List RawOp := raws_87_2 ++ raws_89_2
theorem fact_87_4 : source_87_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_87_4 :=
  source_branch 64 source_87_2 source_89_2 raws_87_2 raws_89_2 fact_87_2 fact_89_2
theorem bounds_87_4 : raws_87_4.all (labelsBounded 4042) = true :=
  bounds_append raws_87_2 raws_89_2 bounds_87_2 bounds_89_2
noncomputable def source_91_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2912
noncomputable def raws_91_1 : List RawOp := [
  RawOp.marker
    2910
    2911,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2910
    2900,
  RawOp.move
    Dir.left
    1036,
  RawOp.marker
    2913
    2914,
  RawOp.jump
    ⟨#[
      2918,
      2918,
      2918,
      2918,
      2918
    ], rfl⟩,
  RawOp.move
    Dir.left
    2916,
  RawOp.marker
    112
    2917,
  RawOp.move
    Dir.left
    1044,
  RawOp.marker
    114
    2919,
  RawOp.jump
    ⟨#[
      2923,
      2923,
      2923,
      2923,
      2923
    ], rfl⟩,
  RawOp.move
    Dir.left
    2921,
  RawOp.marker
    113
    2922,
  RawOp.jump
    ⟨#[
      2926,
      2926,
      2926,
      2926,
      2926
    ], rfl⟩,
  RawOp.move
    Dir.left
    2924,
  RawOp.marker
    115
    2925,
  RawOp.move
    Dir.left
    1580,
  RawOp.marker
    116
    2927,
  RawOp.jump
    ⟨#[
      2932,
      2932,
      2932,
      2932,
      2932
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      118,
      118,
      118,
      118,
      118
    ], rfl⟩,
  RawOp.move
    Dir.left
    2929,
  RawOp.marker
    2930
    2931,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2930
    93,
  RawOp.move
    Dir.left
    1049,
  RawOp.marker
    2933
    2934,
  RawOp.jump
    ⟨#[
      2938,
      2938,
      2938,
      2938,
      2938
    ], rfl⟩,
  RawOp.move
    Dir.left
    2936,
  RawOp.marker
    117
    2937,
  RawOp.jump
    ⟨#[
      119,
      119,
      119,
      119,
      119
    ], rfl⟩,
  RawOp.move
    Dir.left
    1065,
  RawOp.marker
    2939
    2940,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2939
    2930,
  RawOp.move
    Dir.left
    1057
]
theorem fact_91_1 : source_91_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_91_1 := by decide +kernel
theorem bounds_91_1 : raws_91_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_92_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2944
noncomputable def raws_92_1 : List RawOp := [
  RawOp.marker
    2942
    2943,
  RawOp.jump
    ⟨#[
      2947,
      2947,
      2947,
      2947,
      2947
    ], rfl⟩,
  RawOp.move
    Dir.left
    2945,
  RawOp.marker
    118
    2946,
  RawOp.jump
    ⟨#[
      2951,
      2951,
      2951,
      2951,
      2951
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      122,
      122,
      122,
      122,
      122
    ], rfl⟩,
  RawOp.move
    Dir.left
    2948,
  RawOp.marker
    2949
    2950,
  RawOp.jump
    ⟨#[
      2954,
      2954,
      2954,
      2954,
      2954
    ], rfl⟩,
  RawOp.move
    Dir.left
    2952,
  RawOp.marker
    1068
    2953,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    2949
    1068,
  RawOp.move
    Dir.left
    1071,
  RawOp.marker
    2955
    2956,
  RawOp.jump
    ⟨#[
      2960,
      2960,
      2960,
      2960,
      2960
    ], rfl⟩,
  RawOp.move
    Dir.left
    2958,
  RawOp.marker
    119
    2959,
  RawOp.move
    Dir.left
    1079,
  RawOp.marker
    121
    2961,
  RawOp.jump
    ⟨#[
      2965,
      2965,
      2965,
      2965,
      2965
    ], rfl⟩,
  RawOp.move
    Dir.left
    2963,
  RawOp.marker
    120
    2964,
  RawOp.jump
    ⟨#[
      2968,
      2968,
      2968,
      2968,
      2968
    ], rfl⟩,
  RawOp.move
    Dir.left
    2966,
  RawOp.marker
    122
    2967,
  RawOp.jump
    ⟨#[
      2971,
      2971,
      2971,
      2971,
      2971
    ], rfl⟩,
  RawOp.move
    Dir.left
    2969,
  RawOp.marker
    123
    2970,
  RawOp.jump
    ⟨#[
      125,
      125,
      125,
      125,
      125
    ], rfl⟩,
  RawOp.move
    Dir.left
    1092,
  RawOp.marker
    2972
    2973,
  RawOp.jump
    ⟨#[
      2978,
      2978,
      2978,
      2978,
      2978
    ], rfl⟩
]
theorem fact_92_1 : source_92_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_92_1 := by decide +kernel
theorem bounds_92_1 : raws_92_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_91_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_91_1 source_92_1
noncomputable def raws_91_2 : List RawOp := raws_91_1 ++ raws_92_1
theorem fact_91_2 : source_91_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_91_2 :=
  source_branch 32 source_91_1 source_92_1 raws_91_1 raws_92_1 fact_91_1 fact_92_1
theorem bounds_91_2 : raws_91_2.all (labelsBounded 4042) = true :=
  bounds_append raws_91_1 raws_92_1 bounds_91_1 bounds_92_1
noncomputable def source_93_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk2976
noncomputable def raws_93_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      124,
      124,
      124,
      124,
      124
    ], rfl⟩,
  RawOp.move
    Dir.left
    2975,
  RawOp.marker
    2976
    2977,
  RawOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    2972
    2976,
  RawOp.move
    Dir.left
    1084,
  RawOp.marker
    2979
    2980,
  RawOp.jump
    ⟨#[
      2984,
      2984,
      2984,
      2984,
      2984
    ], rfl⟩,
  RawOp.move
    Dir.left
    2982,
  RawOp.marker
    124
    2983,
  RawOp.jump
    ⟨#[
      126,
      126,
      126,
      126,
      126
    ], rfl⟩,
  RawOp.move
    Dir.left
    1106,
  RawOp.marker
    2985
    2986,
  RawOp.jump
    ⟨#[
      2990,
      2990,
      2990,
      2990,
      2990
    ], rfl⟩,
  RawOp.move
    Dir.left
    2988,
  RawOp.marker
    1095
    2989,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    2985
    1095,
  RawOp.move
    Dir.left
    1098,
  RawOp.marker
    2991
    2992,
  RawOp.jump
    ⟨#[
      2996,
      2996,
      2996,
      2996,
      2996
    ], rfl⟩,
  RawOp.move
    Dir.left
    2994,
  RawOp.marker
    125
    2995,
  RawOp.jump
    ⟨#[
      2999,
      2999,
      2999,
      2999,
      2999
    ], rfl⟩,
  RawOp.move
    Dir.left
    2997,
  RawOp.marker
    1109
    2998,
  RawOp.move
    Dir.left
    1112,
  RawOp.marker
    265
    3000,
  RawOp.move
    Dir.left
    1118,
  RawOp.marker
    1115
    3002,
  RawOp.jump
    ⟨#[
      3006,
      3006,
      3006,
      3006,
      3006
    ], rfl⟩,
  RawOp.move
    Dir.left
    3004,
  RawOp.marker
    1121
    3005,
  RawOp.jump
    ⟨#[
      3010,
      3010,
      3010,
      3010,
      3010
    ], rfl⟩
]
theorem fact_93_1 : source_93_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_93_1 := by decide +kernel
theorem bounds_93_1 : raws_93_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_94_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3008
noncomputable def raws_94_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      false,
      false,
      true,
      false,
      false
    ], rfl⟩
    1121
    1115,
  RawOp.move
    Dir.left
    3007,
  RawOp.marker
    3008
    3009,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      false,
      true
    ], rfl⟩
    1109
    3008,
  RawOp.move
    Dir.left
    1124,
  RawOp.marker
    3011
    3012,
  RawOp.jump
    ⟨#[
      3016,
      3016,
      3016,
      3016,
      3016
    ], rfl⟩,
  RawOp.move
    Dir.left
    3014,
  RawOp.marker
    126
    3015,
  RawOp.jump
    ⟨#[
      3019,
      3019,
      3019,
      3019,
      3019
    ], rfl⟩,
  RawOp.move
    Dir.left
    3017,
  RawOp.marker
    1133
    3018,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    114
    1133,
  RawOp.move
    Dir.left
    1136,
  RawOp.marker
    3020
    3021,
  RawOp.jump
    ⟨#[
      3025,
      3025,
      3025,
      3025,
      3025
    ], rfl⟩,
  RawOp.move
    Dir.left
    3023,
  RawOp.marker
    127
    3024,
  RawOp.jump
    ⟨#[
      3029,
      3029,
      3029,
      3029,
      3029
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      129,
      129,
      129,
      129,
      129
    ], rfl⟩,
  RawOp.move
    Dir.left
    3026,
  RawOp.marker
    3027
    3028,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3027
    96,
  RawOp.move
    Dir.left
    1144,
  RawOp.marker
    3030
    3031,
  RawOp.jump
    ⟨#[
      3035,
      3035,
      3035,
      3035,
      3035
    ], rfl⟩,
  RawOp.move
    Dir.left
    3033,
  RawOp.marker
    128
    3034,
  RawOp.jump
    ⟨#[
      3039,
      3039,
      3039,
      3039,
      3039
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      130,
      130,
      130,
      130,
      130
    ], rfl⟩,
  RawOp.move
    Dir.left
    3036,
  RawOp.marker
    3037
    3038
]
theorem fact_94_1 : source_94_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_94_1 := by decide +kernel
theorem bounds_94_1 : raws_94_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_93_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_93_1 source_94_1
noncomputable def raws_93_2 : List RawOp := raws_93_1 ++ raws_94_1
theorem fact_93_2 : source_93_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_93_2 :=
  source_branch 32 source_93_1 source_94_1 raws_93_1 raws_94_1 fact_93_1 fact_94_1
theorem bounds_93_2 : raws_93_2.all (labelsBounded 4042) = true :=
  bounds_append raws_93_1 raws_94_1 bounds_93_1 bounds_94_1
noncomputable def source_91_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_91_2 source_93_2
noncomputable def raws_91_4 : List RawOp := raws_91_2 ++ raws_93_2
theorem fact_91_4 : source_91_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_91_4 :=
  source_branch 64 source_91_2 source_93_2 raws_91_2 raws_93_2 fact_91_2 fact_93_2
theorem bounds_91_4 : raws_91_4.all (labelsBounded 4042) = true :=
  bounds_append raws_91_2 raws_93_2 bounds_91_2 bounds_93_2
noncomputable def source_87_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_87_4 source_91_4
noncomputable def raws_87_8 : List RawOp := raws_87_4 ++ raws_91_4
theorem fact_87_8 : source_87_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_87_8 :=
  source_branch 128 source_87_4 source_91_4 raws_87_4 raws_91_4 fact_87_4 fact_91_4
theorem bounds_87_8 : raws_87_8.all (labelsBounded 4042) = true :=
  bounds_append raws_87_4 raws_91_4 bounds_87_4 bounds_91_4
noncomputable def source_79_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_79_8 source_87_8
noncomputable def raws_79_16 : List RawOp := raws_79_8 ++ raws_87_8
theorem fact_79_16 : source_79_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_79_16 :=
  source_branch 256 source_79_8 source_87_8 raws_79_8 raws_87_8 fact_79_8 fact_87_8
theorem bounds_79_16 : raws_79_16.all (labelsBounded 4042) = true :=
  bounds_append raws_79_8 raws_87_8 bounds_79_8 bounds_87_8
noncomputable def source_63_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_63_16 source_79_16
noncomputable def raws_63_32 : List RawOp := raws_63_16 ++ raws_79_16
theorem fact_63_32 : source_63_32.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_32 :=
  source_branch 512 source_63_16 source_79_16 raws_63_16 raws_79_16 fact_63_16 fact_79_16
theorem bounds_63_32 : raws_63_32.all (labelsBounded 4042) = true :=
  bounds_append raws_63_16 raws_79_16 bounds_63_16 bounds_79_16
noncomputable def source_95_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3040
noncomputable def raws_95_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3037
    3027,
  RawOp.move
    Dir.left
    1152,
  RawOp.marker
    3040
    3041,
  RawOp.jump
    ⟨#[
      3045,
      3045,
      3045,
      3045,
      3045
    ], rfl⟩,
  RawOp.move
    Dir.left
    3043,
  RawOp.marker
    129
    3044,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    114
    3037,
  RawOp.move
    Dir.left
    1160,
  RawOp.marker
    3046
    3047,
  RawOp.jump
    ⟨#[
      3051,
      3051,
      3051,
      3051,
      3051
    ], rfl⟩,
  RawOp.move
    Dir.left
    3049,
  RawOp.marker
    130
    3050,
  RawOp.jump
    ⟨#[
      3055,
      3055,
      3055,
      3055,
      3055
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      134,
      134,
      134,
      134,
      134
    ], rfl⟩,
  RawOp.move
    Dir.left
    3052,
  RawOp.marker
    3053
    3054,
  RawOp.jump
    ⟨#[
      3058,
      3058,
      3058,
      3058,
      3058
    ], rfl⟩,
  RawOp.move
    Dir.left
    3056,
  RawOp.marker
    1171
    3057,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3053
    1171,
  RawOp.move
    Dir.left
    1174,
  RawOp.marker
    3059
    3060,
  RawOp.jump
    ⟨#[
      3064,
      3064,
      3064,
      3064,
      3064
    ], rfl⟩,
  RawOp.move
    Dir.left
    3062,
  RawOp.marker
    131
    3063,
  RawOp.move
    Dir.left
    1182,
  RawOp.marker
    133
    3065,
  RawOp.jump
    ⟨#[
      3069,
      3069,
      3069,
      3069,
      3069
    ], rfl⟩,
  RawOp.move
    Dir.left
    3067,
  RawOp.marker
    132
    3068,
  RawOp.jump
    ⟨#[
      3072,
      3072,
      3072,
      3072,
      3072
    ], rfl⟩,
  RawOp.move
    Dir.left
    3070
]
theorem fact_95_1 : source_95_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_1 := by decide +kernel
theorem bounds_95_1 : raws_95_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t96\t{now}"
      handle.flush
noncomputable def source_96_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3072
noncomputable def raws_96_1 : List RawOp := [
  RawOp.marker
    134
    3071,
  RawOp.jump
    ⟨#[
      3076,
      3076,
      3076,
      3076,
      3076
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      138,
      138,
      138,
      138,
      138
    ], rfl⟩,
  RawOp.move
    Dir.left
    3073,
  RawOp.marker
    3074
    3075,
  RawOp.jump
    ⟨#[
      3079,
      3079,
      3079,
      3079,
      3079
    ], rfl⟩,
  RawOp.move
    Dir.left
    3077,
  RawOp.marker
    1188
    3078,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3074
    1188,
  RawOp.move
    Dir.left
    1191,
  RawOp.marker
    3080
    3081,
  RawOp.jump
    ⟨#[
      3085,
      3085,
      3085,
      3085,
      3085
    ], rfl⟩,
  RawOp.move
    Dir.left
    3083,
  RawOp.marker
    135
    3084,
  RawOp.move
    Dir.left
    1199,
  RawOp.marker
    137
    3086,
  RawOp.jump
    ⟨#[
      3090,
      3090,
      3090,
      3090,
      3090
    ], rfl⟩,
  RawOp.move
    Dir.left
    3088,
  RawOp.marker
    136
    3089,
  RawOp.jump
    ⟨#[
      3093,
      3093,
      3093,
      3093,
      3093
    ], rfl⟩,
  RawOp.move
    Dir.left
    3091,
  RawOp.marker
    138
    3092,
  RawOp.jump
    ⟨#[
      140,
      140,
      140,
      140,
      140
    ], rfl⟩,
  RawOp.move
    Dir.left
    1216,
  RawOp.marker
    3094
    3095,
  RawOp.jump
    ⟨#[
      3099,
      3099,
      3099,
      3099,
      3099
    ], rfl⟩,
  RawOp.move
    Dir.left
    3097,
  RawOp.marker
    1205
    3098,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3094
    1205,
  RawOp.move
    Dir.left
    1208,
  RawOp.marker
    3100
    3101,
  RawOp.jump
    ⟨#[
      3105,
      3105,
      3105,
      3105,
      3105
    ], rfl⟩
]
theorem fact_96_1 : source_96_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_96_1 := by decide +kernel
theorem bounds_96_1 : raws_96_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_95_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_95_1 source_96_1
noncomputable def raws_95_2 : List RawOp := raws_95_1 ++ raws_96_1
theorem fact_95_2 : source_95_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_2 :=
  source_branch 32 source_95_1 source_96_1 raws_95_1 raws_96_1 fact_95_1 fact_96_1
theorem bounds_95_2 : raws_95_2.all (labelsBounded 4042) = true :=
  bounds_append raws_95_1 raws_96_1 bounds_95_1 bounds_96_1
noncomputable def source_97_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3104
noncomputable def raws_97_1 : List RawOp := [
  RawOp.move
    Dir.left
    3103,
  RawOp.marker
    139
    3104,
  RawOp.move
    Dir.left
    1222,
  RawOp.marker
    1219
    3106,
  RawOp.jump
    ⟨#[
      3110,
      3110,
      3110,
      3110,
      3110
    ], rfl⟩,
  RawOp.move
    Dir.left
    3108,
  RawOp.marker
    1225
    3109,
  RawOp.jump
    ⟨#[
      3114,
      3114,
      3114,
      3114,
      3114
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      143,
      143,
      143,
      143,
      143
    ], rfl⟩,
  RawOp.move
    Dir.left
    3111,
  RawOp.marker
    3112
    3113,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    1225
    3112,
  RawOp.move
    Dir.left
    1228,
  RawOp.marker
    3115
    3116,
  RawOp.jump
    ⟨#[
      3120,
      3120,
      3120,
      3120,
      3120
    ], rfl⟩,
  RawOp.move
    Dir.left
    3118,
  RawOp.marker
    140
    3119,
  RawOp.move
    Dir.left
    1236,
  RawOp.marker
    142
    3121,
  RawOp.jump
    ⟨#[
      3125,
      3125,
      3125,
      3125,
      3125
    ], rfl⟩,
  RawOp.move
    Dir.left
    3123,
  RawOp.marker
    141
    3124,
  RawOp.jump
    ⟨#[
      3128,
      3128,
      3128,
      3128,
      3128
    ], rfl⟩,
  RawOp.move
    Dir.left
    3126,
  RawOp.marker
    143
    3127,
  RawOp.move
    Dir.left
    1241,
  RawOp.marker
    145
    3129,
  RawOp.jump
    ⟨#[
      3133,
      3133,
      3133,
      3133,
      3133
    ], rfl⟩,
  RawOp.move
    Dir.left
    3131,
  RawOp.marker
    144
    3132,
  RawOp.jump
    ⟨#[
      3136,
      3136,
      3136,
      3136,
      3136
    ], rfl⟩,
  RawOp.move
    Dir.left
    3134
]
theorem fact_97_1 : source_97_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_97_1 := by decide +kernel
theorem bounds_97_1 : raws_97_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_98_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3136
noncomputable def raws_98_1 : List RawOp := [
  RawOp.marker
    146
    3135,
  RawOp.jump
    ⟨#[
      3140,
      3140,
      3140,
      3140,
      3140
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      150,
      150,
      150,
      150,
      150
    ], rfl⟩,
  RawOp.move
    Dir.left
    3137,
  RawOp.marker
    3138
    3139,
  RawOp.jump
    ⟨#[
      3143,
      3143,
      3143,
      3143,
      3143
    ], rfl⟩,
  RawOp.move
    Dir.left
    3141,
  RawOp.marker
    1247
    3142,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3138
    1247,
  RawOp.move
    Dir.left
    1250,
  RawOp.marker
    3144
    3145,
  RawOp.jump
    ⟨#[
      3149,
      3149,
      3149,
      3149,
      3149
    ], rfl⟩,
  RawOp.move
    Dir.left
    3147,
  RawOp.marker
    147
    3148,
  RawOp.move
    Dir.left
    1258,
  RawOp.marker
    149
    3150,
  RawOp.jump
    ⟨#[
      3154,
      3154,
      3154,
      3154,
      3154
    ], rfl⟩,
  RawOp.move
    Dir.left
    3152,
  RawOp.marker
    148
    3153,
  RawOp.jump
    ⟨#[
      3157,
      3157,
      3157,
      3157,
      3157
    ], rfl⟩,
  RawOp.move
    Dir.left
    3155,
  RawOp.marker
    150
    3156,
  RawOp.jump
    ⟨#[
      3160,
      3160,
      3160,
      3160,
      3160
    ], rfl⟩,
  RawOp.move
    Dir.left
    3158,
  RawOp.marker
    1264
    3159,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    18
    1264,
  RawOp.move
    Dir.left
    1267,
  RawOp.marker
    3161
    3162,
  RawOp.jump
    ⟨#[
      3166,
      3166,
      3166,
      3166,
      3166
    ], rfl⟩,
  RawOp.move
    Dir.left
    3164,
  RawOp.marker
    151
    3165,
  RawOp.jump
    ⟨#[
      3170,
      3170,
      3170,
      3170,
      3170
    ], rfl⟩
]
theorem fact_98_1 : source_98_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_98_1 := by decide +kernel
theorem bounds_98_1 : raws_98_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_97_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_97_1 source_98_1
noncomputable def raws_97_2 : List RawOp := raws_97_1 ++ raws_98_1
theorem fact_97_2 : source_97_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_97_2 :=
  source_branch 32 source_97_1 source_98_1 raws_97_1 raws_98_1 fact_97_1 fact_98_1
theorem bounds_97_2 : raws_97_2.all (labelsBounded 4042) = true :=
  bounds_append raws_97_1 raws_98_1 bounds_97_1 bounds_98_1
noncomputable def source_95_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_95_2 source_97_2
noncomputable def raws_95_4 : List RawOp := raws_95_2 ++ raws_97_2
theorem fact_95_4 : source_95_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_4 :=
  source_branch 64 source_95_2 source_97_2 raws_95_2 raws_97_2 fact_95_2 fact_97_2
theorem bounds_95_4 : raws_95_4.all (labelsBounded 4042) = true :=
  bounds_append raws_95_2 raws_97_2 bounds_95_2 bounds_97_2
noncomputable def source_99_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3168
noncomputable def raws_99_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      155,
      155,
      155,
      155,
      155
    ], rfl⟩,
  RawOp.move
    Dir.left
    3167,
  RawOp.marker
    3168
    3169,
  RawOp.jump
    ⟨#[
      3173,
      3173,
      3173,
      3173,
      3173
    ], rfl⟩,
  RawOp.move
    Dir.left
    3171,
  RawOp.marker
    1278
    3172,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3168
    1278,
  RawOp.move
    Dir.left
    1281,
  RawOp.marker
    3174
    3175,
  RawOp.jump
    ⟨#[
      3179,
      3179,
      3179,
      3179,
      3179
    ], rfl⟩,
  RawOp.move
    Dir.left
    3177,
  RawOp.marker
    152
    3178,
  RawOp.move
    Dir.left
    1289,
  RawOp.marker
    154
    3180,
  RawOp.jump
    ⟨#[
      3184,
      3184,
      3184,
      3184,
      3184
    ], rfl⟩,
  RawOp.move
    Dir.left
    3182,
  RawOp.marker
    153
    3183,
  RawOp.jump
    ⟨#[
      3187,
      3187,
      3187,
      3187,
      3187
    ], rfl⟩,
  RawOp.move
    Dir.left
    3185,
  RawOp.marker
    155
    3186,
  RawOp.jump
    ⟨#[
      157,
      157,
      157,
      157,
      157
    ], rfl⟩,
  RawOp.move
    Dir.left
    1306,
  RawOp.marker
    3188
    3189,
  RawOp.jump
    ⟨#[
      3193,
      3193,
      3193,
      3193,
      3193
    ], rfl⟩,
  RawOp.move
    Dir.left
    3191,
  RawOp.marker
    1295
    3192,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3188
    1295,
  RawOp.move
    Dir.left
    1298,
  RawOp.marker
    3194
    3195,
  RawOp.jump
    ⟨#[
      3199,
      3199,
      3199,
      3199,
      3199
    ], rfl⟩,
  RawOp.move
    Dir.left
    3197,
  RawOp.marker
    156
    3198
]
theorem fact_99_1 : source_99_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_99_1 := by decide +kernel
theorem bounds_99_1 : raws_99_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_100_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3200
noncomputable def raws_100_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3203,
      3203,
      3203,
      3203,
      3203
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      160,
      160,
      160,
      160,
      160
    ], rfl⟩,
  RawOp.move
    Dir.left
    3200,
  RawOp.marker
    3201
    3202,
  RawOp.jump
    ⟨#[
      3206,
      3206,
      3206,
      3206,
      3206
    ], rfl⟩,
  RawOp.move
    Dir.left
    3204,
  RawOp.marker
    1309
    3205,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3201
    1309,
  RawOp.move
    Dir.left
    1312,
  RawOp.marker
    3207
    3208,
  RawOp.jump
    ⟨#[
      3212,
      3212,
      3212,
      3212,
      3212
    ], rfl⟩,
  RawOp.move
    Dir.left
    3210,
  RawOp.marker
    157
    3211,
  RawOp.move
    Dir.left
    1320,
  RawOp.marker
    159
    3213,
  RawOp.jump
    ⟨#[
      3217,
      3217,
      3217,
      3217,
      3217
    ], rfl⟩,
  RawOp.move
    Dir.left
    3215,
  RawOp.marker
    158
    3216,
  RawOp.jump
    ⟨#[
      3220,
      3220,
      3220,
      3220,
      3220
    ], rfl⟩,
  RawOp.move
    Dir.left
    3218,
  RawOp.marker
    160
    3219,
  RawOp.jump
    ⟨#[
      162,
      162,
      162,
      162,
      162
    ], rfl⟩,
  RawOp.move
    Dir.left
    1337,
  RawOp.marker
    3221
    3222,
  RawOp.jump
    ⟨#[
      3226,
      3226,
      3226,
      3226,
      3226
    ], rfl⟩,
  RawOp.move
    Dir.left
    3224,
  RawOp.marker
    1326
    3225,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3221
    1326,
  RawOp.move
    Dir.left
    1329,
  RawOp.marker
    3227
    3228,
  RawOp.jump
    ⟨#[
      3232,
      3232,
      3232,
      3232,
      3232
    ], rfl⟩,
  RawOp.move
    Dir.left
    3230
]
theorem fact_100_1 : source_100_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_100_1 := by decide +kernel
theorem bounds_100_1 : raws_100_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_99_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_99_1 source_100_1
noncomputable def raws_99_2 : List RawOp := raws_99_1 ++ raws_100_1
theorem fact_99_2 : source_99_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_99_2 :=
  source_branch 32 source_99_1 source_100_1 raws_99_1 raws_100_1 fact_99_1 fact_100_1
theorem bounds_99_2 : raws_99_2.all (labelsBounded 4042) = true :=
  bounds_append raws_99_1 raws_100_1 bounds_99_1 bounds_100_1
noncomputable def source_101_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3232
noncomputable def raws_101_1 : List RawOp := [
  RawOp.marker
    161
    3231,
  RawOp.jump
    ⟨#[
      3236,
      3236,
      3236,
      3236,
      3236
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      165,
      165,
      165,
      165,
      165
    ], rfl⟩,
  RawOp.move
    Dir.left
    3233,
  RawOp.marker
    3234
    3235,
  RawOp.jump
    ⟨#[
      3239,
      3239,
      3239,
      3239,
      3239
    ], rfl⟩,
  RawOp.move
    Dir.left
    3237,
  RawOp.marker
    1340
    3238,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3234
    1340,
  RawOp.move
    Dir.left
    1343,
  RawOp.marker
    3240
    3241,
  RawOp.jump
    ⟨#[
      3245,
      3245,
      3245,
      3245,
      3245
    ], rfl⟩,
  RawOp.move
    Dir.left
    3243,
  RawOp.marker
    162
    3244,
  RawOp.move
    Dir.left
    1351,
  RawOp.marker
    164
    3246,
  RawOp.jump
    ⟨#[
      3250,
      3250,
      3250,
      3250,
      3250
    ], rfl⟩,
  RawOp.move
    Dir.left
    3248,
  RawOp.marker
    163
    3249,
  RawOp.jump
    ⟨#[
      3253,
      3253,
      3253,
      3253,
      3253
    ], rfl⟩,
  RawOp.move
    Dir.left
    3251,
  RawOp.marker
    165
    3252,
  RawOp.jump
    ⟨#[
      3257,
      3257,
      3257,
      3257,
      3257
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      169,
      169,
      169,
      169,
      169
    ], rfl⟩,
  RawOp.move
    Dir.left
    3254,
  RawOp.marker
    3255
    3256,
  RawOp.jump
    ⟨#[
      3260,
      3260,
      3260,
      3260,
      3260
    ], rfl⟩,
  RawOp.move
    Dir.left
    3258,
  RawOp.marker
    1357
    3259,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3255
    1357,
  RawOp.move
    Dir.left
    1360,
  RawOp.marker
    3261
    3262
]
theorem fact_101_1 : source_101_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_101_1 := by decide +kernel
theorem bounds_101_1 : raws_101_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_102_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3264
noncomputable def raws_102_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3266,
      3266,
      3266,
      3266,
      3266
    ], rfl⟩,
  RawOp.move
    Dir.left
    3264,
  RawOp.marker
    166
    3265,
  RawOp.move
    Dir.left
    1368,
  RawOp.marker
    168
    3267,
  RawOp.jump
    ⟨#[
      3271,
      3271,
      3271,
      3271,
      3271
    ], rfl⟩,
  RawOp.move
    Dir.left
    3269,
  RawOp.marker
    167
    3270,
  RawOp.jump
    ⟨#[
      3274,
      3274,
      3274,
      3274,
      3274
    ], rfl⟩,
  RawOp.move
    Dir.left
    3272,
  RawOp.marker
    169
    3273,
  RawOp.move
    Dir.left
    1373,
  RawOp.marker
    171
    3275,
  RawOp.jump
    ⟨#[
      3279,
      3279,
      3279,
      3279,
      3279
    ], rfl⟩,
  RawOp.move
    Dir.left
    3277,
  RawOp.marker
    170
    3278,
  RawOp.jump
    ⟨#[
      3282,
      3282,
      3282,
      3282,
      3282
    ], rfl⟩,
  RawOp.move
    Dir.left
    3280,
  RawOp.marker
    172
    3281,
  RawOp.jump
    ⟨#[
      3285,
      3285,
      3285,
      3285,
      3285
    ], rfl⟩,
  RawOp.move
    Dir.left
    3283,
  RawOp.marker
    173
    3284,
  RawOp.jump
    ⟨#[
      3288,
      3288,
      3288,
      3288,
      3288
    ], rfl⟩,
  RawOp.move
    Dir.left
    3286,
  RawOp.marker
    174
    3287,
  RawOp.jump
    ⟨#[
      3291,
      3291,
      3291,
      3291,
      3291
    ], rfl⟩,
  RawOp.move
    Dir.left
    3289,
  RawOp.marker
    1384
    3290,
  RawOp.jump
    ⟨#[
      176,
      176,
      176,
      176,
      176
    ], rfl⟩,
  RawOp.move
    Dir.left
    1408,
  RawOp.marker
    3292
    3293,
  RawOp.jump
    ⟨#[
      182,
      182,
      182,
      182,
      182
    ], rfl⟩
]
theorem fact_102_1 : source_102_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_102_1 := by decide +kernel
theorem bounds_102_1 : raws_102_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_101_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_101_1 source_102_1
noncomputable def raws_101_2 : List RawOp := raws_101_1 ++ raws_102_1
theorem fact_101_2 : source_101_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_101_2 :=
  source_branch 32 source_101_1 source_102_1 raws_101_1 raws_102_1 fact_101_1 fact_102_1
theorem bounds_101_2 : raws_101_2.all (labelsBounded 4042) = true :=
  bounds_append raws_101_1 raws_102_1 bounds_101_1 bounds_102_1
noncomputable def source_99_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_99_2 source_101_2
noncomputable def raws_99_4 : List RawOp := raws_99_2 ++ raws_101_2
theorem fact_99_4 : source_99_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_99_4 :=
  source_branch 64 source_99_2 source_101_2 raws_99_2 raws_101_2 fact_99_2 fact_101_2
theorem bounds_99_4 : raws_99_4.all (labelsBounded 4042) = true :=
  bounds_append raws_99_2 raws_101_2 bounds_99_2 bounds_101_2
noncomputable def source_95_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_95_4 source_99_4
noncomputable def raws_95_8 : List RawOp := raws_95_4 ++ raws_99_4
theorem fact_95_8 : source_95_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_8 :=
  source_branch 128 source_95_4 source_99_4 raws_95_4 raws_99_4 fact_95_4 fact_99_4
theorem bounds_95_8 : raws_95_8.all (labelsBounded 4042) = true :=
  bounds_append raws_95_4 raws_99_4 bounds_95_4 bounds_99_4
noncomputable def source_103_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3296
noncomputable def raws_103_1 : List RawOp := [
  RawOp.move
    Dir.left
    1387,
  RawOp.marker
    3295
    3296,
  RawOp.jump
    ⟨#[
      3300,
      3300,
      3300,
      3300,
      3300
    ], rfl⟩,
  RawOp.move
    Dir.left
    3298,
  RawOp.marker
    1390
    3299,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3295
    1390,
  RawOp.move
    Dir.left
    1393,
  RawOp.marker
    3301
    3302,
  RawOp.jump
    ⟨#[
      3306,
      3306,
      3306,
      3306,
      3306
    ], rfl⟩,
  RawOp.move
    Dir.left
    3304,
  RawOp.marker
    1397
    3305,
  RawOp.jump
    ⟨#[
      3310,
      3310,
      3310,
      3310,
      3310
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3292
    1397,
  RawOp.move
    Dir.left
    3307,
  RawOp.marker
    3308
    3309,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1384
    3308,
  RawOp.move
    Dir.left
    1400,
  RawOp.marker
    3311
    3312,
  RawOp.jump
    ⟨#[
      3316,
      3316,
      3316,
      3316,
      3316
    ], rfl⟩,
  RawOp.move
    Dir.left
    3314,
  RawOp.marker
    175
    3315,
  RawOp.jump
    ⟨#[
      3320,
      3320,
      3320,
      3320,
      3320
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      179,
      179,
      179,
      179,
      179
    ], rfl⟩,
  RawOp.move
    Dir.left
    3317,
  RawOp.marker
    3318
    3319,
  RawOp.jump
    ⟨#[
      3323,
      3323,
      3323,
      3323,
      3323
    ], rfl⟩,
  RawOp.move
    Dir.left
    3321,
  RawOp.marker
    1411
    3322,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3318
    1411,
  RawOp.move
    Dir.left
    1414,
  RawOp.marker
    3324
    3325,
  RawOp.jump
    ⟨#[
      3329,
      3329,
      3329,
      3329,
      3329
    ], rfl⟩
]
theorem fact_103_1 : source_103_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_103_1 := by decide +kernel
theorem bounds_103_1 : raws_103_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t104\t{now}"
      handle.flush
noncomputable def source_104_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3328
noncomputable def raws_104_1 : List RawOp := [
  RawOp.move
    Dir.left
    3327,
  RawOp.marker
    176
    3328,
  RawOp.move
    Dir.left
    1422,
  RawOp.marker
    178
    3330,
  RawOp.jump
    ⟨#[
      3334,
      3334,
      3334,
      3334,
      3334
    ], rfl⟩,
  RawOp.move
    Dir.left
    3332,
  RawOp.marker
    177
    3333,
  RawOp.jump
    ⟨#[
      3337,
      3337,
      3337,
      3337,
      3337
    ], rfl⟩,
  RawOp.move
    Dir.left
    3335,
  RawOp.marker
    179
    3336,
  RawOp.jump
    ⟨#[
      3341,
      3341,
      3341,
      3341,
      3341
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      181,
      181,
      181,
      181,
      181
    ], rfl⟩,
  RawOp.move
    Dir.left
    3338,
  RawOp.marker
    3339
    3340,
  RawOp.jump
    ⟨#[
      3344,
      3344,
      3344,
      3344,
      3344
    ], rfl⟩,
  RawOp.move
    Dir.left
    3342,
  RawOp.marker
    1428
    3343,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3339
    1428,
  RawOp.move
    Dir.left
    1431,
  RawOp.marker
    3345
    3346,
  RawOp.jump
    ⟨#[
      3350,
      3350,
      3350,
      3350,
      3350
    ], rfl⟩,
  RawOp.move
    Dir.left
    3348,
  RawOp.marker
    180
    3349,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    145
    3339,
  RawOp.move
    Dir.left
    1439,
  RawOp.marker
    3351
    3352,
  RawOp.jump
    ⟨#[
      3356,
      3356,
      3356,
      3356,
      3356
    ], rfl⟩,
  RawOp.move
    Dir.left
    3354,
  RawOp.marker
    181
    3355,
  RawOp.jump
    ⟨#[
      3360,
      3360,
      3360,
      3360,
      3360
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      183,
      183,
      183,
      183,
      183
    ], rfl⟩,
  RawOp.move
    Dir.left
    3357
]
theorem fact_104_1 : source_104_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_104_1 := by decide +kernel
theorem bounds_104_1 : raws_104_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_103_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_103_1 source_104_1
noncomputable def raws_103_2 : List RawOp := raws_103_1 ++ raws_104_1
theorem fact_103_2 : source_103_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_103_2 :=
  source_branch 32 source_103_1 source_104_1 raws_103_1 raws_104_1 fact_103_1 fact_104_1
theorem bounds_103_2 : raws_103_2.all (labelsBounded 4042) = true :=
  bounds_append raws_103_1 raws_104_1 bounds_103_1 bounds_104_1
noncomputable def source_105_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3360
noncomputable def raws_105_1 : List RawOp := [
  RawOp.marker
    3358
    3359,
  RawOp.jump
    ⟨#[
      3363,
      3363,
      3363,
      3363,
      3363
    ], rfl⟩,
  RawOp.move
    Dir.left
    3361,
  RawOp.marker
    1448
    3362,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3358
    1448,
  RawOp.move
    Dir.left
    1451,
  RawOp.marker
    3364
    3365,
  RawOp.jump
    ⟨#[
      3369,
      3369,
      3369,
      3369,
      3369
    ], rfl⟩,
  RawOp.move
    Dir.left
    3367,
  RawOp.marker
    182
    3368,
  RawOp.move
    Dir.left
    1467,
  RawOp.marker
    226
    3370,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    226
    3358,
  RawOp.move
    Dir.left
    1459,
  RawOp.marker
    3372
    3373,
  RawOp.jump
    ⟨#[
      3377,
      3377,
      3377,
      3377,
      3377
    ], rfl⟩,
  RawOp.move
    Dir.left
    3375,
  RawOp.marker
    183
    3376,
  RawOp.jump
    ⟨#[
      3380,
      3380,
      3380,
      3380,
      3380
    ], rfl⟩,
  RawOp.move
    Dir.left
    3378,
  RawOp.marker
    1470
    3379,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3138
    1470,
  RawOp.move
    Dir.left
    1473,
  RawOp.marker
    3381
    3382,
  RawOp.jump
    ⟨#[
      3386,
      3386,
      3386,
      3386,
      3386
    ], rfl⟩,
  RawOp.move
    Dir.left
    3384,
  RawOp.marker
    184
    3385,
  RawOp.jump
    ⟨#[
      3390,
      3390,
      3390,
      3390,
      3390
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      188,
      188,
      188,
      188,
      188
    ], rfl⟩,
  RawOp.move
    Dir.left
    3387,
  RawOp.marker
    3388
    3389,
  RawOp.jump
    ⟨#[
      3393,
      3393,
      3393,
      3393,
      3393
    ], rfl⟩
]
theorem fact_105_1 : source_105_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_105_1 := by decide +kernel
theorem bounds_105_1 : raws_105_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_106_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3392
noncomputable def raws_106_1 : List RawOp := [
  RawOp.move
    Dir.left
    3391,
  RawOp.marker
    1484
    3392,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3388
    1484,
  RawOp.move
    Dir.left
    1487,
  RawOp.marker
    3394
    3395,
  RawOp.jump
    ⟨#[
      3399,
      3399,
      3399,
      3399,
      3399
    ], rfl⟩,
  RawOp.move
    Dir.left
    3397,
  RawOp.marker
    185
    3398,
  RawOp.move
    Dir.left
    1495,
  RawOp.marker
    187
    3400,
  RawOp.jump
    ⟨#[
      3404,
      3404,
      3404,
      3404,
      3404
    ], rfl⟩,
  RawOp.move
    Dir.left
    3402,
  RawOp.marker
    186
    3403,
  RawOp.jump
    ⟨#[
      3407,
      3407,
      3407,
      3407,
      3407
    ], rfl⟩,
  RawOp.move
    Dir.left
    3405,
  RawOp.marker
    188
    3406,
  RawOp.jump
    ⟨#[
      3411,
      3411,
      3411,
      3411,
      3411
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      190,
      190,
      190,
      190,
      190
    ], rfl⟩,
  RawOp.move
    Dir.left
    3408,
  RawOp.marker
    3409
    3410,
  RawOp.jump
    ⟨#[
      3414,
      3414,
      3414,
      3414,
      3414
    ], rfl⟩,
  RawOp.move
    Dir.left
    3412,
  RawOp.marker
    1501
    3413,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3409
    1501,
  RawOp.move
    Dir.left
    1504,
  RawOp.marker
    3415
    3416,
  RawOp.jump
    ⟨#[
      3420,
      3420,
      3420,
      3420,
      3420
    ], rfl⟩,
  RawOp.move
    Dir.left
    3418,
  RawOp.marker
    189
    3419,
  RawOp.jump
    ⟨#[
      191,
      191,
      191,
      191,
      191
    ], rfl⟩,
  RawOp.move
    Dir.left
    1520,
  RawOp.marker
    3421
    3422
]
theorem fact_106_1 : source_106_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_106_1 := by decide +kernel
theorem bounds_106_1 : raws_106_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_105_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_105_1 source_106_1
noncomputable def raws_105_2 : List RawOp := raws_105_1 ++ raws_106_1
theorem fact_105_2 : source_105_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_105_2 :=
  source_branch 32 source_105_1 source_106_1 raws_105_1 raws_106_1 fact_105_1 fact_106_1
theorem bounds_105_2 : raws_105_2.all (labelsBounded 4042) = true :=
  bounds_append raws_105_1 raws_106_1 bounds_105_1 bounds_106_1
noncomputable def source_103_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_103_2 source_105_2
noncomputable def raws_103_4 : List RawOp := raws_103_2 ++ raws_105_2
theorem fact_103_4 : source_103_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_103_4 :=
  source_branch 64 source_103_2 source_105_2 raws_103_2 raws_105_2 fact_103_2 fact_105_2
theorem bounds_103_4 : raws_103_4.all (labelsBounded 4042) = true :=
  bounds_append raws_103_2 raws_105_2 bounds_103_2 bounds_105_2
noncomputable def source_107_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3424
noncomputable def raws_107_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3421
    3409,
  RawOp.move
    Dir.left
    1512,
  RawOp.marker
    3424
    3425,
  RawOp.jump
    ⟨#[
      3429,
      3429,
      3429,
      3429,
      3429
    ], rfl⟩,
  RawOp.move
    Dir.left
    3427,
  RawOp.marker
    190
    3428,
  RawOp.jump
    ⟨#[
      3433,
      3433,
      3433,
      3433,
      3433
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      194,
      194,
      194,
      194,
      194
    ], rfl⟩,
  RawOp.move
    Dir.left
    3430,
  RawOp.marker
    3431
    3432,
  RawOp.jump
    ⟨#[
      3436,
      3436,
      3436,
      3436,
      3436
    ], rfl⟩,
  RawOp.move
    Dir.left
    3434,
  RawOp.marker
    1523
    3435,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3431
    1523,
  RawOp.move
    Dir.left
    1526,
  RawOp.marker
    3437
    3438,
  RawOp.jump
    ⟨#[
      3442,
      3442,
      3442,
      3442,
      3442
    ], rfl⟩,
  RawOp.move
    Dir.left
    3440,
  RawOp.marker
    191
    3441,
  RawOp.move
    Dir.left
    1534,
  RawOp.marker
    193
    3443,
  RawOp.jump
    ⟨#[
      3447,
      3447,
      3447,
      3447,
      3447
    ], rfl⟩,
  RawOp.move
    Dir.left
    3445,
  RawOp.marker
    192
    3446,
  RawOp.jump
    ⟨#[
      3450,
      3450,
      3450,
      3450,
      3450
    ], rfl⟩,
  RawOp.move
    Dir.left
    3448,
  RawOp.marker
    194
    3449,
  RawOp.move
    Dir.left
    1539,
  RawOp.marker
    196
    3451,
  RawOp.jump
    ⟨#[
      3455,
      3455,
      3455,
      3455,
      3455
    ], rfl⟩,
  RawOp.move
    Dir.left
    3453,
  RawOp.marker
    195
    3454
]
theorem fact_107_1 : source_107_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_107_1 := by decide +kernel
theorem bounds_107_1 : raws_107_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_108_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3456
noncomputable def raws_108_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3458,
      3458,
      3458,
      3458,
      3458
    ], rfl⟩,
  RawOp.move
    Dir.left
    3456,
  RawOp.marker
    197
    3457,
  RawOp.move
    Dir.left
    1548,
  RawOp.marker
    1545
    3459,
  RawOp.jump
    ⟨#[
      3463,
      3463,
      3463,
      3463,
      3463
    ], rfl⟩,
  RawOp.move
    Dir.left
    3461,
  RawOp.marker
    1551
    3462,
  RawOp.jump
    ⟨#[
      3467,
      3467,
      3467,
      3467,
      3467
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      201,
      201,
      201,
      201,
      201
    ], rfl⟩,
  RawOp.move
    Dir.left
    3464,
  RawOp.marker
    3465
    3466,
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    1551
    3465,
  RawOp.move
    Dir.left
    1554,
  RawOp.marker
    3468
    3469,
  RawOp.jump
    ⟨#[
      3473,
      3473,
      3473,
      3473,
      3473
    ], rfl⟩,
  RawOp.move
    Dir.left
    3471,
  RawOp.marker
    198
    3472,
  RawOp.move
    Dir.left
    1562,
  RawOp.marker
    200
    3474,
  RawOp.jump
    ⟨#[
      3478,
      3478,
      3478,
      3478,
      3478
    ], rfl⟩,
  RawOp.move
    Dir.left
    3476,
  RawOp.marker
    199
    3477,
  RawOp.jump
    ⟨#[
      3481,
      3481,
      3481,
      3481,
      3481
    ], rfl⟩,
  RawOp.move
    Dir.left
    3479,
  RawOp.marker
    201
    3480,
  RawOp.move
    Dir.left
    1567,
  RawOp.marker
    203
    3482,
  RawOp.jump
    ⟨#[
      3486,
      3486,
      3486,
      3486,
      3486
    ], rfl⟩,
  RawOp.move
    Dir.left
    3484,
  RawOp.marker
    202
    3485,
  RawOp.jump
    ⟨#[
      3489,
      3489,
      3489,
      3489,
      3489
    ], rfl⟩
]
theorem fact_108_1 : source_108_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_108_1 := by decide +kernel
theorem bounds_108_1 : raws_108_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_107_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_107_1 source_108_1
noncomputable def raws_107_2 : List RawOp := raws_107_1 ++ raws_108_1
theorem fact_107_2 : source_107_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_107_2 :=
  source_branch 32 source_107_1 source_108_1 raws_107_1 raws_108_1 fact_107_1 fact_108_1
theorem bounds_107_2 : raws_107_2.all (labelsBounded 4042) = true :=
  bounds_append raws_107_1 raws_108_1 bounds_107_1 bounds_108_1
noncomputable def source_109_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3488
noncomputable def raws_109_1 : List RawOp := [
  RawOp.move
    Dir.left
    3487,
  RawOp.marker
    204
    3488,
  RawOp.move
    Dir.left
    1572,
  RawOp.marker
    206
    3490,
  RawOp.jump
    ⟨#[
      3494,
      3494,
      3494,
      3494,
      3494
    ], rfl⟩,
  RawOp.move
    Dir.left
    3492,
  RawOp.marker
    205
    3493,
  RawOp.jump
    ⟨#[
      3497,
      3497,
      3497,
      3497,
      3497
    ], rfl⟩,
  RawOp.move
    Dir.left
    3495,
  RawOp.marker
    207
    3496,
  RawOp.jump
    ⟨#[
      3500,
      3500,
      3500,
      3500,
      3500
    ], rfl⟩,
  RawOp.move
    Dir.left
    3498,
  RawOp.marker
    208
    3499,
  RawOp.jump
    ⟨#[
      3503,
      3503,
      3503,
      3503,
      3503
    ], rfl⟩,
  RawOp.move
    Dir.left
    3501,
  RawOp.marker
    209
    3502,
  RawOp.jump
    ⟨#[
      3507,
      3507,
      3507,
      3507,
      3507
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      213,
      213,
      213,
      213,
      213
    ], rfl⟩,
  RawOp.move
    Dir.left
    3504,
  RawOp.marker
    3505
    3506,
  RawOp.jump
    ⟨#[
      3510,
      3510,
      3510,
      3510,
      3510
    ], rfl⟩,
  RawOp.move
    Dir.left
    3508,
  RawOp.marker
    1583
    3509,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3505
    1583,
  RawOp.move
    Dir.left
    1586,
  RawOp.marker
    3511
    3512,
  RawOp.jump
    ⟨#[
      3516,
      3516,
      3516,
      3516,
      3516
    ], rfl⟩,
  RawOp.move
    Dir.left
    3514,
  RawOp.marker
    210
    3515,
  RawOp.move
    Dir.left
    1594,
  RawOp.marker
    212
    3517,
  RawOp.jump
    ⟨#[
      3521,
      3521,
      3521,
      3521,
      3521
    ], rfl⟩
]
theorem fact_109_1 : source_109_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_109_1 := by decide +kernel
theorem bounds_109_1 : raws_109_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_110_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3520
noncomputable def raws_110_1 : List RawOp := [
  RawOp.move
    Dir.left
    3519,
  RawOp.marker
    211
    3520,
  RawOp.jump
    ⟨#[
      3524,
      3524,
      3524,
      3524,
      3524
    ], rfl⟩,
  RawOp.move
    Dir.left
    3522,
  RawOp.marker
    213
    3523,
  RawOp.jump
    ⟨#[
      215,
      215,
      215,
      215,
      215
    ], rfl⟩,
  RawOp.move
    Dir.left
    1611,
  RawOp.marker
    3525
    3526,
  RawOp.jump
    ⟨#[
      3530,
      3530,
      3530,
      3530,
      3530
    ], rfl⟩,
  RawOp.move
    Dir.left
    3528,
  RawOp.marker
    1600
    3529,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3525
    1600,
  RawOp.move
    Dir.left
    1603,
  RawOp.marker
    3531
    3532,
  RawOp.jump
    ⟨#[
      3536,
      3536,
      3536,
      3536,
      3536
    ], rfl⟩,
  RawOp.move
    Dir.left
    3534,
  RawOp.marker
    214
    3535,
  RawOp.jump
    ⟨#[
      3539,
      3539,
      3539,
      3539,
      3539
    ], rfl⟩,
  RawOp.move
    Dir.left
    3537,
  RawOp.marker
    1614
    3538,
  RawOp.jump
    ⟨#[
      3543,
      3543,
      3543,
      3543,
      3543
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      217,
      217,
      217,
      217,
      217
    ], rfl⟩,
  RawOp.move
    Dir.left
    3540,
  RawOp.marker
    3541
    3542,
  RawOp.jump
    ⟨#[
      218,
      218,
      218,
      218,
      218
    ], rfl⟩,
  RawOp.move
    Dir.left
    1617,
  RawOp.marker
    3544
    3545,
  RawOp.jump
    ⟨#[
      3549,
      3549,
      3549,
      3549,
      3549
    ], rfl⟩,
  RawOp.move
    Dir.left
    3547,
  RawOp.marker
    1620
    3548,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3544
    1620,
  RawOp.move
    Dir.left
    1623
]
theorem fact_110_1 : source_110_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_110_1 := by decide +kernel
theorem bounds_110_1 : raws_110_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_109_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_109_1 source_110_1
noncomputable def raws_109_2 : List RawOp := raws_109_1 ++ raws_110_1
theorem fact_109_2 : source_109_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_109_2 :=
  source_branch 32 source_109_1 source_110_1 raws_109_1 raws_110_1 fact_109_1 fact_110_1
theorem bounds_109_2 : raws_109_2.all (labelsBounded 4042) = true :=
  bounds_append raws_109_1 raws_110_1 bounds_109_1 bounds_110_1
noncomputable def source_107_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_107_2 source_109_2
noncomputable def raws_107_4 : List RawOp := raws_107_2 ++ raws_109_2
theorem fact_107_4 : source_107_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_107_4 :=
  source_branch 64 source_107_2 source_109_2 raws_107_2 raws_109_2 fact_107_2 fact_109_2
theorem bounds_107_4 : raws_107_4.all (labelsBounded 4042) = true :=
  bounds_append raws_107_2 raws_109_2 bounds_107_2 bounds_109_2
noncomputable def source_103_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_103_4 source_107_4
noncomputable def raws_103_8 : List RawOp := raws_103_4 ++ raws_107_4
theorem fact_103_8 : source_103_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_103_8 :=
  source_branch 128 source_103_4 source_107_4 raws_103_4 raws_107_4 fact_103_4 fact_107_4
theorem bounds_103_8 : raws_103_8.all (labelsBounded 4042) = true :=
  bounds_append raws_103_4 raws_107_4 bounds_103_4 bounds_107_4
noncomputable def source_95_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_95_8 source_103_8
noncomputable def raws_95_16 : List RawOp := raws_95_8 ++ raws_103_8
theorem fact_95_16 : source_95_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_16 :=
  source_branch 256 source_95_8 source_103_8 raws_95_8 raws_103_8 fact_95_8 fact_103_8
theorem bounds_95_16 : raws_95_16.all (labelsBounded 4042) = true :=
  bounds_append raws_95_8 raws_103_8 bounds_95_8 bounds_103_8
noncomputable def source_111_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3552
noncomputable def raws_111_1 : List RawOp := [
  RawOp.marker
    3550
    3551,
  RawOp.jump
    ⟨#[
      3555,
      3555,
      3555,
      3555,
      3555
    ], rfl⟩,
  RawOp.move
    Dir.left
    3553,
  RawOp.marker
    1627
    3554,
  RawOp.jump
    ⟨#[
      3559,
      3559,
      3559,
      3559,
      3559
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3541
    1627,
  RawOp.move
    Dir.left
    3556,
  RawOp.marker
    3557
    3558,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1614
    3557,
  RawOp.move
    Dir.left
    1630,
  RawOp.marker
    3560
    3561,
  RawOp.jump
    ⟨#[
      3565,
      3565,
      3565,
      3565,
      3565
    ], rfl⟩,
  RawOp.move
    Dir.left
    3563,
  RawOp.marker
    215
    3564,
  RawOp.jump
    ⟨#[
      3568,
      3568,
      3568,
      3568,
      3568
    ], rfl⟩,
  RawOp.move
    Dir.left
    3566,
  RawOp.marker
    216
    3567,
  RawOp.jump
    ⟨#[
      3571,
      3571,
      3571,
      3571,
      3571
    ], rfl⟩,
  RawOp.move
    Dir.left
    3569,
  RawOp.marker
    217
    3570,
  RawOp.jump
    ⟨#[
      219,
      219,
      219,
      219,
      219
    ], rfl⟩,
  RawOp.move
    Dir.left
    1650,
  RawOp.marker
    3572
    3573,
  RawOp.jump
    ⟨#[
      3577,
      3577,
      3577,
      3577,
      3577
    ], rfl⟩,
  RawOp.move
    Dir.left
    3575,
  RawOp.marker
    1639
    3576,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3572
    1639,
  RawOp.move
    Dir.left
    1642,
  RawOp.marker
    3578
    3579,
  RawOp.jump
    ⟨#[
      3583,
      3583,
      3583,
      3583,
      3583
    ], rfl⟩,
  RawOp.move
    Dir.left
    3581,
  RawOp.marker
    218
    3582
]
theorem fact_111_1 : source_111_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_111_1 := by decide +kernel
theorem bounds_111_1 : raws_111_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t112\t{now}"
      handle.flush
noncomputable def source_112_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3584
noncomputable def raws_112_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3586,
      3586,
      3586,
      3586,
      3586
    ], rfl⟩,
  RawOp.move
    Dir.left
    3584,
  RawOp.marker
    1653
    3585,
  RawOp.jump
    ⟨#[
      3590,
      3590,
      3590,
      3590,
      3590
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      220,
      220,
      220,
      220,
      220
    ], rfl⟩,
  RawOp.move
    Dir.left
    3587,
  RawOp.marker
    3588
    3589,
  RawOp.jump
    ⟨#[
      221,
      221,
      221,
      221,
      221
    ], rfl⟩,
  RawOp.move
    Dir.left
    1656,
  RawOp.marker
    3591
    3592,
  RawOp.jump
    ⟨#[
      3596,
      3596,
      3596,
      3596,
      3596
    ], rfl⟩,
  RawOp.move
    Dir.left
    3594,
  RawOp.marker
    1659
    3595,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3591
    1659,
  RawOp.move
    Dir.left
    1662,
  RawOp.marker
    3597
    3598,
  RawOp.jump
    ⟨#[
      3602,
      3602,
      3602,
      3602,
      3602
    ], rfl⟩,
  RawOp.move
    Dir.left
    3600,
  RawOp.marker
    1666
    3601,
  RawOp.jump
    ⟨#[
      3606,
      3606,
      3606,
      3606,
      3606
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3588
    1666,
  RawOp.move
    Dir.left
    3603,
  RawOp.marker
    3604
    3605,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1653
    3604,
  RawOp.move
    Dir.left
    1669,
  RawOp.marker
    3607
    3608,
  RawOp.jump
    ⟨#[
      3612,
      3612,
      3612,
      3612,
      3612
    ], rfl⟩,
  RawOp.move
    Dir.left
    3610,
  RawOp.marker
    219
    3611,
  RawOp.move
    Dir.left
    1781,
  RawOp.marker
    220
    3613,
  RawOp.jump
    ⟨#[
      222,
      222,
      222,
      222,
      222
    ], rfl⟩
]
theorem fact_112_1 : source_112_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_112_1 := by decide +kernel
theorem bounds_112_1 : raws_112_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_111_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_111_1 source_112_1
noncomputable def raws_111_2 : List RawOp := raws_111_1 ++ raws_112_1
theorem fact_111_2 : source_111_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_111_2 :=
  source_branch 32 source_111_1 source_112_1 raws_111_1 raws_112_1 fact_111_1 fact_112_1
theorem bounds_111_2 : raws_111_2.all (labelsBounded 4042) = true :=
  bounds_append raws_111_1 raws_112_1 bounds_111_1 bounds_112_1
noncomputable def source_113_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3616
noncomputable def raws_113_1 : List RawOp := [
  RawOp.move
    Dir.left
    1689,
  RawOp.marker
    3615
    3616,
  RawOp.jump
    ⟨#[
      3620,
      3620,
      3620,
      3620,
      3620
    ], rfl⟩,
  RawOp.move
    Dir.left
    3618,
  RawOp.marker
    1678
    3619,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3615
    1678,
  RawOp.move
    Dir.left
    1681,
  RawOp.marker
    3621
    3622,
  RawOp.jump
    ⟨#[
      3626,
      3626,
      3626,
      3626,
      3626
    ], rfl⟩,
  RawOp.move
    Dir.left
    3624,
  RawOp.marker
    221
    3625,
  RawOp.jump
    ⟨#[
      3629,
      3629,
      3629,
      3629,
      3629
    ], rfl⟩,
  RawOp.move
    Dir.left
    3627,
  RawOp.marker
    1692
    3628,
  RawOp.jump
    ⟨#[
      3633,
      3633,
      3633,
      3633,
      3633
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      223,
      223,
      223,
      223,
      223
    ], rfl⟩,
  RawOp.move
    Dir.left
    3630,
  RawOp.marker
    3631
    3632,
  RawOp.jump
    ⟨#[
      224,
      224,
      224,
      224,
      224
    ], rfl⟩,
  RawOp.move
    Dir.left
    1695,
  RawOp.marker
    3634
    3635,
  RawOp.jump
    ⟨#[
      3639,
      3639,
      3639,
      3639,
      3639
    ], rfl⟩,
  RawOp.move
    Dir.left
    3637,
  RawOp.marker
    1698
    3638,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3634
    1698,
  RawOp.move
    Dir.left
    1701,
  RawOp.marker
    3640
    3641,
  RawOp.jump
    ⟨#[
      3645,
      3645,
      3645,
      3645,
      3645
    ], rfl⟩,
  RawOp.move
    Dir.left
    3643,
  RawOp.marker
    1705
    3644,
  RawOp.jump
    ⟨#[
      3649,
      3649,
      3649,
      3649,
      3649
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3631
    1705
]
theorem fact_113_1 : source_113_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_113_1 := by decide +kernel
theorem bounds_113_1 : raws_113_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_114_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3648
noncomputable def raws_114_1 : List RawOp := [
  RawOp.move
    Dir.left
    3646,
  RawOp.marker
    3647
    3648,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1692
    3647,
  RawOp.move
    Dir.left
    1708,
  RawOp.marker
    3650
    3651,
  RawOp.jump
    ⟨#[
      3655,
      3655,
      3655,
      3655,
      3655
    ], rfl⟩,
  RawOp.move
    Dir.left
    3653,
  RawOp.marker
    222
    3654,
  RawOp.move
    Dir.left
    1962,
  RawOp.marker
    223
    3656,
  RawOp.jump
    ⟨#[
      225,
      225,
      225,
      225,
      225
    ], rfl⟩,
  RawOp.move
    Dir.left
    1728,
  RawOp.marker
    3658
    3659,
  RawOp.jump
    ⟨#[
      3663,
      3663,
      3663,
      3663,
      3663
    ], rfl⟩,
  RawOp.move
    Dir.left
    3661,
  RawOp.marker
    1717
    3662,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3658
    1717,
  RawOp.move
    Dir.left
    1720,
  RawOp.marker
    3664
    3665,
  RawOp.jump
    ⟨#[
      3669,
      3669,
      3669,
      3669,
      3669
    ], rfl⟩,
  RawOp.move
    Dir.left
    3667,
  RawOp.marker
    224
    3668,
  RawOp.jump
    ⟨#[
      3672,
      3672,
      3672,
      3672,
      3672
    ], rfl⟩,
  RawOp.move
    Dir.left
    3670,
  RawOp.marker
    1731
    3671,
  RawOp.jump
    ⟨#[
      3676,
      3676,
      3676,
      3676,
      3676
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      226,
      226,
      226,
      226,
      226
    ], rfl⟩,
  RawOp.move
    Dir.left
    3673,
  RawOp.marker
    3674
    3675,
  RawOp.jump
    ⟨#[
      227,
      227,
      227,
      227,
      227
    ], rfl⟩,
  RawOp.move
    Dir.left
    1734,
  RawOp.marker
    3677
    3678
]
theorem fact_114_1 : source_114_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_114_1 := by decide +kernel
theorem bounds_114_1 : raws_114_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_113_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_113_1 source_114_1
noncomputable def raws_113_2 : List RawOp := raws_113_1 ++ raws_114_1
theorem fact_113_2 : source_113_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_113_2 :=
  source_branch 32 source_113_1 source_114_1 raws_113_1 raws_114_1 fact_113_1 fact_114_1
theorem bounds_113_2 : raws_113_2.all (labelsBounded 4042) = true :=
  bounds_append raws_113_1 raws_114_1 bounds_113_1 bounds_114_1
noncomputable def source_111_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_111_2 source_113_2
noncomputable def raws_111_4 : List RawOp := raws_111_2 ++ raws_113_2
theorem fact_111_4 : source_111_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_111_4 :=
  source_branch 64 source_111_2 source_113_2 raws_111_2 raws_113_2 fact_111_2 fact_113_2
theorem bounds_111_4 : raws_111_4.all (labelsBounded 4042) = true :=
  bounds_append raws_111_2 raws_113_2 bounds_111_2 bounds_113_2
noncomputable def source_115_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3680
noncomputable def raws_115_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3682,
      3682,
      3682,
      3682,
      3682
    ], rfl⟩,
  RawOp.move
    Dir.left
    3680,
  RawOp.marker
    1737
    3681,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3677
    1737,
  RawOp.move
    Dir.left
    1740,
  RawOp.marker
    3683
    3684,
  RawOp.jump
    ⟨#[
      3688,
      3688,
      3688,
      3688,
      3688
    ], rfl⟩,
  RawOp.move
    Dir.left
    3686,
  RawOp.marker
    1744
    3687,
  RawOp.jump
    ⟨#[
      3692,
      3692,
      3692,
      3692,
      3692
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3674
    1744,
  RawOp.move
    Dir.left
    3689,
  RawOp.marker
    3690
    3691,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1731
    3690,
  RawOp.move
    Dir.left
    1747,
  RawOp.marker
    3693
    3694,
  RawOp.jump
    ⟨#[
      3698,
      3698,
      3698,
      3698,
      3698
    ], rfl⟩,
  RawOp.move
    Dir.left
    3696,
  RawOp.marker
    225
    3697,
  RawOp.jump
    ⟨#[
      228,
      228,
      228,
      228,
      228
    ], rfl⟩,
  RawOp.move
    Dir.left
    1767,
  RawOp.marker
    3699
    3700,
  RawOp.jump
    ⟨#[
      3704,
      3704,
      3704,
      3704,
      3704
    ], rfl⟩,
  RawOp.move
    Dir.left
    3702,
  RawOp.marker
    1756
    3703,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3699
    1756,
  RawOp.move
    Dir.left
    1759,
  RawOp.marker
    3705
    3706,
  RawOp.jump
    ⟨#[
      3710,
      3710,
      3710,
      3710,
      3710
    ], rfl⟩,
  RawOp.move
    Dir.left
    3708,
  RawOp.marker
    227
    3709,
  RawOp.jump
    ⟨#[
      3713,
      3713,
      3713,
      3713,
      3713
    ], rfl⟩
]
theorem fact_115_1 : source_115_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_115_1 := by decide +kernel
theorem bounds_115_1 : raws_115_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_116_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3712
noncomputable def raws_116_1 : List RawOp := [
  RawOp.move
    Dir.left
    3711,
  RawOp.marker
    1770
    3712,
  RawOp.jump
    ⟨#[
      3717,
      3717,
      3717,
      3717,
      3717
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      229,
      229,
      229,
      229,
      229
    ], rfl⟩,
  RawOp.move
    Dir.left
    3714,
  RawOp.marker
    3715
    3716,
  RawOp.jump
    ⟨#[
      3721,
      3721,
      3721,
      3721,
      3721
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3715
    1005,
  RawOp.move
    Dir.left
    3718,
  RawOp.marker
    3719
    3720,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1770
    3719,
  RawOp.move
    Dir.left
    1773,
  RawOp.marker
    3722
    3723,
  RawOp.jump
    ⟨#[
      3727,
      3727,
      3727,
      3727,
      3727
    ], rfl⟩,
  RawOp.move
    Dir.left
    3725,
  RawOp.marker
    228
    3726,
  RawOp.move
    Dir.left
    1979,
  RawOp.marker
    229
    3728,
  RawOp.jump
    ⟨#[
      3733,
      3733,
      3733,
      3733,
      3733
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      233,
      233,
      233,
      233,
      233
    ], rfl⟩,
  RawOp.move
    Dir.left
    3730,
  RawOp.marker
    3731
    3732,
  RawOp.jump
    ⟨#[
      3736,
      3736,
      3736,
      3736,
      3736
    ], rfl⟩,
  RawOp.move
    Dir.left
    3734,
  RawOp.marker
    1784
    3735,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3731
    1784,
  RawOp.move
    Dir.left
    1787,
  RawOp.marker
    3737
    3738,
  RawOp.jump
    ⟨#[
      3742,
      3742,
      3742,
      3742,
      3742
    ], rfl⟩,
  RawOp.move
    Dir.left
    3740,
  RawOp.marker
    230
    3741,
  RawOp.move
    Dir.left
    1795
]
theorem fact_116_1 : source_116_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_116_1 := by decide +kernel
theorem bounds_116_1 : raws_116_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_115_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_115_1 source_116_1
noncomputable def raws_115_2 : List RawOp := raws_115_1 ++ raws_116_1
theorem fact_115_2 : source_115_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_115_2 :=
  source_branch 32 source_115_1 source_116_1 raws_115_1 raws_116_1 fact_115_1 fact_116_1
theorem bounds_115_2 : raws_115_2.all (labelsBounded 4042) = true :=
  bounds_append raws_115_1 raws_116_1 bounds_115_1 bounds_116_1
noncomputable def source_117_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3744
noncomputable def raws_117_1 : List RawOp := [
  RawOp.marker
    232
    3743,
  RawOp.jump
    ⟨#[
      3747,
      3747,
      3747,
      3747,
      3747
    ], rfl⟩,
  RawOp.move
    Dir.left
    3745,
  RawOp.marker
    231
    3746,
  RawOp.jump
    ⟨#[
      3750,
      3750,
      3750,
      3750,
      3750
    ], rfl⟩,
  RawOp.move
    Dir.left
    3748,
  RawOp.marker
    233
    3749,
  RawOp.jump
    ⟨#[
      3753,
      3753,
      3753,
      3753,
      3753
    ], rfl⟩,
  RawOp.move
    Dir.left
    3751,
  RawOp.marker
    234
    3752,
  RawOp.jump
    ⟨#[
      236,
      236,
      236,
      236,
      236
    ], rfl⟩,
  RawOp.move
    Dir.left
    1808,
  RawOp.marker
    3754
    3755,
  RawOp.jump
    ⟨#[
      3760,
      3760,
      3760,
      3760,
      3760
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      235,
      235,
      235,
      235,
      235
    ], rfl⟩,
  RawOp.move
    Dir.left
    3757,
  RawOp.marker
    3758
    3759,
  RawOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    3754
    3758,
  RawOp.move
    Dir.left
    1800,
  RawOp.marker
    3761
    3762,
  RawOp.jump
    ⟨#[
      3766,
      3766,
      3766,
      3766,
      3766
    ], rfl⟩,
  RawOp.move
    Dir.left
    3764,
  RawOp.marker
    235
    3765,
  RawOp.jump
    ⟨#[
      237,
      237,
      237,
      237,
      237
    ], rfl⟩,
  RawOp.move
    Dir.left
    1822,
  RawOp.marker
    3767
    3768,
  RawOp.jump
    ⟨#[
      3772,
      3772,
      3772,
      3772,
      3772
    ], rfl⟩,
  RawOp.move
    Dir.left
    3770,
  RawOp.marker
    1811
    3771,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3767
    1811,
  RawOp.move
    Dir.left
    1814,
  RawOp.marker
    3773
    3774
]
theorem fact_117_1 : source_117_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_117_1 := by decide +kernel
theorem bounds_117_1 : raws_117_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_118_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3776
noncomputable def raws_118_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3778,
      3778,
      3778,
      3778,
      3778
    ], rfl⟩,
  RawOp.move
    Dir.left
    3776,
  RawOp.marker
    236
    3777,
  RawOp.jump
    ⟨#[
      3782,
      3782,
      3782,
      3782,
      3782
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      240,
      240,
      240,
      240,
      240
    ], rfl⟩,
  RawOp.move
    Dir.left
    3779,
  RawOp.marker
    3780
    3781,
  RawOp.jump
    ⟨#[
      3785,
      3785,
      3785,
      3785,
      3785
    ], rfl⟩,
  RawOp.move
    Dir.left
    3783,
  RawOp.marker
    1825
    3784,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3780
    1825,
  RawOp.move
    Dir.left
    1828,
  RawOp.marker
    3786
    3787,
  RawOp.jump
    ⟨#[
      3791,
      3791,
      3791,
      3791,
      3791
    ], rfl⟩,
  RawOp.move
    Dir.left
    3789,
  RawOp.marker
    237
    3790,
  RawOp.move
    Dir.left
    1836,
  RawOp.marker
    239
    3792,
  RawOp.jump
    ⟨#[
      3796,
      3796,
      3796,
      3796,
      3796
    ], rfl⟩,
  RawOp.move
    Dir.left
    3794,
  RawOp.marker
    238
    3795,
  RawOp.jump
    ⟨#[
      3799,
      3799,
      3799,
      3799,
      3799
    ], rfl⟩,
  RawOp.move
    Dir.left
    3797,
  RawOp.marker
    240
    3798,
  RawOp.jump
    ⟨#[
      242,
      242,
      242,
      242,
      242
    ], rfl⟩,
  RawOp.move
    Dir.left
    1853,
  RawOp.marker
    3800
    3801,
  RawOp.jump
    ⟨#[
      3805,
      3805,
      3805,
      3805,
      3805
    ], rfl⟩,
  RawOp.move
    Dir.left
    3803,
  RawOp.marker
    1842
    3804,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3800
    1842,
  RawOp.move
    Dir.left
    1845
]
theorem fact_118_1 : source_118_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_118_1 := by decide +kernel
theorem bounds_118_1 : raws_118_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_117_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_117_1 source_118_1
noncomputable def raws_117_2 : List RawOp := raws_117_1 ++ raws_118_1
theorem fact_117_2 : source_117_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_117_2 :=
  source_branch 32 source_117_1 source_118_1 raws_117_1 raws_118_1 fact_117_1 fact_118_1
theorem bounds_117_2 : raws_117_2.all (labelsBounded 4042) = true :=
  bounds_append raws_117_1 raws_118_1 bounds_117_1 bounds_118_1
noncomputable def source_115_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_115_2 source_117_2
noncomputable def raws_115_4 : List RawOp := raws_115_2 ++ raws_117_2
theorem fact_115_4 : source_115_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_115_4 :=
  source_branch 64 source_115_2 source_117_2 raws_115_2 raws_117_2 fact_115_2 fact_117_2
theorem bounds_115_4 : raws_115_4.all (labelsBounded 4042) = true :=
  bounds_append raws_115_2 raws_117_2 bounds_115_2 bounds_117_2
noncomputable def source_111_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_111_4 source_115_4
noncomputable def raws_111_8 : List RawOp := raws_111_4 ++ raws_115_4
theorem fact_111_8 : source_111_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_111_8 :=
  source_branch 128 source_111_4 source_115_4 raws_111_4 raws_115_4 fact_111_4 fact_115_4
theorem bounds_111_8 : raws_111_8.all (labelsBounded 4042) = true :=
  bounds_append raws_111_4 raws_115_4 bounds_111_4 bounds_115_4
noncomputable def source_119_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3808
noncomputable def raws_119_1 : List RawOp := [
  RawOp.marker
    3806
    3807,
  RawOp.jump
    ⟨#[
      3811,
      3811,
      3811,
      3811,
      3811
    ], rfl⟩,
  RawOp.move
    Dir.left
    3809,
  RawOp.marker
    241
    3810,
  RawOp.jump
    ⟨#[
      3815,
      3815,
      3815,
      3815,
      3815
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      245,
      245,
      245,
      245,
      245
    ], rfl⟩,
  RawOp.move
    Dir.left
    3812,
  RawOp.marker
    3813
    3814,
  RawOp.jump
    ⟨#[
      3818,
      3818,
      3818,
      3818,
      3818
    ], rfl⟩,
  RawOp.move
    Dir.left
    3816,
  RawOp.marker
    1856
    3817,
  RawOp.branch
    ⟨#[
      true,
      true,
      false,
      false,
      false
    ], rfl⟩
    3813
    1856,
  RawOp.move
    Dir.left
    1859,
  RawOp.marker
    3819
    3820,
  RawOp.jump
    ⟨#[
      3824,
      3824,
      3824,
      3824,
      3824
    ], rfl⟩,
  RawOp.move
    Dir.left
    3822,
  RawOp.marker
    242
    3823,
  RawOp.move
    Dir.left
    1867,
  RawOp.marker
    244
    3825,
  RawOp.jump
    ⟨#[
      3829,
      3829,
      3829,
      3829,
      3829
    ], rfl⟩,
  RawOp.move
    Dir.left
    3827,
  RawOp.marker
    243
    3828,
  RawOp.jump
    ⟨#[
      3832,
      3832,
      3832,
      3832,
      3832
    ], rfl⟩,
  RawOp.move
    Dir.left
    3830,
  RawOp.marker
    245
    3831,
  RawOp.jump
    ⟨#[
      3836,
      3836,
      3836,
      3836,
      3836
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      247,
      247,
      247,
      247,
      247
    ], rfl⟩,
  RawOp.move
    Dir.left
    3833,
  RawOp.marker
    3834
    3835,
  RawOp.jump
    ⟨#[
      3839,
      3839,
      3839,
      3839,
      3839
    ], rfl⟩,
  RawOp.move
    Dir.left
    3837,
  RawOp.marker
    1873
    3838
]
theorem fact_119_1 : source_119_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_119_1 := by decide +kernel
theorem bounds_119_1 : raws_119_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t120\t{now}"
      handle.flush
noncomputable def source_120_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3840
noncomputable def raws_120_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3834
    1873,
  RawOp.move
    Dir.left
    1876,
  RawOp.marker
    3840
    3841,
  RawOp.jump
    ⟨#[
      3845,
      3845,
      3845,
      3845,
      3845
    ], rfl⟩,
  RawOp.move
    Dir.left
    3843,
  RawOp.marker
    246
    3844,
  RawOp.jump
    ⟨#[
      248,
      248,
      248,
      248,
      248
    ], rfl⟩,
  RawOp.move
    Dir.left
    1892,
  RawOp.marker
    3846
    3847,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    3846
    3834,
  RawOp.move
    Dir.left
    1884,
  RawOp.marker
    3849
    3850,
  RawOp.jump
    ⟨#[
      3854,
      3854,
      3854,
      3854,
      3854
    ], rfl⟩,
  RawOp.move
    Dir.left
    3852,
  RawOp.marker
    247
    3853,
  RawOp.jump
    ⟨#[
      3858,
      3858,
      3858,
      3858,
      3858
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      251,
      251,
      251,
      251,
      251
    ], rfl⟩,
  RawOp.move
    Dir.left
    3855,
  RawOp.marker
    3856
    3857,
  RawOp.jump
    ⟨#[
      3861,
      3861,
      3861,
      3861,
      3861
    ], rfl⟩,
  RawOp.move
    Dir.left
    3859,
  RawOp.marker
    1895
    3860,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3856
    1895,
  RawOp.move
    Dir.left
    1898,
  RawOp.marker
    3862
    3863,
  RawOp.jump
    ⟨#[
      3867,
      3867,
      3867,
      3867,
      3867
    ], rfl⟩,
  RawOp.move
    Dir.left
    3865,
  RawOp.marker
    248
    3866,
  RawOp.move
    Dir.left
    1906,
  RawOp.marker
    250
    3868,
  RawOp.jump
    ⟨#[
      3872,
      3872,
      3872,
      3872,
      3872
    ], rfl⟩,
  RawOp.move
    Dir.left
    3870
]
theorem fact_120_1 : source_120_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_120_1 := by decide +kernel
theorem bounds_120_1 : raws_120_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_119_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_119_1 source_120_1
noncomputable def raws_119_2 : List RawOp := raws_119_1 ++ raws_120_1
theorem fact_119_2 : source_119_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_119_2 :=
  source_branch 32 source_119_1 source_120_1 raws_119_1 raws_120_1 fact_119_1 fact_120_1
theorem bounds_119_2 : raws_119_2.all (labelsBounded 4042) = true :=
  bounds_append raws_119_1 raws_120_1 bounds_119_1 bounds_120_1
noncomputable def source_121_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3872
noncomputable def raws_121_1 : List RawOp := [
  RawOp.marker
    249
    3871,
  RawOp.jump
    ⟨#[
      3875,
      3875,
      3875,
      3875,
      3875
    ], rfl⟩,
  RawOp.move
    Dir.left
    3873,
  RawOp.marker
    251
    3874,
  RawOp.jump
    ⟨#[
      253,
      253,
      253,
      253,
      253
    ], rfl⟩,
  RawOp.move
    Dir.left
    1923,
  RawOp.marker
    3876
    3877,
  RawOp.jump
    ⟨#[
      3881,
      3881,
      3881,
      3881,
      3881
    ], rfl⟩,
  RawOp.move
    Dir.left
    3879,
  RawOp.marker
    1912
    3880,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3876
    1912,
  RawOp.move
    Dir.left
    1915,
  RawOp.marker
    3882
    3883,
  RawOp.jump
    ⟨#[
      3887,
      3887,
      3887,
      3887,
      3887
    ], rfl⟩,
  RawOp.move
    Dir.left
    3885,
  RawOp.marker
    252
    3886,
  RawOp.jump
    ⟨#[
      3891,
      3891,
      3891,
      3891,
      3891
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      256,
      256,
      256,
      256,
      256
    ], rfl⟩,
  RawOp.move
    Dir.left
    3888,
  RawOp.marker
    3889
    3890,
  RawOp.jump
    ⟨#[
      3894,
      3894,
      3894,
      3894,
      3894
    ], rfl⟩,
  RawOp.move
    Dir.left
    3892,
  RawOp.marker
    1926
    3893,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3889
    1926,
  RawOp.move
    Dir.left
    1929,
  RawOp.marker
    3895
    3896,
  RawOp.jump
    ⟨#[
      3900,
      3900,
      3900,
      3900,
      3900
    ], rfl⟩,
  RawOp.move
    Dir.left
    3898,
  RawOp.marker
    253
    3899,
  RawOp.move
    Dir.left
    1937,
  RawOp.marker
    255
    3901,
  RawOp.jump
    ⟨#[
      3905,
      3905,
      3905,
      3905,
      3905
    ], rfl⟩
]
theorem fact_121_1 : source_121_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_121_1 := by decide +kernel
theorem bounds_121_1 : raws_121_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_122_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3904
noncomputable def raws_122_1 : List RawOp := [
  RawOp.move
    Dir.left
    3903,
  RawOp.marker
    254
    3904,
  RawOp.jump
    ⟨#[
      3908,
      3908,
      3908,
      3908,
      3908
    ], rfl⟩,
  RawOp.move
    Dir.left
    3906,
  RawOp.marker
    256
    3907,
  RawOp.jump
    ⟨#[
      3912,
      3912,
      3912,
      3912,
      3912
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      260,
      260,
      260,
      260,
      260
    ], rfl⟩,
  RawOp.move
    Dir.left
    3909,
  RawOp.marker
    3910
    3911,
  RawOp.jump
    ⟨#[
      3915,
      3915,
      3915,
      3915,
      3915
    ], rfl⟩,
  RawOp.move
    Dir.left
    3913,
  RawOp.marker
    1943
    3914,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3910
    1943,
  RawOp.move
    Dir.left
    1946,
  RawOp.marker
    3916
    3917,
  RawOp.jump
    ⟨#[
      3921,
      3921,
      3921,
      3921,
      3921
    ], rfl⟩,
  RawOp.move
    Dir.left
    3919,
  RawOp.marker
    257
    3920,
  RawOp.move
    Dir.left
    1954,
  RawOp.marker
    259
    3922,
  RawOp.jump
    ⟨#[
      3926,
      3926,
      3926,
      3926,
      3926
    ], rfl⟩,
  RawOp.move
    Dir.left
    3924,
  RawOp.marker
    258
    3925,
  RawOp.jump
    ⟨#[
      3929,
      3929,
      3929,
      3929,
      3929
    ], rfl⟩,
  RawOp.move
    Dir.left
    3927,
  RawOp.marker
    260
    3928,
  RawOp.jump
    ⟨#[
      3932,
      3932,
      3932,
      3932,
      3932
    ], rfl⟩,
  RawOp.move
    Dir.left
    3930,
  RawOp.marker
    261
    3931,
  RawOp.jump
    ⟨#[
      3935,
      3935,
      3935,
      3935,
      3935
    ], rfl⟩,
  RawOp.move
    Dir.left
    3933,
  RawOp.marker
    262
    3934
]
theorem fact_122_1 : source_122_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_122_1 := by decide +kernel
theorem bounds_122_1 : raws_122_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_121_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_121_1 source_122_1
noncomputable def raws_121_2 : List RawOp := raws_121_1 ++ raws_122_1
theorem fact_121_2 : source_121_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_121_2 :=
  source_branch 32 source_121_1 source_122_1 raws_121_1 raws_122_1 fact_121_1 fact_122_1
theorem bounds_121_2 : raws_121_2.all (labelsBounded 4042) = true :=
  bounds_append raws_121_1 raws_122_1 bounds_121_1 bounds_122_1
noncomputable def source_119_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_119_2 source_121_2
noncomputable def raws_119_4 : List RawOp := raws_119_2 ++ raws_121_2
theorem fact_119_4 : source_119_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_119_4 :=
  source_branch 64 source_119_2 source_121_2 raws_119_2 raws_121_2 fact_119_2 fact_121_2
theorem bounds_119_4 : raws_119_4.all (labelsBounded 4042) = true :=
  bounds_append raws_119_2 raws_121_2 bounds_119_2 bounds_121_2
noncomputable def source_123_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3936
noncomputable def raws_123_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      3939,
      3939,
      3939,
      3939,
      3939
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      266,
      266,
      266,
      266,
      266
    ], rfl⟩,
  RawOp.move
    Dir.left
    3936,
  RawOp.marker
    3937
    3938,
  RawOp.jump
    ⟨#[
      3942,
      3942,
      3942,
      3942,
      3942
    ], rfl⟩,
  RawOp.move
    Dir.left
    3940,
  RawOp.marker
    1965
    3941,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3937
    1965,
  RawOp.move
    Dir.left
    1968,
  RawOp.marker
    3943
    3944,
  RawOp.jump
    ⟨#[
      3948,
      3948,
      3948,
      3948,
      3948
    ], rfl⟩,
  RawOp.move
    Dir.left
    3946,
  RawOp.marker
    263
    3947,
  RawOp.jump
    ⟨#[
      3951,
      3951,
      3951,
      3951,
      3951
    ], rfl⟩,
  RawOp.move
    Dir.left
    3949,
  RawOp.marker
    264
    3950,
  RawOp.jump
    ⟨#[
      3954,
      3954,
      3954,
      3954,
      3954
    ], rfl⟩,
  RawOp.move
    Dir.left
    3952,
  RawOp.marker
    266
    3953,
  RawOp.jump
    ⟨#[
      3957,
      3957,
      3957,
      3957,
      3957
    ], rfl⟩,
  RawOp.move
    Dir.left
    3955,
  RawOp.marker
    1982
    3956,
  RawOp.jump
    ⟨#[
      3961,
      3961,
      3961,
      3961,
      3961
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      268,
      268,
      268,
      268,
      268
    ], rfl⟩,
  RawOp.move
    Dir.left
    3958,
  RawOp.marker
    3959
    3960,
  RawOp.jump
    ⟨#[
      269,
      269,
      269,
      269,
      269
    ], rfl⟩,
  RawOp.move
    Dir.left
    1985,
  RawOp.marker
    3962
    3963,
  RawOp.jump
    ⟨#[
      3967,
      3967,
      3967,
      3967,
      3967
    ], rfl⟩,
  RawOp.move
    Dir.left
    3965,
  RawOp.marker
    1988
    3966
]
theorem fact_123_1 : source_123_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_123_1 := by decide +kernel
theorem bounds_123_1 : raws_123_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_124_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk3968
noncomputable def raws_124_1 : List RawOp := [
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3962
    1988,
  RawOp.move
    Dir.left
    1991,
  RawOp.marker
    3968
    3969,
  RawOp.jump
    ⟨#[
      3973,
      3973,
      3973,
      3973,
      3973
    ], rfl⟩,
  RawOp.move
    Dir.left
    3971,
  RawOp.marker
    1995
    3972,
  RawOp.jump
    ⟨#[
      3977,
      3977,
      3977,
      3977,
      3977
    ], rfl⟩,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    3959
    1995,
  RawOp.move
    Dir.left
    3974,
  RawOp.marker
    3975
    3976,
  RawOp.branch
    ⟨#[
      false,
      false,
      false,
      true,
      false
    ], rfl⟩
    1982
    3975,
  RawOp.move
    Dir.left
    1998,
  RawOp.marker
    3978
    3979,
  RawOp.jump
    ⟨#[
      3983,
      3983,
      3983,
      3983,
      3983
    ], rfl⟩,
  RawOp.move
    Dir.left
    3981,
  RawOp.marker
    267
    3982,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    114
    3959,
  RawOp.move
    Dir.left
    2006,
  RawOp.marker
    3984
    3985,
  RawOp.jump
    ⟨#[
      3989,
      3989,
      3989,
      3989,
      3989
    ], rfl⟩,
  RawOp.move
    Dir.left
    3987,
  RawOp.marker
    268
    3988,
  RawOp.jump
    ⟨#[
      3993,
      3993,
      3993,
      3993,
      3993
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      270,
      270,
      270,
      270,
      270
    ], rfl⟩,
  RawOp.move
    Dir.left
    3990,
  RawOp.marker
    3991
    3992,
  RawOp.jump
    ⟨#[
      3996,
      3996,
      3996,
      3996,
      3996
    ], rfl⟩,
  RawOp.move
    Dir.left
    3994,
  RawOp.marker
    2015
    3995,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3991
    2015,
  RawOp.move
    Dir.left
    2018,
  RawOp.marker
    3997
    3998
]
theorem fact_124_1 : source_124_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_124_1 := by decide +kernel
theorem bounds_124_1 : raws_124_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_123_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_123_1 source_124_1
noncomputable def raws_123_2 : List RawOp := raws_123_1 ++ raws_124_1
theorem fact_123_2 : source_123_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_123_2 :=
  source_branch 32 source_123_1 source_124_1 raws_123_1 raws_124_1 fact_123_1 fact_124_1
theorem bounds_123_2 : raws_123_2.all (labelsBounded 4042) = true :=
  bounds_append raws_123_1 raws_124_1 bounds_123_1 bounds_124_1
noncomputable def source_125_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4000
noncomputable def raws_125_1 : List RawOp := [
  RawOp.jump
    ⟨#[
      4002,
      4002,
      4002,
      4002,
      4002
    ], rfl⟩,
  RawOp.move
    Dir.left
    4000,
  RawOp.marker
    269
    4001,
  RawOp.jump
    ⟨#[
      271,
      271,
      271,
      271,
      271
    ], rfl⟩,
  RawOp.move
    Dir.left
    2034,
  RawOp.marker
    4003
    4004,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    4003
    3991,
  RawOp.move
    Dir.left
    2026,
  RawOp.marker
    4006
    4007,
  RawOp.jump
    ⟨#[
      4011,
      4011,
      4011,
      4011,
      4011
    ], rfl⟩,
  RawOp.move
    Dir.left
    4009,
  RawOp.marker
    270
    4010,
  RawOp.jump
    ⟨#[
      4015,
      4015,
      4015,
      4015,
      4015
    ], rfl⟩,
  RawOp.jump
    ⟨#[
      274,
      274,
      274,
      274,
      274
    ], rfl⟩,
  RawOp.move
    Dir.left
    4012,
  RawOp.marker
    4013
    4014,
  RawOp.jump
    ⟨#[
      4018,
      4018,
      4018,
      4018,
      4018
    ], rfl⟩,
  RawOp.move
    Dir.left
    4016,
  RawOp.marker
    2037
    4017,
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      false,
      false
    ], rfl⟩
    4013
    2037,
  RawOp.move
    Dir.left
    2040,
  RawOp.marker
    4019
    4020,
  RawOp.jump
    ⟨#[
      4024,
      4024,
      4024,
      4024,
      4024
    ], rfl⟩,
  RawOp.move
    Dir.left
    4022,
  RawOp.marker
    271
    4023,
  RawOp.move
    Dir.left
    2048,
  RawOp.marker
    273
    4025,
  RawOp.jump
    ⟨#[
      4029,
      4029,
      4029,
      4029,
      4029
    ], rfl⟩,
  RawOp.move
    Dir.left
    4027,
  RawOp.marker
    272
    4028,
  RawOp.jump
    ⟨#[
      4032,
      4032,
      4032,
      4032,
      4032
    ], rfl⟩,
  RawOp.move
    Dir.left
    4030
]
theorem fact_125_1 : source_125_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_125_1 := by decide +kernel
theorem bounds_125_1 : raws_125_1.all (labelsBounded 4042) = true := by
  decide +kernel
noncomputable def source_126_1 : Balanced.RowTree Snapshot.Entry :=
  Snapshot.chunk4032
noncomputable def raws_126_1 : List RawOp := [
  RawOp.marker
    274
    4031,
  RawOp.jump
    ⟨#[
      4035,
      4035,
      4035,
      4035,
      4035
    ], rfl⟩,
  RawOp.move
    Dir.left
    4033,
  RawOp.marker
    2054
    4034,
  RawOp.branch
    ⟨#[
      true,
      false,
      false,
      false,
      false
    ], rfl⟩
    3421
    2054,
  RawOp.move
    Dir.left
    2057,
  RawOp.marker
    4036
    4037,
  RawOp.jump
    ⟨#[
      4041,
      4041,
      4041,
      4041,
      4041
    ], rfl⟩,
  RawOp.move
    Dir.left
    4039,
  RawOp.marker
    275
    4040
]
theorem fact_126_1 : source_126_1.flatten.map
    (fun row ↦ rawSource row.1) = raws_126_1 := by decide +kernel
theorem bounds_126_1 : raws_126_1.all (labelsBounded 4042) = true := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-chunks\t127\t{now}"
      handle.flush
noncomputable def source_125_2 : Balanced.RowTree Snapshot.Entry :=
  .branch 32 source_125_1 source_126_1
noncomputable def raws_125_2 : List RawOp := raws_125_1 ++ raws_126_1
theorem fact_125_2 : source_125_2.flatten.map
    (fun row ↦ rawSource row.1) = raws_125_2 :=
  source_branch 32 source_125_1 source_126_1 raws_125_1 raws_126_1 fact_125_1 fact_126_1
theorem bounds_125_2 : raws_125_2.all (labelsBounded 4042) = true :=
  bounds_append raws_125_1 raws_126_1 bounds_125_1 bounds_126_1
noncomputable def source_123_4 : Balanced.RowTree Snapshot.Entry :=
  .branch 64 source_123_2 source_125_2
noncomputable def raws_123_4 : List RawOp := raws_123_2 ++ raws_125_2
theorem fact_123_4 : source_123_4.flatten.map
    (fun row ↦ rawSource row.1) = raws_123_4 :=
  source_branch 64 source_123_2 source_125_2 raws_123_2 raws_125_2 fact_123_2 fact_125_2
theorem bounds_123_4 : raws_123_4.all (labelsBounded 4042) = true :=
  bounds_append raws_123_2 raws_125_2 bounds_123_2 bounds_125_2
noncomputable def source_119_8 : Balanced.RowTree Snapshot.Entry :=
  .branch 128 source_119_4 source_123_4
noncomputable def raws_119_8 : List RawOp := raws_119_4 ++ raws_123_4
theorem fact_119_8 : source_119_8.flatten.map
    (fun row ↦ rawSource row.1) = raws_119_8 :=
  source_branch 128 source_119_4 source_123_4 raws_119_4 raws_123_4 fact_119_4 fact_123_4
theorem bounds_119_8 : raws_119_8.all (labelsBounded 4042) = true :=
  bounds_append raws_119_4 raws_123_4 bounds_119_4 bounds_123_4
noncomputable def source_111_16 : Balanced.RowTree Snapshot.Entry :=
  .branch 256 source_111_8 source_119_8
noncomputable def raws_111_16 : List RawOp := raws_111_8 ++ raws_119_8
theorem fact_111_16 : source_111_16.flatten.map
    (fun row ↦ rawSource row.1) = raws_111_16 :=
  source_branch 256 source_111_8 source_119_8 raws_111_8 raws_119_8 fact_111_8 fact_119_8
theorem bounds_111_16 : raws_111_16.all (labelsBounded 4042) = true :=
  bounds_append raws_111_8 raws_119_8 bounds_111_8 bounds_119_8
noncomputable def source_95_32 : Balanced.RowTree Snapshot.Entry :=
  .branch 512 source_95_16 source_111_16
noncomputable def raws_95_32 : List RawOp := raws_95_16 ++ raws_111_16
theorem fact_95_32 : source_95_32.flatten.map
    (fun row ↦ rawSource row.1) = raws_95_32 :=
  source_branch 512 source_95_16 source_111_16 raws_95_16 raws_111_16 fact_95_16 fact_111_16
theorem bounds_95_32 : raws_95_32.all (labelsBounded 4042) = true :=
  bounds_append raws_95_16 raws_111_16 bounds_95_16 bounds_111_16
noncomputable def source_63_64 : Balanced.RowTree Snapshot.Entry :=
  .branch 1024 source_63_32 source_95_32
noncomputable def raws_63_64 : List RawOp := raws_63_32 ++ raws_95_32
theorem fact_63_64 : source_63_64.flatten.map
    (fun row ↦ rawSource row.1) = raws_63_64 :=
  source_branch 1024 source_63_32 source_95_32 raws_63_32 raws_95_32 fact_63_32 fact_95_32
theorem bounds_63_64 : raws_63_64.all (labelsBounded 4042) = true :=
  bounds_append raws_63_32 raws_95_32 bounds_63_32 bounds_95_32
noncomputable def source_0_127 : Balanced.RowTree Snapshot.Entry :=
  .branch 2016 source_0_63 source_63_64
noncomputable def raws_0_127 : List RawOp := raws_0_63 ++ raws_63_64
theorem fact_0_127 : source_0_127.flatten.map
    (fun row ↦ rawSource row.1) = raws_0_127 :=
  source_branch 2016 source_0_63 source_63_64 raws_0_63 raws_63_64 fact_0_63 fact_63_64
theorem bounds_0_127 : raws_0_127.all (labelsBounded 4042) = true :=
  bounds_append raws_0_63 raws_63_64 bounds_0_63 bounds_63_64
noncomputable def rawOps : List RawOp := raws_0_127
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t0\t{now}"
      handle.flush
theorem source_tree_eq : source_0_127 = Snapshot.entries := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t1\t{now}"
      handle.flush
theorem complete_raw_source : Snapshot.entries.flatten.map
    (fun row ↦ rawSource row.1) = rawOps := by
  change Snapshot.entries.flatten.map _ = raws_0_127
  exact (congrArg
    (fun tree : Balanced.RowTree Snapshot.Entry ↦
      tree.flatten.map (fun row ↦ rawSource row.1))
    source_tree_eq.symm).trans fact_0_127
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t2\t{now}"
      handle.flush
theorem complete_raw_bounds : rawOps.all (labelsBounded 4042) = true :=
  bounds_0_127

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t3\t{now}"
      handle.flush
theorem complete_raw_labels_safe :
    ∀ op ∈ rawOps, ∀ value ∈ labelValues op, value < 4042 := by
  intro op member value found
  exact labels_bound_sound 4042 op
    (List.all_eq_true.mp complete_raw_bounds op member) value found

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t4\t{now}"
      handle.flush
theorem complete_raw_restored :
    rawOps.map (restore 4042) = Snapshot.entries.flatten.map (fun row ↦ some row.1) := by
  exact (congrArg (List.map (restore 4042)) complete_raw_source.symm).trans
    (restore_entries Snapshot.entries.flatten)

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t5\t{now}"
      handle.flush
theorem complete_raw_length : rawOps.length = 4042 := by
  have same := (congrArg List.length complete_raw_source).symm
  simp only [List.length_map] at same
  exact same.trans
    ((Balanced.RowTree.count_eq_length Snapshot.entries).symm.trans Snapshot.entries_count)

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t6\t{now}"
      handle.flush
theorem complete_raw_at (q : Fin 4042) :
    rawOps.getD q.val .halt = rawSource (Snapshot.program q) := by
  exact (raw_lookup Snapshot.entries.flatten rawOps complete_raw_source q.val).trans
    (congrArg (fun row : Snapshot.Entry ↦ rawSource row.1)
      (Balanced.RowTree.lookup_eq_getD Snapshot.entries
        Snapshot.entries_wellFormed q.val (.halt, .halt))).symm

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t7\t{now}"
      handle.flush
theorem complete_decoded_at (q : Fin 4042) :
    restore 4042 (rawOps.getD q.val .halt) = some (Snapshot.program q) := by
  rewrite [complete_raw_at]
  exact restore_original (Snapshot.program q)

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t8\t{now}"
      handle.flush
noncomputable def decodedOp (q : Fin 4042) : Op 4042 :=
  (restore 4042 (rawOps.getD q.val .halt)).getD .halt

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t9\t{now}"
      handle.flush
theorem decodedOp_eq (q : Fin 4042) : decodedOp q = Snapshot.program q := by
  unfold decodedOp
  rewrite [complete_decoded_at]
  rfl

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t10\t{now}"
      handle.flush
theorem complete_source_lowered (q : Fin 4042) :
    lower (decodedOp q) = lower (Snapshot.program q) := congrArg lower (decodedOp_eq q)

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t11\t{now}"
      handle.flush
theorem complete_source_meaning (q : Fin 4042) :
    source (decodedOp q) = SharedModel.machine q :=
  (congrArg FieldCompiler.source (decodedOp_eq q)).trans (Snapshot.source_program q)

run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/raw-source-final.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-raw-source-final\t12\t{now}"
      handle.flush

end CompleteRawSourcePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "All frozen raw source operations reconstructed with exact bounds"
