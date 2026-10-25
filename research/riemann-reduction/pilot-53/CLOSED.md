# Canonical state-53 route closed — 2026-10-24

Disposition: **retired after a verified local counterexample**. The user requested
closure after the independently replayed, Lean-checked result. No further job,
retry, parameter search or encoding repair is authorized by this closure.

## Exact route being retired

- Base: `6c28d8524fa008c6fb5aadb759df74a55ce96423`.
- Accepted table SHA-256:
  `7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`.
- Edit: redirect old 40/ONE from 53 to 68; delete 53; densely relabel.
- Encoding E: delete the bit read at old 53 during the read-preserving decoder
  walk, retaining every other bit. Reduce the full frame's padding index by
  the number of deleted bits; retain the existing arithmetic/return protocol.
- Required bridge: E commutes with that protocol, including zero-DEC's B_1 pop.

The bridge is false at the genuine typed instruction `.outside 44`, zero DEC
of bank 0, with walked word W = `1001110110`:

```text
E(B_1(W)) = 100111 != 101 = B_1(E(W)).
```

The deleted ZERO is a return delimiter. Its value is immaterial to the forward
branch at 53 but material to the subsequent return. Faster dispatch does not
repair this failed equation.

## Evidence preserved

[COUNTEREXAMPLE.md](COUNTEREXAMPLE.md) gives the direct derivation and complete
frame interpretation. [replay-02/RESULT.md](replay-02/RESULT.md) retains the
independent Python/Node full-tape replay, kernel proof and full-private audit.
The theorem is `Rh53Counterexample.counterexample`; its checked closure uses
only `propext`. Verification producer:
`aed235c1001984528478268f4de834a1110cad77`.
Result/evidence checkpoint: `727f7b47bed5e17993b2e6ba5e28aad3ee646aff`.

Remote history is two jobs: original startup failure 40132242492, followed by
the separately authorized successful verification 40134606435. The failed run,
successful run, scripts, proof sources, rejected table and original artifacts
remain available. Closure does not rewrite their historical dispositions.

## Scope and restart rule

This closes the canonical skipped-bit/unchanged-return route. It establishes
neither blank-tape inequivalence nor a lower bound on RH machines. A different
encoding, return rewrite or reachability-restricted proof would be a new route
with new obligations; changing notation does not reopen this false equation.
No such repair is part of the next proposal.

The accepted RH baseline remains 95 states with zero certified savings.
The older Chess campaign's pause record remains in force; this work changes no
Chess checkout, goal or job. Its historical pause checkpoint is
`b971fa888c84b5a62900171fa17eef7cf2cda6d9`; subsequent separate Parsimony work
on that shared branch is left untouched. See [current provenance](../CHECKPOINT.md).
The subsequently approved [decoder-sharing verification](../pilot-decoder-sharing/verify-02/RESULT.md)
now has Lean-checked endpoint failures and a passing full-private audit. Its
first job's Decidable error remains preserved as history.
Broader search and all further RH compute jobs remain on hold.
