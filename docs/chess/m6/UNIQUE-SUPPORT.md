# Structural caching for finite Post support

`UniqueSupport.lean` collects the structural subterms of TM1 procedures without
walking an already completed subtree again. `UniqueAssembly.lean` packages that
support directly into `NumberedPost`, using the established `hashNumberPack`
constructor. The sealed M5 and StrongAssembly sources are unchanged.

## Exact cache invariant

`UniqueSupport.collect q seen` first queries the structural hash set. A hit
returns `seen` immediately. A miss recursively collects the children, left then
right for a branch, and inserts the parent **after** its children. The recursion
is structural on the finite statement syntax.

`SubtreeClosed seen` says every stored statement's entire subtree is already in
the set. The proved contracts are:

```
collect_mem q seen closed r :
  r ∈ collect q seen ↔ r ∈ seen ∨ r ∈ subtermList q
collect_closed q seen closed : SubtreeClosed (collect q seen)
```

The closure premise is necessary. A set containing a move statement but missing
its child causes an immediate hit and leaves the child missing. The fixtures
retain this counterexample, alongside valid preclosed-cache extension tests.
The proof never asserts an unconditional union theorem for arbitrary caches.

`collectMany` preserves the invariant across a list of bodies. The production
`statements M procedures` instead folds the **procedure labels directly**, calling
`collect (M label)` as needed. It avoids eagerly materializing `procedures.map M`.
`statements_eq_collectMany` proves equality with that mapped-list formulation,
while `statements_mem` and `statements_closed` establish exact complete support
and closure from the empty cache.

All hash collisions invoke the supplied full `DecidableEq` procedure. A hash is
never used as an identity certificate. The collector is independent of the hash
quality and does not assume function fields are head independent. Structural
hashing and equality can themselves inspect subtrees; skipping a recursive
collection call is not a general linear-time complexity theorem.

## Store product and finite machine

`UniqueSupport.postLabels` pairs each unique statement, and the absent control
`none`, with every distinct supplied store. Procedure roots and stores may both
contain duplicates. The output is duplicate-free, has the exact membership of
the frozen `postSupportList`, and has length

```
(uniqueStatementSet.size + 1) * (hashUnique stores).length
```

`UniqueAssembly.postLabels_streamed_members` and
`postLabels_streamed_length` prove that membership and cardinality equal
`StrongAssembly.streamedPostLabels` on the same machine, procedure list and store
list. Enumeration order may change. No state reduction is asserted.

`UniqueAssembly.binaryPost` accepts a Boolean TM1 machine, finite procedure roots,
stores, input, and explicit complete statement equality and hashing algorithms.
Its halting theorem requires the roots to support the machine and stores to
cover the finite store type. Under these premises it proves both directions:

```
(binaryPost M procedures stores input statementEq statementHash).Halts ↔
  (TM1.eval M input).Dom
```

The support proof is the exact `TM1to0.tr_supports` support. It includes the
initial statement/default store through the source support premise and store
coverage, as well as every absent-control/store label. `hashNumberPack` forces
the initial state to zero and includes its extra default slot. The complete
machine therefore has

```
(uniqueStatementSet.size + 1) * (hashUnique stores).length + 1
```

states. `binaryPost_input` proves the input is unchanged.

For an already numeric getter, use

```
UniqueAssembly.post M stores input statementEq statementHash
```

where `M : Fin n → TM1.Stmt Bool (Fin n) σ`. `post_halts` takes full finite support
and store coverage; `post_input` preserves the exact tape. This entry does not
number the source again and does not construct another complete matrix of
source rows. It can consume the separate certified binary-index getter directly.

## Verification and measurements

The focused production check is:

```
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.UniqueAssembly
```

The leaf also builds a native fixture executable with 14 checked assertions,
including empty input, branch sharing, duplicate roots, constant-hash collisions,
changed function values, valid preclosed caches, the invalid-cache counterexample,
duplicate stores, absent controls, exact old/new membership and cardinality,
charged state count, unchanged nonempty input, and actual numbered-machine
termination. Kernel-checked examples instantiate closure, the precise membership
theorem, and the generic halting equivalence on arbitrary input. Hash-map internals
are opaque to closed kernel reduction, so runtime count assertions are evidence;
the general support and halting theorems remain kernel proofs.

An independently capped native comparison of the closed `Code.tail` backend
completed under its first 60-second cap, with an 8-GiB RSS cap. It measured:

| Phase/result | Measurement |
|---|---:|
| Unique structural statements | 9,725 |
| Unique Post labels, both collectors | 48,630 |
| Numbered Post states, including extra initial slot | 48,631 |
| Structural collection from cached numeric rows | 1.230 s |
| Statement/store pairing | 0.001 s |
| Final hash/array numbering | 2.578 s |
| Original streamed collection on the same rows | 20.935 s |
| Whole probe, including both paths | 28.106 s |
| Peak child RSS across the complete comparison | 108,429,312 bytes |

Phase timestamps, executable/source fingerprints, command arguments, exit status,
and live RSS samples are retained in `.unlazy/chess-m6/leaf-1.34/`. The comparison
retains the completed numbered machine and materializes sample transitions; it
does not infer a finite state count from unique-node estimates. These measurements
are for `Code.tail`, not the complete chess construction. No chess count, practical
search time, emitted-table certification, or M6 completion follows from them.

The transitive audit selects every declaration from both owned modules, follows
types and values, constructors and recursor rules, and permits only `propext`,
`Classical.choice`, and `Quot.sound`. Exact generated recursion artifacts are
checked against their safe total owners before root exclusion; they are forbidden
throughout dependency traversal. Proof-hole, unsafe-dependency, and generated-helper
negative controls must all fail. The leaf evidence also records all four review
passes and unchanged verification input fingerprints.
