import Cryptids.Compilation.ListAssembly
open Turing ConjectureMachines.Compilation

private theorem boolCover (b : Bool) : b ∈ [false, true] := by cases b <;> simp
private theorem storeCover (v : Fin 5) : v ∈ List.finRange 5 := List.mem_finRange v
private def check (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Explicit list assembly fixture failed: {label}"
  IO.println s!"ok: {label}"

private def zeroGoto : TM1.Stmt Bool (Fin 2) (Fin 5) := .goto fun _ _ ↦ 0
private def changedGoto : TM1.Stmt Bool (Fin 2) (Fin 5) :=
  .goto fun bit store ↦ if bit && store.val == 4 then 1 else 0
private def storeGoto : TM1.Stmt Bool (Fin 2) (Fin 5) :=
  .goto fun _ store ↦ if store.val == 4 then 1 else 0
private theorem zeroFree : Block.AllHeadFree zeroGoto := by intro a v; rfl
private theorem storeFree : Block.AllHeadFree storeGoto := by intro a v; rfl
private def source (q : Fin 2) : TM1.Stmt Bool (Fin 2) (Fin 5) :=
  if q = 0 then .write (fun a v ↦ a != (v.val == 4)) storeGoto else .halt
private theorem sourceFree (q : Fin 2) : Block.AllHeadFree (source q) := by
  unfold source
  split
  · exact storeFree
  · trivial
private theorem sourceSupport : TM1.Supports source (List.finRange 2).toFinset := by
  simp only [List.toFinset_finRange]
  constructor
  · exact Finset.mem_univ _
  · intro q hq
    generalize source q = stmt
    induction stmt <;> simp_all [TM1.SupportsStmt]
private def boolCodec := BlockCode.ofList [false, true] boolCover
@[instance_reducible] private def constantBinaryHash : Hashable (TM1to1.Λ' Bool (Fin 2) (Fin 5)) := ⟨fun _ ↦ 0⟩
private def binary := ListAssembly.BinaryIndex.program boolCodec source (List.finRange 2)
  sourceSupport (fun q _ ↦ sourceFree q) [false, true] boolCover
  (List.finRange 5) storeCover constantBinaryHash

example (input : List Bool) : (TM1.eval binary.get input).Dom ↔
    (TM1.eval (Block.compilerFree boolCodec source) input).Dom :=
  ListAssembly.BinaryIndex.program_dom boolCodec source (List.finRange 2) sourceSupport
    (fun q _ ↦ sourceFree q) [false, true] boolCover (List.finRange 5) storeCover
    constantBinaryHash input
example : TM1.Supports binary.get Finset.univ :=
  ListAssembly.BinaryIndex.program_supports boolCodec source (List.finRange 2) sourceSupport
    (fun q _ ↦ sourceFree q) [false, true] boolCover (List.finRange 5) storeCover constantBinaryHash

private def machine : Unit → TM2.Stmt (fun _ : Unit ↦ Bool) Unit Unit := fun _ ↦
  .push () (fun _ ↦ true) .halt
private def symbols : List (TM2to1.Γ' Unit (fun _ ↦ Bool)) :=
  [false, true].flatMap fun bottom ↦ [none, some false, some true].map fun value ↦
    (bottom, fun _ ↦ value)
private theorem cover (a : TM2to1.Γ' Unit (fun _ ↦ Bool)) : a ∈ symbols := by
  obtain ⟨bottom, values⟩ := a
  have eq : (bottom, fun _ : Unit ↦ values ()) = (bottom, values) := by congr 1
  rw [← eq]
  apply List.mem_flatMap.mpr
  refine ⟨bottom, by cases bottom <;> simp, List.mem_map.mpr ⟨values (), ?_, rfl⟩⟩
  cases h : values () with
  | none => simp
  | some value => cases value <;> simp
private def codec := BlockCode.ofList symbols cover
private instance : Hashable (TM2to1.Γ' Unit (fun _ ↦ Bool)) :=
  ⟨fun a ↦ hash (a.1, a.2 ())⟩
private def freeEq : DecidableEq (ListAssembly.HeadFree.Label
    (TM2to1.Γ' Unit (fun _ ↦ Bool)) (TM2to1.Λ' Unit (fun _ ↦ Bool) Unit Unit) Unit) :=
  ListEquality.sharedHeadFreeLabelDecEq [()] (fun _ ↦ List.mem_cons_self)
    (fun _ ↦ [false, true]) (fun _ ↦ boolCover) symbols cover [()] (fun _ ↦ List.mem_cons_self)
@[instance_reducible] private def sourceHash : Hashable (TM1Normalize.Label (TM2to1.tr machine)) := ⟨fun _ ↦ 0⟩
private theorem supports : TM2.Supports machine ([()] : List Unit).toFinset := by
  constructor
  · simp
  · intro q hq
    trivial
example (input : List Bool) :
    (ListAssembly.freeStack machine codec [()] freeEq sourceHash symbols [()] () input).Halts ↔
      (TM2.eval machine () input).Dom :=
  ListAssembly.freeStack_halts machine codec [()] freeEq sourceHash supports symbols cover
    [()] (fun _ ↦ List.mem_cons_self) () input

private abbrev family : Bool → Type | false => Fin 2 | true => Bool
private instance (b : Bool) : DecidableEq (family b) := by cases b <;> dsimp only [family] <;> infer_instance
private def dependentZero : (b : Bool) → family b | false => 0 | true => false
private def dependentChanged : (b : Bool) → family b | false => 0 | true => true

def main : IO Unit := do
  let table := ListEquality.tableDecEq [false, true] boolCover (List.finRange 5) storeCover
    (γ := Fin 2)
  check "covered tables distinguish nondefault head/store"
    (! @decide _ (table (fun _ _ ↦ 0) (fun b v ↦ if b && v.val == 4 then 1 else 0)))
  check "covered tables accept extensionally equal functions"
    (@decide _ (table (fun b v ↦ if b && v.val == 4 then 1 else 0)
      (fun b v ↦ if b = true ∧ v.val = 4 then 1 else 0)))
  let dependentEq := ListEquality.dependentFunctionDecEq [false, true] boolCover (β := family)
  check "dependent coverage distinguishes nondefault branch"
    (! @decide _ (dependentEq dependentZero dependentChanged))
  check "dependent coverage accepts duplicate observation lists"
    (@decide _ ((ListEquality.dependentFunctionDecEq [false, true, false]
      (fun b ↦ by cases b <;> simp) (β := family)) dependentZero dependentZero))
  let stmtEq := ListEquality.stmtDecEq [false, true] boolCover (List.finRange 5) storeCover
    (Λ := Fin 2)
  check "full statement equality keeps nondefault goto behavior"
    (! @decide _ (stmtEq zeroGoto changedGoto))
  check "full statement equality agrees on equal syntax" (@decide _ (stmtEq storeGoto storeGoto))
  let writeZero : TM1.Stmt Bool (Fin 2) (Fin 5) := .write (fun _ _ ↦ false) .halt
  let writeChanged : TM1.Stmt Bool (Fin 2) (Fin 5) :=
    .write (fun a v ↦ a && v.val == 4) .halt
  check "write tables retain nondefault symbols" (! @decide _ (stmtEq writeZero writeChanged))
  check "constructors remain distinct" (! @decide _ (stmtEq zeroGoto .halt))
  let certifiedEq := ListEquality.headFreeLabelDecEq [false, true] boolCover
    (List.finRange 5) storeCover (Λ := Fin 2)
  let zeroKey : ListAssembly.HeadFree.Label Bool (Fin 2) (Fin 5) := ⟨zeroGoto, zeroFree⟩
  let storeKey : ListAssembly.HeadFree.Label Bool (Fin 2) (Fin 5) := ⟨storeGoto, storeFree⟩
  check "certified goto equality retains all stores" (! @decide _ (certifiedEq zeroKey storeKey))
  check "certified equality accepts duplicated certified syntax"
    (@decide _ (certifiedEq storeKey ⟨storeGoto, storeFree⟩))
  let certHash : Hashable (ListAssembly.HeadFree.Label Bool (Fin 2) (Fin 5)) := ⟨fun _ ↦ 0⟩
  let unique := @hashUnique _ certifiedEq certHash [zeroKey, storeKey, zeroKey]
  check "certified equality handles duplicate keys under hash collisions" (unique.length == 2)
  let binaryEq := ListEquality.binaryFreeLabelDecEq [false, true] boolCover
    (List.finRange 5) storeCover (Λ := Fin 2)
  let bzero : {q : TM1to1.Λ' Bool (Fin 2) (Fin 5) // ListEquality.BinaryLabelFree q} :=
    ⟨.write false zeroGoto, zeroFree⟩
  let bother : {q : TM1to1.Λ' Bool (Fin 2) (Fin 5) // ListEquality.BinaryLabelFree q} :=
    ⟨.write false storeGoto, storeFree⟩
  check "binary write keys retain nondefault store continuation"
    (! @decide _ (binaryEq bzero bother))
  check "binary write keys retain written symbol"
    (! @decide _ (binaryEq bzero ⟨.write true zeroGoto, zeroFree⟩))
  check "binary write keys accept equal continuation"
    (@decide _ (binaryEq bzero ⟨.write false zeroGoto, zeroFree⟩))
  let labels := binarySupportList source (List.finRange 2) [false, true]
  check "lazy binary getter preserves ordered control bound"
    (binary.sourceStates == labels.length + 1)
  check "constant-hash binary index retains distinct keys"
    (binary.indexEntries == (hashUnique labels).length)
  let old := TM1Number.numberProgram (Block.compilerFree boolCodec source) labels
  check "every lazy binary procedure equals established numbering"
    ((List.finRange (labels.length + 1)).all fun q ↦ binary.get q == old q)
  let cached := ListAssembly.cachedFreeSharedProgram machine [()] freeEq sourceHash [()]
  let oldSource := fastTM1 machine [()]
  check "every certified source procedure equals established numbering"
    ((List.finRange ((sharedTapeLabels machine [()]).length + 1)).all fun q ↦
      cached.get q == oldSource q)
  let fast := ListAssembly.freeStack machine codec [()] freeEq sourceHash symbols [()] ()
    [false, true, false]
  check "certified source wrapper preserves exact finite input"
    (fast.input == blockInput codec (TM2to1.trInit () [false, true, false]))
  let run := (fun c ↦ c.bind (TM0.step fast.machine))^[5000] (some (TM0.init fast.input))
  check "certified source wrapper finite push/halt execution terminates" run.isNone
  IO.println "Explicit list assembly fixtures passed: 20 assertions"
