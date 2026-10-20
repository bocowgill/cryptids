# Verified finite multi-stack lowering

`Cryptids.Compilation.Stack` implements a reusable compiler for Mathlib TM2 programs. Its source
language has finitely many stacks and a finite store, while every stack has unbounded length.
Stack alphabets may differ. Source labels need only have decidable equality: their entire type
may be infinite, provided a finite label support and its closure proof are supplied.

The primary literal-state API is:

```lean
numberedStack M C sourceLabels symbols stores k : NumberedPost
```

Here `M : Λ → TM2.Stmt Γ Λ σ`, `C : BlockCode (TM2to1.Γ' K Γ)`, `sourceLabels : List Λ`,
`symbols : List (TM2to1.Γ' K Γ)`, and `stores : List σ`. The correctness theorem
`numberedStack_halts` requires:

- `TM2.Supports M sourceLabels.toFinset`;
- every intermediate alphabet symbol occurs in `symbols`;
- every store value occurs in `stores`.

The result contains `extraStates : Nat`, a binary Post transition function with literal states
`Fin (extraStates + 1)`, initial state zero, and `input : List Bool`. Its `Halts` predicate is
exactly termination of that transition function on that input. The theorem proves

```lean
(numberedStack M C sourceLabels symbols stores k).Halts ↔ (TM2.eval M k []).Dom
```

The empty list means all source stacks start empty, independent of the designated stack `k`.
A source initializer can push arbitrarily much finite program data before entering the main
interpreter. That is how the game client supplies its serialized tree.

An alternative `compileStack M S ss C k` accepts a `Finset Λ` support directly. Its result uses
the finite subtype of reachable generated labels. `compileStack_halts` has the same halting
contract. This API avoids needing an ordered source-label enumeration. The literal-state API
adds explicit ordered traversals and numbering.

## Source operations and adequacy

The actual supported instructions are push, peek, pop, finite-store update, finite-store branch,
computed goto, and halt. Push, peek and pop operate on any designated stack. Peek and pop return
an `Option` symbol, so empty stacks can be detected; pop on empty leaves the stack empty. Each
statement is finite syntax; goto permits unbounded looping. Every function field has a finite
domain, so it denotes a finite lookup table, and its equality is decided by enumeration. No
source operation runs arbitrary Lean recursion on an unbounded object.

The language permits unbounded binary naturals and lists by using finite-symbol strings on
stacks, with separators, and permits runtime recursion by storing call frames on a stack.
Finite store capacity does not bound these data. This adequacy is supported by an existing
concrete Mathlib client: `Mathlib/Computability/TuringMachine/ToPartrec.lean`, namespace
`Turing.PartrecToTM2`, implements partial recursive list/natural-number code with four stacks,
a four-symbol stack alphabet, a five-valued store (`Option Γ'`), and an infinite syntactic label
type. The declared alphabets are `Γ'` and `K'`; `trList` and `trNat` encode unbounded lists and
binary naturals, `trContStack` stores continuation data, `tr_eval` proves the interpreter's
operational correspondence, and `codeSupp` with `tr_supports` supplies a finite supported label
set for each code. `Adequacy.compileClosedCode` instantiates this exact interpreter, using default label
`trNormal c halt` and support `codeSupp c halt`. Its kernel-checked theorem
`Adequacy.compileClosedCode_halts` proves, for every `ToPartrec.Code c` and supplied valid block
code `C`, that the compiled finite binary Post machine halts exactly when `Code.eval c []` is
defined. This is a formal adequacy corollary for closed arithmetic/list/fixpoint programs, not
an inference from a native evaluation.
For the literal-state interface one additionally supplies an explicit ordered cover of that
support; the compiler does not silently choose an order from a quotient finset.

This is a backend language and simulation theorem. It does not yet translate the repository's
M4 chess search definitions into this language, establish chess move generation in TM2, or
prove a general resource bound for that future translation. A general Lean function cannot be
passed to the compiler as an unbounded source primitive. The present game interpreter is a
specific finite-control client, with its own source correctness proof.

## Actual simulation chain

The implementation composes these Mathlib constructions, rather than inferring a compiler
from native Lean evaluation:

1. `TM2to1.tr` stores the stacks as parallel tape tracks. The intermediate alphabet is
   `Bool × (∀ k, Option (Γ k))`. The Bool marks the bottom; a missing track entry denotes a
   stack that does not reach that cell. `TM2to1.tr_eval_dom` proves both halting directions.
2. `TM1to1.tr` represents each tape symbol by a fixed-width binary block. `BlockCode.blank`
   makes the source blank an all-false block; `BlockCode.roundtrip` proves decoding after
   encoding. `blockCfg_init` proves the target starts on the actual flattened finite input,
   including its tape head position. `blockMachine_dom` uses `TM1to1.tr_respects` and
   `StateTransition.tr_eval_dom`, so both halting directions hold.
3. `TM1to0.tr` lowers structured control to Post moves/writes. `TM1to0.tr_eval` proves exact
   evaluation equality, including termination. The store is incorporated into finite control.
4. Generated labels are constructively restricted or numbered. `restrictMachine_dom` and
   `numberMachine_dom` use `TM0.Machine.map_respects` and the support invariant. Their reverse
   halting conclusions exclude accidental termination caused by unreachable fallback cases.

The result is a Bool TM0 Post machine with a finite nonblank input. The separate binary-machine
bridge translates writes/moves, and the separate blank initializer writes that input and
restores the head before starting execution. This module's theorem does not discharge that
last initialization obligation by itself.

## Constructivity and ordering

Mathlib's support finsets `TM2to1.trSupp`, `TM1to1.writes`/`trSupp`, and
`TM1to0.trStmts` use classical equality in their implementations. `Finite.lean` supplies
executable structural equality for function-bearing TM1/TM2 syntax and intermediate labels,
and executable support collectors. Equality theorems identify these with Mathlib's finsets,
allowing reuse of Mathlib's invariant proofs. The generated recursive equality functions are
ordinary total structurally recursive Lean definitions; their generated matchers and helpers
are included in the dependency audit.

A `Fintype` contains an unordered quotient finset. Its `Finset.toList` is noncomputable.
Consequently neither alphabet encoding nor numbered control calls `Finset.toList`.
`BlockCode.ofList symbols cover` uses an explicit alphabet list, placing the default first and
filtering its other occurrences. It encodes a symbol's first-occurrence index as a little-endian
bitvector. Its decoder performs a finite lookup, sending unused patterns to the blank symbol.
The file proves encoding injectivity, blank encoding, and decode/encode roundtrip.

The explicit control collectors traverse syntax in constructor order and retain duplicates.
The control list is prefixed by the source initial generated label. `numberLabel` uses the
first occurrence; `unnumberLabel` is list lookup. `unnumber_number` proves the retraction on
all supported labels, and `numberLabel_default` proves initial index zero. Duplicate rows
remain valid total transition rows; they add states but do not weaken correctness.

## Size and performance costs

For source stack alphabet sizes `gₖ`, the intermediate alphabet has
`2 * ∏ₖ (gₖ + 1)` elements. A duplicate-free explicit alphabet list gives block width
`floor(log₂ alphabetSize) + 1`, at most one above the minimum; a 48-symbol alphabet uses six
bits. The binary read syntax branches on all `2^width` patterns, including unused ones. This
is logarithmic-width block encoding, not a one-hot encoding with `2^alphabetSize` branches.

`postSupportList` enumerates every generated substatement paired with every store value,
plus halted controls. The numbered state count is exactly one plus the length of this list.
It can substantially exceed the number of distinct reachable controls because duplicate
subterms and duplicate labels are retained. The final bridge's write-return states and the
blank initializer's prefix are separate additions to that count.

The present first-occurrence numbering searches a list and compares finite function-bearing
syntax extensionally. This can be expensive for literal table generation even when the formal
correctness theorem is small. The compiler gives no linear-time or practical-size guarantee;
concrete generation must report measured counts and runtimes. A future deduplication/indexing
optimization must preserve the explicit retraction and support proof.

A width-six ordered-support counting experiment for the four concrete game clients was stopped
after several minutes without completing. It traversed the actual generated syntax with dummy
encoding functions used only to fix block width; it made no semantic or size claim. The source
is preserved in `.unlazy/chess-m5/leaf-1.2/measure.lean`. In particular the Mathlib binary compiler
can repeat continuation syntax below each read leaf, causing exponential raw syntax traversal
in sequences of reads. A successful formal compiler build does not establish that the current
ordered table enumerator is practical for these clients. Concrete artifact generation is an
explicit integration obligation.
