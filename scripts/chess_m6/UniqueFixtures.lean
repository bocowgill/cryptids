import Cryptids.Compilation.UniqueAssembly

open Turing ConjectureMachines.Compilation

private def check (label : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Unique support fixture failed: {label}"
  IO.println s!"ok: {label}"

private abbrev Statement := TM1.Stmt Bool Bool Bool

private instance : Hashable Statement := ⟨fun _ ↦ 0⟩

private def arm : Statement := .move .left .halt
private def fork : Statement := .branch (fun head store ↦ head != store) arm arm
private def other : Statement := .branch (fun head store ↦ head == store) arm arm

example : UniqueSupport.SubtreeClosed (UniqueSupport.collect arm ∅) :=
  UniqueSupport.collect_closed arm ∅ UniqueSupport.empty_closed

example (q : Statement) :
    q ∈ UniqueSupport.collect fork (UniqueSupport.collect arm ∅) ↔
      q ∈ UniqueSupport.collect arm ∅ ∨ q ∈ subtermList fork :=
  UniqueSupport.collect_mem fork _
    (UniqueSupport.collect_closed arm ∅ UniqueSupport.empty_closed) q

private def machine (q : Fin 2) : TM1.Stmt Bool (Fin 2) Bool :=
  if q = 0 then .branch (fun head store ↦ head != store)
    (.write (fun head _ ↦ !head) (.goto fun _ _ ↦ 1))
    (.load (fun _ store ↦ !store) (.goto fun _ _ ↦ 1))
  else .halt

private theorem support : TM1.Supports machine Finset.univ := by
  constructor
  · exact Finset.mem_univ _
  · intro q hq
    generalize machine q = stmt
    induction stmt <;> simp_all [TM1.SupportsStmt]

private def eqStatement : DecidableEq (TM1.Stmt Bool (Fin 2) Bool) := tm1StmtDecidableEq
@[instance_reducible] private def hashStatement : Hashable (TM1.Stmt Bool (Fin 2) Bool) :=
  ⟨fun _ ↦ 0⟩

example (input : List Bool) :
    (UniqueAssembly.post machine [false, true, false] input eqStatement hashStatement).Halts ↔
      (TM1.eval machine input).Dom :=
  UniqueAssembly.post_halts machine support _ (by intro b; cases b <;> simp) input
    eqStatement hashStatement

def main : IO Unit := do
  check "empty bodies" ((UniqueSupport.collectMany ([] : List Statement) ∅).size == 0)
  let seen := UniqueSupport.collect fork ∅
  check "branch visits complete shared subtree" (seen.size == 3 && arm ∈ seen && .halt ∈ seen)
  check "duplicates skipped" ((UniqueSupport.collectMany [fork, fork, arm, fork] ∅).size == 3)
  check "full function equality under constant hash"
    ((UniqueSupport.collectMany [fork, other, fork] ∅).size == 4 && fork != other)
  let preclosed := UniqueSupport.collect arm ∅
  let extended := UniqueSupport.collect fork preclosed
  check "preclosed extension" (extended.size == 3 && arm ∈ extended && .halt ∈ extended)
  let incomplete : Std.HashSet Statement := (∅ : Std.HashSet Statement).insert arm
  check "closure precondition is necessary" (!(UniqueSupport.collect arm incomplete).contains .halt)
  let labels := UniqueSupport.postLabels (fun _ : Bool ↦ fork) [false, true, false]
    [false, true, false]
  check "duplicate procedure/store inputs" (labels.length == 8)
  check "every store for absent control" ([(none, false), (none, true)].all (· ∈ labels))
  check "all and only source subterms" (([fork, arm, .halt] ×ˢ [false, true]).all
    (fun p ↦ (some p.1, p.2) ∈ labels))
  let _ : DecidableEq (TM1to0.Λ' machine) := UniqueAssembly.postKeyEq machine eqStatement
  let _ : Hashable (TM1to0.Λ' machine) := UniqueAssembly.postKeyHash machine hashStatement
  let previous := StrongAssembly.streamedPostLabels machine (List.finRange 2)
    [false, true, false]
  let current := UniqueAssembly.postLabels machine (List.finRange 2) [false, true, false]
    eqStatement hashStatement
  check "exact streamed membership" (previous.all (· ∈ current) && current.all (· ∈ previous))
  check "exact streamed cardinality" (current.length == previous.length)
  let packaged := UniqueAssembly.post machine [false, true, false] [true, false, true]
    eqStatement hashStatement
  check "complete charged state count" (packaged.extraStates + 1 == 13)
  check "same nonempty input" (packaged.input == [true, false, true])
  let halted := (fun cfg ↦ cfg.bind (TM0.step packaged.machine))^[20]
    (some (TM0.init packaged.input))
  check "actual numbered machine halts" halted.isNone
  IO.println "Unique support fixtures passed: 14 assertions"
