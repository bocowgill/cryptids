# Finite TM1 control numbering

`Cryptids/Compilation/NumberTM1.lean`, in namespace
`ConjectureMachines.Compilation.TM1Number`, numbers a supported TM1 program before
alphabet reduction. This changes the representation of finite control without
changing the tape alphabet, store type, or primitive operations.

## Executable representation

For `M : Λ → Turing.TM1.Stmt Γ Λ σ` and an explicit ordered `labels : List Λ`,

```lean
numberProgram M labels :
  Fin (labels.length + 1) → TM1.Stmt Γ (Fin (labels.length + 1)) σ
```

The lookup list is `default :: labels`. Numeric row `q` decodes by the existing
`unnumberLabel labels q = (default :: labels).get q`, then executes
`mapStmt (numberLabel labels) (M (unnumberLabel labels q))`.

`numberLabel` uses first-occurrence lookup in that list. Its initial label is
always numeric zero. Duplicates are retained, so the exact number of TM1 labels
is **`labels.length + 1`**, even when `labels` already contains `default`.
Different numeric rows may decode to the same source label. No proof assumes
that numbering after decoding recovers a duplicate row's original index.

`mapStmt` recursively preserves move, write, load, branch, and halt commands. A
goto destination `f a v` becomes `numberLabel labels (f a v)`. Primitive write,
load, and branch functions are unchanged. Source-label equality remains an
explicit constructive input `[DecidableEq Λ]`; numeric control then has the
ordinary finite equality used by later compiler stages. This pass does not
claim a complexity bound or remove every source-label comparison during lookup.

The executable definitions require neither a finite source-label type nor
finite tape/store types. Configuration and semantic theorems require
`[Inhabited Γ]`; initialization additionally requires `[Inhabited σ]`.
`[Inhabited Λ]` fixes the source initial label.

## Support and data invariants

The principal semantic hypothesis is

```lean
ss : TM1.Supports M (default :: labels).toFinset
```

It includes closure of every goto in every supported body, for every scanned
symbol and store value. `unnumberLabel_mem` proves that every numeric row decodes
inside this set. `unnumber_number` from `Finite.lean` then proves that each
supported goto destination survives numbering and decoding exactly.

The existing lookup's fallback to numeric zero for an off-list source label is
executable but has no correctness claim for unsupported source executions. The
support hypothesis excludes that fallback at every simulated goto.

`mapCfg f` changes only the optional control label. `decodeCfg labels` is
`mapCfg (unnumberLabel labels)`. Both preserve the store value, every tape cell,
and the head position exactly; `none` remains `none`. The construction does not
encode input data into a control label, precompute a program result, or supply an
external halting oracle.

## Verified simulation API

| Declaration | Guarantee |
| --- | --- |
| `stepAux_map` | Renaming commutes with complete statement evaluation |
| `decodeCfg_map` | Decoding fixes a numbered supported source configuration |
| `step_number` | One supported source step equals one numbered step after control renaming |
| `number_respects` | Forward `StateTransition.Respects`, retaining the source-support invariant |
| `stepAux_decode` | Supported statement evaluation decodes to the exact source result |
| `step_decode` | Every numbered step decodes to exactly one source step |
| `decode_respects` | Reverse-direction `Respects`, valid at every numbered configuration |
| `numberProgram_dom_cfg` | Both halting directions from any numbered configuration and its decoding |
| `numberProgram_dom_source_cfg` | Both halting directions from any supported source configuration and its numbering |

The optional control label `none` is preserved in both directions. TM1's halt
command still takes the same one-step transition to a `none` label before the
next missing step. There are no additional execution states or stuttering steps.

`mapCfg_init` and `decodeCfg_init` identify the actual initial configurations:
numeric control starts at zero, the store starts at the same default value, and
the exact same finite input tape starts under the same head position.

`numberProgram_dom M labels ss input` proves

```lean
(TM1.eval (numberProgram M labels) input).Dom ↔ (TM1.eval M input).Dom
```

Its two directions follow from Mathlib's `StateTransition.tr_eval_dom`, rather
than inferring reverse halting from a one-directional trace. Empty input is
included. Numbering neither adds nor discharges any prewritten-input assumption;
the later verified blank initializer remains responsible for that step.

`numberProgram_supports M labels` proves that the numbered program is supported
by `Finset.univ`, without a source-support premise. Every possible numeric goto
destination belongs to that finite type. Semantic preservation still requires
the separate source-support premise above.

For an existing support proof `ss : TM1.Supports M labels.toFinset`, use
`initialFirst_support` or the convenience theorem
`numberProgram_dom_of_support M labels ss input`. Source support already puts
`default` in the list's set, so adding it first does not enlarge that set.

## Head-free jumps and downstream block compilation

`mapStmt_allHeadFree f stmt h` proves that `Block.AllHeadFree stmt` is preserved
by any control-label map. The goto case is congruence: source destinations equal
for all scanned symbols, hence their mapped destinations are equal too.

`numberProgram_allHeadFree M labels hM q` provides this property at every numeric
row when `hM` covers `(default :: labels).toFinset`. If the original ordered list
already supports the source machine, use
`numberProgram_allHeadFree_of_support M labels ss hM q`, with `hM` on
`labels.toFinset`. These facts can be passed to `Block.compilerFree` together
with `numberProgram_supports`; no runtime head-freedom equality test is added.

## Verification and review

The focused gate is

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.NumberTM1
```

The proof review checks all six statement constructors, branches after arbitrary
earlier tape/store changes, support closure of all goto outputs, duplicate rows,
the initial default label and numeric zero, empty input, and the halt/`none`
distinction. The source contains no proof placeholders, custom axioms,
`native_decide`, user-defined `unsafe`/`partial`, or noncomputable runtime path.

The required focused gate passed with exit status **0**:

```text
✔ [908/908] Built Cryptids.Compilation.NumberTM1 (810ms)
Build completed successfully (908 jobs).
```

The SHA-256 of that complete two-line UTF-8 output, including its final newline,
is `51d58830f00fe51305fdc66854d593c5e2c2e81f85333379bece20b814b7953c`.
The checked source SHA-256 is
`254696f86962943e0d6f4bcbd950ec4f70589be09020866a6fae82c2464059d0`.
The source was unchanged after the gate. Final LSP diagnostics contain no errors,
warnings, or proof placeholders.

LSP `lean_verify` checked `numberProgram_dom` and
`numberProgram_allHeadFree_of_support`, including a source scan: both use only
`propext`, `Classical.choice`, and `Quot.sound`, with no suspicious source patterns.
An environment-wide audit additionally checked **46** public and private module
declarations, rejecting every axiom outside those three. Generated recursive
compiler helpers were included explicitly: `mapStmt._unsafe_rec`, `mapStmt._f`,
`mapStmt._sunfold`, the matcher, six equations, and private equation/splitter
helpers all have empty axiom sets. The `_unsafe_rec` declaration is generated by
Lean for the structurally recursive definition; it is not user-authored code and
was not exempted from the audit.

The successful standalone audit used the following Lean code:

```lean
import Cryptids.Compilation.NumberTM1
import Lean
open Lean Elab Command
run_cmd do
  let env ← getEnv
  let ns := `ConjectureMachines.Compilation.TM1Number
  let names := ((env.constants.toList.map Prod.fst).filter fun n ↦
    ns.isPrefixOf n || n.toString.startsWith "_private.Cryptids.Compilation.NumberTM1.").toArray
  logInfo m!"Auditing {names.size} declarations"
  for n in names.qsort Name.lt do
    let axioms ← collectAxioms n
    logInfo m!"{n} | axioms: {axioms.toList}"
    unless axioms.all (fun a ↦
        a == `propext || a == `Classical.choice || a == `Quot.sound) do
      throwError "Nonstandard axiom dependency in {n}"
```
