# Verified shared Code representation

`Cryptids/Compilation/CodeDAG.lean` provides an executable bottom-up hash-consing
compiler in `ConjectureMachines.Compilation.CodeDAG`. Its central theorem is an
unconditional syntax identity for every mathlib `Turing.ToPartrec.Code`:

```lean
compile_correct (code : Code) : (compile code).decode = code
```

`compile_eval code input` consequently gives exact equality of `Code.eval` on every
input, including divergence. No semantic-equivalence assumption or chess value enters
the representation proof.

This representation does not supply a DAG runtime interpreter, a memoized static
support collector, a binary Turing-machine table, or an M6 completion theorem. Those
remain distinct construction and refinement obligations. M7 remains unstarted.

## Executable builder

A `Node` contains only a constructor and zero, one, or two natural child IDs.
It contains no recursive Code payload. `State` has exactly two runtime fields:

- `rows : Array Node`, in order of first insertion;
- `cache : Std.HashMap Node Nat`, associating normalized rows with their IDs.

`lower` recursively visits a Code constructor's children, then calls `intern` on the
normalized parent key. A cache hit returns the existing ID and the unchanged state.
A miss appends one row and inserts its ID. `compile` starts from the empty state and
returns a `DAG` containing only the final rows and root, dropping the construction cache.
The runtime stores no semantic Code copies and no proof fields. There is no construction
cap, noncomputable choice, pointer-identity test, or `Hashable Code` assumption.

The derived `BEq`, `ReflBEq`, `LawfulBEq`, and `Hashable` instances apply only to small
Node keys. The proof uses the actual Std.HashMap lookup/insert laws with lawful equality.
It never assumes different keys have different hashes: collisions are resolved by the
map's equality checks.

The builder visits every expanded constructor occurrence, even when a subtree repeats.
Hashing itself examines only a tag and child IDs. Thus the output shares rows without
recursively hashing the original Code at each lookup. Runtime still depends on the
expanded visit count, and no general practical runtime bound is claimed.

## Invariants and exact reconstruction

`Node.Below node bound` requires every child ID to be strictly below `bound`.
`Valid state` is an erased proposition establishing:

- each row's child IDs precede its own index;
- every cache lookup identifies the associated array row;
- every array row has its own cache entry;
- each decoded row is exactly its constructor applied to its decoded children.

`Extends before after` preserves old rows and old decoded values at every old index,
as well as nondecreasing array size. The append lemmas prove these properties directly
from the decoder fold. `intern_spec` proves both cache-hit and append cases, and
`lower_spec` proves every Code constructor case. These proofs establish `compile_valid`,
including the root bound and all topological child bounds. `decode_row` and
`DAG.decode_row` establish the exact constructor equation for every row of any
topologically valid table, including tables accepted from serialized input.

`compile_unique_row` proves no normalized row occurs at two IDs; `intern_cached` proves
a cache hit changes neither rows nor cache. `compile_size` bounds shared row count by
the original constructor-occurrence count. A kernel-checked repeated-subterm fixture
has four rows for seven source occurrences, with both parent edges pointing to the
same child ID. This distinguishes actual interning from merely writing an AST table.

The decoder is an executable array fold that builds each row from earlier decoded
references. Missing references in malformed raw arrays default to `Code.zero'`; valid
compiled tables have all references in range and an in-range root, so those defaults
cannot affect their reconstruction. The decoder may re-expand shared syntax when run;
`compile` and `serialize` do not call it. Large construction therefore does not have to
materialize the decoded six-million-occurrence syntax merely to serialize its rows.

## Wire representation

`serialize dag` returns exactly:

```text
[rowCount, root, tag0, left0, right0, tag1, left1, right1, ...]
```

The count/root header is followed by one triple per shared row:

| Tag | Constructor | Left | Right |
|---|---|---|---|
| 0 | `zero'` | 0 | 0 |
| 1 | `succ` | 0 | 0 |
| 2 | `tail` | 0 | 0 |
| 3 | `cons` | child ID | child ID |
| 4 | `comp` | child ID | child ID |
| 5 | `case` | child ID | child ID |
| 6 | `fix` | child ID | 0 |

`Node.ofTriple` rejects unknown tags and nonzero unused operands. `parseRows` consumes
exactly the declared number of triples. `check` validates the root and every child
bound over explicitly finite indices. `deserialize` rejects truncation, trailing words,
invalid padding, forward/self references, and invalid roots, including an empty table.
Raw valid tables may contain redundant rows; the compiler's output additionally satisfies
its proved unique-row invariant.

`deserialize_serialize` proves the round trip for every valid DAG.
`deserialize_valid` proves every accepted DAG is topologically valid.
`serialize_deserialize` proves accepted input words are already in canonical wire form,
including padding, row count, and final boundary. `serialize_injective` establishes that
valid tables with the same words are identical. `deserialize_compile` is the root-facing
compiled-artifact round trip. `serialize_length` gives exactly `2 + 3 * rows.size` natural
words; this is a word count, not a bit count or a machine-state count.

## Verification and scope

The focused build is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.CodeDAG
```

The leaf audit traverses declaration types and values transitively, rejects proof holes,
nonstandard axioms, unsafe/partial dependencies, and the open chess conjecture. Validated
Lean-generated recursion artifacts for `lower`, `occurrences`, and `parseRows` are
inventoried outside the safe root set; dependency traversal still rejects unsafe code.
Known-failing axiom and recursion-artifact controls test those rejection paths.

Fixtures cover all seven constructor tags, exact repeated-subterm sharing, the generic
serialization round trip, and eight malformed-input cases. The larger bounded executable
fixture reports 11 rows for 1,023 occurrences; that count is recorded as computation for
that exact source fixture, not a general compression theorem. The arbitrary-Code
reconstruction and semantic equalities are kernel-checked proofs.

The native Updates experiment reported by the emission workstream is separate evidence;
this leaf does not reuse its unverified counts as a theorem or execute the whole chess
game tree. PLAN revision 10 adopts the runtime-table interpreter route after the static
continuation-context experiment reached its cap. That interpreter must prove execution
against the decoded Code and account for serialized input and blank initialization.
The exact final binary table must still be produced and verified before M6 is complete.

Evidence is in `.unlazy/chess-m6/leaf-1.17/`.
