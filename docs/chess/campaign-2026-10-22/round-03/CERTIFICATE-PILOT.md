# Bounded concrete quotient certificate scalability pilot

Status: the first compiled-auditor smoke run failed at an unavailable allocator
helper during compilation. That optional call is removed; the mandatory sampled
6-GiB combined RSS limit and 300-second smoke budget remain. The next decision
test still stops after auditing the same nine-root smoke module. Zero actual-body
row proofs have passed. This
experiment tests the cost of ordinary Lean kernel certificates for the measured
114,487-state quotient. A pass covers only the requested sample, never all
573,802 old states or a new accepted chess machine. The accepted full-machine
baseline is now 998,176 states; this experiment targets the additional measured
459,315-state opportunity.

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
the existing sampled 6-GiB combined RSS cap. Whether this removes enough memory overhead is the
question for the next bounded test, not an established result.

The next run uses `--smoke-only --seconds 300`. It generates only the auditor,
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

The next decision run adds `--smoke-only` and uses `--seconds 300` instead of
1,200. The root-owned verifier binds the accepted `accepted-998176-pins.json`
checkpoint. The driver invokes `lake` directly and generates modules only in the
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
map as integers and the full quotient as two-column transition cells; no
sampled map or reduced quotient is substituted.
The separate smoke-only decision mode does not claim or perform these full-data
checks; it uses only the retained four-entry/two-row template literals.

The generated map loader calls the existing generic
`TableSyntax.balancedRowsExpr` with `mkNatLit` leaves, producing
`mapTree : Balanced.RowTree Nat`. The existing `load_balanced_rows%` loader constructs the quotient
as a `Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 114487)))`. Both loaders
propose ordinary constructor expressions. The quotient loader still uses
`boundedFinExpr`; its finite values are checked by the kernel. Map bounds are
established by a complete separate kernel computation. Neither a file hash nor
the native generator is a proof of a row relation.

Only the map tree and its lookup wrapper suppress native code generation via
`noncomputable`; their transparent safe kernel definitions are retained.

Separate modules measure full-map loading, full-quotient loading, and complete
cache/census checks. The final data module proves with `decide +kernel`:

```
mapTree.count = 573802
mapTree.WellFormed
mapAllBelow mapTree 114487 = true
quotientTree.count = 114487
quotientTree.WellFormed
classMap 0 = 0
```

`mapAllBelow` recursively checks every leaf against 114,487. Its generic
induction theorem proves that every lookup stays below the bound when the
fallback does. Consequently the data module proves
`mapTree.lookup index 0 < 114487` for every natural index. It defines
`classMap s := Fin.ofNat 114487 (mapTree.lookup s.val 0)` and proves for every
old state `s` that `(classMap s).val = mapTree.lookup s.val 0`, using
`Nat.mod_eq_of_lt`. Thus the modulo constructor does not change the measured
map. These complete range and identity proofs are required audit roots.

The raw map lookup's fallback is zero. The checked complete count and cache
validity establish the intended full-range tree layout; missing or shifted
input cannot be excused by a sampled lookup. The quotient uses
`Balanced.ofTree quotientTree`. All data and mathematical proof roots undergo
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
census. `Loaders` contains setup elaborators and has no mathematical claim roots.

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
| `Loaders` | 60 | Typed-data elaborator setup |
| `TemplateSmoke` | 60 | Small production-template checks and dependency audit; zero actual-body rows |
| `MapData` | 240 | Complete natural-valued map and dependency audit |
| `QuotientData` | 180 | Complete typed quotient and dependency audit |
| `Data` | 120 | Full counts, caches, map range/lookup identity, entry and actual-body predicate |
| `Rows64` | 120 | 128 actual-body row proofs and dependency audit |
| `Negative` | 45 | Kernel refusal of one false actual row |
| `Rows512` | 180 | 1,024 actual-body row proofs and dependency audit |
| `Rows4096` | 210 | 8,192 actual-body row proofs and dependency audit |

The 1,200-second global wall limit includes input validation, depth selection,
generation, auditor compilation, all builds, external audits and diagnostics.
The smoke-only decision test uses a smaller 300-second global limit. Each stage is further capped by the
remaining global budget. Three seconds are reserved for final diagnostics.
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
An import or data-loading
obstruction is useful evidence of this representation's cost, not permission
to bypass the kernel or claim the 459,315-state reduction accepted.
