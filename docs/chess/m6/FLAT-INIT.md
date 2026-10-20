# Flat array-indexed binary initialization

`Cryptids/Compilation/FlatInit.lean` constructs a blank-tape initializer with exactly two
states per input bit. It changes no frozen M5 initializer source. The namespace is
`ConjectureMachines.Compilation.FlatInit`.

## Construction and row layout

```lean
initialise (bits : Array (Fin 2)) (body : BundledMachine 2) : BundledMachine 2
```

For `n = bits.size` and `q = body.states`, the result has exactly `q + 2 * n` states.
The body is placed after the initializer at offset `2 * n`:

| Physical state | Transition on scanned bit `a` |
| --- | --- |
| `i`, with `0 ≤ i < n` | Write `bits[i]`, move right, enter `i + 1`. |
| `i`, with `n ≤ i < 2*n` | Write `a`, move left, enter `i + 1`. |
| `2*n + j`, with `j < q` | Use body row `j`; offset each existing destination by `2*n`; retain missing transitions. |

`transition_write`, `transition_return`, and `transition_body` prove these exact equations.
No prefix row can halt. The last return step enters body state zero without an extra control
state or extra transition. A zero-length array adds no states and executes zero prefix steps.

The executable construction closes over the array and the original body transition function.
It uses numeric comparisons, one bounded array lookup in a write row, and direct numeric
state offsets. It does not construct nested `Init.prepend` wrappers, build the recursive
`Init.writer` list, call `List.getD` per exported row, or recursively dispatch through all
preceding states. A caller holding a list should convert it to an array once before calling
`initialise` and retain that array while exporting rows.

This gives a fixed-depth initializer transition function after the array exists. Returning
rows perform no input-array lookup; body rows delegate to the original body lookup. The
module does not impose a complexity assumption on an arbitrary body's own transition
function, nor prove a machine-independent wall-clock bound.

## Exact blank execution

`runFrom` is ordinary finite execution of the actual `ConjectureMachines.step` function.
The main exact-count theorem is:

```lean
initialise_run (bits : Array (Fin 2)) (body : BundledMachine 2) :
  runFrom (initialise bits body).toMachine (2 * bits.size) ConjectureMachines.init =
    some (embed bits body ⟨0, Tape.mk₁ bits.toList⟩)
```

`embed` offsets a body state by `2 * bits.size` and leaves the tape unchanged. The theorem
therefore establishes the full written tape and restored head position after exactly `2n`
steps, including trailing blank bits. It does not evaluate the body or assume it terminates.

`initialise_reaches` gives reflexive reachability for all arrays. `initialise_reaches_positive`
gives positive reachability when `0 < bits.size`. `initialise_empty_states` covers the zero
case explicitly. `initialise_states` counts both the write and return blocks and every body
state.

The proof uses a linear proof-only action sequence: all rightward writes followed by `n`
preserving left moves. `actions_get` connects each sequence entry to the direct array-indexed
row. `prefix_run` proves the remaining prefix by induction on its exact remaining length.
`writer_eq_actions` identifies this sequence with the unchanged M5 writer, allowing
`actions_correct` to reuse the frozen `Init.writer_correct` tape theorem. That old writer
occurs only in these correctness proofs; `initialise` never calls it.

## Body simulation and halting

```lean
step_embed bits body cfg :
  step (machine bits body) (embed bits body cfg) =
    (step body.toMachine cfg).map (embed bits body)

initialise_halts bits body :
  (initialise bits body).Halts ↔
    Init.HaltsOn body.toMachine (Tape.mk₁ bits.toList)
```

The step theorem includes missing transitions, so stopping is preserved as well as forward
execution. `respects` and the verified `StateTransition.tr_eval_dom` theorem give both halting
directions from the embedded body configuration. The exact prefix path connects blank state
zero to that configuration. There is no assumed body value or termination oracle.

## Validation and scale probe

The focused target is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.FlatInit
```

Evidence in `.unlazy/chess-m6/leaf-1.27/` includes kernel-checked small transition and execution
fixtures, both-direction halting statements, the complete 33-declaration axiom audit, hashes,
and the four-pass ledger. Small direct computations cover writes on either scanned bit,
return preservation, the final return/body boundary, an existing body transition, immediate
body stopping, zero input, and the exact restored tape.

`LargeProbe.lean` constructs alternating arrays and probes seven numeric rows, without
constructing the old writer, exporting the whole table, or running the body. The observed
results were:

| Input bits | Total states with a one-state body | Row probes | Observed elapsed time |
| --- | --- | --- | --- |
| 10,000 | 20,001 | 7 | 1 ms |
| 100,000 | 200,001 | 7 | 7 ms |
| 1,500,000 | 3,000,001 | 7 | 100 ms |

These are reproducible construction/probe observations for this environment, not a general
runtime theorem. The universal state count, tape correctness, exact prefix length and halting
equivalence are established separately by kernel-checked proofs. The module adds no custom
axiom, proof hole, native computation certificate, unsafe/partial runtime, or heartbeat
increase.

Final source/input selection, complete machine composition, binary table export and exact
published identity remain parent integration work.
