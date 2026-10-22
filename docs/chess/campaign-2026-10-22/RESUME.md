# Active chess compression goal — checkpoint 2026-10-22 17:10 UTC

The Codex goal is **ACTIVE**. Continue focused rounds; a resource stop or one
successful reduction does not complete it. Latest usage snapshot: 93% used,
7% remaining; ordinary usage allowed. No numerical goal budget was requested,
and no reset credit has been consumed. Leave resets to the user.

## Accepted machine: 998,176 states

`ConjectureMachines.Machines.chess_seed`, with theorem
`ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw`, proves both directions
of blank-tape halting iff NOT `(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.

| Paid component | States |
|---|---:|
| Reverse input writer, including final turn | 424,157 |
| Complete seed expander | 216 |
| Exact-head bridge | 1 |
| Interpreter main controls | 533,341 |
| Interpreter return controls | 40,461 |
| **Complete accepted machine** | **998,176** |

The goal started at 2,904,623 states. Accepted cumulative saving: **1,906,447**.
Round 01 saved 492,880; round 02 saved 1,413,567. No later machine is accepted.

Round 02 official run 39797909133 iteration 4: computation
`780ad59e871a47d76726a5c81800af3e48bda188`, workflow
`7e32af8294ca8052c88852518508c0e6ecd5bcf4`, artifact 12433769822.
All 1,996,352 actual rows, strict universal/public Lean, safe closure audit,
88 complete startup fixtures, 465 controller fixtures, 34 corruptions and
regressions passed. Fresh complete advisory, parent seal, 45 hostile metadata
controls and portability passed. See `round-02/RESULTS.md`, `evidence/final/`
and `review/`. All 35 gates are met and leases released.

## Requirements

- Frozen chess specification/conjecture and every accepted source/evidence file
  stay fixed. `accepted-998176-pins.json` contains 2,983 immutable entries.
- **All Lean/Lake/LSP/LeanProbe, builds, native execution, models, generators,
  simulations, synthesis, fixtures and machine counting run remotely.** Local
  source editing and saved metadata/hash inspection are permitted.
- No outreach, upstream issues/comments/PRs/messages. Fork checkpoints authorized.
- Keep full-machine accounting and ranked opportunities in
  `STATE-COUNTS-AND-OPPORTUNITIES.md`; distinguish accepted savings, finite
  measurements and partial proofs. Prioritize large avoidable cost categories.
- Never simulate the full quadratic 141,380-symbol startup. Use universal
  execution proofs plus complete static input identity.
- Root handles Git, network, remote dispatch and retention. Workers have disjoint
  source ownership; do not revert one another's work.

## Ranked routes

1. **Whole-body quotient: measured saving 459,315.** Body 573,802 → 114,487;
   prospective complete machine 538,861 with the accepted seed. The finite pilot
   checked all old/new rows, but the concrete Lean certificate is unfinished.
2. **Structured initializer: measured prospective saving 228,832.** Packet writer
   173,642 + decoder 21,682 + new bridge 1 + retained seed expander/bridge 217 +
   accepted body 573,802 = **769,344**. Combined with the unproved quotient:
   **310,029**. Neither candidate is accepted.
3. Structural/local-slot body certificates if literal data or row normalization
   does not scale. `round-03/FAST-ROW-OPTION.md` describes the source-level route.
4. Defer dictionary/arity/controller shaving until the larger routes are certified.
   Arity saves only 494 data bits; dictionary savings omit lookup overhead.

## Round 03: complete quotient certificate pilot

Finite pilot run 39795919458 at `8cd145e` independently checked all 1,147,604 old
rows and 228,974 quotient rows in 21.027 seconds / 287,416 KiB; 12 certificate
corruptions plus an overmerged golden were rejected. Exact data and parent replay
are retained in `round-03/evidence/pilot-final/`.

Certificate attempts are retained; none has certified an actual body row yet:

| Attempt | Result |
|---|---|
| 01, 39800616921 | Thread creation failed under virtual-address cap; removed that cap while preserving RSS/time limits. |
| 02, 39802757781 | Imported-private audit visibility and strict style failures. |
| 03, 39806307575 | Actual 6-GiB map RSS stop after 172.434 seconds. |
| 04, 39808462055 | Raw-Nat map loaded; strict heartbeat-comment placement failed. |
| 05, 39812361401 | Tiny kernel module passed; interpreted full-private audit hit 6.478 GB before full data. |
| Smoke 1, 39814737424 | Compiled auditor source used unavailable allocator API; removed optional call. |
| Smoke 2, 39815643692 | **Passed** in 27.433 seconds; compiled audit 4.821 GB, 9 roots / 700 dependencies, only `propext`. |
| 06, 39816362847 | **Complete raw-Nat map build and audit passed.** QuotientData hit maximum recursion depth during build; no actual-row checks reached. |

Attempt 06 source is `c0be393f574c785ba0e352df98f3f78f1ed2c20d`.
Map build: 25.832 seconds / 3,185,684,480 bytes; map audit: 3.242 seconds /
4,179,472,384 bytes. QuotientData: 99.602 seconds / 5,940,023,296 bytes, no RSS
watchdog stop, error at generated line 12. Total: 167.516 seconds. Uploaded
packet is retained in `round-03/evidence/certificate-live-06/`; final provenance
is pending GitHub status recovery. `complete_typed_candidate_data_checked=false`.

Worker `goal_body_quotient_pilot` owns `certificate_pilot.py`, its report and
leaf 2.1. It is reviewing the quotient executable representation, proposing the
smallest bounded change before another run. Keep 1,200-second / 6-GiB limits.
Do not silently make the executable quotient noncomputable or weaken the audit.
Only proof-only map witnesses skip native compilation, with transparent safe
kernel definitions, a full range certificate and exact Fin conversion.

## Round 04: decoder proof status

Complete packet census passed run 39807083846 at `6b2e120`: 5,952 rows,
141,380 symbols, 424,156 accepted seed bits, 136 fixtures and 19 corruptions.
Explicit physical controller passed run 39810577763 at `0afbd2a`: 21,682 states,
43,364 rows, 4,626 blocks, 66 complete packets and 10 corruptions. Official
`packet-02/`, `controller-01/` and parent replays are retained.

`PROOF-PLAN.md` specifies exact whole-tape/head reconstruction. Proof abstraction
steps are not free machine instructions: `Blocks` must realize every transition
of `Transducer` using the paid controller before the global theorem is accepted.

| Leaf / owner | Source and verified status |
|---|---|
| 3.1 `goal_seed_codec` | `Format.lean` complete and fixed. Strict final pass 39815250484 iteration 3 at `fe5ad6f`; source SHA `7e55858fff8c88367f8dd7fa922d0f6032944fd78876482fcd05e1430ad5f5a0`. Both gates met; lease released. |
| 3.2 `goal_seed_machine` | `Controller.lean` exact typed allocation and runtime definitions passed. First three row-view lemmas also passed 39816975477 at `37c1b72`; all 43,364 rows still match pinned pilot and 28 negatives reject. Next read-state bridge source is ready, not checked yet. Emit-state and consume-entry views remain. |
| 3.3 `goal_seed_controller` | `Geometry.lean` complete and fixed; strict 9b50904 pass. Arbitrary-frame consume/prepend/header equalities; both gates met, lease released. |
| 3.4 `goal_seed_scan` | `Scan.lean` complete and fixed; final generic framed scans passed 39816368927 at `c0be393` in 5.4 seconds. Both gates met, lease released. |
| 3.5 `goal_seed_native` | Actual `ControllerExport.lean` and independent `controller_compare.py` complete and fixed. Exact 43,364-row correspondence / 28 corruption checks passed; both gates met, lease released. |
| 3.6 `goal_seed_controller` | `Blocks.lean`: source includes paid path runner, consume/read, entry, emit finite paths/scanners and finish. First remote session **39818051349**, source `684f6b6`. Await diagnostics before composing emit and instantiating read row views. |
| 3.7 `goal_seed_expander` | `Transducer.lean`: proof-only actual source graph, operand prefix/field induction and exact literal/tag traces. First remote session **39818061113**, source `684f6b6`. Universal phases and physical lift remain. |

Passed proof evidence is retained in `round-04/evidence/format-proof-live-03/`,
`scan-proof-live-01/`, `controller-proof-live-04/` and `controller-views-live-01/`.
The next physical and semantic proofs both unlock the same **228,832 full-machine
saving**; neither is an independent accepted reduction.

## Immediate next tasks

1. Inspect uploaded artifacts for sessions **39818051349 (blocks)** and
   **39818061113 (transducer)**, retain exact diagnostics, send errors to owners.
2. Commit/check the source-ready `controlRow_readState` block. Keep runtime
   definitions fixed; remote all-row comparison remains the regression gate.
3. Review worker's proposed response to QuotientData recursion-depth failure.
   No retry without a concrete changed representation and unchanged resource caps.
4. Join verified physical blocks and actual source-graph semantics, then prove
   universal packet execution, exact chess input identity and full SeedLink chain.
5. Before accepting any machine: strict full certificate, exact full count/table,
   safe closure audit, independent fixtures/corruptions, fresh complete advisory,
   final official provenance, seal and parent replay.
6. Check usage periodically; preserve clean, reproducible checkpoints near zero.
   Exhaustion does not complete the goal. Do not reset usage automatically.

## Remote status and recovery

GitHub Actions Results incident `q29p76qtnkyk` makes status lag execution. Some
runs remain queued/in-progress after uploading complete artifacts. Inspect
artifact listings as well as status. Do not duplicate or cancel based only on lag.

`retain_live.py` captures API/ZIP/hash/source receipts as
`UPLOADED_DIAGNOSTICS_ONLY`, with `PENDING.json`. Final completed run/log retention
remains necessary: use unchanged `scripts/chess_goal_20261022/retain.py` into a
**fresh** folder once status completes. Never overwrite earlier failure packets.

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`; branch
`codex/chess-openevolve-pilot`. **Origin is upstream.** Push explicitly to
`git@github.com:bocowgill/cryptids.git`, branch `codex/chess-openevolve-pilot`.
Latest source checkpoint at this writing: `850908e` (check push completion). Inspect later commits before
resuming. Active ignored ledgers live under `.unlazy/chess-goal-20261022-r03/`
and `r04/`; tracked snapshots are refreshed at major checkpoints.


### Continuation at 17:10 UTC

- Chunked executable quotient driver/report committed `176c71c`; full bounded
  trial **39819548458** active. Transparent `@[noinline]` midpoint shards, at most
  1,024 states each, preserve every original row and global destination bound.
  Retain exact shard concatenation and manifest; two-chunk smoke precedes full
  data. All previous time/memory/audit/negative-control requirements stay fixed.
- First Blocks session 39818051349 ended its five-minute repair wait. Retained
  iteration 2 shows only final trailing-zero tape equality and one unused-simp
  warning. Repairs committed `b327eba`; replacement **39819776303** active.
  Controller's read-state bridge passed as dependency in the first session.
  Emit-state bridge is now in the source and awaits this replacement build.
- Transducer session **39818061113** reached iteration 5 at `733a2fe`: prefix,
  operand suffix and finite parser/tag traces compile; one Fin-zero equality
  remains. Small repair committed `850908e`. Artifacts through iteration 5 are
  retained in `transducer-proof-live-05`, including prior failed iterations.
- New leaf 3.8 `goal_seed_codec` owns `TableSeed/ChessCodec.lean`. Complete source
  committed `5acb1ff`; exact pre/rows/post identity and 173,641/173,642 counts use
  existing certified topology, table size and literal word lengths. No global
  table normalization. Four source passes complete; strict **39819742050** is
  active. G1 met, G2 pending. New `decoder-chess-codec` wave is sealed.
- Final completed-run evidence for Format now retained in `format-proof-final`.
  Independent source re-review of session retention/raw workflow bytes found no
  unresolved truthfulness flaw. Live artifacts remain explicitly provisional.
- No new full-machine reduction is accepted; ranking and target counts unchanged.
