import Cryptids.Compilation.Binary
open Turing ConjectureMachines ConjectureMachines.Compilation
example {q : Nat} [NeZero q] (M : TM0.Machine Bool (Fin q)) (input : List Bool) :
    (StateTransition.eval (step (Binary.compile M))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval M input).Dom :=
  Binary.compile_halts_input M input
