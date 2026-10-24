# Pinned baseline and provenance

Audit date: 2026-10-24 (America/New_York). This is a source/provenance audit,
not a new proof replay or an optimization result.

## Checkout and upstream

| Item | Pin |
| --- | --- |
| Worktree | `/Users/bocowgill/.codex/worktrees/4e0d/cryptids` |
| Research branch | `codex/riemann-reduction` |
| Initial HEAD and reviewed upstream main | `6c28d8524fa008c6fb5aadb759df74a55ce96423` |
| Upstream | `https://github.com/google-deepmind/cryptids` |
| Default branch | `main`, resolved with `git ls-remote --symref origin HEAD` |
| Root tree at the baseline | `a858285c85507a080b6a5080deef062a30792a98` |
| RH95 support subtree | `1e8e27f07368bd83ccfe6c55cd34f1b0a401ba2f` |
| `Cryptids` subtree | `bde39df6d36fea63642b2b41fd9e72f7525c62c8` |
| RH95 artifact subtree | `fbc6e4c56cfcff3c3a09af78f6aa5b37586b4e25` |

The initial checkout was clean and detached. The requested branch did not exist.
Fetched main with `git fetch --no-tags --no-write-fetch-head origin refs/heads/main`.
It already equaled HEAD, so no merge, reset or file update was necessary.
Created the unused branch at that exact commit before authoring these documents.
No push, upstream write or workflow dispatch occurred. Fetches added objects only;
they did not move any existing branch or overwrite shared `FETCH_HEAD`.

The chess worktree was observed at
`/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`, HEAD
`b971fa888c84b5a62900171fa17eef7cf2cda6d9`.
Only selected tracked blobs were read through Git from this checkout. No commands
were executed in the chess checkout; no goal, automation or remote job was changed.
Its `PAUSED-2026-10-24.md` remains authoritative. Nothing here resumes chess.

Applicable ancestor instructions: `/Users/bocowgill/.codex/AGENTS.md`, containing
the mathematical-tool and evidence rules supplied in the request. No tracked
in-tree AGENTS.md was found at this upstream baseline. Chess's separate AGENTS.md
was read as contextual evidence only; the present request independently requires
remote-only computation and 100-character new/generated Lean lines.

## Exact machine and theorem

Literal table: `artifacts/riemann_95/machine.txt` at the baseline commit.
Git blob: `d6f841a883bcf826d1fbdbd1c66497e072231c55`.
Raw-file SHA-256 (new, lightweight local hash):

```text
7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d
```

This equals both the raw-table and canonical-machine pins in `verify.py`.
The existing table is retained in place; the commit and blob recover its exact
bytes. `state-ledger.tsv` is a manually transcribed audit view, not a new machine.

95 physical states numbered 0..94; two symbols; 190 cells; 189 defined moves;
unique absent transition at 61/ONE. `Halts` starts in state 0 on the blank tape.
The target is exactly:

```lean
Halts ConjectureMachines.Riemann95.candidate ↔ ¬ RiemannHypothesis
```

The current proof composes `candidate_equivalent` with the RH104 semantics.
Its internal criterion is `∃ M : Nat, Riemann120.ShuniaCounterexample (M + 2)`.
The complete initializer reaches root state 15 after 3,634 steps, head -4,
padding 22, five zero active registers and four zero extras. These are retained
proof/checker facts; no simulator was run here.

## Toolchain and content hashes

Lean: `leanprover/lean4:v4.35.0-rc4`. Historical CI identifies compiler commit
`c29b6dda4f7c20e3eeaa717c4e565663c5cfa364` on x86_64 Linux.
Mathlib: `1f414401f69059aa7eead47b53ee40bd38455eeb`.
Verso: `01a09f320122475119588526857a07d218aef600`.
All transitive dependency revisions are pinned by the retained lake manifest.

SHA-256 values measured during this audit:

```text
8f89aa44fccdb1a0b6cc768c7c9f54b94cd40e47a08d582f82d1235f13075cf7  lean-toolchain
4bb9288d47457931549bbeff4d0e68d9a8dbd47b063e6b72a3210b0d09311284  lake-manifest.json
7c4250e8165473fa250cf95f1db6d36b0deb9a25203209016fe10771ab0db699  lakefile.toml
da475619b025b44bb6eb6159efc2cdfef3cd2b746e0c504de8e88f310fc528c3  Cryptids/Riemann95Definition.lean
f7f20b858f540a088fa71c665cb2d1467edce55288d9bffe4c7e26d3f032e4d0  Cryptids/Riemann95.lean
1e480817f4abc065e46524086914a6520cfc4dbf5994e96a6fde6a4a7636f130  Cryptids/Semantics/Riemann95.lean
2bb6a5b22d5e53270d54e552aee95a1cdbef01e110e087494a0ad866c1d5aeeb  Cryptids/Machines.lean
1c98af712d2815470449faa3c3f3d594910934247bc8d79e0cd3967d107b2e2c  Challenge.lean
8dc4fb20106d159c31aafbc4e4d4ea07d3f41277d4b67768055f2903305ba307  comparator/riemann_95.json
ec1d056be5d1557bf1d5094ff9fd581592fc0ba2d33b1c6234cff258d04b303f  comparator/all.json
e3c9815ce40c2ddc066b0d8d4f7cf5add5ac4a3395e2d964d367c532fda050f2  comparator/constructive.json
2624c3133d376820afac20e907487da3644f669d61b8b639e61f532f485ec262  verify.py
```

## Upstream result review

[PR #7](https://github.com/google-deepmind/cryptids/pull/7) was merged at
`bf17809905a1b9a514b0427e24290c7e860a649e`. It introduced this table.
The reviewed history is 120 -> 104 -> 95; older 744-state provenance also remains.
The complete default-branch history and current repository README/result table
contain no accepted RH machine below 95. Read-only repository PR search for
`Riemann` returned #10 and #7; issue search returned #14. This is a bounded
repository audit, not a claim about all unpublished or external constructions.

[PR #10](https://github.com/google-deepmind/cryptids/pull/10), merged at
`3c3faa23510ec9da4cf4531633eb5057500d9a71`, is material to the baseline:
it changed tape foundations to primitive Quot and improved constructive
reductions. RH95 support changes include arithmetic-frame notation, constructive
reference transport and witness/cofinality reasoning. It did not change the
95-state table or strengthen the RH95 equivalence config to exclude choice.
RH95's state inequality is in `constructive.json`; its halting equivalence and
analytic theorem still use the three-standard-axiom config.
Later #12/#13 changes concern BusyBeaver accelerations.

## Retained verification, retrieved anew

Historical logs and metadata were read from GitHub without rerunning jobs.
Compact excerpts and exact producer/run/job identities are in `evidence/`.

| Evidence | Tested commit | Outcome |
| --- | --- | --- |
| [PR7 CI run 39213851100](https://github.com/google-deepmind/cryptids/actions/runs/39213851100), job 117933119513 | `acef5887c8e870613ff3dacce00bbb604eac7229` (test merge) | Build, default-kernel comparator, root verifier succeeded |
| [PR10 CI run 39556745100](https://github.com/google-deepmind/cryptids/actions/runs/39556745100), job 119078169816 | `f9b305bf68a8112125586a5a1d1d67cc4d5458cd` (test merge) | Constructive and all-theorem default-kernel comparators plus root verifier succeeded |

Fetched the PR10 test commit by its exact SHA, also without ref updates.
`git diff --exit-code f9b305bf68a8112125586a5a1d1d67cc4d5458cd HEAD --`
over `Cryptids`, `Cryptids.lean`, `Challenge.lean`, all `artifacts`, the all/RH95/
constructive comparator configs, `verify.py`, toolchain, manifest, lakefile and
Cryptids CI workflow returned zero with no output. Thus the baseline's solution,
challenge, table and verification inputs in that scope equal the successful
PR10 inputs. Whole repository trees differ because of later BusyBeaver work.
The fetched historical test object is recoverable by SHA; it is not a branch.

The comparator independently exports the solution and Challenge definitions,
checks their dependency agreement and allowed axioms, then replays proofs with
Lean's default kernel. Challenge theorem holes are intentional specifications;
they must never enter a solution's trusted closure. Expected RH95 allowances:
`propext`, `Quot.sound`, `Classical.choice`, with no sorryAx or native proof oracle.
Historical lean-action nanoda checking was skipped in PR7; do not credit it.

[Issue #14](https://github.com/google-deepmind/cryptids/issues/14) reports an
independent finite and kernel/nanoda recheck at `664cd039`. Its external
certificates were not fetched or replayed here. This is third-party reported
evidence, separate from the CI logs actually inspected. Its caveats match source
inspection: Python checks theorem text, not proofs; recorded proof hashes are not
compared against pinned proof values; some RH104 simulation prose overstates its
coverage. Do not promote `verify.py` success to unbounded equivalence.

New verification here consists only of Git/content identity checks, small-file
hashes, source reading, manual ledger review and lightweight document-ledger lint.
The ledger linter passed with the expected manual-evidence warnings; status-only
inspection reported seven met manual gates without executing any check commands.
No Lean/Lake/LSP/LeanProbe,
generation, simulation, programmatic state census or baseline replay was run.
The audit budget was zero compute jobs and zero new proof replays; it was kept.

PR7's latest inspected exchange says the author used an autonomous GPT-6.1 Sol
heuristic loop and Aleph validation. The final inspected comment requests code,
prompts, interface and budget; it has no supplied implementation or later answer.
Neither tool availability nor a reproducible search loop follows from that claim.
