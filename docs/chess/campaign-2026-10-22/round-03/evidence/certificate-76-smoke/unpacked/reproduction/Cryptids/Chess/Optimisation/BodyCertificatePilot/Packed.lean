module
public import Cryptids.Compilation.BalancedTable

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
def packedDirCode : Dir → Nat
  | .left => 0
  | .right => 1

def packedEncode {q : Nat} : Option (Fin 2 × Dir × Fin q) → Nat
  | none => 0
  | some (write, direction, next) =>
      (4 * next.val + 2 * packedDirCode direction + write.val) + 1

def packedDecode (q : Nat) [NeZero q] : Nat → Option (Fin 2 × Dir × Fin q)
  | 0 => none
  | payload + 1 =>
      some (Fin.ofNat 2 payload,
        if (payload / 2) % 2 = 0 then Dir.left else Dir.right,
        Fin.ofNat q (payload / 4))

theorem packed_decode_none_iff (q : Nat) [NeZero q] (code : Nat) :
    packedDecode q code = none ↔ code = 0 := by
  cases code <;> simp [packedDecode]

theorem packed_payload_lt (q payload : Nat) (bounded : payload + 1 ≤ 4 * q) :
    payload / 4 < q := by
  omega

theorem packed_destination_val (q : Nat) [NeZero q] (payload : Nat)
    (bounded : payload + 1 ≤ 4 * q) :
    (Fin.ofNat q (payload / 4)).val = payload / 4 := by
  exact Nat.mod_eq_of_lt (packed_payload_lt q payload bounded)

theorem packed_encode_decode (q : Nat) [NeZero q] (code : Nat)
    (bounded : code ≤ 4 * q) : packedEncode (packedDecode q code) = code := by
  cases code with
  | zero => rfl
  | succ payload =>
      have destination := packed_payload_lt q payload bounded
      by_cases direction : (payload / 2) % 2 = 0
      · simp only [packedDecode, ite_eq_left direction, packedEncode, packedDirCode]
        change (4 * ((payload / 4) % q) + 2 * 0 + payload % 2) + 1 = payload + 1
        rw [Nat.mod_eq_of_lt destination]
        omega
      · simp only [packedDecode, ite_eq_right direction, packedEncode, packedDirCode]
        change (4 * ((payload / 4) % q) + 2 * 1 + payload % 2) + 1 = payload + 1
        rw [Nat.mod_eq_of_lt destination]
        omega

theorem packed_decode_encode (q : Nat) [NeZero q]
    (instruction : Option (Fin 2 × Dir × Fin q)) :
    packedDecode q (packedEncode instruction) = instruction := by
  cases instruction with
  | none => rfl
  | some instruction =>
      rcases instruction with ⟨write, direction, next⟩
      let payload := 4 * next.val + 2 * packedDirCode direction + write.val
      have write_bound := write.isLt
      have direction_bound : packedDirCode direction < 2 := by
        cases direction <;> decide
      have write_value : payload % 2 = write.val := by
        dsimp only [payload]
        omega
      have direction_value : (payload / 2) % 2 = packedDirCode direction := by
        dsimp only [payload]
        omega
      have destination_value : payload / 4 = next.val := by
        dsimp only [payload]
        omega
      have write_equal : Fin.ofNat 2 payload = write := by
        apply Fin.ext
        exact write_value
      have destination_equal : Fin.ofNat q (payload / 4) = next := by
        apply Fin.ext
        change (payload / 4) % q = next.val
        rw [destination_value, Nat.mod_eq_of_lt next.isLt]
      have direction_equal :
          (if (payload / 2) % 2 = 0 then Dir.left else Dir.right) = direction := by
        rw [direction_value]
        cases direction <;> rfl
      change some (Fin.ofNat 2 payload,
        if (payload / 2) % 2 = 0 then Dir.left else Dir.right,
        Fin.ofNat q (payload / 4)) = some (write, direction, next)
      rw [write_equal, direction_equal, destination_equal]

def packedAllBounded : Balanced.RowTree (Nat × Nat) → Nat → Bool
  | .empty, _ => true
  | .leaf row, bound => decide (row.1 ≤ bound) && decide (row.2 ≤ bound)
  | .branch _ left right, bound =>
      packedAllBounded left bound && packedAllBounded right bound

theorem packed_lookup_bound (tree : Balanced.RowTree (Nat × Nat)) (bound : Nat)
    (bounded : packedAllBounded tree bound = true) (index : Nat) :
    (tree.lookup index (0, 0)).1 ≤ bound ∧ (tree.lookup index (0, 0)).2 ≤ bound := by
  induction tree generalizing index with
  | empty => exact ⟨Nat.zero_le _, Nat.zero_le _⟩
  | leaf row =>
      have both : decide (row.1 ≤ bound) = true ∧ decide (row.2 ≤ bound) = true := by
        simpa only [packedAllBounded, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · exact ⟨of_decide_eq_true both.1, of_decide_eq_true both.2⟩
      · exact ⟨Nat.zero_le _, Nat.zero_le _⟩
  | branch leftCount left right ihl ihr =>
      have both : packedAllBounded left bound = true ∧
          packedAllBounded right bound = true := by
        simpa only [packedAllBounded, Bool.and_eq_true] using bounded
      simp only [Balanced.RowTree.lookup]
      split
      · apply ihl
        exact both.1
      · apply ihr
        exact both.2

def packedCodeAt {q : Nat} (tree : Balanced.RowTree (Nat × Nat))
    (state : Fin q) (bit : Fin 2) : Nat :=
  let row := tree.lookup state.val (0, 0)
  if bit.val = 0 then row.1 else row.2

def packedMachine (q : Nat) [NeZero q] (tree : Balanced.RowTree (Nat × Nat)) :
    Machine q 2 := ⟨fun state bit ↦ packedDecode q (packedCodeAt tree state bit)⟩

theorem packed_code_bound {q : Nat} (tree : Balanced.RowTree (Nat × Nat)) (bound : Nat)
    (bounded : packedAllBounded tree bound = true) (state : Fin q) (bit : Fin 2) :
    packedCodeAt tree state bit ≤ bound := by
  have both := packed_lookup_bound tree bound bounded state.val
  unfold packedCodeAt
  split
  · exact both.1
  · exact both.2

theorem packed_transition_fidelity (q : Nat) [NeZero q]
    (tree : Balanced.RowTree (Nat × Nat)) (bounded : packedAllBounded tree (4 * q) = true)
    (state : Fin q) (bit : Fin 2) :
    packedEncode ((packedMachine q tree).transition state bit) =
      packedCodeAt tree state bit :=
  packed_encode_decode q _ (packed_code_bound tree (4 * q) bounded state bit)
def QuotientFacts
    (tree : Balanced.RowTree (Nat × Nat)) (size bound : Nat) : Prop :=
  tree.count = size ∧ tree.WellFormed ∧ packedAllBounded tree bound = true

def checkQuotient : Balanced.RowTree (Nat × Nat) → Nat → Option Nat
  | .empty, _ => some 0
  | .leaf value, bound =>
      if value.1 ≤ bound ∧ value.2 ≤ bound then some 1 else none
  | .branch cached left right, bound =>
      match checkQuotient left bound, checkQuotient right bound with
      | some nl, some nr => if cached = nl then some (nl + nr) else none
      | _, _ => none

theorem checkQuotient_sound (tree : Balanced.RowTree (Nat × Nat)) (bound size : Nat)
    (checked : checkQuotient tree bound = some size) : QuotientFacts tree size bound := by
  induction tree generalizing size with
  | empty =>
    have eq : 0 = size := Option.some.inj checked
    subst size
    exact ⟨rfl, trivial, rfl⟩
  | leaf value =>
    by_cases h : value.1 ≤ bound ∧ value.2 ≤ bound
    · have eq : 1 = size := Option.some.inj (by
        simpa only [checkQuotient, ite_eq_left h] using checked)
      subst size
      refine ⟨rfl, trivial, ?_⟩
      simpa only [packedAllBounded, Bool.and_eq_true_iff, decide_eq_true_eq] using h
    · simp only [checkQuotient, ite_eq_right h, reduceCtorEq] at checked
  | branch cached left right ihl ihr =>
    cases hl : checkQuotient left bound with
    | none => simp only [checkQuotient, hl, reduceCtorEq] at checked
    | some nl =>
      cases hr : checkQuotient right bound with
      | none => simp only [checkQuotient, hl, hr, reduceCtorEq] at checked
      | some nr =>
        by_cases hc : cached = nl
        · have eq : nl + nr = size := Option.some.inj (by
            simpa only [checkQuotient, hl, hr, ite_eq_left hc] using checked)
          subst size
          obtain ⟨hcl, hvl, hbl⟩ := ihl nl hl
          obtain ⟨hcr, hvr, hbr⟩ := ihr nr hr
          exact ⟨congrArg₂ Nat.add hcl hcr,
            ⟨hc.trans hcl.symm, hvl, hvr⟩, Bool.and_eq_true_iff.mpr ⟨hbl, hbr⟩⟩
        · simp only [checkQuotient, hl, hr, ite_eq_right hc, reduceCtorEq] at checked

theorem quotient_facts_branch (left right : Balanced.RowTree (Nat × Nat)) (nl nr bound : Nat)
    (hl : QuotientFacts left nl bound) (hr : QuotientFacts right nr bound) :
    QuotientFacts (.branch nl left right) (nl + nr) bound :=
  ⟨congrArg₂ Nat.add hl.1 hr.1, ⟨hl.1.symm, hl.2.1, hr.2.1⟩,
    Bool.and_eq_true_iff.mpr ⟨hl.2.2, hr.2.2⟩⟩


end Chess.Optimisation.BodyCertificatePilot
