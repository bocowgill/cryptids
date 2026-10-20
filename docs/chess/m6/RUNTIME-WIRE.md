# Runtime frame wire and concrete startup

`Cryptids/Compilation/RuntimeWire.lean` defines the explicit representation of `CodeVM`
configurations on the fixed four-stack interpreter. Its namespace is
`ConjectureMachines.Compilation.RuntimeWire`. The startup theorem proves actual positive
`TM2.step Runtime.machine` reachability from an ordinary input stack; it assumes no startup
oracle, table validity, source termination, or chess value.

## Data representation

`flatTriples : Array CodeDAG.Node → List Nat` concatenates `Node.words` in array order.
Each node contributes exactly three words, so `flatTriples_length` gives `3 * rows.size`.
The runtime table has no row-count header. The root PC is carried separately in the input.

`frameWire : CodeVM.Frame → List Γ'` uses Mathlib's delimited binary-natural `trList` encoding:

| Frame | Wire |
| --- | --- |
| `halt` | `trList [0]` |
| `cons1 right saved next` | `trList [1] ++ trList saved ++ consₗ :: (trList [right] ++ frameWire next)` |
| `cons2 head next` | `trList [2, head] ++ frameWire next` |
| `comp left next` | `trList [3, left] ++ frameWire next` |
| `fix body next` | `trList [4, body] ++ frameWire next` |

The symbol `consₗ` is the saved-list delimiter. Ordinary encoded natural words use `cons`,
which is a different alphabet symbol. `PartrecToTM2.trList_ne_consₗ` proves that even zero
words cannot collide with the saved-list or table delimiter. Every frame contains natural
PCs and saved data, without a recursive `Code` payload.

`configWire rows store cfg` maps stable VM boundaries to `Runtime.dataCfg`:

| VM configuration | Phase | Main | Aux | Frame stack |
| --- | --- | --- | --- | --- |
| `eval pc frame values` | `evaluate` | `trList (pc :: values)` | `trList (flatTriples rows)` | `frameWire frame` |
| `ret frame values` | `returned` | `trList values` | Same table | `frameWire frame` |
| `halt values` | `halt` | `trList values` | Same table | Empty |

The reverse scratch stack is empty and the local store is the explicit `store` argument.
A live `Frame.halt` has tag zero; a final `Config.halt` has consumed that tag and therefore
has an empty frame stack. Constructor equations and store/main/reverse/aux/frame projections
are exposed as simplification lemmas.

## Literal input and initializer

The input is

```lean
input dag values =
  trList [dag.root] ++ trList (flatTriples dag.rows) ++ consₗ :: trList values
```

Thus all program-dependent data begins on main. `initial dag values` has label `start`,
store `none`, and empty reverse, aux and frame stacks. It does not preload a table on aux,
install a source-dependent continuation, or assume the halt frame has already been pushed.

`initial_eq_TM2_init` proves equality with the ordinary `TM2.init main (input dag values)`
under the explicit local default-label instance `⟨Runtime.label .start⟩`. This matches the
startup default used by the fixed runtime's support theorem, without changing a global
instance.

## Actual startup path

`startup_reaches root table values store` proves a nonempty path for arbitrary natural root,
arbitrary natural-word table, arbitrary values and arbitrary incoming local store. The
explicit path is:

| Boundary after operation | Main | Aux | Frame stack | Store |
| --- | --- | --- | --- | --- |
| Initial `start` | Root, table, delimiter, values | Empty | Empty | Incoming store |
| Move root word to frame stack | Table, delimiter, values | Empty | Root word | None |
| Move table through reverse scratch to aux | Delimiter, values | Table | Root word | None |
| Clear one delimiter | Values | Table | Root word | `some consₗ` |
| Restore root word to main | Root, values | Table | Empty | None |
| Push halt word and enter `evaluate` | Root, values | Table | `trList [0]` | None |

Reverse scratch is empty at every listed macro boundary. `split_table` establishes the exact
stopping point of the table scan using `trList_ne_consₗ`. The proof invokes the verified
`moveWord_reaches`, `RuntimeMacros.move₂_ok` under `Runtime.agrees`, `clear_ok`, and
`pushWord_reaches`. It includes the actual initial phase-dispatch step. The final composition
retains positive reachability even though the general push theorem permits zero steps.

The integration corollaries are:

```lean
initial_reaches (dag : CodeDAG.DAG) (values : List Nat) :
  Reaches₁ (TM2.step Runtime.machine) (initial dag values)
    (configWire dag.rows none (CodeVM.init dag values))

tm2_init_reaches (dag : CodeDAG.DAG) (values : List Nat) :
  letI : Inhabited Λ' := ⟨Runtime.label .start⟩
  Reaches₁ (TM2.step Runtime.machine) (TM2.init main (input dag values))
    (configWire dag.rows none (CodeVM.init dag values))
```

A malformed root or empty table can still be initialized; these theorems do not assert that
such a program subsequently evaluates successfully.

## Verification and integration boundary

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.RuntimeWire
```

Evidence is in `.unlazy/chess-m6/leaf-1.21/`. Fixtures check nested frames, empty saved lists,
zero-valued words, empty tables, an ordinary three-row table, and the consumed halt-tag
convention. Additional closed kernel computations directly iterate the actual `TM2.step`
to `evaluate`, observing the phase, local store and all four stacks. They independently cover
root zero, a binary root, arbitrary initial store and an out-of-range root.

The standard-axiom report covers every declaration and its complete closure. This leaf adds
no custom axiom, proof hole, native computation certificate, unsafe/partial runtime or
heartbeat override. It establishes the data wire and startup only. VM instruction/return
simulation, source-program termination correspondence, blank binary-tape initialization,
backend assembly and exact table identity remain separate integration proofs.
