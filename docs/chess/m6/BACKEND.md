# Constructive Code backend

`Cryptids/Compilation/Code.lean` supplies an executable adapter for an arbitrary closed
`Turing.ToPartrec.Code`. It does not yet supply the chess program or a serialized chess table.

The public interface is in `ConjectureMachines.Compilation.CodeBackend`:

```lean
post : Turing.ToPartrec.Code → NumberedPost
post_halts (c) : (post c).Halts ↔ (c.eval []).Dom
generated : Turing.ToPartrec.Code → BundledMachine 2
generated_halts (c) : (generated c).Halts ↔ (c.eval []).Dom
generated_states (c) :
  (generated c).states = 2 * ((post c).extraStates + 1) + 22
```

The halting equivalence is unconditional for every code, including divergent code. In particular,
`zero_halts` proves halting of the generated zero program and `spin_not_halts` proves
nontermination of a generated program whose fixpoint always returns a positive continuation flag.
These are kernel proofs using the generic compiler theorem; neither executes an unknown program
to establish its behavior.

## Ordered support

Mathlib proves that the multi-stack interpreter has finite support. Its `codeSupp` is a finset;
turning that finset into a list through the noncomputable `Finset.toList` would leave an executable
compiler gap. The new module instead mirrors all three traversals constructively:

| List traversal | Existing finset specification | Proven equality |
| --- | --- | --- |
| `trStmtsList` | `PartrecToTM2.trStmts₁` | `trStmtsList_toFinset` |
| `codeSuppList'` | `PartrecToTM2.codeSupp'` | `codeSuppList'_toFinset` |
| `contSuppList` | `PartrecToTM2.contSupp` | `contSuppList_toFinset` |
| `codeSuppList` | `PartrecToTM2.codeSupp` | `codeSuppList_toFinset` |

Each traversal uses constructor recursion, cons, append, and flatMap. A read enumerates exactly
the five values of `Option PartrecToTM2.Γ'`. The lists can contain duplicates. Converting these
lists to finsets occurs in the support proofs; compiling the machine executes the list traversal.
`codeSuppList_toFinset` transports Mathlib's support theorem to the existing M5 `fastStack`
adapter, preserving its numeric normalization and nominal caches.

## Alphabet and initialization

The interpreter has four stacks. Each simultaneous tape cell contains a bottom-marker Boolean
and one of five values for each stack: `2 * 5^4 = 1250` symbols. `symbols` lists them explicitly,
`symbols_cover` proves coverage, and `symbols_length` checks the count in the kernel.

The binary block has width 11. Encoding computes a base-five rank directly:

```text
625 * bottom + 125 * main + 25 * rev + 5 * aux + stack
```

Stack digits are 0 for absence, then 1–4 for the four interpreter symbols. Decoding uses division
and remainder, avoiding a linear search over 1,250 candidates. `symbolRank_lt`,
`symbolUnrank_rank`, `readBits_encodeSymbol`, `encodeSymbol_blank`, and `decode_encodeSymbol`
prove the entire codec contract. Unused binary words decode to ordinary alphabet symbols; no
behavior on these words is assumed in the simulation proof. Hashes combine the Boolean and four
coordinates; exact equality remains authoritative.

All source stacks start empty. The Post input is one encoded bottom-marker symbol, so its exact
length is 11, independently of the source code. The verified blank initializer adds 22 states.
The write-and-move binary translation adds two states for each numbered Post state. Source code,
including any constants it constructs, resides in the finite control. The adapter supplies no
chess-specific tape input and no oracle.

## Emission boundary and validation

This adapter constructs a finite, numbered machine with a proved semantic correspondence. Its
state-count formula includes the full initializer. It does not prove that separately emitted
literal rows equal that constructed machine. M6 integration must still establish pointwise table
identity and connect the actual translated chess code to the frozen M4 evaluator.

The 1,250-symbol alphabet and binary control expansion are substantial costs. An interpreted
`lake env lean --run` probe for `post .tail` was interrupted before obtaining a complete state
count, even though that source has only two ordered support labels. No numerical chess-machine
size follows from this experiment. Native profiling and a reproducible emitter remain integration
work; the generic theorem is independent of such profiling.

The focused target builds with warnings treated as errors:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Code
```

Local leaf evidence under `.unlazy/chess-m6/leaf-1.6/` contains 28 runtime assertions, including
every alphabet round trip, all seven code constructors' support traversals, and sequential code
fixtures. Its transitive declaration audit accepts only `propext`, `Classical.choice`, and
`Quot.sound`; a `sorryAx` positive control is rejected. Exact compiler recursion artifacts are
inventoried outside the audit roots and are never exempted if encountered in a dependency closure.
The root campaign must re-run and incorporate these checks into its durable M6 verification.
