/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Chess.Spec
public import Mathlib.Computability.TuringMachine.StackTuringMachine
public import Mathlib.Tactic.FinCases

/-! # A finite-control stack interpreter for finite binary games

The tree occurs only as postfix data in the initializer. The evaluator uses two unbounded stacks
and eight labels, independent of the size or minimax value of the tree.
-/

@[expose] public section

namespace Chess.Compilation

open Turing

/-- A finite perfect-information game with two alternatives at every nonterminal node. -/
inductive Tree
  | leaf : Outcome → Tree
  | choice : Color → Tree → Tree → Tree
  deriving DecidableEq

/-- Scores are ordered from a Black win through a draw to a White win. -/
def score : Outcome → Fin 3
  | .win .black => 0
  | .draw => 1
  | .win .white => 2

/-- Minimax evaluation, with White maximizing and Black minimizing. -/
def value : Tree → Fin 3
  | .leaf result => score result
  | .choice .white left right => max (value left) (value right)
  | .choice .black left right => min (value left) (value right)

/-- Interpret the ordered score as the corresponding game outcome. -/
def outcome (result : Fin 3) : Outcome :=
  if result = 0 then .win .black else if result = 1 then .draw else .win .white

/-- The game-theoretic minimax outcome. -/
def minimax (tree : Tree) : Outcome := outcome (value tree)

theorem outcome_draw_iff (result : Fin 3) : outcome result = .draw ↔ result = 1 := by
  fin_cases result <;> simp [outcome]

/-- Postfix tokens: Black win, draw, White win, White choice, Black choice. -/
def serialize : Tree → List (Fin 5)
  | .leaf result => [⟨(score result).val, lt_trans (score result).isLt (by decide)⟩]
  | .choice color left right =>
      serialize left ++ serialize right ++ [if color = .white then 3 else 4]

/-- The false stack contains tokens; the true stack contains evaluated scores. -/
abbrev GameGamma : Bool → Type
  | false => Fin 5
  | true => Fin 3

instance gameGammaFintype (k : Bool) : Fintype (GameGamma k) := by
  cases k <;> infer_instance

instance gameGammaDecidableEq (k : Bool) : DecidableEq (GameGamma k) := by
  cases k <;> infer_instance

instance gameGammaInhabited (k : Bool) : Inhabited (GameGamma k) := by
  cases k <;> infer_instance

abbrev GameLabel := Fin 8
abbrev GameStore := Fin 6
abbrev GameStmt := TM2.Stmt GameGamma GameLabel GameStore
abbrev GameCfg := TM2.Cfg GameGamma GameLabel GameStore

/-- Construct the two stacks, with their first elements at the top. -/
def gameStacks (tokens : List (Fin 5)) (values : List (Fin 3)) : ∀ k, List (GameGamma k)
  | false => tokens
  | true => values

@[simp] theorem gameStacks_false (tokens values) : gameStacks tokens values false = tokens := rfl
@[simp] theorem gameStacks_true (tokens values) : gameStacks tokens values true = values := rfl

@[simp] theorem update_gameStacks_false (tokens values) (new : List (Fin 5)) :
    Function.update (gameStacks tokens values) false new = gameStacks new values := by
  funext k; cases k <;> simp [Function.update, gameStacks]

@[simp] theorem update_gameStacks_true (tokens values) (new : List (Fin 3)) :
    Function.update (gameStacks tokens values) true new = gameStacks tokens new := by
  funext k; cases k <;> simp [Function.update, gameStacks]

/-- A jump to a fixed label. -/
def jump (label : GameLabel) : GameStmt := .goto (fun _ ↦ label)

/-- Missing input is represented by store value 5, outside the score and token ranges. -/
def readToken (_ : GameStore) : Option (Fin 5) → GameStore
  | none => 5
  | some token => ⟨token.val, lt_trans token.isLt (by decide)⟩

/-- Missing operands are represented by 5 and go to the rejection loop. -/
def readScore (_ : GameStore) : Option (Fin 3) → GameStore
  | none => 5
  | some result => ⟨result.val, lt_trans result.isLt (by decide)⟩

/-- Convert a store known to contain a score into a value-stack symbol. -/
def storedScore (v : GameStore) : Fin 3 := ⟨v.val % 3, Nat.mod_lt _ (by decide)⟩

/-- Combine two scores; a missing second operand is rejected. -/
def combine (white : Bool) (v : GameStore) : Option (Fin 3) → GameStore
  | none => 5
  | some other => readScore 0 (some (if white then max (storedScore v) other
      else min (storedScore v) other))

/-- A binary minimax operation, checking both operands before returning to the dispatcher. -/
def reduce (white : Bool) : GameStmt :=
  .pop true readScore
    (.branch (fun v ↦ decide (v.val < 3))
      (.pop true (combine white)
        (.branch (fun v ↦ decide (v.val < 3))
          (.push true storedScore (jump 1)) (jump 7)))
      (jump 7))

/-- Check that exactly one result remains. Empty or surplus result stacks are rejected. -/
def finish : GameStmt :=
  .pop true readScore
    (.peek true (fun v rest ↦ if rest.isNone then v else 5)
      (.branch (fun v ↦ decide (v.val < 3 ∧ v ≠ 1)) .halt (jump 7)))

/-- Push a finite literal data word. Execution places its reverse atop the token stack. -/
def pushData : List (Fin 5) → GameStmt → GameStmt
  | [], next => next
  | token :: rest, next => .push false (fun _ ↦ token) (pushData rest next)

/-- The finite-control program. Only label 0 depends on the input tree. -/
def gameProgram (tree : Tree) (label : GameLabel) : GameStmt :=
  if label = 0 then pushData (serialize tree).reverse (jump 1)
  else if label = 1 then
    .pop false readToken (.goto (fun v ↦
      if v.val < 3 then 2 else if v = 3 then 3 else if v = 4 then 4 else 5))
  else if label = 2 then .push true storedScore (jump 1)
  else if label = 3 then reduce true
  else if label = 4 then reduce false
  else if label = 5 then finish
  else jump 7

/-- All evaluation control is shared by every tree. The tree is used only as initializer data. -/
theorem gameProgram_control_independent (tree other : Tree) (label : GameLabel)
    (evaluation : label ≠ 0) : gameProgram tree label = gameProgram other label := by
  simp [gameProgram, evaluation]

/-- A dispatcher configuration, with explicit data and value-stack contents. -/
def dispatch (tokens : List (Fin 5)) (values : List (Fin 3)) (v : GameStore := 0) : GameCfg :=
  ⟨some 1, v, gameStacks tokens values⟩

/-- The rejection/draw loop retains both stacks forever. -/
def loopCfg (tokens : List (Fin 5)) (values : List (Fin 3)) (v : GameStore) : GameCfg :=
  ⟨some 7, v, gameStacks tokens values⟩

theorem step_loop (tree tokens values v) :
    TM2.step (gameProgram tree) (loopCfg tokens values v) =
      some (loopCfg tokens values v) := by
  simp [TM2.step, TM2.stepAux, gameProgram, loopCfg, jump]

/-- Embed a value into the finite store. -/
def saved (result : Fin 3) : GameStore := readScore 0 (some result)

/-- Embed a value into the token alphabet. -/
def tokenOfScore (result : Fin 3) : Fin 5 :=
  ⟨result.val, lt_trans result.isLt (by decide)⟩

theorem step_dispatch_score (tree rest values v) (result : Fin 3) :
    TM2.step (gameProgram tree) (dispatch (tokenOfScore result :: rest) values v) =
      some ⟨some 2, saved result, gameStacks rest values⟩ := by
  fin_cases result <;> simp [List.head?, List.tail, update_gameStacks_false,
    TM2.step, TM2.stepAux, gameProgram, dispatch, tokenOfScore, readToken,
    saved, readScore]

theorem step_push_score (tree rest values) (result : Fin 3) :
    TM2.step (gameProgram tree) ⟨some 2, saved result, gameStacks rest values⟩ =
      some (dispatch rest (result :: values) (saved result)) := by
  fin_cases result <;>
    simp [TM2.step, TM2.stepAux, gameProgram, dispatch, storedScore, saved, readScore, jump]

theorem oneStep {tree : Tree} {a b : GameCfg}
    (h : TM2.step (gameProgram tree) a = some b) : TM2.Reaches (gameProgram tree) a b :=
  Relation.ReflTransGen.single (r := fun a b ↦ b ∈ TM2.step (gameProgram tree) a) h

theorem reaches_score (tree rest values v) (result : Fin 3) :
    TM2.Reaches (gameProgram tree) (dispatch (tokenOfScore result :: rest) values v)
      (dispatch rest (result :: values) (saved result)) :=
  (oneStep (step_dispatch_score tree rest values v result)).trans
    (oneStep (step_push_score tree rest values result))

theorem step_dispatch_choice (tree rest values v) (white : Bool) :
    TM2.step (gameProgram tree)
      (dispatch ((if white then 3 else 4) :: rest) values v) =
      some ⟨some (if white then 3 else 4), (if white then 3 else 4),
        gameStacks rest values⟩ := by
  cases white <;> simp [List.head?, List.tail, update_gameStacks_false,
    TM2.step, TM2.stepAux, gameProgram, dispatch, readToken]

theorem step_reduce (tree rest values v) (white : Bool) (right left : Fin 3) :
    TM2.step (gameProgram tree)
      ⟨some (if white then 3 else 4), v, gameStacks rest (right :: left :: values)⟩ =
      some (dispatch rest ((if white then max left right else min left right) :: values)
        (saved (if white then max left right else min left right))) := by
  cases white <;> fin_cases right <;> fin_cases left <;>
    simp [List.head?, List.tail,
    TM2.step, TM2.stepAux, gameProgram, reduce, combine, readScore, storedScore, saved,
      dispatch, jump]

theorem reaches_choice (tree rest values v) (white : Bool) (right left : Fin 3) :
    TM2.Reaches (gameProgram tree)
      (dispatch ((if white then 3 else 4) :: rest) (right :: left :: values) v)
      (dispatch rest ((if white then max left right else min left right) :: values)
        (saved (if white then max left right else min left right))) :=
  (oneStep (step_dispatch_choice tree rest (right :: left :: values) v white)).trans
    (oneStep (step_reduce tree rest values _ white right left))

/-- Exact recursive stack invariant: evaluating one serialized tree preserves arbitrary suffixes
and all prior values, and pushes exactly its minimax score. -/
theorem serialize_stack_effect (programTree tree : Tree) (rest : List (Fin 5))
    (values : List (Fin 3)) (v : GameStore) :
    TM2.Reaches (gameProgram programTree) (dispatch (serialize tree ++ rest) values v)
      (dispatch rest (value tree :: values) (saved (value tree))) := by
  induction tree generalizing rest values v with
  | leaf result => simpa [TM2.Reaches, serialize, value, tokenOfScore] using
      reaches_score programTree rest values v (score result)
  | choice color left right ihl ihr =>
      cases color with
      | white =>
          simpa [TM2.Reaches, serialize, value, List.append_assoc] using
            (ihl (serialize right ++ 3 :: rest) values v).trans
              ((ihr (3 :: rest) (value left :: values) (saved (value left))).trans
                (reaches_choice programTree rest values (saved (value right)) true
                  (value right) (value left)))
      | black =>
          simpa [TM2.Reaches, serialize, value, List.append_assoc] using
            (ihl (serialize right ++ 4 :: rest) values v).trans
              ((ihr (4 :: rest) (value left :: values) (saved (value left))).trans
                (reaches_choice programTree rest values (saved (value right)) false
                  (value right) (value left)))

theorem stepAux_pushData (data : List (Fin 5)) (next : GameStmt) (v : GameStore)
    (tokens : List (Fin 5)) (values : List (Fin 3)) :
    TM2.stepAux (pushData data next) v (gameStacks tokens values) =
      TM2.stepAux next v (gameStacks (data.reverse ++ tokens) values) := by
  induction data generalizing tokens with
  | nil => rfl
  | cons token rest ih =>
      change TM2.stepAux (pushData rest next) v
        (Function.update (gameStacks tokens values) false (token :: tokens)) = _
      rw [update_gameStacks_false]
      simpa only [List.reverse_cons, List.append_assoc, List.singleton_append] using
        ih (token :: tokens)

theorem init_empty : (TM2.init false [] : GameCfg) =
    ⟨some 0, 0, gameStacks [] []⟩ := by
  unfold TM2.init
  congr 1
  funext k; cases k <;> simp [Function.update, gameStacks]

/-- The source program starts with both stacks empty and loads precisely the serialized tree. -/
theorem step_init (tree : Tree) :
    TM2.step (gameProgram tree) (TM2.init false []) =
      some (dispatch (serialize tree) [] 0) := by
  rw [init_empty]
  simp [TM2.step, gameProgram, stepAux_pushData, jump, TM2.stepAux, dispatch]

theorem step_dispatch_end (tree values v) :
    TM2.step (gameProgram tree) (dispatch [] values v) =
      some ⟨some 5, 5, gameStacks [] values⟩ := by
  simp [TM2.step, TM2.stepAux, gameProgram, dispatch, readToken, List.head?, List.tail,
    update_gameStacks_false]

/-- The wrapper consumes the unique result and either halts or enters the explicit draw loop. -/
def resultCfg (result : Fin 3) : GameCfg :=
  ⟨if result = 1 then some 7 else none, saved result, gameStacks [] []⟩

theorem step_finish_result (tree v) (result : Fin 3) :
    TM2.step (gameProgram tree) ⟨some 5, v, gameStacks [] [result]⟩ =
      some (resultCfg result) := by
  fin_cases result <;>
    simp [TM2.step, TM2.stepAux, gameProgram, finish, readScore, List.head?, List.tail,
      resultCfg, saved, jump, update_gameStacks_true]

theorem reaches_result (tree : Tree) :
    TM2.Reaches (gameProgram tree) (TM2.init false []) (resultCfg (value tree)) := by
  have he := serialize_stack_effect tree tree [] [] 0
  simp only [List.append_nil] at he
  exact (oneStep (step_init tree)).trans
    (he.trans
      ((oneStep (step_dispatch_end tree [value tree] (saved (value tree)))).trans
        (oneStep (step_finish_result tree 5 (value tree)))))

/-- Determinism forces every finite prefix of a self-loop to end at the same configuration. -/
theorem selfLoop_reaches {α : Type} {step : α → Option α} {start stop : α}
    (self : step start = some start) (reach : StateTransition.Reaches step start stop) :
    stop = start := by
  induction reach with
  | refl => rfl
  | @tail middle stop reach next ih =>
      have next' : step middle = some stop := next
      rw [ih, self] at next'
      exact (Option.some.inj next').symm

/-- A self-loop has no terminal evaluation, for arbitrary unbounded running time. -/
theorem selfLoop_not_halts {α : Type} {step : α → Option α} {start : α}
    (self : step start = some start) : ¬ (StateTransition.eval step start).Dom := by
  intro halts
  obtain ⟨stop, mem⟩ := Part.dom_iff_mem.mp halts
  obtain ⟨reach, terminal⟩ := StateTransition.mem_eval.mp mem
  have eq := selfLoop_reaches self reach
  rw [eq, self] at terminal
  cases terminal

theorem resultCfg_halts_iff (tree : Tree) (result : Fin 3) :
    (StateTransition.eval (TM2.step (gameProgram tree)) (resultCfg result)).Dom ↔
      result ≠ 1 := by
  by_cases draw : result = 1
  · subst result
    have diverges := selfLoop_not_halts (step_loop tree [] [] (saved 1))
    simpa [resultCfg, loopCfg] using diverges
  · have terminal : TM2.step (gameProgram tree) (resultCfg result) = none := by
      simp [resultCfg, draw, TM2.step]
    exact ⟨fun _ ↦ draw, fun _ ↦ Part.dom_iff_mem.mpr
      ⟨resultCfg result, StateTransition.mem_eval.mpr ⟨.refl, terminal⟩⟩⟩

/-- The actual TM2 evaluator, initialized on empty stacks, halts exactly on non-draw minimax
values. This is an equivalence of unbounded halting propositions for every finite tree. -/
theorem gameProgram_halts_iff (tree : Tree) :
    (TM2.eval (gameProgram tree) false []).Dom ↔ value tree ≠ 1 := by
  change (StateTransition.eval (TM2.step (gameProgram tree)) (TM2.init false [])).Dom ↔ _
  rw [StateTransition.reaches_eval (reaches_result tree)]
  exact resultCfg_halts_iff tree (value tree)

theorem gameProgram_halts_iff_nonDraw (tree : Tree) :
    (TM2.eval (gameProgram tree) false []).Dom ↔ minimax tree ≠ .draw := by
  rw [gameProgram_halts_iff]
  exact (not_congr (outcome_draw_iff (value tree))).symm

/-- The mathematical specification for executing an arbitrary postfix word. Operand underflow
returns `none`; a complete valid word must additionally leave exactly one result. -/
def runTokens : List (Fin 5) → List (Fin 3) → Option (List (Fin 3))
  | [], values => some values
  | token :: rest, values =>
      match token.val, values with
      | 0, _ => runTokens rest (0 :: values)
      | 1, _ => runTokens rest (1 :: values)
      | 2, _ => runTokens rest (2 :: values)
      | 3, right :: left :: older => runTokens rest (max left right :: older)
      | 4, right :: left :: older => runTokens rest (min left right :: older)
      | _, _ => none

theorem reaches_halts_iff {tree : Tree} {a b : GameCfg}
    (reach : TM2.Reaches (gameProgram tree) a b) :
    (StateTransition.eval (TM2.step (gameProgram tree)) a).Dom ↔
      (StateTransition.eval (TM2.step (gameProgram tree)) b).Dom := by
  rw [StateTransition.reaches_eval reach]

theorem step_reduce_empty (tree rest v) (white : Bool) :
    TM2.step (gameProgram tree)
      ⟨some (if white then 3 else 4), v, gameStacks rest []⟩ =
      some (loopCfg rest [] 5) := by
  cases white <;>
    simp [TM2.step, TM2.stepAux, gameProgram, reduce, readScore, List.head?, List.tail,
      loopCfg, jump]

theorem step_reduce_singleton (tree rest v) (white : Bool) (result : Fin 3) :
    TM2.step (gameProgram tree)
      ⟨some (if white then 3 else 4), v, gameStacks rest [result]⟩ =
      some (loopCfg rest [] 5) := by
  cases white <;> fin_cases result <;>
    simp [TM2.step, TM2.stepAux, gameProgram, reduce, combine, readScore, List.head?,
      List.tail, loopCfg, jump]

theorem step_finish_empty (tree v) :
    TM2.step (gameProgram tree) ⟨some 5, v, gameStacks [] []⟩ =
      some (loopCfg [] [] 5) := by
  simp [TM2.step, TM2.stepAux, gameProgram, finish, readScore, List.head?, List.tail,
    loopCfg, jump]

theorem step_finish_surplus (tree v) (first second : Fin 3) (older : List (Fin 3)) :
    TM2.step (gameProgram tree) ⟨some 5, v, gameStacks [] (first :: second :: older)⟩ =
      some (loopCfg [] (second :: older) 5) := by
  simp [TM2.step, TM2.stepAux, gameProgram, finish, List.head?, List.tail,
    loopCfg, jump]

theorem dispatch_end_halts_iff (tree values v) :
    (StateTransition.eval (TM2.step (gameProgram tree)) (dispatch [] values v)).Dom ↔
      ∃ result, values = [result] ∧ result ≠ 1 := by
  rw [reaches_halts_iff (oneStep (step_dispatch_end tree values v))]
  cases values with
  | nil =>
      rw [reaches_halts_iff (oneStep (step_finish_empty tree 5))]
      simpa using selfLoop_not_halts (step_loop tree [] [] 5)
  | cons first older =>
      cases older with
      | nil =>
          rw [reaches_halts_iff (oneStep (step_finish_result tree 5 first))]
          simpa using resultCfg_halts_iff tree first
      | cons second older =>
          rw [reaches_halts_iff (oneStep (step_finish_surplus tree 5 first second older))]
          simpa using selfLoop_not_halts (step_loop tree [] (second :: older) 5)

theorem dispatch_underflow_empty (tree rest v) (white : Bool) :
    ¬ (StateTransition.eval (TM2.step (gameProgram tree))
      (dispatch ((if white then 3 else 4) :: rest) [] v)).Dom := by
  rw [reaches_halts_iff ((oneStep (step_dispatch_choice tree rest [] v white)).trans
    (oneStep (step_reduce_empty tree rest _ white)))]
  exact selfLoop_not_halts (step_loop tree rest [] 5)

theorem dispatch_underflow_singleton (tree rest v) (white : Bool) (result : Fin 3) :
    ¬ (StateTransition.eval (TM2.step (gameProgram tree))
      (dispatch ((if white then 3 else 4) :: rest) [result] v)).Dom := by
  rw [reaches_halts_iff ((oneStep (step_dispatch_choice tree rest [result] v white)).trans
    (oneStep (step_reduce_singleton tree rest _ white result)))]
  exact selfLoop_not_halts (step_loop tree rest [] 5)

/-- Complete raw-data contract. Halting requires a successful postfix computation with exactly
one non-draw result; underflow and missing/surplus final results never qualify. -/
theorem dispatch_halts_iff (tree : Tree) (tokens : List (Fin 5))
    (values : List (Fin 3)) (v : GameStore) :
    (StateTransition.eval (TM2.step (gameProgram tree)) (dispatch tokens values v)).Dom ↔
      ∃ result, runTokens tokens values = some [result] ∧ result ≠ 1 := by
  induction tokens generalizing values v with
  | nil => simpa [runTokens] using dispatch_end_halts_iff tree values v
  | cons token rest ih =>
      fin_cases token
      · exact (reaches_halts_iff (reaches_score tree rest values v 0)).trans
          (by simpa [runTokens] using ih (0 :: values) (saved 0))
      · exact (reaches_halts_iff (reaches_score tree rest values v 1)).trans
          (by simpa [runTokens] using ih (1 :: values) (saved 1))
      · exact (reaches_halts_iff (reaches_score tree rest values v 2)).trans
          (by simpa [runTokens] using ih (2 :: values) (saved 2))
      · cases values with
        | nil => simpa [runTokens] using dispatch_underflow_empty tree rest v true
        | cons right older =>
            cases older with
            | nil => simpa [runTokens] using
                dispatch_underflow_singleton tree rest v true right
            | cons left older =>
                exact (reaches_halts_iff
                  (reaches_choice tree rest older v true right left)).trans
                  (by simpa [runTokens] using
                    ih (max left right :: older) (saved (max left right)))
      · cases values with
        | nil => simpa [runTokens] using dispatch_underflow_empty tree rest v false
        | cons right older =>
            cases older with
            | nil => simpa [runTokens] using
                dispatch_underflow_singleton tree rest v false right
            | cons left older =>
                exact (reaches_halts_iff
                  (reaches_choice tree rest older v false right left)).trans
                  (by simpa [runTokens] using
                    ih (min left right :: older) (saved (min left right)))

theorem runTokens_append (first second : List (Fin 5)) (values : List (Fin 3)) :
    runTokens (first ++ second) values =
      (runTokens first values).bind (runTokens second) := by
  induction first generalizing values with
  | nil => rfl
  | cons token rest ih =>
      cases values with
      | nil => fin_cases token <;> simp [runTokens, ih]
      | cons right older =>
          cases older <;> fin_cases token <;> simp [runTokens, ih]

/-- Pure-data form of the recursive invariant, including every external stack and token suffix. -/
theorem runTokens_serialize (tree : Tree) (rest : List (Fin 5)) (values : List (Fin 3)) :
    runTokens (serialize tree ++ rest) values = runTokens rest (value tree :: values) := by
  induction tree generalizing rest values with
  | leaf result =>
      cases result with
      | draw => simp [serialize, score, value, runTokens]
      | win color => cases color <;> simp [serialize, score, value, runTokens]
  | choice color left right ihl ihr =>
      cases color <;>
        simp [serialize, value, List.append_assoc, ihl, ihr, runTokens]

/-- A reachable runtime invariant. Each control point carries a successful residual postfix
computation; operator states have two actual operands, and the exit has one actual result. -/
inductive WellFormed (result : Fin 3) : GameCfg → Prop
  | dispatch (tokens values v) (valid : runTokens tokens values = some [result]) :
      WellFormed result (Compilation.dispatch tokens values v)
  | literal (tokens values) (literal : Fin 3)
      (valid : runTokens tokens (literal :: values) = some [result]) :
      WellFormed result ⟨some 2, saved literal, gameStacks tokens values⟩
  | white (tokens older) (right left : Fin 3) (v)
      (valid : runTokens tokens (max left right :: older) = some [result]) :
      WellFormed result ⟨some 3, v, gameStacks tokens (right :: left :: older)⟩
  | black (tokens older) (right left : Fin 3) (v)
      (valid : runTokens tokens (min left right :: older) = some [result]) :
      WellFormed result ⟨some 4, v, gameStacks tokens (right :: left :: older)⟩
  | finish (v) : WellFormed result ⟨some 5, v, gameStacks [] [result]⟩
  | loop (draw : result = 1) : WellFormed result (loopCfg [] [] (saved result))
  | terminal (win : result ≠ 1) :
      WellFormed result ⟨none, saved result, gameStacks [] []⟩

theorem WellFormed.result (result : Fin 3) : WellFormed result (resultCfg result) := by
  by_cases draw : result = 1
  · simpa [resultCfg, draw, loopCfg] using WellFormed.loop draw
  · simpa [resultCfg, draw] using WellFormed.terminal draw

/-- Every actual machine step preserves the stack and control invariant. -/
theorem WellFormed.step {tree : Tree} {result : Fin 3} {before after : GameCfg}
    (valid : WellFormed result before) (step : TM2.step (gameProgram tree) before = some after) :
    WellFormed result after := by
  cases valid with
  | dispatch tokens values v valid =>
      cases tokens with
      | nil =>
          have valuesEq : values = [result] := Option.some.inj valid
          subst values
          rw [step_dispatch_end] at step
          cases step
          exact .finish 5
      | cons token rest =>
          fin_cases token
          · have eq := Option.some.inj
              ((step_dispatch_score tree rest values v 0).symm.trans step)
            cases eq
            exact .literal rest values 0 (by simpa [runTokens] using valid)
          · have eq := Option.some.inj
              ((step_dispatch_score tree rest values v 1).symm.trans step)
            cases eq
            exact .literal rest values 1 (by simpa [runTokens] using valid)
          · have eq := Option.some.inj
              ((step_dispatch_score tree rest values v 2).symm.trans step)
            cases eq
            exact .literal rest values 2 (by simpa [runTokens] using valid)
          · cases values with
            | nil => simp [runTokens] at valid
            | cons right older =>
                cases older with
                | nil => simp [runTokens] at valid
                | cons left older =>
                    have eq := Option.some.inj
                      ((step_dispatch_choice tree rest (right :: left :: older) v true).symm.trans
                        step)
                    cases eq
                    exact .white rest older right left 3 (by simpa [runTokens] using valid)
          · cases values with
            | nil => simp [runTokens] at valid
            | cons right older =>
                cases older with
                | nil => simp [runTokens] at valid
                | cons left older =>
                    have eq := Option.some.inj
                      ((step_dispatch_choice tree rest (right :: left :: older) v false).symm.trans
                        step)
                    cases eq
                    exact .black rest older right left 4 (by simpa [runTokens] using valid)
  | literal tokens values literal valid =>
      rw [step_push_score] at step
      cases step
      exact .dispatch tokens (literal :: values) (saved literal) valid
  | white tokens older right left v valid =>
      have eq := Option.some.inj
        ((step_reduce tree tokens older v true right left).symm.trans step)
      cases eq
      exact .dispatch tokens (max left right :: older) (saved (max left right)) valid
  | black tokens older right left v valid =>
      have eq := Option.some.inj
        ((step_reduce tree tokens older v false right left).symm.trans step)
      cases eq
      exact .dispatch tokens (min left right :: older) (saved (min left right)) valid
  | finish v =>
      rw [step_finish_result] at step
      cases step
      exact WellFormed.result result
  | loop draw =>
      rw [step_loop] at step
      cases step
      exact .loop draw
  | terminal win => simp [TM2.step] at step

theorem WellFormed.reaches {tree : Tree} {result : Fin 3} {before after : GameCfg}
    (valid : WellFormed result before) (reach : TM2.Reaches (gameProgram tree) before after) :
    WellFormed result after := by
  induction reach with
  | refl => exact valid
  | tail _ step ih => exact ih.step step

/-- All reachable configurations after initialization are well formed. In particular, no
serialized-tree execution reads a missing operand or obtains a result from malformed memory. -/
theorem reachable_wellFormed (tree : Tree) {cfg : GameCfg}
    (reach : TM2.Reaches (gameProgram tree) (TM2.init false []) cfg) :
    cfg = TM2.init false [] ∨ WellFormed (value tree) cfg := by
  induction reach with
  | refl => exact .inl rfl
  | @tail middle after _ step ih =>
      rcases ih with initial | valid
      · subst middle
        have step' : TM2.step (gameProgram tree) (TM2.init false []) = some after := step
        rw [step_init] at step'
        cases step'
        exact .inr (.dispatch (serialize tree) [] 0
          (by simpa [runTokens] using runTokens_serialize tree [] []))
      · exact .inr (valid.step step)

/-- A family that makes arbitrarily many completed left-subtree results live simultaneously. -/
def rightSpine : ℕ → Tree
  | 0 => .leaf .draw
  | n + 1 => .choice .white (.leaf .draw) (rightSpine n)

theorem rightSpine_live (programTree : Tree) (n : ℕ) (rest : List (Fin 5))
    (values : List (Fin 3)) (v : GameStore) :
    TM2.Reaches (gameProgram programTree) (dispatch (serialize (rightSpine n) ++ rest) values v)
      (dispatch (List.replicate n 3 ++ rest) (List.replicate (n + 1) 1 ++ values) (saved 1)) := by
  induction n generalizing rest values v with
  | zero => simpa [rightSpine, serialize, score, tokenOfScore] using
      reaches_score programTree rest values v 1
  | succ n ih =>
      simpa [TM2.Reaches, rightSpine, serialize, score, tokenOfScore, List.append_assoc,
        List.replicate_succ'] using
        (reaches_score programTree (serialize (rightSpine n) ++ 3 :: rest) values v 1).trans
          (ih (3 :: rest) (1 :: values) (saved 1))

/-- There is no fixed bound on the amount of live value-stack memory used by this eight-label
interpreter. For each `n`, an initialized finite game reaches a stack of length `n + 1`. -/
theorem unbounded_live_value_stack (n : ℕ) :
    ∃ cfg, TM2.Reaches (gameProgram (rightSpine n)) (TM2.init false []) cfg ∧
      (cfg.stk true).length = n + 1 := by
  refine ⟨dispatch (List.replicate n 3) (List.replicate (n + 1) 1) (saved 1),
    (oneStep (step_init (rightSpine n))).trans ?_, ?_⟩
  · simpa [TM2.Reaches] using rightSpine_live (rightSpine n) n [] [] 0
  · simp [dispatch]

theorem supportsStmt_univ (statement : GameStmt) :
    TM2.SupportsStmt Finset.univ statement := by
  induction statement <;> simp_all [TM2.SupportsStmt]

/-- The complete eight-label support, including the empty-stack initializer and loop. -/
theorem gameProgram_supports (tree : Tree) :
    TM2.Supports (gameProgram tree) Finset.univ :=
  ⟨Finset.mem_univ _, fun label _ ↦ supportsStmt_univ (gameProgram tree label)⟩

/-- A branching White win: White chooses the winning alternative. -/
def whiteWin : Tree := .choice .white (.leaf (.win .black)) (.leaf (.win .white))

/-- A branching Black win: Black chooses the winning alternative. -/
def blackWin : Tree := .choice .black (.leaf (.win .white)) (.leaf (.win .black))

/-- A branching draw: White can avoid losing, but cannot force a win. -/
def drawGame : Tree := .choice .white (.leaf (.win .black)) (.leaf .draw)

/-- White has a favorable line, but Black can refute it by choosing a draw. -/
def favorableLine : Tree :=
  .choice .white (.choice .black (.leaf (.win .white)) (.leaf .draw)) (.leaf (.win .black))

/-- All terminal outcomes, ignoring who controls the intervening choices. -/
def leafOutcomes : Tree → List Outcome
  | .leaf result => [result]
  | .choice _ left right => leafOutcomes left ++ leafOutcomes right

theorem whiteWin_value : value whiteWin = 2 := by decide
theorem blackWin_value : value blackWin = 0 := by decide
theorem drawGame_value : value drawGame = 1 := by decide
theorem favorableLine_value : value favorableLine = 1 := by decide

theorem favorableLine_has_white_win : .win .white ∈ leafOutcomes favorableLine := by decide

theorem favorableLine_not_forced_white_win : value favorableLine ≠ 2 := by decide

theorem whiteWin_serialize : serialize whiteWin = [0, 2, 3] := by decide
theorem blackWin_serialize : serialize blackWin = [2, 0, 4] := by decide
theorem drawGame_serialize : serialize drawGame = [0, 1, 3] := by decide
theorem favorableLine_serialize : serialize favorableLine = [2, 1, 4, 0, 3] := by decide

theorem whiteWin_halts : (TM2.eval (gameProgram whiteWin) false []).Dom :=
  (gameProgram_halts_iff whiteWin).mpr (by decide)

theorem blackWin_halts : (TM2.eval (gameProgram blackWin) false []).Dom :=
  (gameProgram_halts_iff blackWin).mpr (by decide)

theorem drawGame_not_halts : ¬ (TM2.eval (gameProgram drawGame) false []).Dom :=
  fun halts ↦ (gameProgram_halts_iff drawGame).mp halts drawGame_value

theorem favorableLine_not_halts : ¬ (TM2.eval (gameProgram favorableLine) false []).Dom :=
  fun halts ↦ (gameProgram_halts_iff favorableLine).mp halts favorableLine_value

end Chess.Compilation
