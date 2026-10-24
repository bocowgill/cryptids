module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.DirectChecks
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.RawChunk
public meta import Lean

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot
open NumericLocalPilot LocalRulePilot PrefixScanPilot
namespace LocalChunkPilot

theorem restored_literal (op : Op 4042) (raw : RawOp)
    (same : erase (toTableOp op) = raw) : (restore 4042 raw).getD .halt = op := by
  have decoded : restore 4042 raw = some op :=
    (congrArg (restore 4042) same.symm).trans (restore_original op)
  exact congrArg (fun value : Option (Op 4042) ↦ value.getD .halt) decoded
def label_256 : Fin 4042 := ⟨256, by decide +kernel⟩
noncomputable def raw_256 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    254
    255
noncomputable def op_256 : Op 4042 := (restore 4042 raw_256).getD .halt
noncomputable def syntax_256 : Syntax 4042 := lower op_256
theorem source_raw_256 :
    erase (toTableOp (Snapshot.program label_256)) = raw_256 := by
  decide +kernel
theorem source_op_256 : op_256 = Snapshot.program label_256 :=
  restored_literal (Snapshot.program label_256) raw_256 source_raw_256
theorem source_syntax_256 :
    FieldPacked.syntaxRows.get label_256 = syntax_256 :=
  (FieldAware.syntaxRows_get label_256).trans
    (congrArg lower source_op_256).symm
theorem coherent_256 : Coherent label_256 syntax_256 := by
  exact DirectCheckPilot.checkMain_sound label_256 syntax_256
    (by decide +kernel)
theorem returned_256 : ReturnCoherent label_256 syntax_256 := by
  exact DirectCheckPilot.checkReturns_sound label_256 syntax_256
    (by decide +kernel)
theorem main_rows_256 (slot : Fin syntax_256.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_256 syntax_256
      source_syntax_256 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_256 syntax_256 source_syntax_256
    coherent_256 slot bit value
theorem return_rows_256
    (rank : Fin (1 + FieldReturns.writeCount syntax_256))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_256 syntax_256
      source_syntax_256 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_256 syntax_256 source_syntax_256
    returned_256 rank bit value
theorem nodes_256 : syntax_256.size = 3 := by
  decide +kernel
theorem returns_256 : 1 + FieldReturns.writeCount syntax_256 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t1\t{now}"
      handle.flush
def label_257 : Fin 4042 := ⟨257, by decide +kernel⟩
noncomputable def raw_257 : RawOp :=
  RawOp.jump
    ⟨#[
      1953,
      1953,
      1953,
      1953,
      1953
    ], rfl⟩
noncomputable def op_257 : Op 4042 := (restore 4042 raw_257).getD .halt
noncomputable def syntax_257 : Syntax 4042 := lower op_257
theorem source_raw_257 :
    erase (toTableOp (Snapshot.program label_257)) = raw_257 := by
  decide +kernel
theorem source_op_257 : op_257 = Snapshot.program label_257 :=
  restored_literal (Snapshot.program label_257) raw_257 source_raw_257
theorem source_syntax_257 :
    FieldPacked.syntaxRows.get label_257 = syntax_257 :=
  (FieldAware.syntaxRows_get label_257).trans
    (congrArg lower source_op_257).symm
theorem coherent_257 : Coherent label_257 syntax_257 := by
  exact DirectCheckPilot.checkMain_sound label_257 syntax_257
    (by decide +kernel)
theorem returned_257 : ReturnCoherent label_257 syntax_257 := by
  exact DirectCheckPilot.checkReturns_sound label_257 syntax_257
    (by decide +kernel)
theorem main_rows_257 (slot : Fin syntax_257.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_257 syntax_257
      source_syntax_257 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_257 syntax_257 source_syntax_257
    coherent_257 slot bit value
theorem return_rows_257
    (rank : Fin (1 + FieldReturns.writeCount syntax_257))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_257 syntax_257
      source_syntax_257 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_257 syntax_257 source_syntax_257
    returned_257 rank bit value
theorem nodes_257 : syntax_257.size = 1 := by
  decide +kernel
theorem returns_257 : 1 + FieldReturns.writeCount syntax_257 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t2\t{now}"
      handle.flush
def label_258 : Fin 4042 := ⟨258, by decide +kernel⟩
noncomputable def raw_258 : RawOp :=
  RawOp.jump
    ⟨#[
      1958,
      1958,
      1958,
      1958,
      1958
    ], rfl⟩
noncomputable def op_258 : Op 4042 := (restore 4042 raw_258).getD .halt
noncomputable def syntax_258 : Syntax 4042 := lower op_258
theorem source_raw_258 :
    erase (toTableOp (Snapshot.program label_258)) = raw_258 := by
  decide +kernel
theorem source_op_258 : op_258 = Snapshot.program label_258 :=
  restored_literal (Snapshot.program label_258) raw_258 source_raw_258
theorem source_syntax_258 :
    FieldPacked.syntaxRows.get label_258 = syntax_258 :=
  (FieldAware.syntaxRows_get label_258).trans
    (congrArg lower source_op_258).symm
theorem coherent_258 : Coherent label_258 syntax_258 := by
  exact DirectCheckPilot.checkMain_sound label_258 syntax_258
    (by decide +kernel)
theorem returned_258 : ReturnCoherent label_258 syntax_258 := by
  exact DirectCheckPilot.checkReturns_sound label_258 syntax_258
    (by decide +kernel)
theorem main_rows_258 (slot : Fin syntax_258.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_258 syntax_258
      source_syntax_258 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_258 syntax_258 source_syntax_258
    coherent_258 slot bit value
theorem return_rows_258
    (rank : Fin (1 + FieldReturns.writeCount syntax_258))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_258 syntax_258
      source_syntax_258 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_258 syntax_258 source_syntax_258
    returned_258 rank bit value
theorem nodes_258 : syntax_258.size = 1 := by
  decide +kernel
theorem returns_258 : 1 + FieldReturns.writeCount syntax_258 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t3\t{now}"
      handle.flush
def label_259 : Fin 4042 := ⟨259, by decide +kernel⟩
noncomputable def raw_259 : RawOp :=
  RawOp.jump
    ⟨#[
      262,
      262,
      262,
      262,
      262
    ], rfl⟩
noncomputable def op_259 : Op 4042 := (restore 4042 raw_259).getD .halt
noncomputable def syntax_259 : Syntax 4042 := lower op_259
theorem source_raw_259 :
    erase (toTableOp (Snapshot.program label_259)) = raw_259 := by
  decide +kernel
theorem source_op_259 : op_259 = Snapshot.program label_259 :=
  restored_literal (Snapshot.program label_259) raw_259 source_raw_259
theorem source_syntax_259 :
    FieldPacked.syntaxRows.get label_259 = syntax_259 :=
  (FieldAware.syntaxRows_get label_259).trans
    (congrArg lower source_op_259).symm
theorem coherent_259 : Coherent label_259 syntax_259 := by
  exact DirectCheckPilot.checkMain_sound label_259 syntax_259
    (by decide +kernel)
theorem returned_259 : ReturnCoherent label_259 syntax_259 := by
  exact DirectCheckPilot.checkReturns_sound label_259 syntax_259
    (by decide +kernel)
theorem main_rows_259 (slot : Fin syntax_259.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_259 syntax_259
      source_syntax_259 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_259 syntax_259 source_syntax_259
    coherent_259 slot bit value
theorem return_rows_259
    (rank : Fin (1 + FieldReturns.writeCount syntax_259))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_259 syntax_259
      source_syntax_259 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_259 syntax_259 source_syntax_259
    returned_259 rank bit value
theorem nodes_259 : syntax_259.size = 1 := by
  decide +kernel
theorem returns_259 : 1 + FieldReturns.writeCount syntax_259 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t4\t{now}"
      handle.flush
def label_260 : Fin 4042 := ⟨260, by decide +kernel⟩
noncomputable def raw_260 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    258
    259
noncomputable def op_260 : Op 4042 := (restore 4042 raw_260).getD .halt
noncomputable def syntax_260 : Syntax 4042 := lower op_260
theorem source_raw_260 :
    erase (toTableOp (Snapshot.program label_260)) = raw_260 := by
  decide +kernel
theorem source_op_260 : op_260 = Snapshot.program label_260 :=
  restored_literal (Snapshot.program label_260) raw_260 source_raw_260
theorem source_syntax_260 :
    FieldPacked.syntaxRows.get label_260 = syntax_260 :=
  (FieldAware.syntaxRows_get label_260).trans
    (congrArg lower source_op_260).symm
theorem coherent_260 : Coherent label_260 syntax_260 := by
  exact DirectCheckPilot.checkMain_sound label_260 syntax_260
    (by decide +kernel)
theorem returned_260 : ReturnCoherent label_260 syntax_260 := by
  exact DirectCheckPilot.checkReturns_sound label_260 syntax_260
    (by decide +kernel)
theorem main_rows_260 (slot : Fin syntax_260.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_260 syntax_260
      source_syntax_260 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_260 syntax_260 source_syntax_260
    coherent_260 slot bit value
theorem return_rows_260
    (rank : Fin (1 + FieldReturns.writeCount syntax_260))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_260 syntax_260
      source_syntax_260 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_260 syntax_260 source_syntax_260
    returned_260 rank bit value
theorem nodes_260 : syntax_260.size = 3 := by
  decide +kernel
theorem returns_260 : 1 + FieldReturns.writeCount syntax_260 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t5\t{now}"
      handle.flush
def label_261 : Fin 4042 := ⟨261, by decide +kernel⟩
noncomputable def raw_261 : RawOp :=
  RawOp.jump
    ⟨#[
      1961,
      1961,
      1961,
      1961,
      1961
    ], rfl⟩
noncomputable def op_261 : Op 4042 := (restore 4042 raw_261).getD .halt
noncomputable def syntax_261 : Syntax 4042 := lower op_261
theorem source_raw_261 :
    erase (toTableOp (Snapshot.program label_261)) = raw_261 := by
  decide +kernel
theorem source_op_261 : op_261 = Snapshot.program label_261 :=
  restored_literal (Snapshot.program label_261) raw_261 source_raw_261
theorem source_syntax_261 :
    FieldPacked.syntaxRows.get label_261 = syntax_261 :=
  (FieldAware.syntaxRows_get label_261).trans
    (congrArg lower source_op_261).symm
theorem coherent_261 : Coherent label_261 syntax_261 := by
  exact DirectCheckPilot.checkMain_sound label_261 syntax_261
    (by decide +kernel)
theorem returned_261 : ReturnCoherent label_261 syntax_261 := by
  exact DirectCheckPilot.checkReturns_sound label_261 syntax_261
    (by decide +kernel)
theorem main_rows_261 (slot : Fin syntax_261.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_261 syntax_261
      source_syntax_261 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_261 syntax_261 source_syntax_261
    coherent_261 slot bit value
theorem return_rows_261
    (rank : Fin (1 + FieldReturns.writeCount syntax_261))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_261 syntax_261
      source_syntax_261 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_261 syntax_261 source_syntax_261
    returned_261 rank bit value
theorem nodes_261 : syntax_261.size = 1 := by
  decide +kernel
theorem returns_261 : 1 + FieldReturns.writeCount syntax_261 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t6\t{now}"
      handle.flush
def label_262 : Fin 4042 := ⟨262, by decide +kernel⟩
noncomputable def raw_262 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    261
    206
noncomputable def op_262 : Op 4042 := (restore 4042 raw_262).getD .halt
noncomputable def syntax_262 : Syntax 4042 := lower op_262
theorem source_raw_262 :
    erase (toTableOp (Snapshot.program label_262)) = raw_262 := by
  decide +kernel
theorem source_op_262 : op_262 = Snapshot.program label_262 :=
  restored_literal (Snapshot.program label_262) raw_262 source_raw_262
theorem source_syntax_262 :
    FieldPacked.syntaxRows.get label_262 = syntax_262 :=
  (FieldAware.syntaxRows_get label_262).trans
    (congrArg lower source_op_262).symm
theorem coherent_262 : Coherent label_262 syntax_262 := by
  exact DirectCheckPilot.checkMain_sound label_262 syntax_262
    (by decide +kernel)
theorem returned_262 : ReturnCoherent label_262 syntax_262 := by
  exact DirectCheckPilot.checkReturns_sound label_262 syntax_262
    (by decide +kernel)
theorem main_rows_262 (slot : Fin syntax_262.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_262 syntax_262
      source_syntax_262 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_262 syntax_262 source_syntax_262
    coherent_262 slot bit value
theorem return_rows_262
    (rank : Fin (1 + FieldReturns.writeCount syntax_262))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_262 syntax_262
      source_syntax_262 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_262 syntax_262 source_syntax_262
    returned_262 rank bit value
theorem nodes_262 : syntax_262.size = 3 := by
  decide +kernel
theorem returns_262 : 1 + FieldReturns.writeCount syntax_262 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t7\t{now}"
      handle.flush
def label_263 : Fin 4042 := ⟨263, by decide +kernel⟩
noncomputable def raw_263 : RawOp :=
  RawOp.jump
    ⟨#[
      1975,
      1975,
      1975,
      1975,
      1975
    ], rfl⟩
noncomputable def op_263 : Op 4042 := (restore 4042 raw_263).getD .halt
noncomputable def syntax_263 : Syntax 4042 := lower op_263
theorem source_raw_263 :
    erase (toTableOp (Snapshot.program label_263)) = raw_263 := by
  decide +kernel
theorem source_op_263 : op_263 = Snapshot.program label_263 :=
  restored_literal (Snapshot.program label_263) raw_263 source_raw_263
theorem source_syntax_263 :
    FieldPacked.syntaxRows.get label_263 = syntax_263 :=
  (FieldAware.syntaxRows_get label_263).trans
    (congrArg lower source_op_263).symm
theorem coherent_263 : Coherent label_263 syntax_263 := by
  exact DirectCheckPilot.checkMain_sound label_263 syntax_263
    (by decide +kernel)
theorem returned_263 : ReturnCoherent label_263 syntax_263 := by
  exact DirectCheckPilot.checkReturns_sound label_263 syntax_263
    (by decide +kernel)
theorem main_rows_263 (slot : Fin syntax_263.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_263 syntax_263
      source_syntax_263 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_263 syntax_263 source_syntax_263
    coherent_263 slot bit value
theorem return_rows_263
    (rank : Fin (1 + FieldReturns.writeCount syntax_263))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_263 syntax_263
      source_syntax_263 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_263 syntax_263 source_syntax_263
    returned_263 rank bit value
theorem nodes_263 : syntax_263.size = 1 := by
  decide +kernel
theorem returns_263 : 1 + FieldReturns.writeCount syntax_263 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t8\t{now}"
      handle.flush
def label_264 : Fin 4042 := ⟨264, by decide +kernel⟩
noncomputable def raw_264 : RawOp :=
  RawOp.jump
    ⟨#[
      1978,
      1978,
      1978,
      1978,
      1978
    ], rfl⟩
noncomputable def op_264 : Op 4042 := (restore 4042 raw_264).getD .halt
noncomputable def syntax_264 : Syntax 4042 := lower op_264
theorem source_raw_264 :
    erase (toTableOp (Snapshot.program label_264)) = raw_264 := by
  decide +kernel
theorem source_op_264 : op_264 = Snapshot.program label_264 :=
  restored_literal (Snapshot.program label_264) raw_264 source_raw_264
theorem source_syntax_264 :
    FieldPacked.syntaxRows.get label_264 = syntax_264 :=
  (FieldAware.syntaxRows_get label_264).trans
    (congrArg lower source_op_264).symm
theorem coherent_264 : Coherent label_264 syntax_264 := by
  exact DirectCheckPilot.checkMain_sound label_264 syntax_264
    (by decide +kernel)
theorem returned_264 : ReturnCoherent label_264 syntax_264 := by
  exact DirectCheckPilot.checkReturns_sound label_264 syntax_264
    (by decide +kernel)
theorem main_rows_264 (slot : Fin syntax_264.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_264 syntax_264
      source_syntax_264 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_264 syntax_264 source_syntax_264
    coherent_264 slot bit value
theorem return_rows_264
    (rank : Fin (1 + FieldReturns.writeCount syntax_264))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_264 syntax_264
      source_syntax_264 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_264 syntax_264 source_syntax_264
    returned_264 rank bit value
theorem nodes_264 : syntax_264.size = 1 := by
  decide +kernel
theorem returns_264 : 1 + FieldReturns.writeCount syntax_264 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t9\t{now}"
      handle.flush
def label_265 : Fin 4042 := ⟨265, by decide +kernel⟩
noncomputable def raw_265 : RawOp :=
  RawOp.jump
    ⟨#[
      127,
      127,
      127,
      127,
      127
    ], rfl⟩
noncomputable def op_265 : Op 4042 := (restore 4042 raw_265).getD .halt
noncomputable def syntax_265 : Syntax 4042 := lower op_265
theorem source_raw_265 :
    erase (toTableOp (Snapshot.program label_265)) = raw_265 := by
  decide +kernel
theorem source_op_265 : op_265 = Snapshot.program label_265 :=
  restored_literal (Snapshot.program label_265) raw_265 source_raw_265
theorem source_syntax_265 :
    FieldPacked.syntaxRows.get label_265 = syntax_265 :=
  (FieldAware.syntaxRows_get label_265).trans
    (congrArg lower source_op_265).symm
theorem coherent_265 : Coherent label_265 syntax_265 := by
  exact DirectCheckPilot.checkMain_sound label_265 syntax_265
    (by decide +kernel)
theorem returned_265 : ReturnCoherent label_265 syntax_265 := by
  exact DirectCheckPilot.checkReturns_sound label_265 syntax_265
    (by decide +kernel)
theorem main_rows_265 (slot : Fin syntax_265.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_265 syntax_265
      source_syntax_265 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_265 syntax_265 source_syntax_265
    coherent_265 slot bit value
theorem return_rows_265
    (rank : Fin (1 + FieldReturns.writeCount syntax_265))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_265 syntax_265
      source_syntax_265 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_265 syntax_265 source_syntax_265
    returned_265 rank bit value
theorem nodes_265 : syntax_265.size = 1 := by
  decide +kernel
theorem returns_265 : 1 + FieldReturns.writeCount syntax_265 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t10\t{now}"
      handle.flush
def label_266 : Fin 4042 := ⟨266, by decide +kernel⟩
noncomputable def raw_266 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    264
    265
noncomputable def op_266 : Op 4042 := (restore 4042 raw_266).getD .halt
noncomputable def syntax_266 : Syntax 4042 := lower op_266
theorem source_raw_266 :
    erase (toTableOp (Snapshot.program label_266)) = raw_266 := by
  decide +kernel
theorem source_op_266 : op_266 = Snapshot.program label_266 :=
  restored_literal (Snapshot.program label_266) raw_266 source_raw_266
theorem source_syntax_266 :
    FieldPacked.syntaxRows.get label_266 = syntax_266 :=
  (FieldAware.syntaxRows_get label_266).trans
    (congrArg lower source_op_266).symm
theorem coherent_266 : Coherent label_266 syntax_266 := by
  exact DirectCheckPilot.checkMain_sound label_266 syntax_266
    (by decide +kernel)
theorem returned_266 : ReturnCoherent label_266 syntax_266 := by
  exact DirectCheckPilot.checkReturns_sound label_266 syntax_266
    (by decide +kernel)
theorem main_rows_266 (slot : Fin syntax_266.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_266 syntax_266
      source_syntax_266 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_266 syntax_266 source_syntax_266
    coherent_266 slot bit value
theorem return_rows_266
    (rank : Fin (1 + FieldReturns.writeCount syntax_266))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_266 syntax_266
      source_syntax_266 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_266 syntax_266 source_syntax_266
    returned_266 rank bit value
theorem nodes_266 : syntax_266.size = 3 := by
  decide +kernel
theorem returns_266 : 1 + FieldReturns.writeCount syntax_266 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t11\t{now}"
      handle.flush
def label_267 : Fin 4042 := ⟨267, by decide +kernel⟩
noncomputable def raw_267 : RawOp :=
  RawOp.jump
    ⟨#[
      2005,
      2005,
      2005,
      2005,
      2005
    ], rfl⟩
noncomputable def op_267 : Op 4042 := (restore 4042 raw_267).getD .halt
noncomputable def syntax_267 : Syntax 4042 := lower op_267
theorem source_raw_267 :
    erase (toTableOp (Snapshot.program label_267)) = raw_267 := by
  decide +kernel
theorem source_op_267 : op_267 = Snapshot.program label_267 :=
  restored_literal (Snapshot.program label_267) raw_267 source_raw_267
theorem source_syntax_267 :
    FieldPacked.syntaxRows.get label_267 = syntax_267 :=
  (FieldAware.syntaxRows_get label_267).trans
    (congrArg lower source_op_267).symm
theorem coherent_267 : Coherent label_267 syntax_267 := by
  exact DirectCheckPilot.checkMain_sound label_267 syntax_267
    (by decide +kernel)
theorem returned_267 : ReturnCoherent label_267 syntax_267 := by
  exact DirectCheckPilot.checkReturns_sound label_267 syntax_267
    (by decide +kernel)
theorem main_rows_267 (slot : Fin syntax_267.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_267 syntax_267
      source_syntax_267 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_267 syntax_267 source_syntax_267
    coherent_267 slot bit value
theorem return_rows_267
    (rank : Fin (1 + FieldReturns.writeCount syntax_267))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_267 syntax_267
      source_syntax_267 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_267 syntax_267 source_syntax_267
    returned_267 rank bit value
theorem nodes_267 : syntax_267.size = 1 := by
  decide +kernel
theorem returns_267 : 1 + FieldReturns.writeCount syntax_267 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t12\t{now}"
      handle.flush
def label_268 : Fin 4042 := ⟨268, by decide +kernel⟩
noncomputable def raw_268 : RawOp :=
  RawOp.jump
    ⟨#[
      2013,
      2013,
      2013,
      2013,
      2013
    ], rfl⟩
noncomputable def op_268 : Op 4042 := (restore 4042 raw_268).getD .halt
noncomputable def syntax_268 : Syntax 4042 := lower op_268
theorem source_raw_268 :
    erase (toTableOp (Snapshot.program label_268)) = raw_268 := by
  decide +kernel
theorem source_op_268 : op_268 = Snapshot.program label_268 :=
  restored_literal (Snapshot.program label_268) raw_268 source_raw_268
theorem source_syntax_268 :
    FieldPacked.syntaxRows.get label_268 = syntax_268 :=
  (FieldAware.syntaxRows_get label_268).trans
    (congrArg lower source_op_268).symm
theorem coherent_268 : Coherent label_268 syntax_268 := by
  exact DirectCheckPilot.checkMain_sound label_268 syntax_268
    (by decide +kernel)
theorem returned_268 : ReturnCoherent label_268 syntax_268 := by
  exact DirectCheckPilot.checkReturns_sound label_268 syntax_268
    (by decide +kernel)
theorem main_rows_268 (slot : Fin syntax_268.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_268 syntax_268
      source_syntax_268 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_268 syntax_268 source_syntax_268
    coherent_268 slot bit value
theorem return_rows_268
    (rank : Fin (1 + FieldReturns.writeCount syntax_268))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_268 syntax_268
      source_syntax_268 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_268 syntax_268 source_syntax_268
    returned_268 rank bit value
theorem nodes_268 : syntax_268.size = 1 := by
  decide +kernel
theorem returns_268 : 1 + FieldReturns.writeCount syntax_268 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t13\t{now}"
      handle.flush
def label_269 : Fin 4042 := ⟨269, by decide +kernel⟩
noncomputable def raw_269 : RawOp :=
  RawOp.jump
    ⟨#[
      2025,
      2025,
      2025,
      2025,
      2025
    ], rfl⟩
noncomputable def op_269 : Op 4042 := (restore 4042 raw_269).getD .halt
noncomputable def syntax_269 : Syntax 4042 := lower op_269
theorem source_raw_269 :
    erase (toTableOp (Snapshot.program label_269)) = raw_269 := by
  decide +kernel
theorem source_op_269 : op_269 = Snapshot.program label_269 :=
  restored_literal (Snapshot.program label_269) raw_269 source_raw_269
theorem source_syntax_269 :
    FieldPacked.syntaxRows.get label_269 = syntax_269 :=
  (FieldAware.syntaxRows_get label_269).trans
    (congrArg lower source_op_269).symm
theorem coherent_269 : Coherent label_269 syntax_269 := by
  exact DirectCheckPilot.checkMain_sound label_269 syntax_269
    (by decide +kernel)
theorem returned_269 : ReturnCoherent label_269 syntax_269 := by
  exact DirectCheckPilot.checkReturns_sound label_269 syntax_269
    (by decide +kernel)
theorem main_rows_269 (slot : Fin syntax_269.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_269 syntax_269
      source_syntax_269 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_269 syntax_269 source_syntax_269
    coherent_269 slot bit value
theorem return_rows_269
    (rank : Fin (1 + FieldReturns.writeCount syntax_269))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_269 syntax_269
      source_syntax_269 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_269 syntax_269 source_syntax_269
    returned_269 rank bit value
theorem nodes_269 : syntax_269.size = 1 := by
  decide +kernel
theorem returns_269 : 1 + FieldReturns.writeCount syntax_269 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t14\t{now}"
      handle.flush
def label_270 : Fin 4042 := ⟨270, by decide +kernel⟩
noncomputable def raw_270 : RawOp :=
  RawOp.jump
    ⟨#[
      2033,
      2033,
      2033,
      2033,
      2033
    ], rfl⟩
noncomputable def op_270 : Op 4042 := (restore 4042 raw_270).getD .halt
noncomputable def syntax_270 : Syntax 4042 := lower op_270
theorem source_raw_270 :
    erase (toTableOp (Snapshot.program label_270)) = raw_270 := by
  decide +kernel
theorem source_op_270 : op_270 = Snapshot.program label_270 :=
  restored_literal (Snapshot.program label_270) raw_270 source_raw_270
theorem source_syntax_270 :
    FieldPacked.syntaxRows.get label_270 = syntax_270 :=
  (FieldAware.syntaxRows_get label_270).trans
    (congrArg lower source_op_270).symm
theorem coherent_270 : Coherent label_270 syntax_270 := by
  exact DirectCheckPilot.checkMain_sound label_270 syntax_270
    (by decide +kernel)
theorem returned_270 : ReturnCoherent label_270 syntax_270 := by
  exact DirectCheckPilot.checkReturns_sound label_270 syntax_270
    (by decide +kernel)
theorem main_rows_270 (slot : Fin syntax_270.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_270 syntax_270
      source_syntax_270 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_270 syntax_270 source_syntax_270
    coherent_270 slot bit value
theorem return_rows_270
    (rank : Fin (1 + FieldReturns.writeCount syntax_270))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_270 syntax_270
      source_syntax_270 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_270 syntax_270 source_syntax_270
    returned_270 rank bit value
theorem nodes_270 : syntax_270.size = 1 := by
  decide +kernel
theorem returns_270 : 1 + FieldReturns.writeCount syntax_270 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t15\t{now}"
      handle.flush
def label_271 : Fin 4042 := ⟨271, by decide +kernel⟩
noncomputable def raw_271 : RawOp :=
  RawOp.jump
    ⟨#[
      2047,
      2047,
      2047,
      2047,
      2047
    ], rfl⟩
noncomputable def op_271 : Op 4042 := (restore 4042 raw_271).getD .halt
noncomputable def syntax_271 : Syntax 4042 := lower op_271
theorem source_raw_271 :
    erase (toTableOp (Snapshot.program label_271)) = raw_271 := by
  decide +kernel
theorem source_op_271 : op_271 = Snapshot.program label_271 :=
  restored_literal (Snapshot.program label_271) raw_271 source_raw_271
theorem source_syntax_271 :
    FieldPacked.syntaxRows.get label_271 = syntax_271 :=
  (FieldAware.syntaxRows_get label_271).trans
    (congrArg lower source_op_271).symm
theorem coherent_271 : Coherent label_271 syntax_271 := by
  exact DirectCheckPilot.checkMain_sound label_271 syntax_271
    (by decide +kernel)
theorem returned_271 : ReturnCoherent label_271 syntax_271 := by
  exact DirectCheckPilot.checkReturns_sound label_271 syntax_271
    (by decide +kernel)
theorem main_rows_271 (slot : Fin syntax_271.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_271 syntax_271
      source_syntax_271 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_271 syntax_271 source_syntax_271
    coherent_271 slot bit value
theorem return_rows_271
    (rank : Fin (1 + FieldReturns.writeCount syntax_271))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_271 syntax_271
      source_syntax_271 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_271 syntax_271 source_syntax_271
    returned_271 rank bit value
theorem nodes_271 : syntax_271.size = 1 := by
  decide +kernel
theorem returns_271 : 1 + FieldReturns.writeCount syntax_271 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t16\t{now}"
      handle.flush
def label_272 : Fin 4042 := ⟨272, by decide +kernel⟩
noncomputable def raw_272 : RawOp :=
  RawOp.jump
    ⟨#[
      2052,
      2052,
      2052,
      2052,
      2052
    ], rfl⟩
noncomputable def op_272 : Op 4042 := (restore 4042 raw_272).getD .halt
noncomputable def syntax_272 : Syntax 4042 := lower op_272
theorem source_raw_272 :
    erase (toTableOp (Snapshot.program label_272)) = raw_272 := by
  decide +kernel
theorem source_op_272 : op_272 = Snapshot.program label_272 :=
  restored_literal (Snapshot.program label_272) raw_272 source_raw_272
theorem source_syntax_272 :
    FieldPacked.syntaxRows.get label_272 = syntax_272 :=
  (FieldAware.syntaxRows_get label_272).trans
    (congrArg lower source_op_272).symm
theorem coherent_272 : Coherent label_272 syntax_272 := by
  exact DirectCheckPilot.checkMain_sound label_272 syntax_272
    (by decide +kernel)
theorem returned_272 : ReturnCoherent label_272 syntax_272 := by
  exact DirectCheckPilot.checkReturns_sound label_272 syntax_272
    (by decide +kernel)
theorem main_rows_272 (slot : Fin syntax_272.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_272 syntax_272
      source_syntax_272 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_272 syntax_272 source_syntax_272
    coherent_272 slot bit value
theorem return_rows_272
    (rank : Fin (1 + FieldReturns.writeCount syntax_272))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_272 syntax_272
      source_syntax_272 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_272 syntax_272 source_syntax_272
    returned_272 rank bit value
theorem nodes_272 : syntax_272.size = 1 := by
  decide +kernel
theorem returns_272 : 1 + FieldReturns.writeCount syntax_272 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t17\t{now}"
      handle.flush
def label_273 : Fin 4042 := ⟨273, by decide +kernel⟩
noncomputable def raw_273 : RawOp :=
  RawOp.jump
    ⟨#[
      275,
      275,
      275,
      275,
      275
    ], rfl⟩
noncomputable def op_273 : Op 4042 := (restore 4042 raw_273).getD .halt
noncomputable def syntax_273 : Syntax 4042 := lower op_273
theorem source_raw_273 :
    erase (toTableOp (Snapshot.program label_273)) = raw_273 := by
  decide +kernel
theorem source_op_273 : op_273 = Snapshot.program label_273 :=
  restored_literal (Snapshot.program label_273) raw_273 source_raw_273
theorem source_syntax_273 :
    FieldPacked.syntaxRows.get label_273 = syntax_273 :=
  (FieldAware.syntaxRows_get label_273).trans
    (congrArg lower source_op_273).symm
theorem coherent_273 : Coherent label_273 syntax_273 := by
  exact DirectCheckPilot.checkMain_sound label_273 syntax_273
    (by decide +kernel)
theorem returned_273 : ReturnCoherent label_273 syntax_273 := by
  exact DirectCheckPilot.checkReturns_sound label_273 syntax_273
    (by decide +kernel)
theorem main_rows_273 (slot : Fin syntax_273.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_273 syntax_273
      source_syntax_273 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_273 syntax_273 source_syntax_273
    coherent_273 slot bit value
theorem return_rows_273
    (rank : Fin (1 + FieldReturns.writeCount syntax_273))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_273 syntax_273
      source_syntax_273 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_273 syntax_273 source_syntax_273
    returned_273 rank bit value
theorem nodes_273 : syntax_273.size = 1 := by
  decide +kernel
theorem returns_273 : 1 + FieldReturns.writeCount syntax_273 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t18\t{now}"
      handle.flush
def label_274 : Fin 4042 := ⟨274, by decide +kernel⟩
noncomputable def raw_274 : RawOp :=
  RawOp.branch
    ⟨#[
      true,
      true,
      true,
      true,
      true
    ], rfl⟩
    272
    273
noncomputable def op_274 : Op 4042 := (restore 4042 raw_274).getD .halt
noncomputable def syntax_274 : Syntax 4042 := lower op_274
theorem source_raw_274 :
    erase (toTableOp (Snapshot.program label_274)) = raw_274 := by
  decide +kernel
theorem source_op_274 : op_274 = Snapshot.program label_274 :=
  restored_literal (Snapshot.program label_274) raw_274 source_raw_274
theorem source_syntax_274 :
    FieldPacked.syntaxRows.get label_274 = syntax_274 :=
  (FieldAware.syntaxRows_get label_274).trans
    (congrArg lower source_op_274).symm
theorem coherent_274 : Coherent label_274 syntax_274 := by
  exact DirectCheckPilot.checkMain_sound label_274 syntax_274
    (by decide +kernel)
theorem returned_274 : ReturnCoherent label_274 syntax_274 := by
  exact DirectCheckPilot.checkReturns_sound label_274 syntax_274
    (by decide +kernel)
theorem main_rows_274 (slot : Fin syntax_274.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_274 syntax_274
      source_syntax_274 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_274 syntax_274 source_syntax_274
    coherent_274 slot bit value
theorem return_rows_274
    (rank : Fin (1 + FieldReturns.writeCount syntax_274))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_274 syntax_274
      source_syntax_274 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_274 syntax_274 source_syntax_274
    returned_274 rank bit value
theorem nodes_274 : syntax_274.size = 3 := by
  decide +kernel
theorem returns_274 : 1 + FieldReturns.writeCount syntax_274 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t19\t{now}"
      handle.flush
def label_275 : Fin 4042 := ⟨275, by decide +kernel⟩
noncomputable def raw_275 : RawOp :=
  RawOp.jump
    ⟨#[
      2064,
      2064,
      2064,
      2064,
      2064
    ], rfl⟩
noncomputable def op_275 : Op 4042 := (restore 4042 raw_275).getD .halt
noncomputable def syntax_275 : Syntax 4042 := lower op_275
theorem source_raw_275 :
    erase (toTableOp (Snapshot.program label_275)) = raw_275 := by
  decide +kernel
theorem source_op_275 : op_275 = Snapshot.program label_275 :=
  restored_literal (Snapshot.program label_275) raw_275 source_raw_275
theorem source_syntax_275 :
    FieldPacked.syntaxRows.get label_275 = syntax_275 :=
  (FieldAware.syntaxRows_get label_275).trans
    (congrArg lower source_op_275).symm
theorem coherent_275 : Coherent label_275 syntax_275 := by
  exact DirectCheckPilot.checkMain_sound label_275 syntax_275
    (by decide +kernel)
theorem returned_275 : ReturnCoherent label_275 syntax_275 := by
  exact DirectCheckPilot.checkReturns_sound label_275 syntax_275
    (by decide +kernel)
theorem main_rows_275 (slot : Fin syntax_275.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_275 syntax_275
      source_syntax_275 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_275 syntax_275 source_syntax_275
    coherent_275 slot bit value
theorem return_rows_275
    (rank : Fin (1 + FieldReturns.writeCount syntax_275))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_275 syntax_275
      source_syntax_275 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_275 syntax_275 source_syntax_275
    returned_275 rank bit value
theorem nodes_275 : syntax_275.size = 1 := by
  decide +kernel
theorem returns_275 : 1 + FieldReturns.writeCount syntax_275 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t20\t{now}"
      handle.flush
def label_276 : Fin 4042 := ⟨276, by decide +kernel⟩
noncomputable def raw_276 : RawOp :=
  RawOp.jump
    ⟨#[
      2066,
      2066,
      2066,
      2066,
      2066
    ], rfl⟩
noncomputable def op_276 : Op 4042 := (restore 4042 raw_276).getD .halt
noncomputable def syntax_276 : Syntax 4042 := lower op_276
theorem source_raw_276 :
    erase (toTableOp (Snapshot.program label_276)) = raw_276 := by
  decide +kernel
theorem source_op_276 : op_276 = Snapshot.program label_276 :=
  restored_literal (Snapshot.program label_276) raw_276 source_raw_276
theorem source_syntax_276 :
    FieldPacked.syntaxRows.get label_276 = syntax_276 :=
  (FieldAware.syntaxRows_get label_276).trans
    (congrArg lower source_op_276).symm
theorem coherent_276 : Coherent label_276 syntax_276 := by
  exact DirectCheckPilot.checkMain_sound label_276 syntax_276
    (by decide +kernel)
theorem returned_276 : ReturnCoherent label_276 syntax_276 := by
  exact DirectCheckPilot.checkReturns_sound label_276 syntax_276
    (by decide +kernel)
theorem main_rows_276 (slot : Fin syntax_276.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_276 syntax_276
      source_syntax_276 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_276 syntax_276 source_syntax_276
    coherent_276 slot bit value
theorem return_rows_276
    (rank : Fin (1 + FieldReturns.writeCount syntax_276))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_276 syntax_276
      source_syntax_276 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_276 syntax_276 source_syntax_276
    returned_276 rank bit value
theorem nodes_276 : syntax_276.size = 1 := by
  decide +kernel
theorem returns_276 : 1 + FieldReturns.writeCount syntax_276 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t21\t{now}"
      handle.flush
def label_277 : Fin 4042 := ⟨277, by decide +kernel⟩
noncomputable def raw_277 : RawOp :=
  RawOp.move
    Dir.right
    276
noncomputable def op_277 : Op 4042 := (restore 4042 raw_277).getD .halt
noncomputable def syntax_277 : Syntax 4042 := lower op_277
theorem source_raw_277 :
    erase (toTableOp (Snapshot.program label_277)) = raw_277 := by
  decide +kernel
theorem source_op_277 : op_277 = Snapshot.program label_277 :=
  restored_literal (Snapshot.program label_277) raw_277 source_raw_277
theorem source_syntax_277 :
    FieldPacked.syntaxRows.get label_277 = syntax_277 :=
  (FieldAware.syntaxRows_get label_277).trans
    (congrArg lower source_op_277).symm
theorem coherent_277 : Coherent label_277 syntax_277 := by
  exact DirectCheckPilot.checkMain_sound label_277 syntax_277
    (by decide +kernel)
theorem returned_277 : ReturnCoherent label_277 syntax_277 := by
  exact DirectCheckPilot.checkReturns_sound label_277 syntax_277
    (by decide +kernel)
theorem main_rows_277 (slot : Fin syntax_277.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_277 syntax_277
      source_syntax_277 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_277 syntax_277 source_syntax_277
    coherent_277 slot bit value
theorem return_rows_277
    (rank : Fin (1 + FieldReturns.writeCount syntax_277))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_277 syntax_277
      source_syntax_277 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_277 syntax_277 source_syntax_277
    returned_277 rank bit value
theorem nodes_277 : syntax_277.size = 14 := by
  decide +kernel
theorem returns_277 : 1 + FieldReturns.writeCount syntax_277 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t22\t{now}"
      handle.flush
def label_278 : Fin 4042 := ⟨278, by decide +kernel⟩
noncomputable def raw_278 : RawOp :=
  RawOp.write
    bounded_4_1
    ⟨#[
      bounded_5_1,
      bounded_5_1,
      bounded_5_2,
      bounded_5_3,
      bounded_5_4
    ], rfl⟩
    277
noncomputable def op_278 : Op 4042 := (restore 4042 raw_278).getD .halt
noncomputable def syntax_278 : Syntax 4042 := lower op_278
theorem source_raw_278 :
    erase (toTableOp (Snapshot.program label_278)) = raw_278 := by
  decide +kernel
theorem source_op_278 : op_278 = Snapshot.program label_278 :=
  restored_literal (Snapshot.program label_278) raw_278 source_raw_278
theorem source_syntax_278 :
    FieldPacked.syntaxRows.get label_278 = syntax_278 :=
  (FieldAware.syntaxRows_get label_278).trans
    (congrArg lower source_op_278).symm
theorem coherent_278 : Coherent label_278 syntax_278 := by
  exact DirectCheckPilot.checkMain_sound label_278 syntax_278
    (by decide +kernel)
theorem returned_278 : ReturnCoherent label_278 syntax_278 := by
  exact DirectCheckPilot.checkReturns_sound label_278 syntax_278
    (by decide +kernel)
theorem main_rows_278 (slot : Fin syntax_278.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_278 syntax_278
      source_syntax_278 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_278 syntax_278 source_syntax_278
    coherent_278 slot bit value
theorem return_rows_278
    (rank : Fin (1 + FieldReturns.writeCount syntax_278))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_278 syntax_278
      source_syntax_278 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_278 syntax_278 source_syntax_278
    returned_278 rank bit value
theorem nodes_278 : syntax_278.size = 74 := by
  decide +kernel
theorem returns_278 : 1 + FieldReturns.writeCount syntax_278 =
    16 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t23\t{now}"
      handle.flush
def label_279 : Fin 4042 := ⟨279, by decide +kernel⟩
noncomputable def raw_279 : RawOp :=
  RawOp.jump
    ⟨#[
      281,
      281,
      281,
      281,
      281
    ], rfl⟩
noncomputable def op_279 : Op 4042 := (restore 4042 raw_279).getD .halt
noncomputable def syntax_279 : Syntax 4042 := lower op_279
theorem source_raw_279 :
    erase (toTableOp (Snapshot.program label_279)) = raw_279 := by
  decide +kernel
theorem source_op_279 : op_279 = Snapshot.program label_279 :=
  restored_literal (Snapshot.program label_279) raw_279 source_raw_279
theorem source_syntax_279 :
    FieldPacked.syntaxRows.get label_279 = syntax_279 :=
  (FieldAware.syntaxRows_get label_279).trans
    (congrArg lower source_op_279).symm
theorem coherent_279 : Coherent label_279 syntax_279 := by
  exact DirectCheckPilot.checkMain_sound label_279 syntax_279
    (by decide +kernel)
theorem returned_279 : ReturnCoherent label_279 syntax_279 := by
  exact DirectCheckPilot.checkReturns_sound label_279 syntax_279
    (by decide +kernel)
theorem main_rows_279 (slot : Fin syntax_279.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_279 syntax_279
      source_syntax_279 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_279 syntax_279 source_syntax_279
    coherent_279 slot bit value
theorem return_rows_279
    (rank : Fin (1 + FieldReturns.writeCount syntax_279))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_279 syntax_279
      source_syntax_279 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_279 syntax_279 source_syntax_279
    returned_279 rank bit value
theorem nodes_279 : syntax_279.size = 1 := by
  decide +kernel
theorem returns_279 : 1 + FieldReturns.writeCount syntax_279 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t24\t{now}"
      handle.flush
def label_280 : Fin 4042 := ⟨280, by decide +kernel⟩
noncomputable def raw_280 : RawOp :=
  RawOp.move
    Dir.right
    279
noncomputable def op_280 : Op 4042 := (restore 4042 raw_280).getD .halt
noncomputable def syntax_280 : Syntax 4042 := lower op_280
theorem source_raw_280 :
    erase (toTableOp (Snapshot.program label_280)) = raw_280 := by
  decide +kernel
theorem source_op_280 : op_280 = Snapshot.program label_280 :=
  restored_literal (Snapshot.program label_280) raw_280 source_raw_280
theorem source_syntax_280 :
    FieldPacked.syntaxRows.get label_280 = syntax_280 :=
  (FieldAware.syntaxRows_get label_280).trans
    (congrArg lower source_op_280).symm
theorem coherent_280 : Coherent label_280 syntax_280 := by
  exact DirectCheckPilot.checkMain_sound label_280 syntax_280
    (by decide +kernel)
theorem returned_280 : ReturnCoherent label_280 syntax_280 := by
  exact DirectCheckPilot.checkReturns_sound label_280 syntax_280
    (by decide +kernel)
theorem main_rows_280 (slot : Fin syntax_280.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_280 syntax_280
      source_syntax_280 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_280 syntax_280 source_syntax_280
    coherent_280 slot bit value
theorem return_rows_280
    (rank : Fin (1 + FieldReturns.writeCount syntax_280))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_280 syntax_280
      source_syntax_280 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_280 syntax_280 source_syntax_280
    returned_280 rank bit value
theorem nodes_280 : syntax_280.size = 14 := by
  decide +kernel
theorem returns_280 : 1 + FieldReturns.writeCount syntax_280 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t25\t{now}"
      handle.flush
def label_281 : Fin 4042 := ⟨281, by decide +kernel⟩
noncomputable def raw_281 : RawOp :=
  RawOp.absent
    bounded_4_1
    278
    280
noncomputable def op_281 : Op 4042 := (restore 4042 raw_281).getD .halt
noncomputable def syntax_281 : Syntax 4042 := lower op_281
theorem source_raw_281 :
    erase (toTableOp (Snapshot.program label_281)) = raw_281 := by
  decide +kernel
theorem source_op_281 : op_281 = Snapshot.program label_281 :=
  restored_literal (Snapshot.program label_281) raw_281 source_raw_281
theorem source_syntax_281 :
    FieldPacked.syntaxRows.get label_281 = syntax_281 :=
  (FieldAware.syntaxRows_get label_281).trans
    (congrArg lower source_op_281).symm
theorem coherent_281 : Coherent label_281 syntax_281 := by
  exact DirectCheckPilot.checkMain_sound label_281 syntax_281
    (by decide +kernel)
theorem returned_281 : ReturnCoherent label_281 syntax_281 := by
  exact DirectCheckPilot.checkReturns_sound label_281 syntax_281
    (by decide +kernel)
theorem main_rows_281 (slot : Fin syntax_281.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_281 syntax_281
      source_syntax_281 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_281 syntax_281 source_syntax_281
    coherent_281 slot bit value
theorem return_rows_281
    (rank : Fin (1 + FieldReturns.writeCount syntax_281))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_281 syntax_281
      source_syntax_281 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_281 syntax_281 source_syntax_281
    returned_281 rank bit value
theorem nodes_281 : syntax_281.size = 80 := by
  decide +kernel
theorem returns_281 : 1 + FieldReturns.writeCount syntax_281 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t26\t{now}"
      handle.flush
def label_282 : Fin 4042 := ⟨282, by decide +kernel⟩
noncomputable def raw_282 : RawOp :=
  RawOp.jump
    ⟨#[
      2076,
      2076,
      2076,
      2076,
      2076
    ], rfl⟩
noncomputable def op_282 : Op 4042 := (restore 4042 raw_282).getD .halt
noncomputable def syntax_282 : Syntax 4042 := lower op_282
theorem source_raw_282 :
    erase (toTableOp (Snapshot.program label_282)) = raw_282 := by
  decide +kernel
theorem source_op_282 : op_282 = Snapshot.program label_282 :=
  restored_literal (Snapshot.program label_282) raw_282 source_raw_282
theorem source_syntax_282 :
    FieldPacked.syntaxRows.get label_282 = syntax_282 :=
  (FieldAware.syntaxRows_get label_282).trans
    (congrArg lower source_op_282).symm
theorem coherent_282 : Coherent label_282 syntax_282 := by
  exact DirectCheckPilot.checkMain_sound label_282 syntax_282
    (by decide +kernel)
theorem returned_282 : ReturnCoherent label_282 syntax_282 := by
  exact DirectCheckPilot.checkReturns_sound label_282 syntax_282
    (by decide +kernel)
theorem main_rows_282 (slot : Fin syntax_282.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_282 syntax_282
      source_syntax_282 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_282 syntax_282 source_syntax_282
    coherent_282 slot bit value
theorem return_rows_282
    (rank : Fin (1 + FieldReturns.writeCount syntax_282))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_282 syntax_282
      source_syntax_282 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_282 syntax_282 source_syntax_282
    returned_282 rank bit value
theorem nodes_282 : syntax_282.size = 1 := by
  decide +kernel
theorem returns_282 : 1 + FieldReturns.writeCount syntax_282 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t27\t{now}"
      handle.flush
def label_283 : Fin 4042 := ⟨283, by decide +kernel⟩
noncomputable def raw_283 : RawOp :=
  RawOp.pureLoad
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    282
noncomputable def op_283 : Op 4042 := (restore 4042 raw_283).getD .halt
noncomputable def syntax_283 : Syntax 4042 := lower op_283
theorem source_raw_283 :
    erase (toTableOp (Snapshot.program label_283)) = raw_283 := by
  decide +kernel
theorem source_op_283 : op_283 = Snapshot.program label_283 :=
  restored_literal (Snapshot.program label_283) raw_283 source_raw_283
theorem source_syntax_283 :
    FieldPacked.syntaxRows.get label_283 = syntax_283 :=
  (FieldAware.syntaxRows_get label_283).trans
    (congrArg lower source_op_283).symm
theorem coherent_283 : Coherent label_283 syntax_283 := by
  exact DirectCheckPilot.checkMain_sound label_283 syntax_283
    (by decide +kernel)
theorem returned_283 : ReturnCoherent label_283 syntax_283 := by
  exact DirectCheckPilot.checkReturns_sound label_283 syntax_283
    (by decide +kernel)
theorem main_rows_283 (slot : Fin syntax_283.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_283 syntax_283
      source_syntax_283 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_283 syntax_283 source_syntax_283
    coherent_283 slot bit value
theorem return_rows_283
    (rank : Fin (1 + FieldReturns.writeCount syntax_283))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_283 syntax_283
      source_syntax_283 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_283 syntax_283 source_syntax_283
    returned_283 rank bit value
theorem nodes_283 : syntax_283.size = 2 := by
  decide +kernel
theorem returns_283 : 1 + FieldReturns.writeCount syntax_283 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t28\t{now}"
      handle.flush
def label_284 : Fin 4042 := ⟨284, by decide +kernel⟩
noncomputable def raw_284 : RawOp :=
  RawOp.write
    bounded_4_0
    ⟨#[
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0,
      bounded_5_0
    ], rfl⟩
    282
noncomputable def op_284 : Op 4042 := (restore 4042 raw_284).getD .halt
noncomputable def syntax_284 : Syntax 4042 := lower op_284
theorem source_raw_284 :
    erase (toTableOp (Snapshot.program label_284)) = raw_284 := by
  decide +kernel
theorem source_op_284 : op_284 = Snapshot.program label_284 :=
  restored_literal (Snapshot.program label_284) raw_284 source_raw_284
theorem source_syntax_284 :
    FieldPacked.syntaxRows.get label_284 = syntax_284 :=
  (FieldAware.syntaxRows_get label_284).trans
    (congrArg lower source_op_284).symm
theorem coherent_284 : Coherent label_284 syntax_284 := by
  exact DirectCheckPilot.checkMain_sound label_284 syntax_284
    (by decide +kernel)
theorem returned_284 : ReturnCoherent label_284 syntax_284 := by
  exact DirectCheckPilot.checkReturns_sound label_284 syntax_284
    (by decide +kernel)
theorem main_rows_284 (slot : Fin syntax_284.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_284 syntax_284
      source_syntax_284 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_284 syntax_284 source_syntax_284
    coherent_284 slot bit value
theorem return_rows_284
    (rank : Fin (1 + FieldReturns.writeCount syntax_284))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_284 syntax_284
      source_syntax_284 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_284 syntax_284 source_syntax_284
    returned_284 rank bit value
theorem nodes_284 : syntax_284.size = 44 := by
  decide +kernel
theorem returns_284 : 1 + FieldReturns.writeCount syntax_284 =
    16 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t29\t{now}"
      handle.flush
def label_285 : Fin 4042 := ⟨285, by decide +kernel⟩
noncomputable def raw_285 : RawOp :=
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
    284
noncomputable def op_285 : Op 4042 := (restore 4042 raw_285).getD .halt
noncomputable def syntax_285 : Syntax 4042 := lower op_285
theorem source_raw_285 :
    erase (toTableOp (Snapshot.program label_285)) = raw_285 := by
  decide +kernel
theorem source_op_285 : op_285 = Snapshot.program label_285 :=
  restored_literal (Snapshot.program label_285) raw_285 source_raw_285
theorem source_syntax_285 :
    FieldPacked.syntaxRows.get label_285 = syntax_285 :=
  (FieldAware.syntaxRows_get label_285).trans
    (congrArg lower source_op_285).symm
theorem coherent_285 : Coherent label_285 syntax_285 := by
  exact DirectCheckPilot.checkMain_sound label_285 syntax_285
    (by decide +kernel)
theorem returned_285 : ReturnCoherent label_285 syntax_285 := by
  exact DirectCheckPilot.checkReturns_sound label_285 syntax_285
    (by decide +kernel)
theorem main_rows_285 (slot : Fin syntax_285.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_285 syntax_285
      source_syntax_285 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_285 syntax_285 source_syntax_285
    coherent_285 slot bit value
theorem return_rows_285
    (rank : Fin (1 + FieldReturns.writeCount syntax_285))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_285 syntax_285
      source_syntax_285 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_285 syntax_285 source_syntax_285
    returned_285 rank bit value
theorem nodes_285 : syntax_285.size = 61 := by
  decide +kernel
theorem returns_285 : 1 + FieldReturns.writeCount syntax_285 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t30\t{now}"
      handle.flush
def label_286 : Fin 4042 := ⟨286, by decide +kernel⟩
noncomputable def raw_286 : RawOp :=
  RawOp.move
    Dir.left
    285
noncomputable def op_286 : Op 4042 := (restore 4042 raw_286).getD .halt
noncomputable def syntax_286 : Syntax 4042 := lower op_286
theorem source_raw_286 :
    erase (toTableOp (Snapshot.program label_286)) = raw_286 := by
  decide +kernel
theorem source_op_286 : op_286 = Snapshot.program label_286 :=
  restored_literal (Snapshot.program label_286) raw_286 source_raw_286
theorem source_syntax_286 :
    FieldPacked.syntaxRows.get label_286 = syntax_286 :=
  (FieldAware.syntaxRows_get label_286).trans
    (congrArg lower source_op_286).symm
theorem coherent_286 : Coherent label_286 syntax_286 := by
  exact DirectCheckPilot.checkMain_sound label_286 syntax_286
    (by decide +kernel)
theorem returned_286 : ReturnCoherent label_286 syntax_286 := by
  exact DirectCheckPilot.checkReturns_sound label_286 syntax_286
    (by decide +kernel)
theorem main_rows_286 (slot : Fin syntax_286.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_286 syntax_286
      source_syntax_286 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_286 syntax_286 source_syntax_286
    coherent_286 slot bit value
theorem return_rows_286
    (rank : Fin (1 + FieldReturns.writeCount syntax_286))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_286 syntax_286
      source_syntax_286 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_286 syntax_286 source_syntax_286
    returned_286 rank bit value
theorem nodes_286 : syntax_286.size = 14 := by
  decide +kernel
theorem returns_286 : 1 + FieldReturns.writeCount syntax_286 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t31\t{now}"
      handle.flush
def label_287 : Fin 4042 := ⟨287, by decide +kernel⟩
noncomputable def raw_287 : RawOp :=
  RawOp.marker
    283
    286
noncomputable def op_287 : Op 4042 := (restore 4042 raw_287).getD .halt
noncomputable def syntax_287 : Syntax 4042 := lower op_287
theorem source_raw_287 :
    erase (toTableOp (Snapshot.program label_287)) = raw_287 := by
  decide +kernel
theorem source_op_287 : op_287 = Snapshot.program label_287 :=
  restored_literal (Snapshot.program label_287) raw_287 source_raw_287
theorem source_syntax_287 :
    FieldPacked.syntaxRows.get label_287 = syntax_287 :=
  (FieldAware.syntaxRows_get label_287).trans
    (congrArg lower source_op_287).symm
theorem coherent_287 : Coherent label_287 syntax_287 := by
  exact DirectCheckPilot.checkMain_sound label_287 syntax_287
    (by decide +kernel)
theorem returned_287 : ReturnCoherent label_287 syntax_287 := by
  exact DirectCheckPilot.checkReturns_sound label_287 syntax_287
    (by decide +kernel)
theorem main_rows_287 (slot : Fin syntax_287.size)
    (bit : Bool) (value : Fin 5) :
    RowAt (mainIndex (slotIndex label_287 syntax_287
      source_syntax_287 slot) value) (Binary.encodeSymbol bit) :=
  main_rows_local label_287 syntax_287 source_syntax_287
    coherent_287 slot bit value
theorem return_rows_287
    (rank : Fin (1 + FieldReturns.writeCount syntax_287))
    (bit : Bool) (value : Fin 5) :
    RowAt (bounceIndex label_287 syntax_287
      source_syntax_287 rank value) (Binary.encodeSymbol bit) :=
  return_rows_local label_287 syntax_287 source_syntax_287
    returned_287 rank bit value
theorem nodes_287 : syntax_287.size = 39 := by
  decide +kernel
theorem returns_287 : 1 + FieldReturns.writeCount syntax_287 =
    1 := by decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/local-chunk-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"complete-local-source-operations\t32\t{now}"
      handle.flush
noncomputable def nodesCount : Nat :=
  syntax_256.size +
  syntax_257.size +
  syntax_258.size +
  syntax_259.size +
  syntax_260.size +
  syntax_261.size +
  syntax_262.size +
  syntax_263.size +
  syntax_264.size +
  syntax_265.size +
  syntax_266.size +
  syntax_267.size +
  syntax_268.size +
  syntax_269.size +
  syntax_270.size +
  syntax_271.size +
  syntax_272.size +
  syntax_273.size +
  syntax_274.size +
  syntax_275.size +
  syntax_276.size +
  syntax_277.size +
  syntax_278.size +
  syntax_279.size +
  syntax_280.size +
  syntax_281.size +
  syntax_282.size +
  syntax_283.size +
  syntax_284.size +
  syntax_285.size +
  syntax_286.size +
  syntax_287.size
theorem nodes_census : nodesCount = 375 := by
  unfold nodesCount
  rewrite [
    nodes_256,
    nodes_257,
    nodes_258,
    nodes_259,
    nodes_260,
    nodes_261,
    nodes_262,
    nodes_263,
    nodes_264,
    nodes_265,
    nodes_266,
    nodes_267,
    nodes_268,
    nodes_269,
    nodes_270,
    nodes_271,
    nodes_272,
    nodes_273,
    nodes_274,
    nodes_275,
    nodes_276,
    nodes_277,
    nodes_278,
    nodes_279,
    nodes_280,
    nodes_281,
    nodes_282,
    nodes_283,
    nodes_284,
    nodes_285,
    nodes_286,
    nodes_287
  ]
  rfl
noncomputable def returnsCount : Nat :=
  (1 + FieldReturns.writeCount syntax_256) +
  (1 + FieldReturns.writeCount syntax_257) +
  (1 + FieldReturns.writeCount syntax_258) +
  (1 + FieldReturns.writeCount syntax_259) +
  (1 + FieldReturns.writeCount syntax_260) +
  (1 + FieldReturns.writeCount syntax_261) +
  (1 + FieldReturns.writeCount syntax_262) +
  (1 + FieldReturns.writeCount syntax_263) +
  (1 + FieldReturns.writeCount syntax_264) +
  (1 + FieldReturns.writeCount syntax_265) +
  (1 + FieldReturns.writeCount syntax_266) +
  (1 + FieldReturns.writeCount syntax_267) +
  (1 + FieldReturns.writeCount syntax_268) +
  (1 + FieldReturns.writeCount syntax_269) +
  (1 + FieldReturns.writeCount syntax_270) +
  (1 + FieldReturns.writeCount syntax_271) +
  (1 + FieldReturns.writeCount syntax_272) +
  (1 + FieldReturns.writeCount syntax_273) +
  (1 + FieldReturns.writeCount syntax_274) +
  (1 + FieldReturns.writeCount syntax_275) +
  (1 + FieldReturns.writeCount syntax_276) +
  (1 + FieldReturns.writeCount syntax_277) +
  (1 + FieldReturns.writeCount syntax_278) +
  (1 + FieldReturns.writeCount syntax_279) +
  (1 + FieldReturns.writeCount syntax_280) +
  (1 + FieldReturns.writeCount syntax_281) +
  (1 + FieldReturns.writeCount syntax_282) +
  (1 + FieldReturns.writeCount syntax_283) +
  (1 + FieldReturns.writeCount syntax_284) +
  (1 + FieldReturns.writeCount syntax_285) +
  (1 + FieldReturns.writeCount syntax_286) +
  (1 + FieldReturns.writeCount syntax_287)
theorem returns_census : returnsCount = 62 := by
  unfold returnsCount
  rewrite [
    returns_256,
    returns_257,
    returns_258,
    returns_259,
    returns_260,
    returns_261,
    returns_262,
    returns_263,
    returns_264,
    returns_265,
    returns_266,
    returns_267,
    returns_268,
    returns_269,
    returns_270,
    returns_271,
    returns_272,
    returns_273,
    returns_274,
    returns_275,
    returns_276,
    returns_277,
    returns_278,
    returns_279,
    returns_280,
    returns_281,
    returns_282,
    returns_283,
    returns_284,
    returns_285,
    returns_286,
    returns_287
  ]
  rfl
theorem state_domain_census :
    5 * (nodesCount + returnsCount) = 2185 := by
  rewrite [nodes_census, returns_census]
  rfl
theorem row_domain_census :
    10 * (nodesCount + returnsCount) = 4370 := by
  rewrite [nodes_census, returns_census]
  rfl
def anchorSlot : Fin syntax_278.size := ⟨0, by decide +kernel⟩
theorem checked_anchor :
    rowWord (mainAddress (nodePrefixes.lookup label_278.val 0 +
      anchorSlot.val) 0) false =
        stepWord label_278 syntax_278
          (syntax_278.fastNodeAt anchorSlot) false 0 :=
  coherent_278 anchorSlot false 0
def wrongRank : Fin (1 + FieldReturns.writeCount syntax_278) :=
  ⟨1, by decide +kernel⟩
theorem wrong_return_rank_rejected :
    FieldReturns.targetAt syntax_278 0 ≠
      FieldReturns.targetAt syntax_278 wrongRank := by decide +kernel
end LocalChunkPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Complete actual source block main and return rows checked"
