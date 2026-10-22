/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Semantics.ChessSeed
import Lean

/-! Remote native evidence for every paid row and bounded complete startup fixtures. -/

open Lean Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

namespace ChessSeedExport

def num (n : Nat) : Json := toJson n

def stage (message : String) : IO Unit := do
  let out ← IO.getStdout
  out.putStrLn ("[chess-seed-export] " ++ message)
  out.flush

def statesOf {states : Nat} (_ : Machine states 2) : Nat := states

def bitsString (bits : Array (Fin 2)) : String :=
  String.ofList (bits.toList.map fun bit ↦ if bit.val = 0 then '0' else '1')

def rowJson {states : Nat} (row : Option (Fin 2 × Dir × Fin states)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, next) =>
    Json.arr #[num write.val, toJson (if dir = .right then (1 : Int) else -1), num next.val]

/-- Six-byte records in implicit state/bit order; write two is the canonical halt sentinel. -/
def record {states : Nat} (buffer : ByteArray)
    (row : Option (Fin 2 × Dir × Fin states)) : IO ByteArray := do
  let (write, direction, next) := match row with
    | none => (2, 0, 0)
    | some (write, dir, next) => (write.val, if dir = .right then 1 else 0, next.val)
  unless next < 4294967296 do throw (IO.userError "Destination does not fit u32")
  let buffer := buffer.push write.toUInt8
  let buffer := buffer.push direction.toUInt8
  let buffer := buffer.push (next % 256).toUInt8
  let buffer := buffer.push (next / 256 % 256).toUInt8
  let buffer := buffer.push (next / 65536 % 256).toUInt8
  return buffer.push (next / 16777216 % 256).toUInt8

/-- Compare every actual row with the proved numeric image, then retain the actual row. -/
def exportRows {states : Nat} (machine rows : Machine states 2)
    (path : System.FilePath) : IO Json := do
  let output ← IO.FS.Handle.mk path .write
  let mut buffer := ByteArray.emptyWithCapacity (6 * 65536)
  let mut missing := 0
  let mut written := 0
  for state in [:states] do
    if state % 65536 = 0 then stage s!"complete state {state}/{states}"
    if bound : state < states then
      let control : Fin states := ⟨state, bound⟩
      for bit in List.finRange 2 do
        let row := machine.transition control bit
        unless decide (row = rows.transition control bit) do
          throw (IO.userError s!"Actual/numeric row mismatch at {state}/{bit.val}")
        if row.isNone then missing := missing + 1
        buffer ← record buffer row
        written := written + 1
        if buffer.size ≥ 6 * 65536 then
          output.write buffer
          buffer := ByteArray.emptyWithCapacity (6 * 65536)
    else throw (IO.userError "Allocated state enumeration failed")
  if buffer.size > 0 then output.write buffer
  output.flush
  return Json.mkObj [
    ("filename", toJson "full-rows.bin"), ("format", toJson "<BBI"),
    ("record_bytes", num 6), ("states", num states), ("rows", num written),
    ("bytes", num (6 * written)), ("missing_rows", num missing),
    ("missing_encoding", toJson ([2, 0, 0] : List Nat)),
    ("direction_left", num 0), ("direction_right", num 1),
    ("order", toJson "state-major,bit-0-before-1"),
    ("native_machine_rowMachine_equal", toJson true)]

/-- Replay only the linear writer of the full chess machine, never the quadratic expander. -/
def replayWriter {states : Nat} (machine rows : Machine states 2)
    (bits : Array (Fin 2)) : IO Json := do
  let count := bits.size
  let initial ← if positive : 0 < states then pure (⟨0, positive⟩ : Fin states)
    else throw (IO.userError "Empty machine")
  let mut tape := Array.replicate (count + 2) (0 : Fin 2)
  let mut head : Int := 0
  let mut state := initial
  for _ in [:count + 1] do
    let index := head + (count : Int)
    unless 0 ≤ index ∧ index.toNat < tape.size do
      throw (IO.userError "Full writer left its finite frame")
    let bit := tape[index.toNat]!
    let row := machine.transition state bit
    unless decide (row = rows.transition state bit) do
      throw (IO.userError "Writer actual/numeric row mismatch")
    let some (write, dir, next) := row | throw (IO.userError "Writer halted early")
    tape := tape.set! index.toNat write
    head := head + (if dir = .right then 1 else -1)
    state := next
  let normalized := bitsString (tape.extract 1 (count + 1))
  unless state.val = count + 1 ∧ head = 1 - (count : Int) ∧
      normalized = bitsString bits ∧ tape[0]!.val = 0 ∧ tape[count + 1]!.val = 0 do
    throw (IO.userError "Full writer has wrong tape, head, entry, or blank exterior")
  return Json.mkObj [("steps", num (count + 1)), ("state", num state.val),
    ("head", toJson head), ("tape", toJson normalized), ("normalized_head", num 0),
    ("frame_min", toJson (-(count : Int))), ("frame_max", toJson (1 : Int)),
    ("both_exteriors_zero", toJson true), ("actual_and_numeric_replayed", toJson true)]

def tableJson {states : Nat} (machine : Machine states 2) : Array Json := Id.run do
  let mut result := #[]
  for state in List.finRange states do
    result := result.push (Json.arr ((List.finRange 2).map
      (fun bit ↦ rowJson (machine.transition state bit))).toArray)
  return result

def letterLists : Nat → List (List Seed.Letter)
  | 0 => [[]]
  | n + 1 => (letterLists n).flatMap fun rest ↦ (List.finRange 4).map (· :: rest)

/-- Run the actual generic paid construction on small inputs, with a one-state halted body. -/
def fixture (letters : List Seed.Letter) : IO Json := do
  unless letters.length ≤ 8 do throw (IO.userError "Large startup simulation forbidden")
  let bits := (Seed.seed letters).toArray
  let body : BundledMachine 2 := ⟨1, { transition := fun _ _ ↦ none }⟩
  let linked := SeedLink.link Seed.machine Seed.done body
  let actual := (ReverseInit.Schedule.initialise
    (Chess.Optimisation.OpenEvolveWide.schedule bits) linked).toMachine
  let n := letters.length
  let steps := 16 * n * n + 86 * n + 81
  let bodyEntry := bits.size + 1 + 216 + 1
  let radius := 128 + 32 * n
  let mut tape := Array.replicate (2 * radius + 1) (0 : Fin 2)
  let mut head : Int := 0
  let mut state : Fin (statesOf actual) := 0
  let mut low : Int := 0
  let mut high : Int := 0
  for _ in [:steps] do
    let index := head + (radius : Int)
    unless 0 ≤ index ∧ index.toNat < tape.size do
      throw (IO.userError "Small complete fixture exceeded its tape frame")
    let some (write, dir, next) := actual.transition state tape[index.toNat]! |
      throw (IO.userError "Small complete fixture halted early")
    tape := tape.set! index.toNat write
    head := head + (if dir = .right then 1 else -1)
    low := min low head
    high := max high head
    state := next
  let expectedHead : Int := -9 - 16 * (n : Int)
  let unmarked := if letters.isEmpty then Array.replicate 13 (0 : Fin 2)
    else (Seed.output letters.reverse).toArray
  let output := unmarked.set! 12 1
  unless state.val = bodyEntry ∧ head = expectedHead do
    throw (IO.userError "Small complete fixture has wrong body entry or physical head")
  unless (actual.transition state 0).isNone ∧ (actual.transition state 1).isNone do
    throw (IO.userError "Toy body's missing transitions were not preserved")
  let mut support : Array Int := #[]
  for i in [:tape.size] do
    let position : Int := (i : Int) - (radius : Int)
    let relative := position - expectedHead
    let expected := if 0 ≤ relative ∧ relative.toNat < output.size then
      output[relative.toNat]! else 0
    unless tape[i]! = expected do throw (IO.userError "Small complete fixture tape mismatch")
    if tape[i]!.val = 1 then support := support.push position
  return Json.mkObj [
    ("symbols", toJson (letters.map (fun letter ↦ letter.val + 1))),
    ("seed", toJson (bitsString bits)), ("states", num (statesOf actual)),
    ("body_entry", num bodyEntry), ("rows", Json.arr (tableJson actual)),
    ("steps", num steps), ("head", toJson head), ("state", num state.val),
    ("support", toJson support), ("output", toJson (bitsString output)),
    ("visited_min", toJson low), ("visited_max", toJson high),
    ("frame_min", toJson (-(radius : Int))), ("frame_max", num radius),
    ("both_exteriors_zero", toJson true), ("actual_native_executed", toJson true)]

def fixtures : IO (Array Json) := do
  let cases := (List.range 4).flatMap letterLists ++
    [[0, 3, 1, 2, 0, 3, 1, 2], [3, 2, 3, 2, 3, 2, 3, 2], [1, 1, 1, 1, 1]]
  let mut result := #[]
  for letters in cases do result := result.push (← fixture letters)
  return result

end ChessSeedExport

open ChessSeedExport

def main (args : List String) : IO Unit := do
  unless (← IO.getEnv "CHESS_REMOTE") = some "1" ∧
      (← IO.getEnv "GITHUB_ACTIONS") = some "true" do
    throw (IO.userError "Native machine execution is remote-only")
  let [path] := args | throw (IO.userError "Expected machine-export.json output path")
  let machine := Chess.Optimisation.FieldSeed.machine
  let rowMachine := Chess.Optimisation.FieldSeed.rowMachine
  let bits := Chess.Optimisation.FieldSeed.bits
  let writerCount := Chess.Optimisation.FieldSeed.actions.size
  stage "replaying the complete paid writer"
  let writer ← replayWriter machine rowMachine bits
  stage "executing bounded complete generic startup fixtures"
  let small ← fixtures
  stage "exporting every actual row, including both bits and all body halts"
  let rows ← exportRows machine rowMachine
    ((System.FilePath.mk path).parent.getD "." / "full-rows.bin")
  let metadata := Json.mkObj [
    ("machine_states", num (statesOf machine)),
    ("row_machine_states", num (statesOf rowMachine)),
    ("generated_states", num Chess.Optimisation.FieldSeed.generated.states),
    ("seed_bits", num bits.size), ("writer_states", num writerCount),
    ("controller_states", num (statesOf Seed.machine)), ("bridge_states", num 1),
    ("linked_states", num Chess.Optimisation.FieldSeed.linked.states),
    ("body_states", num Chess.Optimisation.FieldSelective.body.states),
    ("controller_entry", num writerCount),
    ("controller_done", num (writerCount + Seed.done.val)),
    ("bridge_entry", num (writerCount + 216)), ("body_entry", num (writerCount + 217)),
    ("previous_states", num Chess.Optimisation.FieldSelective.generated.states)]
  let payload := Json.mkObj [
    ("schema", toJson "chess-seed-complete-v1"), ("metadata", metadata),
    ("seed", toJson (bitsString bits)), ("writer", writer), ("full_rows", rows),
    ("controller_rows", Json.arr (tableJson Seed.machine)),
    ("complete_startup_fixtures", Json.arr small),
    ("full_quadratic_startup_executed", toJson false)]
  IO.FS.writeFile path (payload.compress ++ "\n")
  IO.println "Seed complete native export passed"
