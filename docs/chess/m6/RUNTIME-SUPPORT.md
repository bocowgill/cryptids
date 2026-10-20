# Fixed runtime finite support

`Cryptids/Compilation/RuntimeSupport.lean` proves that the concrete ordered
`Runtime.labels` list supports the actual `Runtime.machine`, including its overridden
return dispatch. The exported theorem is:

```lean
RuntimeSupport.supports :
  letI : Inhabited PartrecToTM2.Λ' := ⟨Runtime.label .start⟩
  TM2.Supports Runtime.machine Runtime.labels.toFinset
```

The startup default is local to this theorem. It does not change Mathlib's global
instance. `TM2.Supports` states that the default label belongs to the finite set and
that every instruction at a listed label jumps only to that set. The support may
include duplicate or unreachable candidates; no minimality claim is made.

## Proof structure

`trStmtsList_closed` proves closure of the ordered macro-descendant traversal. It uses
the proved equality between `CodeBackend.trStmtsList` and Mathlib's `trStmts₁` finset,
then Mathlib's descendant-transitivity theorem. This includes the synthetic `unrev`
labels inserted by successor and predecessor macros.

`nonreturn_supports` checks every non-return constructor against the actual
`Runtime.machine`. The primitive instructions agree with Mathlib's stack macros, and
each possible jump is a listed descendant. A store read ranges over all five possible
store values, not just a selected execution branch.

`ReturnLeaves` is a proof-only structural predicate. `entry_returnLeaves` checks each
of the twenty concrete phase bodies, including both conditional branches and all store
reads. `entry_return_label` proves that every return leaf is exactly `Runtime.label`
of a declared phase. The continuation syntax encodes only these fixed phase numbers;
it carries no source Code payload.

`label_mem`, `descendant_mem`, and `entry_mem` show that every phase root and each
body's macro descendants belong to the actual ordered list. `return_supports` examines
the overridden return instruction itself. It either halts at the halt phase or jumps
to an included phase body. It also covers malformed continuation syntax and numbers
outside the phase range, since `codePhase` selects the declared invalid phase.
`label_supports` combines these facts for every listed label, and `supports` adds
the startup default membership. No abstract support assumption or rule oracle occurs.

## Exact source count and resource scope

`labels_length` proves in the Lean kernel that:

```lean
Runtime.labels.length = 344
```

This is the ordered candidate count with duplicates retained. It is neither the number
of distinct macro labels nor a Post-machine or binary-machine state count. The per-phase
candidate counts, each including its phase root, are:

| Phase | Candidates | Phase | Candidates |
|---|---:|---|---:|
| start | 13 | evaluate | 3 |
| lookup | 14 | readRow | 14 |
| restore | 30 | dispatch | 23 |
| zero | 5 | successor | 30 |
| tail | 5 | cons | 13 |
| comp | 14 | branch | 16 |
| fix | 14 | returned | 20 |
| halt | 2 | cons1 | 98 |
| cons2 | 5 | comp1 | 5 |
| fix1 | 18 | invalid | 2 |

The native count probe evaluates only these finite source lists. No fastStack, full
backend emission, final binary table, or chess-game-tree execution was run for this leaf.
The runtime control has no source-program or input parameter: program rows, program
counters, and return frames remain tape data. Serialized program/input sizes and the
eventual backend state costs remain separate accounting obligations.

## Verification and remaining work

The strict focused build is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.RuntimeSupport
```

The leaf audit covers all `RuntimeSupport` and `Runtime` declarations transitively,
examining both declaration types and values. It rejects proof holes, unsafe/partial
dependencies, nonstandard axioms, and the open chess conjecture. Compiler-generated
recursive implementation artifacts are inventoried separately with checked safe owners;
traversal still rejects them if reached as dependencies. Injected axiom and recursive
artifact controls test those rejection paths. Fixtures also check the actual startup,
halt, and invalid return behavior under the override.

This theorem establishes finite support of the fixed TM2 control only. The runtime-to-VM
simulation, exact serialized-data lookup semantics, blank initialization, stack/binary
backend instantiation, and final table identity remain integration obligations. It does
not establish a completed chess machine or M6. M7 remains unstarted.

Evidence is in `.unlazy/chess-m6/leaf-1.20/`.
