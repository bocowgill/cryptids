# 41/ONE proof-only pilot: exact certification obstruction

**Historical first-job result.** The separately authorized
[repair verification](verify-02/RESULT.md) later stopped before proof checking
at a shallow-checkout provenance error. The first failed source and all raw
evidence below remain preserved.

The single approved job completed with **an implementation failure in the local
Lean proof source**. It did not certify unbounded 41/ONE avoidance, the separator
trace invariant, or an unconditional overwrite corollary. This is not a mathematical
counterexample to avoidance. No retry, candidate export or state saving followed.

## Exact first failure

[Run 40154837829](https://github.com/bocowgill/cryptids/actions/runs/40154837829),
job `121053880229`, attempt 1, producer
`06e9245fe2675f1c2e94ba1477982c2d2a8b4816`; source transport
`6c83dbe9a93bfe936a62ea202d412fed9a46ecd4`.

`lake --wfail -f lakefile.riemann41.toml build GuardCore GuardBoot` exited 1.
The first diagnostics are at `GuardCore.lean:34:54` and `:34:66`:

```text
Ambiguous term Tape.write
  ConjectureMachines.Tape.write
  Turing.Tape.write
Ambiguous term Tape.move
```

The source opens both namespaces. Unqualified `ListBlank` at lines 38 and 44,
and later `Tape.mk'`/`Tape.write`/`Tape.move` references, are also ambiguous.
The first failed simplification therefore leaves the expected tape-head equality
unproved. Separately, line 56 uses deprecated `if_neg`; strict warnings make that
an error, with `ite_eq_right` named by the compiler as its replacement.

These are avoidable proof-source defects, not a false evaluated guard, timeout or
memory stop. The failed source and log remain byte-for-byte retained. A possible
future repair would fully qualify the custom ConjectureMachines tape operations
and remove the deprecated use; it is **not applied or checked here**. Further
errors or mathematical gaps may remain after that repair. No further job is authorized.

The new GuardCore module did not build. Its local safety and conditional isolation
theorems receive no certification credit. GuardBoot could not build through that
dependency, and the assembly probe was not executed. Existing accepted Bootstrap95
rebuilt, but that supplies its old endpoint theorem, not the new all-prefix claim.
The workflow's green status means the allowed exact-obstruction outcome was
retained and audited where possible; it does not mean the target proof succeeded.

## Completed finite and kernel checks

- The literal table parser matched the pinned SHA-256 and all 190 cells, including
  sole absence 61/ONE. Actual 41 is `(0R54, 1R80)`; 58 is `(1R58, 0R41)`.
- Generated GuardLiteral built with `decide +kernel`. `Rh41.all_cells` binds every
  actual Lean transition to the independently parsed literal table.
  `incoming_sources`/`incoming_only` certify that only 58/ONE enters 41, writing
  ZERO and moving RIGHT. `selected_effect` checks the selected typed DEC-j callers.
- The unchanged blank boot replayed for exactly 3634 steps to actual state 15,
  head -4, and the full accepted initialRoot tape. No target hit was found in
  that finite prefix. This is finite replay, not the new Lean prefix-safety theorem.
- All 16 fixed selected callers, four active-bank vectors and two extra-bank
  layouts produced 128 frame probes. All reached the next root without a target
  hit or failed 58/ONE separator guard. Bounds and fixtures were not widened.
- Independent Node parsing, caller selection, full-tape reconstruction and trace
  replay matched every receipt. Python and Node each used 18209 transition
  evaluations, 36418 combined, within the shared 2000000 limit.
- The known-false avoidance claim for initial 0/ZERO was rejected at time 0;
  the deliberately corrupted incoming cell was rejected too.

The full-private audit covers **only the four built GuardLiteral roots**:
750 dependencies, propext only. Both injected sorryAx and fresh
`True.intro : False` controls were rejected, exit 1. Explicit axiom prints passed.
The audit does not cover failed GuardCore declarations or unexecuted modules.

## Resources and retained evidence

| Item | Actual |
| --- | ---: |
| Governed elapsed time, including setup | 351.125 seconds |
| Initial action setup before driver | 19.479 seconds |
| Additional wrapped setup/cache | 95.227 seconds |
| Local kernel stage | 219.694 seconds, exit 1 |
| Independent replay | 0.317 seconds |
| Audit/control stage | 16.147 seconds |
| Sampled aggregate child-session plus driver peak RSS | 6292324352 bytes, about 5.86 GiB |
| Driver peak RSS | 18509824 bytes |
| Serialized real Lean invocations, including dependencies | 41 |
| Exported candidates / state savings / retries | 0 / 0 / 0 |

The ordinary public-fork ubuntu-24.04 runner stayed inside 3180 seconds,
6 GiB aggregate RSS, 512 MiB driver and -M6144 limits. The repaired optional
cgroup probe recorded unavailable files as null and retained /proc capacity;
it did not treat absent files as unlimited memory. No watchdog stop occurred.
No separate baseline comparator job or RH comparator rerun was launched.

Artifact `12584417386`, 94696 bytes, is retained intact as
[evidence/remote-artifact.zip](evidence/remote-artifact.zip), extracted under
`evidence/unpacked/`. Its measured SHA-256 equals the GitHub digest:

```text
ff7e585d6bad60d368fda3a481fc51ac59917607d0102786bcd2637fef708f82
```

Key retained source/log hashes:

```text
GuardLiteral.lean  4b4860e9320ba4eb0205112695dfbf602b13f68a120bef4915548cb1156e4023
GuardCore.lean     f4ffc518c8ad967a3e40f3650093e7e3bf4d0cf70d418e6f6e32a6bad355633c
local-kernel.log   f5ac04f49fa88d9b39f84044514cdd1cd3c9c72290b0815fd29cde8698a5b118
```

The archive also retains complete boot/frame tapes and transition deltas, all
commands and stages, capacity, resources, proof roots, axiom/control logs and
per-file hashes. The local failed source matches its retained remote copy.
Local activity only retained/inspected bytes, compared provenance and wrote
documents; no Lean, simulation, candidate generation or executable census ran locally.

## Hold and remaining obligations

The accepted machine remains **95 states**, pinned at
`6c28d8524fa008c6fb5aadb759df74a55ce96423`, table SHA-256
`7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d`.
Accepted sources and prior route evidence are unchanged. The older Chess campaign
pause file still matches its historical checkpoint; separate Parsimony work is untouched.

The first stop is the local compiler error above. Beyond it, all-intermediate
native/jump/return traces, the new boot prefix theorem, unbounded stage assembly
and the unconditional isolated-overwrite corollary remain unproved. Finite absence
of a visit does not discharge any of those obligations. No state merge or removal
is justified. Every further RH job and broader search remain held pending approval.
