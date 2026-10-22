# Round 01: concrete field body return-control route

Date: 2026-10-22. Scope: source inspection and symbolic design only. No Lean, Lake,
LSP, LeanProbe, native exporter, table parser, model, fixture or counter was run by
this scout. The frozen implementation is unchanged. Numerical expressions below
use the existing source constants; no new measured reduction is claimed.

## Recommendation

Keep every current main control, and allocate return controls only for the shared
halt, each source-label entry/store pair, and each literal syntax-write's
child/store pair. This support can be certified by induction on syntax and on the
decreasing `LazyGraph.trAux` recursion. It avoids a certificate containing 533,341
separate row proofs. Use a recursive finite type for the write children and reuse
the existing balanced row allocator with a new weight.

This is the first route because selective allocation preserves each old binary
transition exactly under a control decoder. The parent generic scout owns that
compiler/simulation interface. Write/move fusion is a promising second route,
but changes the number of old steps represented by one new step.

## 1. Exact source chain and address conventions

All references below are repository-relative paths with one-based source lines.

| Layer | Existing source evidence | Consequence |
|---|---|---|
| Complete lowered syntax | `Cryptids/Chess/Optimisation/FieldAware.lean:24–29` | All 4,042 rows are `lower (Snapshot.program q)`; no row is selected by reachability. |
| Exact graph allocation | `Cryptids/Chess/Optimisation/FieldPacked.lean:20–27` | The body uses 106,668 graph nodes and five stores. |
| Local-to-global graph | `Cryptids/Compilation/FieldPacking/Graph.lean:21–51` | A node decodes to one actual row/local slot; only child addresses are renamed. Entry is the row's root. |
| Every node's meaning | `Cryptids/Compilation/FieldPacking/Graph.lean:118–145` | Graph meaning is certified for every allocated node, not only reachable nodes. |
| Post controls | `Cryptids/Optimisation/CompactPost.lean:21–36` | One shared halt plus every live node/store pair: `Q = 1 + 5N = 533341`. |
| Numeric permutation | `Cryptids/Optimisation/CompactPost.lean:43–63` | Raw halt index 0 is swapped with raw `(entry 0, store 0)`. Encoded initial control is 0; encoded halt is generally not 0. |
| Post rows | `Cryptids/Optimisation/CompactPost.lean:65–72` | A live row calls `LazyGraph.trAux` and encodes its descriptor; only shared halt has missing rows. |
| Current binary body | `Cryptids/Chess/Optimisation/FieldPacked.lean:37–46`; `Cryptids/Compilation/Binary.lean:41–55` | One main and one bounce per Post control, hence 1,066,682 body states. |
| Complete paid machine | `Cryptids/Chess/Optimisation/FieldReverse.lean:26–68` | Same frozen bits and body; 1,837,941 prefix states; accepted total 2,904,623. |

For numeric reconstruction, raw live control is `1 + 5 * node + store`, followed
by the two-index swap. Global node is `offset label + localSlot`, proved by
`FieldPackedLayout.code_val` at `Cryptids/Chess/Optimisation/FieldPackedLayout.lean:319`.
The new support must use `CompactPost.encode`, not confuse raw and encoded controls.

## 2. Which return controls can be absent?

`LazyGraph.trAux` has exactly six cases
(`Cryptids/Compilation/LazyGraph.lean:37–49`):

| Primitive reached after any loads/branches | Post command | Destination |
|---|---|---|
| `.move dir child` | move | `(child, currentStore)` |
| `.write table child` | write | `(child, currentStore)` |
| `.goto table` | write the scanned bit unchanged | `(entry (table.read bit currentStore), currentStore)` |
| `.halt` | write the scanned bit unchanged | shared halt |

Loads update the store and recurse; branches recurse without a tape step. Neither
adds another destination class. A structural proof of this table must quantify
over both bits and all stores and must propagate the updated store after loads.

Let `D` be the set of all Post destinations of a `.write` row. It follows that:

* Any non-root syntax slot that is not a literal write's immediate child has no
  incoming write and needs no bounce.
* Every literal write child needs a bounce in the unfused compiler for each of the
  five stores: the parent write node itself is an allocated Post state for every
  store, regardless of reachability from the chess initial position.
* A row root needs only those store instances targeted by some goto table. Paying
  all five for all row roots is a simple sound overapproximation.
* The shared halt must retain its bounce for an exact old-binary row decoder when
  any literal halt exists. A graph halt node is not itself the shared Post halt.

In fact, the exact set `D` can be recovered from primitive graph constructors
without evaluating all Post rows: collect write children for all five stores,
goto table outputs for each of their ten bit/store inputs, and shared halt if a
literal halt exists. Recursion through load/branch can only reach a primitive
node/store already separately allocated by `CompactPost`. The converse holds
because each primitive node is itself an available Post source control. This is
a source-derived characterization to formalize, not a completed Lean theorem.

## 3. A compact allocation with structural certificates

Define `writeCount` recursively: write adds one; move/load preserve the child
count; branch adds its two child counts; go/halt have count zero. Define a finite
type `WriteTargets p` alongside it:

```text
WriteTargets (move d p)    = WriteTargets p
WriteTargets (load t p)    = WriteTargets p
WriteTargets (write t p)   = Unit + WriteTargets p
WriteTargets (branch t p q) = WriteTargets p + WriteTargets q
WriteTargets (go t)       = Empty
WriteTargets halt         = Empty
```

Its structural embedding `slot : WriteTargets p -> Fin p.size` maps the new
`Unit` in a write to its child's root and shifts inherited slots exactly as
`Syntax.nodeAt` does. Prove by syntax induction:

1. `slot` is injective.
2. `slot` never equals `p.root`.
3. Every literal write's child occurs in its image.
4. A recursive rank/lookup agrees with `slot` and returns no value for unselected
   slots; `WriteTargets p` has an explicit equivalence with `Fin (writeCount p)`.

The relevant existing postorder definitions are
`Cryptids/Compilation/FieldCompiler/Graph.lean:28–65`. In particular, the child
root of a unary write is the immediately preceding local slot. The proof should
use the tree structure, not assume that property for arbitrary `LazyGraph.Graph`.
A shared DAG would require a different collision argument.

The per-row return type is `Unit + WriteTargets p`, with `Unit` representing the
row root. The two parts are disjoint by item 2. Across rows, the original layout
is injective (`Cryptids/Chess/Optimisation/FieldPackedLayout.lean:331–337`). Pair
the resulting slots with all five stores and add one shared-halt slot.

Reuse `FieldPackedLayout.Block.ofTree` with weight
`1 + writeCount (lower row.1)`, instead of the existing `(lower row.1).size` weight.
The existing allocator already proves exact balanced sum allocation, lookup,
cardinality and prefix arithmetic for **any weight**
(`Cryptids/Chess/Optimisation/FieldPackedLayout.lean:36–44,127–185,188–212`). Its
present chess instantiation is at lines 216–250. This reuses its general
allocation theorem without changing the accepted node layout.

Required new interfaces, stated schematically:

```text
returnDecode : Fin R -> Fin Q
returnEncode? : Fin Q -> Option (Fin R)
return_roundtrip : returnEncode? (returnDecode r) = some r
write_covered : post q bit = some (j, write b) ->
                exists r, returnEncode? j = some r /\ returnDecode r = j
```

An equivalent dependent support encoder is also suitable. Runtime selection must
be ordinary data. Do not use proof search, an opaque choice function, or a proof
callback to calculate a transition. The coverage proof proceeds from `trAux`
descent, `FieldPacking.graphNode_index`, the write-child/root lookup equations,
and `CompactPost.decode_encode`. It does not unfold the complete snapshot.

For the exact old-binary decoder: new main `q` maps to old main `q`; new return
`r` maps to old bounce `returnDecode r`. A move enters a main control; a write
enters a selected return; each return preserves its scanned neighbour and moves
left to the decoded main. Initial main remains 0. Every selected return row has
both symbols, so deletion introduces no new halting configuration.

The full new theorem then composes the parent's generic compiler equivalence
with `FieldPacked.post_halts_input` and the unchanged reverse initializer. The
existing whole-machine composition is
`Cryptids/Chess/Optimisation/FieldReverse.lean:62–68`.

## 4. Complete symbolic accounting

Let `N=106668`, `L=4042`, `K=5`, `Q=1+KN=533341`, `P=1837941`, and let
`W` be the unmeasured total number of literal write constructors in all rows.
For the recommended support:

```text
return controls       R = 1 + K(L + W)
main controls            Q
body controls            Q + R
full controls            P + Q + R = 2391493 + 5W
saving from baseline     Q - R     = 513130 - 5W
```

All dispatch, continuation, halt and prefix controls are included. There is no
hidden table interpreter or unpaid initialization in this count. Exact root
table analysis could replace `KL` by the actual number of targeted entry/store
pairs, but that is an optional improvement with an extra coverage certificate.

For context, `emit` creates each write as `.write ... (.move ... ...)`
(`Cryptids/Compilation/FieldCompiler/Syntax.lean:60–67`), and `lower` creates no
other writes (`Cryptids/Compilation/FieldCompiler/Operations.lean:48–62`). Thus
each write pairs with a distinct move child, giving the source-derived bound
`2W <= N`. If formally established, this already bounds the proposed complete
machine by 2,658,163 states, a reduction of at least 246,460. These are algebraic
bounds for the proposed construction, **not measured or certified new counts**.
The remote census must determine `W`; the new Lean instance must certify its
actual cardinality.

## 5. Later fusion opportunity and its boundary

Every literal write child produced by `lower` is an unconditional move, for both
bits and every store. Prove the invariant first for `emit`, assuming it holds of
all continuations; prove preservation by `select5`; then inspect the nine
`lower` cases. Transfer it to every local slot and through the graph layout.

For a write row `post q bit = (j, write b)` and an unconditional successor
`post j false = post j true = (k, move d)`, one native step writing `b` and moving
`d` to main `k` has the exact tape and head effect of the two Post steps. Every
incoming write to that `j` may take the same fusion. No bounce for `j` remains
necessary if every incoming write is redirected this way.

All literal write-child bounces satisfy that condition by the structural
invariant. Some entry-root bounces may also satisfy it; a literal move root is
an easy subclass. Loads/branches at a root can collapse to a move, but require
analysis of both bit rows and resulting stores. A root's outgoing constructor
alone is not a general test for whether it has an incoming write.

Keeping all mains and the conservative entry/halt returns after fusing all
literal write children gives the symbolic candidate count `P + Q + 1 + KL =
2391493`, before any additional root fusion. This is a design count only. The
exact one-old-step row decoder used for selective deletion does not prove it:
fusion needs a nonempty macro-step relation, terminal reflection, and both
halting directions on arbitrary tapes. Do not count fusion savings in round 01
unless those proofs and the actual complete exporter also pass.

## 6. One remote-only census/extraction integration

Use a new round-specific script/export target; leave accepted scripts unchanged.
The root is already arranging the remote census. No duplicate run is needed.

The frozen exporter contains sufficient independent structure:

* `scripts/chess_field_reverse/Export.lean:49–75` serializes every local syntax
  node and each actual global getter node.
* Lines 264–277 cover every source row and every actual local slot. The field
  named `getter_samples` is therefore exhaustive, despite its name.
* Lines 211–240 export every actual binary body transition in state-major order,
  including missing rows, after actual-machine/row-machine equality checks.
* Lines 246–248 enforce `CHESS_REMOTE=1`; lines 298–330 include dimensions,
  permutation endpoints, entry roots, input bits and the complete prefix/body
  artifacts. The actual prefix replay is separate from the body.

On the remote worker, reconstruct the three primitive destination classes from
the serialized getter/syntax data, then independently collect the set of bounce
targets from the old actual body main rows. In the old format, a main row enters
the bounce block exactly for a Post write. Require equality of these two exact
sets. Also compare the proposed structural superset (all roots, write children,
shared halt), its cardinal formula, and its collision-free rank/decode map.
Record `W`, targeted entry/store pairs, shared halt presence, and rejected rows;
report savings only after this evidence exists.

The existing independent Python model already reconstructs addresses and
`trAux` semantics from finite tables without calling Lean:
`scripts/chess_field_reverse/fixtures.py:82–159,180–237`. Extend a new copy with
the return rank/decode recipe and compare every new actual body row against it.
Native export should include both bits of every paid prefix and body state,
complete source/getter data, exact state bounds, and the decoder digest. Keep
the source-manifest, export hashes, raw command logs and resource limits.

Acceptance must reject: missing selected bounce, duplicated target/rank,
raw/encoded swap confusion, wrong neighbour-preserving return write, wrong
left return direction, shared-halt omission, truncated/out-of-order rows,
wrong prefix offset, and uncharged controls. Existing remote runner/audit/count
patterns are at `scripts/chess_field_reverse/verify.py:47–84,87–157,194–217`.
Finite reconstruction is evidence for extraction and accounting; the structural
Lean proof remains responsible for unbounded halting equivalence.

## 7. Adversarial review and four passes

Pass 1: traced the complete frozen body, address permutation, primitive
destination classes and current exporter; proposed conservative support.

Pass 2: replaced the larger move-node overapproximation with the exact
write-child/entry structural support. Specified recursive finite allocation and
the reusable balanced weight interface. Identified the primitive-constructor
method for independently recovering the exact destination set.

Pass 3: checked stores after loads, two-bit dependence, all-node versus reachable
coverage, root/write-child disjointness, shared halt versus halt syntax,
permutation, duplicate DAG edges, paid prefix, decoder and actual-row evidence.
Kept fusion separate because its proof is not an exact row renaming. The main
obstruction is a new certified structural return allocator and its executable
inverse; no complete implementation or new machine theorem is claimed here.

Pass 4: rechecked cited definitions and algebra by source inspection, removed
claims of measured savings, and made all new theorem/count obligations explicit.
No further source-analysis defect was found. Manual source-design gates are
complete; parent integration review and all implementation/remote gates remain
separate obligations.
