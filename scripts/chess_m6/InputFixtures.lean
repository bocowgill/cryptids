import Cryptids.Chess.Compilation.Input

namespace InputFixtures
open Turing PartrecToTM2 K' ConjectureMachines ConjectureMachines.Compilation
open Chess.Compilation Input

def small (values : List Γ') : List Bool :=
  blockInput CodeBackend.blockCode (TM2to1.trInit main values)

example : (small []).length = 11 := encoded_length []
example : (small [Γ'.consₗ]).length = 11 := encoded_length [Γ'.consₗ]
example : (small [Γ'.cons, Γ'.bit1]).length = 22 := encoded_length [Γ'.cons, Γ'.bit1]

/-- A trailing zero word is still paid: it adds one stack symbol and eleven input bits. -/
theorem extra_word_detected :
    (small (Input.stack ++ [Γ'.cons])).length = 1555191 := by
  rw [small, encoded_length, List.length_append, stack_length]
  decide

theorem extra_word_wrong_count : (small (Input.stack ++ [Γ'.cons])).length ≠ 1555180 := by
  rw [extra_word_detected]
  decide

def withoutArgument : List Γ' :=
  trList [SourceModel.dag.root] ++ trList (RuntimeWire.flatTriples Tape.table.rows) ++ [Γ'.consₗ]

/-- Removing the packed argument cannot satisfy the complete input length certificate. -/
theorem omitted_argument_detected : withoutArgument.length = 141057 := by
  simp only [withoutArgument, List.length_append, root_symbols, table_symbols,
    List.length_singleton]

theorem omitted_argument_wrong_count : withoutArgument ≠ Input.stack := by
  intro same
  have sizes : (141057 : Nat) = 141380 :=
    omitted_argument_detected.symm.trans ((congrArg List.length same).trans stack_length)
  exact (by decide : (141057 : Nat) ≠ 141380) sizes

theorem extra_bit_detected : (bits.push (0 : Fin 2)).size = 1555181 := by
  rw [Array.size_push, bits_size]

theorem no_extra_bottom_block : binary.length ≠ 11 * (Input.stack.length + 1) := by
  rw [binary_length, stack_length]
  decide

example : bits.toList.map Compilation.Binary.decodeSymbol = binary := decode_bits
example : Input.stack = RuntimeWire.input SourceModel.dag
    [Control.gameWord Chess.Adjudication.Game.initial] := stack_eq_game

-- Actual encoding observations retain zeros and show the main-stack reversal and bottom flag.
#eval (small [], small [Γ'.consₗ], small [Γ'.cons, Γ'.bit1])
#eval IO.println "Chess input fixtures passed: exact counts and four mutation controls"

#print axioms extra_word_detected
#print axioms omitted_argument_wrong_count
#print axioms extra_bit_detected
#print axioms no_extra_bottom_block

end InputFixtures
