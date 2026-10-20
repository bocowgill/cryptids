import Cryptids.Compilation.NumberTM2

open Turing StateTransition
open ConjectureMachines.Compilation
open TM2Number

abbrev Alphabet (_ : Unit) := Bool

def source (state : Bool) : TM2.Stmt Alphabet Bool Bool :=
  if state then
    .peek () (fun store symbol ↦ symbol.getD store)
      (.branch id (.pop () (fun store _ ↦ store) .halt)
        (.load (fun _ ↦ true) (.goto fun _ ↦ true)))
  else .push () (fun store ↦ !store) (.goto fun _ ↦ true)

def labels : List Bool := [true, false, true]
def stores : List Bool := [false, true]

theorem cover (store : Bool) : store ∈ stores := by cases store <;> simp [stores]

theorem supported : TM2.Supports source labels.toFinset := by
  constructor
  · simp [labels]
  · intro state _
    cases state <;> simp [source, labels, TM2.SupportsStmt]

example (input : List Bool) :
    mapCfg (numberLabel labels) (TM2.init () input : TM2.Cfg Alphabet Bool Bool) =
      TM2.init () input := mapCfg_init (Γ := Alphabet) (σ := Bool) labels () input

example (input : List Bool) :
    decodeCfg labels (TM2.init () input) = (TM2.init () input : TM2.Cfg Alphabet Bool Bool) :=
  decodeCfg_init (Γ := Alphabet) (σ := Bool) labels () input

example : unnumberLabel labels (3 : Fin 4) = true := rfl

example (config : TM2.Cfg Alphabet (Fin 4) Bool) :
    (TM2.step (numberProgram source labels) config).map (decodeCfg labels) =
      TM2.step source (decodeCfg labels config) :=
  step_decode source labels (initialFirst_support source labels supported) config

example : (cachedNumberProgram stores source labels).get = numberProgram source labels :=
  cachedNumberProgram_eq stores cover source labels

example : TM2.Supports (cachedNumberProgram stores source labels).get Finset.univ :=
  cachedNumberProgram_supports stores cover source labels

example (input : List Bool) :
    (TM2.eval (cachedNumberProgram stores source labels).get () input).Dom ↔
      (TM2.eval source () input).Dom :=
  cachedNumberProgram_dom_of_support stores cover source labels supported () input

example (first last : TM2.Cfg Alphabet Bool Bool)
    (initial : first.l ∈ Finset.insertNone labels.toFinset)
    (path : TM2.Reaches source first last) : last.l ∈ Finset.insertNone labels.toFinset :=
  reaches_supported source labels.toFinset supported first last initial path

def run {β : Type} (machine : β → TM2.Stmt Alphabet β Bool) :
    Nat → TM2.Cfg Alphabet β Bool → Option (TM2.Cfg Alphabet β Bool)
  | 0, _ => none
  | fuel + 1, config =>
    if config.l.isNone then some config
    else TM2.step machine config >>= run machine fuel

#eval do
  let table := cachedNumberProgram stores source labels
  for input in [[], [false, true, false]] do
    let some original := run source 10 (TM2.init () input) |
      throw (IO.userError "Source fixture did not halt")
    let some numeric := run table.get 10 (TM2.init () input) |
      throw (IO.userError "Numeric fixture did not halt")
    unless original.var && numeric.var && original.l.isNone && numeric.l.isNone &&
        original.stk () == input && numeric.stk () == input do
      throw (IO.userError "Numeric TM2 data mismatch")
  IO.println "NumberTM2 fixtures passed: 8 kernel assertions, 2 actual-machine runs"
