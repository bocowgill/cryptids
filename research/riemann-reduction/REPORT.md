# RH reduction: closed state-53 route and decoder-sharing obstruction

**Latest result:** the separately approved decoder-sharing pilot ran once.
Python and independent Node replay found endpoint failures for every one of
the 30 aliases. The batched Lean theorem failed Decidable synthesis; no audit
or retry followed. See [the precise result](pilot-decoder-sharing/RESULT.md).
No candidate was exported, and no new RH saving is certified.

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
reproduced, plus two complete tape traces. This computational rejection of the
unchanged-endpoint contract is not blank-run inequivalence. The exact certificate
error is `Decidable (∀ i : Fin 30, failure i (witness i))` synthesis at generated
ShareCertificate.lean:52:2. Family definitions built, but the final theorem and
its full-private audit/rejection controls remain unverified.

Exactly one free ordinary remote job ran, attempt 1, without retry: 332.146
governed seconds and sampled 5.13 GiB aggregate RSS. No resource stop occurred.
The original 3180s/6GiB/512MiB-driver limits were kept. Further RH jobs and broader
search are held pending new authorization; the Chess campaign pause is preserved.

## Preserved audit and baseline

[BASELINE.md](BASELINE.md) pins commit
`6c28d8524fa008c6fb5aadb759df74a55ce96423`, table SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`,
toolchain, manifest and historical PR7/PR10 default-kernel evidence.
Accepted sources remain unchanged. No full accepted-baseline comparator replay
was run by the audit or the state-53 counterexample verification.

[STATE-ACCOUNTING.md](STATE-ACCOUNTING.md) and [the ledger](state-ledger.tsv)
charge every physical state once: 45 decoder + 10 native leaves + 7 INC core +
11 DEC core + 4 returns + 2 padding/pop + 4 scanner + 11 jumps/bridges + 1 halt.
The 98 auxiliary labels and 121 logical rows are not physical savings.
[OPPORTUNITIES.md](OPPORTUNITIES.md) records the remaining conditional routes;
the original [PILOT.md](PILOT.md) is retained as history.

[CHECKPOINT.md](CHECKPOINT.md) records the current hold. The older Chess campaign's
pause record is unchanged. Its shared branch has separate Parsimony work after
the historical pause checkpoint; this RH task leaves that work and its jobs alone.
