#!/usr/bin/env python3
"""Remote-only recursive syntax certificate; removes repeated indexed getters."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler PrefixScanPilot NumericLocalPilot LocalRulePilot
namespace StructuralCheckPilot
set_option backward.isDefEq.respectTransparency false

theorem mapNode_comp {a b c k labels : Nat} (f : Fin a → Fin b) (g : Fin b → Fin c)
    (node : BoolGraph.Node a k labels) :
    TemplateGraph.mapNode g (TemplateGraph.mapNode f node) =
      TemplateGraph.mapNode (g ∘ f) node := by
  cases node <;> rfl

theorem mapNode_id {a k labels : Nat} (node : BoolGraph.Node a k labels) :
    TemplateGraph.mapNode id node = node := by
  cases node <;> rfl

def embed (whole : Syntax 4042) (offset : Nat) (sub : Syntax 4042)
    (fits : offset + sub.size ≤ whole.size) (i : Fin sub.size) : Fin whole.size :=
  ⟨offset + i.val, by have bound := i.isLt; omega⟩

-- Construct the root directly; nodeAt/root would reintroduce indexed traversal.
def rootNode : (sub : Syntax 4042) → BoolGraph.Node sub.size 5 4042
  | .move d rest => .move d rest.root.castSucc
  | .write t rest => .write t rest.root.castSucc
  | .load t rest => .load t rest.root.castSucc
  | .branch t yes no => .branch t (yes.root.castAdd no.size).castSucc
      (Fin.natAdd yes.size no.root).castSucc
  | .go t => .goto t
  | .halt => .halt

noncomputable def rootCheck (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size) : Bool :=
  DirectCheckPilot.checkNode q whole (embed whole offset sub fits sub.root)
    (TemplateGraph.mapNode (embed whole offset sub fits) (rootNode sub))

noncomputable def checkSub (q : Fin 4042) (whole : Syntax 4042) (offset : Nat) :
    (sub : Syntax 4042) → offset + sub.size ≤ whole.size → Bool
  | .move d rest, fits => rootCheck q whole offset (.move d rest) fits &&
      checkSub q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .write t rest, fits => rootCheck q whole offset (.write t rest) fits &&
      checkSub q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .load t rest, fits => rootCheck q whole offset (.load t rest) fits &&
      checkSub q whole offset rest (by simp only [Syntax.size] at fits; omega)
  | .branch t yes no, fits => rootCheck q whole offset (.branch t yes no) fits &&
      (checkSub q whole offset yes (by simp only [Syntax.size] at fits; omega) &&
        checkSub q whole (offset + yes.size) no
          (by simp only [Syntax.size] at fits; omega))
  | .go t, fits => rootCheck q whole offset (.go t) fits
  | .halt, fits => rootCheck q whole offset .halt fits
termination_by structural sub => sub

def SubRows (q : Fin 4042) (whole : Syntax 4042) (offset : Nat) (sub : Syntax 4042)
    (fits : offset + sub.size ≤ whole.size) : Prop :=
  ∀ (i : Fin sub.size) (bit : Bool) (value : Fin 5),
    rowWord (mainAddress (nodePrefixes.lookup q.val 0 + (embed whole offset sub fits i).val)
      value) bit =
        stepWord q whole (TemplateGraph.mapNode (embed whole offset sub fits)
          (sub.nodeAt i)) bit value

theorem rootCheck_sound (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size)
    (checked : rootCheck q whole offset sub fits = true) (bit : Bool) (value : Fin 5) :
    rowWord (mainAddress
      (nodePrefixes.lookup q.val 0 + (embed whole offset sub fits sub.root).val) value) bit =
        stepWord q whole (TemplateGraph.mapNode (embed whole offset sub fits)
          (rootNode sub)) bit value :=
  DirectCheckPilot.checkNode_sound q whole (embed whole offset sub fits sub.root)
    (TemplateGraph.mapNode (embed whole offset sub fits) (rootNode sub)) checked bit value

theorem checkSub_sound (q : Fin 4042) (whole : Syntax 4042) (offset : Nat)
    (sub : Syntax 4042) (fits : offset + sub.size ≤ whole.size)
    (checked : checkSub q whole offset sub fits = true) : SubRows q whole offset sub fits := by
  induction sub generalizing offset with
  | move d rest ih | write d rest ih | load d rest ih =>
    simp only [checkSub, Bool.and_eq_true] at checked
    intro i bit value
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · have word := rootCheck_sound q whole offset _ fits checked.1 bit value
      simpa only [rootNode, Syntax.nodeAt, Syntax.root, Fin.lastCases_last] using word
    · have word := ih offset _ checked.2 j bit value
      simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, mapNode_comp, Function.comp_def,
        embed, Fin.val_castSucc] using word
  | branch t yes no ihYes ihNo =>
    simp only [checkSub, Bool.and_eq_true] at checked
    intro i bit value
    refine Fin.lastCases ?_ (fun j ↦ ?_) i
    · have word := rootCheck_sound q whole offset _ fits checked.1 bit value
      simpa only [rootNode, Syntax.nodeAt, Syntax.root, Fin.lastCases_last] using word
    · induction j using Fin.addCases with
      | left j =>
        have word := ihYes offset _ checked.2.1 j bit value
        simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_left,
          mapNode_comp, Function.comp_def, embed, Fin.val_castSucc, Fin.val_castAdd] using word
      | right j =>
        have word := ihNo (offset + yes.size) _ checked.2.2 j bit value
        simpa only [Syntax.nodeAt, Fin.lastCases_castSucc, Fin.addCases_right,
          mapNode_comp, Function.comp_def, embed, Fin.val_castSucc, Fin.val_natAdd,
          Nat.add_assoc] using word
  | go t | halt =>
    intro i bit value
    have zeroIndex : i = 0 := Subsingleton.elim _ _
    subst i
    have word := rootCheck_sound q whole offset _ fits checked bit value
    simpa only [Syntax.nodeAt, Syntax.root, rootNode] using word

noncomputable def checkMain (q : Fin 4042) (whole : Syntax 4042) : Bool :=
  checkSub q whole 0 whole (by omega)

theorem checkMain_sound (q : Fin 4042) (whole : Syntax 4042)
    (checked : checkMain q whole = true) : Coherent q whole := by
  have rows := checkSub_sound q whole 0 whole (by omega) checked
  intro slot bit value
  have word := rows slot bit value
  simpa only [embed, Nat.zero_add, mapNode_id, Syntax.fastNodeAt_eq] using word

end StructuralCheckPilot
'''


def generate(driver, header, audit_and_end, module):
    names = ['mapNode_comp', 'mapNode_id', 'embed', 'rootNode', 'rootCheck',
             'checkSub', 'SubRows', 'rootCheck_sound', 'checkSub_sound',
             'checkMain', 'checkMain_sound']
    driver.emit('StructuralChecks.lean', header([module + '.DirectChecks']) + SOURCE +
                audit_and_end(driver, 'StructuralChecks',
                    ['StructuralCheckPilot.' + name for name in names],
                    'Structural syntax traversal covers every original slot'))
