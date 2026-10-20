/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.LazyGraph

/-! # Quotienting duplicate initial and halted Post controls

Live node/store pairs keep their exact identity. All halted stores share one control;
the live initial root is renamed to ordinary state zero. No tape cell is changed.
-/

@[expose] public section
namespace ConjectureMachines.Optimisation.CompactPost
open Turing StateTransition ConjectureMachines.Compilation

set_option backward.isDefEq.respectTransparency false

/-- One halt control and every live node/store pair. -/
def stateCount (n k : Nat) : Nat := 1 + n * k

instance {n k : Nat} : NeZero (stateCount n k) := ⟨by simp [stateCount]⟩

/-- Halted stores have no observable successor and therefore share index zero. -/
def rawEncode {n k : Nat} (d : GraphPost.Descriptor n k) : Fin (stateCount n k) :=
  match d.1 with
  | none => Fin.castAdd (n * k) (0 : Fin 1)
  | some pc => Fin.natAdd 1 (finProdFinEquiv (pc, d.2))

/-- The inverse on live controls; the halt control deliberately forgets its store. -/
def rawDecode {n k : Nat} (q : Fin (stateCount n k)) : Option (Fin n × Fin k) :=
  match finSumFinEquiv.symm q with
  | .inl _ => none
  | .inr pair => some (finProdFinEquiv.symm pair)

theorem rawDecode_encode {n k : Nat} (d : GraphPost.Descriptor n k) :
    rawDecode (rawEncode d) = d.1.map (fun pc ↦ (pc, d.2)) := by
  rcases d with ⟨pc, value⟩
  cases pc <;> simp [rawEncode, rawDecode]

/-- Only two numeric indices are exchanged to give the true live root state zero. -/
def permutation {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) : Equiv.Perm (Fin (stateCount n k)) :=
  Equiv.swap 0 (rawEncode (some (g.entry 0), 0))

def encode {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (d : GraphPost.Descriptor n k) :
    Fin (stateCount n k) := permutation g (rawEncode d)

def decode {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (q : Fin (stateCount n k)) :
    Option (Fin n × Fin k) := rawDecode (permutation g q)

theorem decode_encode {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (d : GraphPost.Descriptor n k) :
    decode g (encode g d) = d.1.map (fun pc ↦ (pc, d.2)) := by
  simp only [decode, encode, permutation, Equiv.swap_apply_self, rawDecode_encode]

@[simp] theorem encode_initial {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) : encode g (some (g.entry 0), 0) = 0 := by
  exact Equiv.swap_apply_right _ _

/-- Direct quotient rows: the same primitive tape command and the quotient destination. -/
def machine {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) : TM0.Machine Bool (Fin (stateCount n k)) :=
  fun q bit ↦ match decode g q with
  | none => none
  | some (pc, value) =>
      let result := LazyGraph.trAux g bit pc value
      some (encode g result.1, result.2)

/-- Map every original control, including its distinguished initial and halted stores. -/
def trCfg {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels)
    (cfg : TM0.Cfg Bool (Fin (GraphPost.stateCount n k))) :
    TM0.Cfg Bool (Fin (stateCount n k)) :=
  ⟨encode g (LazyGraph.descriptor g cfg.q), cfg.Tape⟩

/-- Every source row has the identical command and quotient successor, including stopping. -/
theorem transition_tr {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (q : Fin (GraphPost.stateCount n k)) (bit : Bool) :
    machine g (encode g (LazyGraph.descriptor g q)) bit =
      (LazyGraph.machine g q bit).map (fun (next, cmd) ↦
        (encode g (LazyGraph.descriptor g next), cmd)) := by
  cases desc : LazyGraph.descriptor g q with
  | mk pc value =>
    cases pc <;> simp [machine, LazyGraph.machine, desc, decode_encode,
      LazyGraph.descriptor_encode]

/-- Exact steps and exact stopping commute with the quotient on arbitrary tapes. -/
theorem step_trCfg {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels)
    (cfg : TM0.Cfg Bool (Fin (GraphPost.stateCount n k))) :
    TM0.step (machine g) (trCfg g cfg) =
      (TM0.step (LazyGraph.machine g) cfg).map (trCfg g) := by
  rcases cfg with ⟨q, tape⟩
  cases desc : LazyGraph.descriptor g q with
  | mk pc value =>
    cases pc <;> simp [TM0.step, trCfg, machine, LazyGraph.machine, desc,
      decode_encode, LazyGraph.descriptor_encode]

theorem respects {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) :
    Respects (TM0.step (LazyGraph.machine g)) (TM0.step (machine g))
      (fun first second ↦ trCfg g first = second) := by
  intro cfg target equal
  subst target
  rw [step_trCfg]
  cases move : TM0.step (LazyGraph.machine g) cfg with
  | none => rfl
  | some next =>
    exact ⟨trCfg g next, rfl, .single (by rw [step_trCfg, move]; rfl)⟩

@[simp] theorem trCfg_init {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (input : List Bool) :
    trCfg g (TM0.init input) = TM0.init input := by
  change trCfg g ⟨0, Tape.mk₁ input⟩ = ⟨0, Tape.mk₁ input⟩
  simp only [trCfg, LazyGraph.descriptor_zero, encode_initial]

/-- Both halting directions hold for every finite input, without a reachability oracle. -/
theorem halts_input {n k labels : Nat} [NeZero k] [NeZero labels]
    (g : LazyGraph.Graph n k labels) (input : List Bool) :
    (TM0.eval (machine g) input).Dom ↔ (TM0.eval (LazyGraph.machine g) input).Dom := by
  exact tr_eval_dom (respects g) (trCfg_init g input)

end ConjectureMachines.Optimisation.CompactPost
