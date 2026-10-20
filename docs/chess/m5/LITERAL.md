# Independent proofs about literal transition tables

`Cryptids/Compilation/Literal.lean`, namespace
`ConjectureMachines.Compilation.Literal`, provides reusable certificates for actual
`ConjectureMachines.Machine q 2` tables. It imports the machine semantics directly
and has no compiler dependency. The starting configuration may have an arbitrary
tape; the blank-tape wrappers use `ConjectureMachines.init` and `[NeZero q]`.

## Finite execution certificates

`runFrom M n cfg` is a total, executable bounded run:

```lean
runFrom M 0 cfg = some cfg
runFrom M (n + 1) cfg = (runFrom M n cfg).bind (ConjectureMachines.step M)
```

Thus `none` means a missing transition has already been encountered. It stays
`none` on later iterations. A machine whose starting state has a missing
transition is certified by `n = 1`; `n = 0` always returns its starting configuration.
Finite fuel exhaustion returning `some cfg` does not establish nonhalting.

`runFrom_reaches run` turns an exact result
`run : runFrom M n start = some stop` into
`StateTransition.Reaches (ConjectureMachines.step M) start stop`.
This is actual machine reachability, including both control state and tape.

`haltsFrom_of_runFrom_none` turns `runFrom M n start = none` into
`(StateTransition.eval (ConjectureMachines.step M) start).Dom`.
The proof extracts a reachable configuration with a missing transition; it does
not treat a fuel limit as a terminal state. `halts_of_runFrom_none` specializes
this theorem to `Halts M` from the blank tape.

The boolean variants `haltsFrom_of_runFrom_isNone` and
`halts_of_runFrom_isNone` accept `(runFrom M n start).isNone = true`. A concrete
table's certificate can be checked by ordinary Lean kernel reduction and
`decide`, without comparing tapes or trusting a native decision procedure.

## Unbounded divergence from a closed state set

`ClosedTotal M states`, for `states : Finset (Fin q)`, means:

```lean
∀ state ∈ states, ∀ symbol, ∃ write direction next,
  M.transition state symbol = some (write, direction, next) ∧ next ∈ states
```

Every table entry for every symbol in every member state must be present and
return to the set. The write symbol and move direction are arbitrary. This
property makes no assumptions about the current tape, head position, or symbols
that a finite test happened to visit.

`ClosedTotal.step` constructs an actual successor inside the set for any tape.
`ClosedTotal.reaches` preserves state membership along any finite execution.
`not_haltsFrom_of_closedTotal closed inside` then proves that a configuration
whose state lies in the set cannot have terminal evaluation. A purported halting
trace would end at a member state with both a missing transition and a present
transition, a contradiction. This rules out halting for arbitrary running time.

`not_haltsFrom_of_runFrom_some` combines a finite prefix with that invariant.
`not_halts_of_runFrom_some` is the blank-tape specialization. The finite prefix
must actually reach the set; listing a loop somewhere in the table is insufficient.

Two convenient blank-tape certificate forms avoid revealing the reached tape:

```lean
not_halts_of_runFrom_state closed
  (run : (runFrom M n init).map Cfg.state = some state)
  (inside : state ∈ states) : ¬ Halts M

not_halts_of_runFrom_inSet closed
  (run : (runFrom M n init).any
    (fun cfg ↦ decide (cfg.state ∈ states)) = true) : ¬ Halts M
```

Both require an actual `some` prefix result and prove reachability before applying
the closed-set argument. A halted prefix cannot satisfy either certificate.

## Two-state loops

`closedTotal_pair M left right` proves that `{left, right}` is closed and total
when every symbol in `left` has a transition to `right` and every symbol in
`right` has a transition to `left`. Writes and directions may vary with symbols.

`closedTotal_bounce M rightward leftward` specializes this to the common loop:

```lean
∀ symbol, M.transition rightward symbol = some (symbol, .right, leftward)
∀ symbol, M.transition leftward symbol = some (symbol, .left, rightward)
```

The loop preserves the scanned symbol, moves right, then moves left. The theorem
needs only its two complete rows. It certifies divergence on every tape once a
checked finite prefix enters either state. It does not depend on identifying a
repeated full tape configuration.

## Literal-table use and trust boundary

A caller can kernel-check a concrete table's finite halting prefix, or a prefix
entering a checked total closed set, and apply these theorems to that same literal
machine. These claims stand independently of compiler correctness. A separate
reproducible byte comparison may connect the literal table to an emitted compiler
artifact; this module does not claim such a comparison or assume table equality.

All utilities are total Lean definitions or kernel-checked proofs. There are no
proof placeholders, custom axioms, native decision proofs, user unsafe/partial
definitions, or compiler-oracle assumptions. The focused gate is:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Compilation.Literal
```

Evidence in `.unlazy/chess-m5/leaf-1.9/` includes a direct gate run, an audit of all
module declarations and generated helpers, and small independent literal-table
checks of halting, prefix state certificates, two-state divergence, and arbitrary
tape divergence.
