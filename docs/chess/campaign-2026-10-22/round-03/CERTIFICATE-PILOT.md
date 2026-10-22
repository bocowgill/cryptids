# Bounded concrete quotient certificate scalability pilot

Status: trial 12 passed generic map setup and its audit, then the isolated
whole-map count proof exceeded the sampled 6-GiB RSS cap. The authorized
revision composes complete map invariants from checked small chunks and named
child theorem constants. Its runtime behavior remains unverified.
Zero actual-body row proofs have passed. This
experiment tests the cost of ordinary Lean kernel certificates for the measured
114,487-state quotient. A pass covers only the requested sample, never all
573,802 old states or a new accepted chess machine. The accepted full-machine
baseline is now 769,344 states, accepted at `100ed94`; the unchanged body still
has 573,802 states. This experiment targets the additional measured 459,315-state
opportunity, for a conditional complete total of 310,029. All 3,116 entries in
the new accepted pin set and all earlier accepted pins remain fixed.

## First remote attempt and bounded repair

Run `39800616921`, commit `9b85ea9f54c1ad4c0a2bd7a4888e0784f7a63353`, validated
the pinned finite input, selected the samples and retained every generated
source/data file. The `Loaders` process then exited with signal 6 after 17.628
seconds. Its entire 132-byte log reports:

```
libc++abi: terminating due to uncaught exception of type lean::exception: failed to create thread: Resource temporarily unavailable
```

The [saved summary](evidence/certificate-01/unpacked/certificate-summary.json)
reports 884,957,184 bytes peak combined process-group-plus-driver RSS and 126,640
KiB driver peak RSS, with 19.329 seconds total elapsed. No data module or actual
row theorem was checked, and the negative control was not run. The generated
sample metadata measured maximum actual pure load/branch depth four.

The first launcher imposed a 5.5-GiB virtual-address-space cap. The failure is
consistent with that cap preventing Lean runtime thread reservations despite
modest resident memory; it does not measure the kernel certificate's scaling.
The accepted dependencies had prebuilt without that launcher. The repair
removes `prlimit`/`RLIMIT_AS` entirely while preserving the same wall limits,
512-MiB driver RSS watchdog, sampled 6-GiB combined RSS ceiling and process-group
termination. Thread-creation failures now receive an explicit
`runtime_thread_resource` resource classification, including during negative
controls. The original retained summary's `failed` label is preserved unchanged;
this report records the corrected diagnosis. No source-proof failure was
observed in this attempt; its first repair left the Lean templates unchanged.

## Second remote attempt and audit repair

Run `39802757781`, commit `1fa449d5e34bd25c788cdadc080b6b7c6adb2498`, passed
`Loaders` in 5.648 seconds. `MapData` failed after 133.935 seconds, with sampled
peak combined RSS of 6,015,852,544 bytes, below the 6-GiB ceiling. Total elapsed
time was 140.628 seconds and driver peak RSS was 126,668 KiB. The
[map log](evidence/certificate-02/unpacked/MapData.log) reports
`Forbidden axiom dependency: Nat.decLe._proof_1` and the style warning
`Unscoped option maxHeartbeats is not allowed`. The map-loaded banner appeared,
but the module build failed; this is not a checked data-stage pass. No quotient
data, actual-body row theorem or negative control was checked.

Lean's module public environment can represent hidden private proofs as axiom
declarations. The inline audit therefore misclassified a private implementation
proof. The repaired audit runs in a separate nonmodule Lean script, following
the accepted campaign audit's `importModules ... {} 0` approach to load the full
private proof closure. It still permits only the same three standard axioms;
`Nat.decLe._proof_1` is not allowlisted. The repair also scopes `maxHeartbeats`
to each expensive declaration and limits resource matching to actual error
diagnostics. The previous broad `heartbeats` match incorrectly treated the
style warning as a resource failure. The original
[summary](evidence/certificate-02/unpacked/certificate-summary.json), including
its `bounded_obstruction` label, is preserved unchanged. The corrected diagnosis
is an audit/style source failure, with no demonstrated memory-limit failure.

## Third remote attempt and raw-natural map fallback

Run `39806307575`, commit `992129b47399c2d00dd553d37e6c66d8d852bc63`, passed
`Loaders` in 7.193 seconds, then reached a genuine sampled resident-memory stop
in `MapData` after 172.434 seconds. The observed combined peak was 6,447,697,920
bytes, exceeding the 6,442,450,944-byte ceiling. Total elapsed time was 181.381
seconds and driver peak RSS was 126,800 KiB. The
[saved summary](evidence/certificate-03/unpacked/certificate-summary.json)
records exit -9 and `process_group_memory_budget`. It also records an
87,171,056-byte `.olean` produced before termination; a produced file is not a
successful build or audit. No external audit, quotient load, complete-data
certificate, actual-body row proof or negative control completed.

The authorized fallback changes only the map representation. Instead of
573,802 leaves containing separate finite-value bounds, the generic tree
builder receives literal natural numbers. The complete raw-range certificate
and universal lookup identity below preserve the exact retained map; modulo
cannot silently repair malformed map entries. This is intended to reduce
expression allocation, but its memory and proof cost remain unmeasured. The
typed quotient, actual-body row predicate, sample sizes, negative control,
external audits and 20-minute/6-GiB limits stay unchanged. Earlier receipts and
generated sources remain unchanged.

## Fourth remote attempt and comment-placement repair

Run `39808462055`, commit `3b4d91ae524a2fd7e1cd0aa2fc48427d92b697d1`, passed
`Loaders` in 5.658 seconds. The raw-natural `MapData` reached its loaded banner,
then failed the strict build after 131.674 seconds solely on the heartbeat
comment linter. Its sampled combined peak was 5,983,715,328 bytes, with no
resource stop; total elapsed time was 138.432 seconds and driver peak RSS was
126,724 KiB. The produced `.olean` was 42,291,176 bytes. The
[saved log](evidence/certificate-04/unpacked/MapData.log) and
[summary](evidence/certificate-04/unpacked/certificate-summary.json) remain
unchanged. No full-data pass, external audit, actual row or negative control
completed. This measures a map-load attempt, not end-to-end proof scalability.

The current Mathlib rule in
`Mathlib/Tactic/Linter/DeprecatedSyntaxLinter.lean` reads the trailing comments
on the scoped command's `in` token. A comment before `set_option` does not count.
Every generated scoped option now uses one shared prefix with an ordinary
explanatory `--` comment immediately after `in`, before its declaration. No
linter is disabled. This applies to map, quotient, data, sample-row and smoke
declarations.

Before the expensive map build, `TemplateSmoke` now checks the same loaders,
generic range proof, scoped-option prefix and finite conversion on a four-entry
map and two-row quotient. It uses the actual data imports/options and checks
counts, caches, range, lookup identity, entry and one literal table row, followed
by the same full-private dependency audit. Its build and audit share 60 seconds
inside the unchanged 1,200-second global budget. These smoke checks contribute
zero actual-body rows and do not replace any complete-data or sample requirement.

The same retry marks only the proof witnesses `mapTree` and `classMap` (and
their smoke counterparts) as `noncomputable def`. Lean's current
`Elab/PreDefinition/Main.lean` sends these declarations to `addNonRec`;
`Elab/PreDefinition/Basic.lean` still creates the regular safe definition with
its full body and kernel-checks it through `addDecl`, but skips `compileDecl`.
Thus the kernel can reduce the literal map for every count, range, identity
and row proof, and the full-private audit still reads its body. This avoids
generating native code for the 573,802-leaf proof witness. The quotient tree
and quotient machine remain executable ordinary definitions. The cost benefit
of skipping map code generation is not yet measured.

## Fifth remote attempt and compiled-auditor decision test

Run `39812361401`, commit `fabb9f4d4cee8116b7bbb6d637bbe8d792ecbb76`, passed
`Loaders` in 6.695 seconds with peak combined RSS 2,471,616,512 bytes. The strict
`TemplateSmoke` build passed in 8.113 seconds with peak 2,998,788,096 bytes,
confirming the shared comment placement, generic range proof and noncomputable
lookup templates compile. Its interpreted `TemplateSmokeAudit` was killed after
12.100 seconds at 6,477,537,280 bytes, exceeding the unchanged 6-GiB cap. Total
elapsed time was 28.636 seconds and driver peak RSS was 126,872 KiB. The
[saved summary](evidence/certificate-05/unpacked/certificate-summary.json)
records `process_group_memory_budget`, no audited modules and an empty audit
log. No complete-map build, actual-body row, or negative control was attempted.
The full smoke stage therefore did not pass.

Lean's `--run` executes `main` while its frontend environment remains live.
The accepted campaign audits instead build a Lean-only executable and invoke
it through `lake env`. The repaired driver follows that mechanism: compile the
same nonmodule audit source once, then run the native executable on the exact
target module, retained roots file and exact count. This avoids constructing
the source frontend environment in the auditing process. It preserves
`importModules ... {} 0`, full private proof bodies, all nine smoke roots and
the existing dependency traversal and three-axiom whitelist. There is no
interpreted or public-only fallback. The native auditing process is bounded by
the existing sampled 6-GiB combined RSS cap. The subsequent smoke result below
measures this audit path; complete-map and body-row costs remain open.

The separate decision test uses `--smoke-only --seconds 300`. It generates only the auditor,
loaders, smoke sources, exact nine-root manifest and tiny literal data; it does
not read or generate the full measured map, select body states or build any
body-row sample. Auditor compilation has a 120-second stage cap, followed by
the existing 60-second loader and 60-second smoke build-plus-audit caps, all
within 300 seconds and 6 GiB. Success is recorded as `smoke_passed` with the
distinct marker `Body certificate compiled-audit smoke passed`; it stops there
with zero actual-body rows and the full-data flag false. A full-map retry
requires a separate decision after this evidence.

## Compiled-auditor smoke harness correction

Run `39814737424`, commit `1b97ad08dbcf49d6fb7f3b061266af9de9d711a7`, failed
`AuditExecutable` after 6.447 seconds with peak combined RSS 2,449,555,456 bytes
and no resource stop. The only diagnostic was
`Unknown identifier Lean.Internal.setMaxMemory`. Total elapsed time was 6.450
seconds; driver peak RSS was 23,192 KiB. Loader, template and audit execution
were not attempted. Raw summary, generated sources and log are retained at
`/tmp/chess-body-smoke-39814737424/`; official retention awaits the run API's
completed status. This is a harness source error, not a scaling measurement.

The earlier source review found the helper in Lean's `Shell.lean` but missed
that the module does not publicly export this unmarked declaration. The repair
removes the optional allocator call without substituting another name or
private declaration. The native auditor reports no separately set allocator
limit (`audit_allocator_limit_bytes: null`). Its mandatory sampled 6-GiB
process-group-plus-driver RSS limit, 512-MiB driver watchdog, process-group
termination, stage and 300-second global smoke limits are unchanged. Lean
compilation retains the root-owned lakefile's `-M6144` setting. The exact nine
roots, full-private imports, whitelist, executable identity checks and distinct
smoke-only success gate are unchanged. The failed receipt remains unchanged.

## Compiled-auditor smoke passed

Run `39815643692`, commit `fb199eeeee42b86d1e3085357014f37fe3621721`, completed
with `status: smoke_passed` and the distinct compiled-audit smoke success marker.
Raw evidence is retained at `/tmp/chess-body-smoke-39815643692/`, with official
packet retention handled by the root runner. Total elapsed time was 27.433
seconds, and driver peak RSS was 25,256 KiB.

| Stage | Seconds | Peak combined RSS, bytes |
|---|---:|---:|
| Compile auditor | 6.484 | 2,465,046,528 |
| Loaders | 6.176 | 2,433,961,984 |
| Template kernel build | 7.388 | 3,004,153,856 |
| Compiled full-private audit | 7.088 | 4,821,213,184 |

Every stage exited zero without a resource stop. The exact nine-root manifest
was audited through 700 dependencies, and the only permitted axiom encountered
was `propext`. The native binary was 118,591,176 bytes, SHA-256
`9d815f916dc156b36a44a967165e2d256e0459d97df27c5dd8621b6088e27eed`.
Its retained 3,029-byte audit source has SHA-256
`9d2a7db1fd5d82bbdadf4f6e0db0571af956741f42a89c3086c61414d52512df`.
The unchanged 35,427-byte driver source has SHA-256
`f55dd45b9b3b951cf7e371debe4bc3a323140e9118e4f98ccec3f5897bd3bc9a`.

This confirms the compiled audit path can check the small production-template
module within the cap. The complete candidate-data flag remains false, both
actual-body row counters remain zero, and the deliberately false body-row
control remains unrun. The result is not a full quotient certificate or a new
accepted machine. On this evidence the root authorized the unchanged full
pilot, with the original 1,200-second and 6-GiB limits; its partial-row gate
remains open. The driver is fixed for that run.

## Full trial: quotient recursion-depth stop

Run `39816362847`, commit `c0be393f574c785ba0e352df98f3f78f1ed2c20d`, retained
under `evidence/certificate-live-06/unpacked/`, used the unchanged driver from
the successful smoke. The complete raw-natural map build passed in 25.832
seconds at peak combined RSS 3,185,684,480 bytes. Its external full-private
audit passed in 3.242 seconds at 4,179,472,384 bytes. This establishes successful
full map loading and its dependency audit; the later map range/count/cache
certificates in `Data` were not attempted.

`QuotientData` failed after 99.602 seconds at 5,940,023,296 bytes, below the
sampled 6-GiB limit, with `resource_stop: null`. The
[retained log](evidence/certificate-live-06/unpacked/QuotientData.log) reports
`maximum recursion depth has been reached` at line 12, the declaration of
`quotientTree`. Its source already sets `maxRecDepth 1000000`, and declares one
executable literal tree with `compiler.extract_closed false`. The later
`Complete body quotient rows loaded` message comes from a separate `run_cmd`
that executes after the diagnostic; it does not establish successful loading
or kernel checking of the failed declaration. The log does not identify the
specific internal compiler/elaboration pass that exhausted depth.

Total elapsed time was 167.516 seconds, with driver peak RSS 126,964 KiB. The
[summary](evidence/certificate-live-06/unpacked/certificate-summary.json)
correctly records a bounded Lean recursion-depth obstruction. Quotient audit,
complete-data checks, actual-body row proofs and the false-row control were
not run. The complete-data flag remains false and both actual-body counters
remain zero.

The authorized structural change splits the same midpoint tree
into contiguous subtrees of at most 1,024 states, each loaded by the existing
typed loader as an executable `@[noinline] def`. Destinations retain the global
`Fin 114487` type. A small balanced assembly of `RowTree.branch` nodes references
these subtrees directly, with cached counts equal to the number of actual rows
on the left. Cutting at the existing midpoint boundaries preserves the original
fully unfolded tree and row order. Remote generation retains a complete chunk
manifest with each interval, global destination bound, filename, byte size and
hash. It independently rereads the emitted chunks, checks their contiguous
interval census and requires their concatenated bytes to equal the
pinned-derived full `quotient.rows` exactly. Full count/cache proofs, machine
type, actual-body relation and the audit of every dependency remain required. Lean's
compiler honors `noinline` on ordinary constants while kernel reduction remains
transparent. This implementation keeps the 180-second quotient stage, 1,200-second
global budget and 6-GiB RSS limit; it does not make the quotient noncomputable
or raise a recursion limit. Its scaling effect has not yet been measured.

The template smoke now forces two separate one-state executable chunks and
proves a conjunction containing one defined transition from each side. It
retains exactly nine required audit roots and zero actual-body rows. The full
pilot requires this build and audit before loading the complete candidate;
smoke-only mode exercises the same two-chunk template. Source inspection covered
the split/loader identity, retained-data census, executable/kernel behavior and
unchanged runner limits. An independent read-only reviewer found no blocking
static issue. No local generation, execution or Lean verification was performed.

## Trial 07: generated formatting failure

Run `39819548458`, commit `176c71ccdf737dd96a6499382ef332db7a933c66`, stopped
solely on strict long-line warnings at generated `TemplateSmoke.lean` lines
45, 46, 49 and 50: the chunk declaration types and loader paths exceeded the
100-character limit. The [retained log](evidence/certificate-live-07/unpacked/TemplateSmoke.log)
contains no semantic proof error; its later smoke banner does not establish a
successful build. The smoke stage exited one after 4.645 seconds with peak
combined RSS 3,101,892,608 bytes and no resource stop. Total elapsed time was
15.938 seconds. The [summary](evidence/certificate-live-07/unpacked/certificate-summary.json)
records no successful smoke audit, complete-data checks, actual-body row proofs
or negative control. This is a source-formatting failure, not new scalability
evidence.

The repair places each declaration's type and each loader's unchanged string
literal on separate continuation lines. It also recursively line-breaks the
assembled branches, including the complete 128-shard expression. These changes
preserve all names, types, literal paths, terms, data and limits. No linter is
disabled. Only the generator source and this report were edited locally; the
new formatting has not been generated or executed locally.

## Trial 08: user cancellation and unchanged resumed run

Run `39822945066` used the formatting-only source checkpoint
`3b8e7844085ee35bc11f2b5ac1be36d0768da3f7` and was cancelled at the user's pause
request. Its retained packet at `evidence/certificate-pause-live-08/` contains
only [source-manifest.json](evidence/certificate-pause-live-08/unpacked/source-manifest.json),
as recorded in the [archive inventory](evidence/certificate-pause-live-08/archive-entries.json).
No pilot summary, stage outcome or row certificate is retained. The manifest
binds the driver to SHA256
`d75109fb1d4c8f30aca47d431ed50d588342d6f9ae65b554f9ba526b11dc4b46`;
it does not establish that any pilot stage passed or failed. No scalability
conclusion follows from this cancellation.

The user explicitly resumed the existing goal from `fc16528` on 2026-10-22.
The root is rerunning that unchanged bounded driver before any further design
change. All generation, Lean, model, count and audit execution remains remote
only. The current leaf retains zero actual-body row proofs, an open G2 gate
and a conditional 459,315-state saving. The driver stays fixed while awaiting
the resumed run's retained diagnostics. That run is recorded next.

## Trial 09: full typed quotient memory stop

Run `39825520233`, commit `fc16528caeaf909e9bfb2b0239ced8f352d6bf3d`, used the
unchanged formatting repair. Its [retained summary](evidence/certificate-09/unpacked/certificate-summary.json)
records the two-chunk template build and nine-root full-private audit passing,
followed by the complete raw-natural map build in 22.259 seconds at peak
combined RSS 3,234,848,768 bytes and map audit in 3.237 seconds at 4,275,249,152
bytes. The map's later complete range/count/cache certificates were not reached.

The 128-shard executable typed `QuotientData` process was killed after 142.458
seconds when sampled combined RSS reached 6,486,990,848 bytes, above the
6,442,450,944-byte ceiling. The receipt records exit -9 and
`process_group_memory_budget`. The produced 94,802,768-byte `.olean` is not a
successful build or audit. Its [log](evidence/certificate-09/unpacked/QuotientData.log)
contains only replayed loader messages, with no quotient success banner.
Total driver elapsed time was 188.792 seconds, with driver peak RSS 127,420 KiB.
The full chunk manifest and exact concatenation receipt remain retained.

This is a genuine representation-stage memory obstruction under the unchanged
limits. No quotient audit, complete-data pass, actual-body row proof or
deliberately false row check completed. The result does not isolate allocation
by compiler phase or establish that per-cell finite proofs alone caused the
peak. It motivates testing a smaller constructor representation; it supplies no
new accepted state saving.

## Authorized bounded representation: packed natural rows

The source implementation replaces each typed two-cell leaf by `Nat × Nat`,
retaining exactly 114,487 state leaves,
the same midpoint boundaries, at-most-1,024-state executable `@[noinline]`
subtrees and global destination bound. Encode a halt as zero and a nonhalting
cell as `1 + 4 * destination + 2 * direction + write`, with left direction zero
and right direction one. Each code is at most `4 * 114487`. This removes the
per-cell `Option`, nested transition products and repeated dependent `Fin`
bound proofs from the large literal; shared decoding constructs the typed
transition only at lookup. Lower memory use remains a hypothesis.

The implementation and required proof obligations are:

1. Retain the current pinned JSON and human-readable `quotient.rows`; also emit
   a two-natural-per-line packed file. Independently decode every emitted pair
   back to the original JSON row, checking exact census, bit order, halts,
   directions, writes and destinations. Retain its manifest, hashes and exact
   shard concatenation. These are computational fidelity checks, not kernel
   proofs of the actual body relation.
2. Add a generated loader for `Balanced.RowTree (Nat × Nat)` that proposes only
   `Prod.mk` and `mkNatLit` expressions through `balancedRowsExpr`. Keep the
   current chunk assembly, strict formatting, executability and actual subtree
   counts. No accepted loader or source file changes.
3. Define an executable decoder: zero returns `none`; for payload `code - 1`,
   write is `Fin.ofNat 2 payload`, direction is left exactly when
   `(payload / 2) % 2 = 0`, and destination is
   `Fin.ofNat 114487 (payload / 4)`. Select the first or second code by the
   binary input, then decode, yielding the same `Machine 114487 2` interface.
4. Kernel-prove generic encode/decode fidelity, including that decoding is
   `none` exactly at zero, that a bounded code round-trips unchanged, that
   decoding an encoded typed transition returns that transition, and that
   positive bounded codes have destination value
   `(code - 1) / 4 < 114487`. Prove a structural lookup bound from a recursive
   all-pairs range predicate with zero-pair fallback. Require complete concrete
   count/cache/range checks by `decide +kernel` before any actual-body row proof.
   Derive for every quotient state and both bits that re-encoding its decoded
   transition returns the raw code at that position. This universal fidelity
   theorem, rather than sampled codec checks, prevents modulo conversion from
   concealing invalid destinations. It does not identify an external file with
   the actual accepted body; the unchanged `RowAt` obligations supply that link.
5. Exercise the same two-chunk smoke with halt/write/direction/destination
   boundaries and the new generic fidelity proofs before full data. Add all new
   mathematical claims to the exact audit-root manifests and preserve full
   private closure auditing. Keep actual `RowAt`, sample sizes, class map,
   false-row kernel control and partial-certificate status unchanged.

This route targets the observed data representation obstruction with a small
generated loader and a reusable arithmetic decoder. The structural alternative
in `PROOF-OPTIONS.md` could eventually compress both data and the full row proof,
but requires deriving a structural description of this measured partition and
proving every class's transition consistency. The local-slot plan in
`FAST-ROW-OPTION.md` addresses expensive normalization of actual-body rows; none
has yet been attempted, so it does not directly address the current literal
loading failure. Packed data is the smaller next experiment; structural
certification remains the alternative if complete data still does not fit or
the first actual-row proofs expose a separate bottleneck.

Generated `Packed.lean` contains the shared executable codec and eight generic
range/fidelity theorems. `Loaders` imports it, so its strict build occurs within
the existing 60-second setup stage. `TemplateSmoke` and `Data` each name exactly
20 required audit roots in trial 10: their concrete obligations plus all eight
generic theorems. The subsequent thin split redistributes the same complete-data
roots as described below. The smoke also kernel-checks code zero (halt), code one (nonhalting),
the valid maximum code eight for two states, and rejection of code nine by the
range predicate. Its ordinary two-chunk transitions and zero actual-body-row
census remain. The compiled full-private auditor and its standard-axiom rules
are unchanged.

The experiment keeps the original 180-second quotient stage,
1,200-second total budget, sampled 6-GiB combined RSS cap and 512-MiB driver
watchdog. Stop at the first obstruction, retain all diagnostics, and do not
raise a cap. Root owns remote dispatch; no heavy launch is
authorized after 19:45 UTC and the work deadline is 20:15 UTC.

## Trial 10: packed quotient passes; combined data exceeds memory

Run `39830984315`, commit `fe8656cdd316bf64e1317bf8a8aaa64c71e9450f`, is retained
under `evidence/certificate-10/unpacked/`. Its
[summary](evidence/certificate-10/unpacked/certificate-summary.json) records all
228,974 packed cells independently inverted and compared with the pinned JSON.
The expanded smoke build passed, followed by a full-private audit of exactly
20 roots and 1,714 dependencies, using only `propext` and `Quot.sound`.

| Completed stage | Seconds | Peak combined RSS, bytes |
|---|---:|---:|
| Complete raw map build | 23.850 | 3,244,789,760 |
| Map full-private audit | 3.236 | 4,276,064,256 |
| Complete packed quotient build | 53.650 | 4,268,597,248 |
| Quotient full-private audit | 2.628 | 4,223,442,944 |

The packed quotient's 48,009,360-byte `.olean` accompanies an actual successful
build and audit. Its [audit log](evidence/certificate-10/unpacked/QuotientDataAudit.log)
checks the complete `quotientTree` closure: 142 dependencies and no axioms. This
establishes that the executable packed data now loads within the existing caps;
the complete concrete range/cache/fidelity proof remains a later obligation.

The combined `Data` build was killed after 16.412 seconds at sampled combined
RSS 6,456,266,752 bytes, exceeding the 6,442,450,944-byte limit. The receipt
records exit -9, `process_group_memory_budget`, and no data success banner or
produced `.olean`. Its [log](evidence/certificate-10/unpacked/Data.log) contains
only replayed import messages, including the full accepted chess source and
input certificates. It does not locate the peak within import loading or the
concrete kernel reductions; no individual `Data` theorem receives proof credit.

Total elapsed time was 123.342 seconds and driver peak RSS was 125,576 KiB.
`complete_typed_candidate_data_checked` remains false, both actual-body row
counters remain zero, and the deliberate false-row control remains unrun.
Packed data has cleared the previous representation-stage obstruction; this
does not certify the quotient relation or accept the conditional 459,315 saving.

## Authorized bounded split: isolate data proofs from chess imports

The trial-10 generated `Data` module imports both complete literal datasets,
`FieldSelective` and `LocalCertificate`, then checks every map and quotient
count/cache/range obligation in that combined environment. Only `RowAt` needs
the actual accepted body; the concrete data theorems need no chess definitions.
Trial 11 used the following first split; the next section records its outcome
and the authorized finer isolation of `MapChecks`:

- `MapChecks` imports only `MapData` and proves the unchanged map count,
  well-formedness, complete range, lookup bound, exact `classMap` value and entry.
- `QuotientChecks` imports only `QuotientData` and proves the unchanged quotient
  count, cache validity, complete packed range, per-code bound and universal
  transition fidelity. Both modules retain their explicit full-private audits;
  all generic codec roots remain audited. `MapChecks` names exactly six roots;
  `QuotientChecks` names thirteen, including all eight generic codec roots.
- A lightweight `Data` module imports those checked interfaces, with no
  `FieldSelective` import or repeated large kernel reductions. A separate
  `BodyRelation` imports this interface and the exact accepted `FieldSelective`
  definition, then defines and audits the unchanged `RowAt` before `Rows64`.
  The `Data` full-private audit rechecks all nineteen combined mathematical
  roots; `BodyRelation` explicitly audits `RowAt`, giving the same twenty roots
  as the previous combined stage, with additional separate receipts.

All replacement builds and audits share one 120-second deadline, equal to the
old `Data` stage allowance, within the same global 1,200-second and 6-GiB caps.
Each completed substage gets its own receipt; the complete-data flag advances
only after every required check/audit succeeds. The existing actual-row samples
and negative control stay unchanged. No theorem is replaced by a hash or an
assumption, and no full-private environment is weakened to a public-only import.

The intended mechanism is to avoid simultaneously holding the heavy chess
environment and temporary allocations for the full map/quotient reductions.
The receipts do not prove this caused the peak. The final body relation and its
full-private audit must still import the necessary combined definitions and
could reveal the same resident-memory obstruction. This bounded split measures
that distinction and retains partial proof progress; it does not guarantee a
fit or authorize raising any limit. No accepted file or new pin has changed.
Only the owned remote generator, report and ledger were edited; no local
generation, Lean, model, count or audit execution was performed.

## Trial 11: map-only checks still exceed memory

Run `39834919606`, commit `e054e37c6e4c421e3834b0ecaecf89b47ba2db4a`, is retained
under `evidence/certificate-11/unpacked/`. The
[source manifest](evidence/certificate-11/unpacked/source-manifest.json) binds
driver SHA256 `4c30c28f43d6a2fda43794219331b5a37e3d2c3bf838afc126b23c39a7751f93`
and the new `accepted-769344-pins.json`. The accepted dependency setup passed
in 5.393 seconds according to its
[command receipt](evidence/certificate-11/unpacked/commands/1792695169319028843.json),
following the root-owned cache repair; this is setup cost, not proof progress.

The [pilot summary](evidence/certificate-11/unpacked/certificate-summary.json)
records packed quotient build success in 63.905 seconds at peak combined RSS
4,220,174,336 bytes, then full-private audit success in 2.735 seconds at
4,121,210,880 bytes. The complete map build/audit and expanded smoke also passed.
`MapChecks`, importing only `MapData`, was then killed after 20.693 seconds at
6,456,770,560 bytes, above the 6,442,450,944-byte cap. Its receipt reports exit -9,
`process_group_memory_budget`, no successful banner and no `.olean`.
The [log](evidence/certificate-11/unpacked/MapChecks.log) contains only replayed
loader and map messages, so it does not identify which declaration was active.

The shared data group stopped after 20.698 seconds with no completed substage.
Total driver elapsed time was 150.814 seconds and driver peak RSS was 125,676 KiB.
No map check audit, quotient invariant stage, combined-data stage, actual-body
row proof or deliberate false-row control completed. Both actual-body counters
remain zero and the complete-data flag remains false. The failure shows that a
map-only environment can exceed the limit; simultaneous quotient/chess imports
are not necessary for this obstruction. It does not distinguish generic setup
from the first concrete count/cache/range normalization.

The isolation tested in trial 12 added:

- `MapPrelude`, importing `MapData`, with the unchanged generic `MAP_BOUNDS`
  declarations and noncomputable `classMap`. Its three-root full-private audit
  covers `mapAllBelow`, `lookup_lt_of_allBelow` and `classMap`. It performs no
  complete literal count/cache/range reduction.
- `MapCount`, `MapValid` and `MapBounded`, each importing only `MapPrelude`,
  containing exactly its original concrete `decide +kernel` theorem, and each
  requiring its own one-root audit. They do not import each other's concrete
  proofs, isolating each reduction from accumulated preceding proof modules.
- `MapChecks`, importing those three modules, proving the unchanged lookup
  bound, exact `classMap` value and entry, then auditing the same six-root union.

The resulting eight stages—`MapPrelude`, `MapCount`, `MapValid`, `MapBounded`,
`MapChecks`, `QuotientChecks`, `Data`, `BodyRelation`—all share the original
120-second data deadline, including every build, audit and receipt. Final Data
still audits nineteen roots, and the exact actual-body predicate, samples,
negative control and global/RSS limits are unchanged. No representation or
accepted source changes. This revision seeks an attributable first obstruction;
additional audit overhead is charged to the same budget and may itself exhaust
it. All generated sources and failed-stage receipts remain retained.

## Trial 12: whole-map count normalization isolated

Run `39836604660`, commit `9585998b9402acbc86523fae7d62ea6e56402b66`, is retained
under `evidence/certificate-12/unpacked/`. Its
[summary](evidence/certificate-12/unpacked/certificate-summary.json) binds driver
SHA256 `950ff15dd557580f417bc87c15615443753ae5c432aa97f68e1705798f83b3c7`.
`MapPrelude` built in 4.155 seconds at peak combined RSS 2,478,567,424 bytes.
Its full-private audit passed in 3.343 seconds at 4,177,084,416 bytes, covering
three roots and 316 dependencies with only `propext` encountered.

The isolated `MapCount` build was killed after 20.701 seconds at 6,456,549,376
bytes, above the unchanged 6,442,450,944-byte ceiling. Its receipt records
exit -9 and `process_group_memory_budget`, without its own banner, `.olean`
or audit. The [log](evidence/certificate-12/unpacked/MapCount.log) contains only
replayed imports. Generic map setup has passed; the isolated global count
kernel normalization is now the measured obstruction. This does not determine
which internal evaluator allocation dominates that normalization.

The shared data group elapsed 28.318 seconds and completed only `MapPrelude`.
Total driver elapsed was 157.756 seconds, with driver peak RSS 125,624 KiB.
There is no complete-data result, no actual-body row proof and no deliberate
false-row result. All prior receipts remain unchanged.

The authorized next revision changes only map data naming and invariant proof
composition. `map_declarations` recursively uses the original floor-midpoint
split until each subtree has at most 1,024 leaves. It emits noncomputable named
literal chunks, named internal nodes with exact left counts, and the `mapTree`
root alias. Re-reading all emitted shards must reconstruct the entire original
map text byte for byte. A retained `map-chunks.json` records every interval,
node, child, cached count, source hash and shard hash. The original raw values,
leaf order and complete tree shape remain intact. The byte identity and
manifest bounds are provenance checks; the separate kernel proofs establish
the complete raw range and cache invariants.

`MapPrelude` adds three ordinary constructor lemmas: structural counts compose
by addition; cache validity uses the proved left count and both child validity
theorems; raw bounds compose by Boolean conjunction. Its audit now requires
six explicit roots. `MapCount`, `MapValid` and `MapBounded` each prove their
small literal chunks with `decide +kernel`, then apply those constructor lemmas
to named child theorem constants at every internal node. `MapValid` imports
`MapCount` for the certified child counts. The final `map_count`, `map_valid`
and `map_bounded` statements are unchanged and refer to the root theorem;
there is no final whole-map `decide` or giant tree-equality proof. The raw bound
remains 114,487, independent of chunk length. Each root's full-private audit
traverses the complete child proof closure.

The production map declaration/proof helpers also generate the four-entry
smoke with four forced one-leaf chunks and three named internal nodes. It keeps
all earlier smoke claims and adds explicit out-of-range-leaf and incorrect-cache
checks, giving 24 exact audit roots including the three constructor lemmas.
This remains zero actual-body rows. Final `MapChecks` still audits six roots;
`Data` still audits nineteen. Quotient data and proofs, actual `RowAt`, all row
samples and the deliberate false actual-row control are unchanged.

All eight data builds, their audits and intervening receipts still share one
120-second allowance, inside the original 1,200-second and sampled 6-GiB limits.
The complete-data flag still requires every stage. Named composition is a
testable way to avoid whole-map reduction; it is not a measured memory saving.
Accumulated declarations, auditing or a later quotient/integration stage may
still stop this bounded pilot. No additional optimization route is included.

## Root-owned runner interface

Prebuild these accepted dependencies using the root-owned lakefile, outside the
driver's 20-minute budget and under the root's separate setup bound:

```
Cryptids.Chess.Optimisation.FieldSelective
Cryptids.Compilation.BalancedTable
Cryptids.Compilation.LocalCertificate
```

Then run on Linux GitHub Actions:

```sh
CHESS_REMOTE=1 GITHUB_ACTIONS=true python scripts/chess_body_20261022/certificate_pilot.py \
  --lakefile lakefile.chess-body-certificate-20261022.toml \
  --output .lake/chess-body-certificate-20261022 --seconds 1200 --memory-gib 6
```

The root-owned lakefile additionally declares the generated native auditor:

```toml
[[lean_exe]]
name = "chess_body_certificate_audit"
root = "Cryptids.Chess.Optimisation.BodyCertificatePilot.Audit"
```

Smoke-only mode adds `--smoke-only` and uses `--seconds 300` instead of 1,200.
The authorized full run omits that flag and keeps the command above. The
trial-10 root-owned verifier bound the accepted `accepted-998176-pins.json`
checkpoint. The root updated the next source-bound verifier to validate the new
`accepted-769344-pins.json`; all new and prior accepted pins stay fixed. The driver
invokes `lake` directly and generates modules only in the
remote ephemeral checkout, below
`Cryptids/Chess/Optimisation/BodyCertificatePilot/`. The local worker authors only
the Python generator/driver, this report and its leaf ledger. No local import,
generation, Lean command, model, computation or test is performed. The successful
finite `pilot.py` and all accepted source/evidence files remain fixed.

For the full pilot, exit zero requires every requested stage and its success
marker, including the genuine negative kernel rejection. Its final marker is:

```
Bounded body kernel certificate pilot passed
```

The first resource/scaling obstruction stops further stages and exits one with
`certificate-summary.json` status `bounded_obstruction`. A source, input-pin,
ordinary proof or audit failure exits one with status `failed`. The wrapper may
record a completed experiment with an obstruction; it must not report that as a
passed certificate. Fields `partial_certificate_only: true`,
`full_quotient_certified: false`, and `new_accepted_machine: false` remain fixed
even if all stages pass.

## Complete data before row proofs

Default input is the official retained packet
`round-03/evidence/pilot-final/unpacked/`. All four complete artifact hashes are
hard-pinned to the successful finite pilot. The driver verifies the exact
573,802-word map, 114,487 representatives and class sizes, total surjection,
canonical minima, entry zero, and all 228,974 quotient rows. It writes the full
map as integers and the full quotient as both readable cells and packed natural
pairs. The independently reread packed file must invert to every original JSON
row in exact order. No
sampled map or reduced quotient is substituted.
The separate smoke-only decision mode does not claim or perform these full-data
checks; it uses only the retained four-entry/two-row template literals.

The generated map loader calls the existing generic
`TableSyntax.balancedRowsExpr` with `mkNatLit` leaves for each named map chunk.
Named midpoint internal nodes assemble `mapTree : Balanced.RowTree Nat`.
The generated `load_packed_rows%` loader
constructs quotient subtrees of at most 1,024 states as
`Balanced.RowTree (Nat × Nat)`, using only literal naturals and pair constructors
through the same generic builder. A balanced assembly uses the original
midpoint splits and actual subtree counts. Complete map bounds compose
kernel-checked chunk results; quotient bounds use their existing complete
kernel computation. Neither a file hash nor
the generator is a proof of the actual-body row relation.

Only map chunks, internal nodes, the root and its lookup wrapper suppress
native code generation via
`noncomputable`; their transparent safe kernel definitions are retained. The
quotient subtrees and assembled tree remain executable, transparent
`@[noinline] def` declarations. Their manifest and exact byte-concatenation
receipt are retained alongside the full input, shard data and generated source.

Separate modules measure full-map loading, full-quotient loading, and complete
cache/census checks. The map modules prove the following map invariants by
chunk kernel decisions and named theorem composition; `QuotientChecks` retains
its original complete `decide +kernel` checks:

```
mapTree.count = 573802
mapTree.WellFormed
mapAllBelow mapTree 114487 = true
quotientTree.count = 114487
quotientTree.WellFormed
packedAllBounded quotientTree (4 * 114487) = true
classMap 0 = 0
```

`mapAllBelow` recursively checks every leaf against 114,487. Its generic
induction theorem proves that every lookup stays below the bound when the
fallback does. Consequently `MapChecks` proves
`mapTree.lookup index 0 < 114487` for every natural index. It defines
`classMap s := Fin.ofNat 114487 (mapTree.lookup s.val 0)` and proves for every
old state `s` that `(classMap s).val = mapTree.lookup s.val 0`, using
`Nat.mod_eq_of_lt`. Thus the modulo constructor does not change the measured
map. These complete range and identity proofs are required audit roots, along
with entry zero, before any accepted chess body is imported by the full-data
path.

The raw map lookup's fallback is zero. The checked complete count and cache
validity establish the intended full-range tree layout; missing or shifted
input cannot be excused by a sampled lookup. The quotient uses
`packedMachine 114487 quotientTree`, selecting the input bit's natural code and
decoding it into an ordinary typed transition. Its complete pair-range proof
gives `quotient_code_bound` for every quotient state and bit. `quotient_fidelity`
then proves universally that re-encoding that transition returns exactly the
selected raw code. The generic decoder preserves zero/halts and all four
write/direction combinations, and its destination modulo is the identity under
the proved bound. All data and mathematical proof roots undergo
a transitive dependency audit allowing only the repository's standard
`propext`, `Classical.choice` and `Quot.sound` axioms. Unsafe, partial, open-chess
conjecture, or generator dependencies are rejected. No new axiom, admitted proof
or native decision procedure is introduced.

Before loading any data module, the driver compiles retained nonmodule
`Audit.lean` once through the root-owned Lake executable target, with strict
warnings and the lakefile's Lean memory setting. Immediately after each
successful data or positive-row module build, it runs that compiled executable
through `lake env`. It imports that exact completed module using
`importModules #[{module := moduleText.toName}] {} 0`, then traverses types and
values throughout the full private dependency closure. Each retained `.roots`
file names every required mathematical declaration, with an independently
passed exact root count; missing and duplicate roots fail. Generated `.olean`
and `.olean.private` build products remain available for this audit. The build
and external audit share the original stage time allowance and global resource
limits. Only their joint success advances the checked-data or positive-row
census. `Loaders` contains setup elaborators and imports the shared `Packed`
theorems, whose explicit mathematical roots are audited through smoke,
`QuotientChecks` and `Data`. `BodyRelation` imports `FieldSelective` only after
all complete-data proofs have passed, and audits the exact actual-body row
predicate before any sampled row proof. Its construction and audit alone do
not certify a row. The complete-data flag advances only after this final
integration stage also passes.

## Exact actual-body claims and representative samples

Each generated theorem has this forward relation, matching `LocalCertificate.Rows`:

```lean
def RowAt (s : Fin 573802) (b : Fin 2) : Prop :=
  (Chess.Optimisation.FieldSelective.body.toMachine.transition s b).map
    (fun (write, dir, next) ↦ (write, dir, classMap next)) =
  quotient.transition (classMap s) b
```

The left side is the actual accepted Lean body, not a freshly loaded old row
table. A representative-to-old reverse map would assert the wrong relation and
is not used. Positive declarations are closed `RowAt state bit` theorems proved
by `decide +kernel`, with one named theorem per state/bit and no implicit
assumption that the Python partition is correct.

Nested samples contain exactly 64, 512 and 4,096 old states, each with both bits.
Every larger module freshly checks its entire sample. Thus a complete pilot
checks at most 4,096 distinct old states, not the full body. The 64-state prefix
already includes entry, halt, main/return boundaries, the first occurrence of
each primitive syntax tag at every store value, and deep pure paths. Remaining
positions spread across both complete main and return ranges.

Deep-path selection uses the accepted, SHA-pinned `machine-export.json` and its
exhaustive `getter_samples`. For each bit and store, a dynamic program over
strictly decreasing syntax children measures consecutive load/branch steps,
using the actual branch and store-update tables. States with the largest depth
are included and their per-bit depths retained in `selection.json`. This is a
remote sampling computation, not a claim that a numerical address is deep or
that the sample is exhaustive.

After the 64-state stage passes, `Negative.lean` imports that positive module and
submits the deliberately false actual row claim
`FieldSelective.body.toMachine.transition 0 0 = none`. It proposes reflexivity
at the actual left side and calls `addDecl (.thmDecl ...) true`, forcing the
ordinary kernel to reject the mismatched theorem type. Success for this control
requires nonzero exit with the explicit kernel type-mismatch diagnostic. A
timeout, import error, tactic failure or missing marker is not a successful
negative check. If earlier data loading or positive proofs fail, the control is
honestly recorded as unrun, and the pilot stops.

## Bounds, stages and retained evidence

| Stage | Maximum seconds | Purpose |
|---|---:|---|
| `AuditExecutable` | 120 | Compile the Lean-only native full-private auditor once |
| `Loaders` | 60 | Packed codec proofs and literal-data elaborator setup |
| `TemplateSmoke` | 60 | Small production-template checks and dependency audit; zero actual-body rows |
| `MapData` | 240 | Complete natural-valued map and dependency audit |
| `QuotientData` | 180 | Complete packed quotient and dependency audit |
| `MapPrelude` through `BodyRelation` (8 stages) | 120 shared | Isolated generic/map checks, Q proofs, thin assembly and exact actual-body predicate, each with full-private audit |
| `Rows64` | 120 | 128 actual-body row proofs and dependency audit |
| `Negative` | 45 | Kernel refusal of one false actual row |
| `Rows512` | 180 | 1,024 actual-body row proofs and dependency audit |
| `Rows4096` | 210 | 8,192 actual-body row proofs and dependency audit |

The 1,200-second global wall limit includes input validation, depth selection,
generation, auditor compilation, all builds, external audits and diagnostics.
The smoke-only decision test uses a smaller 300-second global limit. Each stage is further capped by the
remaining global budget. Three seconds are reserved for final diagnostics.
The eight replacement data stages share one deadline, including every build,
audit and intervening receipt; they do not each receive 120 seconds. The
summary retains the group's exact required/completed stage lists and elapsed
time, including the failed stage when a resource obstruction occurs.
A 0.1-second watchdog covers driver RSS during every phase, with a 512-MiB driver
allowance; child stages also sample combined process-group-plus-driver RSS and
stop above 6 GiB. Resident-memory enforcement is sampled, not an instantaneous
cgroup cap. There is no child or driver virtual-address-space cap. The
root may additionally impose an outer cgroup limit. All children run in a new
process group and are killed on budget exhaustion.

For each stage the driver retains the exact argv, cwd, exit, time cap, elapsed
time, sampled peak combined RSS, full log and its hash/size, plus the `.olean`
hash/size when produced. Builds and external audits have separate receipts and
logs, tagged by kind. Auditor build receipts include executable hash/size and
source identity; every audit checks that executable identity before invoking it
and records it with the exact argv. The global summary records source/input identities,
every completed stage, the first obstruction, and how many positive sample
states actually completed. A failed stage never advances that census.

All generated Lean sources and full text data are copied immediately into
`reproduction/Cryptids/Chess/Optimisation/BodyCertificatePilot/` in the artifact,
including the audit program, exact root manifests and sources for later
unattempted stages. `selection.json` retains the
ordered nested samples and selection reasons. Reproduce by copying that tree
into a checkout of the recorded commit, prebuilding the accepted dependencies,
and rerunning the recorded module commands. Only generated build products are
removed to force fresh measurements; accepted build products remain available.
The full sources, data, logs and obstruction survive failed kernel checks.

## Source-review record

Four passes cover complete stage/output implementation; API direction and typed
data honesty; independent static Lean/resource review; and failure/retention
polish. The review confirmed the actual-body predicate and bounded-expression
loaders, and prompted full-phase driver RSS coverage and race-safe child
termination. The first remote attempt exposed a launcher configuration
obstruction before elaboration. The second exposed the public-environment audit
issue and unscoped option warning; source review now checks the external
full-private import API, explicit audit process options, shared stage budgets,
scoped options and precise failure classification. No local test, import,
generation or Lean execution was performed. Remote kernel validation is still
required. The third run established a real map-build memory obstruction; the
raw-natural fallback received separate implementation, range/identity proof,
independent static API, and scope/retention review passes. The fourth run's
comment-placement failure prompted direct linter-source inspection, a common
commented option prefix, and the bounded remote template stage. A source audit
of Lean's declaration elaborator confirmed that making map witnesses
noncomputable skips native compilation while retaining safe kernel definitions.
The fifth run established that the small templates compile and isolated the
interpreted audit's memory obstruction. The compiled-auditor repair follows
the accepted executable mechanism, retains the exact closure checks, and is
limited first to the small smoke decision test.
The packed-quotient revision received four static passes: implementation and
data-census review; codec/range proof and generated-layout review; independent
read-only adversarial reviews of Lean/API soundness and data/audit provenance;
and final retention, stage-budget and reporting review. No blocking finding
remained. Earlier nine-root smoke success does not verify the new 20-root
codec smoke. The driver, report and this leaf's ledger are source-ready for the
root-owned remote checkpoint, with all new proof compilation and representation
cost still unverified.
Root review caught deprecated conditional rewrite aliases. Direct inspection of
the pinned Lean `Init/Core.lean` confirms that both `if_pos` and `if_neg` are
deprecated aliases; the codec now uses `ite_eq_left` and `ite_eq_right`, matching
existing verified source usage. This source-only repair changes no proposition
or bound. The driver is frozen for the next remote checkpoint.
Trial 10 then verified the packed codec, smoke, complete literal map/quotient
builds and their audits remotely. The authorized thin-data split relocates the
same declarations and audit roots without changing their statements, bodies,
data or accepted-body reference. It distinguishes possible temporary kernel
reduction overhead from the final combined-import cost; no memory saving is
assumed before its remote run.
The thin split completed four source passes: declaration relocation and import
boundaries; complete root/census preservation; independent targeted reviews of
Lean visibility/closure and shared-budget failure behavior; and retention/report
consistency. Both independent reviewers found no blocking issue. The source is
frozen and ready for root-owned remote verification, with no local execution.
The subsequent map-isolation revision completed four source passes: retained
trial-11 receipt diagnosis; exact declaration/proposition relocation; narrow
independent verification of visibility, roots and the common deadline; and final
retention/report consistency. The existing reviewer found no blocking issue.
All eight data stages still consume the same 120-second allowance. This source
is frozen for the next bounded remote checkpoint; no local execution occurred.
The chunk-proof revision completed four source passes: exact midpoint/data
provenance; constructor proofs and child-constant composition; the existing
independent reviewer's narrow API/closure/budget review; and final retained
receipt, root-census and reporting consistency. That reviewer caught an
unapplied `Bool.and_eq_true` API use. Inspection of the pinned v4.35.0-rc4
`Init/Data/Bool.lean` confirmed the correct implicit-argument lemma; the source
now uses `Bool.and_eq_true_iff.mpr`. The reviewer found no remaining static
blocker after that repair. Only the three owned files changed; no local
generation, Lean, Python import, model, count or test execution occurred.
Source is frozen for root-owned remote validation; the new chunk proofs and
their resource cost remain unverified.
An import or data-loading
obstruction is useful evidence of this representation's cost, not permission
to bypass the kernel or claim the 459,315-state reduction accepted.
