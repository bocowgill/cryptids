import Cryptids.Compilation.Parsimony.Global

open Turing ConjectureMachines
open ConjectureMachines.Compilation
namespace ParsimonyComplete
open Parsimony.Common Parsimony.Insertion

set_option backward.isDefEq.respectTransparency false

abbrev Bit := Fin 2
abbrev blank := Parsimony.Global.blank

@[simp] theorem atL_blank (R : ListBlank Bit) :
    atL blank R = Tape.mk' blank (R.cons 0) := by rfl

def decode (chars : List Char) : List Bit := chars.map (fun c ↦ if c = '1' then 1 else 0)

@[simp] theorem decode_append (a b : List Char) : decode (a ++ b) = decode a ++ decode b := by
  simp [decode]

@[simp] theorem decode_text (bits : List Bit) : decode (Parsimony.Packet.text bits) = bits := by
  induction bits with
  | nil => rfl
  | cons bit bits ih =>
    have small := bit.isLt
    have splitbit : bit = 0 ∨ bit = 1 := by omega
    rcases splitbit with rfl | rfl <;> simp [decode, Parsimony.Packet.text] at *
    all_goals exact ih

/-- A transition extension preserves every finite path of the original machine. -/
theorem extend {q : Nat} (old new : Machine q 2)
    (rows : ∀ s b out, old.transition s b = some out → new.transition s b = some out)
    {a b : Cfg q 2} (run : Parsimony.Common.Runs old a b) :
    Parsimony.Common.Runs new a b := by
  refine Relation.ReflTransGen.mono ?_ run
  intro first second h
  rcases first with ⟨s, tape⟩
  cases row : old.transition s tape.head with
  | none => simp [step, row] at h
  | some out =>
    have same := rows s tape.head out row
    simpa only [step, row, same] using h

def next (n : Nat) (bit : Bit) : Nat := if bit = 0 then 0 else n + 1

/-- Checked finite backward scan; none means a premature 32-one marker. -/
def eval : Nat → List Bit → Option Nat
  | n, [] => some n
  | n, bit :: bits => if next n bit < 32 then eval (next n bit) bits else none

theorem eval_append (n : Nat) (a b : List Bit) :
    eval n (a ++ b) = (eval n a).bind (fun k ↦ eval k b) := by
  induction a generalizing n with
  | nil => rfl
  | cons bit bits ih => simp only [List.cons_append, eval]; split <;> simp_all

theorem eval_lt (n k : Nat) (bits : List Bit) (start : n < 32)
    (checked : eval n bits = some k) : k < 32 := by
  induction bits generalizing n with
  | nil =>
    simp only [eval, Option.some.injEq] at checked
    subst k
    exact start
  | cons bit bits ih =>
    by_cases valid : next n bit < 32
    · exact ih _ valid (by simpa [eval, valid] using checked)
    · simp [eval, valid] at checked

/-- The finite scan certificate gives exact preservation of all scanned tape cells. -/
theorem scan {q : Nat} (M : Machine q 2) (control : Nat → Fin q)
    (rows : ∀ i, i < 32 → ∀ bit, next i bit < 32 →
      M.transition (control i) bit = some (bit, .left, control (next i bit)))
    (bits : List Bit) (n k : Nat) (start : n < 32) (checked : eval n bits = some k)
    (L R : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨control n, atL (ListBlank.append bits L) R⟩
      ⟨control k, atL L (ListBlank.append bits.reverse R)⟩ := by
  induction bits generalizing n L R with
  | nil => simp only [eval, Option.some.injEq] at checked; subst k; exact .refl
  | cons bit bits ih =>
    have valid : next n bit < 32 := by
      by_contra h
      simp [eval, h] at checked
    have rest : eval (next n bit) bits = some k := by simpa [eval, valid] using checked
    have first := Parsimony.Common.left M (control n) (control (next n bit)) bit bit
      (ListBlank.append bits L) R (rows n start bit valid)
    have later := ih (next n bit) valid rest L (R.cons bit)
    simpa only [ListBlank.append, List.reverse_cons, ListBlank.append_assoc] using
      first.trans later

/-- Indexed controls walk left across the known one marker. -/
theorem markerWalk {q : Nat} (M : Machine q 2) (c : Nat → Fin q) (count i : Nat)
    (rows : ∀ j, i ≤ j → j < i + count →
      M.transition (c j) 1 = some (1, .left, c (j + 1))) (L R : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨c i, atL (O count L) R⟩
      ⟨c (i + count), atL L (O count R)⟩ := by
  induction count generalizing i R with
  | zero => exact .refl
  | succ count ih =>
    have first := Parsimony.Common.left M (c i) (c (i + 1)) 1 1
      (O count L) R (rows i (by omega) (by omega))
    have later := ih (i + 1) (by
      intro j lower upper
      exact rows j (by omega) (by omega)) (R.cons 1)
    simpa only [O_succ, O_cons, Nat.add_assoc, Nat.add_comm 1 count] using first.trans later

/-- The working unary region is erased while moving left. -/
theorem eraseL {q : Nat} (M : Machine q 2) (s : Fin q)
    (row : M.transition s 1 = some (0, .left, s)) (n : Nat) (L R : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨s, atL (O n L) R⟩ ⟨s, atL L (Z n R)⟩ := by
  induction n generalizing R with
  | zero => exact .refl
  | succ n ih =>
    have first := Parsimony.Common.left M s s 1 0 (O n L) R row
    simpa only [O_succ, Z_succ, Z_cons] using first.trans (ih (R.cons 0))

/-- Repeated erasing steps retain the untouched right exterior. -/
theorem eraseR {q : Nat} (M : Machine q 2) (s : Fin q)
    (row : M.transition s 1 = some (0, .right, s)) (n : Nat) (L R : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨s, Tape.mk' L (O n R)⟩ ⟨s, Tape.mk' (Z n L) R⟩ := by
  induction n generalizing L with
  | zero => exact .refl
  | succ n ih =>
    have first := Parsimony.Common.right M s s 1 0 L (O n R) row
    simpa only [O_succ, Z_succ, Z_cons] using first.trans (ih (L.cons 0))

/-- Repeated zero scanning steps preserve the left exterior. -/
theorem zerosL {q : Nat} (M : Machine q 2) (s : Fin q)
    (row : M.transition s 0 = some (0, .left, s)) (n : Nat) (L R : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨s, atL (Z n L) R⟩ ⟨s, atL L (Z n R)⟩ := by
  induction n generalizing R with
  | zero => exact .refl
  | succ n ih =>
    have first := Parsimony.Common.left M s s 0 0 (Z n L) R row
    simpa only [Z_succ, Z_cons] using first.trans (ih (R.cons 0))

/-- Only the physical startup and cleanup rows, each checked on the fixed machine. -/
structure Controls (q : Nat) where
  initial : Fin q
  signal : Fin q
  back : Fin q
  data : Fin q
  positiveEnd : Fin q
  clean : Fin q
  find : Fin q
  found : Fin q
  tail0 : Fin q
  tail1 : Fin q
  tail2 : Fin q
  scan : Nat → Fin q
  clear : Fin q
  out : Fin q

structure Rows {q : Nat} (M : Machine q 2) (c : Controls q) : Prop where
  initial : M.transition c.initial 0 = some (0, .right, c.signal)
  signal : M.transition c.signal 0 = some (1, .left, c.back)
  back : M.transition c.back 0 = some (0, .right, c.data)
  positiveEnd : M.transition c.positiveEnd 0 = some (0, .left, c.clean)
  cleanOne : M.transition c.clean 1 = some (0, .left, c.clean)
  cleanZero : M.transition c.clean 0 = some (0, .left, c.find)
  findZero : M.transition c.find 0 = some (0, .left, c.find)
  findOne : M.transition c.find 1 = some (1, .right, c.found)
  found : M.transition c.found 0 = some (0, .right, c.tail0)
  tail0 : M.transition c.tail0 0 = some (0, .left, c.tail1)
  tail1 : M.transition c.tail1 0 = some (0, .left, c.tail2)
  tail2 : M.transition c.tail2 1 = some (0, .left, c.scan 0)
  scan : ∀ i, i < 32 → ∀ bit, next i bit < 32 →
    M.transition (c.scan i) bit = some (bit, .left, c.scan (next i bit))
  marker : ∀ i, i < 32 → M.transition (c.scan i) 1 = some (1, .left, c.scan (i + 1))
  enter : M.transition (c.scan 32) 0 = some (0, .right, c.clear)
  clearOne : M.transition c.clear 1 = some (0, .right, c.clear)
  clearZero : M.transition c.clear 0 = some (0, .right, c.out)

theorem startup {q : Nat} (M : Machine q 2) (c : Controls q) (rows : Rows M c) :
    Parsimony.Common.Runs M ⟨c.initial, Tape.mk' blank blank⟩
      ⟨c.data, Tape.mk' blank (blank.cons 1)⟩ := by
  have a := Parsimony.Common.right M c.initial c.signal 0 0 blank blank rows.initial
  have b := Parsimony.Common.leftCell M c.signal c.back 0 1 0 blank blank rows.signal
  have d := Parsimony.Common.right M c.back c.data 0 0 blank (blank.cons 1) rows.back
  simpa only [Parsimony.Global.blank_cons, atL_cons] using a.trans (b.trans d)

/-- Erase the unary workspace and stop on the last printed bit. -/
theorem workspace {q : Nat} (M : Machine q 2) (c : Controls q) (rows : Rows M c)
    (count : Nat) (L : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨c.positiveEnd, Tape.mk' (O count (L.cons 0)) blank⟩
      ⟨c.find, atL L blank⟩ := by
  have a := Parsimony.Common.left M c.positiveEnd c.clean 0 0
    (O count (L.cons 0)) blank rows.positiveEnd
  have b := eraseL M c.clean rows.cleanOne count (L.cons 0) blank
  have d := Parsimony.Common.left M c.clean c.find 0 0 L blank rows.cleanZero
  simp only [atL_cons, Parsimony.Global.blank_cons, Parsimony.Global.zero_blank] at *
  exact a.trans (b.trans d)

/-- Find and erase the five padded tail zeros and the tail one. -/
theorem tail {q : Nat} (M : Machine q 2) (c : Controls q) (rows : Rows M c)
    (L : ListBlank Bit) :
    Parsimony.Common.Runs M ⟨c.find, atL (Z 5 (L.cons 1)) blank⟩
      ⟨c.scan 0, atL L blank⟩ := by
  have a := zerosL M c.find rows.findZero 5 (L.cons 1) blank
  have b := Parsimony.Common.right M c.find c.found 1 1 L blank rows.findOne
  have d := Parsimony.Common.right M c.found c.tail0 0 0 (L.cons 1) blank rows.found
  have e := Parsimony.Common.leftCell M c.tail0 c.tail1 0 0 0 (L.cons 1) blank rows.tail0
  have f := Parsimony.Common.leftCell M c.tail1 c.tail2 0 0 1 L blank rows.tail1
  have g := Parsimony.Common.left M c.tail2 (c.scan 0) 1 0 L blank rows.tail2
  simp only [Parsimony.Global.zero_blank, atL_cons, Parsimony.Global.blank_cons] at *
  exact a.trans (b.trans (d.trans (e.trans (f.trans g))))

/-- Reach the marker, erase it and its separator, and enter on the first packet bit. -/
theorem cleanup {q : Nat} (M : Machine q 2) (c : Controls q) (rows : Rows M c)
    (packet : List Bit) (k : Nat) (safe : eval 0 packet.reverse = some k) :
    Parsimony.Common.Runs M
      ⟨c.scan 0, atL (ListBlank.append (packet.reverse ++ [0]) (O 32 blank)) blank⟩
      ⟨c.out, Tape.mk' blank (ListBlank.append packet blank)⟩ := by
  have zero : eval k [0] = some 0 := by simp [eval, next]
  have both : eval 0 (packet.reverse ++ [0]) = some 0 := by
    rw [eval_append, safe]; exact zero
  have a := scan M c.scan rows.scan (packet.reverse ++ [0]) 0 0 (by omega) both
    (O 32 blank) blank
  have walk := markerWalk M c.scan 32 0 (by
    intro j lower upper
    exact rows.marker j (by omega)) blank (ListBlank.append (0 :: packet) blank)
  have enter := Parsimony.Common.right M (c.scan 32) c.clear 0 0 blank
    (O 32 ((ListBlank.append packet blank).cons 0)) rows.enter
  have erase := eraseR M c.clear rows.clearOne 32 blank
    ((ListBlank.append packet blank).cons 0)
  have done := Parsimony.Common.right M c.clear c.out 0 0 blank
    (ListBlank.append packet blank) rows.clearZero
  simp only [List.reverse_append, List.reverse_cons, List.reverse_nil, List.reverse_reverse,
    List.nil_append, ListBlank.append, List.reverse_replicate, List.length_replicate,
    Nat.zero_add, atL_cons, atL_blank, Parsimony.Global.blank_cons,
    Parsimony.Global.zero_blank] at *
  exact a.trans (walk.trans (enter.trans (erase.trans done)))

end ParsimonyComplete

#print axioms ParsimonyComplete.extend
#print axioms ParsimonyComplete.startup
#print axioms ParsimonyComplete.workspace
#print axioms ParsimonyComplete.tail
#print axioms ParsimonyComplete.cleanup
