# Generic route: allocate only the required binary return controls

Status: source-reviewed design, not an implemented or Lean-checked optimization.
This report performs no local builds, proof checks, simulations, fixtures, or state
censuses. Numerical constants below are existing source theorems, not new measurements.

## Recommendation

Implement **selective return-control allocation** first. Keep every Post main
control and allocate a binary bounce control only for each listed write destination.
Prove an exact row certificate against the existing `Binary.compile` machine.
This preserves the entire tape, including its head position, from arbitrary live
configurations and provides both directions of halting equivalence. It does not
need a global reachability proof or a new macro-step semantics.

The existing compiler has main index `i` and bounce index `q + i`. A move uses one
binary step, whereas a write uses a rightward writing step and a leftward return
step. See `Cryptids/Compilation/Binary.lean:41`, `:50`, `:62`, and `:101`.
Only the write case enters a bounce. Therefore main states whose indices are never
write destinations do not require corresponding bounce states, even if those main
states are frequently reached by moves.

Do not fuse writes with following moves in this first implementation. Fusion is
potentially useful, but its proof interface differs from the exact row certificate
available for selective allocation.

## Minimal generic interface

For `M : TM0.Machine Bool (Fin q)` with `[NeZero q]`, use computable data:

```lean
returnAt   : Fin r → Fin q
findReturn : Fin q → Option (Fin r)
```

The central proof obligation is universal write coverage, including both scanned
symbols and every Post control, not just configurations observed in a run:

```lean
coverage : ∀ i a j b, M i a = some (j, .write b) →
  (findReturn j).map returnAt = some j
```

This single statement ensures that every actual write destination has a lookup
and that its lookup decodes to the correct destination. `r = 0` is a valid generic
case when there are no writes; do not impose `[NeZero r]`.

A layout can additionally provide `findReturn (returnAt k) = some k`. This proves
distinct allocation and makes numeric export convenient, but it is not necessary
for the semantic theorem. Duplicated listed destinations waste paid states without
invalidating exact behavior. An overapproximation of the required destinations is
also sound; exact minimality of the list is not a prerequisite for a strict saving.

Define controls in `Fin (q + r)` explicitly:

```lean
mainState   (i : Fin q) := i.castAdd r       -- numeric value i
bounceState (k : Fin r) := Fin.natAdd q k    -- numeric value q + k
```

The transition rules are:

| New control and Post row | New binary row |
|---|---|
| main `i`, `M i a = none` | `none` |
| main `i`, `some (j, .move d)` | preserve symbol, move `d`, main `j` |
| main `i`, `some (j, .write b)` | write `b`, move right, bounce `findReturn j` |
| bounce `k`, either scanned symbol | preserve symbol, move left, main `returnAt k` |

The main write row uses the `Option` lookup: it is absent if lookup fails. The
`coverage` theorem must rule that out for every actual Post write. A total fallback
to an arbitrary control would conceal this important obligation and is unnecessary.

The lookup is part of constructing a finite transition function. It is not a tape
algorithm executed by the Turing machine and must not introduce uncounted runtime
states. The exported literal table must contain all resulting rows and the same
explicit indices.

## Exact proof bridge

Define a decoder into the original `Fin (q + q)` control space:

```lean
decode (mainState i)   = Binary.mainState i
decode (bounceState k) = Binary.bounceState (returnAt k)
```

Its numeric rule is `i ↦ i` on the main block and `q + k ↦ q + returnAt k` on the
return block. In particular, `decode 0 = 0`.

Prove the following certificate for every new state and both binary symbols:

```lean
LocalCertificate.Rows (selectiveCompile M returnAt findReturn)
  (Binary.compile M) decode
```

The certificate is an equality of optional transition rows after decoding the
destination. It preserves missing rows as well as present rows. Its definition and
the existing theorems are at `Cryptids/Compilation/LocalCertificate.lean:29`, `:35`,
`:46`, and `:59`:

1. Split the new state using `Fin.addCases`.
2. For a main state, split `M i (Binary.decodeSymbol symbol)` into missing, move,
   and write. Missing and move rows agree directly. The write case follows from
   `coverage` by mapping the returned index to the old bounce control.
3. For a bounce state, use `Binary.compile_bounce`; both machines preserve the
   scanned symbol, move left, and enter the same decoded main control.

`LocalCertificate.step_decode` then gives, for every new configuration `c`,

```lean
(step new c).map (LocalCertificate.decodeCfg decode) =
  step old (LocalCertificate.decodeCfg decode c)
```

`decodeCfg` changes only the control (`LocalCertificate.lean:25`). This is exact
full-tape equality, not agreement only on a finite window or only up to translation.
Every original Post state still has its main control, so the result applies to an
arbitrary Post live configuration and its arbitrary tape, not merely the frozen
chess input. It also applies to every retained bounce configuration. It does not
assert an inverse representation of removed old bounce controls.

Add a wrapper in the **new** generic module, leaving the frozen helper unchanged:

```lean
theorem haltsFrom (c : Cfg (q + r) 2) :
  (StateTransition.eval (step new) c).Dom ↔
    (StateTransition.eval (step old)
      (LocalCertificate.decodeCfg decode c)).Dom
```

This follows from `LocalCertificate.respects` and `StateTransition.tr_eval_dom`,
with the same symmetry used by `LocalCertificate.halts_iff`. Specialize it at main
zero on **any** binary tape to obtain `Init.HaltsOn new T ↔ Init.HaltsOn old T`.
`Init.HaltsOn` is defined at `Cryptids/Compilation/Init.lean:79`.

No injectivity of the decoder, no surjectivity onto the old control space, and no
global reachability premise are required. Exact deterministic rows prevent the
spurious halting that could otherwise arise from deleting a required bounce.

## Independent numeric row recipe

Use the structure already demonstrated by
`Cryptids/Optimisation/TerminalBinary.lean:158`–`:208`, but without its terminal-tape
relaxation:

1. A new row at index `s` reads the old row at numeric index `decode s`.
2. Partially reindex its old destination: old main `i` becomes new main `i`; old
   bounce `j` becomes `findReturn j` mapped to new bounce.
3. Preserve the old written symbol and direction exactly.

Thus a table transformer can use `Option.bind` to account explicitly for a missing
destination lookup. Prove `table (Binary.compile M) = selectiveCompile M` by cases.
This equality alone is **not** the correctness theorem: both sides could wrongly
halt on an uncovered write. The separate universal `coverage` premise is what
establishes the exact row certificate and halting equivalence.

Prove the arithmetic values of main, bounce, decoder, and partial reindexing as
named lemmas. An exported table/checker should independently validate the declared
allocation, every source row selector, and both symbol rows of every new state.
Do not substitute a matching hash or a collection of successful runs for the
universal Lean certificate.

## Full chess composition and accounting

The accepted body is exactly `Binary.compile FieldPacked.post`, with
`q = 533341` and body count `2*q = 1066682`; these are existing theorems at
`Cryptids/Chess/Optimisation/FieldPacked.lean:37`–`:46`.
The accepted complete machine has a paid reverse initializer of `1837941` states
and total `2904623`; see `Cryptids/Chess/Optimisation/FieldReverse.lean:50`–`:56`.

For a certified destination layout of size `r`, the proposed complete allocation is:

| Component | Paid controls |
|---|---:|
| Unchanged reverse initializer | `1837941` |
| All Post main controls, including the existing halt control | `533341` |
| Listed bounce/return controls | `r` |
| New dispatch or trampoline controls | `0` |
| **Complete machine** | **`1837941 + 533341 + r`** |

The symbolic saving is `533341 - r` when `r ≤ 533341`; strict improvement requires
`r < 533341`. No value of `r` has been measured or certified in this report.
The unchanged initializer is still fully paid; the optimization has not claimed a
smaller initial input, external storage, or preloaded tape.

Integration should be a new module/version with this sequence:

1. Instantiate the layout and prove coverage for the frozen `FieldPacked.post`.
2. Obtain `Init.HaltsOn newBody (Tape.mk₁ FieldPacked.bits.toList) ↔`
   `Init.HaltsOn FieldPacked.body.toMachine (Tape.mk₁ FieldPacked.bits.toList)`.
3. Compose `FieldPacked.body_halts_input` (`FieldPacked.lean:71`) to get exactly the
   frozen not-draw proposition.
4. Reuse `OpenEvolveWide.schedule` and `ReverseInit.Schedule.initialise_halts`
   (`Cryptids/Optimisation/ReverseInit.lean:170`). This is the same composition as
   `FieldReverse.generated_halts` (`FieldReverse.lean:62`).
5. Reprove the complete allocation and exact paid body-entry tape theorem using
   `OpenEvolveWide.cast_initialises`, as at `FieldReverse.lean:81`.
6. Apply the independent selective row transformer to `FieldPacked.rowBody` and
   use its existing `rowBody_eq` (`FieldPacked.lean:112`) plus the new table/compiler
   equality. Reuse `OpenEvolveWide.numericImage_congr` for the full numeric image,
   following `FieldReverse.lean:91`–`:97`.
7. Add the new public full-machine definition and theorem only after remote strict
   proof checks, complete state accounting, and the campaign's independent review.

## Why fusion is a later route

If a Post write enters `j`, and `M j false = M j true = some (k, .move d)`, one
binary instruction can write and move directly to main `k`. More generally, the
written bit determines which row of `j` is relevant. This is a promising second
route if the required return set is large.

It is not certified by the exact decoder above: the old binary write enters a
bounce and moves right, while the fused instruction can move left and enter a
different main control. Their one-step rows differ. The source write's intermediate
live configuration is also skipped, so the existing positive-length simulation of
each individual Post step cannot simply be copied.

A fusion proof needs a distinct macro-step semantics or a carefully specified
simulation relation that accounts for the pending move. It must preserve halting
in both directions and avoid an argument that permits infinitely many source steps
to correspond to zero target steps. Main `j` must remain allocated if reachable
through another predecessor or used as entry; fusing one edge does not establish
that its whole control can be removed.

The existing terminal-only optimization is a third, smaller tool. Its relation
intentionally forgets the final tape at a distinguished halt
(`TerminalBinary.lean:61`–`:63`), and its `haltsFrom` theorem requires a proof that
the distinguished state is terminal (`:141`). It does not provide a license to
discard arbitrary return controls under an exact live-tape claim.

## First obstruction and remote acceptance tests

The first substantive obstruction is concrete, not generic: obtain a compact,
computable `returnAt`/`findReturn` and a kernel-checkable universal coverage proof
for the frozen field-packed Post body. A native census can suggest a list and its
size, but it does not prove coverage or the emitted table's correspondence.
The separate body scout owns the source characterization and remote census plan.

If the measured and certified set needs every main index, this route produces no
strict reduction. Record that outcome and move to fusion or a more structural
compiler transformation; do not conceal zero savings by changing the count basis.

Remote validation should include these adversarial cases in addition to the full
machine proof and count:

- A missing lookup for a real write destination must fail coverage/certification.
- A lookup that returns the wrong decoded destination must fail certification even
  if both destinations happen to terminate on a sample tape.
- A Post control with a move row on one symbol and a write row on the other must
  retain the latter's required return; inspect both symbols.
- A terminal control that is a write destination still needs a return under this
  exact-row construction. Removing it requires the separate terminal theorem.
- A write self-loop, repeated destinations, and the zero-return no-write case must
  all satisfy their stated generic contracts.
- Exact tape/head preservation must hold at arbitrary live main configurations,
  not just at the blank entry or on the frozen input.
- Numeric row remapping must preserve `none`, directions, written symbols, entry
  zero, and the main/return boundary; every allocated state must be counted.

## Four manual passes

1. **Complete:** traced `Binary.compile`, the exact local row certificate, the
   field-packed body, and the full reverse initializer composition.
2. **Expert:** reduced the proof obligation to universal write coverage and a
   decoder; identified arbitrary-tape and input-halting wrappers and an independent
   row-deletion recipe with explicit numeric indices.
3. **Defect:** checked missing lookup, incorrect lookup, zero returns, duplicates,
   both symbols, terminal writes, loss of intermediate boundaries under fusion,
   and the distinction between table equality and semantic correctness.
4. **Polish:** separated existing certified counts from the unknown `r`, included
   all controls in the full total, and kept the recommendation to one implementable
   mechanism. No implementation or computational verification is claimed.

The next concrete task is to combine this interface with the body scout's proposed
destination layout, then implement and verify the generic certificate remotely
before certifying a new full machine.
