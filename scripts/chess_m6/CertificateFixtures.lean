/-
Copyright 2026 The Cryptids Authors.
Released under Apache 2.0 license as described in the file LICENSE.
-/
import Cryptids.Compilation.LocalCertificate

open ConjectureMachines Turing
open ConjectureMachines.Compilation.LocalCertificate
namespace CertificateFixtures

def source : Machine 1 2 := ⟨fun _ bit ↦ some (bit, .right, 0)⟩
def duplicate : Machine 2 2 := ⟨fun _ bit ↦ some (bit, .right, 1)⟩
def collapse : Fin 2 → Fin 1 := fun _ ↦ 0

example : Rows duplicate source collapse := by intro state bit; rfl
example : Halts duplicate ↔ Halts source :=
  halts_iff duplicate source collapse (by intro state bit; rfl) rfl

def falseHalt : Machine 2 2 := ⟨fun state bit ↦
  if state = 1 then none else some (bit, .right, 1)⟩
example : ¬ Rows falseHalt source collapse := by
  intro certificate
  have row := certificate 1 0
  simp [falseHalt, source] at row

def wrongWrite : Machine 2 2 := ⟨fun _ _ ↦ some (1, .right, 1)⟩
example : ¬ Rows wrongWrite source collapse := by
  intro certificate
  have row := certificate 0 0
  simp [wrongWrite, source] at row

def postSource : TM0.Machine Bool Unit := fun _ bit ↦ some ((), .write (!bit))
def postDuplicate : TM0.Machine Bool (Fin 2) := fun _ bit ↦ some (1, .write (!bit))
def postDecode : Fin 2 → Unit := fun _ ↦ ()
example : PostRows postDuplicate postSource postDecode := by intro state bit; rfl
example (input : List Bool) :
    (TM0.eval postDuplicate input).Dom ↔ (TM0.eval postSource input).Dom :=
  post_halts_iff _ _ postDecode (by intro state bit; rfl) rfl input

def postFalseHalt : TM0.Machine Bool (Fin 2) := fun state bit ↦
  if state = 1 then none else some (1, .write (!bit))
example : ¬ PostRows postFalseHalt postSource postDecode := by
  intro certificate
  have row := certificate 1 false
  simp [postFalseHalt, postSource] at row

def postWrongCommand : TM0.Machine Bool (Fin 2) := fun _ _ ↦ some (1, .move .left)
example : ¬ PostRows postWrongCommand postSource postDecode := by
  intro certificate
  have row := certificate 0 false
  simp [postWrongCommand, postSource] at row

end CertificateFixtures
#eval IO.println "Local certificate fixtures passed: 8 kernel assertions"
