module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.LocalRules

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot LocalRulePilot
namespace DirectCheckPilot
set_option backward.isDefEq.respectTransparency false

def allBelow : Nat → (Nat → Bool) → Bool
  | 0, _ => true
  | n + 1, f => allBelow n f && f n

theorem allBelow_sound (n : Nat) (f : Nat → Bool) (checked : allBelow n f = true)
    (i : Nat) (bound : i < n) : f i = true := by
  induction n with
  | zero => omega
  | succ n ih =>
    have parts : allBelow n f = true ∧ f n = true := by
      simpa only [allBelow, Bool.and_eq_true] using checked
    by_cases before : i < n
    · exact ih parts.1 before
    · have same : i = n := by omega
      simpa only [same] using parts.2

def allValues (f : Fin 5 → Bool) : Bool :=
  allBelow 5 fun i ↦ if h : i < 5 then f ⟨i, h⟩ else false

theorem allValues_sound (f : Fin 5 → Bool) (checked : allValues f = true)
    (value : Fin 5) : f value = true := by
  have selected := allBelow_sound 5 _ checked value.val value.isLt
  simpa only [value.isLt, ↓reduceDIte] using selected

-- Match the actual pair once, before checking its two words.
noncomputable def checkPair (address zeroWord oneWord : Nat) : Bool :=
  match quotientTree.lookup (mapTree.lookup address 0) (0, 0) with
  | (first, second) => (first == zeroWord) && (second == oneWord)

theorem checkPair_sound (address zeroWord oneWord : Nat)
    (checked : checkPair address zeroWord oneWord = true) (bit : Bool) :
    rowWord address bit = if bit then oneWord else zeroWord := by
  have parts : (quotientTree.lookup (mapTree.lookup address 0) (0, 0)).1 = zeroWord ∧
      (quotientTree.lookup (mapTree.lookup address 0) (0, 0)).2 = oneWord := by
    cases row : quotientTree.lookup (mapTree.lookup address 0) (0, 0) with
    | mk first second =>
      simpa only [checkPair, row, Bool.and_eq_true, beq_iff_eq] using checked
  cases bit
  · exact parts.1
  · exact parts.2

-- Decode the syntax node once before the ten bit/store cases. In particular a
-- write's structural inverse lookup is shared by the entire node check.
noncomputable def checkNode (q : Fin 4042) (p : Syntax 4042) (slot : Fin p.size)
    (node : BoolGraph.Node p.size 5 4042) : Bool :=
  let base := nodePrefixes.lookup q.val 0
  let here := fun value ↦ mainAddress (base + slot.val) value
  match node with
  | .move dir child => allValues fun value ↦ checkPair (here value)
      (commandWord false dir (mainAddress (base + child.val) value))
      (commandWord true dir (mainAddress (base + child.val) value))
  | .write table child =>
      match FieldReturns.findTarget p child with
      | none => allValues fun value ↦ checkPair (here value) 0 0
      | some rank => allValues fun value ↦ checkPair (here value)
          (commandWord (table.read false value) .right
            (returnAddress (returnPrefixes.lookup q.val 0) rank.val value))
          (commandWord (table.read true value) .right
            (returnAddress (returnPrefixes.lookup q.val 0) rank.val value))
  | .load table child => allValues fun value ↦ checkPair (here value)
      (rowWord (mainAddress (base + child.val) (table.read false value)) false)
      (rowWord (mainAddress (base + child.val) (table.read true value)) true)
  | .branch table left right => allValues fun value ↦ checkPair (here value)
      (if table.read false value then rowWord (mainAddress (base + left.val) value) false
        else rowWord (mainAddress (base + right.val) value) false)
      (if table.read true value then rowWord (mainAddress (base + left.val) value) true
        else rowWord (mainAddress (base + right.val) value) true)
  | .goto table => allValues fun value ↦ checkPair (here value)
      (commandWord false .right
        (returnAddress (returnPrefixes.lookup (table.read false value).val 0) 0 value))
      (commandWord true .right
        (returnAddress (returnPrefixes.lookup (table.read true value).val 0) 0 value))
  | .halt => allValues fun value ↦ checkPair (here value)
      (commandWord false .right 533341) (commandWord true .right 533341)

theorem checkNode_sound (q : Fin 4042) (p : Syntax 4042) (slot : Fin p.size)
    (node : BoolGraph.Node p.size 5 4042) (checked : checkNode q p slot node = true)
    (bit : Bool) (value : Fin 5) :
    rowWord (mainAddress (nodePrefixes.lookup q.val 0 + slot.val) value) bit =
      stepWord q p node bit value := by
  cases node with
  | move dir child | load dir child | branch dir child other | goto dir | halt =>
    simp only [checkNode] at checked
    have selected := allValues_sound _ checked value
    have word := checkPair_sound _ _ _ selected bit
    cases bit <;> simpa only [stepWord, Bool.false_eq_true, ↓reduceIte] using word
  | write table child =>
    cases found : FieldReturns.findTarget p child with
    | none =>
      simp only [checkNode, found] at checked
      have selected := allValues_sound _ checked value
      have word := checkPair_sound _ _ _ selected bit
      cases bit <;> simpa only [stepWord, found, Bool.false_eq_true, ↓reduceIte] using word
    | some rank =>
      simp only [checkNode, found] at checked
      have selected := allValues_sound _ checked value
      have word := checkPair_sound _ _ _ selected bit
      cases bit <;> simpa only [stepWord, found, Bool.false_eq_true, ↓reduceIte] using word

noncomputable def checkMain (q : Fin 4042) (p : Syntax 4042) : Bool :=
  allBelow p.size fun i ↦
    if h : i < p.size then checkNode q p ⟨i, h⟩ (p.fastNodeAt ⟨i, h⟩) else false

theorem checkMain_sound (q : Fin 4042) (p : Syntax 4042)
    (checked : checkMain q p = true) : Coherent q p := by
  intro slot bit value
  have selected := allBelow_sound p.size _ checked slot.val slot.isLt
  simp only [slot.isLt, ↓reduceDIte] at selected
  exact checkNode_sound q p slot (p.fastNodeAt slot) selected bit value

noncomputable def checkReturns (q : Fin 4042) (p : Syntax 4042) : Bool :=
  allBelow (1 + FieldReturns.writeCount p) fun i ↦
    if h : i < 1 + FieldReturns.writeCount p then
      let target := (FieldReturns.targetAt p ⟨i, h⟩).val
      allValues fun value ↦ checkPair
        (returnAddress (returnPrefixes.lookup q.val 0) i value)
        (commandWord false .left
          (mainAddress (nodePrefixes.lookup q.val 0 + target) value))
        (commandWord true .left
          (mainAddress (nodePrefixes.lookup q.val 0 + target) value))
    else false

theorem checkReturns_sound (q : Fin 4042) (p : Syntax 4042)
    (checked : checkReturns q p = true) : ReturnCoherent q p := by
  intro rank bit value
  have selected := allBelow_sound (1 + FieldReturns.writeCount p) _ checked rank.val rank.isLt
  simp only [rank.isLt, ↓reduceDIte] at selected
  have cell := allValues_sound _ selected value
  have word := checkPair_sound _ _ _ cell bit
  cases bit <;> exact word

end DirectCheckPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Direct Boolean checker preserves all local row obligations"
