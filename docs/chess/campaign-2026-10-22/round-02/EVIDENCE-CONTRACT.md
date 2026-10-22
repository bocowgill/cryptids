# Round 02 sealed metadata replay contract

Status: source drafted and reviewed; successful full-machine run39797909133,
session4 at780ad59e871a47d76726a5c81800af3e48bda188, is retained in
`round-02/evidence/final`. Its metadata matches this contract. Revised fresh
complete advisory, external acceptance seal and actual positive replay remain
pending. This document does not accept a new chess machine.

The checker is `scripts/chess_seed_20261022/check_saved_evidence.py`. It reads
saved metadata and hashes. It never imports or invokes Lean, Lake, the compiler,
the expander, fixture scripts, a simulator, a generator or a machine counter.
The large `full-rows.bin` stream is hashed without parsing its rows. Native JSON
and fixture receipts are checked for declared scope and mutual consistency;
these checks are not independent local mathematical verification.

## External acceptance anchors

The checker requires a separate parent-supplied seal using schema
`chess-seed-seal-v1`, and a fresh independent-model advisory using schema
`chess-seed-review-v1`. Use `--describe-seal` and `--describe-review` to inspect
the exact fields. These commands print templates with placeholders; they cannot
create an accepted seal from a packet's own assertions.

The review binds the complete candidate's computation and workflow commits,
source manifest, archive, theorem/count claim, exact checker and advisory narrative bytes.
Its mandatory `checker_sha256` must equal both the actual checker hash and the
separate seal's `checker_sha256`. An advisory for earlier checker bytes cannot
authorize a modified checker. The hostile `review_checker_hash` test checks this
binding separately from the seal's own checker-hash check.
The separate seal binds that review, the final checker, the frozen pin manifest,
the official archives and each retained API/inventory file. Both explicitly say
that the advisory is not human approval and is not formal verification by its
reviewer. Saved APIs and the external seal are trust anchors, not authenticated
GitHub attestations.

Claim required by the checker:

| Component | States |
|---|---:|
| Paid reverse seed writer, including its final turn | 424,157 |
| Entire finite binary expander | 216 |
| Expander/body bridge | 1 |
| Unchanged accepted interpreter main controls | 533,341 |
| Unchanged accepted interpreter return controls | 40,461 |
| Complete machine | 998,176 |

The claim names `ConjectureMachines.Machines.chess_seed` and
`ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw`, with two symbols,
blank tape, previous accepted count 2,411,743, and saving 1,413,567. These numbers
are acceptance requirements on saved remote evidence, not a checker-generated
machine count.

## Required packet and provenance

Official retention uses the frozen predecessor's metadata-only `retain.py`.
The evidence folder must contain exactly `artifact.zip`, `logs.zip`, `unpacked/`,
and `run-api.json`, `jobs-api.json`, `artifact-api.json`, `retention.json`,
`archive-entries.json`. All archives and unpacked files are hash-bound. Traversal,
duplicates, symlinks, encrypted/special archive entries and non-finite/duplicate
JSON keys are rejected.

The successful run must belong to `bocowgill/cryptids`, branch
`codex/chess-openevolve-pilot`, workflow `chess_seed_20261022.yml`. Both direct
`full` runs and bounded `full` sessions are supported. A session must bind its
actual source checkpoint, original workflow bytes/commit and successful final
disposition. All required job/step receipts must be completed successfully.

The packet must retain exact source manifest, all five phase reports, twenty
unique standalone command receipts, five false Lean count contracts, complete
native JSON, fixture JSON, and the complete full-row stream. Sessions additionally
retain `session-binding.json`, `session-result.json` and `executed-workflow.yml`.
Extra or missing artifact files are rejected.

The source snapshot binds every current round-02 computational Python/Lean file,
the workflow, lakefile, SeedLink, complete FieldSeed wrapper and public semantics.
It checks all 2,762 frozen baseline/accepted hashes and repository imports. The
metadata checker has its own mandatory external seal hash. If it was included in
the remote source manifest, that hash must also match; otherwise its later review
does not retroactively become a claimed remote computation.

## Required saved remote checks

The cumulative phase inventory is build1, contracts10, native11, counts12, full20.
Exact argv, cwd, timeouts, zero or intentional-failure exit codes, output hashes
and success-only markers are checked. The twenty commands comprise:

1. Strict complete semantic/native/audit build.
2. Safe closure audit, then rejection of a sorry axiom, the open conjecture and
   a proof generator as mathematical dependencies.
3. Five false count contracts rejected specifically because the propositions
   are false, rather than unrelated missing imports or tactic failures.
4. Actual complete native export, independent Python full-row/input/fixture
   comparison, prior regression build and seven prior regression commands.

The native/independent receipts must cover all 1,996,352 actual transition rows,
11,978,112 row-stream bytes, both missing halt rows, every paid region, exact seed
hash and complete static equality with the frozen target. The full paid writer
must be replayed. Full quadratic chess startup must not be run or claimed.

Finite supplemental receipts must include 88 actual complete toy-body startup
paths (all lengths zero through three plus three larger edge cases), 465
translated controller fixtures, all nine invalid-code cases, and 34 distinct
rejected corruption controls after positive checks. Tape/head/exterior and
native/independent receipt correspondence are checked. These finite observations
do not replace the universal Lean theorem.

## Parent replay and hostile controls

After successful complete evidence and fresh advisory exist:

```sh
python3 scripts/chess_seed_20261022/check_saved_evidence.py --root . --evidence docs/chess/campaign-2026-10-22/round-02/evidence/final --seal docs/chess/campaign-2026-10-22/round-02/review/seal.json --self-test
```

Require zero exit and `Seed sealed evidence controls passed`; retain its exact
receipt and source hash. Also copy the checker and seal outside the repository
and replay using explicit absolute `--root`, `--evidence`, `--seal` paths from a
different working directory. No path-based import of executable project code is
used.

Hostile metadata tests begin only after the positive packet passes. They alter
external claim/review/narrative/checker hashes, APIs, session identity, archive
inventory, command exit/timeout/output, audit foundations, count/allocation
receipts, seed/writer/head information, fixture inventories/exteriors and negative
control status. Selected inner hashes are refreshed only in disposable memory
copies so semantic guards are tested beyond stale-digest rejection. Tests never
write an acceptance seal, modify retained files, parse/recount the binary stream
or grant authority to altered evidence.

No positive packet or hostile-control pass is claimed yet. Parent final acceptance
must wait for those actual receipts and the complete independent review.
