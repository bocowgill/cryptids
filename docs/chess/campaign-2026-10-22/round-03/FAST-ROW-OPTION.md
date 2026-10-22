# A bounded alternative if actual-row normalization is slow

Source-only follow-up bygoal_body_proof_scout, reviewed by root. No Lean or
machine computation was run for this note. It is not yet the measured bottleneck:
the first two certificate attempts stopped in the harness/data audit, before
actual-row proofs. Test direct rows first after those repairs.

The proposed alternative proves the same64sampled actual-body rows through local
syntax-slot witnesses. It keeps the measured complete class map and quotient,
and returns to the exact unchanged`RowAt`predicate. This small proof-engineering
step would unlock the measured459315state full-machine opportunity; it yields no
independent accepted saving itself.

| Layer | Existing exact equations |
|---|---|
| Main versus return control |`SelectiveBinary.compile_main`, `compile_bounce`|
| Known Post descriptor |`CompactPost.decode_encode`, `encode_initial`|
| Known local syntax slot |`FieldPacking.graph_node`, `graphNode_index`|
| Source operation |`FieldAware.syntaxRows_get`|
| Fast local node lookup |Explicit rewrite`← FieldCompiler.Syntax.fastNodeAt_eq`|
| Pure local control |`LazyGraph.trAux_move`, `_write`, `_load`, `_branch`, `_goto`, `_halt`|
| Known write-return destination |`FieldSelectiveLayout.findReturn_live`, `FieldReturns.findTarget_targetAt`|
| Return control |`FieldSelectiveLayout.returnAt_live`, `_halt`|
| Numeric address |`FieldPackedLayout.code_val`/`index_val`, `FieldSelectiveLayout.liveReturn_val`, concrete offset equalities|

Direct normalization may repeatedly unfold the initial-state swap's fixed anchor,
the global layout's nested dependent equivalences, source`Vector.ofFn`, local
`nodeAt`case splits, and return-target`idxOf`. Prove the fixed anchor once, cancel
known layout inverses propositionally, and cache each touched label/node equation.
The compiler's`@[csimp] nodeAt_csimp`does not by itself accelerate ordinary kernel
normalization. The explicit`fastNodeAt_eq`rewrite preserves the exact meaning.

One proposed helper, not yet checked:

```lean
FieldPacked.post
    (CompactPost.encode FieldPacked.getter (some pc, value)) bit
  =
  let r := LazyGraph.trAux FieldPacked.getter bit pc value
  some (CompactPost.encode FieldPacked.getter r.1, r.2)
```

It should follow from`FieldPacked.post`, `CompactPost.machine`and
`CompactPost.decode_encode`. Generate untrusted sample witnesses as
`(main,label,localNode,store)`or`(return,label,targetRank,store)`and kernel-prove
their numeric addresses. Then use the equations above for the actual transition,
finishing by evaluating balanced class-map and quotient lookups.

Keep global layout definitions opaque during these row proofs. Avoid
`offset_eq_prefix`, which exposes flattened prefix sums. Rewriting through
`FieldSelective.rowBody_eq` preserves identity but does not eliminate the same
Post/layout computation. If tested, use exactly the same64states and resource
caps as the direct approach; expand only after observed cost improves.
