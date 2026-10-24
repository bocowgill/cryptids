module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericActualData
public meta import Lean

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open FieldCompiler RawLabelPilot NumericActualDataPilot
namespace NumericActualProfilePilot
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:before\t355\t{now}"
      handle.flush
theorem source_355 :
    erase (toTableOp (Snapshot.program label_355)) = raw_355 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"source:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"fidelity:before\t355\t{now}"
      handle.flush
theorem fidelity_355 :
    fragment_355 = NumericTreePilot.encode 0 syntax_355 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"fidelity:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:before\t355\t{now}"
      handle.flush
theorem prefix_355 :
    3304 = PrefixScanPilot.nodePrefixes.lookup label_355.val 0 ∧
      550 = PrefixScanPilot.returnPrefixes.lookup label_355.val 0 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t355\t{now}"
      handle.flush
theorem counts_355 :
    fragment_355.count = 142 ∧
      (NumericTreePilot.paidTargets fragment_355).length = 1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:before\t355\t{now}"
      handle.flush
theorem main_original_355 :
    StructuralCheckPilot.checkMain label_355 syntax_355 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_original:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_numeric:before\t355\t{now}"
      handle.flush
theorem main_numeric_355 :
    NumericControlPilot.checkTrace NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 3304 550
        (NumericTreePilot.paidTargets fragment_355)) fragment_355.trace = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_numeric:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:before\t355\t{now}"
      handle.flush
theorem return_original_355 :
    DirectCheckPilot.checkReturns label_355 syntax_355 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_original:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_numeric:before\t355\t{now}"
      handle.flush
theorem return_numeric_355 :
    NumericControlPilot.checkReturns NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 3304 550
        (NumericTreePilot.paidTargets fragment_355)) = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_numeric:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:before\t355\t{now}"
      handle.flush
theorem whole_original_355 :
    SourceRecipePilot.checkRecipe label_355 raw_355
      142 1 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_original:after\t355\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_numeric:before\t355\t{now}"
      handle.flush
theorem whole_numeric_355 :
    NumericSourceAdapterPilot.checkRecipe label_355 raw_355
      fragment_355 3304 550 142 1 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_numeric:after\t355\t{now}"
      handle.flush
noncomputable def original_certificate_355 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_355 raw_355 142 1 whole_original_355
noncomputable def numeric_certificate_355 :
    SourceScopeToolsPilot.SourceCertificate :=
  NumericSourceAdapterPilot.fromRaw label_355 raw_355 fragment_355
    3304 550 142 1 whole_numeric_355
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
      handle.putStrLn s!"fidelity:before\t445\t{now}"
      handle.flush
theorem fidelity_445 :
    fragment_445 = NumericTreePilot.encode 0 syntax_445 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"fidelity:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:before\t445\t{now}"
      handle.flush
theorem prefix_445 :
    6846 = PrefixScanPilot.nodePrefixes.lookup label_445.val 0 ∧
      835 = PrefixScanPilot.returnPrefixes.lookup label_445.val 0 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:after\t445\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t445\t{now}"
      handle.flush
theorem counts_445 :
    fragment_445.count = 134 ∧
      (NumericTreePilot.paidTargets fragment_445).length = 16 := by decide +kernel
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
      handle.putStrLn s!"main_numeric:before\t445\t{now}"
      handle.flush
theorem main_numeric_445 :
    NumericControlPilot.checkTrace NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 6846 835
        (NumericTreePilot.paidTargets fragment_445)) fragment_445.trace = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_numeric:after\t445\t{now}"
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
      handle.putStrLn s!"return_numeric:before\t445\t{now}"
      handle.flush
theorem return_numeric_445 :
    NumericControlPilot.checkReturns NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 6846 835
        (NumericTreePilot.paidTargets fragment_445)) = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_numeric:after\t445\t{now}"
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
      handle.putStrLn s!"whole_numeric:before\t445\t{now}"
      handle.flush
theorem whole_numeric_445 :
    NumericSourceAdapterPilot.checkRecipe label_445 raw_445
      fragment_445 6846 835 134 16 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_numeric:after\t445\t{now}"
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
noncomputable def original_certificate_445 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_445 raw_445 134 16 whole_original_445
noncomputable def numeric_certificate_445 :
    SourceScopeToolsPilot.SourceCertificate :=
  NumericSourceAdapterPilot.fromRaw label_445 raw_445 fragment_445
    6846 835 134 16 whole_numeric_445
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
      handle.putStrLn s!"fidelity:before\t356\t{now}"
      handle.flush
theorem fidelity_356 :
    fragment_356 = NumericTreePilot.encode 0 syntax_356 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"fidelity:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:before\t356\t{now}"
      handle.flush
theorem prefix_356 :
    3446 = PrefixScanPilot.nodePrefixes.lookup label_356.val 0 ∧
      551 = PrefixScanPilot.returnPrefixes.lookup label_356.val 0 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"prefix:after\t356\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"counts:before\t356\t{now}"
      handle.flush
theorem counts_356 :
    fragment_356.count = 14 ∧
      (NumericTreePilot.paidTargets fragment_356).length = 1 := by decide +kernel
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
      handle.putStrLn s!"main_numeric:before\t356\t{now}"
      handle.flush
theorem main_numeric_356 :
    NumericControlPilot.checkTrace NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 3446 551
        (NumericTreePilot.paidTargets fragment_356)) fragment_356.trace = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main_numeric:after\t356\t{now}"
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
      handle.putStrLn s!"return_numeric:before\t356\t{now}"
      handle.flush
theorem return_numeric_356 :
    NumericControlPilot.checkReturns NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 3446 551
        (NumericTreePilot.paidTargets fragment_356)) = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return_numeric:after\t356\t{now}"
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
      handle.putStrLn s!"whole_numeric:before\t356\t{now}"
      handle.flush
theorem whole_numeric_356 :
    NumericSourceAdapterPilot.checkRecipe label_356 raw_356
      fragment_356 3446 551 14 1 = true := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/SourceProfile-times.tsv" .append fun handle ↦ do
      handle.putStrLn s!"whole_numeric:after\t356\t{now}"
      handle.flush
noncomputable def original_certificate_356 :
    SourceScopeToolsPilot.SourceCertificate :=
  SourceRecipePilot.fromRaw label_356 raw_356 14 1 whole_original_356
noncomputable def numeric_certificate_356 :
    SourceScopeToolsPilot.SourceCertificate :=
  NumericSourceAdapterPilot.fromRaw label_356 raw_356 fragment_356
    3446 551 14 1 whole_numeric_356
theorem wrong_callback_rejected :
    NumericSourceAdapterPilot.checkRecipe label_355 bad_callback_355
      fragment_355 3304 550 142 1 = false := by decide +kernel
theorem wrong_targets_rejected :
    NumericSourceAdapterPilot.checkRecipe label_445 raw_445
      bad_targets_445 6846 835 134 16 = false := by decide +kernel
theorem wrong_row_rejected :
    NumericControlPilot.checkNode NumericSourceAdapterPilot.observation
      (NumericSourceAdapterPilot.layout 6846 835
        (NumericTreePilot.paidTargets fragment_445))
      12 bad_write_445 = false := by decide +kernel
theorem baseline_wrong_callback_rejected :
    SourceRecipePilot.checkRecipe label_355 bad_callback_355
      142 1 = false := by decide +kernel
theorem wrong_count_rejected :
    NumericSourceAdapterPilot.checkRecipe label_355 raw_355
      fragment_355 3304 550 143 1 = false := by decide +kernel
theorem wrong_prefix_rejected :
    NumericSourceAdapterPilot.checkRecipe label_355 raw_355
      fragment_355 3305 550 142 1 = false := by decide +kernel
end NumericActualProfilePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual numeric source fidelity checker and original certificates compared"
