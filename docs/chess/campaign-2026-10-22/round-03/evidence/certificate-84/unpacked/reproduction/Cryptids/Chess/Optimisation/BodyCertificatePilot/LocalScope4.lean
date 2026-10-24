module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceRecipes
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalScope16
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.CacheWorldControls
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
namespace LocalScope4Pilot
noncomputable def record_0 : SourceCertificate :=
  LocalScope16Pilot.record_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t1\t{now}"
      handle.flush
noncomputable def record_1 : SourceCertificate :=
  LocalScope16Pilot.record_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t2\t{now}"
      handle.flush
noncomputable def record_2 : SourceCertificate :=
  LocalScope16Pilot.record_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t3\t{now}"
      handle.flush
noncomputable def record_3 : SourceCertificate :=
  LocalScope16Pilot.record_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t4\t{now}"
      handle.flush
noncomputable def record_4 : SourceCertificate :=
  LocalScope16Pilot.record_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t5\t{now}"
      handle.flush
noncomputable def record_5 : SourceCertificate :=
  LocalScope16Pilot.record_5
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t6\t{now}"
      handle.flush
noncomputable def record_6 : SourceCertificate :=
  LocalScope16Pilot.record_6
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t7\t{now}"
      handle.flush
noncomputable def record_7 : SourceCertificate :=
  LocalScope16Pilot.record_7
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t8\t{now}"
      handle.flush
noncomputable def record_8 : SourceCertificate :=
  LocalScope16Pilot.record_8
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t9\t{now}"
      handle.flush
noncomputable def record_9 : SourceCertificate :=
  LocalScope16Pilot.record_9
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t10\t{now}"
      handle.flush
noncomputable def record_10 : SourceCertificate :=
  LocalScope16Pilot.record_10
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t11\t{now}"
      handle.flush
noncomputable def record_11 : SourceCertificate :=
  LocalScope16Pilot.record_11
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t12\t{now}"
      handle.flush
noncomputable def record_12 : SourceCertificate :=
  LocalScope16Pilot.record_12
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t13\t{now}"
      handle.flush
noncomputable def record_13 : SourceCertificate :=
  LocalScope16Pilot.record_13
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t14\t{now}"
      handle.flush
noncomputable def record_14 : SourceCertificate :=
  LocalScope16Pilot.record_14
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t15\t{now}"
      handle.flush
noncomputable def record_15 : SourceCertificate :=
  LocalScope16Pilot.record_15
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t16\t{now}"
      handle.flush
noncomputable def record_16 : SourceCertificate :=
  LocalScope16Pilot.record_16
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t17\t{now}"
      handle.flush
noncomputable def record_17 : SourceCertificate :=
  LocalScope16Pilot.record_17
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t18\t{now}"
      handle.flush
noncomputable def record_18 : SourceCertificate :=
  LocalScope16Pilot.record_18
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t19\t{now}"
      handle.flush
noncomputable def record_19 : SourceCertificate :=
  LocalScope16Pilot.record_19
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t20\t{now}"
      handle.flush
noncomputable def record_20 : SourceCertificate :=
  LocalScope16Pilot.record_20
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t21\t{now}"
      handle.flush
noncomputable def record_21 : SourceCertificate :=
  LocalScope16Pilot.record_21
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t22\t{now}"
      handle.flush
noncomputable def record_22 : SourceCertificate :=
  LocalScope16Pilot.record_22
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t23\t{now}"
      handle.flush
noncomputable def record_23 : SourceCertificate :=
  LocalScope16Pilot.record_23
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t24\t{now}"
      handle.flush
noncomputable def record_24 : SourceCertificate :=
  LocalScope16Pilot.record_24
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t25\t{now}"
      handle.flush
noncomputable def record_25 : SourceCertificate :=
  LocalScope16Pilot.record_25
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t26\t{now}"
      handle.flush
noncomputable def record_26 : SourceCertificate :=
  LocalScope16Pilot.record_26
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t27\t{now}"
      handle.flush
noncomputable def record_27 : SourceCertificate :=
  LocalScope16Pilot.record_27
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t28\t{now}"
      handle.flush
noncomputable def record_28 : SourceCertificate :=
  LocalScope16Pilot.record_28
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t29\t{now}"
      handle.flush
noncomputable def record_29 : SourceCertificate :=
  LocalScope16Pilot.record_29
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t30\t{now}"
      handle.flush
noncomputable def record_30 : SourceCertificate :=
  LocalScope16Pilot.record_30
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t31\t{now}"
      handle.flush
noncomputable def record_31 : SourceCertificate :=
  LocalScope16Pilot.record_31
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t32\t{now}"
      handle.flush
noncomputable def record_32 : SourceCertificate :=
  LocalScope16Pilot.record_32
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t33\t{now}"
      handle.flush
noncomputable def record_33 : SourceCertificate :=
  LocalScope16Pilot.record_33
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t34\t{now}"
      handle.flush
noncomputable def record_34 : SourceCertificate :=
  LocalScope16Pilot.record_34
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t35\t{now}"
      handle.flush
noncomputable def record_35 : SourceCertificate :=
  LocalScope16Pilot.record_35
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t36\t{now}"
      handle.flush
noncomputable def record_36 : SourceCertificate :=
  LocalScope16Pilot.record_36
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t37\t{now}"
      handle.flush
noncomputable def record_37 : SourceCertificate :=
  LocalScope16Pilot.record_37
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t38\t{now}"
      handle.flush
noncomputable def record_38 : SourceCertificate :=
  LocalScope16Pilot.record_38
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t39\t{now}"
      handle.flush
noncomputable def record_39 : SourceCertificate :=
  LocalScope16Pilot.record_39
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t40\t{now}"
      handle.flush
noncomputable def record_40 : SourceCertificate :=
  LocalScope16Pilot.record_40
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t41\t{now}"
      handle.flush
noncomputable def record_41 : SourceCertificate :=
  LocalScope16Pilot.record_41
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t42\t{now}"
      handle.flush
noncomputable def record_42 : SourceCertificate :=
  LocalScope16Pilot.record_42
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t43\t{now}"
      handle.flush
noncomputable def record_43 : SourceCertificate :=
  LocalScope16Pilot.record_43
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t44\t{now}"
      handle.flush
noncomputable def record_44 : SourceCertificate :=
  LocalScope16Pilot.record_44
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t45\t{now}"
      handle.flush
noncomputable def record_45 : SourceCertificate :=
  LocalScope16Pilot.record_45
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t46\t{now}"
      handle.flush
noncomputable def record_46 : SourceCertificate :=
  LocalScope16Pilot.record_46
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t47\t{now}"
      handle.flush
noncomputable def record_47 : SourceCertificate :=
  LocalScope16Pilot.record_47
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t48\t{now}"
      handle.flush
noncomputable def record_48 : SourceCertificate :=
  LocalScope16Pilot.record_48
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t49\t{now}"
      handle.flush
noncomputable def record_49 : SourceCertificate :=
  LocalScope16Pilot.record_49
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t50\t{now}"
      handle.flush
noncomputable def record_50 : SourceCertificate :=
  LocalScope16Pilot.record_50
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t51\t{now}"
      handle.flush
noncomputable def record_51 : SourceCertificate :=
  LocalScope16Pilot.record_51
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t52\t{now}"
      handle.flush
noncomputable def record_52 : SourceCertificate :=
  LocalScope16Pilot.record_52
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t53\t{now}"
      handle.flush
noncomputable def record_53 : SourceCertificate :=
  LocalScope16Pilot.record_53
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t54\t{now}"
      handle.flush
noncomputable def record_54 : SourceCertificate :=
  LocalScope16Pilot.record_54
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t55\t{now}"
      handle.flush
noncomputable def record_55 : SourceCertificate :=
  LocalScope16Pilot.record_55
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t56\t{now}"
      handle.flush
noncomputable def record_56 : SourceCertificate :=
  LocalScope16Pilot.record_56
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t57\t{now}"
      handle.flush
noncomputable def record_57 : SourceCertificate :=
  LocalScope16Pilot.record_57
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t58\t{now}"
      handle.flush
noncomputable def record_58 : SourceCertificate :=
  LocalScope16Pilot.record_58
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t59\t{now}"
      handle.flush
noncomputable def record_59 : SourceCertificate :=
  LocalScope16Pilot.record_59
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t60\t{now}"
      handle.flush
noncomputable def record_60 : SourceCertificate :=
  LocalScope16Pilot.record_60
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t61\t{now}"
      handle.flush
noncomputable def record_61 : SourceCertificate :=
  LocalScope16Pilot.record_61
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t62\t{now}"
      handle.flush
noncomputable def record_62 : SourceCertificate :=
  LocalScope16Pilot.record_62
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t63\t{now}"
      handle.flush
noncomputable def record_63 : SourceCertificate :=
  LocalScope16Pilot.record_63
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t64\t{now}"
      handle.flush
noncomputable def record_64 : SourceCertificate :=
  LocalScope16Pilot.record_64
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t65\t{now}"
      handle.flush
noncomputable def record_65 : SourceCertificate :=
  LocalScope16Pilot.record_65
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t66\t{now}"
      handle.flush
noncomputable def record_66 : SourceCertificate :=
  LocalScope16Pilot.record_66
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t67\t{now}"
      handle.flush
noncomputable def record_67 : SourceCertificate :=
  LocalScope16Pilot.record_67
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t68\t{now}"
      handle.flush
noncomputable def record_68 : SourceCertificate :=
  LocalScope16Pilot.record_68
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t69\t{now}"
      handle.flush
noncomputable def record_69 : SourceCertificate :=
  LocalScope16Pilot.record_69
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t70\t{now}"
      handle.flush
noncomputable def record_70 : SourceCertificate :=
  LocalScope16Pilot.record_70
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t71\t{now}"
      handle.flush
noncomputable def record_71 : SourceCertificate :=
  LocalScope16Pilot.record_71
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t72\t{now}"
      handle.flush
noncomputable def record_72 : SourceCertificate :=
  LocalScope16Pilot.record_72
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t73\t{now}"
      handle.flush
noncomputable def record_73 : SourceCertificate :=
  LocalScope16Pilot.record_73
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t74\t{now}"
      handle.flush
noncomputable def record_74 : SourceCertificate :=
  LocalScope16Pilot.record_74
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t75\t{now}"
      handle.flush
noncomputable def record_75 : SourceCertificate :=
  LocalScope16Pilot.record_75
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t76\t{now}"
      handle.flush
noncomputable def record_76 : SourceCertificate :=
  LocalScope16Pilot.record_76
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t77\t{now}"
      handle.flush
noncomputable def record_77 : SourceCertificate :=
  LocalScope16Pilot.record_77
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t78\t{now}"
      handle.flush
noncomputable def record_78 : SourceCertificate :=
  LocalScope16Pilot.record_78
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t79\t{now}"
      handle.flush
noncomputable def record_79 : SourceCertificate :=
  LocalScope16Pilot.record_79
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t80\t{now}"
      handle.flush
noncomputable def record_80 : SourceCertificate :=
  LocalScope16Pilot.record_80
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t81\t{now}"
      handle.flush
noncomputable def record_81 : SourceCertificate :=
  LocalScope16Pilot.record_81
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t82\t{now}"
      handle.flush
noncomputable def record_82 : SourceCertificate :=
  LocalScope16Pilot.record_82
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t83\t{now}"
      handle.flush
noncomputable def record_83 : SourceCertificate :=
  LocalScope16Pilot.record_83
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t84\t{now}"
      handle.flush
noncomputable def record_84 : SourceCertificate :=
  LocalScope16Pilot.record_84
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t85\t{now}"
      handle.flush
noncomputable def record_85 : SourceCertificate :=
  LocalScope16Pilot.record_85
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t86\t{now}"
      handle.flush
noncomputable def record_86 : SourceCertificate :=
  LocalScope16Pilot.record_86
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t87\t{now}"
      handle.flush
noncomputable def record_87 : SourceCertificate :=
  LocalScope16Pilot.record_87
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t88\t{now}"
      handle.flush
noncomputable def record_88 : SourceCertificate :=
  LocalScope16Pilot.record_88
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t89\t{now}"
      handle.flush
noncomputable def record_89 : SourceCertificate :=
  LocalScope16Pilot.record_89
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t90\t{now}"
      handle.flush
noncomputable def record_90 : SourceCertificate :=
  LocalScope16Pilot.record_90
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t91\t{now}"
      handle.flush
noncomputable def record_91 : SourceCertificate :=
  LocalScope16Pilot.record_91
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t92\t{now}"
      handle.flush
noncomputable def record_92 : SourceCertificate :=
  LocalScope16Pilot.record_92
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t93\t{now}"
      handle.flush
noncomputable def record_93 : SourceCertificate :=
  LocalScope16Pilot.record_93
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t94\t{now}"
      handle.flush
noncomputable def record_94 : SourceCertificate :=
  LocalScope16Pilot.record_94
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t95\t{now}"
      handle.flush
noncomputable def record_95 : SourceCertificate :=
  LocalScope16Pilot.record_95
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t96\t{now}"
      handle.flush
noncomputable def record_96 : SourceCertificate :=
  LocalScope16Pilot.record_96
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t97\t{now}"
      handle.flush
noncomputable def record_97 : SourceCertificate :=
  LocalScope16Pilot.record_97
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t98\t{now}"
      handle.flush
noncomputable def record_98 : SourceCertificate :=
  LocalScope16Pilot.record_98
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t99\t{now}"
      handle.flush
noncomputable def record_99 : SourceCertificate :=
  LocalScope16Pilot.record_99
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t100\t{now}"
      handle.flush
noncomputable def record_100 : SourceCertificate :=
  LocalScope16Pilot.record_100
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t101\t{now}"
      handle.flush
noncomputable def record_101 : SourceCertificate :=
  LocalScope16Pilot.record_101
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t102\t{now}"
      handle.flush
noncomputable def record_102 : SourceCertificate :=
  LocalScope16Pilot.record_102
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t103\t{now}"
      handle.flush
noncomputable def record_103 : SourceCertificate :=
  LocalScope16Pilot.record_103
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t104\t{now}"
      handle.flush
noncomputable def record_104 : SourceCertificate :=
  LocalScope16Pilot.record_104
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t105\t{now}"
      handle.flush
noncomputable def record_105 : SourceCertificate :=
  LocalScope16Pilot.record_105
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t106\t{now}"
      handle.flush
noncomputable def record_106 : SourceCertificate :=
  LocalScope16Pilot.record_106
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t107\t{now}"
      handle.flush
noncomputable def record_107 : SourceCertificate :=
  LocalScope16Pilot.record_107
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t108\t{now}"
      handle.flush
noncomputable def record_108 : SourceCertificate :=
  LocalScope16Pilot.record_108
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t109\t{now}"
      handle.flush
noncomputable def record_109 : SourceCertificate :=
  LocalScope16Pilot.record_109
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t110\t{now}"
      handle.flush
noncomputable def record_110 : SourceCertificate :=
  LocalScope16Pilot.record_110
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t111\t{now}"
      handle.flush
noncomputable def record_111 : SourceCertificate :=
  LocalScope16Pilot.record_111
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t112\t{now}"
      handle.flush
noncomputable def record_112 : SourceCertificate :=
  LocalScope16Pilot.record_112
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t113\t{now}"
      handle.flush
noncomputable def record_113 : SourceCertificate :=
  LocalScope16Pilot.record_113
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t114\t{now}"
      handle.flush
noncomputable def record_114 : SourceCertificate :=
  LocalScope16Pilot.record_114
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t115\t{now}"
      handle.flush
noncomputable def record_115 : SourceCertificate :=
  LocalScope16Pilot.record_115
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t116\t{now}"
      handle.flush
noncomputable def record_116 : SourceCertificate :=
  LocalScope16Pilot.record_116
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t117\t{now}"
      handle.flush
noncomputable def record_117 : SourceCertificate :=
  LocalScope16Pilot.record_117
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t118\t{now}"
      handle.flush
noncomputable def record_118 : SourceCertificate :=
  LocalScope16Pilot.record_118
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t119\t{now}"
      handle.flush
noncomputable def record_119 : SourceCertificate :=
  LocalScope16Pilot.record_119
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t120\t{now}"
      handle.flush
noncomputable def record_120 : SourceCertificate :=
  LocalScope16Pilot.record_120
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t121\t{now}"
      handle.flush
noncomputable def record_121 : SourceCertificate :=
  LocalScope16Pilot.record_121
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t122\t{now}"
      handle.flush
noncomputable def record_122 : SourceCertificate :=
  LocalScope16Pilot.record_122
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t123\t{now}"
      handle.flush
noncomputable def record_123 : SourceCertificate :=
  LocalScope16Pilot.record_123
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t124\t{now}"
      handle.flush
noncomputable def record_124 : SourceCertificate :=
  LocalScope16Pilot.record_124
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t125\t{now}"
      handle.flush
noncomputable def record_125 : SourceCertificate :=
  LocalScope16Pilot.record_125
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t126\t{now}"
      handle.flush
noncomputable def record_126 : SourceCertificate :=
  LocalScope16Pilot.record_126
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t127\t{now}"
      handle.flush
noncomputable def record_127 : SourceCertificate :=
  LocalScope16Pilot.record_127
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t128\t{now}"
      handle.flush
noncomputable def record_128 : SourceCertificate :=
  LocalScope16Pilot.record_128
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t129\t{now}"
      handle.flush
noncomputable def record_129 : SourceCertificate :=
  LocalScope16Pilot.record_129
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t130\t{now}"
      handle.flush
noncomputable def record_130 : SourceCertificate :=
  LocalScope16Pilot.record_130
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t131\t{now}"
      handle.flush
noncomputable def record_131 : SourceCertificate :=
  LocalScope16Pilot.record_131
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t132\t{now}"
      handle.flush
noncomputable def record_132 : SourceCertificate :=
  LocalScope16Pilot.record_132
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t133\t{now}"
      handle.flush
noncomputable def record_133 : SourceCertificate :=
  LocalScope16Pilot.record_133
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t134\t{now}"
      handle.flush
noncomputable def record_134 : SourceCertificate :=
  LocalScope16Pilot.record_134
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t135\t{now}"
      handle.flush
noncomputable def record_135 : SourceCertificate :=
  LocalScope16Pilot.record_135
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t136\t{now}"
      handle.flush
noncomputable def record_136 : SourceCertificate :=
  LocalScope16Pilot.record_136
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t137\t{now}"
      handle.flush
noncomputable def record_137 : SourceCertificate :=
  LocalScope16Pilot.record_137
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t138\t{now}"
      handle.flush
noncomputable def record_138 : SourceCertificate :=
  LocalScope16Pilot.record_138
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t139\t{now}"
      handle.flush
noncomputable def record_139 : SourceCertificate :=
  LocalScope16Pilot.record_139
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t140\t{now}"
      handle.flush
noncomputable def record_140 : SourceCertificate :=
  LocalScope16Pilot.record_140
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t141\t{now}"
      handle.flush
noncomputable def record_141 : SourceCertificate :=
  LocalScope16Pilot.record_141
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t142\t{now}"
      handle.flush
noncomputable def record_142 : SourceCertificate :=
  LocalScope16Pilot.record_142
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t143\t{now}"
      handle.flush
noncomputable def record_143 : SourceCertificate :=
  LocalScope16Pilot.record_143
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t144\t{now}"
      handle.flush
noncomputable def record_144 : SourceCertificate :=
  LocalScope16Pilot.record_144
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t145\t{now}"
      handle.flush
noncomputable def record_145 : SourceCertificate :=
  LocalScope16Pilot.record_145
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t146\t{now}"
      handle.flush
noncomputable def record_146 : SourceCertificate :=
  LocalScope16Pilot.record_146
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t147\t{now}"
      handle.flush
noncomputable def record_147 : SourceCertificate :=
  LocalScope16Pilot.record_147
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t148\t{now}"
      handle.flush
noncomputable def record_148 : SourceCertificate :=
  LocalScope16Pilot.record_148
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t149\t{now}"
      handle.flush
noncomputable def record_149 : SourceCertificate :=
  LocalScope16Pilot.record_149
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t150\t{now}"
      handle.flush
noncomputable def record_150 : SourceCertificate :=
  LocalScope16Pilot.record_150
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t151\t{now}"
      handle.flush
noncomputable def record_151 : SourceCertificate :=
  LocalScope16Pilot.record_151
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t152\t{now}"
      handle.flush
noncomputable def record_152 : SourceCertificate :=
  LocalScope16Pilot.record_152
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t153\t{now}"
      handle.flush
noncomputable def record_153 : SourceCertificate :=
  LocalScope16Pilot.record_153
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t154\t{now}"
      handle.flush
noncomputable def record_154 : SourceCertificate :=
  LocalScope16Pilot.record_154
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t155\t{now}"
      handle.flush
noncomputable def record_155 : SourceCertificate :=
  LocalScope16Pilot.record_155
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t156\t{now}"
      handle.flush
noncomputable def record_156 : SourceCertificate :=
  LocalScope16Pilot.record_156
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t157\t{now}"
      handle.flush
noncomputable def record_157 : SourceCertificate :=
  LocalScope16Pilot.record_157
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t158\t{now}"
      handle.flush
noncomputable def record_158 : SourceCertificate :=
  LocalScope16Pilot.record_158
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t159\t{now}"
      handle.flush
noncomputable def record_159 : SourceCertificate :=
  LocalScope16Pilot.record_159
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t160\t{now}"
      handle.flush
noncomputable def record_160 : SourceCertificate :=
  LocalScope16Pilot.record_160
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t161\t{now}"
      handle.flush
noncomputable def record_161 : SourceCertificate :=
  LocalScope16Pilot.record_161
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t162\t{now}"
      handle.flush
noncomputable def record_162 : SourceCertificate :=
  LocalScope16Pilot.record_162
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t163\t{now}"
      handle.flush
noncomputable def record_163 : SourceCertificate :=
  LocalScope16Pilot.record_163
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t164\t{now}"
      handle.flush
noncomputable def record_164 : SourceCertificate :=
  LocalScope16Pilot.record_164
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t165\t{now}"
      handle.flush
noncomputable def record_165 : SourceCertificate :=
  LocalScope16Pilot.record_165
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t166\t{now}"
      handle.flush
noncomputable def record_166 : SourceCertificate :=
  LocalScope16Pilot.record_166
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t167\t{now}"
      handle.flush
noncomputable def record_167 : SourceCertificate :=
  LocalScope16Pilot.record_167
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t168\t{now}"
      handle.flush
noncomputable def record_168 : SourceCertificate :=
  LocalScope16Pilot.record_168
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t169\t{now}"
      handle.flush
noncomputable def record_169 : SourceCertificate :=
  LocalScope16Pilot.record_169
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t170\t{now}"
      handle.flush
noncomputable def record_170 : SourceCertificate :=
  LocalScope16Pilot.record_170
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t171\t{now}"
      handle.flush
noncomputable def record_171 : SourceCertificate :=
  LocalScope16Pilot.record_171
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t172\t{now}"
      handle.flush
noncomputable def record_172 : SourceCertificate :=
  LocalScope16Pilot.record_172
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t173\t{now}"
      handle.flush
noncomputable def record_173 : SourceCertificate :=
  LocalScope16Pilot.record_173
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t174\t{now}"
      handle.flush
noncomputable def record_174 : SourceCertificate :=
  LocalScope16Pilot.record_174
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t175\t{now}"
      handle.flush
noncomputable def record_175 : SourceCertificate :=
  LocalScope16Pilot.record_175
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t176\t{now}"
      handle.flush
noncomputable def record_176 : SourceCertificate :=
  LocalScope16Pilot.record_176
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t177\t{now}"
      handle.flush
noncomputable def record_177 : SourceCertificate :=
  LocalScope16Pilot.record_177
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t178\t{now}"
      handle.flush
noncomputable def record_178 : SourceCertificate :=
  LocalScope16Pilot.record_178
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t179\t{now}"
      handle.flush
noncomputable def record_179 : SourceCertificate :=
  LocalScope16Pilot.record_179
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t180\t{now}"
      handle.flush
noncomputable def record_180 : SourceCertificate :=
  LocalScope16Pilot.record_180
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t181\t{now}"
      handle.flush
noncomputable def record_181 : SourceCertificate :=
  LocalScope16Pilot.record_181
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t182\t{now}"
      handle.flush
noncomputable def record_182 : SourceCertificate :=
  LocalScope16Pilot.record_182
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t183\t{now}"
      handle.flush
noncomputable def record_183 : SourceCertificate :=
  LocalScope16Pilot.record_183
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t184\t{now}"
      handle.flush
noncomputable def record_184 : SourceCertificate :=
  LocalScope16Pilot.record_184
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t185\t{now}"
      handle.flush
noncomputable def record_185 : SourceCertificate :=
  LocalScope16Pilot.record_185
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t186\t{now}"
      handle.flush
noncomputable def record_186 : SourceCertificate :=
  LocalScope16Pilot.record_186
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t187\t{now}"
      handle.flush
noncomputable def record_187 : SourceCertificate :=
  LocalScope16Pilot.record_187
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t188\t{now}"
      handle.flush
noncomputable def record_188 : SourceCertificate :=
  LocalScope16Pilot.record_188
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t189\t{now}"
      handle.flush
noncomputable def record_189 : SourceCertificate :=
  LocalScope16Pilot.record_189
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t190\t{now}"
      handle.flush
noncomputable def record_190 : SourceCertificate :=
  LocalScope16Pilot.record_190
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t191\t{now}"
      handle.flush
noncomputable def record_191 : SourceCertificate :=
  LocalScope16Pilot.record_191
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t192\t{now}"
      handle.flush
noncomputable def record_192 : SourceCertificate :=
  LocalScope16Pilot.record_192
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t193\t{now}"
      handle.flush
noncomputable def record_193 : SourceCertificate :=
  LocalScope16Pilot.record_193
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t194\t{now}"
      handle.flush
noncomputable def record_194 : SourceCertificate :=
  LocalScope16Pilot.record_194
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t195\t{now}"
      handle.flush
noncomputable def record_195 : SourceCertificate :=
  LocalScope16Pilot.record_195
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t196\t{now}"
      handle.flush
noncomputable def record_196 : SourceCertificate :=
  LocalScope16Pilot.record_196
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t197\t{now}"
      handle.flush
noncomputable def record_197 : SourceCertificate :=
  LocalScope16Pilot.record_197
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t198\t{now}"
      handle.flush
noncomputable def record_198 : SourceCertificate :=
  LocalScope16Pilot.record_198
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t199\t{now}"
      handle.flush
noncomputable def record_199 : SourceCertificate :=
  LocalScope16Pilot.record_199
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t200\t{now}"
      handle.flush
noncomputable def record_200 : SourceCertificate :=
  LocalScope16Pilot.record_200
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t201\t{now}"
      handle.flush
noncomputable def record_201 : SourceCertificate :=
  LocalScope16Pilot.record_201
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t202\t{now}"
      handle.flush
noncomputable def record_202 : SourceCertificate :=
  LocalScope16Pilot.record_202
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t203\t{now}"
      handle.flush
noncomputable def record_203 : SourceCertificate :=
  LocalScope16Pilot.record_203
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t204\t{now}"
      handle.flush
noncomputable def record_204 : SourceCertificate :=
  LocalScope16Pilot.record_204
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t205\t{now}"
      handle.flush
noncomputable def record_205 : SourceCertificate :=
  LocalScope16Pilot.record_205
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t206\t{now}"
      handle.flush
noncomputable def record_206 : SourceCertificate :=
  LocalScope16Pilot.record_206
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t207\t{now}"
      handle.flush
noncomputable def record_207 : SourceCertificate :=
  LocalScope16Pilot.record_207
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t208\t{now}"
      handle.flush
noncomputable def record_208 : SourceCertificate :=
  LocalScope16Pilot.record_208
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t209\t{now}"
      handle.flush
noncomputable def record_209 : SourceCertificate :=
  LocalScope16Pilot.record_209
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t210\t{now}"
      handle.flush
noncomputable def record_210 : SourceCertificate :=
  LocalScope16Pilot.record_210
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t211\t{now}"
      handle.flush
noncomputable def record_211 : SourceCertificate :=
  LocalScope16Pilot.record_211
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t212\t{now}"
      handle.flush
noncomputable def record_212 : SourceCertificate :=
  LocalScope16Pilot.record_212
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t213\t{now}"
      handle.flush
noncomputable def record_213 : SourceCertificate :=
  LocalScope16Pilot.record_213
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t214\t{now}"
      handle.flush
noncomputable def record_214 : SourceCertificate :=
  LocalScope16Pilot.record_214
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t215\t{now}"
      handle.flush
noncomputable def record_215 : SourceCertificate :=
  LocalScope16Pilot.record_215
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t216\t{now}"
      handle.flush
noncomputable def record_216 : SourceCertificate :=
  LocalScope16Pilot.record_216
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t217\t{now}"
      handle.flush
noncomputable def record_217 : SourceCertificate :=
  LocalScope16Pilot.record_217
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t218\t{now}"
      handle.flush
noncomputable def record_218 : SourceCertificate :=
  LocalScope16Pilot.record_218
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t219\t{now}"
      handle.flush
noncomputable def record_219 : SourceCertificate :=
  LocalScope16Pilot.record_219
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t220\t{now}"
      handle.flush
noncomputable def record_220 : SourceCertificate :=
  LocalScope16Pilot.record_220
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t221\t{now}"
      handle.flush
noncomputable def record_221 : SourceCertificate :=
  LocalScope16Pilot.record_221
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t222\t{now}"
      handle.flush
noncomputable def record_222 : SourceCertificate :=
  LocalScope16Pilot.record_222
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t223\t{now}"
      handle.flush
noncomputable def record_223 : SourceCertificate :=
  LocalScope16Pilot.record_223
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t224\t{now}"
      handle.flush
noncomputable def record_224 : SourceCertificate :=
  LocalScope16Pilot.record_224
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t225\t{now}"
      handle.flush
noncomputable def record_225 : SourceCertificate :=
  LocalScope16Pilot.record_225
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t226\t{now}"
      handle.flush
noncomputable def record_226 : SourceCertificate :=
  LocalScope16Pilot.record_226
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t227\t{now}"
      handle.flush
noncomputable def record_227 : SourceCertificate :=
  LocalScope16Pilot.record_227
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t228\t{now}"
      handle.flush
noncomputable def record_228 : SourceCertificate :=
  LocalScope16Pilot.record_228
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t229\t{now}"
      handle.flush
noncomputable def record_229 : SourceCertificate :=
  LocalScope16Pilot.record_229
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t230\t{now}"
      handle.flush
noncomputable def record_230 : SourceCertificate :=
  LocalScope16Pilot.record_230
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t231\t{now}"
      handle.flush
noncomputable def record_231 : SourceCertificate :=
  LocalScope16Pilot.record_231
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t232\t{now}"
      handle.flush
noncomputable def record_232 : SourceCertificate :=
  LocalScope16Pilot.record_232
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t233\t{now}"
      handle.flush
noncomputable def record_233 : SourceCertificate :=
  LocalScope16Pilot.record_233
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t234\t{now}"
      handle.flush
noncomputable def record_234 : SourceCertificate :=
  LocalScope16Pilot.record_234
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t235\t{now}"
      handle.flush
noncomputable def record_235 : SourceCertificate :=
  LocalScope16Pilot.record_235
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t236\t{now}"
      handle.flush
noncomputable def record_236 : SourceCertificate :=
  LocalScope16Pilot.record_236
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t237\t{now}"
      handle.flush
noncomputable def record_237 : SourceCertificate :=
  LocalScope16Pilot.record_237
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t238\t{now}"
      handle.flush
noncomputable def record_238 : SourceCertificate :=
  LocalScope16Pilot.record_238
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t239\t{now}"
      handle.flush
noncomputable def record_239 : SourceCertificate :=
  LocalScope16Pilot.record_239
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t240\t{now}"
      handle.flush
noncomputable def record_240 : SourceCertificate :=
  LocalScope16Pilot.record_240
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t241\t{now}"
      handle.flush
noncomputable def record_241 : SourceCertificate :=
  LocalScope16Pilot.record_241
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t242\t{now}"
      handle.flush
noncomputable def record_242 : SourceCertificate :=
  LocalScope16Pilot.record_242
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t243\t{now}"
      handle.flush
noncomputable def record_243 : SourceCertificate :=
  LocalScope16Pilot.record_243
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t244\t{now}"
      handle.flush
noncomputable def record_244 : SourceCertificate :=
  LocalScope16Pilot.record_244
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t245\t{now}"
      handle.flush
noncomputable def record_245 : SourceCertificate :=
  LocalScope16Pilot.record_245
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t246\t{now}"
      handle.flush
noncomputable def record_246 : SourceCertificate :=
  LocalScope16Pilot.record_246
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t247\t{now}"
      handle.flush
noncomputable def record_247 : SourceCertificate :=
  LocalScope16Pilot.record_247
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t248\t{now}"
      handle.flush
noncomputable def record_248 : SourceCertificate :=
  LocalScope16Pilot.record_248
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t249\t{now}"
      handle.flush
noncomputable def record_249 : SourceCertificate :=
  LocalScope16Pilot.record_249
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t250\t{now}"
      handle.flush
noncomputable def record_250 : SourceCertificate :=
  LocalScope16Pilot.record_250
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t251\t{now}"
      handle.flush
noncomputable def record_251 : SourceCertificate :=
  LocalScope16Pilot.record_251
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t252\t{now}"
      handle.flush
noncomputable def record_252 : SourceCertificate :=
  LocalScope16Pilot.record_252
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t253\t{now}"
      handle.flush
noncomputable def record_253 : SourceCertificate :=
  LocalScope16Pilot.record_253
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t254\t{now}"
      handle.flush
noncomputable def record_254 : SourceCertificate :=
  LocalScope16Pilot.record_254
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t255\t{now}"
      handle.flush
noncomputable def record_255 : SourceCertificate :=
  LocalScope16Pilot.record_255
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t256\t{now}"
      handle.flush
noncomputable def record_256 : SourceCertificate :=
  LocalScope16Pilot.record_256
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t257\t{now}"
      handle.flush
noncomputable def record_257 : SourceCertificate :=
  LocalScope16Pilot.record_257
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t258\t{now}"
      handle.flush
noncomputable def record_258 : SourceCertificate :=
  LocalScope16Pilot.record_258
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t259\t{now}"
      handle.flush
noncomputable def record_259 : SourceCertificate :=
  LocalScope16Pilot.record_259
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t260\t{now}"
      handle.flush
noncomputable def record_260 : SourceCertificate :=
  LocalScope16Pilot.record_260
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t261\t{now}"
      handle.flush
noncomputable def record_261 : SourceCertificate :=
  LocalScope16Pilot.record_261
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t262\t{now}"
      handle.flush
noncomputable def record_262 : SourceCertificate :=
  LocalScope16Pilot.record_262
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t263\t{now}"
      handle.flush
noncomputable def record_263 : SourceCertificate :=
  LocalScope16Pilot.record_263
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t264\t{now}"
      handle.flush
noncomputable def record_264 : SourceCertificate :=
  LocalScope16Pilot.record_264
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t265\t{now}"
      handle.flush
noncomputable def record_265 : SourceCertificate :=
  LocalScope16Pilot.record_265
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t266\t{now}"
      handle.flush
noncomputable def record_266 : SourceCertificate :=
  LocalScope16Pilot.record_266
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t267\t{now}"
      handle.flush
noncomputable def record_267 : SourceCertificate :=
  LocalScope16Pilot.record_267
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t268\t{now}"
      handle.flush
noncomputable def record_268 : SourceCertificate :=
  LocalScope16Pilot.record_268
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t269\t{now}"
      handle.flush
noncomputable def record_269 : SourceCertificate :=
  LocalScope16Pilot.record_269
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t270\t{now}"
      handle.flush
noncomputable def record_270 : SourceCertificate :=
  LocalScope16Pilot.record_270
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t271\t{now}"
      handle.flush
noncomputable def record_271 : SourceCertificate :=
  LocalScope16Pilot.record_271
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t272\t{now}"
      handle.flush
noncomputable def record_272 : SourceCertificate :=
  LocalScope16Pilot.record_272
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t273\t{now}"
      handle.flush
noncomputable def record_273 : SourceCertificate :=
  LocalScope16Pilot.record_273
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t274\t{now}"
      handle.flush
noncomputable def record_274 : SourceCertificate :=
  LocalScope16Pilot.record_274
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t275\t{now}"
      handle.flush
noncomputable def record_275 : SourceCertificate :=
  LocalScope16Pilot.record_275
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t276\t{now}"
      handle.flush
noncomputable def record_276 : SourceCertificate :=
  LocalScope16Pilot.record_276
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t277\t{now}"
      handle.flush
noncomputable def record_277 : SourceCertificate :=
  LocalScope16Pilot.record_277
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t278\t{now}"
      handle.flush
noncomputable def record_278 : SourceCertificate :=
  LocalScope16Pilot.record_278
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t279\t{now}"
      handle.flush
noncomputable def record_279 : SourceCertificate :=
  LocalScope16Pilot.record_279
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t280\t{now}"
      handle.flush
noncomputable def record_280 : SourceCertificate :=
  LocalScope16Pilot.record_280
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t281\t{now}"
      handle.flush
noncomputable def record_281 : SourceCertificate :=
  LocalScope16Pilot.record_281
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t282\t{now}"
      handle.flush
noncomputable def record_282 : SourceCertificate :=
  LocalScope16Pilot.record_282
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t283\t{now}"
      handle.flush
noncomputable def record_283 : SourceCertificate :=
  LocalScope16Pilot.record_283
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t284\t{now}"
      handle.flush
noncomputable def record_284 : SourceCertificate :=
  LocalScope16Pilot.record_284
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t285\t{now}"
      handle.flush
noncomputable def record_285 : SourceCertificate :=
  LocalScope16Pilot.record_285
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t286\t{now}"
      handle.flush
noncomputable def record_286 : SourceCertificate :=
  LocalScope16Pilot.record_286
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t287\t{now}"
      handle.flush
noncomputable def record_287 : SourceCertificate :=
  LocalScope16Pilot.record_287
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t288\t{now}"
      handle.flush
noncomputable def record_288 : SourceCertificate :=
  LocalScope16Pilot.record_288
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t289\t{now}"
      handle.flush
noncomputable def record_289 : SourceCertificate :=
  LocalScope16Pilot.record_289
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t290\t{now}"
      handle.flush
noncomputable def record_290 : SourceCertificate :=
  LocalScope16Pilot.record_290
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t291\t{now}"
      handle.flush
noncomputable def record_291 : SourceCertificate :=
  LocalScope16Pilot.record_291
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t292\t{now}"
      handle.flush
noncomputable def record_292 : SourceCertificate :=
  LocalScope16Pilot.record_292
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t293\t{now}"
      handle.flush
noncomputable def record_293 : SourceCertificate :=
  LocalScope16Pilot.record_293
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t294\t{now}"
      handle.flush
noncomputable def record_294 : SourceCertificate :=
  LocalScope16Pilot.record_294
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t295\t{now}"
      handle.flush
noncomputable def record_295 : SourceCertificate :=
  LocalScope16Pilot.record_295
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t296\t{now}"
      handle.flush
noncomputable def record_296 : SourceCertificate :=
  LocalScope16Pilot.record_296
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t297\t{now}"
      handle.flush
noncomputable def record_297 : SourceCertificate :=
  LocalScope16Pilot.record_297
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t298\t{now}"
      handle.flush
noncomputable def record_298 : SourceCertificate :=
  LocalScope16Pilot.record_298
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t299\t{now}"
      handle.flush
noncomputable def record_299 : SourceCertificate :=
  LocalScope16Pilot.record_299
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t300\t{now}"
      handle.flush
noncomputable def record_300 : SourceCertificate :=
  LocalScope16Pilot.record_300
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t301\t{now}"
      handle.flush
noncomputable def record_301 : SourceCertificate :=
  LocalScope16Pilot.record_301
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t302\t{now}"
      handle.flush
noncomputable def record_302 : SourceCertificate :=
  LocalScope16Pilot.record_302
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t303\t{now}"
      handle.flush
noncomputable def record_303 : SourceCertificate :=
  LocalScope16Pilot.record_303
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t304\t{now}"
      handle.flush
noncomputable def record_304 : SourceCertificate :=
  LocalScope16Pilot.record_304
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t305\t{now}"
      handle.flush
noncomputable def record_305 : SourceCertificate :=
  LocalScope16Pilot.record_305
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t306\t{now}"
      handle.flush
noncomputable def record_306 : SourceCertificate :=
  LocalScope16Pilot.record_306
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t307\t{now}"
      handle.flush
noncomputable def record_307 : SourceCertificate :=
  LocalScope16Pilot.record_307
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t308\t{now}"
      handle.flush
noncomputable def record_308 : SourceCertificate :=
  LocalScope16Pilot.record_308
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t309\t{now}"
      handle.flush
noncomputable def record_309 : SourceCertificate :=
  LocalScope16Pilot.record_309
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t310\t{now}"
      handle.flush
noncomputable def record_310 : SourceCertificate :=
  LocalScope16Pilot.record_310
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t311\t{now}"
      handle.flush
noncomputable def record_311 : SourceCertificate :=
  LocalScope16Pilot.record_311
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t312\t{now}"
      handle.flush
noncomputable def record_312 : SourceCertificate :=
  LocalScope16Pilot.record_312
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t313\t{now}"
      handle.flush
noncomputable def record_313 : SourceCertificate :=
  LocalScope16Pilot.record_313
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t314\t{now}"
      handle.flush
noncomputable def record_314 : SourceCertificate :=
  LocalScope16Pilot.record_314
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t315\t{now}"
      handle.flush
noncomputable def record_315 : SourceCertificate :=
  LocalScope16Pilot.record_315
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t316\t{now}"
      handle.flush
noncomputable def record_316 : SourceCertificate :=
  LocalScope16Pilot.record_316
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t317\t{now}"
      handle.flush
noncomputable def record_317 : SourceCertificate :=
  LocalScope16Pilot.record_317
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t318\t{now}"
      handle.flush
noncomputable def record_318 : SourceCertificate :=
  LocalScope16Pilot.record_318
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t319\t{now}"
      handle.flush
noncomputable def record_319 : SourceCertificate :=
  LocalScope16Pilot.record_319
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t320\t{now}"
      handle.flush
noncomputable def record_320 : SourceCertificate :=
  LocalScope16Pilot.record_320
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t321\t{now}"
      handle.flush
noncomputable def record_321 : SourceCertificate :=
  LocalScope16Pilot.record_321
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t322\t{now}"
      handle.flush
noncomputable def record_322 : SourceCertificate :=
  LocalScope16Pilot.record_322
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t323\t{now}"
      handle.flush
noncomputable def record_323 : SourceCertificate :=
  LocalScope16Pilot.record_323
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t324\t{now}"
      handle.flush
noncomputable def record_324 : SourceCertificate :=
  LocalScope16Pilot.record_324
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t325\t{now}"
      handle.flush
noncomputable def record_325 : SourceCertificate :=
  LocalScope16Pilot.record_325
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t326\t{now}"
      handle.flush
noncomputable def record_326 : SourceCertificate :=
  LocalScope16Pilot.record_326
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t327\t{now}"
      handle.flush
noncomputable def record_327 : SourceCertificate :=
  LocalScope16Pilot.record_327
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t328\t{now}"
      handle.flush
noncomputable def record_328 : SourceCertificate :=
  LocalScope16Pilot.record_328
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t329\t{now}"
      handle.flush
noncomputable def record_329 : SourceCertificate :=
  LocalScope16Pilot.record_329
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t330\t{now}"
      handle.flush
noncomputable def record_330 : SourceCertificate :=
  LocalScope16Pilot.record_330
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t331\t{now}"
      handle.flush
noncomputable def record_331 : SourceCertificate :=
  LocalScope16Pilot.record_331
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t332\t{now}"
      handle.flush
noncomputable def record_332 : SourceCertificate :=
  LocalScope16Pilot.record_332
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t333\t{now}"
      handle.flush
noncomputable def record_333 : SourceCertificate :=
  LocalScope16Pilot.record_333
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t334\t{now}"
      handle.flush
noncomputable def record_334 : SourceCertificate :=
  LocalScope16Pilot.record_334
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t335\t{now}"
      handle.flush
noncomputable def record_335 : SourceCertificate :=
  LocalScope16Pilot.record_335
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t336\t{now}"
      handle.flush
noncomputable def record_336 : SourceCertificate :=
  LocalScope16Pilot.record_336
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t337\t{now}"
      handle.flush
noncomputable def record_337 : SourceCertificate :=
  LocalScope16Pilot.record_337
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t338\t{now}"
      handle.flush
noncomputable def record_338 : SourceCertificate :=
  LocalScope16Pilot.record_338
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t339\t{now}"
      handle.flush
noncomputable def record_339 : SourceCertificate :=
  LocalScope16Pilot.record_339
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t340\t{now}"
      handle.flush
noncomputable def record_340 : SourceCertificate :=
  LocalScope16Pilot.record_340
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t341\t{now}"
      handle.flush
noncomputable def record_341 : SourceCertificate :=
  LocalScope16Pilot.record_341
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t342\t{now}"
      handle.flush
noncomputable def record_342 : SourceCertificate :=
  LocalScope16Pilot.record_342
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t343\t{now}"
      handle.flush
noncomputable def record_343 : SourceCertificate :=
  LocalScope16Pilot.record_343
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t344\t{now}"
      handle.flush
noncomputable def record_344 : SourceCertificate :=
  LocalScope16Pilot.record_344
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t345\t{now}"
      handle.flush
noncomputable def record_345 : SourceCertificate :=
  LocalScope16Pilot.record_345
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t346\t{now}"
      handle.flush
noncomputable def record_346 : SourceCertificate :=
  LocalScope16Pilot.record_346
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t347\t{now}"
      handle.flush
noncomputable def record_347 : SourceCertificate :=
  LocalScope16Pilot.record_347
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t348\t{now}"
      handle.flush
noncomputable def record_348 : SourceCertificate :=
  LocalScope16Pilot.record_348
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t349\t{now}"
      handle.flush
noncomputable def record_349 : SourceCertificate :=
  LocalScope16Pilot.record_349
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t350\t{now}"
      handle.flush
noncomputable def record_350 : SourceCertificate :=
  LocalScope16Pilot.record_350
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t351\t{now}"
      handle.flush
noncomputable def record_351 : SourceCertificate :=
  LocalScope16Pilot.record_351
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t352\t{now}"
      handle.flush
noncomputable def record_352 : SourceCertificate :=
  LocalScope16Pilot.record_352
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t353\t{now}"
      handle.flush
noncomputable def record_353 : SourceCertificate :=
  LocalScope16Pilot.record_353
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t354\t{now}"
      handle.flush
noncomputable def record_354 : SourceCertificate :=
  LocalScope16Pilot.record_354
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t355\t{now}"
      handle.flush
noncomputable def record_355 : SourceCertificate :=
  LocalScope16Pilot.record_355
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t356\t{now}"
      handle.flush
noncomputable def record_356 : SourceCertificate :=
  LocalScope16Pilot.record_356
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t357\t{now}"
      handle.flush
noncomputable def record_357 : SourceCertificate :=
  LocalScope16Pilot.record_357
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t358\t{now}"
      handle.flush
noncomputable def record_358 : SourceCertificate :=
  LocalScope16Pilot.record_358
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t359\t{now}"
      handle.flush
noncomputable def record_359 : SourceCertificate :=
  LocalScope16Pilot.record_359
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t360\t{now}"
      handle.flush
noncomputable def record_360 : SourceCertificate :=
  LocalScope16Pilot.record_360
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t361\t{now}"
      handle.flush
noncomputable def record_361 : SourceCertificate :=
  LocalScope16Pilot.record_361
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t362\t{now}"
      handle.flush
noncomputable def record_362 : SourceCertificate :=
  LocalScope16Pilot.record_362
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t363\t{now}"
      handle.flush
noncomputable def record_363 : SourceCertificate :=
  LocalScope16Pilot.record_363
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t364\t{now}"
      handle.flush
noncomputable def record_364 : SourceCertificate :=
  LocalScope16Pilot.record_364
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t365\t{now}"
      handle.flush
noncomputable def record_365 : SourceCertificate :=
  LocalScope16Pilot.record_365
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t366\t{now}"
      handle.flush
noncomputable def record_366 : SourceCertificate :=
  LocalScope16Pilot.record_366
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t367\t{now}"
      handle.flush
noncomputable def record_367 : SourceCertificate :=
  LocalScope16Pilot.record_367
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t368\t{now}"
      handle.flush
noncomputable def record_368 : SourceCertificate :=
  LocalScope16Pilot.record_368
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t369\t{now}"
      handle.flush
noncomputable def record_369 : SourceCertificate :=
  LocalScope16Pilot.record_369
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t370\t{now}"
      handle.flush
noncomputable def record_370 : SourceCertificate :=
  LocalScope16Pilot.record_370
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t371\t{now}"
      handle.flush
noncomputable def record_371 : SourceCertificate :=
  LocalScope16Pilot.record_371
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t372\t{now}"
      handle.flush
noncomputable def record_372 : SourceCertificate :=
  LocalScope16Pilot.record_372
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t373\t{now}"
      handle.flush
noncomputable def record_373 : SourceCertificate :=
  LocalScope16Pilot.record_373
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t374\t{now}"
      handle.flush
noncomputable def record_374 : SourceCertificate :=
  LocalScope16Pilot.record_374
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t375\t{now}"
      handle.flush
noncomputable def record_375 : SourceCertificate :=
  LocalScope16Pilot.record_375
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t376\t{now}"
      handle.flush
noncomputable def record_376 : SourceCertificate :=
  LocalScope16Pilot.record_376
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t377\t{now}"
      handle.flush
noncomputable def record_377 : SourceCertificate :=
  LocalScope16Pilot.record_377
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t378\t{now}"
      handle.flush
noncomputable def record_378 : SourceCertificate :=
  LocalScope16Pilot.record_378
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t379\t{now}"
      handle.flush
noncomputable def record_379 : SourceCertificate :=
  LocalScope16Pilot.record_379
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t380\t{now}"
      handle.flush
noncomputable def record_380 : SourceCertificate :=
  LocalScope16Pilot.record_380
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t381\t{now}"
      handle.flush
noncomputable def record_381 : SourceCertificate :=
  LocalScope16Pilot.record_381
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t382\t{now}"
      handle.flush
noncomputable def record_382 : SourceCertificate :=
  LocalScope16Pilot.record_382
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t383\t{now}"
      handle.flush
noncomputable def record_383 : SourceCertificate :=
  LocalScope16Pilot.record_383
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t384\t{now}"
      handle.flush
noncomputable def record_384 : SourceCertificate :=
  LocalScope16Pilot.record_384
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t385\t{now}"
      handle.flush
noncomputable def record_385 : SourceCertificate :=
  LocalScope16Pilot.record_385
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t386\t{now}"
      handle.flush
noncomputable def record_386 : SourceCertificate :=
  LocalScope16Pilot.record_386
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t387\t{now}"
      handle.flush
noncomputable def record_387 : SourceCertificate :=
  LocalScope16Pilot.record_387
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t388\t{now}"
      handle.flush
noncomputable def record_388 : SourceCertificate :=
  LocalScope16Pilot.record_388
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t389\t{now}"
      handle.flush
noncomputable def record_389 : SourceCertificate :=
  LocalScope16Pilot.record_389
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t390\t{now}"
      handle.flush
noncomputable def record_390 : SourceCertificate :=
  LocalScope16Pilot.record_390
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t391\t{now}"
      handle.flush
noncomputable def record_391 : SourceCertificate :=
  LocalScope16Pilot.record_391
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t392\t{now}"
      handle.flush
noncomputable def record_392 : SourceCertificate :=
  LocalScope16Pilot.record_392
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t393\t{now}"
      handle.flush
noncomputable def record_393 : SourceCertificate :=
  LocalScope16Pilot.record_393
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t394\t{now}"
      handle.flush
noncomputable def record_394 : SourceCertificate :=
  LocalScope16Pilot.record_394
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t395\t{now}"
      handle.flush
noncomputable def record_395 : SourceCertificate :=
  LocalScope16Pilot.record_395
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t396\t{now}"
      handle.flush
noncomputable def record_396 : SourceCertificate :=
  LocalScope16Pilot.record_396
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t397\t{now}"
      handle.flush
noncomputable def record_397 : SourceCertificate :=
  LocalScope16Pilot.record_397
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t398\t{now}"
      handle.flush
noncomputable def record_398 : SourceCertificate :=
  LocalScope16Pilot.record_398
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t399\t{now}"
      handle.flush
noncomputable def record_399 : SourceCertificate :=
  LocalScope16Pilot.record_399
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t400\t{now}"
      handle.flush
noncomputable def record_400 : SourceCertificate :=
  LocalScope16Pilot.record_400
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t401\t{now}"
      handle.flush
noncomputable def record_401 : SourceCertificate :=
  LocalScope16Pilot.record_401
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t402\t{now}"
      handle.flush
noncomputable def record_402 : SourceCertificate :=
  LocalScope16Pilot.record_402
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t403\t{now}"
      handle.flush
noncomputable def record_403 : SourceCertificate :=
  LocalScope16Pilot.record_403
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t404\t{now}"
      handle.flush
noncomputable def record_404 : SourceCertificate :=
  LocalScope16Pilot.record_404
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t405\t{now}"
      handle.flush
noncomputable def record_405 : SourceCertificate :=
  LocalScope16Pilot.record_405
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t406\t{now}"
      handle.flush
noncomputable def record_406 : SourceCertificate :=
  LocalScope16Pilot.record_406
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t407\t{now}"
      handle.flush
noncomputable def record_407 : SourceCertificate :=
  LocalScope16Pilot.record_407
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t408\t{now}"
      handle.flush
noncomputable def record_408 : SourceCertificate :=
  LocalScope16Pilot.record_408
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t409\t{now}"
      handle.flush
noncomputable def record_409 : SourceCertificate :=
  LocalScope16Pilot.record_409
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t410\t{now}"
      handle.flush
noncomputable def record_410 : SourceCertificate :=
  LocalScope16Pilot.record_410
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t411\t{now}"
      handle.flush
noncomputable def record_411 : SourceCertificate :=
  LocalScope16Pilot.record_411
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t412\t{now}"
      handle.flush
noncomputable def record_412 : SourceCertificate :=
  LocalScope16Pilot.record_412
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t413\t{now}"
      handle.flush
noncomputable def record_413 : SourceCertificate :=
  LocalScope16Pilot.record_413
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t414\t{now}"
      handle.flush
noncomputable def record_414 : SourceCertificate :=
  LocalScope16Pilot.record_414
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t415\t{now}"
      handle.flush
noncomputable def record_415 : SourceCertificate :=
  LocalScope16Pilot.record_415
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t416\t{now}"
      handle.flush
noncomputable def record_416 : SourceCertificate :=
  LocalScope16Pilot.record_416
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t417\t{now}"
      handle.flush
noncomputable def record_417 : SourceCertificate :=
  LocalScope16Pilot.record_417
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t418\t{now}"
      handle.flush
noncomputable def record_418 : SourceCertificate :=
  LocalScope16Pilot.record_418
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t419\t{now}"
      handle.flush
noncomputable def record_419 : SourceCertificate :=
  LocalScope16Pilot.record_419
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t420\t{now}"
      handle.flush
noncomputable def record_420 : SourceCertificate :=
  LocalScope16Pilot.record_420
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t421\t{now}"
      handle.flush
noncomputable def record_421 : SourceCertificate :=
  LocalScope16Pilot.record_421
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t422\t{now}"
      handle.flush
noncomputable def record_422 : SourceCertificate :=
  LocalScope16Pilot.record_422
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t423\t{now}"
      handle.flush
noncomputable def record_423 : SourceCertificate :=
  LocalScope16Pilot.record_423
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t424\t{now}"
      handle.flush
noncomputable def record_424 : SourceCertificate :=
  LocalScope16Pilot.record_424
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t425\t{now}"
      handle.flush
noncomputable def record_425 : SourceCertificate :=
  LocalScope16Pilot.record_425
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t426\t{now}"
      handle.flush
noncomputable def record_426 : SourceCertificate :=
  LocalScope16Pilot.record_426
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t427\t{now}"
      handle.flush
noncomputable def record_427 : SourceCertificate :=
  LocalScope16Pilot.record_427
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t428\t{now}"
      handle.flush
noncomputable def record_428 : SourceCertificate :=
  LocalScope16Pilot.record_428
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t429\t{now}"
      handle.flush
noncomputable def record_429 : SourceCertificate :=
  LocalScope16Pilot.record_429
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t430\t{now}"
      handle.flush
noncomputable def record_430 : SourceCertificate :=
  LocalScope16Pilot.record_430
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t431\t{now}"
      handle.flush
noncomputable def record_431 : SourceCertificate :=
  LocalScope16Pilot.record_431
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t432\t{now}"
      handle.flush
noncomputable def record_432 : SourceCertificate :=
  LocalScope16Pilot.record_432
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t433\t{now}"
      handle.flush
noncomputable def record_433 : SourceCertificate :=
  LocalScope16Pilot.record_433
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t434\t{now}"
      handle.flush
noncomputable def record_434 : SourceCertificate :=
  LocalScope16Pilot.record_434
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t435\t{now}"
      handle.flush
noncomputable def record_435 : SourceCertificate :=
  LocalScope16Pilot.record_435
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t436\t{now}"
      handle.flush
noncomputable def record_436 : SourceCertificate :=
  LocalScope16Pilot.record_436
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t437\t{now}"
      handle.flush
noncomputable def record_437 : SourceCertificate :=
  LocalScope16Pilot.record_437
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t438\t{now}"
      handle.flush
noncomputable def record_438 : SourceCertificate :=
  LocalScope16Pilot.record_438
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t439\t{now}"
      handle.flush
noncomputable def record_439 : SourceCertificate :=
  LocalScope16Pilot.record_439
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t440\t{now}"
      handle.flush
noncomputable def record_440 : SourceCertificate :=
  LocalScope16Pilot.record_440
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t441\t{now}"
      handle.flush
noncomputable def record_441 : SourceCertificate :=
  LocalScope16Pilot.record_441
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t442\t{now}"
      handle.flush
noncomputable def record_442 : SourceCertificate :=
  LocalScope16Pilot.record_442
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t443\t{now}"
      handle.flush
noncomputable def record_443 : SourceCertificate :=
  LocalScope16Pilot.record_443
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t444\t{now}"
      handle.flush
noncomputable def record_444 : SourceCertificate :=
  LocalScope16Pilot.record_444
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t445\t{now}"
      handle.flush
noncomputable def record_445 : SourceCertificate :=
  LocalScope16Pilot.record_445
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t446\t{now}"
      handle.flush
noncomputable def record_446 : SourceCertificate :=
  LocalScope16Pilot.record_446
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t447\t{now}"
      handle.flush
noncomputable def record_447 : SourceCertificate :=
  LocalScope16Pilot.record_447
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t448\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t448\t{now}"
      handle.flush
def label_448 : Fin 4042 := ⟨448, by decide +kernel⟩
noncomputable def raw_448 : RawOp :=
  RawOp.absent
    bounded_4_3
    445
    447
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t448\t{now}"
      handle.flush
noncomputable def record_448 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_448 raw_448
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t449\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t449\t{now}"
      handle.flush
def label_449 : Fin 4042 := ⟨449, by decide +kernel⟩
noncomputable def raw_449 : RawOp :=
  RawOp.jump
    ⟨#[
      2270,
      2270,
      2270,
      2270,
      2270
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t449\t{now}"
      handle.flush
noncomputable def record_449 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_449 raw_449
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t450\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t450\t{now}"
      handle.flush
def label_450 : Fin 4042 := ⟨450, by decide +kernel⟩
noncomputable def raw_450 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    449
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t450\t{now}"
      handle.flush
noncomputable def record_450 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_450 raw_450
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t451\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t451\t{now}"
      handle.flush
def label_451 : Fin 4042 := ⟨451, by decide +kernel⟩
noncomputable def raw_451 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    449
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t451\t{now}"
      handle.flush
noncomputable def record_451 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_451 raw_451
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t452\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t452\t{now}"
      handle.flush
def label_452 : Fin 4042 := ⟨452, by decide +kernel⟩
noncomputable def raw_452 : RawOp :=
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
    451
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t452\t{now}"
      handle.flush
noncomputable def record_452 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_452 raw_452
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t453\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t453\t{now}"
      handle.flush
def label_453 : Fin 4042 := ⟨453, by decide +kernel⟩
noncomputable def raw_453 : RawOp :=
  RawOp.move
    Dir.left
    452
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t453\t{now}"
      handle.flush
noncomputable def record_453 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_453 raw_453
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t454\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t454\t{now}"
      handle.flush
def label_454 : Fin 4042 := ⟨454, by decide +kernel⟩
noncomputable def raw_454 : RawOp :=
  RawOp.marker
    450
    453
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t454\t{now}"
      handle.flush
noncomputable def record_454 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_454 raw_454
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t455\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t455\t{now}"
      handle.flush
def label_455 : Fin 4042 := ⟨455, by decide +kernel⟩
noncomputable def raw_455 : RawOp :=
  RawOp.move
    Dir.right
    32
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t455\t{now}"
      handle.flush
noncomputable def record_455 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_455 raw_455
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t456\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t456\t{now}"
      handle.flush
def label_456 : Fin 4042 := ⟨456, by decide +kernel⟩
noncomputable def raw_456 : RawOp :=
  RawOp.absent
    bounded_4_1
    454
    455
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t456\t{now}"
      handle.flush
noncomputable def record_456 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_456 raw_456
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t457\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t457\t{now}"
      handle.flush
def label_457 : Fin 4042 := ⟨457, by decide +kernel⟩
noncomputable def raw_457 : RawOp :=
  RawOp.jump
    ⟨#[
      2264,
      2264,
      2264,
      2264,
      2264
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t457\t{now}"
      handle.flush
noncomputable def record_457 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_457 raw_457
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t458\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t458\t{now}"
      handle.flush
def label_458 : Fin 4042 := ⟨458, by decide +kernel⟩
noncomputable def raw_458 : RawOp :=
  RawOp.move
    Dir.right
    457
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t458\t{now}"
      handle.flush
noncomputable def record_458 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_458 raw_458
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t459\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t459\t{now}"
      handle.flush
def label_459 : Fin 4042 := ⟨459, by decide +kernel⟩
noncomputable def raw_459 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    458
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t459\t{now}"
      handle.flush
noncomputable def record_459 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_459 raw_459
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t460\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t460\t{now}"
      handle.flush
def label_460 : Fin 4042 := ⟨460, by decide +kernel⟩
noncomputable def raw_460 : RawOp :=
  RawOp.jump
    ⟨#[
      462,
      462,
      462,
      462,
      462
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t460\t{now}"
      handle.flush
noncomputable def record_460 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_460 raw_460
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t461\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t461\t{now}"
      handle.flush
def label_461 : Fin 4042 := ⟨461, by decide +kernel⟩
noncomputable def raw_461 : RawOp :=
  RawOp.move
    Dir.right
    460
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t461\t{now}"
      handle.flush
noncomputable def record_461 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_461 raw_461
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t462\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t462\t{now}"
      handle.flush
def label_462 : Fin 4042 := ⟨462, by decide +kernel⟩
noncomputable def raw_462 : RawOp :=
  RawOp.absent
    bounded_4_1
    459
    461
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t462\t{now}"
      handle.flush
noncomputable def record_462 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_462 raw_462
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t463\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t463\t{now}"
      handle.flush
def label_463 : Fin 4042 := ⟨463, by decide +kernel⟩
noncomputable def raw_463 : RawOp :=
  RawOp.jump
    ⟨#[
      2283,
      2283,
      2283,
      2283,
      2283
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t463\t{now}"
      handle.flush
noncomputable def record_463 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_463 raw_463
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t464\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t464\t{now}"
      handle.flush
def label_464 : Fin 4042 := ⟨464, by decide +kernel⟩
noncomputable def raw_464 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    463
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t464\t{now}"
      handle.flush
noncomputable def record_464 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_464 raw_464
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t465\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t465\t{now}"
      handle.flush
def label_465 : Fin 4042 := ⟨465, by decide +kernel⟩
noncomputable def raw_465 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    463
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t465\t{now}"
      handle.flush
noncomputable def record_465 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_465 raw_465
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t466\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t466\t{now}"
      handle.flush
def label_466 : Fin 4042 := ⟨466, by decide +kernel⟩
noncomputable def raw_466 : RawOp :=
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
    465
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t466\t{now}"
      handle.flush
noncomputable def record_466 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_466 raw_466
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t467\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t467\t{now}"
      handle.flush
def label_467 : Fin 4042 := ⟨467, by decide +kernel⟩
noncomputable def raw_467 : RawOp :=
  RawOp.move
    Dir.left
    466
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t467\t{now}"
      handle.flush
noncomputable def record_467 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_467 raw_467
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t468\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t468\t{now}"
      handle.flush
def label_468 : Fin 4042 := ⟨468, by decide +kernel⟩
noncomputable def raw_468 : RawOp :=
  RawOp.marker
    464
    467
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t468\t{now}"
      handle.flush
noncomputable def record_468 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_468 raw_468
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t469\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t469\t{now}"
      handle.flush
def label_469 : Fin 4042 := ⟨469, by decide +kernel⟩
noncomputable def raw_469 : RawOp :=
  RawOp.move
    Dir.right
    33
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t469\t{now}"
      handle.flush
noncomputable def record_469 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_469 raw_469
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t470\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t470\t{now}"
      handle.flush
def label_470 : Fin 4042 := ⟨470, by decide +kernel⟩
noncomputable def raw_470 : RawOp :=
  RawOp.absent
    bounded_4_2
    468
    469
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t470\t{now}"
      handle.flush
noncomputable def record_470 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_470 raw_470
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t471\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t471\t{now}"
      handle.flush
def label_471 : Fin 4042 := ⟨471, by decide +kernel⟩
noncomputable def raw_471 : RawOp :=
  RawOp.jump
    ⟨#[
      2288,
      2288,
      2288,
      2288,
      2288
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t471\t{now}"
      handle.flush
noncomputable def record_471 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_471 raw_471
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t472\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t472\t{now}"
      handle.flush
def label_472 : Fin 4042 := ⟨472, by decide +kernel⟩
noncomputable def raw_472 : RawOp :=
  RawOp.move
    Dir.right
    471
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t472\t{now}"
      handle.flush
noncomputable def record_472 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_472 raw_472
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t473\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t473\t{now}"
      handle.flush
def label_473 : Fin 4042 := ⟨473, by decide +kernel⟩
noncomputable def raw_473 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    472
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t473\t{now}"
      handle.flush
noncomputable def record_473 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_473 raw_473
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t474\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t474\t{now}"
      handle.flush
def label_474 : Fin 4042 := ⟨474, by decide +kernel⟩
noncomputable def raw_474 : RawOp :=
  RawOp.move
    Dir.right
    34
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t474\t{now}"
      handle.flush
noncomputable def record_474 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_474 raw_474
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t475\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t475\t{now}"
      handle.flush
def label_475 : Fin 4042 := ⟨475, by decide +kernel⟩
noncomputable def raw_475 : RawOp :=
  RawOp.absent
    bounded_4_3
    473
    474
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t475\t{now}"
      handle.flush
noncomputable def record_475 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_475 raw_475
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t476\t{now}"
      handle.flush
def label_476 : Fin 4042 := ⟨476, by decide +kernel⟩
noncomputable def raw_476 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    472
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t476\t{now}"
      handle.flush
noncomputable def record_476 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_476 raw_476
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t477\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t477\t{now}"
      handle.flush
def label_477 : Fin 4042 := ⟨477, by decide +kernel⟩
noncomputable def raw_477 : RawOp :=
  RawOp.jump
    ⟨#[
      479,
      479,
      479,
      479,
      479
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t477\t{now}"
      handle.flush
noncomputable def record_477 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_477 raw_477
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t478\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t478\t{now}"
      handle.flush
def label_478 : Fin 4042 := ⟨478, by decide +kernel⟩
noncomputable def raw_478 : RawOp :=
  RawOp.move
    Dir.right
    477
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t478\t{now}"
      handle.flush
noncomputable def record_478 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_478 raw_478
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t479\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t479\t{now}"
      handle.flush
def label_479 : Fin 4042 := ⟨479, by decide +kernel⟩
noncomputable def raw_479 : RawOp :=
  RawOp.absent
    bounded_4_3
    476
    478
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t479\t{now}"
      handle.flush
noncomputable def record_479 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_479 raw_479
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t480\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t480\t{now}"
      handle.flush
def label_480 : Fin 4042 := ⟨480, by decide +kernel⟩
noncomputable def raw_480 : RawOp :=
  RawOp.jump
    ⟨#[
      2303,
      2303,
      2303,
      2303,
      2303
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t480\t{now}"
      handle.flush
noncomputable def record_480 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_480 raw_480
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t481\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t481\t{now}"
      handle.flush
def label_481 : Fin 4042 := ⟨481, by decide +kernel⟩
noncomputable def raw_481 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    480
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t481\t{now}"
      handle.flush
noncomputable def record_481 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_481 raw_481
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t482\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t482\t{now}"
      handle.flush
def label_482 : Fin 4042 := ⟨482, by decide +kernel⟩
noncomputable def raw_482 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    480
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t482\t{now}"
      handle.flush
noncomputable def record_482 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_482 raw_482
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t483\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t483\t{now}"
      handle.flush
def label_483 : Fin 4042 := ⟨483, by decide +kernel⟩
noncomputable def raw_483 : RawOp :=
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
    482
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t483\t{now}"
      handle.flush
noncomputable def record_483 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_483 raw_483
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t484\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t484\t{now}"
      handle.flush
def label_484 : Fin 4042 := ⟨484, by decide +kernel⟩
noncomputable def raw_484 : RawOp :=
  RawOp.move
    Dir.left
    483
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t484\t{now}"
      handle.flush
noncomputable def record_484 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_484 raw_484
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t485\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t485\t{now}"
      handle.flush
def label_485 : Fin 4042 := ⟨485, by decide +kernel⟩
noncomputable def raw_485 : RawOp :=
  RawOp.marker
    481
    484
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t485\t{now}"
      handle.flush
noncomputable def record_485 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_485 raw_485
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t486\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t486\t{now}"
      handle.flush
def label_486 : Fin 4042 := ⟨486, by decide +kernel⟩
noncomputable def raw_486 : RawOp :=
  RawOp.move
    Dir.right
    37
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t486\t{now}"
      handle.flush
noncomputable def record_486 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_486 raw_486
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t487\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t487\t{now}"
      handle.flush
def label_487 : Fin 4042 := ⟨487, by decide +kernel⟩
noncomputable def raw_487 : RawOp :=
  RawOp.absent
    bounded_4_1
    485
    486
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t487\t{now}"
      handle.flush
noncomputable def record_487 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_487 raw_487
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t488\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t488\t{now}"
      handle.flush
def label_488 : Fin 4042 := ⟨488, by decide +kernel⟩
noncomputable def raw_488 : RawOp :=
  RawOp.jump
    ⟨#[
      2297,
      2297,
      2297,
      2297,
      2297
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t488\t{now}"
      handle.flush
noncomputable def record_488 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_488 raw_488
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t489\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t489\t{now}"
      handle.flush
def label_489 : Fin 4042 := ⟨489, by decide +kernel⟩
noncomputable def raw_489 : RawOp :=
  RawOp.move
    Dir.right
    488
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t489\t{now}"
      handle.flush
noncomputable def record_489 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_489 raw_489
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t490\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t490\t{now}"
      handle.flush
def label_490 : Fin 4042 := ⟨490, by decide +kernel⟩
noncomputable def raw_490 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    489
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t490\t{now}"
      handle.flush
noncomputable def record_490 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_490 raw_490
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t491\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t491\t{now}"
      handle.flush
def label_491 : Fin 4042 := ⟨491, by decide +kernel⟩
noncomputable def raw_491 : RawOp :=
  RawOp.jump
    ⟨#[
      493,
      493,
      493,
      493,
      493
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t491\t{now}"
      handle.flush
noncomputable def record_491 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_491 raw_491
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t492\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t492\t{now}"
      handle.flush
def label_492 : Fin 4042 := ⟨492, by decide +kernel⟩
noncomputable def raw_492 : RawOp :=
  RawOp.move
    Dir.right
    491
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t492\t{now}"
      handle.flush
noncomputable def record_492 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_492 raw_492
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t493\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t493\t{now}"
      handle.flush
def label_493 : Fin 4042 := ⟨493, by decide +kernel⟩
noncomputable def raw_493 : RawOp :=
  RawOp.absent
    bounded_4_1
    490
    492
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t493\t{now}"
      handle.flush
noncomputable def record_493 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_493 raw_493
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t494\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t494\t{now}"
      handle.flush
def label_494 : Fin 4042 := ⟨494, by decide +kernel⟩
noncomputable def raw_494 : RawOp :=
  RawOp.jump
    ⟨#[
      2316,
      2316,
      2316,
      2316,
      2316
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t494\t{now}"
      handle.flush
noncomputable def record_494 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_494 raw_494
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t495\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t495\t{now}"
      handle.flush
def label_495 : Fin 4042 := ⟨495, by decide +kernel⟩
noncomputable def raw_495 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    494
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t495\t{now}"
      handle.flush
noncomputable def record_495 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_495 raw_495
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t496\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t496\t{now}"
      handle.flush
def label_496 : Fin 4042 := ⟨496, by decide +kernel⟩
noncomputable def raw_496 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    494
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t496\t{now}"
      handle.flush
noncomputable def record_496 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_496 raw_496
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t497\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t497\t{now}"
      handle.flush
def label_497 : Fin 4042 := ⟨497, by decide +kernel⟩
noncomputable def raw_497 : RawOp :=
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
    496
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t497\t{now}"
      handle.flush
noncomputable def record_497 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_497 raw_497
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t498\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t498\t{now}"
      handle.flush
def label_498 : Fin 4042 := ⟨498, by decide +kernel⟩
noncomputable def raw_498 : RawOp :=
  RawOp.move
    Dir.left
    497
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t498\t{now}"
      handle.flush
noncomputable def record_498 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_498 raw_498
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t499\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t499\t{now}"
      handle.flush
def label_499 : Fin 4042 := ⟨499, by decide +kernel⟩
noncomputable def raw_499 : RawOp :=
  RawOp.marker
    495
    498
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t499\t{now}"
      handle.flush
noncomputable def record_499 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_499 raw_499
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t500\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t500\t{now}"
      handle.flush
def label_500 : Fin 4042 := ⟨500, by decide +kernel⟩
noncomputable def raw_500 : RawOp :=
  RawOp.move
    Dir.right
    38
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t500\t{now}"
      handle.flush
noncomputable def record_500 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_500 raw_500
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t501\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t501\t{now}"
      handle.flush
def label_501 : Fin 4042 := ⟨501, by decide +kernel⟩
noncomputable def raw_501 : RawOp :=
  RawOp.absent
    bounded_4_2
    499
    500
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t501\t{now}"
      handle.flush
noncomputable def record_501 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_501 raw_501
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t502\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t502\t{now}"
      handle.flush
def label_502 : Fin 4042 := ⟨502, by decide +kernel⟩
noncomputable def raw_502 : RawOp :=
  RawOp.jump
    ⟨#[
      2321,
      2321,
      2321,
      2321,
      2321
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t502\t{now}"
      handle.flush
noncomputable def record_502 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_502 raw_502
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t503\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t503\t{now}"
      handle.flush
def label_503 : Fin 4042 := ⟨503, by decide +kernel⟩
noncomputable def raw_503 : RawOp :=
  RawOp.move
    Dir.right
    502
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t503\t{now}"
      handle.flush
noncomputable def record_503 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_503 raw_503
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t504\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t504\t{now}"
      handle.flush
def label_504 : Fin 4042 := ⟨504, by decide +kernel⟩
noncomputable def raw_504 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    503
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t504\t{now}"
      handle.flush
noncomputable def record_504 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_504 raw_504
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t505\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t505\t{now}"
      handle.flush
def label_505 : Fin 4042 := ⟨505, by decide +kernel⟩
noncomputable def raw_505 : RawOp :=
  RawOp.move
    Dir.right
    39
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t505\t{now}"
      handle.flush
noncomputable def record_505 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_505 raw_505
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t506\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t506\t{now}"
      handle.flush
def label_506 : Fin 4042 := ⟨506, by decide +kernel⟩
noncomputable def raw_506 : RawOp :=
  RawOp.absent
    bounded_4_3
    504
    505
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t506\t{now}"
      handle.flush
noncomputable def record_506 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_506 raw_506
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t507\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t507\t{now}"
      handle.flush
def label_507 : Fin 4042 := ⟨507, by decide +kernel⟩
noncomputable def raw_507 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    503
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t507\t{now}"
      handle.flush
noncomputable def record_507 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_507 raw_507
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t508\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t508\t{now}"
      handle.flush
def label_508 : Fin 4042 := ⟨508, by decide +kernel⟩
noncomputable def raw_508 : RawOp :=
  RawOp.jump
    ⟨#[
      510,
      510,
      510,
      510,
      510
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t508\t{now}"
      handle.flush
noncomputable def record_508 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_508 raw_508
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t509\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t509\t{now}"
      handle.flush
def label_509 : Fin 4042 := ⟨509, by decide +kernel⟩
noncomputable def raw_509 : RawOp :=
  RawOp.move
    Dir.right
    508
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t509\t{now}"
      handle.flush
noncomputable def record_509 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_509 raw_509
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t510\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t510\t{now}"
      handle.flush
def label_510 : Fin 4042 := ⟨510, by decide +kernel⟩
noncomputable def raw_510 : RawOp :=
  RawOp.absent
    bounded_4_3
    507
    509
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t510\t{now}"
      handle.flush
noncomputable def record_510 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_510 raw_510
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t511\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t511\t{now}"
      handle.flush
def label_511 : Fin 4042 := ⟨511, by decide +kernel⟩
noncomputable def raw_511 : RawOp :=
  RawOp.jump
    ⟨#[
      2333,
      2333,
      2333,
      2333,
      2333
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t511\t{now}"
      handle.flush
noncomputable def record_511 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_511 raw_511
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t512\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t512\t{now}"
      handle.flush
def label_512 : Fin 4042 := ⟨512, by decide +kernel⟩
noncomputable def raw_512 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    511
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t512\t{now}"
      handle.flush
noncomputable def record_512 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_512 raw_512
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t513\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t513\t{now}"
      handle.flush
def label_513 : Fin 4042 := ⟨513, by decide +kernel⟩
noncomputable def raw_513 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    511
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t513\t{now}"
      handle.flush
noncomputable def record_513 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_513 raw_513
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t514\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t514\t{now}"
      handle.flush
def label_514 : Fin 4042 := ⟨514, by decide +kernel⟩
noncomputable def raw_514 : RawOp :=
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
    513
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t514\t{now}"
      handle.flush
noncomputable def record_514 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_514 raw_514
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t515\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t515\t{now}"
      handle.flush
def label_515 : Fin 4042 := ⟨515, by decide +kernel⟩
noncomputable def raw_515 : RawOp :=
  RawOp.move
    Dir.left
    514
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t515\t{now}"
      handle.flush
noncomputable def record_515 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_515 raw_515
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t516\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t516\t{now}"
      handle.flush
def label_516 : Fin 4042 := ⟨516, by decide +kernel⟩
noncomputable def raw_516 : RawOp :=
  RawOp.marker
    512
    515
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t516\t{now}"
      handle.flush
noncomputable def record_516 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_516 raw_516
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t517\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t517\t{now}"
      handle.flush
def label_517 : Fin 4042 := ⟨517, by decide +kernel⟩
noncomputable def raw_517 : RawOp :=
  RawOp.move
    Dir.right
    42
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t517\t{now}"
      handle.flush
noncomputable def record_517 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_517 raw_517
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t518\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t518\t{now}"
      handle.flush
def label_518 : Fin 4042 := ⟨518, by decide +kernel⟩
noncomputable def raw_518 : RawOp :=
  RawOp.absent
    bounded_4_1
    516
    517
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t518\t{now}"
      handle.flush
noncomputable def record_518 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_518 raw_518
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t519\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t519\t{now}"
      handle.flush
def label_519 : Fin 4042 := ⟨519, by decide +kernel⟩
noncomputable def raw_519 : RawOp :=
  RawOp.jump
    ⟨#[
      2228,
      2228,
      2228,
      2228,
      2228
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t519\t{now}"
      handle.flush
noncomputable def record_519 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_519 raw_519
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t520\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t520\t{now}"
      handle.flush
def label_520 : Fin 4042 := ⟨520, by decide +kernel⟩
noncomputable def raw_520 : RawOp :=
  RawOp.move
    Dir.right
    519
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t520\t{now}"
      handle.flush
noncomputable def record_520 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_520 raw_520
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t521\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t521\t{now}"
      handle.flush
def label_521 : Fin 4042 := ⟨521, by decide +kernel⟩
noncomputable def raw_521 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    520
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t521\t{now}"
      handle.flush
noncomputable def record_521 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_521 raw_521
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t522\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t522\t{now}"
      handle.flush
def label_522 : Fin 4042 := ⟨522, by decide +kernel⟩
noncomputable def raw_522 : RawOp :=
  RawOp.jump
    ⟨#[
      524,
      524,
      524,
      524,
      524
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t522\t{now}"
      handle.flush
noncomputable def record_522 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_522 raw_522
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t523\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t523\t{now}"
      handle.flush
def label_523 : Fin 4042 := ⟨523, by decide +kernel⟩
noncomputable def raw_523 : RawOp :=
  RawOp.move
    Dir.right
    522
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t523\t{now}"
      handle.flush
noncomputable def record_523 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_523 raw_523
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t524\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t524\t{now}"
      handle.flush
def label_524 : Fin 4042 := ⟨524, by decide +kernel⟩
noncomputable def raw_524 : RawOp :=
  RawOp.absent
    bounded_4_1
    521
    523
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t524\t{now}"
      handle.flush
noncomputable def record_524 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_524 raw_524
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t525\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t525\t{now}"
      handle.flush
def label_525 : Fin 4042 := ⟨525, by decide +kernel⟩
noncomputable def raw_525 : RawOp :=
  RawOp.jump
    ⟨#[
      2346,
      2346,
      2346,
      2346,
      2346
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t525\t{now}"
      handle.flush
noncomputable def record_525 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_525 raw_525
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t526\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t526\t{now}"
      handle.flush
def label_526 : Fin 4042 := ⟨526, by decide +kernel⟩
noncomputable def raw_526 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    525
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t526\t{now}"
      handle.flush
noncomputable def record_526 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_526 raw_526
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t527\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t527\t{now}"
      handle.flush
def label_527 : Fin 4042 := ⟨527, by decide +kernel⟩
noncomputable def raw_527 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    525
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t527\t{now}"
      handle.flush
noncomputable def record_527 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_527 raw_527
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t528\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t528\t{now}"
      handle.flush
def label_528 : Fin 4042 := ⟨528, by decide +kernel⟩
noncomputable def raw_528 : RawOp :=
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
    527
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t528\t{now}"
      handle.flush
noncomputable def record_528 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_528 raw_528
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t529\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t529\t{now}"
      handle.flush
def label_529 : Fin 4042 := ⟨529, by decide +kernel⟩
noncomputable def raw_529 : RawOp :=
  RawOp.move
    Dir.left
    528
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t529\t{now}"
      handle.flush
noncomputable def record_529 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_529 raw_529
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t530\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t530\t{now}"
      handle.flush
def label_530 : Fin 4042 := ⟨530, by decide +kernel⟩
noncomputable def raw_530 : RawOp :=
  RawOp.marker
    526
    529
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t530\t{now}"
      handle.flush
noncomputable def record_530 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_530 raw_530
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t531\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t531\t{now}"
      handle.flush
def label_531 : Fin 4042 := ⟨531, by decide +kernel⟩
noncomputable def raw_531 : RawOp :=
  RawOp.move
    Dir.right
    43
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t531\t{now}"
      handle.flush
noncomputable def record_531 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_531 raw_531
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t532\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t532\t{now}"
      handle.flush
def label_532 : Fin 4042 := ⟨532, by decide +kernel⟩
noncomputable def raw_532 : RawOp :=
  RawOp.absent
    bounded_4_2
    530
    531
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t532\t{now}"
      handle.flush
noncomputable def record_532 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_532 raw_532
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t533\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t533\t{now}"
      handle.flush
def label_533 : Fin 4042 := ⟨533, by decide +kernel⟩
noncomputable def raw_533 : RawOp :=
  RawOp.jump
    ⟨#[
      2351,
      2351,
      2351,
      2351,
      2351
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t533\t{now}"
      handle.flush
noncomputable def record_533 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_533 raw_533
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t534\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t534\t{now}"
      handle.flush
def label_534 : Fin 4042 := ⟨534, by decide +kernel⟩
noncomputable def raw_534 : RawOp :=
  RawOp.move
    Dir.right
    533
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t534\t{now}"
      handle.flush
noncomputable def record_534 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_534 raw_534
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t535\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t535\t{now}"
      handle.flush
def label_535 : Fin 4042 := ⟨535, by decide +kernel⟩
noncomputable def raw_535 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    534
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t535\t{now}"
      handle.flush
noncomputable def record_535 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_535 raw_535
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t536\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t536\t{now}"
      handle.flush
def label_536 : Fin 4042 := ⟨536, by decide +kernel⟩
noncomputable def raw_536 : RawOp :=
  RawOp.move
    Dir.right
    44
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t536\t{now}"
      handle.flush
noncomputable def record_536 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_536 raw_536
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t537\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t537\t{now}"
      handle.flush
def label_537 : Fin 4042 := ⟨537, by decide +kernel⟩
noncomputable def raw_537 : RawOp :=
  RawOp.absent
    bounded_4_0
    535
    536
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t537\t{now}"
      handle.flush
noncomputable def record_537 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_537 raw_537
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t538\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t538\t{now}"
      handle.flush
def label_538 : Fin 4042 := ⟨538, by decide +kernel⟩
noncomputable def raw_538 : RawOp :=
  RawOp.jump
    ⟨#[
      2359,
      2359,
      2359,
      2359,
      2359
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t538\t{now}"
      handle.flush
noncomputable def record_538 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_538 raw_538
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t539\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t539\t{now}"
      handle.flush
def label_539 : Fin 4042 := ⟨539, by decide +kernel⟩
noncomputable def raw_539 : RawOp :=
  RawOp.move
    Dir.right
    538
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t539\t{now}"
      handle.flush
noncomputable def record_539 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_539 raw_539
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t540\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t540\t{now}"
      handle.flush
def label_540 : Fin 4042 := ⟨540, by decide +kernel⟩
noncomputable def raw_540 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    539
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t540\t{now}"
      handle.flush
noncomputable def record_540 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_540 raw_540
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t541\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t541\t{now}"
      handle.flush
def label_541 : Fin 4042 := ⟨541, by decide +kernel⟩
noncomputable def raw_541 : RawOp :=
  RawOp.move
    Dir.right
    47
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t541\t{now}"
      handle.flush
noncomputable def record_541 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_541 raw_541
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t542\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t542\t{now}"
      handle.flush
def label_542 : Fin 4042 := ⟨542, by decide +kernel⟩
noncomputable def raw_542 : RawOp :=
  RawOp.absent
    bounded_4_3
    540
    541
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t542\t{now}"
      handle.flush
noncomputable def record_542 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_542 raw_542
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t543\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t543\t{now}"
      handle.flush
def label_543 : Fin 4042 := ⟨543, by decide +kernel⟩
noncomputable def raw_543 : RawOp :=
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
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t543\t{now}"
      handle.flush
noncomputable def record_543 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_543 raw_543
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t544\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t544\t{now}"
      handle.flush
def label_544 : Fin 4042 := ⟨544, by decide +kernel⟩
noncomputable def raw_544 : RawOp :=
  RawOp.jump
    ⟨#[
      546,
      546,
      546,
      546,
      546
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t544\t{now}"
      handle.flush
noncomputable def record_544 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_544 raw_544
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t545\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t545\t{now}"
      handle.flush
def label_545 : Fin 4042 := ⟨545, by decide +kernel⟩
noncomputable def raw_545 : RawOp :=
  RawOp.move
    Dir.right
    544
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t545\t{now}"
      handle.flush
noncomputable def record_545 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_545 raw_545
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t546\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t546\t{now}"
      handle.flush
def label_546 : Fin 4042 := ⟨546, by decide +kernel⟩
noncomputable def raw_546 : RawOp :=
  RawOp.absent
    bounded_4_3
    543
    545
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t546\t{now}"
      handle.flush
noncomputable def record_546 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_546 raw_546
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t547\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t547\t{now}"
      handle.flush
def label_547 : Fin 4042 := ⟨547, by decide +kernel⟩
noncomputable def raw_547 : RawOp :=
  RawOp.jump
    ⟨#[
      2367,
      2367,
      2367,
      2367,
      2367
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t547\t{now}"
      handle.flush
noncomputable def record_547 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_547 raw_547
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t548\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t548\t{now}"
      handle.flush
def label_548 : Fin 4042 := ⟨548, by decide +kernel⟩
noncomputable def raw_548 : RawOp :=
  RawOp.move
    Dir.right
    547
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t548\t{now}"
      handle.flush
noncomputable def record_548 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_548 raw_548
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t549\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t549\t{now}"
      handle.flush
def label_549 : Fin 4042 := ⟨549, by decide +kernel⟩
noncomputable def raw_549 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    548
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t549\t{now}"
      handle.flush
noncomputable def record_549 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_549 raw_549
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t550\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t550\t{now}"
      handle.flush
def label_550 : Fin 4042 := ⟨550, by decide +kernel⟩
noncomputable def raw_550 : RawOp :=
  RawOp.jump
    ⟨#[
      552,
      552,
      552,
      552,
      552
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t550\t{now}"
      handle.flush
noncomputable def record_550 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_550 raw_550
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t551\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t551\t{now}"
      handle.flush
def label_551 : Fin 4042 := ⟨551, by decide +kernel⟩
noncomputable def raw_551 : RawOp :=
  RawOp.move
    Dir.right
    550
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t551\t{now}"
      handle.flush
noncomputable def record_551 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_551 raw_551
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t552\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t552\t{now}"
      handle.flush
def label_552 : Fin 4042 := ⟨552, by decide +kernel⟩
noncomputable def raw_552 : RawOp :=
  RawOp.absent
    bounded_4_0
    549
    551
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t552\t{now}"
      handle.flush
noncomputable def record_552 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_552 raw_552
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t553\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t553\t{now}"
      handle.flush
def label_553 : Fin 4042 := ⟨553, by decide +kernel⟩
noncomputable def raw_553 : RawOp :=
  RawOp.jump
    ⟨#[
      2376,
      2376,
      2376,
      2376,
      2376
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t553\t{now}"
      handle.flush
noncomputable def record_553 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_553 raw_553
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t554\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t554\t{now}"
      handle.flush
def label_554 : Fin 4042 := ⟨554, by decide +kernel⟩
noncomputable def raw_554 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    553
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t554\t{now}"
      handle.flush
noncomputable def record_554 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_554 raw_554
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t555\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t555\t{now}"
      handle.flush
def label_555 : Fin 4042 := ⟨555, by decide +kernel⟩
noncomputable def raw_555 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    553
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t555\t{now}"
      handle.flush
noncomputable def record_555 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_555 raw_555
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t556\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t556\t{now}"
      handle.flush
def label_556 : Fin 4042 := ⟨556, by decide +kernel⟩
noncomputable def raw_556 : RawOp :=
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
    555
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t556\t{now}"
      handle.flush
noncomputable def record_556 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_556 raw_556
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t557\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t557\t{now}"
      handle.flush
def label_557 : Fin 4042 := ⟨557, by decide +kernel⟩
noncomputable def raw_557 : RawOp :=
  RawOp.move
    Dir.left
    556
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t557\t{now}"
      handle.flush
noncomputable def record_557 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_557 raw_557
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t558\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t558\t{now}"
      handle.flush
def label_558 : Fin 4042 := ⟨558, by decide +kernel⟩
noncomputable def raw_558 : RawOp :=
  RawOp.marker
    554
    557
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t558\t{now}"
      handle.flush
noncomputable def record_558 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_558 raw_558
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t559\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t559\t{now}"
      handle.flush
def label_559 : Fin 4042 := ⟨559, by decide +kernel⟩
noncomputable def raw_559 : RawOp :=
  RawOp.move
    Dir.right
    50
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t559\t{now}"
      handle.flush
noncomputable def record_559 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_559 raw_559
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t560\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t560\t{now}"
      handle.flush
def label_560 : Fin 4042 := ⟨560, by decide +kernel⟩
noncomputable def raw_560 : RawOp :=
  RawOp.absent
    bounded_4_1
    558
    559
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t560\t{now}"
      handle.flush
noncomputable def record_560 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_560 raw_560
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t561\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t561\t{now}"
      handle.flush
def label_561 : Fin 4042 := ⟨561, by decide +kernel⟩
noncomputable def raw_561 : RawOp :=
  RawOp.jump
    ⟨#[
      2373,
      2373,
      2373,
      2373,
      2373
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t561\t{now}"
      handle.flush
noncomputable def record_561 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_561 raw_561
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t562\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t562\t{now}"
      handle.flush
def label_562 : Fin 4042 := ⟨562, by decide +kernel⟩
noncomputable def raw_562 : RawOp :=
  RawOp.move
    Dir.right
    561
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t562\t{now}"
      handle.flush
noncomputable def record_562 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_562 raw_562
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t563\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t563\t{now}"
      handle.flush
def label_563 : Fin 4042 := ⟨563, by decide +kernel⟩
noncomputable def raw_563 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    562
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t563\t{now}"
      handle.flush
noncomputable def record_563 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_563 raw_563
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t564\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t564\t{now}"
      handle.flush
def label_564 : Fin 4042 := ⟨564, by decide +kernel⟩
noncomputable def raw_564 : RawOp :=
  RawOp.jump
    ⟨#[
      566,
      566,
      566,
      566,
      566
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t564\t{now}"
      handle.flush
noncomputable def record_564 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_564 raw_564
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t565\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t565\t{now}"
      handle.flush
def label_565 : Fin 4042 := ⟨565, by decide +kernel⟩
noncomputable def raw_565 : RawOp :=
  RawOp.move
    Dir.right
    564
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t565\t{now}"
      handle.flush
noncomputable def record_565 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_565 raw_565
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t566\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t566\t{now}"
      handle.flush
def label_566 : Fin 4042 := ⟨566, by decide +kernel⟩
noncomputable def raw_566 : RawOp :=
  RawOp.absent
    bounded_4_1
    563
    565
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t566\t{now}"
      handle.flush
noncomputable def record_566 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_566 raw_566
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t567\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t567\t{now}"
      handle.flush
def label_567 : Fin 4042 := ⟨567, by decide +kernel⟩
noncomputable def raw_567 : RawOp :=
  RawOp.jump
    ⟨#[
      2389,
      2389,
      2389,
      2389,
      2389
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t567\t{now}"
      handle.flush
noncomputable def record_567 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_567 raw_567
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t568\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t568\t{now}"
      handle.flush
def label_568 : Fin 4042 := ⟨568, by decide +kernel⟩
noncomputable def raw_568 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    567
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t568\t{now}"
      handle.flush
noncomputable def record_568 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_568 raw_568
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t569\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t569\t{now}"
      handle.flush
def label_569 : Fin 4042 := ⟨569, by decide +kernel⟩
noncomputable def raw_569 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    567
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t569\t{now}"
      handle.flush
noncomputable def record_569 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_569 raw_569
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t570\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t570\t{now}"
      handle.flush
def label_570 : Fin 4042 := ⟨570, by decide +kernel⟩
noncomputable def raw_570 : RawOp :=
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
    569
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t570\t{now}"
      handle.flush
noncomputable def record_570 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_570 raw_570
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t571\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t571\t{now}"
      handle.flush
def label_571 : Fin 4042 := ⟨571, by decide +kernel⟩
noncomputable def raw_571 : RawOp :=
  RawOp.move
    Dir.left
    570
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t571\t{now}"
      handle.flush
noncomputable def record_571 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_571 raw_571
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t572\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t572\t{now}"
      handle.flush
def label_572 : Fin 4042 := ⟨572, by decide +kernel⟩
noncomputable def raw_572 : RawOp :=
  RawOp.marker
    568
    571
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t572\t{now}"
      handle.flush
noncomputable def record_572 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_572 raw_572
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t573\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t573\t{now}"
      handle.flush
def label_573 : Fin 4042 := ⟨573, by decide +kernel⟩
noncomputable def raw_573 : RawOp :=
  RawOp.move
    Dir.right
    51
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t573\t{now}"
      handle.flush
noncomputable def record_573 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_573 raw_573
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t574\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t574\t{now}"
      handle.flush
def label_574 : Fin 4042 := ⟨574, by decide +kernel⟩
noncomputable def raw_574 : RawOp :=
  RawOp.absent
    bounded_4_2
    572
    573
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t574\t{now}"
      handle.flush
noncomputable def record_574 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_574 raw_574
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t575\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t575\t{now}"
      handle.flush
def label_575 : Fin 4042 := ⟨575, by decide +kernel⟩
noncomputable def raw_575 : RawOp :=
  RawOp.jump
    ⟨#[
      2394,
      2394,
      2394,
      2394,
      2394
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t575\t{now}"
      handle.flush
noncomputable def record_575 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_575 raw_575
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t576\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t576\t{now}"
      handle.flush
def label_576 : Fin 4042 := ⟨576, by decide +kernel⟩
noncomputable def raw_576 : RawOp :=
  RawOp.move
    Dir.right
    575
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t576\t{now}"
      handle.flush
noncomputable def record_576 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_576 raw_576
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t577\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t577\t{now}"
      handle.flush
def label_577 : Fin 4042 := ⟨577, by decide +kernel⟩
noncomputable def raw_577 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    576
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t577\t{now}"
      handle.flush
noncomputable def record_577 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_577 raw_577
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t578\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t578\t{now}"
      handle.flush
def label_578 : Fin 4042 := ⟨578, by decide +kernel⟩
noncomputable def raw_578 : RawOp :=
  RawOp.move
    Dir.right
    52
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t578\t{now}"
      handle.flush
noncomputable def record_578 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_578 raw_578
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t579\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t579\t{now}"
      handle.flush
def label_579 : Fin 4042 := ⟨579, by decide +kernel⟩
noncomputable def raw_579 : RawOp :=
  RawOp.absent
    bounded_4_0
    577
    578
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t579\t{now}"
      handle.flush
noncomputable def record_579 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_579 raw_579
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t580\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t580\t{now}"
      handle.flush
def label_580 : Fin 4042 := ⟨580, by decide +kernel⟩
noncomputable def raw_580 : RawOp :=
  RawOp.jump
    ⟨#[
      2402,
      2402,
      2402,
      2402,
      2402
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t580\t{now}"
      handle.flush
noncomputable def record_580 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_580 raw_580
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t581\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t581\t{now}"
      handle.flush
def label_581 : Fin 4042 := ⟨581, by decide +kernel⟩
noncomputable def raw_581 : RawOp :=
  RawOp.move
    Dir.right
    580
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t581\t{now}"
      handle.flush
noncomputable def record_581 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_581 raw_581
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t582\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t582\t{now}"
      handle.flush
def label_582 : Fin 4042 := ⟨582, by decide +kernel⟩
noncomputable def raw_582 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    581
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t582\t{now}"
      handle.flush
noncomputable def record_582 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_582 raw_582
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t583\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t583\t{now}"
      handle.flush
def label_583 : Fin 4042 := ⟨583, by decide +kernel⟩
noncomputable def raw_583 : RawOp :=
  RawOp.move
    Dir.right
    55
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t583\t{now}"
      handle.flush
noncomputable def record_583 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_583 raw_583
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t584\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t584\t{now}"
      handle.flush
def label_584 : Fin 4042 := ⟨584, by decide +kernel⟩
noncomputable def raw_584 : RawOp :=
  RawOp.absent
    bounded_4_3
    582
    583
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t584\t{now}"
      handle.flush
noncomputable def record_584 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_584 raw_584
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t585\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t585\t{now}"
      handle.flush
def label_585 : Fin 4042 := ⟨585, by decide +kernel⟩
noncomputable def raw_585 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    581
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t585\t{now}"
      handle.flush
noncomputable def record_585 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_585 raw_585
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t586\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t586\t{now}"
      handle.flush
def label_586 : Fin 4042 := ⟨586, by decide +kernel⟩
noncomputable def raw_586 : RawOp :=
  RawOp.jump
    ⟨#[
      588,
      588,
      588,
      588,
      588
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t586\t{now}"
      handle.flush
noncomputable def record_586 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_586 raw_586
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t587\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t587\t{now}"
      handle.flush
def label_587 : Fin 4042 := ⟨587, by decide +kernel⟩
noncomputable def raw_587 : RawOp :=
  RawOp.move
    Dir.right
    586
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t587\t{now}"
      handle.flush
noncomputable def record_587 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_587 raw_587
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t588\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t588\t{now}"
      handle.flush
def label_588 : Fin 4042 := ⟨588, by decide +kernel⟩
noncomputable def raw_588 : RawOp :=
  RawOp.absent
    bounded_4_3
    585
    587
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t588\t{now}"
      handle.flush
noncomputable def record_588 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_588 raw_588
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t589\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t589\t{now}"
      handle.flush
def label_589 : Fin 4042 := ⟨589, by decide +kernel⟩
noncomputable def raw_589 : RawOp :=
  RawOp.jump
    ⟨#[
      2410,
      2410,
      2410,
      2410,
      2410
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t589\t{now}"
      handle.flush
noncomputable def record_589 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_589 raw_589
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t590\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t590\t{now}"
      handle.flush
def label_590 : Fin 4042 := ⟨590, by decide +kernel⟩
noncomputable def raw_590 : RawOp :=
  RawOp.move
    Dir.right
    589
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t590\t{now}"
      handle.flush
noncomputable def record_590 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_590 raw_590
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t591\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t591\t{now}"
      handle.flush
def label_591 : Fin 4042 := ⟨591, by decide +kernel⟩
noncomputable def raw_591 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    590
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t591\t{now}"
      handle.flush
noncomputable def record_591 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_591 raw_591
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t592\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t592\t{now}"
      handle.flush
def label_592 : Fin 4042 := ⟨592, by decide +kernel⟩
noncomputable def raw_592 : RawOp :=
  RawOp.jump
    ⟨#[
      594,
      594,
      594,
      594,
      594
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t592\t{now}"
      handle.flush
noncomputable def record_592 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_592 raw_592
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t593\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t593\t{now}"
      handle.flush
def label_593 : Fin 4042 := ⟨593, by decide +kernel⟩
noncomputable def raw_593 : RawOp :=
  RawOp.move
    Dir.right
    592
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t593\t{now}"
      handle.flush
noncomputable def record_593 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_593 raw_593
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t594\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t594\t{now}"
      handle.flush
def label_594 : Fin 4042 := ⟨594, by decide +kernel⟩
noncomputable def raw_594 : RawOp :=
  RawOp.absent
    bounded_4_0
    591
    593
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t594\t{now}"
      handle.flush
noncomputable def record_594 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_594 raw_594
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t595\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t595\t{now}"
      handle.flush
def label_595 : Fin 4042 := ⟨595, by decide +kernel⟩
noncomputable def raw_595 : RawOp :=
  RawOp.jump
    ⟨#[
      2419,
      2419,
      2419,
      2419,
      2419
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t595\t{now}"
      handle.flush
noncomputable def record_595 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_595 raw_595
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t596\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t596\t{now}"
      handle.flush
def label_596 : Fin 4042 := ⟨596, by decide +kernel⟩
noncomputable def raw_596 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    595
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t596\t{now}"
      handle.flush
noncomputable def record_596 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_596 raw_596
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t597\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t597\t{now}"
      handle.flush
def label_597 : Fin 4042 := ⟨597, by decide +kernel⟩
noncomputable def raw_597 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    595
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t597\t{now}"
      handle.flush
noncomputable def record_597 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_597 raw_597
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t598\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t598\t{now}"
      handle.flush
def label_598 : Fin 4042 := ⟨598, by decide +kernel⟩
noncomputable def raw_598 : RawOp :=
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
    597
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t598\t{now}"
      handle.flush
noncomputable def record_598 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_598 raw_598
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t599\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t599\t{now}"
      handle.flush
def label_599 : Fin 4042 := ⟨599, by decide +kernel⟩
noncomputable def raw_599 : RawOp :=
  RawOp.move
    Dir.left
    598
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t599\t{now}"
      handle.flush
noncomputable def record_599 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_599 raw_599
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t600\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t600\t{now}"
      handle.flush
def label_600 : Fin 4042 := ⟨600, by decide +kernel⟩
noncomputable def raw_600 : RawOp :=
  RawOp.marker
    596
    599
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t600\t{now}"
      handle.flush
noncomputable def record_600 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_600 raw_600
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t601\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t601\t{now}"
      handle.flush
def label_601 : Fin 4042 := ⟨601, by decide +kernel⟩
noncomputable def raw_601 : RawOp :=
  RawOp.move
    Dir.right
    58
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t601\t{now}"
      handle.flush
noncomputable def record_601 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_601 raw_601
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t602\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t602\t{now}"
      handle.flush
def label_602 : Fin 4042 := ⟨602, by decide +kernel⟩
noncomputable def raw_602 : RawOp :=
  RawOp.absent
    bounded_4_1
    600
    601
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t602\t{now}"
      handle.flush
noncomputable def record_602 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_602 raw_602
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t603\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t603\t{now}"
      handle.flush
def label_603 : Fin 4042 := ⟨603, by decide +kernel⟩
noncomputable def raw_603 : RawOp :=
  RawOp.jump
    ⟨#[
      2416,
      2416,
      2416,
      2416,
      2416
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t603\t{now}"
      handle.flush
noncomputable def record_603 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_603 raw_603
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t604\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t604\t{now}"
      handle.flush
def label_604 : Fin 4042 := ⟨604, by decide +kernel⟩
noncomputable def raw_604 : RawOp :=
  RawOp.move
    Dir.right
    603
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t604\t{now}"
      handle.flush
noncomputable def record_604 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_604 raw_604
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t605\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t605\t{now}"
      handle.flush
def label_605 : Fin 4042 := ⟨605, by decide +kernel⟩
noncomputable def raw_605 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    604
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t605\t{now}"
      handle.flush
noncomputable def record_605 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_605 raw_605
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t606\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t606\t{now}"
      handle.flush
def label_606 : Fin 4042 := ⟨606, by decide +kernel⟩
noncomputable def raw_606 : RawOp :=
  RawOp.jump
    ⟨#[
      608,
      608,
      608,
      608,
      608
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t606\t{now}"
      handle.flush
noncomputable def record_606 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_606 raw_606
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t607\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t607\t{now}"
      handle.flush
def label_607 : Fin 4042 := ⟨607, by decide +kernel⟩
noncomputable def raw_607 : RawOp :=
  RawOp.move
    Dir.right
    606
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t607\t{now}"
      handle.flush
noncomputable def record_607 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_607 raw_607
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t608\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t608\t{now}"
      handle.flush
def label_608 : Fin 4042 := ⟨608, by decide +kernel⟩
noncomputable def raw_608 : RawOp :=
  RawOp.absent
    bounded_4_1
    605
    607
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t608\t{now}"
      handle.flush
noncomputable def record_608 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_608 raw_608
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t609\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t609\t{now}"
      handle.flush
def label_609 : Fin 4042 := ⟨609, by decide +kernel⟩
noncomputable def raw_609 : RawOp :=
  RawOp.jump
    ⟨#[
      2432,
      2432,
      2432,
      2432,
      2432
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t609\t{now}"
      handle.flush
noncomputable def record_609 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_609 raw_609
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t610\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t610\t{now}"
      handle.flush
def label_610 : Fin 4042 := ⟨610, by decide +kernel⟩
noncomputable def raw_610 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    609
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t610\t{now}"
      handle.flush
noncomputable def record_610 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_610 raw_610
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t611\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t611\t{now}"
      handle.flush
def label_611 : Fin 4042 := ⟨611, by decide +kernel⟩
noncomputable def raw_611 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    609
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t611\t{now}"
      handle.flush
noncomputable def record_611 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_611 raw_611
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t612\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t612\t{now}"
      handle.flush
def label_612 : Fin 4042 := ⟨612, by decide +kernel⟩
noncomputable def raw_612 : RawOp :=
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
    611
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t612\t{now}"
      handle.flush
noncomputable def record_612 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_612 raw_612
    115 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t613\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t613\t{now}"
      handle.flush
def label_613 : Fin 4042 := ⟨613, by decide +kernel⟩
noncomputable def raw_613 : RawOp :=
  RawOp.move
    Dir.left
    612
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t613\t{now}"
      handle.flush
noncomputable def record_613 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_613 raw_613
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t614\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t614\t{now}"
      handle.flush
def label_614 : Fin 4042 := ⟨614, by decide +kernel⟩
noncomputable def raw_614 : RawOp :=
  RawOp.marker
    610
    613
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t614\t{now}"
      handle.flush
noncomputable def record_614 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_614 raw_614
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t615\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t615\t{now}"
      handle.flush
def label_615 : Fin 4042 := ⟨615, by decide +kernel⟩
noncomputable def raw_615 : RawOp :=
  RawOp.move
    Dir.right
    59
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t615\t{now}"
      handle.flush
noncomputable def record_615 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_615 raw_615
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t616\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t616\t{now}"
      handle.flush
def label_616 : Fin 4042 := ⟨616, by decide +kernel⟩
noncomputable def raw_616 : RawOp :=
  RawOp.absent
    bounded_4_2
    614
    615
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t616\t{now}"
      handle.flush
noncomputable def record_616 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_616 raw_616
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t617\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t617\t{now}"
      handle.flush
def label_617 : Fin 4042 := ⟨617, by decide +kernel⟩
noncomputable def raw_617 : RawOp :=
  RawOp.jump
    ⟨#[
      2437,
      2437,
      2437,
      2437,
      2437
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t617\t{now}"
      handle.flush
noncomputable def record_617 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_617 raw_617
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t618\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t618\t{now}"
      handle.flush
def label_618 : Fin 4042 := ⟨618, by decide +kernel⟩
noncomputable def raw_618 : RawOp :=
  RawOp.move
    Dir.right
    617
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t618\t{now}"
      handle.flush
noncomputable def record_618 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_618 raw_618
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t619\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t619\t{now}"
      handle.flush
def label_619 : Fin 4042 := ⟨619, by decide +kernel⟩
noncomputable def raw_619 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    618
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t619\t{now}"
      handle.flush
noncomputable def record_619 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_619 raw_619
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t620\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t620\t{now}"
      handle.flush
def label_620 : Fin 4042 := ⟨620, by decide +kernel⟩
noncomputable def raw_620 : RawOp :=
  RawOp.move
    Dir.right
    60
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t620\t{now}"
      handle.flush
noncomputable def record_620 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_620 raw_620
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t621\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t621\t{now}"
      handle.flush
def label_621 : Fin 4042 := ⟨621, by decide +kernel⟩
noncomputable def raw_621 : RawOp :=
  RawOp.absent
    bounded_4_0
    619
    620
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t621\t{now}"
      handle.flush
noncomputable def record_621 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_621 raw_621
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t622\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t622\t{now}"
      handle.flush
def label_622 : Fin 4042 := ⟨622, by decide +kernel⟩
noncomputable def raw_622 : RawOp :=
  RawOp.jump
    ⟨#[
      2445,
      2445,
      2445,
      2445,
      2445
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t622\t{now}"
      handle.flush
noncomputable def record_622 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_622 raw_622
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t623\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t623\t{now}"
      handle.flush
def label_623 : Fin 4042 := ⟨623, by decide +kernel⟩
noncomputable def raw_623 : RawOp :=
  RawOp.move
    Dir.right
    622
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t623\t{now}"
      handle.flush
noncomputable def record_623 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_623 raw_623
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t624\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t624\t{now}"
      handle.flush
def label_624 : Fin 4042 := ⟨624, by decide +kernel⟩
noncomputable def raw_624 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    623
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t624\t{now}"
      handle.flush
noncomputable def record_624 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_624 raw_624
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t625\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t625\t{now}"
      handle.flush
def label_625 : Fin 4042 := ⟨625, by decide +kernel⟩
noncomputable def raw_625 : RawOp :=
  RawOp.move
    Dir.right
    63
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t625\t{now}"
      handle.flush
noncomputable def record_625 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_625 raw_625
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t626\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t626\t{now}"
      handle.flush
def label_626 : Fin 4042 := ⟨626, by decide +kernel⟩
noncomputable def raw_626 : RawOp :=
  RawOp.absent
    bounded_4_3
    624
    625
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t626\t{now}"
      handle.flush
noncomputable def record_626 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_626 raw_626
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t627\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t627\t{now}"
      handle.flush
def label_627 : Fin 4042 := ⟨627, by decide +kernel⟩
noncomputable def raw_627 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    623
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t627\t{now}"
      handle.flush
noncomputable def record_627 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_627 raw_627
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t628\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t628\t{now}"
      handle.flush
def label_628 : Fin 4042 := ⟨628, by decide +kernel⟩
noncomputable def raw_628 : RawOp :=
  RawOp.jump
    ⟨#[
      630,
      630,
      630,
      630,
      630
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t628\t{now}"
      handle.flush
noncomputable def record_628 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_628 raw_628
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t629\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t629\t{now}"
      handle.flush
def label_629 : Fin 4042 := ⟨629, by decide +kernel⟩
noncomputable def raw_629 : RawOp :=
  RawOp.move
    Dir.right
    628
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t629\t{now}"
      handle.flush
noncomputable def record_629 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_629 raw_629
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t630\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t630\t{now}"
      handle.flush
def label_630 : Fin 4042 := ⟨630, by decide +kernel⟩
noncomputable def raw_630 : RawOp :=
  RawOp.absent
    bounded_4_3
    627
    629
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t630\t{now}"
      handle.flush
noncomputable def record_630 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_630 raw_630
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t631\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t631\t{now}"
      handle.flush
def label_631 : Fin 4042 := ⟨631, by decide +kernel⟩
noncomputable def raw_631 : RawOp :=
  RawOp.jump
    ⟨#[
      2453,
      2453,
      2453,
      2453,
      2453
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t631\t{now}"
      handle.flush
noncomputable def record_631 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_631 raw_631
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t632\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t632\t{now}"
      handle.flush
def label_632 : Fin 4042 := ⟨632, by decide +kernel⟩
noncomputable def raw_632 : RawOp :=
  RawOp.move
    Dir.right
    631
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t632\t{now}"
      handle.flush
noncomputable def record_632 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_632 raw_632
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t633\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t633\t{now}"
      handle.flush
def label_633 : Fin 4042 := ⟨633, by decide +kernel⟩
noncomputable def raw_633 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    632
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t633\t{now}"
      handle.flush
noncomputable def record_633 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_633 raw_633
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t634\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t634\t{now}"
      handle.flush
def label_634 : Fin 4042 := ⟨634, by decide +kernel⟩
noncomputable def raw_634 : RawOp :=
  RawOp.jump
    ⟨#[
      636,
      636,
      636,
      636,
      636
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t634\t{now}"
      handle.flush
noncomputable def record_634 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_634 raw_634
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t635\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t635\t{now}"
      handle.flush
def label_635 : Fin 4042 := ⟨635, by decide +kernel⟩
noncomputable def raw_635 : RawOp :=
  RawOp.move
    Dir.right
    634
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t635\t{now}"
      handle.flush
noncomputable def record_635 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_635 raw_635
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t636\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t636\t{now}"
      handle.flush
def label_636 : Fin 4042 := ⟨636, by decide +kernel⟩
noncomputable def raw_636 : RawOp :=
  RawOp.absent
    bounded_4_0
    633
    635
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t636\t{now}"
      handle.flush
noncomputable def record_636 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_636 raw_636
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t637\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t637\t{now}"
      handle.flush
def label_637 : Fin 4042 := ⟨637, by decide +kernel⟩
noncomputable def raw_637 : RawOp :=
  RawOp.jump
    ⟨#[
      2463,
      2463,
      2463,
      2463,
      2463
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t637\t{now}"
      handle.flush
noncomputable def record_637 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_637 raw_637
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t638\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t638\t{now}"
      handle.flush
def label_638 : Fin 4042 := ⟨638, by decide +kernel⟩
noncomputable def raw_638 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    637
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t638\t{now}"
      handle.flush
noncomputable def record_638 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_638 raw_638
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t639\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t639\t{now}"
      handle.flush
def label_639 : Fin 4042 := ⟨639, by decide +kernel⟩
noncomputable def raw_639 : RawOp :=
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
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t639\t{now}"
      handle.flush
noncomputable def record_639 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_639 raw_639
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t640\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t640\t{now}"
      handle.flush
def label_640 : Fin 4042 := ⟨640, by decide +kernel⟩
noncomputable def raw_640 : RawOp :=
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
    639
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t640\t{now}"
      handle.flush
noncomputable def record_640 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_640 raw_640
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t641\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t641\t{now}"
      handle.flush
def label_641 : Fin 4042 := ⟨641, by decide +kernel⟩
noncomputable def raw_641 : RawOp :=
  RawOp.move
    Dir.left
    640
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t641\t{now}"
      handle.flush
noncomputable def record_641 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_641 raw_641
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t642\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t642\t{now}"
      handle.flush
def label_642 : Fin 4042 := ⟨642, by decide +kernel⟩
noncomputable def raw_642 : RawOp :=
  RawOp.marker
    638
    641
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t642\t{now}"
      handle.flush
noncomputable def record_642 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_642 raw_642
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t643\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t643\t{now}"
      handle.flush
def label_643 : Fin 4042 := ⟨643, by decide +kernel⟩
noncomputable def raw_643 : RawOp :=
  RawOp.move
    Dir.right
    66
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t643\t{now}"
      handle.flush
noncomputable def record_643 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_643 raw_643
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t644\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t644\t{now}"
      handle.flush
def label_644 : Fin 4042 := ⟨644, by decide +kernel⟩
noncomputable def raw_644 : RawOp :=
  RawOp.absent
    bounded_4_1
    642
    643
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t644\t{now}"
      handle.flush
noncomputable def record_644 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_644 raw_644
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t645\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t645\t{now}"
      handle.flush
def label_645 : Fin 4042 := ⟨645, by decide +kernel⟩
noncomputable def raw_645 : RawOp :=
  RawOp.jump
    ⟨#[
      2468,
      2468,
      2468,
      2468,
      2468
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t645\t{now}"
      handle.flush
noncomputable def record_645 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_645 raw_645
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t646\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t646\t{now}"
      handle.flush
def label_646 : Fin 4042 := ⟨646, by decide +kernel⟩
noncomputable def raw_646 : RawOp :=
  RawOp.move
    Dir.right
    645
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t646\t{now}"
      handle.flush
noncomputable def record_646 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_646 raw_646
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t647\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t647\t{now}"
      handle.flush
def label_647 : Fin 4042 := ⟨647, by decide +kernel⟩
noncomputable def raw_647 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    646
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t647\t{now}"
      handle.flush
noncomputable def record_647 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_647 raw_647
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t648\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t648\t{now}"
      handle.flush
def label_648 : Fin 4042 := ⟨648, by decide +kernel⟩
noncomputable def raw_648 : RawOp :=
  RawOp.jump
    ⟨#[
      650,
      650,
      650,
      650,
      650
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t648\t{now}"
      handle.flush
noncomputable def record_648 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_648 raw_648
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t649\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t649\t{now}"
      handle.flush
def label_649 : Fin 4042 := ⟨649, by decide +kernel⟩
noncomputable def raw_649 : RawOp :=
  RawOp.move
    Dir.right
    648
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t649\t{now}"
      handle.flush
noncomputable def record_649 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_649 raw_649
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t650\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t650\t{now}"
      handle.flush
def label_650 : Fin 4042 := ⟨650, by decide +kernel⟩
noncomputable def raw_650 : RawOp :=
  RawOp.absent
    bounded_4_1
    647
    649
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t650\t{now}"
      handle.flush
noncomputable def record_650 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_650 raw_650
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t651\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t651\t{now}"
      handle.flush
def label_651 : Fin 4042 := ⟨651, by decide +kernel⟩
noncomputable def raw_651 : RawOp :=
  RawOp.jump
    ⟨#[
      2478,
      2478,
      2478,
      2478,
      2478
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t651\t{now}"
      handle.flush
noncomputable def record_651 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_651 raw_651
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t652\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t652\t{now}"
      handle.flush
def label_652 : Fin 4042 := ⟨652, by decide +kernel⟩
noncomputable def raw_652 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    651
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t652\t{now}"
      handle.flush
noncomputable def record_652 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_652 raw_652
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t653\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t653\t{now}"
      handle.flush
def label_653 : Fin 4042 := ⟨653, by decide +kernel⟩
noncomputable def raw_653 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    651
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t653\t{now}"
      handle.flush
noncomputable def record_653 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_653 raw_653
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t654\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t654\t{now}"
      handle.flush
def label_654 : Fin 4042 := ⟨654, by decide +kernel⟩
noncomputable def raw_654 : RawOp :=
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
    653
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t654\t{now}"
      handle.flush
noncomputable def record_654 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_654 raw_654
    142 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t655\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t655\t{now}"
      handle.flush
def label_655 : Fin 4042 := ⟨655, by decide +kernel⟩
noncomputable def raw_655 : RawOp :=
  RawOp.move
    Dir.left
    654
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t655\t{now}"
      handle.flush
noncomputable def record_655 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_655 raw_655
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t656\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t656\t{now}"
      handle.flush
def label_656 : Fin 4042 := ⟨656, by decide +kernel⟩
noncomputable def raw_656 : RawOp :=
  RawOp.marker
    652
    655
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t656\t{now}"
      handle.flush
noncomputable def record_656 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_656 raw_656
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t657\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t657\t{now}"
      handle.flush
def label_657 : Fin 4042 := ⟨657, by decide +kernel⟩
noncomputable def raw_657 : RawOp :=
  RawOp.move
    Dir.right
    68
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t657\t{now}"
      handle.flush
noncomputable def record_657 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_657 raw_657
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t658\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t658\t{now}"
      handle.flush
def label_658 : Fin 4042 := ⟨658, by decide +kernel⟩
noncomputable def raw_658 : RawOp :=
  RawOp.absent
    bounded_4_3
    656
    657
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t658\t{now}"
      handle.flush
noncomputable def record_658 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_658 raw_658
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t659\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t659\t{now}"
      handle.flush
def label_659 : Fin 4042 := ⟨659, by decide +kernel⟩
noncomputable def raw_659 : RawOp :=
  RawOp.jump
    ⟨#[
      2486,
      2486,
      2486,
      2486,
      2486
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t659\t{now}"
      handle.flush
noncomputable def record_659 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_659 raw_659
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t660\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t660\t{now}"
      handle.flush
def label_660 : Fin 4042 := ⟨660, by decide +kernel⟩
noncomputable def raw_660 : RawOp :=
  RawOp.move
    Dir.right
    659
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t660\t{now}"
      handle.flush
noncomputable def record_660 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_660 raw_660
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t661\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t661\t{now}"
      handle.flush
def label_661 : Fin 4042 := ⟨661, by decide +kernel⟩
noncomputable def raw_661 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    660
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t661\t{now}"
      handle.flush
noncomputable def record_661 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_661 raw_661
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t662\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t662\t{now}"
      handle.flush
def label_662 : Fin 4042 := ⟨662, by decide +kernel⟩
noncomputable def raw_662 : RawOp :=
  RawOp.move
    Dir.right
    70
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t662\t{now}"
      handle.flush
noncomputable def record_662 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_662 raw_662
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t663\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t663\t{now}"
      handle.flush
def label_663 : Fin 4042 := ⟨663, by decide +kernel⟩
noncomputable def raw_663 : RawOp :=
  RawOp.absent
    bounded_4_3
    661
    662
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t663\t{now}"
      handle.flush
noncomputable def record_663 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_663 raw_663
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t664\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t664\t{now}"
      handle.flush
def label_664 : Fin 4042 := ⟨664, by decide +kernel⟩
noncomputable def raw_664 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    660
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t664\t{now}"
      handle.flush
noncomputable def record_664 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_664 raw_664
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t665\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t665\t{now}"
      handle.flush
def label_665 : Fin 4042 := ⟨665, by decide +kernel⟩
noncomputable def raw_665 : RawOp :=
  RawOp.jump
    ⟨#[
      667,
      667,
      667,
      667,
      667
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t665\t{now}"
      handle.flush
noncomputable def record_665 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_665 raw_665
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t666\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t666\t{now}"
      handle.flush
def label_666 : Fin 4042 := ⟨666, by decide +kernel⟩
noncomputable def raw_666 : RawOp :=
  RawOp.move
    Dir.right
    665
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t666\t{now}"
      handle.flush
noncomputable def record_666 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_666 raw_666
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t667\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t667\t{now}"
      handle.flush
def label_667 : Fin 4042 := ⟨667, by decide +kernel⟩
noncomputable def raw_667 : RawOp :=
  RawOp.absent
    bounded_4_1
    664
    666
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t667\t{now}"
      handle.flush
noncomputable def record_667 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_667 raw_667
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t668\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t668\t{now}"
      handle.flush
def label_668 : Fin 4042 := ⟨668, by decide +kernel⟩
noncomputable def raw_668 : RawOp :=
  RawOp.jump
    ⟨#[
      2502,
      2502,
      2502,
      2502,
      2502
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t668\t{now}"
      handle.flush
noncomputable def record_668 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_668 raw_668
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t669\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t669\t{now}"
      handle.flush
def label_669 : Fin 4042 := ⟨669, by decide +kernel⟩
noncomputable def raw_669 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    668
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t669\t{now}"
      handle.flush
noncomputable def record_669 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_669 raw_669
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t670\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t670\t{now}"
      handle.flush
def label_670 : Fin 4042 := ⟨670, by decide +kernel⟩
noncomputable def raw_670 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    668
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t670\t{now}"
      handle.flush
noncomputable def record_670 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_670 raw_670
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t671\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t671\t{now}"
      handle.flush
def label_671 : Fin 4042 := ⟨671, by decide +kernel⟩
noncomputable def raw_671 : RawOp :=
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
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t671\t{now}"
      handle.flush
noncomputable def record_671 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_671 raw_671
    142 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t672\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t672\t{now}"
      handle.flush
def label_672 : Fin 4042 := ⟨672, by decide +kernel⟩
noncomputable def raw_672 : RawOp :=
  RawOp.move
    Dir.left
    671
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t672\t{now}"
      handle.flush
noncomputable def record_672 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_672 raw_672
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t673\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t673\t{now}"
      handle.flush
def label_673 : Fin 4042 := ⟨673, by decide +kernel⟩
noncomputable def raw_673 : RawOp :=
  RawOp.marker
    669
    672
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t673\t{now}"
      handle.flush
noncomputable def record_673 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_673 raw_673
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t674\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t674\t{now}"
      handle.flush
def label_674 : Fin 4042 := ⟨674, by decide +kernel⟩
noncomputable def raw_674 : RawOp :=
  RawOp.move
    Dir.right
    73
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t674\t{now}"
      handle.flush
noncomputable def record_674 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_674 raw_674
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t675\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t675\t{now}"
      handle.flush
def label_675 : Fin 4042 := ⟨675, by decide +kernel⟩
noncomputable def raw_675 : RawOp :=
  RawOp.absent
    bounded_4_3
    673
    674
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t675\t{now}"
      handle.flush
noncomputable def record_675 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_675 raw_675
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t676\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t676\t{now}"
      handle.flush
def label_676 : Fin 4042 := ⟨676, by decide +kernel⟩
noncomputable def raw_676 : RawOp :=
  RawOp.jump
    ⟨#[
      2507,
      2507,
      2507,
      2507,
      2507
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t676\t{now}"
      handle.flush
noncomputable def record_676 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_676 raw_676
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t677\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t677\t{now}"
      handle.flush
def label_677 : Fin 4042 := ⟨677, by decide +kernel⟩
noncomputable def raw_677 : RawOp :=
  RawOp.move
    Dir.right
    676
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t677\t{now}"
      handle.flush
noncomputable def record_677 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_677 raw_677
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t678\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t678\t{now}"
      handle.flush
def label_678 : Fin 4042 := ⟨678, by decide +kernel⟩
noncomputable def raw_678 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    677
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t678\t{now}"
      handle.flush
noncomputable def record_678 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_678 raw_678
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t679\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t679\t{now}"
      handle.flush
def label_679 : Fin 4042 := ⟨679, by decide +kernel⟩
noncomputable def raw_679 : RawOp :=
  RawOp.move
    Dir.right
    74
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t679\t{now}"
      handle.flush
noncomputable def record_679 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_679 raw_679
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t680\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t680\t{now}"
      handle.flush
def label_680 : Fin 4042 := ⟨680, by decide +kernel⟩
noncomputable def raw_680 : RawOp :=
  RawOp.absent
    bounded_4_2
    678
    679
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t680\t{now}"
      handle.flush
noncomputable def record_680 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_680 raw_680
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t681\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t681\t{now}"
      handle.flush
def label_681 : Fin 4042 := ⟨681, by decide +kernel⟩
noncomputable def raw_681 : RawOp :=
  RawOp.write
    bounded_4_2
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    677
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t681\t{now}"
      handle.flush
noncomputable def record_681 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_681 raw_681
    104 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t682\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t682\t{now}"
      handle.flush
def label_682 : Fin 4042 := ⟨682, by decide +kernel⟩
noncomputable def raw_682 : RawOp :=
  RawOp.jump
    ⟨#[
      684,
      684,
      684,
      684,
      684
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t682\t{now}"
      handle.flush
noncomputable def record_682 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_682 raw_682
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t683\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t683\t{now}"
      handle.flush
def label_683 : Fin 4042 := ⟨683, by decide +kernel⟩
noncomputable def raw_683 : RawOp :=
  RawOp.move
    Dir.right
    682
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t683\t{now}"
      handle.flush
noncomputable def record_683 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_683 raw_683
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t684\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t684\t{now}"
      handle.flush
def label_684 : Fin 4042 := ⟨684, by decide +kernel⟩
noncomputable def raw_684 : RawOp :=
  RawOp.absent
    bounded_4_2
    681
    683
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t684\t{now}"
      handle.flush
noncomputable def record_684 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_684 raw_684
    107 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t685\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t685\t{now}"
      handle.flush
def label_685 : Fin 4042 := ⟨685, by decide +kernel⟩
noncomputable def raw_685 : RawOp :=
  RawOp.jump
    ⟨#[
      2519,
      2519,
      2519,
      2519,
      2519
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t685\t{now}"
      handle.flush
noncomputable def record_685 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_685 raw_685
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t686\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t686\t{now}"
      handle.flush
def label_686 : Fin 4042 := ⟨686, by decide +kernel⟩
noncomputable def raw_686 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    685
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t686\t{now}"
      handle.flush
noncomputable def record_686 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_686 raw_686
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t687\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t687\t{now}"
      handle.flush
def label_687 : Fin 4042 := ⟨687, by decide +kernel⟩
noncomputable def raw_687 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    685
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t687\t{now}"
      handle.flush
noncomputable def record_687 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_687 raw_687
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t688\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t688\t{now}"
      handle.flush
def label_688 : Fin 4042 := ⟨688, by decide +kernel⟩
noncomputable def raw_688 : RawOp :=
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
    687
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t688\t{now}"
      handle.flush
noncomputable def record_688 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_688 raw_688
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t689\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t689\t{now}"
      handle.flush
def label_689 : Fin 4042 := ⟨689, by decide +kernel⟩
noncomputable def raw_689 : RawOp :=
  RawOp.move
    Dir.left
    688
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t689\t{now}"
      handle.flush
noncomputable def record_689 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_689 raw_689
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t690\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t690\t{now}"
      handle.flush
def label_690 : Fin 4042 := ⟨690, by decide +kernel⟩
noncomputable def raw_690 : RawOp :=
  RawOp.marker
    686
    689
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t690\t{now}"
      handle.flush
noncomputable def record_690 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_690 raw_690
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t691\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t691\t{now}"
      handle.flush
def label_691 : Fin 4042 := ⟨691, by decide +kernel⟩
noncomputable def raw_691 : RawOp :=
  RawOp.move
    Dir.right
    77
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t691\t{now}"
      handle.flush
noncomputable def record_691 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_691 raw_691
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t692\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t692\t{now}"
      handle.flush
def label_692 : Fin 4042 := ⟨692, by decide +kernel⟩
noncomputable def raw_692 : RawOp :=
  RawOp.absent
    bounded_4_1
    690
    691
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t692\t{now}"
      handle.flush
noncomputable def record_692 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_692 raw_692
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t693\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t693\t{now}"
      handle.flush
def label_693 : Fin 4042 := ⟨693, by decide +kernel⟩
noncomputable def raw_693 : RawOp :=
  RawOp.jump
    ⟨#[
      2529,
      2529,
      2529,
      2529,
      2529
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t693\t{now}"
      handle.flush
noncomputable def record_693 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_693 raw_693
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t694\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t694\t{now}"
      handle.flush
def label_694 : Fin 4042 := ⟨694, by decide +kernel⟩
noncomputable def raw_694 : RawOp :=
  RawOp.move
    Dir.right
    693
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t694\t{now}"
      handle.flush
noncomputable def record_694 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_694 raw_694
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t695\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t695\t{now}"
      handle.flush
def label_695 : Fin 4042 := ⟨695, by decide +kernel⟩
noncomputable def raw_695 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    694
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t695\t{now}"
      handle.flush
noncomputable def record_695 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_695 raw_695
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t696\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t696\t{now}"
      handle.flush
def label_696 : Fin 4042 := ⟨696, by decide +kernel⟩
noncomputable def raw_696 : RawOp :=
  RawOp.jump
    ⟨#[
      698,
      698,
      698,
      698,
      698
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t696\t{now}"
      handle.flush
noncomputable def record_696 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_696 raw_696
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t697\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t697\t{now}"
      handle.flush
def label_697 : Fin 4042 := ⟨697, by decide +kernel⟩
noncomputable def raw_697 : RawOp :=
  RawOp.move
    Dir.right
    696
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t697\t{now}"
      handle.flush
noncomputable def record_697 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_697 raw_697
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t698\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t698\t{now}"
      handle.flush
def label_698 : Fin 4042 := ⟨698, by decide +kernel⟩
noncomputable def raw_698 : RawOp :=
  RawOp.absent
    bounded_4_1
    695
    697
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t698\t{now}"
      handle.flush
noncomputable def record_698 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_698 raw_698
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t699\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t699\t{now}"
      handle.flush
def label_699 : Fin 4042 := ⟨699, by decide +kernel⟩
noncomputable def raw_699 : RawOp :=
  RawOp.jump
    ⟨#[
      2535,
      2535,
      2535,
      2535,
      2535
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t699\t{now}"
      handle.flush
noncomputable def record_699 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_699 raw_699
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t700\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t700\t{now}"
      handle.flush
def label_700 : Fin 4042 := ⟨700, by decide +kernel⟩
noncomputable def raw_700 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    699
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t700\t{now}"
      handle.flush
noncomputable def record_700 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_700 raw_700
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t701\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t701\t{now}"
      handle.flush
def label_701 : Fin 4042 := ⟨701, by decide +kernel⟩
noncomputable def raw_701 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    699
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t701\t{now}"
      handle.flush
noncomputable def record_701 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_701 raw_701
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t702\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t702\t{now}"
      handle.flush
def label_702 : Fin 4042 := ⟨702, by decide +kernel⟩
noncomputable def raw_702 : RawOp :=
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
    701
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t702\t{now}"
      handle.flush
noncomputable def record_702 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_702 raw_702
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t703\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t703\t{now}"
      handle.flush
def label_703 : Fin 4042 := ⟨703, by decide +kernel⟩
noncomputable def raw_703 : RawOp :=
  RawOp.move
    Dir.left
    702
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t703\t{now}"
      handle.flush
noncomputable def record_703 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_703 raw_703
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t704\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t704\t{now}"
      handle.flush
def label_704 : Fin 4042 := ⟨704, by decide +kernel⟩
noncomputable def raw_704 : RawOp :=
  RawOp.marker
    700
    703
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t704\t{now}"
      handle.flush
noncomputable def record_704 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_704 raw_704
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t705\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t705\t{now}"
      handle.flush
def label_705 : Fin 4042 := ⟨705, by decide +kernel⟩
noncomputable def raw_705 : RawOp :=
  RawOp.move
    Dir.right
    78
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t705\t{now}"
      handle.flush
noncomputable def record_705 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_705 raw_705
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t706\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t706\t{now}"
      handle.flush
def label_706 : Fin 4042 := ⟨706, by decide +kernel⟩
noncomputable def raw_706 : RawOp :=
  RawOp.absent
    bounded_4_0
    704
    705
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t706\t{now}"
      handle.flush
noncomputable def record_706 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_706 raw_706
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t707\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t707\t{now}"
      handle.flush
def label_707 : Fin 4042 := ⟨707, by decide +kernel⟩
noncomputable def raw_707 : RawOp :=
  RawOp.jump
    ⟨#[
      2540,
      2540,
      2540,
      2540,
      2540
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t707\t{now}"
      handle.flush
noncomputable def record_707 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_707 raw_707
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t708\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t708\t{now}"
      handle.flush
def label_708 : Fin 4042 := ⟨708, by decide +kernel⟩
noncomputable def raw_708 : RawOp :=
  RawOp.move
    Dir.right
    707
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t708\t{now}"
      handle.flush
noncomputable def record_708 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_708 raw_708
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t709\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t709\t{now}"
      handle.flush
def label_709 : Fin 4042 := ⟨709, by decide +kernel⟩
noncomputable def raw_709 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    708
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t709\t{now}"
      handle.flush
noncomputable def record_709 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_709 raw_709
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t710\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t710\t{now}"
      handle.flush
def label_710 : Fin 4042 := ⟨710, by decide +kernel⟩
noncomputable def raw_710 : RawOp :=
  RawOp.move
    Dir.right
    79
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t710\t{now}"
      handle.flush
noncomputable def record_710 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_710 raw_710
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t711\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t711\t{now}"
      handle.flush
def label_711 : Fin 4042 := ⟨711, by decide +kernel⟩
noncomputable def raw_711 : RawOp :=
  RawOp.absent
    bounded_4_3
    709
    710
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t711\t{now}"
      handle.flush
noncomputable def record_711 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_711 raw_711
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t712\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t712\t{now}"
      handle.flush
def label_712 : Fin 4042 := ⟨712, by decide +kernel⟩
noncomputable def raw_712 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    708
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t712\t{now}"
      handle.flush
noncomputable def record_712 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_712 raw_712
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t713\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t713\t{now}"
      handle.flush
def label_713 : Fin 4042 := ⟨713, by decide +kernel⟩
noncomputable def raw_713 : RawOp :=
  RawOp.jump
    ⟨#[
      715,
      715,
      715,
      715,
      715
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t713\t{now}"
      handle.flush
noncomputable def record_713 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_713 raw_713
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t714\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t714\t{now}"
      handle.flush
def label_714 : Fin 4042 := ⟨714, by decide +kernel⟩
noncomputable def raw_714 : RawOp :=
  RawOp.move
    Dir.right
    713
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t714\t{now}"
      handle.flush
noncomputable def record_714 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_714 raw_714
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t715\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t715\t{now}"
      handle.flush
def label_715 : Fin 4042 := ⟨715, by decide +kernel⟩
noncomputable def raw_715 : RawOp :=
  RawOp.absent
    bounded_4_3
    712
    714
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t715\t{now}"
      handle.flush
noncomputable def record_715 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_715 raw_715
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t716\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t716\t{now}"
      handle.flush
def label_716 : Fin 4042 := ⟨716, by decide +kernel⟩
noncomputable def raw_716 : RawOp :=
  RawOp.jump
    ⟨#[
      2555,
      2555,
      2555,
      2555,
      2555
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t716\t{now}"
      handle.flush
noncomputable def record_716 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_716 raw_716
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t717\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t717\t{now}"
      handle.flush
def label_717 : Fin 4042 := ⟨717, by decide +kernel⟩
noncomputable def raw_717 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    716
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t717\t{now}"
      handle.flush
noncomputable def record_717 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_717 raw_717
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t718\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t718\t{now}"
      handle.flush
def label_718 : Fin 4042 := ⟨718, by decide +kernel⟩
noncomputable def raw_718 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    716
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t718\t{now}"
      handle.flush
noncomputable def record_718 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_718 raw_718
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t719\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t719\t{now}"
      handle.flush
def label_719 : Fin 4042 := ⟨719, by decide +kernel⟩
noncomputable def raw_719 : RawOp :=
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
    718
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t719\t{now}"
      handle.flush
noncomputable def record_719 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_719 raw_719
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t720\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t720\t{now}"
      handle.flush
def label_720 : Fin 4042 := ⟨720, by decide +kernel⟩
noncomputable def raw_720 : RawOp :=
  RawOp.move
    Dir.left
    719
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t720\t{now}"
      handle.flush
noncomputable def record_720 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_720 raw_720
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t721\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t721\t{now}"
      handle.flush
def label_721 : Fin 4042 := ⟨721, by decide +kernel⟩
noncomputable def raw_721 : RawOp :=
  RawOp.marker
    717
    720
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t721\t{now}"
      handle.flush
noncomputable def record_721 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_721 raw_721
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t722\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t722\t{now}"
      handle.flush
def label_722 : Fin 4042 := ⟨722, by decide +kernel⟩
noncomputable def raw_722 : RawOp :=
  RawOp.move
    Dir.right
    82
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t722\t{now}"
      handle.flush
noncomputable def record_722 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_722 raw_722
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t723\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t723\t{now}"
      handle.flush
def label_723 : Fin 4042 := ⟨723, by decide +kernel⟩
noncomputable def raw_723 : RawOp :=
  RawOp.absent
    bounded_4_1
    721
    722
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t723\t{now}"
      handle.flush
noncomputable def record_723 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_723 raw_723
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t724\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t724\t{now}"
      handle.flush
def label_724 : Fin 4042 := ⟨724, by decide +kernel⟩
noncomputable def raw_724 : RawOp :=
  RawOp.jump
    ⟨#[
      2549,
      2549,
      2549,
      2549,
      2549
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t724\t{now}"
      handle.flush
noncomputable def record_724 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_724 raw_724
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t725\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t725\t{now}"
      handle.flush
def label_725 : Fin 4042 := ⟨725, by decide +kernel⟩
noncomputable def raw_725 : RawOp :=
  RawOp.move
    Dir.right
    724
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t725\t{now}"
      handle.flush
noncomputable def record_725 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_725 raw_725
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t726\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t726\t{now}"
      handle.flush
def label_726 : Fin 4042 := ⟨726, by decide +kernel⟩
noncomputable def raw_726 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    725
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t726\t{now}"
      handle.flush
noncomputable def record_726 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_726 raw_726
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t727\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t727\t{now}"
      handle.flush
def label_727 : Fin 4042 := ⟨727, by decide +kernel⟩
noncomputable def raw_727 : RawOp :=
  RawOp.jump
    ⟨#[
      729,
      729,
      729,
      729,
      729
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t727\t{now}"
      handle.flush
noncomputable def record_727 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_727 raw_727
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t728\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t728\t{now}"
      handle.flush
def label_728 : Fin 4042 := ⟨728, by decide +kernel⟩
noncomputable def raw_728 : RawOp :=
  RawOp.move
    Dir.right
    727
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t728\t{now}"
      handle.flush
noncomputable def record_728 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_728 raw_728
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t729\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t729\t{now}"
      handle.flush
def label_729 : Fin 4042 := ⟨729, by decide +kernel⟩
noncomputable def raw_729 : RawOp :=
  RawOp.absent
    bounded_4_1
    726
    728
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t729\t{now}"
      handle.flush
noncomputable def record_729 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_729 raw_729
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t730\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t730\t{now}"
      handle.flush
def label_730 : Fin 4042 := ⟨730, by decide +kernel⟩
noncomputable def raw_730 : RawOp :=
  RawOp.jump
    ⟨#[
      2568,
      2568,
      2568,
      2568,
      2568
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t730\t{now}"
      handle.flush
noncomputable def record_730 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_730 raw_730
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t731\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t731\t{now}"
      handle.flush
def label_731 : Fin 4042 := ⟨731, by decide +kernel⟩
noncomputable def raw_731 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    730
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t731\t{now}"
      handle.flush
noncomputable def record_731 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_731 raw_731
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t732\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t732\t{now}"
      handle.flush
def label_732 : Fin 4042 := ⟨732, by decide +kernel⟩
noncomputable def raw_732 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    730
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t732\t{now}"
      handle.flush
noncomputable def record_732 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_732 raw_732
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t733\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t733\t{now}"
      handle.flush
def label_733 : Fin 4042 := ⟨733, by decide +kernel⟩
noncomputable def raw_733 : RawOp :=
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
    732
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t733\t{now}"
      handle.flush
noncomputable def record_733 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_733 raw_733
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t734\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t734\t{now}"
      handle.flush
def label_734 : Fin 4042 := ⟨734, by decide +kernel⟩
noncomputable def raw_734 : RawOp :=
  RawOp.move
    Dir.left
    733
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t734\t{now}"
      handle.flush
noncomputable def record_734 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_734 raw_734
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t735\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t735\t{now}"
      handle.flush
def label_735 : Fin 4042 := ⟨735, by decide +kernel⟩
noncomputable def raw_735 : RawOp :=
  RawOp.marker
    731
    734
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t735\t{now}"
      handle.flush
noncomputable def record_735 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_735 raw_735
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t736\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t736\t{now}"
      handle.flush
def label_736 : Fin 4042 := ⟨736, by decide +kernel⟩
noncomputable def raw_736 : RawOp :=
  RawOp.move
    Dir.right
    83
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t736\t{now}"
      handle.flush
noncomputable def record_736 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_736 raw_736
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t737\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t737\t{now}"
      handle.flush
def label_737 : Fin 4042 := ⟨737, by decide +kernel⟩
noncomputable def raw_737 : RawOp :=
  RawOp.absent
    bounded_4_0
    735
    736
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t737\t{now}"
      handle.flush
noncomputable def record_737 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_737 raw_737
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t738\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t738\t{now}"
      handle.flush
def label_738 : Fin 4042 := ⟨738, by decide +kernel⟩
noncomputable def raw_738 : RawOp :=
  RawOp.jump
    ⟨#[
      2573,
      2573,
      2573,
      2573,
      2573
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t738\t{now}"
      handle.flush
noncomputable def record_738 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_738 raw_738
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t739\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t739\t{now}"
      handle.flush
def label_739 : Fin 4042 := ⟨739, by decide +kernel⟩
noncomputable def raw_739 : RawOp :=
  RawOp.move
    Dir.right
    738
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t739\t{now}"
      handle.flush
noncomputable def record_739 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_739 raw_739
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t740\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t740\t{now}"
      handle.flush
def label_740 : Fin 4042 := ⟨740, by decide +kernel⟩
noncomputable def raw_740 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2,
      bounded_5_2
    ], rfl⟩
    739
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t740\t{now}"
      handle.flush
noncomputable def record_740 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_740 raw_740
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t741\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t741\t{now}"
      handle.flush
def label_741 : Fin 4042 := ⟨741, by decide +kernel⟩
noncomputable def raw_741 : RawOp :=
  RawOp.move
    Dir.right
    84
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t741\t{now}"
      handle.flush
noncomputable def record_741 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_741 raw_741
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t742\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t742\t{now}"
      handle.flush
def label_742 : Fin 4042 := ⟨742, by decide +kernel⟩
noncomputable def raw_742 : RawOp :=
  RawOp.absent
    bounded_4_3
    740
    741
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t742\t{now}"
      handle.flush
noncomputable def record_742 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_742 raw_742
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t743\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t743\t{now}"
      handle.flush
def label_743 : Fin 4042 := ⟨743, by decide +kernel⟩
noncomputable def raw_743 : RawOp :=
  RawOp.write
    bounded_4_3
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    739
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t743\t{now}"
      handle.flush
noncomputable def record_743 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_743 raw_743
    134 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t744\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t744\t{now}"
      handle.flush
def label_744 : Fin 4042 := ⟨744, by decide +kernel⟩
noncomputable def raw_744 : RawOp :=
  RawOp.jump
    ⟨#[
      746,
      746,
      746,
      746,
      746
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t744\t{now}"
      handle.flush
noncomputable def record_744 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_744 raw_744
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t745\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t745\t{now}"
      handle.flush
def label_745 : Fin 4042 := ⟨745, by decide +kernel⟩
noncomputable def raw_745 : RawOp :=
  RawOp.move
    Dir.right
    744
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t745\t{now}"
      handle.flush
noncomputable def record_745 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_745 raw_745
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t746\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t746\t{now}"
      handle.flush
def label_746 : Fin 4042 := ⟨746, by decide +kernel⟩
noncomputable def raw_746 : RawOp :=
  RawOp.absent
    bounded_4_3
    743
    745
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t746\t{now}"
      handle.flush
noncomputable def record_746 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_746 raw_746
    134 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t747\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t747\t{now}"
      handle.flush
def label_747 : Fin 4042 := ⟨747, by decide +kernel⟩
noncomputable def raw_747 : RawOp :=
  RawOp.jump
    ⟨#[
      2589,
      2589,
      2589,
      2589,
      2589
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t747\t{now}"
      handle.flush
noncomputable def record_747 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_747 raw_747
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t748\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t748\t{now}"
      handle.flush
def label_748 : Fin 4042 := ⟨748, by decide +kernel⟩
noncomputable def raw_748 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    747
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t748\t{now}"
      handle.flush
noncomputable def record_748 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_748 raw_748
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t749\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t749\t{now}"
      handle.flush
def label_749 : Fin 4042 := ⟨749, by decide +kernel⟩
noncomputable def raw_749 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    747
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t749\t{now}"
      handle.flush
noncomputable def record_749 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_749 raw_749
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t750\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t750\t{now}"
      handle.flush
def label_750 : Fin 4042 := ⟨750, by decide +kernel⟩
noncomputable def raw_750 : RawOp :=
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
    749
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t750\t{now}"
      handle.flush
noncomputable def record_750 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_750 raw_750
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t751\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t751\t{now}"
      handle.flush
def label_751 : Fin 4042 := ⟨751, by decide +kernel⟩
noncomputable def raw_751 : RawOp :=
  RawOp.move
    Dir.left
    750
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t751\t{now}"
      handle.flush
noncomputable def record_751 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_751 raw_751
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t752\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t752\t{now}"
      handle.flush
def label_752 : Fin 4042 := ⟨752, by decide +kernel⟩
noncomputable def raw_752 : RawOp :=
  RawOp.marker
    748
    751
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t752\t{now}"
      handle.flush
noncomputable def record_752 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_752 raw_752
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t753\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t753\t{now}"
      handle.flush
def label_753 : Fin 4042 := ⟨753, by decide +kernel⟩
noncomputable def raw_753 : RawOp :=
  RawOp.move
    Dir.right
    87
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t753\t{now}"
      handle.flush
noncomputable def record_753 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_753 raw_753
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t754\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t754\t{now}"
      handle.flush
def label_754 : Fin 4042 := ⟨754, by decide +kernel⟩
noncomputable def raw_754 : RawOp :=
  RawOp.absent
    bounded_4_1
    752
    753
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t754\t{now}"
      handle.flush
noncomputable def record_754 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_754 raw_754
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t755\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t755\t{now}"
      handle.flush
def label_755 : Fin 4042 := ⟨755, by decide +kernel⟩
noncomputable def raw_755 : RawOp :=
  RawOp.jump
    ⟨#[
      2594,
      2594,
      2594,
      2594,
      2594
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t755\t{now}"
      handle.flush
noncomputable def record_755 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_755 raw_755
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t756\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t756\t{now}"
      handle.flush
def label_756 : Fin 4042 := ⟨756, by decide +kernel⟩
noncomputable def raw_756 : RawOp :=
  RawOp.move
    Dir.right
    755
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t756\t{now}"
      handle.flush
noncomputable def record_756 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_756 raw_756
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t757\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t757\t{now}"
      handle.flush
def label_757 : Fin 4042 := ⟨757, by decide +kernel⟩
noncomputable def raw_757 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    756
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t757\t{now}"
      handle.flush
noncomputable def record_757 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_757 raw_757
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t758\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t758\t{now}"
      handle.flush
def label_758 : Fin 4042 := ⟨758, by decide +kernel⟩
noncomputable def raw_758 : RawOp :=
  RawOp.jump
    ⟨#[
      760,
      760,
      760,
      760,
      760
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t758\t{now}"
      handle.flush
noncomputable def record_758 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_758 raw_758
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t759\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t759\t{now}"
      handle.flush
def label_759 : Fin 4042 := ⟨759, by decide +kernel⟩
noncomputable def raw_759 : RawOp :=
  RawOp.move
    Dir.right
    758
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t759\t{now}"
      handle.flush
noncomputable def record_759 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_759 raw_759
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t760\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t760\t{now}"
      handle.flush
def label_760 : Fin 4042 := ⟨760, by decide +kernel⟩
noncomputable def raw_760 : RawOp :=
  RawOp.absent
    bounded_4_1
    757
    759
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t760\t{now}"
      handle.flush
noncomputable def record_760 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_760 raw_760
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t761\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t761\t{now}"
      handle.flush
def label_761 : Fin 4042 := ⟨761, by decide +kernel⟩
noncomputable def raw_761 : RawOp :=
  RawOp.jump
    ⟨#[
      2604,
      2604,
      2604,
      2604,
      2604
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t761\t{now}"
      handle.flush
noncomputable def record_761 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_761 raw_761
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t762\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t762\t{now}"
      handle.flush
def label_762 : Fin 4042 := ⟨762, by decide +kernel⟩
noncomputable def raw_762 : RawOp :=
  RawOp.move
    Dir.right
    761
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t762\t{now}"
      handle.flush
noncomputable def record_762 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_762 raw_762
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t763\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t763\t{now}"
      handle.flush
def label_763 : Fin 4042 := ⟨763, by decide +kernel⟩
noncomputable def raw_763 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    762
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t763\t{now}"
      handle.flush
noncomputable def record_763 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_763 raw_763
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t764\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t764\t{now}"
      handle.flush
def label_764 : Fin 4042 := ⟨764, by decide +kernel⟩
noncomputable def raw_764 : RawOp :=
  RawOp.jump
    ⟨#[
      766,
      766,
      766,
      766,
      766
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t764\t{now}"
      handle.flush
noncomputable def record_764 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_764 raw_764
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t765\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t765\t{now}"
      handle.flush
def label_765 : Fin 4042 := ⟨765, by decide +kernel⟩
noncomputable def raw_765 : RawOp :=
  RawOp.move
    Dir.right
    764
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t765\t{now}"
      handle.flush
noncomputable def record_765 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_765 raw_765
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t766\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t766\t{now}"
      handle.flush
def label_766 : Fin 4042 := ⟨766, by decide +kernel⟩
noncomputable def raw_766 : RawOp :=
  RawOp.absent
    bounded_4_1
    763
    765
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t766\t{now}"
      handle.flush
noncomputable def record_766 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_766 raw_766
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t767\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t767\t{now}"
      handle.flush
def label_767 : Fin 4042 := ⟨767, by decide +kernel⟩
noncomputable def raw_767 : RawOp :=
  RawOp.jump
    ⟨#[
      2610,
      2610,
      2610,
      2610,
      2610
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t767\t{now}"
      handle.flush
noncomputable def record_767 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_767 raw_767
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t768\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t768\t{now}"
      handle.flush
def label_768 : Fin 4042 := ⟨768, by decide +kernel⟩
noncomputable def raw_768 : RawOp :=
  RawOp.move
    Dir.right
    767
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t768\t{now}"
      handle.flush
noncomputable def record_768 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_768 raw_768
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t769\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t769\t{now}"
      handle.flush
def label_769 : Fin 4042 := ⟨769, by decide +kernel⟩
noncomputable def raw_769 : RawOp :=
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
    768
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t769\t{now}"
      handle.flush
noncomputable def record_769 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_769 raw_769
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t770\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t770\t{now}"
      handle.flush
def label_770 : Fin 4042 := ⟨770, by decide +kernel⟩
noncomputable def raw_770 : RawOp :=
  RawOp.move
    Dir.left
    769
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t770\t{now}"
      handle.flush
noncomputable def record_770 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_770 raw_770
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t771\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t771\t{now}"
      handle.flush
def label_771 : Fin 4042 := ⟨771, by decide +kernel⟩
noncomputable def raw_771 : RawOp :=
  RawOp.jump
    ⟨#[
      773,
      773,
      773,
      773,
      773
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t771\t{now}"
      handle.flush
noncomputable def record_771 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_771 raw_771
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t772\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t772\t{now}"
      handle.flush
def label_772 : Fin 4042 := ⟨772, by decide +kernel⟩
noncomputable def raw_772 : RawOp :=
  RawOp.move
    Dir.right
    771
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t772\t{now}"
      handle.flush
noncomputable def record_772 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_772 raw_772
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t773\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t773\t{now}"
      handle.flush
def label_773 : Fin 4042 := ⟨773, by decide +kernel⟩
noncomputable def raw_773 : RawOp :=
  RawOp.absent
    bounded_4_0
    770
    772
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t773\t{now}"
      handle.flush
noncomputable def record_773 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_773 raw_773
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t774\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t774\t{now}"
      handle.flush
def label_774 : Fin 4042 := ⟨774, by decide +kernel⟩
noncomputable def raw_774 : RawOp :=
  RawOp.jump
    ⟨#[
      2620,
      2620,
      2620,
      2620,
      2620
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t774\t{now}"
      handle.flush
noncomputable def record_774 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_774 raw_774
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t775\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t775\t{now}"
      handle.flush
def label_775 : Fin 4042 := ⟨775, by decide +kernel⟩
noncomputable def raw_775 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    774
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t775\t{now}"
      handle.flush
noncomputable def record_775 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_775 raw_775
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t776\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t776\t{now}"
      handle.flush
def label_776 : Fin 4042 := ⟨776, by decide +kernel⟩
noncomputable def raw_776 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    774
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t776\t{now}"
      handle.flush
noncomputable def record_776 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_776 raw_776
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t777\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t777\t{now}"
      handle.flush
def label_777 : Fin 4042 := ⟨777, by decide +kernel⟩
noncomputable def raw_777 : RawOp :=
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
    776
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t777\t{now}"
      handle.flush
noncomputable def record_777 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_777 raw_777
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t778\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t778\t{now}"
      handle.flush
def label_778 : Fin 4042 := ⟨778, by decide +kernel⟩
noncomputable def raw_778 : RawOp :=
  RawOp.move
    Dir.left
    777
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t778\t{now}"
      handle.flush
noncomputable def record_778 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_778 raw_778
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t779\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t779\t{now}"
      handle.flush
def label_779 : Fin 4042 := ⟨779, by decide +kernel⟩
noncomputable def raw_779 : RawOp :=
  RawOp.marker
    775
    778
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t779\t{now}"
      handle.flush
noncomputable def record_779 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_779 raw_779
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t780\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t780\t{now}"
      handle.flush
def label_780 : Fin 4042 := ⟨780, by decide +kernel⟩
noncomputable def raw_780 : RawOp :=
  RawOp.move
    Dir.right
    89
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t780\t{now}"
      handle.flush
noncomputable def record_780 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_780 raw_780
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t781\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t781\t{now}"
      handle.flush
def label_781 : Fin 4042 := ⟨781, by decide +kernel⟩
noncomputable def raw_781 : RawOp :=
  RawOp.absent
    bounded_4_0
    779
    780
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t781\t{now}"
      handle.flush
noncomputable def record_781 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_781 raw_781
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t782\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t782\t{now}"
      handle.flush
def label_782 : Fin 4042 := ⟨782, by decide +kernel⟩
noncomputable def raw_782 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    762
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t782\t{now}"
      handle.flush
noncomputable def record_782 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_782 raw_782
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t783\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t783\t{now}"
      handle.flush
def label_783 : Fin 4042 := ⟨783, by decide +kernel⟩
noncomputable def raw_783 : RawOp :=
  RawOp.jump
    ⟨#[
      785,
      785,
      785,
      785,
      785
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t783\t{now}"
      handle.flush
noncomputable def record_783 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_783 raw_783
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t784\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t784\t{now}"
      handle.flush
def label_784 : Fin 4042 := ⟨784, by decide +kernel⟩
noncomputable def raw_784 : RawOp :=
  RawOp.move
    Dir.right
    783
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t784\t{now}"
      handle.flush
noncomputable def record_784 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_784 raw_784
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t785\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t785\t{now}"
      handle.flush
def label_785 : Fin 4042 := ⟨785, by decide +kernel⟩
noncomputable def raw_785 : RawOp :=
  RawOp.absent
    bounded_4_0
    782
    784
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t785\t{now}"
      handle.flush
noncomputable def record_785 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_785 raw_785
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t786\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t786\t{now}"
      handle.flush
def label_786 : Fin 4042 := ⟨786, by decide +kernel⟩
noncomputable def raw_786 : RawOp :=
  RawOp.jump
    ⟨#[
      2635,
      2635,
      2635,
      2635,
      2635
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t786\t{now}"
      handle.flush
noncomputable def record_786 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_786 raw_786
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t787\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t787\t{now}"
      handle.flush
def label_787 : Fin 4042 := ⟨787, by decide +kernel⟩
noncomputable def raw_787 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    786
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t787\t{now}"
      handle.flush
noncomputable def record_787 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_787 raw_787
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t788\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t788\t{now}"
      handle.flush
def label_788 : Fin 4042 := ⟨788, by decide +kernel⟩
noncomputable def raw_788 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    786
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t788\t{now}"
      handle.flush
noncomputable def record_788 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_788 raw_788
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t789\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t789\t{now}"
      handle.flush
def label_789 : Fin 4042 := ⟨789, by decide +kernel⟩
noncomputable def raw_789 : RawOp :=
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
    788
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t789\t{now}"
      handle.flush
noncomputable def record_789 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_789 raw_789
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t790\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t790\t{now}"
      handle.flush
def label_790 : Fin 4042 := ⟨790, by decide +kernel⟩
noncomputable def raw_790 : RawOp :=
  RawOp.move
    Dir.left
    789
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t790\t{now}"
      handle.flush
noncomputable def record_790 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_790 raw_790
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t791\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t791\t{now}"
      handle.flush
def label_791 : Fin 4042 := ⟨791, by decide +kernel⟩
noncomputable def raw_791 : RawOp :=
  RawOp.marker
    787
    790
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t791\t{now}"
      handle.flush
noncomputable def record_791 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_791 raw_791
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t792\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t792\t{now}"
      handle.flush
def label_792 : Fin 4042 := ⟨792, by decide +kernel⟩
noncomputable def raw_792 : RawOp :=
  RawOp.move
    Dir.right
    91
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t792\t{now}"
      handle.flush
noncomputable def record_792 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_792 raw_792
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t793\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t793\t{now}"
      handle.flush
def label_793 : Fin 4042 := ⟨793, by decide +kernel⟩
noncomputable def raw_793 : RawOp :=
  RawOp.absent
    bounded_4_1
    791
    792
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t793\t{now}"
      handle.flush
noncomputable def record_793 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_793 raw_793
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t794\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t794\t{now}"
      handle.flush
def label_794 : Fin 4042 := ⟨794, by decide +kernel⟩
noncomputable def raw_794 : RawOp :=
  RawOp.jump
    ⟨#[
      2629,
      2629,
      2629,
      2629,
      2629
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t794\t{now}"
      handle.flush
noncomputable def record_794 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_794 raw_794
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t795\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t795\t{now}"
      handle.flush
def label_795 : Fin 4042 := ⟨795, by decide +kernel⟩
noncomputable def raw_795 : RawOp :=
  RawOp.move
    Dir.right
    794
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t795\t{now}"
      handle.flush
noncomputable def record_795 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_795 raw_795
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t796\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t796\t{now}"
      handle.flush
def label_796 : Fin 4042 := ⟨796, by decide +kernel⟩
noncomputable def raw_796 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    795
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t796\t{now}"
      handle.flush
noncomputable def record_796 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_796 raw_796
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t797\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t797\t{now}"
      handle.flush
def label_797 : Fin 4042 := ⟨797, by decide +kernel⟩
noncomputable def raw_797 : RawOp :=
  RawOp.jump
    ⟨#[
      799,
      799,
      799,
      799,
      799
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t797\t{now}"
      handle.flush
noncomputable def record_797 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_797 raw_797
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t798\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t798\t{now}"
      handle.flush
def label_798 : Fin 4042 := ⟨798, by decide +kernel⟩
noncomputable def raw_798 : RawOp :=
  RawOp.move
    Dir.right
    797
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t798\t{now}"
      handle.flush
noncomputable def record_798 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_798 raw_798
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t799\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t799\t{now}"
      handle.flush
def label_799 : Fin 4042 := ⟨799, by decide +kernel⟩
noncomputable def raw_799 : RawOp :=
  RawOp.absent
    bounded_4_1
    796
    798
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t799\t{now}"
      handle.flush
noncomputable def record_799 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_799 raw_799
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t800\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t800\t{now}"
      handle.flush
def label_800 : Fin 4042 := ⟨800, by decide +kernel⟩
noncomputable def raw_800 : RawOp :=
  RawOp.jump
    ⟨#[
      2648,
      2648,
      2648,
      2648,
      2648
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t800\t{now}"
      handle.flush
noncomputable def record_800 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_800 raw_800
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t801\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t801\t{now}"
      handle.flush
def label_801 : Fin 4042 := ⟨801, by decide +kernel⟩
noncomputable def raw_801 : RawOp :=
  RawOp.move
    Dir.right
    800
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t801\t{now}"
      handle.flush
noncomputable def record_801 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_801 raw_801
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t802\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t802\t{now}"
      handle.flush
def label_802 : Fin 4042 := ⟨802, by decide +kernel⟩
noncomputable def raw_802 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    801
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t802\t{now}"
      handle.flush
noncomputable def record_802 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_802 raw_802
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t803\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t803\t{now}"
      handle.flush
def label_803 : Fin 4042 := ⟨803, by decide +kernel⟩
noncomputable def raw_803 : RawOp :=
  RawOp.jump
    ⟨#[
      805,
      805,
      805,
      805,
      805
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t803\t{now}"
      handle.flush
noncomputable def record_803 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_803 raw_803
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t804\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t804\t{now}"
      handle.flush
def label_804 : Fin 4042 := ⟨804, by decide +kernel⟩
noncomputable def raw_804 : RawOp :=
  RawOp.move
    Dir.right
    803
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t804\t{now}"
      handle.flush
noncomputable def record_804 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_804 raw_804
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t805\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t805\t{now}"
      handle.flush
def label_805 : Fin 4042 := ⟨805, by decide +kernel⟩
noncomputable def raw_805 : RawOp :=
  RawOp.absent
    bounded_4_1
    802
    804
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t805\t{now}"
      handle.flush
noncomputable def record_805 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_805 raw_805
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t806\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t806\t{now}"
      handle.flush
def label_806 : Fin 4042 := ⟨806, by decide +kernel⟩
noncomputable def raw_806 : RawOp :=
  RawOp.jump
    ⟨#[
      2654,
      2654,
      2654,
      2654,
      2654
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t806\t{now}"
      handle.flush
noncomputable def record_806 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_806 raw_806
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t807\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t807\t{now}"
      handle.flush
def label_807 : Fin 4042 := ⟨807, by decide +kernel⟩
noncomputable def raw_807 : RawOp :=
  RawOp.move
    Dir.right
    806
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t807\t{now}"
      handle.flush
noncomputable def record_807 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_807 raw_807
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t808\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t808\t{now}"
      handle.flush
def label_808 : Fin 4042 := ⟨808, by decide +kernel⟩
noncomputable def raw_808 : RawOp :=
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
    807
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t808\t{now}"
      handle.flush
noncomputable def record_808 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_808 raw_808
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t809\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t809\t{now}"
      handle.flush
def label_809 : Fin 4042 := ⟨809, by decide +kernel⟩
noncomputable def raw_809 : RawOp :=
  RawOp.move
    Dir.left
    808
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t809\t{now}"
      handle.flush
noncomputable def record_809 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_809 raw_809
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t810\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t810\t{now}"
      handle.flush
def label_810 : Fin 4042 := ⟨810, by decide +kernel⟩
noncomputable def raw_810 : RawOp :=
  RawOp.jump
    ⟨#[
      812,
      812,
      812,
      812,
      812
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t810\t{now}"
      handle.flush
noncomputable def record_810 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_810 raw_810
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t811\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t811\t{now}"
      handle.flush
def label_811 : Fin 4042 := ⟨811, by decide +kernel⟩
noncomputable def raw_811 : RawOp :=
  RawOp.move
    Dir.right
    810
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t811\t{now}"
      handle.flush
noncomputable def record_811 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_811 raw_811
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t812\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t812\t{now}"
      handle.flush
def label_812 : Fin 4042 := ⟨812, by decide +kernel⟩
noncomputable def raw_812 : RawOp :=
  RawOp.absent
    bounded_4_0
    809
    811
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t812\t{now}"
      handle.flush
noncomputable def record_812 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_812 raw_812
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t813\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t813\t{now}"
      handle.flush
def label_813 : Fin 4042 := ⟨813, by decide +kernel⟩
noncomputable def raw_813 : RawOp :=
  RawOp.jump
    ⟨#[
      2664,
      2664,
      2664,
      2664,
      2664
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t813\t{now}"
      handle.flush
noncomputable def record_813 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_813 raw_813
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t814\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t814\t{now}"
      handle.flush
def label_814 : Fin 4042 := ⟨814, by decide +kernel⟩
noncomputable def raw_814 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    813
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t814\t{now}"
      handle.flush
noncomputable def record_814 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_814 raw_814
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t815\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t815\t{now}"
      handle.flush
def label_815 : Fin 4042 := ⟨815, by decide +kernel⟩
noncomputable def raw_815 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    813
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t815\t{now}"
      handle.flush
noncomputable def record_815 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_815 raw_815
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t816\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t816\t{now}"
      handle.flush
def label_816 : Fin 4042 := ⟨816, by decide +kernel⟩
noncomputable def raw_816 : RawOp :=
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
    815
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t816\t{now}"
      handle.flush
noncomputable def record_816 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_816 raw_816
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t817\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t817\t{now}"
      handle.flush
def label_817 : Fin 4042 := ⟨817, by decide +kernel⟩
noncomputable def raw_817 : RawOp :=
  RawOp.move
    Dir.left
    816
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t817\t{now}"
      handle.flush
noncomputable def record_817 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_817 raw_817
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t818\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t818\t{now}"
      handle.flush
def label_818 : Fin 4042 := ⟨818, by decide +kernel⟩
noncomputable def raw_818 : RawOp :=
  RawOp.marker
    814
    817
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t818\t{now}"
      handle.flush
noncomputable def record_818 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_818 raw_818
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t819\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t819\t{now}"
      handle.flush
def label_819 : Fin 4042 := ⟨819, by decide +kernel⟩
noncomputable def raw_819 : RawOp :=
  RawOp.move
    Dir.right
    92
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t819\t{now}"
      handle.flush
noncomputable def record_819 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_819 raw_819
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t820\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t820\t{now}"
      handle.flush
def label_820 : Fin 4042 := ⟨820, by decide +kernel⟩
noncomputable def raw_820 : RawOp :=
  RawOp.absent
    bounded_4_0
    818
    819
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t820\t{now}"
      handle.flush
noncomputable def record_820 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_820 raw_820
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t821\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t821\t{now}"
      handle.flush
def label_821 : Fin 4042 := ⟨821, by decide +kernel⟩
noncomputable def raw_821 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    801
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t821\t{now}"
      handle.flush
noncomputable def record_821 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_821 raw_821
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t822\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t822\t{now}"
      handle.flush
def label_822 : Fin 4042 := ⟨822, by decide +kernel⟩
noncomputable def raw_822 : RawOp :=
  RawOp.jump
    ⟨#[
      824,
      824,
      824,
      824,
      824
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t822\t{now}"
      handle.flush
noncomputable def record_822 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_822 raw_822
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t823\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t823\t{now}"
      handle.flush
def label_823 : Fin 4042 := ⟨823, by decide +kernel⟩
noncomputable def raw_823 : RawOp :=
  RawOp.move
    Dir.right
    822
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t823\t{now}"
      handle.flush
noncomputable def record_823 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_823 raw_823
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t824\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t824\t{now}"
      handle.flush
def label_824 : Fin 4042 := ⟨824, by decide +kernel⟩
noncomputable def raw_824 : RawOp :=
  RawOp.absent
    bounded_4_0
    821
    823
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t824\t{now}"
      handle.flush
noncomputable def record_824 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_824 raw_824
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t825\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t825\t{now}"
      handle.flush
def label_825 : Fin 4042 := ⟨825, by decide +kernel⟩
noncomputable def raw_825 : RawOp :=
  RawOp.jump
    ⟨#[
      2679,
      2679,
      2679,
      2679,
      2679
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t825\t{now}"
      handle.flush
noncomputable def record_825 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_825 raw_825
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t826\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t826\t{now}"
      handle.flush
def label_826 : Fin 4042 := ⟨826, by decide +kernel⟩
noncomputable def raw_826 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    825
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t826\t{now}"
      handle.flush
noncomputable def record_826 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_826 raw_826
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t827\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t827\t{now}"
      handle.flush
def label_827 : Fin 4042 := ⟨827, by decide +kernel⟩
noncomputable def raw_827 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    825
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t827\t{now}"
      handle.flush
noncomputable def record_827 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_827 raw_827
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t828\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t828\t{now}"
      handle.flush
def label_828 : Fin 4042 := ⟨828, by decide +kernel⟩
noncomputable def raw_828 : RawOp :=
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
    827
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t828\t{now}"
      handle.flush
noncomputable def record_828 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_828 raw_828
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t829\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t829\t{now}"
      handle.flush
def label_829 : Fin 4042 := ⟨829, by decide +kernel⟩
noncomputable def raw_829 : RawOp :=
  RawOp.move
    Dir.left
    828
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t829\t{now}"
      handle.flush
noncomputable def record_829 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_829 raw_829
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t830\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t830\t{now}"
      handle.flush
def label_830 : Fin 4042 := ⟨830, by decide +kernel⟩
noncomputable def raw_830 : RawOp :=
  RawOp.marker
    826
    829
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t830\t{now}"
      handle.flush
noncomputable def record_830 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_830 raw_830
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t831\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t831\t{now}"
      handle.flush
def label_831 : Fin 4042 := ⟨831, by decide +kernel⟩
noncomputable def raw_831 : RawOp :=
  RawOp.move
    Dir.right
    94
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t831\t{now}"
      handle.flush
noncomputable def record_831 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_831 raw_831
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t832\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t832\t{now}"
      handle.flush
def label_832 : Fin 4042 := ⟨832, by decide +kernel⟩
noncomputable def raw_832 : RawOp :=
  RawOp.absent
    bounded_4_1
    830
    831
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t832\t{now}"
      handle.flush
noncomputable def record_832 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_832 raw_832
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t833\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t833\t{now}"
      handle.flush
def label_833 : Fin 4042 := ⟨833, by decide +kernel⟩
noncomputable def raw_833 : RawOp :=
  RawOp.jump
    ⟨#[
      2673,
      2673,
      2673,
      2673,
      2673
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t833\t{now}"
      handle.flush
noncomputable def record_833 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_833 raw_833
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t834\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t834\t{now}"
      handle.flush
def label_834 : Fin 4042 := ⟨834, by decide +kernel⟩
noncomputable def raw_834 : RawOp :=
  RawOp.move
    Dir.right
    833
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t834\t{now}"
      handle.flush
noncomputable def record_834 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_834 raw_834
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t835\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t835\t{now}"
      handle.flush
def label_835 : Fin 4042 := ⟨835, by decide +kernel⟩
noncomputable def raw_835 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    834
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t835\t{now}"
      handle.flush
noncomputable def record_835 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_835 raw_835
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t836\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t836\t{now}"
      handle.flush
def label_836 : Fin 4042 := ⟨836, by decide +kernel⟩
noncomputable def raw_836 : RawOp :=
  RawOp.jump
    ⟨#[
      838,
      838,
      838,
      838,
      838
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t836\t{now}"
      handle.flush
noncomputable def record_836 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_836 raw_836
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t837\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t837\t{now}"
      handle.flush
def label_837 : Fin 4042 := ⟨837, by decide +kernel⟩
noncomputable def raw_837 : RawOp :=
  RawOp.move
    Dir.right
    836
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t837\t{now}"
      handle.flush
noncomputable def record_837 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_837 raw_837
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t838\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t838\t{now}"
      handle.flush
def label_838 : Fin 4042 := ⟨838, by decide +kernel⟩
noncomputable def raw_838 : RawOp :=
  RawOp.absent
    bounded_4_1
    835
    837
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t838\t{now}"
      handle.flush
noncomputable def record_838 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_838 raw_838
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t839\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t839\t{now}"
      handle.flush
def label_839 : Fin 4042 := ⟨839, by decide +kernel⟩
noncomputable def raw_839 : RawOp :=
  RawOp.jump
    ⟨#[
      2692,
      2692,
      2692,
      2692,
      2692
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t839\t{now}"
      handle.flush
noncomputable def record_839 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_839 raw_839
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t840\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t840\t{now}"
      handle.flush
def label_840 : Fin 4042 := ⟨840, by decide +kernel⟩
noncomputable def raw_840 : RawOp :=
  RawOp.move
    Dir.right
    839
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t840\t{now}"
      handle.flush
noncomputable def record_840 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_840 raw_840
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t841\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t841\t{now}"
      handle.flush
def label_841 : Fin 4042 := ⟨841, by decide +kernel⟩
noncomputable def raw_841 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    840
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t841\t{now}"
      handle.flush
noncomputable def record_841 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_841 raw_841
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t842\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t842\t{now}"
      handle.flush
def label_842 : Fin 4042 := ⟨842, by decide +kernel⟩
noncomputable def raw_842 : RawOp :=
  RawOp.jump
    ⟨#[
      844,
      844,
      844,
      844,
      844
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t842\t{now}"
      handle.flush
noncomputable def record_842 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_842 raw_842
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t843\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t843\t{now}"
      handle.flush
def label_843 : Fin 4042 := ⟨843, by decide +kernel⟩
noncomputable def raw_843 : RawOp :=
  RawOp.move
    Dir.right
    842
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t843\t{now}"
      handle.flush
noncomputable def record_843 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_843 raw_843
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t844\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t844\t{now}"
      handle.flush
def label_844 : Fin 4042 := ⟨844, by decide +kernel⟩
noncomputable def raw_844 : RawOp :=
  RawOp.absent
    bounded_4_1
    841
    843
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t844\t{now}"
      handle.flush
noncomputable def record_844 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_844 raw_844
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t845\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t845\t{now}"
      handle.flush
def label_845 : Fin 4042 := ⟨845, by decide +kernel⟩
noncomputable def raw_845 : RawOp :=
  RawOp.jump
    ⟨#[
      2698,
      2698,
      2698,
      2698,
      2698
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t845\t{now}"
      handle.flush
noncomputable def record_845 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_845 raw_845
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t846\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t846\t{now}"
      handle.flush
def label_846 : Fin 4042 := ⟨846, by decide +kernel⟩
noncomputable def raw_846 : RawOp :=
  RawOp.move
    Dir.right
    845
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t846\t{now}"
      handle.flush
noncomputable def record_846 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_846 raw_846
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t847\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t847\t{now}"
      handle.flush
def label_847 : Fin 4042 := ⟨847, by decide +kernel⟩
noncomputable def raw_847 : RawOp :=
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
    846
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t847\t{now}"
      handle.flush
noncomputable def record_847 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_847 raw_847
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t848\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t848\t{now}"
      handle.flush
def label_848 : Fin 4042 := ⟨848, by decide +kernel⟩
noncomputable def raw_848 : RawOp :=
  RawOp.move
    Dir.left
    847
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t848\t{now}"
      handle.flush
noncomputable def record_848 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_848 raw_848
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t849\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t849\t{now}"
      handle.flush
def label_849 : Fin 4042 := ⟨849, by decide +kernel⟩
noncomputable def raw_849 : RawOp :=
  RawOp.jump
    ⟨#[
      851,
      851,
      851,
      851,
      851
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t849\t{now}"
      handle.flush
noncomputable def record_849 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_849 raw_849
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t850\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t850\t{now}"
      handle.flush
def label_850 : Fin 4042 := ⟨850, by decide +kernel⟩
noncomputable def raw_850 : RawOp :=
  RawOp.move
    Dir.right
    849
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t850\t{now}"
      handle.flush
noncomputable def record_850 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_850 raw_850
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t851\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t851\t{now}"
      handle.flush
def label_851 : Fin 4042 := ⟨851, by decide +kernel⟩
noncomputable def raw_851 : RawOp :=
  RawOp.absent
    bounded_4_0
    848
    850
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t851\t{now}"
      handle.flush
noncomputable def record_851 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_851 raw_851
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t852\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t852\t{now}"
      handle.flush
def label_852 : Fin 4042 := ⟨852, by decide +kernel⟩
noncomputable def raw_852 : RawOp :=
  RawOp.jump
    ⟨#[
      2708,
      2708,
      2708,
      2708,
      2708
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t852\t{now}"
      handle.flush
noncomputable def record_852 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_852 raw_852
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t853\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t853\t{now}"
      handle.flush
def label_853 : Fin 4042 := ⟨853, by decide +kernel⟩
noncomputable def raw_853 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    852
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t853\t{now}"
      handle.flush
noncomputable def record_853 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_853 raw_853
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t854\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t854\t{now}"
      handle.flush
def label_854 : Fin 4042 := ⟨854, by decide +kernel⟩
noncomputable def raw_854 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    852
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t854\t{now}"
      handle.flush
noncomputable def record_854 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_854 raw_854
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t855\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t855\t{now}"
      handle.flush
def label_855 : Fin 4042 := ⟨855, by decide +kernel⟩
noncomputable def raw_855 : RawOp :=
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
    854
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t855\t{now}"
      handle.flush
noncomputable def record_855 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_855 raw_855
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t856\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t856\t{now}"
      handle.flush
def label_856 : Fin 4042 := ⟨856, by decide +kernel⟩
noncomputable def raw_856 : RawOp :=
  RawOp.move
    Dir.left
    855
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t856\t{now}"
      handle.flush
noncomputable def record_856 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_856 raw_856
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t857\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t857\t{now}"
      handle.flush
def label_857 : Fin 4042 := ⟨857, by decide +kernel⟩
noncomputable def raw_857 : RawOp :=
  RawOp.marker
    853
    856
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t857\t{now}"
      handle.flush
noncomputable def record_857 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_857 raw_857
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t858\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t858\t{now}"
      handle.flush
def label_858 : Fin 4042 := ⟨858, by decide +kernel⟩
noncomputable def raw_858 : RawOp :=
  RawOp.move
    Dir.right
    95
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t858\t{now}"
      handle.flush
noncomputable def record_858 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_858 raw_858
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t859\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t859\t{now}"
      handle.flush
def label_859 : Fin 4042 := ⟨859, by decide +kernel⟩
noncomputable def raw_859 : RawOp :=
  RawOp.absent
    bounded_4_0
    857
    858
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t859\t{now}"
      handle.flush
noncomputable def record_859 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_859 raw_859
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t860\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t860\t{now}"
      handle.flush
def label_860 : Fin 4042 := ⟨860, by decide +kernel⟩
noncomputable def raw_860 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    840
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t860\t{now}"
      handle.flush
noncomputable def record_860 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_860 raw_860
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t861\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t861\t{now}"
      handle.flush
def label_861 : Fin 4042 := ⟨861, by decide +kernel⟩
noncomputable def raw_861 : RawOp :=
  RawOp.jump
    ⟨#[
      863,
      863,
      863,
      863,
      863
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t861\t{now}"
      handle.flush
noncomputable def record_861 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_861 raw_861
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t862\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t862\t{now}"
      handle.flush
def label_862 : Fin 4042 := ⟨862, by decide +kernel⟩
noncomputable def raw_862 : RawOp :=
  RawOp.move
    Dir.right
    861
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t862\t{now}"
      handle.flush
noncomputable def record_862 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_862 raw_862
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t863\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t863\t{now}"
      handle.flush
def label_863 : Fin 4042 := ⟨863, by decide +kernel⟩
noncomputable def raw_863 : RawOp :=
  RawOp.absent
    bounded_4_0
    860
    862
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t863\t{now}"
      handle.flush
noncomputable def record_863 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_863 raw_863
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t864\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t864\t{now}"
      handle.flush
def label_864 : Fin 4042 := ⟨864, by decide +kernel⟩
noncomputable def raw_864 : RawOp :=
  RawOp.jump
    ⟨#[
      2723,
      2723,
      2723,
      2723,
      2723
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t864\t{now}"
      handle.flush
noncomputable def record_864 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_864 raw_864
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t865\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t865\t{now}"
      handle.flush
def label_865 : Fin 4042 := ⟨865, by decide +kernel⟩
noncomputable def raw_865 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    864
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t865\t{now}"
      handle.flush
noncomputable def record_865 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_865 raw_865
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t866\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t866\t{now}"
      handle.flush
def label_866 : Fin 4042 := ⟨866, by decide +kernel⟩
noncomputable def raw_866 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    864
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t866\t{now}"
      handle.flush
noncomputable def record_866 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_866 raw_866
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t867\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t867\t{now}"
      handle.flush
def label_867 : Fin 4042 := ⟨867, by decide +kernel⟩
noncomputable def raw_867 : RawOp :=
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
    866
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t867\t{now}"
      handle.flush
noncomputable def record_867 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_867 raw_867
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t868\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t868\t{now}"
      handle.flush
def label_868 : Fin 4042 := ⟨868, by decide +kernel⟩
noncomputable def raw_868 : RawOp :=
  RawOp.move
    Dir.left
    867
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t868\t{now}"
      handle.flush
noncomputable def record_868 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_868 raw_868
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t869\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t869\t{now}"
      handle.flush
def label_869 : Fin 4042 := ⟨869, by decide +kernel⟩
noncomputable def raw_869 : RawOp :=
  RawOp.marker
    865
    868
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t869\t{now}"
      handle.flush
noncomputable def record_869 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_869 raw_869
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t870\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t870\t{now}"
      handle.flush
def label_870 : Fin 4042 := ⟨870, by decide +kernel⟩
noncomputable def raw_870 : RawOp :=
  RawOp.move
    Dir.right
    97
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t870\t{now}"
      handle.flush
noncomputable def record_870 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_870 raw_870
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t871\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t871\t{now}"
      handle.flush
def label_871 : Fin 4042 := ⟨871, by decide +kernel⟩
noncomputable def raw_871 : RawOp :=
  RawOp.absent
    bounded_4_1
    869
    870
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t871\t{now}"
      handle.flush
noncomputable def record_871 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_871 raw_871
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t872\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t872\t{now}"
      handle.flush
def label_872 : Fin 4042 := ⟨872, by decide +kernel⟩
noncomputable def raw_872 : RawOp :=
  RawOp.jump
    ⟨#[
      2717,
      2717,
      2717,
      2717,
      2717
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t872\t{now}"
      handle.flush
noncomputable def record_872 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_872 raw_872
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t873\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t873\t{now}"
      handle.flush
def label_873 : Fin 4042 := ⟨873, by decide +kernel⟩
noncomputable def raw_873 : RawOp :=
  RawOp.move
    Dir.right
    872
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t873\t{now}"
      handle.flush
noncomputable def record_873 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_873 raw_873
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t874\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t874\t{now}"
      handle.flush
def label_874 : Fin 4042 := ⟨874, by decide +kernel⟩
noncomputable def raw_874 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    873
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t874\t{now}"
      handle.flush
noncomputable def record_874 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_874 raw_874
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t875\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t875\t{now}"
      handle.flush
def label_875 : Fin 4042 := ⟨875, by decide +kernel⟩
noncomputable def raw_875 : RawOp :=
  RawOp.jump
    ⟨#[
      877,
      877,
      877,
      877,
      877
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t875\t{now}"
      handle.flush
noncomputable def record_875 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_875 raw_875
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t876\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t876\t{now}"
      handle.flush
def label_876 : Fin 4042 := ⟨876, by decide +kernel⟩
noncomputable def raw_876 : RawOp :=
  RawOp.move
    Dir.right
    875
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t876\t{now}"
      handle.flush
noncomputable def record_876 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_876 raw_876
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t877\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t877\t{now}"
      handle.flush
def label_877 : Fin 4042 := ⟨877, by decide +kernel⟩
noncomputable def raw_877 : RawOp :=
  RawOp.absent
    bounded_4_1
    874
    876
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t877\t{now}"
      handle.flush
noncomputable def record_877 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_877 raw_877
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t878\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t878\t{now}"
      handle.flush
def label_878 : Fin 4042 := ⟨878, by decide +kernel⟩
noncomputable def raw_878 : RawOp :=
  RawOp.jump
    ⟨#[
      2736,
      2736,
      2736,
      2736,
      2736
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t878\t{now}"
      handle.flush
noncomputable def record_878 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_878 raw_878
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t879\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t879\t{now}"
      handle.flush
def label_879 : Fin 4042 := ⟨879, by decide +kernel⟩
noncomputable def raw_879 : RawOp :=
  RawOp.move
    Dir.right
    878
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t879\t{now}"
      handle.flush
noncomputable def record_879 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_879 raw_879
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t880\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t880\t{now}"
      handle.flush
def label_880 : Fin 4042 := ⟨880, by decide +kernel⟩
noncomputable def raw_880 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    879
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t880\t{now}"
      handle.flush
noncomputable def record_880 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_880 raw_880
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t881\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t881\t{now}"
      handle.flush
def label_881 : Fin 4042 := ⟨881, by decide +kernel⟩
noncomputable def raw_881 : RawOp :=
  RawOp.jump
    ⟨#[
      883,
      883,
      883,
      883,
      883
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t881\t{now}"
      handle.flush
noncomputable def record_881 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_881 raw_881
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t882\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t882\t{now}"
      handle.flush
def label_882 : Fin 4042 := ⟨882, by decide +kernel⟩
noncomputable def raw_882 : RawOp :=
  RawOp.move
    Dir.right
    881
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t882\t{now}"
      handle.flush
noncomputable def record_882 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_882 raw_882
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t883\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t883\t{now}"
      handle.flush
def label_883 : Fin 4042 := ⟨883, by decide +kernel⟩
noncomputable def raw_883 : RawOp :=
  RawOp.absent
    bounded_4_1
    880
    882
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t883\t{now}"
      handle.flush
noncomputable def record_883 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_883 raw_883
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t884\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t884\t{now}"
      handle.flush
def label_884 : Fin 4042 := ⟨884, by decide +kernel⟩
noncomputable def raw_884 : RawOp :=
  RawOp.jump
    ⟨#[
      2742,
      2742,
      2742,
      2742,
      2742
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t884\t{now}"
      handle.flush
noncomputable def record_884 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_884 raw_884
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t885\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t885\t{now}"
      handle.flush
def label_885 : Fin 4042 := ⟨885, by decide +kernel⟩
noncomputable def raw_885 : RawOp :=
  RawOp.move
    Dir.right
    884
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t885\t{now}"
      handle.flush
noncomputable def record_885 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_885 raw_885
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t886\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t886\t{now}"
      handle.flush
def label_886 : Fin 4042 := ⟨886, by decide +kernel⟩
noncomputable def raw_886 : RawOp :=
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
    885
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t886\t{now}"
      handle.flush
noncomputable def record_886 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_886 raw_886
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t887\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t887\t{now}"
      handle.flush
def label_887 : Fin 4042 := ⟨887, by decide +kernel⟩
noncomputable def raw_887 : RawOp :=
  RawOp.move
    Dir.left
    886
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t887\t{now}"
      handle.flush
noncomputable def record_887 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_887 raw_887
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t888\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t888\t{now}"
      handle.flush
def label_888 : Fin 4042 := ⟨888, by decide +kernel⟩
noncomputable def raw_888 : RawOp :=
  RawOp.jump
    ⟨#[
      890,
      890,
      890,
      890,
      890
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t888\t{now}"
      handle.flush
noncomputable def record_888 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_888 raw_888
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t889\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t889\t{now}"
      handle.flush
def label_889 : Fin 4042 := ⟨889, by decide +kernel⟩
noncomputable def raw_889 : RawOp :=
  RawOp.move
    Dir.right
    888
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t889\t{now}"
      handle.flush
noncomputable def record_889 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_889 raw_889
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t890\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t890\t{now}"
      handle.flush
def label_890 : Fin 4042 := ⟨890, by decide +kernel⟩
noncomputable def raw_890 : RawOp :=
  RawOp.absent
    bounded_4_0
    887
    889
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t890\t{now}"
      handle.flush
noncomputable def record_890 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_890 raw_890
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t891\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t891\t{now}"
      handle.flush
def label_891 : Fin 4042 := ⟨891, by decide +kernel⟩
noncomputable def raw_891 : RawOp :=
  RawOp.jump
    ⟨#[
      2752,
      2752,
      2752,
      2752,
      2752
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t891\t{now}"
      handle.flush
noncomputable def record_891 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_891 raw_891
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t892\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t892\t{now}"
      handle.flush
def label_892 : Fin 4042 := ⟨892, by decide +kernel⟩
noncomputable def raw_892 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    891
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t892\t{now}"
      handle.flush
noncomputable def record_892 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_892 raw_892
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t893\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t893\t{now}"
      handle.flush
def label_893 : Fin 4042 := ⟨893, by decide +kernel⟩
noncomputable def raw_893 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    891
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t893\t{now}"
      handle.flush
noncomputable def record_893 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_893 raw_893
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t894\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t894\t{now}"
      handle.flush
def label_894 : Fin 4042 := ⟨894, by decide +kernel⟩
noncomputable def raw_894 : RawOp :=
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
    893
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t894\t{now}"
      handle.flush
noncomputable def record_894 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_894 raw_894
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t895\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t895\t{now}"
      handle.flush
def label_895 : Fin 4042 := ⟨895, by decide +kernel⟩
noncomputable def raw_895 : RawOp :=
  RawOp.move
    Dir.left
    894
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t895\t{now}"
      handle.flush
noncomputable def record_895 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_895 raw_895
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t896\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t896\t{now}"
      handle.flush
def label_896 : Fin 4042 := ⟨896, by decide +kernel⟩
noncomputable def raw_896 : RawOp :=
  RawOp.marker
    892
    895
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t896\t{now}"
      handle.flush
noncomputable def record_896 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_896 raw_896
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t897\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t897\t{now}"
      handle.flush
def label_897 : Fin 4042 := ⟨897, by decide +kernel⟩
noncomputable def raw_897 : RawOp :=
  RawOp.move
    Dir.right
    98
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t897\t{now}"
      handle.flush
noncomputable def record_897 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_897 raw_897
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t898\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t898\t{now}"
      handle.flush
def label_898 : Fin 4042 := ⟨898, by decide +kernel⟩
noncomputable def raw_898 : RawOp :=
  RawOp.absent
    bounded_4_0
    896
    897
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t898\t{now}"
      handle.flush
noncomputable def record_898 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_898 raw_898
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t899\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t899\t{now}"
      handle.flush
def label_899 : Fin 4042 := ⟨899, by decide +kernel⟩
noncomputable def raw_899 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    879
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t899\t{now}"
      handle.flush
noncomputable def record_899 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_899 raw_899
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t900\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t900\t{now}"
      handle.flush
def label_900 : Fin 4042 := ⟨900, by decide +kernel⟩
noncomputable def raw_900 : RawOp :=
  RawOp.jump
    ⟨#[
      902,
      902,
      902,
      902,
      902
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t900\t{now}"
      handle.flush
noncomputable def record_900 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_900 raw_900
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t901\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t901\t{now}"
      handle.flush
def label_901 : Fin 4042 := ⟨901, by decide +kernel⟩
noncomputable def raw_901 : RawOp :=
  RawOp.move
    Dir.right
    900
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t901\t{now}"
      handle.flush
noncomputable def record_901 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_901 raw_901
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t902\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t902\t{now}"
      handle.flush
def label_902 : Fin 4042 := ⟨902, by decide +kernel⟩
noncomputable def raw_902 : RawOp :=
  RawOp.absent
    bounded_4_0
    899
    901
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t902\t{now}"
      handle.flush
noncomputable def record_902 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_902 raw_902
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t903\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t903\t{now}"
      handle.flush
def label_903 : Fin 4042 := ⟨903, by decide +kernel⟩
noncomputable def raw_903 : RawOp :=
  RawOp.jump
    ⟨#[
      2766,
      2766,
      2766,
      2766,
      2766
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t903\t{now}"
      handle.flush
noncomputable def record_903 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_903 raw_903
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t904\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t904\t{now}"
      handle.flush
def label_904 : Fin 4042 := ⟨904, by decide +kernel⟩
noncomputable def raw_904 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    903
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t904\t{now}"
      handle.flush
noncomputable def record_904 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_904 raw_904
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t905\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t905\t{now}"
      handle.flush
def label_905 : Fin 4042 := ⟨905, by decide +kernel⟩
noncomputable def raw_905 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    903
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t905\t{now}"
      handle.flush
noncomputable def record_905 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_905 raw_905
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t906\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t906\t{now}"
      handle.flush
def label_906 : Fin 4042 := ⟨906, by decide +kernel⟩
noncomputable def raw_906 : RawOp :=
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
    905
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t906\t{now}"
      handle.flush
noncomputable def record_906 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_906 raw_906
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t907\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t907\t{now}"
      handle.flush
def label_907 : Fin 4042 := ⟨907, by decide +kernel⟩
noncomputable def raw_907 : RawOp :=
  RawOp.move
    Dir.left
    906
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t907\t{now}"
      handle.flush
noncomputable def record_907 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_907 raw_907
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t908\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t908\t{now}"
      handle.flush
def label_908 : Fin 4042 := ⟨908, by decide +kernel⟩
noncomputable def raw_908 : RawOp :=
  RawOp.marker
    904
    907
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t908\t{now}"
      handle.flush
noncomputable def record_908 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_908 raw_908
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t909\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t909\t{now}"
      handle.flush
def label_909 : Fin 4042 := ⟨909, by decide +kernel⟩
noncomputable def raw_909 : RawOp :=
  RawOp.move
    Dir.right
    100
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t909\t{now}"
      handle.flush
noncomputable def record_909 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_909 raw_909
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t910\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t910\t{now}"
      handle.flush
def label_910 : Fin 4042 := ⟨910, by decide +kernel⟩
noncomputable def raw_910 : RawOp :=
  RawOp.absent
    bounded_4_1
    908
    909
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t910\t{now}"
      handle.flush
noncomputable def record_910 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_910 raw_910
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t911\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t911\t{now}"
      handle.flush
def label_911 : Fin 4042 := ⟨911, by decide +kernel⟩
noncomputable def raw_911 : RawOp :=
  RawOp.jump
    ⟨#[
      2760,
      2760,
      2760,
      2760,
      2760
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t911\t{now}"
      handle.flush
noncomputable def record_911 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_911 raw_911
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t912\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t912\t{now}"
      handle.flush
def label_912 : Fin 4042 := ⟨912, by decide +kernel⟩
noncomputable def raw_912 : RawOp :=
  RawOp.move
    Dir.right
    911
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t912\t{now}"
      handle.flush
noncomputable def record_912 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_912 raw_912
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t913\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t913\t{now}"
      handle.flush
def label_913 : Fin 4042 := ⟨913, by decide +kernel⟩
noncomputable def raw_913 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    912
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t913\t{now}"
      handle.flush
noncomputable def record_913 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_913 raw_913
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t914\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t914\t{now}"
      handle.flush
def label_914 : Fin 4042 := ⟨914, by decide +kernel⟩
noncomputable def raw_914 : RawOp :=
  RawOp.jump
    ⟨#[
      916,
      916,
      916,
      916,
      916
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t914\t{now}"
      handle.flush
noncomputable def record_914 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_914 raw_914
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t915\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t915\t{now}"
      handle.flush
def label_915 : Fin 4042 := ⟨915, by decide +kernel⟩
noncomputable def raw_915 : RawOp :=
  RawOp.move
    Dir.right
    914
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t915\t{now}"
      handle.flush
noncomputable def record_915 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_915 raw_915
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t916\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t916\t{now}"
      handle.flush
def label_916 : Fin 4042 := ⟨916, by decide +kernel⟩
noncomputable def raw_916 : RawOp :=
  RawOp.absent
    bounded_4_1
    913
    915
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t916\t{now}"
      handle.flush
noncomputable def record_916 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_916 raw_916
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t917\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t917\t{now}"
      handle.flush
def label_917 : Fin 4042 := ⟨917, by decide +kernel⟩
noncomputable def raw_917 : RawOp :=
  RawOp.jump
    ⟨#[
      2779,
      2779,
      2779,
      2779,
      2779
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t917\t{now}"
      handle.flush
noncomputable def record_917 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_917 raw_917
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t918\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t918\t{now}"
      handle.flush
def label_918 : Fin 4042 := ⟨918, by decide +kernel⟩
noncomputable def raw_918 : RawOp :=
  RawOp.move
    Dir.right
    917
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t918\t{now}"
      handle.flush
noncomputable def record_918 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_918 raw_918
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t919\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t919\t{now}"
      handle.flush
def label_919 : Fin 4042 := ⟨919, by decide +kernel⟩
noncomputable def raw_919 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    918
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t919\t{now}"
      handle.flush
noncomputable def record_919 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_919 raw_919
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t920\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t920\t{now}"
      handle.flush
def label_920 : Fin 4042 := ⟨920, by decide +kernel⟩
noncomputable def raw_920 : RawOp :=
  RawOp.jump
    ⟨#[
      922,
      922,
      922,
      922,
      922
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t920\t{now}"
      handle.flush
noncomputable def record_920 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_920 raw_920
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t921\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t921\t{now}"
      handle.flush
def label_921 : Fin 4042 := ⟨921, by decide +kernel⟩
noncomputable def raw_921 : RawOp :=
  RawOp.move
    Dir.right
    920
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t921\t{now}"
      handle.flush
noncomputable def record_921 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_921 raw_921
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t922\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t922\t{now}"
      handle.flush
def label_922 : Fin 4042 := ⟨922, by decide +kernel⟩
noncomputable def raw_922 : RawOp :=
  RawOp.absent
    bounded_4_1
    919
    921
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t922\t{now}"
      handle.flush
noncomputable def record_922 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_922 raw_922
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t923\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t923\t{now}"
      handle.flush
def label_923 : Fin 4042 := ⟨923, by decide +kernel⟩
noncomputable def raw_923 : RawOp :=
  RawOp.jump
    ⟨#[
      2785,
      2785,
      2785,
      2785,
      2785
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t923\t{now}"
      handle.flush
noncomputable def record_923 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_923 raw_923
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t924\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t924\t{now}"
      handle.flush
def label_924 : Fin 4042 := ⟨924, by decide +kernel⟩
noncomputable def raw_924 : RawOp :=
  RawOp.move
    Dir.right
    923
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t924\t{now}"
      handle.flush
noncomputable def record_924 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_924 raw_924
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t925\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t925\t{now}"
      handle.flush
def label_925 : Fin 4042 := ⟨925, by decide +kernel⟩
noncomputable def raw_925 : RawOp :=
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
    924
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t925\t{now}"
      handle.flush
noncomputable def record_925 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_925 raw_925
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t926\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t926\t{now}"
      handle.flush
def label_926 : Fin 4042 := ⟨926, by decide +kernel⟩
noncomputable def raw_926 : RawOp :=
  RawOp.move
    Dir.left
    925
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t926\t{now}"
      handle.flush
noncomputable def record_926 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_926 raw_926
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t927\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t927\t{now}"
      handle.flush
def label_927 : Fin 4042 := ⟨927, by decide +kernel⟩
noncomputable def raw_927 : RawOp :=
  RawOp.jump
    ⟨#[
      929,
      929,
      929,
      929,
      929
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t927\t{now}"
      handle.flush
noncomputable def record_927 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_927 raw_927
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t928\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t928\t{now}"
      handle.flush
def label_928 : Fin 4042 := ⟨928, by decide +kernel⟩
noncomputable def raw_928 : RawOp :=
  RawOp.move
    Dir.right
    927
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t928\t{now}"
      handle.flush
noncomputable def record_928 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_928 raw_928
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t929\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t929\t{now}"
      handle.flush
def label_929 : Fin 4042 := ⟨929, by decide +kernel⟩
noncomputable def raw_929 : RawOp :=
  RawOp.absent
    bounded_4_0
    926
    928
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t929\t{now}"
      handle.flush
noncomputable def record_929 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_929 raw_929
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t930\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t930\t{now}"
      handle.flush
def label_930 : Fin 4042 := ⟨930, by decide +kernel⟩
noncomputable def raw_930 : RawOp :=
  RawOp.jump
    ⟨#[
      2795,
      2795,
      2795,
      2795,
      2795
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t930\t{now}"
      handle.flush
noncomputable def record_930 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_930 raw_930
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t931\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t931\t{now}"
      handle.flush
def label_931 : Fin 4042 := ⟨931, by decide +kernel⟩
noncomputable def raw_931 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    930
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t931\t{now}"
      handle.flush
noncomputable def record_931 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_931 raw_931
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t932\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t932\t{now}"
      handle.flush
def label_932 : Fin 4042 := ⟨932, by decide +kernel⟩
noncomputable def raw_932 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    930
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t932\t{now}"
      handle.flush
noncomputable def record_932 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_932 raw_932
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t933\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t933\t{now}"
      handle.flush
def label_933 : Fin 4042 := ⟨933, by decide +kernel⟩
noncomputable def raw_933 : RawOp :=
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
    932
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t933\t{now}"
      handle.flush
noncomputable def record_933 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_933 raw_933
    61 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t934\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t934\t{now}"
      handle.flush
def label_934 : Fin 4042 := ⟨934, by decide +kernel⟩
noncomputable def raw_934 : RawOp :=
  RawOp.move
    Dir.left
    933
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t934\t{now}"
      handle.flush
noncomputable def record_934 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_934 raw_934
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t935\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t935\t{now}"
      handle.flush
def label_935 : Fin 4042 := ⟨935, by decide +kernel⟩
noncomputable def raw_935 : RawOp :=
  RawOp.marker
    931
    934
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t935\t{now}"
      handle.flush
noncomputable def record_935 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_935 raw_935
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t936\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t936\t{now}"
      handle.flush
def label_936 : Fin 4042 := ⟨936, by decide +kernel⟩
noncomputable def raw_936 : RawOp :=
  RawOp.move
    Dir.right
    101
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t936\t{now}"
      handle.flush
noncomputable def record_936 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_936 raw_936
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t937\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t937\t{now}"
      handle.flush
def label_937 : Fin 4042 := ⟨937, by decide +kernel⟩
noncomputable def raw_937 : RawOp :=
  RawOp.absent
    bounded_4_0
    935
    936
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t937\t{now}"
      handle.flush
noncomputable def record_937 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_937 raw_937
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t938\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t938\t{now}"
      handle.flush
def label_938 : Fin 4042 := ⟨938, by decide +kernel⟩
noncomputable def raw_938 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    918
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t938\t{now}"
      handle.flush
noncomputable def record_938 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_938 raw_938
    44 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t939\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t939\t{now}"
      handle.flush
def label_939 : Fin 4042 := ⟨939, by decide +kernel⟩
noncomputable def raw_939 : RawOp :=
  RawOp.jump
    ⟨#[
      941,
      941,
      941,
      941,
      941
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t939\t{now}"
      handle.flush
noncomputable def record_939 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_939 raw_939
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t940\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t940\t{now}"
      handle.flush
def label_940 : Fin 4042 := ⟨940, by decide +kernel⟩
noncomputable def raw_940 : RawOp :=
  RawOp.move
    Dir.right
    939
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t940\t{now}"
      handle.flush
noncomputable def record_940 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_940 raw_940
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t941\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t941\t{now}"
      handle.flush
def label_941 : Fin 4042 := ⟨941, by decide +kernel⟩
noncomputable def raw_941 : RawOp :=
  RawOp.absent
    bounded_4_0
    938
    940
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t941\t{now}"
      handle.flush
noncomputable def record_941 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_941 raw_941
    53 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t942\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t942\t{now}"
      handle.flush
def label_942 : Fin 4042 := ⟨942, by decide +kernel⟩
noncomputable def raw_942 : RawOp :=
  RawOp.jump
    ⟨#[
      2809,
      2809,
      2809,
      2809,
      2809
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t942\t{now}"
      handle.flush
noncomputable def record_942 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_942 raw_942
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t943\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t943\t{now}"
      handle.flush
def label_943 : Fin 4042 := ⟨943, by decide +kernel⟩
noncomputable def raw_943 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    942
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t943\t{now}"
      handle.flush
noncomputable def record_943 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_943 raw_943
    2 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t944\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t944\t{now}"
      handle.flush
def label_944 : Fin 4042 := ⟨944, by decide +kernel⟩
noncomputable def raw_944 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    942
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t944\t{now}"
      handle.flush
noncomputable def record_944 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_944 raw_944
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t945\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t945\t{now}"
      handle.flush
def label_945 : Fin 4042 := ⟨945, by decide +kernel⟩
noncomputable def raw_945 : RawOp :=
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
    944
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t945\t{now}"
      handle.flush
noncomputable def record_945 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_945 raw_945
    88 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t946\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t946\t{now}"
      handle.flush
def label_946 : Fin 4042 := ⟨946, by decide +kernel⟩
noncomputable def raw_946 : RawOp :=
  RawOp.move
    Dir.left
    945
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t946\t{now}"
      handle.flush
noncomputable def record_946 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_946 raw_946
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t947\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t947\t{now}"
      handle.flush
def label_947 : Fin 4042 := ⟨947, by decide +kernel⟩
noncomputable def raw_947 : RawOp :=
  RawOp.marker
    943
    946
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t947\t{now}"
      handle.flush
noncomputable def record_947 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_947 raw_947
    39 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t948\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t948\t{now}"
      handle.flush
def label_948 : Fin 4042 := ⟨948, by decide +kernel⟩
noncomputable def raw_948 : RawOp :=
  RawOp.move
    Dir.right
    103
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t948\t{now}"
      handle.flush
noncomputable def record_948 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_948 raw_948
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t949\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t949\t{now}"
      handle.flush
def label_949 : Fin 4042 := ⟨949, by decide +kernel⟩
noncomputable def raw_949 : RawOp :=
  RawOp.absent
    bounded_4_1
    947
    948
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t949\t{now}"
      handle.flush
noncomputable def record_949 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_949 raw_949
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t950\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t950\t{now}"
      handle.flush
def label_950 : Fin 4042 := ⟨950, by decide +kernel⟩
noncomputable def raw_950 : RawOp :=
  RawOp.jump
    ⟨#[
      2803,
      2803,
      2803,
      2803,
      2803
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t950\t{now}"
      handle.flush
noncomputable def record_950 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_950 raw_950
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t951\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t951\t{now}"
      handle.flush
def label_951 : Fin 4042 := ⟨951, by decide +kernel⟩
noncomputable def raw_951 : RawOp :=
  RawOp.move
    Dir.right
    950
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t951\t{now}"
      handle.flush
noncomputable def record_951 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_951 raw_951
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t952\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t952\t{now}"
      handle.flush
def label_952 : Fin 4042 := ⟨952, by decide +kernel⟩
noncomputable def raw_952 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4,
      bounded_5_4
    ], rfl⟩
    951
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t952\t{now}"
      handle.flush
noncomputable def record_952 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_952 raw_952
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t953\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t953\t{now}"
      handle.flush
def label_953 : Fin 4042 := ⟨953, by decide +kernel⟩
noncomputable def raw_953 : RawOp :=
  RawOp.jump
    ⟨#[
      955,
      955,
      955,
      955,
      955
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t953\t{now}"
      handle.flush
noncomputable def record_953 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_953 raw_953
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t954\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t954\t{now}"
      handle.flush
def label_954 : Fin 4042 := ⟨954, by decide +kernel⟩
noncomputable def raw_954 : RawOp :=
  RawOp.move
    Dir.right
    953
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t954\t{now}"
      handle.flush
noncomputable def record_954 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_954 raw_954
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t955\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t955\t{now}"
      handle.flush
def label_955 : Fin 4042 := ⟨955, by decide +kernel⟩
noncomputable def raw_955 : RawOp :=
  RawOp.absent
    bounded_4_1
    952
    954
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t955\t{now}"
      handle.flush
noncomputable def record_955 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_955 raw_955
    80 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t956\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t956\t{now}"
      handle.flush
def label_956 : Fin 4042 := ⟨956, by decide +kernel⟩
noncomputable def raw_956 : RawOp :=
  RawOp.jump
    ⟨#[
      2822,
      2822,
      2822,
      2822,
      2822
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t956\t{now}"
      handle.flush
noncomputable def record_956 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_956 raw_956
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t957\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t957\t{now}"
      handle.flush
def label_957 : Fin 4042 := ⟨957, by decide +kernel⟩
noncomputable def raw_957 : RawOp :=
  RawOp.move
    Dir.right
    956
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t957\t{now}"
      handle.flush
noncomputable def record_957 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_957 raw_957
    14 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t958\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t958\t{now}"
      handle.flush
def label_958 : Fin 4042 := ⟨958, by decide +kernel⟩
noncomputable def raw_958 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3,
      bounded_5_3
    ], rfl⟩
    957
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t958\t{now}"
      handle.flush
noncomputable def record_958 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_958 raw_958
    74 16
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t959\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_data\t959\t{now}"
      handle.flush
def label_959 : Fin 4042 := ⟨959, by decide +kernel⟩
noncomputable def raw_959 : RawOp :=
  RawOp.jump
    ⟨#[
      961,
      961,
      961,
      961,
      961
    ], rfl⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-details.tsv" .append fun handle ↦ do
      handle.putStrLn s!"recipe_check\t959\t{now}"
      handle.flush
noncomputable def record_959 : SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_959 raw_959
    1 1
    (by decide +kernel)
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/LocalScope4-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source-records\t960\t{now}"
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
noncomputable def collection_7_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_7) (.leaf record_8)
noncomputable def collection_9_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_9) (.leaf record_10)
noncomputable def collection_7_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_7_2 collection_9_2
noncomputable def collection_11_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_11) (.leaf record_12)
noncomputable def collection_13_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_13) (.leaf record_14)
noncomputable def collection_11_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_11_2 collection_13_2
noncomputable def collection_7_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_7_4 collection_11_4
noncomputable def collection_0_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_0_7 collection_7_8
noncomputable def collection_16_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_16) (.leaf record_17)
noncomputable def collection_15_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_15) collection_16_2
noncomputable def collection_18_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_18) (.leaf record_19)
noncomputable def collection_20_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_20) (.leaf record_21)
noncomputable def collection_18_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_18_2 collection_20_2
noncomputable def collection_15_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_15_3 collection_18_4
noncomputable def collection_22_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_22) (.leaf record_23)
noncomputable def collection_24_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_24) (.leaf record_25)
noncomputable def collection_22_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_22_2 collection_24_2
noncomputable def collection_26_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_26) (.leaf record_27)
noncomputable def collection_28_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_28) (.leaf record_29)
noncomputable def collection_26_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_26_2 collection_28_2
noncomputable def collection_22_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_22_4 collection_26_4
noncomputable def collection_15_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_15_7 collection_22_8
noncomputable def collection_0_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_0_15 collection_15_15
noncomputable def collection_31_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_31) (.leaf record_32)
noncomputable def collection_30_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_30) collection_31_2
noncomputable def collection_33_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_33) (.leaf record_34)
noncomputable def collection_35_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_35) (.leaf record_36)
noncomputable def collection_33_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_33_2 collection_35_2
noncomputable def collection_30_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_30_3 collection_33_4
noncomputable def collection_37_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_37) (.leaf record_38)
noncomputable def collection_39_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_39) (.leaf record_40)
noncomputable def collection_37_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_37_2 collection_39_2
noncomputable def collection_41_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_41) (.leaf record_42)
noncomputable def collection_43_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_43) (.leaf record_44)
noncomputable def collection_41_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_41_2 collection_43_2
noncomputable def collection_37_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_37_4 collection_41_4
noncomputable def collection_30_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_30_7 collection_37_8
noncomputable def collection_46_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_46) (.leaf record_47)
noncomputable def collection_45_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_45) collection_46_2
noncomputable def collection_48_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_48) (.leaf record_49)
noncomputable def collection_50_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_50) (.leaf record_51)
noncomputable def collection_48_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_48_2 collection_50_2
noncomputable def collection_45_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_45_3 collection_48_4
noncomputable def collection_52_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_52) (.leaf record_53)
noncomputable def collection_54_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_54) (.leaf record_55)
noncomputable def collection_52_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_52_2 collection_54_2
noncomputable def collection_56_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_56) (.leaf record_57)
noncomputable def collection_58_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_58) (.leaf record_59)
noncomputable def collection_56_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_56_2 collection_58_2
noncomputable def collection_52_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_52_4 collection_56_4
noncomputable def collection_45_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_45_7 collection_52_8
noncomputable def collection_30_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_30_15 collection_45_15
noncomputable def collection_0_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_0_30 collection_30_30
noncomputable def collection_61_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_61) (.leaf record_62)
noncomputable def collection_60_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_60) collection_61_2
noncomputable def collection_63_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_63) (.leaf record_64)
noncomputable def collection_65_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_65) (.leaf record_66)
noncomputable def collection_63_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_63_2 collection_65_2
noncomputable def collection_60_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_60_3 collection_63_4
noncomputable def collection_67_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_67) (.leaf record_68)
noncomputable def collection_69_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_69) (.leaf record_70)
noncomputable def collection_67_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_67_2 collection_69_2
noncomputable def collection_71_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_71) (.leaf record_72)
noncomputable def collection_73_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_73) (.leaf record_74)
noncomputable def collection_71_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_71_2 collection_73_2
noncomputable def collection_67_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_67_4 collection_71_4
noncomputable def collection_60_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_60_7 collection_67_8
noncomputable def collection_76_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_76) (.leaf record_77)
noncomputable def collection_75_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_75) collection_76_2
noncomputable def collection_78_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_78) (.leaf record_79)
noncomputable def collection_80_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_80) (.leaf record_81)
noncomputable def collection_78_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_78_2 collection_80_2
noncomputable def collection_75_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_75_3 collection_78_4
noncomputable def collection_82_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_82) (.leaf record_83)
noncomputable def collection_84_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_84) (.leaf record_85)
noncomputable def collection_82_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_82_2 collection_84_2
noncomputable def collection_86_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_86) (.leaf record_87)
noncomputable def collection_88_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_88) (.leaf record_89)
noncomputable def collection_86_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_86_2 collection_88_2
noncomputable def collection_82_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_82_4 collection_86_4
noncomputable def collection_75_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_75_7 collection_82_8
noncomputable def collection_60_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_60_15 collection_75_15
noncomputable def collection_91_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_91) (.leaf record_92)
noncomputable def collection_90_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_90) collection_91_2
noncomputable def collection_93_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_93) (.leaf record_94)
noncomputable def collection_95_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_95) (.leaf record_96)
noncomputable def collection_93_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_93_2 collection_95_2
noncomputable def collection_90_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_90_3 collection_93_4
noncomputable def collection_97_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_97) (.leaf record_98)
noncomputable def collection_99_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_99) (.leaf record_100)
noncomputable def collection_97_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_97_2 collection_99_2
noncomputable def collection_101_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_101) (.leaf record_102)
noncomputable def collection_103_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_103) (.leaf record_104)
noncomputable def collection_101_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_101_2 collection_103_2
noncomputable def collection_97_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_97_4 collection_101_4
noncomputable def collection_90_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_90_7 collection_97_8
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
noncomputable def collection_112_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_112) (.leaf record_113)
noncomputable def collection_114_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_114) (.leaf record_115)
noncomputable def collection_112_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_112_2 collection_114_2
noncomputable def collection_116_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_116) (.leaf record_117)
noncomputable def collection_118_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_118) (.leaf record_119)
noncomputable def collection_116_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_116_2 collection_118_2
noncomputable def collection_112_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_112_4 collection_116_4
noncomputable def collection_105_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_105_7 collection_112_8
noncomputable def collection_90_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_90_15 collection_105_15
noncomputable def collection_60_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_60_30 collection_90_30
noncomputable def collection_0_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_0_60 collection_60_60
noncomputable def collection_121_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_121) (.leaf record_122)
noncomputable def collection_120_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_120) collection_121_2
noncomputable def collection_123_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_123) (.leaf record_124)
noncomputable def collection_125_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_125) (.leaf record_126)
noncomputable def collection_123_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_123_2 collection_125_2
noncomputable def collection_120_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_120_3 collection_123_4
noncomputable def collection_127_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_127) (.leaf record_128)
noncomputable def collection_129_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_129) (.leaf record_130)
noncomputable def collection_127_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_127_2 collection_129_2
noncomputable def collection_131_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_131) (.leaf record_132)
noncomputable def collection_133_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_133) (.leaf record_134)
noncomputable def collection_131_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_131_2 collection_133_2
noncomputable def collection_127_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_127_4 collection_131_4
noncomputable def collection_120_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_120_7 collection_127_8
noncomputable def collection_136_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_136) (.leaf record_137)
noncomputable def collection_135_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_135) collection_136_2
noncomputable def collection_138_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_138) (.leaf record_139)
noncomputable def collection_140_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_140) (.leaf record_141)
noncomputable def collection_138_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_138_2 collection_140_2
noncomputable def collection_135_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_135_3 collection_138_4
noncomputable def collection_142_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_142) (.leaf record_143)
noncomputable def collection_144_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_144) (.leaf record_145)
noncomputable def collection_142_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_142_2 collection_144_2
noncomputable def collection_146_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_146) (.leaf record_147)
noncomputable def collection_148_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_148) (.leaf record_149)
noncomputable def collection_146_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_146_2 collection_148_2
noncomputable def collection_142_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_142_4 collection_146_4
noncomputable def collection_135_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_135_7 collection_142_8
noncomputable def collection_120_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_120_15 collection_135_15
noncomputable def collection_151_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_151) (.leaf record_152)
noncomputable def collection_150_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_150) collection_151_2
noncomputable def collection_153_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_153) (.leaf record_154)
noncomputable def collection_155_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_155) (.leaf record_156)
noncomputable def collection_153_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_153_2 collection_155_2
noncomputable def collection_150_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_150_3 collection_153_4
noncomputable def collection_157_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_157) (.leaf record_158)
noncomputable def collection_159_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_159) (.leaf record_160)
noncomputable def collection_157_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_157_2 collection_159_2
noncomputable def collection_161_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_161) (.leaf record_162)
noncomputable def collection_163_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_163) (.leaf record_164)
noncomputable def collection_161_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_161_2 collection_163_2
noncomputable def collection_157_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_157_4 collection_161_4
noncomputable def collection_150_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_150_7 collection_157_8
noncomputable def collection_166_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_166) (.leaf record_167)
noncomputable def collection_165_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_165) collection_166_2
noncomputable def collection_168_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_168) (.leaf record_169)
noncomputable def collection_170_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_170) (.leaf record_171)
noncomputable def collection_168_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_168_2 collection_170_2
noncomputable def collection_165_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_165_3 collection_168_4
noncomputable def collection_172_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_172) (.leaf record_173)
noncomputable def collection_174_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_174) (.leaf record_175)
noncomputable def collection_172_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_172_2 collection_174_2
noncomputable def collection_176_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_176) (.leaf record_177)
noncomputable def collection_178_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_178) (.leaf record_179)
noncomputable def collection_176_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_176_2 collection_178_2
noncomputable def collection_172_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_172_4 collection_176_4
noncomputable def collection_165_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_165_7 collection_172_8
noncomputable def collection_150_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_150_15 collection_165_15
noncomputable def collection_120_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_120_30 collection_150_30
noncomputable def collection_181_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_181) (.leaf record_182)
noncomputable def collection_180_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_180) collection_181_2
noncomputable def collection_183_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_183) (.leaf record_184)
noncomputable def collection_185_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_185) (.leaf record_186)
noncomputable def collection_183_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_183_2 collection_185_2
noncomputable def collection_180_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_180_3 collection_183_4
noncomputable def collection_187_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_187) (.leaf record_188)
noncomputable def collection_189_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_189) (.leaf record_190)
noncomputable def collection_187_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_187_2 collection_189_2
noncomputable def collection_191_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_191) (.leaf record_192)
noncomputable def collection_193_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_193) (.leaf record_194)
noncomputable def collection_191_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_191_2 collection_193_2
noncomputable def collection_187_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_187_4 collection_191_4
noncomputable def collection_180_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_180_7 collection_187_8
noncomputable def collection_196_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_196) (.leaf record_197)
noncomputable def collection_195_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_195) collection_196_2
noncomputable def collection_198_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_198) (.leaf record_199)
noncomputable def collection_200_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_200) (.leaf record_201)
noncomputable def collection_198_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_198_2 collection_200_2
noncomputable def collection_195_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_195_3 collection_198_4
noncomputable def collection_202_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_202) (.leaf record_203)
noncomputable def collection_204_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_204) (.leaf record_205)
noncomputable def collection_202_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_202_2 collection_204_2
noncomputable def collection_206_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_206) (.leaf record_207)
noncomputable def collection_208_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_208) (.leaf record_209)
noncomputable def collection_206_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_206_2 collection_208_2
noncomputable def collection_202_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_202_4 collection_206_4
noncomputable def collection_195_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_195_7 collection_202_8
noncomputable def collection_180_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_180_15 collection_195_15
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
noncomputable def collection_217_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_217) (.leaf record_218)
noncomputable def collection_219_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_219) (.leaf record_220)
noncomputable def collection_217_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_217_2 collection_219_2
noncomputable def collection_221_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_221) (.leaf record_222)
noncomputable def collection_223_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_223) (.leaf record_224)
noncomputable def collection_221_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_221_2 collection_223_2
noncomputable def collection_217_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_217_4 collection_221_4
noncomputable def collection_210_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_210_7 collection_217_8
noncomputable def collection_226_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_226) (.leaf record_227)
noncomputable def collection_225_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_225) collection_226_2
noncomputable def collection_228_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_228) (.leaf record_229)
noncomputable def collection_230_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_230) (.leaf record_231)
noncomputable def collection_228_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_228_2 collection_230_2
noncomputable def collection_225_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_225_3 collection_228_4
noncomputable def collection_232_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_232) (.leaf record_233)
noncomputable def collection_234_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_234) (.leaf record_235)
noncomputable def collection_232_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_232_2 collection_234_2
noncomputable def collection_236_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_236) (.leaf record_237)
noncomputable def collection_238_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_238) (.leaf record_239)
noncomputable def collection_236_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_236_2 collection_238_2
noncomputable def collection_232_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_232_4 collection_236_4
noncomputable def collection_225_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_225_7 collection_232_8
noncomputable def collection_210_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_210_15 collection_225_15
noncomputable def collection_180_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_180_30 collection_210_30
noncomputable def collection_120_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_120_60 collection_180_60
noncomputable def collection_0_240 : Balanced.RowTree SourceCertificate :=
  .branch 120 collection_0_120 collection_120_120
noncomputable def collection_241_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_241) (.leaf record_242)
noncomputable def collection_240_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_240) collection_241_2
noncomputable def collection_243_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_243) (.leaf record_244)
noncomputable def collection_245_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_245) (.leaf record_246)
noncomputable def collection_243_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_243_2 collection_245_2
noncomputable def collection_240_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_240_3 collection_243_4
noncomputable def collection_247_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_247) (.leaf record_248)
noncomputable def collection_249_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_249) (.leaf record_250)
noncomputable def collection_247_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_247_2 collection_249_2
noncomputable def collection_251_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_251) (.leaf record_252)
noncomputable def collection_253_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_253) (.leaf record_254)
noncomputable def collection_251_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_251_2 collection_253_2
noncomputable def collection_247_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_247_4 collection_251_4
noncomputable def collection_240_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_240_7 collection_247_8
noncomputable def collection_256_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_256) (.leaf record_257)
noncomputable def collection_255_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_255) collection_256_2
noncomputable def collection_258_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_258) (.leaf record_259)
noncomputable def collection_260_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_260) (.leaf record_261)
noncomputable def collection_258_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_258_2 collection_260_2
noncomputable def collection_255_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_255_3 collection_258_4
noncomputable def collection_262_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_262) (.leaf record_263)
noncomputable def collection_264_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_264) (.leaf record_265)
noncomputable def collection_262_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_262_2 collection_264_2
noncomputable def collection_266_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_266) (.leaf record_267)
noncomputable def collection_268_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_268) (.leaf record_269)
noncomputable def collection_266_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_266_2 collection_268_2
noncomputable def collection_262_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_262_4 collection_266_4
noncomputable def collection_255_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_255_7 collection_262_8
noncomputable def collection_240_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_240_15 collection_255_15
noncomputable def collection_271_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_271) (.leaf record_272)
noncomputable def collection_270_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_270) collection_271_2
noncomputable def collection_273_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_273) (.leaf record_274)
noncomputable def collection_275_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_275) (.leaf record_276)
noncomputable def collection_273_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_273_2 collection_275_2
noncomputable def collection_270_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_270_3 collection_273_4
noncomputable def collection_277_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_277) (.leaf record_278)
noncomputable def collection_279_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_279) (.leaf record_280)
noncomputable def collection_277_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_277_2 collection_279_2
noncomputable def collection_281_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_281) (.leaf record_282)
noncomputable def collection_283_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_283) (.leaf record_284)
noncomputable def collection_281_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_281_2 collection_283_2
noncomputable def collection_277_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_277_4 collection_281_4
noncomputable def collection_270_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_270_7 collection_277_8
noncomputable def collection_286_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_286) (.leaf record_287)
noncomputable def collection_285_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_285) collection_286_2
noncomputable def collection_288_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_288) (.leaf record_289)
noncomputable def collection_290_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_290) (.leaf record_291)
noncomputable def collection_288_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_288_2 collection_290_2
noncomputable def collection_285_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_285_3 collection_288_4
noncomputable def collection_292_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_292) (.leaf record_293)
noncomputable def collection_294_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_294) (.leaf record_295)
noncomputable def collection_292_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_292_2 collection_294_2
noncomputable def collection_296_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_296) (.leaf record_297)
noncomputable def collection_298_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_298) (.leaf record_299)
noncomputable def collection_296_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_296_2 collection_298_2
noncomputable def collection_292_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_292_4 collection_296_4
noncomputable def collection_285_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_285_7 collection_292_8
noncomputable def collection_270_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_270_15 collection_285_15
noncomputable def collection_240_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_240_30 collection_270_30
noncomputable def collection_301_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_301) (.leaf record_302)
noncomputable def collection_300_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_300) collection_301_2
noncomputable def collection_303_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_303) (.leaf record_304)
noncomputable def collection_305_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_305) (.leaf record_306)
noncomputable def collection_303_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_303_2 collection_305_2
noncomputable def collection_300_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_300_3 collection_303_4
noncomputable def collection_307_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_307) (.leaf record_308)
noncomputable def collection_309_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_309) (.leaf record_310)
noncomputable def collection_307_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_307_2 collection_309_2
noncomputable def collection_311_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_311) (.leaf record_312)
noncomputable def collection_313_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_313) (.leaf record_314)
noncomputable def collection_311_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_311_2 collection_313_2
noncomputable def collection_307_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_307_4 collection_311_4
noncomputable def collection_300_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_300_7 collection_307_8
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
noncomputable def collection_322_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_322) (.leaf record_323)
noncomputable def collection_324_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_324) (.leaf record_325)
noncomputable def collection_322_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_322_2 collection_324_2
noncomputable def collection_326_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_326) (.leaf record_327)
noncomputable def collection_328_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_328) (.leaf record_329)
noncomputable def collection_326_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_326_2 collection_328_2
noncomputable def collection_322_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_322_4 collection_326_4
noncomputable def collection_315_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_315_7 collection_322_8
noncomputable def collection_300_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_300_15 collection_315_15
noncomputable def collection_331_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_331) (.leaf record_332)
noncomputable def collection_330_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_330) collection_331_2
noncomputable def collection_333_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_333) (.leaf record_334)
noncomputable def collection_335_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_335) (.leaf record_336)
noncomputable def collection_333_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_333_2 collection_335_2
noncomputable def collection_330_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_330_3 collection_333_4
noncomputable def collection_337_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_337) (.leaf record_338)
noncomputable def collection_339_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_339) (.leaf record_340)
noncomputable def collection_337_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_337_2 collection_339_2
noncomputable def collection_341_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_341) (.leaf record_342)
noncomputable def collection_343_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_343) (.leaf record_344)
noncomputable def collection_341_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_341_2 collection_343_2
noncomputable def collection_337_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_337_4 collection_341_4
noncomputable def collection_330_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_330_7 collection_337_8
noncomputable def collection_346_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_346) (.leaf record_347)
noncomputable def collection_345_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_345) collection_346_2
noncomputable def collection_348_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_348) (.leaf record_349)
noncomputable def collection_350_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_350) (.leaf record_351)
noncomputable def collection_348_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_348_2 collection_350_2
noncomputable def collection_345_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_345_3 collection_348_4
noncomputable def collection_352_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_352) (.leaf record_353)
noncomputable def collection_354_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_354) (.leaf record_355)
noncomputable def collection_352_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_352_2 collection_354_2
noncomputable def collection_356_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_356) (.leaf record_357)
noncomputable def collection_358_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_358) (.leaf record_359)
noncomputable def collection_356_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_356_2 collection_358_2
noncomputable def collection_352_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_352_4 collection_356_4
noncomputable def collection_345_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_345_7 collection_352_8
noncomputable def collection_330_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_330_15 collection_345_15
noncomputable def collection_300_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_300_30 collection_330_30
noncomputable def collection_240_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_240_60 collection_300_60
noncomputable def collection_361_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_361) (.leaf record_362)
noncomputable def collection_360_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_360) collection_361_2
noncomputable def collection_363_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_363) (.leaf record_364)
noncomputable def collection_365_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_365) (.leaf record_366)
noncomputable def collection_363_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_363_2 collection_365_2
noncomputable def collection_360_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_360_3 collection_363_4
noncomputable def collection_367_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_367) (.leaf record_368)
noncomputable def collection_369_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_369) (.leaf record_370)
noncomputable def collection_367_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_367_2 collection_369_2
noncomputable def collection_371_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_371) (.leaf record_372)
noncomputable def collection_373_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_373) (.leaf record_374)
noncomputable def collection_371_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_371_2 collection_373_2
noncomputable def collection_367_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_367_4 collection_371_4
noncomputable def collection_360_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_360_7 collection_367_8
noncomputable def collection_376_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_376) (.leaf record_377)
noncomputable def collection_375_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_375) collection_376_2
noncomputable def collection_378_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_378) (.leaf record_379)
noncomputable def collection_380_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_380) (.leaf record_381)
noncomputable def collection_378_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_378_2 collection_380_2
noncomputable def collection_375_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_375_3 collection_378_4
noncomputable def collection_382_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_382) (.leaf record_383)
noncomputable def collection_384_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_384) (.leaf record_385)
noncomputable def collection_382_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_382_2 collection_384_2
noncomputable def collection_386_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_386) (.leaf record_387)
noncomputable def collection_388_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_388) (.leaf record_389)
noncomputable def collection_386_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_386_2 collection_388_2
noncomputable def collection_382_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_382_4 collection_386_4
noncomputable def collection_375_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_375_7 collection_382_8
noncomputable def collection_360_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_360_15 collection_375_15
noncomputable def collection_391_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_391) (.leaf record_392)
noncomputable def collection_390_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_390) collection_391_2
noncomputable def collection_393_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_393) (.leaf record_394)
noncomputable def collection_395_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_395) (.leaf record_396)
noncomputable def collection_393_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_393_2 collection_395_2
noncomputable def collection_390_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_390_3 collection_393_4
noncomputable def collection_397_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_397) (.leaf record_398)
noncomputable def collection_399_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_399) (.leaf record_400)
noncomputable def collection_397_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_397_2 collection_399_2
noncomputable def collection_401_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_401) (.leaf record_402)
noncomputable def collection_403_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_403) (.leaf record_404)
noncomputable def collection_401_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_401_2 collection_403_2
noncomputable def collection_397_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_397_4 collection_401_4
noncomputable def collection_390_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_390_7 collection_397_8
noncomputable def collection_406_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_406) (.leaf record_407)
noncomputable def collection_405_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_405) collection_406_2
noncomputable def collection_408_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_408) (.leaf record_409)
noncomputable def collection_410_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_410) (.leaf record_411)
noncomputable def collection_408_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_408_2 collection_410_2
noncomputable def collection_405_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_405_3 collection_408_4
noncomputable def collection_412_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_412) (.leaf record_413)
noncomputable def collection_414_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_414) (.leaf record_415)
noncomputable def collection_412_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_412_2 collection_414_2
noncomputable def collection_416_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_416) (.leaf record_417)
noncomputable def collection_418_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_418) (.leaf record_419)
noncomputable def collection_416_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_416_2 collection_418_2
noncomputable def collection_412_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_412_4 collection_416_4
noncomputable def collection_405_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_405_7 collection_412_8
noncomputable def collection_390_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_390_15 collection_405_15
noncomputable def collection_360_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_360_30 collection_390_30
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
noncomputable def collection_427_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_427) (.leaf record_428)
noncomputable def collection_429_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_429) (.leaf record_430)
noncomputable def collection_427_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_427_2 collection_429_2
noncomputable def collection_431_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_431) (.leaf record_432)
noncomputable def collection_433_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_433) (.leaf record_434)
noncomputable def collection_431_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_431_2 collection_433_2
noncomputable def collection_427_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_427_4 collection_431_4
noncomputable def collection_420_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_420_7 collection_427_8
noncomputable def collection_436_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_436) (.leaf record_437)
noncomputable def collection_435_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_435) collection_436_2
noncomputable def collection_438_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_438) (.leaf record_439)
noncomputable def collection_440_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_440) (.leaf record_441)
noncomputable def collection_438_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_438_2 collection_440_2
noncomputable def collection_435_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_435_3 collection_438_4
noncomputable def collection_442_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_442) (.leaf record_443)
noncomputable def collection_444_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_444) (.leaf record_445)
noncomputable def collection_442_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_442_2 collection_444_2
noncomputable def collection_446_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_446) (.leaf record_447)
noncomputable def collection_448_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_448) (.leaf record_449)
noncomputable def collection_446_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_446_2 collection_448_2
noncomputable def collection_442_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_442_4 collection_446_4
noncomputable def collection_435_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_435_7 collection_442_8
noncomputable def collection_420_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_420_15 collection_435_15
noncomputable def collection_451_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_451) (.leaf record_452)
noncomputable def collection_450_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_450) collection_451_2
noncomputable def collection_453_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_453) (.leaf record_454)
noncomputable def collection_455_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_455) (.leaf record_456)
noncomputable def collection_453_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_453_2 collection_455_2
noncomputable def collection_450_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_450_3 collection_453_4
noncomputable def collection_457_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_457) (.leaf record_458)
noncomputable def collection_459_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_459) (.leaf record_460)
noncomputable def collection_457_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_457_2 collection_459_2
noncomputable def collection_461_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_461) (.leaf record_462)
noncomputable def collection_463_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_463) (.leaf record_464)
noncomputable def collection_461_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_461_2 collection_463_2
noncomputable def collection_457_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_457_4 collection_461_4
noncomputable def collection_450_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_450_7 collection_457_8
noncomputable def collection_466_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_466) (.leaf record_467)
noncomputable def collection_465_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_465) collection_466_2
noncomputable def collection_468_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_468) (.leaf record_469)
noncomputable def collection_470_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_470) (.leaf record_471)
noncomputable def collection_468_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_468_2 collection_470_2
noncomputable def collection_465_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_465_3 collection_468_4
noncomputable def collection_472_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_472) (.leaf record_473)
noncomputable def collection_474_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_474) (.leaf record_475)
noncomputable def collection_472_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_472_2 collection_474_2
noncomputable def collection_476_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_476) (.leaf record_477)
noncomputable def collection_478_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_478) (.leaf record_479)
noncomputable def collection_476_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_476_2 collection_478_2
noncomputable def collection_472_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_472_4 collection_476_4
noncomputable def collection_465_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_465_7 collection_472_8
noncomputable def collection_450_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_450_15 collection_465_15
noncomputable def collection_420_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_420_30 collection_450_30
noncomputable def collection_360_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_360_60 collection_420_60
noncomputable def collection_240_240 : Balanced.RowTree SourceCertificate :=
  .branch 120 collection_240_120 collection_360_120
noncomputable def collection_0_480 : Balanced.RowTree SourceCertificate :=
  .branch 240 collection_0_240 collection_240_240
noncomputable def collection_481_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_481) (.leaf record_482)
noncomputable def collection_480_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_480) collection_481_2
noncomputable def collection_483_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_483) (.leaf record_484)
noncomputable def collection_485_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_485) (.leaf record_486)
noncomputable def collection_483_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_483_2 collection_485_2
noncomputable def collection_480_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_480_3 collection_483_4
noncomputable def collection_487_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_487) (.leaf record_488)
noncomputable def collection_489_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_489) (.leaf record_490)
noncomputable def collection_487_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_487_2 collection_489_2
noncomputable def collection_491_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_491) (.leaf record_492)
noncomputable def collection_493_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_493) (.leaf record_494)
noncomputable def collection_491_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_491_2 collection_493_2
noncomputable def collection_487_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_487_4 collection_491_4
noncomputable def collection_480_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_480_7 collection_487_8
noncomputable def collection_496_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_496) (.leaf record_497)
noncomputable def collection_495_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_495) collection_496_2
noncomputable def collection_498_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_498) (.leaf record_499)
noncomputable def collection_500_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_500) (.leaf record_501)
noncomputable def collection_498_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_498_2 collection_500_2
noncomputable def collection_495_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_495_3 collection_498_4
noncomputable def collection_502_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_502) (.leaf record_503)
noncomputable def collection_504_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_504) (.leaf record_505)
noncomputable def collection_502_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_502_2 collection_504_2
noncomputable def collection_506_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_506) (.leaf record_507)
noncomputable def collection_508_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_508) (.leaf record_509)
noncomputable def collection_506_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_506_2 collection_508_2
noncomputable def collection_502_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_502_4 collection_506_4
noncomputable def collection_495_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_495_7 collection_502_8
noncomputable def collection_480_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_480_15 collection_495_15
noncomputable def collection_511_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_511) (.leaf record_512)
noncomputable def collection_510_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_510) collection_511_2
noncomputable def collection_513_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_513) (.leaf record_514)
noncomputable def collection_515_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_515) (.leaf record_516)
noncomputable def collection_513_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_513_2 collection_515_2
noncomputable def collection_510_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_510_3 collection_513_4
noncomputable def collection_517_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_517) (.leaf record_518)
noncomputable def collection_519_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_519) (.leaf record_520)
noncomputable def collection_517_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_517_2 collection_519_2
noncomputable def collection_521_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_521) (.leaf record_522)
noncomputable def collection_523_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_523) (.leaf record_524)
noncomputable def collection_521_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_521_2 collection_523_2
noncomputable def collection_517_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_517_4 collection_521_4
noncomputable def collection_510_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_510_7 collection_517_8
noncomputable def collection_526_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_526) (.leaf record_527)
noncomputable def collection_525_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_525) collection_526_2
noncomputable def collection_528_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_528) (.leaf record_529)
noncomputable def collection_530_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_530) (.leaf record_531)
noncomputable def collection_528_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_528_2 collection_530_2
noncomputable def collection_525_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_525_3 collection_528_4
noncomputable def collection_532_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_532) (.leaf record_533)
noncomputable def collection_534_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_534) (.leaf record_535)
noncomputable def collection_532_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_532_2 collection_534_2
noncomputable def collection_536_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_536) (.leaf record_537)
noncomputable def collection_538_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_538) (.leaf record_539)
noncomputable def collection_536_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_536_2 collection_538_2
noncomputable def collection_532_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_532_4 collection_536_4
noncomputable def collection_525_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_525_7 collection_532_8
noncomputable def collection_510_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_510_15 collection_525_15
noncomputable def collection_480_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_480_30 collection_510_30
noncomputable def collection_541_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_541) (.leaf record_542)
noncomputable def collection_540_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_540) collection_541_2
noncomputable def collection_543_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_543) (.leaf record_544)
noncomputable def collection_545_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_545) (.leaf record_546)
noncomputable def collection_543_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_543_2 collection_545_2
noncomputable def collection_540_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_540_3 collection_543_4
noncomputable def collection_547_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_547) (.leaf record_548)
noncomputable def collection_549_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_549) (.leaf record_550)
noncomputable def collection_547_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_547_2 collection_549_2
noncomputable def collection_551_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_551) (.leaf record_552)
noncomputable def collection_553_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_553) (.leaf record_554)
noncomputable def collection_551_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_551_2 collection_553_2
noncomputable def collection_547_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_547_4 collection_551_4
noncomputable def collection_540_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_540_7 collection_547_8
noncomputable def collection_556_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_556) (.leaf record_557)
noncomputable def collection_555_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_555) collection_556_2
noncomputable def collection_558_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_558) (.leaf record_559)
noncomputable def collection_560_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_560) (.leaf record_561)
noncomputable def collection_558_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_558_2 collection_560_2
noncomputable def collection_555_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_555_3 collection_558_4
noncomputable def collection_562_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_562) (.leaf record_563)
noncomputable def collection_564_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_564) (.leaf record_565)
noncomputable def collection_562_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_562_2 collection_564_2
noncomputable def collection_566_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_566) (.leaf record_567)
noncomputable def collection_568_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_568) (.leaf record_569)
noncomputable def collection_566_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_566_2 collection_568_2
noncomputable def collection_562_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_562_4 collection_566_4
noncomputable def collection_555_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_555_7 collection_562_8
noncomputable def collection_540_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_540_15 collection_555_15
noncomputable def collection_571_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_571) (.leaf record_572)
noncomputable def collection_570_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_570) collection_571_2
noncomputable def collection_573_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_573) (.leaf record_574)
noncomputable def collection_575_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_575) (.leaf record_576)
noncomputable def collection_573_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_573_2 collection_575_2
noncomputable def collection_570_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_570_3 collection_573_4
noncomputable def collection_577_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_577) (.leaf record_578)
noncomputable def collection_579_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_579) (.leaf record_580)
noncomputable def collection_577_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_577_2 collection_579_2
noncomputable def collection_581_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_581) (.leaf record_582)
noncomputable def collection_583_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_583) (.leaf record_584)
noncomputable def collection_581_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_581_2 collection_583_2
noncomputable def collection_577_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_577_4 collection_581_4
noncomputable def collection_570_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_570_7 collection_577_8
noncomputable def collection_586_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_586) (.leaf record_587)
noncomputable def collection_585_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_585) collection_586_2
noncomputable def collection_588_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_588) (.leaf record_589)
noncomputable def collection_590_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_590) (.leaf record_591)
noncomputable def collection_588_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_588_2 collection_590_2
noncomputable def collection_585_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_585_3 collection_588_4
noncomputable def collection_592_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_592) (.leaf record_593)
noncomputable def collection_594_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_594) (.leaf record_595)
noncomputable def collection_592_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_592_2 collection_594_2
noncomputable def collection_596_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_596) (.leaf record_597)
noncomputable def collection_598_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_598) (.leaf record_599)
noncomputable def collection_596_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_596_2 collection_598_2
noncomputable def collection_592_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_592_4 collection_596_4
noncomputable def collection_585_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_585_7 collection_592_8
noncomputable def collection_570_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_570_15 collection_585_15
noncomputable def collection_540_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_540_30 collection_570_30
noncomputable def collection_480_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_480_60 collection_540_60
noncomputable def collection_601_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_601) (.leaf record_602)
noncomputable def collection_600_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_600) collection_601_2
noncomputable def collection_603_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_603) (.leaf record_604)
noncomputable def collection_605_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_605) (.leaf record_606)
noncomputable def collection_603_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_603_2 collection_605_2
noncomputable def collection_600_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_600_3 collection_603_4
noncomputable def collection_607_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_607) (.leaf record_608)
noncomputable def collection_609_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_609) (.leaf record_610)
noncomputable def collection_607_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_607_2 collection_609_2
noncomputable def collection_611_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_611) (.leaf record_612)
noncomputable def collection_613_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_613) (.leaf record_614)
noncomputable def collection_611_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_611_2 collection_613_2
noncomputable def collection_607_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_607_4 collection_611_4
noncomputable def collection_600_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_600_7 collection_607_8
noncomputable def collection_616_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_616) (.leaf record_617)
noncomputable def collection_615_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_615) collection_616_2
noncomputable def collection_618_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_618) (.leaf record_619)
noncomputable def collection_620_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_620) (.leaf record_621)
noncomputable def collection_618_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_618_2 collection_620_2
noncomputable def collection_615_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_615_3 collection_618_4
noncomputable def collection_622_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_622) (.leaf record_623)
noncomputable def collection_624_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_624) (.leaf record_625)
noncomputable def collection_622_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_622_2 collection_624_2
noncomputable def collection_626_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_626) (.leaf record_627)
noncomputable def collection_628_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_628) (.leaf record_629)
noncomputable def collection_626_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_626_2 collection_628_2
noncomputable def collection_622_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_622_4 collection_626_4
noncomputable def collection_615_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_615_7 collection_622_8
noncomputable def collection_600_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_600_15 collection_615_15
noncomputable def collection_631_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_631) (.leaf record_632)
noncomputable def collection_630_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_630) collection_631_2
noncomputable def collection_633_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_633) (.leaf record_634)
noncomputable def collection_635_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_635) (.leaf record_636)
noncomputable def collection_633_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_633_2 collection_635_2
noncomputable def collection_630_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_630_3 collection_633_4
noncomputable def collection_637_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_637) (.leaf record_638)
noncomputable def collection_639_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_639) (.leaf record_640)
noncomputable def collection_637_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_637_2 collection_639_2
noncomputable def collection_641_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_641) (.leaf record_642)
noncomputable def collection_643_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_643) (.leaf record_644)
noncomputable def collection_641_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_641_2 collection_643_2
noncomputable def collection_637_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_637_4 collection_641_4
noncomputable def collection_630_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_630_7 collection_637_8
noncomputable def collection_646_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_646) (.leaf record_647)
noncomputable def collection_645_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_645) collection_646_2
noncomputable def collection_648_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_648) (.leaf record_649)
noncomputable def collection_650_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_650) (.leaf record_651)
noncomputable def collection_648_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_648_2 collection_650_2
noncomputable def collection_645_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_645_3 collection_648_4
noncomputable def collection_652_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_652) (.leaf record_653)
noncomputable def collection_654_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_654) (.leaf record_655)
noncomputable def collection_652_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_652_2 collection_654_2
noncomputable def collection_656_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_656) (.leaf record_657)
noncomputable def collection_658_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_658) (.leaf record_659)
noncomputable def collection_656_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_656_2 collection_658_2
noncomputable def collection_652_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_652_4 collection_656_4
noncomputable def collection_645_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_645_7 collection_652_8
noncomputable def collection_630_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_630_15 collection_645_15
noncomputable def collection_600_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_600_30 collection_630_30
noncomputable def collection_661_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_661) (.leaf record_662)
noncomputable def collection_660_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_660) collection_661_2
noncomputable def collection_663_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_663) (.leaf record_664)
noncomputable def collection_665_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_665) (.leaf record_666)
noncomputable def collection_663_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_663_2 collection_665_2
noncomputable def collection_660_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_660_3 collection_663_4
noncomputable def collection_667_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_667) (.leaf record_668)
noncomputable def collection_669_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_669) (.leaf record_670)
noncomputable def collection_667_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_667_2 collection_669_2
noncomputable def collection_671_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_671) (.leaf record_672)
noncomputable def collection_673_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_673) (.leaf record_674)
noncomputable def collection_671_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_671_2 collection_673_2
noncomputable def collection_667_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_667_4 collection_671_4
noncomputable def collection_660_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_660_7 collection_667_8
noncomputable def collection_676_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_676) (.leaf record_677)
noncomputable def collection_675_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_675) collection_676_2
noncomputable def collection_678_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_678) (.leaf record_679)
noncomputable def collection_680_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_680) (.leaf record_681)
noncomputable def collection_678_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_678_2 collection_680_2
noncomputable def collection_675_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_675_3 collection_678_4
noncomputable def collection_682_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_682) (.leaf record_683)
noncomputable def collection_684_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_684) (.leaf record_685)
noncomputable def collection_682_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_682_2 collection_684_2
noncomputable def collection_686_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_686) (.leaf record_687)
noncomputable def collection_688_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_688) (.leaf record_689)
noncomputable def collection_686_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_686_2 collection_688_2
noncomputable def collection_682_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_682_4 collection_686_4
noncomputable def collection_675_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_675_7 collection_682_8
noncomputable def collection_660_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_660_15 collection_675_15
noncomputable def collection_691_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_691) (.leaf record_692)
noncomputable def collection_690_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_690) collection_691_2
noncomputable def collection_693_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_693) (.leaf record_694)
noncomputable def collection_695_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_695) (.leaf record_696)
noncomputable def collection_693_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_693_2 collection_695_2
noncomputable def collection_690_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_690_3 collection_693_4
noncomputable def collection_697_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_697) (.leaf record_698)
noncomputable def collection_699_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_699) (.leaf record_700)
noncomputable def collection_697_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_697_2 collection_699_2
noncomputable def collection_701_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_701) (.leaf record_702)
noncomputable def collection_703_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_703) (.leaf record_704)
noncomputable def collection_701_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_701_2 collection_703_2
noncomputable def collection_697_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_697_4 collection_701_4
noncomputable def collection_690_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_690_7 collection_697_8
noncomputable def collection_706_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_706) (.leaf record_707)
noncomputable def collection_705_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_705) collection_706_2
noncomputable def collection_708_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_708) (.leaf record_709)
noncomputable def collection_710_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_710) (.leaf record_711)
noncomputable def collection_708_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_708_2 collection_710_2
noncomputable def collection_705_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_705_3 collection_708_4
noncomputable def collection_712_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_712) (.leaf record_713)
noncomputable def collection_714_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_714) (.leaf record_715)
noncomputable def collection_712_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_712_2 collection_714_2
noncomputable def collection_716_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_716) (.leaf record_717)
noncomputable def collection_718_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_718) (.leaf record_719)
noncomputable def collection_716_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_716_2 collection_718_2
noncomputable def collection_712_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_712_4 collection_716_4
noncomputable def collection_705_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_705_7 collection_712_8
noncomputable def collection_690_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_690_15 collection_705_15
noncomputable def collection_660_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_660_30 collection_690_30
noncomputable def collection_600_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_600_60 collection_660_60
noncomputable def collection_480_240 : Balanced.RowTree SourceCertificate :=
  .branch 120 collection_480_120 collection_600_120
noncomputable def collection_721_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_721) (.leaf record_722)
noncomputable def collection_720_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_720) collection_721_2
noncomputable def collection_723_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_723) (.leaf record_724)
noncomputable def collection_725_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_725) (.leaf record_726)
noncomputable def collection_723_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_723_2 collection_725_2
noncomputable def collection_720_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_720_3 collection_723_4
noncomputable def collection_727_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_727) (.leaf record_728)
noncomputable def collection_729_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_729) (.leaf record_730)
noncomputable def collection_727_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_727_2 collection_729_2
noncomputable def collection_731_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_731) (.leaf record_732)
noncomputable def collection_733_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_733) (.leaf record_734)
noncomputable def collection_731_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_731_2 collection_733_2
noncomputable def collection_727_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_727_4 collection_731_4
noncomputable def collection_720_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_720_7 collection_727_8
noncomputable def collection_736_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_736) (.leaf record_737)
noncomputable def collection_735_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_735) collection_736_2
noncomputable def collection_738_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_738) (.leaf record_739)
noncomputable def collection_740_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_740) (.leaf record_741)
noncomputable def collection_738_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_738_2 collection_740_2
noncomputable def collection_735_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_735_3 collection_738_4
noncomputable def collection_742_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_742) (.leaf record_743)
noncomputable def collection_744_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_744) (.leaf record_745)
noncomputable def collection_742_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_742_2 collection_744_2
noncomputable def collection_746_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_746) (.leaf record_747)
noncomputable def collection_748_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_748) (.leaf record_749)
noncomputable def collection_746_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_746_2 collection_748_2
noncomputable def collection_742_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_742_4 collection_746_4
noncomputable def collection_735_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_735_7 collection_742_8
noncomputable def collection_720_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_720_15 collection_735_15
noncomputable def collection_751_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_751) (.leaf record_752)
noncomputable def collection_750_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_750) collection_751_2
noncomputable def collection_753_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_753) (.leaf record_754)
noncomputable def collection_755_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_755) (.leaf record_756)
noncomputable def collection_753_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_753_2 collection_755_2
noncomputable def collection_750_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_750_3 collection_753_4
noncomputable def collection_757_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_757) (.leaf record_758)
noncomputable def collection_759_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_759) (.leaf record_760)
noncomputable def collection_757_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_757_2 collection_759_2
noncomputable def collection_761_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_761) (.leaf record_762)
noncomputable def collection_763_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_763) (.leaf record_764)
noncomputable def collection_761_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_761_2 collection_763_2
noncomputable def collection_757_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_757_4 collection_761_4
noncomputable def collection_750_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_750_7 collection_757_8
noncomputable def collection_766_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_766) (.leaf record_767)
noncomputable def collection_765_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_765) collection_766_2
noncomputable def collection_768_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_768) (.leaf record_769)
noncomputable def collection_770_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_770) (.leaf record_771)
noncomputable def collection_768_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_768_2 collection_770_2
noncomputable def collection_765_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_765_3 collection_768_4
noncomputable def collection_772_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_772) (.leaf record_773)
noncomputable def collection_774_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_774) (.leaf record_775)
noncomputable def collection_772_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_772_2 collection_774_2
noncomputable def collection_776_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_776) (.leaf record_777)
noncomputable def collection_778_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_778) (.leaf record_779)
noncomputable def collection_776_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_776_2 collection_778_2
noncomputable def collection_772_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_772_4 collection_776_4
noncomputable def collection_765_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_765_7 collection_772_8
noncomputable def collection_750_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_750_15 collection_765_15
noncomputable def collection_720_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_720_30 collection_750_30
noncomputable def collection_781_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_781) (.leaf record_782)
noncomputable def collection_780_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_780) collection_781_2
noncomputable def collection_783_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_783) (.leaf record_784)
noncomputable def collection_785_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_785) (.leaf record_786)
noncomputable def collection_783_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_783_2 collection_785_2
noncomputable def collection_780_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_780_3 collection_783_4
noncomputable def collection_787_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_787) (.leaf record_788)
noncomputable def collection_789_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_789) (.leaf record_790)
noncomputable def collection_787_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_787_2 collection_789_2
noncomputable def collection_791_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_791) (.leaf record_792)
noncomputable def collection_793_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_793) (.leaf record_794)
noncomputable def collection_791_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_791_2 collection_793_2
noncomputable def collection_787_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_787_4 collection_791_4
noncomputable def collection_780_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_780_7 collection_787_8
noncomputable def collection_796_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_796) (.leaf record_797)
noncomputable def collection_795_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_795) collection_796_2
noncomputable def collection_798_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_798) (.leaf record_799)
noncomputable def collection_800_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_800) (.leaf record_801)
noncomputable def collection_798_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_798_2 collection_800_2
noncomputable def collection_795_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_795_3 collection_798_4
noncomputable def collection_802_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_802) (.leaf record_803)
noncomputable def collection_804_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_804) (.leaf record_805)
noncomputable def collection_802_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_802_2 collection_804_2
noncomputable def collection_806_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_806) (.leaf record_807)
noncomputable def collection_808_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_808) (.leaf record_809)
noncomputable def collection_806_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_806_2 collection_808_2
noncomputable def collection_802_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_802_4 collection_806_4
noncomputable def collection_795_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_795_7 collection_802_8
noncomputable def collection_780_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_780_15 collection_795_15
noncomputable def collection_811_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_811) (.leaf record_812)
noncomputable def collection_810_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_810) collection_811_2
noncomputable def collection_813_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_813) (.leaf record_814)
noncomputable def collection_815_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_815) (.leaf record_816)
noncomputable def collection_813_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_813_2 collection_815_2
noncomputable def collection_810_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_810_3 collection_813_4
noncomputable def collection_817_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_817) (.leaf record_818)
noncomputable def collection_819_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_819) (.leaf record_820)
noncomputable def collection_817_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_817_2 collection_819_2
noncomputable def collection_821_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_821) (.leaf record_822)
noncomputable def collection_823_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_823) (.leaf record_824)
noncomputable def collection_821_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_821_2 collection_823_2
noncomputable def collection_817_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_817_4 collection_821_4
noncomputable def collection_810_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_810_7 collection_817_8
noncomputable def collection_826_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_826) (.leaf record_827)
noncomputable def collection_825_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_825) collection_826_2
noncomputable def collection_828_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_828) (.leaf record_829)
noncomputable def collection_830_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_830) (.leaf record_831)
noncomputable def collection_828_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_828_2 collection_830_2
noncomputable def collection_825_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_825_3 collection_828_4
noncomputable def collection_832_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_832) (.leaf record_833)
noncomputable def collection_834_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_834) (.leaf record_835)
noncomputable def collection_832_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_832_2 collection_834_2
noncomputable def collection_836_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_836) (.leaf record_837)
noncomputable def collection_838_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_838) (.leaf record_839)
noncomputable def collection_836_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_836_2 collection_838_2
noncomputable def collection_832_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_832_4 collection_836_4
noncomputable def collection_825_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_825_7 collection_832_8
noncomputable def collection_810_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_810_15 collection_825_15
noncomputable def collection_780_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_780_30 collection_810_30
noncomputable def collection_720_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_720_60 collection_780_60
noncomputable def collection_841_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_841) (.leaf record_842)
noncomputable def collection_840_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_840) collection_841_2
noncomputable def collection_843_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_843) (.leaf record_844)
noncomputable def collection_845_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_845) (.leaf record_846)
noncomputable def collection_843_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_843_2 collection_845_2
noncomputable def collection_840_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_840_3 collection_843_4
noncomputable def collection_847_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_847) (.leaf record_848)
noncomputable def collection_849_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_849) (.leaf record_850)
noncomputable def collection_847_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_847_2 collection_849_2
noncomputable def collection_851_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_851) (.leaf record_852)
noncomputable def collection_853_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_853) (.leaf record_854)
noncomputable def collection_851_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_851_2 collection_853_2
noncomputable def collection_847_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_847_4 collection_851_4
noncomputable def collection_840_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_840_7 collection_847_8
noncomputable def collection_856_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_856) (.leaf record_857)
noncomputable def collection_855_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_855) collection_856_2
noncomputable def collection_858_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_858) (.leaf record_859)
noncomputable def collection_860_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_860) (.leaf record_861)
noncomputable def collection_858_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_858_2 collection_860_2
noncomputable def collection_855_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_855_3 collection_858_4
noncomputable def collection_862_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_862) (.leaf record_863)
noncomputable def collection_864_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_864) (.leaf record_865)
noncomputable def collection_862_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_862_2 collection_864_2
noncomputable def collection_866_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_866) (.leaf record_867)
noncomputable def collection_868_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_868) (.leaf record_869)
noncomputable def collection_866_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_866_2 collection_868_2
noncomputable def collection_862_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_862_4 collection_866_4
noncomputable def collection_855_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_855_7 collection_862_8
noncomputable def collection_840_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_840_15 collection_855_15
noncomputable def collection_871_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_871) (.leaf record_872)
noncomputable def collection_870_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_870) collection_871_2
noncomputable def collection_873_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_873) (.leaf record_874)
noncomputable def collection_875_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_875) (.leaf record_876)
noncomputable def collection_873_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_873_2 collection_875_2
noncomputable def collection_870_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_870_3 collection_873_4
noncomputable def collection_877_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_877) (.leaf record_878)
noncomputable def collection_879_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_879) (.leaf record_880)
noncomputable def collection_877_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_877_2 collection_879_2
noncomputable def collection_881_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_881) (.leaf record_882)
noncomputable def collection_883_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_883) (.leaf record_884)
noncomputable def collection_881_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_881_2 collection_883_2
noncomputable def collection_877_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_877_4 collection_881_4
noncomputable def collection_870_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_870_7 collection_877_8
noncomputable def collection_886_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_886) (.leaf record_887)
noncomputable def collection_885_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_885) collection_886_2
noncomputable def collection_888_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_888) (.leaf record_889)
noncomputable def collection_890_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_890) (.leaf record_891)
noncomputable def collection_888_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_888_2 collection_890_2
noncomputable def collection_885_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_885_3 collection_888_4
noncomputable def collection_892_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_892) (.leaf record_893)
noncomputable def collection_894_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_894) (.leaf record_895)
noncomputable def collection_892_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_892_2 collection_894_2
noncomputable def collection_896_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_896) (.leaf record_897)
noncomputable def collection_898_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_898) (.leaf record_899)
noncomputable def collection_896_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_896_2 collection_898_2
noncomputable def collection_892_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_892_4 collection_896_4
noncomputable def collection_885_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_885_7 collection_892_8
noncomputable def collection_870_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_870_15 collection_885_15
noncomputable def collection_840_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_840_30 collection_870_30
noncomputable def collection_901_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_901) (.leaf record_902)
noncomputable def collection_900_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_900) collection_901_2
noncomputable def collection_903_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_903) (.leaf record_904)
noncomputable def collection_905_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_905) (.leaf record_906)
noncomputable def collection_903_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_903_2 collection_905_2
noncomputable def collection_900_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_900_3 collection_903_4
noncomputable def collection_907_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_907) (.leaf record_908)
noncomputable def collection_909_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_909) (.leaf record_910)
noncomputable def collection_907_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_907_2 collection_909_2
noncomputable def collection_911_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_911) (.leaf record_912)
noncomputable def collection_913_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_913) (.leaf record_914)
noncomputable def collection_911_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_911_2 collection_913_2
noncomputable def collection_907_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_907_4 collection_911_4
noncomputable def collection_900_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_900_7 collection_907_8
noncomputable def collection_916_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_916) (.leaf record_917)
noncomputable def collection_915_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_915) collection_916_2
noncomputable def collection_918_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_918) (.leaf record_919)
noncomputable def collection_920_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_920) (.leaf record_921)
noncomputable def collection_918_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_918_2 collection_920_2
noncomputable def collection_915_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_915_3 collection_918_4
noncomputable def collection_922_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_922) (.leaf record_923)
noncomputable def collection_924_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_924) (.leaf record_925)
noncomputable def collection_922_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_922_2 collection_924_2
noncomputable def collection_926_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_926) (.leaf record_927)
noncomputable def collection_928_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_928) (.leaf record_929)
noncomputable def collection_926_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_926_2 collection_928_2
noncomputable def collection_922_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_922_4 collection_926_4
noncomputable def collection_915_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_915_7 collection_922_8
noncomputable def collection_900_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_900_15 collection_915_15
noncomputable def collection_931_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_931) (.leaf record_932)
noncomputable def collection_930_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_930) collection_931_2
noncomputable def collection_933_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_933) (.leaf record_934)
noncomputable def collection_935_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_935) (.leaf record_936)
noncomputable def collection_933_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_933_2 collection_935_2
noncomputable def collection_930_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_930_3 collection_933_4
noncomputable def collection_937_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_937) (.leaf record_938)
noncomputable def collection_939_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_939) (.leaf record_940)
noncomputable def collection_937_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_937_2 collection_939_2
noncomputable def collection_941_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_941) (.leaf record_942)
noncomputable def collection_943_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_943) (.leaf record_944)
noncomputable def collection_941_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_941_2 collection_943_2
noncomputable def collection_937_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_937_4 collection_941_4
noncomputable def collection_930_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_930_7 collection_937_8
noncomputable def collection_946_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_946) (.leaf record_947)
noncomputable def collection_945_3 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_945) collection_946_2
noncomputable def collection_948_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_948) (.leaf record_949)
noncomputable def collection_950_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_950) (.leaf record_951)
noncomputable def collection_948_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_948_2 collection_950_2
noncomputable def collection_945_7 : Balanced.RowTree SourceCertificate :=
  .branch 3 collection_945_3 collection_948_4
noncomputable def collection_952_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_952) (.leaf record_953)
noncomputable def collection_954_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_954) (.leaf record_955)
noncomputable def collection_952_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_952_2 collection_954_2
noncomputable def collection_956_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_956) (.leaf record_957)
noncomputable def collection_958_2 : Balanced.RowTree SourceCertificate :=
  .branch 1 (.leaf record_958) (.leaf record_959)
noncomputable def collection_956_4 : Balanced.RowTree SourceCertificate :=
  .branch 2 collection_956_2 collection_958_2
noncomputable def collection_952_8 : Balanced.RowTree SourceCertificate :=
  .branch 4 collection_952_4 collection_956_4
noncomputable def collection_945_15 : Balanced.RowTree SourceCertificate :=
  .branch 7 collection_945_7 collection_952_8
noncomputable def collection_930_30 : Balanced.RowTree SourceCertificate :=
  .branch 15 collection_930_15 collection_945_15
noncomputable def collection_900_60 : Balanced.RowTree SourceCertificate :=
  .branch 30 collection_900_30 collection_930_30
noncomputable def collection_840_120 : Balanced.RowTree SourceCertificate :=
  .branch 60 collection_840_60 collection_900_60
noncomputable def collection_720_240 : Balanced.RowTree SourceCertificate :=
  .branch 120 collection_720_120 collection_840_120
noncomputable def collection_480_480 : Balanced.RowTree SourceCertificate :=
  .branch 240 collection_480_240 collection_720_240
noncomputable def collection_0_960 : Balanced.RowTree SourceCertificate :=
  .branch 480 collection_0_480 collection_480_480
theorem collection_checked :
    scan collection_0_960 0 = some (960, 26720, 2520) := by
  decide +kernel
theorem complete_source_prefix (q : Fin 4042)
    (before : q.val < 960) : SourceRows q :=
  scan_covers collection_0_960 0 960 26720 2520
    collection_checked q (Nat.zero_le _) before
theorem actual_node_and_return_census :
    (collection_0_960.flatten.map
      (fun r ↦ (FieldPacked.syntaxRows.get r.label).size)).sum = 26720 ∧
    (collection_0_960.flatten.map
      (fun r ↦ FieldSelectiveLayout.localSize r.label)).sum = 2520 :=
  scan_sizes collection_0_960 0 960 26720 2520 collection_checked
theorem substantial_domain : 4 * (5 * (26720 + 2520)) ≥
    573802 := by decide +kernel
theorem wrong_source_order_rejected :
    scan (.branch 1 (.leaf record_1) (.leaf record_0)) 0 = none := by
  decide +kernel
end LocalScope4Pilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual paid body coverage checked: at least 1/4"
