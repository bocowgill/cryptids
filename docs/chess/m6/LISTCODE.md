# Explicit list procedures for M6

`Cryptids/Compilation/ListCode.lean` defines actual mathlib `Turing.ToPartrec.Code`
syntax in `ConjectureMachines.Compilation.ListCode`. It does not extract code from
a computability proposition or add a list-operation oracle. Every semantic theorem
is an equality of `Code.eval`, including the partial fixpoint loops.

| Procedure | Input | Proven result |
|---|---|---|
| `get` | `index :: data` | Singleton selected word; zero beyond the end |
| `drop` | `count :: data` | `data.drop count`, including empty/out-of-range cases |
| `length` | `trueLength :: data` | Singleton explicitly supplied length |
| `take` | `prefix.length :: (prefix ++ suffix)` | `prefix` |
| `takeBounded` | `count :: data.length :: data` | `data.take count` |
| `set` | `index :: data.length :: replacement :: data` | `data.set index replacement` |
| `erase` | `index :: data.length :: data` | `data.eraseIdx index` |
| `insert` | `index :: data.length :: word :: data` | Insert at any index at most the length; larger indices preserve data |
| `append` | `xs.length :: (xs ++ ys.length :: ys)` | `xs ++ ys` |
| `reverse` | `xs.length :: (xs ++ suffix)` | `xs.reverse ++ suffix` |
| `foldStack step` | `stack xs :: accumulator :: parameters` | Left fold of the supplied actual scalar step code, followed by the unchanged parameters |

Counts and indices are runtime natural numbers. They do not cause syntax-tree
unrolling at construction time. The general `get_eval` interface used by rule
expressions is `get.eval (n :: v) = pure [v[n]?.getD 0]`. `get_eval_all` and
`drop_eval_all` also specify input lacking the counter.

## Framing and boundary behavior

The scalar basis observes absent words as zero through `headI`. In particular,
zero words cannot serve as end markers. The procedures therefore carry lengths
where an operation must preserve a finite output boundary. `length` reads a
length field; it does not infer the length of an arbitrary unframed list.
The stated true-length contracts are required: a caller supplying a false length
does not satisfy `takeBounded_eval`, `set_eval`, `insert_eval`, or `erase_eval`.
The chess codec supplies the relevant length from its history count and fixed
71-word position layout.

`set` and `erase` leave the list unchanged when their index is out of range.
Insertion at the length appends, while insertion past the length leaves the list
unchanged. `takeBounded` caps its requested count at the true length. The lower
level `take`, `insertPrefix`, `replacePrefix`, and `erasePrefix` contracts describe
a counted prefix actually present in the input. `replacePrefix` inserts its word
when the remaining suffix is empty; the public `set` guard prevents that behavior
from being mistaken for `List.set` at an out-of-range index.

## Concrete implementation and cost

Dynamic `drop` is a `Code.fix` counter loop. `get` applies `.head` after that loop.
Other operations collect a prefix into a scalar stack, transform the suffix, then
restore the prefix. Stack cells use

```
pack word rest = 2^word * (2*rest + 1)
stack [] = 0
stack (word :: rest) = pack word (stack rest)
```

`powTwo` uses the actual `Code.prec` implementation. `unpackLoop` repeatedly
divides a nonzero cell by two until it becomes odd. Its exact proof is induction
on the encoded word, using `PFun.fix_stop` and `PFun.fix_fwd_eq`; `splitLoop`,
`restore`, editing loops, and `foldStack` use the same actual fixpoint semantics.
There is no assumption that a singleton-output primitive-recursion combinator
can return an arbitrary list.

This stack representation is a simple correctness construction. `stack_lt_pow`
proves `stack xs < 2^(xs.sum + xs.length)`: encoded bit length is bounded by the
sum of the scalar words plus their count. Large scalar words and the basic
arithmetic implementation can still make runtime integers and execution cost
extremely large. No practical time, memory, or small-state claim follows from
these procedures. Syntax remains finite and independent of runtime list length.
This is a backend building block; it neither supplies the remaining chess rule
lowering nor completes M6.

## Verification

The focused acceptance command is:

```
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.ListCode
```

`fixtures` contains 13 kernel-checked `Code.eval` regressions, including zeros as
data, empty input, indices beyond the list, truncation, replacement, deletion,
insertion at/past the end, concatenation, and reversal. `execution_fixtures`
additionally checks the concrete sequential `stepNormal`/`stepRet` interpreter,
without native decision procedures.

The leaf evidence audit traverses both declaration types and values transitively.
It rejects proof holes, nonstandard axioms, unsafe/partial dependencies, and the
open chess conjecture. The exact Lean-generated `stack._unsafe_rec` and
`run._unsafe_rec` artifacts are inventoried separately after checking their safe
owners and identical types; they are excluded only from the root inventory, never
from dependency traversal. Both a `sorryAx` negative control and an artifact
root negative control must fail. Parent integration independently reruns the
module build and the complete M6 dependency audit.
