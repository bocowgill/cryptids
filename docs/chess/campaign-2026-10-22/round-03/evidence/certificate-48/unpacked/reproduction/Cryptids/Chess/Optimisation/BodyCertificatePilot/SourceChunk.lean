module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceTables

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler
namespace SourceChunkPilot
def sourceOps : List (Op 4042) := Snapshot.chunk0256.flatten.map Prod.fst
def proposedOps : List (TableOp 4042) := [
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
def corruptOp : TableOp 4042 :=
  TableOp.load
    ⟨0, by decide +kernel⟩
    ⟨#[
      ⟨#[
        ⟨1, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
        ⟨3, by decide +kernel⟩,
        ⟨4, by decide +kernel⟩
      ], rfl⟩,
      ⟨#[
        ⟨0, by decide +kernel⟩,
        ⟨1, by decide +kernel⟩,
        ⟨2, by decide +kernel⟩,
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
    ⟨284, by decide +kernel⟩
def corruptOps : List (TableOp 4042) := proposedOps.set 29 corruptOp
theorem source_chunk_tables : sourceOps.map toTableOp = proposedOps := by
  decide +kernel
theorem corrupted_chunk_rejected : sourceOps.map toTableOp ≠ corruptOps := by
  decide +kernel
theorem source_chunk_restored : proposedOps.map fromTableOp = sourceOps := by
  have restore (ops : List (Op 4042)) :
      (ops.map toTableOp).map fromTableOp = ops := by
    induction ops with
    | nil => rfl
    | cons op ops ih => simp only [List.map_cons, from_toTableOp, ih]
  rewrite [← source_chunk_tables]
  exact restore sourceOps
theorem chunk_length : proposedOps.length = 32 := by decide +kernel
end SourceChunkPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual frozen source chunk reconstructed and corruption rejected"
