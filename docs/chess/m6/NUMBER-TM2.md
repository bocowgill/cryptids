# Numeric TM2 control before tape lowering

`Cryptids/Compilation/NumberTM2.lean` provides a generic frontend in namespace
`ConjectureMachines.Compilation.TM2Number`. It replaces finite supported source labels
with `Fin (labels.length + 1)` before TM2-to-TM1 lowering. Only goto destinations change.
The store, every stack, stack alphabets, primitive operations, and their functions are
preserved exactly.

This removes function-bearing source macro labels from the control-label type used by
later compilation. Primitive finite store/alphabet functions remain in statement syntax.
The transformation changes neither a runtime program counter on tape nor serialized
chess program data. It introduces no source-dependent interpreter phase labels.

## Exact renaming and execution

`mapStmt rename` recursively maps the destination of every `TM2.Stmt.goto`, including
both branches. `mapCfg rename` maps only the optional control label. `stepAux_map` proves
unconditional commutation of statement execution with this renaming.

`numberProgram machine labels` uses the existing verified `numberLabel` and
`unnumberLabel` functions from Finite. The source-label sequence is `default :: labels`;
the first occurrence determines a goto's numeric destination. Duplicate labels retain
duplicate numeric procedures. State zero represents the source default. An unsupported
source destination would map to zero, so the source semantic theorems explicitly require
that the list covers a support invariant.

The main proof interfaces are:

- `stepAux_decode`: executing a renamed supported statement and decoding its result is
  exactly the original statement execution;
- `step_number`: a supported source step is exactly its numbered step;
- `step_decode`: every numeric step decodes to exactly one source step, including
  execution from duplicate numeric rows;
- `number_respects`, `decode_respects`: positive-step simulations in both directions;
- `reaches_supported`: every reachable source configuration retains its support invariant;
- `numberProgram_dom_cfg`, `numberProgram_dom_source_cfg`: both termination directions
  at arbitrary numeric or supported source configurations.

No inverse identity from arbitrary numeric IDs to their first occurrence is assumed.
Duplicate rows can share a decoded source label, while exact one-step decoding still holds.

`mapCfg_init` proves that ordinary `TM2.init inputStack input` becomes ordinary numeric
TM2 initialization at state zero. `decodeCfg_init` proves the reverse initialization
identity. Both retain the exact initial store and all input and empty stacks.
`numberProgram_dom_of_support machine labels supported inputStack input` proves:

```lean
(TM2.eval (numberProgram machine labels) inputStack input).Dom ↔
  (TM2.eval machine inputStack input).Dom
```

Here `supported : TM2.Supports machine labels.toFinset`. The more general
`numberProgram_dom` accepts support on `(default :: labels).toFinset`.
`numberProgram_supports` proves support of the numeric machine on `Finset.univ`.

## Nominal row and store caches

`memoStmt stores` preserves all primitive operations but materializes a store lookup
table at each goto. A TM2 goto depends only on the finite store, so no head-independence
hypothesis is needed. With `cover : ∀ store, store ∈ stores`, `memoStmt_eq` proves exact
statement equality, not merely equal termination.

The cache uses the stable nominal `CachedFunction` record from Memo. Its fields are an
array of values, an index function, and a fallback. Each goto closure captures a completed
`CachedFunction σ (Fin n)` table. `cachedStore` constructs its numeric destinations once;
subsequent goto calls index the supplied store list. For the runtime, that list is the
five values in `CodeBackend.stores`. It does not compare source labels on every goto.

`cachedProgram stores machine` is a `@[noinline]` constructor returning nominal data:

```lean
CachedFunction (Fin n) (TM2.Stmt Γ (Fin n) σ)
```

Its `values` field is `Array.ofFn` of the fully memoized procedures, and its numeric
position function is `Fin.val`. It does not return a function that rebuilds the array
when called. The `.halt` fallback is unreachable for all valid numeric row indices;
`cachedProgram_eq` proves `.get = machine` on every such index.

The combined frontend is `cachedNumberProgram stores machine labels`. Its root-facing
interfaces are:

```lean
cachedNumberProgram_eq stores cover machine labels :
  (cachedNumberProgram stores machine labels).get = numberProgram machine labels

cachedNumberProgram_supports stores cover machine labels :
  TM2.Supports (cachedNumberProgram stores machine labels).get Finset.univ

cachedNumberProgram_dom_of_support stores cover machine labels supported inputStack input :
  (TM2.eval (cachedNumberProgram stores machine labels).get inputStack input).Dom ↔
    (TM2.eval machine inputStack input).Dom
```

Callers should bind the record before creating downstream closures:

```lean
let numeric := TM2Number.cachedNumberProgram stores source labels
-- pass numeric.get to the verified tape lowering
```

All runtime construction is computable. No hashable-source-label assumption, abstract
oracle, noncomputable finite enumeration, or unverified compiler substitution is used.
Initial numbering still performs the existing linear list membership/index search; this
leaf does not claim a generic asymptotic improvement for that construction phase.

## Verification and measured scope

The focused strict build is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.NumberTM2
```

The transitive audit covers 54 safe NumberTM2 declarations and 4212 dependencies, with only
propext, Classical.choice, and Quot.sound. It inspects declaration types and values and
rejects holes, nonstandard axioms, unsafe/partial dependencies, and the open chess conjecture.
Generated recursion artifacts for mapStmt and memoStmt have checked safe owners and are
inventoried outside the safe roots; traversal still rejects them as dependencies. Both
injected negative controls fail as expected.

Eight kernel assertions exercise initialization, duplicate rows, exact step decoding,
cache equality, finite support, both evaluation-domain directions, and the reachable
source invariant. Two paired source/cached-machine runs preserve the complete input stack. The generic
statement proofs handle all seven TM2 constructors.

A native probe with a 30-second process cap materialized the actual fixed runtime cache:
344 candidate macro labels plus the explicit default yielded 345 numeric rows in 1198 ms.
The entire Lean probe process took 4.026 seconds. This is one bounded construction
measurement, not a theorem about backend performance or a final machine-state count.
No TM2-to-TM1 lowering, full stack/binary emission, or chess-game-tree execution was run.
The existing backend must still be instantiated and its exact final table verified.
This frontend does not complete M6. M7 remains unstarted.

Evidence is in `.unlazy/chess-m6/leaf-1.28/`.
