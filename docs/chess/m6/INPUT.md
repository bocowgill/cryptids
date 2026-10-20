# Complete paid chess input

`Chess.Compilation.Input` defines the actual input at all three encoding stages:

```lean
stack := Tape.input
binary := blockInput CodeBackend.blockCode (TM2to1.trInit main stack)
bits := (binary.map Compilation.Binary.encodeSymbol).toArray
```

The complete kernel-checked costs are:

| Component | Exact size |
| --- | ---: |
| Root word | 14 stack symbols |
| All 5,952 program rows | 141,042 stack symbols |
| Saved-value separator | 1 stack symbol |
| Packed standard initial game | 323 stack symbols |
| `stack.length` | **141,380** |
| `binary.length` and `bits.size` | **1,555,180** |
| Paid initializer prefix, `2 * bits.size` | **3,110,360 states** |

`stack_eq_raw` proves the exact order of the root, every row triple, separator and argument.
`stack_eq_game` links the counted packed literal to the actual encoded standard initial game
using the frozen `Tape.argument_eq` theorem. The table is the sealed literal SourceModel DAG,
whose exact equality with the complete source is proved in SourceCertificate.

The table count is derived from the actual literal row blocks. Each of 186 existing 32-row
chunks receives an ordinary kernel-checked equality for the length of its actual `trList`
encoding. The shared append tree combines those into 371 named count theorems. A separate
bounded elaborator proposes the small numerical counts; `Lean.addDecl` checks every proof
synchronously. Its arithmetic helper never appears in a mathematical dependency closure.
The packed argument and root counts also use ordinary kernel reduction.

`encoded_length` proves the generic formula `11 * max 1 values.length`. Empty stack input
needs one bottom-marker block; nonempty input reuses its first tape cell for that marker.
Thus the actual input pays exactly eleven bits per stack symbol. Array construction preserves
the full list length, including zeros. `block_roundtrip`, `decode_bits`, and `bits_unique`
establish the exact codec and uniqueness of the complete written binary-symbol array.
No million-bit literal source expansion or global backend reduction is required.

For every binary body, `initialise_states` proves the actual `FlatInit.initialise` construction
has `body.states + 3110360` states. `initialise_run` proves that after exactly 3,110,360 steps
from blank tape it enters that body with the full `bits` array written and the head restored.

The strict focused build passes. Actual encoding fixtures check empty, singleton and two-symbol
inputs and execute the complete input construction, observing
`(141380, 1555180, 1555180, 3110360)`. Kernel mutation proofs detect an omitted packed argument,
an extra zero word, an extra binary bit and an incorrectly added bottom-marker block.
A full audit covers 402 safe declarations and 5,513 dependency declarations, allowing only
`propext`, `Classical.choice` and `Quot.sound`. Sixteen meta generator declarations are separately
inventoried and absent from that closure. Audit controls reject both a forbidden axiom and a
generator dependency.

Evidence, commands, resource measurements and hashes are in `.unlazy/chess-m6/leaf-1.30/`.
The final binary body size and public transition-matrix certificate are separate obligations.
