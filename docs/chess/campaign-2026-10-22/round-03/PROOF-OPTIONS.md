# Certifying a complete body quotient: source reconnaissance

Status: source-only report, 2026-10-22. No Lean, generator, model, fixture or count
was executed for this report. The completed remote pilot's saved summary was
read after the source reconnaissance. It measures a **114,487-state quotient**
of the accepted 573,802-state body, a prospective **459,315-state saving**.
There is no Lean quotient certificate or new accepted machine here. All accepted
files remain fixed.

## Recommendation

The measured saving is substantial. Start with the pilot's **forward old-state
to class map** and the existing `LocalCertificate` API. A new general simulation
theorem is unnecessary. The uncertain cost is certifying the complete concrete
row relation efficiently, so test that cost remotely before committing to a
million-row literal proof campaign.

Prefer a structural description of the measured partition if the pilot exposes
large regular classes. Keep a chunked literal certificate as a fallback or as
an initial bounded proof experiment. Do not delay the current seed proof for
this: that proof already targets a known prospective 1,413,567-state reduction.

Saved finite evidence: `round-03/evidence/pilot-01-diagnostics/pilot-summary.json`,
run 39795919458, commit `8cd145e0f7f13a23e50a87bac376ac0b5dc036dd`. The independent
serialized-certificate checker covered all 1,147,604 old rows and 228,974 quotient
rows, with 12 full-certificate hostile controls and one overmerged golden rejected.
The receipt reports 21.027 seconds, 287,416 KiB peak RSS, 8,397,167 certificate bytes
and 2,295,208 map bytes. These are saved remote observations, not local reruns and
not Lean resource measurements. The accepted best remains 2,411,743 states.

The diagnostic savings split is 426,798 within main, 31,317 within returns and
1,200 additional cross-family merges. Within main, 339,898 is attributed to
same-node store collapse and 86,900 to sharing across nodes. Those numbers identify where
to investigate; they are not separately certified realizable subreductions.
Restricting a stable global partition to same-node pairs can break successor
closure. A structural store-only proposal must establish its own complete rows.

## The generic semantic theorem already exists

`Cryptids/Compilation/LocalCertificate.lean:29` defines:

```lean
Rows (literal : Machine p 2) (source : Machine q 2)
    (decode : Fin p → Fin q) :=
  ∀ state bit,
    (literal.transition state bit).map
      (fun (write, dir, next) ↦ (write, dir, decode next)) =
    source.transition (decode state) bit
```

The names do not constrain the direction. Instantiate `literal` with the old
body, `source` with the quotient `Q : Machine K 2`, and `decode` with
`classMap : Fin 573802 → Fin K`. This is exactly the pilot's obligation:

`mapDestination classMap (old.transition s b) = Q.transition (classMap s) b`.

The reusable results are:

| Existing result | What it supplies |
|---|---|
| `LocalCertificate.step_decode`, line35 | Exact one-step commutation, preserving the entire tape/head and reflecting missing transitions |
| `LocalCertificate.respects`, line46 | `Respects (step old) (step Q)` for the mapped-configuration relation |
| `LocalCertificate.halts_iff`, line59 | Both blank-tape halting directions when `classMap 0 = 0` |
| `StateTransition.tr_eval_dom`, as used in that proof | Both halting directions from any related initial configurations |

Neither injectivity nor surjectivity is a premise. A many-to-one quotient is
therefore supported directly. Surjectivity, least representatives and canonical
class ordering are useful pilot/accounting certificates, but are not additional
premises of the halting proof. They also do not prove global TM minimality.

For the real chess input, use `LocalCertificate.respects` with configurations
`⟨0, tape⟩`, where `tape = Tape.mk₁ FieldSelective.bits.toList`. The same
`tr_eval_dom` argument used by `SelectiveBinary.haltsFrom` and `haltsOn`
(`Cryptids/Optimisation/SelectiveBinary.lean`) gives arbitrary-input halting.
Compose the resulting equivalence with `FieldSelective.body_halts_input`
(`Cryptids/Chess/Optimisation/FieldSelective.lean:44`). A short convenience lemma
may package this, but it is not a new mathematical simulation obligation.

**Direction trap:** choosing a representative map `Fin K → Fin 573802` and
requesting `Rows Q old representative` is generally too strong. The old successor
need not be the canonical representative of its class. Use the forward class
map, even if representatives are used to construct Q's rows.

## Connecting the actual machine and the retained pilot table

The accepted body is `SelectiveBinary.compile FieldPacked.post ...`, with
533,341 main and 40,461 return controls (`FieldSelective.lean:32`). Its existing
`rowBody_eq` at line101 proves equality with the independent numeric recipe.
That recipe is supported by `FieldCompiler.binaryRows_eq`
(`Cryptids/Compilation/FieldCompiler/Numeric.lean:30`) and
`SelectiveBinary.table_compile`.

The saved Python row-stream SHA is reproducible finite evidence, not a Lean
proof that a newly loaded table equals this body. A valid formal route must
close the link to the actual Lean definition. Either:

1. Prove `LocalCertificate.Rows FieldSelective.body.toMachine Q classMap`
   directly, optionally rewriting through `rowBody_eq`; or
2. Prove a loaded old literal table equals the actual body, then certify the
   mapped row relation between the loaded old and new tables.

Route1 avoids introducing an additional complete old-table identity theorem.
The pilot's complete mapped-row check remains valuable as an independent check
of generated proof data. Neither route needs to prove Hopcroft's implementation
correct or prove the partition is the coarsest one: any exact quotient suffices.

Every old state and both bits are mandatory. Preserve `none`, write bit,
direction and mapped successor, and prove `classMap 0 = 0`. Defining Q from
representatives additionally needs class consistency, or an equivalent proof
that each old state's row agrees with the chosen representative after mapping.
All finite destinations must be bounded; out-of-range lookup fallbacks must not
silently replace missing data.

## Reusable data and certificate machinery

`Cryptids/Compilation/BalancedTable.lean` provides:

- `Balanced.RowTree` with cached subtree counts; `WellFormed` verifies every
  cached count, and `lookup_eq_getD` proves ordinary flattened-list semantics.
- `Balanced.ofTree` and `ofTree_eq_ofRows` (lines117–124) for explicit machines.
- `load_balanced_rows%`, `balancedRowsExpr`, `balancedCellExpr`, and
  `boundedFinExpr`: elaborators construct ordinary typed data and kernel-checkable
  finite bounds. They do not certify a relation to a compiler by themselves.

`Cryptids/Chess/Compilation/SourceCertificate.lean` supplies a useful packaging
precedent: `RowsCertificate`, `rows_step`, `rows_append`, `rows_get`, and
`indexed_of_structural`, plus `Generator.certifyChunk`/`certifyBlocks`
(lines175–220). The accepted source proof checks 5,952 source rows in 32-row
chunks, builds shared named theorems, and joins them through a balanced tree.
The generator proposes proof terms via `addDecl (.thmDecl ...) true`; the kernel
checks them. The generator must stay outside the mathematical dependency closure.

These particular source certificates describe `CodeDAG` constructors with
backward child indices. **Do not reuse their acyclic decoder theorem for the
cyclic binary machine.** Reuse the chunked proof architecture and define the
appropriate exact-row predicate. `FieldCompiler.Snapshot.Correct` and
`correct_lookup` give another structural per-leaf/balanced-tree pattern whose
conclusion is universal lookup correspondence, including fallbacks.

## Main proof-size risks

The literal route has 573,802 map entries and 1,147,604 old-row obligations,
regardless of K. The measured quotient itself has 114,487 two-symbol rows. These are input
censuses, not measured Lean resource costs. Existing accepted 5,952-row source
certificates do not establish scalability to this workload.

Risks to measure:

1. Repeated normalization of large map/table definitions can dominate an
   apparently small per-row equality. A shallow getter does not by itself make
   loading and kernel-checking the entire literal constant cheap.
2. The old body is computed through syntax lookup, `LazyGraph.trAux`, compact
   control decoding and return lookup. Evaluating every concrete row from scratch
   can repeat substantial shared work.
3. `Syntax.nodeAt_csimp` (`FieldCompiler/Graph.lean:122`) selects the proved faster
   getter for native compilation. Do not assume the kernel's definitional
   reduction gets that same speedup automatically. Explicitly rewrite with
   `fastNodeAt_eq` or certify an efficient row accessor where needed.
4. A single giant `decide +kernel` proof or literal declaration can exceed memory
   even if the native finite checker is fast. Use separate shared constants,
   bounded chunks and balanced composition; measure import and checking costs.
5. `native_decide` or a trusted hash assertion must not replace ordinary proof
   terms under the campaign's safe-axiom audit. The candidate data can come from
   untrusted search; its exact row certificate cannot.

The measured saving justifies this bounded follow-up: remotely load the
complete candidate data, then certify increasing bounded chunks (for example
64,512,4096 source states) covering entry/halt, return controls, store-dependent
branches and deeper pure-load paths. Include deliberately wrong class/row data
that the kernel rejects. Record source bytes, import/build time, peak memory and
proof artifact size. Set explicit time/memory limits before running; if data
loading alone fails or costs grow unfavorably, stop the literal route and keep
its obstruction. A partial chunk pass is only a scalability pilot.

## Structural alternatives, ranked after the measured pilot

| Route | Plausible absolute saving | Proof difficulty / effort | Decision evidence |
|---|---|---|---|
| Forward exact quotient of the binary body | Measured prospective 459,315; no additional runtime control is intrinsically needed | Generic semantics already available; concrete certificate may be expensive | Bounded certificate scaling using the retained complete partition |
| Formulaic sharing of store-insensitive controls and repeated suffixes | Unknown realizable subset of 459,315; 339,898 same-node store collapse is a diagnostic, not a standalone quotient | Moderate to high; smaller structural proof may beat a million-row certificate | Pilot store-family histogram and representative/class patterns, followed by an independent row-closure check |
| Shared syntax DAG before Post/binary compilation | Unknown; can remove duplicated syntax categories, but may miss binary-only equivalences | High: new many-to-one node map, graph correspondence and return layout | Compare identifiable repeated syntax with measured classes |

`CompactPost.transition_tr`, `step_trCfg`, `respects`, and `halts_input`
(`Cryptids/Optimisation/CompactPost.lean`) are a source-level example of exact
quotienting on all tapes. They currently merge halted stores and duplicate
entry control, while keeping every live node/store pair. They are a proof
pattern, not an existing solution for arbitrary store equivalence.

For structural store sharing, prove a row invariant after every intervening
load/branch; equal output in the next instruction alone is insufficient because
later instructions can observe the stored value. `LazyGraph.trAux_*` exposes
move/write/load/branch/goto/halt cases and decreases through pure syntax children.
`FieldReturns.trAux_write_covered` is a useful induction pattern over all nodes,
bits and stores. Goto behavior must retain its label-entry and store effects.

For syntax sharing, `FieldPacking.Layout` deliberately requires a bijection
(`Cryptids/Compilation/FieldPacking/Interface.lean:20`). It cannot represent
many-to-one DAG deduplication unchanged. A new interface/proof would be needed.
Maintain well-founded local child descent and separately handle goto labels;
do not assume the complete interpreter transition graph is acyclic.

## Full-machine accounting and acceptance boundary

For the measured 114,487-state replacement body, the unchanged accepted reverse
writer would give a prospective **1,952,428** total states. If the current seed
round is independently accepted, its paid writer/controller/bridge would give a
prospective **538,861**. These totals are the saved pilot's accounting, not newly
accepted machine counts. The quotient's Lean certificate remains pending. The full
machine must be composed, exported and audited anew; do not subtract the pilot
saving from the accepted best prematurely.

The class map and its proof are certificate data, not preloaded tape or runtime
states. A direct explicit K-state quotient table needs no hidden parser or class
lookup machine. If a different implementation introduces such controls, count
them in the full total. Keep all existing input/initialization proofs, frozen
specification, remote-only computation and final sealed-evidence requirements.

## Source-review record

Four static passes completed: API direction and theorem premises; exact old-table
connection; data/proof scalability and unsafe-shortcut risks; source locations,
accounting formulas and scope. No remaining source-level issue identified in
this report. All proposed new proofs and resource estimates remain unverified.
