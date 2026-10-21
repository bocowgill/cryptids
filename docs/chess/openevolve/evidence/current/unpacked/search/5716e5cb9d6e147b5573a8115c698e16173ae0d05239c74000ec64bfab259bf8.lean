import Cryptids.Optimisation.TerminalBinary
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation
example {q : Nat} [NeZero q] (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (terminal : ∀ b, M h b = none) (input : List Bool) :
    (StateTransition.eval (step (TerminalBinary.compile h M))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval M input).Dom :=
  TerminalBinary.halts_input h M terminal input
