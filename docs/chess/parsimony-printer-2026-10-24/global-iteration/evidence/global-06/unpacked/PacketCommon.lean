import GlobalInstance

open Turing ConjectureMachines
open ConjectureMachines.Compilation
namespace ParsimonyComposed

def numeric (input : Array Nat) : List Nat := input.toList.map (fun value ↦ value % 8192)

theorem numeric_eq (input : Array Nat) :
    numeric input = (input.map narrow).toList.map Fin.val := by
  simp [numeric, narrow, List.map_map]

@[simp] theorem numeric_append (first second : Array Nat) :
    numeric (first ++ second) = numeric first ++ numeric second := by
  simp [numeric]

def zeroChar : Char := '0'
def oneChar : Char := '1'

def marker : List Char :=
  [oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar,
    oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar,
    oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar, oneChar,
    oneChar, oneChar, zeroChar]

def tailPadding : List Char :=
  [oneChar, zeroChar, zeroChar, zeroChar, zeroChar, zeroChar]


end ParsimonyComposed
#print axioms ParsimonyComposed.numeric_eq
