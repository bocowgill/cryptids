/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Semantics.ChessTableSeed
import Lean

/-! Remote native evidence for every paid row and bounded complete startup fixtures. -/

open Lean Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

namespace ChessTableSeedExport

def num (n : Nat) : Json := toJson n

def stage (message : String) : IO Unit := do
  let out ← IO.getStdout
  out.putStrLn ("[chess-table-full-export] " ++ message)
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
  let (write, direction, next) : Nat × Nat × Nat := match row with
    | none => (2, 0, 0)
    | some (write, dir, next) => (write.val, if dir = Dir.right then 1 else 0, next.val)
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

/-- Arithmetic word oracle, separate from the decoder's source transducer and format functions. -/
def naturalSymbols (value : Nat) : List Nat :=
  if value = 0 then [2]
  else (List.range (value.log2 + 1)).map (fun i ↦ 3 + value / 2 ^ i % 2) ++ [2]

def symbolBits (symbol : Nat) : List (Fin 2) :=
  (List.range 3).map fun i ↦ if symbol / 2 ^ i % 2 = 0 then 0 else 1

def expectedSeed (symbols : List Nat) : Array (Fin 2) :=
  ([0, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 0] ++
    symbols.flatMap symbolBits ++ [0, 0, 0]).toArray

/-- Original symbols in reversed stack order, with the unique bottom marker at bit twelve. -/
def expectedOutput (symbols : List Nat) : Array (Fin 2) :=
  let cells := if symbols.isEmpty then Array.replicate 13 (0 : Fin 2)
    else (symbols.reverse.flatMap fun symbol ↦ symbolBits symbol ++ List.replicate 10 0).toArray
  cells.set! 12 1

/-- Run the entire paid two-decoder construction on a bounded toy packet from blank. -/
def fixture (name : String) (pre : List TableSeed.Letter) (rows : List TableSeed.Row)
    (post : List TableSeed.Letter) : IO Json := do
  unless pre.length ≤ 4 ∧ rows.length ≤ 2 ∧ post.length ≤ 4 do
    throw (IO.userError "Large complete startup simulation forbidden")
  let bits := (TableSeed.packet pre rows post).toArray
  let preSymbols := pre.map (fun letter ↦ letter.val + 1)
  let postSymbols := post.map (fun letter ↦ letter.val + 1)
  let symbols := preSymbols ++ rows.flatMap (fun row ↦
    naturalSymbols row.tag.val ++ naturalSymbols row.left.val ++ naturalSymbols row.right.val) ++
    [1] ++ postSymbols
  let seed := expectedSeed symbols
  let output := expectedOutput symbols
  let body : BundledMachine 2 := ⟨1, { transition := fun _ _ ↦ none }⟩
  let inner := SeedLink.link Seed.machine Seed.done body
  let linked := SeedLink.link TableSeed.machine TableSeed.done inner
  let actual := (ReverseInit.Schedule.initialise
    (Chess.Optimisation.OpenEvolveWide.schedule bits) linked).toMachine
  let n := symbols.length
  let writerCount := bits.size + 1
  let decoderCount := statesOf TableSeed.machine
  let expanderCount := statesOf Seed.machine
  let bodyEntry := writerCount + decoderCount + 1 + expanderCount + 1
  let radius := 128 + 4 * bits.size + 32 * n
  let stepCap := 4000000
  let mut tape := Array.replicate (2 * radius + 1) (0 : Fin 2)
  let mut head : Int := 0
  let initial ← if positive : 0 < statesOf actual then
    pure (⟨0, positive⟩ : Fin (statesOf actual))
    else throw (IO.userError "Complete toy fixture has no entry state")
  let mut state := initial
  let mut steps := 0
  let mut low : Int := 0
  let mut high : Int := 0
  let mut decoderChecked := false
  while state.val != bodyEntry && steps < stepCap do
    if state.val = writerCount + TableSeed.done.val then
      unless !decoderChecked do throw (IO.userError "Decoder success was visited twice")
      let expectedHead : Int := 1 - (bits.size : Int) - 3 * (n : Int) - 7
      unless head = expectedHead do throw (IO.userError "Decoder physical endpoint mismatch")
      for i in [:tape.size] do
        let position : Int := (i : Int) - (radius : Int)
        let relative := position - expectedHead
        let expected := if 0 ≤ relative ∧ relative.toNat < seed.size then
          seed[relative.toNat]! else 0
        unless tape[i]! = expected do throw (IO.userError "Decoder complete seed tape mismatch")
      decoderChecked := true
    let index := head + (radius : Int)
    unless 0 ≤ index ∧ index.toNat < tape.size do
      throw (IO.userError "Complete toy fixture exceeded its tape frame")
    let some (write, dir, next) := actual.transition state tape[index.toNat]! |
      throw (IO.userError "Complete toy fixture halted before reaching its body")
    tape := tape.set! index.toNat write
    head := head + (if dir = .right then 1 else -1)
    low := min low head
    high := max high head
    state := next
    steps := steps + 1
  unless state.val = bodyEntry ∧ steps < stepCap ∧ decoderChecked do
    throw (IO.userError s!"Complete toy fixture {name} timed out or bypassed decoder success")
  let expectedHead : Int := -(bits.size : Int) - 16 * (n : Int)
  unless head = expectedHead do throw (IO.userError "Complete toy fixture physical head mismatch")
  unless (actual.transition state 0).isNone ∧ (actual.transition state 1).isNone do
    throw (IO.userError "Complete toy halted body rows were not preserved")
  let mut support : Array Int := #[]
  for i in [:tape.size] do
    let position : Int := (i : Int) - (radius : Int)
    let relative := position - expectedHead
    let expected := if 0 ≤ relative ∧ relative.toNat < output.size then
      output[relative.toNat]! else 0
    unless tape[i]! = expected do throw (IO.userError "Complete toy fixture final tape mismatch")
    if tape[i]!.val = 1 then support := support.push position
  return Json.mkObj [
    ("name", toJson name), ("pre", toJson preSymbols),
    ("table", toJson (rows.map fun row ↦ [row.tag.val, row.left.val, row.right.val])),
    ("post", toJson postSymbols), ("packet", toJson (bitsString bits)),
    ("seed", toJson (bitsString seed)), ("states", num (statesOf actual)),
    ("body_entry", num bodyEntry), ("rows", Json.arr (tableJson actual)),
    ("steps", num steps), ("step_cap", num stepCap), ("head", toJson head),
    ("state", num state.val), ("support", toJson support),
    ("output", toJson (bitsString output)),
    ("visited_min", toJson low), ("visited_max", toJson high),
    ("frame_min", toJson (-(radius : Int))), ("frame_max", num radius),
    ("both_exteriors_zero", toJson true), ("actual_native_executed", toJson true),
    ("decoder_seed_checked", toJson decoderChecked)]

def fixtures : IO (Array Json) := do
  let mut result := #[]
  let mut totalSteps := 0
  let cases : List (String × List TableSeed.Letter × List TableSeed.Row ×
      List TableSeed.Letter) :=
    [("empty", [], [], []),
     ("letters", [0, 1, 2, 3], [], [3, 2, 1, 0]),
     ("zero", [], [⟨0, 0, 0⟩], [])] ++
    (List.finRange 7).map (fun tag ↦
      (s!"tag_{tag.val}", [3], [⟨tag, 0, 1⟩], [0, 1])) ++
    [("boundaries", [3, 0], [⟨6, 4096, 8191⟩, ⟨5, 1, 0⟩], [1]),
     ("pre_only", [0, 3], [], []),
     ("post_only", [], [], [1, 2]),
     ("row_only", [], [⟨3, 8191, 4096⟩], [])]
  for (name, pre, rows, post) in cases do
    stage s!"complete startup fixture {name}"
    let record ← fixture name pre rows post
    let steps ← match record.getObjValAs? Nat "steps" with
      | .ok steps => pure steps
      | .error error => throw (IO.userError error)
    totalSteps := totalSteps + steps
    unless totalSteps ≤ 50000000 do throw (IO.userError "Complete toy batch budget exceeded")
    result := result.push record
  return result

end ChessTableSeedExport

open ChessTableSeedExport

def main (args : List String) : IO Unit := do
  unless (← IO.getEnv "CHESS_REMOTE") = some "1" ∧
      (← IO.getEnv "GITHUB_ACTIONS") = some "true" do
    throw (IO.userError "Native machine execution is remote-only")
  let [path] := args | throw (IO.userError "Expected machine-export.json output path")
  let machine := Chess.Optimisation.FieldTableSeed.machine
  let rowMachine := Chess.Optimisation.FieldTableSeed.rowMachine
  let bits := Chess.Optimisation.FieldTableSeed.bits
  let writerCount := Chess.Optimisation.FieldTableSeed.actions.size
  let decoderCount := statesOf TableSeed.machine
  let expanderCount := statesOf Seed.machine
  let expanderEntry := writerCount + decoderCount + 1
  let bodyEntry := expanderEntry + expanderCount + 1
  stage "replaying the complete paid packet writer"
  let writer ← replayWriter machine rowMachine bits
  stage "executing bounded complete two-decoder startup fixtures"
  let small ← fixtures
  stage "exporting every actual row, including both bits and all body halts"
  let rows ← exportRows machine rowMachine
    ((System.FilePath.mk path).parent.getD "." / "full-rows.bin")
  let metadata := Json.mkObj [
    ("machine_states", num (statesOf machine)),
    ("row_machine_states", num (statesOf rowMachine)),
    ("generated_states", num Chess.Optimisation.FieldTableSeed.generated.states),
    ("packet_bits", num bits.size), ("writer_states", num writerCount),
    ("decoder_states", num decoderCount), ("new_bridge_states", num 1),
    ("expander_states", num expanderCount), ("old_bridge_states", num 1),
    ("linked_states", num Chess.Optimisation.FieldTableSeed.linked.states),
    ("body_states", num Chess.Optimisation.FieldSelective.body.states),
    ("decoder_entry", num (writerCount + TableSeed.entry.val)),
    ("decoder_done", num (writerCount + TableSeed.done.val)),
    ("decoder_error", num (writerCount + TableSeed.error.val)),
    ("new_bridge_entry", num (writerCount + decoderCount)),
    ("expander_entry", num expanderEntry),
    ("expander_done", num (expanderEntry + Seed.done.val)),
    ("old_bridge_entry", num (expanderEntry + expanderCount)), ("body_entry", num bodyEntry),
    ("previous_states", num Chess.Optimisation.FieldSeed.generated.states)]
  let payload := Json.mkObj [
    ("schema", toJson "chess-table-seed-full-v1"), ("metadata", metadata),
    ("packet", toJson (bitsString bits)), ("writer", writer), ("full_rows", rows),
    ("decoder_rows", Json.arr (tableJson TableSeed.machine)),
    ("expander_rows", Json.arr (tableJson Seed.machine)),
    ("complete_startup_fixtures", Json.arr small),
    ("full_quadratic_startup_executed", toJson false)]
  IO.FS.writeFile path (payload.compress ++ "\n")
  IO.println "Table seed complete native export passed"
