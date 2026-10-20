# Balanced literal transition tables

`Cryptids/Compilation/BalancedTable.lean` represents literal transition rows in a
binary tree and proves exact equality with the existing row-list machine.
Mathematical definitions and proofs live in
`ConjectureMachines.Compilation.Balanced`. The elaboration-time file loader and
expression-construction helpers live separately in `ConjectureMachines.TableSyntax`.

## Representation and exact lookup

`RowTree α` has three constructors:

```lean
RowTree.empty
RowTree.leaf row
RowTree.branch leftCount left right
```

`leftCount` caches the number of leaves in `left`. `RowTree.count` independently
computes the actual structural count, ignoring every cache. `RowTree.flatten`
lists leaves from left to right. `RowTree.count_eq_length` proves
`tree.count = tree.flatten.length` for every tree, with no validity premise.

`RowTree.WellFormed` requires each cached count to equal the actual left-subtree
count and requires both children to be well formed. Its `Decidable` instance is
constructive and needs no equality operation on row contents. Validity is not
assumed from file parsing or syntax generation.

`tree.lookup index fallback` follows one root-to-leaf path. At a branch it goes
left when `index < leftCount` and otherwise goes right with `index - leftCount`.
At a leaf it returns the row only at index zero. Empty trees and out-of-range
indices use the caller's fallback.

`RowTree.lookup_eq_getD tree valid index fallback` proves the complete equation:

```lean
tree.lookup index fallback = tree.flatten.getD index fallback
```

It covers every natural index, including out-of-range values, arbitrary empty
subtrees, and all valid tree shapes. The cache premise is essential: an incorrect
cache could route a lookup to a different row.

## Literal-machine identity

For transition rows of type `List (Option (Fin symbols × Turing.Dir × Fin q))`,
`Balanced.ofTree tree` constructs an actual `ConjectureMachines.Machine q symbols`.
It reads a row with balanced lookup and fallback `[]`, then reads the symbol's
entry using the existing row `List.getD` with fallback `none`.

The theorem `Balanced.ofTree_eq_ofRows tree valid` proves exact machine equality:

```lean
ofTree tree = Machine.ofRows tree.flatten
```

This is equality of the complete transition functions, including missing rows and
short rows. It has no compiler assumption. Consequently every execution and
halting claim about the tree machine is a claim about precisely its flattened
literal rows. The theorem does not assume or prove that a separate compiler
artifact has the same bytes; that connection remains independently inspectable.

## Midpoint loader and lookup depth

The global term syntax

```lean
load_balanced_rows% "path/to/table.txt"
```

reads the same two-column binary transition format as `load_machine_rows%`:
`---` is missing, and cells such as `1R27` write symbol `1`, move right, and
enter state `27`. Blank lines and text after `#` are ignored. Every nonblank line
must contain exactly two cells. Write symbols must be binary; directions must be
`L` or `R`; destinations must be natural numbers.

The loader constructs explicit `Fin` values with kernel-checked bound proofs.
An out-of-range destination therefore fails elaboration instead of becoming a
modulo-wrapped numeral. Parsing and IO merely construct expressions: there is no trusted
promise that the generator emitted correct counts, row order, or tree height.
The resulting ordinary constructor term can be inspected and kernel-checked. The loader builds
expressions with explicit type arguments and bound proofs directly; it does not create a
separate elaboration/tactic task for every cell. An invalid bound is rejected by the kernel.

The expression generator divides each array segment at its midpoint. A segment of
length `n ≥ 2` creates children of lengths `n / 2` and `n - n / 2`; segments of
length one become leaves and zero becomes empty. Generation is total with a
checked decreasing length argument, and does not perform linear list indexing
for each transition lookup.

`RowTree.height` counts the maximum number of branch decisions on any path.
`RowTree.lookupDepth` counts the decisions for one index, and
`RowTree.lookupDepth_le_height` proves its bound for every tree and index without
assuming valid caches. Midpoint-generated tables have depth growing logarithmically
with their row count. A caller can establish a concrete bound, such as
`tree.height = 16`, directly by kernel decision for the emitted constructor term;
this theorem then bounds every row lookup by sixteen branch decisions. The
49,910- and 58,838-row M5 tables fit that depth. The utility itself accepts any
well-formed shape and does not claim that arbitrary input trees are balanced.

## Typical use

```lean
open ConjectureMachines
open ConjectureMachines.Compilation.Balanced

def rows : RowTree (List (Option (Fin 2 × Turing.Dir × Fin 49910))) :=
  load_balanced_rows% "path/to/table.txt"

def machine : Machine 49910 2 := ofTree rows

theorem rows_valid : rows.WellFormed := by decide
theorem rows_count : rows.count = 49910 := by decide
theorem rows_height : rows.height = 16 := by decide

theorem machine_exact : machine = Machine.ofRows rows.flatten :=
  ofTree_eq_ofRows rows rows_valid
```

The numeric count and height in a real use must be checked against the actual
file. Neither number is an axiom or a requirement on the generic machine theorem.
Literal finite-run certificates from `Cryptids.Compilation.Literal` can execute
`machine` directly, avoiding a linear scan through the full row list at every
step. The two-symbol lookup within each row remains a bounded list lookup.

## Verification and trust

The focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.BalancedTable
```

`.unlazy/chess-m5/leaf-1.10/` records the direct gate, all-declaration audit for the
mathematical namespace and its generated helpers, and small kernel-checked loader
tests. The elaboration-time `TableSyntax` helpers construct terms and are explicitly
separate from the mathematical trust audit. All semantic theorems are checked by
Lean's kernel; no native decision proof, custom axiom, proof placeholder, or
user-written unsafe/partial runtime definition is used.

## Large literals and code generation

The concrete M5 module sets `compiler.extract_closed false` while elaborating the large
literal data. Otherwise native-code extraction creates enough individual closed constants
to make IR declaration lookup quadratic. This option changes runtime code generation only;
it does not change a constructor term, a transition, a mathematical definition body or the
kernel checks. The saved independent challenge uses the same data representation. The
published tables and the native compiler generator remain fully executable.
