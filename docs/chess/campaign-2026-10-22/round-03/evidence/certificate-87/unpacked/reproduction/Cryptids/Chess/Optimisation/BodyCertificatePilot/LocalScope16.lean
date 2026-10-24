module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceRecipes
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalChunk
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews000
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews001
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews002
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews003
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ScopeViews004
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalViewControls
public meta import Lean

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot
open NumericLocalPilot LocalRulePilot SourceScopeToolsPilot LocalChunkPilot
namespace LocalScope16Pilot
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t0\t{now}"
      handle.flush
def label_0 : Fin 4042 := ⟨0, by decide +kernel⟩
noncomputable def raw_0 : RawOp :=
  RawOp.jump
    ⟨#[
      1,
      1,
      1,
      1,
      1
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t0\t{now}"
      handle.flush
noncomputable def record_0 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_0 label_0 raw_0
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t1\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t1\t{now}"
      handle.flush
def label_1 : Fin 4042 := ⟨1, by decide +kernel⟩
noncomputable def raw_1 : RawOp :=
  RawOp.jump
    ⟨#[
      289,
      289,
      289,
      289,
      289
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t1\t{now}"
      handle.flush
noncomputable def record_1 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_1 label_1 raw_1
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t2\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t2\t{now}"
      handle.flush
def label_2 : Fin 4042 := ⟨2, by decide +kernel⟩
noncomputable def raw_2 : RawOp :=
  RawOp.jump
    ⟨#[
      294,
      294,
      294,
      294,
      294
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t2\t{now}"
      handle.flush
noncomputable def record_2 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_2 label_2 raw_2
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t3\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t3\t{now}"
      handle.flush
def label_3 : Fin 4042 := ⟨3, by decide +kernel⟩
noncomputable def raw_3 : RawOp :=
  RawOp.jump
    ⟨#[
      5,
      5,
      5,
      5,
      5
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t3\t{now}"
      handle.flush
noncomputable def record_3 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_3 label_3 raw_3
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t4\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t4\t{now}"
      handle.flush
def label_4 : Fin 4042 := ⟨4, by decide +kernel⟩
noncomputable def raw_4 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    2
    3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t4\t{now}"
      handle.flush
noncomputable def record_4 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_4 label_4 raw_4
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t5\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t5\t{now}"
      handle.flush
def label_5 : Fin 4042 := ⟨5, by decide +kernel⟩
noncomputable def raw_5 : RawOp :=
  RawOp.jump
    ⟨#[
      306,
      306,
      306,
      306,
      306
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t5\t{now}"
      handle.flush
noncomputable def record_5 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_5 label_5 raw_5
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t6\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t6\t{now}"
      handle.flush
def label_6 : Fin 4042 := ⟨6, by decide +kernel⟩
noncomputable def raw_6 : RawOp :=
  RawOp.jump
    ⟨#[
      320,
      320,
      320,
      320,
      320
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t6\t{now}"
      handle.flush
noncomputable def record_6 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_6 label_6 raw_6
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t7\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t7\t{now}"
      handle.flush
def label_7 : Fin 4042 := ⟨7, by decide +kernel⟩
noncomputable def raw_7 : RawOp :=
  RawOp.jump
    ⟨#[
      325,
      325,
      325,
      325,
      325
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t7\t{now}"
      handle.flush
noncomputable def record_7 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_7 label_7 raw_7
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t8\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t8\t{now}"
      handle.flush
def label_8 : Fin 4042 := ⟨8, by decide +kernel⟩
noncomputable def raw_8 : RawOp :=
  RawOp.jump
    ⟨#[
      10,
      10,
      10,
      10,
      10
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t8\t{now}"
      handle.flush
noncomputable def record_8 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_8 label_8 raw_8
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t9\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t9\t{now}"
      handle.flush
def label_9 : Fin 4042 := ⟨9, by decide +kernel⟩
noncomputable def raw_9 : RawOp :=
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    7
    8
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t9\t{now}"
      handle.flush
noncomputable def record_9 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_9 label_9 raw_9
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t10\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t10\t{now}"
      handle.flush
def label_10 : Fin 4042 := ⟨10, by decide +kernel⟩
noncomputable def raw_10 : RawOp :=
  RawOp.jump
    ⟨#[
      337,
      337,
      337,
      337,
      337
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t10\t{now}"
      handle.flush
noncomputable def record_10 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_10 label_10 raw_10
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t11\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t11\t{now}"
      handle.flush
def label_11 : Fin 4042 := ⟨11, by decide +kernel⟩
noncomputable def raw_11 : RawOp :=
  RawOp.jump
    ⟨#[
      345,
      345,
      345,
      345,
      345
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t11\t{now}"
      handle.flush
noncomputable def record_11 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_11 label_11 raw_11
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t12\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t12\t{now}"
      handle.flush
def label_12 : Fin 4042 := ⟨12, by decide +kernel⟩
noncomputable def raw_12 : RawOp :=
  RawOp.jump
    ⟨#[
      359,
      359,
      359,
      359,
      359
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t12\t{now}"
      handle.flush
noncomputable def record_12 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_12 label_12 raw_12
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t13\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t13\t{now}"
      handle.flush
def label_13 : Fin 4042 := ⟨13, by decide +kernel⟩
noncomputable def raw_13 : RawOp :=
  RawOp.jump
    ⟨#[
      364,
      364,
      364,
      364,
      364
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t13\t{now}"
      handle.flush
noncomputable def record_13 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_13 label_13 raw_13
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t14\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t14\t{now}"
      handle.flush
def label_14 : Fin 4042 := ⟨14, by decide +kernel⟩
noncomputable def raw_14 : RawOp :=
  RawOp.jump
    ⟨#[
      16,
      16,
      16,
      16,
      16
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t14\t{now}"
      handle.flush
noncomputable def record_14 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_14 label_14 raw_14
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t15\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t15\t{now}"
      handle.flush
def label_15 : Fin 4042 := ⟨15, by decide +kernel⟩
noncomputable def raw_15 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    13
    14
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t15\t{now}"
      handle.flush
noncomputable def record_15 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_15 label_15 raw_15
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t16\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t16\t{now}"
      handle.flush
def label_16 : Fin 4042 := ⟨16, by decide +kernel⟩
noncomputable def raw_16 : RawOp :=
  RawOp.jump
    ⟨#[
      376,
      376,
      376,
      376,
      376
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t16\t{now}"
      handle.flush
noncomputable def record_16 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_16 label_16 raw_16
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t17\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t17\t{now}"
      handle.flush
def label_17 : Fin 4042 := ⟨17, by decide +kernel⟩
noncomputable def raw_17 : RawOp :=
  RawOp.jump
    ⟨#[
      381,
      381,
      381,
      381,
      381
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t17\t{now}"
      handle.flush
noncomputable def record_17 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_17 label_17 raw_17
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t18\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t18\t{now}"
      handle.flush
def label_18 : Fin 4042 := ⟨18, by decide +kernel⟩
noncomputable def raw_18 : RawOp :=
  RawOp.jump
    ⟨#[
      20,
      20,
      20,
      20,
      20
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t18\t{now}"
      handle.flush
noncomputable def record_18 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_18 label_18 raw_18
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t19\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t19\t{now}"
      handle.flush
def label_19 : Fin 4042 := ⟨19, by decide +kernel⟩
noncomputable def raw_19 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    17
    18
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t19\t{now}"
      handle.flush
noncomputable def record_19 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_19 label_19 raw_19
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t20\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t20\t{now}"
      handle.flush
def label_20 : Fin 4042 := ⟨20, by decide +kernel⟩
noncomputable def raw_20 : RawOp :=
  RawOp.jump
    ⟨#[
      23,
      23,
      23,
      23,
      23
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t20\t{now}"
      handle.flush
noncomputable def record_20 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_20 label_20 raw_20
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t21\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t21\t{now}"
      handle.flush
def label_21 : Fin 4042 := ⟨21, by decide +kernel⟩
noncomputable def raw_21 : RawOp :=
  RawOp.jump
    ⟨#[
      386,
      386,
      386,
      386,
      386
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t21\t{now}"
      handle.flush
noncomputable def record_21 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_21 label_21 raw_21
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t22\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t22\t{now}"
      handle.flush
def label_22 : Fin 4042 := ⟨22, by decide +kernel⟩
noncomputable def raw_22 : RawOp :=
  RawOp.jump
    ⟨#[
      24,
      24,
      24,
      24,
      24
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t22\t{now}"
      handle.flush
noncomputable def record_22 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_22 label_22 raw_22
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t23\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t23\t{now}"
      handle.flush
def label_23 : Fin 4042 := ⟨23, by decide +kernel⟩
noncomputable def raw_23 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    21
    22
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t23\t{now}"
      handle.flush
noncomputable def record_23 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_23 label_23 raw_23
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t24\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t24\t{now}"
      handle.flush
def label_24 : Fin 4042 := ⟨24, by decide +kernel⟩
noncomputable def raw_24 : RawOp :=
  RawOp.jump
    ⟨#[
      25,
      25,
      25,
      25,
      25
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t24\t{now}"
      handle.flush
noncomputable def record_24 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_24 label_24 raw_24
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t25\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t25\t{now}"
      handle.flush
def label_25 : Fin 4042 := ⟨25, by decide +kernel⟩
noncomputable def raw_25 : RawOp :=
  RawOp.jump
    ⟨#[
      413,
      413,
      413,
      413,
      413
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t25\t{now}"
      handle.flush
noncomputable def record_25 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_25 label_25 raw_25
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t26\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t26\t{now}"
      handle.flush
def label_26 : Fin 4042 := ⟨26, by decide +kernel⟩
noncomputable def raw_26 : RawOp :=
  RawOp.jump
    ⟨#[
      43,
      43,
      43,
      43,
      43
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t26\t{now}"
      handle.flush
noncomputable def record_26 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_26 label_26 raw_26
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t27\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t27\t{now}"
      handle.flush
def label_27 : Fin 4042 := ⟨27, by decide +kernel⟩
noncomputable def raw_27 : RawOp :=
  RawOp.jump
    ⟨#[
      425,
      425,
      425,
      425,
      425
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t27\t{now}"
      handle.flush
noncomputable def record_27 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_27 label_27 raw_27
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t28\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t28\t{now}"
      handle.flush
def label_28 : Fin 4042 := ⟨28, by decide +kernel⟩
noncomputable def raw_28 : RawOp :=
  RawOp.jump
    ⟨#[
      439,
      439,
      439,
      439,
      439
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t28\t{now}"
      handle.flush
noncomputable def record_28 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_28 label_28 raw_28
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t29\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t29\t{now}"
      handle.flush
def label_29 : Fin 4042 := ⟨29, by decide +kernel⟩
noncomputable def raw_29 : RawOp :=
  RawOp.jump
    ⟨#[
      444,
      444,
      444,
      444,
      444
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t29\t{now}"
      handle.flush
noncomputable def record_29 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_29 label_29 raw_29
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t30\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t30\t{now}"
      handle.flush
def label_30 : Fin 4042 := ⟨30, by decide +kernel⟩
noncomputable def raw_30 : RawOp :=
  RawOp.jump
    ⟨#[
      32,
      32,
      32,
      32,
      32
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t30\t{now}"
      handle.flush
noncomputable def record_30 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_30 label_30 raw_30
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t31\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t31\t{now}"
      handle.flush
def label_31 : Fin 4042 := ⟨31, by decide +kernel⟩
noncomputable def raw_31 : RawOp :=
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
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t31\t{now}"
      handle.flush
noncomputable def record_31 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_31 label_31 raw_31
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t32\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t32\t{now}"
      handle.flush
def label_32 : Fin 4042 := ⟨32, by decide +kernel⟩
noncomputable def raw_32 : RawOp :=
  RawOp.jump
    ⟨#[
      456,
      456,
      456,
      456,
      456
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t32\t{now}"
      handle.flush
noncomputable def record_32 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_32 label_32 raw_32
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t33\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t33\t{now}"
      handle.flush
def label_33 : Fin 4042 := ⟨33, by decide +kernel⟩
noncomputable def raw_33 : RawOp :=
  RawOp.jump
    ⟨#[
      470,
      470,
      470,
      470,
      470
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t33\t{now}"
      handle.flush
noncomputable def record_33 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_33 label_33 raw_33
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t34\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t34\t{now}"
      handle.flush
def label_34 : Fin 4042 := ⟨34, by decide +kernel⟩
noncomputable def raw_34 : RawOp :=
  RawOp.jump
    ⟨#[
      475,
      475,
      475,
      475,
      475
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t34\t{now}"
      handle.flush
noncomputable def record_34 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_34 label_34 raw_34
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t35\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t35\t{now}"
      handle.flush
def label_35 : Fin 4042 := ⟨35, by decide +kernel⟩
noncomputable def raw_35 : RawOp :=
  RawOp.jump
    ⟨#[
      37,
      37,
      37,
      37,
      37
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t35\t{now}"
      handle.flush
noncomputable def record_35 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_35 label_35 raw_35
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t36\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t36\t{now}"
      handle.flush
def label_36 : Fin 4042 := ⟨36, by decide +kernel⟩
noncomputable def raw_36 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    34
    35
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t36\t{now}"
      handle.flush
noncomputable def record_36 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_36 label_36 raw_36
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t37\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t37\t{now}"
      handle.flush
def label_37 : Fin 4042 := ⟨37, by decide +kernel⟩
noncomputable def raw_37 : RawOp :=
  RawOp.jump
    ⟨#[
      487,
      487,
      487,
      487,
      487
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t37\t{now}"
      handle.flush
noncomputable def record_37 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_37 label_37 raw_37
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t38\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t38\t{now}"
      handle.flush
def label_38 : Fin 4042 := ⟨38, by decide +kernel⟩
noncomputable def raw_38 : RawOp :=
  RawOp.jump
    ⟨#[
      501,
      501,
      501,
      501,
      501
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t38\t{now}"
      handle.flush
noncomputable def record_38 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_38 label_38 raw_38
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t39\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t39\t{now}"
      handle.flush
def label_39 : Fin 4042 := ⟨39, by decide +kernel⟩
noncomputable def raw_39 : RawOp :=
  RawOp.jump
    ⟨#[
      506,
      506,
      506,
      506,
      506
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t39\t{now}"
      handle.flush
noncomputable def record_39 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_39 label_39 raw_39
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t40\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t40\t{now}"
      handle.flush
def label_40 : Fin 4042 := ⟨40, by decide +kernel⟩
noncomputable def raw_40 : RawOp :=
  RawOp.jump
    ⟨#[
      42,
      42,
      42,
      42,
      42
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t40\t{now}"
      handle.flush
noncomputable def record_40 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_40 label_40 raw_40
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t41\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t41\t{now}"
      handle.flush
def label_41 : Fin 4042 := ⟨41, by decide +kernel⟩
noncomputable def raw_41 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    39
    40
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t41\t{now}"
      handle.flush
noncomputable def record_41 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_41 label_41 raw_41
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t42\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t42\t{now}"
      handle.flush
def label_42 : Fin 4042 := ⟨42, by decide +kernel⟩
noncomputable def raw_42 : RawOp :=
  RawOp.jump
    ⟨#[
      518,
      518,
      518,
      518,
      518
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t42\t{now}"
      handle.flush
noncomputable def record_42 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_42 label_42 raw_42
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t43\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t43\t{now}"
      handle.flush
def label_43 : Fin 4042 := ⟨43, by decide +kernel⟩
noncomputable def raw_43 : RawOp :=
  RawOp.jump
    ⟨#[
      532,
      532,
      532,
      532,
      532
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t43\t{now}"
      handle.flush
noncomputable def record_43 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_43 label_43 raw_43
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t44\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t44\t{now}"
      handle.flush
def label_44 : Fin 4042 := ⟨44, by decide +kernel⟩
noncomputable def raw_44 : RawOp :=
  RawOp.jump
    ⟨#[
      537,
      537,
      537,
      537,
      537
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t44\t{now}"
      handle.flush
noncomputable def record_44 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_44 label_44 raw_44
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t45\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t45\t{now}"
      handle.flush
def label_45 : Fin 4042 := ⟨45, by decide +kernel⟩
noncomputable def raw_45 : RawOp :=
  RawOp.jump
    ⟨#[
      49,
      49,
      49,
      49,
      49
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t45\t{now}"
      handle.flush
noncomputable def record_45 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_45 label_45 raw_45
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t46\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t46\t{now}"
      handle.flush
def label_46 : Fin 4042 := ⟨46, by decide +kernel⟩
noncomputable def raw_46 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    44
    45
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t46\t{now}"
      handle.flush
noncomputable def record_46 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_46 label_46 raw_46
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t47\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t47\t{now}"
      handle.flush
def label_47 : Fin 4042 := ⟨47, by decide +kernel⟩
noncomputable def raw_47 : RawOp :=
  RawOp.jump
    ⟨#[
      542,
      542,
      542,
      542,
      542
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t47\t{now}"
      handle.flush
noncomputable def record_47 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_47 label_47 raw_47
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t48\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t48\t{now}"
      handle.flush
def label_48 : Fin 4042 := ⟨48, by decide +kernel⟩
noncomputable def raw_48 : RawOp :=
  RawOp.jump
    ⟨#[
      50,
      50,
      50,
      50,
      50
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t48\t{now}"
      handle.flush
noncomputable def record_48 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_48 label_48 raw_48
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t49\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t49\t{now}"
      handle.flush
def label_49 : Fin 4042 := ⟨49, by decide +kernel⟩
noncomputable def raw_49 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    47
    48
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t49\t{now}"
      handle.flush
noncomputable def record_49 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_49 label_49 raw_49
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t50\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t50\t{now}"
      handle.flush
def label_50 : Fin 4042 := ⟨50, by decide +kernel⟩
noncomputable def raw_50 : RawOp :=
  RawOp.jump
    ⟨#[
      560,
      560,
      560,
      560,
      560
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t50\t{now}"
      handle.flush
noncomputable def record_50 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_50 label_50 raw_50
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t51\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t51\t{now}"
      handle.flush
def label_51 : Fin 4042 := ⟨51, by decide +kernel⟩
noncomputable def raw_51 : RawOp :=
  RawOp.jump
    ⟨#[
      574,
      574,
      574,
      574,
      574
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t51\t{now}"
      handle.flush
noncomputable def record_51 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_51 label_51 raw_51
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t52\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t52\t{now}"
      handle.flush
def label_52 : Fin 4042 := ⟨52, by decide +kernel⟩
noncomputable def raw_52 : RawOp :=
  RawOp.jump
    ⟨#[
      579,
      579,
      579,
      579,
      579
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t52\t{now}"
      handle.flush
noncomputable def record_52 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_52 label_52 raw_52
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t53\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t53\t{now}"
      handle.flush
def label_53 : Fin 4042 := ⟨53, by decide +kernel⟩
noncomputable def raw_53 : RawOp :=
  RawOp.jump
    ⟨#[
      57,
      57,
      57,
      57,
      57
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t53\t{now}"
      handle.flush
noncomputable def record_53 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_53 label_53 raw_53
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t54\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t54\t{now}"
      handle.flush
def label_54 : Fin 4042 := ⟨54, by decide +kernel⟩
noncomputable def raw_54 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    52
    53
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t54\t{now}"
      handle.flush
noncomputable def record_54 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_54 label_54 raw_54
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t55\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t55\t{now}"
      handle.flush
def label_55 : Fin 4042 := ⟨55, by decide +kernel⟩
noncomputable def raw_55 : RawOp :=
  RawOp.jump
    ⟨#[
      584,
      584,
      584,
      584,
      584
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t55\t{now}"
      handle.flush
noncomputable def record_55 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_55 label_55 raw_55
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t56\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t56\t{now}"
      handle.flush
def label_56 : Fin 4042 := ⟨56, by decide +kernel⟩
noncomputable def raw_56 : RawOp :=
  RawOp.jump
    ⟨#[
      58,
      58,
      58,
      58,
      58
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t56\t{now}"
      handle.flush
noncomputable def record_56 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_56 label_56 raw_56
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t57\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t57\t{now}"
      handle.flush
def label_57 : Fin 4042 := ⟨57, by decide +kernel⟩
noncomputable def raw_57 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    55
    56
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t57\t{now}"
      handle.flush
noncomputable def record_57 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_57 label_57 raw_57
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t58\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t58\t{now}"
      handle.flush
def label_58 : Fin 4042 := ⟨58, by decide +kernel⟩
noncomputable def raw_58 : RawOp :=
  RawOp.jump
    ⟨#[
      602,
      602,
      602,
      602,
      602
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t58\t{now}"
      handle.flush
noncomputable def record_58 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_58 label_58 raw_58
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t59\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t59\t{now}"
      handle.flush
def label_59 : Fin 4042 := ⟨59, by decide +kernel⟩
noncomputable def raw_59 : RawOp :=
  RawOp.jump
    ⟨#[
      616,
      616,
      616,
      616,
      616
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t59\t{now}"
      handle.flush
noncomputable def record_59 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_59 label_59 raw_59
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t60\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t60\t{now}"
      handle.flush
def label_60 : Fin 4042 := ⟨60, by decide +kernel⟩
noncomputable def raw_60 : RawOp :=
  RawOp.jump
    ⟨#[
      621,
      621,
      621,
      621,
      621
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t60\t{now}"
      handle.flush
noncomputable def record_60 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_60 label_60 raw_60
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t61\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t61\t{now}"
      handle.flush
def label_61 : Fin 4042 := ⟨61, by decide +kernel⟩
noncomputable def raw_61 : RawOp :=
  RawOp.jump
    ⟨#[
      65,
      65,
      65,
      65,
      65
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t61\t{now}"
      handle.flush
noncomputable def record_61 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_61 label_61 raw_61
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t62\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t62\t{now}"
      handle.flush
def label_62 : Fin 4042 := ⟨62, by decide +kernel⟩
noncomputable def raw_62 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    60
    61
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t62\t{now}"
      handle.flush
noncomputable def record_62 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_62 label_62 raw_62
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t63\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t63\t{now}"
      handle.flush
def label_63 : Fin 4042 := ⟨63, by decide +kernel⟩
noncomputable def raw_63 : RawOp :=
  RawOp.jump
    ⟨#[
      626,
      626,
      626,
      626,
      626
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t63\t{now}"
      handle.flush
noncomputable def record_63 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_63 label_63 raw_63
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t64\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t64\t{now}"
      handle.flush
def label_64 : Fin 4042 := ⟨64, by decide +kernel⟩
noncomputable def raw_64 : RawOp :=
  RawOp.jump
    ⟨#[
      66,
      66,
      66,
      66,
      66
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t64\t{now}"
      handle.flush
noncomputable def record_64 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_64 label_64 raw_64
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t65\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t65\t{now}"
      handle.flush
def label_65 : Fin 4042 := ⟨65, by decide +kernel⟩
noncomputable def raw_65 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    63
    64
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t65\t{now}"
      handle.flush
noncomputable def record_65 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_65 label_65 raw_65
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t66\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t66\t{now}"
      handle.flush
def label_66 : Fin 4042 := ⟨66, by decide +kernel⟩
noncomputable def raw_66 : RawOp :=
  RawOp.jump
    ⟨#[
      644,
      644,
      644,
      644,
      644
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t66\t{now}"
      handle.flush
noncomputable def record_66 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_66 label_66 raw_66
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t67\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t67\t{now}"
      handle.flush
def label_67 : Fin 4042 := ⟨67, by decide +kernel⟩
noncomputable def raw_67 : RawOp :=
  RawOp.jump
    ⟨#[
      68,
      68,
      68,
      68,
      68
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t67\t{now}"
      handle.flush
noncomputable def record_67 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_67 label_67 raw_67
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t68\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t68\t{now}"
      handle.flush
def label_68 : Fin 4042 := ⟨68, by decide +kernel⟩
noncomputable def raw_68 : RawOp :=
  RawOp.jump
    ⟨#[
      658,
      658,
      658,
      658,
      658
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t68\t{now}"
      handle.flush
noncomputable def record_68 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_68 label_68 raw_68
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t69\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t69\t{now}"
      handle.flush
def label_69 : Fin 4042 := ⟨69, by decide +kernel⟩
noncomputable def raw_69 : RawOp :=
  RawOp.jump
    ⟨#[
      72,
      78,
      72,
      72,
      72
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t69\t{now}"
      handle.flush
noncomputable def record_69 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_69 label_69 raw_69
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t70\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t70\t{now}"
      handle.flush
def label_70 : Fin 4042 := ⟨70, by decide +kernel⟩
noncomputable def raw_70 : RawOp :=
  RawOp.jump
    ⟨#[
      663,
      663,
      663,
      663,
      663
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t70\t{now}"
      handle.flush
noncomputable def record_70 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_70 label_70 raw_70
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t71\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t71\t{now}"
      handle.flush
def label_71 : Fin 4042 := ⟨71, by decide +kernel⟩
noncomputable def raw_71 : RawOp :=
  RawOp.jump
    ⟨#[
      73,
      73,
      73,
      73,
      73
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t71\t{now}"
      handle.flush
noncomputable def record_71 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_71 label_71 raw_71
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t72\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t72\t{now}"
      handle.flush
def label_72 : Fin 4042 := ⟨72, by decide +kernel⟩
noncomputable def raw_72 : RawOp :=
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    70
    71
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t72\t{now}"
      handle.flush
noncomputable def record_72 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_72 label_72 raw_72
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t73\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t73\t{now}"
      handle.flush
def label_73 : Fin 4042 := ⟨73, by decide +kernel⟩
noncomputable def raw_73 : RawOp :=
  RawOp.jump
    ⟨#[
      675,
      675,
      675,
      675,
      675
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t73\t{now}"
      handle.flush
noncomputable def record_73 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_73 label_73 raw_73
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t74\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t74\t{now}"
      handle.flush
def label_74 : Fin 4042 := ⟨74, by decide +kernel⟩
noncomputable def raw_74 : RawOp :=
  RawOp.jump
    ⟨#[
      680,
      680,
      680,
      680,
      680
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t74\t{now}"
      handle.flush
noncomputable def record_74 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_74 label_74 raw_74
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t75\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t75\t{now}"
      handle.flush
def label_75 : Fin 4042 := ⟨75, by decide +kernel⟩
noncomputable def raw_75 : RawOp :=
  RawOp.jump
    ⟨#[
      77,
      77,
      77,
      77,
      77
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t75\t{now}"
      handle.flush
noncomputable def record_75 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_75 label_75 raw_75
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t76\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t76\t{now}"
      handle.flush
def label_76 : Fin 4042 := ⟨76, by decide +kernel⟩
noncomputable def raw_76 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    74
    75
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t76\t{now}"
      handle.flush
noncomputable def record_76 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_76 label_76 raw_76
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t77\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t77\t{now}"
      handle.flush
def label_77 : Fin 4042 := ⟨77, by decide +kernel⟩
noncomputable def raw_77 : RawOp :=
  RawOp.jump
    ⟨#[
      692,
      692,
      692,
      692,
      692
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t77\t{now}"
      handle.flush
noncomputable def record_77 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_77 label_77 raw_77
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t78\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t78\t{now}"
      handle.flush
def label_78 : Fin 4042 := ⟨78, by decide +kernel⟩
noncomputable def raw_78 : RawOp :=
  RawOp.jump
    ⟨#[
      706,
      706,
      706,
      706,
      706
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t78\t{now}"
      handle.flush
noncomputable def record_78 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_78 label_78 raw_78
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t79\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t79\t{now}"
      handle.flush
def label_79 : Fin 4042 := ⟨79, by decide +kernel⟩
noncomputable def raw_79 : RawOp :=
  RawOp.jump
    ⟨#[
      711,
      711,
      711,
      711,
      711
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t79\t{now}"
      handle.flush
noncomputable def record_79 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_79 label_79 raw_79
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t80\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t80\t{now}"
      handle.flush
def label_80 : Fin 4042 := ⟨80, by decide +kernel⟩
noncomputable def raw_80 : RawOp :=
  RawOp.jump
    ⟨#[
      82,
      82,
      82,
      82,
      82
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t80\t{now}"
      handle.flush
noncomputable def record_80 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_80 label_80 raw_80
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t81\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t81\t{now}"
      handle.flush
def label_81 : Fin 4042 := ⟨81, by decide +kernel⟩
noncomputable def raw_81 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    79
    80
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t81\t{now}"
      handle.flush
noncomputable def record_81 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_81 label_81 raw_81
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t82\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t82\t{now}"
      handle.flush
def label_82 : Fin 4042 := ⟨82, by decide +kernel⟩
noncomputable def raw_82 : RawOp :=
  RawOp.jump
    ⟨#[
      723,
      723,
      723,
      723,
      723
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t82\t{now}"
      handle.flush
noncomputable def record_82 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_82 label_82 raw_82
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t83\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t83\t{now}"
      handle.flush
def label_83 : Fin 4042 := ⟨83, by decide +kernel⟩
noncomputable def raw_83 : RawOp :=
  RawOp.jump
    ⟨#[
      737,
      737,
      737,
      737,
      737
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t83\t{now}"
      handle.flush
noncomputable def record_83 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_83 label_83 raw_83
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t84\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t84\t{now}"
      handle.flush
def label_84 : Fin 4042 := ⟨84, by decide +kernel⟩
noncomputable def raw_84 : RawOp :=
  RawOp.jump
    ⟨#[
      742,
      742,
      742,
      742,
      742
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t84\t{now}"
      handle.flush
noncomputable def record_84 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_84 label_84 raw_84
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t85\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t85\t{now}"
      handle.flush
def label_85 : Fin 4042 := ⟨85, by decide +kernel⟩
noncomputable def raw_85 : RawOp :=
  RawOp.jump
    ⟨#[
      87,
      87,
      87,
      87,
      87
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t85\t{now}"
      handle.flush
noncomputable def record_85 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_85 label_85 raw_85
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t86\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t86\t{now}"
      handle.flush
def label_86 : Fin 4042 := ⟨86, by decide +kernel⟩
noncomputable def raw_86 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    84
    85
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t86\t{now}"
      handle.flush
noncomputable def record_86 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_86 label_86 raw_86
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t87\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t87\t{now}"
      handle.flush
def label_87 : Fin 4042 := ⟨87, by decide +kernel⟩
noncomputable def raw_87 : RawOp :=
  RawOp.jump
    ⟨#[
      754,
      754,
      754,
      754,
      754
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t87\t{now}"
      handle.flush
noncomputable def record_87 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_87 label_87 raw_87
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t88\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t88\t{now}"
      handle.flush
def label_88 : Fin 4042 := ⟨88, by decide +kernel⟩
noncomputable def raw_88 : RawOp :=
  RawOp.jump
    ⟨#[
      89,
      89,
      89,
      89,
      89
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t88\t{now}"
      handle.flush
noncomputable def record_88 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_88 label_88 raw_88
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t89\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t89\t{now}"
      handle.flush
def label_89 : Fin 4042 := ⟨89, by decide +kernel⟩
noncomputable def raw_89 : RawOp :=
  RawOp.jump
    ⟨#[
      781,
      781,
      781,
      781,
      781
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t89\t{now}"
      handle.flush
noncomputable def record_89 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_89 label_89 raw_89
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t90\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t90\t{now}"
      handle.flush
def label_90 : Fin 4042 := ⟨90, by decide +kernel⟩
noncomputable def raw_90 : RawOp :=
  RawOp.jump
    ⟨#[
      111,
      111,
      111,
      111,
      111
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t90\t{now}"
      handle.flush
noncomputable def record_90 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_90 label_90 raw_90
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t91\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t91\t{now}"
      handle.flush
def label_91 : Fin 4042 := ⟨91, by decide +kernel⟩
noncomputable def raw_91 : RawOp :=
  RawOp.jump
    ⟨#[
      793,
      793,
      793,
      793,
      793
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t91\t{now}"
      handle.flush
noncomputable def record_91 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_91 label_91 raw_91
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t92\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t92\t{now}"
      handle.flush
def label_92 : Fin 4042 := ⟨92, by decide +kernel⟩
noncomputable def raw_92 : RawOp :=
  RawOp.jump
    ⟨#[
      820,
      820,
      820,
      820,
      820
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t92\t{now}"
      handle.flush
noncomputable def record_92 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_92 label_92 raw_92
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t93\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t93\t{now}"
      handle.flush
def label_93 : Fin 4042 := ⟨93, by decide +kernel⟩
noncomputable def raw_93 : RawOp :=
  RawOp.jump
    ⟨#[
      117,
      117,
      117,
      117,
      117
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t93\t{now}"
      handle.flush
noncomputable def record_93 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_93 label_93 raw_93
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t94\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t94\t{now}"
      handle.flush
def label_94 : Fin 4042 := ⟨94, by decide +kernel⟩
noncomputable def raw_94 : RawOp :=
  RawOp.jump
    ⟨#[
      832,
      832,
      832,
      832,
      832
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t94\t{now}"
      handle.flush
noncomputable def record_94 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_94 label_94 raw_94
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t95\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t95\t{now}"
      handle.flush
def label_95 : Fin 4042 := ⟨95, by decide +kernel⟩
noncomputable def raw_95 : RawOp :=
  RawOp.jump
    ⟨#[
      859,
      859,
      859,
      859,
      859
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t95\t{now}"
      handle.flush
noncomputable def record_95 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_95 label_95 raw_95
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t96\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t96\t{now}"
      handle.flush
def label_96 : Fin 4042 := ⟨96, by decide +kernel⟩
noncomputable def raw_96 : RawOp :=
  RawOp.jump
    ⟨#[
      128,
      128,
      128,
      128,
      128
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t96\t{now}"
      handle.flush
noncomputable def record_96 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_96 label_96 raw_96
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t97\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t97\t{now}"
      handle.flush
def label_97 : Fin 4042 := ⟨97, by decide +kernel⟩
noncomputable def raw_97 : RawOp :=
  RawOp.jump
    ⟨#[
      871,
      871,
      871,
      871,
      871
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t97\t{now}"
      handle.flush
noncomputable def record_97 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_97 label_97 raw_97
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t98\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t98\t{now}"
      handle.flush
def label_98 : Fin 4042 := ⟨98, by decide +kernel⟩
noncomputable def raw_98 : RawOp :=
  RawOp.jump
    ⟨#[
      898,
      898,
      898,
      898,
      898
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t98\t{now}"
      handle.flush
noncomputable def record_98 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_98 label_98 raw_98
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t99\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t99\t{now}"
      handle.flush
def label_99 : Fin 4042 := ⟨99, by decide +kernel⟩
noncomputable def raw_99 : RawOp :=
  RawOp.jump
    ⟨#[
      131,
      131,
      131,
      131,
      131
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t99\t{now}"
      handle.flush
noncomputable def record_99 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_99 label_99 raw_99
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t100\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t100\t{now}"
      handle.flush
def label_100 : Fin 4042 := ⟨100, by decide +kernel⟩
noncomputable def raw_100 : RawOp :=
  RawOp.jump
    ⟨#[
      910,
      910,
      910,
      910,
      910
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t100\t{now}"
      handle.flush
noncomputable def record_100 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_100 label_100 raw_100
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t101\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t101\t{now}"
      handle.flush
def label_101 : Fin 4042 := ⟨101, by decide +kernel⟩
noncomputable def raw_101 : RawOp :=
  RawOp.jump
    ⟨#[
      937,
      937,
      937,
      937,
      937
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t101\t{now}"
      handle.flush
noncomputable def record_101 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_101 label_101 raw_101
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t102\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t102\t{now}"
      handle.flush
def label_102 : Fin 4042 := ⟨102, by decide +kernel⟩
noncomputable def raw_102 : RawOp :=
  RawOp.jump
    ⟨#[
      152,
      152,
      152,
      152,
      152
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t102\t{now}"
      handle.flush
noncomputable def record_102 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_102 label_102 raw_102
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t103\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t103\t{now}"
      handle.flush
def label_103 : Fin 4042 := ⟨103, by decide +kernel⟩
noncomputable def raw_103 : RawOp :=
  RawOp.jump
    ⟨#[
      949,
      949,
      949,
      949,
      949
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t103\t{now}"
      handle.flush
noncomputable def record_103 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_103 label_103 raw_103
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t104\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t104\t{now}"
      handle.flush
def label_104 : Fin 4042 := ⟨104, by decide +kernel⟩
noncomputable def raw_104 : RawOp :=
  RawOp.jump
    ⟨#[
      976,
      976,
      976,
      976,
      976
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t104\t{now}"
      handle.flush
noncomputable def record_104 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_104 label_104 raw_104
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t105\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t105\t{now}"
      handle.flush
def label_105 : Fin 4042 := ⟨105, by decide +kernel⟩
noncomputable def raw_105 : RawOp :=
  RawOp.jump
    ⟨#[
      175,
      175,
      175,
      175,
      175
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t105\t{now}"
      handle.flush
noncomputable def record_105 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_105 label_105 raw_105
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t106\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t106\t{now}"
      handle.flush
def label_106 : Fin 4042 := ⟨106, by decide +kernel⟩
noncomputable def raw_106 : RawOp :=
  RawOp.jump
    ⟨#[
      988,
      988,
      988,
      988,
      988
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t106\t{now}"
      handle.flush
noncomputable def record_106 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_106 label_106 raw_106
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t107\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t107\t{now}"
      handle.flush
def label_107 : Fin 4042 := ⟨107, by decide +kernel⟩
noncomputable def raw_107 : RawOp :=
  RawOp.jump
    ⟨#[
      1015,
      1015,
      1015,
      1015,
      1015
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t107\t{now}"
      handle.flush
noncomputable def record_107 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_107 label_107 raw_107
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t108\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t108\t{now}"
      handle.flush
def label_108 : Fin 4042 := ⟨108, by decide +kernel⟩
noncomputable def raw_108 : RawOp :=
  RawOp.jump
    ⟨#[
      185,
      185,
      185,
      185,
      185
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t108\t{now}"
      handle.flush
noncomputable def record_108 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_108 label_108 raw_108
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t109\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t109\t{now}"
      handle.flush
def label_109 : Fin 4042 := ⟨109, by decide +kernel⟩
noncomputable def raw_109 : RawOp :=
  RawOp.jump
    ⟨#[
      1027,
      1027,
      1027,
      1027,
      1027
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t109\t{now}"
      handle.flush
noncomputable def record_109 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_109 label_109 raw_109
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t110\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t110\t{now}"
      handle.flush
def label_110 : Fin 4042 := ⟨110, by decide +kernel⟩
noncomputable def raw_110 : RawOp :=
  RawOp.jump
    ⟨#[
      110,
      110,
      110,
      110,
      110
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t110\t{now}"
      handle.flush
noncomputable def record_110 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_110 label_110 raw_110
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t111\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t111\t{now}"
      handle.flush
def label_111 : Fin 4042 := ⟨111, by decide +kernel⟩
noncomputable def raw_111 : RawOp :=
  RawOp.jump
    ⟨#[
      1035,
      1035,
      1035,
      1035,
      1035
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t111\t{now}"
      handle.flush
noncomputable def record_111 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_111 label_111 raw_111
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t112\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t112\t{now}"
      handle.flush
def label_112 : Fin 4042 := ⟨112, by decide +kernel⟩
noncomputable def raw_112 : RawOp :=
  RawOp.jump
    ⟨#[
      1043,
      1043,
      1043,
      1043,
      1043
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t112\t{now}"
      handle.flush
noncomputable def record_112 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_112 label_112 raw_112
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t113\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t113\t{now}"
      handle.flush
def label_113 : Fin 4042 := ⟨113, by decide +kernel⟩
noncomputable def raw_113 : RawOp :=
  RawOp.jump
    ⟨#[
      1048,
      1048,
      1048,
      1048,
      1048
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t113\t{now}"
      handle.flush
noncomputable def record_113 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_113 label_113 raw_113
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t114\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t114\t{now}"
      handle.flush
def label_114 : Fin 4042 := ⟨114, by decide +kernel⟩
noncomputable def raw_114 : RawOp :=
  RawOp.jump
    ⟨#[
      116,
      116,
      116,
      116,
      116
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t114\t{now}"
      handle.flush
noncomputable def record_114 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_114 label_114 raw_114
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t115\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t115\t{now}"
      handle.flush
def label_115 : Fin 4042 := ⟨115, by decide +kernel⟩
noncomputable def raw_115 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    113
    114
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t115\t{now}"
      handle.flush
noncomputable def record_115 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_115 label_115 raw_115
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t116\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t116\t{now}"
      handle.flush
def label_116 : Fin 4042 := ⟨116, by decide +kernel⟩
noncomputable def raw_116 : RawOp :=
  RawOp.jump
    ⟨#[
      210,
      210,
      210,
      210,
      210
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t116\t{now}"
      handle.flush
noncomputable def record_116 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_116 label_116 raw_116
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t117\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t117\t{now}"
      handle.flush
def label_117 : Fin 4042 := ⟨117, by decide +kernel⟩
noncomputable def raw_117 : RawOp :=
  RawOp.jump
    ⟨#[
      1056,
      1056,
      1056,
      1056,
      1056
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t117\t{now}"
      handle.flush
noncomputable def record_117 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_117 label_117 raw_117
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t118\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t118\t{now}"
      handle.flush
def label_118 : Fin 4042 := ⟨118, by decide +kernel⟩
noncomputable def raw_118 : RawOp :=
  RawOp.jump
    ⟨#[
      1064,
      1064,
      1064,
      1064,
      1064
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t118\t{now}"
      handle.flush
noncomputable def record_118 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_118 label_118 raw_118
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t119\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t119\t{now}"
      handle.flush
def label_119 : Fin 4042 := ⟨119, by decide +kernel⟩
noncomputable def raw_119 : RawOp :=
  RawOp.jump
    ⟨#[
      1078,
      1078,
      1078,
      1078,
      1078
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t119\t{now}"
      handle.flush
noncomputable def record_119 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_119 label_119 raw_119
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t120\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t120\t{now}"
      handle.flush
def label_120 : Fin 4042 := ⟨120, by decide +kernel⟩
noncomputable def raw_120 : RawOp :=
  RawOp.jump
    ⟨#[
      1083,
      1083,
      1083,
      1083,
      1083
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t120\t{now}"
      handle.flush
noncomputable def record_120 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_120 label_120 raw_120
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t121\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t121\t{now}"
      handle.flush
def label_121 : Fin 4042 := ⟨121, by decide +kernel⟩
noncomputable def raw_121 : RawOp :=
  RawOp.jump
    ⟨#[
      123,
      123,
      123,
      123,
      123
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t121\t{now}"
      handle.flush
noncomputable def record_121 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_121 label_121 raw_121
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t122\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t122\t{now}"
      handle.flush
def label_122 : Fin 4042 := ⟨122, by decide +kernel⟩
noncomputable def raw_122 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    120
    121
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t122\t{now}"
      handle.flush
noncomputable def record_122 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_122 label_122 raw_122
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t123\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t123\t{now}"
      handle.flush
def label_123 : Fin 4042 := ⟨123, by decide +kernel⟩
noncomputable def raw_123 : RawOp :=
  RawOp.jump
    ⟨#[
      124,
      125,
      124,
      124,
      124
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t123\t{now}"
      handle.flush
noncomputable def record_123 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_123 label_123 raw_123
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t124\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t124\t{now}"
      handle.flush
def label_124 : Fin 4042 := ⟨124, by decide +kernel⟩
noncomputable def raw_124 : RawOp :=
  RawOp.jump
    ⟨#[
      1091,
      1091,
      1091,
      1091,
      1091
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t124\t{now}"
      handle.flush
noncomputable def record_124 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_124 label_124 raw_124
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t125\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t125\t{now}"
      handle.flush
def label_125 : Fin 4042 := ⟨125, by decide +kernel⟩
noncomputable def raw_125 : RawOp :=
  RawOp.jump
    ⟨#[
      1105,
      1105,
      1105,
      1105,
      1105
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t125\t{now}"
      handle.flush
noncomputable def record_125 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_125 label_125 raw_125
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t126\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t126\t{now}"
      handle.flush
def label_126 : Fin 4042 := ⟨126, by decide +kernel⟩
noncomputable def raw_126 : RawOp :=
  RawOp.jump
    ⟨#[
      1131,
      1131,
      1131,
      1131,
      1131
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t126\t{now}"
      handle.flush
noncomputable def record_126 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_126 label_126 raw_126
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t127\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t127\t{now}"
      handle.flush
def label_127 : Fin 4042 := ⟨127, by decide +kernel⟩
noncomputable def raw_127 : RawOp :=
  RawOp.jump
    ⟨#[
      1143,
      1143,
      1143,
      1143,
      1143
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t127\t{now}"
      handle.flush
noncomputable def record_127 : SourceCertificate :=
  ScopeViews000Pilot.fromRaw_127 label_127 raw_127
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t128\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t128\t{now}"
      handle.flush
def label_128 : Fin 4042 := ⟨128, by decide +kernel⟩
noncomputable def raw_128 : RawOp :=
  RawOp.jump
    ⟨#[
      1151,
      1151,
      1151,
      1151,
      1151
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t128\t{now}"
      handle.flush
noncomputable def record_128 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_128 label_128 raw_128
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t129\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t129\t{now}"
      handle.flush
def label_129 : Fin 4042 := ⟨129, by decide +kernel⟩
noncomputable def raw_129 : RawOp :=
  RawOp.jump
    ⟨#[
      1159,
      1159,
      1159,
      1159,
      1159
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t129\t{now}"
      handle.flush
noncomputable def record_129 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_129 label_129 raw_129
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t130\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t130\t{now}"
      handle.flush
def label_130 : Fin 4042 := ⟨130, by decide +kernel⟩
noncomputable def raw_130 : RawOp :=
  RawOp.jump
    ⟨#[
      1167,
      1167,
      1167,
      1167,
      1167
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t130\t{now}"
      handle.flush
noncomputable def record_130 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_130 label_130 raw_130
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t131\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t131\t{now}"
      handle.flush
def label_131 : Fin 4042 := ⟨131, by decide +kernel⟩
noncomputable def raw_131 : RawOp :=
  RawOp.jump
    ⟨#[
      1181,
      1181,
      1181,
      1181,
      1181
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t131\t{now}"
      handle.flush
noncomputable def record_131 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_131 label_131 raw_131
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t132\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t132\t{now}"
      handle.flush
def label_132 : Fin 4042 := ⟨132, by decide +kernel⟩
noncomputable def raw_132 : RawOp :=
  RawOp.jump
    ⟨#[
      1186,
      1186,
      1186,
      1186,
      1186
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t132\t{now}"
      handle.flush
noncomputable def record_132 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_132 label_132 raw_132
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t133\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t133\t{now}"
      handle.flush
def label_133 : Fin 4042 := ⟨133, by decide +kernel⟩
noncomputable def raw_133 : RawOp :=
  RawOp.jump
    ⟨#[
      135,
      135,
      135,
      135,
      135
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t133\t{now}"
      handle.flush
noncomputable def record_133 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_133 label_133 raw_133
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t134\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t134\t{now}"
      handle.flush
def label_134 : Fin 4042 := ⟨134, by decide +kernel⟩
noncomputable def raw_134 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    132
    133
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t134\t{now}"
      handle.flush
noncomputable def record_134 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_134 label_134 raw_134
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t135\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t135\t{now}"
      handle.flush
def label_135 : Fin 4042 := ⟨135, by decide +kernel⟩
noncomputable def raw_135 : RawOp :=
  RawOp.jump
    ⟨#[
      1198,
      1198,
      1198,
      1198,
      1198
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t135\t{now}"
      handle.flush
noncomputable def record_135 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_135 label_135 raw_135
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t136\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t136\t{now}"
      handle.flush
def label_136 : Fin 4042 := ⟨136, by decide +kernel⟩
noncomputable def raw_136 : RawOp :=
  RawOp.jump
    ⟨#[
      1203,
      1203,
      1203,
      1203,
      1203
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t136\t{now}"
      handle.flush
noncomputable def record_136 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_136 label_136 raw_136
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t137\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t137\t{now}"
      handle.flush
def label_137 : Fin 4042 := ⟨137, by decide +kernel⟩
noncomputable def raw_137 : RawOp :=
  RawOp.jump
    ⟨#[
      139,
      139,
      139,
      139,
      139
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t137\t{now}"
      handle.flush
noncomputable def record_137 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_137 label_137 raw_137
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t138\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t138\t{now}"
      handle.flush
def label_138 : Fin 4042 := ⟨138, by decide +kernel⟩
noncomputable def raw_138 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    136
    137
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t138\t{now}"
      handle.flush
noncomputable def record_138 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_138 label_138 raw_138
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t139\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t139\t{now}"
      handle.flush
def label_139 : Fin 4042 := ⟨139, by decide +kernel⟩
noncomputable def raw_139 : RawOp :=
  RawOp.jump
    ⟨#[
      1215,
      1215,
      1215,
      1215,
      1215
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t139\t{now}"
      handle.flush
noncomputable def record_139 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_139 label_139 raw_139
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t140\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t140\t{now}"
      handle.flush
def label_140 : Fin 4042 := ⟨140, by decide +kernel⟩
noncomputable def raw_140 : RawOp :=
  RawOp.jump
    ⟨#[
      1235,
      1235,
      1235,
      1235,
      1235
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t140\t{now}"
      handle.flush
noncomputable def record_140 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_140 label_140 raw_140
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t141\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t141\t{now}"
      handle.flush
def label_141 : Fin 4042 := ⟨141, by decide +kernel⟩
noncomputable def raw_141 : RawOp :=
  RawOp.jump
    ⟨#[
      1240,
      1240,
      1240,
      1240,
      1240
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t141\t{now}"
      handle.flush
noncomputable def record_141 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_141 label_141 raw_141
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t142\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t142\t{now}"
      handle.flush
def label_142 : Fin 4042 := ⟨142, by decide +kernel⟩
noncomputable def raw_142 : RawOp :=
  RawOp.jump
    ⟨#[
      146,
      146,
      146,
      146,
      146
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t142\t{now}"
      handle.flush
noncomputable def record_142 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_142 label_142 raw_142
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t143\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t143\t{now}"
      handle.flush
def label_143 : Fin 4042 := ⟨143, by decide +kernel⟩
noncomputable def raw_143 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    141
    142
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t143\t{now}"
      handle.flush
noncomputable def record_143 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_143 label_143 raw_143
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t144\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t144\t{now}"
      handle.flush
def label_144 : Fin 4042 := ⟨144, by decide +kernel⟩
noncomputable def raw_144 : RawOp :=
  RawOp.jump
    ⟨#[
      1245,
      1245,
      1245,
      1245,
      1245
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t144\t{now}"
      handle.flush
noncomputable def record_144 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_144 label_144 raw_144
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t145\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t145\t{now}"
      handle.flush
def label_145 : Fin 4042 := ⟨145, by decide +kernel⟩
noncomputable def raw_145 : RawOp :=
  RawOp.jump
    ⟨#[
      147,
      147,
      147,
      147,
      147
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t145\t{now}"
      handle.flush
noncomputable def record_145 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_145 label_145 raw_145
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t146\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t146\t{now}"
      handle.flush
def label_146 : Fin 4042 := ⟨146, by decide +kernel⟩
noncomputable def raw_146 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    144
    145
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t146\t{now}"
      handle.flush
noncomputable def record_146 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_146 label_146 raw_146
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t147\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t147\t{now}"
      handle.flush
def label_147 : Fin 4042 := ⟨147, by decide +kernel⟩
noncomputable def raw_147 : RawOp :=
  RawOp.jump
    ⟨#[
      1257,
      1257,
      1257,
      1257,
      1257
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t147\t{now}"
      handle.flush
noncomputable def record_147 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_147 label_147 raw_147
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t148\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t148\t{now}"
      handle.flush
def label_148 : Fin 4042 := ⟨148, by decide +kernel⟩
noncomputable def raw_148 : RawOp :=
  RawOp.jump
    ⟨#[
      1262,
      1262,
      1262,
      1262,
      1262
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t148\t{now}"
      handle.flush
noncomputable def record_148 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_148 label_148 raw_148
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t149\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t149\t{now}"
      handle.flush
def label_149 : Fin 4042 := ⟨149, by decide +kernel⟩
noncomputable def raw_149 : RawOp :=
  RawOp.jump
    ⟨#[
      151,
      151,
      151,
      151,
      151
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t149\t{now}"
      handle.flush
noncomputable def record_149 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_149 label_149 raw_149
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t150\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t150\t{now}"
      handle.flush
def label_150 : Fin 4042 := ⟨150, by decide +kernel⟩
noncomputable def raw_150 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    148
    149
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t150\t{now}"
      handle.flush
noncomputable def record_150 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_150 label_150 raw_150
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t151\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t151\t{now}"
      handle.flush
def label_151 : Fin 4042 := ⟨151, by decide +kernel⟩
noncomputable def raw_151 : RawOp :=
  RawOp.jump
    ⟨#[
      1274,
      1274,
      1274,
      1274,
      1274
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t151\t{now}"
      handle.flush
noncomputable def record_151 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_151 label_151 raw_151
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t152\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t152\t{now}"
      handle.flush
def label_152 : Fin 4042 := ⟨152, by decide +kernel⟩
noncomputable def raw_152 : RawOp :=
  RawOp.jump
    ⟨#[
      1288,
      1288,
      1288,
      1288,
      1288
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t152\t{now}"
      handle.flush
noncomputable def record_152 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_152 label_152 raw_152
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t153\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t153\t{now}"
      handle.flush
def label_153 : Fin 4042 := ⟨153, by decide +kernel⟩
noncomputable def raw_153 : RawOp :=
  RawOp.jump
    ⟨#[
      1293,
      1293,
      1293,
      1293,
      1293
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t153\t{now}"
      handle.flush
noncomputable def record_153 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_153 label_153 raw_153
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t154\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t154\t{now}"
      handle.flush
def label_154 : Fin 4042 := ⟨154, by decide +kernel⟩
noncomputable def raw_154 : RawOp :=
  RawOp.jump
    ⟨#[
      156,
      156,
      156,
      156,
      156
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t154\t{now}"
      handle.flush
noncomputable def record_154 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_154 label_154 raw_154
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t155\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t155\t{now}"
      handle.flush
def label_155 : Fin 4042 := ⟨155, by decide +kernel⟩
noncomputable def raw_155 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    153
    154
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t155\t{now}"
      handle.flush
noncomputable def record_155 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_155 label_155 raw_155
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t156\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t156\t{now}"
      handle.flush
def label_156 : Fin 4042 := ⟨156, by decide +kernel⟩
noncomputable def raw_156 : RawOp :=
  RawOp.jump
    ⟨#[
      1305,
      1305,
      1305,
      1305,
      1305
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t156\t{now}"
      handle.flush
noncomputable def record_156 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_156 label_156 raw_156
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t157\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t157\t{now}"
      handle.flush
def label_157 : Fin 4042 := ⟨157, by decide +kernel⟩
noncomputable def raw_157 : RawOp :=
  RawOp.jump
    ⟨#[
      1319,
      1319,
      1319,
      1319,
      1319
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t157\t{now}"
      handle.flush
noncomputable def record_157 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_157 label_157 raw_157
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t158\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t158\t{now}"
      handle.flush
def label_158 : Fin 4042 := ⟨158, by decide +kernel⟩
noncomputable def raw_158 : RawOp :=
  RawOp.jump
    ⟨#[
      1324,
      1324,
      1324,
      1324,
      1324
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t158\t{now}"
      handle.flush
noncomputable def record_158 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_158 label_158 raw_158
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t159\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t159\t{now}"
      handle.flush
def label_159 : Fin 4042 := ⟨159, by decide +kernel⟩
noncomputable def raw_159 : RawOp :=
  RawOp.jump
    ⟨#[
      161,
      161,
      161,
      161,
      161
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t159\t{now}"
      handle.flush
noncomputable def record_159 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_159 label_159 raw_159
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t160\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t160\t{now}"
      handle.flush
def label_160 : Fin 4042 := ⟨160, by decide +kernel⟩
noncomputable def raw_160 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    158
    159
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t160\t{now}"
      handle.flush
noncomputable def record_160 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_160 label_160 raw_160
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t161\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t161\t{now}"
      handle.flush
def label_161 : Fin 4042 := ⟨161, by decide +kernel⟩
noncomputable def raw_161 : RawOp :=
  RawOp.jump
    ⟨#[
      1336,
      1336,
      1336,
      1336,
      1336
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t161\t{now}"
      handle.flush
noncomputable def record_161 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_161 label_161 raw_161
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t162\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t162\t{now}"
      handle.flush
def label_162 : Fin 4042 := ⟨162, by decide +kernel⟩
noncomputable def raw_162 : RawOp :=
  RawOp.jump
    ⟨#[
      1350,
      1350,
      1350,
      1350,
      1350
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t162\t{now}"
      handle.flush
noncomputable def record_162 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_162 label_162 raw_162
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t163\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t163\t{now}"
      handle.flush
def label_163 : Fin 4042 := ⟨163, by decide +kernel⟩
noncomputable def raw_163 : RawOp :=
  RawOp.jump
    ⟨#[
      1355,
      1355,
      1355,
      1355,
      1355
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t163\t{now}"
      handle.flush
noncomputable def record_163 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_163 label_163 raw_163
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t164\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t164\t{now}"
      handle.flush
def label_164 : Fin 4042 := ⟨164, by decide +kernel⟩
noncomputable def raw_164 : RawOp :=
  RawOp.jump
    ⟨#[
      166,
      166,
      166,
      166,
      166
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t164\t{now}"
      handle.flush
noncomputable def record_164 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_164 label_164 raw_164
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t165\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t165\t{now}"
      handle.flush
def label_165 : Fin 4042 := ⟨165, by decide +kernel⟩
noncomputable def raw_165 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    163
    164
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t165\t{now}"
      handle.flush
noncomputable def record_165 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_165 label_165 raw_165
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t166\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t166\t{now}"
      handle.flush
def label_166 : Fin 4042 := ⟨166, by decide +kernel⟩
noncomputable def raw_166 : RawOp :=
  RawOp.jump
    ⟨#[
      1367,
      1367,
      1367,
      1367,
      1367
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t166\t{now}"
      handle.flush
noncomputable def record_166 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_166 label_166 raw_166
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t167\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t167\t{now}"
      handle.flush
def label_167 : Fin 4042 := ⟨167, by decide +kernel⟩
noncomputable def raw_167 : RawOp :=
  RawOp.jump
    ⟨#[
      1372,
      1372,
      1372,
      1372,
      1372
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t167\t{now}"
      handle.flush
noncomputable def record_167 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_167 label_167 raw_167
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t168\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t168\t{now}"
      handle.flush
def label_168 : Fin 4042 := ⟨168, by decide +kernel⟩
noncomputable def raw_168 : RawOp :=
  RawOp.jump
    ⟨#[
      172,
      172,
      172,
      172,
      172
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t168\t{now}"
      handle.flush
noncomputable def record_168 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_168 label_168 raw_168
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t169\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t169\t{now}"
      handle.flush
def label_169 : Fin 4042 := ⟨169, by decide +kernel⟩
noncomputable def raw_169 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    167
    168
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t169\t{now}"
      handle.flush
noncomputable def record_169 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_169 label_169 raw_169
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t170\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t170\t{now}"
      handle.flush
def label_170 : Fin 4042 := ⟨170, by decide +kernel⟩
noncomputable def raw_170 : RawOp :=
  RawOp.jump
    ⟨#[
      1377,
      1377,
      1377,
      1377,
      1377
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t170\t{now}"
      handle.flush
noncomputable def record_170 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_170 label_170 raw_170
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t171\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t171\t{now}"
      handle.flush
def label_171 : Fin 4042 := ⟨171, by decide +kernel⟩
noncomputable def raw_171 : RawOp :=
  RawOp.jump
    ⟨#[
      174,
      174,
      174,
      174,
      174
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t171\t{now}"
      handle.flush
noncomputable def record_171 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_171 label_171 raw_171
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t172\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t172\t{now}"
      handle.flush
def label_172 : Fin 4042 := ⟨172, by decide +kernel⟩
noncomputable def raw_172 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    170
    171
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t172\t{now}"
      handle.flush
noncomputable def record_172 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_172 label_172 raw_172
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t173\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t173\t{now}"
      handle.flush
def label_173 : Fin 4042 := ⟨173, by decide +kernel⟩
noncomputable def raw_173 : RawOp :=
  RawOp.jump
    ⟨#[
      1380,
      1380,
      1380,
      1380,
      1380
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t173\t{now}"
      handle.flush
noncomputable def record_173 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_173 label_173 raw_173
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t174\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t174\t{now}"
      handle.flush
def label_174 : Fin 4042 := ⟨174, by decide +kernel⟩
noncomputable def raw_174 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    173
    18
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t174\t{now}"
      handle.flush
noncomputable def record_174 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_174 label_174 raw_174
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t175\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t175\t{now}"
      handle.flush
def label_175 : Fin 4042 := ⟨175, by decide +kernel⟩
noncomputable def raw_175 : RawOp :=
  RawOp.jump
    ⟨#[
      1407,
      1407,
      1407,
      1407,
      1407
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t175\t{now}"
      handle.flush
noncomputable def record_175 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_175 label_175 raw_175
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t176\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t176\t{now}"
      handle.flush
def label_176 : Fin 4042 := ⟨176, by decide +kernel⟩
noncomputable def raw_176 : RawOp :=
  RawOp.jump
    ⟨#[
      1421,
      1421,
      1421,
      1421,
      1421
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t176\t{now}"
      handle.flush
noncomputable def record_176 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_176 label_176 raw_176
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t177\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t177\t{now}"
      handle.flush
def label_177 : Fin 4042 := ⟨177, by decide +kernel⟩
noncomputable def raw_177 : RawOp :=
  RawOp.jump
    ⟨#[
      1426,
      1426,
      1426,
      1426,
      1426
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t177\t{now}"
      handle.flush
noncomputable def record_177 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_177 label_177 raw_177
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t178\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t178\t{now}"
      handle.flush
def label_178 : Fin 4042 := ⟨178, by decide +kernel⟩
noncomputable def raw_178 : RawOp :=
  RawOp.jump
    ⟨#[
      180,
      180,
      180,
      180,
      180
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t178\t{now}"
      handle.flush
noncomputable def record_178 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_178 label_178 raw_178
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t179\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t179\t{now}"
      handle.flush
def label_179 : Fin 4042 := ⟨179, by decide +kernel⟩
noncomputable def raw_179 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    177
    178
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t179\t{now}"
      handle.flush
noncomputable def record_179 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_179 label_179 raw_179
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t180\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t180\t{now}"
      handle.flush
def label_180 : Fin 4042 := ⟨180, by decide +kernel⟩
noncomputable def raw_180 : RawOp :=
  RawOp.jump
    ⟨#[
      1438,
      1438,
      1438,
      1438,
      1438
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t180\t{now}"
      handle.flush
noncomputable def record_180 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_180 label_180 raw_180
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t181\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t181\t{now}"
      handle.flush
def label_181 : Fin 4042 := ⟨181, by decide +kernel⟩
noncomputable def raw_181 : RawOp :=
  RawOp.jump
    ⟨#[
      1446,
      1446,
      1446,
      1446,
      1446
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t181\t{now}"
      handle.flush
noncomputable def record_181 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_181 label_181 raw_181
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t182\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t182\t{now}"
      handle.flush
def label_182 : Fin 4042 := ⟨182, by decide +kernel⟩
noncomputable def raw_182 : RawOp :=
  RawOp.jump
    ⟨#[
      1458,
      1458,
      1458,
      1458,
      1458
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t182\t{now}"
      handle.flush
noncomputable def record_182 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_182 label_182 raw_182
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t183\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t183\t{now}"
      handle.flush
def label_183 : Fin 4042 := ⟨183, by decide +kernel⟩
noncomputable def raw_183 : RawOp :=
  RawOp.jump
    ⟨#[
      1466,
      1466,
      1466,
      1466,
      1466
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t183\t{now}"
      handle.flush
noncomputable def record_183 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_183 label_183 raw_183
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t184\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t184\t{now}"
      handle.flush
def label_184 : Fin 4042 := ⟨184, by decide +kernel⟩
noncomputable def raw_184 : RawOp :=
  RawOp.jump
    ⟨#[
      1480,
      1480,
      1480,
      1480,
      1480
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t184\t{now}"
      handle.flush
noncomputable def record_184 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_184 label_184 raw_184
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t185\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t185\t{now}"
      handle.flush
def label_185 : Fin 4042 := ⟨185, by decide +kernel⟩
noncomputable def raw_185 : RawOp :=
  RawOp.jump
    ⟨#[
      1494,
      1494,
      1494,
      1494,
      1494
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t185\t{now}"
      handle.flush
noncomputable def record_185 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_185 label_185 raw_185
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t186\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t186\t{now}"
      handle.flush
def label_186 : Fin 4042 := ⟨186, by decide +kernel⟩
noncomputable def raw_186 : RawOp :=
  RawOp.jump
    ⟨#[
      1499,
      1499,
      1499,
      1499,
      1499
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t186\t{now}"
      handle.flush
noncomputable def record_186 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_186 label_186 raw_186
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t187\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t187\t{now}"
      handle.flush
def label_187 : Fin 4042 := ⟨187, by decide +kernel⟩
noncomputable def raw_187 : RawOp :=
  RawOp.jump
    ⟨#[
      189,
      189,
      189,
      189,
      189
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t187\t{now}"
      handle.flush
noncomputable def record_187 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_187 label_187 raw_187
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t188\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t188\t{now}"
      handle.flush
def label_188 : Fin 4042 := ⟨188, by decide +kernel⟩
noncomputable def raw_188 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    186
    187
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t188\t{now}"
      handle.flush
noncomputable def record_188 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_188 label_188 raw_188
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t189\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t189\t{now}"
      handle.flush
def label_189 : Fin 4042 := ⟨189, by decide +kernel⟩
noncomputable def raw_189 : RawOp :=
  RawOp.jump
    ⟨#[
      1511,
      1511,
      1511,
      1511,
      1511
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t189\t{now}"
      handle.flush
noncomputable def record_189 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_189 label_189 raw_189
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t190\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t190\t{now}"
      handle.flush
def label_190 : Fin 4042 := ⟨190, by decide +kernel⟩
noncomputable def raw_190 : RawOp :=
  RawOp.jump
    ⟨#[
      1519,
      1519,
      1519,
      1519,
      1519
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t190\t{now}"
      handle.flush
noncomputable def record_190 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_190 label_190 raw_190
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t191\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t191\t{now}"
      handle.flush
def label_191 : Fin 4042 := ⟨191, by decide +kernel⟩
noncomputable def raw_191 : RawOp :=
  RawOp.jump
    ⟨#[
      1533,
      1533,
      1533,
      1533,
      1533
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t191\t{now}"
      handle.flush
noncomputable def record_191 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_191 label_191 raw_191
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t192\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t192\t{now}"
      handle.flush
def label_192 : Fin 4042 := ⟨192, by decide +kernel⟩
noncomputable def raw_192 : RawOp :=
  RawOp.jump
    ⟨#[
      1538,
      1538,
      1538,
      1538,
      1538
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t192\t{now}"
      handle.flush
noncomputable def record_192 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_192 label_192 raw_192
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t193\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t193\t{now}"
      handle.flush
def label_193 : Fin 4042 := ⟨193, by decide +kernel⟩
noncomputable def raw_193 : RawOp :=
  RawOp.jump
    ⟨#[
      197,
      197,
      197,
      197,
      197
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t193\t{now}"
      handle.flush
noncomputable def record_193 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_193 label_193 raw_193
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t194\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t194\t{now}"
      handle.flush
def label_194 : Fin 4042 := ⟨194, by decide +kernel⟩
noncomputable def raw_194 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    192
    193
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t194\t{now}"
      handle.flush
noncomputable def record_194 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_194 label_194 raw_194
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t195\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t195\t{now}"
      handle.flush
def label_195 : Fin 4042 := ⟨195, by decide +kernel⟩
noncomputable def raw_195 : RawOp :=
  RawOp.jump
    ⟨#[
      1543,
      1543,
      1543,
      1543,
      1543
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t195\t{now}"
      handle.flush
noncomputable def record_195 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_195 label_195 raw_195
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t196\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t196\t{now}"
      handle.flush
def label_196 : Fin 4042 := ⟨196, by decide +kernel⟩
noncomputable def raw_196 : RawOp :=
  RawOp.jump
    ⟨#[
      198,
      198,
      198,
      198,
      198
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t196\t{now}"
      handle.flush
noncomputable def record_196 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_196 label_196 raw_196
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t197\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t197\t{now}"
      handle.flush
def label_197 : Fin 4042 := ⟨197, by decide +kernel⟩
noncomputable def raw_197 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    195
    196
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t197\t{now}"
      handle.flush
noncomputable def record_197 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_197 label_197 raw_197
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t198\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t198\t{now}"
      handle.flush
def label_198 : Fin 4042 := ⟨198, by decide +kernel⟩
noncomputable def raw_198 : RawOp :=
  RawOp.jump
    ⟨#[
      1561,
      1561,
      1561,
      1561,
      1561
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t198\t{now}"
      handle.flush
noncomputable def record_198 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_198 label_198 raw_198
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t199\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t199\t{now}"
      handle.flush
def label_199 : Fin 4042 := ⟨199, by decide +kernel⟩
noncomputable def raw_199 : RawOp :=
  RawOp.jump
    ⟨#[
      1566,
      1566,
      1566,
      1566,
      1566
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t199\t{now}"
      handle.flush
noncomputable def record_199 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_199 label_199 raw_199
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t200\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t200\t{now}"
      handle.flush
def label_200 : Fin 4042 := ⟨200, by decide +kernel⟩
noncomputable def raw_200 : RawOp :=
  RawOp.jump
    ⟨#[
      204,
      204,
      204,
      204,
      204
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t200\t{now}"
      handle.flush
noncomputable def record_200 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_200 label_200 raw_200
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t201\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t201\t{now}"
      handle.flush
def label_201 : Fin 4042 := ⟨201, by decide +kernel⟩
noncomputable def raw_201 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    199
    200
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t201\t{now}"
      handle.flush
noncomputable def record_201 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_201 label_201 raw_201
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t202\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t202\t{now}"
      handle.flush
def label_202 : Fin 4042 := ⟨202, by decide +kernel⟩
noncomputable def raw_202 : RawOp :=
  RawOp.jump
    ⟨#[
      1571,
      1571,
      1571,
      1571,
      1571
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t202\t{now}"
      handle.flush
noncomputable def record_202 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_202 label_202 raw_202
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t203\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t203\t{now}"
      handle.flush
def label_203 : Fin 4042 := ⟨203, by decide +kernel⟩
noncomputable def raw_203 : RawOp :=
  RawOp.jump
    ⟨#[
      207,
      207,
      207,
      207,
      207
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t203\t{now}"
      handle.flush
noncomputable def record_203 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_203 label_203 raw_203
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t204\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t204\t{now}"
      handle.flush
def label_204 : Fin 4042 := ⟨204, by decide +kernel⟩
noncomputable def raw_204 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    202
    203
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t204\t{now}"
      handle.flush
noncomputable def record_204 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_204 label_204 raw_204
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t205\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t205\t{now}"
      handle.flush
def label_205 : Fin 4042 := ⟨205, by decide +kernel⟩
noncomputable def raw_205 : RawOp :=
  RawOp.jump
    ⟨#[
      1576,
      1576,
      1576,
      1576,
      1576
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t205\t{now}"
      handle.flush
noncomputable def record_205 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_205 label_205 raw_205
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t206\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t206\t{now}"
      handle.flush
def label_206 : Fin 4042 := ⟨206, by decide +kernel⟩
noncomputable def raw_206 : RawOp :=
  RawOp.jump
    ⟨#[
      209,
      209,
      209,
      209,
      209
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t206\t{now}"
      handle.flush
noncomputable def record_206 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_206 label_206 raw_206
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t207\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t207\t{now}"
      handle.flush
def label_207 : Fin 4042 := ⟨207, by decide +kernel⟩
noncomputable def raw_207 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    205
    206
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t207\t{now}"
      handle.flush
noncomputable def record_207 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_207 label_207 raw_207
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t208\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t208\t{now}"
      handle.flush
def label_208 : Fin 4042 := ⟨208, by decide +kernel⟩
noncomputable def raw_208 : RawOp :=
  RawOp.jump
    ⟨#[
      1579,
      1579,
      1579,
      1579,
      1579
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t208\t{now}"
      handle.flush
noncomputable def record_208 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_208 label_208 raw_208
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t209\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t209\t{now}"
      handle.flush
def label_209 : Fin 4042 := ⟨209, by decide +kernel⟩
noncomputable def raw_209 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    208
    18
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t209\t{now}"
      handle.flush
noncomputable def record_209 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_209 label_209 raw_209
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t210\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t210\t{now}"
      handle.flush
def label_210 : Fin 4042 := ⟨210, by decide +kernel⟩
noncomputable def raw_210 : RawOp :=
  RawOp.jump
    ⟨#[
      1593,
      1593,
      1593,
      1593,
      1593
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t210\t{now}"
      handle.flush
noncomputable def record_210 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_210 label_210 raw_210
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t211\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t211\t{now}"
      handle.flush
def label_211 : Fin 4042 := ⟨211, by decide +kernel⟩
noncomputable def raw_211 : RawOp :=
  RawOp.jump
    ⟨#[
      1598,
      1598,
      1598,
      1598,
      1598
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t211\t{now}"
      handle.flush
noncomputable def record_211 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_211 label_211 raw_211
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t212\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t212\t{now}"
      handle.flush
def label_212 : Fin 4042 := ⟨212, by decide +kernel⟩
noncomputable def raw_212 : RawOp :=
  RawOp.jump
    ⟨#[
      214,
      214,
      214,
      214,
      214
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t212\t{now}"
      handle.flush
noncomputable def record_212 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_212 label_212 raw_212
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t213\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t213\t{now}"
      handle.flush
def label_213 : Fin 4042 := ⟨213, by decide +kernel⟩
noncomputable def raw_213 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    211
    212
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t213\t{now}"
      handle.flush
noncomputable def record_213 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_213 label_213 raw_213
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t214\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t214\t{now}"
      handle.flush
def label_214 : Fin 4042 := ⟨214, by decide +kernel⟩
noncomputable def raw_214 : RawOp :=
  RawOp.jump
    ⟨#[
      1610,
      1610,
      1610,
      1610,
      1610
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t214\t{now}"
      handle.flush
noncomputable def record_214 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_214 label_214 raw_214
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t215\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t215\t{now}"
      handle.flush
def label_215 : Fin 4042 := ⟨215, by decide +kernel⟩
noncomputable def raw_215 : RawOp :=
  RawOp.jump
    ⟨#[
      1637,
      1637,
      1637,
      1637,
      1637
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t215\t{now}"
      handle.flush
noncomputable def record_215 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_215 label_215 raw_215
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t216\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t216\t{now}"
      handle.flush
def label_216 : Fin 4042 := ⟨216, by decide +kernel⟩
noncomputable def raw_216 : RawOp :=
  RawOp.halt
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t216\t{now}"
      handle.flush
noncomputable def record_216 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_216 label_216 raw_216
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t217\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t217\t{now}"
      handle.flush
def label_217 : Fin 4042 := ⟨217, by decide +kernel⟩
noncomputable def raw_217 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    216
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t217\t{now}"
      handle.flush
noncomputable def record_217 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_217 label_217 raw_217
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t218\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t218\t{now}"
      handle.flush
def label_218 : Fin 4042 := ⟨218, by decide +kernel⟩
noncomputable def raw_218 : RawOp :=
  RawOp.jump
    ⟨#[
      1649,
      1649,
      1649,
      1649,
      1649
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t218\t{now}"
      handle.flush
noncomputable def record_218 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_218 label_218 raw_218
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t219\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t219\t{now}"
      handle.flush
def label_219 : Fin 4042 := ⟨219, by decide +kernel⟩
noncomputable def raw_219 : RawOp :=
  RawOp.jump
    ⟨#[
      1676,
      1676,
      1676,
      1676,
      1676
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t219\t{now}"
      handle.flush
noncomputable def record_219 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_219 label_219 raw_219
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t220\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t220\t{now}"
      handle.flush
def label_220 : Fin 4042 := ⟨220, by decide +kernel⟩
noncomputable def raw_220 : RawOp :=
  RawOp.jump
    ⟨#[
      230,
      230,
      230,
      230,
      230
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t220\t{now}"
      handle.flush
noncomputable def record_220 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_220 label_220 raw_220
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t221\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t221\t{now}"
      handle.flush
def label_221 : Fin 4042 := ⟨221, by decide +kernel⟩
noncomputable def raw_221 : RawOp :=
  RawOp.jump
    ⟨#[
      1688,
      1688,
      1688,
      1688,
      1688
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t221\t{now}"
      handle.flush
noncomputable def record_221 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_221 label_221 raw_221
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t222\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t222\t{now}"
      handle.flush
def label_222 : Fin 4042 := ⟨222, by decide +kernel⟩
noncomputable def raw_222 : RawOp :=
  RawOp.jump
    ⟨#[
      1715,
      1715,
      1715,
      1715,
      1715
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t222\t{now}"
      handle.flush
noncomputable def record_222 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_222 label_222 raw_222
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t223\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t223\t{now}"
      handle.flush
def label_223 : Fin 4042 := ⟨223, by decide +kernel⟩
noncomputable def raw_223 : RawOp :=
  RawOp.jump
    ⟨#[
      263,
      263,
      263,
      263,
      263
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t223\t{now}"
      handle.flush
noncomputable def record_223 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_223 label_223 raw_223
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t224\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t224\t{now}"
      handle.flush
def label_224 : Fin 4042 := ⟨224, by decide +kernel⟩
noncomputable def raw_224 : RawOp :=
  RawOp.jump
    ⟨#[
      1727,
      1727,
      1727,
      1727,
      1727
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t224\t{now}"
      handle.flush
noncomputable def record_224 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_224 label_224 raw_224
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t225\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t225\t{now}"
      handle.flush
def label_225 : Fin 4042 := ⟨225, by decide +kernel⟩
noncomputable def raw_225 : RawOp :=
  RawOp.jump
    ⟨#[
      1754,
      1754,
      1754,
      1754,
      1754
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t225\t{now}"
      handle.flush
noncomputable def record_225 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_225 label_225 raw_225
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t226\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t226\t{now}"
      handle.flush
def label_226 : Fin 4042 := ⟨226, by decide +kernel⟩
noncomputable def raw_226 : RawOp :=
  RawOp.jump
    ⟨#[
      184,
      184,
      184,
      184,
      184
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t226\t{now}"
      handle.flush
noncomputable def record_226 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_226 label_226 raw_226
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t227\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t227\t{now}"
      handle.flush
def label_227 : Fin 4042 := ⟨227, by decide +kernel⟩
noncomputable def raw_227 : RawOp :=
  RawOp.jump
    ⟨#[
      1766,
      1766,
      1766,
      1766,
      1766
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t227\t{now}"
      handle.flush
noncomputable def record_227 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_227 label_227 raw_227
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t228\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t228\t{now}"
      handle.flush
def label_228 : Fin 4042 := ⟨228, by decide +kernel⟩
noncomputable def raw_228 : RawOp :=
  RawOp.jump
    ⟨#[
      1780,
      1780,
      1780,
      1780,
      1780
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t228\t{now}"
      handle.flush
noncomputable def record_228 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_228 label_228 raw_228
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t229\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t229\t{now}"
      handle.flush
def label_229 : Fin 4042 := ⟨229, by decide +kernel⟩
noncomputable def raw_229 : RawOp :=
  RawOp.jump
    ⟨#[
      267,
      267,
      267,
      267,
      267
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t229\t{now}"
      handle.flush
noncomputable def record_229 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_229 label_229 raw_229
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t230\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t230\t{now}"
      handle.flush
def label_230 : Fin 4042 := ⟨230, by decide +kernel⟩
noncomputable def raw_230 : RawOp :=
  RawOp.jump
    ⟨#[
      1794,
      1794,
      1794,
      1794,
      1794
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t230\t{now}"
      handle.flush
noncomputable def record_230 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_230 label_230 raw_230
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t231\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t231\t{now}"
      handle.flush
def label_231 : Fin 4042 := ⟨231, by decide +kernel⟩
noncomputable def raw_231 : RawOp :=
  RawOp.jump
    ⟨#[
      1799,
      1799,
      1799,
      1799,
      1799
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t231\t{now}"
      handle.flush
noncomputable def record_231 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_231 label_231 raw_231
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t232\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t232\t{now}"
      handle.flush
def label_232 : Fin 4042 := ⟨232, by decide +kernel⟩
noncomputable def raw_232 : RawOp :=
  RawOp.jump
    ⟨#[
      234,
      234,
      234,
      234,
      234
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t232\t{now}"
      handle.flush
noncomputable def record_232 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_232 label_232 raw_232
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t233\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t233\t{now}"
      handle.flush
def label_233 : Fin 4042 := ⟨233, by decide +kernel⟩
noncomputable def raw_233 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    231
    232
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t233\t{now}"
      handle.flush
noncomputable def record_233 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_233 label_233 raw_233
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t234\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t234\t{now}"
      handle.flush
def label_234 : Fin 4042 := ⟨234, by decide +kernel⟩
noncomputable def raw_234 : RawOp :=
  RawOp.jump
    ⟨#[
      235,
      236,
      235,
      235,
      235
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t234\t{now}"
      handle.flush
noncomputable def record_234 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_234 label_234 raw_234
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t235\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t235\t{now}"
      handle.flush
def label_235 : Fin 4042 := ⟨235, by decide +kernel⟩
noncomputable def raw_235 : RawOp :=
  RawOp.jump
    ⟨#[
      1807,
      1807,
      1807,
      1807,
      1807
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t235\t{now}"
      handle.flush
noncomputable def record_235 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_235 label_235 raw_235
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t236\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t236\t{now}"
      handle.flush
def label_236 : Fin 4042 := ⟨236, by decide +kernel⟩
noncomputable def raw_236 : RawOp :=
  RawOp.jump
    ⟨#[
      1821,
      1821,
      1821,
      1821,
      1821
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t236\t{now}"
      handle.flush
noncomputable def record_236 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_236 label_236 raw_236
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t237\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t237\t{now}"
      handle.flush
def label_237 : Fin 4042 := ⟨237, by decide +kernel⟩
noncomputable def raw_237 : RawOp :=
  RawOp.jump
    ⟨#[
      1835,
      1835,
      1835,
      1835,
      1835
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t237\t{now}"
      handle.flush
noncomputable def record_237 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_237 label_237 raw_237
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t238\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t238\t{now}"
      handle.flush
def label_238 : Fin 4042 := ⟨238, by decide +kernel⟩
noncomputable def raw_238 : RawOp :=
  RawOp.jump
    ⟨#[
      1840,
      1840,
      1840,
      1840,
      1840
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t238\t{now}"
      handle.flush
noncomputable def record_238 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_238 label_238 raw_238
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t239\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t239\t{now}"
      handle.flush
def label_239 : Fin 4042 := ⟨239, by decide +kernel⟩
noncomputable def raw_239 : RawOp :=
  RawOp.jump
    ⟨#[
      241,
      241,
      241,
      241,
      241
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t239\t{now}"
      handle.flush
noncomputable def record_239 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_239 label_239 raw_239
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t240\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t240\t{now}"
      handle.flush
def label_240 : Fin 4042 := ⟨240, by decide +kernel⟩
noncomputable def raw_240 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    238
    239
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t240\t{now}"
      handle.flush
noncomputable def record_240 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_240 label_240 raw_240
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t241\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t241\t{now}"
      handle.flush
def label_241 : Fin 4042 := ⟨241, by decide +kernel⟩
noncomputable def raw_241 : RawOp :=
  RawOp.jump
    ⟨#[
      1852,
      1852,
      1852,
      1852,
      1852
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t241\t{now}"
      handle.flush
noncomputable def record_241 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_241 label_241 raw_241
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t242\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t242\t{now}"
      handle.flush
def label_242 : Fin 4042 := ⟨242, by decide +kernel⟩
noncomputable def raw_242 : RawOp :=
  RawOp.jump
    ⟨#[
      1866,
      1866,
      1866,
      1866,
      1866
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t242\t{now}"
      handle.flush
noncomputable def record_242 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_242 label_242 raw_242
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t243\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t243\t{now}"
      handle.flush
def label_243 : Fin 4042 := ⟨243, by decide +kernel⟩
noncomputable def raw_243 : RawOp :=
  RawOp.jump
    ⟨#[
      1871,
      1871,
      1871,
      1871,
      1871
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t243\t{now}"
      handle.flush
noncomputable def record_243 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_243 label_243 raw_243
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t244\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t244\t{now}"
      handle.flush
def label_244 : Fin 4042 := ⟨244, by decide +kernel⟩
noncomputable def raw_244 : RawOp :=
  RawOp.jump
    ⟨#[
      246,
      246,
      246,
      246,
      246
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t244\t{now}"
      handle.flush
noncomputable def record_244 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_244 label_244 raw_244
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t245\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t245\t{now}"
      handle.flush
def label_245 : Fin 4042 := ⟨245, by decide +kernel⟩
noncomputable def raw_245 : RawOp :=
  RawOp.branch
    ⟨#[
      false,
      true,
      true,
      true,
      true
    ], rfl⟩
    243
    244
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t245\t{now}"
      handle.flush
noncomputable def record_245 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_245 label_245 raw_245
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t246\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t246\t{now}"
      handle.flush
def label_246 : Fin 4042 := ⟨246, by decide +kernel⟩
noncomputable def raw_246 : RawOp :=
  RawOp.jump
    ⟨#[
      1883,
      1883,
      1883,
      1883,
      1883
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t246\t{now}"
      handle.flush
noncomputable def record_246 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_246 label_246 raw_246
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t247\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t247\t{now}"
      handle.flush
def label_247 : Fin 4042 := ⟨247, by decide +kernel⟩
noncomputable def raw_247 : RawOp :=
  RawOp.jump
    ⟨#[
      1891,
      1891,
      1891,
      1891,
      1891
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t247\t{now}"
      handle.flush
noncomputable def record_247 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_247 label_247 raw_247
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t248\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t248\t{now}"
      handle.flush
def label_248 : Fin 4042 := ⟨248, by decide +kernel⟩
noncomputable def raw_248 : RawOp :=
  RawOp.jump
    ⟨#[
      1905,
      1905,
      1905,
      1905,
      1905
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t248\t{now}"
      handle.flush
noncomputable def record_248 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_248 label_248 raw_248
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t249\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t249\t{now}"
      handle.flush
def label_249 : Fin 4042 := ⟨249, by decide +kernel⟩
noncomputable def raw_249 : RawOp :=
  RawOp.jump
    ⟨#[
      1910,
      1910,
      1910,
      1910,
      1910
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t249\t{now}"
      handle.flush
noncomputable def record_249 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_249 label_249 raw_249
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t250\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t250\t{now}"
      handle.flush
def label_250 : Fin 4042 := ⟨250, by decide +kernel⟩
noncomputable def raw_250 : RawOp :=
  RawOp.jump
    ⟨#[
      252,
      252,
      252,
      252,
      252
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t250\t{now}"
      handle.flush
noncomputable def record_250 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_250 label_250 raw_250
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t251\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t251\t{now}"
      handle.flush
def label_251 : Fin 4042 := ⟨251, by decide +kernel⟩
noncomputable def raw_251 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    249
    250
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t251\t{now}"
      handle.flush
noncomputable def record_251 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_251 label_251 raw_251
    3 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t252\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t252\t{now}"
      handle.flush
def label_252 : Fin 4042 := ⟨252, by decide +kernel⟩
noncomputable def raw_252 : RawOp :=
  RawOp.jump
    ⟨#[
      1922,
      1922,
      1922,
      1922,
      1922
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t252\t{now}"
      handle.flush
noncomputable def record_252 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_252 label_252 raw_252
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t253\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t253\t{now}"
      handle.flush
def label_253 : Fin 4042 := ⟨253, by decide +kernel⟩
noncomputable def raw_253 : RawOp :=
  RawOp.jump
    ⟨#[
      1936,
      1936,
      1936,
      1936,
      1936
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t253\t{now}"
      handle.flush
noncomputable def record_253 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_253 label_253 raw_253
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t254\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t254\t{now}"
      handle.flush
def label_254 : Fin 4042 := ⟨254, by decide +kernel⟩
noncomputable def raw_254 : RawOp :=
  RawOp.jump
    ⟨#[
      1941,
      1941,
      1941,
      1941,
      1941
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t254\t{now}"
      handle.flush
noncomputable def record_254 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_254 label_254 raw_254
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t255\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t255\t{now}"
      handle.flush
def label_255 : Fin 4042 := ⟨255, by decide +kernel⟩
noncomputable def raw_255 : RawOp :=
  RawOp.jump
    ⟨#[
      257,
      257,
      257,
      257,
      257
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t255\t{now}"
      handle.flush
noncomputable def record_255 : SourceCertificate :=
  ScopeViews001Pilot.fromRaw_255 label_255 raw_255
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t256\t{now}"
      handle.flush
noncomputable def record_256 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_256 LocalChunkPilot.syntax_256
    LocalChunkPilot.source_syntax_256
    3 1
    LocalChunkPilot.nodes_256 LocalChunkPilot.returns_256
    LocalChunkPilot.coherent_256 LocalChunkPilot.returned_256
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t257\t{now}"
      handle.flush
noncomputable def record_257 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_257 LocalChunkPilot.syntax_257
    LocalChunkPilot.source_syntax_257
    1 1
    LocalChunkPilot.nodes_257 LocalChunkPilot.returns_257
    LocalChunkPilot.coherent_257 LocalChunkPilot.returned_257
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t258\t{now}"
      handle.flush
noncomputable def record_258 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_258 LocalChunkPilot.syntax_258
    LocalChunkPilot.source_syntax_258
    1 1
    LocalChunkPilot.nodes_258 LocalChunkPilot.returns_258
    LocalChunkPilot.coherent_258 LocalChunkPilot.returned_258
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t259\t{now}"
      handle.flush
noncomputable def record_259 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_259 LocalChunkPilot.syntax_259
    LocalChunkPilot.source_syntax_259
    1 1
    LocalChunkPilot.nodes_259 LocalChunkPilot.returns_259
    LocalChunkPilot.coherent_259 LocalChunkPilot.returned_259
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t260\t{now}"
      handle.flush
noncomputable def record_260 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_260 LocalChunkPilot.syntax_260
    LocalChunkPilot.source_syntax_260
    3 1
    LocalChunkPilot.nodes_260 LocalChunkPilot.returns_260
    LocalChunkPilot.coherent_260 LocalChunkPilot.returned_260
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t261\t{now}"
      handle.flush
noncomputable def record_261 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_261 LocalChunkPilot.syntax_261
    LocalChunkPilot.source_syntax_261
    1 1
    LocalChunkPilot.nodes_261 LocalChunkPilot.returns_261
    LocalChunkPilot.coherent_261 LocalChunkPilot.returned_261
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t262\t{now}"
      handle.flush
noncomputable def record_262 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_262 LocalChunkPilot.syntax_262
    LocalChunkPilot.source_syntax_262
    3 1
    LocalChunkPilot.nodes_262 LocalChunkPilot.returns_262
    LocalChunkPilot.coherent_262 LocalChunkPilot.returned_262
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t263\t{now}"
      handle.flush
noncomputable def record_263 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_263 LocalChunkPilot.syntax_263
    LocalChunkPilot.source_syntax_263
    1 1
    LocalChunkPilot.nodes_263 LocalChunkPilot.returns_263
    LocalChunkPilot.coherent_263 LocalChunkPilot.returned_263
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t264\t{now}"
      handle.flush
noncomputable def record_264 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_264 LocalChunkPilot.syntax_264
    LocalChunkPilot.source_syntax_264
    1 1
    LocalChunkPilot.nodes_264 LocalChunkPilot.returns_264
    LocalChunkPilot.coherent_264 LocalChunkPilot.returned_264
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t265\t{now}"
      handle.flush
noncomputable def record_265 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_265 LocalChunkPilot.syntax_265
    LocalChunkPilot.source_syntax_265
    1 1
    LocalChunkPilot.nodes_265 LocalChunkPilot.returns_265
    LocalChunkPilot.coherent_265 LocalChunkPilot.returned_265
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t266\t{now}"
      handle.flush
noncomputable def record_266 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_266 LocalChunkPilot.syntax_266
    LocalChunkPilot.source_syntax_266
    3 1
    LocalChunkPilot.nodes_266 LocalChunkPilot.returns_266
    LocalChunkPilot.coherent_266 LocalChunkPilot.returned_266
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t267\t{now}"
      handle.flush
noncomputable def record_267 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_267 LocalChunkPilot.syntax_267
    LocalChunkPilot.source_syntax_267
    1 1
    LocalChunkPilot.nodes_267 LocalChunkPilot.returns_267
    LocalChunkPilot.coherent_267 LocalChunkPilot.returned_267
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t268\t{now}"
      handle.flush
noncomputable def record_268 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_268 LocalChunkPilot.syntax_268
    LocalChunkPilot.source_syntax_268
    1 1
    LocalChunkPilot.nodes_268 LocalChunkPilot.returns_268
    LocalChunkPilot.coherent_268 LocalChunkPilot.returned_268
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t269\t{now}"
      handle.flush
noncomputable def record_269 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_269 LocalChunkPilot.syntax_269
    LocalChunkPilot.source_syntax_269
    1 1
    LocalChunkPilot.nodes_269 LocalChunkPilot.returns_269
    LocalChunkPilot.coherent_269 LocalChunkPilot.returned_269
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t270\t{now}"
      handle.flush
noncomputable def record_270 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_270 LocalChunkPilot.syntax_270
    LocalChunkPilot.source_syntax_270
    1 1
    LocalChunkPilot.nodes_270 LocalChunkPilot.returns_270
    LocalChunkPilot.coherent_270 LocalChunkPilot.returned_270
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t271\t{now}"
      handle.flush
noncomputable def record_271 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_271 LocalChunkPilot.syntax_271
    LocalChunkPilot.source_syntax_271
    1 1
    LocalChunkPilot.nodes_271 LocalChunkPilot.returns_271
    LocalChunkPilot.coherent_271 LocalChunkPilot.returned_271
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t272\t{now}"
      handle.flush
noncomputable def record_272 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_272 LocalChunkPilot.syntax_272
    LocalChunkPilot.source_syntax_272
    1 1
    LocalChunkPilot.nodes_272 LocalChunkPilot.returns_272
    LocalChunkPilot.coherent_272 LocalChunkPilot.returned_272
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t273\t{now}"
      handle.flush
noncomputable def record_273 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_273 LocalChunkPilot.syntax_273
    LocalChunkPilot.source_syntax_273
    1 1
    LocalChunkPilot.nodes_273 LocalChunkPilot.returns_273
    LocalChunkPilot.coherent_273 LocalChunkPilot.returned_273
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t274\t{now}"
      handle.flush
noncomputable def record_274 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_274 LocalChunkPilot.syntax_274
    LocalChunkPilot.source_syntax_274
    3 1
    LocalChunkPilot.nodes_274 LocalChunkPilot.returns_274
    LocalChunkPilot.coherent_274 LocalChunkPilot.returned_274
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t275\t{now}"
      handle.flush
noncomputable def record_275 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_275 LocalChunkPilot.syntax_275
    LocalChunkPilot.source_syntax_275
    1 1
    LocalChunkPilot.nodes_275 LocalChunkPilot.returns_275
    LocalChunkPilot.coherent_275 LocalChunkPilot.returned_275
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t276\t{now}"
      handle.flush
noncomputable def record_276 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_276 LocalChunkPilot.syntax_276
    LocalChunkPilot.source_syntax_276
    1 1
    LocalChunkPilot.nodes_276 LocalChunkPilot.returns_276
    LocalChunkPilot.coherent_276 LocalChunkPilot.returned_276
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t277\t{now}"
      handle.flush
noncomputable def record_277 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_277 LocalChunkPilot.syntax_277
    LocalChunkPilot.source_syntax_277
    14 1
    LocalChunkPilot.nodes_277 LocalChunkPilot.returns_277
    LocalChunkPilot.coherent_277 LocalChunkPilot.returned_277
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t278\t{now}"
      handle.flush
noncomputable def record_278 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_278 LocalChunkPilot.syntax_278
    LocalChunkPilot.source_syntax_278
    74 16
    LocalChunkPilot.nodes_278 LocalChunkPilot.returns_278
    LocalChunkPilot.coherent_278 LocalChunkPilot.returned_278
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t279\t{now}"
      handle.flush
noncomputable def record_279 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_279 LocalChunkPilot.syntax_279
    LocalChunkPilot.source_syntax_279
    1 1
    LocalChunkPilot.nodes_279 LocalChunkPilot.returns_279
    LocalChunkPilot.coherent_279 LocalChunkPilot.returned_279
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t280\t{now}"
      handle.flush
noncomputable def record_280 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_280 LocalChunkPilot.syntax_280
    LocalChunkPilot.source_syntax_280
    14 1
    LocalChunkPilot.nodes_280 LocalChunkPilot.returns_280
    LocalChunkPilot.coherent_280 LocalChunkPilot.returned_280
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t281\t{now}"
      handle.flush
noncomputable def record_281 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_281 LocalChunkPilot.syntax_281
    LocalChunkPilot.source_syntax_281
    80 1
    LocalChunkPilot.nodes_281 LocalChunkPilot.returns_281
    LocalChunkPilot.coherent_281 LocalChunkPilot.returned_281
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t282\t{now}"
      handle.flush
noncomputable def record_282 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_282 LocalChunkPilot.syntax_282
    LocalChunkPilot.source_syntax_282
    1 1
    LocalChunkPilot.nodes_282 LocalChunkPilot.returns_282
    LocalChunkPilot.coherent_282 LocalChunkPilot.returned_282
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t283\t{now}"
      handle.flush
noncomputable def record_283 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_283 LocalChunkPilot.syntax_283
    LocalChunkPilot.source_syntax_283
    2 1
    LocalChunkPilot.nodes_283 LocalChunkPilot.returns_283
    LocalChunkPilot.coherent_283 LocalChunkPilot.returned_283
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t284\t{now}"
      handle.flush
noncomputable def record_284 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_284 LocalChunkPilot.syntax_284
    LocalChunkPilot.source_syntax_284
    44 16
    LocalChunkPilot.nodes_284 LocalChunkPilot.returns_284
    LocalChunkPilot.coherent_284 LocalChunkPilot.returned_284
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t285\t{now}"
      handle.flush
noncomputable def record_285 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_285 LocalChunkPilot.syntax_285
    LocalChunkPilot.source_syntax_285
    61 1
    LocalChunkPilot.nodes_285 LocalChunkPilot.returns_285
    LocalChunkPilot.coherent_285 LocalChunkPilot.returned_285
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t286\t{now}"
      handle.flush
noncomputable def record_286 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_286 LocalChunkPilot.syntax_286
    LocalChunkPilot.source_syntax_286
    14 1
    LocalChunkPilot.nodes_286 LocalChunkPilot.returns_286
    LocalChunkPilot.coherent_286 LocalChunkPilot.returned_286
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t287\t{now}"
      handle.flush
noncomputable def record_287 : SourceCertificate :=
  makeCertificate LocalChunkPilot.label_287 LocalChunkPilot.syntax_287
    LocalChunkPilot.source_syntax_287
    39 1
    LocalChunkPilot.nodes_287 LocalChunkPilot.returns_287
    LocalChunkPilot.coherent_287 LocalChunkPilot.returned_287
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t288\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t288\t{now}"
      handle.flush
def label_288 : Fin 4042 := ⟨288, by decide +kernel⟩
noncomputable def raw_288 : RawOp :=
  RawOp.move
    Dir.right
    1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t288\t{now}"
      handle.flush
noncomputable def record_288 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_288 label_288 raw_288
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t289\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t289\t{now}"
      handle.flush
def label_289 : Fin 4042 := ⟨289, by decide +kernel⟩
noncomputable def raw_289 : RawOp :=
  RawOp.absent
    bounded_4_0
    287
    288
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t289\t{now}"
      handle.flush
noncomputable def record_289 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_289 label_289 raw_289
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t290\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t290\t{now}"
      handle.flush
def label_290 : Fin 4042 := ⟨290, by decide +kernel⟩
noncomputable def raw_290 : RawOp :=
  RawOp.jump
    ⟨#[
      2081,
      2081,
      2081,
      2081,
      2081
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t290\t{now}"
      handle.flush
noncomputable def record_290 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_290 label_290 raw_290
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t291\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t291\t{now}"
      handle.flush
def label_291 : Fin 4042 := ⟨291, by decide +kernel⟩
noncomputable def raw_291 : RawOp :=
  RawOp.move
    Dir.right
    290
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t291\t{now}"
      handle.flush
noncomputable def record_291 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_291 label_291 raw_291
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t292\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t292\t{now}"
      handle.flush
def label_292 : Fin 4042 := ⟨292, by decide +kernel⟩
noncomputable def raw_292 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    291
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t292\t{now}"
      handle.flush
noncomputable def record_292 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_292 label_292 raw_292
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t293\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t293\t{now}"
      handle.flush
def label_293 : Fin 4042 := ⟨293, by decide +kernel⟩
noncomputable def raw_293 : RawOp :=
  RawOp.move
    Dir.right
    2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t293\t{now}"
      handle.flush
noncomputable def record_293 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_293 label_293 raw_293
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t294\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t294\t{now}"
      handle.flush
def label_294 : Fin 4042 := ⟨294, by decide +kernel⟩
noncomputable def raw_294 : RawOp :=
  RawOp.absent
    bounded_4_3
    292
    293
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t294\t{now}"
      handle.flush
noncomputable def record_294 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_294 label_294 raw_294
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t295\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t295\t{now}"
      handle.flush
def label_295 : Fin 4042 := ⟨295, by decide +kernel⟩
noncomputable def raw_295 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    291
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t295\t{now}"
      handle.flush
noncomputable def record_295 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_295 label_295 raw_295
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t296\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t296\t{now}"
      handle.flush
def label_296 : Fin 4042 := ⟨296, by decide +kernel⟩
noncomputable def raw_296 : RawOp :=
  RawOp.jump
    ⟨#[
      298,
      298,
      298,
      298,
      298
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t296\t{now}"
      handle.flush
noncomputable def record_296 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_296 label_296 raw_296
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t297\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t297\t{now}"
      handle.flush
def label_297 : Fin 4042 := ⟨297, by decide +kernel⟩
noncomputable def raw_297 : RawOp :=
  RawOp.move
    Dir.right
    296
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t297\t{now}"
      handle.flush
noncomputable def record_297 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_297 label_297 raw_297
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t298\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t298\t{now}"
      handle.flush
def label_298 : Fin 4042 := ⟨298, by decide +kernel⟩
noncomputable def raw_298 : RawOp :=
  RawOp.absent
    bounded_4_3
    295
    297
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t298\t{now}"
      handle.flush
noncomputable def record_298 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_298 label_298 raw_298
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t299\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t299\t{now}"
      handle.flush
def label_299 : Fin 4042 := ⟨299, by decide +kernel⟩
noncomputable def raw_299 : RawOp :=
  RawOp.jump
    ⟨#[
      2096,
      2096,
      2096,
      2096,
      2096
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t299\t{now}"
      handle.flush
noncomputable def record_299 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_299 label_299 raw_299
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t300\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t300\t{now}"
      handle.flush
def label_300 : Fin 4042 := ⟨300, by decide +kernel⟩
noncomputable def raw_300 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    299
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t300\t{now}"
      handle.flush
noncomputable def record_300 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_300 label_300 raw_300
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t301\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t301\t{now}"
      handle.flush
def label_301 : Fin 4042 := ⟨301, by decide +kernel⟩
noncomputable def raw_301 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    299
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t301\t{now}"
      handle.flush
noncomputable def record_301 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_301 label_301 raw_301
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t302\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t302\t{now}"
      handle.flush
def label_302 : Fin 4042 := ⟨302, by decide +kernel⟩
noncomputable def raw_302 : RawOp :=
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
    301
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t302\t{now}"
      handle.flush
noncomputable def record_302 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_302 label_302 raw_302
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t303\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t303\t{now}"
      handle.flush
def label_303 : Fin 4042 := ⟨303, by decide +kernel⟩
noncomputable def raw_303 : RawOp :=
  RawOp.move
    Dir.left
    302
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t303\t{now}"
      handle.flush
noncomputable def record_303 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_303 label_303 raw_303
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t304\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t304\t{now}"
      handle.flush
def label_304 : Fin 4042 := ⟨304, by decide +kernel⟩
noncomputable def raw_304 : RawOp :=
  RawOp.marker
    300
    303
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t304\t{now}"
      handle.flush
noncomputable def record_304 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_304 label_304 raw_304
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t305\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t305\t{now}"
      handle.flush
def label_305 : Fin 4042 := ⟨305, by decide +kernel⟩
noncomputable def raw_305 : RawOp :=
  RawOp.move
    Dir.right
    5
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t305\t{now}"
      handle.flush
noncomputable def record_305 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_305 label_305 raw_305
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t306\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t306\t{now}"
      handle.flush
def label_306 : Fin 4042 := ⟨306, by decide +kernel⟩
noncomputable def raw_306 : RawOp :=
  RawOp.absent
    bounded_4_1
    304
    305
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t306\t{now}"
      handle.flush
noncomputable def record_306 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_306 label_306 raw_306
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t307\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t307\t{now}"
      handle.flush
def label_307 : Fin 4042 := ⟨307, by decide +kernel⟩
noncomputable def raw_307 : RawOp :=
  RawOp.jump
    ⟨#[
      2090,
      2090,
      2090,
      2090,
      2090
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t307\t{now}"
      handle.flush
noncomputable def record_307 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_307 label_307 raw_307
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t308\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t308\t{now}"
      handle.flush
def label_308 : Fin 4042 := ⟨308, by decide +kernel⟩
noncomputable def raw_308 : RawOp :=
  RawOp.move
    Dir.right
    307
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t308\t{now}"
      handle.flush
noncomputable def record_308 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_308 label_308 raw_308
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t309\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t309\t{now}"
      handle.flush
def label_309 : Fin 4042 := ⟨309, by decide +kernel⟩
noncomputable def raw_309 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    308
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t309\t{now}"
      handle.flush
noncomputable def record_309 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_309 label_309 raw_309
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t310\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t310\t{now}"
      handle.flush
def label_310 : Fin 4042 := ⟨310, by decide +kernel⟩
noncomputable def raw_310 : RawOp :=
  RawOp.jump
    ⟨#[
      312,
      312,
      312,
      312,
      312
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t310\t{now}"
      handle.flush
noncomputable def record_310 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_310 label_310 raw_310
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t311\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t311\t{now}"
      handle.flush
def label_311 : Fin 4042 := ⟨311, by decide +kernel⟩
noncomputable def raw_311 : RawOp :=
  RawOp.move
    Dir.right
    310
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t311\t{now}"
      handle.flush
noncomputable def record_311 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_311 label_311 raw_311
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t312\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t312\t{now}"
      handle.flush
def label_312 : Fin 4042 := ⟨312, by decide +kernel⟩
noncomputable def raw_312 : RawOp :=
  RawOp.absent
    bounded_4_1
    309
    311
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t312\t{now}"
      handle.flush
noncomputable def record_312 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_312 label_312 raw_312
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t313\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t313\t{now}"
      handle.flush
def label_313 : Fin 4042 := ⟨313, by decide +kernel⟩
noncomputable def raw_313 : RawOp :=
  RawOp.jump
    ⟨#[
      2109,
      2109,
      2109,
      2109,
      2109
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t313\t{now}"
      handle.flush
noncomputable def record_313 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_313 label_313 raw_313
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t314\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t314\t{now}"
      handle.flush
def label_314 : Fin 4042 := ⟨314, by decide +kernel⟩
noncomputable def raw_314 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    313
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t314\t{now}"
      handle.flush
noncomputable def record_314 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_314 label_314 raw_314
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t315\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t315\t{now}"
      handle.flush
def label_315 : Fin 4042 := ⟨315, by decide +kernel⟩
noncomputable def raw_315 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    313
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t315\t{now}"
      handle.flush
noncomputable def record_315 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_315 label_315 raw_315
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t316\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t316\t{now}"
      handle.flush
def label_316 : Fin 4042 := ⟨316, by decide +kernel⟩
noncomputable def raw_316 : RawOp :=
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
    315
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t316\t{now}"
      handle.flush
noncomputable def record_316 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_316 label_316 raw_316
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t317\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t317\t{now}"
      handle.flush
def label_317 : Fin 4042 := ⟨317, by decide +kernel⟩
noncomputable def raw_317 : RawOp :=
  RawOp.move
    Dir.left
    316
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t317\t{now}"
      handle.flush
noncomputable def record_317 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_317 label_317 raw_317
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t318\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t318\t{now}"
      handle.flush
def label_318 : Fin 4042 := ⟨318, by decide +kernel⟩
noncomputable def raw_318 : RawOp :=
  RawOp.marker
    314
    317
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t318\t{now}"
      handle.flush
noncomputable def record_318 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_318 label_318 raw_318
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t319\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t319\t{now}"
      handle.flush
def label_319 : Fin 4042 := ⟨319, by decide +kernel⟩
noncomputable def raw_319 : RawOp :=
  RawOp.move
    Dir.right
    6
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t319\t{now}"
      handle.flush
noncomputable def record_319 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_319 label_319 raw_319
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t320\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t320\t{now}"
      handle.flush
def label_320 : Fin 4042 := ⟨320, by decide +kernel⟩
noncomputable def raw_320 : RawOp :=
  RawOp.absent
    bounded_4_0
    318
    319
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t320\t{now}"
      handle.flush
noncomputable def record_320 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_320 label_320 raw_320
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t321\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t321\t{now}"
      handle.flush
def label_321 : Fin 4042 := ⟨321, by decide +kernel⟩
noncomputable def raw_321 : RawOp :=
  RawOp.jump
    ⟨#[
      2114,
      2114,
      2114,
      2114,
      2114
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t321\t{now}"
      handle.flush
noncomputable def record_321 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_321 label_321 raw_321
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t322\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t322\t{now}"
      handle.flush
def label_322 : Fin 4042 := ⟨322, by decide +kernel⟩
noncomputable def raw_322 : RawOp :=
  RawOp.move
    Dir.right
    321
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t322\t{now}"
      handle.flush
noncomputable def record_322 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_322 label_322 raw_322
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t323\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t323\t{now}"
      handle.flush
def label_323 : Fin 4042 := ⟨323, by decide +kernel⟩
noncomputable def raw_323 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    322
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t323\t{now}"
      handle.flush
noncomputable def record_323 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_323 label_323 raw_323
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t324\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t324\t{now}"
      handle.flush
def label_324 : Fin 4042 := ⟨324, by decide +kernel⟩
noncomputable def raw_324 : RawOp :=
  RawOp.move
    Dir.right
    7
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t324\t{now}"
      handle.flush
noncomputable def record_324 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_324 label_324 raw_324
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t325\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t325\t{now}"
      handle.flush
def label_325 : Fin 4042 := ⟨325, by decide +kernel⟩
noncomputable def raw_325 : RawOp :=
  RawOp.absent
    bounded_4_0
    323
    324
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t325\t{now}"
      handle.flush
noncomputable def record_325 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_325 label_325 raw_325
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t326\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t326\t{now}"
      handle.flush
def label_326 : Fin 4042 := ⟨326, by decide +kernel⟩
noncomputable def raw_326 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    322
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t326\t{now}"
      handle.flush
noncomputable def record_326 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_326 label_326 raw_326
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t327\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t327\t{now}"
      handle.flush
def label_327 : Fin 4042 := ⟨327, by decide +kernel⟩
noncomputable def raw_327 : RawOp :=
  RawOp.jump
    ⟨#[
      329,
      329,
      329,
      329,
      329
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t327\t{now}"
      handle.flush
noncomputable def record_327 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_327 label_327 raw_327
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t328\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t328\t{now}"
      handle.flush
def label_328 : Fin 4042 := ⟨328, by decide +kernel⟩
noncomputable def raw_328 : RawOp :=
  RawOp.move
    Dir.right
    327
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t328\t{now}"
      handle.flush
noncomputable def record_328 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_328 label_328 raw_328
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t329\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t329\t{now}"
      handle.flush
def label_329 : Fin 4042 := ⟨329, by decide +kernel⟩
noncomputable def raw_329 : RawOp :=
  RawOp.absent
    bounded_4_2
    326
    328
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t329\t{now}"
      handle.flush
noncomputable def record_329 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_329 label_329 raw_329
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t330\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t330\t{now}"
      handle.flush
def label_330 : Fin 4042 := ⟨330, by decide +kernel⟩
noncomputable def raw_330 : RawOp :=
  RawOp.jump
    ⟨#[
      2130,
      2130,
      2130,
      2130,
      2130
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t330\t{now}"
      handle.flush
noncomputable def record_330 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_330 label_330 raw_330
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t331\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t331\t{now}"
      handle.flush
def label_331 : Fin 4042 := ⟨331, by decide +kernel⟩
noncomputable def raw_331 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    330
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t331\t{now}"
      handle.flush
noncomputable def record_331 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_331 label_331 raw_331
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t332\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t332\t{now}"
      handle.flush
def label_332 : Fin 4042 := ⟨332, by decide +kernel⟩
noncomputable def raw_332 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    330
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t332\t{now}"
      handle.flush
noncomputable def record_332 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_332 label_332 raw_332
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t333\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t333\t{now}"
      handle.flush
def label_333 : Fin 4042 := ⟨333, by decide +kernel⟩
noncomputable def raw_333 : RawOp :=
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
    332
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t333\t{now}"
      handle.flush
noncomputable def record_333 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_333 label_333 raw_333
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t334\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t334\t{now}"
      handle.flush
def label_334 : Fin 4042 := ⟨334, by decide +kernel⟩
noncomputable def raw_334 : RawOp :=
  RawOp.move
    Dir.left
    333
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t334\t{now}"
      handle.flush
noncomputable def record_334 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_334 label_334 raw_334
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t335\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t335\t{now}"
      handle.flush
def label_335 : Fin 4042 := ⟨335, by decide +kernel⟩
noncomputable def raw_335 : RawOp :=
  RawOp.marker
    331
    334
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t335\t{now}"
      handle.flush
noncomputable def record_335 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_335 label_335 raw_335
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t336\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t336\t{now}"
      handle.flush
def label_336 : Fin 4042 := ⟨336, by decide +kernel⟩
noncomputable def raw_336 : RawOp :=
  RawOp.move
    Dir.right
    10
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t336\t{now}"
      handle.flush
noncomputable def record_336 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_336 label_336 raw_336
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t337\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t337\t{now}"
      handle.flush
def label_337 : Fin 4042 := ⟨337, by decide +kernel⟩
noncomputable def raw_337 : RawOp :=
  RawOp.absent
    bounded_4_1
    335
    336
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t337\t{now}"
      handle.flush
noncomputable def record_337 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_337 label_337 raw_337
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t338\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t338\t{now}"
      handle.flush
def label_338 : Fin 4042 := ⟨338, by decide +kernel⟩
noncomputable def raw_338 : RawOp :=
  RawOp.jump
    ⟨#[
      2139,
      2139,
      2139,
      2139,
      2139
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t338\t{now}"
      handle.flush
noncomputable def record_338 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_338 label_338 raw_338
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t339\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t339\t{now}"
      handle.flush
def label_339 : Fin 4042 := ⟨339, by decide +kernel⟩
noncomputable def raw_339 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    338
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t339\t{now}"
      handle.flush
noncomputable def record_339 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_339 label_339 raw_339
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t340\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t340\t{now}"
      handle.flush
def label_340 : Fin 4042 := ⟨340, by decide +kernel⟩
noncomputable def raw_340 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    338
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t340\t{now}"
      handle.flush
noncomputable def record_340 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_340 label_340 raw_340
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t341\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t341\t{now}"
      handle.flush
def label_341 : Fin 4042 := ⟨341, by decide +kernel⟩
noncomputable def raw_341 : RawOp :=
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
    340
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t341\t{now}"
      handle.flush
noncomputable def record_341 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_341 label_341 raw_341
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t342\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t342\t{now}"
      handle.flush
def label_342 : Fin 4042 := ⟨342, by decide +kernel⟩
noncomputable def raw_342 : RawOp :=
  RawOp.move
    Dir.left
    341
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t342\t{now}"
      handle.flush
noncomputable def record_342 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_342 label_342 raw_342
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t343\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t343\t{now}"
      handle.flush
def label_343 : Fin 4042 := ⟨343, by decide +kernel⟩
noncomputable def raw_343 : RawOp :=
  RawOp.marker
    339
    342
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t343\t{now}"
      handle.flush
noncomputable def record_343 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_343 label_343 raw_343
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t344\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t344\t{now}"
      handle.flush
def label_344 : Fin 4042 := ⟨344, by decide +kernel⟩
noncomputable def raw_344 : RawOp :=
  RawOp.move
    Dir.right
    11
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t344\t{now}"
      handle.flush
noncomputable def record_344 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_344 label_344 raw_344
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t345\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t345\t{now}"
      handle.flush
def label_345 : Fin 4042 := ⟨345, by decide +kernel⟩
noncomputable def raw_345 : RawOp :=
  RawOp.absent
    bounded_4_0
    343
    344
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t345\t{now}"
      handle.flush
noncomputable def record_345 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_345 label_345 raw_345
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t346\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t346\t{now}"
      handle.flush
def label_346 : Fin 4042 := ⟨346, by decide +kernel⟩
noncomputable def raw_346 : RawOp :=
  RawOp.jump
    ⟨#[
      2136,
      2136,
      2136,
      2136,
      2136
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t346\t{now}"
      handle.flush
noncomputable def record_346 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_346 label_346 raw_346
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t347\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t347\t{now}"
      handle.flush
def label_347 : Fin 4042 := ⟨347, by decide +kernel⟩
noncomputable def raw_347 : RawOp :=
  RawOp.move
    Dir.right
    346
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t347\t{now}"
      handle.flush
noncomputable def record_347 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_347 label_347 raw_347
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t348\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t348\t{now}"
      handle.flush
def label_348 : Fin 4042 := ⟨348, by decide +kernel⟩
noncomputable def raw_348 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    347
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t348\t{now}"
      handle.flush
noncomputable def record_348 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_348 label_348 raw_348
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t349\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t349\t{now}"
      handle.flush
def label_349 : Fin 4042 := ⟨349, by decide +kernel⟩
noncomputable def raw_349 : RawOp :=
  RawOp.jump
    ⟨#[
      351,
      351,
      351,
      351,
      351
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t349\t{now}"
      handle.flush
noncomputable def record_349 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_349 label_349 raw_349
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t350\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t350\t{now}"
      handle.flush
def label_350 : Fin 4042 := ⟨350, by decide +kernel⟩
noncomputable def raw_350 : RawOp :=
  RawOp.move
    Dir.right
    349
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t350\t{now}"
      handle.flush
noncomputable def record_350 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_350 label_350 raw_350
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t351\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t351\t{now}"
      handle.flush
def label_351 : Fin 4042 := ⟨351, by decide +kernel⟩
noncomputable def raw_351 : RawOp :=
  RawOp.absent
    bounded_4_1
    348
    350
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t351\t{now}"
      handle.flush
noncomputable def record_351 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_351 label_351 raw_351
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t352\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t352\t{now}"
      handle.flush
def label_352 : Fin 4042 := ⟨352, by decide +kernel⟩
noncomputable def raw_352 : RawOp :=
  RawOp.jump
    ⟨#[
      2152,
      2152,
      2152,
      2152,
      2152
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t352\t{now}"
      handle.flush
noncomputable def record_352 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_352 label_352 raw_352
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t353\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t353\t{now}"
      handle.flush
def label_353 : Fin 4042 := ⟨353, by decide +kernel⟩
noncomputable def raw_353 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    352
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t353\t{now}"
      handle.flush
noncomputable def record_353 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_353 label_353 raw_353
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t354\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t354\t{now}"
      handle.flush
def label_354 : Fin 4042 := ⟨354, by decide +kernel⟩
noncomputable def raw_354 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    352
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t354\t{now}"
      handle.flush
noncomputable def record_354 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_354 label_354 raw_354
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t355\t{now}"
      handle.flush
def label_355 : Fin 4042 := ⟨355, by decide +kernel⟩
noncomputable def raw_355 : RawOp :=
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
    354
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t355\t{now}"
      handle.flush
noncomputable def record_355 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_355 label_355 raw_355
    142 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t356\t{now}"
      handle.flush
def label_356 : Fin 4042 := ⟨356, by decide +kernel⟩
noncomputable def raw_356 : RawOp :=
  RawOp.move
    Dir.left
    355
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t356\t{now}"
      handle.flush
noncomputable def record_356 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_356 label_356 raw_356
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t357\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t357\t{now}"
      handle.flush
def label_357 : Fin 4042 := ⟨357, by decide +kernel⟩
noncomputable def raw_357 : RawOp :=
  RawOp.marker
    353
    356
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t357\t{now}"
      handle.flush
noncomputable def record_357 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_357 label_357 raw_357
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t358\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t358\t{now}"
      handle.flush
def label_358 : Fin 4042 := ⟨358, by decide +kernel⟩
noncomputable def raw_358 : RawOp :=
  RawOp.move
    Dir.right
    12
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t358\t{now}"
      handle.flush
noncomputable def record_358 : SourceCertificate :=
  ScopeViews002Pilot.fromRaw_358 label_358 raw_358
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t359\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t359\t{now}"
      handle.flush
def label_359 : Fin 4042 := ⟨359, by decide +kernel⟩
noncomputable def raw_359 : RawOp :=
  RawOp.absent
    bounded_4_3
    357
    358
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t359\t{now}"
      handle.flush
noncomputable def record_359 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_359 label_359 raw_359
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t360\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t360\t{now}"
      handle.flush
def label_360 : Fin 4042 := ⟨360, by decide +kernel⟩
noncomputable def raw_360 : RawOp :=
  RawOp.jump
    ⟨#[
      2157,
      2157,
      2157,
      2157,
      2157
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t360\t{now}"
      handle.flush
noncomputable def record_360 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_360 label_360 raw_360
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t361\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t361\t{now}"
      handle.flush
def label_361 : Fin 4042 := ⟨361, by decide +kernel⟩
noncomputable def raw_361 : RawOp :=
  RawOp.move
    Dir.right
    360
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t361\t{now}"
      handle.flush
noncomputable def record_361 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_361 label_361 raw_361
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t362\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t362\t{now}"
      handle.flush
def label_362 : Fin 4042 := ⟨362, by decide +kernel⟩
noncomputable def raw_362 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    361
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t362\t{now}"
      handle.flush
noncomputable def record_362 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_362 label_362 raw_362
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t363\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t363\t{now}"
      handle.flush
def label_363 : Fin 4042 := ⟨363, by decide +kernel⟩
noncomputable def raw_363 : RawOp :=
  RawOp.move
    Dir.right
    13
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t363\t{now}"
      handle.flush
noncomputable def record_363 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_363 label_363 raw_363
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t364\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t364\t{now}"
      handle.flush
def label_364 : Fin 4042 := ⟨364, by decide +kernel⟩
noncomputable def raw_364 : RawOp :=
  RawOp.absent
    bounded_4_0
    362
    363
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t364\t{now}"
      handle.flush
noncomputable def record_364 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_364 label_364 raw_364
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t365\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t365\t{now}"
      handle.flush
def label_365 : Fin 4042 := ⟨365, by decide +kernel⟩
noncomputable def raw_365 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    361
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t365\t{now}"
      handle.flush
noncomputable def record_365 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_365 label_365 raw_365
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t366\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t366\t{now}"
      handle.flush
def label_366 : Fin 4042 := ⟨366, by decide +kernel⟩
noncomputable def raw_366 : RawOp :=
  RawOp.jump
    ⟨#[
      368,
      368,
      368,
      368,
      368
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t366\t{now}"
      handle.flush
noncomputable def record_366 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_366 label_366 raw_366
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t367\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t367\t{now}"
      handle.flush
def label_367 : Fin 4042 := ⟨367, by decide +kernel⟩
noncomputable def raw_367 : RawOp :=
  RawOp.move
    Dir.right
    366
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t367\t{now}"
      handle.flush
noncomputable def record_367 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_367 label_367 raw_367
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t368\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t368\t{now}"
      handle.flush
def label_368 : Fin 4042 := ⟨368, by decide +kernel⟩
noncomputable def raw_368 : RawOp :=
  RawOp.absent
    bounded_4_0
    365
    367
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t368\t{now}"
      handle.flush
noncomputable def record_368 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_368 label_368 raw_368
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t369\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t369\t{now}"
      handle.flush
def label_369 : Fin 4042 := ⟨369, by decide +kernel⟩
noncomputable def raw_369 : RawOp :=
  RawOp.jump
    ⟨#[
      2173,
      2173,
      2173,
      2173,
      2173
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t369\t{now}"
      handle.flush
noncomputable def record_369 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_369 label_369 raw_369
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t370\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t370\t{now}"
      handle.flush
def label_370 : Fin 4042 := ⟨370, by decide +kernel⟩
noncomputable def raw_370 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    369
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t370\t{now}"
      handle.flush
noncomputable def record_370 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_370 label_370 raw_370
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t371\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t371\t{now}"
      handle.flush
def label_371 : Fin 4042 := ⟨371, by decide +kernel⟩
noncomputable def raw_371 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    369
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t371\t{now}"
      handle.flush
noncomputable def record_371 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_371 label_371 raw_371
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t372\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t372\t{now}"
      handle.flush
def label_372 : Fin 4042 := ⟨372, by decide +kernel⟩
noncomputable def raw_372 : RawOp :=
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
    371
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t372\t{now}"
      handle.flush
noncomputable def record_372 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_372 label_372 raw_372
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t373\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t373\t{now}"
      handle.flush
def label_373 : Fin 4042 := ⟨373, by decide +kernel⟩
noncomputable def raw_373 : RawOp :=
  RawOp.move
    Dir.left
    372
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t373\t{now}"
      handle.flush
noncomputable def record_373 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_373 label_373 raw_373
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t374\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t374\t{now}"
      handle.flush
def label_374 : Fin 4042 := ⟨374, by decide +kernel⟩
noncomputable def raw_374 : RawOp :=
  RawOp.marker
    370
    373
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t374\t{now}"
      handle.flush
noncomputable def record_374 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_374 label_374 raw_374
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t375\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t375\t{now}"
      handle.flush
def label_375 : Fin 4042 := ⟨375, by decide +kernel⟩
noncomputable def raw_375 : RawOp :=
  RawOp.move
    Dir.right
    16
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t375\t{now}"
      handle.flush
noncomputable def record_375 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_375 label_375 raw_375
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t376\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t376\t{now}"
      handle.flush
def label_376 : Fin 4042 := ⟨376, by decide +kernel⟩
noncomputable def raw_376 : RawOp :=
  RawOp.absent
    bounded_4_1
    374
    375
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t376\t{now}"
      handle.flush
noncomputable def record_376 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_376 label_376 raw_376
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t377\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t377\t{now}"
      handle.flush
def label_377 : Fin 4042 := ⟨377, by decide +kernel⟩
noncomputable def raw_377 : RawOp :=
  RawOp.jump
    ⟨#[
      2178,
      2178,
      2178,
      2178,
      2178
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t377\t{now}"
      handle.flush
noncomputable def record_377 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_377 label_377 raw_377
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t378\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t378\t{now}"
      handle.flush
def label_378 : Fin 4042 := ⟨378, by decide +kernel⟩
noncomputable def raw_378 : RawOp :=
  RawOp.move
    Dir.right
    377
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t378\t{now}"
      handle.flush
noncomputable def record_378 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_378 label_378 raw_378
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t379\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t379\t{now}"
      handle.flush
def label_379 : Fin 4042 := ⟨379, by decide +kernel⟩
noncomputable def raw_379 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    378
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t379\t{now}"
      handle.flush
noncomputable def record_379 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_379 label_379 raw_379
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t380\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t380\t{now}"
      handle.flush
def label_380 : Fin 4042 := ⟨380, by decide +kernel⟩
noncomputable def raw_380 : RawOp :=
  RawOp.move
    Dir.right
    17
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t380\t{now}"
      handle.flush
noncomputable def record_380 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_380 label_380 raw_380
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t381\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t381\t{now}"
      handle.flush
def label_381 : Fin 4042 := ⟨381, by decide +kernel⟩
noncomputable def raw_381 : RawOp :=
  RawOp.absent
    bounded_4_3
    379
    380
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t381\t{now}"
      handle.flush
noncomputable def record_381 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_381 label_381 raw_381
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t382\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t382\t{now}"
      handle.flush
def label_382 : Fin 4042 := ⟨382, by decide +kernel⟩
noncomputable def raw_382 : RawOp :=
  RawOp.jump
    ⟨#[
      2189,
      2189,
      2189,
      2189,
      2189
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t382\t{now}"
      handle.flush
noncomputable def record_382 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_382 label_382 raw_382
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t383\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t383\t{now}"
      handle.flush
def label_383 : Fin 4042 := ⟨383, by decide +kernel⟩
noncomputable def raw_383 : RawOp :=
  RawOp.move
    Dir.right
    382
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t383\t{now}"
      handle.flush
noncomputable def record_383 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_383 label_383 raw_383
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t384\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t384\t{now}"
      handle.flush
def label_384 : Fin 4042 := ⟨384, by decide +kernel⟩
noncomputable def raw_384 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1,
      bounded_5_1
    ], rfl⟩
    383
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t384\t{now}"
      handle.flush
noncomputable def record_384 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_384 label_384 raw_384
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t385\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t385\t{now}"
      handle.flush
def label_385 : Fin 4042 := ⟨385, by decide +kernel⟩
noncomputable def raw_385 : RawOp :=
  RawOp.move
    Dir.right
    21
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t385\t{now}"
      handle.flush
noncomputable def record_385 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_385 label_385 raw_385
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t386\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t386\t{now}"
      handle.flush
def label_386 : Fin 4042 := ⟨386, by decide +kernel⟩
noncomputable def raw_386 : RawOp :=
  RawOp.absent
    bounded_4_3
    384
    385
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t386\t{now}"
      handle.flush
noncomputable def record_386 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_386 label_386 raw_386
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t387\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t387\t{now}"
      handle.flush
def label_387 : Fin 4042 := ⟨387, by decide +kernel⟩
noncomputable def raw_387 : RawOp :=
  RawOp.jump
    ⟨#[
      2197,
      2197,
      2197,
      2197,
      2197
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t387\t{now}"
      handle.flush
noncomputable def record_387 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_387 label_387 raw_387
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t388\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t388\t{now}"
      handle.flush
def label_388 : Fin 4042 := ⟨388, by decide +kernel⟩
noncomputable def raw_388 : RawOp :=
  RawOp.move
    Dir.right
    387
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t388\t{now}"
      handle.flush
noncomputable def record_388 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_388 label_388 raw_388
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t389\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t389\t{now}"
      handle.flush
def label_389 : Fin 4042 := ⟨389, by decide +kernel⟩
noncomputable def raw_389 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    388
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t389\t{now}"
      handle.flush
noncomputable def record_389 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_389 label_389 raw_389
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t390\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t390\t{now}"
      handle.flush
def label_390 : Fin 4042 := ⟨390, by decide +kernel⟩
noncomputable def raw_390 : RawOp :=
  RawOp.jump
    ⟨#[
      392,
      392,
      392,
      392,
      392
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t390\t{now}"
      handle.flush
noncomputable def record_390 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_390 label_390 raw_390
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t391\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t391\t{now}"
      handle.flush
def label_391 : Fin 4042 := ⟨391, by decide +kernel⟩
noncomputable def raw_391 : RawOp :=
  RawOp.move
    Dir.right
    390
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t391\t{now}"
      handle.flush
noncomputable def record_391 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_391 label_391 raw_391
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t392\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t392\t{now}"
      handle.flush
def label_392 : Fin 4042 := ⟨392, by decide +kernel⟩
noncomputable def raw_392 : RawOp :=
  RawOp.absent
    bounded_4_1
    389
    391
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t392\t{now}"
      handle.flush
noncomputable def record_392 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_392 label_392 raw_392
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t393\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t393\t{now}"
      handle.flush
def label_393 : Fin 4042 := ⟨393, by decide +kernel⟩
noncomputable def raw_393 : RawOp :=
  RawOp.jump
    ⟨#[
      2207,
      2207,
      2207,
      2207,
      2207
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t393\t{now}"
      handle.flush
noncomputable def record_393 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_393 label_393 raw_393
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t394\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t394\t{now}"
      handle.flush
def label_394 : Fin 4042 := ⟨394, by decide +kernel⟩
noncomputable def raw_394 : RawOp :=
  RawOp.move
    Dir.right
    393
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t394\t{now}"
      handle.flush
noncomputable def record_394 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_394 label_394 raw_394
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t395\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t395\t{now}"
      handle.flush
def label_395 : Fin 4042 := ⟨395, by decide +kernel⟩
noncomputable def raw_395 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    394
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t395\t{now}"
      handle.flush
noncomputable def record_395 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_395 label_395 raw_395
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t396\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t396\t{now}"
      handle.flush
def label_396 : Fin 4042 := ⟨396, by decide +kernel⟩
noncomputable def raw_396 : RawOp :=
  RawOp.jump
    ⟨#[
      398,
      398,
      398,
      398,
      398
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t396\t{now}"
      handle.flush
noncomputable def record_396 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_396 label_396 raw_396
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t397\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t397\t{now}"
      handle.flush
def label_397 : Fin 4042 := ⟨397, by decide +kernel⟩
noncomputable def raw_397 : RawOp :=
  RawOp.move
    Dir.right
    396
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t397\t{now}"
      handle.flush
noncomputable def record_397 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_397 label_397 raw_397
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t398\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t398\t{now}"
      handle.flush
def label_398 : Fin 4042 := ⟨398, by decide +kernel⟩
noncomputable def raw_398 : RawOp :=
  RawOp.absent
    bounded_4_1
    395
    397
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t398\t{now}"
      handle.flush
noncomputable def record_398 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_398 label_398 raw_398
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t399\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t399\t{now}"
      handle.flush
def label_399 : Fin 4042 := ⟨399, by decide +kernel⟩
noncomputable def raw_399 : RawOp :=
  RawOp.jump
    ⟨#[
      2213,
      2213,
      2213,
      2213,
      2213
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t399\t{now}"
      handle.flush
noncomputable def record_399 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_399 label_399 raw_399
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t400\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t400\t{now}"
      handle.flush
def label_400 : Fin 4042 := ⟨400, by decide +kernel⟩
noncomputable def raw_400 : RawOp :=
  RawOp.move
    Dir.right
    399
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t400\t{now}"
      handle.flush
noncomputable def record_400 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_400 label_400 raw_400
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t401\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t401\t{now}"
      handle.flush
def label_401 : Fin 4042 := ⟨401, by decide +kernel⟩
noncomputable def raw_401 : RawOp :=
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
    400
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t401\t{now}"
      handle.flush
noncomputable def record_401 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_401 label_401 raw_401
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t402\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t402\t{now}"
      handle.flush
def label_402 : Fin 4042 := ⟨402, by decide +kernel⟩
noncomputable def raw_402 : RawOp :=
  RawOp.move
    Dir.left
    401
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t402\t{now}"
      handle.flush
noncomputable def record_402 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_402 label_402 raw_402
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t403\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t403\t{now}"
      handle.flush
def label_403 : Fin 4042 := ⟨403, by decide +kernel⟩
noncomputable def raw_403 : RawOp :=
  RawOp.jump
    ⟨#[
      405,
      405,
      405,
      405,
      405
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t403\t{now}"
      handle.flush
noncomputable def record_403 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_403 label_403 raw_403
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t404\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t404\t{now}"
      handle.flush
def label_404 : Fin 4042 := ⟨404, by decide +kernel⟩
noncomputable def raw_404 : RawOp :=
  RawOp.move
    Dir.right
    403
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t404\t{now}"
      handle.flush
noncomputable def record_404 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_404 label_404 raw_404
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t405\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t405\t{now}"
      handle.flush
def label_405 : Fin 4042 := ⟨405, by decide +kernel⟩
noncomputable def raw_405 : RawOp :=
  RawOp.absent
    bounded_4_0
    402
    404
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t405\t{now}"
      handle.flush
noncomputable def record_405 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_405 label_405 raw_405
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t406\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t406\t{now}"
      handle.flush
def label_406 : Fin 4042 := ⟨406, by decide +kernel⟩
noncomputable def raw_406 : RawOp :=
  RawOp.jump
    ⟨#[
      2223,
      2223,
      2223,
      2223,
      2223
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t406\t{now}"
      handle.flush
noncomputable def record_406 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_406 label_406 raw_406
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t407\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t407\t{now}"
      handle.flush
def label_407 : Fin 4042 := ⟨407, by decide +kernel⟩
noncomputable def raw_407 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    406
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t407\t{now}"
      handle.flush
noncomputable def record_407 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_407 label_407 raw_407
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t408\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t408\t{now}"
      handle.flush
def label_408 : Fin 4042 := ⟨408, by decide +kernel⟩
noncomputable def raw_408 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    406
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t408\t{now}"
      handle.flush
noncomputable def record_408 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_408 label_408 raw_408
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t409\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t409\t{now}"
      handle.flush
def label_409 : Fin 4042 := ⟨409, by decide +kernel⟩
noncomputable def raw_409 : RawOp :=
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
    408
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t409\t{now}"
      handle.flush
noncomputable def record_409 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_409 label_409 raw_409
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t410\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t410\t{now}"
      handle.flush
def label_410 : Fin 4042 := ⟨410, by decide +kernel⟩
noncomputable def raw_410 : RawOp :=
  RawOp.move
    Dir.left
    409
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t410\t{now}"
      handle.flush
noncomputable def record_410 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_410 label_410 raw_410
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t411\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t411\t{now}"
      handle.flush
def label_411 : Fin 4042 := ⟨411, by decide +kernel⟩
noncomputable def raw_411 : RawOp :=
  RawOp.marker
    407
    410
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t411\t{now}"
      handle.flush
noncomputable def record_411 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_411 label_411 raw_411
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t412\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t412\t{now}"
      handle.flush
def label_412 : Fin 4042 := ⟨412, by decide +kernel⟩
noncomputable def raw_412 : RawOp :=
  RawOp.move
    Dir.right
    25
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t412\t{now}"
      handle.flush
noncomputable def record_412 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_412 label_412 raw_412
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t413\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t413\t{now}"
      handle.flush
def label_413 : Fin 4042 := ⟨413, by decide +kernel⟩
noncomputable def raw_413 : RawOp :=
  RawOp.absent
    bounded_4_0
    411
    412
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t413\t{now}"
      handle.flush
noncomputable def record_413 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_413 label_413 raw_413
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t414\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t414\t{now}"
      handle.flush
def label_414 : Fin 4042 := ⟨414, by decide +kernel⟩
noncomputable def raw_414 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    394
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t414\t{now}"
      handle.flush
noncomputable def record_414 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_414 label_414 raw_414
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t415\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t415\t{now}"
      handle.flush
def label_415 : Fin 4042 := ⟨415, by decide +kernel⟩
noncomputable def raw_415 : RawOp :=
  RawOp.jump
    ⟨#[
      417,
      417,
      417,
      417,
      417
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t415\t{now}"
      handle.flush
noncomputable def record_415 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_415 label_415 raw_415
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t416\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t416\t{now}"
      handle.flush
def label_416 : Fin 4042 := ⟨416, by decide +kernel⟩
noncomputable def raw_416 : RawOp :=
  RawOp.move
    Dir.right
    415
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t416\t{now}"
      handle.flush
noncomputable def record_416 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_416 label_416 raw_416
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t417\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t417\t{now}"
      handle.flush
def label_417 : Fin 4042 := ⟨417, by decide +kernel⟩
noncomputable def raw_417 : RawOp :=
  RawOp.absent
    bounded_4_0
    414
    416
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t417\t{now}"
      handle.flush
noncomputable def record_417 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_417 label_417 raw_417
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t418\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t418\t{now}"
      handle.flush
def label_418 : Fin 4042 := ⟨418, by decide +kernel⟩
noncomputable def raw_418 : RawOp :=
  RawOp.jump
    ⟨#[
      2237,
      2237,
      2237,
      2237,
      2237
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t418\t{now}"
      handle.flush
noncomputable def record_418 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_418 label_418 raw_418
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t419\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t419\t{now}"
      handle.flush
def label_419 : Fin 4042 := ⟨419, by decide +kernel⟩
noncomputable def raw_419 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    418
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t419\t{now}"
      handle.flush
noncomputable def record_419 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_419 label_419 raw_419
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t420\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t420\t{now}"
      handle.flush
def label_420 : Fin 4042 := ⟨420, by decide +kernel⟩
noncomputable def raw_420 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    418
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t420\t{now}"
      handle.flush
noncomputable def record_420 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_420 label_420 raw_420
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t421\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t421\t{now}"
      handle.flush
def label_421 : Fin 4042 := ⟨421, by decide +kernel⟩
noncomputable def raw_421 : RawOp :=
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
    420
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t421\t{now}"
      handle.flush
noncomputable def record_421 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_421 label_421 raw_421
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t422\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t422\t{now}"
      handle.flush
def label_422 : Fin 4042 := ⟨422, by decide +kernel⟩
noncomputable def raw_422 : RawOp :=
  RawOp.move
    Dir.left
    421
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t422\t{now}"
      handle.flush
noncomputable def record_422 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_422 label_422 raw_422
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t423\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t423\t{now}"
      handle.flush
def label_423 : Fin 4042 := ⟨423, by decide +kernel⟩
noncomputable def raw_423 : RawOp :=
  RawOp.marker
    419
    422
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t423\t{now}"
      handle.flush
noncomputable def record_423 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_423 label_423 raw_423
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t424\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t424\t{now}"
      handle.flush
def label_424 : Fin 4042 := ⟨424, by decide +kernel⟩
noncomputable def raw_424 : RawOp :=
  RawOp.move
    Dir.right
    27
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t424\t{now}"
      handle.flush
noncomputable def record_424 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_424 label_424 raw_424
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t425\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t425\t{now}"
      handle.flush
def label_425 : Fin 4042 := ⟨425, by decide +kernel⟩
noncomputable def raw_425 : RawOp :=
  RawOp.absent
    bounded_4_1
    423
    424
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t425\t{now}"
      handle.flush
noncomputable def record_425 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_425 label_425 raw_425
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t426\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t426\t{now}"
      handle.flush
def label_426 : Fin 4042 := ⟨426, by decide +kernel⟩
noncomputable def raw_426 : RawOp :=
  RawOp.jump
    ⟨#[
      2231,
      2231,
      2231,
      2231,
      2231
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t426\t{now}"
      handle.flush
noncomputable def record_426 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_426 label_426 raw_426
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t427\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t427\t{now}"
      handle.flush
def label_427 : Fin 4042 := ⟨427, by decide +kernel⟩
noncomputable def raw_427 : RawOp :=
  RawOp.move
    Dir.right
    426
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t427\t{now}"
      handle.flush
noncomputable def record_427 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_427 label_427 raw_427
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t428\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t428\t{now}"
      handle.flush
def label_428 : Fin 4042 := ⟨428, by decide +kernel⟩
noncomputable def raw_428 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    427
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t428\t{now}"
      handle.flush
noncomputable def record_428 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_428 label_428 raw_428
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t429\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t429\t{now}"
      handle.flush
def label_429 : Fin 4042 := ⟨429, by decide +kernel⟩
noncomputable def raw_429 : RawOp :=
  RawOp.jump
    ⟨#[
      431,
      431,
      431,
      431,
      431
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t429\t{now}"
      handle.flush
noncomputable def record_429 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_429 label_429 raw_429
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t430\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t430\t{now}"
      handle.flush
def label_430 : Fin 4042 := ⟨430, by decide +kernel⟩
noncomputable def raw_430 : RawOp :=
  RawOp.move
    Dir.right
    429
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t430\t{now}"
      handle.flush
noncomputable def record_430 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_430 label_430 raw_430
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t431\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t431\t{now}"
      handle.flush
def label_431 : Fin 4042 := ⟨431, by decide +kernel⟩
noncomputable def raw_431 : RawOp :=
  RawOp.absent
    bounded_4_1
    428
    430
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t431\t{now}"
      handle.flush
noncomputable def record_431 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_431 label_431 raw_431
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t432\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t432\t{now}"
      handle.flush
def label_432 : Fin 4042 := ⟨432, by decide +kernel⟩
noncomputable def raw_432 : RawOp :=
  RawOp.jump
    ⟨#[
      2250,
      2250,
      2250,
      2250,
      2250
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t432\t{now}"
      handle.flush
noncomputable def record_432 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_432 label_432 raw_432
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t433\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t433\t{now}"
      handle.flush
def label_433 : Fin 4042 := ⟨433, by decide +kernel⟩
noncomputable def raw_433 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    432
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t433\t{now}"
      handle.flush
noncomputable def record_433 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_433 label_433 raw_433
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t434\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t434\t{now}"
      handle.flush
def label_434 : Fin 4042 := ⟨434, by decide +kernel⟩
noncomputable def raw_434 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    432
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t434\t{now}"
      handle.flush
noncomputable def record_434 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_434 label_434 raw_434
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t435\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t435\t{now}"
      handle.flush
def label_435 : Fin 4042 := ⟨435, by decide +kernel⟩
noncomputable def raw_435 : RawOp :=
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
    434
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t435\t{now}"
      handle.flush
noncomputable def record_435 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_435 label_435 raw_435
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t436\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t436\t{now}"
      handle.flush
def label_436 : Fin 4042 := ⟨436, by decide +kernel⟩
noncomputable def raw_436 : RawOp :=
  RawOp.move
    Dir.left
    435
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t436\t{now}"
      handle.flush
noncomputable def record_436 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_436 label_436 raw_436
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t437\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t437\t{now}"
      handle.flush
def label_437 : Fin 4042 := ⟨437, by decide +kernel⟩
noncomputable def raw_437 : RawOp :=
  RawOp.marker
    433
    436
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t437\t{now}"
      handle.flush
noncomputable def record_437 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_437 label_437 raw_437
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t438\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t438\t{now}"
      handle.flush
def label_438 : Fin 4042 := ⟨438, by decide +kernel⟩
noncomputable def raw_438 : RawOp :=
  RawOp.move
    Dir.right
    28
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t438\t{now}"
      handle.flush
noncomputable def record_438 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_438 label_438 raw_438
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t439\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t439\t{now}"
      handle.flush
def label_439 : Fin 4042 := ⟨439, by decide +kernel⟩
noncomputable def raw_439 : RawOp :=
  RawOp.absent
    bounded_4_2
    437
    438
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t439\t{now}"
      handle.flush
noncomputable def record_439 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_439 label_439 raw_439
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t440\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t440\t{now}"
      handle.flush
def label_440 : Fin 4042 := ⟨440, by decide +kernel⟩
noncomputable def raw_440 : RawOp :=
  RawOp.jump
    ⟨#[
      2255,
      2255,
      2255,
      2255,
      2255
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t440\t{now}"
      handle.flush
noncomputable def record_440 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_440 label_440 raw_440
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t441\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t441\t{now}"
      handle.flush
def label_441 : Fin 4042 := ⟨441, by decide +kernel⟩
noncomputable def raw_441 : RawOp :=
  RawOp.move
    Dir.right
    440
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t441\t{now}"
      handle.flush
noncomputable def record_441 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_441 label_441 raw_441
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t442\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t442\t{now}"
      handle.flush
def label_442 : Fin 4042 := ⟨442, by decide +kernel⟩
noncomputable def raw_442 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    441
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t442\t{now}"
      handle.flush
noncomputable def record_442 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_442 label_442 raw_442
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t443\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t443\t{now}"
      handle.flush
def label_443 : Fin 4042 := ⟨443, by decide +kernel⟩
noncomputable def raw_443 : RawOp :=
  RawOp.move
    Dir.right
    29
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t443\t{now}"
      handle.flush
noncomputable def record_443 : SourceCertificate :=
  ScopeViews003Pilot.fromRaw_443 label_443 raw_443
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t444\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t444\t{now}"
      handle.flush
def label_444 : Fin 4042 := ⟨444, by decide +kernel⟩
noncomputable def raw_444 : RawOp :=
  RawOp.absent
    bounded_4_3
    442
    443
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t444\t{now}"
      handle.flush
noncomputable def record_444 : SourceCertificate :=
  ScopeViews004Pilot.fromRaw_444 label_444 raw_444
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t445\t{now}"
      handle.flush
def label_445 : Fin 4042 := ⟨445, by decide +kernel⟩
noncomputable def raw_445 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    441
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t445\t{now}"
      handle.flush
noncomputable def record_445 : SourceCertificate :=
  ScopeViews004Pilot.fromRaw_445 label_445 raw_445
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t446\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t446\t{now}"
      handle.flush
def label_446 : Fin 4042 := ⟨446, by decide +kernel⟩
noncomputable def raw_446 : RawOp :=
  RawOp.jump
    ⟨#[
      448,
      448,
      448,
      448,
      448
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t446\t{now}"
      handle.flush
noncomputable def record_446 : SourceCertificate :=
  ScopeViews004Pilot.fromRaw_446 label_446 raw_446
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t447\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t447\t{now}"
      handle.flush
def label_447 : Fin 4042 := ⟨447, by decide +kernel⟩
noncomputable def raw_447 : RawOp :=
  RawOp.move
    Dir.right
    446
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t447\t{now}"
      handle.flush
noncomputable def record_447 : SourceCertificate :=
  ScopeViews004Pilot.fromRaw_447 label_447 raw_447
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t448\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly_build\t0\t{now}"
      handle.flush
noncomputable def collection_1_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_1) (.leaf record_2)
noncomputable def collection_0_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_0) collection_1_2
noncomputable def collection_3_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_3) (.leaf record_4)
noncomputable def collection_5_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_5) (.leaf record_6)
noncomputable def collection_3_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_3_2 collection_5_2
noncomputable def collection_0_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_0_3 collection_3_4
noncomputable def collection_8_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_8) (.leaf record_9)
noncomputable def collection_7_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_7) collection_8_2
noncomputable def collection_10_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_10) (.leaf record_11)
noncomputable def collection_12_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_12) (.leaf record_13)
noncomputable def collection_10_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_10_2 collection_12_2
noncomputable def collection_7_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_7_3 collection_10_4
noncomputable def collection_0_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_0_7 collection_7_7
noncomputable def collection_15_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_15) (.leaf record_16)
noncomputable def collection_14_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_14) collection_15_2
noncomputable def collection_17_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_17) (.leaf record_18)
noncomputable def collection_19_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_19) (.leaf record_20)
noncomputable def collection_17_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_17_2 collection_19_2
noncomputable def collection_14_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_14_3 collection_17_4
noncomputable def collection_22_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_22) (.leaf record_23)
noncomputable def collection_21_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_21) collection_22_2
noncomputable def collection_24_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_24) (.leaf record_25)
noncomputable def collection_26_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_26) (.leaf record_27)
noncomputable def collection_24_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_24_2 collection_26_2
noncomputable def collection_21_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_21_3 collection_24_4
noncomputable def collection_14_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_14_7 collection_21_7
noncomputable def collection_0_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_0_14 collection_14_14
noncomputable def collection_29_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_29) (.leaf record_30)
noncomputable def collection_28_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_28) collection_29_2
noncomputable def collection_31_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_31) (.leaf record_32)
noncomputable def collection_33_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_33) (.leaf record_34)
noncomputable def collection_31_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_31_2 collection_33_2
noncomputable def collection_28_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_28_3 collection_31_4
noncomputable def collection_36_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_36) (.leaf record_37)
noncomputable def collection_35_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_35) collection_36_2
noncomputable def collection_38_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_38) (.leaf record_39)
noncomputable def collection_40_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_40) (.leaf record_41)
noncomputable def collection_38_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_38_2 collection_40_2
noncomputable def collection_35_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_35_3 collection_38_4
noncomputable def collection_28_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_28_7 collection_35_7
noncomputable def collection_43_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_43) (.leaf record_44)
noncomputable def collection_42_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_42) collection_43_2
noncomputable def collection_45_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_45) (.leaf record_46)
noncomputable def collection_47_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_47) (.leaf record_48)
noncomputable def collection_45_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_45_2 collection_47_2
noncomputable def collection_42_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_42_3 collection_45_4
noncomputable def collection_50_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_50) (.leaf record_51)
noncomputable def collection_49_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_49) collection_50_2
noncomputable def collection_52_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_52) (.leaf record_53)
noncomputable def collection_54_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_54) (.leaf record_55)
noncomputable def collection_52_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_52_2 collection_54_2
noncomputable def collection_49_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_49_3 collection_52_4
noncomputable def collection_42_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_42_7 collection_49_7
noncomputable def collection_28_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_28_14 collection_42_14
noncomputable def collection_0_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_0_28 collection_28_28
noncomputable def collection_57_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_57) (.leaf record_58)
noncomputable def collection_56_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_56) collection_57_2
noncomputable def collection_59_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_59) (.leaf record_60)
noncomputable def collection_61_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_61) (.leaf record_62)
noncomputable def collection_59_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_59_2 collection_61_2
noncomputable def collection_56_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_56_3 collection_59_4
noncomputable def collection_64_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_64) (.leaf record_65)
noncomputable def collection_63_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_63) collection_64_2
noncomputable def collection_66_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_66) (.leaf record_67)
noncomputable def collection_68_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_68) (.leaf record_69)
noncomputable def collection_66_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_66_2 collection_68_2
noncomputable def collection_63_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_63_3 collection_66_4
noncomputable def collection_56_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_56_7 collection_63_7
noncomputable def collection_71_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_71) (.leaf record_72)
noncomputable def collection_70_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_70) collection_71_2
noncomputable def collection_73_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_73) (.leaf record_74)
noncomputable def collection_75_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_75) (.leaf record_76)
noncomputable def collection_73_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_73_2 collection_75_2
noncomputable def collection_70_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_70_3 collection_73_4
noncomputable def collection_78_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_78) (.leaf record_79)
noncomputable def collection_77_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_77) collection_78_2
noncomputable def collection_80_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_80) (.leaf record_81)
noncomputable def collection_82_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_82) (.leaf record_83)
noncomputable def collection_80_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_80_2 collection_82_2
noncomputable def collection_77_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_77_3 collection_80_4
noncomputable def collection_70_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_70_7 collection_77_7
noncomputable def collection_56_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_56_14 collection_70_14
noncomputable def collection_85_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_85) (.leaf record_86)
noncomputable def collection_84_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_84) collection_85_2
noncomputable def collection_87_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_87) (.leaf record_88)
noncomputable def collection_89_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_89) (.leaf record_90)
noncomputable def collection_87_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_87_2 collection_89_2
noncomputable def collection_84_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_84_3 collection_87_4
noncomputable def collection_92_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_92) (.leaf record_93)
noncomputable def collection_91_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_91) collection_92_2
noncomputable def collection_94_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_94) (.leaf record_95)
noncomputable def collection_96_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_96) (.leaf record_97)
noncomputable def collection_94_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_94_2 collection_96_2
noncomputable def collection_91_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_91_3 collection_94_4
noncomputable def collection_84_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_84_7 collection_91_7
noncomputable def collection_99_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_99) (.leaf record_100)
noncomputable def collection_98_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_98) collection_99_2
noncomputable def collection_101_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_101) (.leaf record_102)
noncomputable def collection_103_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_103) (.leaf record_104)
noncomputable def collection_101_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_101_2 collection_103_2
noncomputable def collection_98_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_98_3 collection_101_4
noncomputable def collection_106_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_106) (.leaf record_107)
noncomputable def collection_105_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_105) collection_106_2
noncomputable def collection_108_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_108) (.leaf record_109)
noncomputable def collection_110_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_110) (.leaf record_111)
noncomputable def collection_108_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_108_2 collection_110_2
noncomputable def collection_105_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_105_3 collection_108_4
noncomputable def collection_98_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_98_7 collection_105_7
noncomputable def collection_84_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_84_14 collection_98_14
noncomputable def collection_56_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_56_28 collection_84_28
noncomputable def collection_0_112 : Balanced.RowTree SourceCertificate :=
  .branch 56 collection_0_56 collection_56_56
noncomputable def collection_113_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_113) (.leaf record_114)
noncomputable def collection_112_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_112) collection_113_2
noncomputable def collection_115_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_115) (.leaf record_116)
noncomputable def collection_117_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_117) (.leaf record_118)
noncomputable def collection_115_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_115_2 collection_117_2
noncomputable def collection_112_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_112_3 collection_115_4
noncomputable def collection_120_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_120) (.leaf record_121)
noncomputable def collection_119_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_119) collection_120_2
noncomputable def collection_122_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_122) (.leaf record_123)
noncomputable def collection_124_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_124) (.leaf record_125)
noncomputable def collection_122_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_122_2 collection_124_2
noncomputable def collection_119_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_119_3 collection_122_4
noncomputable def collection_112_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_112_7 collection_119_7
noncomputable def collection_127_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_127) (.leaf record_128)
noncomputable def collection_126_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_126) collection_127_2
noncomputable def collection_129_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_129) (.leaf record_130)
noncomputable def collection_131_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_131) (.leaf record_132)
noncomputable def collection_129_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_129_2 collection_131_2
noncomputable def collection_126_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_126_3 collection_129_4
noncomputable def collection_134_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_134) (.leaf record_135)
noncomputable def collection_133_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_133) collection_134_2
noncomputable def collection_136_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_136) (.leaf record_137)
noncomputable def collection_138_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_138) (.leaf record_139)
noncomputable def collection_136_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_136_2 collection_138_2
noncomputable def collection_133_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_133_3 collection_136_4
noncomputable def collection_126_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_126_7 collection_133_7
noncomputable def collection_112_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_112_14 collection_126_14
noncomputable def collection_141_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_141) (.leaf record_142)
noncomputable def collection_140_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_140) collection_141_2
noncomputable def collection_143_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_143) (.leaf record_144)
noncomputable def collection_145_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_145) (.leaf record_146)
noncomputable def collection_143_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_143_2 collection_145_2
noncomputable def collection_140_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_140_3 collection_143_4
noncomputable def collection_148_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_148) (.leaf record_149)
noncomputable def collection_147_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_147) collection_148_2
noncomputable def collection_150_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_150) (.leaf record_151)
noncomputable def collection_152_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_152) (.leaf record_153)
noncomputable def collection_150_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_150_2 collection_152_2
noncomputable def collection_147_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_147_3 collection_150_4
noncomputable def collection_140_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_140_7 collection_147_7
noncomputable def collection_155_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_155) (.leaf record_156)
noncomputable def collection_154_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_154) collection_155_2
noncomputable def collection_157_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_157) (.leaf record_158)
noncomputable def collection_159_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_159) (.leaf record_160)
noncomputable def collection_157_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_157_2 collection_159_2
noncomputable def collection_154_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_154_3 collection_157_4
noncomputable def collection_162_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_162) (.leaf record_163)
noncomputable def collection_161_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_161) collection_162_2
noncomputable def collection_164_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_164) (.leaf record_165)
noncomputable def collection_166_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_166) (.leaf record_167)
noncomputable def collection_164_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_164_2 collection_166_2
noncomputable def collection_161_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_161_3 collection_164_4
noncomputable def collection_154_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_154_7 collection_161_7
noncomputable def collection_140_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_140_14 collection_154_14
noncomputable def collection_112_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_112_28 collection_140_28
noncomputable def collection_169_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_169) (.leaf record_170)
noncomputable def collection_168_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_168) collection_169_2
noncomputable def collection_171_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_171) (.leaf record_172)
noncomputable def collection_173_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_173) (.leaf record_174)
noncomputable def collection_171_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_171_2 collection_173_2
noncomputable def collection_168_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_168_3 collection_171_4
noncomputable def collection_176_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_176) (.leaf record_177)
noncomputable def collection_175_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_175) collection_176_2
noncomputable def collection_178_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_178) (.leaf record_179)
noncomputable def collection_180_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_180) (.leaf record_181)
noncomputable def collection_178_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_178_2 collection_180_2
noncomputable def collection_175_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_175_3 collection_178_4
noncomputable def collection_168_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_168_7 collection_175_7
noncomputable def collection_183_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_183) (.leaf record_184)
noncomputable def collection_182_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_182) collection_183_2
noncomputable def collection_185_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_185) (.leaf record_186)
noncomputable def collection_187_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_187) (.leaf record_188)
noncomputable def collection_185_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_185_2 collection_187_2
noncomputable def collection_182_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_182_3 collection_185_4
noncomputable def collection_190_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_190) (.leaf record_191)
noncomputable def collection_189_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_189) collection_190_2
noncomputable def collection_192_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_192) (.leaf record_193)
noncomputable def collection_194_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_194) (.leaf record_195)
noncomputable def collection_192_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_192_2 collection_194_2
noncomputable def collection_189_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_189_3 collection_192_4
noncomputable def collection_182_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_182_7 collection_189_7
noncomputable def collection_168_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_168_14 collection_182_14
noncomputable def collection_197_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_197) (.leaf record_198)
noncomputable def collection_196_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_196) collection_197_2
noncomputable def collection_199_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_199) (.leaf record_200)
noncomputable def collection_201_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_201) (.leaf record_202)
noncomputable def collection_199_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_199_2 collection_201_2
noncomputable def collection_196_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_196_3 collection_199_4
noncomputable def collection_204_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_204) (.leaf record_205)
noncomputable def collection_203_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_203) collection_204_2
noncomputable def collection_206_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_206) (.leaf record_207)
noncomputable def collection_208_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_208) (.leaf record_209)
noncomputable def collection_206_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_206_2 collection_208_2
noncomputable def collection_203_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_203_3 collection_206_4
noncomputable def collection_196_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_196_7 collection_203_7
noncomputable def collection_211_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_211) (.leaf record_212)
noncomputable def collection_210_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_210) collection_211_2
noncomputable def collection_213_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_213) (.leaf record_214)
noncomputable def collection_215_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_215) (.leaf record_216)
noncomputable def collection_213_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_213_2 collection_215_2
noncomputable def collection_210_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_210_3 collection_213_4
noncomputable def collection_218_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_218) (.leaf record_219)
noncomputable def collection_217_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_217) collection_218_2
noncomputable def collection_220_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_220) (.leaf record_221)
noncomputable def collection_222_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_222) (.leaf record_223)
noncomputable def collection_220_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_220_2 collection_222_2
noncomputable def collection_217_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_217_3 collection_220_4
noncomputable def collection_210_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_210_7 collection_217_7
noncomputable def collection_196_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_196_14 collection_210_14
noncomputable def collection_168_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_168_28 collection_196_28
noncomputable def collection_112_112 : Balanced.RowTree SourceCertificate :=
  .branch 56 collection_112_56 collection_168_56
noncomputable def collection_0_224 : Balanced.RowTree SourceCertificate :=
  .branch 112 collection_0_112 collection_112_112
noncomputable def collection_225_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_225) (.leaf record_226)
noncomputable def collection_224_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_224) collection_225_2
noncomputable def collection_227_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_227) (.leaf record_228)
noncomputable def collection_229_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_229) (.leaf record_230)
noncomputable def collection_227_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_227_2 collection_229_2
noncomputable def collection_224_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_224_3 collection_227_4
noncomputable def collection_232_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_232) (.leaf record_233)
noncomputable def collection_231_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_231) collection_232_2
noncomputable def collection_234_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_234) (.leaf record_235)
noncomputable def collection_236_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_236) (.leaf record_237)
noncomputable def collection_234_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_234_2 collection_236_2
noncomputable def collection_231_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_231_3 collection_234_4
noncomputable def collection_224_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_224_7 collection_231_7
noncomputable def collection_239_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_239) (.leaf record_240)
noncomputable def collection_238_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_238) collection_239_2
noncomputable def collection_241_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_241) (.leaf record_242)
noncomputable def collection_243_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_243) (.leaf record_244)
noncomputable def collection_241_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_241_2 collection_243_2
noncomputable def collection_238_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_238_3 collection_241_4
noncomputable def collection_246_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_246) (.leaf record_247)
noncomputable def collection_245_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_245) collection_246_2
noncomputable def collection_248_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_248) (.leaf record_249)
noncomputable def collection_250_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_250) (.leaf record_251)
noncomputable def collection_248_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_248_2 collection_250_2
noncomputable def collection_245_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_245_3 collection_248_4
noncomputable def collection_238_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_238_7 collection_245_7
noncomputable def collection_224_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_224_14 collection_238_14
noncomputable def collection_253_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_253) (.leaf record_254)
noncomputable def collection_252_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_252) collection_253_2
noncomputable def collection_255_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_255) (.leaf record_256)
noncomputable def collection_257_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_257) (.leaf record_258)
noncomputable def collection_255_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_255_2 collection_257_2
noncomputable def collection_252_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_252_3 collection_255_4
noncomputable def collection_260_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_260) (.leaf record_261)
noncomputable def collection_259_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_259) collection_260_2
noncomputable def collection_262_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_262) (.leaf record_263)
noncomputable def collection_264_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_264) (.leaf record_265)
noncomputable def collection_262_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_262_2 collection_264_2
noncomputable def collection_259_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_259_3 collection_262_4
noncomputable def collection_252_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_252_7 collection_259_7
noncomputable def collection_267_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_267) (.leaf record_268)
noncomputable def collection_266_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_266) collection_267_2
noncomputable def collection_269_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_269) (.leaf record_270)
noncomputable def collection_271_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_271) (.leaf record_272)
noncomputable def collection_269_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_269_2 collection_271_2
noncomputable def collection_266_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_266_3 collection_269_4
noncomputable def collection_274_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_274) (.leaf record_275)
noncomputable def collection_273_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_273) collection_274_2
noncomputable def collection_276_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_276) (.leaf record_277)
noncomputable def collection_278_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_278) (.leaf record_279)
noncomputable def collection_276_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_276_2 collection_278_2
noncomputable def collection_273_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_273_3 collection_276_4
noncomputable def collection_266_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_266_7 collection_273_7
noncomputable def collection_252_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_252_14 collection_266_14
noncomputable def collection_224_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_224_28 collection_252_28
noncomputable def collection_281_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_281) (.leaf record_282)
noncomputable def collection_280_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_280) collection_281_2
noncomputable def collection_283_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_283) (.leaf record_284)
noncomputable def collection_285_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_285) (.leaf record_286)
noncomputable def collection_283_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_283_2 collection_285_2
noncomputable def collection_280_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_280_3 collection_283_4
noncomputable def collection_288_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_288) (.leaf record_289)
noncomputable def collection_287_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_287) collection_288_2
noncomputable def collection_290_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_290) (.leaf record_291)
noncomputable def collection_292_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_292) (.leaf record_293)
noncomputable def collection_290_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_290_2 collection_292_2
noncomputable def collection_287_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_287_3 collection_290_4
noncomputable def collection_280_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_280_7 collection_287_7
noncomputable def collection_295_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_295) (.leaf record_296)
noncomputable def collection_294_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_294) collection_295_2
noncomputable def collection_297_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_297) (.leaf record_298)
noncomputable def collection_299_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_299) (.leaf record_300)
noncomputable def collection_297_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_297_2 collection_299_2
noncomputable def collection_294_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_294_3 collection_297_4
noncomputable def collection_302_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_302) (.leaf record_303)
noncomputable def collection_301_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_301) collection_302_2
noncomputable def collection_304_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_304) (.leaf record_305)
noncomputable def collection_306_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_306) (.leaf record_307)
noncomputable def collection_304_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_304_2 collection_306_2
noncomputable def collection_301_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_301_3 collection_304_4
noncomputable def collection_294_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_294_7 collection_301_7
noncomputable def collection_280_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_280_14 collection_294_14
noncomputable def collection_309_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_309) (.leaf record_310)
noncomputable def collection_308_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_308) collection_309_2
noncomputable def collection_311_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_311) (.leaf record_312)
noncomputable def collection_313_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_313) (.leaf record_314)
noncomputable def collection_311_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_311_2 collection_313_2
noncomputable def collection_308_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_308_3 collection_311_4
noncomputable def collection_316_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_316) (.leaf record_317)
noncomputable def collection_315_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_315) collection_316_2
noncomputable def collection_318_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_318) (.leaf record_319)
noncomputable def collection_320_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_320) (.leaf record_321)
noncomputable def collection_318_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_318_2 collection_320_2
noncomputable def collection_315_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_315_3 collection_318_4
noncomputable def collection_308_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_308_7 collection_315_7
noncomputable def collection_323_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_323) (.leaf record_324)
noncomputable def collection_322_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_322) collection_323_2
noncomputable def collection_325_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_325) (.leaf record_326)
noncomputable def collection_327_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_327) (.leaf record_328)
noncomputable def collection_325_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_325_2 collection_327_2
noncomputable def collection_322_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_322_3 collection_325_4
noncomputable def collection_330_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_330) (.leaf record_331)
noncomputable def collection_329_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_329) collection_330_2
noncomputable def collection_332_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_332) (.leaf record_333)
noncomputable def collection_334_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_334) (.leaf record_335)
noncomputable def collection_332_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_332_2 collection_334_2
noncomputable def collection_329_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_329_3 collection_332_4
noncomputable def collection_322_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_322_7 collection_329_7
noncomputable def collection_308_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_308_14 collection_322_14
noncomputable def collection_280_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_280_28 collection_308_28
noncomputable def collection_224_112 : Balanced.RowTree SourceCertificate :=
  .branch 56 collection_224_56 collection_280_56
noncomputable def collection_337_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_337) (.leaf record_338)
noncomputable def collection_336_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_336) collection_337_2
noncomputable def collection_339_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_339) (.leaf record_340)
noncomputable def collection_341_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_341) (.leaf record_342)
noncomputable def collection_339_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_339_2 collection_341_2
noncomputable def collection_336_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_336_3 collection_339_4
noncomputable def collection_344_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_344) (.leaf record_345)
noncomputable def collection_343_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_343) collection_344_2
noncomputable def collection_346_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_346) (.leaf record_347)
noncomputable def collection_348_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_348) (.leaf record_349)
noncomputable def collection_346_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_346_2 collection_348_2
noncomputable def collection_343_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_343_3 collection_346_4
noncomputable def collection_336_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_336_7 collection_343_7
noncomputable def collection_351_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_351) (.leaf record_352)
noncomputable def collection_350_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_350) collection_351_2
noncomputable def collection_353_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_353) (.leaf record_354)
noncomputable def collection_355_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_355) (.leaf record_356)
noncomputable def collection_353_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_353_2 collection_355_2
noncomputable def collection_350_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_350_3 collection_353_4
noncomputable def collection_358_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_358) (.leaf record_359)
noncomputable def collection_357_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_357) collection_358_2
noncomputable def collection_360_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_360) (.leaf record_361)
noncomputable def collection_362_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_362) (.leaf record_363)
noncomputable def collection_360_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_360_2 collection_362_2
noncomputable def collection_357_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_357_3 collection_360_4
noncomputable def collection_350_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_350_7 collection_357_7
noncomputable def collection_336_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_336_14 collection_350_14
noncomputable def collection_365_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_365) (.leaf record_366)
noncomputable def collection_364_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_364) collection_365_2
noncomputable def collection_367_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_367) (.leaf record_368)
noncomputable def collection_369_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_369) (.leaf record_370)
noncomputable def collection_367_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_367_2 collection_369_2
noncomputable def collection_364_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_364_3 collection_367_4
noncomputable def collection_372_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_372) (.leaf record_373)
noncomputable def collection_371_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_371) collection_372_2
noncomputable def collection_374_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_374) (.leaf record_375)
noncomputable def collection_376_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_376) (.leaf record_377)
noncomputable def collection_374_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_374_2 collection_376_2
noncomputable def collection_371_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_371_3 collection_374_4
noncomputable def collection_364_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_364_7 collection_371_7
noncomputable def collection_379_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_379) (.leaf record_380)
noncomputable def collection_378_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_378) collection_379_2
noncomputable def collection_381_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_381) (.leaf record_382)
noncomputable def collection_383_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_383) (.leaf record_384)
noncomputable def collection_381_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_381_2 collection_383_2
noncomputable def collection_378_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_378_3 collection_381_4
noncomputable def collection_386_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_386) (.leaf record_387)
noncomputable def collection_385_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_385) collection_386_2
noncomputable def collection_388_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_388) (.leaf record_389)
noncomputable def collection_390_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_390) (.leaf record_391)
noncomputable def collection_388_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_388_2 collection_390_2
noncomputable def collection_385_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_385_3 collection_388_4
noncomputable def collection_378_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_378_7 collection_385_7
noncomputable def collection_364_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_364_14 collection_378_14
noncomputable def collection_336_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_336_28 collection_364_28
noncomputable def collection_393_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_393) (.leaf record_394)
noncomputable def collection_392_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_392) collection_393_2
noncomputable def collection_395_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_395) (.leaf record_396)
noncomputable def collection_397_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_397) (.leaf record_398)
noncomputable def collection_395_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_395_2 collection_397_2
noncomputable def collection_392_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_392_3 collection_395_4
noncomputable def collection_400_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_400) (.leaf record_401)
noncomputable def collection_399_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_399) collection_400_2
noncomputable def collection_402_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_402) (.leaf record_403)
noncomputable def collection_404_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_404) (.leaf record_405)
noncomputable def collection_402_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_402_2 collection_404_2
noncomputable def collection_399_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_399_3 collection_402_4
noncomputable def collection_392_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_392_7 collection_399_7
noncomputable def collection_407_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_407) (.leaf record_408)
noncomputable def collection_406_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_406) collection_407_2
noncomputable def collection_409_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_409) (.leaf record_410)
noncomputable def collection_411_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_411) (.leaf record_412)
noncomputable def collection_409_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_409_2 collection_411_2
noncomputable def collection_406_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_406_3 collection_409_4
noncomputable def collection_414_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_414) (.leaf record_415)
noncomputable def collection_413_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_413) collection_414_2
noncomputable def collection_416_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_416) (.leaf record_417)
noncomputable def collection_418_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_418) (.leaf record_419)
noncomputable def collection_416_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_416_2 collection_418_2
noncomputable def collection_413_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_413_3 collection_416_4
noncomputable def collection_406_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_406_7 collection_413_7
noncomputable def collection_392_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_392_14 collection_406_14
noncomputable def collection_421_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_421) (.leaf record_422)
noncomputable def collection_420_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_420) collection_421_2
noncomputable def collection_423_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_423) (.leaf record_424)
noncomputable def collection_425_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_425) (.leaf record_426)
noncomputable def collection_423_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_423_2 collection_425_2
noncomputable def collection_420_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_420_3 collection_423_4
noncomputable def collection_428_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_428) (.leaf record_429)
noncomputable def collection_427_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_427) collection_428_2
noncomputable def collection_430_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_430) (.leaf record_431)
noncomputable def collection_432_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_432) (.leaf record_433)
noncomputable def collection_430_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_430_2 collection_432_2
noncomputable def collection_427_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_427_3 collection_430_4
noncomputable def collection_420_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_420_7 collection_427_7
noncomputable def collection_435_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_435) (.leaf record_436)
noncomputable def collection_434_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_434) collection_435_2
noncomputable def collection_437_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_437) (.leaf record_438)
noncomputable def collection_439_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_439) (.leaf record_440)
noncomputable def collection_437_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_437_2 collection_439_2
noncomputable def collection_434_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_434_3 collection_437_4
noncomputable def collection_442_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_442) (.leaf record_443)
noncomputable def collection_441_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_441) collection_442_2
noncomputable def collection_444_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_444) (.leaf record_445)
noncomputable def collection_446_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_446) (.leaf record_447)
noncomputable def collection_444_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_444_2 collection_446_2
noncomputable def collection_441_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_441_3 collection_444_4
noncomputable def collection_434_14 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_434_7 collection_441_7
noncomputable def collection_420_28 : Balanced.RowTree SourceCertificate :=
  .branch 14 collection_420_14 collection_434_14
noncomputable def collection_392_56 : Balanced.RowTree SourceCertificate :=
  .branch 28 collection_392_28 collection_420_28
noncomputable def collection_336_112 : Balanced.RowTree SourceCertificate :=
  .branch 56 collection_336_56 collection_392_56
noncomputable def collection_224_224 : Balanced.RowTree SourceCertificate :=
  .branch 112 collection_224_112 collection_336_112
noncomputable def collection_0_448 : Balanced.RowTree SourceCertificate :=
  .branch 224 collection_0_224 collection_224_224
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t1\t{now}"
      handle.flush
theorem collection_checked :
    scan collection_0_448 0 = some (448, 6995, 853) := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t2\t{now}"
      handle.flush
theorem complete_source_prefix (q : Fin 4042)
    (before : q.val < 448) : SourceRows q :=
  scan_covers collection_0_448 0 448 6995 853
    collection_checked q (Nat.zero_le _) before
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t3\t{now}"
      handle.flush
theorem actual_node_and_return_census :
    (collection_0_448.flatten.map
      (fun r ↦ (FieldPacked.syntaxRows.get r.label).size)).sum = 6995 ∧
    (collection_0_448.flatten.map
      (fun r ↦ FieldSelectiveLayout.localSize r.label)).sum = 853 :=
  scan_sizes collection_0_448 0 448 6995 853 collection_checked
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t4\t{now}"
      handle.flush
theorem substantial_domain : 16 * (5 * (6995 + 853)) ≥
    573802 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t5\t{now}"
      handle.flush
theorem wrong_source_order_rejected :
    scan (.branch 1 (.leaf record_1) (.leaf record_0)) 0 = none := by
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope16-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"assembly\t6\t{now}"
      handle.flush
end LocalScope16Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual paid body coverage checked: at least 1/16"
