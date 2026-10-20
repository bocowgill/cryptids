# Shared TM1 continuations

`Cryptids.Compilation.Normalize` exposes the namespace
`ConjectureMachines.Compilation.TM1Normalize`. It compiles an actual TM1 program
`M : Λ → TM1.Stmt Γ Λ σ` to a TM1 program whose labels are original statements.
The program parameter in `Label M` fixes the initial label to `M default`.

Each normalized instruction performs one source primitive and jumps to its
continuation:

| Original statement | Normalized body |
| --- | --- |
| `move d q` | `move d (goto (fun _ _ ↦ q))` |
| `write f q` | `write f (goto (fun _ _ ↦ q))` |
| `load f q` | `load f (goto (fun _ _ ↦ q))` |
| `branch p q r` | `branch p (goto (fun _ _ ↦ q)) (goto (fun _ _ ↦ r))` |
| `goto f` | `goto (fun a v ↦ M (f a v))` |
| `halt` | `halt` |

`tr` does one pattern match; it does not recursively translate the continuation.
`tr_onePrimitive` verifies the resulting syntactic form for every statement.
All continuation jumps are independent of the scanned symbol and store. Original
gotos retain their original symbol/store dependence, then select the body from
the actual source program. When a continuation is itself an original goto, the
normalized program first jumps to that goto statement and evaluates it in the
following transition, after the preceding primitive's tape/store update.

## Semantics

`trCfg M ⟨l, v, T⟩ = ⟨l.map M, v, T⟩`. The store and the entire two-sided tape,
including head position and blank tails, are unchanged. Distinct source labels
with equal statement bodies may share a normalized label.

`stepAux_reaches` proves by structural induction on the original statement that
starting at its normalized statement label reaches the translation of the
original statement's result after a nonempty finite execution. The move, write,
and load cases take a transition and apply the induction hypothesis to the
updated configuration. A branch takes a transition to the selected continuation
and applies that continuation's induction hypothesis. Goto and halt each take
one transition. This proof covers every tape and store, without a reachability
assumption or finiteness requirement.

`tr_respects` lifts that result to Mathlib's `StateTransition.Respects`. A halted
source configuration translates to a halted configuration. Nonempty simulation
segments ensure that an infinite source run cannot be hidden by stuttering.
Mathlib's deterministic simulation theorem supplies both directions of
`tr_eval_dom_cfg`. `tr_init` proves the exact initial configuration relation by
reflexivity for every finite input tape, and `tr_eval_dom` gives

```lean
(TM1.eval (tr M) input).Dom ↔ (TM1.eval M input).Dom
```

These semantic theorems require an inhabited tape alphabet. The initial-input
theorems additionally require inhabited source labels and store. They do not
require a finite alphabet, finite store, finite source control, or source support.

## Constructive support

`supportList M labels` traverses `labels` in its supplied order and concatenates
the existing `subtermList`'s preorder traversal of each source body from
`Cryptids.Compilation.Finite`. Duplicates are retained, so executable enumeration
never chooses an ordering of a mathematical finite set.

`mem_supportList` proves that the list contains exactly the statements occurring
inside a body `M l` for some `l ∈ labels`. `support M labels` is this list's
`toFinset`. Its equality test is the constructive structural equality from
`Cryptids.Compilation.Finite`, including enumerated equality of finite function
fields. This finite-set interface requires `Fintype Γ`, `Fintype σ`, and
`DecidableEq Γ`, `DecidableEq Λ`, `DecidableEq σ`; it does not require `Fintype Λ`.
The ordered list itself needs none of these instances.

`tr_supports M labels sourceSupports` proves

```lean
TM1.Supports M labels.toFinset → TM1.Supports (tr M) (support M labels)
```

The proof includes the translated default body. Immediate continuations stay in
the source subterm closure. An original goto targets a supported source label,
whose entire body belongs to the normalized support. The source support premise
is essential for the original goto case; no arbitrary computability or control
closure assertion is assumed.

The list contains one entry per source substatement occurrence across the given
source bodies. This is an enumeration cost, not the number of distinct reachable
states or the final binary machine state count. Later binary encoding and TM1 to
TM0 lowering introduce their own control states. Normalization prevents those
passes from repeatedly expanding a long sequential continuation inside every
binary read branch. Final literal transition tables and their measured counts
remain an integration obligation.

## Tape-independent jumps without runtime equality

`Cryptids.Compilation.FreeNormalize` exposes proof lemmas in
`ConjectureMachines.Compilation.FreeNormalize`. It uses Block's recursive
`AllHeadFree` predicate: every goto in a body chooses the same destination for
all scanned symbols, while its destination may still depend on the store.

`stackNormal_allFree` verifies every original TM2 body translation;
`stackAction_allFree` verifies that each stack action preserves the property;
and `stack_allFree M l` verifies every actual `TM2to1.tr M` body, including the
stack-search and return shuttle labels. This needs no finite alphabet or store.

`subterm_allFree` proves inheritance by source substatements.
`normalize_preserves_allFree` proves preservation by normalization: new
continuation gotos are constant functions, and an original goto composed with
`M` remains independent of the scanned symbol. Together these yield
`normalize_stackSupportList_allFree` on the ordered traversal, and
`normalize_allFree` on `TM1Normalize.support (TM2to1.tr M) labels`.

The support restriction matters. The raw normalized label type includes every
TM1 syntax tree, including arbitrary symbol-dependent gotos that never occur
in the stack simulator. There is no assertion that all such labels satisfy
`AllHeadFree`. Block's `compilerFree` instead proves correctness with the source
control invariant and `AllHeadFree` only on the supplied support. The original
normalization, ordered label lists, exact initialization, and both halting
directions are unchanged. The new module consists entirely of proofs, and
introduces no runtime equality test or label-membership test.

Its additional focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.FreeNormalize
```

## Verification

The focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Normalize
```

Leaf evidence under `.unlazy/chess-m5/leaf-1.5/` records the direct gate output,
the complete axiom audit including generated helpers, source scans, and final
file fingerprints. No runtime path uses choice, a custom axiom, native proof
evaluation, user-defined unsafe code, or partial recursion.
