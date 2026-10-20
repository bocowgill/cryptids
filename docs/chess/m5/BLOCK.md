# Verified binary block compiler

`Cryptids.Compilation.Block` exposes a constructive TM1-to-Bool-TM1 compiler in
`ConjectureMachines.Compilation.Block`. It uses `Stack.BlockCode` and exactly Mathlib's
`TM1to1.Λ'` label constructors: `normal l` and `write a q`.

## Safe jump optimization

`HeadFree l` means `∀ a v, l a v = l default v`. Its executable decision enumerates the
finite source alphabet and store and compares destinations with the supplied decidable label
equality. A successful check permits `fastNormal C (.goto l)` to emit the single statement
`.goto (fun _ v ↦ .normal (l default v))`. The destination may still depend on the store.
Otherwise the compiler keeps Mathlib's block read and jumps to `.normal (l a v)` for the
decoded symbol `a`.

Move, write, load, branch, and halt follow Mathlib's original recursive translation. Auxiliary
write labels write the encoded vector, move left by the block width, and execute the compiled
continuation. No user-authored runtime branch uses classical choice, an oracle, unsafe code,
partial recursion, or an unchecked evaluation theorem.

Removing the unnecessary read avoids duplicating constant jump continuations into every branch
of a binary read tree. Combined with one-primitive TM1 normalization, continuations are shared
through labels. This module alone does not normalize source syntax or remove reads from load,
write, or branch statements. A retained read still has a syntax tree exponential in the fixed
block width; destination equality and finite head-independence checks also incur runtime cost.

## Proof-driven head-free compilation

For syntax-valued labels, deciding head independence can require comparing very large syntax
trees and finite function fields. `compilerFree C M` avoids this decision entirely. Its statement
translator `fastNormalFree` compiles every goto directly to `.normal (l default v)` and otherwise
uses the same block operations. These executable definitions require only the block code and
`Inhabited Γ`; they have no `Fintype`, `DecidableEq`, membership test, or safety-proof argument.

`AllHeadFree q` recursively requires head independence at every goto in `q`, including every
write continuation and both branches. Correctness is proved on a source invariant:

```text
ss : TM1.Supports M S
hM : ∀ l ∈ S, AllHeadFree (M l)
```

`free_respects C M ss hM` uses the relation
`source.l ∈ Finset.insertNone S ∧ TM1to1.trCfg C.encode C.blank source = target`.
`TM1.step_supports` preserves its support component, and the statement induction uses the
head-free premise for the currently simulated source jump. `free_dom C M ss hM input` proves
both halting directions for the actual `blockInput`. The source invariant and head-free proofs
are used only in theorems; no safety check executes during compilation or machine execution.

The theorem does not require head freedom at arbitrary raw labels outside `S`.
`free_supports C M ss` and `free_supports_mathlib C M ss` preserve the original executable and
Mathlib supports without any head-free premise: the direct jump chooses a destination at the
source symbol `default`, which source support already covers. The original adaptive compiler
and every original API remain available.

## Verified semantics and input

- `fast_respects C M` proves Mathlib's `Respects` relation using exactly
  `TM1to1.trCfg C.encode C.blank`. The relation preserves the source store, maps a source label
  to `normal`, and uses the original block tape translation. A source step has a nonempty
  finite target simulation. A source terminal configuration is terminal in the target.
- `fast_dom C M input` proves both halting directions on `blockInput C input`, using the
  existing `blockCfg_init` equality. This fixes the actual initial label, store, tape contents,
  and head position; it does not assume an unspecified prewritten target tape.
- `fast_supports_mathlib C M ss` proves support on the unchanged `TM1to1.trSupp M S`.
  `fast_supports C M ss` gives the executable `binarySupport M S` formulation.
- `orderedLabels M labels symbols` reuses `binarySupportList`. With an alphabet-covering
  `symbols` list, `orderedLabels_mem` proves that its membership is exactly
  `TM1to1.trSupp M labels.toFinset`. The list preserves supplied order and can contain duplicates.

`BlockCode.roundtrip` guarantees that encoded source symbols decode correctly, and
`BlockCode.blank` guarantees that the blank tape expands to false bits. The compiler accepts a
total decoder on all bit patterns. For `BlockCode.ofList`, unused patterns decode to the blank
symbol. The simulation theorem concerns aligned encoded source tapes; it makes no separate
semantic claim about arbitrary malformed or misaligned binary tapes. Decoding introduces no
extra halting instruction. Width zero is permitted when the encoding laws can be satisfied.

## Evidence

The owned evidence directory is `.unlazy/chess-m5/leaf-1.6/`. Four focused warning-failing
builds are recorded in `pass-1.log` through `pass-4.log`:

```text
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Block
```

`Runtime.lean` checks a store-dependent, head-independent jump and a genuinely symbol-dependent
jump, including all four Boolean source-symbol/store combinations for the latter. Kernel
`#guard` checks and executable `#eval` output are retained in `runtime.log`. For the two-bit
test code, Mathlib's constant-jump syntax has 21 nodes while the optimized syntax has one;
the symbol-dependent path retains 21. The ordered Post support traversal has length 6 instead
of 86 for a two-label Boolean test program. These are exact measurements of the displayed
test programs, not asymptotic state-count guarantees for other inputs.

The original 41-declaration audit is recorded in `inventory.log`; the extended 68-declaration
audit is in `inventory-free.log`. Both include generated recursion helpers, including `_f`,
`_sunfold`, and `_unsafe_rec`, and permit only the standard axioms `propext`, `Classical.choice`,
and `Quot.sound`. `Inventory.lean` checks every public and private declaration in this module.
Runtime executability is checked independently of classical proof dependencies.

`RuntimeFree.lean` and `runtime-free.log` additionally check the equality-free compiler with
function-valued labels `Nat → Nat`, for which no constructive decidable equality is supplied.
They verify its supported halting theorem for a program with a deliberately head-dependent goto
at an unsupported raw label, confirming that the safety premise is confined to the invariant.
The current executable signatures and standard-axiom reports are retained in the same log.
Focused builds for the extension are recorded separately in `free-pass-1.log` onward.
