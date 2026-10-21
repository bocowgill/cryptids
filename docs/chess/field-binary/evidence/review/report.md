# Independent field-aware binary pilot review

**Disposition: R1 and R2 pass within the requested routine-pilot scope.** The
accepted chess machine remains at 390,491,642 states. This review does not certify
a field-aware full-chess backend, dynamic write dispatcher, marker-operation
implementation, caller/return integration, global saving ratio or live job state.

Reviewer: independent leaf-1.1 / field_referee. Review is bound to computation
commit `aec53614962607635789060f51c4576bdcdc00b0` and successful remote run
`39621322042` of `bocowgill/cryptids`, branch `codex/chess-openevolve-pilot`.
All local reviewer operations were source reading, edits, hashing, archive checks
and saved-output inspection. No local Lean, LSP, LeanProbe, Lake, native audit,
machine/fixture/table execution or model search was performed. No outreach or
upstream write was performed. Root acceptance and current-job cleanup/status
checks are separate subsequent records.

## Source criticism and repair

The source pass examined every new Lean module, exporter, fixture simulator,
verification script, focused Lake configuration and workflow, together with the
relevant accepted allocation formulas. It found one acceptance-path defect:
the generator negative control named a chess declaration absent from the pilot's
generic imported environment, but the audit looked up that declaration before
checking its forbidden namespace. The defect would have produced a missing-name
error rather than exercising the intended blacklist. Root moved the blacklist
check before the environment lookup. The reviewer independently re-read that
repair before the accepted computation. The successful final log shows the
intended generator-rejection message. The original finding and both initial and
final source bindings are retained as `r1-source-review.md`,
`r1-initial-source-binding.json` and `r1-source-binding.json`.

The comparison review also required explicit treatment of the overlapping old
reader/writer families and the different allocation scopes. Final module comments
and public documents now retain those distinctions. No other semantic,
state-accounting or acceptance-scope defect was found in the bound source.

The finite compiler charges every instruction, branch and numeric terminal
control; even duplicate exit values occupy separate states. The binary machine
has no free stay-put transition, oracle or mutable return register. Universal
theorems link exact finite execution to the semantic tape, decode the reached
numeric exit and show that its transitions stop. Reads restore the exact entire
tape and head; writes specify every integer tape coordinate and preserve every
coordinate outside the addressed triple; movement performs thirteen preserving
moves. These contracts quantify over arbitrary Mathlib binary tapes, including
unused field codes and arbitrary neighboring cells. Separate valid-cell theorems
connect the four five-valued fields and marker to those raw tape operations.

## Final evidence inspected

The retained run and job API records both say completed/success at the same
commit. The required fresh-evidence, probe and full-verification steps succeeded.
The saved logs show remote `CHESS_REMOTE=1`, the strict commands and a cleared
evidence directory before execution. The official upload transcript names the
same 21-entry artifact, size, artifact ID and digest as the retained API metadata.
The reviewer authenticated archive consistency against those retained records;
the reviewer did not perform a new network fetch or independently attest the API
transport.

Artifact ID: `12354329768`; size: 70,211 bytes.
Artifact SHA-256:
`3b760230b9d449a32293edeaeccbce7a7d6446b568d6467976279f72cfd9d22e`.
Logs SHA-256:
`765b273322ae0246304a04f604ab8ff6b429a84d7057e24e18086e8efdff491c`.
Every archive entry has a unique safe path, a checked size/hash and byte-identical
extracted content. Both archives pass CRC checks. All five phase receipts agree
on eleven computation hashes, 237 frozen hashes, run ID and computation commit;
all corresponding current files match. Every command transcript belongs to a
phase, its saved output hash agrees, and its output occurs in the official logs.

The strict Pilot build and native audit/export executable build succeeded. The
native dependency audit checked 196 roots and 5,787 dependencies. It permitted
only `propext`, `Classical.choice` and `Quot.sound`. Seven compiler-generated
unsafe recursion artifacts were excluded from root enumeration only after the
source audit checked their safe owners, types and safety conditions. The closure
traversal rejects unsafe/partial dependencies; none of those excluded artifacts
occurs as a mathematical dependency of the audited safe roots. The audit reported
zero generator roots. Its axiom, open-conjecture and generator controls all
failed for their intended reasons. The three false-theorem files also failed for
mathematical reasons: the undercharged movement count and wrong decoder value
were proved false, and the wrong write claim reduced to `False`.

The native exporter emitted actual transitions and decoded exits for 38 routines:
four reads, eight raw constant writes for each of four fields, and both movement
directions. Saved row and exit-array sizes agree with the certified counts;
each read has eight charged exits and each write/movement one. The independent
remote sparse-tape simulator passed 311,296 executions: every routine on all
8,192 raw local cell patterns, including 1,250 valid encoded cells and 6,942
invalid cells, with nonblank contexts on both sides. It checked exact tape,
head, result and step behavior. All six deliberate table corruptions were
rejected. This is bounded regression evidence; the universal arbitrary-tape
claims derive from the Lean theorems, not an extrapolation from these fixtures.

Five failed remote proof attempts remain retained with failure API records,
original archives/logs and matching extracted bytes: `39607907762`,
`39608668800`, `39609387995`, `39610078320` and `39610691159`. They were not
relabeled as successful checks. The separately saved disposition record records
the canceled old-source duplicate. Live status and cleanup are not certified by
this review.

## Counts and scope of the final claims

| Field offset | Standalone read states | Standalone constant-write states |
|---:|---:|---:|
| 0 | 39 | 5 |
| 3 | 66 | 11 |
| 6 | 93 | 17 |
| 9 | 120 | 23 |

Both movement directions use 14 states. Counts include every terminal control.
The legacy numbers 211,410 / 82,000 / 110 are counterfactual sensitivities of
the old generic body allocation, holding other inventory parameters fixed.
They are not standalone old routine counts. The read/write families overlap;
the old reader includes eleven-bit whole-symbol decoding and per-symbol
continuations, while the candidate reads one three-bit coordinate. A candidate
constant writer is not a complete dynamic writer/dispatcher. Consequently these
differences cannot be added as replacement costs or reduced by candidate counts
to establish per-operation or complete-backend savings.

`RESULTS.md`, `results.json`, `RESUME.md` and `DESIGN.md` were read against the
actual saved evidence and source contracts. The final claims distinguish the
certified routine pilot from future integration, explicitly reject full-machine
saving claims and keep the accepted chess total unchanged. The text correctly
separates the universal semantic step-count theorem from the closed transition
counts observed in all remote fixtures. Frozen source/specification, toolchain
and prior accepted artifacts match all 237 pins. No claim that this pilot solves
the chess conjecture or constructs a new complete chess machine is accepted.

## Portable verification and bindings

`construction-binding.json` fixes the exact computation maps and the reviewed
source, documents, evidence manifests, archives, transcripts and retained failure
records. `check_saved_evidence.py` discovers the repository by ascending to a
directory containing both `lean-toolchain` and `Cryptids`; it works from either
the private or published review directory. It only reads saved metadata/output
and hashes. It does not import or execute the Lean, fixture or machine producer.
Its three in-memory negative controls target a changed source digest, archive
entry digest and unsupported full-machine claim. Each was run using saved data
only and exited 1 with its intended rejection message; the unmodified evidence
passed.

`receipt.json` is deterministic and uses the saved run's update time
`2026-10-21T15:00:19Z`, not the reviewer's clock. `seal.json` binds the checker,
receipt, report, construction binding and earlier source-review records. Public
promotion must preserve those bytes. A subsequent change to bound computation,
documents or evidence requires re-review. The independent report may be copied
byte-identically to `docs/chess/field-binary/REVIEW.md`; the root's later
`evidence/root-check.json` is its own acceptance record and is outside this seal.
