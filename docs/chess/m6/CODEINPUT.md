# Explicit finite input for the Code backend

`Cryptids/Compilation/CodeInput.lean` compiles an arbitrary `ToPartrec.Code` on arbitrary finite
`List Nat` input. Its API is in `ConjectureMachines.Compilation.CodeBackend`:

```lean
postWithInput : Turing.ToPartrec.Code → List Nat → NumberedPost
postWithInput_halts (c) (v) : (postWithInput c v).Halts ↔ (c.eval v).Dom
generatedWithInput : Turing.ToPartrec.Code → List Nat → BundledMachine 2
generatedWithInput_halts (c) (v) :
  (generatedWithInput c v).Halts ↔ (c.eval v).Dom
```

The numbered machine and its state count are definitionally those of `CodeBackend.post c`.
`postWithInput_machine`, `postWithInput_extraStates`, and `body_postWithInput` expose this fact.
The input changes only the finite starting tape and the counted blank initializer. Empty input
recovers the existing `post` and `generated` definitions exactly.

## Actual input and simulation

`inputBits v` first uses Mathlib's binary `PartrecToTM2.trList` representation of natural-number
lists, then `TM2to1.trInit main` to place it on the main stack with the bottom marker, then the
proved 11-bit `CodeBackend.blockCode` alphabet encoding. Zero words remain explicit separator
symbols; a list containing zero is distinguishable from an empty list. Large naturals use binary
digits and are not represented by successor nodes in a source `Code` expression.

The new generic theorem `ConjectureMachines.Compilation.fastStack_halts_input` extends the
existing M5 compiler proof to arbitrary finite source-stack input. It composes the same hash
numbering, memoized program, binary block, numeric shared-control, normalization, and stack
simulations on the actual supplied tape. `postWithInput_halts` then identifies the resulting
initial stack configuration with `PartrecToTM2.init c v` and applies Mathlib's actual interpreter
theorem `tr_eval c v`. No source evaluator or input decoder is assumed as an oracle.

`generatedWithInput_halts` composes that proof with the existing write-and-move binary compiler
and verified blank initializer. `generatedWithInput_reaches` explicitly proves that starting in
state zero on the all-zero tape reaches the embedded body with exactly the encoded input and the
head at its first cell. The source data is constructed by finite control and paid for in states.

## Complete state accounting

For every `v`, `inputBits_length` proves:

```text
input bits = 11 * max 1 (PartrecToTM2.trList v).length
```

The maximum accounts for the bottom-marker block on empty input. Each nonempty natural-number
list uses one stack symbol for every binary digit and one separator for every list element.
`generatedWithInput_states` proves:

```text
binary states = 2 * ((post c).extraStates + 1) + 2 * (inputBits v).length
              = 2 * (numbered Post states) + 22 * max 1 (encoded stack symbols)
```

The body includes the binary compiler's main and bounce states. The initializer includes every
write and every return move. No input tape or input-dependent body states are free.

For the current independently verified encoding of the standard initial chess game, the focused
fixture measures 72 natural-number words, 182 interpreter stack symbols, and 2,002 input bits.
Writing this input adds exactly 4,004 initializer states. This measures only initial-game data;
it does not measure a complete chess program, serialized interpreter instructions, or its final
machine state count.

## Verification and remaining boundary

`zero_haltsWithInput` and `spin_not_haltsWithInput` give kernel-certified halting and divergence
examples for every input, including repeated zeros. The local leaf checks include nonempty
source-code fixtures, a 257-bit natural number, initial-game data round trip and cost accounting,
and execution of the blank writer with exact prefix and preserved blank surroundings. They do
not expand the full compiled control during these checks.

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.CodeInput
python3 .unlazy/chess-m6/leaf-1.16/verify.py
```

The local verification script includes a transitive audit of every declaration owned by the new
module, permits only standard axioms, and requires rejection of a `sorryAx` control. Root M6
verification must incorporate these checks into its durable scripts. Actual chess-program
refinement, program-data serialization if adopted, exact literal-table identity, and full
artifact emission remain integration obligations.
