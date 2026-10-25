/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
module

public import Cryptids.Compilation.Parsimony.Common

/-! # Structural ripple carry with an explicit overflow boundary -/

@[expose] public section
namespace ConjectureMachines.Compilation.Parsimony.Counter

open Turing Common

set_option backward.isDefEq.respectTransparency false

def digit (carry : Bool) (bit : Bit) : Bit := if carry then if bit = 0 then 1 else 0 else bit

def next (carry : Bool) (bit : Bit) : Bool := carry && decide (bit = 1)

/-- Little-endian finite increment, failing precisely when carry leaves the word. -/
def plus : Bool → List Bit → Option (List Bit)
  | carry, [] => if carry then none else some []
  | carry, bit :: bits => (plus (next carry bit) bits).map (digit carry bit :: ·)

def value : List Bit → Nat
  | [] => 0
  | bit :: bits => bit.val + 2 * value bits

theorem plus_length (carry : Bool) (bits out : List Bit) (h : plus carry bits = some out) :
    out.length = bits.length := by
  induction bits generalizing carry out with
  | nil => cases carry <;> simp_all [plus]
  | cons bit bits ih =>
    cases tail : plus (next carry bit) bits with
    | none => simp [plus, tail] at h
    | some result =>
      have equal : digit carry bit :: result = out := by simpa [plus, tail] using h
      subst out
      simp [ih _ _ tail]

/-- Successful finite ripple carry has the exact natural-number successor value. -/
theorem plus_value (carry : Bool) (bits out : List Bit) (h : plus carry bits = some out) :
    value out = value bits + if carry then 1 else 0 := by
  induction bits generalizing carry out with
  | nil => cases carry <;> simp_all [plus, value]
  | cons bit bits ih =>
    cases tail : plus (next carry bit) bits with
    | none => simp [plus, tail] at h
    | some result =>
      have equal : digit carry bit :: result = out := by simpa [plus, tail] using h
      subst out
      have invariant := ih _ _ tail
      cases carry <;> fin_cases bit <;> simp_all [value, digit, next] <;> omega

/-- The usual strict word-capacity bound is sufficient to exclude overflow. -/
theorem plus_exists (carry : Bool) (bits : List Bit)
    (bound : value bits + (if carry then 1 else 0) < 2 ^ bits.length) :
    ∃ out, plus carry bits = some out := by
  induction bits generalizing carry with
  | nil => cases carry <;> simp_all [value, plus]
  | cons bit bits ih =>
    have tailBound : value bits + (if next carry bit then 1 else 0) < 2 ^ bits.length := by
      cases carry <;> fin_cases bit <;> simp_all [value, next, pow_succ] <;> omega
    obtain ⟨out, result⟩ := ih _ tailBound
    exact ⟨digit carry bit :: out, by simp [plus, result]⟩

/-- Local row equations only; the final carry-one row is intentionally unavailable. -/
structure Rows {q : Nat} (M : Machine q 2) (control : Bool → Nat → Fin q)
    (back : Nat → Fin q) (width : Nat) : Prop where
  more : ∀ i, i + 1 < width → ∀ carry bit, (0 < i ∨ carry = true) →
    M.transition (control carry i) bit =
      some (digit carry bit, .left, control (next carry bit) (i + 1))
  last : ∀ carry bit, next carry bit = false →
    M.transition (control carry (width - 1)) bit = some (digit carry bit, .right, back 1)
  back : ∀ i, 1 ≤ i → i < width → ∀ bit,
    M.transition (back i) bit = some (bit, .right, back (i + 1))

/-- The left sweep writes the reversed result and reaches the real return controls. -/
theorem pass {q : Nat} (M : Machine q 2) (control : Bool → Nat → Fin q)
    (back : Nat → Fin q) (width : Nat) (rows : Rows M control back width)
    (bits : List Bit) : ∀ (i : Nat) (carry : Bool) (out : List Bit),
    bits ≠ [] → i + bits.length = width → plus carry bits = some out →
    (0 < i ∨ carry = true) →
    ∀ left right : ListBlank Bit,
    Common.Runs M ⟨control carry i, atL (ListBlank.append bits left) right⟩
      ⟨back 1, (Tape.mk' left (ListBlank.append out.reverse right)).move .right⟩ := by
  induction bits with
  | nil => intro i carry out nonempty; exact (nonempty rfl).elim
  | cons bit bits ih =>
    intro i carry out _nonempty total result valid left right
    cases tail : plus (next carry bit) bits with
    | none => simp [plus, tail] at result
    | some output =>
      have equal : digit carry bit :: output = out := by simpa [plus, tail] using result
      subst out
      cases bits with
      | nil =>
        have clear : next carry bit = false := by
          cases h : next carry bit <;> simp_all [plus]
        have outputNil : output = [] := by simpa [plus, clear] using tail.symm
        subst output
        have index : i = width - 1 := by simp only [List.length_singleton] at total; omega
        subst i
        simpa [ListBlank.append, Tape.move_right_mk'] using
          Common.right M (control carry (width - 1)) (back 1) bit (digit carry bit)
            left right (rows.last carry bit clear)
      | cons nextBit rest =>
        have first := Common.left M (control carry i) (control (next carry bit) (i + 1))
          bit (digit carry bit) (ListBlank.append (nextBit :: rest) left) right
          (rows.more i (by simp only [List.length_cons] at total; omega) carry bit valid)
        have later := ih (i + 1) (next carry bit) output (by simp)
          (by simp only [List.length_cons] at total ⊢; omega)
          tail (Or.inl (by omega)) left (right.cons (digit carry bit))
        simpa [ListBlank.append, List.reverse_cons, ListBlank.append_assoc] using
          first.trans later

/-- The paid return sweep reaches the separator with the exact incremented word. -/
theorem run {q : Nat} (M : Machine q 2) (control : Bool → Nat → Fin q)
    (back : Nat → Fin q) (width : Nat) (rows : Rows M control back width)
    (positive : 0 < width) (bits out : List Bit) (length : bits.length = width)
    (result : plus true bits = some out) (left right : ListBlank Bit) :
    Common.Runs M ⟨control true 0, atL (ListBlank.append bits left) right⟩
      ⟨back width, Tape.mk' (ListBlank.append out left) right⟩ := by
  have outLength : out.length = width := (plus_length true bits out result).trans length
  have nonempty : bits ≠ [] := by intro empty; simp [empty] at length; omega
  have first := pass M control back width rows bits 0 true out nonempty
    (by simpa using length) result (Or.inr rfl) left right
  cases reverse : out.reverse with
  | nil => have := congrArg List.length reverse; simp_all
  | cons bit rest =>
    have total : 1 + rest.length = width := by
      have := congrArg List.length reverse
      simp only [List.length_reverse, List.length_cons] at this
      omega
    have word : out = rest.reverse ++ [bit] := by
      have := congrArg List.reverse reverse
      simpa using this
    have frame : ListBlank.append rest.reverse (left.cons bit) =
        ListBlank.append out left := by
      simpa only [ListBlank.append_assoc, ListBlank.append] using
        congrArg (fun bs ↦ ListBlank.append bs left) word.symm
    have finish := Common.walkR M back rest 1 (left.cons bit) right (by
      intro i lower upper b
      exact rows.back i lower (by omega) b)
    rw [total, frame] at finish
    have begin : Common.Runs M ⟨control true 0, atL (ListBlank.append bits left) right⟩
        ⟨back 1, Tape.mk' (left.cons bit) (ListBlank.append rest right)⟩ := by
      simpa only [reverse, ListBlank.append, Tape.move_right_mk',
        ListBlank.head_cons, ListBlank.tail_cons] using first
    exact begin.trans finish

end ConjectureMachines.Compilation.Parsimony.Counter
