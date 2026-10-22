# Bounded whole-body exact quotient pilot

Status: source implemented; root-owned remote execution pending. This is a finite
experimental body-table study. It does not change the accepted 2,411,743-state
machine or certify the experimental 998,176-state composition.

## Scope and input identity

The pilot reads every allocated state of the accepted round-one binary body,
including unreachable states. Its only large-machine input is:

```
docs/chess/campaign-2026-10-22/round-01/evidence/final/unpacked/body-rows.jsonl
SHA256 d2afbf1c0abe1afb0008029680c5bc52b41f2dc21718a88d16b7aecd06becb0a
```

The source has 573,802 states and 1,147,604 rows in state-major order, symbol zero
before symbol one. Each row is
`[absolute_state, symbol, null-or-[write, direction, absolute_destination]]`.
Directions are -1 or 1. The accepted prefix offset is 1,837,941. Subtracting it
gives standalone body entry zero; standalone state one has the two missing rows.
Both the loader and the independent checker enforce exact order, complete
census, integer domains, internal destinations, newline termination and SHA256.

Only `scripts/chess_body_20261022/pilot.py`, this report and the owned leaf ledger
are authored by the pilot worker. Accepted sources and evidence stay frozen.
No code, model, fixture, count, simulation or Python import is executed locally.

## Remote invocation and limits

The root-owned GitHub Actions runner invokes:

```sh
CHESS_REMOTE=1 GITHUB_ACTIONS=true python scripts/chess_body_20261022/pilot.py \
  --output .lake/chess-body-20261022 --seconds 600 --memory-gib 6
```

The environment guard runs at import before computational imports. Linux is
required for the reported resource units. `--input` may change the physical
input path but never its expected SHA256 or dimensions. `--seconds` must be
between 5 and 600 and `--memory-gib` between 1 and 6. Limits cover literal tests,
input parsing, refinement, exports, certificate checking, hostile controls and
accounting. `RLIMIT_AS` bounds address space; a wall timer reserves the final
three seconds for diagnostics and installs a hard-exit fallback. Four MiB of
reserved memory are released on failure so an incomplete summary can be saved.

`pilot-summary.json` is checkpointed atomically at phase boundaries and at most
15 seconds between progress checkpoints during long loops. An external timeout
or runner termination may leave its last `running` checkpoint; it is not a pass.
A budget/memory exception records `incomplete`, the phase, resource usage and
partial diagnostics. Other failures record `failed`. Partially exported maps or
tables never establish a quotient. Only a complete zero-exit run prints:

```
Whole-body exact quotient pilot passed
```

The summary records elapsed wall time, Linux peak RSS in KiB, run ID, commit and
pilot-source SHA256. The orchestration layer must also retain its source binding,
command exit, raw logs and uploaded artifact metadata.

## Partition algorithm and maximality boundary

The initial partition groups states by their pair of immediate observations.
For each symbol, missing transition, write bit and direction are observed exactly;
destinations are initially ignored. The implementation then uses Hopcroft
refinement with reverse adjacency arrays for each symbol.

Each block keeps its old identifier for its larger child, while its smaller
child gets a new identifier and is queued for both symbols. An old queued item
therefore still represents the larger child. If that old item was already
processed, splitting against the smaller child also distinguishes its complement
inside the old block. Each newly queued child contains at most half its parent's
members. The full predecessor set is collected before any block is modified,
including when a splitter splits itself. No rounds-to-convergence scan or
reachability traversal is used.

The standard refinement argument gives coarseness: initially, bisimilar states
have identical observations. A split by the predecessor set of a block that is
a union of bisimulation classes cannot separate bisimilar states. Thus all
refinements preserve that property. Worklist exhaustion gives stability; the
separate certificate checker also verifies stability directly for every row.
Together these establish the intended maximal exact quotient algorithmically.
The finite all-row certificate alone proves a sound quotient, not independently
its minimality: an unnecessarily fine stable partition could pass that checker.
There is no large independent split-history/minimality certificate or Lean proof
of the refinement algorithm in this pilot.

Classes are ordered by least original standalone member. Every representative
is therefore canonical, and the class containing original entry zero is new
entry zero. Every quotient state has both rows, including explicit nulls.

## Retained certificate and independent check

The output directory contains:

| File | Meaning |
|---|---|
| `class-map.u32le` | One class ID per old body state, in exact old-state order |
| `representatives.u32le` | One least original member per quotient class |
| `class-sizes.u32le` | One exact member census per quotient class |
| `quotient-rows.jsonl` | Both standalone rows of every quotient class |
| `certificate-manifest.json` | Formats, dimensions, source pin and hashes/byte sizes of all four artifacts |
| `goldens/*` | Literal source tables and their checked complete certificates |
| `source-family-breakdown.json` | Class sizes, source main/return memberships and store-sharing counts |
| `pilot-summary.json` | Resources, tests, certificate result, measured totals and proof-effort assessment |

Binary arrays are headerless unsigned 32-bit little-endian. The class map alone
has one entry for every one of the 573,802 old states; its exact bytes are measured
in the remote manifest. Representatives and sizes each have one word per class.
The quotient JSONL format uses the same write/direction convention as the source,
with standalone class indices throughout.

The checker does not read the refinement's blocks, reverse graph, output-label
arrays or termination condition. It reopens the serialized artifacts, verifies
all hashes and sizes, and independently reparses the source and quotient JSONL.
It checks total map bounds, surjectivity, every class's exact census, increasing
minimum representatives, entry identity and complete quotient rows. For each
old state `q` and symbol `b`, it verifies:

```
quotient(map(q), b) = map_destination(old(q, b))
```

Mapping a destination leaves the write bit and direction unchanged and maps
`null` to `null`. This is one transition equality for every one of the 1,147,604
source rows, including both missing transitions. It supports exact step-by-step
simulation on arbitrary tapes under the control map; blank-run behavior alone
is never used as an oracle.

## Tests and hostile controls

Three small literal goldens have explicit expected complete maps and are also
compared against a separate synchronous naive-refinement implementation:

1. A two-cycle and self-loop with identical observations, plus an unreachable
   halt: `[0,0,0,1]`.
2. A chain to halt, a nonhalting cycle and an equivalent delayed suffix:
   `[0,1,2,3,4,4,2]`.
3. States differing in write, direction, symbol-specific halting and a duplicate
   self-loop: `[0,1,2,3,0,4,5]`.

After the delayed golden's positive check, a well-formed but incorrect merged
partition is rejected specifically by mapped-row equality. Its map is
`[0,0,1,2,3,3,1]`, representatives `[0,2,3,4]` and sizes `[2,2,1,2]`; it passes
entry, canonical-order, surjection and census checks before the semantic failure.

After the large positive certificate check passes, twelve hostile variants are
run through that same checker: corrupt class map, write, direction, destination, halt,
undercount, truncated quotient, truncated map, truncated source, noncanonical
representative, wrong class size and source order. Mutated artifact hashes are
refreshed, so rejection must come from semantic or census obligations. A variant
passes its negative test only if the checker raises its explicit assertion
rejection; unexpected exceptions fail the pilot. Original exported artifacts
are preserved; temporary variants are removed after recording rejection reasons.

## Full-machine accounting and interpretation

For the measured quotient class count `K`, the report computes both prospective
complete-machine totals:

```
accepted paid writer + quotient body       = 1,837,941 + K
experimental round-two prefix + body      =   424,374 + K
additional saving in either composition   =   573,802 - K
```

The second prefix includes all 424,157 seed-writer states, 216 expander states
and one bridge. Neither formula removes initializer costs or hides a new table
interpreter. The accepted best remains 2,411,743. Both proposed totals await
actual machine construction, a formal simulation/linker instance and acceptance.

The family report retains exact main-only, return-only and mixed class counts,
the whole class-size histogram, the 32 largest classes, and an additive saving
breakdown within main controls, within return controls and across both families.
For each original graph node, it measures how many distinct classes its five
store copies occupy, using the accepted main-index permutation (zero and one
swapped). This identifies the saving obtainable solely by same-node store
sharing. The remaining main sharing is across nodes; repeated suffixes are a
possible cause, not a proven source-level classification.

The generic formal proof obligation is an exact-row quotient simulation with
halting reflection. Instantiating it directly requires 573,802 map entries and
1,147,604 source-row equalities plus actual-machine/table identity. The report
measures binary/JSON certificate bytes and recommends seeking a structural
compiler map before building a million-row Lean certificate. A large measured
saving can justify that work; this pilot itself does not finish it.

## Four-pass implementation record

1. Complete source: bounded refinement, serialization, independent checker,
   literals, hostile controls, family analysis and full accounting implemented.
2. Domain review: separate observation equivalence, row soundness and algorithmic
   maximality; retain unreachable states and all initializer costs.
3. Adversarial static review: independent reviewer found no blocking defect in
   splitter mutation, smaller half scheduling, canonical maps, exported-file
   checks or accounting. Added its recommended direction mutation and a
   well-formed overmerged golden to exercise semantic map rejection directly.
4. Polish and integration: explicit failure status, atomic diagnostics, stable
   invocation and retained format documentation. Remote results remain a separate
   required gate; no local execution substitutes for them.
