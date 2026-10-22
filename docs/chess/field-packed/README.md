# Padding-free complete chess machine

Campaign in progress. The acceptance target is a complete binary blank-tape chess
machine below the accepted 45,065,962 states, with the unchanged theorem
`Halts machine ↔ ¬(WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)`.

Every previously tracked file is fixed under `baseline-pins.json`, including the
frozen chess specification, toolchain, accepted field compiler and evidence. All
proof checking, native compilation/execution, simulation and counting run remotely.
Outreach remains on hold.

## Exact allocation

`FieldPacking.Layout` supplies a computable bijection from every actual local
syntax slot to the complete numeric graph. It also preserves strict local order.
`FieldPacking.graph` decodes that bijection for node lookup and renames each child
through the same map. Its semantic theorem covers every row and every allocated
node, without a reachability assumption.

`FieldPackedLayout` folds the frozen balanced source snapshot into a balanced
allocation tree. Both traversal directions use cached subtree row/node totals.
Its count proof must reduce the actual complete syntax in Lean. Source-order
prefix lemmas connect this allocator to an independent numeric recipe.

`FieldPacked` reuses the actual thirteen-bit input and verified CompactPost,
binary and paid initialization stages. All five store controls, the shared halt,
all binary returns and every initializer state remain charged. Only unused
uniform graph slots are removed.

## Acceptance

The focused workflow is `chess_field_packed.yml`; the pinned configuration is
`lakefile.chess-field-packed.toml`. The full target must pass strict kernel builds,
safe proof closure, deliberately false contracts, actual native output for every
body state and both symbols, independent row/allocation checks, the entire paid
initializer and the accepted chess regression fixtures.

Native `machine-export.json` and `body-rows.jsonl` are separate from proof-phase
receipts. Finite fixtures supplement universal kernel proofs. Final acceptance
also requires exact official provenance, a fresh independent advisory review and
sealed metadata-only evidence replays. Development passes are not full acceptance.

Local-safe frozen-hash check:

```sh
python3 scripts/chess_field_packed/verify.py --metadata
```
