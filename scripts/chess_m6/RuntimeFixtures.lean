import Cryptids.Compilation.RuntimeCertificate

open Turing PartrecToTM2 K' StateTransition
open ConjectureMachines.Compilation

example : RuntimeModel.rows.size = 345 := RuntimeModel.rows_size
example : RuntimeCertificate.decode 0 = Runtime.label .start := RuntimeCertificate.decode_zero

example (state : RuntimeModel.Label) :
    TM2Number.mapStmt RuntimeCertificate.decode (RuntimeModel.machine state) =
      Runtime.machine (RuntimeCertificate.decode state) := RuntimeCertificate.rows state

example (config : TM2.Cfg RuntimeModel.Alphabet RuntimeModel.Label RuntimeModel.Store) :
    (TM2.step RuntimeModel.machine config).map RuntimeCertificate.decodeCfg =
      TM2.step Runtime.machine (RuntimeCertificate.decodeCfg config) :=
  RuntimeCertificate.step_decode config

example (config : TM2.Cfg RuntimeModel.Alphabet RuntimeModel.Label RuntimeModel.Store) :
    (StateTransition.eval (TM2.step RuntimeModel.machine) config).Dom ↔
      (StateTransition.eval (TM2.step Runtime.machine) (RuntimeCertificate.decodeCfg config)).Dom :=
  RuntimeCertificate.dom_cfg config

example (inputStack : K') (input : List Γ') :
    letI : Inhabited Λ' := ⟨Runtime.label .start⟩
    RuntimeCertificate.decodeCfg (TM2.init inputStack input) =
      (TM2.init inputStack input : Cfg') := RuntimeCertificate.decode_init inputStack input

example (inputStack : K') (input : List Γ') :
    letI : Inhabited Λ' := ⟨Runtime.label .start⟩
    (TM2.eval RuntimeModel.machine inputStack input).Dom ↔
      (TM2.eval Runtime.machine inputStack input).Dom :=
  RuntimeCertificate.eval_dom inputStack input

example : TM2.Supports RuntimeModel.machine Finset.univ := RuntimeCertificate.supports

def run {β : Type} (machine : β → TM2.Stmt (fun _ : K' ↦ Γ') β (Option Γ')) :
    Nat → TM2.Cfg (fun _ : K' ↦ Γ') β (Option Γ') →
      Option (Nat × TM2.Cfg (fun _ : K' ↦ Γ') β (Option Γ'))
  | 0, _ => none
  | fuel + 1, current =>
    if current.l.isNone then some (0, current)
    else do
      let next ← TM2.step machine current
      let result ← run machine fuel next
      return (result.1 + 1, result.2)

#eval show IO Unit from do
  let tests := [(0, [9, 10], [0, 9, 10]), (1, [15, 7], [16]), (2, [123, 7, 9], [7, 9])]
  for (tag, values, expected) in tests do
    let input := trList [0, tag, 0, 0] ++ Γ'.consₗ :: trList values
    let some (sourceSteps, source) := run Runtime.machine 10000 (TM2.init main input) |
      throw (IO.userError "Source did not halt")
    let some (literalSteps, literal) := run RuntimeModel.machine 10000 (TM2.init main input) |
      throw (IO.userError "Literal model did not halt")
    unless sourceSteps == literalSteps && source.var == literal.var &&
        source.stk main == literal.stk main && source.stk rev == literal.stk rev &&
        source.stk aux == literal.stk aux && source.stk stack == literal.stk stack &&
        literal.stk main == trList expected do
      throw (IO.userError "Literal/source execution mismatch")
    IO.println s!"Paired runtime opcode {tag}: {literalSteps} exact steps"
  IO.println "Literal runtime fixtures passed: 8 kernel assertions, 3 paired executions"
