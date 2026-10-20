# Function-backed finite graph lowering

`Cryptids/Compilation/LazyGraph.lean` defines the namespace
`ConjectureMachines.Compilation.LazyGraph`. It presents a finite first-order Boolean
syntax graph using two functions, `node : Fin n → BoolGraph.Node n k labels` and
`entry : Fin labels → Fin n`. Its `below` field proves that every syntax child has a
smaller index. This field is a proposition and is erased during execution. Goto targets
select entries and may form control cycles.

`asGraph` interprets the getters as the existing `BoolGraph.Graph`, using `Vector.ofFn`.
The equations `asGraph_node` and `asGraph_entry` hold for every index. This interpretation
is used to state and prove semantics. Runtime `trAux`, `descriptor`, and `machine` call
the getters directly. They do not call `asGraph`, `BoolGraph.decode`, graph enumeration,
or the materialized `GraphPost.program`.

`trAux` returns one Post instruction and its finite node/store successor. Move and write
return their child directly. Load first updates the store, then descends. Branch tests
the current bit and current store before descending. Goto reads its label table and
calls the entry getter. Halt emits a preserving write to a separate halted descriptor;
only the following lookup has no transition. Descent through load and branch is justified
by the certificate. Lookup cost therefore depends on the supplied getters and the
visited load/branch chain, rather than on materializing all `n` nodes.

| API | Guarantee |
| --- | --- |
| `trAux_move/write/load/branch/goto/halt` | Exact constructor equations for direct getters |
| `trAux_eq` | Every node, bit and store agrees with `GraphPost.trAux (asGraph g)` |
| `descriptor_eq` | Every numeric descriptor agrees, including state zero |
| `machine_eq` | Equality of complete numeric transition functions, including missing rows |
| `rows`, `step_decode` | Exact local and one-step certificates with the whole tape |
| `initial`, `init_decode` | Ordinary state zero and the original arbitrary input tape |
| `eval_decode` | Exact complete terminal configurations |
| `eval_eq` | Equality of partial tape outputs on every input |
| `halts_iff` | Both termination directions on the same input |

The numeric state type is exactly `Fin (GraphPost.stateCount n k)`, and `stateCount_eq`
gives `1 + (n + 1) * k`. The count retains the distinguished initial state, every
node/store pair, and every halted store. No quotient or unreachable-control pruning is
used. Output and initialization theorems assume an equivalence `store : Fin k ≃ σ`
with `store 0 = default`, just as the sealed backend does. Neither termination nor a
chess value is assumed.

The evidence in `.unlazy/chess-m6/leaf-1.38/` includes strict focused compilation, LSP
diagnostics, constructor and changed-store fixtures, entry/load/write-bit mutation
checks, a proved diverging goto cycle, and initialization on arbitrary tapes. A halt-root
fixture proves its terminal configuration and unchanged tape output for every input. Rejection
controls require failure for a forged self-child certificate, an immediate-halt mutation,
`sorryAx` added to the audit roots, and a generated recursion helper added to the safe
closure. The full audit traverses declaration types and values, constructor lists and
recursor rules. Only `propext`, `Classical.choice`, and `Quot.sound` may occur as axioms.
Generated compiler recursion artifacts are inventoried separately; any such artifact
reachable from the mathematical closure is rejected.

`verify.py` also emits the module's C and checks every emitted direct lookup function
for graph vector interpretation or graph vector allocation calls. The bounded native runs
query arithmetic
presentations with 101, 1,000,001, and 1,000,000,000,001 nodes, using 340,000 lookups per
size and an independent arithmetic row oracle. Each native process has a 30-second
limit and a 4-GiB RSS limit, including Lean's import overhead; the allowed RSS spread is
64 MiB. These are reproducible bounded observations. The semantic guarantees for every
finite graph come from the Lean proofs, and arbitrary client getter implementations
retain their own execution costs.

Run the focused checks from the repository root with:

```sh
python3 .unlazy/chess-m6/leaf-1.38/verify.py
```

The runner resolves the pinned Lean executable and Lake's `LEAN_PATH`, sets
`ELAN_NO_UPDATE_CHECK=1`, records commands, exit statuses, timing, RSS and hashes, and
never mutates gate approvals. It builds only `Cryptids.Compilation.LazyGraph`.
