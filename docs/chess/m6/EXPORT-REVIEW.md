# M6 exact export review

Review scope: leaf 1.37, introduced at PLAN revision 24; revisions 25–26 were
reread during review. Their LazyGraph, TemplateGraph and concrete Templates leaves
address parts of the implementation below, but dispatch is not verification.
This is a publication/certification design, not an emitted chess table, a new
compiler implementation, or M6 completion.

**Recommendation:** freeze a first-order arithmetic descriptor table, certify its
complete expanded row semantics, and retain the full canonical two-column table
as ordered, losslessly compressed literal byte parts. Use a standalone challenge
containing the same frozen descriptor data and minimal table decoder. Do not resume global hash numbering
inside the kernel. A descriptor, a hash, or a native `Vector.ofFn` computation by
itself does not satisfy publication.

## What acceptance actually requires

`ROADMAP.md:413–433` requires a positive literal `Machine q 2`, a published literal
transition table, paid blank initialization, unconditional strategic equivalence
for that exact table, independent challenge/comparator, artifact agreement and
reproducibility. It does not prescribe one particular Lean container for rows.
Compressed table representation therefore need not weaken acceptance, provided
the full expanded table's literal byte content is actually retained losslessly
and its mathematical interpretation is fixed and certified. A permanent raw
multi-gigabyte file is not required when ordered decompression reconstructs that
exact file without invoking a compiler or chess evaluator.
Descriptor-only delivery would weaken acceptance.

M5 already separates mathematical identity from byte agreement:

- `Cryptids/Compilation/Tables.lean` loads literal tables and proves their own
  halting/nonhalting statements. `Balanced.ofTree_eq_ofRows` identifies the
  container with the ordinary row-list machine. These certificates do not assume
  native compiler correctness. M5's solved small fixtures are not a substitute
  for compiling the unknown initial chess value.
- `scripts/ExportChessM5.lean:13–30` exports the elaborated table data independently
  of the compiler. `scripts/verify_chess_m5.py:207–245` compares all generated,
  published and exported bytes, parses the full table, checks counts/bounds and
  checks the manifest. Hashes are recorded identities, not mathematical proofs.
- `ChessM5Challenge.lean` imports only Mathlib/core and fixes machine semantics and
  literal data. `scripts/CompareChessM5.lean:66–113` compares target definitions and
  every transitive declaration in separate environments, not just theorem names.
  It rejects valid-transition and proposition mutations. The repository's normal
  comparator JSON also names challenge/solution modules, theorem names and the
  three permitted axioms (`comparator/README.md`, `goldbach_semantics.json`).
- The verifier forces fresh literal elaboration because external table files are
  outside Lake's ordinary import hashing (`verify_chess_m5.py:184–188`). A stale
  `.olean` is not artifact verification.

The kernel proves a theorem about finite mathematical data and rows. It does not
authenticate the filesystem, an executable, a SHA-256 implementation or a downloaded
file. Full native byte equality is the existing explicit artifact boundary; it
must not become a premise of the strategic theorem.

## Current proved components and exact remaining links

| Available component | What it establishes; what it does not |
| --- | --- |
| `SourceCertificate.program_decode`, `program_eval` (`SourceCertificate.lean:250–268`) | Exact meaning of the literal 5,952-row Code DAG; not a binary table |
| `RuntimeCertificate.eval_dom`; literal `RuntimeModel.Label = Fin 345` | Numeric interpreter rows refine the actual Runtime; not final binary rows |
| `SharedCertificate.rows`, `allHeadFree`, `onePrimitive`, `runtime_eval_dom` (`:52544–52595`) | All 4,042 normalized rows, source linkage, startup and template premises |
| `BinaryTemplates.WriteSites` (`:146–153`), `rows_refine` (`:301–322`), `halts_iff` (`:395–405`) | Complete classified writer sites and numeric block rows refine `Block.compilerFree`; actual chess site/alphabet instances remain necessary |
| `BoolGraph.Graph`/`decode` (`:43–64`) | Finite first-order Boolean tables, backward syntax children, separately cycling goto entries |
| `GraphPost.rows`, `initial`, `eval_eq`, `halts_iff` (`:178–200`, `:257–273`) | All Post rows, state zero/default store, both halting directions and exact partial output for a supplied graph |
| `GraphPost.program_correct` (`:150–169`) | Mathematical materialization agrees with graph execution; does not make `program g` an independently frozen literal snapshot |
| `Input.bits_size`, `paid_prefix`, `initialise_run` (`Input.lean:185–217`) | Exact input representation, 1,555,180 bits and 3,110,360 paid initializer states |

The proposed arithmetic macro graph is a further representation, not yet supplied
by these generic APIs. `BoolGraph.Graph.nodes` currently is a vector; the generic
theorems do not instantiate the complete chess graph or prove compact arithmetic
node lookup equal to its decoded binary source.

The retained strong-hash profile completed **12,261,090 distinct Post labels** and
then timed out during final packaging. The profile explicitly reports no packed
sample transition or serialized table (`leaf-1.32/POST-PROFILE.md`,
`runtime-numeric-fastunique.log`). Its projected total 27,632,542 follows only for
that numbering, including its extra initial state and the paid prefix. It is
not a final published bound and is not the new graph route's count.

The parent supplied a current generic-graph construction estimate of 38,890,567
nodes during review. This is a planning input, not a count certificate checked by
this leaf. Applying the proposed five-store formulas gives:

| Route/projection | Post states | Binary states including prefix | Maximum canonical text bytes |
| --- | ---: | ---: | ---: |
| Completed old support count plus unfinished packaging | 12,261,091 | 27,632,542 | 607,915,924 |
| Current generic graph estimate | 194,452,841 | 392,016,042 | 9,408,385,008 |

For positive `Q`, each row has at most `2 * (2 + digits(Q-1)) + 2` ASCII bytes:
two bounded transition cells, one space and one LF. Actual missing transitions
and shorter targets reduce that upper bound. Neither row of this table is a
completed publication or a measured compressed size. In particular, the graph
route trades expensive function-key construction for a potentially much larger
explicit finite matrix; streaming does not make its total output work small.
Selective allocation to actual read/move families can change that construction
estimate, but needs its own complete classification/addressing/count proofs.

## Concrete construction and certificate design

The names in this section are proposed interfaces, not existing declarations.

1. **Freeze small first-order construction data.** Supply literal normal-row
   descriptors, write-site PCs/inverse classification, continuation store tables,
   alphabet enumeration, block code and input segments. Every field must be finite
   data: constructor tags, bounded integers, literal finite tables and offsets.
   No stored Lean callbacks, hash maps, source equality tests or chess evaluator
   calls belong in the independently fixed target data. Primitive arithmetic
   templates must themselves have exact finite-observation specifications. Bounds
   and topology proof fields must use target-local arithmetic/data lemmas only;
   erased proof fields still count in the comparator's transitive closure.

2. **Build an arithmetic macro graph with proved addressing.** Give each macro
   family a disjoint half-open numeric range. Provide total `nodeAt` and `entryAt`,
   coverage/uniqueness of the range decomposition, exact range lengths, and strict
   decrease for every *syntax* child. Put source-control cycles only through goto
   entries. Read-tree descriptors need the complete bit prefix and depth; writer
   descriptors need site, glyph and bit/return phase. A phase or source PC alone
   loses the continuation. Prove the graph's decoded entry at every numeric label
   is exactly `BinaryTemplates.machine` for the checked SharedModel instance.

   One proof-friendly specification is a symbolic `BoolGraph.Graph` with
   `nodes := Vector.ofFn nodeAt`; use its `get` equations in proofs, without forcing
   the complete vector during execution. The production getter should operate on
   compact descriptors directly. Prove its rows equal this specification before
   reusing `GraphPost`. Alternatively generalize the graph interface to total
   indexed lookup with the same topology theorem. Either option needs new proofs;
   merely declaring `Vector.ofFn` does not solve memory or certification cost.

3. **Lower descriptors directly to Post rows.** Implement arithmetic packing of
   `(Option node, store)` and use the exact `GraphPost.trAux` equations. Preserve
   load's changed store and both branch outcomes. Emit every numeric row and both
   head bits, including halted and unused descriptors. Cache only where measured
   useful; do not create the original function-valued support list or hash index.
   Bound or measure the source instance's load/branch-only descent: well-foundedness
   guarantees termination, not a useful row-generation time bound.

4. **Define a frozen table encoding, distinct from the compiler.** Use a small
   first-order `LiteralLayout` grammar with bounded literal cells, explicit ranges,
   and fixed arithmetic/repetition templates. Its ordinary total `expand` produces
   exactly two cells for each state; `rowAt` is direct indexed lookup into that
   same finite expansion. Allow no arbitrary function-valued row constructor.
   Prove generically:

   ```lean
   (expand D).length = Q
   ∀ row ∈ expand D, row.length = 2
   rowAt D i b = ((expand D).getD i []).getD b none
   literalMachine D = ConjectureMachines.Machine.ofRows (expand D)
   ```

   Seal a closed `D` and a literal numeric `Q > 0`. Certify the source-to-layout
   correspondence by macro/range lemmas and small literal parameter certificates,
   aggregated in bounded chunks. This pays for every cell mathematically without
   checking millions of independent source/function-equality reductions. The full
   expanded text remains mandatory; compact descriptors are its representation,
   not a replacement for it.

5. **Include the whole binary body and initializer.** After GraphPost, use exactly
   `Binary.compile`'s main/return rows, then `FlatInit`'s write/return/body offset
   ranges. With graph-node count `N`, store count `K`, and input-bit count `B`,

   ```text
   P = 1 + (N + 1) * K
   Q = 2 * P + 2 * B
   Q = 2 * (1 + 5 * (N + 1)) + 3,110,360   -- for the checked five-store input
   ```

   This includes initial Post control, halted stores, all unused node/store
   pairs, every binary bounce state and the complete paid prefix. Prove the
   concrete numeral from the actual layout; do not import the old hash count.
   Keep `Input.bits`' exact content theorem, not just its length. A compact input
   bit-segment grammar needs its own expansion equality to `Input.bits.toList`.
   Retaining this specific bit stream requires the actual CodeBackend block code,
   or a proved equality of the replacement encoding's complete bit stream.
   Prove the exact paid run reaches body state zero with that tape and original
   head. All prefix and bounce rows must be total on both symbols.

6. **Close the exact table theorem.** Prove the literal layout's complete row
   equality to its own arithmetic construction, or exact decoded local rows when
   numbering differs. A local certificate must equate both `none` and `some` on
   every state/symbol and preserve writes/directions; certify initial decoding
   separately. Compose through graph/template, SharedCertificate, Runtime, Tape
   and the frozen strategic proposition. The final statement is unconditional
   `Halts literalBaseline ↔ ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`.
   Equality to StrongAssembly's particular hash ordering is unnecessary.

If "literal" is additionally required to mean that every expanded cell occurs
as its own Lean constructor, retain the same design through step 3 but seal the
text into named raw-row chunks and certify each chunk against the arithmetic
getter. That stricter representation has unavoidable linear elaboration/storage
cost; compressed descriptors alone would not meet it. The ROADMAP's required
expanded published table, exact mathematical row identity and native byte checks
are retained in either design.

## Standalone challenge and byte publication

Make the target machine depend only on its closed literal `D`, numeric `Q`, the
minimal pure table decoder, machine semantics and frozen chess definitions. It
must not import compiler correctness, SharedCertificate, Runtime proofs, hash
construction or the solution theorem. Reproduce those target declarations with
the same qualified names and bodies in `ChessM6Challenge.lean`; obtain the chess
side from the frozen standalone reference snapshot. The challenge theorem may
be a comparator placeholder; no such proof may flow into the solution.

Structural comparator equality is stricter than extensional row equality. A
descriptor-backed solution and a separately expanded-tree challenge will not
automatically compare. Use identical target data/decoder declarations on both
sides, or make the solution's exposed target use the same raw chunks as the
challenge and prove the descriptor correspondence behind it. Public stable
helper names and canonical universe parameters avoid hygiene-only mismatches.
Extend the existing complete declaration traversal; do not compare only a hash.

Define one logical `machine.txt` stream in ascending state order, symbol zero
then one. Canonical format is the existing ASCII `---` or
`[01][LR](0|[1-9][0-9]*)`, exactly one space between cells and one LF per row,
including the last. No comments, headers, leading-zero targets or CRLF. All
destinations must be strictly below the certified `Q`.

Retain that actual literal payload as, for example,
`artifacts/chess_baseline/parts/part000000.txt.zst`, and an ordered manifest.
Every part decompresses to complete ordinary canonical rows, not descriptors or
instructions asking the user to regenerate them. The manifest gives part order,
starting state, row count, compressed/uncompressed byte lengths and hashes, codec
version/options, global `Q`, and the hash/length of the concatenated plain stream.
Prove/verify the half-open state ranges cover `[0,Q)` exactly without overlap or
gaps. Decompression and ordered concatenation are sufficient to recover the
entire explicit transition table. They do not depend on the construction program.

Use buffered streaming by numeric row index, not `List.map`/`intercalate` over
the whole machine. Keep chunk boundaries outside the canonical row format.
A proposed starting size is 1,048,576 rows per part: at the graph projection's
maximum width, about 24 MiB uncompressed per full part and 374 parts in total.
Measure compressed size rather than promising a ratio. Pin codec settings and
eliminate timestamps or other nondeterministic metadata; repeat compression and
compare retained compressed bytes when claiming byte reproducibility.
Independently stream-export the elaborated frozen target data and compare every
byte with the construction export and the decompressed retained parts; two hashes
alone are not that comparison. A separate streaming parser checks grammar, row
count and bounds.
The full expanded canonical export must remain reproducible and available as a
stream; an optional raw `machine.txt` can be materialized in ignored scratch.
If a table loader compresses text into descriptor literals at elaboration, force
fresh loading and require exact full
export-back equality as well; a stale import or loader success is insufficient.
Prove the pure canonical renderer/parser round trip and concatenation of rendered
chunks agrees with rendering the complete mathematical row list. This fixes the
mathematical byte format without pretending to authenticate native IO in Lean.

Distinguish three deliverables: a raw file merely present on the construction
host is not retained publication; a descriptor plus a compiler recipe is not the
literal payload; ordered retained compressed literal parts are a lossless table
publication. Keep manifests, small descriptor/proof sources and bounded-size
compressed parts under the chosen artifact retention policy. Do not put the raw
9.41-GB projection into Git first and replace it later: the large object remains
in history. Before versioning parts, measure their combined size as well as their
individual sizes. If compressed payload is still too large for the repository,
retain it in an immutable artifact store with exact part identities and accessible
payloads; a manifest whose referenced parts are absent is an unmet publication
gate. This review performs no Git or external publication action.

The manifest should pin the toolchain/dependencies, descriptor and source hashes,
numeric `N/K/B/P/Q`, range counts/offsets, serialization version, table byte size
and SHA-256, startup convention, generator/exporter commands and proof roots.
Record native compiler/probe resource limits and unsuccessful runs separately.
No claimed throughput or new full-graph count has been measured by this review.

## Exact implementation and acceptance tests

These are required future checks, not commands claimed to pass in this leaf.

| Gate | Decisive check |
| --- | --- |
| Generic addressing | Kernel prove every range disjoint/exhaustive, pack/unpack identities, children below parents and state/symbol bounds; test first/last indices, boundaries and zero-length optional ranges |
| Concrete template instance | Check every SharedModel row, all write-site classification fields and continuations, `OnePrimitive`, `AllHeadFree`, alphabet/store bijections and store zero; reject a missing site or changed goto |
| Boolean graph | Kernel prove every entry equals the exact template body, including all block-read bit strings and malformed codewords accepted by the actual `C.decode`; reject cyclic syntax children and changed nondefault store/head cells |
| Post/body | Kernel check complete local rows including all missing transitions, halted descriptors, last store, unused states, both Boolean heads and every bounce; reject a changed write/direction/successor/`none` |
| Input/prefix | Prove exact bits and paid run, plus `Q` numeral; check empty-input generic fixture, first/last bit, all range boundaries and body offset; reject reordered bits, correct-length wrong bits and off-by-one offset |
| Literal seal | Strict fresh build of literal data and its complete range/chunk certificates; prove `literalMachine = Machine.ofRows expandedRows`, exact row length and positive count; reject invalid bounds/truncated chunks/incorrect cached lengths |
| Strategic theorem | Strict pinned-toolchain build and complete transitive axiom/definition audit of the exact literal theorem; reject `sorryAx`, new axioms, open draw theorem, unsafe/partial dependency and proof-generator dependency |
| Native publication | Two clean deterministic construction exports plus export from the fresh elaborated target, full streaming byte equality with all decompressed retained parts, parser/count/bounds/manifest checks, measured compressed sizes and source hashes before/after; reject a valid changed late unused row, reordered/omitted/duplicated/truncated part and corrupt compressed payload |
| Challenge/comparator | Fresh standalone build with no solution imports; JSON names the actual literal theorem and only three standard axioms; compare all target dependencies in separate environments and audit the machine-only closure separately; mutate proposition, literal descriptor and decoder while preserving theorem names and require rejection |
| Release integration | Full M6 verifier must succeed only after publication gates exist; retain the current fail-closed default until then. Run frozen M1–M5 regressions and supported clean-checkout comparator/CI checks; bounded traces remain supplemental |

Proposed final commands should mirror M5: a strict `Tables`/`Semantics.Chess`
build, fresh `lake env lean -DwarningAsError=true` on literal loaders, a streaming
construction executable under the alternate Lake file, an independent literal
export script, full publication verifier, and
`lake comparator --config comparator/chess_baseline.json` on the repository's
supported comparator host. These modules/configuration/publication mode do not
yet exist; name and register them when implementing, without altering frozen
M5 inputs. The current `verify_chess_m6.py:161–172` intentionally does not offer
a passing full-milestone mode.

## Adversarial reread and actual obstruction

The review attempted to replace a missing transition with an unchecked fallback,
drop unused rows, charge only reachable stores, reuse Strong's measured count,
identify different hash states, supply only the input length, omit invalid block
codes, compare descriptor hashes, reuse stale literal `.olean` files and compare
only proposition spelling. Each fails a specific gate above. A complete expanded
stream plus native agreement does not remove the mathematical certificate; a
mathematical certificate does not authenticate external bytes.

There is no demonstrated mathematical impossibility. The genuine remaining work
is the concrete arithmetic graph/layout, its complete source certificate, exact
closed count/input and literal sealing, whole-table export/resource validation,
and standalone challenge/integration. A 300-second timeout is not an impossibility
proof. Compression removes repeated proof construction and giant function keys;
it cannot remove the linear cost of producing and checking every expanded cell,
or the storage cost of the lossless retained payload. No measured compression
ratio yet establishes a small artifact. Generic graph topology also does not prove
efficient per-row evaluation.
Benchmark bounded production-shaped ranges before fixing release caps, then run
the complete sweep. If those complete costs do not fit the available host, retain
the open publication gates rather than reporting a projected count as the artifact.
