module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.SourceRecipes

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot LocalRulePilot
open DirectCheckPilot StructuralCheckPilot SourceScopeToolsPilot SourceRecipePilot
open RawLabelPilot RawChunkPilot
namespace LookupWorldPilot
set_option backward.isDefEq.respectTransparency false

structure World where
  classAt : Nat → Nat
  pairAt : Nat → Nat × Nat

noncomputable def actualWorld : World where
  classAt address := mapTree.lookup address 0
  pairAt address := quotientTree.lookup (mapTree.lookup address 0) (0, 0)

def commandWord (world : World) (written : Bool) (dir : Dir) (address : Nat) : Nat :=
  (4 * world.classAt address + 2 * packedDirCode dir + (if written then 1 else 0)) + 1

def rowWord (world : World) (address : Nat) (bit : Bool) : Nat :=
  let row := world.pairAt address
  if bit then row.2 else row.1

def checkPair (world : World) (address zeroWord oneWord : Nat) : Bool :=
  match world.pairAt address with
  | (first, second) => (first == zeroWord) && (second == oneWord)

theorem commandWord_eq (world : World) (correct : world = actualWorld)
    (written : Bool) (dir : Dir) (address : Nat) :
    commandWord world written dir address = NumericLocalPilot.commandWord written dir address := by
  cases correct
  rfl

theorem rowWord_eq (world : World) (correct : world = actualWorld)
    (address : Nat) (bit : Bool) :
    rowWord world address bit = NumericLocalPilot.rowWord address bit := by
  cases correct
  rfl

theorem checkPair_eq (world : World) (correct : world = actualWorld)
    (address zeroWord oneWord : Nat) :
    checkPair world address zeroWord oneWord =
      DirectCheckPilot.checkPair address zeroWord oneWord := by
  cases correct
  rfl

noncomputable def checkNode (world : World) (q : Fin 4042) (p : Syntax 4042) (slot : Fin p.size)
    (node : BoolGraph.Node p.size 5 4042) : Bool :=
  let base := nodePrefixes.lookup q.val 0
  let here := fun value ↦ mainAddress (base + slot.val) value
  match node with
  | .move dir child => allValues fun value ↦ checkPair world (here value)
      (commandWord world false dir (mainAddress (base + child.val) value))
      (commandWord world true dir (mainAddress (base + child.val) value))
  | .write table child =>
      match FieldReturns.findTarget p child with
      | none => allValues fun value ↦ checkPair world (here value) 0 0
      | some rank => allValues fun value ↦ checkPair world (here value)
          (commandWord world (table.read false value) .right
            (returnAddress (returnPrefixes.lookup q.val 0) rank.val value))
          (commandWord world (table.read true value) .right
            (returnAddress (returnPrefixes.lookup q.val 0) rank.val value))
  | .load table child => allValues fun value ↦ checkPair world (here value)
      (rowWord world (mainAddress (base + child.val) (table.read false value)) false)
      (rowWord world (mainAddress (base + child.val) (table.read true value)) true)
  | .branch table left right => allValues fun value ↦ checkPair world (here value)
      (if table.read false value then rowWord world (mainAddress (base + left.val) value) false
        else rowWord world (mainAddress (base + right.val) value) false)
      (if table.read true value then rowWord world (mainAddress (base + left.val) value) true
        else rowWord world (mainAddress (base + right.val) value) true)
  | .goto table => allValues fun value ↦ checkPair world (here value)
      (commandWord world false .right
        (returnAddress (returnPrefixes.lookup (table.read false value).val 0) 0 value))
      (commandWord world true .right
        (returnAddress (returnPrefixes.lookup (table.read true value).val 0) 0 value))
  | .halt => allValues fun value ↦ checkPair world (here value)
      (commandWord world false .right 533341) (commandWord world true .right 533341)

noncomputable def checkReturns (world : World) (q : Fin 4042) (p : Syntax 4042) : Bool :=
  allBelow (1 + FieldReturns.writeCount p) fun i ↦
    if h : i < 1 + FieldReturns.writeCount p then
      let target := (FieldReturns.targetAt p ⟨i, h⟩).val
      allValues fun value ↦ checkPair world
        (returnAddress (returnPrefixes.lookup q.val 0) i value)
        (commandWord world false .left
          (mainAddress (nodePrefixes.lookup q.val 0 + target) value))
        (commandWord world true .left
          (mainAddress (nodePrefixes.lookup q.val 0 + target) value))
    else false

noncomputable def rootCheck (world : World) (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) : Bool :=
  checkNode world q whole (embed whole offset sub fits sub.root)
    (TemplateGraph.mapNode (embed whole offset sub fits) (rootNode sub))

noncomputable def checkSub (world : World) (q : Fin 4042) (whole : Syntax 4042) (offset : Nat) :
    (sub : Syntax 4042) → offset + sub.size ≤ whole.size → Bool
  | .move d rest, fits => rootCheck world q whole offset (.move d rest) fits &&
      checkSub world q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .write t rest, fits => rootCheck world q whole offset (.write t rest) fits &&
      checkSub world q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .load t rest, fits => rootCheck world q whole offset (.load t rest) fits &&
      checkSub world q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .branch t yes no, fits => rootCheck world q whole offset (.branch t yes no) fits &&
      (checkSub world q whole offset yes (by simp only [Syntax.size] at fits; omega) &&
        checkSub world q whole (offset + yes.size) no
          (by simp only [Syntax.size] at fits; omega))
  | .go t, fits => rootCheck world q whole offset (.go t) fits
  | .halt, fits => rootCheck world q whole offset .halt fits
termination_by structural sub => sub

noncomputable def checkMain (world : World) (q : Fin 4042) (whole : Syntax 4042) : Bool :=
  checkSub world q whole 0 whole (by omega)

noncomputable def checkRecipe (world : World) (q : Fin 4042) (raw : RawOp) (nodes returns :
    Nat) : Bool :=
  let p := syntaxOf raw
  decide (erase (toTableOp (Snapshot.program q)) = raw) &&
    (decide (p.size = nodes) &&
      (decide (1 + FieldReturns.writeCount p = returns) &&
        (checkMain world q p && checkReturns world q p)))


theorem checkNode_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (p : Syntax 4042) (slot : Fin p.size)
    (node : BoolGraph.Node p.size 5 4042) :
    checkNode world q p slot node = DirectCheckPilot.checkNode q p slot node := by
  cases node <;>
    simp only [checkNode, DirectCheckPilot.checkNode, checkPair_eq world correct,
      commandWord_eq world correct, rowWord_eq world correct]
  all_goals rfl

theorem checkReturns_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (p : Syntax 4042) :
    checkReturns world q p = DirectCheckPilot.checkReturns q p := by
  simp only [checkReturns, DirectCheckPilot.checkReturns, checkPair_eq world correct,
    commandWord_eq world correct]
  all_goals rfl

theorem rootCheck_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) :
    rootCheck world q whole offset sub fits =
      StructuralCheckPilot.rootCheck q whole offset sub fits := by
  simp only [rootCheck, StructuralCheckPilot.rootCheck, checkNode_eq world correct]
  all_goals rfl

theorem checkSub_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) :
    checkSub world q whole offset sub fits =
      StructuralCheckPilot.checkSub q whole offset sub fits := by
  induction sub generalizing offset with
  | move d rest ih | write d rest ih | load d rest ih =>
    simp only [checkSub, StructuralCheckPilot.checkSub, rootCheck_eq world correct, ih]
  | branch t yes no ihYes ihNo =>
    simp only [checkSub, StructuralCheckPilot.checkSub, rootCheck_eq world correct, ihYes, ihNo]
  | go t | halt =>
    exact rootCheck_eq world correct q whole offset _ fits
  all_goals rfl

theorem checkMain_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (whole : Syntax 4042) :
    checkMain world q whole = StructuralCheckPilot.checkMain q whole := by
  exact checkSub_eq world correct q whole 0 whole _

theorem checkRecipe_eq (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat) :
    checkRecipe world q raw nodes returns = SourceRecipePilot.checkRecipe q raw nodes returns := by
  simp only [checkRecipe, SourceRecipePilot.checkRecipe, checkMain_eq world correct,
    checkReturns_eq world correct]
  all_goals rfl

noncomputable def fromRaw (world : World) (correct : world = actualWorld)
    (q : Fin 4042) (raw : RawLabelPilot.RawOp) (nodes returns : Nat)
    (checked : checkRecipe world q raw nodes returns = true) : SourceCertificate :=
  SourceRecipePilot.fromRaw q raw nodes returns
    ((checkRecipe_eq world correct q raw nodes returns).symm.trans checked)

end LookupWorldPilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Coefficient substitution preserves every original source obligation"
