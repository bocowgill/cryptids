/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Binary

/-! # Omit a terminal write's return control

Only halting is preserved at the distinguished terminal state. Live boundaries retain
the exact tape. In particular, the final head position is deliberately unspecified.
-/

@[expose] public section
namespace ConjectureMachines.Optimisation.TerminalBinary
open Turing StateTransition ConjectureMachines.Compilation

variable {q : Nat} [NeZero q]

/-- Remove the terminal index from the return-control block. -/
def drop (h j : Fin q) (different : j ≠ h) : Fin (q - 1) :=
  ⟨if j.val < h.val then j.val else j.val - 1, by
    have := j.isLt
    have := h.isLt
    have : j.val ≠ h.val := fun e ↦ different (Fin.ext e)
    split <;> omega⟩

/-- Reinsert the missing terminal index. -/
def lift (h : Fin q) (i : Fin (q - 1)) : Fin q :=
  ⟨if i.val < h.val then i.val else i.val + 1, by
    have := i.isLt
    have := h.isLt
    split <;> omega⟩

theorem lift_drop (h j : Fin q) (different : j ≠ h) :
    lift h (drop h j different) = j := by
  apply Fin.ext
  have : j.val ≠ h.val := fun e ↦ different (Fin.ext e)
  simp only [lift, drop]
  split <;> split <;> omega

def mainState (i : Fin q) : Fin (q + (q - 1)) := i.castAdd (q - 1)
def bounceState (i : Fin (q - 1)) : Fin (q + (q - 1)) := Fin.natAdd q i

/-- A write entering the known terminal control can stop on its right-hand neighbour. -/
def writeNext (h j : Fin q) : Fin (q + (q - 1)) :=
  if different : j = h then mainState h else bounceState (drop h j different)

def compile (h : Fin q) (M : TM0.Machine Bool (Fin q)) : Machine (q + (q - 1)) 2 where
  transition s a := Fin.addCases
    (fun i ↦ (M i (Binary.decodeSymbol a)).map fun ⟨j, cmd⟩ ↦ match cmd with
      | .move d => (a, d, mainState j)
      | .write b => (Binary.encodeSymbol b, .right, writeNext h j))
    (fun i ↦ some (a, .left, mainState (lift h i))) s

def trCfg (c : TM0.Cfg Bool (Fin q)) : Cfg (q + (q - 1)) 2 :=
  ⟨mainState c.q, Binary.encodeTape c.Tape⟩

/-- At live boundaries all tape data agree; terminal boundaries only preserve the control. -/
def Related (h : Fin q) (c : TM0.Cfg Bool (Fin q)) (d : Cfg (q + (q - 1)) 2) : Prop :=
  d.q = mainState c.q ∧ (c.q ≠ h → d.Tape = Binary.encodeTape c.Tape)

theorem related_trCfg (h : Fin q) (c : TM0.Cfg Bool (Fin q)) : Related h c (trCfg c) :=
  ⟨rfl, fun _ ↦ rfl⟩

theorem compile_main (h : Fin q) (M : TM0.Machine Bool (Fin q)) (i : Fin q) (a : Fin 2) :
    (compile h M).transition (mainState i) a =
      (M i (Binary.decodeSymbol a)).map (fun ⟨j, cmd⟩ ↦ match cmd with
        | .move d => (a, d, mainState j)
        | .write b => (Binary.encodeSymbol b, .right, writeNext h j)) := by
  simp [compile, mainState]

@[simp] theorem compile_bounce (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (i : Fin (q - 1)) (a : Fin 2) :
    (compile h M).transition (bounceState i) a = some (a, .left, mainState (lift h i)) := by
  simp only [compile, bounceState, Fin.addCases_right]

theorem compile_step_move (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (i j : Fin q) (T : Tape Bool) (d : Dir) (row : M i T.head = some (j, .move d)) :
    step (compile h M) (trCfg ⟨i, T⟩) = some (trCfg ⟨j, T.move d⟩) := by
  simp [step, trCfg, compile_main, Binary.encodeTape, Tape.map_fst, row, Tape.map_move,
    ← Tape.map_write, Tape.write_self]

theorem compile_step_write (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (i j : Fin q) (T : Tape Bool) (b : Bool) (row : M i T.head = some (j, .write b)) :
    step (compile h M) (trCfg ⟨i, T⟩) =
      some ⟨writeNext h j, ((Binary.encodeTape T).write (Binary.encodeSymbol b)).move .right⟩ := by
  simp [step, trCfg, compile_main, Binary.encodeTape, Tape.map_fst, row]

theorem compile_write_return (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (j : Fin q) (different : j ≠ h) (T : Tape Bool) (b : Bool) :
    step (compile h M)
        ⟨bounceState (drop h j different),
          ((Binary.encodeTape T).write (Binary.encodeSymbol b)).move .right⟩ =
      some (trCfg ⟨j, T.write b⟩) := by
  simp [step, trCfg, Binary.encodeTape, Tape.map_write, Tape.write_self,
    Tape.move_right_left, lift_drop]

/-- Every source step has a positive-length simulation, including entry into terminal control. -/
theorem respects (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (terminal : ∀ b, M h b = none) :
    Respects (TM0.step M) (step (compile h M)) (Related h) := by
  intro c d related
  rcases c with ⟨i, T⟩
  rcases d with ⟨s, U⟩
  rcases related with ⟨state, tape⟩
  change s = mainState i at state
  subst s
  by_cases ih : i = h
  · subst i
    simp [TM0.step, terminal, step, compile_main]
  · have tape' : U = Binary.encodeTape T := tape ih
    subst U
    cases row : M i T.head with
    | none =>
      simp [TM0.step, row, step, compile_main, Binary.encodeTape, Tape.map_fst]
    | some v =>
      rcases v with ⟨j, cmd⟩
      cases cmd with
      | move dir =>
        simp only [TM0.step, row, Option.map_some]
        exact ⟨trCfg ⟨j, T.move dir⟩, related_trCfg h _,
          .single (compile_step_move h M i j T dir row)⟩
      | write b =>
        simp only [TM0.step, row, Option.map_some]
        by_cases jh : j = h
        · subst j
          refine ⟨⟨mainState h,
            ((Binary.encodeTape T).write (Binary.encodeSymbol b)).move .right⟩,
            ⟨rfl, fun impossible ↦ (impossible rfl).elim⟩, .single ?_⟩
          simpa only [writeNext, dif_pos rfl] using compile_step_write h M i h T b row
        · refine ⟨trCfg ⟨j, T.write b⟩, related_trCfg h _,
            Relation.TransGen.head (b := ⟨bounceState (drop h j jh),
              ((Binary.encodeTape T).write (Binary.encodeSymbol b)).move .right⟩)
              ?_ (.single (compile_write_return h M j jh T b))⟩
          simpa only [writeNext, dif_neg jh] using compile_step_write h M i j T b row

theorem haltsFrom (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (terminal : ∀ b, M h b = none) (c : TM0.Cfg Bool (Fin q)) :
    (StateTransition.eval (step (compile h M)) (trCfg c)).Dom ↔
      (StateTransition.eval (TM0.step M) c).Dom :=
  StateTransition.tr_eval_dom (respects h M terminal) (related_trCfg h c)

theorem halts_input (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (terminal : ∀ b, M h b = none) (input : List Bool) :
    (StateTransition.eval (step (compile h M))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval M input).Dom := by
  simpa only [trCfg, TM0.init, Binary.encodeTape, Tape.map_mk₁, mainState, Fin.castAdd_zero]
    using haltsFrom h M terminal (TM0.init input)

/-- Numeric destination map for a literal table: redirect the omitted bounce to main halt. -/
def remap (h : Fin q) (s : Fin (q + q)) : Fin (q + (q - 1)) :=
  Fin.addCases mainState (writeNext h) s

@[simp] theorem remap_main (h i : Fin q) :
    remap h (Binary.mainState i) = mainState i := by
  simp [remap, Binary.mainState]

@[simp] theorem remap_bounce (h i : Fin q) :
    remap h (Binary.bounceState i) = writeNext h i := by
  simp [remap, Binary.bounceState]

/-- A table-side construction reads surviving original rows and maps their destinations.
It does not inspect the Post program or the chess specification. -/
def table (h : Fin q) (old : Machine (q + q) 2) : Machine (q + (q - 1)) 2 where
  transition s a :=
    (old.transition (Fin.addCases Binary.mainState (fun i ↦ Binary.bounceState (lift h i)) s) a).map
      fun (b, d, next) ↦ (b, d, remap h next)

/-- The independent row-deletion recipe and the new compiler agree on every state and symbol. -/
theorem table_compile (h : Fin q) (M : TM0.Machine Bool (Fin q)) :
    table h (Binary.compile M) = compile h M := by
  ext s a
  refine Fin.addCases (fun i ↦ ?_) (fun i ↦ ?_) s
  · change ((Binary.compile M).transition (Binary.mainState i) a).map _ =
      (compile h M).transition (mainState i) a
    rw [Binary.compile_main, compile_main]
    cases row : M i (Binary.decodeSymbol a) with
    | none => rfl
    | some v =>
      rcases v with ⟨j, cmd⟩
      cases cmd <;> simp
  · change ((Binary.compile M).transition (Binary.bounceState (lift h i)) a).map _ =
      (compile h M).transition (bounceState i) a
    simp

end ConjectureMachines.Optimisation.TerminalBinary
