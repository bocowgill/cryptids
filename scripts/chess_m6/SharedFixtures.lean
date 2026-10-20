import Cryptids.Compilation.SharedCertificate

open Turing PartrecToTM2 K' StateTransition
open ConjectureMachines.Compilation

example : SharedModel.entries.count = 4042 := SharedModel.entries_count
example : SharedModel.entries.WellFormed := SharedModel.entries_wellFormed
example : SharedCertificate.decode 0 = (default : SharedCertificate.SourceLabel) :=
  SharedCertificate.initial
example : LocalCertificate.TM1Rows SharedModel.machine
    (TM1Normalize.tr SharedCertificate.stackMachine) SharedCertificate.decode :=
  SharedCertificate.rows
example (state : SharedModel.Label) : Block.AllHeadFree (SharedModel.machine state) :=
  SharedCertificate.allHeadFree state
example (state : SharedModel.Label) : TM1Normalize.OnePrimitive (SharedModel.machine state) :=
  SharedCertificate.onePrimitive state
example : TM1.Supports SharedModel.machine Finset.univ := SharedCertificate.supports
example (cfg : TM1.Cfg SharedModel.Symbol SharedModel.Label SharedModel.Store) :
    (TM1.step SharedModel.machine cfg).map SharedCertificate.decodeCfg =
      TM1.step (TM1Normalize.tr SharedCertificate.stackMachine)
        (SharedCertificate.decodeCfg cfg) := SharedCertificate.step_decode cfg
example (cfg : TM1.Cfg SharedModel.Symbol SharedModel.Label SharedModel.Store) :
    (StateTransition.eval (TM1.step SharedModel.machine) cfg).Dom ↔
      (StateTransition.eval (TM1.step (TM1Normalize.tr SharedCertificate.stackMachine))
        (SharedCertificate.decodeCfg cfg)).Dom := SharedCertificate.dom_cfg cfg
example (input : List SharedModel.Symbol) :
    (TM1.eval SharedModel.machine input).Dom ↔
      (TM1.eval SharedCertificate.stackMachine input).Dom := SharedCertificate.eval_dom input
example (k : K') (input : List Γ') :
    (TM1.eval SharedModel.machine (TM2to1.trInit k input)).Dom ↔
      (TM2.eval RuntimeModel.machine k input).Dom := SharedCertificate.stack_eval_dom k input
example (k : K') (input : List Γ') :
    letI : Inhabited Λ' := ⟨Runtime.label .start⟩
    (TM1.eval SharedModel.machine (TM2to1.trInit k input)).Dom ↔
      (TM2.eval Runtime.machine k input).Dom := SharedCertificate.runtime_eval_dom k input

def run {A : Type} (machine : A → TM1.Stmt SharedModel.Symbol A SharedModel.Store) :
    Nat → TM1.Cfg SharedModel.Symbol A SharedModel.Store →
      Option (Nat × TM1.Cfg SharedModel.Symbol A SharedModel.Store)
  | 0, _ => none
  | fuel + 1, current =>
    if current.l.isNone then some (0, current)
    else do
      let next ← TM1.step machine current
      let result ← run machine fuel next
      return (result.1 + 1, result.2)

def trim : List SharedModel.Symbol → List SharedModel.Symbol
  | [] => []
  | a :: rest => match trim rest with
    | [] => if a = default then [] else [a]
    | b :: tail => a :: b :: tail

theorem trim_blanks (n : Nat) : trim (List.replicate n default) = [] := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [List.replicate_succ, trim, ih, ↓reduceIte]

theorem trim_append_blanks (items : List SharedModel.Symbol) (n : Nat) :
    trim (items ++ List.replicate n default) = trim items := by
  induction items with
  | nil => exact trim_blanks n
  | cons a rest ih => simp only [List.cons_append, trim, ih]

def canonical (items : ListBlank SharedModel.Symbol) : List SharedModel.Symbol :=
  items.liftOn trim (by
    rintro a _ ⟨n, rfl⟩
    exact (trim_append_blanks a n).symm)

theorem trim_extends (items : List SharedModel.Symbol) : BlankExtends (trim items) items := by
  induction items with
  | nil => exact ⟨0, rfl⟩
  | cons a rest ih =>
    obtain ⟨n, restEq⟩ := ih
    cases h : trim rest with
    | nil =>
      have restEmpty : rest = List.replicate n default := by simpa only [h, List.nil_append] using restEq
      by_cases ha : a = default
      · subst a
        refine ⟨n + 1, ?_⟩
        simp [trim, restEmpty, trim_blanks, List.replicate_succ]
      · refine ⟨n, ?_⟩
        simp [trim, ha, restEmpty, trim_blanks]
    | cons b tail =>
      refine ⟨n, ?_⟩
      simpa only [trim, h, List.cons_append] using congrArg (List.cons a) restEq

theorem canonical_sound (items : ListBlank SharedModel.Symbol) :
    ListBlank.mk (canonical items) = items := by
  refine ListBlank.induction_on items ?_
  intro values
  exact Quotient.sound' (Or.inl (trim_extends values))

theorem canonical_injective : Function.Injective canonical := by
  intro first second equal
  exact (canonical_sound first).symm.trans
    ((congrArg ListBlank.mk equal).trans (canonical_sound second))

def sameTape (left right : Tape SharedModel.Symbol) : Bool :=
  decide (left.head = right.head ∧ canonical left.left = canonical right.left ∧
    canonical left.right = canonical right.right)

#eval show IO Unit from do
  let tests := [(0, [9, 10]), (1, [15, 7]), (2, [123, 7, 9])]
  for (tag, values) in tests do
    let input := trList [0, tag, 0, 0] ++ Γ'.consₗ :: trList values
    let tape := TM2to1.trInit main input
    let some (sourceSteps, source) := run
        (TM1Normalize.tr SharedCertificate.stackMachine) 200000 (TM1.init tape) |
      throw (IO.userError "Normalized source did not halt within bound")
    let some (literalSteps, literal) := run SharedModel.machine 200000 (TM1.init tape) |
      throw (IO.userError "Literal shared table did not halt within bound")
    unless sourceSteps == literalSteps && source.var == literal.var &&
        source.l.isNone && literal.l.isNone && sameTape source.Tape literal.Tape do
      throw (IO.userError "Literal/normalized source execution mismatch")
    IO.println s!"Paired normalized opcode {tag}: {literalSteps} exact steps, equal final tape/store"
  IO.println "Shared fixtures passed: 12 kernel assertions, 3 paired executions"
