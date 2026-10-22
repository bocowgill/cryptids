# Bounded concrete quotient certificate scalability pilot

Status: source drafted and statically reviewed; remote execution pending. This
experiment tests the cost of ordinary Lean kernel certificates for the measured
114,487-state quotient. A pass covers only the requested sample, never all
573,802 old states or a new accepted chess machine. The current seed proof
remains the primary route; this experiment targets the additional measured
459,315-state opportunity.

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

The ordinary `Cryptids` Lean library suffices; no new library stanza is needed.
Linux `prlimit` must be installed. The driver generates modules only in the
remote ephemeral checkout, below
`Cryptids/Chess/Optimisation/BodyCertificatePilot/`. The local worker authors only
the Python generator/driver, this report and its leaf ledger. No local import,
generation, Lean command, model, computation or test is performed. The successful
finite `pilot.py` and all accepted source/evidence files remain fixed.

Exit zero requires every requested stage and its success marker, including the
genuine negative kernel rejection. Its final marker is:

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

The generated map loader calls the existing
`TableSyntax.boundedFinExpr` and generic `balancedRowsExpr`; each leaf has type
`Fin 114487`. The existing `load_balanced_rows%` loader constructs the quotient
as a `Balanced.RowTree (List (Option (Fin 2 × Dir × Fin 114487)))`. Both loaders
propose ordinary constructor expressions. The kernel checks the finite bound
proofs on every loaded value. Neither a file hash nor the native generator is
a proof of a row relation.

Separate modules measure full-map loading, full-quotient loading, and complete
cache/census checks. The final data module proves with `decide +kernel`:

```
mapTree.count = 573802
mapTree.WellFormed
quotientTree.count = 114487
quotientTree.WellFormed
classMap 0 = 0
```

The map lookup's fallback is typed zero. The checked complete count and cache
validity establish the intended full-range tree layout; missing or shifted
input cannot be excused by a sampled lookup. The quotient uses
`Balanced.ofTree quotientTree`. All data and mathematical proof roots undergo
a transitive dependency audit allowing only the repository's standard
`propext`, `Classical.choice` and `Quot.sound` axioms. Unsafe, partial, open-chess
conjecture, or generator dependencies are rejected. No new axiom, admitted proof
or native decision procedure is introduced.

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
| `Loaders` | 60 | Elaborators and safe-closure audit command |
| `MapData` | 240 | Complete typed map and dependency audit |
| `QuotientData` | 180 | Complete typed quotient and dependency audit |
| `Data` | 120 | Full counts, caches, entry identity and actual-body predicate |
| `Rows64` | 120 | 128 actual-body row proofs and dependency audit |
| `Negative` | 45 | Kernel refusal of one false actual row |
| `Rows512` | 180 | 1,024 actual-body row proofs and dependency audit |
| `Rows4096` | 210 | 8,192 actual-body row proofs and dependency audit |

The 1,200-second global wall limit includes input validation, depth selection,
generation, all stages and diagnostics. Each stage is further capped by the
remaining global budget. Three seconds are reserved for final diagnostics.
`prlimit` caps child address space at 5.5 GiB for the default 6-GiB setting.
A 0.1-second watchdog covers driver RSS during every phase, with a 512-MiB driver
allowance; child stages also sample combined process-group-plus-driver RSS and
stop above 6 GiB. Resident-memory enforcement is sampled, not an instantaneous
cgroup cap. No global driver address-space cap prevents diagnostic writes. The
root may additionally impose an outer cgroup limit. All children run in a new
process group and are killed on budget exhaustion.

For each stage the driver retains the exact argv, cwd, exit, time cap, elapsed
time, sampled peak combined RSS, full log and its hash/size, plus the `.olean`
hash/size when produced. The global summary records source/input identities,
every completed stage, the first obstruction, and how many positive sample
states actually completed. A failed stage never advances that census.

All generated Lean sources and full text data are copied immediately into
`reproduction/Cryptids/Chess/Optimisation/BodyCertificatePilot/` in the artifact,
including sources for later unattempted stages. `selection.json` retains the
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
termination. Remote validation is still required. An import or data-loading
obstruction is useful evidence of this representation's cost, not permission
to bypass the kernel or claim the 459,315-state reduction accepted.
