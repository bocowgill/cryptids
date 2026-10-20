import Cryptids.Compilation.BinaryTemplates

open Turing
open ConjectureMachines.Compilation BinaryTemplates

namespace BinaryTemplateFixtures

/-- Two bits per source Boolean, with the second bit zero. -/
def code : BlockCode Bool where
  width := 2
  encode a := ⟨[a, false], rfl⟩
  decode v := v.head
  blank := rfl
  roundtrip _a := rfl

def alphabet : Fin 2 ≃ Bool where
  toFun a := a == 1
  invFun a := if a then 1 else 0
  left_inv a := by fin_cases a <;> rfl
  right_inv a := by cases a <;> rfl

def source (q : Fin 8) : TM1.Stmt Bool (Fin 8) Bool :=
  match q.val with
  | 0 => .write (fun a v ↦ a != v) (.goto fun _ _ ↦ 1)
  | 1 => .load (fun a v ↦ a != v) (.goto fun _ _ ↦ 2)
  | 2 => .branch (fun a v ↦ a == v) (.goto fun _ _ ↦ 3) (.goto fun _ _ ↦ 4)
  | 3 => .move .right (.goto fun _ _ ↦ 5)
  | 4 => .move .left (.goto fun _ _ ↦ 5)
  | 5 => .goto fun _ v ↦ if v then 6 else 7
  | 6 => .write (fun _ _ ↦ true) (.goto fun _ _ ↦ 7)
  | _ => .halt

def sitePC (i : Fin 2) : Fin 8 := if i = 0 then 0 else 6
def siteNext (i : Fin 2) : Bool → Bool → Fin 8 := fun _ _ ↦ if i = 0 then 1 else 7
def siteFor (q : Fin 8) : Option (Fin 2) :=
  if q = 0 then some 0 else if q = 6 then some 1 else none

def sites : WriteSites source 2 where
  pc := sitePC
  next := siteNext
  siteFor := siteFor
  row i := by fin_cases i <;> exact ⟨_, rfl⟩
  lookup i := by fin_cases i <;> rfl
  inverse q i h := by fin_cases q <;> fin_cases i <;> simp_all [siteFor, sitePC]
  covers q f tail h := by fin_cases q <;> simp_all [source, siteFor]

theorem primitive (q : Fin 8) : TM1Normalize.OnePrimitive (source q) := by
  fin_cases q <;> trivial

theorem headFree (q : Fin 8) : Block.AllHeadFree (source q) := by
  fin_cases q <;> simp [source, Block.AllHeadFree, Block.HeadFree]

abbrev binary := machine code source sites alphabet

/-- Executed observations of the actual TM1 statement evaluator. -/
def observe (cfg : TM1.Cfg Bool (Fin 12) Bool) : Option Nat × Bool × Bool :=
  (cfg.l.map Fin.val, cfg.var, cfg.Tape.head)

def probe (q : Fin 12) (store : Bool) (bits : List Bool) : Option Nat × Bool × Bool :=
  observe (TM1.stepAux (binary q) store (Tape.mk₁ bits))

-- Normal write selects the site/glyph arithmetic PC without changing tape or store.
example : probe 0 false [true, false] = (some 9, false, true) := by decide
example : probe 0 true [true, false] = (some 8, true, true) := by decide
-- Both writer glyphs use the saved source continuation, write both bits, and restore the head.
example : probe 8 false [true, true] = (some 1, false, false) := by decide
example : probe 9 true [false, true] = (some 1, true, true) := by decide
example : probe 11 false [false, false] = (some 7, false, true) := by decide
-- The writer replaces the padding bit too, rather than preserving the old source-cell suffix.
example : (Tape.move .right (TM1.stepAux (binary 9) true
    (Tape.mk₁ [false, true])).Tape).head = false := by decide
-- Load changes only the store and transfers to its numeric continuation.
example : probe 1 false [true, false] = (some 2, true, true) := by decide
-- Both branch alternatives are exercised.
example : probe 2 true [true, false] = (some 3, true, true) := by decide
example : probe 2 false [true, false] = (some 4, false, true) := by decide
-- Two-bit right and left moves end at the next super-cell or the blank cell to the left.
example : probe 3 false [false, false, true, false] = (some 5, false, true) := by decide
example : probe 4 false [true, false] = (some 5, false, false) := by decide
-- Left movement also crosses exactly two bits from a nonblank source cell.
example : observe (TM1.stepAux (binary 4) false
    (Tape.move .right (Tape.move .right (Tape.mk₁ [true, false, false, false])))) =
    (some 5, false, true) := by decide
-- The direct goto ignores the scanned head and depends on the store.
example : probe 5 true [false, false] = (some 6, true, false) := by decide
example : probe 5 false [true, false] = (some 7, false, true) := by decide
example : probe 7 true [] = (none, true, false) := by decide
-- Exact numeric bounds and separate write sites.
example : Fintype.card (Fin (8 + 2 * 2)) = 12 := state_count
example : (writer 8 (1 : Fin 2) (1 : Fin 2)).val = 11 := rfl
example : ∀ q, TM1Number.mapStmt (decode sites alphabet) (binary q) =
    Block.compilerFree code source (decode sites alphabet q) :=
  rows_refine code source sites alphabet primitive
example (input : List Bool) : (TM1.eval binary (blockInput code input)).Dom ↔
    (TM1.eval source input).Dom := halts_iff code source sites alphabet primitive headFree input

/-- Literal finite iteration of the machine transition, retaining its stopped configuration. -/
def run (fuel : Nat) (M : Fin 12 → TM1.Stmt Bool (Fin 12) Bool)
    (cfg : TM1.Cfg Bool (Fin 12) Bool) : TM1.Cfg Bool (Fin 12) Bool :=
  match fuel with
  | 0 => cfg
  | fuel + 1 => match TM1.step M cfg with
    | none => cfg
    | some cfg => run fuel M cfg

theorem run_reaches (fuel : Nat) (M : Fin 12 → TM1.Stmt Bool (Fin 12) Bool)
    (cfg : TM1.Cfg Bool (Fin 12) Bool) :
    StateTransition.Reaches (TM1.step M) cfg (run fuel M cfg) := by
  induction fuel generalizing cfg with
  | zero => exact Relation.ReflTransGen.refl
  | succ fuel ih =>
    simp only [run]
    cases h : TM1.step M cfg with
    | none => exact Relation.ReflTransGen.refl
    | some next => exact Relation.ReflTransGen.head (by simp only [h, Option.mem_some_iff]) (ih next)

-- Complete execution through two write sites, load, branch, move, store-dependent goto, halt.
example : observe (run 12 binary (TM1.init (blockInput code [true, false])) ) =
    (none, true, true) := by decide
example : observe (run 12 binary (TM1.init (blockInput code []))) =
    (none, false, false) := by decide

-- The finite execution supplies an actual domain proof, not just a timeout observation.
example : (TM1.eval binary (blockInput code [true, false])).Dom := by
  change (StateTransition.eval (TM1.step binary) _).Dom
  apply Part.dom_iff_mem.mpr
  refine ⟨run 12 binary (TM1.init (blockInput code [true, false])),
    StateTransition.mem_eval.mpr ⟨run_reaches _ _ _, ?_⟩⟩
  have halted : (run 12 binary (TM1.init (blockInput code [true, false]))).l = none := by decide
  generalize run 12 binary (TM1.init (blockInput code [true, false])) = cfg at halted ⊢
  rcases cfg with ⟨l, v, T⟩
  change l = none at halted
  subst l
  rfl

/-- Zero write sites still compile; this source has a real control cycle. -/
def loop (_ : Fin 1) : TM1.Stmt Bool (Fin 1) Bool := .goto fun _ _ ↦ 0

def loopSites : WriteSites loop 0 where
  pc := Fin.elim0
  next := Fin.elim0
  siteFor _ := none
  row i := i.elim0
  lookup i := i.elim0
  inverse _ i := i.elim0
  covers _ _ _ h := by cases h

private theorem self_loop_not_dom {α : Type} (f : α → Option α) (a : α)
    (step : f a = some a) : ¬(StateTransition.eval f a).Dom := by
  intro dom
  obtain ⟨b, hb⟩ := Part.dom_iff_mem.mp dom
  have impossible : a = a → False := StateTransition.evalInduction
    (C := fun x ↦ x = a → False) hb (fun x _ ih hx ↦ by
      subst x
      exact ih a step rfl)
  exact impossible rfl

theorem loop_source_diverges (input : List Bool) : ¬(TM1.eval loop input).Dom := by
  change ¬(StateTransition.eval _ _).Dom
  apply self_loop_not_dom
  rfl

theorem loop_binary_diverges (input : List Bool) :
    ¬(TM1.eval (machine code loop loopSites alphabet) (blockInput code input)).Dom := by
  rw [halts_iff code loop loopSites alphabet (fun _ ↦ trivial) (fun _ _ _ ↦ rfl) input]
  exact loop_source_diverges input

-- Distinguish state routing and write-bit corruption from the verified template.
example : probe 9 true [false, false] ≠ (some 7, true, true) := by decide
example : probe 8 true [true, true] ≠ (some 1, true, true) := by decide

/-- A zero-width singleton alphabet is permitted by the frozen BlockCode contract. -/
def unitCode : BlockCode Unit where
  width := 0
  encode _ := ⟨[], rfl⟩
  decode _ := ()
  blank := rfl
  roundtrip _ := rfl

def unitAlphabet : Fin 1 ≃ Unit where
  toFun _ := ()
  invFun _ := 0
  left_inv a := by fin_cases a; rfl
  right_inv a := by cases a; rfl

def stop (_ : Fin 1) : TM1.Stmt Unit (Fin 1) Bool := .halt

def stopSites : WriteSites stop 0 where
  pc := Fin.elim0
  next := Fin.elim0
  siteFor _ := none
  row i := i.elim0
  lookup i := i.elim0
  inverse _ i := i.elim0
  covers _ _ _ h := by cases h

example : machine unitCode stop stopSites unitAlphabet 0 = .halt := rfl
example : blockInput unitCode [(), (), ()] = [] := rfl
example (input : List Unit) :
    (TM1.eval (machine unitCode stop stopSites unitAlphabet) (blockInput unitCode input)).Dom ↔
      (TM1.eval stop input).Dom :=
  halts_iff unitCode stop stopSites unitAlphabet (fun _ ↦ trivial) (fun _ ↦ trivial) input

end BinaryTemplateFixtures

open BinaryTemplateFixtures

private def check (name : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Binary template fixture failed: {name}"

private def expected (q : Fin 12) (store head : Bool) : Option Nat × Bool × Bool :=
  match q.val with
  | 0 => (some (if head != store then 9 else 8), store, head)
  | 1 => (some 2, head != store, head)
  | 2 => (some (if head == store then 3 else 4), store, head)
  | 3 | 4 => (some 5, store, false)
  | 5 => (some (if store then 6 else 7), store, head)
  | 6 => (some 11, store, head)
  | 7 => (none, store, head)
  | 8 => (some 1, store, false)
  | 9 => (some 1, store, true)
  | 10 => (some 7, store, false)
  | _ => (some 7, store, true)

def main : IO Unit := do
  let mut count := 0
  for q in List.finRange 12 do
    for store in [false, true] do
      for head in [false, true] do
        for padding in [false, true] do
          check s!"PC={q.val},store={store},head={head},padding={padding}"
            (probe q store [head, padding] == expected q store head)
          count := count + 1
  check "complete nonempty execution"
    (observe (run 12 binary (TM1.init (blockInput code [true, false]))) == (none, true, true))
  check "complete empty execution"
    (observe (run 12 binary (TM1.init (blockInput code []))) == (none, false, false))
  let loopBinary := machine code loop loopSites alphabet
  let loopCfg := (fun cfg ↦ cfg.bind (TM1.step loopBinary))^[100]
    (some (TM1.init (blockInput code [true, false])))
  check "actual binary loop remains active after 100 transitions" loopCfg.isSome
  check "writer replaces padding"
    (!(Tape.move .right (TM1.stepAux (binary 9) true (Tape.mk₁ [false, true])).Tape).head)
  IO.println s!"BinaryTemplates native fixtures passed: {count} finite corners + 4 execution checks"
