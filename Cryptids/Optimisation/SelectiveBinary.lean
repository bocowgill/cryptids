/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Binary
public import Cryptids.Compilation.Init
public import Cryptids.Compilation.LocalCertificate

/-! # Allocate binary return controls only for covered write destinations

Every Post control keeps its main state. A separate finite layout supplies the return
controls needed by writes. The universal coverage hypothesis certifies every write row,
including rows never observed in a run. An exact row decoder preserves the complete tape
and proves both directions of halting equivalence from arbitrary configurations.
-/

@[expose] public section
namespace ConjectureMachines.Optimisation.SelectiveBinary
open Turing StateTransition ConjectureMachines.Compilation

variable {q r : Nat}

/-- Main controls retain the original numeric indices. -/
def mainState (i : Fin q) : Fin (q + r) := i.castAdd r

/-- Return controls follow the complete main block. The return block may be empty. -/
def bounceState (i : Fin r) : Fin (q + r) := Fin.natAdd q i

@[simp] theorem mainState_val (i : Fin q) : (mainState (r := r) i).val = i.val := rfl

@[simp] theorem bounceState_val (i : Fin r) :
    (bounceState (q := q) i).val = q + i.val := rfl

/-- Every actual Post write must have a return whose decoded destination is exact. -/
def WriteCoverage (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r)) : Prop :=
  ∀ i a j b, M i a = some (j, .write b) → (findReturn j).map returnAt = some j

/-- A missing lookup is explicit. Coverage rules it out for every actual source write. -/
def compile (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r)) :
    Machine (q + r) 2 where
  transition s a := Fin.addCases
    (fun i ↦ (M i (Binary.decodeSymbol a)).bind fun ⟨j, cmd⟩ ↦ match cmd with
      | .move d => some (a, d, mainState j)
      | .write b => (findReturn j).map fun k ↦ (Binary.encodeSymbol b, .right, bounceState k))
    (fun k ↦ some (a, .left, mainState (returnAt k))) s

/-- The surviving rows are selected directly from the original two-block allocation. -/
def decode (returnAt : Fin r → Fin q) : Fin (q + r) → Fin (q + q) :=
  Fin.addCases Binary.mainState (fun k ↦ Binary.bounceState (returnAt k))

@[simp] theorem decode_main (returnAt : Fin r → Fin q) (i : Fin q) :
    decode returnAt (mainState i) = Binary.mainState i := by
  simp only [decode, mainState, Fin.addCases_left]

@[simp] theorem decode_bounce (returnAt : Fin r → Fin q) (k : Fin r) :
    decode returnAt (bounceState k) = Binary.bounceState (returnAt k) := by
  simp only [decode, bounceState, Fin.addCases_right]

theorem decode_main_val (returnAt : Fin r → Fin q) (i : Fin q) :
    (decode returnAt (mainState i)).val = i.val := by
  rw [decode_main]
  rfl

theorem decode_bounce_val (returnAt : Fin r → Fin q) (k : Fin r) :
    (decode returnAt (bounceState k)).val = q + (returnAt k).val := by
  rw [decode_bounce]
  rfl

theorem compile_main (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (i : Fin q) (a : Fin 2) :
    (compile M returnAt findReturn).transition (mainState i) a =
      (M i (Binary.decodeSymbol a)).bind (fun ⟨j, cmd⟩ ↦ match cmd with
        | .move d => some (a, d, mainState j)
        | .write b => (findReturn j).map fun k ↦
            (Binary.encodeSymbol b, .right, bounceState k)) := by
  simp only [compile, mainState, Fin.addCases_left]

@[simp] theorem compile_bounce (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (k : Fin r) (a : Fin 2) :
    (compile M returnAt findReturn).transition (bounceState k) a =
      some (a, .left, mainState (returnAt k)) := by
  simp only [compile, bounceState, Fin.addCases_right]

/-- Every retained row, including each missing row, is exactly its decoded original row. -/
theorem rows (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) :
    LocalCertificate.Rows (compile M returnAt findReturn) (Binary.compile M) (decode returnAt) := by
  intro s a
  refine Fin.addCases (fun i ↦ ?_) (fun k ↦ ?_) s
  · rw [decode_main, compile_main, Binary.compile_main]
    cases row : M i (Binary.decodeSymbol a) with
    | none => rfl
    | some instruction =>
      rcases instruction with ⟨j, cmd⟩
      cases cmd with
      | move d => simp only [Option.bind_some, Option.map_some, decode_main]
      | write b =>
        have covered := coverage i (Binary.decodeSymbol a) j b row
        cases found : findReturn j with
        | none => simp only [found, Option.map_none, reduceCtorEq] at covered
        | some k =>
          have destination : returnAt k = j := by
            simpa only [found, Option.map_some, Option.some.injEq] using covered
          simp only [Option.bind_some, found, Option.map_some, decode_bounce, destination]
  · simp only [compile_bounce, Option.map_some, decode_main, decode_bounce,
      Binary.compile_bounce]

/-- Exact one-step agreement retains the entire tape and its head position. -/
theorem step_decode (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) (c : Cfg (q + r) 2) :
    (step (compile M returnAt findReturn) c).map (LocalCertificate.decodeCfg (decode returnAt)) =
      step (Binary.compile M) (LocalCertificate.decodeCfg (decode returnAt) c) :=
  LocalCertificate.step_decode _ _ _ (rows M returnAt findReturn coverage) c

/-- Both termination directions hold from every retained state on every tape. -/
theorem haltsFrom (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) (c : Cfg (q + r) 2) :
    (eval (step (compile M returnAt findReturn)) c).Dom ↔
      (eval (step (Binary.compile M)) (LocalCertificate.decodeCfg (decode returnAt) c)).Dom :=
  (tr_eval_dom (LocalCertificate.respects _ _ _ (rows M returnAt findReturn coverage)) rfl).symm

section Initial
variable [NeZero q]

@[simp] theorem mainState_zero : mainState (r := r) (0 : Fin q) = 0 := rfl

@[simp] theorem decode_zero (returnAt : Fin r → Fin q) : decode returnAt 0 = 0 := by
  change decode returnAt (mainState (0 : Fin q)) = 0
  rw [decode_main, Binary.mainState_zero]

/-- An arbitrary finite or infinite tape at main zero has unchanged halting behavior. -/
theorem haltsOn (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) (tape : Tape (Fin 2)) :
    Init.HaltsOn (compile M returnAt findReturn) tape ↔ Init.HaltsOn (Binary.compile M) tape := by
  simpa only [Init.HaltsOn, LocalCertificate.decodeCfg, decode_zero] using
    haltsFrom M returnAt findReturn coverage ⟨0, tape⟩

/-- The input theorem composes directly with the accepted binary compiler. -/
theorem halts_input (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) (input : List Bool) :
    Init.HaltsOn (compile M returnAt findReturn) (Tape.mk₁ (input.map Binary.encodeSymbol)) ↔
      (TM0.eval M input).Dom :=
  (haltsOn M returnAt findReturn coverage _).trans (Binary.compile_halts_input M input)

theorem halts_blank (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (coverage : WriteCoverage M returnAt findReturn) :
    Halts (compile M returnAt findReturn) ↔ Halts (Binary.compile M) :=
  haltsOn M returnAt findReturn coverage (Tape.mk₁ [])

end Initial

/-- Partial numeric destination map; missing return destinations remain visible as `none`. -/
def remap (findReturn : Fin q → Option (Fin r)) : Fin (q + q) → Option (Fin (q + r)) :=
  Fin.addCases (fun i ↦ some (mainState i)) (fun j ↦ (findReturn j).map bounceState)

@[simp] theorem remap_main (findReturn : Fin q → Option (Fin r)) (i : Fin q) :
    remap findReturn (Binary.mainState i) = some (mainState i) := by
  simp only [remap, Binary.mainState, Fin.addCases_left]

@[simp] theorem remap_bounce (findReturn : Fin q → Option (Fin r)) (j : Fin q) :
    remap findReturn (Binary.bounceState j) = (findReturn j).map bounceState := by
  simp only [remap, Binary.bounceState, Fin.addCases_right]

theorem remap_bounce_val (findReturn : Fin q → Option (Fin r)) (j : Fin q) :
    (remap findReturn (Binary.bounceState j)).map Fin.val =
      (findReturn j).map (fun k ↦ q + k.val) := by
  rw [remap_bounce]
  cases findReturn j <;> rfl

/-- Independent table recipe: select an original row, then partially reindex its destination.
This construction does not inspect Post instructions or any chess-specific data. -/
def table (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r))
    (old : Machine (q + q) 2) : Machine (q + r) 2 where
  transition s a := (old.transition (decode returnAt s) a).bind fun (b, d, next) ↦
    (remap findReturn next).map fun target ↦ (b, d, target)

/-- The independent reindexing and compiler agree. Semantic correctness additionally uses coverage. -/
theorem table_compile (M : TM0.Machine Bool (Fin q))
    (returnAt : Fin r → Fin q) (findReturn : Fin q → Option (Fin r)) :
    table returnAt findReturn (Binary.compile M) = compile M returnAt findReturn := by
  apply congrArg Machine.mk
  funext s a
  refine Fin.addCases (fun i ↦ ?_) (fun k ↦ ?_) s
  · simp only [table, decode_main, Binary.compile_main, compile_main]
    cases row : M i (Binary.decodeSymbol a) with
    | none => rfl
    | some instruction =>
      rcases instruction with ⟨j, cmd⟩
      cases cmd with
      | move d => simp only [Option.map_some, Option.bind_some, remap_main]
      | write b =>
        simp only [Option.map_some, Option.bind_some, remap_bounce]
        cases findReturn j <;> rfl
  · simp only [table, decode_bounce, Binary.compile_bounce, Option.bind_some,
      remap_main, Option.map_some, compile_bounce]

/-- Every main and listed return control is included; no other control is allocated. -/
theorem compile_state_count : Fintype.card (Fin (q + r)) = q + r := Fintype.card_fin _

end ConjectureMachines.Optimisation.SelectiveBinary
