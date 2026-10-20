# Runtime opcode boundaries

`Cryptids/Compilation/RuntimeEval.lean` proves positive reachability of the seven evaluation
opcode paths of the fixed `Runtime.machine`. It imports the verified runtime data macros and
does not depend on the VM wire representation, table decoding, or Code evaluation semantics.

All public theorems are in `ConjectureMachines.Compilation.Runtime`. Their common initial
configuration is

```lean
dataCfg opcode store values table (trList [left, right] ++ olderFrames)
```

Here `dataCfg` puts `trList values` on main, `trList table` on aux, an empty reverse scratch
stack on rev, and the displayed symbols on stack. The values and table are arbitrary natural
lists, including empty lists. Both child numbers and the initial local store are arbitrary.
Older frames are arbitrary symbol lists and need no framing or well-formedness assumption.

Each theorem supplies `∃ outStore, Reaches₁ (TM2.step machine) initial final`. The exact
final configurations are:

| Theorem | Final phase | Final values | Final frames |
| --- | --- | --- | --- |
| `zero_reaches` | returned | `0 :: values` | olderFrames |
| `successor_reaches` | returned | `[values.headI + 1]` | olderFrames |
| `tail_reaches` | returned | `values.tail` | olderFrames |
| `cons_reaches` | evaluate | `left :: values` | `trList [1] ++ trList values ++ consₗ :: (trList [right] ++ olderFrames)` |
| `comp_reaches` | evaluate | `right :: values` | `trList [3, left] ++ olderFrames` |
| `branch_zero_reaches` | evaluate | `left :: values.tail` | olderFrames |
| `branch_succ_reaches` | evaluate | `right :: (values.headI - 1) :: values.tail` | olderFrames |
| `fix_reaches` | evaluate | `left :: values` | `trList [4, left] ++ olderFrames` |

The branch corollaries assume respectively `values.headI = 0` and `values.headI ≠ 0`.
`branch_reaches` combines them with an explicit conditional on the final value list.
`headI` defaults to zero, so an empty branch input takes the zero case. A zero head is
removed; a positive head is decremented and retained. Successor discards every later value.

Every final configuration has exactly the original `trList table` on aux and empty rev.
In cons, comp, the zero branch, and fix, the temporary left-child prefix is removed from aux
before the boundary. Word transfer and copying identify the actual first cons delimiter using
`trNat_natEnd`; they do not scan or modify older frame symbols. The positive path includes
the initial phase dispatch but stops before executing the final evaluate/returned phase.

The existential store avoids imposing an integration dependency on irrelevant scratch data.
The proofs choose `some cons` for zero; `none` for successor, cons, comp, branch and fix;
and `none` for empty tail or `some cons` for nonempty tail.

The focused strict build passes. Eighteen concrete actual-TM2 fixtures check every opcode,
empty lists, zero child words, binary successor carry and predecessor borrow, full table
restoration, input frame copying, and arbitrary older symbols. All runs reach their exact
boundaries in 5–58 positive transitions; their aggregate success is also kernel-checked by
ordinary `decide`. Nine public theorem closures use only `propext`,
`Classical.choice`, and `Quot.sound`; source scans report no suspicious proof/runtime patterns.
Evidence is retained in `.unlazy/chess-m6/leaf-1.22/`.

These are raw opcode boundaries. Startup, row lookup, return-frame interpretation, the full
VM simulation, artifact emission, and M6 integration remain separate obligations.
