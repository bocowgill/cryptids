module
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
namespace SourceProfilePilot
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
noncomputable def syntax_445 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_445
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:before\t445\t{now}"
      handle.flush
theorem source_445 :
    erase (toTableOp (Snapshot.program label_445)) = raw_445 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t445\t{now}"
      handle.flush
theorem counts_445 :
    syntax_445.size = 134 ∧
      1 + FieldReturns.writeCount syntax_445 = 16 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:before\t445\t{now}"
      handle.flush
theorem main_original_445 :
    StructuralCheckPilot.checkMain label_445 syntax_445 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:before\t445\t{now}"
      handle.flush
theorem main_cached_445 :
    LookupWorldPilot.checkMain CacheWorldPilot.cacheWorld
      label_445 syntax_445 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:before\t445\t{now}"
      handle.flush
theorem return_original_445 :
    DirectCheckPilot.checkReturns label_445 syntax_445 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:before\t445\t{now}"
      handle.flush
theorem return_cached_445 :
    LookupWorldPilot.checkReturns CacheWorldPilot.cacheWorld
      label_445 syntax_445 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:before\t445\t{now}"
      handle.flush
theorem whole_original_445 :
    SourceRecipePilot.checkRecipe label_445 raw_445
      134 16 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:before\t445\t{now}"
      handle.flush
theorem whole_cached_445 :
    LookupWorldPilot.checkRecipe CacheWorldPilot.cacheWorld
      label_445 raw_445 134 16 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:after\t445\t{now}"
      handle.flush
noncomputable def certificate_original_445 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_445 raw_445 134 16
    whole_original_445
noncomputable def certificate_cached_445 :
    SourceScopeToolsPilot.SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_445 raw_445 134 16
    whole_cached_445
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
noncomputable def syntax_476 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_476
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:before\t476\t{now}"
      handle.flush
theorem source_476 :
    erase (toTableOp (Snapshot.program label_476)) = raw_476 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t476\t{now}"
      handle.flush
theorem counts_476 :
    syntax_476.size = 134 ∧
      1 + FieldReturns.writeCount syntax_476 = 16 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:before\t476\t{now}"
      handle.flush
theorem main_cached_476 :
    LookupWorldPilot.checkMain CacheWorldPilot.cacheWorld
      label_476 syntax_476 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:before\t476\t{now}"
      handle.flush
theorem main_original_476 :
    StructuralCheckPilot.checkMain label_476 syntax_476 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:before\t476\t{now}"
      handle.flush
theorem return_cached_476 :
    LookupWorldPilot.checkReturns CacheWorldPilot.cacheWorld
      label_476 syntax_476 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:before\t476\t{now}"
      handle.flush
theorem return_original_476 :
    DirectCheckPilot.checkReturns label_476 syntax_476 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:before\t476\t{now}"
      handle.flush
theorem whole_cached_476 :
    LookupWorldPilot.checkRecipe CacheWorldPilot.cacheWorld
      label_476 raw_476 134 16 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:after\t476\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:before\t476\t{now}"
      handle.flush
theorem whole_original_476 :
    SourceRecipePilot.checkRecipe label_476 raw_476
      134 16 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:after\t476\t{now}"
      handle.flush
noncomputable def certificate_original_476 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_476 raw_476 134 16
    whole_original_476
noncomputable def certificate_cached_476 :
    SourceScopeToolsPilot.SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_476 raw_476 134 16
    whole_cached_476
def label_356 : Fin 4042 := ⟨356, by decide +kernel⟩
noncomputable def raw_356 : RawOp :=
  RawOp.move
    Dir.left
    355
noncomputable def syntax_356 : Syntax 4042 :=
  SourceRecipePilot.syntaxOf raw_356
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:before\t356\t{now}"
      handle.flush
theorem source_356 :
    erase (toTableOp (Snapshot.program label_356)) = raw_356 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t356\t{now}"
      handle.flush
theorem counts_356 :
    syntax_356.size = 14 ∧
      1 + FieldReturns.writeCount syntax_356 = 1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:before\t356\t{now}"
      handle.flush
theorem main_original_356 :
    StructuralCheckPilot.checkMain label_356 syntax_356 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:before\t356\t{now}"
      handle.flush
theorem main_cached_356 :
    LookupWorldPilot.checkMain CacheWorldPilot.cacheWorld
      label_356 syntax_356 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_cached:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:before\t356\t{now}"
      handle.flush
theorem return_original_356 :
    DirectCheckPilot.checkReturns label_356 syntax_356 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:before\t356\t{now}"
      handle.flush
theorem return_cached_356 :
    LookupWorldPilot.checkReturns CacheWorldPilot.cacheWorld
      label_356 syntax_356 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_cached:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:before\t356\t{now}"
      handle.flush
theorem whole_original_356 :
    SourceRecipePilot.checkRecipe label_356 raw_356
      14 1 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:before\t356\t{now}"
      handle.flush
theorem whole_cached_356 :
    LookupWorldPilot.checkRecipe CacheWorldPilot.cacheWorld
      label_356 raw_356 14 1 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_cached:after\t356\t{now}"
      handle.flush
noncomputable def certificate_original_356 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_356 raw_356 14 1
    whole_original_356
noncomputable def certificate_cached_356 :
    SourceScopeToolsPilot.SourceCertificate :=
  CacheWorldPilot.fromCachedRaw label_356 raw_356 14 1
    whole_cached_356
end SourceProfilePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Controlled original and cached source component proofs checked"
