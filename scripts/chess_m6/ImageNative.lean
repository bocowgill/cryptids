import Cryptids.Chess.Compilation.Image

open Turing ConjectureMachines ConjectureMachines.Compilation BinaryTemplates
open Chess.Compilation

attribute [local irreducible] Input.bits

namespace SmallImage

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
  | 2 => .branch (fun a _ ↦ a) (.goto fun _ _ ↦ 3) (.goto fun _ _ ↦ 4)
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
    fin_cases q <;>
      simp [data, classes, readPC, movePC, ReadRow, MoveRow, PlainRow, source] <;> rfl


end SmallImage

namespace ImageNative
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
      have restEmpty : rest = List.replicate n default := by
        simpa only [h, List.nil_append] using restEq
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

def decodePointed : PointedMap (Fin 2) Bool := ⟨Compilation.Binary.decodeSymbol, rfl⟩

def runPost {q : Nat} [NeZero q] (M : TM0.Machine Bool (Fin q)) :
    Nat → TM0.Cfg Bool (Fin q) → Option (Nat × TM0.Cfg Bool (Fin q))
  | 0, _ => none
  | fuel + 1, cfg => match TM0.step M cfg with
    | none => some (0, cfg)
    | some next => do
      let (steps, out) ← runPost M fuel next
      return (steps + 1, out)

def runPaid {q : Nat} [NeZero q] (M : Machine q 2) :
    Nat → Cfg q 2 → Option (Nat × Cfg q 2)
  | 0, _ => none
  | fuel + 1, cfg => match step M cfg with
    | none => some (0, cfg)
    | some next => do
      let (steps, out) ← runPaid M fuel next
      return (steps + 1, out)

private def check (label : String) (ok : Bool) : IO Unit := do
  unless ok do throw <| IO.userError s!"Image fixture failed: {label}"

def small (input : List Bool) : IO Unit := do
  let graph := TemplateGraph.lazyGraph SmallImage.data
  let post := LazyGraph.machine graph
  let body : BundledMachine 2 := ⟨446, Compilation.Binary.compile post⟩
  let encoded := blockInput SmallImage.code input
  let bits := (encoded.map Compilation.Binary.encodeSymbol).toArray
  let paid := FlatInit.initialise bits body
  let some entered := FlatInit.runFrom paid.toMachine (2 * bits.size) ConjectureMachines.init
    | throw <| IO.userError "Small initializer stopped"
  check "paid prefix offset" (entered.state.val == 2 * bits.size)
  check "paid prefix tape/head" (sameTape (entered.tape.map decodePointed) (Tape.mk₁ encoded))
  let some (postSteps, first) := runPost post 20000 (TM0.init encoded)
    | throw <| IO.userError "Small Post fixture exceeded fuel"
  let some (paidSteps, second) := runPaid paid.toMachine 20000 ConjectureMachines.init
    | throw <| IO.userError "Small paid fixture exceeded fuel"
  check "complete terminal tape" (sameTape first.Tape (second.tape.map decodePointed))
  check "terminal state" (second.state.val == 2 * bits.size + first.q.val)
  check "paid count" (paid.states == 446 + 2 * bits.size)
  IO.println s!"small input={input}: {postSteps} Post steps/{paidSteps} paid steps, \
    exact tape/state"

def signature {q : Nat} (row : Option (Fin 2 × Dir × Fin q)) : Option (Nat × Bool × Nat) :=
  row.map fun (write, dir, next) ↦ (write.val, dir == .right, next.val)

/-- Independent numeric partition arithmetic, retaining actual Post lookup as its source row. -/
def expected (q : Nat) (bit : Fin 2) : Option (Nat × Bool × Nat) := Id.run do
  let n := Input.bits.size
  if before : q < n then return some (Input.bits[q].val, true, q + 1)
  else if q < 2 * n then return some (bit.val, false, q + 1)
  else if sourceBound : q - 2 * n < 194468236 then
    let source : Fin (GraphPost.stateCount (TemplateGraph.build Image.data).raw.count 5) :=
      ⟨q - 2 * n, by simpa only [Image.post_count] using sourceBound⟩
    return (Image.post source (Compilation.Binary.decodeSymbol bit)).map fun (next, action) ↦
      match action with
      | .move dir => (bit.val, dir == .right, 2 * n + next.val)
      | .write value => ((Compilation.Binary.encodeSymbol value).val, true,
          2 * n + 194468236 + next.val)
  else return some (bit.val, false, 2 * n + (q - 2 * n - 194468236))

def actualRows : IO Unit := do
  check "node count" ((TemplateGraph.build Image.data).raw.count == 38893646)
  check "post count"
    (GraphPost.stateCount (TemplateGraph.build Image.data).raw.count 5 == 194468236)
  check "body count" (Image.body.states == 388936472)
  check "input count" (Input.bits.size == 1555180)
  check "final count" (Image.generated.states == 392046832)
  let boundary := #[0, 1, 1555178, 1555179, 1555180, 1555181, 3110358, 3110359,
    3110360, 3110361, 197578594, 197578595, 197578596, 392046830, 392046831]
  let mut checked := 0
  for q in boundary ++ (Array.range 1000).map (fun i ↦ (i * 392046) % 392046832) do
    if bound : q < 392046832 then
      for bit in [(0 : Fin 2), 1] do
        let row := signature (Image.machine.transition ⟨q, bound⟩ bit)
        check s!"actual row {q}/{bit.val}" (row == expected q bit)
        checked := checked + 1
  check "write mutation" (signature (Image.machine.transition 0 0) !=
    some (1 - (Input.bits[0]'(by rw [Input.bits_size]; decide)).val, true, 1))
  check "return mutation"
    (signature (Image.machine.transition 1555180 1) != some (0, false, 1555181))
  IO.println s!"Actual fixed machine partition: {checked} boundary/spaced rows passed"

end ImageNative

def main : IO Unit := do
  ImageNative.actualRows
  for input in [[true, false], [false, true], []] do ImageNative.small input
  IO.println "Image native checks passed; initial chess program not evaluated"
