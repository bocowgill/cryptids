/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.FieldBranch.Graph

/-! # Actual ret s003 execution and the complete extended operational certificate -/

@[expose] public section
namespace ConjectureMachines.Compilation.FieldBranch
open Turing PartrecToTM2 FieldBinary

set_option backward.isDefEq.respectTransparency false
set_option maxRecDepth 8192

abbrev Symbol := FieldReturn.Symbol
abbrev RepTape := FieldReturn.RepresentsTape

def sourceLabel : SharedModel.StackLabel := .ret RuntimeModel.s003

def pushLabel : SharedModel.StackLabel :=
  .go .rev (.push (SharedModel.pushFn RuntimeModel.s002)) RuntimeModel.s000

/-- Absence and separators finish the reversal; bits dispatch the actual reverse-stack push. -/
def target (v : RuntimeModel.Store) : SharedModel.StackLabel :=
  if (FieldReturn.symbolCode v).val < 3 then .normal 3 else pushLabel

theorem source_identity : sourceLabel = FieldContinuation.successor := rfl

theorem source_step (v : RuntimeModel.Store) (tape : Tape Symbol) :
    TM1.step FieldReturn.sourceMachine ⟨some sourceLabel, v, tape⟩ =
      some (if tape.head.1 then ⟨some (target v), v, tape⟩ else
        ⟨some sourceLabel, v, tape.move .left⟩) := by
  cases v with
  | none =>
    cases marker : tape.head.1 <;>
      simp [TM1.step, FieldReturn.sourceMachine, sourceLabel, TM2to1.tr, TM1.stepAux,
        RuntimeModel.s003, RuntimeModel.s001, RuntimeModel.s002, RuntimeModel.table5,
        TM2to1.trNormal, marker, target, pushLabel, SharedModel.pushFn, FieldReturn.symbolCode]
  | some value =>
    cases value <;> cases marker : tape.head.1 <;>
      simp [TM1.step, FieldReturn.sourceMachine, sourceLabel, TM2to1.tr, TM1.stepAux,
        RuntimeModel.s003, RuntimeModel.s001, RuntimeModel.s002, RuntimeModel.table5,
        TM2to1.trNormal, marker, target, pushLabel, SharedModel.pushFn, FieldReturn.symbolCode]

theorem source_return (source last : Tape Symbol) (n : Nat)
    (path : FieldReturn.ReturnPath source n last) (v : RuntimeModel.Store) :
    FieldReturn.sourceRun (n + 1) ⟨some sourceLabel, v, source⟩ =
      some ⟨some (target v), v, last⟩ := by
  induction path with
  | here tape marked => simpa [FieldReturn.sourceRun, marked] using source_step v tape
  | left tape n last unmarked rest ih =>
    change (TM1.step FieldReturn.sourceMachine ⟨some sourceLabel, v, tape⟩).bind
      (FieldReturn.sourceRun (n + 1)) = _
    rw [source_step]
    simpa [unmarked] using ih

/-- All defined return rows are copied exactly; their five paid ports encode the branch result. -/
theorem return_refines (source last : Tape Symbol) (n : Nat)
    (path : FieldReturn.ReturnPath source n last) (binary : Tape Bit) (v : Fin 5)
    (rep : RepTape source binary) :
    ∃ finalBits, FlatInit.runFrom machine (37 * n + 24)
      ⟨returnIn (FieldReturn.embed v 0), binary⟩ =
        some ⟨returnIn (FieldReturn.embed v 48), finalBits⟩ ∧
      RepTape last finalBits ∧ finalBits = shift .left (13 * n) binary := by
  obtain ⟨bits, run, represents, shifted⟩ :=
    FieldReturn.return_refines source last n path binary v rep
  have lifted := FieldContinuation.run_partial FieldReturn.machine machine returnIn
    (fun q b _ ↦ return_rows q b) _ _ _ run
  exact ⟨bits, lifted, represents, shifted⟩

/-- The active ret-s003 boundary and its actual successor are decoded with the stored value. -/
def RepresentsCfg (source : FieldReturn.SourceCfg) (binary : Cfg 675 2) : Prop :=
  ((∃ v : Fin 5, source.l = some FieldReturn.sourceLabel ∧
      source.var = FieldReturn.codeSymbol v ∧
      binary.state = oldIn (FieldContinuation.returnIn (FieldReturn.embed v 0))) ∨
    (source.l = some (target source.var) ∧
      binary.state = returnIn (FieldReturn.embed (FieldReturn.symbolCode source.var) 48))) ∧
    RepTape source.Tape binary.tape

/-- The new return branch is independently certified from its live earlier successor port. -/
theorem branch_certificate (source last : Tape Symbol) (n : Nat)
    (path : FieldReturn.ReturnPath source n last) (binary : Tape Bit) (v : Fin 5)
    (rep : RepTape source binary) :
    ∃ finalBits,
      FieldReturn.sourceRun (n + 1) ⟨some sourceLabel, FieldReturn.codeSymbol v, source⟩ =
        some ⟨some (target (FieldReturn.codeSymbol v)), FieldReturn.codeSymbol v, last⟩ ∧
      FlatInit.runFrom machine (2 + (37 * n + 24))
        ⟨oldIn (FieldContinuation.clearIn v 4), binary⟩ =
          some ⟨returnIn (FieldReturn.embed v 48), finalBits⟩ ∧
      RepTape last finalBits := by
  obtain ⟨bits, run, represents, _⟩ := return_refines source last n path binary v rep
  refine ⟨bits, source_return source last n path _, ?_, represents⟩
  rw [FieldReturn.run_add, connector, Option.bind_some]
  exact run

/-- Return, main pop, second return and real store-dependent branch have one certificate. -/
theorem extended_certificate (source bottom popped last : Tape Symbol) (n m k : Nat)
    (value : RuntimeModel.Store) (flag : Bool)
    (returnPath : FieldReturn.ReturnPath source n bottom)
    (popPath : FieldContinuation.PopPath bottom m popped value flag)
    (branchPath : FieldReturn.ReturnPath popped k last)
    (binary : Tape Bit) (v : Fin 5) (rep : RepTape source binary) :
    RepresentsCfg ⟨some FieldReturn.sourceLabel, FieldReturn.codeSymbol v, source⟩
      ⟨oldIn (FieldContinuation.returnIn (FieldReturn.embed v 0)), binary⟩ ∧
    ∃ finalBits,
      FieldReturn.sourceRun (n + m + k + 4)
        ⟨some FieldReturn.sourceLabel, FieldReturn.codeSymbol v, source⟩ =
          some ⟨some (target value), value, last⟩ ∧
      FlatInit.runFrom machine
        ((37 * n + 26 + (23 * m + if flag then 34 else 61)) + 2 + (37 * k + 24))
        ⟨oldIn (FieldContinuation.returnIn (FieldReturn.embed v 0)), binary⟩ =
          some ⟨returnIn (FieldReturn.embed (FieldReturn.symbolCode value) 48), finalBits⟩ ∧
      RepresentsCfg ⟨some (target value), value, last⟩
        ⟨returnIn (FieldReturn.embed (FieldReturn.symbolCode value) 48), finalBits⟩ := by
  obtain ⟨_, poppedBits, sourcePop, binaryPop, poppedRep⟩ :=
    FieldContinuation.composed_certificate source bottom popped n m value flag
      returnPath popPath binary v rep
  obtain ⟨finalBits, returned, finalRep, _⟩ :=
    return_refines popped last k branchPath poppedBits (FieldReturn.symbolCode value) poppedRep.2
  have lifted := FieldContinuation.run_partial FieldContinuation.machine machine oldIn
    old_rows _ _ _ binaryPop
  simp only [Routine.liftCfg] at lifted
  refine ⟨⟨Or.inl ⟨v, rfl, rfl, rfl⟩, rep⟩, finalBits, ?_, ?_, ?_⟩
  · rw [show n + m + k + 4 = (n + m + 3) + (k + 1) by omega,
      FieldContinuation.sourceRun_add, sourcePop, Option.bind_some]
    exact source_return popped last k branchPath value
  · rw [show (37 * n + 26 + (23 * m + if flag then 34 else 61)) + 2 +
        (37 * k + 24) = (37 * n + 26 + (23 * m + if flag then 34 else 61)) +
        (2 + (37 * k + 24)) by omega,
      FieldReturn.run_add, lifted, Option.bind_some,
      FieldReturn.run_add, connector, Option.bind_some]
    exact returned
  · exact ⟨Or.inr ⟨rfl, rfl⟩, finalRep⟩

end ConjectureMachines.Compilation.FieldBranch
