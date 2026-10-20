# Cached hash numbering for TM0

`Cryptids.Compilation.HashNumber` provides finite state numbering in namespace
`ConjectureMachines.Compilation`. For a source machine `M : TM0.Machine Γ Λ` and explicit
`labels : List Λ`, `(hashNumberPack M labels).machine` has literal state type
`Fin (labels.length + 1)` and initial state zero. The nominal package retains computed lookup
data in compiled code. `hashNumberMachine` remains its logically equal reference machine.

## Executable construction

`hashNumberEntries labels` traverses `default :: labels` with `List.mapFinIdx`, pairing each
key with its bounded finite position. This avoids constructing entries by repeatedly indexing
the source list. `hashNumberIndex labels` builds a `Std.HashMap` from these pairs and finally
inserts `default ↦ 0`. Duplicate noninitial keys may use a later occurrence; every occurrence
decodes to the same source key. The final insertion makes the initial mapping zero even when
`default` appears later in `labels`.

`hashNumberLabel labels` specifies hash lookup with missing keys mapped to zero, and
`hashUnnumberLabel labels` specifies array decoding equal to the original `unnumberLabel`
list decoder. These function-valued definitions are logical specifications. Under the pinned
Lean 4.35.0-rc4 compiler, eta expansion causes their index or array construction to execute
inside the applied function. A source `let` before the lambda does not establish compiled
caching. The earlier caching claim for these wrappers was incorrect.

`CachedPost Γ n` instead stores a transition function and a natural-number state count in a
two-field nominal record. The `@[noinline]` constructor `hashNumberPack M labels` computes the
actual hash index and inverse array before allocating that record. Its function field captures
the computed data directly and never calls the function-valued lookup wrappers. Generated C
confirms one index construction and one array allocation in the package constructor; the
lookup lambdas only read captured objects. No `List.idxOf` or repeated source-list decoding
is needed in these lookups.

Consumers should construct the package once and reuse its machine field, or store that field
in another nominal artifact such as `NumberedPost`. A new function-valued definition that
constructs and immediately projects the package can reintroduce construction on each call.

The source type supplies `Inhabited`, `DecidableEq`, and `Hashable`; the tape alphabet supplies
`Inhabited`. Hash-map equality is the equality induced by `DecidableEq`. Hashes select buckets;
full equality distinguishes colliding keys. Poor hashes can degrade lookup performance but do
not merge states. The cost of hashing and equality still depends on the source state type.
The module does not deduplicate the supplied list or remove its unreachable duplicate rows.

## Proof contract

- `hashNumberEntries_sound` proves every entry decodes to its key.
- `hashNumberIndex_sound` propagates that property through every insertion, including repeated
  keys and the final initial-state insertion.
- `hashNumberIndex_cover` proves that every key in `default :: labels` has an index entry.
- `unnumber_hashNumber labels hq` combines soundness and coverage into
  `unnumberLabel labels (hashNumberLabel labels q) = q` whenever `hq : q ∈ default :: labels`.
- `hashNumberLabel_default labels` proves the initial mapping is zero.
- `hashUnnumberLabel_eq labels` identifies the cached inverse with the existing decoder.
- `hashNumberMachine_dom M labels S ss cover input` proves both halting directions whenever
  `ss : TM0.Supports M S` and `cover : ∀ q ∈ S, q ∈ default :: labels`.
- `hashNumberPack_machine M labels` proves by reflexivity that the packed machine is exactly
  `hashNumberMachine M labels`.
- `hashNumberPack_dom M labels S ss cover input` transfers the same two-way halting theorem
  to the packaged executable machine.

The halting theorem uses `TM0.Machine.map_respects`, the proved decoding right inverse on the
support invariant, and the exact mapped initial configuration. It applies the existing
both-direction `StateTransition.tr_eval_dom`; it does not rely on a forward simulation alone.
The missing-key fallback is outside the theorem's reachable supported runs.

## Evidence

Evidence is retained in `.unlazy/chess-m5/leaf-1.8/`. The focused warning-failing gate is:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.HashNumber
```

`Runtime.lean` assigns a constant hash to every key and includes repeated noninitial and
initial labels. Kernel guards verify collision separation, exact decoding, the forced zero
initial index, empty-list behavior, missing-key fallback, and mapped transition/halting rows.
A concrete source-support proof instantiates the generic both-direction halting theorem.
The executable example yields forward indices `[0, 4, 2, 0]` and inverse keys
`[0, 1, 2, 0, 1]` for the displayed duplicate-containing list.

The packed extension additionally tests the package's state count, transition rows, and generic
halting theorem. `runtime-packed.log` records these checks. `inspect_pack_c.py` inspects the
actual generated `.lake/build/ir/Cryptids/Compilation/HashNumber.c` and asserts that the
constructor builds the index and array once, captures both in closure environments, and
returns a two-field record. It also checks that neither lookup lambda nor its boxed wrapper
calls index/array reconstruction. Its result is retained in `pack-c-audit.log`; these are
compiler-output observations, separate from the kernel-checked semantic theorems.

The original 20-declaration inventory is retained in `inventory.log`. The extended audit in
`inventory-packed.log` checks all 40 public, private, and generated module declarations,
including structure recursors/projections and generated equation/proof helpers. Every
dependency axiom is among `propext`, `Classical.choice`, and `Quot.sound`; no helper is exempted.
No user unsafe code, partial recursion, custom axiom, proof placeholder, or unchecked native
decision is used.
