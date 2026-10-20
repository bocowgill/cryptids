import Cryptids.Chess.Compilation.Templates
open Turing PartrecToTM2 K'
open ConjectureMachines.Compilation
open Chess.Compilation.Templates
namespace ActualTemplateFixtures

def trim : List Bool → List Bool
  | [] => []
  | a :: rest => match trim rest with
    | [] => if a = default then [] else [a]
    | b :: tail => a :: b :: tail

theorem trim_blanks (n : Nat) : trim (List.replicate n default) = [] := by
  induction n with
  | zero => rfl
  | succ n ih => simp only [List.replicate_succ, trim, ih, ↓reduceIte]

theorem trim_append_blanks (items : List Bool) (n : Nat) :
    trim (items ++ List.replicate n default) = trim items := by
  induction items with
  | nil => exact trim_blanks n
  | cons a rest ih => simp only [List.cons_append, trim, ih]

def canonical (items : ListBlank Bool) : List Bool :=
  items.liftOn trim (by
    rintro a _ ⟨n, rfl⟩
    exact (trim_append_blanks a n).symm)

theorem trim_extends (items : List Bool) : BlankExtends (trim items) items := by
  induction items with
  | nil => exact ⟨0, rfl⟩
  | cons a rest ih =>
    obtain ⟨n, restEq⟩ := ih
    cases h : trim rest with
    | nil =>
      have restEmpty : rest = List.replicate n default := by simpa only [h, List.nil_append] using restEq
      by_cases ha : a = default
      · subst a
        refine ⟨n + 1, ?_⟩
        have headTrim : trim (default :: rest) = [] := by
          simp only [trim, h, ↓reduceIte]
        rw [headTrim]
        simpa only [List.nil_append, List.replicate_succ] using
          congrArg (List.cons default) restEmpty
      · refine ⟨n, ?_⟩
        have headTrim : trim (a :: rest) = [a] := by
          simp only [trim, h, ite_eq_right ha]
        rw [headTrim]
        simpa only [List.cons_append, List.nil_append] using congrArg (List.cons a) restEmpty
    | cons b tail =>
      refine ⟨n, ?_⟩
      simpa only [trim, h, List.cons_append] using congrArg (List.cons a) restEq

theorem canonical_sound (items : ListBlank Bool) :
    ListBlank.mk (canonical items) = items := by
  refine ListBlank.induction_on items ?_
  intro values
  exact Quotient.sound' (Or.inl (trim_extends values))

theorem canonical_injective : Function.Injective canonical := by
  intro first second equal
  exact (canonical_sound first).symm.trans
    ((congrArg ListBlank.mk equal).trans (canonical_sound second))

def sameTape (left right : Tape Bool) : Bool :=
  decide (left.head = right.head ∧ canonical left.left = canonical right.left ∧
    canonical left.right = canonical right.right)


theorem sameTape_sound (a b : Tape Bool) (h : sameTape a b = true) : a = b := by
  have fields := of_decide_eq_true h
  rcases a with ⟨ah, al, ar⟩
  rcases b with ⟨bh, bl, br⟩
  rcases fields with ⟨hh, hl, hr⟩
  cases hh
  cases canonical_injective hl
  cases canonical_injective hr
  rfl

def run {Γ A σ : Type} [Inhabited Γ]
    (M : A → TM1.Stmt Γ A σ) : Nat → TM1.Cfg Γ A σ →
      Option (Nat × TM1.Cfg Γ A σ)
  | 0, _ => none
  | fuel + 1, cfg =>
    if cfg.l.isNone then some (0, cfg)
    else do
      let next ← TM1.step M cfg
      let result ← run M fuel next
      return (result.1 + 1, result.2)

def nodeCount {A : Type} : TM1.Stmt Bool A Store → Nat
  | .move _ q | .write _ q | .load _ q => 1 + nodeCount q
  | .branch _ q r => 1 + nodeCount q + nodeCount r
  | .goto _ | .halt => 1

private def check (name : String) (test : Bool) : IO Unit := do
  unless test do throw <| IO.userError s!"Actual template fixture failed: {name}"

def main : IO Unit := do
  let mut counts := (0, 0, 0, 0, 0, 0)
  for q in List.finRange 4042 do
    let kind := match primitiveMachine q with
      | .branch _ _ _ => 0 | .move _ _ => 1 | .goto _ => 2
      | .write _ _ => 3 | .load _ _ => 4 | .halt => 5
    counts := match kind with
      | 0 => (counts.1 + 1, counts.2.1, counts.2.2.1, counts.2.2.2.1,
          counts.2.2.2.2.1, counts.2.2.2.2.2)
      | 1 => (counts.1, counts.2.1 + 1, counts.2.2.1, counts.2.2.2.1,
          counts.2.2.2.2.1, counts.2.2.2.2.2)
      | 2 => (counts.1, counts.2.1, counts.2.2.1 + 1, counts.2.2.2.1,
          counts.2.2.2.2.1, counts.2.2.2.2.2)
      | 3 => (counts.1, counts.2.1, counts.2.2.1, counts.2.2.2.1 + 1,
          counts.2.2.2.2.1, counts.2.2.2.2.2)
      | 4 => (counts.1, counts.2.1, counts.2.2.1, counts.2.2.2.1,
          counts.2.2.2.2.1 + 1, counts.2.2.2.2.2)
      | _ => (counts.1, counts.2.1, counts.2.2.1, counts.2.2.2.1,
          counts.2.2.2.2.1, counts.2.2.2.2.2 + 1)
    check s!"read coverage {q.val}" ((readIndex q).isSome == (kind == 0 || kind == 3 || kind == 4))
    check s!"move coverage {q.val}" ((moveIndex q).isSome == (kind == 1))
    check s!"write coverage {q.val}" ((writeIndex q).isSome == (kind == 3))
  check "all constructor counts" (counts == (1233, 1188, 1119, 270, 231, 1))
  for i in List.finRange 270 do
    check s!"write inverse {i.val}" (writeIndex (writePC i) == some i)
    match primitiveMachine (writePC i) with
    | .write _ (.goto target) =>
      for s in List.finRange 5 do
        check s!"saved target {i.val}/{s.val}"
          (target default (stores s) == writeNext i default (stores s))
    | _ => throw <| IO.userError "Listed write row has wrong constructor"
  for i in List.finRange 1734 do
    check s!"read inverse {i.val}" (readIndex (readPC i) == some i)
  for i in List.finRange 1188 do
    check s!"move inverse {i.val}" (moveIndex (movePC i) == some i)
  for i in List.finRange 1250 do
    check s!"symbol inverse {i.val}" ((alphabet.symm (alphabet i)).val == i.val)
  for i in List.finRange 5 do
    check s!"store inverse {i.val}" ((stores.symm (stores i)).val == i.val)
  IO.println "All 4042 row classes, 270/1734/1188 inverses, 1350 saved store targets and 1255 codec digits pass"
  let tests := [(0, [9, 10]), (1, [15, 7]), (2, [123, 7, 9])]
  for (tag, values) in tests do
    let data := trList [0, tag, 0, 0] ++ Γ'.consₗ :: trList values
    let sourceInput : List Symbol := TM2to1.trInit K'.main data
    let some (sourceSteps, source) := run primitiveMachine 200000 (TM1.init sourceInput) |
      throw (IO.userError "Literal source fixture exceeded bound")
    let some (binarySteps, binary) := run machine 200000
        (TM1.init (blockInput CodeBackend.blockCode sourceInput)) |
      throw (IO.userError "Actual binary fixture exceeded bound")
    let expected := TM1to1.trTape CodeBackend.blockCode.blank source.Tape
    check s!"paired opcode {tag}" (source.var == binary.var && source.l.isNone && binary.l.isNone &&
      sameTape expected binary.Tape)
    IO.println s!"Paired opcode {tag}: {sourceSteps} shared steps/{binarySteps} binary steps, exact tape/store"
  IO.println "Actual template execution fixtures passed; no chess program evaluated"
end ActualTemplateFixtures

def main : IO Unit := ActualTemplateFixtures.main
