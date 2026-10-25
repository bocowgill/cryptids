# RH reduction: checked state-53 and decoder-sharing counterexamples

**Latest result:** one separately authorized verification repaired the computable
Decidable instance and Lean-checked all 30 retained decoder-sharing counterexamples.
The full-private audit and explicit rejection controls passed. See
[the verified result](pilot-decoder-sharing/verify-02/RESULT.md). The first job's
Decidable failure remains preserved. No candidate was exported or RH saving certified.

The **canonical state-53 bypass is closed**. Independent full-tape replay and
Lean kernel checking confirmed that its skipped-bit encoding does not commute
with zero DEC's return pop. For the accepted typed `.outside 44` walked word
W = `1001110110`, E(B_1(W)) = `100111` while B_1(E(W)) = `101`.
The deleted bit carries a return delimiter. See
[the closure record](pilot-53/CLOSED.md),
[direct derivation](pilot-53/COUNTEREXAMPLE.md) and
[verified evidence](pilot-53/replay-02/RESULT.md).

The accepted pinned RH machine remains **95 states**, with zero new certified
savings. This local obstruction does not establish blank-run inequivalence,
blank reachability of the test frame or a lower bound on other constructions.
The original failed job and separately authorized successful job remain retained.

## Executed bounded decoder-sharing pilot

[Decoder sharing with unchanged words](pilot-decoder-sharing/PROPOSAL.md) is
the approved historical contract. The job analyzed only {26,46,50,86,87,94},
whose ZERO cells all equal `0R58`: 15 pairs, both original representative choices,
with accepted words/tapes/returns unchanged. No finite alias survived, so the
conditional candidate-export and full RH proof path did not run.

The retained 189-case screen supplies a typed witness per choice, independently
reproduced, plus two complete tape traces. The same witness module now passes
the Lean kernel after the computable instance repair. Four audited roots cover
774 dependencies and use only propext/Quot.sound; the main batch uses only propext.
Injected sorryAx and fresh kernel-invalid controls rejected. This formally rejects
the unchanged-endpoint contract without establishing blank-run inequivalence.

The original job failed at Decidable synthesis; its evidence is unchanged. The
single additional verification job passed in 347.438 governed seconds with a
sampled 5.85 GiB aggregate RSS peak. It replayed only the 30 retained endpoints,
with no new search, candidate export or retry. The original 3180s/6GiB/512MiB-driver
limits were kept. Further RH jobs and broader search are held; Chess's pause is preserved.

## Preserved audit and baseline

[BASELINE.md](BASELINE.md) pins commit
`6c28d8524fa008c6fb5aadb759df74a55ce96423`, table SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`,
toolchain, manifest and historical PR7/PR10 default-kernel evidence.
Accepted sources remain unchanged. No full accepted-baseline comparator replay
was run by this audit or either finite-counterexample verification.

[STATE-ACCOUNTING.md](STATE-ACCOUNTING.md) and [the ledger](state-ledger.tsv)
charge every physical state once: 45 decoder + 10 native leaves + 7 INC core +
11 DEC core + 4 returns + 2 padding/pop + 4 scanner + 11 jumps/bridges + 1 halt.
The 98 auxiliary labels and 121 logical rows are not physical savings.
[OPPORTUNITIES.md](OPPORTUNITIES.md) records the remaining conditional routes;
the original [PILOT.md](PILOT.md) is retained as history.

[CHECKPOINT.md](CHECKPOINT.md) records the current hold. The older Chess campaign's
pause record is unchanged. Its shared branch has separate Parsimony work after
the historical pause checkpoint; this RH task leaves that work and its jobs alone.
