/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Chess.Optimisation.FieldAware
import Lean

/-! Native evidence from the actual complete candidate, without enumerating its full table. -/

open Lean Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation

namespace ChessFieldFullExport

abbrev LocalSyntax := FieldCompiler.Syntax 4042
abbrev GlobalNode := BoolGraph.Node (4042 * 1024) 5 4042

def num (n : Nat) : Json := toJson n

def stage (message : String) : IO Unit := do
  let output ← IO.getStdout
  output.putStrLn ("[field-full-export] " ++ message)
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

def nodeJson : GlobalNode → Json
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
def replayInitializer (count : Nat) : IO Json := do
  let mut tape := Array.replicate (count + 1) (0 : Fin 2)
  let mut head : Int := 0
  let mut state : Fin 45065962 := 0
  for tick in [:2 * count] do
    if tick % 262144 = 0 then stage s!"initializer step {tick}/{2 * count}"
    unless 0 ≤ head ∧ head.toNat < tape.size do
      throw (IO.userError s!"Actual initializer left its charged tape frame at step {tick}")
    let index := head.toNat
    let bit := tape[index]!
    let row := Chess.Optimisation.FieldAware.machine.transition state bit
    unless decide (row = Chess.Optimisation.FieldAware.rowMachine.transition state bit) do
      throw (IO.userError s!"Initializer machine/rowMachine mismatch at step {tick}")
    match row with
    | none => throw (IO.userError s!"Actual initializer halted at step {tick}")
    | some (write, dir, next) =>
      tape := tape.set! index write
      head := head + (if dir = .right then 1 else -1)
      state := next
  return Json.mkObj [
    ("steps", num (2 * count)), ("state", num state.val), ("head", toJson head),
    ("tape", toJson (String.ofList ((tape.toList.take count).map bitChar))),
    ("trailing_cell", num tape[count]!.val),
    ("frame", toJson "All actual visited positions were in [0,bits_count]; outside stayed blank")]

end ChessFieldFullExport

open ChessFieldFullExport

def main (args : List String) : IO Unit := do
  stage "main entered"
  let [path] := args | throw (IO.userError "Provide the output JSON path")
  let bits := Chess.Optimisation.FieldAware.bits
  let paidOffset := 2 * bits.size
  let postCount := postStatesOf Chess.Optimisation.FieldAware.post
  stage s!"input ready: bits={bits.size}; beginning literal rows and actual samples"
  let mut operations : Array Json := #[]
  let mut syntaxRowsJson : Array Json := #[]
  let mut entries : Array Nat := #[]
  let mut getterSamples : Array Json := #[]
  let mut samples : Array Json := #[]
  for label in List.finRange 4042 do
    let operation := FieldCompiler.Snapshot.program label
    let row := Chess.Optimisation.FieldAware.syntaxRows.get label
    let nodes := syntaxNodes row #[]
    operations := operations.push (opJson operation)
    syntaxRowsJson := syntaxRowsJson.push (Json.arr nodes)
    let entry := Chess.Optimisation.FieldAware.getter.entry label
    entries := entries.push entry.val
    let first : Fin (4042 * 1024) := finProdFinEquiv (label, (0 : Fin 1024))
    let last : Fin (4042 * 1024) := finProdFinEquiv (label, (1023 : Fin 1024))
    let mut probes := #[entry, first, last]
    if bound : nodes.size < 1024 then
      probes := probes.push (finProdFinEquiv (label, ⟨nodes.size, bound⟩))
    for node in probes do
      getterSamples := getterSamples.push
        (Json.arr #[num node.val, nodeJson (Chess.Optimisation.FieldAware.getter.node node)])
      for value in List.finRange 5 do
        let encoded := (CompactPost.encode Chess.Optimisation.FieldAware.getter
          (some node, value)).val
        samples ← pushSamples Chess.Optimisation.FieldAware.machine
          Chess.Optimisation.FieldAware.rowMachine (paidOffset + encoded) samples
    for value in List.finRange 5 do
      let encoded := (CompactPost.encode Chess.Optimisation.FieldAware.getter
        (some entry, value)).val
      samples ← pushSamples Chess.Optimisation.FieldAware.machine
        Chess.Optimisation.FieldAware.rowMachine (paidOffset + postCount + encoded) samples
    if (label.val + 1) % 64 = 0 then
      stage s!"rows complete: {label.val + 1}/4042; native sample pairs={samples.size}"
  stage "all literal rows and per-label samples complete"
  let haltCode := (CompactPost.encode Chess.Optimisation.FieldAware.getter
    (none, (0 : Fin 5))).val
  for state in [0, 1, bits.size / 2, bits.size - 1, bits.size, bits.size + 1,
      paidOffset - 1, paidOffset, paidOffset + postCount - 1, paidOffset + postCount,
      paidOffset + haltCode, paidOffset + postCount + haltCode,
      paidOffset + Chess.Optimisation.FieldAware.body.states - 1] do
    samples ← pushSamples Chess.Optimisation.FieldAware.machine
      Chess.Optimisation.FieldAware.rowMachine state samples
  let source := Chess.Optimisation.FieldAware.sourceInput
  let initial := Chess.Optimisation.FieldAware.getter.entry 0
  let metadata := Json.mkObj [
    ("labels", num 4042), ("width", num 1024), ("stores", num 5), ("cell_bits", num 13),
    ("graph_nodes", num (4042 * 1024)), ("post_states", num postCount),
    ("body_states", num Chess.Optimisation.FieldAware.body.states),
    ("generated_states", num Chess.Optimisation.FieldAware.generated.states),
    ("machine_states", num (statesOf Chess.Optimisation.FieldAware.machine)),
    ("row_machine_states", num (statesOf Chess.Optimisation.FieldAware.rowMachine)),
    ("bits_count", num bits.size), ("source_cells_count", num source.length),
    ("initial_raw", num (CompactPost.rawEncode (some initial, (0 : Fin 5))).val),
    ("initial_encoded", num (CompactPost.encode Chess.Optimisation.FieldAware.getter
      (some initial, (0 : Fin 5))).val),
    ("halt_encoded", num haltCode), ("body_entry", num paidOffset)]
  stage "beginning complete actual-machine initializer replay"
  let initializer ← replayInitializer bits.size
  stage "actual initializer replay complete; assembling source and bit strings"
  let payload := Json.mkObj [
    ("schema", toJson "chess-field-full-v1"), ("metadata", metadata),
    ("operations", Json.arr operations), ("syntax", Json.arr syntaxRowsJson),
    ("entries", toJson entries), ("getter_samples", Json.arr getterSamples),
    ("samples", Json.arr samples), ("bits", toJson (bitsString bits)),
    ("source_cells", toJson (String.ofList (source.flatMap cellChars))),
    ("initializer", initializer)]
  stage "payload assembled; serialization begins"
  let serialized := payload.compress
  stage "serialization complete; writing artifact"
  IO.FS.writeFile path serialized
  stage "artifact written"
  IO.println "Full field machine export passed"
