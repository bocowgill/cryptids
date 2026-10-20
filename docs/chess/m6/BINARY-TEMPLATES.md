# Direct numeric binary block templates

`Cryptids/Compilation/BinaryTemplates.lean` provides a generic, executable finite numeric
snapshot of the frozen M5 `Block.compilerFree`. It imports neither the chess program nor
`SharedModel`. All declarations are in
`ConjectureMachines.Compilation.BinaryTemplates`.

## Data and explicit premises

For source `M : Fin n → TM1.Stmt Γ (Fin n) σ`, provide a block code `C : BlockCode Γ`,
an executable alphabet equivalence `alphabet : Fin m ≃ Γ`, and `sites : WriteSites M w`.
The site table consists of:

- `pc : Fin w → Fin n`, the source PC for each write site;
- `next : Fin w → Γ → σ → Fin n`, its saved goto function;
- `siteFor : Fin n → Option (Fin w)`, the source-PC classification table;
- `row`, checking each listed row is a write followed by that saved goto;
- `lookup` and `inverse`, checking both directions of the site/PC association;
- `covers`, checking that every source write is classified.

These are finite tables and constructor equalities. No runtime function equality, hash,
`idxOf`, or search through raw block-compiler labels is used. The machine only reads
`siteFor` and the saved continuation. `WriteSites.classified_iff` proves classification
holds exactly on write rows. `pc_injective` and `count_le` prove the site table has no
duplicate PCs and `w ≤ n`.

`rows_refine` takes the additional explicit premise
`∀ q, TM1Normalize.OnePrimitive (M q)`. This is the frozen M5 predicate: one move, write,
or load followed by a goto; a branch followed by two gotos; a goto; or halt. Invalid
constructor combinations and an absent write-site classification have total halt
fallbacks in `normalRow`; the checked premises exclude those fallbacks in the theorem.

## Numeric control and exact rows

The target label type is `Fin (n + w*m)`. `normal w m q` has value `q`, and
`writer n site glyph` has value `n + (glyph + m*site)`. `labelEquiv` establishes the exact
bijection with `Fin n ⊕ (Fin w × Fin m)`, so the count includes all writer glyphs and
there are no unaccounted target labels. `state_count` and `state_bound` expose the bound.

`decode` maps these two regions to `.normal q` and
`.write (alphabet glyph) (.goto (sites.next site))`. Numeric state zero decodes to
source normal zero (`decode_initial`, requiring `NeZero n`).

`machine C M sites alphabet` builds normal rows directly from their primitive source
shape. It reads through `C.decode` when needed, retains the exact write/load/branch
fields, and freezes each saved goto's tape argument at `default`. A write destination
uses the known site number and `alphabet.symm` of the actual written symbol. Writer rows
write every encoded bit, move left by `C.width`, and jump to the saved normal continuation.

The central theorem is unconditional on the numeric PC:

```lean
rows_refine C M sites alphabet primitive :
  LocalCertificate.TM1Rows (machine C M sites alphabet) (Block.compilerFree C M)
    (decode sites alphabet)
```

It proves the exact statement equality at every target label, including writer labels
that a particular execution never visits. `map_move`, `map_readAux`, `map_read`, and
`map_write` commute label renaming with whole macros. The corresponding `*_mathlib`
lemmas identify their shapes with Mathlib's implementation, avoiding any expansion of
an 11-bit read tree in client proofs. The generalized macros preserve Mario Carneiro's
Mathlib attribution. `machine_allHeadFree` proves every generated jump is head-free.

## Input and both domain directions

The numeric input is exactly `blockInput C input`; there is no extra initializer or
unpaid data in this leaf. `supports_univ` supplies an explicit finite support for both
source and target without a reachable-label oracle.

`halts_iff` additionally requires `Inhabited σ`, `NeZero n`, and the explicit source
premise `∀ q, Block.AllHeadFree (M q)`. For every source input:

```lean
(TM1.eval (machine C M sites alphabet) (blockInput C input)).Dom ↔
  (TM1.eval M input).Dom
```

The proof composes `LocalCertificate.tm1_halts_iff` on the exact row certificate with
`Block.free_dom` on the complete finite source support. Head freedom is a semantic
premise here: the row theorem itself needs only source primitive classification.

## Verification and scope

Recheck this leaf from the repository root with:

```text
python3 .unlazy/chess-m6/leaf-1.36/verify.py
```

The checker verifies sealed file hashes, runs the focused strict target
`lake --wfail build Cryptids.Compilation.BinaryTemplates`, kernel fixtures, native
execution, a full declaration-closure audit, and six rejection controls. Each child
process has a 60-second cap; direct Lean probes have `-M8192`. The checker records
completed-process RSS in bytes and rejects observations above 8 GiB. It performs no
aggregate build and no gate approval command.

The finite fixture has eight source PCs, two distinct write sites, a two-symbol
alphabet, twelve numeric target PCs, and width-two cells. Kernel checks cover both
writer glyphs, padding-bit replacement, two-bit motion in both directions, load,
both branches, store-dependent goto, halt, complete executions on nonempty and empty
inputs, and a domain proof from actual finite transition reachability. A separate
zero-write-site goto loop is proved to diverge for every input in both machines.
The singleton alphabet with width zero is also accepted. Native checks execute all
96 PC/store/head/padding corners plus four execution assertions.

Mutation controls reject a false writer result, a misclassified write site, a wrong
saved continuation, and a false head-freedom certificate. Audit controls reject
`sorryAx` and a compiler-generated partial recursion artifact. The full positive audit
covers 138 module declarations and 4,724 transitive dependencies, including declaration
types, values, inductive declarations, and recursor rules. Only `propext`,
`Classical.choice`, and `Quot.sound` occur. There are no proof generators in this module.
Two Lean-generated `_unsafe_rec` artifacts are inventoried separately after checking
that their owners are safe and their types match; neither is in any safe mathematical
root's dependency closure. Standard library meta metadata is traversed with the same
safety and axiom checks, without exemptions.

This leaf does not instantiate the actual chess source, export a first-order target
graph, or close the complete M6 artifact gate. Those integrations remain parent work.
The generic numeric compiler, row correspondence, support, and both halting directions
have no remaining proof obligations.
