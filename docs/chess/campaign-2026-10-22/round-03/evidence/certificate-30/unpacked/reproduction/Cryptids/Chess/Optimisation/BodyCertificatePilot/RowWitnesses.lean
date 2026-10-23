module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.RowTools
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.WeightTables

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false

def slotIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) : Fin 106668 :=
  FieldSelectiveLayout.nodeIndex q (i.cast (congrArg Syntax.size same).symm)

theorem slotIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) :
    (slotIndex q p same i).val = FieldPackedLayout.offset q + i.val := by
  simpa only [slotIndex, FieldSelectiveLayout.nodeIndex, FieldPacked.layout, Fin.val_cast] using
    FieldPackedLayout.code_val q (i.cast (congrArg Syntax.size same).symm)

theorem getter_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) :
    FieldPacked.getter.node (slotIndex q p same i) =
      TemplateGraph.mapNode (slotIndex q p same) (p.fastNodeAt i) := by
  cases same
  exact getter_local q i
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
def syntax_4041 : Syntax 4042 := lower (Snapshot.program 4041)
theorem syntax_eq_4041 : FieldPacked.syntaxRows.get 4041 = syntax_4041 :=
  FieldAware.syntaxRows_get 4041
theorem offset_4041 : FieldPackedLayout.offset 4041 = 106629 := by
  rw [node_offset_fast] <;> decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t4041\t{now}"
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
def slot_106666 : Fin syntax_4041.size :=
  ⟨37, by decide +kernel⟩
theorem address_106666 :
    slotIndex 4041 syntax_4041 syntax_eq_4041 slot_106666 = 106666 := by
  apply Fin.ext
  rw [slotIndex_val, offset_4041]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t106666\t{now}"
      handle.flush
def slot_106667 : Fin syntax_4041.size :=
  ⟨38, by decide +kernel⟩
theorem address_106667 :
    slotIndex 4041 syntax_4041 syntax_eq_4041 slot_106667 = 106667 := by
  apply Fin.ext
  rw [slotIndex_val, offset_4041]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t106667\t{now}"
      handle.flush
def localNode_0 : BoolGraph.Node syntax_0.size 5 4042 :=
  .goto
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
def localNode_106667 : BoolGraph.Node syntax_4041.size 5 4042 :=
  .move .right slot_106666
theorem local_eq_106667 :
    syntax_4041.fastNodeAt slot_106667 = localNode_106667 := by rfl
theorem getter_witness_106667 :
    FieldPacked.getter.node 106667 =
      TemplateGraph.mapNode (slotIndex 4041 syntax_4041 syntax_eq_4041)
        localNode_106667 := by
  rw [← address_106667, getter_syntax, local_eq_106667]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t106667\t{now}"
      handle.flush

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Actual local syntax and far-end address witnesses checked"
