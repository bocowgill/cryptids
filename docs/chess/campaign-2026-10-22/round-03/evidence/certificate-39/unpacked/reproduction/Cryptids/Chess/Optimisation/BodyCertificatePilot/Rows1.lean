module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.BodyRelation
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SymbolicTransitions
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Diagnostics

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
namespace Sample1
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false
def syntax_0 : Syntax 4042 := lower (Snapshot.program 0)
theorem syntax_eq_0 : FieldPacked.syntaxRows.get 0 = syntax_0 :=
  FieldAware.syntaxRows_get 0
theorem offset_0 : FieldPackedLayout.offset 0 = 0 := by
  exact FieldPackedLayout.offset_zero
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t0\t{now}"
      handle.flush
def syntax_1 : Syntax 4042 := lower (Snapshot.program 1)
theorem syntax_eq_1 : FieldPacked.syntaxRows.get 1 = syntax_1 :=
  FieldAware.syntaxRows_get 1
theorem offset_1 : FieldPackedLayout.offset 1 = 1 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1\t{now}"
      handle.flush
def slot_0 : Fin syntax_0.size :=
  ⟨0, by decide +kernel⟩
theorem address_0 :
    slotIndex 0 syntax_0 syntax_eq_0 slot_0 = 0 := by
  apply Fin.ext
  rw [slotIndex_val, offset_0]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t0\t{now}"
      handle.flush
def slot_1 : Fin syntax_1.size :=
  ⟨0, by decide +kernel⟩
theorem address_1 :
    slotIndex 1 syntax_1 syntax_eq_1 slot_1 = 1 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t1\t{now}"
      handle.flush
def nodeTable_0 : BoolGraph.Table 5 (Fin 4042) :=
  ⟨#[
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩,
      ⟨1, by decide⟩], rfl⟩
def localNode_0 : BoolGraph.Node syntax_0.size 5 4042 :=
  .goto
    nodeTable_0
theorem local_eq_0 :
    syntax_0.fastNodeAt slot_0 = localNode_0 := by rfl
theorem getter_witness_0 :
    FieldPacked.getter.node 0 =
      TemplateGraph.mapNode (slotIndex 0 syntax_0 syntax_eq_0)
        localNode_0 := by
  rw [← address_0, getter_syntax, local_eq_0]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t0\t{now}"
      handle.flush
def globalNode_0 : BoolGraph.Node 106668 5 4042 :=
  .goto
    nodeTable_0
theorem numeric_node_0 :
    FieldPacked.getter.node 0 = globalNode_0 := by
  simpa only [
    localNode_0,
    globalNode_0,
    TemplateGraph.mapNode] using getter_witness_0
capture_cert in
theorem root_1 : syntax_1.root = slot_1 := by rfl
capture_cert in
theorem entry_1 : FieldPacked.getter.entry 1 = 1 := by
  rw [entry_syntax 1 syntax_1 syntax_eq_1, root_1, address_1]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-1\t1\t{now}"
      handle.flush
capture_cert in
theorem return_offset_1 : FieldSelectiveLayout.offset 1 =
    1 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-1\t1\t{now}"
      handle.flush
def rank_1_0 : Fin (1 + FieldReturns.writeCount syntax_1) :=
  ⟨0, by decide +kernel⟩
capture_cert in
theorem rank_val_1_0 : rank_1_0.val = 0 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"ranks-1\t0\t{now}"
      handle.flush
capture_cert in
theorem find_1_1 :
    FieldReturns.findTarget syntax_1 slot_1 = some rank_1_0 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"targets-1\t0\t{now}"
      handle.flush
capture_cert in
theorem main_address_0_0 :
    mainIndex 0 0 = 0 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-1\t0\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"before-bounce-1\t0\t{now}"
      handle.flush
section
attribute [local irreducible] returnIndex bounceIndex
capture_cert in
theorem bounce_address_1_0_0 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 0 =
      533347 := by
  apply Fin.ext
  simpa only [return_offset_1, rank_val_1_0] using
    bounceIndex_val 1 syntax_1 syntax_eq_1 rank_1_0 0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-1\t533347\t{now}"
      handle.flush
end
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"before-aux-1\t0\t{now}"
      handle.flush
capture_cert in
theorem table_read_0_0_0 :
    nodeTable_0.read false 0 = 1 := by rfl
capture_cert in
theorem aux_0_0_0 :
    LazyGraph.trAux FieldPacked.getter false 0 0 =
      ((some (1 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    0 0 nodeTable_0 numeric_node_0,
    table_read_0_0_0, entry_1]
capture_cert in
theorem table_read_0_1_0 :
    nodeTable_0.read true 0 = 1 := by rfl
capture_cert in
theorem aux_0_1_0 :
    LazyGraph.trAux FieldPacked.getter true 0 0 =
      ((some (1 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    0 0 nodeTable_0 numeric_node_0,
    table_read_0_1_0, entry_1]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-1\t5\t{now}"
      handle.flush
capture_cert in
theorem actual_0_0 :
    FieldSelective.body.toMachine.transition 0 0 =
      some ((0 : Fin 2), .right, (533347 : Fin 573802)) := by
  exact symbolic_main_write 0 0 1
    syntax_1 syntax_eq_1 slot_1 rank_1_0
    0 false false
    0 533347 1
    main_address_0_0 address_1
    bounce_address_1_0_0
    aux_0_0_0 find_1_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-1\t0\t{now}"
      handle.flush
capture_cert in
theorem row_1_0_0 : RowAt 0 0 := by
  unfold RowAt
  rw [actual_0_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-1\t0\t{now}"
      handle.flush
capture_cert in
theorem actual_0_1 :
    FieldSelective.body.toMachine.transition 0 1 =
      some ((1 : Fin 2), .right, (533347 : Fin 573802)) := by
  exact symbolic_main_write 0 0 1
    syntax_1 syntax_eq_1 slot_1 rank_1_0
    0 true true
    0 533347 1
    main_address_0_0 address_1
    bounce_address_1_0_0
    aux_0_1_0 find_1_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-1\t1\t{now}"
      handle.flush
capture_cert in
theorem row_1_0_1 : RowAt 0 1 := by
  unfold RowAt
  rw [actual_0_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-1-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-1\t1\t{now}"
      handle.flush
end Sample1

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body kernel rows checked: 1 states, 2 rows"
