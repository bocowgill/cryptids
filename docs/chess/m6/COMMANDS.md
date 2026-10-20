# Structured command compiler

`Cryptids/Compilation/Commands.lean` defines `ConjectureMachines.Compilation.Commands.Cmd`,
an imperative language over the independently checked `Scalar.Expr` language. Its source states
are arbitrary `List Nat` values. `Exec command initial final` is an independent inductive
terminating big-step relation; its definition contains no `Code`, compiler, or `Code.eval` call.

## Commands and exact state conventions

| Command | Source behavior |
| --- | --- |
| `skip` | Return the complete input state. |
| `assign index expression` | Evaluate the expression on the original state, then replace that register, padding missing earlier registers with zero. |
| `push expression` | Evaluate on the original state, then prepend its result. |
| `pop` | Return the state tail; popping empty input returns empty input. |
| `seq first second` | Run `first`, then run `second` on its result. |
| `ifZero test yes no` | Evaluate the test on the original state and run the selected branch on that complete state. |
| `while test body` | Stop when the current-state test is zero; otherwise execute the body and repeat on its resulting state. |

Scalar reads beyond the end return zero, as specified by `Scalar.eval`. Every natural number
other than zero is true for a while test. Tests are reevaluated after every body execution.

Total assignment is the explicit function

```
write index value state =
  (List.range index).map (fun i => state[i]?.getD 0) ++
    value :: state.drop (index + 1)
```

For example, assigning register 3 of `[5]` to 12 returns `[5,0,0,12]`.
`write_eq_set` proves agreement with `List.set` whenever `index < state.length`.
`write_length` proves the new length is `max state.length (index+1)`.
`write_zero` and `write_succ` expose the ordinary recursive update equations.

## Actual compiler and theorem API

`compile : Cmd → Turing.ToPartrec.Code` returns concrete syntax over mathlib's seven constructors.
Assignment uses `prefixCode` to rebuild earlier registers from the original state, then places
the expression result before the unchanged suffix. Sequencing is `Code.comp` in the correct
execution order. Branching uses the verified original-input `NatCode.ifZero` combinator.

The actual while program is

```
Code.fix (NatCode.ifZero (Scalar.compile test)
  Code.zero' (Code.cons (NatCode.literal 1) (compile body)))
```

The zero branch returns `0 :: state`, so the fixpoint returns that state. The continuing branch
evaluates the compiled body and prefixes `1` to its result. `loopBody_eval`, `loopBody_step`, and
`compile_while_eval` prove this equals the fixpoint of the partial state transition
`loopStep`: a zero test yields `Sum.inl state`, and a positive test maps the body result through
`Sum.inr`. Divergence of the body is retained by this partial transition.

The main interface is:

- `Exec.sound`: a source derivation yields actual `Code.eval` result membership.
- `compile_complete`: any actual result membership yields a source derivation.
- `exec_iff_eval command v w`: `Exec command v w ↔ w ∈ (compile command).eval v`.
- `Exec.eval_eq`: a source derivation implies `(compile command).eval v = pure w`.
- `terminates_iff_dom`: existence of a source result is equivalent to defined code evaluation.
- `Exec.deterministic`: two terminating source results are equal.

The forward proof inducts on the independent `Exec` derivation. The reverse proof inducts on
command syntax and uses `PFun.fixInduction'` for actual while evaluations. Both body execution and
the remaining loop are recovered from the partial fixpoint, so the reverse theorem does not
assume body termination or replace it with a total function.

`while_never_zero` proves that a test nonzero on every state gives actual evaluation `Part.none`,
for any body. `while_true_eval` specializes this to `while (literal 1) body`.
`not_exec_while_true` also excludes every finite big-step source derivation. Thus divergence is
proved from exact fixpoint semantics rather than inferred from a finite timeout.

## Verification and scope

The focused `lake --wfail build Cryptids.Compilation.Commands` passes without warnings. Evidence
under `.unlazy/chess-m6/leaf-1.11/` includes source fixtures, outputs, exact axiom queries, build
log, four-pass review ledger, and SHA-256 hashes. The fixtures execute the actual mathlib
`stepNormal`/`stepRet` interpreter through a proved sound fuel runner. They cover empty pop and
while states, suffix preservation, padded and original-state assignment, sequential order,
both branch paths, a five-step countdown, accumulation from five down to one, and an infinite
while control. A source countdown theorem proves termination and the exact output for every
natural counter; finite runtime observations are not used to prove general correctness.

Only the standard axioms `propext`, `Classical.choice`, and `Quot.sound` occur in the inspected
theorem closures. There are no opaque runtime primitives, assumed arithmetic operations,
unchecked Lean evaluator calls, proof holes, or runtime escape declarations.

This generic bridge does not yet supply the actual chess rule program, history traversal,
dead-position decision procedure, or complete defunctionalized M4 evaluator. Dynamic register
reads are available through `Scalar.lookup`; this command AST currently has fixed-index writes.
The concrete whole-chess source program and its refinement remain parent integration work.
