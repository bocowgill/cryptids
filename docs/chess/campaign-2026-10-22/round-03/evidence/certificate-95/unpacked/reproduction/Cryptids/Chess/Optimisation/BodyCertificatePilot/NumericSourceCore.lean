module
public import Cryptids.Chess.Optimisation.BodyCertificatePilot.NumericControl
public import Mathlib.Data.List.GetD

@[expose] public section
namespace Chess.Optimisation.BodyCertificatePilot
open Turing ConjectureMachines ConjectureMachines.Compilation
set_option maxRecDepth 1000000
set_option Elab.async false
set_option compiler.extract_closed false
open ConjectureMachines.Compilation
open FieldCompiler NumericTreePilot
open NumericControlPilot (Observation Layout)
namespace NumericSourceCorePilot
set_option backward.isDefEq.respectTransparency false

def canonicalLayout (layout : Layout) (p : Syntax 4042) : Layout :=
  { layout with targets := paidTargets (encode 0 p) }

def typedStep (observation : Observation) (layout : Layout) (p : Syntax 4042)
    (node : BoolGraph.Node p.size 5 4042) (bit : Bool) (value : Fin 5) : Nat :=
  match node with
  | .move dir child => observation.command bit dir (layout.main child.val value)
  | .write table child =>
      match FieldReturns.findTarget p child with
      | none => 0
      | some rank => observation.command (table.read bit value) .right
          (layout.returned rank.val value)
  | .load table child => NumericControlPilot.rowWord observation
      (layout.main child.val (table.read bit value)) bit
  | .branch table yes no =>
      if table.read bit value then
        NumericControlPilot.rowWord observation (layout.main yes.val value) bit
      else NumericControlPilot.rowWord observation (layout.main no.val value) bit
  | .goto table => observation.command bit .right (layout.entry (table.read bit value) value)
  | .halt => observation.command bit .right layout.halt

theorem step_erase (observation : Observation) (layout : Layout) (p : Syntax 4042)
    (node : BoolGraph.Node p.size 5 4042) (bit : Bool) (value : Fin 5) :
    NumericControlPilot.step observation (canonicalLayout layout p) (eraseNode node) bit value =
      typedStep observation layout p node bit value := by
  cases node with
  | move dir child | load dir child | branch dir child other | goto dir | halt => rfl
  | write table child =>
    cases found : FieldReturns.findTarget p child <;>
      simp only [NumericControlPilot.step, typedStep, canonicalLayout, eraseNode,
        NumericControlPilot.rankOf_paid, found, Option.map_none, Option.map_some]

theorem erase_castSucc {n : Nat} (node : BoolGraph.Node n 5 4042) :
    eraseNode (TemplateGraph.mapNode Fin.castSucc node) = eraseNode node := by
  cases node <;> rfl

theorem erase_left {a b : Nat} (node : BoolGraph.Node a 5 4042) :
    eraseNode (TemplateGraph.mapNode (fun i ↦ (i.castAdd b).castSucc) node) =
      eraseNode node := by
  cases node <;> rfl

theorem erase_right {a b : Nat} (node : BoolGraph.Node b 5 4042) :
    eraseNode (TemplateGraph.mapNode (fun i ↦ (Fin.natAdd a i).castSucc) node) =
      mapChild (fun n ↦ a + n) (eraseNode node) := by
  cases node <;> rfl

theorem mapChild_add (offset amount : Nat) (node : Node) :
    mapChild (fun n ↦ offset + n) (mapChild (fun n ↦ amount + n) node) =
      mapChild (fun n ↦ offset + amount + n) node := by
  cases node <;> simp only [mapChild, Nat.add_assoc]

def SubRows (observation : Observation) (layout : Layout) (offset : Nat)
    (p : Syntax 4042) : Prop :=
  ∀ (i : Fin p.size) (bit : Bool) (value : Fin 5),
    NumericControlPilot.rowWord observation (layout.main (offset + i.val) value) bit =
      NumericControlPilot.step observation layout
        (mapChild (fun n ↦ offset + n) (eraseNode (p.nodeAt i))) bit value

theorem reference_sound (observation : Observation) (layout : Layout) (offset : Nat)
    (p : Syntax 4042) (checked : NumericControlPilot.TraceRows observation layout
      (reference offset p)) : SubRows observation layout offset p := by
  induction p generalizing offset with
  | move dir rest ih | write dir rest ih | load dir rest ih =>
    simp only [reference, NumericControlPilot.TraceRows] at checked
    intro i bit value
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · have word := checked.1 bit value
      simpa only [Syntax.nodeAt, Fin.lastCases_last, Fin.val_last, rootNode,
        eraseNode, mapChild, Fin.val_castSucc] using word
    · have word := ih offset checked.2 j bit value
      simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, erase_castSucc,
        Fin.val_castSucc] using word
  | branch table yes no ihYes ihNo =>
    simp only [reference, NumericControlPilot.TraceRows] at checked
    intro i bit value
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · have word := checked.1 bit value
      simpa only [Syntax.nodeAt, Fin.lastCases_last, Fin.val_last, rootNode,
        eraseNode, mapChild, Fin.val_castSucc, Fin.val_castAdd, Fin.val_natAdd,
        Nat.add_assoc] using word
    · induction j using Fin.addCases with
      | left j =>
        have word := ihYes offset checked.2.1 j bit value
        simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_left,
          erase_left, Fin.val_castSucc, Fin.val_castAdd] using word
      | right j =>
        have word := ihNo (offset + yes.size) checked.2.2 j bit value
        simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_right,
          erase_right, mapChild_add, Fin.val_castSucc, Fin.val_natAdd, Nat.add_assoc] using word
  | go table =>
    intro i bit value
    have zero : i.val = 0 := by
      have bound := i.isLt
      simp only [Syntax.size] at bound
      omega
    simpa only [Syntax.nodeAt, eraseNode, mapChild, zero, Nat.add_zero] using checked bit value
  | halt =>
    intro i bit value
    have zero : i.val = 0 := by
      have bound := i.isLt
      simp only [Syntax.size] at bound
      omega
    simpa only [Syntax.nodeAt, eraseNode, mapChild, zero, Nat.add_zero] using checked bit value

def Coherent (observation : Observation) (layout : Layout) (p : Syntax 4042) : Prop :=
  ∀ (slot : Fin p.size) (bit : Bool) (value : Fin 5),
    NumericControlPilot.rowWord observation (layout.main slot.val value) bit =
      typedStep observation layout p (p.nodeAt slot) bit value

theorem checkMain_sound (observation : Observation) (layout : Layout) (p : Syntax 4042)
    (checked : NumericControlPilot.checkTrace observation (canonicalLayout layout p)
      (encode 0 p).trace = true) : Coherent observation layout p := by
  have rows := NumericControlPilot.checkTrace_sound observation (canonicalLayout layout p)
    (encode 0 p).trace checked
  rewrite [encode_trace] at rows
  have covered := reference_sound observation (canonicalLayout layout p) 0 p rows
  intro slot bit value
  have word := covered slot bit value
  simp only [Nat.zero_add] at word
  change NumericControlPilot.rowWord observation (layout.main slot.val value) bit =
    NumericControlPilot.step observation (canonicalLayout layout p)
      (mapChild id (eraseNode (p.nodeAt slot))) bit value at word
  rewrite [mapChild_id] at word
  exact word.trans (step_erase observation layout p (p.nodeAt slot) bit value)

theorem getD_values {n : Nat} (values : List (Fin n)) (rank : Fin values.length) :
    (values.map Fin.val).getD rank.val 0 = (values.get rank).val := by
  rewrite [List.getD_eq_getElem (values.map Fin.val) 0
    (by simpa only [List.length_map] using rank.isLt)]
  simp only [List.getElem_map, List.get_eq_getElem]

theorem paid_getD (p : Syntax 4042) (rank : Fin (1 + FieldReturns.writeCount p)) :
    (paidTargets (encode 0 p)).getD rank.val 0 = (FieldReturns.targetAt p rank).val := by
  simpa only [paidTargets_correct, Nat.zero_add, FieldReturns.targetAt, Fin.val_cast] using
    getD_values (FieldReturns.targets p) (rank.cast (FieldReturns.targets_length p).symm)

def ReturnCoherent (observation : Observation) (layout : Layout) (p : Syntax 4042) : Prop :=
  ∀ (rank : Fin (1 + FieldReturns.writeCount p)) (bit : Bool) (value : Fin 5),
    NumericControlPilot.rowWord observation (layout.returned rank.val value) bit =
      observation.command bit .left (layout.main (FieldReturns.targetAt p rank).val value)

theorem checkReturns_sound (observation : Observation) (layout : Layout) (p : Syntax 4042)
    (checked : NumericControlPilot.checkReturns observation (canonicalLayout layout p) = true) :
    ReturnCoherent observation layout p := by
  intro rank bit value
  have rows := NumericControlPilot.checkReturns_sound observation (canonicalLayout layout p) checked
  have bound : rank.val < (canonicalLayout layout p).targets.length := by
    simpa only [canonicalLayout, paidTargets_length] using rank.isLt
  have word := rows rank.val bound bit value
  simpa only [canonicalLayout, paid_getD] using word

theorem halt_paid_target :
    (paidTargets (encode 0 (.halt : Syntax 4042))).getD 0 999 = 0 := rfl

theorem wrong_halt_target_rejected :
    decide ((paidTargets (encode 0 (.halt : Syntax 4042))).getD 0 999 = 1) = false := by
  decide +kernel

end NumericSourceCorePilot

end Chess.Optimisation.BodyCertificatePilot
run_cmd Lean.logInfo "Numeric trace and return checks cover every original typed source slot"
