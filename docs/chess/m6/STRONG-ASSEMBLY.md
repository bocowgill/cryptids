# Scalable finite-control construction

`Cryptids/Compilation/StrongAssembly.lean` adds a constructive backend beside the
frozen M5 compiler. Its main entry point is `StrongAssembly.twiceStack`. It accepts
an explicitly supported TM2 machine, a block alphabet code, finite symbol/store
lists, and an arbitrary finite input on the selected source stack.

The theorem `twiceStack_halts` proves both directions:

```lean
(twiceStack M C labels sourceHash symbols stores k input).Halts ↔
  (Turing.TM2.eval M k input).Dom
```

The theorem `twiceStack_input` identifies its tape exactly as
`blockInput C (TM2to1.trInit k input)`. The package is an actual `NumberedPost`,
whose machine has `extraStates + 1` states. Binary lowering and blank-tape input
initialization remain the subsequent proved stages; this module introduces no
external input oracle or uncharged initialization.

## Construction and refinement

1. `firstNumberIndex` builds a nominal `HashMap` of first source occurrences.
   Unsupported keys return zero and the initial label remains zero.
   `FirstNumberIndex.get_eq` proves exact equality with M5's `numberLabel`,
   including duplicate labels. It uses full decidable equality on every hash
   collision. No injectivity assumption is made about any hash.
2. `cachedNumberProgram` captures that index and an inverse array before creating
   mapped goto closures. Its lookup equals `TM1Number.numberProgram` at every row.
   `cachedSharedProgram` also materializes the five, or generally all supplied,
   store values of each head-independent source jump. Its lookup is exactly
   `fastTM1`; no source semantics or first-pass numbering changes.
3. The alphabet compiler constructs the same binary TM1 program. A second numeric
   control pass replaces its function-valued continuation labels by `Fin` values
   before `TM1to0.tr`. `cachedBoolProgram` precomputes every Boolean-head/store
   goto result, including head-dependent jumps. Its lookup is exactly the existing
   proved `TM1Number.numberProgram`.
4. `streamedPostLabels` inserts each procedure's finite support directly into a
   hash set. `mem_streamedPostLabels` proves equivalence to the old flattened
   `postSupportList`. It allocates one candidate row at a time rather than the
   complete flattened candidate list.
5. `binaryPost_halts` composes support, second-pass renaming, Post conversion,
   and final hash/array numbering. `twiceStack_halts` additionally composes the
   first pass, normalization, block compilation, and the TM2-to-TM1 simulation.

`headMemoStmt_eq` covers arbitrary Boolean-head/store jumps; the second pass does
not assume those jumps are head independent. All finite control and lookup tables
are constructed by executable definitions. No runtime `Finset.toList`, classical
choice, proof hole, custom axiom, unsafe definition, partial computation,
`implemented_by`, or native proof shortcut is introduced.

The structural hashes observe the supplied stores and stack symbols. Post hashes
observe both Boolean heads and all supplied stores. Hashes affect bucket placement
only. The full equality checks are retained. `partrecLabelHash` deliberately omits
Code payloads in continuation hashes; such collisions are harmless because source
equality remains complete. The older `stack` wrapper is retained as a proved
comparison of a stronger hash against the frozen backend; the scalable backend is
`twiceStack`.

## Measured construction evidence

Bounded native probes and their exact commands, timings, exit codes, and resource
records are retained in `.unlazy/chess-m6/leaf-1.25/`. These are construction
measurements, not executions of the chess search and not proofs of chess's value.

For the closed source `Code.tail`, all completed paths produced 48,631 Post
states, hence 97,262 binary body states before initialization:

| Construction path | Completion time recorded inside probe |
| --- | ---: |
| Same program, stronger hash only | 123.120 s |
| Captured first index plus second numeric pass | 21.437 s |
| Same two passes, streaming support | 21.544 s |

The latter run peaked at 179,208,192 bytes RSS. Its 1,554,055 raw candidates include
one duplicate initial numeric row; the older traversal has 1,554,050. This does
not change the deduplicated state count. The streamed repeat is recorded separately
in `tail-streamed.log` and `tail-streamed.json`, with 109,101,056 bytes peak RSS
and the same 48,631-state result.

The fixed interpreter's original function-valued macro labels still exceeded a
300 s cap before the cached shared-tape rows completed. A finer index-only probe
also exceeded 60 s, with 55,607,296 bytes peak RSS. These are explicit timeouts;
no interpreter state count is inferred from them. The separate `NumberTM2`
frontend removes those recursive macro-label payloads before this backend; its
composition and the actual chess table/count are owned by the M6 integration.

## Verification and boundary

The focused `lake --wfail build Cryptids.Compilation.StrongAssembly` passes.
`verify.py` runs sixteen fixtures, inventories every declaration owned by this
module, traverses each safe declaration's complete dependencies, and rejects a
`sorryAx` negative control. The audit allows only `propext`, `Classical.choice`,
and `Quot.sound`; it also rejects the open chess conjecture as a dependency.
Compiler-generated recursion artifacts are inventoried separately and cannot be
used as dependencies of the safe roots.

Fixtures cover first-occurrence duplicates, missing keys, a constant hasher,
nondefault Boolean/store observations, streamed support under collisions, exact
input preservation, and a finite push/pop/goto machine compiled through both
numbering passes. The generic halting theorem is instantiated on arbitrary
nonempty Boolean input as a kernel-checked fixture.

This module does not assert serialization identity, an actual emitted chess
transition table, a chess-state count, or the final chess halting equivalence.
Those require the separate source-wire and fixed-interpreter integration gates.
