# Four-stack macros with custom return dispatch

`Cryptids/Compilation/RuntimeMacros.lean` defines reusable macros and proofs in
`ConjectureMachines.Compilation.RuntimeMacros`. It uses exactly Mathlib's `PartrecToTM2.Γ'`,
`K'`, `Λ'`, `Stmt'`, `Cfg'`, and binary encodings; no stack or symbol type is added.

The non-return proofs are adapted, with attribution, from Mario Carneiro's Apache-licensed
`Mathlib/Computability/TuringMachine/ToPartrec.lean`. Their arithmetic and separator invariants
are retained. The change is the machine parameter and the controlled transfer of each step.

## Machine contract and stopping boundary

```
NonRet (.ret _) = False
NonRet any_other_label = True

Agrees (M : Λ' → Stmt') :=
  ∀ label, NonRet label → M label = PartrecToTM2.tr label
```

Every correctness theorem takes `hM : Agrees M` explicitly and proves positive reachability
`StateTransition.Reaches₁ (TM2.step M)`. `M` may replace every return instruction, including
the instructions that dispatch the runtime VM phases. `step_of_tr` transfers one transition
only after proving its source label is non-return. The ported proofs compose those steps and
stop on entry to the terminal label supplied by the caller. They require no instruction
agreement at that terminal return label and take no transition out of it.

This is an entry-to-entry reachability guarantee. It does not assert that the terminal label
halts, and the terminal's VM action remains the caller's responsibility.

## Generalized Mathlib operations

| Theorem | Exact operation and interface |
| --- | --- |
| `move_ok` | Split source using `splitAtPred p`, consume the stopping symbol into local store, reverse-prefix preceding symbols to a distinct destination. |
| `unrev_ok` | Reverse-move all of `rev` to `main`, leaving `rev` empty and local store `none`. |
| `move₂_ok` | Order-preserving move through initially empty `rev`; restore the stopping symbol on the source. Source/destination are distinct and neither is `rev`. |
| `clear_ok` | Delete preceding symbols and consume the stopping symbol into local store. |
| `copy_ok` | Mathlib's canonical four-stack reverse-copy from `rev` to both `main` and `stack`. |
| `copy_all_ok` | The same reverse-copy for an arbitrary stack function, with explicit updates and all other fields preserved. |
| `head_main_ok` | On complete encoded value list `L`, produce `[L.headI]`, including `[0]` for empty `L`. |
| `head_stack_ok` | Pop one list frame delimited by `consₗ`, prefix its defaulted head value to main, and preserve the arbitrary following frame suffix. |
| `succ_ok` | Increment a singleton encoded natural on main; preserve arbitrary auxiliary and stack contents. |
| `pred_ok` | Empty/zero input selects the first terminal and drops the defaulted head; positive input selects the second terminal with the predecessor, retaining the encoded remaining values. |
| `push_ok` | Push one constant symbol, retaining local store and every other stack. |

`splitAtPred p` stops at the first symbol for which `p` is true. `natEnd` recognizes `cons`
or `consₗ`; `trNat n` contains neither. These facts, rather than any interpretation of zero as
an end marker, justify the word transfers below.

## Binary-word and value copying

`moveWord src dst next` is exactly

```
.move natEnd src rev
  (.push dst (fun _ => some .cons) (.move (fun _ => false) rev dst next))
```

`moveWord_ok` assumes `src ≠ rev`, `dst ≠ rev`, `src ≠ dst`, `S rev = []`, and
`S src = trNat n ++ cons :: suffix`. Its final stack function is exactly

```
update (update S src suffix) dst (trList [n] ++ S dst)
```

Thus the source delimiter is removed, one exact natural-word encoding is prefixed to the
destination, `rev` is restored, and the source's arbitrary raw suffix is preserved. The final
local store is `none`. Zero is covered: its bit string is empty, but its `cons` is consumed.

`copyWord src next` is exactly

```
.move natEnd src rev
  (.push main (fun _ => some .cons)
    (.push stack (fun _ => some .cons) (.copy next)))
```

`copyWord_ok` requires only `src ≠ rev`, initially empty `rev`, and the same encoded source word.
Let `B = update S src suffix`, the state after removing the source word and delimiter. The exact
final stack function is

```
update (update B main (trList [n] ++ B main))
  stack (trList [n] ++ B stack)
```

This accounts for `src = main` and `src = stack`: the original source prefix is removed before
either destination is prefixed, so the source word is restored once rather than duplicated on
its own stack. Other source/destination suffixes and auxiliary contents remain exact. Local
store ends `none`, and `rev` ends empty.

`copyValues next = .move (fun _ => false) main rev (.copy next)`.
With `S rev = []`, `copyValues_ok` returns exactly
`update S stack (S main ++ S stack)`, with local store `none`. This stronger symbol-level theorem
needs no encoding or delimiter premise on main: in particular, a complete `trList values` is
preserved and prefixed intact before any existing raw stack suffix.

## Verification

The focused `lake --wfail build Cryptids.Compilation.RuntimeMacros` passes without warnings.
All 15 theorem closures use only standard axioms. LSP checks of the word transfer/copy proofs
report standard trust, no nonstandard axioms, and no suspicious source patterns.

The evidence directory `.unlazy/chess-m6/leaf-1.18/` contains 14 actual `TM2.step` execution
fixtures. They cover zero and multi-bit words, arbitrary suffix symbols, both copy aliases,
whole value-list copying, delimiter restoration, heads, successor carry and predecessor borrow.
Every fixture reaches its exact terminal with positive step count and all four stacks/local
store equal to expectation. Their machine deliberately pushes a bit when a return label is
executed; a separate kernel-checked control confirms this mutation, while the macro runs stop
before it. Two concrete positive-reachability examples instantiate the general word theorems.

The exact fixture and axiom sources, logs, standard-trust scan output, four-pass ledger, and
SHA-256 hashes are retained there. The main module does not depend on the root's evolving
`Runtime.lean`; its macros are definitionally the specified label syntax for direct reuse.

These results establish the stack operations. Runtime VM phase correctness, row lookup, finite
support, binary emission, exact chess table identity, and the final M6 gates remain separate work.
