/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Optimisation.FieldSelective
import Lean

/-! Remote native evidence: every actual body row and every paid initializer transition. -/

open Lean Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

namespace ChessFieldSelectiveExport

abbrev LocalSyntax := FieldCompiler.Syntax 4042

def num (n : Nat) : Json := toJson n

def stage (message : String) : IO Unit := do
  let output ← IO.getStdout
  output.putStrLn ("[field-selective-export] " ++ message)
  output.flush

def direction (dir : Dir) : Json := toJson (if dir = .right then (1 : Int) else -1)

def boolNum (bit : Bool) : Nat := if bit then 1 else 0

def tableJson {α : Type} (encode : α → Nat) (table : BoolGraph.Table 5 α) : Json :=
  toJson ((List.finRange 10).map fun i ↦ encode (table.get i))

def fiveJson (f : Fin 5 → Nat) : Json := toJson ((List.finRange 5).map f)

def opJson : FieldCompiler.Op 4042 → Json
  | .move dir next => Json.arr #[num 0, direction dir, num next.val]
  | .write field value next =>
      Json.arr #[num 1, num field.val, fiveJson (fun v ↦ (value v).val), num next.val]
  | .load field value next =>
      Json.arr #[num 2, num field.val,
        toJson ((List.finRange 5).flatMap fun v ↦
          (List.finRange 5).map fun symbol ↦ (value v symbol).val), num next.val]
  | .pureLoad value next => Json.arr #[num 3, fiveJson (fun v ↦ (value v).val), num next.val]
  | .marker yes no => Json.arr #[num 4, num yes.val, num no.val]
  | .absent field yes no => Json.arr #[num 5, num field.val, num yes.val, num no.val]
  | .branch test yes no =>
      Json.arr #[num 6, fiveJson (fun v ↦ boolNum (test v)), num yes.val, num no.val]
  | .jump target => Json.arr #[num 7, fiveJson (fun v ↦ (target v).val)]
  | .halt => Json.arr #[num 8]

/-- Flatten the actual syntax in postorder once, carrying explicit local child indices. -/
def syntaxNodes : LocalSyntax → Array Json → Array Json
  | .move dir rest, nodes =>
      let nodes := syntaxNodes rest nodes
      nodes.push (Json.arr #[num 0, direction dir, num (nodes.size - 1)])
  | .write table rest, nodes =>
      let nodes := syntaxNodes rest nodes
      nodes.push (Json.arr #[num 1, tableJson boolNum table, num (nodes.size - 1)])
  | .load table rest, nodes =>
      let nodes := syntaxNodes rest nodes
      nodes.push (Json.arr #[num 2, tableJson Fin.val table, num (nodes.size - 1)])
  | .branch table yes no, nodes =>
      let nodes := syntaxNodes yes nodes
      let yesRoot := nodes.size - 1
      let nodes := syntaxNodes no nodes
      nodes.push (Json.arr #[num 3, tableJson boolNum table, num yesRoot, num (nodes.size - 1)])
  | .go table, nodes => nodes.push (Json.arr #[num 4, tableJson Fin.val table])
  | .halt, nodes => nodes.push (Json.arr #[num 5])

def nodeJson {nodes : Nat} : BoolGraph.Node nodes 5 4042 → Json
  | .move dir child => Json.arr #[num 0, direction dir, num child.val]
  | .write table child => Json.arr #[num 1, tableJson boolNum table, num child.val]
  | .load table child => Json.arr #[num 2, tableJson Fin.val table, num child.val]
  | .branch table yes no =>
      Json.arr #[num 3, tableJson boolNum table, num yes.val, num no.val]
  | .goto table => Json.arr #[num 4, tableJson Fin.val table]
  | .halt => Json.arr #[num 5]

def rowJson {states : Nat} (row : Option (Fin 2 × Dir × Fin states)) : Json :=
  match row with
  | none => Json.null
  | some (write, dir, next) => Json.arr #[num write.val, direction dir, num next.val]

def statesOf {states : Nat} (_ : Machine states 2) : Nat := states

def postStatesOf {states : Nat} [NeZero states] (_ : TM0.Machine Bool (Fin states)) : Nat := states

def returnStatesOf {returns states : Nat} (_ : Fin returns → Fin states) : Nat := returns

def pushSamples {states : Nat} (first second : Machine states 2)
    (state : Nat) (samples : Array Json) : IO (Array Json) := do
  if bound : state < states then
    let state : Fin states := ⟨state, bound⟩
    let samples := samples.push (Json.arr #[num state.val, num 0,
      rowJson (first.transition state 0), rowJson (second.transition state 0)])
    return samples.push (Json.arr #[num state.val, num 1,
      rowJson (first.transition state 1), rowJson (second.transition state 1)])
  else throw (IO.userError s!"Native sample outside actual machine: {state}/{states}")

def bitChar (bit : Fin 2) : Char := if bit.val = 0 then '0' else '1'

def bitsString (bits : Array (Fin 2)) : String := String.ofList (bits.toList.map bitChar)

def cellChars (symbol : SharedModel.Symbol) : List Char :=
  (if symbol.1 then '1' else '0') :: (List.finRange 4).map fun field ↦
    Char.ofNat (48 + (FieldReturn.symbolCode (symbol.2 (FieldReturn.stackAt field))).val)

/-- Execute every actual paid transition from blank and retain its complete finite tape. -/
def replayInitializer {states : Nat} (machine rowMachine : Machine states 2)
    (bits : Array (Fin 2)) : IO Json := do
  let count := bits.size
  let initial ← if positive : 0 < states then pure (⟨0, positive⟩ : Fin states)
    else throw (IO.userError "Actual complete machine has no initial state")
  -- Physical coordinate p is represented by index p + count.  This includes
  -- the left blank at -count and the right blank at 1, even for empty input.
  let mut tape := Array.replicate (count + 2) (0 : Fin 2)
  let mut head : Int := 0
  let mut state := initial
  for tick in [:count + 1] do
    if tick % 262144 = 0 then stage s!"initializer step {tick}/{count + 1}"
    let shifted := head + (count : Int)
    unless 0 ≤ shifted ∧ shifted.toNat < tape.size do
      throw (IO.userError s!"Actual initializer left its charged tape frame at step {tick}")
    let index := shifted.toNat
    let bit := tape[index]!
    let row := machine.transition state bit
    unless decide (row = rowMachine.transition state bit) do
      throw (IO.userError s!"Initializer machine/rowMachine mismatch at step {tick}")
    match row with
    | none => throw (IO.userError s!"Actual initializer halted at step {tick}")
    | some (write, dir, next) =>
      tape := tape.set! index write
      head := head + (if dir = .right then 1 else -1)
      state := next
  let normalized := bitsString (tape.extract 1 (count + 1))
  unless state.val = count + 1 ∧ head = 1 - (count : Int) do
    throw (IO.userError "Actual initializer has the wrong body entry or physical endpoint")
  unless normalized = bitsString bits ∧ tape[0]!.val = 0 ∧ tape[count + 1]!.val = 0 do
    throw (IO.userError "Actual initializer differs from the exact normalized input/blank exterior")
  return Json.mkObj [
    ("steps", num (count + 1)), ("state", num state.val), ("head", toJson head),
    ("normalized_head", num 0), ("tape", toJson normalized),
    ("left_blank", num tape[0]!.val), ("right_blank", num tape[count + 1]!.val),
    ("frame_min", toJson (-(count : Int))), ("frame_max", toJson (1 : Int)),
    ("native_machine_and_rowMachine_replayed", toJson true),
    ("frame", toJson ("All visited physical positions were in [-bits_count,1]; " ++
      "outside stayed blank"))]

/-- Six-byte little-endian records, with state and scanned bit implicit in order. -/
def prefixRecord (buffer : ByteArray) (write : Fin 2) (dir : Dir) (next : Nat) : ByteArray :=
  let buffer := buffer.push write.val.toUInt8
  let buffer := buffer.push (if dir = .right then 1 else 0)
  let buffer := buffer.push (next % 256).toUInt8
  let buffer := buffer.push (next / 256 % 256).toUInt8
  let buffer := buffer.push (next / 65536 % 256).toUInt8
  buffer.push (next / 16777216 % 256).toUInt8

/-- Every initializer control on both bits, checked against the actual row machine. -/
def exportPrefix {states : Nat} (machine rowMachine : Machine states 2)
    (paidOffset : Nat) (path : System.FilePath) : IO Json := do
  unless paidOffset < states do
    throw (IO.userError "Initializer boundary is outside the actual machine")
  let output ← IO.FS.Handle.mk path .write
  let mut buffer := ByteArray.emptyWithCapacity (6 * 65536)
  let mut rows := 0
  for state in [:paidOffset] do
    if state % 262144 = 0 then stage s!"complete prefix state {state}/{paidOffset}"
    if bound : state < states then
      let control : Fin states := ⟨state, bound⟩
      for bit in List.finRange 2 do
        let row := machine.transition control bit
        unless decide (row = rowMachine.transition control bit) do
          throw (IO.userError s!"Actual prefix/rowMachine mismatch at {state}/{bit.val}")
        match row with
        | none => throw (IO.userError s!"Missing actual prefix transition at {state}/{bit.val}")
        | some (write, dir, next) =>
          unless next.val < 4294967296 do
            throw (IO.userError "Actual prefix target cannot be represented by uint32")
          buffer := prefixRecord buffer write dir next.val
          rows := rows + 1
          if buffer.size ≥ 6 * 65536 then
            output.write buffer
            buffer := ByteArray.emptyWithCapacity (6 * 65536)
    else throw (IO.userError "Complete-prefix range produced an invalid state")
  if buffer.size > 0 then output.write buffer
  output.flush
  return Json.mkObj [
    ("filename", toJson (path.fileName.getD "prefix-rows.bin")),
    ("format", toJson "binary:<BBI(write:u8,direction:u8,next:u32le)"),
    ("record_bytes", num 6), ("direction_left", num 0), ("direction_right", num 1),
    ("target_bound_exclusive", num 4294967296),
    ("order", toJson "state-major,bit-0-before-1"),
    ("first_state", num 0), ("state_limit", num paidOffset),
    ("states", num paidOffset), ("rows", num rows), ("bits_per_state", num 2),
    ("missing_rows", num 0), ("bytes", num (6 * rows)),
    ("native_machine_rowMachine_equal", toJson true)]

/-- Small actual generic-schedule runs retain empty and zero-boundary edge cases. -/
def initializerEdges : IO (Array Json) := do
  let cases : Array (String × Array (Fin 2)) := #[
    ("empty", #[]), ("singleton_zero", #[0]), ("singleton_one", #[1]),
    ("leading_zero", #[0, 1, 1]), ("trailing_zero", #[1, 1, 0]),
    ("mixed", #[0, 1, 0, 1, 1, 0])]
  let toyBody : BundledMachine 2 := ⟨1, {transition := fun _ _ ↦ none}⟩
  let mut results := #[]
  for (name, bits) in cases do
    let actual := (ReverseInit.Schedule.initialise
      (Chess.Optimisation.OpenEvolveWide.schedule bits) toyBody).toMachine
    let replay ← replayInitializer actual actual bits
    results := results.push (Json.mkObj [("name", toJson name),
      ("bits", toJson (bitsString bits)), ("machine_states", num (statesOf actual)),
      ("generic_schedule_actual_machine", toJson true), ("initializer", replay)])
  return results

/-- Emit both bits of every allocated body control, checking independent Lean rows first. -/
def exportBody {states : Nat} (machine rowMachine : Machine states 2)
    (paidOffset : Nat) (path : System.FilePath) : IO Json := do
  unless paidOffset < states do
    throw (IO.userError "Actual body is empty or its offset is outside the machine")
  let output ← IO.FS.Handle.mk path .write
  let mut rows := 0
  let mut missing := 0
  for state in [paidOffset:states] do
    if (state - paidOffset) % 65536 = 0 then
      stage s!"complete body state {state - paidOffset}/{states - paidOffset}"
    if bound : state < states then
      let control : Fin states := ⟨state, bound⟩
      for bit in List.finRange 2 do
        let row := machine.transition control bit
        unless decide (row = rowMachine.transition control bit) do
          throw (IO.userError s!"Actual body/rowMachine mismatch at {state}/{bit.val}")
        if row.isNone then missing := missing + 1
        output.putStrLn (Json.arr #[num state, num bit.val, rowJson row]).compress
        rows := rows + 1
    else throw (IO.userError "Complete-body range produced an invalid state")
  output.flush
  return Json.mkObj [
    ("filename", toJson (path.fileName.getD "body-rows.jsonl")),
    ("format", toJson "jsonl:[absolute_state,bit,null-or-[write,direction,absolute_next]]"),
    ("order", toJson "state-major,bit-0-before-1"),
    ("first_state", num paidOffset), ("state_limit", num states),
    ("states", num (states - paidOffset)), ("rows", num rows),
    ("missing_rows", num missing), ("bits_per_state", num 2),
    ("native_machine_rowMachine_equal", toJson true)]

end ChessFieldSelectiveExport

open ChessFieldSelectiveExport

def main (args : List String) : IO Unit := do
  unless (← IO.getEnv "CHESS_REMOTE") == some "1" ∧
      (← IO.getEnv "GITHUB_ACTIONS") == some "true" do
    throw (IO.userError "Machine execution requires remote GitHub Actions")
  stage "main entered"
  let [path] := args | throw (IO.userError "Provide the machine-export.json output path")
  let bodyPath := (System.FilePath.mk path).parent.getD "." / "body-rows.jsonl"
  let prefixPath := (System.FilePath.mk path).parent.getD "." / "prefix-rows.bin"
  let bits := Chess.Optimisation.FieldSelective.bits
  let paidOffset := bits.size + 1
  let postCount := postStatesOf Chess.Optimisation.FieldPacked.post
  let returnCount := returnStatesOf Chess.Optimisation.FieldSelectiveLayout.returnAt
  stage s!"input ready: bits={bits.size}; beginning literal rows and actual samples"
  let mut operations : Array Json := #[]
  let mut syntaxRowsJson : Array Json := #[]
  let mut entries : Array Nat := #[]
  let mut rowSizes : Array Nat := #[]
  let mut prefixOffsets : Array Nat := #[0]
  let mut returnLocalTargets : Array Json := #[]
  let mut returnOffsets : Array Nat := #[0]
  let mut getterSamples : Array Json := #[]
  let mut samples : Array Json := #[]
  for label in List.finRange 4042 do
    let operation := FieldCompiler.Snapshot.program label
    let row := Chess.Optimisation.FieldAware.syntaxRows.get label
    let nodes := syntaxNodes row #[]
    operations := operations.push (opJson operation)
    syntaxRowsJson := syntaxRowsJson.push (Json.arr nodes)
    rowSizes := rowSizes.push nodes.size
    prefixOffsets := prefixOffsets.push (prefixOffsets.back! + nodes.size)
    let targets := (FieldReturns.targets row).map Fin.val
    returnLocalTargets := returnLocalTargets.push (toJson targets)
    unless Chess.Optimisation.FieldSelectiveLayout.offset label = returnOffsets.back! do
      throw (IO.userError s!"Actual return allocation has wrong prefix offset at {label.val}")
    returnOffsets := returnOffsets.push (returnOffsets.back! + targets.length)
    let entry := Chess.Optimisation.FieldPacked.getter.entry label
    entries := entries.push entry.val
    for slot in List.finRange row.size do
      let node := Chess.Optimisation.FieldPackedLayout.layout.code ⟨label, slot⟩
      getterSamples := getterSamples.push (Json.arr #[num node.val,
        nodeJson (Chess.Optimisation.FieldPacked.getter.node node)])
    for value in List.finRange 5 do
      let encoded := CompactPost.encode Chess.Optimisation.FieldPacked.getter (some entry, value)
      let some returnSlot := Chess.Optimisation.FieldSelectiveLayout.findReturn encoded |
        throw (IO.userError s!"Missing selected return for entry {label.val}, store {value.val}")
      samples ← pushSamples Chess.Optimisation.FieldSelective.machine
        Chess.Optimisation.FieldSelective.rowMachine (paidOffset + encoded.val) samples
      samples ← pushSamples Chess.Optimisation.FieldSelective.machine
        Chess.Optimisation.FieldSelective.rowMachine
          (paidOffset + postCount + returnSlot.val) samples
    if (label.val + 1) % 64 = 0 then
      stage s!"rows complete: {label.val + 1}/4042; native sample pairs={samples.size}"
  stage "all literal rows and per-label samples complete"
  let mut returnTargets : Array Nat := #[]
  for index in List.finRange returnCount do
    let target := Chess.Optimisation.FieldSelectiveLayout.returnAt index
    unless Chess.Optimisation.FieldSelectiveLayout.findReturn target = some index do
      throw (IO.userError s!"Actual selected return lookup fails roundtrip at {index.val}")
    returnTargets := returnTargets.push target.val
  unless returnCount = 1 + 5 * returnOffsets.back! do
    throw (IO.userError "Selected return count differs from paid row slots and shared halt")
  let haltCode := (CompactPost.encode Chess.Optimisation.FieldPacked.getter
    (none, (0 : Fin 5))).val
  unless returnTargets[0]? = some haltCode do
    throw (IO.userError "Return zero does not decode to the shared Post halt")
  for state in [0, 1, bits.size / 2, bits.size - 1, bits.size, bits.size + 1,
      paidOffset - 1, paidOffset, paidOffset + postCount - 1, paidOffset + postCount,
      paidOffset + haltCode, paidOffset + postCount + returnCount - 1,
      paidOffset + Chess.Optimisation.FieldSelective.body.states - 1] do
    samples ← pushSamples Chess.Optimisation.FieldSelective.machine
      Chess.Optimisation.FieldSelective.rowMachine state samples
  let source := Chess.Optimisation.FieldAware.sourceInput
  let initial := Chess.Optimisation.FieldPacked.getter.entry 0
  let metadata := Json.mkObj [
    ("labels", num 4042), ("stores", num 5), ("cell_bits", num 13),
    ("graph_nodes", num prefixOffsets.back!), ("post_states", num postCount),
    ("return_states", num returnCount), ("return_node_slots", num returnOffsets.back!),
    ("body_states", num Chess.Optimisation.FieldSelective.body.states),
    ("generated_states", num Chess.Optimisation.FieldSelective.generated.states),
    ("machine_states", num (statesOf Chess.Optimisation.FieldSelective.machine)),
    ("row_machine_states", num (statesOf Chess.Optimisation.FieldSelective.rowMachine)),
    ("actions_count", num Chess.Optimisation.FieldSelective.actions.size),
    ("bits_count", num bits.size), ("source_cells_count", num source.length),
    ("initial_raw", num (CompactPost.rawEncode (some initial, (0 : Fin 5))).val),
    ("initial_encoded", num (CompactPost.encode Chess.Optimisation.FieldPacked.getter
      (some initial, (0 : Fin 5))).val),
    ("halt_encoded", num haltCode), ("body_entry", num paidOffset)]
  stage "beginning complete actual-machine initializer replay"
  let initializer ← replayInitializer Chess.Optimisation.FieldSelective.machine
    Chess.Optimisation.FieldSelective.rowMachine bits
  let edges ← initializerEdges
  stage "beginning complete prefix export and native rowMachine comparison"
  let prefixRows ← exportPrefix Chess.Optimisation.FieldSelective.machine
    Chess.Optimisation.FieldSelective.rowMachine paidOffset prefixPath
  stage "beginning complete body export and native rowMachine comparison"
  let bodyRows ← exportBody Chess.Optimisation.FieldSelective.machine
    Chess.Optimisation.FieldSelective.rowMachine paidOffset bodyPath
  stage "actual initializer replay complete; assembling source and bit strings"
  let payload := Json.mkObj [
    ("schema", toJson "chess-field-selective-v1"), ("metadata", metadata),
    ("operations", Json.arr operations), ("syntax", Json.arr syntaxRowsJson),
    ("row_sizes", toJson rowSizes), ("prefix_offsets", toJson prefixOffsets),
    ("return_local_targets", Json.arr returnLocalTargets),
    ("return_offsets", toJson returnOffsets), ("return_targets", toJson returnTargets),
    ("entries", toJson entries), ("getter_samples", Json.arr getterSamples),
    ("samples", Json.arr samples), ("bits", toJson (bitsString bits)),
    ("source_cells", toJson (String.ofList (source.flatMap cellChars))),
    ("initializer", initializer), ("initializer_edges", Json.arr edges),
    ("prefix_rows", prefixRows), ("body_rows", bodyRows)]
  stage "payload assembled; serialization begins"
  let serialized := payload.compress
  stage "serialization complete; writing artifact"
  IO.FS.writeFile path serialized
  stage "artifact written"
  IO.println "Selective native export passed"
