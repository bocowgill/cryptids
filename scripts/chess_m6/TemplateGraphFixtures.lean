import Cryptids.Compilation.TemplateGraph

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

open TemplateGraph

def readPC (i : Fin 4) : Fin 8 := #v[0, 1, 2, 6].get i
def movePC (i : Fin 2) : Fin 8 := if i = 0 then 3 else 4

def classes (q : Fin 8) : Class 4 2 :=
  match q.val with
  | 0 => .read 0
  | 1 => .read 1
  | 2 => .read 2
  | 3 => .move 0
  | 4 => .move 1
  | 6 => .read 3
  | _ => .plain

def data : Data Bool Bool 8 2 2 2 4 2 code.width where
  rows := source
  encode := code.encode
  decode := code.decode
  siteFor := siteFor
  next := siteNext
  alphabet := alphabet
  stores := alphabet
  readPC := readPC
  movePC := movePC
  classify := classes

theorem data_valid : Valid code data sites where
  encode_eq := rfl
  decode_eq := rfl
  siteFor_eq := rfl
  next_eq := rfl
  primitive := primitive
  classified q := by
    fin_cases q <;> simp [data, classes, readPC, movePC, ReadRow, MoveRow, PlainRow, source] <;> rfl

theorem exact_machine : BoolGraph.machine (graph data) alphabet =
    BinaryTemplates.machine code source sites alphabet := machine_eq code data sites data_valid

example : (build data).raw.count = 110 := rfl
example : GraphPost.stateCount (build data).raw.count 2 = 223 := rfl
example (input : List Bool) : TM0.eval (LazyGraph.machine (lazyGraph data)) input =
    TM1.eval (BinaryTemplates.machine code source sites alphabet) input :=
  TemplateGraph.eval_eq code data sites data_valid rfl input

-- Kernel observations use the exact generic machine equality, including invalid pad bits.
def observe (cfg : TM1.Cfg Bool (Fin 12) Bool) : Option Nat × Bool × Bool :=
  (cfg.l.map Fin.val, cfg.var, cfg.Tape.head)

def probe (q : Fin 12) (store : Bool) (bits : List Bool) : Option Nat × Bool × Bool :=
  observe (TM1.stepAux (BoolGraph.machine (graph data) alphabet q) store (Tape.mk₁ bits))

theorem probe_eq (q : Fin 12) (store : Bool) (bits : List Bool) :
    probe q store bits = observe (TM1.stepAux (BinaryTemplates.machine code source sites alphabet q)
      store (Tape.mk₁ bits)) := by rw [probe, exact_machine]

example : probe 0 false [true, false] = (some 9, false, true) := by rw [probe_eq]; decide
example : probe 0 true [true, true] = (some 8, true, true) := by rw [probe_eq]; decide
example : probe 1 false [true, true] = (some 2, true, true) := by rw [probe_eq]; decide
example : probe 2 true [true, false] = (some 3, true, true) := by rw [probe_eq]; decide
example : probe 2 false [true, true] = (some 4, false, true) := by rw [probe_eq]; decide
example : probe 3 false [false, false, true, false] = (some 5, false, true) := by
  rw [probe_eq]; decide
example : probe 4 false [true, false] = (some 5, false, false) := by rw [probe_eq]; decide
example : probe 5 true [] = (some 6, true, false) := by rw [probe_eq]; decide
example : probe 7 false [] = (none, false, false) := by rw [probe_eq]; decide
example : probe 8 false [true, true] = (some 1, false, false) := by rw [probe_eq]; decide
example : probe 9 true [false, true] = (some 1, true, true) := by rw [probe_eq]; decide
example : probe 11 false [false, true] = (some 7, false, true) := by rw [probe_eq]; decide

-- Finite first-order getter results are independently reduced, without expanded syntax.
deriving instance DecidableEq for BoolGraph.Node
local instance : NeZero (build data).raw.count := ⟨by decide⟩
example : (build data).raw.node 0 = .halt := by decide
example : (build data).raw.node 10 = .goto #v[7, 6, 7, 6] := by decide
example : (build data).raw.node 16 = .goto #v[1, 1, 1, 1] := by decide
example : (build data).raw.node 18 = .goto #v[8, 9, 8, 9] := by decide
example : (build data).raw.node 21 = .load #v[1, 0, 1, 0] 2 := by decide
example : (build data).raw.node 23 = .branch #v[false, true, false, true] 4 5 := by decide
example : (build data).raw.node 36 = .move .right 6 := by decide

-- The width-zero boundary has no read/write/move tree allocation.
example : nodeCount 1 0 1 0 0 0 = 2 := rfl
example : nodeCount 4042 270 1250 1734 1188 11 = 38893646 := chess_inventory_count

-- Empty source families and width zero remain constructive: no Fin0 default is invented.
def zeroCode : BlockCode (Fin 1) where
  width := 0
  encode _ := List.Vector.nil
  decode _ := 0
  blank := rfl
  roundtrip a := by fin_cases a; rfl

def zeroRows (_ : Fin 1) : TM1.Stmt (Fin 1) (Fin 1) (Fin 1) := .halt

def zeroSites : BinaryTemplates.WriteSites zeroRows 0 where
  pc := Fin.elim0
  next := Fin.elim0
  siteFor _ := none
  row i := Fin.elim0 i
  lookup i := Fin.elim0 i
  inverse _ i := Fin.elim0 i
  covers _ _ _ h := by cases h

def zeroData : Data (Fin 1) (Fin 1) 1 0 1 1 0 0 zeroCode.width where
  rows := zeroRows
  encode := zeroCode.encode
  decode := zeroCode.decode
  siteFor _ := none
  next := Fin.elim0
  alphabet := Equiv.refl _
  stores := Equiv.refl _
  readPC := Fin.elim0
  movePC := Fin.elim0
  classify _ := .plain

theorem zeroValid : Valid zeroCode zeroData zeroSites where
  encode_eq := rfl
  decode_eq := rfl
  siteFor_eq := rfl
  next_eq := by funext i; exact Fin.elim0 i
  primitive _ := trivial
  classified _ := trivial

example (input : List Bool) : TM0.eval (LazyGraph.machine (lazyGraph zeroData)) input =
    TM1.eval (BinaryTemplates.machine zeroCode zeroRows zeroSites (Equiv.refl _)) input :=
  TemplateGraph.eval_eq zeroCode zeroData zeroSites zeroValid rfl input

-- Genuine goto loops are retained through the numeric control and exact all-input theorem.
def loopRows (_ : Fin 1) : TM1.Stmt Bool (Fin 1) Bool := .goto (fun _ _ ↦ 0)
def loopSites : BinaryTemplates.WriteSites loopRows 0 where
  pc := Fin.elim0
  next := Fin.elim0
  siteFor _ := none
  row i := Fin.elim0 i
  lookup i := Fin.elim0 i
  inverse _ i := Fin.elim0 i
  covers _ _ _ h := by cases h

def loopData : Data Bool Bool 1 0 2 2 0 0 code.width where
  rows := loopRows
  encode := code.encode
  decode := code.decode
  siteFor _ := none
  next := Fin.elim0
  alphabet := alphabet
  stores := alphabet
  readPC := Fin.elim0
  movePC := Fin.elim0
  classify _ := .plain

theorem loopValid : Valid code loopData loopSites where
  encode_eq := rfl
  decode_eq := rfl
  siteFor_eq := rfl
  next_eq := by funext i; exact Fin.elim0 i
  primitive _ := trivial
  classified _ := trivial

private theorem self_loop_not_dom {α : Type} (f : α → Option α) (a : α)
    (step : f a = some a) : ¬(StateTransition.eval f a).Dom := by
  intro dom
  obtain ⟨b, hb⟩ := Part.dom_iff_mem.mp dom
  have impossible : a = a → False := StateTransition.evalInduction
    (C := fun x ↦ x = a → False) hb (fun x _ ih hx ↦ by
      subst x
      exact ih a step rfl)
  exact impossible rfl

theorem loop_source_not_dom (input : List Bool) :
    ¬(TM1.eval (BinaryTemplates.machine code loopRows loopSites alphabet) input).Dom := by
  change ¬(StateTransition.eval _ _).Dom
  apply self_loop_not_dom
  rfl

theorem loop_numeric_not_dom (input : List Bool) :
    ¬(TM0.eval (LazyGraph.machine (lazyGraph loopData)) input).Dom := by
  rw [TemplateGraph.halts_iff code loopData loopSites loopValid rfl input]
  exact loop_source_not_dom input

end BinaryTemplateFixtures

