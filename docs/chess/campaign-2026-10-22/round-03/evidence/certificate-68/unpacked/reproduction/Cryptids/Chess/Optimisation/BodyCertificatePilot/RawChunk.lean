module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.RawLabels

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler RawLabelPilot
namespace RawChunkPilot
noncomputable def bounded_4_0 : Fin 4 :=
  ⟨0, by decide +kernel⟩
noncomputable def bounded_4_1 : Fin 4 :=
  ⟨1, by decide +kernel⟩
noncomputable def bounded_4_2 : Fin 4 :=
  ⟨2, by decide +kernel⟩
noncomputable def bounded_4_3 : Fin 4 :=
  ⟨3, by decide +kernel⟩
noncomputable def bounded_5_0 : Fin 5 :=
  ⟨0, by decide +kernel⟩
noncomputable def bounded_5_1 : Fin 5 :=
  ⟨1, by decide +kernel⟩
noncomputable def bounded_5_2 : Fin 5 :=
  ⟨2, by decide +kernel⟩
noncomputable def bounded_5_3 : Fin 5 :=
  ⟨3, by decide +kernel⟩
noncomputable def bounded_5_4 : Fin 5 :=
  ⟨4, by decide +kernel⟩
def sourceOps : List (Op 4042) :=
  Snapshot.chunk0256.flatten.map Prod.fst
noncomputable def rawOps : List RawOp := [
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
noncomputable def corruptOp : RawOp :=
  RawOp.load
    bounded_4_0
    ⟨#[
      ⟨#[
        bounded_5_1,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
        bounded_5_3,
        bounded_5_4
      ], rfl⟩,
      ⟨#[
        bounded_5_0,
        bounded_5_1,
        bounded_5_2,
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
    284
noncomputable def corruptOps : List RawOp := rawOps.set 29 corruptOp
noncomputable def badTarget : RawOp :=
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
    4042

theorem raw_labels_bounded : rawOps.all (labelsBounded 4042) = true := by decide +kernel

theorem raw_labels_safe :
    ∀ op ∈ rawOps, ∀ value ∈ labelValues op, value < 4042 := by
  intro op member value found
  exact labels_bound_sound 4042 op
    (List.all_eq_true.mp raw_labels_bounded op member) value found

theorem source_raw_tables :
    sourceOps.map (fun op ↦ erase (toTableOp op)) = rawOps := by decide +kernel

theorem source_restored : rawOps.map (restore 4042) = sourceOps.map some := by
  exact (congrArg (List.map (restore 4042)) source_raw_tables.symm).trans
    (restore_source_list sourceOps)

theorem corrupted_callback_rejected :
    sourceOps.map (fun op ↦ erase (toTableOp op)) ≠ corruptOps := by decide +kernel

theorem invalid_target_bounded_false : labelsBounded 4042 badTarget = false := by decide +kernel

theorem invalid_target_rejected : restore 4042 badTarget = none := by decide +kernel
theorem chunk_length : rawOps.length = 32 := by decide +kernel
end RawChunkPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Raw source chunk bounds and restoration checked"
