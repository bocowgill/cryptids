# Selective returns for the complete chess machine

Status: accepted complete machine, **2,411,743 states**. Full proof, native export,
independent validation, regressions, fresh advisory and sealed parent replay
passed. See `RESULTS.md` for exact source, remote provenance and retained artifacts.

## Mechanism

The accepted binary compiler assigns two controls to each Post state: a main
control and a return control. A Post move uses only a main control. A Post write
writes while moving right, then uses the destination's return control to preserve
the neighboring bit and move left. Only Post write destinations need returns.

The new compiler retains every main control. Its return allocation has a partial
inverse, and a universal hypothesis requires the inverse to recover every actual
write destination. Under a decoder into the old binary machine, every retained
transition agrees exactly, including missing transitions. The decoder changes
only the control, retaining the complete tape and head position. The existing
local-certificate theorem then yields both termination directions on arbitrary
tapes. No reachability assumption, finite simulation bound, or predicted chess
value enters this argument.

## Structural coverage

The frozen graph's Post writes have three destination classes:

1. The child of a literal syntax write, with the current store.
2. A source-label root selected by a goto, with the current store.
3. The single shared halt control.

Loads and branches recursively select a primitive without a tape step. The
coverage theorem propagates through that recursion, including store changes from
loads. It quantifies over every graph node, both scanned bits, and every store.

Each source row therefore retains its root and each literal write child. A local
structural list provides executable lookup and decoding, with no duplicates. A
balanced allocation combines the local lists in the unchanged source-label order.
All five stores are represented, and return zero is reserved for the shared halt.
The existing CompactPost initial-state permutation is preserved exactly.

## Complete accounting

| Component | Candidate controls |
|---|---:|
| Reverse initializer writes | 1,837,940 |
| Final initializer rightward move | 1 |
| All original Post main controls | 533,341 |
| Returns for 4,042 source roots, five stores each | 20,210 |
| Returns for 4,050 literal write children, five stores each | 20,250 |
| Shared halt return | 1 |
| **Complete candidate** | **2,411,743** |

The proposed saving is 492,880 controls. The constructor count is computed from
the frozen source syntax; the Lean candidate states its exact sum by kernel
reduction. The remote census independently found 40,461 distinct Post write
destinations, exactly the structural allocation. This finite equality is useful
evidence that no allocated return is redundant for this construction. It is not
a minimality theorem for chess machines or other compiler constructions.

There is no extra runtime lookup routine: `findReturn` constructs the explicit
finite transition table. Native extraction must emit both symbol rows of every
allocated control. The complete frozen input remains paid by the initializer.

## Proof and extraction chain

- `FieldReturns.Syntax`: local lists, exact cardinality, inverse lookup, universal
  root and write-child coverage.
- `FieldReturns.Graph`: primitive coverage implies every CompactPost write is covered.
- `FieldSelectiveLayout`: balanced allocation, numeric return indices, inverse
  lookup, and coverage of the frozen complete Post body.
- `SelectiveBinary`: exact row decoding, arbitrary-tape halting equivalence, and
  an independent numeric row transformation.
- `FieldSelective`: original chess theorem, unchanged paid initializer, exact
  input tape at body entry, complete count, and full numeric image equality.
- `Semantics.ChessFieldSelective`: the public blank-tape halting equivalence with
  the negation of both players being able to avoid loss.

The complete native exporter compares actual-machine and independently assembled
Lean rows for every prefix and body state on both symbols. A separate Python
model reconstructs the return order from the serialized syntax and checks the
entire emitted table. Source-operation cases, initializer edges, deliberate
corruptions, prior regressions and the safe proof-closure audit are additional
acceptance gates. Finite checks supplement the universal Lean theorem.

## Next route

All required verification passed on the retained final computation snapshot.
The active goal continues. `NEXT-INITIALIZER.md` identifies a three-bit seed and
fixed expander as the next focused route; its proof and complete control count
remain new obligations. This accepted return reduction makes no minimality claim.
