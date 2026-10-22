# Conditional structural certificate for map invariants

Source-only design, 2026-10-22. No new proof, measured memory improvement or
accepted state reduction is claimed. This can unlock the existing conditional
459,315-state body saving; it does not add a separate saving.

Trial 11 shows that MapChecks alone exceeds 6 GiB. Trial 12 separates generic
setup and the concrete count/cache/range proofs. Use this alternative only if
that evidence identifies invariant normalization as the obstruction. A failure
to import the generic prelude calls for a different diagnosis.

Trial 12 now supplies that evidence: its generic prelude and full-private audit
pass; MapCount alone exceeds 6 GiB after 20.701 seconds. Root consequently
authorized one source revision and bounded remote test of this design, preserving
all original caps and proof obligations. No new proof result follows from that
authorization.

## Existing verified patterns

- `Cryptids/Chess/Compilation/SourceCertificate.lean`,
  `Generator.certifyBlocks` (line192): recursively emit named, kernel-checked
  theorem declarations with `addDecl (.thmDecl ...) true`, compose named child
  proofs with `rows_append`, and return `mkConst name`. The list lemma is not
  itself a RowTree lemma; the proof-construction pattern is reusable.
- `Cryptids/Compilation/SharedCertificate.lean`, `checked_chunk0000` (line51623)
  and `checked` (line52510): a direct RowTree precedent for proving small chunks
  and assembling global coverage from their theorem constants.
- `Cryptids/Compilation/BalancedTable.lean`, `RowTree.count` and `WellFormed`
  (lines33–49): the structural count ignores cached fields; validity checks the
  exact left count and both children recursively.

An independent source scout confirmed these patterns. Existing files remain
fixed; the following constructor lemmas are proposed, not newly checked:

1. From `left.count = nl` and `right.count = nr`, derive
   `(branch nl left right).count = nl + nr` using `congrArg₂ Nat.add`.
2. From `left.count = nl`, `left.WellFormed` and `right.WellFormed`, derive
   `(branch nl left right).WellFormed` using
   `⟨countLeft.symm, validLeft, validRight⟩`.
3. From bounds for both children, derive
   `mapAllBelow (branch nl left right) bound = true` using `Bool.and_eq_true.mpr`.

## Bounded test

Emit named midpoint subtrees with at most 1,024 leaves, preserving the complete
existing raw map order. Prove each chunk's count, validity and raw bounds with
ordinary kernel evaluation. Emit named internal nodes and prove each corresponding
fact by applying a constructor lemma to child theorem constants. Define the
global map as the root and expose its three root theorems. Keep exact input-byte
identity, the complete six map roots, decoder fidelity, all actual RowAt goals,
full-private audits, negative controls and original resource caps.

At assembly, the kernel matches the same subtree constants in theorem types and
checks the outer constructor. It need not unfold every leaf. This is a structural
reason to test the approach, not an RSS or runtime guarantee. The decisive pilot
must compare the same complete map and invariants under the current limits.

## Failure modes to avoid

- A global `decide +kernel` at the end would undo the benefit. The quotient already
  has chunked data but still computes its invariants globally; it may need the
  same treatment only if that becomes the next measured obstruction.
- Do not define chunks as projections of one huge tree or add a huge final tree
  equality proof. Those can reintroduce the same normalization.
- Parent cached sizes must use proved child structural counts. Untrusted cached
  integers are insufficient.
- The raw map bound stays 114,487, and the packed quotient-code bound stays
  `4 * 114487`; chunk length is not a destination bound. Check raw values before
  modulo conversion and preserve `classMap_val`.
- `noinline` governs native compilation, not kernel transparency.
- Shared imports, accumulated declarations and full-private audits still cost
  memory. If needed, use measured batches of chunk-proof modules; count their
  builds and audits within the original shared 120-second Data allowance.

No representation redesign or implementation is authorized by this note alone.
