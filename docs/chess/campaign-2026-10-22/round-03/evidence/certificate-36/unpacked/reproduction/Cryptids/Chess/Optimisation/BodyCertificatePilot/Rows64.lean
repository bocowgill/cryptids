module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.BodyRelation
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.ActualTools
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.Diagnostics

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
namespace Sample64
attribute [local irreducible] FieldPacked.getter FieldPacked.layout
attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code
-- Rewriting must see the same closed numeric state type on both sides.
attribute [local reducible] CompactPost.stateCount
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
def syntax_2 : Syntax 4042 := lower (Snapshot.program 2)
theorem syntax_eq_2 : FieldPacked.syntaxRows.get 2 = syntax_2 :=
  FieldAware.syntaxRows_get 2
theorem offset_2 : FieldPackedLayout.offset 2 = 2 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2\t{now}"
      handle.flush
def syntax_4 : Syntax 4042 := lower (Snapshot.program 4)
theorem syntax_eq_4 : FieldPacked.syntaxRows.get 4 = syntax_4 :=
  FieldAware.syntaxRows_get 4
theorem offset_4 : FieldPackedLayout.offset 4 = 4 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t4\t{now}"
      handle.flush
def syntax_216 : Syntax 4042 := lower (Snapshot.program 216)
theorem syntax_eq_216 : FieldPacked.syntaxRows.get 216 = syntax_216 :=
  FieldAware.syntaxRows_get 216
theorem offset_216 : FieldPackedLayout.offset 216 = 296 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t216\t{now}"
      handle.flush
def syntax_217 : Syntax 4042 := lower (Snapshot.program 217)
theorem syntax_eq_217 : FieldPacked.syntaxRows.get 217 = syntax_217 :=
  FieldAware.syntaxRows_get 217
theorem offset_217 : FieldPackedLayout.offset 217 = 297 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t217\t{now}"
      handle.flush
def syntax_277 : Syntax 4042 := lower (Snapshot.program 277)
theorem syntax_eq_277 : FieldPacked.syntaxRows.get 277 = syntax_277 :=
  FieldAware.syntaxRows_get 277
theorem offset_277 : FieldPackedLayout.offset 277 = 376 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t277\t{now}"
      handle.flush
def syntax_278 : Syntax 4042 := lower (Snapshot.program 278)
theorem syntax_eq_278 : FieldPacked.syntaxRows.get 278 = syntax_278 :=
  FieldAware.syntaxRows_get 278
theorem offset_278 : FieldPackedLayout.offset 278 = 390 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t278\t{now}"
      handle.flush
def syntax_496 : Syntax 4042 := lower (Snapshot.program 496)
theorem syntax_eq_496 : FieldPacked.syntaxRows.get 496 = syntax_496 :=
  FieldAware.syntaxRows_get 496
theorem offset_496 : FieldPackedLayout.offset 496 = 9100 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t496\t{now}"
      handle.flush
def syntax_588 : Syntax 4042 := lower (Snapshot.program 588)
theorem syntax_eq_588 : FieldPacked.syntaxRows.get 588 = syntax_588 :=
  FieldAware.syntaxRows_get 588
theorem offset_588 : FieldPackedLayout.offset 588 = 13262 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t588\t{now}"
      handle.flush
def syntax_713 : Syntax 4042 := lower (Snapshot.program 713)
theorem syntax_eq_713 : FieldPacked.syntaxRows.get 713 = syntax_713 :=
  FieldAware.syntaxRows_get 713
theorem offset_713 : FieldPackedLayout.offset 713 = 18791 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t713\t{now}"
      handle.flush
def syntax_793 : Syntax 4042 := lower (Snapshot.program 793)
theorem syntax_eq_793 : FieldPacked.syntaxRows.get 793 = syntax_793 :=
  FieldAware.syntaxRows_get 793
theorem offset_793 : FieldPackedLayout.offset 793 = 21654 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t793\t{now}"
      handle.flush
def syntax_957 : Syntax 4042 := lower (Snapshot.program 957)
theorem syntax_eq_957 : FieldPacked.syntaxRows.get 957 = syntax_957 :=
  FieldAware.syntaxRows_get 957
theorem offset_957 : FieldPackedLayout.offset 957 = 26631 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t957\t{now}"
      handle.flush
def syntax_958 : Syntax 4042 := lower (Snapshot.program 958)
theorem syntax_eq_958 : FieldPacked.syntaxRows.get 958 = syntax_958 :=
  FieldAware.syntaxRows_get 958
theorem offset_958 : FieldPackedLayout.offset 958 = 26645 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t958\t{now}"
      handle.flush
def syntax_1130 : Syntax 4042 := lower (Snapshot.program 1130)
theorem syntax_eq_1130 : FieldPacked.syntaxRows.get 1130 = syntax_1130 :=
  FieldAware.syntaxRows_get 1130
theorem offset_1130 : FieldPackedLayout.offset 1130 = 32709 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1130\t{now}"
      handle.flush
def syntax_1297 : Syntax 4042 := lower (Snapshot.program 1297)
theorem syntax_eq_1297 : FieldPacked.syntaxRows.get 1297 = syntax_1297 :=
  FieldAware.syntaxRows_get 1297
theorem offset_1297 : FieldPackedLayout.offset 1297 = 39993 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1297\t{now}"
      handle.flush
def syntax_1427 : Syntax 4042 := lower (Snapshot.program 1427)
theorem syntax_eq_1427 : FieldPacked.syntaxRows.get 1427 = syntax_1427 :=
  FieldAware.syntaxRows_get 1427
theorem offset_1427 : FieldPackedLayout.offset 1427 = 45632 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1427\t{now}"
      handle.flush
def syntax_1588 : Syntax 4042 := lower (Snapshot.program 1588)
theorem syntax_eq_1588 : FieldPacked.syntaxRows.get 1588 = syntax_1588 :=
  FieldAware.syntaxRows_get 1588
theorem offset_1588 : FieldPackedLayout.offset 1588 = 53225 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1588\t{now}"
      handle.flush
def syntax_1743 : Syntax 4042 := lower (Snapshot.program 1743)
theorem syntax_eq_1743 : FieldPacked.syntaxRows.get 1743 = syntax_1743 :=
  FieldAware.syntaxRows_get 1743
theorem offset_1743 : FieldPackedLayout.offset 1743 = 58230 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1743\t{now}"
      handle.flush
def syntax_1959 : Syntax 4042 := lower (Snapshot.program 1959)
theorem syntax_eq_1959 : FieldPacked.syntaxRows.get 1959 = syntax_1959 :=
  FieldAware.syntaxRows_get 1959
theorem offset_1959 : FieldPackedLayout.offset 1959 = 66676 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t1959\t{now}"
      handle.flush
def syntax_2014 : Syntax 4042 := lower (Snapshot.program 2014)
theorem syntax_eq_2014 : FieldPacked.syntaxRows.get 2014 = syntax_2014 :=
  FieldAware.syntaxRows_get 2014
theorem offset_2014 : FieldPackedLayout.offset 2014 = 68967 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2014\t{now}"
      handle.flush
def syntax_2020 : Syntax 4042 := lower (Snapshot.program 2020)
theorem syntax_eq_2020 : FieldPacked.syntaxRows.get 2020 = syntax_2020 :=
  FieldAware.syntaxRows_get 2020
theorem offset_2020 : FieldPackedLayout.offset 2020 = 69082 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2020\t{now}"
      handle.flush
def syntax_2028 : Syntax 4042 := lower (Snapshot.program 2028)
theorem syntax_eq_2028 : FieldPacked.syntaxRows.get 2028 = syntax_2028 :=
  FieldAware.syntaxRows_get 2028
theorem offset_2028 : FieldPackedLayout.offset 2028 = 69394 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2028\t{now}"
      handle.flush
def syntax_2036 : Syntax 4042 := lower (Snapshot.program 2036)
theorem syntax_eq_2036 : FieldPacked.syntaxRows.get 2036 = syntax_2036 :=
  FieldAware.syntaxRows_get 2036
theorem offset_2036 : FieldPackedLayout.offset 2036 = 69634 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2036\t{now}"
      handle.flush
def syntax_2042 : Syntax 4042 := lower (Snapshot.program 2042)
theorem syntax_eq_2042 : FieldPacked.syntaxRows.get 2042 = syntax_2042 :=
  FieldAware.syntaxRows_get 2042
theorem offset_2042 : FieldPackedLayout.offset 2042 = 69806 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2042\t{now}"
      handle.flush
def syntax_2050 : Syntax 4042 := lower (Snapshot.program 2050)
theorem syntax_eq_2050 : FieldPacked.syntaxRows.get 2050 = syntax_2050 :=
  FieldAware.syntaxRows_get 2050
theorem offset_2050 : FieldPackedLayout.offset 2050 = 70298 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2050\t{now}"
      handle.flush
def syntax_2053 : Syntax 4042 := lower (Snapshot.program 2053)
theorem syntax_eq_2053 : FieldPacked.syntaxRows.get 2053 = syntax_2053 :=
  FieldAware.syntaxRows_get 2053
theorem offset_2053 : FieldPackedLayout.offset 2053 = 70523 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2053\t{now}"
      handle.flush
def syntax_2059 : Syntax 4042 := lower (Snapshot.program 2059)
theorem syntax_eq_2059 : FieldPacked.syntaxRows.get 2059 = syntax_2059 :=
  FieldAware.syntaxRows_get 2059
theorem offset_2059 : FieldPackedLayout.offset 2059 = 70752 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2059\t{now}"
      handle.flush
def syntax_2553 : Syntax 4042 := lower (Snapshot.program 2553)
theorem syntax_eq_2553 : FieldPacked.syntaxRows.get 2553 = syntax_2553 :=
  FieldAware.syntaxRows_get 2553
theorem offset_2553 : FieldPackedLayout.offset 2553 = 80018 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t2553\t{now}"
      handle.flush
def syntax_3297 : Syntax 4042 := lower (Snapshot.program 3297)
theorem syntax_eq_3297 : FieldPacked.syntaxRows.get 3297 = syntax_3297 :=
  FieldAware.syntaxRows_get 3297
theorem offset_3297 : FieldPackedLayout.offset 3297 = 93331 := by
  rw [node_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"offset\t3297\t{now}"
      handle.flush
def syntax_4041 : Syntax 4042 := lower (Snapshot.program 4041)
theorem syntax_eq_4041 : FieldPacked.syntaxRows.get 4041 = syntax_4041 :=
  FieldAware.syntaxRows_get 4041
theorem offset_4041 : FieldPackedLayout.offset 4041 = 106629 := by
  rw [node_offset_fast]
  decide +kernel
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
def slot_2 : Fin syntax_2.size :=
  ⟨0, by decide +kernel⟩
theorem address_2 :
    slotIndex 2 syntax_2 syntax_eq_2 slot_2 = 2 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t2\t{now}"
      handle.flush
def slot_4 : Fin syntax_4.size :=
  ⟨0, by decide +kernel⟩
theorem address_4 :
    slotIndex 4 syntax_4 syntax_eq_4 slot_4 = 4 := by
  apply Fin.ext
  rw [slotIndex_val, offset_4]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t4\t{now}"
      handle.flush
def slot_5 : Fin syntax_4.size :=
  ⟨1, by decide +kernel⟩
theorem address_5 :
    slotIndex 4 syntax_4 syntax_eq_4 slot_5 = 5 := by
  apply Fin.ext
  rw [slotIndex_val, offset_4]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t5\t{now}"
      handle.flush
def slot_6 : Fin syntax_4.size :=
  ⟨2, by decide +kernel⟩
theorem address_6 :
    slotIndex 4 syntax_4 syntax_eq_4 slot_6 = 6 := by
  apply Fin.ext
  rw [slotIndex_val, offset_4]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t6\t{now}"
      handle.flush
def slot_296 : Fin syntax_216.size :=
  ⟨0, by decide +kernel⟩
theorem address_296 :
    slotIndex 216 syntax_216 syntax_eq_216 slot_296 = 296 := by
  apply Fin.ext
  rw [slotIndex_val, offset_216]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t296\t{now}"
      handle.flush
def slot_297 : Fin syntax_217.size :=
  ⟨0, by decide +kernel⟩
theorem address_297 :
    slotIndex 217 syntax_217 syntax_eq_217 slot_297 = 297 := by
  apply Fin.ext
  rw [slotIndex_val, offset_217]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t297\t{now}"
      handle.flush
def slot_298 : Fin syntax_217.size :=
  ⟨1, by decide +kernel⟩
theorem address_298 :
    slotIndex 217 syntax_217 syntax_eq_217 slot_298 = 298 := by
  apply Fin.ext
  rw [slotIndex_val, offset_217]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t298\t{now}"
      handle.flush
def slot_376 : Fin syntax_277.size :=
  ⟨0, by decide +kernel⟩
theorem address_376 :
    slotIndex 277 syntax_277 syntax_eq_277 slot_376 = 376 := by
  apply Fin.ext
  rw [slotIndex_val, offset_277]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t376\t{now}"
      handle.flush
def slot_377 : Fin syntax_277.size :=
  ⟨1, by decide +kernel⟩
theorem address_377 :
    slotIndex 277 syntax_277 syntax_eq_277 slot_377 = 377 := by
  apply Fin.ext
  rw [slotIndex_val, offset_277]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t377\t{now}"
      handle.flush
def slot_395 : Fin syntax_278.size :=
  ⟨5, by decide +kernel⟩
theorem address_395 :
    slotIndex 278 syntax_278 syntax_eq_278 slot_395 = 395 := by
  apply Fin.ext
  rw [slotIndex_val, offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t395\t{now}"
      handle.flush
def slot_396 : Fin syntax_278.size :=
  ⟨6, by decide +kernel⟩
theorem address_396 :
    slotIndex 278 syntax_278 syntax_eq_278 slot_396 = 396 := by
  apply Fin.ext
  rw [slotIndex_val, offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t396\t{now}"
      handle.flush
def slot_9130 : Fin syntax_496.size :=
  ⟨30, by decide +kernel⟩
theorem address_9130 :
    slotIndex 496 syntax_496 syntax_eq_496 slot_9130 = 9130 := by
  apply Fin.ext
  rw [slotIndex_val, offset_496]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t9130\t{now}"
      handle.flush
def slot_13335 : Fin syntax_588.size :=
  ⟨73, by decide +kernel⟩
theorem address_13335 :
    slotIndex 588 syntax_588 syntax_eq_588 slot_13335 = 13335 := by
  apply Fin.ext
  rw [slotIndex_val, offset_588]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t13335\t{now}"
      handle.flush
def slot_13336 : Fin syntax_588.size :=
  ⟨74, by decide +kernel⟩
theorem address_13336 :
    slotIndex 588 syntax_588 syntax_eq_588 slot_13336 = 13336 := by
  apply Fin.ext
  rw [slotIndex_val, offset_588]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t13336\t{now}"
      handle.flush
def slot_18791 : Fin syntax_713.size :=
  ⟨0, by decide +kernel⟩
theorem address_18791 :
    slotIndex 713 syntax_713 syntax_eq_713 slot_18791 = 18791 := by
  apply Fin.ext
  rw [slotIndex_val, offset_713]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t18791\t{now}"
      handle.flush
def slot_21733 : Fin syntax_793.size :=
  ⟨79, by decide +kernel⟩
theorem address_21733 :
    slotIndex 793 syntax_793 syntax_eq_793 slot_21733 = 21733 := by
  apply Fin.ext
  rw [slotIndex_val, offset_793]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t21733\t{now}"
      handle.flush
def slot_26644 : Fin syntax_957.size :=
  ⟨13, by decide +kernel⟩
theorem address_26644 :
    slotIndex 957 syntax_957 syntax_eq_957 slot_26644 = 26644 := by
  apply Fin.ext
  rw [slotIndex_val, offset_957]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t26644\t{now}"
      handle.flush
def slot_26673 : Fin syntax_958.size :=
  ⟨28, by decide +kernel⟩
theorem address_26673 :
    slotIndex 958 syntax_958 syntax_eq_958 slot_26673 = 26673 := by
  apply Fin.ext
  rw [slotIndex_val, offset_958]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t26673\t{now}"
      handle.flush
def slot_32722 : Fin syntax_1130.size :=
  ⟨13, by decide +kernel⟩
theorem address_32722 :
    slotIndex 1130 syntax_1130 syntax_eq_1130 slot_32722 = 32722 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1130]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t32722\t{now}"
      handle.flush
def slot_40009 : Fin syntax_1297.size :=
  ⟨16, by decide +kernel⟩
theorem address_40009 :
    slotIndex 1297 syntax_1297 syntax_eq_1297 slot_40009 = 40009 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t40009\t{now}"
      handle.flush
def slot_40010 : Fin syntax_1297.size :=
  ⟨17, by decide +kernel⟩
theorem address_40010 :
    slotIndex 1297 syntax_1297 syntax_eq_1297 slot_40010 = 40010 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t40010\t{now}"
      handle.flush
def slot_45680 : Fin syntax_1427.size :=
  ⟨48, by decide +kernel⟩
theorem address_45680 :
    slotIndex 1427 syntax_1427 syntax_eq_1427 slot_45680 = 45680 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1427]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t45680\t{now}"
      handle.flush
def slot_53345 : Fin syntax_1588.size :=
  ⟨120, by decide +kernel⟩
theorem address_53345 :
    slotIndex 1588 syntax_1588 syntax_eq_1588 slot_53345 = 53345 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1588]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t53345\t{now}"
      handle.flush
def slot_53346 : Fin syntax_1588.size :=
  ⟨121, by decide +kernel⟩
theorem address_53346 :
    slotIndex 1588 syntax_1588 syntax_eq_1588 slot_53346 = 53346 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1588]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t53346\t{now}"
      handle.flush
def slot_58243 : Fin syntax_1743.size :=
  ⟨13, by decide +kernel⟩
theorem address_58243 :
    slotIndex 1743 syntax_1743 syntax_eq_1743 slot_58243 = 58243 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1743]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t58243\t{now}"
      handle.flush
def slot_66682 : Fin syntax_1959.size :=
  ⟨6, by decide +kernel⟩
theorem address_66682 :
    slotIndex 1959 syntax_1959 syntax_eq_1959 slot_66682 = 66682 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1959]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t66682\t{now}"
      handle.flush
def slot_66683 : Fin syntax_1959.size :=
  ⟨7, by decide +kernel⟩
theorem address_66683 :
    slotIndex 1959 syntax_1959 syntax_eq_1959 slot_66683 = 66683 := by
  apply Fin.ext
  rw [slotIndex_val, offset_1959]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t66683\t{now}"
      handle.flush
def slot_68974 : Fin syntax_2014.size :=
  ⟨7, by decide +kernel⟩
theorem address_68974 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_68974 = 68974 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t68974\t{now}"
      handle.flush
def slot_68982 : Fin syntax_2014.size :=
  ⟨15, by decide +kernel⟩
theorem address_68982 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_68982 = 68982 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t68982\t{now}"
      handle.flush
def slot_68990 : Fin syntax_2014.size :=
  ⟨23, by decide +kernel⟩
theorem address_68990 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_68990 = 68990 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t68990\t{now}"
      handle.flush
def slot_68997 : Fin syntax_2014.size :=
  ⟨30, by decide +kernel⟩
theorem address_68997 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_68997 = 68997 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t68997\t{now}"
      handle.flush
def slot_68998 : Fin syntax_2014.size :=
  ⟨31, by decide +kernel⟩
theorem address_68998 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_68998 = 68998 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t68998\t{now}"
      handle.flush
def slot_69005 : Fin syntax_2014.size :=
  ⟨38, by decide +kernel⟩
theorem address_69005 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69005 = 69005 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69005\t{now}"
      handle.flush
def slot_69006 : Fin syntax_2014.size :=
  ⟨39, by decide +kernel⟩
theorem address_69006 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69006 = 69006 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69006\t{now}"
      handle.flush
def slot_69007 : Fin syntax_2014.size :=
  ⟨40, by decide +kernel⟩
theorem address_69007 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69007 = 69007 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69007\t{now}"
      handle.flush
def slot_69008 : Fin syntax_2014.size :=
  ⟨41, by decide +kernel⟩
theorem address_69008 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69008 = 69008 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69008\t{now}"
      handle.flush
def slot_69009 : Fin syntax_2014.size :=
  ⟨42, by decide +kernel⟩
theorem address_69009 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69009 = 69009 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69009\t{now}"
      handle.flush
def slot_69010 : Fin syntax_2014.size :=
  ⟨43, by decide +kernel⟩
theorem address_69010 :
    slotIndex 2014 syntax_2014 syntax_eq_2014 slot_69010 = 69010 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69010\t{now}"
      handle.flush
def slot_69095 : Fin syntax_2020.size :=
  ⟨13, by decide +kernel⟩
theorem address_69095 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69095 = 69095 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69095\t{now}"
      handle.flush
def slot_69109 : Fin syntax_2020.size :=
  ⟨27, by decide +kernel⟩
theorem address_69109 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69109 = 69109 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69109\t{now}"
      handle.flush
def slot_69123 : Fin syntax_2020.size :=
  ⟨41, by decide +kernel⟩
theorem address_69123 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69123 = 69123 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69123\t{now}"
      handle.flush
def slot_69136 : Fin syntax_2020.size :=
  ⟨54, by decide +kernel⟩
theorem address_69136 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69136 = 69136 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69136\t{now}"
      handle.flush
def slot_69137 : Fin syntax_2020.size :=
  ⟨55, by decide +kernel⟩
theorem address_69137 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69137 = 69137 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69137\t{now}"
      handle.flush
def slot_69150 : Fin syntax_2020.size :=
  ⟨68, by decide +kernel⟩
theorem address_69150 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69150 = 69150 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69150\t{now}"
      handle.flush
def slot_69151 : Fin syntax_2020.size :=
  ⟨69, by decide +kernel⟩
theorem address_69151 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69151 = 69151 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69151\t{now}"
      handle.flush
def slot_69152 : Fin syntax_2020.size :=
  ⟨70, by decide +kernel⟩
theorem address_69152 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69152 = 69152 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69152\t{now}"
      handle.flush
def slot_69153 : Fin syntax_2020.size :=
  ⟨71, by decide +kernel⟩
theorem address_69153 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69153 = 69153 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69153\t{now}"
      handle.flush
def slot_69154 : Fin syntax_2020.size :=
  ⟨72, by decide +kernel⟩
theorem address_69154 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69154 = 69154 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69154\t{now}"
      handle.flush
def slot_69155 : Fin syntax_2020.size :=
  ⟨73, by decide +kernel⟩
theorem address_69155 :
    slotIndex 2020 syntax_2020 syntax_eq_2020 slot_69155 = 69155 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2020]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69155\t{now}"
      handle.flush
def slot_69401 : Fin syntax_2028.size :=
  ⟨7, by decide +kernel⟩
theorem address_69401 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69401 = 69401 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69401\t{now}"
      handle.flush
def slot_69409 : Fin syntax_2028.size :=
  ⟨15, by decide +kernel⟩
theorem address_69409 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69409 = 69409 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69409\t{now}"
      handle.flush
def slot_69417 : Fin syntax_2028.size :=
  ⟨23, by decide +kernel⟩
theorem address_69417 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69417 = 69417 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69417\t{now}"
      handle.flush
def slot_69424 : Fin syntax_2028.size :=
  ⟨30, by decide +kernel⟩
theorem address_69424 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69424 = 69424 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69424\t{now}"
      handle.flush
def slot_69425 : Fin syntax_2028.size :=
  ⟨31, by decide +kernel⟩
theorem address_69425 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69425 = 69425 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69425\t{now}"
      handle.flush
def slot_69432 : Fin syntax_2028.size :=
  ⟨38, by decide +kernel⟩
theorem address_69432 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69432 = 69432 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69432\t{now}"
      handle.flush
def slot_69433 : Fin syntax_2028.size :=
  ⟨39, by decide +kernel⟩
theorem address_69433 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69433 = 69433 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69433\t{now}"
      handle.flush
def slot_69434 : Fin syntax_2028.size :=
  ⟨40, by decide +kernel⟩
theorem address_69434 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69434 = 69434 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69434\t{now}"
      handle.flush
def slot_69435 : Fin syntax_2028.size :=
  ⟨41, by decide +kernel⟩
theorem address_69435 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69435 = 69435 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69435\t{now}"
      handle.flush
def slot_69436 : Fin syntax_2028.size :=
  ⟨42, by decide +kernel⟩
theorem address_69436 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69436 = 69436 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69436\t{now}"
      handle.flush
def slot_69437 : Fin syntax_2028.size :=
  ⟨43, by decide +kernel⟩
theorem address_69437 :
    slotIndex 2028 syntax_2028 syntax_eq_2028 slot_69437 = 69437 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69437\t{now}"
      handle.flush
def slot_69647 : Fin syntax_2036.size :=
  ⟨13, by decide +kernel⟩
theorem address_69647 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69647 = 69647 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69647\t{now}"
      handle.flush
def slot_69661 : Fin syntax_2036.size :=
  ⟨27, by decide +kernel⟩
theorem address_69661 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69661 = 69661 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69661\t{now}"
      handle.flush
def slot_69675 : Fin syntax_2036.size :=
  ⟨41, by decide +kernel⟩
theorem address_69675 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69675 = 69675 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69675\t{now}"
      handle.flush
def slot_69688 : Fin syntax_2036.size :=
  ⟨54, by decide +kernel⟩
theorem address_69688 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69688 = 69688 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69688\t{now}"
      handle.flush
def slot_69689 : Fin syntax_2036.size :=
  ⟨55, by decide +kernel⟩
theorem address_69689 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69689 = 69689 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69689\t{now}"
      handle.flush
def slot_69702 : Fin syntax_2036.size :=
  ⟨68, by decide +kernel⟩
theorem address_69702 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69702 = 69702 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69702\t{now}"
      handle.flush
def slot_69703 : Fin syntax_2036.size :=
  ⟨69, by decide +kernel⟩
theorem address_69703 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69703 = 69703 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69703\t{now}"
      handle.flush
def slot_69704 : Fin syntax_2036.size :=
  ⟨70, by decide +kernel⟩
theorem address_69704 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69704 = 69704 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69704\t{now}"
      handle.flush
def slot_69705 : Fin syntax_2036.size :=
  ⟨71, by decide +kernel⟩
theorem address_69705 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69705 = 69705 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69705\t{now}"
      handle.flush
def slot_69706 : Fin syntax_2036.size :=
  ⟨72, by decide +kernel⟩
theorem address_69706 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69706 = 69706 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69706\t{now}"
      handle.flush
def slot_69707 : Fin syntax_2036.size :=
  ⟨73, by decide +kernel⟩
theorem address_69707 :
    slotIndex 2036 syntax_2036 syntax_eq_2036 slot_69707 = 69707 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2036]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69707\t{now}"
      handle.flush
def slot_69831 : Fin syntax_2042.size :=
  ⟨25, by decide +kernel⟩
theorem address_69831 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69831 = 69831 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69831\t{now}"
      handle.flush
def slot_69857 : Fin syntax_2042.size :=
  ⟨51, by decide +kernel⟩
theorem address_69857 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69857 = 69857 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69857\t{now}"
      handle.flush
def slot_69883 : Fin syntax_2042.size :=
  ⟨77, by decide +kernel⟩
theorem address_69883 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69883 = 69883 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69883\t{now}"
      handle.flush
def slot_69908 : Fin syntax_2042.size :=
  ⟨102, by decide +kernel⟩
theorem address_69908 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69908 = 69908 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69908\t{now}"
      handle.flush
def slot_69909 : Fin syntax_2042.size :=
  ⟨103, by decide +kernel⟩
theorem address_69909 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69909 = 69909 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69909\t{now}"
      handle.flush
def slot_69934 : Fin syntax_2042.size :=
  ⟨128, by decide +kernel⟩
theorem address_69934 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69934 = 69934 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69934\t{now}"
      handle.flush
def slot_69935 : Fin syntax_2042.size :=
  ⟨129, by decide +kernel⟩
theorem address_69935 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69935 = 69935 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69935\t{now}"
      handle.flush
def slot_69936 : Fin syntax_2042.size :=
  ⟨130, by decide +kernel⟩
theorem address_69936 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69936 = 69936 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69936\t{now}"
      handle.flush
def slot_69937 : Fin syntax_2042.size :=
  ⟨131, by decide +kernel⟩
theorem address_69937 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69937 = 69937 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69937\t{now}"
      handle.flush
def slot_69938 : Fin syntax_2042.size :=
  ⟨132, by decide +kernel⟩
theorem address_69938 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69938 = 69938 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69938\t{now}"
      handle.flush
def slot_69939 : Fin syntax_2042.size :=
  ⟨133, by decide +kernel⟩
theorem address_69939 :
    slotIndex 2042 syntax_2042 syntax_eq_2042 slot_69939 = 69939 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2042]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t69939\t{now}"
      handle.flush
def slot_70317 : Fin syntax_2050.size :=
  ⟨19, by decide +kernel⟩
theorem address_70317 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70317 = 70317 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70317\t{now}"
      handle.flush
def slot_70337 : Fin syntax_2050.size :=
  ⟨39, by decide +kernel⟩
theorem address_70337 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70337 = 70337 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70337\t{now}"
      handle.flush
def slot_70357 : Fin syntax_2050.size :=
  ⟨59, by decide +kernel⟩
theorem address_70357 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70357 = 70357 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70357\t{now}"
      handle.flush
def slot_70376 : Fin syntax_2050.size :=
  ⟨78, by decide +kernel⟩
theorem address_70376 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70376 = 70376 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70376\t{now}"
      handle.flush
def slot_70377 : Fin syntax_2050.size :=
  ⟨79, by decide +kernel⟩
theorem address_70377 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70377 = 70377 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70377\t{now}"
      handle.flush
def slot_70386 : Fin syntax_2050.size :=
  ⟨88, by decide +kernel⟩
theorem address_70386 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70386 = 70386 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70386\t{now}"
      handle.flush
def slot_70396 : Fin syntax_2050.size :=
  ⟨98, by decide +kernel⟩
theorem address_70396 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70396 = 70396 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70396\t{now}"
      handle.flush
def slot_70397 : Fin syntax_2050.size :=
  ⟨99, by decide +kernel⟩
theorem address_70397 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70397 = 70397 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70397\t{now}"
      handle.flush
def slot_70398 : Fin syntax_2050.size :=
  ⟨100, by decide +kernel⟩
theorem address_70398 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70398 = 70398 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70398\t{now}"
      handle.flush
def slot_70399 : Fin syntax_2050.size :=
  ⟨101, by decide +kernel⟩
theorem address_70399 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70399 = 70399 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70399\t{now}"
      handle.flush
def slot_70400 : Fin syntax_2050.size :=
  ⟨102, by decide +kernel⟩
theorem address_70400 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70400 = 70400 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70400\t{now}"
      handle.flush
def slot_70401 : Fin syntax_2050.size :=
  ⟨103, by decide +kernel⟩
theorem address_70401 :
    slotIndex 2050 syntax_2050 syntax_eq_2050 slot_70401 = 70401 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70401\t{now}"
      handle.flush
def slot_70542 : Fin syntax_2053.size :=
  ⟨19, by decide +kernel⟩
theorem address_70542 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70542 = 70542 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70542\t{now}"
      handle.flush
def slot_70562 : Fin syntax_2053.size :=
  ⟨39, by decide +kernel⟩
theorem address_70562 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70562 = 70562 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70562\t{now}"
      handle.flush
def slot_70582 : Fin syntax_2053.size :=
  ⟨59, by decide +kernel⟩
theorem address_70582 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70582 = 70582 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70582\t{now}"
      handle.flush
def slot_70601 : Fin syntax_2053.size :=
  ⟨78, by decide +kernel⟩
theorem address_70601 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70601 = 70601 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70601\t{now}"
      handle.flush
def slot_70602 : Fin syntax_2053.size :=
  ⟨79, by decide +kernel⟩
theorem address_70602 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70602 = 70602 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70602\t{now}"
      handle.flush
def slot_70621 : Fin syntax_2053.size :=
  ⟨98, by decide +kernel⟩
theorem address_70621 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70621 = 70621 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70621\t{now}"
      handle.flush
def slot_70622 : Fin syntax_2053.size :=
  ⟨99, by decide +kernel⟩
theorem address_70622 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70622 = 70622 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70622\t{now}"
      handle.flush
def slot_70623 : Fin syntax_2053.size :=
  ⟨100, by decide +kernel⟩
theorem address_70623 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70623 = 70623 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70623\t{now}"
      handle.flush
def slot_70624 : Fin syntax_2053.size :=
  ⟨101, by decide +kernel⟩
theorem address_70624 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70624 = 70624 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70624\t{now}"
      handle.flush
def slot_70625 : Fin syntax_2053.size :=
  ⟨102, by decide +kernel⟩
theorem address_70625 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70625 = 70625 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70625\t{now}"
      handle.flush
def slot_70626 : Fin syntax_2053.size :=
  ⟨103, by decide +kernel⟩
theorem address_70626 :
    slotIndex 2053 syntax_2053 syntax_eq_2053 slot_70626 = 70626 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2053]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70626\t{now}"
      handle.flush
def slot_70765 : Fin syntax_2059.size :=
  ⟨13, by decide +kernel⟩
theorem address_70765 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70765 = 70765 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70765\t{now}"
      handle.flush
def slot_70779 : Fin syntax_2059.size :=
  ⟨27, by decide +kernel⟩
theorem address_70779 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70779 = 70779 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70779\t{now}"
      handle.flush
def slot_70793 : Fin syntax_2059.size :=
  ⟨41, by decide +kernel⟩
theorem address_70793 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70793 = 70793 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70793\t{now}"
      handle.flush
def slot_70806 : Fin syntax_2059.size :=
  ⟨54, by decide +kernel⟩
theorem address_70806 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70806 = 70806 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70806\t{now}"
      handle.flush
def slot_70807 : Fin syntax_2059.size :=
  ⟨55, by decide +kernel⟩
theorem address_70807 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70807 = 70807 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70807\t{now}"
      handle.flush
def slot_70820 : Fin syntax_2059.size :=
  ⟨68, by decide +kernel⟩
theorem address_70820 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70820 = 70820 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70820\t{now}"
      handle.flush
def slot_70821 : Fin syntax_2059.size :=
  ⟨69, by decide +kernel⟩
theorem address_70821 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70821 = 70821 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70821\t{now}"
      handle.flush
def slot_70822 : Fin syntax_2059.size :=
  ⟨70, by decide +kernel⟩
theorem address_70822 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70822 = 70822 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70822\t{now}"
      handle.flush
def slot_70823 : Fin syntax_2059.size :=
  ⟨71, by decide +kernel⟩
theorem address_70823 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70823 = 70823 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70823\t{now}"
      handle.flush
def slot_70824 : Fin syntax_2059.size :=
  ⟨72, by decide +kernel⟩
theorem address_70824 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70824 = 70824 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70824\t{now}"
      handle.flush
def slot_70825 : Fin syntax_2059.size :=
  ⟨73, by decide +kernel⟩
theorem address_70825 :
    slotIndex 2059 syntax_2059 syntax_eq_2059 slot_70825 = 70825 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2059]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t70825\t{now}"
      handle.flush
def slot_80018 : Fin syntax_2553.size :=
  ⟨0, by decide +kernel⟩
theorem address_80018 :
    slotIndex 2553 syntax_2553 syntax_eq_2553 slot_80018 = 80018 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2553]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t80018\t{now}"
      handle.flush
def slot_80019 : Fin syntax_2553.size :=
  ⟨1, by decide +kernel⟩
theorem address_80019 :
    slotIndex 2553 syntax_2553 syntax_eq_2553 slot_80019 = 80019 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2553]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t80019\t{now}"
      handle.flush
def slot_80020 : Fin syntax_2553.size :=
  ⟨2, by decide +kernel⟩
theorem address_80020 :
    slotIndex 2553 syntax_2553 syntax_eq_2553 slot_80020 = 80020 := by
  apply Fin.ext
  rw [slotIndex_val, offset_2553]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t80020\t{now}"
      handle.flush
def slot_93342 : Fin syntax_3297.size :=
  ⟨11, by decide +kernel⟩
theorem address_93342 :
    slotIndex 3297 syntax_3297 syntax_eq_3297 slot_93342 = 93342 := by
  apply Fin.ext
  rw [slotIndex_val, offset_3297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t93342\t{now}"
      handle.flush
def slot_93343 : Fin syntax_3297.size :=
  ⟨12, by decide +kernel⟩
theorem address_93343 :
    slotIndex 3297 syntax_3297 syntax_eq_3297 slot_93343 = 93343 := by
  apply Fin.ext
  rw [slotIndex_val, offset_3297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t93343\t{now}"
      handle.flush
def slot_93355 : Fin syntax_3297.size :=
  ⟨24, by decide +kernel⟩
theorem address_93355 :
    slotIndex 3297 syntax_3297 syntax_eq_3297 slot_93355 = 93355 := by
  apply Fin.ext
  rw [slotIndex_val, offset_3297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t93355\t{now}"
      handle.flush
def slot_93356 : Fin syntax_3297.size :=
  ⟨25, by decide +kernel⟩
theorem address_93356 :
    slotIndex 3297 syntax_3297 syntax_eq_3297 slot_93356 = 93356 := by
  apply Fin.ext
  rw [slotIndex_val, offset_3297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t93356\t{now}"
      handle.flush
def slot_93357 : Fin syntax_3297.size :=
  ⟨26, by decide +kernel⟩
theorem address_93357 :
    slotIndex 3297 syntax_3297 syntax_eq_3297 slot_93357 = 93357 := by
  apply Fin.ext
  rw [slotIndex_val, offset_3297]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"address\t93357\t{now}"
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
def nodeTable_4 : BoolGraph.Table 5 (Fin 4042) :=
  ⟨#[
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩,
      ⟨2, by decide⟩], rfl⟩
def localNode_4 : BoolGraph.Node syntax_4.size 5 4042 :=
  .goto
    nodeTable_4
theorem local_eq_4 :
    syntax_4.fastNodeAt slot_4 = localNode_4 := by rfl
theorem getter_witness_4 :
    FieldPacked.getter.node 4 =
      TemplateGraph.mapNode (slotIndex 4 syntax_4 syntax_eq_4)
        localNode_4 := by
  rw [← address_4, getter_syntax, local_eq_4]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t4\t{now}"
      handle.flush
def globalNode_4 : BoolGraph.Node 106668 5 4042 :=
  .goto
    nodeTable_4
theorem numeric_node_4 :
    FieldPacked.getter.node 4 = globalNode_4 := by
  simpa only [
    localNode_4,
    globalNode_4,
    TemplateGraph.mapNode] using getter_witness_4
def nodeTable_6 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true], rfl⟩
def localNode_6 : BoolGraph.Node syntax_4.size 5 4042 :=
  .branch
    nodeTable_6
    slot_4 slot_5
theorem local_eq_6 :
    syntax_4.fastNodeAt slot_6 = localNode_6 := by rfl
theorem getter_witness_6 :
    FieldPacked.getter.node 6 =
      TemplateGraph.mapNode (slotIndex 4 syntax_4 syntax_eq_4)
        localNode_6 := by
  rw [← address_6, getter_syntax, local_eq_6]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t6\t{now}"
      handle.flush
def globalNode_6 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_6
    (4 : Fin 106668) (5 : Fin 106668)
theorem numeric_node_6 :
    FieldPacked.getter.node 6 = globalNode_6 := by
  simpa only [
    localNode_6,
    globalNode_6,
    TemplateGraph.mapNode,
    address_4,
    address_5] using getter_witness_6
def localNode_296 : BoolGraph.Node syntax_216.size 5 4042 :=
  .halt
theorem local_eq_296 :
    syntax_216.fastNodeAt slot_296 = localNode_296 := by rfl
theorem getter_witness_296 :
    FieldPacked.getter.node 296 =
      TemplateGraph.mapNode (slotIndex 216 syntax_216 syntax_eq_216)
        localNode_296 := by
  rw [← address_296, getter_syntax, local_eq_296]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t296\t{now}"
      handle.flush
def globalNode_296 : BoolGraph.Node 106668 5 4042 :=
  .halt
theorem numeric_node_296 :
    FieldPacked.getter.node 296 = globalNode_296 := by
  simpa only [
    localNode_296,
    globalNode_296,
    TemplateGraph.mapNode] using getter_witness_296
def nodeTable_297 : BoolGraph.Table 5 (Fin 4042) :=
  ⟨#[
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩,
      ⟨216, by decide⟩], rfl⟩
def localNode_297 : BoolGraph.Node syntax_217.size 5 4042 :=
  .goto
    nodeTable_297
theorem local_eq_297 :
    syntax_217.fastNodeAt slot_297 = localNode_297 := by rfl
theorem getter_witness_297 :
    FieldPacked.getter.node 297 =
      TemplateGraph.mapNode (slotIndex 217 syntax_217 syntax_eq_217)
        localNode_297 := by
  rw [← address_297, getter_syntax, local_eq_297]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t297\t{now}"
      handle.flush
def globalNode_297 : BoolGraph.Node 106668 5 4042 :=
  .goto
    nodeTable_297
theorem numeric_node_297 :
    FieldPacked.getter.node 297 = globalNode_297 := by
  simpa only [
    localNode_297,
    globalNode_297,
    TemplateGraph.mapNode] using getter_witness_297
def nodeTable_298 : BoolGraph.Table 5 (Fin 5) :=
  ⟨#[
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩,
      ⟨0, by decide⟩], rfl⟩
def localNode_298 : BoolGraph.Node syntax_217.size 5 4042 :=
  .load
    nodeTable_298
    slot_297
theorem local_eq_298 :
    syntax_217.fastNodeAt slot_298 = localNode_298 := by rfl
theorem getter_witness_298 :
    FieldPacked.getter.node 298 =
      TemplateGraph.mapNode (slotIndex 217 syntax_217 syntax_eq_217)
        localNode_298 := by
  rw [← address_298, getter_syntax, local_eq_298]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t298\t{now}"
      handle.flush
def globalNode_298 : BoolGraph.Node 106668 5 4042 :=
  .load
    nodeTable_298
    (297 : Fin 106668)
theorem numeric_node_298 :
    FieldPacked.getter.node 298 = globalNode_298 := by
  simpa only [
    localNode_298,
    globalNode_298,
    TemplateGraph.mapNode,
    address_297] using getter_witness_298
def localNode_377 : BoolGraph.Node syntax_277.size 5 4042 :=
  .move .right slot_376
theorem local_eq_377 :
    syntax_277.fastNodeAt slot_377 = localNode_377 := by rfl
theorem getter_witness_377 :
    FieldPacked.getter.node 377 =
      TemplateGraph.mapNode (slotIndex 277 syntax_277 syntax_eq_277)
        localNode_377 := by
  rw [← address_377, getter_syntax, local_eq_377]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t377\t{now}"
      handle.flush
def globalNode_377 : BoolGraph.Node 106668 5 4042 :=
  .move .right (376 : Fin 106668)
theorem numeric_node_377 :
    FieldPacked.getter.node 377 = globalNode_377 := by
  simpa only [
    localNode_377,
    globalNode_377,
    TemplateGraph.mapNode,
    address_376] using getter_witness_377
def nodeTable_396 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false], rfl⟩
def localNode_396 : BoolGraph.Node syntax_278.size 5 4042 :=
  .write
    nodeTable_396
    slot_395
theorem local_eq_396 :
    syntax_278.fastNodeAt slot_396 = localNode_396 := by rfl
theorem getter_witness_396 :
    FieldPacked.getter.node 396 =
      TemplateGraph.mapNode (slotIndex 278 syntax_278 syntax_eq_278)
        localNode_396 := by
  rw [← address_396, getter_syntax, local_eq_396]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t396\t{now}"
      handle.flush
def globalNode_396 : BoolGraph.Node 106668 5 4042 :=
  .write
    nodeTable_396
    (395 : Fin 106668)
theorem numeric_node_396 :
    FieldPacked.getter.node 396 = globalNode_396 := by
  simpa only [
    localNode_396,
    globalNode_396,
    TemplateGraph.mapNode,
    address_395] using getter_witness_396
def localNode_13336 : BoolGraph.Node syntax_588.size 5 4042 :=
  .move .left slot_13335
theorem local_eq_13336 :
    syntax_588.fastNodeAt slot_13336 = localNode_13336 := by rfl
theorem getter_witness_13336 :
    FieldPacked.getter.node 13336 =
      TemplateGraph.mapNode (slotIndex 588 syntax_588 syntax_eq_588)
        localNode_13336 := by
  rw [← address_13336, getter_syntax, local_eq_13336]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t13336\t{now}"
      handle.flush
def globalNode_13336 : BoolGraph.Node 106668 5 4042 :=
  .move .left (13335 : Fin 106668)
theorem numeric_node_13336 :
    FieldPacked.getter.node 13336 = globalNode_13336 := by
  simpa only [
    localNode_13336,
    globalNode_13336,
    TemplateGraph.mapNode,
    address_13335] using getter_witness_13336
def nodeTable_26673 : BoolGraph.Table 5 (Fin 4042) :=
  ⟨#[
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩,
      ⟨957, by decide⟩], rfl⟩
def localNode_26673 : BoolGraph.Node syntax_958.size 5 4042 :=
  .goto
    nodeTable_26673
theorem local_eq_26673 :
    syntax_958.fastNodeAt slot_26673 = localNode_26673 := by rfl
theorem getter_witness_26673 :
    FieldPacked.getter.node 26673 =
      TemplateGraph.mapNode (slotIndex 958 syntax_958 syntax_eq_958)
        localNode_26673 := by
  rw [← address_26673, getter_syntax, local_eq_26673]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t26673\t{now}"
      handle.flush
def globalNode_26673 : BoolGraph.Node 106668 5 4042 :=
  .goto
    nodeTable_26673
theorem numeric_node_26673 :
    FieldPacked.getter.node 26673 = globalNode_26673 := by
  simpa only [
    localNode_26673,
    globalNode_26673,
    TemplateGraph.mapNode] using getter_witness_26673
def localNode_40010 : BoolGraph.Node syntax_1297.size 5 4042 :=
  .move .left slot_40009
theorem local_eq_40010 :
    syntax_1297.fastNodeAt slot_40010 = localNode_40010 := by rfl
theorem getter_witness_40010 :
    FieldPacked.getter.node 40010 =
      TemplateGraph.mapNode (slotIndex 1297 syntax_1297 syntax_eq_1297)
        localNode_40010 := by
  rw [← address_40010, getter_syntax, local_eq_40010]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t40010\t{now}"
      handle.flush
def globalNode_40010 : BoolGraph.Node 106668 5 4042 :=
  .move .left (40009 : Fin 106668)
theorem numeric_node_40010 :
    FieldPacked.getter.node 40010 = globalNode_40010 := by
  simpa only [
    localNode_40010,
    globalNode_40010,
    TemplateGraph.mapNode,
    address_40009] using getter_witness_40010
def localNode_53346 : BoolGraph.Node syntax_1588.size 5 4042 :=
  .move .right slot_53345
theorem local_eq_53346 :
    syntax_1588.fastNodeAt slot_53346 = localNode_53346 := by rfl
theorem getter_witness_53346 :
    FieldPacked.getter.node 53346 =
      TemplateGraph.mapNode (slotIndex 1588 syntax_1588 syntax_eq_1588)
        localNode_53346 := by
  rw [← address_53346, getter_syntax, local_eq_53346]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t53346\t{now}"
      handle.flush
def globalNode_53346 : BoolGraph.Node 106668 5 4042 :=
  .move .right (53345 : Fin 106668)
theorem numeric_node_53346 :
    FieldPacked.getter.node 53346 = globalNode_53346 := by
  simpa only [
    localNode_53346,
    globalNode_53346,
    TemplateGraph.mapNode,
    address_53345] using getter_witness_53346
def localNode_66683 : BoolGraph.Node syntax_1959.size 5 4042 :=
  .move .left slot_66682
theorem local_eq_66683 :
    syntax_1959.fastNodeAt slot_66683 = localNode_66683 := by rfl
theorem getter_witness_66683 :
    FieldPacked.getter.node 66683 =
      TemplateGraph.mapNode (slotIndex 1959 syntax_1959 syntax_eq_1959)
        localNode_66683 := by
  rw [← address_66683, getter_syntax, local_eq_66683]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t66683\t{now}"
      handle.flush
def globalNode_66683 : BoolGraph.Node 106668 5 4042 :=
  .move .left (66682 : Fin 106668)
theorem numeric_node_66683 :
    FieldPacked.getter.node 66683 = globalNode_66683 := by
  simpa only [
    localNode_66683,
    globalNode_66683,
    TemplateGraph.mapNode,
    address_66682] using getter_witness_66683
def nodeTable_68998 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true,
      true], rfl⟩
def localNode_68998 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .write
    nodeTable_68998
    slot_68997
theorem local_eq_68998 :
    syntax_2014.fastNodeAt slot_68998 = localNode_68998 := by rfl
theorem getter_witness_68998 :
    FieldPacked.getter.node 68998 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_68998 := by
  rw [← address_68998, getter_syntax, local_eq_68998]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t68998\t{now}"
      handle.flush
def globalNode_68998 : BoolGraph.Node 106668 5 4042 :=
  .write
    nodeTable_68998
    (68997 : Fin 106668)
theorem numeric_node_68998 :
    FieldPacked.getter.node 68998 = globalNode_68998 := by
  simpa only [
    localNode_68998,
    globalNode_68998,
    TemplateGraph.mapNode,
    address_68997] using getter_witness_68998
def nodeTable_69006 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69006 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .write
    nodeTable_69006
    slot_69005
theorem local_eq_69006 :
    syntax_2014.fastNodeAt slot_69006 = localNode_69006 := by rfl
theorem getter_witness_69006 :
    FieldPacked.getter.node 69006 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_69006 := by
  rw [← address_69006, getter_syntax, local_eq_69006]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69006\t{now}"
      handle.flush
def globalNode_69006 : BoolGraph.Node 106668 5 4042 :=
  .write
    nodeTable_69006
    (69005 : Fin 106668)
theorem numeric_node_69006 :
    FieldPacked.getter.node 69006 = globalNode_69006 := by
  simpa only [
    localNode_69006,
    globalNode_69006,
    TemplateGraph.mapNode,
    address_69005] using getter_witness_69006
def nodeTable_69007 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_69007 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .branch
    nodeTable_69007
    slot_68998 slot_69006
theorem local_eq_69007 :
    syntax_2014.fastNodeAt slot_69007 = localNode_69007 := by rfl
theorem getter_witness_69007 :
    FieldPacked.getter.node 69007 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_69007 := by
  rw [← address_69007, getter_syntax, local_eq_69007]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69007\t{now}"
      handle.flush
def globalNode_69007 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69007
    (68998 : Fin 106668) (69006 : Fin 106668)
theorem numeric_node_69007 :
    FieldPacked.getter.node 69007 = globalNode_69007 := by
  simpa only [
    localNode_69007,
    globalNode_69007,
    TemplateGraph.mapNode,
    address_68998,
    address_69006] using getter_witness_69007
def nodeTable_69008 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_69008 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .branch
    nodeTable_69008
    slot_68990 slot_69007
theorem local_eq_69008 :
    syntax_2014.fastNodeAt slot_69008 = localNode_69008 := by rfl
theorem getter_witness_69008 :
    FieldPacked.getter.node 69008 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_69008 := by
  rw [← address_69008, getter_syntax, local_eq_69008]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69008\t{now}"
      handle.flush
def globalNode_69008 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69008
    (68990 : Fin 106668) (69007 : Fin 106668)
theorem numeric_node_69008 :
    FieldPacked.getter.node 69008 = globalNode_69008 := by
  simpa only [
    localNode_69008,
    globalNode_69008,
    TemplateGraph.mapNode,
    address_68990,
    address_69007] using getter_witness_69008
def nodeTable_69009 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_69009 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .branch
    nodeTable_69009
    slot_68982 slot_69008
theorem local_eq_69009 :
    syntax_2014.fastNodeAt slot_69009 = localNode_69009 := by rfl
theorem getter_witness_69009 :
    FieldPacked.getter.node 69009 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_69009 := by
  rw [← address_69009, getter_syntax, local_eq_69009]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69009\t{now}"
      handle.flush
def globalNode_69009 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69009
    (68982 : Fin 106668) (69008 : Fin 106668)
theorem numeric_node_69009 :
    FieldPacked.getter.node 69009 = globalNode_69009 := by
  simpa only [
    localNode_69009,
    globalNode_69009,
    TemplateGraph.mapNode,
    address_68982,
    address_69008] using getter_witness_69009
def nodeTable_69010 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69010 : BoolGraph.Node syntax_2014.size 5 4042 :=
  .branch
    nodeTable_69010
    slot_68974 slot_69009
theorem local_eq_69010 :
    syntax_2014.fastNodeAt slot_69010 = localNode_69010 := by rfl
theorem getter_witness_69010 :
    FieldPacked.getter.node 69010 =
      TemplateGraph.mapNode (slotIndex 2014 syntax_2014 syntax_eq_2014)
        localNode_69010 := by
  rw [← address_69010, getter_syntax, local_eq_69010]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69010\t{now}"
      handle.flush
def globalNode_69010 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69010
    (68974 : Fin 106668) (69009 : Fin 106668)
theorem numeric_node_69010 :
    FieldPacked.getter.node 69010 = globalNode_69010 := by
  simpa only [
    localNode_69010,
    globalNode_69010,
    TemplateGraph.mapNode,
    address_68974,
    address_69009] using getter_witness_69010
def localNode_69137 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .move .right slot_69136
theorem local_eq_69137 :
    syntax_2020.fastNodeAt slot_69137 = localNode_69137 := by rfl
theorem getter_witness_69137 :
    FieldPacked.getter.node 69137 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69137 := by
  rw [← address_69137, getter_syntax, local_eq_69137]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69137\t{now}"
      handle.flush
def globalNode_69137 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69136 : Fin 106668)
theorem numeric_node_69137 :
    FieldPacked.getter.node 69137 = globalNode_69137 := by
  simpa only [
    localNode_69137,
    globalNode_69137,
    TemplateGraph.mapNode,
    address_69136] using getter_witness_69137
def localNode_69151 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .move .right slot_69150
theorem local_eq_69151 :
    syntax_2020.fastNodeAt slot_69151 = localNode_69151 := by rfl
theorem getter_witness_69151 :
    FieldPacked.getter.node 69151 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69151 := by
  rw [← address_69151, getter_syntax, local_eq_69151]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69151\t{now}"
      handle.flush
def globalNode_69151 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69150 : Fin 106668)
theorem numeric_node_69151 :
    FieldPacked.getter.node 69151 = globalNode_69151 := by
  simpa only [
    localNode_69151,
    globalNode_69151,
    TemplateGraph.mapNode,
    address_69150] using getter_witness_69151
def nodeTable_69152 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_69152 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .branch
    nodeTable_69152
    slot_69137 slot_69151
theorem local_eq_69152 :
    syntax_2020.fastNodeAt slot_69152 = localNode_69152 := by rfl
theorem getter_witness_69152 :
    FieldPacked.getter.node 69152 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69152 := by
  rw [← address_69152, getter_syntax, local_eq_69152]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69152\t{now}"
      handle.flush
def globalNode_69152 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69152
    (69137 : Fin 106668) (69151 : Fin 106668)
theorem numeric_node_69152 :
    FieldPacked.getter.node 69152 = globalNode_69152 := by
  simpa only [
    localNode_69152,
    globalNode_69152,
    TemplateGraph.mapNode,
    address_69137,
    address_69151] using getter_witness_69152
def nodeTable_69153 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_69153 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .branch
    nodeTable_69153
    slot_69123 slot_69152
theorem local_eq_69153 :
    syntax_2020.fastNodeAt slot_69153 = localNode_69153 := by rfl
theorem getter_witness_69153 :
    FieldPacked.getter.node 69153 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69153 := by
  rw [← address_69153, getter_syntax, local_eq_69153]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69153\t{now}"
      handle.flush
def globalNode_69153 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69153
    (69123 : Fin 106668) (69152 : Fin 106668)
theorem numeric_node_69153 :
    FieldPacked.getter.node 69153 = globalNode_69153 := by
  simpa only [
    localNode_69153,
    globalNode_69153,
    TemplateGraph.mapNode,
    address_69123,
    address_69152] using getter_witness_69153
def nodeTable_69154 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_69154 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .branch
    nodeTable_69154
    slot_69109 slot_69153
theorem local_eq_69154 :
    syntax_2020.fastNodeAt slot_69154 = localNode_69154 := by rfl
theorem getter_witness_69154 :
    FieldPacked.getter.node 69154 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69154 := by
  rw [← address_69154, getter_syntax, local_eq_69154]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69154\t{now}"
      handle.flush
def globalNode_69154 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69154
    (69109 : Fin 106668) (69153 : Fin 106668)
theorem numeric_node_69154 :
    FieldPacked.getter.node 69154 = globalNode_69154 := by
  simpa only [
    localNode_69154,
    globalNode_69154,
    TemplateGraph.mapNode,
    address_69109,
    address_69153] using getter_witness_69154
def nodeTable_69155 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69155 : BoolGraph.Node syntax_2020.size 5 4042 :=
  .branch
    nodeTable_69155
    slot_69095 slot_69154
theorem local_eq_69155 :
    syntax_2020.fastNodeAt slot_69155 = localNode_69155 := by rfl
theorem getter_witness_69155 :
    FieldPacked.getter.node 69155 =
      TemplateGraph.mapNode (slotIndex 2020 syntax_2020 syntax_eq_2020)
        localNode_69155 := by
  rw [← address_69155, getter_syntax, local_eq_69155]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69155\t{now}"
      handle.flush
def globalNode_69155 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69155
    (69095 : Fin 106668) (69154 : Fin 106668)
theorem numeric_node_69155 :
    FieldPacked.getter.node 69155 = globalNode_69155 := by
  simpa only [
    localNode_69155,
    globalNode_69155,
    TemplateGraph.mapNode,
    address_69095,
    address_69154] using getter_witness_69155
def nodeTable_69425 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69425 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .write
    nodeTable_69425
    slot_69424
theorem local_eq_69425 :
    syntax_2028.fastNodeAt slot_69425 = localNode_69425 := by rfl
theorem getter_witness_69425 :
    FieldPacked.getter.node 69425 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69425 := by
  rw [← address_69425, getter_syntax, local_eq_69425]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69425\t{now}"
      handle.flush
def globalNode_69425 : BoolGraph.Node 106668 5 4042 :=
  .write
    nodeTable_69425
    (69424 : Fin 106668)
theorem numeric_node_69425 :
    FieldPacked.getter.node 69425 = globalNode_69425 := by
  simpa only [
    localNode_69425,
    globalNode_69425,
    TemplateGraph.mapNode,
    address_69424] using getter_witness_69425
def nodeTable_69433 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69433 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .write
    nodeTable_69433
    slot_69432
theorem local_eq_69433 :
    syntax_2028.fastNodeAt slot_69433 = localNode_69433 := by rfl
theorem getter_witness_69433 :
    FieldPacked.getter.node 69433 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69433 := by
  rw [← address_69433, getter_syntax, local_eq_69433]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69433\t{now}"
      handle.flush
def globalNode_69433 : BoolGraph.Node 106668 5 4042 :=
  .write
    nodeTable_69433
    (69432 : Fin 106668)
theorem numeric_node_69433 :
    FieldPacked.getter.node 69433 = globalNode_69433 := by
  simpa only [
    localNode_69433,
    globalNode_69433,
    TemplateGraph.mapNode,
    address_69432] using getter_witness_69433
def nodeTable_69434 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_69434 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .branch
    nodeTable_69434
    slot_69425 slot_69433
theorem local_eq_69434 :
    syntax_2028.fastNodeAt slot_69434 = localNode_69434 := by rfl
theorem getter_witness_69434 :
    FieldPacked.getter.node 69434 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69434 := by
  rw [← address_69434, getter_syntax, local_eq_69434]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69434\t{now}"
      handle.flush
def globalNode_69434 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69434
    (69425 : Fin 106668) (69433 : Fin 106668)
theorem numeric_node_69434 :
    FieldPacked.getter.node 69434 = globalNode_69434 := by
  simpa only [
    localNode_69434,
    globalNode_69434,
    TemplateGraph.mapNode,
    address_69425,
    address_69433] using getter_witness_69434
def nodeTable_69435 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_69435 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .branch
    nodeTable_69435
    slot_69417 slot_69434
theorem local_eq_69435 :
    syntax_2028.fastNodeAt slot_69435 = localNode_69435 := by rfl
theorem getter_witness_69435 :
    FieldPacked.getter.node 69435 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69435 := by
  rw [← address_69435, getter_syntax, local_eq_69435]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69435\t{now}"
      handle.flush
def globalNode_69435 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69435
    (69417 : Fin 106668) (69434 : Fin 106668)
theorem numeric_node_69435 :
    FieldPacked.getter.node 69435 = globalNode_69435 := by
  simpa only [
    localNode_69435,
    globalNode_69435,
    TemplateGraph.mapNode,
    address_69417,
    address_69434] using getter_witness_69435
def nodeTable_69436 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_69436 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .branch
    nodeTable_69436
    slot_69409 slot_69435
theorem local_eq_69436 :
    syntax_2028.fastNodeAt slot_69436 = localNode_69436 := by rfl
theorem getter_witness_69436 :
    FieldPacked.getter.node 69436 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69436 := by
  rw [← address_69436, getter_syntax, local_eq_69436]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69436\t{now}"
      handle.flush
def globalNode_69436 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69436
    (69409 : Fin 106668) (69435 : Fin 106668)
theorem numeric_node_69436 :
    FieldPacked.getter.node 69436 = globalNode_69436 := by
  simpa only [
    localNode_69436,
    globalNode_69436,
    TemplateGraph.mapNode,
    address_69409,
    address_69435] using getter_witness_69436
def nodeTable_69437 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69437 : BoolGraph.Node syntax_2028.size 5 4042 :=
  .branch
    nodeTable_69437
    slot_69401 slot_69436
theorem local_eq_69437 :
    syntax_2028.fastNodeAt slot_69437 = localNode_69437 := by rfl
theorem getter_witness_69437 :
    FieldPacked.getter.node 69437 =
      TemplateGraph.mapNode (slotIndex 2028 syntax_2028 syntax_eq_2028)
        localNode_69437 := by
  rw [← address_69437, getter_syntax, local_eq_69437]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69437\t{now}"
      handle.flush
def globalNode_69437 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69437
    (69401 : Fin 106668) (69436 : Fin 106668)
theorem numeric_node_69437 :
    FieldPacked.getter.node 69437 = globalNode_69437 := by
  simpa only [
    localNode_69437,
    globalNode_69437,
    TemplateGraph.mapNode,
    address_69401,
    address_69436] using getter_witness_69437
def localNode_69689 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .move .right slot_69688
theorem local_eq_69689 :
    syntax_2036.fastNodeAt slot_69689 = localNode_69689 := by rfl
theorem getter_witness_69689 :
    FieldPacked.getter.node 69689 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69689 := by
  rw [← address_69689, getter_syntax, local_eq_69689]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69689\t{now}"
      handle.flush
def globalNode_69689 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69688 : Fin 106668)
theorem numeric_node_69689 :
    FieldPacked.getter.node 69689 = globalNode_69689 := by
  simpa only [
    localNode_69689,
    globalNode_69689,
    TemplateGraph.mapNode,
    address_69688] using getter_witness_69689
def localNode_69703 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .move .right slot_69702
theorem local_eq_69703 :
    syntax_2036.fastNodeAt slot_69703 = localNode_69703 := by rfl
theorem getter_witness_69703 :
    FieldPacked.getter.node 69703 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69703 := by
  rw [← address_69703, getter_syntax, local_eq_69703]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69703\t{now}"
      handle.flush
def globalNode_69703 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69702 : Fin 106668)
theorem numeric_node_69703 :
    FieldPacked.getter.node 69703 = globalNode_69703 := by
  simpa only [
    localNode_69703,
    globalNode_69703,
    TemplateGraph.mapNode,
    address_69702] using getter_witness_69703
def nodeTable_69704 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_69704 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .branch
    nodeTable_69704
    slot_69689 slot_69703
theorem local_eq_69704 :
    syntax_2036.fastNodeAt slot_69704 = localNode_69704 := by rfl
theorem getter_witness_69704 :
    FieldPacked.getter.node 69704 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69704 := by
  rw [← address_69704, getter_syntax, local_eq_69704]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69704\t{now}"
      handle.flush
def globalNode_69704 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69704
    (69689 : Fin 106668) (69703 : Fin 106668)
theorem numeric_node_69704 :
    FieldPacked.getter.node 69704 = globalNode_69704 := by
  simpa only [
    localNode_69704,
    globalNode_69704,
    TemplateGraph.mapNode,
    address_69689,
    address_69703] using getter_witness_69704
def nodeTable_69705 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_69705 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .branch
    nodeTable_69705
    slot_69675 slot_69704
theorem local_eq_69705 :
    syntax_2036.fastNodeAt slot_69705 = localNode_69705 := by rfl
theorem getter_witness_69705 :
    FieldPacked.getter.node 69705 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69705 := by
  rw [← address_69705, getter_syntax, local_eq_69705]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69705\t{now}"
      handle.flush
def globalNode_69705 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69705
    (69675 : Fin 106668) (69704 : Fin 106668)
theorem numeric_node_69705 :
    FieldPacked.getter.node 69705 = globalNode_69705 := by
  simpa only [
    localNode_69705,
    globalNode_69705,
    TemplateGraph.mapNode,
    address_69675,
    address_69704] using getter_witness_69705
def nodeTable_69706 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_69706 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .branch
    nodeTable_69706
    slot_69661 slot_69705
theorem local_eq_69706 :
    syntax_2036.fastNodeAt slot_69706 = localNode_69706 := by rfl
theorem getter_witness_69706 :
    FieldPacked.getter.node 69706 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69706 := by
  rw [← address_69706, getter_syntax, local_eq_69706]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69706\t{now}"
      handle.flush
def globalNode_69706 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69706
    (69661 : Fin 106668) (69705 : Fin 106668)
theorem numeric_node_69706 :
    FieldPacked.getter.node 69706 = globalNode_69706 := by
  simpa only [
    localNode_69706,
    globalNode_69706,
    TemplateGraph.mapNode,
    address_69661,
    address_69705] using getter_witness_69706
def nodeTable_69707 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69707 : BoolGraph.Node syntax_2036.size 5 4042 :=
  .branch
    nodeTable_69707
    slot_69647 slot_69706
theorem local_eq_69707 :
    syntax_2036.fastNodeAt slot_69707 = localNode_69707 := by rfl
theorem getter_witness_69707 :
    FieldPacked.getter.node 69707 =
      TemplateGraph.mapNode (slotIndex 2036 syntax_2036 syntax_eq_2036)
        localNode_69707 := by
  rw [← address_69707, getter_syntax, local_eq_69707]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69707\t{now}"
      handle.flush
def globalNode_69707 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69707
    (69647 : Fin 106668) (69706 : Fin 106668)
theorem numeric_node_69707 :
    FieldPacked.getter.node 69707 = globalNode_69707 := by
  simpa only [
    localNode_69707,
    globalNode_69707,
    TemplateGraph.mapNode,
    address_69647,
    address_69706] using getter_witness_69707
def localNode_69909 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .move .right slot_69908
theorem local_eq_69909 :
    syntax_2042.fastNodeAt slot_69909 = localNode_69909 := by rfl
theorem getter_witness_69909 :
    FieldPacked.getter.node 69909 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69909 := by
  rw [← address_69909, getter_syntax, local_eq_69909]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69909\t{now}"
      handle.flush
def globalNode_69909 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69908 : Fin 106668)
theorem numeric_node_69909 :
    FieldPacked.getter.node 69909 = globalNode_69909 := by
  simpa only [
    localNode_69909,
    globalNode_69909,
    TemplateGraph.mapNode,
    address_69908] using getter_witness_69909
def localNode_69935 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .move .right slot_69934
theorem local_eq_69935 :
    syntax_2042.fastNodeAt slot_69935 = localNode_69935 := by rfl
theorem getter_witness_69935 :
    FieldPacked.getter.node 69935 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69935 := by
  rw [← address_69935, getter_syntax, local_eq_69935]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69935\t{now}"
      handle.flush
def globalNode_69935 : BoolGraph.Node 106668 5 4042 :=
  .move .right (69934 : Fin 106668)
theorem numeric_node_69935 :
    FieldPacked.getter.node 69935 = globalNode_69935 := by
  simpa only [
    localNode_69935,
    globalNode_69935,
    TemplateGraph.mapNode,
    address_69934] using getter_witness_69935
def nodeTable_69936 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_69936 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .branch
    nodeTable_69936
    slot_69909 slot_69935
theorem local_eq_69936 :
    syntax_2042.fastNodeAt slot_69936 = localNode_69936 := by rfl
theorem getter_witness_69936 :
    FieldPacked.getter.node 69936 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69936 := by
  rw [← address_69936, getter_syntax, local_eq_69936]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69936\t{now}"
      handle.flush
def globalNode_69936 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69936
    (69909 : Fin 106668) (69935 : Fin 106668)
theorem numeric_node_69936 :
    FieldPacked.getter.node 69936 = globalNode_69936 := by
  simpa only [
    localNode_69936,
    globalNode_69936,
    TemplateGraph.mapNode,
    address_69909,
    address_69935] using getter_witness_69936
def nodeTable_69937 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_69937 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .branch
    nodeTable_69937
    slot_69883 slot_69936
theorem local_eq_69937 :
    syntax_2042.fastNodeAt slot_69937 = localNode_69937 := by rfl
theorem getter_witness_69937 :
    FieldPacked.getter.node 69937 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69937 := by
  rw [← address_69937, getter_syntax, local_eq_69937]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69937\t{now}"
      handle.flush
def globalNode_69937 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69937
    (69883 : Fin 106668) (69936 : Fin 106668)
theorem numeric_node_69937 :
    FieldPacked.getter.node 69937 = globalNode_69937 := by
  simpa only [
    localNode_69937,
    globalNode_69937,
    TemplateGraph.mapNode,
    address_69883,
    address_69936] using getter_witness_69937
def nodeTable_69938 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_69938 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .branch
    nodeTable_69938
    slot_69857 slot_69937
theorem local_eq_69938 :
    syntax_2042.fastNodeAt slot_69938 = localNode_69938 := by rfl
theorem getter_witness_69938 :
    FieldPacked.getter.node 69938 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69938 := by
  rw [← address_69938, getter_syntax, local_eq_69938]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69938\t{now}"
      handle.flush
def globalNode_69938 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69938
    (69857 : Fin 106668) (69937 : Fin 106668)
theorem numeric_node_69938 :
    FieldPacked.getter.node 69938 = globalNode_69938 := by
  simpa only [
    localNode_69938,
    globalNode_69938,
    TemplateGraph.mapNode,
    address_69857,
    address_69937] using getter_witness_69938
def nodeTable_69939 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_69939 : BoolGraph.Node syntax_2042.size 5 4042 :=
  .branch
    nodeTable_69939
    slot_69831 slot_69938
theorem local_eq_69939 :
    syntax_2042.fastNodeAt slot_69939 = localNode_69939 := by rfl
theorem getter_witness_69939 :
    FieldPacked.getter.node 69939 =
      TemplateGraph.mapNode (slotIndex 2042 syntax_2042 syntax_eq_2042)
        localNode_69939 := by
  rw [← address_69939, getter_syntax, local_eq_69939]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t69939\t{now}"
      handle.flush
def globalNode_69939 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_69939
    (69831 : Fin 106668) (69938 : Fin 106668)
theorem numeric_node_69939 :
    FieldPacked.getter.node 69939 = globalNode_69939 := by
  simpa only [
    localNode_69939,
    globalNode_69939,
    TemplateGraph.mapNode,
    address_69831,
    address_69938] using getter_witness_69939
def localNode_70377 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .move .right slot_70376
theorem local_eq_70377 :
    syntax_2050.fastNodeAt slot_70377 = localNode_70377 := by rfl
theorem getter_witness_70377 :
    FieldPacked.getter.node 70377 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70377 := by
  rw [← address_70377, getter_syntax, local_eq_70377]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70377\t{now}"
      handle.flush
def globalNode_70377 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70376 : Fin 106668)
theorem numeric_node_70377 :
    FieldPacked.getter.node 70377 = globalNode_70377 := by
  simpa only [
    localNode_70377,
    globalNode_70377,
    TemplateGraph.mapNode,
    address_70376] using getter_witness_70377
def localNode_70397 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .move .right slot_70396
theorem local_eq_70397 :
    syntax_2050.fastNodeAt slot_70397 = localNode_70397 := by rfl
theorem getter_witness_70397 :
    FieldPacked.getter.node 70397 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70397 := by
  rw [← address_70397, getter_syntax, local_eq_70397]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70397\t{now}"
      handle.flush
def globalNode_70397 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70396 : Fin 106668)
theorem numeric_node_70397 :
    FieldPacked.getter.node 70397 = globalNode_70397 := by
  simpa only [
    localNode_70397,
    globalNode_70397,
    TemplateGraph.mapNode,
    address_70396] using getter_witness_70397
def nodeTable_70398 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_70398 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .branch
    nodeTable_70398
    slot_70377 slot_70397
theorem local_eq_70398 :
    syntax_2050.fastNodeAt slot_70398 = localNode_70398 := by rfl
theorem getter_witness_70398 :
    FieldPacked.getter.node 70398 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70398 := by
  rw [← address_70398, getter_syntax, local_eq_70398]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70398\t{now}"
      handle.flush
def globalNode_70398 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70398
    (70377 : Fin 106668) (70397 : Fin 106668)
theorem numeric_node_70398 :
    FieldPacked.getter.node 70398 = globalNode_70398 := by
  simpa only [
    localNode_70398,
    globalNode_70398,
    TemplateGraph.mapNode,
    address_70377,
    address_70397] using getter_witness_70398
def nodeTable_70399 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_70399 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .branch
    nodeTable_70399
    slot_70357 slot_70398
theorem local_eq_70399 :
    syntax_2050.fastNodeAt slot_70399 = localNode_70399 := by rfl
theorem getter_witness_70399 :
    FieldPacked.getter.node 70399 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70399 := by
  rw [← address_70399, getter_syntax, local_eq_70399]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70399\t{now}"
      handle.flush
def globalNode_70399 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70399
    (70357 : Fin 106668) (70398 : Fin 106668)
theorem numeric_node_70399 :
    FieldPacked.getter.node 70399 = globalNode_70399 := by
  simpa only [
    localNode_70399,
    globalNode_70399,
    TemplateGraph.mapNode,
    address_70357,
    address_70398] using getter_witness_70399
def nodeTable_70400 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_70400 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .branch
    nodeTable_70400
    slot_70337 slot_70399
theorem local_eq_70400 :
    syntax_2050.fastNodeAt slot_70400 = localNode_70400 := by rfl
theorem getter_witness_70400 :
    FieldPacked.getter.node 70400 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70400 := by
  rw [← address_70400, getter_syntax, local_eq_70400]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70400\t{now}"
      handle.flush
def globalNode_70400 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70400
    (70337 : Fin 106668) (70399 : Fin 106668)
theorem numeric_node_70400 :
    FieldPacked.getter.node 70400 = globalNode_70400 := by
  simpa only [
    localNode_70400,
    globalNode_70400,
    TemplateGraph.mapNode,
    address_70337,
    address_70399] using getter_witness_70400
def nodeTable_70401 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_70401 : BoolGraph.Node syntax_2050.size 5 4042 :=
  .branch
    nodeTable_70401
    slot_70317 slot_70400
theorem local_eq_70401 :
    syntax_2050.fastNodeAt slot_70401 = localNode_70401 := by rfl
theorem getter_witness_70401 :
    FieldPacked.getter.node 70401 =
      TemplateGraph.mapNode (slotIndex 2050 syntax_2050 syntax_eq_2050)
        localNode_70401 := by
  rw [← address_70401, getter_syntax, local_eq_70401]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70401\t{now}"
      handle.flush
def globalNode_70401 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70401
    (70317 : Fin 106668) (70400 : Fin 106668)
theorem numeric_node_70401 :
    FieldPacked.getter.node 70401 = globalNode_70401 := by
  simpa only [
    localNode_70401,
    globalNode_70401,
    TemplateGraph.mapNode,
    address_70317,
    address_70400] using getter_witness_70401
def localNode_70602 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .move .right slot_70601
theorem local_eq_70602 :
    syntax_2053.fastNodeAt slot_70602 = localNode_70602 := by rfl
theorem getter_witness_70602 :
    FieldPacked.getter.node 70602 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70602 := by
  rw [← address_70602, getter_syntax, local_eq_70602]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70602\t{now}"
      handle.flush
def globalNode_70602 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70601 : Fin 106668)
theorem numeric_node_70602 :
    FieldPacked.getter.node 70602 = globalNode_70602 := by
  simpa only [
    localNode_70602,
    globalNode_70602,
    TemplateGraph.mapNode,
    address_70601] using getter_witness_70602
def localNode_70622 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .move .right slot_70621
theorem local_eq_70622 :
    syntax_2053.fastNodeAt slot_70622 = localNode_70622 := by rfl
theorem getter_witness_70622 :
    FieldPacked.getter.node 70622 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70622 := by
  rw [← address_70622, getter_syntax, local_eq_70622]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70622\t{now}"
      handle.flush
def globalNode_70622 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70621 : Fin 106668)
theorem numeric_node_70622 :
    FieldPacked.getter.node 70622 = globalNode_70622 := by
  simpa only [
    localNode_70622,
    globalNode_70622,
    TemplateGraph.mapNode,
    address_70621] using getter_witness_70622
def nodeTable_70623 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_70623 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .branch
    nodeTable_70623
    slot_70602 slot_70622
theorem local_eq_70623 :
    syntax_2053.fastNodeAt slot_70623 = localNode_70623 := by rfl
theorem getter_witness_70623 :
    FieldPacked.getter.node 70623 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70623 := by
  rw [← address_70623, getter_syntax, local_eq_70623]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70623\t{now}"
      handle.flush
def globalNode_70623 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70623
    (70602 : Fin 106668) (70622 : Fin 106668)
theorem numeric_node_70623 :
    FieldPacked.getter.node 70623 = globalNode_70623 := by
  simpa only [
    localNode_70623,
    globalNode_70623,
    TemplateGraph.mapNode,
    address_70602,
    address_70622] using getter_witness_70623
def nodeTable_70624 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_70624 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .branch
    nodeTable_70624
    slot_70582 slot_70623
theorem local_eq_70624 :
    syntax_2053.fastNodeAt slot_70624 = localNode_70624 := by rfl
theorem getter_witness_70624 :
    FieldPacked.getter.node 70624 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70624 := by
  rw [← address_70624, getter_syntax, local_eq_70624]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70624\t{now}"
      handle.flush
def globalNode_70624 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70624
    (70582 : Fin 106668) (70623 : Fin 106668)
theorem numeric_node_70624 :
    FieldPacked.getter.node 70624 = globalNode_70624 := by
  simpa only [
    localNode_70624,
    globalNode_70624,
    TemplateGraph.mapNode,
    address_70582,
    address_70623] using getter_witness_70624
def nodeTable_70625 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_70625 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .branch
    nodeTable_70625
    slot_70562 slot_70624
theorem local_eq_70625 :
    syntax_2053.fastNodeAt slot_70625 = localNode_70625 := by rfl
theorem getter_witness_70625 :
    FieldPacked.getter.node 70625 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70625 := by
  rw [← address_70625, getter_syntax, local_eq_70625]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70625\t{now}"
      handle.flush
def globalNode_70625 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70625
    (70562 : Fin 106668) (70624 : Fin 106668)
theorem numeric_node_70625 :
    FieldPacked.getter.node 70625 = globalNode_70625 := by
  simpa only [
    localNode_70625,
    globalNode_70625,
    TemplateGraph.mapNode,
    address_70562,
    address_70624] using getter_witness_70625
def nodeTable_70626 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_70626 : BoolGraph.Node syntax_2053.size 5 4042 :=
  .branch
    nodeTable_70626
    slot_70542 slot_70625
theorem local_eq_70626 :
    syntax_2053.fastNodeAt slot_70626 = localNode_70626 := by rfl
theorem getter_witness_70626 :
    FieldPacked.getter.node 70626 =
      TemplateGraph.mapNode (slotIndex 2053 syntax_2053 syntax_eq_2053)
        localNode_70626 := by
  rw [← address_70626, getter_syntax, local_eq_70626]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70626\t{now}"
      handle.flush
def globalNode_70626 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70626
    (70542 : Fin 106668) (70625 : Fin 106668)
theorem numeric_node_70626 :
    FieldPacked.getter.node 70626 = globalNode_70626 := by
  simpa only [
    localNode_70626,
    globalNode_70626,
    TemplateGraph.mapNode,
    address_70542,
    address_70625] using getter_witness_70626
def localNode_70807 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .move .right slot_70806
theorem local_eq_70807 :
    syntax_2059.fastNodeAt slot_70807 = localNode_70807 := by rfl
theorem getter_witness_70807 :
    FieldPacked.getter.node 70807 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70807 := by
  rw [← address_70807, getter_syntax, local_eq_70807]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70807\t{now}"
      handle.flush
def globalNode_70807 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70806 : Fin 106668)
theorem numeric_node_70807 :
    FieldPacked.getter.node 70807 = globalNode_70807 := by
  simpa only [
    localNode_70807,
    globalNode_70807,
    TemplateGraph.mapNode,
    address_70806] using getter_witness_70807
def localNode_70821 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .move .right slot_70820
theorem local_eq_70821 :
    syntax_2059.fastNodeAt slot_70821 = localNode_70821 := by rfl
theorem getter_witness_70821 :
    FieldPacked.getter.node 70821 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70821 := by
  rw [← address_70821, getter_syntax, local_eq_70821]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70821\t{now}"
      handle.flush
def globalNode_70821 : BoolGraph.Node 106668 5 4042 :=
  .move .right (70820 : Fin 106668)
theorem numeric_node_70821 :
    FieldPacked.getter.node 70821 = globalNode_70821 := by
  simpa only [
    localNode_70821,
    globalNode_70821,
    TemplateGraph.mapNode,
    address_70820] using getter_witness_70821
def nodeTable_70822 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false], rfl⟩
def localNode_70822 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .branch
    nodeTable_70822
    slot_70807 slot_70821
theorem local_eq_70822 :
    syntax_2059.fastNodeAt slot_70822 = localNode_70822 := by rfl
theorem getter_witness_70822 :
    FieldPacked.getter.node 70822 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70822 := by
  rw [← address_70822, getter_syntax, local_eq_70822]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70822\t{now}"
      handle.flush
def globalNode_70822 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70822
    (70807 : Fin 106668) (70821 : Fin 106668)
theorem numeric_node_70822 :
    FieldPacked.getter.node 70822 = globalNode_70822 := by
  simpa only [
    localNode_70822,
    globalNode_70822,
    TemplateGraph.mapNode,
    address_70807,
    address_70821] using getter_witness_70822
def nodeTable_70823 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false], rfl⟩
def localNode_70823 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .branch
    nodeTable_70823
    slot_70793 slot_70822
theorem local_eq_70823 :
    syntax_2059.fastNodeAt slot_70823 = localNode_70823 := by rfl
theorem getter_witness_70823 :
    FieldPacked.getter.node 70823 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70823 := by
  rw [← address_70823, getter_syntax, local_eq_70823]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70823\t{now}"
      handle.flush
def globalNode_70823 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70823
    (70793 : Fin 106668) (70822 : Fin 106668)
theorem numeric_node_70823 :
    FieldPacked.getter.node 70823 = globalNode_70823 := by
  simpa only [
    localNode_70823,
    globalNode_70823,
    TemplateGraph.mapNode,
    address_70793,
    address_70822] using getter_witness_70823
def nodeTable_70824 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false], rfl⟩
def localNode_70824 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .branch
    nodeTable_70824
    slot_70779 slot_70823
theorem local_eq_70824 :
    syntax_2059.fastNodeAt slot_70824 = localNode_70824 := by rfl
theorem getter_witness_70824 :
    FieldPacked.getter.node 70824 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70824 := by
  rw [← address_70824, getter_syntax, local_eq_70824]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70824\t{now}"
      handle.flush
def globalNode_70824 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70824
    (70779 : Fin 106668) (70823 : Fin 106668)
theorem numeric_node_70824 :
    FieldPacked.getter.node 70824 = globalNode_70824 := by
  simpa only [
    localNode_70824,
    globalNode_70824,
    TemplateGraph.mapNode,
    address_70779,
    address_70823] using getter_witness_70824
def nodeTable_70825 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_70825 : BoolGraph.Node syntax_2059.size 5 4042 :=
  .branch
    nodeTable_70825
    slot_70765 slot_70824
theorem local_eq_70825 :
    syntax_2059.fastNodeAt slot_70825 = localNode_70825 := by rfl
theorem getter_witness_70825 :
    FieldPacked.getter.node 70825 =
      TemplateGraph.mapNode (slotIndex 2059 syntax_2059 syntax_eq_2059)
        localNode_70825 := by
  rw [← address_70825, getter_syntax, local_eq_70825]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t70825\t{now}"
      handle.flush
def globalNode_70825 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_70825
    (70765 : Fin 106668) (70824 : Fin 106668)
theorem numeric_node_70825 :
    FieldPacked.getter.node 70825 = globalNode_70825 := by
  simpa only [
    localNode_70825,
    globalNode_70825,
    TemplateGraph.mapNode,
    address_70765,
    address_70824] using getter_witness_70825
def nodeTable_80019 : BoolGraph.Table 5 (Fin 4042) :=
  ⟨#[
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩,
      ⟨713, by decide⟩], rfl⟩
def localNode_80019 : BoolGraph.Node syntax_2553.size 5 4042 :=
  .goto
    nodeTable_80019
theorem local_eq_80019 :
    syntax_2553.fastNodeAt slot_80019 = localNode_80019 := by rfl
theorem getter_witness_80019 :
    FieldPacked.getter.node 80019 =
      TemplateGraph.mapNode (slotIndex 2553 syntax_2553 syntax_eq_2553)
        localNode_80019 := by
  rw [← address_80019, getter_syntax, local_eq_80019]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t80019\t{now}"
      handle.flush
def globalNode_80019 : BoolGraph.Node 106668 5 4042 :=
  .goto
    nodeTable_80019
theorem numeric_node_80019 :
    FieldPacked.getter.node 80019 = globalNode_80019 := by
  simpa only [
    localNode_80019,
    globalNode_80019,
    TemplateGraph.mapNode] using getter_witness_80019
def nodeTable_80020 : BoolGraph.Table 5 Bool :=
  ⟨#[
      true,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
      false,
      false], rfl⟩
def localNode_80020 : BoolGraph.Node syntax_2553.size 5 4042 :=
  .branch
    nodeTable_80020
    slot_80018 slot_80019
theorem local_eq_80020 :
    syntax_2553.fastNodeAt slot_80020 = localNode_80020 := by rfl
theorem getter_witness_80020 :
    FieldPacked.getter.node 80020 =
      TemplateGraph.mapNode (slotIndex 2553 syntax_2553 syntax_eq_2553)
        localNode_80020 := by
  rw [← address_80020, getter_syntax, local_eq_80020]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t80020\t{now}"
      handle.flush
def globalNode_80020 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_80020
    (80018 : Fin 106668) (80019 : Fin 106668)
theorem numeric_node_80020 :
    FieldPacked.getter.node 80020 = globalNode_80020 := by
  simpa only [
    localNode_80020,
    globalNode_80020,
    TemplateGraph.mapNode,
    address_80018,
    address_80019] using getter_witness_80020
def localNode_93343 : BoolGraph.Node syntax_3297.size 5 4042 :=
  .move .left slot_93342
theorem local_eq_93343 :
    syntax_3297.fastNodeAt slot_93343 = localNode_93343 := by rfl
theorem getter_witness_93343 :
    FieldPacked.getter.node 93343 =
      TemplateGraph.mapNode (slotIndex 3297 syntax_3297 syntax_eq_3297)
        localNode_93343 := by
  rw [← address_93343, getter_syntax, local_eq_93343]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t93343\t{now}"
      handle.flush
def globalNode_93343 : BoolGraph.Node 106668 5 4042 :=
  .move .left (93342 : Fin 106668)
theorem numeric_node_93343 :
    FieldPacked.getter.node 93343 = globalNode_93343 := by
  simpa only [
    localNode_93343,
    globalNode_93343,
    TemplateGraph.mapNode,
    address_93342] using getter_witness_93343
def localNode_93356 : BoolGraph.Node syntax_3297.size 5 4042 :=
  .move .left slot_93355
theorem local_eq_93356 :
    syntax_3297.fastNodeAt slot_93356 = localNode_93356 := by rfl
theorem getter_witness_93356 :
    FieldPacked.getter.node 93356 =
      TemplateGraph.mapNode (slotIndex 3297 syntax_3297 syntax_eq_3297)
        localNode_93356 := by
  rw [← address_93356, getter_syntax, local_eq_93356]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t93356\t{now}"
      handle.flush
def globalNode_93356 : BoolGraph.Node 106668 5 4042 :=
  .move .left (93355 : Fin 106668)
theorem numeric_node_93356 :
    FieldPacked.getter.node 93356 = globalNode_93356 := by
  simpa only [
    localNode_93356,
    globalNode_93356,
    TemplateGraph.mapNode,
    address_93355] using getter_witness_93356
def nodeTable_93357 : BoolGraph.Table 5 Bool :=
  ⟨#[
      false,
      false,
      false,
      false,
      false,
      true,
      true,
      true,
      true,
      true], rfl⟩
def localNode_93357 : BoolGraph.Node syntax_3297.size 5 4042 :=
  .branch
    nodeTable_93357
    slot_93343 slot_93356
theorem local_eq_93357 :
    syntax_3297.fastNodeAt slot_93357 = localNode_93357 := by rfl
theorem getter_witness_93357 :
    FieldPacked.getter.node 93357 =
      TemplateGraph.mapNode (slotIndex 3297 syntax_3297 syntax_eq_3297)
        localNode_93357 := by
  rw [← address_93357, getter_syntax, local_eq_93357]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/row-witness-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"getter\t93357\t{now}"
      handle.flush
def globalNode_93357 : BoolGraph.Node 106668 5 4042 :=
  .branch
    nodeTable_93357
    (93343 : Fin 106668) (93356 : Fin 106668)
theorem numeric_node_93357 :
    FieldPacked.getter.node 93357 = globalNode_93357 := by
  simpa only [
    localNode_93357,
    globalNode_93357,
    TemplateGraph.mapNode,
    address_93343,
    address_93356] using getter_witness_93357
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
def globalNode_106667 : BoolGraph.Node 106668 5 4042 :=
  .move .right (106666 : Fin 106668)
theorem numeric_node_106667 :
    FieldPacked.getter.node 106667 = globalNode_106667 := by
  simpa only [
    localNode_106667,
    globalNode_106667,
    TemplateGraph.mapNode,
    address_106666] using getter_witness_106667
capture_cert in
theorem root_1 : syntax_1.root = slot_1 := by rfl
capture_cert in
theorem entry_1 : FieldPacked.getter.entry 1 = 1 := by
  rw [entry_syntax 1 syntax_1 syntax_eq_1, root_1, address_1]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-64\t1\t{now}"
      handle.flush
capture_cert in
theorem root_2 : syntax_2.root = slot_2 := by rfl
capture_cert in
theorem entry_2 : FieldPacked.getter.entry 2 = 2 := by
  rw [entry_syntax 2 syntax_2 syntax_eq_2, root_2, address_2]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-64\t2\t{now}"
      handle.flush
capture_cert in
theorem root_216 : syntax_216.root = slot_296 := by rfl
capture_cert in
theorem entry_216 : FieldPacked.getter.entry 216 = 296 := by
  rw [entry_syntax 216 syntax_216 syntax_eq_216, root_216, address_296]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-64\t216\t{now}"
      handle.flush
capture_cert in
theorem root_713 : syntax_713.root = slot_18791 := by rfl
capture_cert in
theorem entry_713 : FieldPacked.getter.entry 713 = 18791 := by
  rw [entry_syntax 713 syntax_713 syntax_eq_713, root_713, address_18791]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-64\t713\t{now}"
      handle.flush
capture_cert in
theorem root_957 : syntax_957.root = slot_26644 := by rfl
capture_cert in
theorem entry_957 : FieldPacked.getter.entry 957 = 26644 := by
  rw [entry_syntax 957 syntax_957 syntax_eq_957, root_957, address_26644]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"entry-64\t957\t{now}"
      handle.flush
capture_cert in
theorem return_offset_0 : FieldSelectiveLayout.offset 0 =
    0 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t0\t{now}"
      handle.flush
capture_cert in
theorem return_offset_1 : FieldSelectiveLayout.offset 1 =
    1 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t1\t{now}"
      handle.flush
capture_cert in
theorem return_offset_2 : FieldSelectiveLayout.offset 2 =
    2 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t2\t{now}"
      handle.flush
capture_cert in
theorem return_offset_216 : FieldSelectiveLayout.offset 216 =
    216 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t216\t{now}"
      handle.flush
capture_cert in
theorem return_offset_278 : FieldSelectiveLayout.offset 278 =
    278 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t278\t{now}"
      handle.flush
capture_cert in
theorem return_offset_496 : FieldSelectiveLayout.offset 496 =
    1006 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t496\t{now}"
      handle.flush
capture_cert in
theorem return_offset_713 : FieldSelectiveLayout.offset 713 =
    1778 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t713\t{now}"
      handle.flush
capture_cert in
theorem return_offset_793 : FieldSelectiveLayout.offset 793 =
    2023 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t793\t{now}"
      handle.flush
capture_cert in
theorem return_offset_957 : FieldSelectiveLayout.offset 957 =
    2502 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t957\t{now}"
      handle.flush
capture_cert in
theorem return_offset_1130 : FieldSelectiveLayout.offset 1130 =
    3035 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t1130\t{now}"
      handle.flush
capture_cert in
theorem return_offset_1427 : FieldSelectiveLayout.offset 1427 =
    4037 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t1427\t{now}"
      handle.flush
capture_cert in
theorem return_offset_1743 : FieldSelectiveLayout.offset 1743 =
    5058 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t1743\t{now}"
      handle.flush
capture_cert in
theorem return_offset_2014 : FieldSelectiveLayout.offset 2014 =
    5944 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t2014\t{now}"
      handle.flush
capture_cert in
theorem return_offset_2028 : FieldSelectiveLayout.offset 2028 =
    5988 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t2028\t{now}"
      handle.flush
capture_cert in
theorem return_offset_2050 : FieldSelectiveLayout.offset 2050 =
    6055 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t2050\t{now}"
      handle.flush
capture_cert in
theorem return_offset_4041 : FieldSelectiveLayout.offset 4041 =
    8091 := by
  rw [return_offset_fast]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"return-offset-64\t4041\t{now}"
      handle.flush
def rank_0_0 : Fin (1 + FieldReturns.writeCount syntax_0) :=
  ⟨0, by decide +kernel⟩
def rank_1_0 : Fin (1 + FieldReturns.writeCount syntax_1) :=
  ⟨0, by decide +kernel⟩
def rank_2_0 : Fin (1 + FieldReturns.writeCount syntax_2) :=
  ⟨0, by decide +kernel⟩
def rank_216_0 : Fin (1 + FieldReturns.writeCount syntax_216) :=
  ⟨0, by decide +kernel⟩
def rank_278_3 : Fin (1 + FieldReturns.writeCount syntax_278) :=
  ⟨3, by decide +kernel⟩
def rank_496_5 : Fin (1 + FieldReturns.writeCount syntax_496) :=
  ⟨5, by decide +kernel⟩
def rank_713_0 : Fin (1 + FieldReturns.writeCount syntax_713) :=
  ⟨0, by decide +kernel⟩
def rank_793_0 : Fin (1 + FieldReturns.writeCount syntax_793) :=
  ⟨0, by decide +kernel⟩
def rank_957_0 : Fin (1 + FieldReturns.writeCount syntax_957) :=
  ⟨0, by decide +kernel⟩
def rank_1130_0 : Fin (1 + FieldReturns.writeCount syntax_1130) :=
  ⟨0, by decide +kernel⟩
def rank_1427_9 : Fin (1 + FieldReturns.writeCount syntax_1427) :=
  ⟨9, by decide +kernel⟩
def rank_1743_0 : Fin (1 + FieldReturns.writeCount syntax_1743) :=
  ⟨0, by decide +kernel⟩
def rank_2014_10 : Fin (1 + FieldReturns.writeCount syntax_2014) :=
  ⟨10, by decide +kernel⟩
def rank_2014_13 : Fin (1 + FieldReturns.writeCount syntax_2014) :=
  ⟨13, by decide +kernel⟩
def rank_2028_10 : Fin (1 + FieldReturns.writeCount syntax_2028) :=
  ⟨10, by decide +kernel⟩
def rank_2028_13 : Fin (1 + FieldReturns.writeCount syntax_2028) :=
  ⟨13, by decide +kernel⟩
def rank_2050_15 : Fin (1 + FieldReturns.writeCount syntax_2050) :=
  ⟨15, by decide +kernel⟩
def rank_4041_0 : Fin (1 + FieldReturns.writeCount syntax_4041) :=
  ⟨0, by decide +kernel⟩
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"ranks-64\t0\t{now}"
      handle.flush
capture_cert in
theorem find_1_1 :
    FieldReturns.findTarget syntax_1 slot_1 = some rank_1_0 := by rfl
capture_cert in
theorem find_2_2 :
    FieldReturns.findTarget syntax_2 slot_2 = some rank_2_0 := by rfl
capture_cert in
theorem find_216_296 :
    FieldReturns.findTarget syntax_216 slot_296 = some rank_216_0 := by rfl
capture_cert in
theorem find_278_395 :
    FieldReturns.findTarget syntax_278 slot_395 = some rank_278_3 := by rfl
capture_cert in
theorem find_713_18791 :
    FieldReturns.findTarget syntax_713 slot_18791 = some rank_713_0 := by rfl
capture_cert in
theorem find_957_26644 :
    FieldReturns.findTarget syntax_957 slot_26644 = some rank_957_0 := by rfl
capture_cert in
theorem find_2014_68997 :
    FieldReturns.findTarget syntax_2014 slot_68997 = some rank_2014_10 := by rfl
capture_cert in
theorem find_2014_69005 :
    FieldReturns.findTarget syntax_2014 slot_69005 = some rank_2014_13 := by rfl
capture_cert in
theorem find_2028_69424 :
    FieldReturns.findTarget syntax_2028 slot_69424 = some rank_2028_10 := by rfl
capture_cert in
theorem find_2028_69432 :
    FieldReturns.findTarget syntax_2028 slot_69432 = some rank_2028_13 := by rfl
capture_cert in
theorem target_0_0 :
    FieldReturns.targetAt syntax_0 rank_0_0 = slot_0 := by rfl
capture_cert in
theorem target_496_5 :
    FieldReturns.targetAt syntax_496 rank_496_5 = slot_9130 := by rfl
capture_cert in
theorem target_793_0 :
    FieldReturns.targetAt syntax_793 rank_793_0 = slot_21733 := by rfl
capture_cert in
theorem target_1130_0 :
    FieldReturns.targetAt syntax_1130 rank_1130_0 = slot_32722 := by rfl
capture_cert in
theorem target_1427_9 :
    FieldReturns.targetAt syntax_1427 rank_1427_9 = slot_45680 := by rfl
capture_cert in
theorem target_1743_0 :
    FieldReturns.targetAt syntax_1743 rank_1743_0 = slot_58243 := by rfl
capture_cert in
theorem target_2050_15 :
    FieldReturns.targetAt syntax_2050 rank_2050_15 = slot_70386 := by rfl
capture_cert in
theorem target_4041_0 :
    FieldReturns.targetAt syntax_4041 rank_4041_0 = slot_106667 := by rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"targets-64\t0\t{now}"
      handle.flush
capture_cert in
theorem main_address_0_0 :
    mainIndex 0 0 = 0 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_0_1 :
    mainIndex 0 1 = 2 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_0_2 :
    mainIndex 0 2 = 3 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_0_3 :
    mainIndex 0 3 = 4 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_0_4 :
    mainIndex 0 4 = 5 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_6_0 :
    mainIndex 6 0 = 31 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_6_1 :
    mainIndex 6 1 = 32 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_6_2 :
    mainIndex 6 2 = 33 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_6_3 :
    mainIndex 6 3 = 34 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_6_4 :
    mainIndex 6 4 = 35 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_296_0 :
    mainIndex 296 0 = 1481 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_296_1 :
    mainIndex 296 1 = 1482 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_296_2 :
    mainIndex 296 2 = 1483 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_296_3 :
    mainIndex 296 3 = 1484 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_296_4 :
    mainIndex 296 4 = 1485 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_298_0 :
    mainIndex 298 0 = 1491 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t1491\t{now}"
      handle.flush
capture_cert in
theorem main_address_298_1 :
    mainIndex 298 1 = 1492 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_298_2 :
    mainIndex 298 2 = 1493 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_298_3 :
    mainIndex 298 3 = 1494 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_298_4 :
    mainIndex 298 4 = 1495 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_376_0 :
    mainIndex 376 0 = 1881 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_376_1 :
    mainIndex 376 1 = 1882 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_376_2 :
    mainIndex 376 2 = 1883 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_376_3 :
    mainIndex 376 3 = 1884 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_376_4 :
    mainIndex 376 4 = 1885 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_377_0 :
    mainIndex 377 0 = 1886 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_377_1 :
    mainIndex 377 1 = 1887 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_377_2 :
    mainIndex 377 2 = 1888 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_377_3 :
    mainIndex 377 3 = 1889 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_377_4 :
    mainIndex 377 4 = 1890 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_396_0 :
    mainIndex 396 0 = 1981 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_396_1 :
    mainIndex 396 1 = 1982 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t1982\t{now}"
      handle.flush
capture_cert in
theorem main_address_396_2 :
    mainIndex 396 2 = 1983 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_396_3 :
    mainIndex 396 3 = 1984 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_396_4 :
    mainIndex 396 4 = 1985 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_9130_2 :
    mainIndex 9130 2 = 45653 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_13335_2 :
    mainIndex 13335 2 = 66678 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_13336_2 :
    mainIndex 13336 2 = 66683 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_21733_1 :
    mainIndex 21733 1 = 108667 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_26673_1 :
    mainIndex 26673 1 = 133367 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_32722_0 :
    mainIndex 32722 0 = 163611 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_40009_0 :
    mainIndex 40009 0 = 200046 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_40010_0 :
    mainIndex 40010 0 = 200051 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_45680_3 :
    mainIndex 45680 3 = 228404 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_53345_4 :
    mainIndex 53345 4 = 266730 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_53346_4 :
    mainIndex 53346 4 = 266735 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_58243_2 :
    mainIndex 58243 2 = 291218 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_66682_2 :
    mainIndex 66682 2 = 333413 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t333413\t{now}"
      handle.flush
capture_cert in
theorem main_address_66683_2 :
    mainIndex 66683 2 = 333418 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69010_3 :
    mainIndex 69010 3 = 345054 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69010_4 :
    mainIndex 69010 4 = 345055 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69136_3 :
    mainIndex 69136 3 = 345684 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69150_4 :
    mainIndex 69150 4 = 345755 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69155_3 :
    mainIndex 69155 3 = 345779 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69155_4 :
    mainIndex 69155 4 = 345780 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69437_3 :
    mainIndex 69437 3 = 347189 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69437_4 :
    mainIndex 69437 4 = 347190 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69688_3 :
    mainIndex 69688 3 = 348444 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69702_4 :
    mainIndex 69702 4 = 348515 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69707_3 :
    mainIndex 69707 3 = 348539 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69707_4 :
    mainIndex 69707 4 = 348540 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69908_3 :
    mainIndex 69908 3 = 349544 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69934_4 :
    mainIndex 69934 4 = 349675 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_69939_3 :
    mainIndex 69939 3 = 349699 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t349699\t{now}"
      handle.flush
capture_cert in
theorem main_address_69939_4 :
    mainIndex 69939 4 = 349700 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70376_3 :
    mainIndex 70376 3 = 351884 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70386_1 :
    mainIndex 70386 1 = 351932 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70396_4 :
    mainIndex 70396 4 = 351985 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70401_3 :
    mainIndex 70401 3 = 352009 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70401_4 :
    mainIndex 70401 4 = 352010 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70601_3 :
    mainIndex 70601 3 = 353009 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70621_4 :
    mainIndex 70621 4 = 353110 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70626_3 :
    mainIndex 70626 3 = 353134 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70626_4 :
    mainIndex 70626 4 = 353135 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70806_3 :
    mainIndex 70806 3 = 354034 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70820_4 :
    mainIndex 70820 4 = 354105 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70825_3 :
    mainIndex 70825 3 = 354129 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_70825_4 :
    mainIndex 70825 4 = 354130 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_80020_1 :
    mainIndex 80020 1 = 400102 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_93342_0 :
    mainIndex 93342 0 = 466711 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t466711\t{now}"
      handle.flush
capture_cert in
theorem main_address_93355_0 :
    mainIndex 93355 0 = 466776 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_93357_0 :
    mainIndex 93357 0 = 466786 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_106666_4 :
    mainIndex 106666 4 = 533335 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
capture_cert in
theorem main_address_106667_4 :
    mainIndex 106667 4 = 533340 := by
  unfold mainIndex
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"main-address-64\t533340\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"before-bounce-64\t0\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_0_0_0 :
    bounceIndex 0 syntax_0 syntax_eq_0 rank_0_0 0 =
      533342 := by
  apply Fin.ext
  change 533341 + (returnIndex 0 syntax_0 syntax_eq_0
    rank_0_0 0).val = 533342
  rw [returnIndex_val, return_offset_0]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533342\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1_0_0 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 0 =
      533347 := by
  apply Fin.ext
  change 533341 + (returnIndex 1 syntax_1 syntax_eq_1
    rank_1_0 0).val = 533347
  rw [returnIndex_val, return_offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533347\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1_0_1 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 1 =
      533348 := by
  apply Fin.ext
  change 533341 + (returnIndex 1 syntax_1 syntax_eq_1
    rank_1_0 1).val = 533348
  rw [returnIndex_val, return_offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533348\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1_0_2 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 2 =
      533349 := by
  apply Fin.ext
  change 533341 + (returnIndex 1 syntax_1 syntax_eq_1
    rank_1_0 2).val = 533349
  rw [returnIndex_val, return_offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533349\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1_0_3 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 3 =
      533350 := by
  apply Fin.ext
  change 533341 + (returnIndex 1 syntax_1 syntax_eq_1
    rank_1_0 3).val = 533350
  rw [returnIndex_val, return_offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533350\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1_0_4 :
    bounceIndex 1 syntax_1 syntax_eq_1 rank_1_0 4 =
      533351 := by
  apply Fin.ext
  change 533341 + (returnIndex 1 syntax_1 syntax_eq_1
    rank_1_0 4).val = 533351
  rw [returnIndex_val, return_offset_1]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533351\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2_0_0 :
    bounceIndex 2 syntax_2 syntax_eq_2 rank_2_0 0 =
      533352 := by
  apply Fin.ext
  change 533341 + (returnIndex 2 syntax_2 syntax_eq_2
    rank_2_0 0).val = 533352
  rw [returnIndex_val, return_offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533352\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2_0_1 :
    bounceIndex 2 syntax_2 syntax_eq_2 rank_2_0 1 =
      533353 := by
  apply Fin.ext
  change 533341 + (returnIndex 2 syntax_2 syntax_eq_2
    rank_2_0 1).val = 533353
  rw [returnIndex_val, return_offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533353\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2_0_2 :
    bounceIndex 2 syntax_2 syntax_eq_2 rank_2_0 2 =
      533354 := by
  apply Fin.ext
  change 533341 + (returnIndex 2 syntax_2 syntax_eq_2
    rank_2_0 2).val = 533354
  rw [returnIndex_val, return_offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533354\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2_0_3 :
    bounceIndex 2 syntax_2 syntax_eq_2 rank_2_0 3 =
      533355 := by
  apply Fin.ext
  change 533341 + (returnIndex 2 syntax_2 syntax_eq_2
    rank_2_0 3).val = 533355
  rw [returnIndex_val, return_offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533355\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2_0_4 :
    bounceIndex 2 syntax_2 syntax_eq_2 rank_2_0 4 =
      533356 := by
  apply Fin.ext
  change 533341 + (returnIndex 2 syntax_2 syntax_eq_2
    rank_2_0 4).val = 533356
  rw [returnIndex_val, return_offset_2]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t533356\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_216_0_0 :
    bounceIndex 216 syntax_216 syntax_eq_216 rank_216_0 0 =
      534422 := by
  apply Fin.ext
  change 533341 + (returnIndex 216 syntax_216 syntax_eq_216
    rank_216_0 0).val = 534422
  rw [returnIndex_val, return_offset_216]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534422\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_278_3_0 :
    bounceIndex 278 syntax_278 syntax_eq_278 rank_278_3 0 =
      534747 := by
  apply Fin.ext
  change 533341 + (returnIndex 278 syntax_278 syntax_eq_278
    rank_278_3 0).val = 534747
  rw [returnIndex_val, return_offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534747\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_278_3_1 :
    bounceIndex 278 syntax_278 syntax_eq_278 rank_278_3 1 =
      534748 := by
  apply Fin.ext
  change 533341 + (returnIndex 278 syntax_278 syntax_eq_278
    rank_278_3 1).val = 534748
  rw [returnIndex_val, return_offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534748\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_278_3_2 :
    bounceIndex 278 syntax_278 syntax_eq_278 rank_278_3 2 =
      534749 := by
  apply Fin.ext
  change 533341 + (returnIndex 278 syntax_278 syntax_eq_278
    rank_278_3 2).val = 534749
  rw [returnIndex_val, return_offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534749\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_278_3_3 :
    bounceIndex 278 syntax_278 syntax_eq_278 rank_278_3 3 =
      534750 := by
  apply Fin.ext
  change 533341 + (returnIndex 278 syntax_278 syntax_eq_278
    rank_278_3 3).val = 534750
  rw [returnIndex_val, return_offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534750\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_278_3_4 :
    bounceIndex 278 syntax_278 syntax_eq_278 rank_278_3 4 =
      534751 := by
  apply Fin.ext
  change 533341 + (returnIndex 278 syntax_278 syntax_eq_278
    rank_278_3 4).val = 534751
  rw [returnIndex_val, return_offset_278]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t534751\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_496_5_2 :
    bounceIndex 496 syntax_496 syntax_eq_496 rank_496_5 2 =
      538399 := by
  apply Fin.ext
  change 533341 + (returnIndex 496 syntax_496 syntax_eq_496
    rank_496_5 2).val = 538399
  rw [returnIndex_val, return_offset_496]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t538399\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_713_0_1 :
    bounceIndex 713 syntax_713 syntax_eq_713 rank_713_0 1 =
      542233 := by
  apply Fin.ext
  change 533341 + (returnIndex 713 syntax_713 syntax_eq_713
    rank_713_0 1).val = 542233
  rw [returnIndex_val, return_offset_713]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t542233\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_793_0_1 :
    bounceIndex 793 syntax_793 syntax_eq_793 rank_793_0 1 =
      543458 := by
  apply Fin.ext
  change 533341 + (returnIndex 793 syntax_793 syntax_eq_793
    rank_793_0 1).val = 543458
  rw [returnIndex_val, return_offset_793]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t543458\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_957_0_1 :
    bounceIndex 957 syntax_957 syntax_eq_957 rank_957_0 1 =
      545853 := by
  apply Fin.ext
  change 533341 + (returnIndex 957 syntax_957 syntax_eq_957
    rank_957_0 1).val = 545853
  rw [returnIndex_val, return_offset_957]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t545853\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1130_0_0 :
    bounceIndex 1130 syntax_1130 syntax_eq_1130 rank_1130_0 0 =
      548517 := by
  apply Fin.ext
  change 533341 + (returnIndex 1130 syntax_1130 syntax_eq_1130
    rank_1130_0 0).val = 548517
  rw [returnIndex_val, return_offset_1130]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t548517\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1427_9_3 :
    bounceIndex 1427 syntax_1427 syntax_eq_1427 rank_1427_9 3 =
      553575 := by
  apply Fin.ext
  change 533341 + (returnIndex 1427 syntax_1427 syntax_eq_1427
    rank_1427_9 3).val = 553575
  rw [returnIndex_val, return_offset_1427]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t553575\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_1743_0_2 :
    bounceIndex 1743 syntax_1743 syntax_eq_1743 rank_1743_0 2 =
      558634 := by
  apply Fin.ext
  change 533341 + (returnIndex 1743 syntax_1743 syntax_eq_1743
    rank_1743_0 2).val = 558634
  rw [returnIndex_val, return_offset_1743]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t558634\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2014_10_3 :
    bounceIndex 2014 syntax_2014 syntax_eq_2014 rank_2014_10 3 =
      563115 := by
  apply Fin.ext
  change 533341 + (returnIndex 2014 syntax_2014 syntax_eq_2014
    rank_2014_10 3).val = 563115
  rw [returnIndex_val, return_offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t563115\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2014_13_4 :
    bounceIndex 2014 syntax_2014 syntax_eq_2014 rank_2014_13 4 =
      563131 := by
  apply Fin.ext
  change 533341 + (returnIndex 2014 syntax_2014 syntax_eq_2014
    rank_2014_13 4).val = 563131
  rw [returnIndex_val, return_offset_2014]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t563131\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2028_10_3 :
    bounceIndex 2028 syntax_2028 syntax_eq_2028 rank_2028_10 3 =
      563335 := by
  apply Fin.ext
  change 533341 + (returnIndex 2028 syntax_2028 syntax_eq_2028
    rank_2028_10 3).val = 563335
  rw [returnIndex_val, return_offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t563335\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2028_13_4 :
    bounceIndex 2028 syntax_2028 syntax_eq_2028 rank_2028_13 4 =
      563351 := by
  apply Fin.ext
  change 533341 + (returnIndex 2028 syntax_2028 syntax_eq_2028
    rank_2028_13 4).val = 563351
  rw [returnIndex_val, return_offset_2028]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t563351\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_2050_15_1 :
    bounceIndex 2050 syntax_2050 syntax_eq_2050 rank_2050_15 1 =
      563693 := by
  apply Fin.ext
  change 533341 + (returnIndex 2050 syntax_2050 syntax_eq_2050
    rank_2050_15 1).val = 563693
  rw [returnIndex_val, return_offset_2050]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t563693\t{now}"
      handle.flush
capture_cert in
theorem bounce_address_4041_0_4 :
    bounceIndex 4041 syntax_4041 syntax_eq_4041 rank_4041_0 4 =
      573801 := by
  apply Fin.ext
  change 533341 + (returnIndex 4041 syntax_4041 syntax_eq_4041
    rank_4041_0 4).val = 573801
  rw [returnIndex_val, return_offset_4041]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"bounce-address-64\t573801\t{now}"
      handle.flush
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"before-aux-64\t0\t{now}"
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
theorem table_read_0_0_1 :
    nodeTable_0.read false 1 = 1 := by rfl
capture_cert in
theorem aux_0_0_1 :
    LazyGraph.trAux FieldPacked.getter false 0 1 =
      ((some (1 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    0 1 nodeTable_0 numeric_node_0,
    table_read_0_0_1, entry_1]
capture_cert in
theorem table_read_0_0_2 :
    nodeTable_0.read false 2 = 1 := by rfl
capture_cert in
theorem aux_0_0_2 :
    LazyGraph.trAux FieldPacked.getter false 0 2 =
      ((some (1 : Fin 106668), (2 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    0 2 nodeTable_0 numeric_node_0,
    table_read_0_0_2, entry_1]
capture_cert in
theorem table_read_0_0_3 :
    nodeTable_0.read false 3 = 1 := by rfl
capture_cert in
theorem aux_0_0_3 :
    LazyGraph.trAux FieldPacked.getter false 0 3 =
      ((some (1 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    0 3 nodeTable_0 numeric_node_0,
    table_read_0_0_3, entry_1]
capture_cert in
theorem table_read_0_0_4 :
    nodeTable_0.read false 4 = 1 := by rfl
capture_cert in
theorem aux_0_0_4 :
    LazyGraph.trAux FieldPacked.getter false 0 4 =
      ((some (1 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    0 4 nodeTable_0 numeric_node_0,
    table_read_0_0_4, entry_1]
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
capture_cert in
theorem table_read_0_1_1 :
    nodeTable_0.read true 1 = 1 := by rfl
capture_cert in
theorem aux_0_1_1 :
    LazyGraph.trAux FieldPacked.getter true 0 1 =
      ((some (1 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    0 1 nodeTable_0 numeric_node_0,
    table_read_0_1_1, entry_1]
capture_cert in
theorem table_read_0_1_2 :
    nodeTable_0.read true 2 = 1 := by rfl
capture_cert in
theorem aux_0_1_2 :
    LazyGraph.trAux FieldPacked.getter true 0 2 =
      ((some (1 : Fin 106668), (2 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    0 2 nodeTable_0 numeric_node_0,
    table_read_0_1_2, entry_1]
capture_cert in
theorem table_read_0_1_3 :
    nodeTable_0.read true 3 = 1 := by rfl
capture_cert in
theorem aux_0_1_3 :
    LazyGraph.trAux FieldPacked.getter true 0 3 =
      ((some (1 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    0 3 nodeTable_0 numeric_node_0,
    table_read_0_1_3, entry_1]
capture_cert in
theorem table_read_0_1_4 :
    nodeTable_0.read true 4 = 1 := by rfl
capture_cert in
theorem aux_0_1_4 :
    LazyGraph.trAux FieldPacked.getter true 0 4 =
      ((some (1 : Fin 106668), (4 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    0 4 nodeTable_0 numeric_node_0,
    table_read_0_1_4, entry_1]
capture_cert in
theorem table_read_4_0_0 :
    nodeTable_4.read false 0 = 2 := by rfl
capture_cert in
theorem aux_4_0_0 :
    LazyGraph.trAux FieldPacked.getter false 4 0 =
      ((some (2 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    4 0 nodeTable_4 numeric_node_4,
    table_read_4_0_0, entry_2]
capture_cert in
theorem table_read_4_0_1 :
    nodeTable_4.read false 1 = 2 := by rfl
capture_cert in
theorem aux_4_0_1 :
    LazyGraph.trAux FieldPacked.getter false 4 1 =
      ((some (2 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    4 1 nodeTable_4 numeric_node_4,
    table_read_4_0_1, entry_2]
capture_cert in
theorem table_read_4_0_2 :
    nodeTable_4.read false 2 = 2 := by rfl
capture_cert in
theorem aux_4_0_2 :
    LazyGraph.trAux FieldPacked.getter false 4 2 =
      ((some (2 : Fin 106668), (2 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    4 2 nodeTable_4 numeric_node_4,
    table_read_4_0_2, entry_2]
capture_cert in
theorem table_read_4_0_3 :
    nodeTable_4.read false 3 = 2 := by rfl
capture_cert in
theorem aux_4_0_3 :
    LazyGraph.trAux FieldPacked.getter false 4 3 =
      ((some (2 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    4 3 nodeTable_4 numeric_node_4,
    table_read_4_0_3, entry_2]
capture_cert in
theorem table_read_4_0_4 :
    nodeTable_4.read false 4 = 2 := by rfl
capture_cert in
theorem aux_4_0_4 :
    LazyGraph.trAux FieldPacked.getter false 4 4 =
      ((some (2 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    4 4 nodeTable_4 numeric_node_4,
    table_read_4_0_4, entry_2]
capture_cert in
theorem table_read_4_1_0 :
    nodeTable_4.read true 0 = 2 := by rfl
capture_cert in
theorem aux_4_1_0 :
    LazyGraph.trAux FieldPacked.getter true 4 0 =
      ((some (2 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    4 0 nodeTable_4 numeric_node_4,
    table_read_4_1_0, entry_2]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t45\t{now}"
      handle.flush
capture_cert in
theorem table_read_4_1_1 :
    nodeTable_4.read true 1 = 2 := by rfl
capture_cert in
theorem aux_4_1_1 :
    LazyGraph.trAux FieldPacked.getter true 4 1 =
      ((some (2 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    4 1 nodeTable_4 numeric_node_4,
    table_read_4_1_1, entry_2]
capture_cert in
theorem table_read_4_1_2 :
    nodeTable_4.read true 2 = 2 := by rfl
capture_cert in
theorem aux_4_1_2 :
    LazyGraph.trAux FieldPacked.getter true 4 2 =
      ((some (2 : Fin 106668), (2 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    4 2 nodeTable_4 numeric_node_4,
    table_read_4_1_2, entry_2]
capture_cert in
theorem table_read_4_1_3 :
    nodeTable_4.read true 3 = 2 := by rfl
capture_cert in
theorem aux_4_1_3 :
    LazyGraph.trAux FieldPacked.getter true 4 3 =
      ((some (2 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    4 3 nodeTable_4 numeric_node_4,
    table_read_4_1_3, entry_2]
capture_cert in
theorem table_read_4_1_4 :
    nodeTable_4.read true 4 = 2 := by rfl
capture_cert in
theorem aux_4_1_4 :
    LazyGraph.trAux FieldPacked.getter true 4 4 =
      ((some (2 : Fin 106668), (4 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    4 4 nodeTable_4 numeric_node_4,
    table_read_4_1_4, entry_2]
capture_cert in
theorem table_read_6_0_0 :
    nodeTable_6.read false 0 = true := by rfl
capture_cert in
theorem aux_6_0_0 :
    LazyGraph.trAux FieldPacked.getter false 6 0 =
      ((some (2 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    6 4 5 0 nodeTable_6 numeric_node_6,
    table_read_6_0_0]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_0_0
capture_cert in
theorem table_read_6_0_1 :
    nodeTable_6.read false 1 = true := by rfl
capture_cert in
theorem aux_6_0_1 :
    LazyGraph.trAux FieldPacked.getter false 6 1 =
      ((some (2 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    6 4 5 1 nodeTable_6 numeric_node_6,
    table_read_6_0_1]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_0_1
capture_cert in
theorem table_read_6_0_2 :
    nodeTable_6.read false 2 = true := by rfl
capture_cert in
theorem aux_6_0_2 :
    LazyGraph.trAux FieldPacked.getter false 6 2 =
      ((some (2 : Fin 106668), (2 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    6 4 5 2 nodeTable_6 numeric_node_6,
    table_read_6_0_2]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_0_2
capture_cert in
theorem table_read_6_0_3 :
    nodeTable_6.read false 3 = true := by rfl
capture_cert in
theorem aux_6_0_3 :
    LazyGraph.trAux FieldPacked.getter false 6 3 =
      ((some (2 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    6 4 5 3 nodeTable_6 numeric_node_6,
    table_read_6_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_0_3
capture_cert in
theorem table_read_6_0_4 :
    nodeTable_6.read false 4 = true := by rfl
capture_cert in
theorem aux_6_0_4 :
    LazyGraph.trAux FieldPacked.getter false 6 4 =
      ((some (2 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    6 4 5 4 nodeTable_6 numeric_node_6,
    table_read_6_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_0_4
capture_cert in
theorem table_read_6_1_0 :
    nodeTable_6.read true 0 = true := by rfl
capture_cert in
theorem aux_6_1_0 :
    LazyGraph.trAux FieldPacked.getter true 6 0 =
      ((some (2 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    6 4 5 0 nodeTable_6 numeric_node_6,
    table_read_6_1_0]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_1_0
capture_cert in
theorem table_read_6_1_1 :
    nodeTable_6.read true 1 = true := by rfl
capture_cert in
theorem aux_6_1_1 :
    LazyGraph.trAux FieldPacked.getter true 6 1 =
      ((some (2 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    6 4 5 1 nodeTable_6 numeric_node_6,
    table_read_6_1_1]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_1_1
capture_cert in
theorem table_read_6_1_2 :
    nodeTable_6.read true 2 = true := by rfl
capture_cert in
theorem aux_6_1_2 :
    LazyGraph.trAux FieldPacked.getter true 6 2 =
      ((some (2 : Fin 106668), (2 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    6 4 5 2 nodeTable_6 numeric_node_6,
    table_read_6_1_2]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_1_2
capture_cert in
theorem table_read_6_1_3 :
    nodeTable_6.read true 3 = true := by rfl
capture_cert in
theorem aux_6_1_3 :
    LazyGraph.trAux FieldPacked.getter true 6 3 =
      ((some (2 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    6 4 5 3 nodeTable_6 numeric_node_6,
    table_read_6_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_1_3
capture_cert in
theorem table_read_6_1_4 :
    nodeTable_6.read true 4 = true := by rfl
capture_cert in
theorem aux_6_1_4 :
    LazyGraph.trAux FieldPacked.getter true 6 4 =
      ((some (2 : Fin 106668), (4 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    6 4 5 4 nodeTable_6 numeric_node_6,
    table_read_6_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_4_1_4
capture_cert in
theorem aux_296_0_0 :
    LazyGraph.trAux FieldPacked.getter false 296 0 =
      ((none, (0 : Fin 5)), .write false) := by
  exact LazyGraph.trAux_halt FieldPacked.getter false
    296 0 numeric_node_296
capture_cert in
theorem aux_296_0_1 :
    LazyGraph.trAux FieldPacked.getter false 296 1 =
      ((none, (1 : Fin 5)), .write false) := by
  exact LazyGraph.trAux_halt FieldPacked.getter false
    296 1 numeric_node_296
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t2961\t{now}"
      handle.flush
capture_cert in
theorem aux_296_0_2 :
    LazyGraph.trAux FieldPacked.getter false 296 2 =
      ((none, (2 : Fin 5)), .write false) := by
  exact LazyGraph.trAux_halt FieldPacked.getter false
    296 2 numeric_node_296
capture_cert in
theorem aux_296_0_3 :
    LazyGraph.trAux FieldPacked.getter false 296 3 =
      ((none, (3 : Fin 5)), .write false) := by
  exact LazyGraph.trAux_halt FieldPacked.getter false
    296 3 numeric_node_296
capture_cert in
theorem aux_296_0_4 :
    LazyGraph.trAux FieldPacked.getter false 296 4 =
      ((none, (4 : Fin 5)), .write false) := by
  exact LazyGraph.trAux_halt FieldPacked.getter false
    296 4 numeric_node_296
capture_cert in
theorem aux_296_1_0 :
    LazyGraph.trAux FieldPacked.getter true 296 0 =
      ((none, (0 : Fin 5)), .write true) := by
  exact LazyGraph.trAux_halt FieldPacked.getter true
    296 0 numeric_node_296
capture_cert in
theorem aux_296_1_1 :
    LazyGraph.trAux FieldPacked.getter true 296 1 =
      ((none, (1 : Fin 5)), .write true) := by
  exact LazyGraph.trAux_halt FieldPacked.getter true
    296 1 numeric_node_296
capture_cert in
theorem aux_296_1_2 :
    LazyGraph.trAux FieldPacked.getter true 296 2 =
      ((none, (2 : Fin 5)), .write true) := by
  exact LazyGraph.trAux_halt FieldPacked.getter true
    296 2 numeric_node_296
capture_cert in
theorem aux_296_1_3 :
    LazyGraph.trAux FieldPacked.getter true 296 3 =
      ((none, (3 : Fin 5)), .write true) := by
  exact LazyGraph.trAux_halt FieldPacked.getter true
    296 3 numeric_node_296
capture_cert in
theorem aux_296_1_4 :
    LazyGraph.trAux FieldPacked.getter true 296 4 =
      ((none, (4 : Fin 5)), .write true) := by
  exact LazyGraph.trAux_halt FieldPacked.getter true
    296 4 numeric_node_296
capture_cert in
theorem table_read_297_0_0 :
    nodeTable_297.read false 0 = 216 := by rfl
capture_cert in
theorem aux_297_0_0 :
    LazyGraph.trAux FieldPacked.getter false 297 0 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    297 0 nodeTable_297 numeric_node_297,
    table_read_297_0_0, entry_216]
capture_cert in
theorem table_read_297_1_0 :
    nodeTable_297.read true 0 = 216 := by rfl
capture_cert in
theorem aux_297_1_0 :
    LazyGraph.trAux FieldPacked.getter true 297 0 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    297 0 nodeTable_297 numeric_node_297,
    table_read_297_1_0, entry_216]
capture_cert in
theorem table_read_298_0_0 :
    nodeTable_298.read false 0 = 0 := by rfl
capture_cert in
theorem aux_298_0_0 :
    LazyGraph.trAux FieldPacked.getter false 298 0 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_load FieldPacked.getter false
    298 297 0 nodeTable_298 numeric_node_298,
    table_read_298_0_0]
  exact aux_297_0_0
capture_cert in
theorem table_read_298_0_1 :
    nodeTable_298.read false 1 = 0 := by rfl
capture_cert in
theorem aux_298_0_1 :
    LazyGraph.trAux FieldPacked.getter false 298 1 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_load FieldPacked.getter false
    298 297 1 nodeTable_298 numeric_node_298,
    table_read_298_0_1]
  exact aux_297_0_0
capture_cert in
theorem table_read_298_0_2 :
    nodeTable_298.read false 2 = 0 := by rfl
capture_cert in
theorem aux_298_0_2 :
    LazyGraph.trAux FieldPacked.getter false 298 2 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_load FieldPacked.getter false
    298 297 2 nodeTable_298 numeric_node_298,
    table_read_298_0_2]
  exact aux_297_0_0
capture_cert in
theorem table_read_298_0_3 :
    nodeTable_298.read false 3 = 0 := by rfl
capture_cert in
theorem aux_298_0_3 :
    LazyGraph.trAux FieldPacked.getter false 298 3 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_load FieldPacked.getter false
    298 297 3 nodeTable_298 numeric_node_298,
    table_read_298_0_3]
  exact aux_297_0_0
capture_cert in
theorem table_read_298_0_4 :
    nodeTable_298.read false 4 = 0 := by rfl
capture_cert in
theorem aux_298_0_4 :
    LazyGraph.trAux FieldPacked.getter false 298 4 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_load FieldPacked.getter false
    298 297 4 nodeTable_298 numeric_node_298,
    table_read_298_0_4]
  exact aux_297_0_0
capture_cert in
theorem table_read_298_1_0 :
    nodeTable_298.read true 0 = 0 := by rfl
capture_cert in
theorem aux_298_1_0 :
    LazyGraph.trAux FieldPacked.getter true 298 0 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_load FieldPacked.getter true
    298 297 0 nodeTable_298 numeric_node_298,
    table_read_298_1_0]
  exact aux_297_1_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t2985\t{now}"
      handle.flush
capture_cert in
theorem table_read_298_1_1 :
    nodeTable_298.read true 1 = 0 := by rfl
capture_cert in
theorem aux_298_1_1 :
    LazyGraph.trAux FieldPacked.getter true 298 1 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_load FieldPacked.getter true
    298 297 1 nodeTable_298 numeric_node_298,
    table_read_298_1_1]
  exact aux_297_1_0
capture_cert in
theorem table_read_298_1_2 :
    nodeTable_298.read true 2 = 0 := by rfl
capture_cert in
theorem aux_298_1_2 :
    LazyGraph.trAux FieldPacked.getter true 298 2 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_load FieldPacked.getter true
    298 297 2 nodeTable_298 numeric_node_298,
    table_read_298_1_2]
  exact aux_297_1_0
capture_cert in
theorem table_read_298_1_3 :
    nodeTable_298.read true 3 = 0 := by rfl
capture_cert in
theorem aux_298_1_3 :
    LazyGraph.trAux FieldPacked.getter true 298 3 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_load FieldPacked.getter true
    298 297 3 nodeTable_298 numeric_node_298,
    table_read_298_1_3]
  exact aux_297_1_0
capture_cert in
theorem table_read_298_1_4 :
    nodeTable_298.read true 4 = 0 := by rfl
capture_cert in
theorem aux_298_1_4 :
    LazyGraph.trAux FieldPacked.getter true 298 4 =
      ((some (296 : Fin 106668), (0 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_load FieldPacked.getter true
    298 297 4 nodeTable_298 numeric_node_298,
    table_read_298_1_4]
  exact aux_297_1_0
capture_cert in
theorem aux_377_0_0 :
    LazyGraph.trAux FieldPacked.getter false 377 0 =
      ((some (376 : Fin 106668), (0 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    377 376 0 .right numeric_node_377
capture_cert in
theorem aux_377_0_1 :
    LazyGraph.trAux FieldPacked.getter false 377 1 =
      ((some (376 : Fin 106668), (1 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    377 376 1 .right numeric_node_377
capture_cert in
theorem aux_377_0_2 :
    LazyGraph.trAux FieldPacked.getter false 377 2 =
      ((some (376 : Fin 106668), (2 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    377 376 2 .right numeric_node_377
capture_cert in
theorem aux_377_0_3 :
    LazyGraph.trAux FieldPacked.getter false 377 3 =
      ((some (376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    377 376 3 .right numeric_node_377
capture_cert in
theorem aux_377_0_4 :
    LazyGraph.trAux FieldPacked.getter false 377 4 =
      ((some (376 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    377 376 4 .right numeric_node_377
capture_cert in
theorem aux_377_1_0 :
    LazyGraph.trAux FieldPacked.getter true 377 0 =
      ((some (376 : Fin 106668), (0 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    377 376 0 .right numeric_node_377
capture_cert in
theorem aux_377_1_1 :
    LazyGraph.trAux FieldPacked.getter true 377 1 =
      ((some (376 : Fin 106668), (1 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    377 376 1 .right numeric_node_377
capture_cert in
theorem aux_377_1_2 :
    LazyGraph.trAux FieldPacked.getter true 377 2 =
      ((some (376 : Fin 106668), (2 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    377 376 2 .right numeric_node_377
capture_cert in
theorem aux_377_1_3 :
    LazyGraph.trAux FieldPacked.getter true 377 3 =
      ((some (376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    377 376 3 .right numeric_node_377
capture_cert in
theorem aux_377_1_4 :
    LazyGraph.trAux FieldPacked.getter true 377 4 =
      ((some (376 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    377 376 4 .right numeric_node_377
capture_cert in
theorem table_read_396_0_0 :
    nodeTable_396.read false 0 = false := by rfl
capture_cert in
theorem aux_396_0_0 :
    LazyGraph.trAux FieldPacked.getter false 396 0 =
      ((some (395 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    396 395 0 nodeTable_396 numeric_node_396,
    table_read_396_0_0]
capture_cert in
theorem table_read_396_0_1 :
    nodeTable_396.read false 1 = false := by rfl
capture_cert in
theorem aux_396_0_1 :
    LazyGraph.trAux FieldPacked.getter false 396 1 =
      ((some (395 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    396 395 1 nodeTable_396 numeric_node_396,
    table_read_396_0_1]
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t3961\t{now}"
      handle.flush
capture_cert in
theorem table_read_396_0_2 :
    nodeTable_396.read false 2 = false := by rfl
capture_cert in
theorem aux_396_0_2 :
    LazyGraph.trAux FieldPacked.getter false 396 2 =
      ((some (395 : Fin 106668), (2 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    396 395 2 nodeTable_396 numeric_node_396,
    table_read_396_0_2]
capture_cert in
theorem table_read_396_0_3 :
    nodeTable_396.read false 3 = false := by rfl
capture_cert in
theorem aux_396_0_3 :
    LazyGraph.trAux FieldPacked.getter false 396 3 =
      ((some (395 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    396 395 3 nodeTable_396 numeric_node_396,
    table_read_396_0_3]
capture_cert in
theorem table_read_396_0_4 :
    nodeTable_396.read false 4 = false := by rfl
capture_cert in
theorem aux_396_0_4 :
    LazyGraph.trAux FieldPacked.getter false 396 4 =
      ((some (395 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    396 395 4 nodeTable_396 numeric_node_396,
    table_read_396_0_4]
capture_cert in
theorem table_read_396_1_0 :
    nodeTable_396.read true 0 = false := by rfl
capture_cert in
theorem aux_396_1_0 :
    LazyGraph.trAux FieldPacked.getter true 396 0 =
      ((some (395 : Fin 106668), (0 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    396 395 0 nodeTable_396 numeric_node_396,
    table_read_396_1_0]
capture_cert in
theorem table_read_396_1_1 :
    nodeTable_396.read true 1 = false := by rfl
capture_cert in
theorem aux_396_1_1 :
    LazyGraph.trAux FieldPacked.getter true 396 1 =
      ((some (395 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    396 395 1 nodeTable_396 numeric_node_396,
    table_read_396_1_1]
capture_cert in
theorem table_read_396_1_2 :
    nodeTable_396.read true 2 = false := by rfl
capture_cert in
theorem aux_396_1_2 :
    LazyGraph.trAux FieldPacked.getter true 396 2 =
      ((some (395 : Fin 106668), (2 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    396 395 2 nodeTable_396 numeric_node_396,
    table_read_396_1_2]
capture_cert in
theorem table_read_396_1_3 :
    nodeTable_396.read true 3 = false := by rfl
capture_cert in
theorem aux_396_1_3 :
    LazyGraph.trAux FieldPacked.getter true 396 3 =
      ((some (395 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    396 395 3 nodeTable_396 numeric_node_396,
    table_read_396_1_3]
capture_cert in
theorem table_read_396_1_4 :
    nodeTable_396.read true 4 = false := by rfl
capture_cert in
theorem aux_396_1_4 :
    LazyGraph.trAux FieldPacked.getter true 396 4 =
      ((some (395 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    396 395 4 nodeTable_396 numeric_node_396,
    table_read_396_1_4]
capture_cert in
theorem aux_13336_0_2 :
    LazyGraph.trAux FieldPacked.getter false 13336 2 =
      ((some (13335 : Fin 106668), (2 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    13336 13335 2 .left numeric_node_13336
capture_cert in
theorem aux_13336_1_2 :
    LazyGraph.trAux FieldPacked.getter true 13336 2 =
      ((some (13335 : Fin 106668), (2 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    13336 13335 2 .left numeric_node_13336
capture_cert in
theorem table_read_26673_0_1 :
    nodeTable_26673.read false 1 = 957 := by rfl
capture_cert in
theorem aux_26673_0_1 :
    LazyGraph.trAux FieldPacked.getter false 26673 1 =
      ((some (26644 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    26673 1 nodeTable_26673 numeric_node_26673,
    table_read_26673_0_1, entry_957]
capture_cert in
theorem table_read_26673_1_1 :
    nodeTable_26673.read true 1 = 957 := by rfl
capture_cert in
theorem aux_26673_1_1 :
    LazyGraph.trAux FieldPacked.getter true 26673 1 =
      ((some (26644 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    26673 1 nodeTable_26673 numeric_node_26673,
    table_read_26673_1_1, entry_957]
capture_cert in
theorem aux_40010_0_0 :
    LazyGraph.trAux FieldPacked.getter false 40010 0 =
      ((some (40009 : Fin 106668), (0 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    40010 40009 0 .left numeric_node_40010
capture_cert in
theorem aux_40010_1_0 :
    LazyGraph.trAux FieldPacked.getter true 40010 0 =
      ((some (40009 : Fin 106668), (0 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    40010 40009 0 .left numeric_node_40010
capture_cert in
theorem aux_53346_0_4 :
    LazyGraph.trAux FieldPacked.getter false 53346 4 =
      ((some (53345 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    53346 53345 4 .right numeric_node_53346
capture_cert in
theorem aux_53346_1_4 :
    LazyGraph.trAux FieldPacked.getter true 53346 4 =
      ((some (53345 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    53346 53345 4 .right numeric_node_53346
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t533469\t{now}"
      handle.flush
capture_cert in
theorem aux_66683_0_2 :
    LazyGraph.trAux FieldPacked.getter false 66683 2 =
      ((some (66682 : Fin 106668), (2 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    66683 66682 2 .left numeric_node_66683
capture_cert in
theorem aux_66683_1_2 :
    LazyGraph.trAux FieldPacked.getter true 66683 2 =
      ((some (66682 : Fin 106668), (2 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    66683 66682 2 .left numeric_node_66683
capture_cert in
theorem table_read_68998_0_3 :
    nodeTable_68998.read false 3 = true := by rfl
capture_cert in
theorem aux_68998_0_3 :
    LazyGraph.trAux FieldPacked.getter false 68998 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    68998 68997 3 nodeTable_68998 numeric_node_68998,
    table_read_68998_0_3]
capture_cert in
theorem table_read_68998_1_3 :
    nodeTable_68998.read true 3 = true := by rfl
capture_cert in
theorem aux_68998_1_3 :
    LazyGraph.trAux FieldPacked.getter true 68998 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    68998 68997 3 nodeTable_68998 numeric_node_68998,
    table_read_68998_1_3]
capture_cert in
theorem table_read_69006_0_4 :
    nodeTable_69006.read false 4 = false := by rfl
capture_cert in
theorem aux_69006_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69006 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    69006 69005 4 nodeTable_69006 numeric_node_69006,
    table_read_69006_0_4]
capture_cert in
theorem table_read_69006_1_4 :
    nodeTable_69006.read true 4 = false := by rfl
capture_cert in
theorem aux_69006_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69006 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    69006 69005 4 nodeTable_69006 numeric_node_69006,
    table_read_69006_1_4]
capture_cert in
theorem table_read_69007_0_3 :
    nodeTable_69007.read false 3 = true := by rfl
capture_cert in
theorem aux_69007_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69007 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69007 68998 69006 3 nodeTable_69007 numeric_node_69007,
    table_read_69007_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_68998_0_3
capture_cert in
theorem table_read_69007_0_4 :
    nodeTable_69007.read false 4 = false := by rfl
capture_cert in
theorem aux_69007_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69007 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69007 68998 69006 4 nodeTable_69007 numeric_node_69007,
    table_read_69007_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69006_0_4
capture_cert in
theorem table_read_69007_1_3 :
    nodeTable_69007.read true 3 = true := by rfl
capture_cert in
theorem aux_69007_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69007 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69007 68998 69006 3 nodeTable_69007 numeric_node_69007,
    table_read_69007_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_68998_1_3
capture_cert in
theorem table_read_69007_1_4 :
    nodeTable_69007.read true 4 = false := by rfl
capture_cert in
theorem aux_69007_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69007 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69007 68998 69006 4 nodeTable_69007 numeric_node_69007,
    table_read_69007_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69006_1_4
capture_cert in
theorem table_read_69008_0_3 :
    nodeTable_69008.read false 3 = false := by rfl
capture_cert in
theorem aux_69008_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69008 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69008 68990 69007 3 nodeTable_69008 numeric_node_69008,
    table_read_69008_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69007_0_3
capture_cert in
theorem table_read_69008_0_4 :
    nodeTable_69008.read false 4 = false := by rfl
capture_cert in
theorem aux_69008_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69008 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69008 68990 69007 4 nodeTable_69008 numeric_node_69008,
    table_read_69008_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69007_0_4
capture_cert in
theorem table_read_69008_1_3 :
    nodeTable_69008.read true 3 = false := by rfl
capture_cert in
theorem aux_69008_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69008 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69008 68990 69007 3 nodeTable_69008 numeric_node_69008,
    table_read_69008_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69007_1_3
capture_cert in
theorem table_read_69008_1_4 :
    nodeTable_69008.read true 4 = false := by rfl
capture_cert in
theorem aux_69008_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69008 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69008 68990 69007 4 nodeTable_69008 numeric_node_69008,
    table_read_69008_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69007_1_4
capture_cert in
theorem table_read_69009_0_3 :
    nodeTable_69009.read false 3 = false := by rfl
capture_cert in
theorem aux_69009_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69009 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69009 68982 69008 3 nodeTable_69009 numeric_node_69009,
    table_read_69009_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69008_0_3
capture_cert in
theorem table_read_69009_0_4 :
    nodeTable_69009.read false 4 = false := by rfl
capture_cert in
theorem aux_69009_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69009 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69009 68982 69008 4 nodeTable_69009 numeric_node_69009,
    table_read_69009_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69008_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t690094\t{now}"
      handle.flush
capture_cert in
theorem table_read_69009_1_3 :
    nodeTable_69009.read true 3 = false := by rfl
capture_cert in
theorem aux_69009_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69009 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69009 68982 69008 3 nodeTable_69009 numeric_node_69009,
    table_read_69009_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69008_1_3
capture_cert in
theorem table_read_69009_1_4 :
    nodeTable_69009.read true 4 = false := by rfl
capture_cert in
theorem aux_69009_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69009 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69009 68982 69008 4 nodeTable_69009 numeric_node_69009,
    table_read_69009_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69008_1_4
capture_cert in
theorem table_read_69010_0_3 :
    nodeTable_69010.read false 3 = false := by rfl
capture_cert in
theorem aux_69010_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69010 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69010 68974 69009 3 nodeTable_69010 numeric_node_69010,
    table_read_69010_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69009_0_3
capture_cert in
theorem table_read_69010_0_4 :
    nodeTable_69010.read false 4 = false := by rfl
capture_cert in
theorem aux_69010_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69010 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69010 68974 69009 4 nodeTable_69010 numeric_node_69010,
    table_read_69010_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69009_0_4
capture_cert in
theorem table_read_69010_1_3 :
    nodeTable_69010.read true 3 = false := by rfl
capture_cert in
theorem aux_69010_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69010 3 =
      ((some (68997 : Fin 106668), (3 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69010 68974 69009 3 nodeTable_69010 numeric_node_69010,
    table_read_69010_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69009_1_3
capture_cert in
theorem table_read_69010_1_4 :
    nodeTable_69010.read true 4 = false := by rfl
capture_cert in
theorem aux_69010_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69010 4 =
      ((some (69005 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69010 68974 69009 4 nodeTable_69010 numeric_node_69010,
    table_read_69010_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69009_1_4
capture_cert in
theorem aux_69137_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69137 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69137 69136 3 .right numeric_node_69137
capture_cert in
theorem aux_69137_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69137 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69137 69136 3 .right numeric_node_69137
capture_cert in
theorem aux_69151_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69151 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69151 69150 4 .right numeric_node_69151
capture_cert in
theorem aux_69151_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69151 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69151 69150 4 .right numeric_node_69151
capture_cert in
theorem table_read_69152_0_3 :
    nodeTable_69152.read false 3 = true := by rfl
capture_cert in
theorem aux_69152_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69152 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69152 69137 69151 3 nodeTable_69152 numeric_node_69152,
    table_read_69152_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69137_0_3
capture_cert in
theorem table_read_69152_0_4 :
    nodeTable_69152.read false 4 = false := by rfl
capture_cert in
theorem aux_69152_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69152 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69152 69137 69151 4 nodeTable_69152 numeric_node_69152,
    table_read_69152_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69151_0_4
capture_cert in
theorem table_read_69152_1_3 :
    nodeTable_69152.read true 3 = true := by rfl
capture_cert in
theorem aux_69152_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69152 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69152 69137 69151 3 nodeTable_69152 numeric_node_69152,
    table_read_69152_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69137_1_3
capture_cert in
theorem table_read_69152_1_4 :
    nodeTable_69152.read true 4 = false := by rfl
capture_cert in
theorem aux_69152_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69152 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69152 69137 69151 4 nodeTable_69152 numeric_node_69152,
    table_read_69152_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69151_1_4
capture_cert in
theorem table_read_69153_0_3 :
    nodeTable_69153.read false 3 = false := by rfl
capture_cert in
theorem aux_69153_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69153 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69153 69123 69152 3 nodeTable_69153 numeric_node_69153,
    table_read_69153_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69152_0_3
capture_cert in
theorem table_read_69153_0_4 :
    nodeTable_69153.read false 4 = false := by rfl
capture_cert in
theorem aux_69153_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69153 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69153 69123 69152 4 nodeTable_69153 numeric_node_69153,
    table_read_69153_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69152_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t691534\t{now}"
      handle.flush
capture_cert in
theorem table_read_69153_1_3 :
    nodeTable_69153.read true 3 = false := by rfl
capture_cert in
theorem aux_69153_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69153 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69153 69123 69152 3 nodeTable_69153 numeric_node_69153,
    table_read_69153_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69152_1_3
capture_cert in
theorem table_read_69153_1_4 :
    nodeTable_69153.read true 4 = false := by rfl
capture_cert in
theorem aux_69153_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69153 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69153 69123 69152 4 nodeTable_69153 numeric_node_69153,
    table_read_69153_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69152_1_4
capture_cert in
theorem table_read_69154_0_3 :
    nodeTable_69154.read false 3 = false := by rfl
capture_cert in
theorem aux_69154_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69154 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69154 69109 69153 3 nodeTable_69154 numeric_node_69154,
    table_read_69154_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69153_0_3
capture_cert in
theorem table_read_69154_0_4 :
    nodeTable_69154.read false 4 = false := by rfl
capture_cert in
theorem aux_69154_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69154 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69154 69109 69153 4 nodeTable_69154 numeric_node_69154,
    table_read_69154_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69153_0_4
capture_cert in
theorem table_read_69154_1_3 :
    nodeTable_69154.read true 3 = false := by rfl
capture_cert in
theorem aux_69154_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69154 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69154 69109 69153 3 nodeTable_69154 numeric_node_69154,
    table_read_69154_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69153_1_3
capture_cert in
theorem table_read_69154_1_4 :
    nodeTable_69154.read true 4 = false := by rfl
capture_cert in
theorem aux_69154_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69154 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69154 69109 69153 4 nodeTable_69154 numeric_node_69154,
    table_read_69154_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69153_1_4
capture_cert in
theorem table_read_69155_0_3 :
    nodeTable_69155.read false 3 = false := by rfl
capture_cert in
theorem aux_69155_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69155 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69155 69095 69154 3 nodeTable_69155 numeric_node_69155,
    table_read_69155_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69154_0_3
capture_cert in
theorem table_read_69155_0_4 :
    nodeTable_69155.read false 4 = false := by rfl
capture_cert in
theorem aux_69155_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69155 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69155 69095 69154 4 nodeTable_69155 numeric_node_69155,
    table_read_69155_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69154_0_4
capture_cert in
theorem table_read_69155_1_3 :
    nodeTable_69155.read true 3 = false := by rfl
capture_cert in
theorem aux_69155_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69155 3 =
      ((some (69136 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69155 69095 69154 3 nodeTable_69155 numeric_node_69155,
    table_read_69155_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69154_1_3
capture_cert in
theorem table_read_69155_1_4 :
    nodeTable_69155.read true 4 = false := by rfl
capture_cert in
theorem aux_69155_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69155 4 =
      ((some (69150 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69155 69095 69154 4 nodeTable_69155 numeric_node_69155,
    table_read_69155_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69154_1_4
capture_cert in
theorem table_read_69425_0_3 :
    nodeTable_69425.read false 3 = false := by rfl
capture_cert in
theorem aux_69425_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69425 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    69425 69424 3 nodeTable_69425 numeric_node_69425,
    table_read_69425_0_3]
capture_cert in
theorem table_read_69425_1_3 :
    nodeTable_69425.read true 3 = false := by rfl
capture_cert in
theorem aux_69425_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69425 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    69425 69424 3 nodeTable_69425 numeric_node_69425,
    table_read_69425_1_3]
capture_cert in
theorem table_read_69433_0_4 :
    nodeTable_69433.read false 4 = false := by rfl
capture_cert in
theorem aux_69433_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69433 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter false
    69433 69432 4 nodeTable_69433 numeric_node_69433,
    table_read_69433_0_4]
capture_cert in
theorem table_read_69433_1_4 :
    nodeTable_69433.read true 4 = false := by rfl
capture_cert in
theorem aux_69433_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69433 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_write FieldPacked.getter true
    69433 69432 4 nodeTable_69433 numeric_node_69433,
    table_read_69433_1_4]
capture_cert in
theorem table_read_69434_0_3 :
    nodeTable_69434.read false 3 = true := by rfl
capture_cert in
theorem aux_69434_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69434 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69434 69425 69433 3 nodeTable_69434 numeric_node_69434,
    table_read_69434_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69425_0_3
capture_cert in
theorem table_read_69434_0_4 :
    nodeTable_69434.read false 4 = false := by rfl
capture_cert in
theorem aux_69434_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69434 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69434 69425 69433 4 nodeTable_69434 numeric_node_69434,
    table_read_69434_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69433_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t694344\t{now}"
      handle.flush
capture_cert in
theorem table_read_69434_1_3 :
    nodeTable_69434.read true 3 = true := by rfl
capture_cert in
theorem aux_69434_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69434 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69434 69425 69433 3 nodeTable_69434 numeric_node_69434,
    table_read_69434_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69425_1_3
capture_cert in
theorem table_read_69434_1_4 :
    nodeTable_69434.read true 4 = false := by rfl
capture_cert in
theorem aux_69434_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69434 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69434 69425 69433 4 nodeTable_69434 numeric_node_69434,
    table_read_69434_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69433_1_4
capture_cert in
theorem table_read_69435_0_3 :
    nodeTable_69435.read false 3 = false := by rfl
capture_cert in
theorem aux_69435_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69435 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69435 69417 69434 3 nodeTable_69435 numeric_node_69435,
    table_read_69435_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69434_0_3
capture_cert in
theorem table_read_69435_0_4 :
    nodeTable_69435.read false 4 = false := by rfl
capture_cert in
theorem aux_69435_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69435 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69435 69417 69434 4 nodeTable_69435 numeric_node_69435,
    table_read_69435_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69434_0_4
capture_cert in
theorem table_read_69435_1_3 :
    nodeTable_69435.read true 3 = false := by rfl
capture_cert in
theorem aux_69435_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69435 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69435 69417 69434 3 nodeTable_69435 numeric_node_69435,
    table_read_69435_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69434_1_3
capture_cert in
theorem table_read_69435_1_4 :
    nodeTable_69435.read true 4 = false := by rfl
capture_cert in
theorem aux_69435_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69435 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69435 69417 69434 4 nodeTable_69435 numeric_node_69435,
    table_read_69435_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69434_1_4
capture_cert in
theorem table_read_69436_0_3 :
    nodeTable_69436.read false 3 = false := by rfl
capture_cert in
theorem aux_69436_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69436 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69436 69409 69435 3 nodeTable_69436 numeric_node_69436,
    table_read_69436_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69435_0_3
capture_cert in
theorem table_read_69436_0_4 :
    nodeTable_69436.read false 4 = false := by rfl
capture_cert in
theorem aux_69436_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69436 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69436 69409 69435 4 nodeTable_69436 numeric_node_69436,
    table_read_69436_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69435_0_4
capture_cert in
theorem table_read_69436_1_3 :
    nodeTable_69436.read true 3 = false := by rfl
capture_cert in
theorem aux_69436_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69436 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69436 69409 69435 3 nodeTable_69436 numeric_node_69436,
    table_read_69436_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69435_1_3
capture_cert in
theorem table_read_69436_1_4 :
    nodeTable_69436.read true 4 = false := by rfl
capture_cert in
theorem aux_69436_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69436 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69436 69409 69435 4 nodeTable_69436 numeric_node_69436,
    table_read_69436_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69435_1_4
capture_cert in
theorem table_read_69437_0_3 :
    nodeTable_69437.read false 3 = false := by rfl
capture_cert in
theorem aux_69437_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69437 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69437 69401 69436 3 nodeTable_69437 numeric_node_69437,
    table_read_69437_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69436_0_3
capture_cert in
theorem table_read_69437_0_4 :
    nodeTable_69437.read false 4 = false := by rfl
capture_cert in
theorem aux_69437_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69437 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69437 69401 69436 4 nodeTable_69437 numeric_node_69437,
    table_read_69437_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69436_0_4
capture_cert in
theorem table_read_69437_1_3 :
    nodeTable_69437.read true 3 = false := by rfl
capture_cert in
theorem aux_69437_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69437 3 =
      ((some (69424 : Fin 106668), (3 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69437 69401 69436 3 nodeTable_69437 numeric_node_69437,
    table_read_69437_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69436_1_3
capture_cert in
theorem table_read_69437_1_4 :
    nodeTable_69437.read true 4 = false := by rfl
capture_cert in
theorem aux_69437_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69437 4 =
      ((some (69432 : Fin 106668), (4 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69437 69401 69436 4 nodeTable_69437 numeric_node_69437,
    table_read_69437_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69436_1_4
capture_cert in
theorem aux_69689_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69689 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69689 69688 3 .right numeric_node_69689
capture_cert in
theorem aux_69689_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69689 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69689 69688 3 .right numeric_node_69689
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t696898\t{now}"
      handle.flush
capture_cert in
theorem aux_69703_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69703 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69703 69702 4 .right numeric_node_69703
capture_cert in
theorem aux_69703_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69703 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69703 69702 4 .right numeric_node_69703
capture_cert in
theorem table_read_69704_0_3 :
    nodeTable_69704.read false 3 = true := by rfl
capture_cert in
theorem aux_69704_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69704 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69704 69689 69703 3 nodeTable_69704 numeric_node_69704,
    table_read_69704_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69689_0_3
capture_cert in
theorem table_read_69704_0_4 :
    nodeTable_69704.read false 4 = false := by rfl
capture_cert in
theorem aux_69704_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69704 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69704 69689 69703 4 nodeTable_69704 numeric_node_69704,
    table_read_69704_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69703_0_4
capture_cert in
theorem table_read_69704_1_3 :
    nodeTable_69704.read true 3 = true := by rfl
capture_cert in
theorem aux_69704_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69704 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69704 69689 69703 3 nodeTable_69704 numeric_node_69704,
    table_read_69704_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69689_1_3
capture_cert in
theorem table_read_69704_1_4 :
    nodeTable_69704.read true 4 = false := by rfl
capture_cert in
theorem aux_69704_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69704 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69704 69689 69703 4 nodeTable_69704 numeric_node_69704,
    table_read_69704_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69703_1_4
capture_cert in
theorem table_read_69705_0_3 :
    nodeTable_69705.read false 3 = false := by rfl
capture_cert in
theorem aux_69705_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69705 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69705 69675 69704 3 nodeTable_69705 numeric_node_69705,
    table_read_69705_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69704_0_3
capture_cert in
theorem table_read_69705_0_4 :
    nodeTable_69705.read false 4 = false := by rfl
capture_cert in
theorem aux_69705_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69705 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69705 69675 69704 4 nodeTable_69705 numeric_node_69705,
    table_read_69705_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69704_0_4
capture_cert in
theorem table_read_69705_1_3 :
    nodeTable_69705.read true 3 = false := by rfl
capture_cert in
theorem aux_69705_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69705 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69705 69675 69704 3 nodeTable_69705 numeric_node_69705,
    table_read_69705_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69704_1_3
capture_cert in
theorem table_read_69705_1_4 :
    nodeTable_69705.read true 4 = false := by rfl
capture_cert in
theorem aux_69705_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69705 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69705 69675 69704 4 nodeTable_69705 numeric_node_69705,
    table_read_69705_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69704_1_4
capture_cert in
theorem table_read_69706_0_3 :
    nodeTable_69706.read false 3 = false := by rfl
capture_cert in
theorem aux_69706_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69706 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69706 69661 69705 3 nodeTable_69706 numeric_node_69706,
    table_read_69706_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69705_0_3
capture_cert in
theorem table_read_69706_0_4 :
    nodeTable_69706.read false 4 = false := by rfl
capture_cert in
theorem aux_69706_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69706 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69706 69661 69705 4 nodeTable_69706 numeric_node_69706,
    table_read_69706_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69705_0_4
capture_cert in
theorem table_read_69706_1_3 :
    nodeTable_69706.read true 3 = false := by rfl
capture_cert in
theorem aux_69706_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69706 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69706 69661 69705 3 nodeTable_69706 numeric_node_69706,
    table_read_69706_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69705_1_3
capture_cert in
theorem table_read_69706_1_4 :
    nodeTable_69706.read true 4 = false := by rfl
capture_cert in
theorem aux_69706_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69706 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69706 69661 69705 4 nodeTable_69706 numeric_node_69706,
    table_read_69706_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69705_1_4
capture_cert in
theorem table_read_69707_0_3 :
    nodeTable_69707.read false 3 = false := by rfl
capture_cert in
theorem aux_69707_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69707 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69707 69647 69706 3 nodeTable_69707 numeric_node_69707,
    table_read_69707_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69706_0_3
capture_cert in
theorem table_read_69707_0_4 :
    nodeTable_69707.read false 4 = false := by rfl
capture_cert in
theorem aux_69707_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69707 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69707 69647 69706 4 nodeTable_69707 numeric_node_69707,
    table_read_69707_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69706_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t697074\t{now}"
      handle.flush
capture_cert in
theorem table_read_69707_1_3 :
    nodeTable_69707.read true 3 = false := by rfl
capture_cert in
theorem aux_69707_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69707 3 =
      ((some (69688 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69707 69647 69706 3 nodeTable_69707 numeric_node_69707,
    table_read_69707_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69706_1_3
capture_cert in
theorem table_read_69707_1_4 :
    nodeTable_69707.read true 4 = false := by rfl
capture_cert in
theorem aux_69707_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69707 4 =
      ((some (69702 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69707 69647 69706 4 nodeTable_69707 numeric_node_69707,
    table_read_69707_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69706_1_4
capture_cert in
theorem aux_69909_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69909 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69909 69908 3 .right numeric_node_69909
capture_cert in
theorem aux_69909_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69909 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69909 69908 3 .right numeric_node_69909
capture_cert in
theorem aux_69935_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69935 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    69935 69934 4 .right numeric_node_69935
capture_cert in
theorem aux_69935_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69935 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    69935 69934 4 .right numeric_node_69935
capture_cert in
theorem table_read_69936_0_3 :
    nodeTable_69936.read false 3 = true := by rfl
capture_cert in
theorem aux_69936_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69936 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69936 69909 69935 3 nodeTable_69936 numeric_node_69936,
    table_read_69936_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69909_0_3
capture_cert in
theorem table_read_69936_0_4 :
    nodeTable_69936.read false 4 = false := by rfl
capture_cert in
theorem aux_69936_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69936 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69936 69909 69935 4 nodeTable_69936 numeric_node_69936,
    table_read_69936_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69935_0_4
capture_cert in
theorem table_read_69936_1_3 :
    nodeTable_69936.read true 3 = true := by rfl
capture_cert in
theorem aux_69936_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69936 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69936 69909 69935 3 nodeTable_69936 numeric_node_69936,
    table_read_69936_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69909_1_3
capture_cert in
theorem table_read_69936_1_4 :
    nodeTable_69936.read true 4 = false := by rfl
capture_cert in
theorem aux_69936_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69936 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69936 69909 69935 4 nodeTable_69936 numeric_node_69936,
    table_read_69936_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69935_1_4
capture_cert in
theorem table_read_69937_0_3 :
    nodeTable_69937.read false 3 = false := by rfl
capture_cert in
theorem aux_69937_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69937 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69937 69883 69936 3 nodeTable_69937 numeric_node_69937,
    table_read_69937_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69936_0_3
capture_cert in
theorem table_read_69937_0_4 :
    nodeTable_69937.read false 4 = false := by rfl
capture_cert in
theorem aux_69937_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69937 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69937 69883 69936 4 nodeTable_69937 numeric_node_69937,
    table_read_69937_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69936_0_4
capture_cert in
theorem table_read_69937_1_3 :
    nodeTable_69937.read true 3 = false := by rfl
capture_cert in
theorem aux_69937_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69937 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69937 69883 69936 3 nodeTable_69937 numeric_node_69937,
    table_read_69937_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69936_1_3
capture_cert in
theorem table_read_69937_1_4 :
    nodeTable_69937.read true 4 = false := by rfl
capture_cert in
theorem aux_69937_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69937 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69937 69883 69936 4 nodeTable_69937 numeric_node_69937,
    table_read_69937_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69936_1_4
capture_cert in
theorem table_read_69938_0_3 :
    nodeTable_69938.read false 3 = false := by rfl
capture_cert in
theorem aux_69938_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69938 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69938 69857 69937 3 nodeTable_69938 numeric_node_69938,
    table_read_69938_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69937_0_3
capture_cert in
theorem table_read_69938_0_4 :
    nodeTable_69938.read false 4 = false := by rfl
capture_cert in
theorem aux_69938_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69938 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69938 69857 69937 4 nodeTable_69938 numeric_node_69938,
    table_read_69938_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69937_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t699384\t{now}"
      handle.flush
capture_cert in
theorem table_read_69938_1_3 :
    nodeTable_69938.read true 3 = false := by rfl
capture_cert in
theorem aux_69938_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69938 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69938 69857 69937 3 nodeTable_69938 numeric_node_69938,
    table_read_69938_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69937_1_3
capture_cert in
theorem table_read_69938_1_4 :
    nodeTable_69938.read true 4 = false := by rfl
capture_cert in
theorem aux_69938_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69938 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69938 69857 69937 4 nodeTable_69938 numeric_node_69938,
    table_read_69938_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69937_1_4
capture_cert in
theorem table_read_69939_0_3 :
    nodeTable_69939.read false 3 = false := by rfl
capture_cert in
theorem aux_69939_0_3 :
    LazyGraph.trAux FieldPacked.getter false 69939 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69939 69831 69938 3 nodeTable_69939 numeric_node_69939,
    table_read_69939_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69938_0_3
capture_cert in
theorem table_read_69939_0_4 :
    nodeTable_69939.read false 4 = false := by rfl
capture_cert in
theorem aux_69939_0_4 :
    LazyGraph.trAux FieldPacked.getter false 69939 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    69939 69831 69938 4 nodeTable_69939 numeric_node_69939,
    table_read_69939_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69938_0_4
capture_cert in
theorem table_read_69939_1_3 :
    nodeTable_69939.read true 3 = false := by rfl
capture_cert in
theorem aux_69939_1_3 :
    LazyGraph.trAux FieldPacked.getter true 69939 3 =
      ((some (69908 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69939 69831 69938 3 nodeTable_69939 numeric_node_69939,
    table_read_69939_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69938_1_3
capture_cert in
theorem table_read_69939_1_4 :
    nodeTable_69939.read true 4 = false := by rfl
capture_cert in
theorem aux_69939_1_4 :
    LazyGraph.trAux FieldPacked.getter true 69939 4 =
      ((some (69934 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    69939 69831 69938 4 nodeTable_69939 numeric_node_69939,
    table_read_69939_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_69938_1_4
capture_cert in
theorem aux_70377_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70377 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70377 70376 3 .right numeric_node_70377
capture_cert in
theorem aux_70377_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70377 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70377 70376 3 .right numeric_node_70377
capture_cert in
theorem aux_70397_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70397 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70397 70396 4 .right numeric_node_70397
capture_cert in
theorem aux_70397_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70397 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70397 70396 4 .right numeric_node_70397
capture_cert in
theorem table_read_70398_0_3 :
    nodeTable_70398.read false 3 = true := by rfl
capture_cert in
theorem aux_70398_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70398 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70398 70377 70397 3 nodeTable_70398 numeric_node_70398,
    table_read_70398_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70377_0_3
capture_cert in
theorem table_read_70398_0_4 :
    nodeTable_70398.read false 4 = false := by rfl
capture_cert in
theorem aux_70398_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70398 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70398 70377 70397 4 nodeTable_70398 numeric_node_70398,
    table_read_70398_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70397_0_4
capture_cert in
theorem table_read_70398_1_3 :
    nodeTable_70398.read true 3 = true := by rfl
capture_cert in
theorem aux_70398_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70398 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70398 70377 70397 3 nodeTable_70398 numeric_node_70398,
    table_read_70398_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70377_1_3
capture_cert in
theorem table_read_70398_1_4 :
    nodeTable_70398.read true 4 = false := by rfl
capture_cert in
theorem aux_70398_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70398 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70398 70377 70397 4 nodeTable_70398 numeric_node_70398,
    table_read_70398_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70397_1_4
capture_cert in
theorem table_read_70399_0_3 :
    nodeTable_70399.read false 3 = false := by rfl
capture_cert in
theorem aux_70399_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70399 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70399 70357 70398 3 nodeTable_70399 numeric_node_70399,
    table_read_70399_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70398_0_3
capture_cert in
theorem table_read_70399_0_4 :
    nodeTable_70399.read false 4 = false := by rfl
capture_cert in
theorem aux_70399_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70399 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70399 70357 70398 4 nodeTable_70399 numeric_node_70399,
    table_read_70399_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70398_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t703994\t{now}"
      handle.flush
capture_cert in
theorem table_read_70399_1_3 :
    nodeTable_70399.read true 3 = false := by rfl
capture_cert in
theorem aux_70399_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70399 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70399 70357 70398 3 nodeTable_70399 numeric_node_70399,
    table_read_70399_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70398_1_3
capture_cert in
theorem table_read_70399_1_4 :
    nodeTable_70399.read true 4 = false := by rfl
capture_cert in
theorem aux_70399_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70399 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70399 70357 70398 4 nodeTable_70399 numeric_node_70399,
    table_read_70399_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70398_1_4
capture_cert in
theorem table_read_70400_0_3 :
    nodeTable_70400.read false 3 = false := by rfl
capture_cert in
theorem aux_70400_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70400 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70400 70337 70399 3 nodeTable_70400 numeric_node_70400,
    table_read_70400_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70399_0_3
capture_cert in
theorem table_read_70400_0_4 :
    nodeTable_70400.read false 4 = false := by rfl
capture_cert in
theorem aux_70400_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70400 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70400 70337 70399 4 nodeTable_70400 numeric_node_70400,
    table_read_70400_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70399_0_4
capture_cert in
theorem table_read_70400_1_3 :
    nodeTable_70400.read true 3 = false := by rfl
capture_cert in
theorem aux_70400_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70400 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70400 70337 70399 3 nodeTable_70400 numeric_node_70400,
    table_read_70400_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70399_1_3
capture_cert in
theorem table_read_70400_1_4 :
    nodeTable_70400.read true 4 = false := by rfl
capture_cert in
theorem aux_70400_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70400 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70400 70337 70399 4 nodeTable_70400 numeric_node_70400,
    table_read_70400_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70399_1_4
capture_cert in
theorem table_read_70401_0_3 :
    nodeTable_70401.read false 3 = false := by rfl
capture_cert in
theorem aux_70401_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70401 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70401 70317 70400 3 nodeTable_70401 numeric_node_70401,
    table_read_70401_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70400_0_3
capture_cert in
theorem table_read_70401_0_4 :
    nodeTable_70401.read false 4 = false := by rfl
capture_cert in
theorem aux_70401_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70401 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70401 70317 70400 4 nodeTable_70401 numeric_node_70401,
    table_read_70401_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70400_0_4
capture_cert in
theorem table_read_70401_1_3 :
    nodeTable_70401.read true 3 = false := by rfl
capture_cert in
theorem aux_70401_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70401 3 =
      ((some (70376 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70401 70317 70400 3 nodeTable_70401 numeric_node_70401,
    table_read_70401_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70400_1_3
capture_cert in
theorem table_read_70401_1_4 :
    nodeTable_70401.read true 4 = false := by rfl
capture_cert in
theorem aux_70401_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70401 4 =
      ((some (70396 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70401 70317 70400 4 nodeTable_70401 numeric_node_70401,
    table_read_70401_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70400_1_4
capture_cert in
theorem aux_70602_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70602 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70602 70601 3 .right numeric_node_70602
capture_cert in
theorem aux_70602_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70602 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70602 70601 3 .right numeric_node_70602
capture_cert in
theorem aux_70622_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70622 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70622 70621 4 .right numeric_node_70622
capture_cert in
theorem aux_70622_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70622 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70622 70621 4 .right numeric_node_70622
capture_cert in
theorem table_read_70623_0_3 :
    nodeTable_70623.read false 3 = true := by rfl
capture_cert in
theorem aux_70623_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70623 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70623 70602 70622 3 nodeTable_70623 numeric_node_70623,
    table_read_70623_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70602_0_3
capture_cert in
theorem table_read_70623_0_4 :
    nodeTable_70623.read false 4 = false := by rfl
capture_cert in
theorem aux_70623_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70623 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70623 70602 70622 4 nodeTable_70623 numeric_node_70623,
    table_read_70623_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70622_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t706234\t{now}"
      handle.flush
capture_cert in
theorem table_read_70623_1_3 :
    nodeTable_70623.read true 3 = true := by rfl
capture_cert in
theorem aux_70623_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70623 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70623 70602 70622 3 nodeTable_70623 numeric_node_70623,
    table_read_70623_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70602_1_3
capture_cert in
theorem table_read_70623_1_4 :
    nodeTable_70623.read true 4 = false := by rfl
capture_cert in
theorem aux_70623_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70623 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70623 70602 70622 4 nodeTable_70623 numeric_node_70623,
    table_read_70623_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70622_1_4
capture_cert in
theorem table_read_70624_0_3 :
    nodeTable_70624.read false 3 = false := by rfl
capture_cert in
theorem aux_70624_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70624 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70624 70582 70623 3 nodeTable_70624 numeric_node_70624,
    table_read_70624_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70623_0_3
capture_cert in
theorem table_read_70624_0_4 :
    nodeTable_70624.read false 4 = false := by rfl
capture_cert in
theorem aux_70624_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70624 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70624 70582 70623 4 nodeTable_70624 numeric_node_70624,
    table_read_70624_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70623_0_4
capture_cert in
theorem table_read_70624_1_3 :
    nodeTable_70624.read true 3 = false := by rfl
capture_cert in
theorem aux_70624_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70624 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70624 70582 70623 3 nodeTable_70624 numeric_node_70624,
    table_read_70624_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70623_1_3
capture_cert in
theorem table_read_70624_1_4 :
    nodeTable_70624.read true 4 = false := by rfl
capture_cert in
theorem aux_70624_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70624 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70624 70582 70623 4 nodeTable_70624 numeric_node_70624,
    table_read_70624_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70623_1_4
capture_cert in
theorem table_read_70625_0_3 :
    nodeTable_70625.read false 3 = false := by rfl
capture_cert in
theorem aux_70625_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70625 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70625 70562 70624 3 nodeTable_70625 numeric_node_70625,
    table_read_70625_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70624_0_3
capture_cert in
theorem table_read_70625_0_4 :
    nodeTable_70625.read false 4 = false := by rfl
capture_cert in
theorem aux_70625_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70625 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70625 70562 70624 4 nodeTable_70625 numeric_node_70625,
    table_read_70625_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70624_0_4
capture_cert in
theorem table_read_70625_1_3 :
    nodeTable_70625.read true 3 = false := by rfl
capture_cert in
theorem aux_70625_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70625 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70625 70562 70624 3 nodeTable_70625 numeric_node_70625,
    table_read_70625_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70624_1_3
capture_cert in
theorem table_read_70625_1_4 :
    nodeTable_70625.read true 4 = false := by rfl
capture_cert in
theorem aux_70625_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70625 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70625 70562 70624 4 nodeTable_70625 numeric_node_70625,
    table_read_70625_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70624_1_4
capture_cert in
theorem table_read_70626_0_3 :
    nodeTable_70626.read false 3 = false := by rfl
capture_cert in
theorem aux_70626_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70626 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70626 70542 70625 3 nodeTable_70626 numeric_node_70626,
    table_read_70626_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70625_0_3
capture_cert in
theorem table_read_70626_0_4 :
    nodeTable_70626.read false 4 = false := by rfl
capture_cert in
theorem aux_70626_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70626 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70626 70542 70625 4 nodeTable_70626 numeric_node_70626,
    table_read_70626_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70625_0_4
capture_cert in
theorem table_read_70626_1_3 :
    nodeTable_70626.read true 3 = false := by rfl
capture_cert in
theorem aux_70626_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70626 3 =
      ((some (70601 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70626 70542 70625 3 nodeTable_70626 numeric_node_70626,
    table_read_70626_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70625_1_3
capture_cert in
theorem table_read_70626_1_4 :
    nodeTable_70626.read true 4 = false := by rfl
capture_cert in
theorem aux_70626_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70626 4 =
      ((some (70621 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70626 70542 70625 4 nodeTable_70626 numeric_node_70626,
    table_read_70626_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70625_1_4
capture_cert in
theorem aux_70807_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70807 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70807 70806 3 .right numeric_node_70807
capture_cert in
theorem aux_70807_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70807 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70807 70806 3 .right numeric_node_70807
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t708078\t{now}"
      handle.flush
capture_cert in
theorem aux_70821_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70821 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    70821 70820 4 .right numeric_node_70821
capture_cert in
theorem aux_70821_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70821 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    70821 70820 4 .right numeric_node_70821
capture_cert in
theorem table_read_70822_0_3 :
    nodeTable_70822.read false 3 = true := by rfl
capture_cert in
theorem aux_70822_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70822 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70822 70807 70821 3 nodeTable_70822 numeric_node_70822,
    table_read_70822_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70807_0_3
capture_cert in
theorem table_read_70822_0_4 :
    nodeTable_70822.read false 4 = false := by rfl
capture_cert in
theorem aux_70822_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70822 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70822 70807 70821 4 nodeTable_70822 numeric_node_70822,
    table_read_70822_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70821_0_4
capture_cert in
theorem table_read_70822_1_3 :
    nodeTable_70822.read true 3 = true := by rfl
capture_cert in
theorem aux_70822_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70822 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70822 70807 70821 3 nodeTable_70822 numeric_node_70822,
    table_read_70822_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70807_1_3
capture_cert in
theorem table_read_70822_1_4 :
    nodeTable_70822.read true 4 = false := by rfl
capture_cert in
theorem aux_70822_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70822 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70822 70807 70821 4 nodeTable_70822 numeric_node_70822,
    table_read_70822_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70821_1_4
capture_cert in
theorem table_read_70823_0_3 :
    nodeTable_70823.read false 3 = false := by rfl
capture_cert in
theorem aux_70823_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70823 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70823 70793 70822 3 nodeTable_70823 numeric_node_70823,
    table_read_70823_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70822_0_3
capture_cert in
theorem table_read_70823_0_4 :
    nodeTable_70823.read false 4 = false := by rfl
capture_cert in
theorem aux_70823_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70823 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70823 70793 70822 4 nodeTable_70823 numeric_node_70823,
    table_read_70823_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70822_0_4
capture_cert in
theorem table_read_70823_1_3 :
    nodeTable_70823.read true 3 = false := by rfl
capture_cert in
theorem aux_70823_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70823 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70823 70793 70822 3 nodeTable_70823 numeric_node_70823,
    table_read_70823_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70822_1_3
capture_cert in
theorem table_read_70823_1_4 :
    nodeTable_70823.read true 4 = false := by rfl
capture_cert in
theorem aux_70823_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70823 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70823 70793 70822 4 nodeTable_70823 numeric_node_70823,
    table_read_70823_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70822_1_4
capture_cert in
theorem table_read_70824_0_3 :
    nodeTable_70824.read false 3 = false := by rfl
capture_cert in
theorem aux_70824_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70824 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70824 70779 70823 3 nodeTable_70824 numeric_node_70824,
    table_read_70824_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70823_0_3
capture_cert in
theorem table_read_70824_0_4 :
    nodeTable_70824.read false 4 = false := by rfl
capture_cert in
theorem aux_70824_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70824 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70824 70779 70823 4 nodeTable_70824 numeric_node_70824,
    table_read_70824_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70823_0_4
capture_cert in
theorem table_read_70824_1_3 :
    nodeTable_70824.read true 3 = false := by rfl
capture_cert in
theorem aux_70824_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70824 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70824 70779 70823 3 nodeTable_70824 numeric_node_70824,
    table_read_70824_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70823_1_3
capture_cert in
theorem table_read_70824_1_4 :
    nodeTable_70824.read true 4 = false := by rfl
capture_cert in
theorem aux_70824_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70824 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70824 70779 70823 4 nodeTable_70824 numeric_node_70824,
    table_read_70824_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70823_1_4
capture_cert in
theorem table_read_70825_0_3 :
    nodeTable_70825.read false 3 = false := by rfl
capture_cert in
theorem aux_70825_0_3 :
    LazyGraph.trAux FieldPacked.getter false 70825 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70825 70765 70824 3 nodeTable_70825 numeric_node_70825,
    table_read_70825_0_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70824_0_3
capture_cert in
theorem table_read_70825_0_4 :
    nodeTable_70825.read false 4 = false := by rfl
capture_cert in
theorem aux_70825_0_4 :
    LazyGraph.trAux FieldPacked.getter false 70825 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    70825 70765 70824 4 nodeTable_70825 numeric_node_70825,
    table_read_70825_0_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70824_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t708254\t{now}"
      handle.flush
capture_cert in
theorem table_read_70825_1_3 :
    nodeTable_70825.read true 3 = false := by rfl
capture_cert in
theorem aux_70825_1_3 :
    LazyGraph.trAux FieldPacked.getter true 70825 3 =
      ((some (70806 : Fin 106668), (3 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70825 70765 70824 3 nodeTable_70825 numeric_node_70825,
    table_read_70825_1_3]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70824_1_3
capture_cert in
theorem table_read_70825_1_4 :
    nodeTable_70825.read true 4 = false := by rfl
capture_cert in
theorem aux_70825_1_4 :
    LazyGraph.trAux FieldPacked.getter true 70825 4 =
      ((some (70820 : Fin 106668), (4 : Fin 5)), .move .right) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    70825 70765 70824 4 nodeTable_70825 numeric_node_70825,
    table_read_70825_1_4]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_70824_1_4
capture_cert in
theorem table_read_80019_0_1 :
    nodeTable_80019.read false 1 = 713 := by rfl
capture_cert in
theorem aux_80019_0_1 :
    LazyGraph.trAux FieldPacked.getter false 80019 1 =
      ((some (18791 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter false
    80019 1 nodeTable_80019 numeric_node_80019,
    table_read_80019_0_1, entry_713]
capture_cert in
theorem table_read_80019_1_1 :
    nodeTable_80019.read true 1 = 713 := by rfl
capture_cert in
theorem aux_80019_1_1 :
    LazyGraph.trAux FieldPacked.getter true 80019 1 =
      ((some (18791 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_goto FieldPacked.getter true
    80019 1 nodeTable_80019 numeric_node_80019,
    table_read_80019_1_1, entry_713]
capture_cert in
theorem table_read_80020_0_1 :
    nodeTable_80020.read false 1 = false := by rfl
capture_cert in
theorem aux_80020_0_1 :
    LazyGraph.trAux FieldPacked.getter false 80020 1 =
      ((some (18791 : Fin 106668), (1 : Fin 5)), .write false) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    80020 80018 80019 1 nodeTable_80020 numeric_node_80020,
    table_read_80020_0_1]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_80019_0_1
capture_cert in
theorem table_read_80020_1_1 :
    nodeTable_80020.read true 1 = false := by rfl
capture_cert in
theorem aux_80020_1_1 :
    LazyGraph.trAux FieldPacked.getter true 80020 1 =
      ((some (18791 : Fin 106668), (1 : Fin 5)), .write true) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    80020 80018 80019 1 nodeTable_80020 numeric_node_80020,
    table_read_80020_1_1]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_80019_1_1
capture_cert in
theorem aux_93343_1_0 :
    LazyGraph.trAux FieldPacked.getter true 93343 0 =
      ((some (93342 : Fin 106668), (0 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    93343 93342 0 .left numeric_node_93343
capture_cert in
theorem aux_93356_0_0 :
    LazyGraph.trAux FieldPacked.getter false 93356 0 =
      ((some (93355 : Fin 106668), (0 : Fin 5)), .move .left) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    93356 93355 0 .left numeric_node_93356
capture_cert in
theorem table_read_93357_0_0 :
    nodeTable_93357.read false 0 = false := by rfl
capture_cert in
theorem aux_93357_0_0 :
    LazyGraph.trAux FieldPacked.getter false 93357 0 =
      ((some (93355 : Fin 106668), (0 : Fin 5)), .move .left) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter false
    93357 93343 93356 0 nodeTable_93357 numeric_node_93357,
    table_read_93357_0_0]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_93356_0_0
capture_cert in
theorem table_read_93357_1_0 :
    nodeTable_93357.read true 0 = true := by rfl
capture_cert in
theorem aux_93357_1_0 :
    LazyGraph.trAux FieldPacked.getter true 93357 0 =
      ((some (93342 : Fin 106668), (0 : Fin 5)), .move .left) := by
  rw [LazyGraph.trAux_branch FieldPacked.getter true
    93357 93343 93356 0 nodeTable_93357 numeric_node_93357,
    table_read_93357_1_0]
  simpa only [Bool.false_eq_true, ↓reduceIte] using aux_93343_1_0
capture_cert in
theorem aux_106667_0_4 :
    LazyGraph.trAux FieldPacked.getter false 106667 4 =
      ((some (106666 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter false
    106667 106666 4 .right numeric_node_106667
capture_cert in
theorem aux_106667_1_4 :
    LazyGraph.trAux FieldPacked.getter true 106667 4 =
      ((some (106666 : Fin 106668), (4 : Fin 5)), .move .right) := by
  exact LazyGraph.trAux_move FieldPacked.getter true
    106667 106666 4 .right numeric_node_106667
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"aux-64\t1066679\t{now}"
      handle.flush
capture_cert in
theorem actual_0_0 :
    FieldSelective.body.toMachine.transition 0 0 =
      some ((0 : Fin 2), .right, (533347 : Fin 573802)) := by
  rewrite [← main_address_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_0_0_0]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_1_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t0\t{now}"
      handle.flush
capture_cert in
theorem row_64_0_0 : RowAt 0 0 := by
  unfold RowAt
  rw [actual_0_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t0\t{now}"
      handle.flush
capture_cert in
theorem actual_0_1 :
    FieldSelective.body.toMachine.transition 0 1 =
      some ((1 : Fin 2), .right, (533347 : Fin 573802)) := by
  rewrite [← main_address_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_0_1_0]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_1_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1\t{now}"
      handle.flush
capture_cert in
theorem row_64_0_1 : RowAt 0 1 := by
  unfold RowAt
  rw [actual_0_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1\t{now}"
      handle.flush
capture_cert in
theorem actual_1_0 :
    FieldSelective.body.toMachine.transition 1 0 =
      none := by
  rewrite [← haltedMain_address]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition haltedMain 0 = _
  unfold haltedMain
  rewrite [SelectiveBinary.compile_main, post_halted]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2\t{now}"
      handle.flush
capture_cert in
theorem row_64_1_0 : RowAt 1 0 := by
  unfold RowAt
  rw [actual_1_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2\t{now}"
      handle.flush
capture_cert in
theorem actual_1_1 :
    FieldSelective.body.toMachine.transition 1 1 =
      none := by
  rewrite [← haltedMain_address]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition haltedMain 1 = _
  unfold haltedMain
  rewrite [SelectiveBinary.compile_main, post_halted]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3\t{now}"
      handle.flush
capture_cert in
theorem row_64_1_1 : RowAt 1 1 := by
  unfold RowAt
  rw [actual_1_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3\t{now}"
      handle.flush
capture_cert in
theorem actual_533340_0 :
    FieldSelective.body.toMachine.transition 533340 0 =
      some ((0 : Fin 2), .right, (533335 : Fin 573802)) := by
  rewrite [← main_address_106667_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 106667 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_106667_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 106666 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_106666_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066680\t{now}"
      handle.flush
capture_cert in
theorem row_64_533340_0 : RowAt 533340 0 := by
  unfold RowAt
  rw [actual_533340_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066680\t{now}"
      handle.flush
capture_cert in
theorem actual_533340_1 :
    FieldSelective.body.toMachine.transition 533340 1 =
      some ((1 : Fin 2), .right, (533335 : Fin 573802)) := by
  rewrite [← main_address_106667_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 106667 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_106667_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 106666 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_106666_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066681\t{now}"
      handle.flush
capture_cert in
theorem row_64_533340_1 : RowAt 533340 1 := by
  unfold RowAt
  rw [actual_533340_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066681\t{now}"
      handle.flush
capture_cert in
theorem actual_533341_0 :
    FieldSelective.body.toMachine.transition 533341 0 =
      some ((0 : Fin 2), .left, (1 : Fin 573802)) := by
  have address : SelectiveBinary.bounceState (q := 533341)
      FieldSelectiveLayout.haltReturn = (533341 : Fin 573802) := rfl
  rewrite [← address]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (SelectiveBinary.bounceState FieldSelectiveLayout.haltReturn) 0 = _
  rewrite [SelectiveBinary.compile_bounce,
    FieldSelectiveLayout.returnAt_halt 0]
  change some ((0 : Fin 2), Dir.left, haltedMain) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) haltedMain_address
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066682\t{now}"
      handle.flush
capture_cert in
theorem row_64_533341_0 : RowAt 533341 0 := by
  unfold RowAt
  rw [actual_533341_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066682\t{now}"
      handle.flush
capture_cert in
theorem actual_533341_1 :
    FieldSelective.body.toMachine.transition 533341 1 =
      some ((1 : Fin 2), .left, (1 : Fin 573802)) := by
  have address : SelectiveBinary.bounceState (q := 533341)
      FieldSelectiveLayout.haltReturn = (533341 : Fin 573802) := rfl
  rewrite [← address]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (SelectiveBinary.bounceState FieldSelectiveLayout.haltReturn) 1 = _
  rewrite [SelectiveBinary.compile_bounce,
    FieldSelectiveLayout.returnAt_halt 0]
  change some ((1 : Fin 2), Dir.left, haltedMain) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) haltedMain_address
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066683\t{now}"
      handle.flush
capture_cert in
theorem row_64_533341_1 : RowAt 533341 1 := by
  unfold RowAt
  rw [actual_533341_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066683\t{now}"
      handle.flush
capture_cert in
theorem actual_533342_0 :
    FieldSelective.body.toMachine.transition 533342 0 =
      some ((0 : Fin 2), .left, (0 : Fin 573802)) := by
  rewrite [← bounce_address_0_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 0 syntax_0 syntax_eq_0 rank_0_0 0)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_0_0, address_0]
  change some ((0 : Fin 2), Dir.left, mainIndex 0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066684\t{now}"
      handle.flush
capture_cert in
theorem row_64_533342_0 : RowAt 533342 0 := by
  unfold RowAt
  rw [actual_533342_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066684\t{now}"
      handle.flush
capture_cert in
theorem actual_533342_1 :
    FieldSelective.body.toMachine.transition 533342 1 =
      some ((1 : Fin 2), .left, (0 : Fin 573802)) := by
  rewrite [← bounce_address_0_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 0 syntax_0 syntax_eq_0 rank_0_0 0)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_0_0, address_0]
  change some ((1 : Fin 2), Dir.left, mainIndex 0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1066685\t{now}"
      handle.flush
capture_cert in
theorem row_64_533342_1 : RowAt 533342 1 := by
  unfold RowAt
  rw [actual_533342_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1066685\t{now}"
      handle.flush
capture_cert in
theorem actual_573801_0 :
    FieldSelective.body.toMachine.transition 573801 0 =
      some ((0 : Fin 2), .left, (533340 : Fin 573802)) := by
  rewrite [← bounce_address_4041_0_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 4041 syntax_4041 syntax_eq_4041 rank_4041_0 4)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_4041_0, address_106667]
  change some ((0 : Fin 2), Dir.left, mainIndex 106667 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_106667_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1147602\t{now}"
      handle.flush
capture_cert in
theorem row_64_573801_0 : RowAt 573801 0 := by
  unfold RowAt
  rw [actual_573801_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1147602\t{now}"
      handle.flush
capture_cert in
theorem actual_573801_1 :
    FieldSelective.body.toMachine.transition 573801 1 =
      some ((1 : Fin 2), .left, (533340 : Fin 573802)) := by
  rewrite [← bounce_address_4041_0_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 4041 syntax_4041 syntax_eq_4041 rank_4041_0 4)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_4041_0, address_106667]
  change some ((1 : Fin 2), Dir.left, mainIndex 106667 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_106667_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1147603\t{now}"
      handle.flush
capture_cert in
theorem row_64_573801_1 : RowAt 573801 1 := by
  unfold RowAt
  rw [actual_573801_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1147603\t{now}"
      handle.flush
capture_cert in
theorem actual_1886_0 :
    FieldSelective.body.toMachine.transition 1886 0 =
      some ((0 : Fin 2), .right, (1881 : Fin 573802)) := by
  rewrite [← main_address_377_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_377_0_0]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 376 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_376_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3772\t{now}"
      handle.flush
capture_cert in
theorem row_64_1886_0 : RowAt 1886 0 := by
  unfold RowAt
  rw [actual_1886_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3772\t{now}"
      handle.flush
capture_cert in
theorem actual_1886_1 :
    FieldSelective.body.toMachine.transition 1886 1 =
      some ((1 : Fin 2), .right, (1881 : Fin 573802)) := by
  rewrite [← main_address_377_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_377_1_0]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 376 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_376_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3773\t{now}"
      handle.flush
capture_cert in
theorem row_64_1886_1 : RowAt 1886 1 := by
  unfold RowAt
  rw [actual_1886_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3773\t{now}"
      handle.flush
capture_cert in
theorem actual_1887_0 :
    FieldSelective.body.toMachine.transition 1887 0 =
      some ((0 : Fin 2), .right, (1882 : Fin 573802)) := by
  rewrite [← main_address_377_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_377_0_1]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 376 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_376_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3774\t{now}"
      handle.flush
capture_cert in
theorem row_64_1887_0 : RowAt 1887 0 := by
  unfold RowAt
  rw [actual_1887_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3774\t{now}"
      handle.flush
capture_cert in
theorem actual_1887_1 :
    FieldSelective.body.toMachine.transition 1887 1 =
      some ((1 : Fin 2), .right, (1882 : Fin 573802)) := by
  rewrite [← main_address_377_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_377_1_1]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 376 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_376_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3775\t{now}"
      handle.flush
capture_cert in
theorem row_64_1887_1 : RowAt 1887 1 := by
  unfold RowAt
  rw [actual_1887_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3775\t{now}"
      handle.flush
capture_cert in
theorem actual_1888_0 :
    FieldSelective.body.toMachine.transition 1888 0 =
      some ((0 : Fin 2), .right, (1883 : Fin 573802)) := by
  rewrite [← main_address_377_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_377_0_2]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 376 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_376_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3776\t{now}"
      handle.flush
capture_cert in
theorem row_64_1888_0 : RowAt 1888 0 := by
  unfold RowAt
  rw [actual_1888_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3776\t{now}"
      handle.flush
capture_cert in
theorem actual_1888_1 :
    FieldSelective.body.toMachine.transition 1888 1 =
      some ((1 : Fin 2), .right, (1883 : Fin 573802)) := by
  rewrite [← main_address_377_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_377_1_2]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 376 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_376_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3777\t{now}"
      handle.flush
capture_cert in
theorem row_64_1888_1 : RowAt 1888 1 := by
  unfold RowAt
  rw [actual_1888_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3777\t{now}"
      handle.flush
capture_cert in
theorem actual_1889_0 :
    FieldSelective.body.toMachine.transition 1889 0 =
      some ((0 : Fin 2), .right, (1884 : Fin 573802)) := by
  rewrite [← main_address_377_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_377_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 376 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_376_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3778\t{now}"
      handle.flush
capture_cert in
theorem row_64_1889_0 : RowAt 1889 0 := by
  unfold RowAt
  rw [actual_1889_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3778\t{now}"
      handle.flush
capture_cert in
theorem actual_1889_1 :
    FieldSelective.body.toMachine.transition 1889 1 =
      some ((1 : Fin 2), .right, (1884 : Fin 573802)) := by
  rewrite [← main_address_377_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_377_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 376 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_376_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3779\t{now}"
      handle.flush
capture_cert in
theorem row_64_1889_1 : RowAt 1889 1 := by
  unfold RowAt
  rw [actual_1889_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3779\t{now}"
      handle.flush
capture_cert in
theorem actual_1890_0 :
    FieldSelective.body.toMachine.transition 1890 0 =
      some ((0 : Fin 2), .right, (1885 : Fin 573802)) := by
  rewrite [← main_address_377_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_377_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 376 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_376_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3780\t{now}"
      handle.flush
capture_cert in
theorem row_64_1890_0 : RowAt 1890 0 := by
  unfold RowAt
  rw [actual_1890_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3780\t{now}"
      handle.flush
capture_cert in
theorem actual_1890_1 :
    FieldSelective.body.toMachine.transition 1890 1 =
      some ((1 : Fin 2), .right, (1885 : Fin 573802)) := by
  rewrite [← main_address_377_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 377 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_377_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 376 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_376_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3781\t{now}"
      handle.flush
capture_cert in
theorem row_64_1890_1 : RowAt 1890 1 := by
  unfold RowAt
  rw [actual_1890_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3781\t{now}"
      handle.flush
capture_cert in
theorem actual_1981_0 :
    FieldSelective.body.toMachine.transition 1981 0 =
      some ((0 : Fin 2), .right, (534747 : Fin 573802)) := by
  rewrite [← main_address_396_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_396_0_0]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3962\t{now}"
      handle.flush
capture_cert in
theorem row_64_1981_0 : RowAt 1981 0 := by
  unfold RowAt
  rw [actual_1981_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3962\t{now}"
      handle.flush
capture_cert in
theorem actual_1981_1 :
    FieldSelective.body.toMachine.transition 1981 1 =
      some ((0 : Fin 2), .right, (534747 : Fin 573802)) := by
  rewrite [← main_address_396_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_396_1_0]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3963\t{now}"
      handle.flush
capture_cert in
theorem row_64_1981_1 : RowAt 1981 1 := by
  unfold RowAt
  rw [actual_1981_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3963\t{now}"
      handle.flush
capture_cert in
theorem actual_1982_0 :
    FieldSelective.body.toMachine.transition 1982 0 =
      some ((0 : Fin 2), .right, (534748 : Fin 573802)) := by
  rewrite [← main_address_396_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_396_0_1]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3964\t{now}"
      handle.flush
capture_cert in
theorem row_64_1982_0 : RowAt 1982 0 := by
  unfold RowAt
  rw [actual_1982_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3964\t{now}"
      handle.flush
capture_cert in
theorem actual_1982_1 :
    FieldSelective.body.toMachine.transition 1982 1 =
      some ((0 : Fin 2), .right, (534748 : Fin 573802)) := by
  rewrite [← main_address_396_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_396_1_1]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3965\t{now}"
      handle.flush
capture_cert in
theorem row_64_1982_1 : RowAt 1982 1 := by
  unfold RowAt
  rw [actual_1982_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3965\t{now}"
      handle.flush
capture_cert in
theorem actual_1983_0 :
    FieldSelective.body.toMachine.transition 1983 0 =
      some ((0 : Fin 2), .right, (534749 : Fin 573802)) := by
  rewrite [← main_address_396_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_396_0_2]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3966\t{now}"
      handle.flush
capture_cert in
theorem row_64_1983_0 : RowAt 1983 0 := by
  unfold RowAt
  rw [actual_1983_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3966\t{now}"
      handle.flush
capture_cert in
theorem actual_1983_1 :
    FieldSelective.body.toMachine.transition 1983 1 =
      some ((0 : Fin 2), .right, (534749 : Fin 573802)) := by
  rewrite [← main_address_396_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_396_1_2]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3967\t{now}"
      handle.flush
capture_cert in
theorem row_64_1983_1 : RowAt 1983 1 := by
  unfold RowAt
  rw [actual_1983_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3967\t{now}"
      handle.flush
capture_cert in
theorem actual_1984_0 :
    FieldSelective.body.toMachine.transition 1984 0 =
      some ((0 : Fin 2), .right, (534750 : Fin 573802)) := by
  rewrite [← main_address_396_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_396_0_3]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3968\t{now}"
      handle.flush
capture_cert in
theorem row_64_1984_0 : RowAt 1984 0 := by
  unfold RowAt
  rw [actual_1984_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3968\t{now}"
      handle.flush
capture_cert in
theorem actual_1984_1 :
    FieldSelective.body.toMachine.transition 1984 1 =
      some ((0 : Fin 2), .right, (534750 : Fin 573802)) := by
  rewrite [← main_address_396_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_396_1_3]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3969\t{now}"
      handle.flush
capture_cert in
theorem row_64_1984_1 : RowAt 1984 1 := by
  unfold RowAt
  rw [actual_1984_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3969\t{now}"
      handle.flush
capture_cert in
theorem actual_1985_0 :
    FieldSelective.body.toMachine.transition 1985 0 =
      some ((0 : Fin 2), .right, (534751 : Fin 573802)) := by
  rewrite [← main_address_396_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_396_0_4]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3970\t{now}"
      handle.flush
capture_cert in
theorem row_64_1985_0 : RowAt 1985 0 := by
  unfold RowAt
  rw [actual_1985_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3970\t{now}"
      handle.flush
capture_cert in
theorem actual_1985_1 :
    FieldSelective.body.toMachine.transition 1985 1 =
      some ((0 : Fin 2), .right, (534751 : Fin 573802)) := by
  rewrite [← main_address_396_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 396 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_396_1_4]
  dsimp only [Option.bind]
  rewrite [← address_395, findReturn_syntax,
    find_278_395]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 278 syntax_278 syntax_eq_278
      rank_278_3 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_278_3_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t3971\t{now}"
      handle.flush
capture_cert in
theorem row_64_1985_1 : RowAt 1985 1 := by
  unfold RowAt
  rw [actual_1985_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t3971\t{now}"
      handle.flush
capture_cert in
theorem actual_1491_0 :
    FieldSelective.body.toMachine.transition 1491 0 =
      some ((0 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_298_0_0]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2982\t{now}"
      handle.flush
capture_cert in
theorem row_64_1491_0 : RowAt 1491 0 := by
  unfold RowAt
  rw [actual_1491_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2982\t{now}"
      handle.flush
capture_cert in
theorem actual_1491_1 :
    FieldSelective.body.toMachine.transition 1491 1 =
      some ((1 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_298_1_0]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2983\t{now}"
      handle.flush
capture_cert in
theorem row_64_1491_1 : RowAt 1491 1 := by
  unfold RowAt
  rw [actual_1491_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2983\t{now}"
      handle.flush
capture_cert in
theorem actual_1492_0 :
    FieldSelective.body.toMachine.transition 1492 0 =
      some ((0 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_298_0_1]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2984\t{now}"
      handle.flush
capture_cert in
theorem row_64_1492_0 : RowAt 1492 0 := by
  unfold RowAt
  rw [actual_1492_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2984\t{now}"
      handle.flush
capture_cert in
theorem actual_1492_1 :
    FieldSelective.body.toMachine.transition 1492 1 =
      some ((1 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_298_1_1]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2985\t{now}"
      handle.flush
capture_cert in
theorem row_64_1492_1 : RowAt 1492 1 := by
  unfold RowAt
  rw [actual_1492_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2985\t{now}"
      handle.flush
capture_cert in
theorem actual_1493_0 :
    FieldSelective.body.toMachine.transition 1493 0 =
      some ((0 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_298_0_2]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2986\t{now}"
      handle.flush
capture_cert in
theorem row_64_1493_0 : RowAt 1493 0 := by
  unfold RowAt
  rw [actual_1493_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2986\t{now}"
      handle.flush
capture_cert in
theorem actual_1493_1 :
    FieldSelective.body.toMachine.transition 1493 1 =
      some ((1 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_298_1_2]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2987\t{now}"
      handle.flush
capture_cert in
theorem row_64_1493_1 : RowAt 1493 1 := by
  unfold RowAt
  rw [actual_1493_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2987\t{now}"
      handle.flush
capture_cert in
theorem actual_1494_0 :
    FieldSelective.body.toMachine.transition 1494 0 =
      some ((0 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_298_0_3]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2988\t{now}"
      handle.flush
capture_cert in
theorem row_64_1494_0 : RowAt 1494 0 := by
  unfold RowAt
  rw [actual_1494_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2988\t{now}"
      handle.flush
capture_cert in
theorem actual_1494_1 :
    FieldSelective.body.toMachine.transition 1494 1 =
      some ((1 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_298_1_3]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2989\t{now}"
      handle.flush
capture_cert in
theorem row_64_1494_1 : RowAt 1494 1 := by
  unfold RowAt
  rw [actual_1494_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2989\t{now}"
      handle.flush
capture_cert in
theorem actual_1495_0 :
    FieldSelective.body.toMachine.transition 1495 0 =
      some ((0 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_298_0_4]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2990\t{now}"
      handle.flush
capture_cert in
theorem row_64_1495_0 : RowAt 1495 0 := by
  unfold RowAt
  rw [actual_1495_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2990\t{now}"
      handle.flush
capture_cert in
theorem actual_1495_1 :
    FieldSelective.body.toMachine.transition 1495 1 =
      some ((1 : Fin 2), .right, (534422 : Fin 573802)) := by
  rewrite [← main_address_298_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 298 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_298_1_4]
  dsimp only [Option.bind]
  rewrite [← address_296, findReturn_syntax,
    find_216_296]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 216 syntax_216 syntax_eq_216
      rank_216_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_216_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2991\t{now}"
      handle.flush
capture_cert in
theorem row_64_1495_1 : RowAt 1495 1 := by
  unfold RowAt
  rw [actual_1495_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2991\t{now}"
      handle.flush
capture_cert in
theorem actual_31_0 :
    FieldSelective.body.toMachine.transition 31 0 =
      some ((0 : Fin 2), .right, (533352 : Fin 573802)) := by
  rewrite [← main_address_6_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_6_0_0]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t62\t{now}"
      handle.flush
capture_cert in
theorem row_64_31_0 : RowAt 31 0 := by
  unfold RowAt
  rw [actual_31_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t62\t{now}"
      handle.flush
capture_cert in
theorem actual_31_1 :
    FieldSelective.body.toMachine.transition 31 1 =
      some ((1 : Fin 2), .right, (533352 : Fin 573802)) := by
  rewrite [← main_address_6_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_6_1_0]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2_0_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t63\t{now}"
      handle.flush
capture_cert in
theorem row_64_31_1 : RowAt 31 1 := by
  unfold RowAt
  rw [actual_31_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t63\t{now}"
      handle.flush
capture_cert in
theorem actual_32_0 :
    FieldSelective.body.toMachine.transition 32 0 =
      some ((0 : Fin 2), .right, (533353 : Fin 573802)) := by
  rewrite [← main_address_6_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_6_0_1]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t64\t{now}"
      handle.flush
capture_cert in
theorem row_64_32_0 : RowAt 32 0 := by
  unfold RowAt
  rw [actual_32_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t64\t{now}"
      handle.flush
capture_cert in
theorem actual_32_1 :
    FieldSelective.body.toMachine.transition 32 1 =
      some ((1 : Fin 2), .right, (533353 : Fin 573802)) := by
  rewrite [← main_address_6_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_6_1_1]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t65\t{now}"
      handle.flush
capture_cert in
theorem row_64_32_1 : RowAt 32 1 := by
  unfold RowAt
  rw [actual_32_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t65\t{now}"
      handle.flush
capture_cert in
theorem actual_33_0 :
    FieldSelective.body.toMachine.transition 33 0 =
      some ((0 : Fin 2), .right, (533354 : Fin 573802)) := by
  rewrite [← main_address_6_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_6_0_2]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2_0_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t66\t{now}"
      handle.flush
capture_cert in
theorem row_64_33_0 : RowAt 33 0 := by
  unfold RowAt
  rw [actual_33_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t66\t{now}"
      handle.flush
capture_cert in
theorem actual_33_1 :
    FieldSelective.body.toMachine.transition 33 1 =
      some ((1 : Fin 2), .right, (533354 : Fin 573802)) := by
  rewrite [← main_address_6_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_6_1_2]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2_0_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t67\t{now}"
      handle.flush
capture_cert in
theorem row_64_33_1 : RowAt 33 1 := by
  unfold RowAt
  rw [actual_33_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t67\t{now}"
      handle.flush
capture_cert in
theorem actual_34_0 :
    FieldSelective.body.toMachine.transition 34 0 =
      some ((0 : Fin 2), .right, (533355 : Fin 573802)) := by
  rewrite [← main_address_6_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_6_0_3]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2_0_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t68\t{now}"
      handle.flush
capture_cert in
theorem row_64_34_0 : RowAt 34 0 := by
  unfold RowAt
  rw [actual_34_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t68\t{now}"
      handle.flush
capture_cert in
theorem actual_34_1 :
    FieldSelective.body.toMachine.transition 34 1 =
      some ((1 : Fin 2), .right, (533355 : Fin 573802)) := by
  rewrite [← main_address_6_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_6_1_3]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2_0_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t69\t{now}"
      handle.flush
capture_cert in
theorem row_64_34_1 : RowAt 34 1 := by
  unfold RowAt
  rw [actual_34_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t69\t{now}"
      handle.flush
capture_cert in
theorem actual_35_0 :
    FieldSelective.body.toMachine.transition 35 0 =
      some ((0 : Fin 2), .right, (533356 : Fin 573802)) := by
  rewrite [← main_address_6_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_6_0_4]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t70\t{now}"
      handle.flush
capture_cert in
theorem row_64_35_0 : RowAt 35 0 := by
  unfold RowAt
  rw [actual_35_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t70\t{now}"
      handle.flush
capture_cert in
theorem actual_35_1 :
    FieldSelective.body.toMachine.transition 35 1 =
      some ((1 : Fin 2), .right, (533356 : Fin 573802)) := by
  rewrite [← main_address_6_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 6 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_6_1_4]
  dsimp only [Option.bind]
  rewrite [← address_2, findReturn_syntax,
    find_2_2]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2 syntax_2 syntax_eq_2
      rank_2_0 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t71\t{now}"
      handle.flush
capture_cert in
theorem row_64_35_1 : RowAt 35 1 := by
  unfold RowAt
  rw [actual_35_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t71\t{now}"
      handle.flush
capture_cert in
theorem actual_2_0 :
    FieldSelective.body.toMachine.transition 2 0 =
      some ((0 : Fin 2), .right, (533348 : Fin 573802)) := by
  rewrite [← main_address_0_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_0_0_1]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_1_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t4\t{now}"
      handle.flush
capture_cert in
theorem row_64_2_0 : RowAt 2 0 := by
  unfold RowAt
  rw [actual_2_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t4\t{now}"
      handle.flush
capture_cert in
theorem actual_2_1 :
    FieldSelective.body.toMachine.transition 2 1 =
      some ((1 : Fin 2), .right, (533348 : Fin 573802)) := by
  rewrite [← main_address_0_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_0_1_1]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_1_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t5\t{now}"
      handle.flush
capture_cert in
theorem row_64_2_1 : RowAt 2 1 := by
  unfold RowAt
  rw [actual_2_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t5\t{now}"
      handle.flush
capture_cert in
theorem actual_3_0 :
    FieldSelective.body.toMachine.transition 3 0 =
      some ((0 : Fin 2), .right, (533349 : Fin 573802)) := by
  rewrite [← main_address_0_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_0_0_2]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_1_0_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t6\t{now}"
      handle.flush
capture_cert in
theorem row_64_3_0 : RowAt 3 0 := by
  unfold RowAt
  rw [actual_3_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t6\t{now}"
      handle.flush
capture_cert in
theorem actual_3_1 :
    FieldSelective.body.toMachine.transition 3 1 =
      some ((1 : Fin 2), .right, (533349 : Fin 573802)) := by
  rewrite [← main_address_0_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_0_1_2]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_1_0_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t7\t{now}"
      handle.flush
capture_cert in
theorem row_64_3_1 : RowAt 3 1 := by
  unfold RowAt
  rw [actual_3_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t7\t{now}"
      handle.flush
capture_cert in
theorem actual_4_0 :
    FieldSelective.body.toMachine.transition 4 0 =
      some ((0 : Fin 2), .right, (533350 : Fin 573802)) := by
  rewrite [← main_address_0_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_0_0_3]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_1_0_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t8\t{now}"
      handle.flush
capture_cert in
theorem row_64_4_0 : RowAt 4 0 := by
  unfold RowAt
  rw [actual_4_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t8\t{now}"
      handle.flush
capture_cert in
theorem actual_4_1 :
    FieldSelective.body.toMachine.transition 4 1 =
      some ((1 : Fin 2), .right, (533350 : Fin 573802)) := by
  rewrite [← main_address_0_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_0_1_3]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_1_0_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t9\t{now}"
      handle.flush
capture_cert in
theorem row_64_4_1 : RowAt 4 1 := by
  unfold RowAt
  rw [actual_4_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t9\t{now}"
      handle.flush
capture_cert in
theorem actual_5_0 :
    FieldSelective.body.toMachine.transition 5 0 =
      some ((0 : Fin 2), .right, (533351 : Fin 573802)) := by
  rewrite [← main_address_0_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_0_0_4]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_1_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t10\t{now}"
      handle.flush
capture_cert in
theorem row_64_5_0 : RowAt 5 0 := by
  unfold RowAt
  rw [actual_5_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t10\t{now}"
      handle.flush
capture_cert in
theorem actual_5_1 :
    FieldSelective.body.toMachine.transition 5 1 =
      some ((1 : Fin 2), .right, (533351 : Fin 573802)) := by
  rewrite [← main_address_0_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 0 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_0_1_4]
  dsimp only [Option.bind]
  rewrite [← address_1, findReturn_syntax,
    find_1_1]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 1 syntax_1 syntax_eq_1
      rank_1_0 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_1_0_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t11\t{now}"
      handle.flush
capture_cert in
theorem row_64_5_1 : RowAt 5 1 := by
  unfold RowAt
  rw [actual_5_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t11\t{now}"
      handle.flush
capture_cert in
theorem actual_1481_0 :
    FieldSelective.body.toMachine.transition 1481 0 =
      some ((0 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_296_0_0]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2962\t{now}"
      handle.flush
capture_cert in
theorem row_64_1481_0 : RowAt 1481 0 := by
  unfold RowAt
  rw [actual_1481_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2962\t{now}"
      handle.flush
capture_cert in
theorem actual_1481_1 :
    FieldSelective.body.toMachine.transition 1481 1 =
      some ((1 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_296_1_0]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2963\t{now}"
      handle.flush
capture_cert in
theorem row_64_1481_1 : RowAt 1481 1 := by
  unfold RowAt
  rw [actual_1481_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2963\t{now}"
      handle.flush
capture_cert in
theorem actual_1482_0 :
    FieldSelective.body.toMachine.transition 1482 0 =
      some ((0 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_296_0_1]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2964\t{now}"
      handle.flush
capture_cert in
theorem row_64_1482_0 : RowAt 1482 0 := by
  unfold RowAt
  rw [actual_1482_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2964\t{now}"
      handle.flush
capture_cert in
theorem actual_1482_1 :
    FieldSelective.body.toMachine.transition 1482 1 =
      some ((1 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_296_1_1]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2965\t{now}"
      handle.flush
capture_cert in
theorem row_64_1482_1 : RowAt 1482 1 := by
  unfold RowAt
  rw [actual_1482_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2965\t{now}"
      handle.flush
capture_cert in
theorem actual_1483_0 :
    FieldSelective.body.toMachine.transition 1483 0 =
      some ((0 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_296_0_2]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2966\t{now}"
      handle.flush
capture_cert in
theorem row_64_1483_0 : RowAt 1483 0 := by
  unfold RowAt
  rw [actual_1483_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2966\t{now}"
      handle.flush
capture_cert in
theorem actual_1483_1 :
    FieldSelective.body.toMachine.transition 1483 1 =
      some ((1 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_296_1_2]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2967\t{now}"
      handle.flush
capture_cert in
theorem row_64_1483_1 : RowAt 1483 1 := by
  unfold RowAt
  rw [actual_1483_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2967\t{now}"
      handle.flush
capture_cert in
theorem actual_1484_0 :
    FieldSelective.body.toMachine.transition 1484 0 =
      some ((0 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_296_0_3]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2968\t{now}"
      handle.flush
capture_cert in
theorem row_64_1484_0 : RowAt 1484 0 := by
  unfold RowAt
  rw [actual_1484_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2968\t{now}"
      handle.flush
capture_cert in
theorem actual_1484_1 :
    FieldSelective.body.toMachine.transition 1484 1 =
      some ((1 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_296_1_3]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2969\t{now}"
      handle.flush
capture_cert in
theorem row_64_1484_1 : RowAt 1484 1 := by
  unfold RowAt
  rw [actual_1484_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2969\t{now}"
      handle.flush
capture_cert in
theorem actual_1485_0 :
    FieldSelective.body.toMachine.transition 1485 0 =
      some ((0 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_296_0_4]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2970\t{now}"
      handle.flush
capture_cert in
theorem row_64_1485_0 : RowAt 1485 0 := by
  unfold RowAt
  rw [actual_1485_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2970\t{now}"
      handle.flush
capture_cert in
theorem actual_1485_1 :
    FieldSelective.body.toMachine.transition 1485 1 =
      some ((1 : Fin 2), .right, (533341 : Fin 573802)) := by
  rewrite [← main_address_296_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 296 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_296_1_4]
  dsimp only [Option.bind]
  rewrite [FieldSelectiveLayout.findReturn_halt]
  rfl
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t2971\t{now}"
      handle.flush
capture_cert in
theorem row_64_1485_1 : RowAt 1485 1 := by
  unfold RowAt
  rw [actual_1485_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t2971\t{now}"
      handle.flush
capture_cert in
theorem actual_354130_0 :
    FieldSelective.body.toMachine.transition 354130 0 =
      some ((0 : Fin 2), .right, (354105 : Fin 573802)) := by
  rewrite [← main_address_70825_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70825 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70825_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70820 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70820_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t708260\t{now}"
      handle.flush
capture_cert in
theorem row_64_354130_0 : RowAt 354130 0 := by
  unfold RowAt
  rw [actual_354130_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t708260\t{now}"
      handle.flush
capture_cert in
theorem actual_354130_1 :
    FieldSelective.body.toMachine.transition 354130 1 =
      some ((1 : Fin 2), .right, (354105 : Fin 573802)) := by
  rewrite [← main_address_70825_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70825 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70825_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70820 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70820_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t708261\t{now}"
      handle.flush
capture_cert in
theorem row_64_354130_1 : RowAt 354130 1 := by
  unfold RowAt
  rw [actual_354130_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t708261\t{now}"
      handle.flush
capture_cert in
theorem actual_354129_0 :
    FieldSelective.body.toMachine.transition 354129 0 =
      some ((0 : Fin 2), .right, (354034 : Fin 573802)) := by
  rewrite [← main_address_70825_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70825 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70825_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70806 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70806_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t708258\t{now}"
      handle.flush
capture_cert in
theorem row_64_354129_0 : RowAt 354129 0 := by
  unfold RowAt
  rw [actual_354129_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t708258\t{now}"
      handle.flush
capture_cert in
theorem actual_354129_1 :
    FieldSelective.body.toMachine.transition 354129 1 =
      some ((1 : Fin 2), .right, (354034 : Fin 573802)) := by
  rewrite [← main_address_70825_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70825 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70825_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70806 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70806_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t708259\t{now}"
      handle.flush
capture_cert in
theorem row_64_354129_1 : RowAt 354129 1 := by
  unfold RowAt
  rw [actual_354129_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t708259\t{now}"
      handle.flush
capture_cert in
theorem actual_353135_0 :
    FieldSelective.body.toMachine.transition 353135 0 =
      some ((0 : Fin 2), .right, (353110 : Fin 573802)) := by
  rewrite [← main_address_70626_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70626 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70626_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70621 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70621_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t706270\t{now}"
      handle.flush
capture_cert in
theorem row_64_353135_0 : RowAt 353135 0 := by
  unfold RowAt
  rw [actual_353135_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t706270\t{now}"
      handle.flush
capture_cert in
theorem actual_353135_1 :
    FieldSelective.body.toMachine.transition 353135 1 =
      some ((1 : Fin 2), .right, (353110 : Fin 573802)) := by
  rewrite [← main_address_70626_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70626 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70626_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70621 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70621_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t706271\t{now}"
      handle.flush
capture_cert in
theorem row_64_353135_1 : RowAt 353135 1 := by
  unfold RowAt
  rw [actual_353135_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t706271\t{now}"
      handle.flush
capture_cert in
theorem actual_353134_0 :
    FieldSelective.body.toMachine.transition 353134 0 =
      some ((0 : Fin 2), .right, (353009 : Fin 573802)) := by
  rewrite [← main_address_70626_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70626 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70626_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70601 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70601_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t706268\t{now}"
      handle.flush
capture_cert in
theorem row_64_353134_0 : RowAt 353134 0 := by
  unfold RowAt
  rw [actual_353134_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t706268\t{now}"
      handle.flush
capture_cert in
theorem actual_353134_1 :
    FieldSelective.body.toMachine.transition 353134 1 =
      some ((1 : Fin 2), .right, (353009 : Fin 573802)) := by
  rewrite [← main_address_70626_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70626 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70626_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70601 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70601_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t706269\t{now}"
      handle.flush
capture_cert in
theorem row_64_353134_1 : RowAt 353134 1 := by
  unfold RowAt
  rw [actual_353134_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t706269\t{now}"
      handle.flush
capture_cert in
theorem actual_352010_0 :
    FieldSelective.body.toMachine.transition 352010 0 =
      some ((0 : Fin 2), .right, (351985 : Fin 573802)) := by
  rewrite [← main_address_70401_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70401 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70401_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70396 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70396_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t704020\t{now}"
      handle.flush
capture_cert in
theorem row_64_352010_0 : RowAt 352010 0 := by
  unfold RowAt
  rw [actual_352010_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t704020\t{now}"
      handle.flush
capture_cert in
theorem actual_352010_1 :
    FieldSelective.body.toMachine.transition 352010 1 =
      some ((1 : Fin 2), .right, (351985 : Fin 573802)) := by
  rewrite [← main_address_70401_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70401 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70401_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70396 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70396_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t704021\t{now}"
      handle.flush
capture_cert in
theorem row_64_352010_1 : RowAt 352010 1 := by
  unfold RowAt
  rw [actual_352010_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t704021\t{now}"
      handle.flush
capture_cert in
theorem actual_352009_0 :
    FieldSelective.body.toMachine.transition 352009 0 =
      some ((0 : Fin 2), .right, (351884 : Fin 573802)) := by
  rewrite [← main_address_70401_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70401 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_70401_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 70376 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_70376_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t704018\t{now}"
      handle.flush
capture_cert in
theorem row_64_352009_0 : RowAt 352009 0 := by
  unfold RowAt
  rw [actual_352009_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t704018\t{now}"
      handle.flush
capture_cert in
theorem actual_352009_1 :
    FieldSelective.body.toMachine.transition 352009 1 =
      some ((1 : Fin 2), .right, (351884 : Fin 573802)) := by
  rewrite [← main_address_70401_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 70401 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_70401_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 70376 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_70376_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t704019\t{now}"
      handle.flush
capture_cert in
theorem row_64_352009_1 : RowAt 352009 1 := by
  unfold RowAt
  rw [actual_352009_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t704019\t{now}"
      handle.flush
capture_cert in
theorem actual_349700_0 :
    FieldSelective.body.toMachine.transition 349700 0 =
      some ((0 : Fin 2), .right, (349675 : Fin 573802)) := by
  rewrite [← main_address_69939_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69939 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69939_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69934 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69934_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t699400\t{now}"
      handle.flush
capture_cert in
theorem row_64_349700_0 : RowAt 349700 0 := by
  unfold RowAt
  rw [actual_349700_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t699400\t{now}"
      handle.flush
capture_cert in
theorem actual_349700_1 :
    FieldSelective.body.toMachine.transition 349700 1 =
      some ((1 : Fin 2), .right, (349675 : Fin 573802)) := by
  rewrite [← main_address_69939_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69939 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69939_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69934 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69934_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t699401\t{now}"
      handle.flush
capture_cert in
theorem row_64_349700_1 : RowAt 349700 1 := by
  unfold RowAt
  rw [actual_349700_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t699401\t{now}"
      handle.flush
capture_cert in
theorem actual_349699_0 :
    FieldSelective.body.toMachine.transition 349699 0 =
      some ((0 : Fin 2), .right, (349544 : Fin 573802)) := by
  rewrite [← main_address_69939_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69939 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69939_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69908 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69908_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t699398\t{now}"
      handle.flush
capture_cert in
theorem row_64_349699_0 : RowAt 349699 0 := by
  unfold RowAt
  rw [actual_349699_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t699398\t{now}"
      handle.flush
capture_cert in
theorem actual_349699_1 :
    FieldSelective.body.toMachine.transition 349699 1 =
      some ((1 : Fin 2), .right, (349544 : Fin 573802)) := by
  rewrite [← main_address_69939_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69939 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69939_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69908 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69908_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t699399\t{now}"
      handle.flush
capture_cert in
theorem row_64_349699_1 : RowAt 349699 1 := by
  unfold RowAt
  rw [actual_349699_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t699399\t{now}"
      handle.flush
capture_cert in
theorem actual_348540_0 :
    FieldSelective.body.toMachine.transition 348540 0 =
      some ((0 : Fin 2), .right, (348515 : Fin 573802)) := by
  rewrite [← main_address_69707_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69707 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69707_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69702 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69702_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t697080\t{now}"
      handle.flush
capture_cert in
theorem row_64_348540_0 : RowAt 348540 0 := by
  unfold RowAt
  rw [actual_348540_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t697080\t{now}"
      handle.flush
capture_cert in
theorem actual_348540_1 :
    FieldSelective.body.toMachine.transition 348540 1 =
      some ((1 : Fin 2), .right, (348515 : Fin 573802)) := by
  rewrite [← main_address_69707_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69707 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69707_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69702 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69702_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t697081\t{now}"
      handle.flush
capture_cert in
theorem row_64_348540_1 : RowAt 348540 1 := by
  unfold RowAt
  rw [actual_348540_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t697081\t{now}"
      handle.flush
capture_cert in
theorem actual_348539_0 :
    FieldSelective.body.toMachine.transition 348539 0 =
      some ((0 : Fin 2), .right, (348444 : Fin 573802)) := by
  rewrite [← main_address_69707_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69707 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69707_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69688 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69688_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t697078\t{now}"
      handle.flush
capture_cert in
theorem row_64_348539_0 : RowAt 348539 0 := by
  unfold RowAt
  rw [actual_348539_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t697078\t{now}"
      handle.flush
capture_cert in
theorem actual_348539_1 :
    FieldSelective.body.toMachine.transition 348539 1 =
      some ((1 : Fin 2), .right, (348444 : Fin 573802)) := by
  rewrite [← main_address_69707_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69707 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69707_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69688 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69688_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t697079\t{now}"
      handle.flush
capture_cert in
theorem row_64_348539_1 : RowAt 348539 1 := by
  unfold RowAt
  rw [actual_348539_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t697079\t{now}"
      handle.flush
capture_cert in
theorem actual_347190_0 :
    FieldSelective.body.toMachine.transition 347190 0 =
      some ((0 : Fin 2), .right, (563351 : Fin 573802)) := by
  rewrite [← main_address_69437_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69437 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69437_0_4]
  dsimp only [Option.bind]
  rewrite [← address_69432, findReturn_syntax,
    find_2028_69432]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2028 syntax_2028 syntax_eq_2028
      rank_2028_13 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2028_13_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t694380\t{now}"
      handle.flush
capture_cert in
theorem row_64_347190_0 : RowAt 347190 0 := by
  unfold RowAt
  rw [actual_347190_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t694380\t{now}"
      handle.flush
capture_cert in
theorem actual_347190_1 :
    FieldSelective.body.toMachine.transition 347190 1 =
      some ((0 : Fin 2), .right, (563351 : Fin 573802)) := by
  rewrite [← main_address_69437_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69437 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69437_1_4]
  dsimp only [Option.bind]
  rewrite [← address_69432, findReturn_syntax,
    find_2028_69432]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2028 syntax_2028 syntax_eq_2028
      rank_2028_13 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2028_13_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t694381\t{now}"
      handle.flush
capture_cert in
theorem row_64_347190_1 : RowAt 347190 1 := by
  unfold RowAt
  rw [actual_347190_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t694381\t{now}"
      handle.flush
capture_cert in
theorem actual_347189_0 :
    FieldSelective.body.toMachine.transition 347189 0 =
      some ((0 : Fin 2), .right, (563335 : Fin 573802)) := by
  rewrite [← main_address_69437_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69437 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69437_0_3]
  dsimp only [Option.bind]
  rewrite [← address_69424, findReturn_syntax,
    find_2028_69424]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2028 syntax_2028 syntax_eq_2028
      rank_2028_10 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2028_10_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t694378\t{now}"
      handle.flush
capture_cert in
theorem row_64_347189_0 : RowAt 347189 0 := by
  unfold RowAt
  rw [actual_347189_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t694378\t{now}"
      handle.flush
capture_cert in
theorem actual_347189_1 :
    FieldSelective.body.toMachine.transition 347189 1 =
      some ((0 : Fin 2), .right, (563335 : Fin 573802)) := by
  rewrite [← main_address_69437_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69437 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69437_1_3]
  dsimp only [Option.bind]
  rewrite [← address_69424, findReturn_syntax,
    find_2028_69424]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2028 syntax_2028 syntax_eq_2028
      rank_2028_10 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2028_10_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t694379\t{now}"
      handle.flush
capture_cert in
theorem row_64_347189_1 : RowAt 347189 1 := by
  unfold RowAt
  rw [actual_347189_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t694379\t{now}"
      handle.flush
capture_cert in
theorem actual_345780_0 :
    FieldSelective.body.toMachine.transition 345780 0 =
      some ((0 : Fin 2), .right, (345755 : Fin 573802)) := by
  rewrite [← main_address_69155_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69155 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69155_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69150 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69150_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t691560\t{now}"
      handle.flush
capture_cert in
theorem row_64_345780_0 : RowAt 345780 0 := by
  unfold RowAt
  rw [actual_345780_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t691560\t{now}"
      handle.flush
capture_cert in
theorem actual_345780_1 :
    FieldSelective.body.toMachine.transition 345780 1 =
      some ((1 : Fin 2), .right, (345755 : Fin 573802)) := by
  rewrite [← main_address_69155_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69155 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69155_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69150 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69150_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t691561\t{now}"
      handle.flush
capture_cert in
theorem row_64_345780_1 : RowAt 345780 1 := by
  unfold RowAt
  rw [actual_345780_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t691561\t{now}"
      handle.flush
capture_cert in
theorem actual_345779_0 :
    FieldSelective.body.toMachine.transition 345779 0 =
      some ((0 : Fin 2), .right, (345684 : Fin 573802)) := by
  rewrite [← main_address_69155_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69155 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69155_0_3]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 69136 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_69136_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t691558\t{now}"
      handle.flush
capture_cert in
theorem row_64_345779_0 : RowAt 345779 0 := by
  unfold RowAt
  rw [actual_345779_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t691558\t{now}"
      handle.flush
capture_cert in
theorem actual_345779_1 :
    FieldSelective.body.toMachine.transition 345779 1 =
      some ((1 : Fin 2), .right, (345684 : Fin 573802)) := by
  rewrite [← main_address_69155_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69155 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69155_1_3]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 69136 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_69136_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t691559\t{now}"
      handle.flush
capture_cert in
theorem row_64_345779_1 : RowAt 345779 1 := by
  unfold RowAt
  rw [actual_345779_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t691559\t{now}"
      handle.flush
capture_cert in
theorem actual_345055_0 :
    FieldSelective.body.toMachine.transition 345055 0 =
      some ((0 : Fin 2), .right, (563131 : Fin 573802)) := by
  rewrite [← main_address_69010_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69010 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69010_0_4]
  dsimp only [Option.bind]
  rewrite [← address_69005, findReturn_syntax,
    find_2014_69005]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2014 syntax_2014 syntax_eq_2014
      rank_2014_13 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2014_13_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t690110\t{now}"
      handle.flush
capture_cert in
theorem row_64_345055_0 : RowAt 345055 0 := by
  unfold RowAt
  rw [actual_345055_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t690110\t{now}"
      handle.flush
capture_cert in
theorem actual_345055_1 :
    FieldSelective.body.toMachine.transition 345055 1 =
      some ((0 : Fin 2), .right, (563131 : Fin 573802)) := by
  rewrite [← main_address_69010_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69010 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69010_1_4]
  dsimp only [Option.bind]
  rewrite [← address_69005, findReturn_syntax,
    find_2014_69005]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 2014 syntax_2014 syntax_eq_2014
      rank_2014_13 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_2014_13_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t690111\t{now}"
      handle.flush
capture_cert in
theorem row_64_345055_1 : RowAt 345055 1 := by
  unfold RowAt
  rw [actual_345055_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t690111\t{now}"
      handle.flush
capture_cert in
theorem actual_345054_0 :
    FieldSelective.body.toMachine.transition 345054 0 =
      some ((1 : Fin 2), .right, (563115 : Fin 573802)) := by
  rewrite [← main_address_69010_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69010 3) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_69010_0_3]
  dsimp only [Option.bind]
  rewrite [← address_68997, findReturn_syntax,
    find_2014_68997]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2014 syntax_2014 syntax_eq_2014
      rank_2014_10 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2014_10_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t690108\t{now}"
      handle.flush
capture_cert in
theorem row_64_345054_0 : RowAt 345054 0 := by
  unfold RowAt
  rw [actual_345054_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t690108\t{now}"
      handle.flush
capture_cert in
theorem actual_345054_1 :
    FieldSelective.body.toMachine.transition 345054 1 =
      some ((1 : Fin 2), .right, (563115 : Fin 573802)) := by
  rewrite [← main_address_69010_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 69010 3) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_69010_1_3]
  dsimp only [Option.bind]
  rewrite [← address_68997, findReturn_syntax,
    find_2014_68997]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 2014 syntax_2014 syntax_eq_2014
      rank_2014_10 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_2014_10_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t690109\t{now}"
      handle.flush
capture_cert in
theorem row_64_345054_1 : RowAt 345054 1 := by
  unfold RowAt
  rw [actual_345054_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t690109\t{now}"
      handle.flush
capture_cert in
theorem actual_266735_0 :
    FieldSelective.body.toMachine.transition 266735 0 =
      some ((0 : Fin 2), .right, (266730 : Fin 573802)) := by
  rewrite [← main_address_53346_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 53346 4) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_53346_0_4]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.right,
    mainIndex 53345 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) main_address_53345_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t533470\t{now}"
      handle.flush
capture_cert in
theorem row_64_266735_0 : RowAt 266735 0 := by
  unfold RowAt
  rw [actual_266735_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t533470\t{now}"
      handle.flush
capture_cert in
theorem actual_266735_1 :
    FieldSelective.body.toMachine.transition 266735 1 =
      some ((1 : Fin 2), .right, (266730 : Fin 573802)) := by
  rewrite [← main_address_53346_4]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 53346 4) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_53346_1_4]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.right,
    mainIndex 53345 4) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) main_address_53345_4
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t533471\t{now}"
      handle.flush
capture_cert in
theorem row_64_266735_1 : RowAt 266735 1 := by
  unfold RowAt
  rw [actual_266735_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t533471\t{now}"
      handle.flush
capture_cert in
theorem actual_553575_0 :
    FieldSelective.body.toMachine.transition 553575 0 =
      some ((0 : Fin 2), .left, (228404 : Fin 573802)) := by
  rewrite [← bounce_address_1427_9_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1427 syntax_1427 syntax_eq_1427 rank_1427_9 3)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1427_9, address_45680]
  change some ((0 : Fin 2), Dir.left, mainIndex 45680 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_45680_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1107150\t{now}"
      handle.flush
capture_cert in
theorem row_64_553575_0 : RowAt 553575 0 := by
  unfold RowAt
  rw [actual_553575_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1107150\t{now}"
      handle.flush
capture_cert in
theorem actual_553575_1 :
    FieldSelective.body.toMachine.transition 553575 1 =
      some ((1 : Fin 2), .left, (228404 : Fin 573802)) := by
  rewrite [← bounce_address_1427_9_3]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1427 syntax_1427 syntax_eq_1427 rank_1427_9 3)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1427_9, address_45680]
  change some ((1 : Fin 2), Dir.left, mainIndex 45680 3) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_45680_3
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1107151\t{now}"
      handle.flush
capture_cert in
theorem row_64_553575_1 : RowAt 553575 1 := by
  unfold RowAt
  rw [actual_553575_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1107151\t{now}"
      handle.flush
capture_cert in
theorem actual_133367_0 :
    FieldSelective.body.toMachine.transition 133367 0 =
      some ((0 : Fin 2), .right, (545853 : Fin 573802)) := by
  rewrite [← main_address_26673_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 26673 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_26673_0_1]
  dsimp only [Option.bind]
  rewrite [← address_26644, findReturn_syntax,
    find_957_26644]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 957 syntax_957 syntax_eq_957
      rank_957_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_957_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t266734\t{now}"
      handle.flush
capture_cert in
theorem row_64_133367_0 : RowAt 133367 0 := by
  unfold RowAt
  rw [actual_133367_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t266734\t{now}"
      handle.flush
capture_cert in
theorem actual_133367_1 :
    FieldSelective.body.toMachine.transition 133367 1 =
      some ((1 : Fin 2), .right, (545853 : Fin 573802)) := by
  rewrite [← main_address_26673_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 26673 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_26673_1_1]
  dsimp only [Option.bind]
  rewrite [← address_26644, findReturn_syntax,
    find_957_26644]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 957 syntax_957 syntax_eq_957
      rank_957_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_957_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t266735\t{now}"
      handle.flush
capture_cert in
theorem row_64_133367_1 : RowAt 133367 1 := by
  unfold RowAt
  rw [actual_133367_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t266735\t{now}"
      handle.flush
capture_cert in
theorem actual_543458_0 :
    FieldSelective.body.toMachine.transition 543458 0 =
      some ((0 : Fin 2), .left, (108667 : Fin 573802)) := by
  rewrite [← bounce_address_793_0_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 793 syntax_793 syntax_eq_793 rank_793_0 1)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_793_0, address_21733]
  change some ((0 : Fin 2), Dir.left, mainIndex 21733 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_21733_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1086916\t{now}"
      handle.flush
capture_cert in
theorem row_64_543458_0 : RowAt 543458 0 := by
  unfold RowAt
  rw [actual_543458_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1086916\t{now}"
      handle.flush
capture_cert in
theorem actual_543458_1 :
    FieldSelective.body.toMachine.transition 543458 1 =
      some ((1 : Fin 2), .left, (108667 : Fin 573802)) := by
  rewrite [← bounce_address_793_0_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 793 syntax_793 syntax_eq_793 rank_793_0 1)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_793_0, address_21733]
  change some ((1 : Fin 2), Dir.left, mainIndex 21733 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_21733_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1086917\t{now}"
      handle.flush
capture_cert in
theorem row_64_543458_1 : RowAt 543458 1 := by
  unfold RowAt
  rw [actual_543458_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1086917\t{now}"
      handle.flush
capture_cert in
theorem actual_400102_0 :
    FieldSelective.body.toMachine.transition 400102 0 =
      some ((0 : Fin 2), .right, (542233 : Fin 573802)) := by
  rewrite [← main_address_80020_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 80020 1) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_80020_0_1]
  dsimp only [Option.bind]
  rewrite [← address_18791, findReturn_syntax,
    find_713_18791]
  change some ((0 : Fin 2), Dir.right,
    bounceIndex 713 syntax_713 syntax_eq_713
      rank_713_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.right, next)) bounce_address_713_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t800204\t{now}"
      handle.flush
capture_cert in
theorem row_64_400102_0 : RowAt 400102 0 := by
  unfold RowAt
  rw [actual_400102_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t800204\t{now}"
      handle.flush
capture_cert in
theorem actual_400102_1 :
    FieldSelective.body.toMachine.transition 400102 1 =
      some ((1 : Fin 2), .right, (542233 : Fin 573802)) := by
  rewrite [← main_address_80020_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 80020 1) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_80020_1_1]
  dsimp only [Option.bind]
  rewrite [← address_18791, findReturn_syntax,
    find_713_18791]
  change some ((1 : Fin 2), Dir.right,
    bounceIndex 713 syntax_713 syntax_eq_713
      rank_713_0 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.right, next)) bounce_address_713_0_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t800205\t{now}"
      handle.flush
capture_cert in
theorem row_64_400102_1 : RowAt 400102 1 := by
  unfold RowAt
  rw [actual_400102_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t800205\t{now}"
      handle.flush
capture_cert in
theorem actual_563693_0 :
    FieldSelective.body.toMachine.transition 563693 0 =
      some ((0 : Fin 2), .left, (351932 : Fin 573802)) := by
  rewrite [← bounce_address_2050_15_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 2050 syntax_2050 syntax_eq_2050 rank_2050_15 1)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_2050_15, address_70386]
  change some ((0 : Fin 2), Dir.left, mainIndex 70386 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_70386_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1127386\t{now}"
      handle.flush
capture_cert in
theorem row_64_563693_0 : RowAt 563693 0 := by
  unfold RowAt
  rw [actual_563693_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1127386\t{now}"
      handle.flush
capture_cert in
theorem actual_563693_1 :
    FieldSelective.body.toMachine.transition 563693 1 =
      some ((1 : Fin 2), .left, (351932 : Fin 573802)) := by
  rewrite [← bounce_address_2050_15_1]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 2050 syntax_2050 syntax_eq_2050 rank_2050_15 1)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_2050_15, address_70386]
  change some ((1 : Fin 2), Dir.left, mainIndex 70386 1) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_70386_1
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1127387\t{now}"
      handle.flush
capture_cert in
theorem row_64_563693_1 : RowAt 563693 1 := by
  unfold RowAt
  rw [actual_563693_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1127387\t{now}"
      handle.flush
capture_cert in
theorem actual_66683_0 :
    FieldSelective.body.toMachine.transition 66683 0 =
      some ((0 : Fin 2), .left, (66678 : Fin 573802)) := by
  rewrite [← main_address_13336_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 13336 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_13336_0_2]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.left,
    mainIndex 13335 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_13335_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t133366\t{now}"
      handle.flush
capture_cert in
theorem row_64_66683_0 : RowAt 66683 0 := by
  unfold RowAt
  rw [actual_66683_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t133366\t{now}"
      handle.flush
capture_cert in
theorem actual_66683_1 :
    FieldSelective.body.toMachine.transition 66683 1 =
      some ((1 : Fin 2), .left, (66678 : Fin 573802)) := by
  rewrite [← main_address_13336_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 13336 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_13336_1_2]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.left,
    mainIndex 13335 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_13335_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t133367\t{now}"
      handle.flush
capture_cert in
theorem row_64_66683_1 : RowAt 66683 1 := by
  unfold RowAt
  rw [actual_66683_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t133367\t{now}"
      handle.flush
capture_cert in
theorem actual_538399_0 :
    FieldSelective.body.toMachine.transition 538399 0 =
      some ((0 : Fin 2), .left, (45653 : Fin 573802)) := by
  rewrite [← bounce_address_496_5_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 496 syntax_496 syntax_eq_496 rank_496_5 2)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_496_5, address_9130]
  change some ((0 : Fin 2), Dir.left, mainIndex 9130 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_9130_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1076798\t{now}"
      handle.flush
capture_cert in
theorem row_64_538399_0 : RowAt 538399 0 := by
  unfold RowAt
  rw [actual_538399_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1076798\t{now}"
      handle.flush
capture_cert in
theorem actual_538399_1 :
    FieldSelective.body.toMachine.transition 538399 1 =
      some ((1 : Fin 2), .left, (45653 : Fin 573802)) := by
  rewrite [← bounce_address_496_5_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 496 syntax_496 syntax_eq_496 rank_496_5 2)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_496_5, address_9130]
  change some ((1 : Fin 2), Dir.left, mainIndex 9130 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_9130_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1076799\t{now}"
      handle.flush
capture_cert in
theorem row_64_538399_1 : RowAt 538399 1 := by
  unfold RowAt
  rw [actual_538399_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1076799\t{now}"
      handle.flush
capture_cert in
theorem actual_333418_0 :
    FieldSelective.body.toMachine.transition 333418 0 =
      some ((0 : Fin 2), .left, (333413 : Fin 573802)) := by
  rewrite [← main_address_66683_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 66683 2) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_66683_0_2]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.left,
    mainIndex 66682 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_66682_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t666836\t{now}"
      handle.flush
capture_cert in
theorem row_64_333418_0 : RowAt 333418 0 := by
  unfold RowAt
  rw [actual_333418_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t666836\t{now}"
      handle.flush
capture_cert in
theorem actual_333418_1 :
    FieldSelective.body.toMachine.transition 333418 1 =
      some ((1 : Fin 2), .left, (333413 : Fin 573802)) := by
  rewrite [← main_address_66683_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 66683 2) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_66683_1_2]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.left,
    mainIndex 66682 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_66682_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t666837\t{now}"
      handle.flush
capture_cert in
theorem row_64_333418_1 : RowAt 333418 1 := by
  unfold RowAt
  rw [actual_333418_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t666837\t{now}"
      handle.flush
capture_cert in
theorem actual_558634_0 :
    FieldSelective.body.toMachine.transition 558634 0 =
      some ((0 : Fin 2), .left, (291218 : Fin 573802)) := by
  rewrite [← bounce_address_1743_0_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1743 syntax_1743 syntax_eq_1743 rank_1743_0 2)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1743_0, address_58243]
  change some ((0 : Fin 2), Dir.left, mainIndex 58243 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_58243_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1117268\t{now}"
      handle.flush
capture_cert in
theorem row_64_558634_0 : RowAt 558634 0 := by
  unfold RowAt
  rw [actual_558634_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1117268\t{now}"
      handle.flush
capture_cert in
theorem actual_558634_1 :
    FieldSelective.body.toMachine.transition 558634 1 =
      some ((1 : Fin 2), .left, (291218 : Fin 573802)) := by
  rewrite [← bounce_address_1743_0_2]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1743 syntax_1743 syntax_eq_1743 rank_1743_0 2)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1743_0, address_58243]
  change some ((1 : Fin 2), Dir.left, mainIndex 58243 2) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_58243_2
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1117269\t{now}"
      handle.flush
capture_cert in
theorem row_64_558634_1 : RowAt 558634 1 := by
  unfold RowAt
  rw [actual_558634_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1117269\t{now}"
      handle.flush
capture_cert in
theorem actual_200051_0 :
    FieldSelective.body.toMachine.transition 200051 0 =
      some ((0 : Fin 2), .left, (200046 : Fin 573802)) := by
  rewrite [← main_address_40010_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 40010 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_40010_0_0]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.left,
    mainIndex 40009 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_40009_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t400102\t{now}"
      handle.flush
capture_cert in
theorem row_64_200051_0 : RowAt 200051 0 := by
  unfold RowAt
  rw [actual_200051_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t400102\t{now}"
      handle.flush
capture_cert in
theorem actual_200051_1 :
    FieldSelective.body.toMachine.transition 200051 1 =
      some ((1 : Fin 2), .left, (200046 : Fin 573802)) := by
  rewrite [← main_address_40010_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 40010 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_40010_1_0]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.left,
    mainIndex 40009 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_40009_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t400103\t{now}"
      handle.flush
capture_cert in
theorem row_64_200051_1 : RowAt 200051 1 := by
  unfold RowAt
  rw [actual_200051_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t400103\t{now}"
      handle.flush
capture_cert in
theorem actual_548517_0 :
    FieldSelective.body.toMachine.transition 548517 0 =
      some ((0 : Fin 2), .left, (163611 : Fin 573802)) := by
  rewrite [← bounce_address_1130_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1130 syntax_1130 syntax_eq_1130 rank_1130_0 0)
    0 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1130_0, address_32722]
  change some ((0 : Fin 2), Dir.left, mainIndex 32722 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_32722_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1097034\t{now}"
      handle.flush
capture_cert in
theorem row_64_548517_0 : RowAt 548517 0 := by
  unfold RowAt
  rw [actual_548517_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1097034\t{now}"
      handle.flush
capture_cert in
theorem actual_548517_1 :
    FieldSelective.body.toMachine.transition 548517 1 =
      some ((1 : Fin 2), .left, (163611 : Fin 573802)) := by
  rewrite [← bounce_address_1130_0_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (bounceIndex 1130 syntax_1130 syntax_eq_1130 rank_1130_0 0)
    1 = _
  unfold bounceIndex
  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,
    target_1130_0, address_32722]
  change some ((1 : Fin 2), Dir.left, mainIndex 32722 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_32722_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t1097035\t{now}"
      handle.flush
capture_cert in
theorem row_64_548517_1 : RowAt 548517 1 := by
  unfold RowAt
  rw [actual_548517_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t1097035\t{now}"
      handle.flush
capture_cert in
theorem actual_466786_0 :
    FieldSelective.body.toMachine.transition 466786 0 =
      some ((0 : Fin 2), .left, (466776 : Fin 573802)) := by
  rewrite [← main_address_93357_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 93357 0) 0 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_0,
    post_live, aux_93357_0_0]
  dsimp only [Option.bind]
  change some ((0 : Fin 2), Dir.left,
    mainIndex 93355 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((0 : Fin 2), Dir.left, next)) main_address_93355_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t933572\t{now}"
      handle.flush
capture_cert in
theorem row_64_466786_0 : RowAt 466786 0 := by
  unfold RowAt
  rw [actual_466786_0]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t933572\t{now}"
      handle.flush
capture_cert in
theorem actual_466786_1 :
    FieldSelective.body.toMachine.transition 466786 1 =
      some ((1 : Fin 2), .left, (466711 : Fin 573802)) := by
  rewrite [← main_address_93357_0]
  change (SelectiveBinary.compile FieldPacked.post
    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn).transition
    (mainIndex 93357 0) 1 = _
  unfold mainIndex
  rewrite [SelectiveBinary.compile_main, decode_bit_1,
    post_live, aux_93357_1_0]
  dsimp only [Option.bind]
  change some ((1 : Fin 2), Dir.left,
    mainIndex 93342 0) = _
  exact congrArg (fun next : Fin 573802 ↦
    some ((1 : Fin 2), Dir.left, next)) main_address_93342_0
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"actual-64\t933573\t{now}"
      handle.flush
capture_cert in
theorem row_64_466786_1 : RowAt 466786 1 := by
  unfold RowAt
  rw [actual_466786_1]
  decide +kernel
run_cmd do
  let now ← Lean.Elab.Command.liftIO IO.monoMsNow.toIO
  Lean.Elab.Command.liftIO <| IO.FS.withFile
    ".lake/chess-body-certificate-20261022/rows-64-progress.tsv" .append fun handle ↦ do
      handle.putStrLn s!"row-64\t933573\t{now}"
      handle.flush
end Sample64

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Body kernel rows checked: 64 states, 128 rows"
