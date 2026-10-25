/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Counter

/-! # Fixed-width binary identity without executing the printer -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Packet

open Common

/-- Least significant bit first, exactly the counter's physical left frame order. -/
def encode : Nat → Nat → List Bit
  | 0, _ => []
  | width + 1, value => ⟨value % 2, Nat.mod_lt value (by decide)⟩ :: encode width (value / 2)

@[simp] theorem encode_length (width value : Nat) : (encode width value).length = width := by
  induction width generalizing value with
  | zero => rfl
  | succ width ih => simp [encode, ih]

theorem encode_value (width value : Nat) (bound : value < 2 ^ width) :
    Counter.value (encode width value) = value := by
  induction width generalizing value with
  | zero => simp only [pow_zero] at bound; simp [encode, Counter.value, show value = 0 by omega]
  | succ width ih =>
    have smaller : value / 2 < 2 ^ width := by
      rw [pow_succ] at bound
      omega
    simp only [encode, Counter.value, ih _ smaller]
    omega

/-- Fixed length rules out the leading-zero ambiguity of finite binary values. -/
theorem value_injective (first second : List Bit) (length : first.length = second.length)
    (value : Counter.value first = Counter.value second) : first = second := by
  induction first generalizing second with
  | nil => cases second <;> simp_all
  | cons bit bits ih =>
    cases second with
    | nil => simp at length
    | cons other rest =>
      have same : bit = other := by
        apply Fin.ext
        have := bit.isLt
        have := other.isLt
        simp only [Counter.value] at value
        omega
      subst other
      have tail : Counter.value bits = Counter.value rest := by
        simp only [Counter.value] at value
        omega
      exact congrArg (bit :: ·) (ih rest (by simpa using length) tail)

theorem encode_unique (width value : Nat) (bound : value < 2 ^ width)
    (bits : List Bit) (length : bits.length = width) (equal : Counter.value bits = value) :
    bits = encode width value :=
  value_injective bits (encode width value) (length.trans (encode_length width value).symm)
    (equal.trans (encode_value width value bound).symm)

/-- ASCII identity is only a representation of ordered bits, not a file parser. -/
def text (bits : List Bit) : List Char := bits.map (fun bit ↦ if bit = 0 then '0' else '1')

@[simp] theorem text_append (first second : List Bit) :
    text (first ++ second) = text first ++ text second := by simp [text]

/-- Forward chronological output for a list of numeric fixed-width words. -/
def render (width : Nat) (values : List Nat) : List Char :=
  values.flatMap (fun value ↦ text (encode width value).reverse)

@[simp] theorem render_append (width : Nat) (first second : List Nat) :
    render width (first ++ second) = render width first ++ render width second := by
  simp [render]

end ConjectureMachines.Compilation.Parsimony.Packet
