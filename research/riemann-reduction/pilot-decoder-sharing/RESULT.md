# Decoder-sharing result — 2026-10-24

**Closed route; historical first-job result.** See [CLOSED.md](CLOSED.md).
A separately authorized verification now repaired
the computable Decidable instance and Lean-checked/audited all 30 unchanged
witnesses successfully. Read [verify-02/RESULT.md](verify-02/RESULT.md) first.
The original failure description and evidence below remain preserved.

**All 30 fixed aliases have independently reproduced finite endpoint mismatches.
The batched Lean certificate is not verified: its final theorem failed typeclass
synthesis.** The single authorized job stopped at that error. No retry, candidate
export, broader search or new RH saving followed.

## Exact certification obstruction

[Run 40141846969](https://github.com/bocowgill/cryptids/actions/runs/40141846969),
job `121015053991`, attempt 1, failed during `lake --wfail -f
lakefile.riemann-share.toml build ShareCertificate`. Producer:
`8f3bda3344561fcb2d81987f8dfc48eeac1413ef`.
Source transport: `b655f1ffabcbde330e76ba0ff017ec62ec15190f`.

The exact retained diagnostic at generated `ShareCertificate.lean:52:2` is:

```text
failed to synthesize
  Decidable (∀ (i : Fin 30), failure i (witness i))
```

The named Prop `RhShare.failure` lacks an explicit computable Decidable instance
or equivalent unfolding for the final `decide +kernel` call. This is a certificate
implementation error, not an evaluated false inequality, memory failure or timeout.
`ShareDefinitions` built successfully, including its family-coverage and dense
range lemmas. The generated final batch did not check, and no full-private audit,
forbidden-axiom control, fresh invalid-proof control or axiom print ran afterward.
Do not credit those planned checks or the failed batch as formal verification.

The next *possible* repair is to supply the computable decision procedure for
the existing predicate and recheck these same witnesses. That repair has not
been applied or tested. There is no authorization for another job or a changed
alias family. Do not repeat enumeration or substitute Classical.propDecidable
for a computation intended to run inside the kernel decision tactic.

## Completed finite checks and their scope

The Python screen used the approved 30 aliases, queried from the pinned table
on demand, with no complete 94-state table generated. Its fixture set was all
97 outside schemas plus entry and 22 local schemas at depths 0..3: 189 typed
cases. Each alias stopped at the shortest failing word in that finite set,
with the approved lexicographic and typed-label tie breaks.

Independent Node code reconstructed the family and typed words directly from
the pinned sources, reproduced all 30 dispositions and their shortest-in-set
witnesses, checked the generated Lean witness list against those records, and
replayed both complete finite tapes for one representative. Wrong-cell and
wrong-alias-count controls were rejected. Combined Python/Node decoder and TM
transition evaluations: **40,050**, below 2,000,000. There were zero finite
survivors and zero exported candidates.

The witness labels for both representative choices of every pair are:

| Pair | Keep smaller member | Keep larger member |
| --- | --- | --- |
| 26,46 | local 0 0 | outside 63 |
| 26,50 | outside 6 | outside 63 |
| 26,86 | outside 89 | outside 63 |
| 26,87 | local 0 1 | outside 63 |
| 26,94 | local 0 3 | outside 63 |
| 46,50 | outside 6 | local 0 0 |
| 46,86 | outside 89 | local 0 0 |
| 46,87 | local 0 1 | local 0 0 |
| 46,94 | local 0 3 | local 0 0 |
| 50,86 | outside 89 | outside 6 |
| 50,87 | local 0 1 | outside 6 |
| 50,94 | local 0 3 | outside 6 |
| 86,87 | local 0 1 | outside 89 |
| 86,94 | local 0 3 | outside 89 |
| 87,94 | local 0 3 | local 0 1 |

These refute the proposed unchanged-word, unchanged-endpoint parser contracts
computationally. They do not establish blank reachability, blank-run inequivalence,
global shortestness, or impossibility under other relations/encodings. No 94-state
RH machine or machine-size lower bound is certified.

## Representative physical mismatch

Choice 0 removes old 46 and keeps old 26. The typed caller is `.local 0 0`:
word `1111101`, walked word `1111101000`. The old read-preserving parser reaches
58; the alias leaves the read-preserving parser (`none`), so its required dense
endpoint 57 is missing.

The tapes start from the same root frame: state 15, head 0, padding 22, nine zero
banks, ONE sentinel at -1 and ZERO everywhere outside the listed finite support.
At 10 physical steps, the accepted machine is in old state 58, head 10, with the
input tape unchanged. The alias view is in old state 77, head 10, with extra ONEs
at coordinates 8 and 9. Its redirected 90/ZERO enters 26, then 26/ONE goes to 33,
33/ZERO enters the INC-f leaf 77 and that leaf writes into those two padding cells.
The full supports and every transition are retained in `evidence/unpacked/tapes.json`
and independently replayed. These are parser-length observations, not next-root
or blank-initializer equivalence tests.

## Resources, provenance and retention

One ordinary free `ubuntu-24.04` public-fork job ran, with no retry. The repaired
capacity probe succeeded; absent cgroup v1/v2 files were recorded as null. Physical
RAM was 16,766,414,848 bytes and admission availability was 15,246,696,448 bytes.
Missing cgroup files do not establish an unlimited container memory allowance.

| Governed stage | Actual seconds | Cap |
| --- | ---: | ---: |
| Provenance/family preparation | 0.078 | 120 |
| Finite screen and tape generation | 0.077 | 180 |
| Independent replay/controls | 1.770 | 60 of the 450 audit allowance |
| Dependency/cache setup | 98.280 | 884.238 remaining setup allowance |
| Kernel build, failed | 218.102 | 600 |
| Foundation audit and kernel rejection controls | Not run | Remaining 390 |
| Candidate/comparator | Not run | 900 |

Initial checkout/toolchain/cache restore consumed 13.831 seconds. Driver-governed
total was **332.146 seconds** from the job clock; artifact upload took about two
seconds, within the 30-second packaging allowance. The GitHub run spanned
23:13:32–23:19:15 UTC (343 seconds including platform setup/cleanup), below 3180.
Sampled aggregate child-session-plus-driver peak RSS was **5,510,496,256 bytes
(about 5.13 GiB)**, below 6 GiB. Driver peak was 13,803,520 bytes, below 512 MiB.
The 0.05-second watchdog and -M6144 limit were active. All 35 real Lean invocations,
including dependency builds, were serialized. No resource cap caused this stop.

Artifact ID `12579470236`, 13,930 bytes, is retained intact as `evidence/artifact.zip`
and extracted under `evidence/unpacked/`. Its measured SHA-256 matches GitHub:

```text
f976adbed2c07f1896cca0564405cf53ef42161a7739f3cde9c0adadc484a49c
```

The archive includes the generated failed Lean source, kernel diagnostic,
per-choice JSONL, finite screen, complete tapes, independent replay, original
source hashes, capacity/resource receipts and serialized Lean invocation log.
Local work only downloaded, extracted and inspected retained bytes; no local
Lean/Lake/LSP/LeanProbe, simulation, generation or executable state census ran.

## Hold and acceptance status

The execution task is complete at an exact certification obstruction; its five
evidence-integration gates are met. This does not mark the failed proof complete.
Accepted RH state count remains **95**, with **zero certified savings**. The table,
accepted proof/specification, toolchain, manifest, old state-53 evidence and runner
remain unchanged. The canonical state-53 route remains closed.

The older Chess campaign's pause file remains unchanged; separate Parsimony work
on its shared branch was not altered. No Chess goal or job was touched. Broader
search and all further RH jobs remain held pending separate authorization.
