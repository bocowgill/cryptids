# RH reduction: closed route and next bounded proposal

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

## Next bounded proposal — awaiting approval

[Decoder sharing with unchanged words](pilot-decoder-sharing/PROPOSAL.md) is
the next proposed pilot. Analyze only {26,46,50,86,87,94}, whose ZERO cells all
equal `0R58`. Each pair may use either member's existing ONE branch: 15 pairs,
at most 30 symbolic aliases, and at most one exported complete 94-state candidate.
Keep the accepted control words, tape layout and return protocol fixed.

The first question is exact parser equivalence on the entire typed language.
Finite failures yield typed-word witnesses; finite passes require a proof for
arbitrary recursion depth before any candidate export. Different ONE branches
may reject the entire family. A surviving parser equation alone earns no RH
credit: full physical transport, blank boot, the unconditional RH theorem,
independent comparator and foundation audit remain mandatory.

Proposed budget: one free ordinary remote job, 3180 seconds total, 6 GiB aggregate
RSS, 512 MiB driver, serialized Lean with -M6144, no retry. There are no new jobs,
generated candidates or executable checks in this proposal. The user's explicit
approval is required before launch. Broader search remains held; Chess stays paused.

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
