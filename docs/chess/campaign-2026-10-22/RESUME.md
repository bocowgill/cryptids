# Chess compression campaign — PAUSED by user, 2026-10-22

**Do not resume research, builds, searches or remote jobs until the user asks.**
This checkpoint preserves the entire working state. Resource exhaustion did not
cause this stop; the user explicitly requested a complete checkpoint and pause.
The optimization goal is not complete. Latest observed usage was 1% used after
the service changed its earlier 93% reading; no agent-initiated reset occurred.

## Accepted machine and exact objective

`ConjectureMachines.Machines.chess_seed` has **998,176 states**. The Lean theorem
`ConjectureMachines.Semantics.ChessSeed.halts_iff_not_draw` proves both directions:

`Halts M ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.

| Paid component | States |
|---|---:|
| Input writer, including final turn | 424,157 |
| Complete seed expander | 216 |
| Exact-head bridge | 1 |
| Interpreter main controls | 533,341 |
| Interpreter return controls | 40,461 |
| **Complete accepted machine** | **998,176** |

Accepted saving during this goal: **1,906,447** from 2,904,623. Round 01 saved
492,880 and round 02 saved 1,413,567. **No later reduction is accepted.**

Round 02 official run39797909133 iteration4, computation780ad59e871a47d76726a5c81800af3e48bda188,
workflow7e32af8294ca8052c88852518508c0e6ecd5bcf4, artifact12433769822.
All1,996,352actualrows, strict universal/public Lean, safe axiom closure,
88complete startupfixtures,465controllerfixtures,34corruptions and regressions
passed. Fresh advisory, external seal,45hostilemetadata controls and portability
passed. `round-02/RESULTS.md`, `evidence/final/` and `review/` are immutable.
All35acceptance gates met. CheckerSHA5e148cacf6a852cc899eaf1fff3e6fb7ad5d5f4451e1fbe53e982a7461465557.

## Requirements on resume

- Frozen chess specification/conjecture, accepted sources and sealed evidence stay
  fixed. `accepted-998176-pins.json` has2,983immutable entries.
- ALL Lean/Lake/LSP/LeanProbe, native compilation/execution, models, generators,
  simulations, synthesis, fixtures and machine counting remain **remote only**.
  Local source editing and saved metadata/hash inspection are permitted.
- No outreach, upstream issues/comments/PRs/messages. Fork checkpoints authorized.
- Prioritize large complete-machine savings; maintain the breakdown and ranking
  in `STATE-COUNTS-AND-OPPORTUNITIES.md`. Count every control and bridge.
- Never simulate the full quadratic141380symbol startup. Use universal execution
  proofs plus exact complete input identity.
- Accept no new best until strict full-machine Lean, exact full export/count,
  independent fixtures/corruptions, safe audit, fresh advisory, official provenance,
  seal and parent replay all pass.
- Root owns Git/network/remote dispatch/retention; workers use disjoint files.

## Ranked unfinished reductions

| Route | Prospective full count | Measured saving | Remaining difficulty |
|---|---:|---:|---|
| Whole-body quotient | 538,861 | 459,315 | Concrete kernel scalability and all actual transition rows; highest absolute opportunity. |
| Structured initializer | 769,344 | 228,832 | Final packet theorem, physical composition and complete-machine acceptance; most foundations now checked. |
| Both, conditional on both complete certificates | 310,029 | 688,147 | Combination must itself be certified and counted. |

Structured candidate accounting:173642writer +21682decoder +1newbridge +216old
expander +1oldbridge +573802body =769344. These are **candidate counts**, not
accepted machines. Dictionary/arity/tiny-controller extensions remain deferred.

## Round 03: quotient state at pause

The finite whole-body pilot39795919458 at8cd145e checked all1,147,604old rows and
228,974quotient rows, retained114487classes and exact maps, and rejected12corruptions
plus an overmerged golden. Runtime21.027s/287416KiB. Official evidence and parent
replay are retained in `round-03/evidence/pilot-final/`.

No concrete actual-body row has yet been kernel-certified. The last successful
large-data stage is complete raw-Nat map loading and full-private audit in
run39816362847 atc0be393:25.832s/3.186GB and3.242s/4.179GB. QuotientData then hit
recursion-depth failure after99.602s/5.940GB. No watchdog stop; no full-data or row
certificate. Earlier failures are all retained; see `CERTIFICATE-PILOT.md`.

Current driver `scripts/chess_body_20261022/certificate_pilot.py` keeps an
executable transparent quotient split into noinline midpoint shards of at most
1024states, exact global Fin114487 destinations, full manifest and byte-identical
concatenation. A two-shard smoke checks both halves before full data. Same1200s/
6GiBlimits, full-private audit and negative-control requirements remain.

- Trial07 run39819548458 at176c71c failed only strict generated-line formatting
  before full data. Retained `certificate-live-07/`; zero new proof credit.
- Formatting-only repair3b8e784 is current and source-reviewed.
- Trial08 run39822945066 was **cancelled at the user's pause request**. Its
  uploaded packet in `certificate-pause-live-08/` contains only source-manifest;
  no pilot summary/result is retained. Do not infer a scalability outcome.
- On resume, rerun this exact bounded trial before changing limits or design.
  If actual-row normalization stalls, use `FAST-ROW-OPTION.md` / `PROOF-OPTIONS.md`
  for structural local-slot certificates, not blind budget increases.

## Round 04: source and proof state

Finite packet census39807083846 at6b2e120 and physical controller pilot39810577763
at0afbd2a passed. Complete controller:21682states,43364rows,4626blocks;66complete
fixtures/10corruptions. Source/pilot bytes remain fixed.

| File in `Cryptids/Compilation/TableSeed/` | Exact status |
|---|---|
| `Format.lean` | Complete strict pass39815250484 iteration3fe5ad6f. Original words, fixed fields, ordering, packet length. |
| `Controller.lean` | Complete; final target39821642854 atf1aec68 strictly builds/exports and matches all43364rows with28corruptions rejected. Read/emit row views checked. |
| `Geometry.lean` | Complete strict9b50904 pass; exact arbitrary-frame consume/prepend/header tape equalities. |
| `Scan.lean` | Complete strict39816368927 atc0be393; generic framed marker scans. |
| `Blocks.lean` | Complete strict39821625026 atf1aec68,6.2s. Actual paid entry/read/emit/finish and Reaches contracts, no assumed free controls. |
| `ChessCodec.lean` | Complete strict39820664426 iteration2f1aec68,3.3s. Exact frozen letters and173641packetbits/173642writerstates using existing certified row bounds. |
| `Transducer.lean` | Through literal/row/reversed-phase composition passed39821587222 atf1aec68,12s. **Final `packetRaw`, `packet_eq_header_raw`, `packet_run` are saved but unverified.** |
| `Correct.lean` | Conditional general Step/Path-to-machine lift passed uploaded strict39823380010 at721ab74,2.7s, before pause cancellation. Retained `correct-pause-live-01/`. Final source-path premise is not yet discharged. Leaf review/ledger reconciliation remains. |

Required final packet signature:
`Path ⟨.read (.literal 0 0), [], packetRaw pre rows post, 1⟩`
`     ⟨.finish, letters pre rows post, [], 1+(packetRaw pre rows post).length⟩`.

`Correct.packet_reaches_of_path` already composes actual entry/path/finish, but
explicitly assumes that source path. Never treat it as unconditional decoder
correctness until the finalpacket theorem is checked and substituted.

`ControllerExport.lean` / `controller_compare.py` are complete and fixed. Their
finite correspondence is separate from universal execution and full acceptance.
Exact source hashes, receipts and former ownership are in the pause snapshot.

## Next concrete actions after an explicit resume

1. Read this checkpoint and final remote metadata; reclaim only required ownership
   scopes. All campaign workers stopped and active leases were released on pause.
2. Run strict remote `--target transducer` on saved finalpacket source. Repair
   only real diagnostics. Do not redo already-passed foundation development.
3. Reconcile the uploaded `Correct` pass, then discharge its explicit source-path
   premise using verified packet_run and header identity. Strictly check the
   unconditional entire-tape/head decoder theorem.
4. Add full `FieldTableSeed` / public `ChessTableSeed` linking through existing
   `FieldSeed.linked`, with173642writer +21682decoder +1newbridge +574019oldbody.
5. Complete full strict build, exported actual rows and independent counts,
   fixtures/corruptions/regressions, safe transitive audit, fresh advisory,
   official completed-run evidence, seal and parent replay before acceptance.
6. Independently rerun the unchanged bounded quotient trial when resuming that
   route. Retain precise outcomes; all prior failures remain available.

## Checkpoint files and remote shutdown

`pause-2026-10-22/` contains live ledger snapshots, source/evidence hash manifest,
pre-pause handoff, run/artifact API responses and final branch-job inventory.
Scheduler wave completion records worker return, not successful proof completion.
Open gates stay open; no unfinished route is marked successful or abandoned.

Cancelled/stopped campaign runs:39822945066,39823380010,39813062294,39813062323.
GitHub Actions status can lag actual execution (incidentq29p76qtnkyk). The final
inventory records the observed state; uploaded diagnostics are retained separately.
`PENDING.json` means official completed-run/log provenance still needs retention.
On resume use `scripts/chess_goal_20261022/retain.py` into a fresh folder once
needed. Never overwrite earlier failed or live packets.

Workspace `/Users/bocowgill/.codex/worktrees/6ba9/cryptids`, branch
`codex/chess-openevolve-pilot`. **Origin is upstream**. Authorized fork push is
`git@github.com:bocowgill/cryptids.git`, same branch. Source baseline before pause
checkpoint:721ab7423d47146c446c51e6e601593c0f9e46d0. The final checkpoint commit
includes the saved unverified packet theorem and every retained evidence packet;
use current `git log` to identify it. Do not start work until the user resumes.
