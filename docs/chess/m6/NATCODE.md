# Concrete natural-number programs

`Cryptids/Compilation/NatCode.lean` defines actual `Turing.ToPartrec.Code` values in namespace
`ConjectureMachines.Compilation.NatCode`. No arithmetic oracle or existence-only extraction is
used. Runtime programs expand solely to mathlib's seven constructors (`zero'`, `succ`, `tail`,
`cons`, `comp`, `case`, `fix`). The semantic theorems assert equality of the actual partial
`Code.eval` with a pure output; they therefore prove termination as well as the exact result.

## Calling conventions and complete public API

For an arbitrary input list `v`, write `a = v.headI` and `b = v.tail.headI`.
Every absent word is zero. Extra words are ignored by arithmetic primitives.

| Procedure | Exact output | Theorem |
| --- | --- | --- |
| `drop i` | `v.drop i` | `drop_eval` |
| `nth i` | `[v[i]?.getD 0]` | `nth_eval` |
| `tuple cs` | Heads of each component result, in order | `tuple_eval_part`, `tuple_eval` |
| `literal n` | `[n]`, regardless of `v` | `literal_eval` |
| `add` | `[a + b]` | `add_eval` |
| `subtractCount` | `[b - a]` | `subtractCount_eval` |
| `sub` | `[a - b]`, saturated at zero | `sub_eval` |
| `mul` | `[a * b]` | `mul_eval` |
| `double` | `[2 * a]` | `double_eval` |
| `isZero` | `[1]` if `a = 0`, else `[0]` | `isZero_eval` |
| `positive` | `[0]` if `a = 0`, else `[1]` | `positive_eval` |
| `le` | `[1]` if `a ≤ b`, else `[0]` | `le_eval` |
| `lt` | `[1]` if `a < b`, else `[0]` | `lt_eval` |
| `eq` | `[1]` if `a = b`, else `[0]` | `eq_eval` |
| `div` | `[a / b]`; `[0]` when `b = 0` | `div_eval` |
| `mod` | `[a % b]`; `[a]` when `b = 0` | `mod_eval` |
| `ifZero test yes no` | `yes.eval v` if test head is zero, otherwise `no.eval v` | `ifZero_eval` |

`tuple_eval_part` is unconditional even for divergent components: its RHS is the `Part` monadic
map of each code's output head. An empty component result contributes zero. `tuple_eval` provides
the convenient total-function specialization when supplied with component refinement proofs.
`ifZero_eval` requires only a proof of the test result; the selected branch receives the complete
original input and retains its own partial semantics.

`prec_eval f g F G hf hg n v` proves that mathlib's concrete `Code.prec f g` evaluates on `n :: v`
to `[Nat.rec (F v) (fun index accumulator => G index accumulator v) n]`, assuming the displayed
exact refinements of `f` and `g`. The recursive step receives `index :: accumulator :: v`.
The residual list `v` is unchanged at every iteration. `prec_eval_all` additionally covers an
empty or arbitrary input using its default head and tail. These are direct proofs about the
existing `Code.prec` implementation, including its `Code.fix` loop.

`divisionBody` and `divisionLoop` are exposed implementation helpers. Their specifications concern
exactly three-word lists: `divisionBody_eval a b q` returns either `[0,q,a]` on exit or
`[1,a-b,b,q+1]` on continuation. `divisionLoop_eval a b q` returns `[q+a/b,a%b]`.
Strong induction on `a` proves the fixpoint terminates whenever it continues, since `b > 0`.
The public `div` and `mod` normalize every possible input list to this interface.

## Constant construction size

`literal` uses `Nat.binaryRec`. Each binary digit wraps one recursively constructed subtree in
`double`, optionally followed by `succ`; it never duplicates that recursive subtree.
`nodes` counts occurrences in the fully expanded syntax tree. `literal_nodes_linear` proves

```
nodes (literal n) ≤ 5 + 107 * Nat.size n
```

For `13^64`, the reproducible check reports binary length 237 and 25,086 actual constructor nodes,
below the bound 25,364. This is a construction-size guarantee. Arithmetic still executes through
successor/predecessor loops, so evaluating enormous literals can take enormous time.

## Verification and limits

The focused `lake --wfail build Cryptids.Compilation.NatCode` passes. Evidence is retained under
`.unlazy/chess-m6/leaf-1.2/`: the exact fixture source and output, axiom-query source and output,
build log, source hashes, and four-pass review ledger. Fixtures use mathlib's actual `stepNormal`
and `stepRet` continuation machine, with a proved sound fuel runner, and exercise literal
construction, missing projections, tuples, arithmetic/comparison, nontrivial division/remainder,
zero divisors, and empty input. Their concrete semantic equalities are separately kernel checked
using the general refinement theorems. No runtime observation is promoted to a general theorem.

All operations requested for this arithmetic leaf are supported. This module does not implement
the chess rules, variable-length list encodings, the complete M4 evaluator translation, or a
concrete chess machine table. Those remain separate integration obligations. No M6 completion
claim follows from this arithmetic library alone.
