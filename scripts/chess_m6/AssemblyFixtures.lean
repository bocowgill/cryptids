import Cryptids.Compilation.StrongAssembly
open Turing ConjectureMachines.Compilation

private def check (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Strong assembly fixture failed: {label}"
  IO.println s!"ok: {label}"

private def zeroGoto : TM1.Stmt Bool (Fin 2) (Fin 5) := .goto fun _ _ ↦ 0
private def changedGoto : TM1.Stmt Bool (Fin 2) (Fin 5) :=
  .goto fun bit store ↦ if bit && store.val == 4 then 1 else 0

private def machine : Unit → TM2.Stmt (fun _ : Unit ↦ Bool) Unit Unit := fun _ ↦ .halt
private def symbols : List (TM2to1.Γ' Unit (fun _ ↦ Bool)) :=
  [false, true].flatMap fun bottom ↦ [none, some false, some true].map fun value ↦
    (bottom, fun _ ↦ value)
private theorem cover (a : TM2to1.Γ' Unit (fun _ ↦ Bool)) : a ∈ symbols := by
  obtain ⟨bottom, values⟩ := a
  have eq : (bottom, fun _ : Unit ↦ values ()) = (bottom, values) := by
    congr 1
  rw [← eq]
  apply List.mem_flatMap.mpr
  refine ⟨bottom, by cases bottom <;> simp, List.mem_map.mpr ⟨values (), ?_, rfl⟩⟩
  cases h : values () with
  | none => simp
  | some value => cases value <;> simp

private def codec := BlockCode.ofList symbols cover
private instance : Hashable (TM2to1.Γ' Unit (fun _ ↦ Bool)) :=
  ⟨fun a ↦ hash (a.1, a.2 ())⟩

private theorem supports : TM2.Supports machine ([()] : List Unit).toFinset := by
  constructor
  · simp
  · intro q hq
    trivial

example : (StrongAssembly.stack machine codec [()] symbols [()] () []).Halts ↔
    (TM2.eval machine () []).Dom :=
  StrongAssembly.stack_halts machine codec [()] supports symbols cover [()]
    (fun _ ↦ List.mem_cons_self) () []

private def movingMachine (q : Fin 3) : TM2.Stmt (fun _ : Unit ↦ Bool) (Fin 3) (Fin 2) :=
  if q = 0 then .push () (fun store ↦ store = 0) (.goto fun _ ↦ 1)
  else if q = 1 then .pop () (fun _ top ↦ if top = some true then 1 else 0)
    (.goto fun store ↦ if store = 1 then 2 else 0)
  else .halt

@[instance_reducible] private def movingHash :
    Hashable (TM1Normalize.Label (TM2to1.tr movingMachine)) :=
  StrongAssembly.sharedLabelHasher [()] (fun _ ↦ [false, true]) (List.finRange 2)

private theorem movingSupports :
    TM2.Supports movingMachine (List.finRange 3).toFinset := by
  simp only [List.toFinset_finRange]
  constructor
  · exact Finset.mem_univ _
  · intro q hq
    generalize movingMachine q = stmt
    induction stmt <;> simp_all [TM2.SupportsStmt]

example (input : List Bool) :
    (StrongAssembly.twiceStack movingMachine codec (List.finRange 3) movingHash symbols
      (List.finRange 2) () input).Halts ↔ (TM2.eval movingMachine () input).Dom :=
  StrongAssembly.twiceStack_halts movingMachine codec (List.finRange 3) movingHash
    movingSupports symbols cover (List.finRange 2) (fun _ ↦ List.mem_finRange _) () input

def main : IO Unit := do
  check "old default hash misses changed branch"
    (sampleStmtHash zeroGoto == sampleStmtHash changedGoto)
  check "strong hash observes all bit/store cases"
    (StrongAssembly.stmtHash [false, true] (List.finRange 5) zeroGoto !=
      StrongAssembly.stmtHash [false, true] (List.finRange 5) changedGoto)
  check "full equality distinguishes changed branch" (zeroGoto != changedGoto)
  let hasher : Hashable (Fin 5) := ⟨fun _ ↦ 0⟩
  let xs : List (Fin 5) := [0, 1, 0, 4, 1]
  let ys := @hashUnique (Fin 5) _ hasher xs
  check "constant-hash collisions preserve distinct values" (ys.length == 3)
  check "constant-hash collisions preserve coverage" ([0, 1, 4].all fun x ↦ x ∈ ys)
  let before := fastStack machine codec [()] symbols [()] ()
  let after := StrongAssembly.stack machine codec [()] symbols [()] () []
  check "state count preserved" (before.extraStates == after.extraStates)
  check "input preserved" (before.input == after.input)
  let run := (fun c ↦ c.bind (TM0.step after.machine))^[1000] (some (TM0.init after.input))
  check "compiled tiny halt remains terminating" run.isNone
  let first := @StrongAssembly.firstNumberIndex (Fin 5) _ hasher _ [1, 0, 4, 1, 4]
  check "first-occurrence map retains first duplicate"
    ((first.get 1).val == 1 && (first.get 4).val == 3)
  check "initial and absent keys retain zero"
    ((first.get 0).val == 0 && (first.get 2).val == 0 && (first.get 3).val == 0)
  check "cached numbering matches original numbering for every key"
    ((List.finRange 5).all fun q ↦ first.get q == numberLabel [1, 0, 4, 1, 4] q)
  check "full head/store cache retains nondefault branch"
    (StrongAssembly.headMemoStmt [false, true] (List.finRange 5) changedGoto == changedGoto)
  let tinyRows : Fin 2 → TM1.Stmt Bool (Fin 2) (Fin 5) := fun q ↦
    if q = 0 then changedGoto else zeroGoto
  let _ : Hashable (TM1to0.Λ' tinyRows) := ⟨fun _ ↦ 0⟩
  let streamed := StrongAssembly.streamedPostLabels tinyRows (List.finRange 2) (List.finRange 5)
  let raw := postSupportList tinyRows (List.finRange 2) (List.finRange 5)
  check "streamed support covers every old candidate under hash collisions"
    (raw.all fun q ↦ q ∈ streamed)
  check "streamed support has exact deduplicated size under hash collisions"
    (streamed.length == (hashUnique raw).length)
  let twice := StrongAssembly.twiceStack movingMachine codec (List.finRange 3) movingHash
    symbols (List.finRange 2) () [false, true, false]
  check "twice-numbered input remains exact"
    (twice.input == blockInput codec (TM2to1.trInit () [false, true, false]))
  let twiceRun := (fun c ↦ c.bind (TM0.step twice.machine))^[10000] (some (TM0.init twice.input))
  check "twice-numbered finite push/pop/goto program terminates" twiceRun.isNone
  IO.println s!"Tiny Post states: {after.extraStates + 1}"
  IO.println s!"Moving Post states: {twice.extraStates + 1}"
  IO.println "Strong assembly fixtures passed: 16 assertions"
