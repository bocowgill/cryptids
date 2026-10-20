# Fixed-interpreter return bodies

`Cryptids/Compilation/RuntimeReturn.lean` proves the four continuation bodies of
the actual `Runtime.machine`, starting after the numeric return tag has been
consumed. It imports the independently checked `RuntimeData` and `RuntimeMacros`
interfaces. It has no dependency on the VM-to-tape wire or an assumed interpreter
simulation.

Every body theorem states positive `TM2.step Runtime.machine` reachability from
`Runtime.dataCfg`. At that boundary, `main` is the exact encoded value list,
`rev` is empty, `aux` contains the complete encoded program table, and `stack`
contains the specified frame suffix. The incoming local store is arbitrary.

The established boundaries are:

| Theorem | Consumed frame data | Resulting values | Resulting control and frames |
|---|---|---|---|
| `cons1_reaches` | saved list, list marker, right address | right address followed by the entire saved list | `evaluate`; tag 2, default head of the first result, older frames |
| `cons2_reaches` | first result's saved head | saved head followed by the entire second result | `returned`; older frames |
| `comp1_reaches` | left address | left address followed by the entire right result | `evaluate`; older frames |
| `fix1_zero_reaches` | body address, output head zero | output tail | `returned`; older frames |
| `fix1_positive_reaches` | body address, positive output head | body address followed by output tail | `evaluate`; tag 4, body address, older frames |

`fix1_reaches` combines the two fix branches, hiding only the final local store.
The stronger branch theorems identify that store exactly: zero leaves the word
delimiter; positive leaves `none`. The other three bodies also leave `none`.

The first cons body reduces its first result to `headI`, so empty output saves
zero. It temporarily moves that scalar above the table, restores the complete
saved input up to its marker, consumes just that marker, prepends the right
address, and restores the program table while saving the scalar in its next
frame. The older suffix is an arbitrary symbol list, without a parsing or
well-formedness assumption.

The positive fix body first uses the actual predecessor macro, then discards
the remaining flag word completely. Its result therefore depends only on
whether the flag was zero, and never retains the predecessor of a positive
flag. The zero branch includes an empty output list, whose default head is zero
and whose tail remains empty.

`halt_step` proves that the actual halt instruction takes one step to a
configuration whose control label is `none`, clears the store, and preserves
all four stacks. `halt_reaches` packages that step as positive reachability;
`halt_terminal` proves that every absent-label configuration has no successor.
These are direct unbounded semantic facts, independent of fixture fuel.

Nine kernel-checked finite execution fixtures call the actual `TM2.step`
function. They cover empty and nonempty first cons output, multiple saved
values including zero, empty second cons output, composition preserving the
whole result list, empty and explicit-zero fix output, positive flags 1 and 19,
and the exact halt step followed by no successor. Each observes the actual
return label, store, and every symbol of every stack. A nonempty program table
and deliberately unparsed older suffix exercise preservation. Fixture fuel
only bounds these particular regression executions; it makes no nonhalting
claim.

The focused check is:

```
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.RuntimeReturn
```

The leaf's transitive audit selects every declaration belonging to this module,
including generated declarations, then follows declaration types and values,
inductive constructors, and recursor rules. Only `propext`, `Classical.choice`,
and `Quot.sound` are permitted axioms. Any exact compiler recursion artifacts
are inventoried and checked against safe owners before exclusion from roots;
none is exempt during dependency traversal. Independent proof-hole and unsafe
negative controls must be rejected. VM-frame wiring, return-tag dispatch,
table lookup, and complete source/backend simulation remain parent integration
obligations.
