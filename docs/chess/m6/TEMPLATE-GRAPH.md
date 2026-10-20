# Arithmetic graph for binary templates

`ConjectureMachines.Compilation.TemplateGraph` compiles every row of a
`BinaryTemplates.machine` to first-order Boolean syntax node getters. It proves
that the decoded machine is exactly the original template machine, then transfers
exact partial outputs and both halting directions to the lazy numeric Post backend.
The construction does not enumerate source control support, compare source
function fields, hash syntax, or materialize the full graph during row lookup.

## Computational data and proofs

`Data Γ σ n w m k r u width` contains only computational fields: primitive source
rows, block encode/decode, write-site lookup and saved successors, alphabet and
store equivalences, read/move PC tables, and a plain/read/move classification.
`Valid C data sites` is a separate proposition. It ties those fields to the block
codec and `BinaryTemplates.WriteSites`, proves `OnePrimitive` for each source row,
and certifies the classification and inverse PC lookups. The executable getters
never receive this semantic proof or a `WriteSites` record.

`Raw` stores a count and node getter. Its separate `Raw.Valid` proposition proves
that every syntax child is earlier than its parent. `Raw.extend` appends a finite
family arithmetically; `decode_extend_old` preserves all earlier syntax and
`decode_extend_new` exposes the new constructor. `Bundle` adds finite root getters.
No runtime node contains a Lean statement, function-valued observable table, or
source semantic certificate. A node's observable table contains exactly `2*k`
finite cells.

`build data` constructs a bounded number of getter layers. `entryOf data state`
selects entries from an already constructed bundle. `lazyGraph data` captures one
bundle for both node and entry lookup. Exporters should retain that nominal graph
record for their entire loop. `graph data` is the formal `Vector.ofFn` view used by
the proof; executable lookup uses `lazyGraph` directly.

## Layout and exact counts

The layout pays for every allocated node, including unused normal-tail slots.
It allocates normal continuations and saved writer continuations, one payload per
read row and decoded glyph, parallel restoring/mover chains, read-tree levels,
and shared writer suffix levels. Writers do not receive read trees. Every shorter
writer suffix is shared once per write site. All bit strings, including invalid
codec words, pass through the supplied `decode` at read leaves. Distinct invalid
words can share a restored payload precisely when that exact decoder returns the
same glyph.

Writing `d=width`, the proved count is

```
2*n + w + r*m + d*(r*m+w+u) + readerCost r d 0 + writerCost w d
```

Here `readerCost r d 0 = 3*r*(2^d-1)` and
`writerCost w d = 4*w*(2^d-1)` describe the recurrence's arithmetic value;
the public count theorem uses the executable recurrences themselves.
`build_count` proves equality for arbitrary computational data, independently of
source semantic validity.

For `n=4042,w=270,m=1250,k=5,r=1734,u=1188,d=11`, the kernel-checked inventory is:

| Range | Nodes | Cumulative nodes |
|---|---:|---:|
| Normal and saved writer tails | 8,354 | 8,354 |
| Decoded-glyph payloads | 2,167,500 | 2,175,854 |
| Restoring and mover chains | 23,858,538 | 26,034,392 |
| Read trees | 10,648,494 | 36,682,886 |
| Shared writer suffixes | 2,210,760 | 38,893,646 |

`chess_inventory_count` proves 38,893,646 nodes and
`chess_inventory_post_count` proves 194,468,236 numeric Post controls, including
its distinguished initial state and all store copies. These are exact counts for
the stated generic family sizes. Acceptance of the actual chess instantiation and
its final input prefix belongs to the parent integration. The corresponding
unprefixed binary expansion would contain 388,936,472 states.

## Public refinement

- `build_valid`: every getter node has strictly smaller syntax children.
- `build_reader`, `build_writer`, `build_mover`, `build_tail`: exact macro syntax.
- `machine_eq C data sites valid`: decoded graph machine equality on every normal
  label and every write-site/glyph label.
- `eval_eq C data sites valid zero input`: exact equality of partial outputs from
  the lazy numeric Post machine and the binary template TM1 on every Boolean input.
- `halts_iff C data sites valid zero input`: both domain directions, using ordinary
  initial tapes and requiring `data.stores 0 = default`.

The argument includes zero width, empty read/move/write families, changed stores,
all branch outcomes, arbitrary goto cycles, and genuine halts. No fuel fallback,
halting assumption, source evaluator, or source continuation equality oracle is
used. Graph topology descends through syntax children; goto targets may cycle
through the source entry array.

## Verification and bounded cost probes

From the repository root:

```
python3 .unlazy/chess-m6/leaf-1.39/verify.py
python3 .unlazy/chess-m6/leaf-1.39/verify.py --recheck
```

The first command validates the seal, saved check results, compressed samples and
hashes. The second also reruns the focused build, strict source and kernel
fixtures, full and computational closure audits, five rejection controls, the
owned alternate-config native executable build, and native 100k/1m samples. Each
Lean/native subprocess is capped at 60 seconds. Native builds/probes also enforce
an 8 GiB owned process-tree RSS cap. Root Lake configuration is unchanged.

Kernel fixtures cover every constructor, load/store changes, both branch outcomes,
invalid padding bits, writer/movement behavior, exact getter cells, empty families,
zero width and nontermination of a source/numeric goto loop. Rejection controls
reject `sorryAx`, an unsafe recursion artifact, semantic-proof contamination of a
computational root, a false load result, and a false source classification.
The complete safe closure contains only `propext`, `Classical.choice`, `Quot.sound`.
Compiler recursion artifacts are excluded from safe roots only after checking their
safe owner's type and safety; a control proves they are rejected if reachable.

The native probe uses the independently accepted `Templates.primitiveMachine`
and its pure numeric getters. It emits both Boolean cells at base, payload,
restoration, read, writer and late Post rows. Each text line stores the state and
two lossless transition signatures; gzip parts are decompressed and SHA256-checked.
The 100k native outputs also match the earlier interpreted outputs byte for byte.

| AOT sample | Process wall | Main export | Peak RSS | Raw bytes | gzip bytes |
|---|---:|---:|---:|---:|---:|
| 100,000 mixed rows | 2.020 s | 0.871 s | 60,915,712 | 2,357,355 | 531,006 |
| 1,000,000 mixed rows | 7.884 s | 7.800 s | 61,014,016 | 25,776,631 | 5,455,840 |

Getter initialization inside `main` measured below 1 ms in both native probes.
The wall-minus-main upper bounds, 1.149 s and 0.084 s respectively, include
process launch, module/global initialization, directory setup, shutdown and up to
100 ms of measurement polling. They do not isolate module initialization alone.
Earlier `lean --run` measurements are retained and explicitly labelled interpreted:
100k completed in 11.82 s, while the preliminary 1m run reached its 60 s cap.
The final export uses the compiled executable; the interpreted cap is not an AOT
throughput estimate.

These samples establish bounded getter/export behavior for those regions. They do
not establish full-program compressed size or full export time. A future size
reduction could use explicit, checked finite payload classes if source tables
agree on every observable cell and invalid-code behavior remains exact. No such
quotient or reduced count is claimed here. Full chess graph instantiation, paid
input prefix, complete literal export, independent challenge comparison and the
final M6 statement remain integration obligations.
