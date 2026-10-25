import Identity
import Cleanup

open Turing ConjectureMachines
open ConjectureMachines.Compilation
open ParsimonyComplete Parsimony.Common Parsimony.Insertion
namespace ParsimonyComposed

set_option backward.isDefEq.respectTransparency false
attribute [local irreducible] values raw

private def preamble : Array (Fin 2 × Dir × Fin 13546) := #[
  (0, .right, stateOf 1),
  (1, .right, stateOf 13544),
  (1, .left, stateOf 2),
  (1, .right, stateOf 13544),
  (0, .right, stateOf 6),
  (1, .right, stateOf 13544),
  (0, .left, stateOf 4),
  (0, .left, stateOf 3),
  (0, .left, stateOf 4),
  (1, .right, stateOf 5),
  (0, .right, stateOf 13507),
  (1, .right, stateOf 13544)
]

def printer (input : Array (Fin 13360)) : Machine 13546 2 where
  transition state bit := if state.val < 6 then preamble[state.val * 2 + bit.val]?
    else (model input).transition state bit

theorem model_extension (input : Array (Fin 13360)) (s : Fin 13546) (b : Fin 2)
    (out : Fin 2 × Dir × Fin 13546) (row : (model input).transition s b = some out) :
    (printer input).transition s b = some out := by
  by_cases early : s.val < 6
  · simp [model, early] at row
  · simpa only [printer, early, ↓reduceIte] using row

theorem printer_static (first second : Array (Fin 13360)) (s : Fin 13546) (b : Fin 2)
    (static : s.val < 6 ∨ 13366 ≤ s.val) :
    (printer first).transition s b = (printer second).transition s b := by
  by_cases early : s.val < 6
  · simp only [printer, early, ↓reduceIte]
  · simp only [printer, early, ↓reduceIte]
    exact static_eq first second s b (by omega)

def controls : ParsimonyComplete.Controls 13546 where
  initial := stateOf 0
  signal := stateOf 1
  back := stateOf 2
  data := data 0
  positiveEnd := positiveEnd
  clean := stateOf 3
  find := stateOf 4
  found := stateOf 5
  tail0 := stateOf 13507
  tail1 := stateOf 13508
  tail2 := stateOf 13509
  scan i := stateOf (13510 + min i 32)
  clear := stateOf 13543
  out := stateOf 13545

theorem printer_rows (input : Array (Fin 13360)) :
    ParsimonyComplete.Rows (printer input) controls where
  initial := by
    rw [printer_static input #[] (controls.initial) 0 (by decide +kernel)]
    decide +kernel
  signal := by
    rw [printer_static input #[] (controls.signal) 0 (by decide +kernel)]
    decide +kernel
  back := by
    rw [printer_static input #[] (controls.back) 0 (by decide +kernel)]
    decide +kernel
  positiveEnd := by
    rw [printer_static input #[] (controls.positiveEnd) 0 (by decide +kernel)]
    decide +kernel
  cleanOne := by
    rw [printer_static input #[] (controls.clean) 1 (by decide +kernel)]
    decide +kernel
  cleanZero := by
    rw [printer_static input #[] (controls.clean) 0 (by decide +kernel)]
    decide +kernel
  findZero := by
    rw [printer_static input #[] (controls.find) 0 (by decide +kernel)]
    decide +kernel
  findOne := by
    rw [printer_static input #[] (controls.find) 1 (by decide +kernel)]
    decide +kernel
  found := by
    rw [printer_static input #[] (controls.found) 0 (by decide +kernel)]
    decide +kernel
  tail0 := by
    rw [printer_static input #[] (controls.tail0) 0 (by decide +kernel)]
    decide +kernel
  tail1 := by
    rw [printer_static input #[] (controls.tail1) 0 (by decide +kernel)]
    decide +kernel
  tail2 := by
    rw [printer_static input #[] (controls.tail2) 1 (by decide +kernel)]
    decide +kernel
  enter := by
    rw [printer_static input #[] (controls.scan 32) 0 (by decide +kernel)]
    decide +kernel
  clearOne := by
    rw [printer_static input #[] (controls.clear) 1 (by decide +kernel)]
    decide +kernel
  clearZero := by
    rw [printer_static input #[] (controls.clear) 0 (by decide +kernel)]
    decide +kernel
  scan := by
    have physical : ∀ i : Fin 32, (controls.scan i.val).val < 6 ∨ 13366 ≤ (controls.scan
    i.val).val := by decide +kernel
    have finite : ∀ i : Fin 32, ∀ bit : Fin 2, ParsimonyComplete.next i.val bit < 32 → (printer
    #[]).transition (controls.scan i.val) bit = some (bit, .left, controls.scan
    (ParsimonyComplete.next i.val bit)) := by decide +kernel
    intro i bound bit valid
    rw [printer_static input #[] (controls.scan i) bit (physical ⟨i, bound⟩)]
    exact finite ⟨i, bound⟩ bit valid
  marker := by
    have physical : ∀ i : Fin 32, (controls.scan i.val).val < 6 ∨ 13366 ≤ (controls.scan
    i.val).val := by decide +kernel
    have finite : ∀ i : Fin 32, (printer #[]).transition (controls.scan i.val) 1 = some (1, .left,
    controls.scan (i.val + 1)) := by decide +kernel
    intro i bound
    rw [printer_static input #[] (controls.scan i) 1 (physical ⟨i, bound⟩)]
    exact finite ⟨i, bound⟩

end ParsimonyComposed

#print axioms ParsimonyComposed.model_extension
#print axioms ParsimonyComposed.printer_rows

def main : IO Unit := do
  let mut lines : Array String := #[]
  for i in [:13545] do
    for b in [:2] do
      let state : Fin 13546 := ParsimonyComposed.stateOf i
      let bit : Fin 2 := ⟨b % 2, Nat.mod_lt b (by decide +kernel)⟩
      match (ParsimonyComposed.printer ParsimonyComposed.values).transition state bit with
      | none => throw (IO.userError "Missing paid printer row")
      | some (write, direction, target) =>
        let d := if direction = .right then 1 else 0
        lines := lines.push s!"{i} {b} {write.val} {d} {target.val}"
  IO.FS.writeFile "/home/runner/work/cryptids/cryptids/.lake/chess-parsimony-complete-20261024/PrinterModel.rows" (String.intercalate "\n" lines.toList)
  IO.println "PARSIMONY_COMPLETE_PRINTER_ROWS_EXPORTED"
