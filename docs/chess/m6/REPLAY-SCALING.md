# Exact full-target replay scaling

Leaf 1.46 changes tooling compilation granularity. It preserves the fixed mathematical
snapshot boundary from `CHALLENGE-EXPORT.md`: every original target ConstantInfo remains
exact, source theorem bodies are absent, reference goals use the explicit axiom/theorem
bridge, and safe runtime aliases require the existing kernel certificates. No source
module, source IR, new mathematical axiom or broader expression normalization is added.
The final output remains one module importing only fixed core/library modules.

## Located bottleneck

The original production file has 6,539 kernel payloads and 210,777 Expr DAG nodes. Root's
original replay exceeded 120 seconds at 3.736 GB without phase output. These failed
measurements remain in leaf 1.42 and its archived original seal. Empty output alone did
not locate the stall: filesystem events are needed to distinguish actual progress from
output delivery.

A first-command filesystem marker on the entire 11.69 MB text completes in 2.156 seconds
when followed by `#exit` (the intentional interruption exits one). A decoder-only module
builds in 1.695 seconds; padding it to the full source length still builds in 1.849
seconds. Therefore file length and compiler source diagnostics alone do not explain the
stall. A private split-decoder full candidate still exceeds 120 seconds.

Filesystem phase events show fixed decoder, literal data and the entire 210,777-node
pool ready in 0.550 seconds, including 0.326 seconds decoding the pool. The next emitted
work was 6,539 separate private `dN : Declaration` helper definitions, all compiled before
any kernel replay. No first logical replay marker was reached. This identifies the
first expensive stage as tooling-helper elaboration/compilation, not kernel checking
of a particular chess declaration or expansion of the initial game tree.

## Construction change

The generator now emits bounded, parameterized builders:

```lean
private def declarations0 (pool : Array Expr) : Array Declaration := #[...]
run_elab withOptions (fun opts => opts.setBool `backward.privateInPublic true) do
  for declaration in declarations0 expressions do
    Lean.addDecl declaration (forceExpose := true)
    match declaration with
    | .inductDecl _ _ types _ => Lean.compileDecls (types.toArray.map (·.name))
    | _ => pure ()
```

Each builder contains at most 64 original payloads, in the original dependency order.
Every payload still reaches the same checked `Lean.addDecl` API. Inductive layout
compilation occurs at the same point. Expected constructor/recursor ConstantInfo checks
also use bounded parameterized builders, preserving all original expected fields.

Independent metadata actions are compiled in groups of at most 64, retaining each
original `do` scope and action order. Consecutive simple `compileDecls` actions are
likewise grouped without changing their calls or order. Complex structural/WF alias
commands remain intact and retain their existing options, unfolding certificates,
`Eq.refl` equality checks and compiler simplification registration. No compiler IR is
copied from the source environment.

The manifest retains every logical payload's stable `index`, `label` (`dN`) and names.
Its physical location is now `definition: declarationsB` plus `offset` in that builder.
A name-directed mutation wrapper around `Lean.addDecl` avoids depending on source layout.
This supersedes the old one-private-definition-per-payload layout described in the
historical leaf 1.42 snapshot evidence.

`--trace-file PATH` optionally appends monotonic millisecond phase events during replay.
The trace includes import readiness, decoder/data/pool readiness, every logical batch,
generated-info checks, metadata batches, runtime batches and completion. This is build
instrumentation outside every mathematical target/proof dependency; it is not consulted
by the machine or by imported runtime execution.

## Actual target verification

The full actual candidate was generated from `Cryptids.Semantics.Chess`, rooted at
`ConjectureMachines.Machines.chess_baseline`, with the goal type of
`ConjectureMachines.Semantics.Chess.halts_chess_baseline_iff_not_draw` and `--auto-base`.
It still has 6,613 copied declarations, 6,539 kernel commands and 210,777 Expr nodes.
There are no syntax-bearing mathematical target declarations.

| Check | Time | Sampled process-tree RSS | Result |
|---|---:|---:|---|
| Actual export | 30.203 s | 6.900 GB | fixed candidate written |
| Strict full replay | 114.261 s | 4.978 GB | all kernel checks and runtime reconstruction pass |
| Independent exact comparison | 8.303 s | 9.341 GB | 13,860 declarations; 12,981 exact bodies |
| Safe runtime/proof audit | 4.931 s | 4.700 GB | standard axioms only |
| Independent snapshot row execution | 8.324 s | 2.930 GB | all 15 source samples match |

The audit includes 27 safe runtime aliases/proofs, follows their 13,890 mathematical
dependencies, and inventories seven normal compiler auxiliaries outside those closures.
The only mathematical axioms are `propext`, `Classical.choice` and `Quot.sound`.
The exact comparison loads independent source and snapshot environments and checks the
goal type, explicit reference bridge and every transitive target type/value/inductive
field. It uses no native hash in place of definition comparison.

Relative to the import-ready event, the final replay has its pool ready at 0.800 s,
all kernel payloads checked at 73.501 s, expected-info checks finished by 74.735 s,
runtime compilation beginning at 85.511 s and completion at 107.043 s. Process startup
and final serialization account for the remaining wall time. The experiment had an
approved 300-second cap after the earlier prototype demonstrated all per-declaration
progress; it actually finished within 120 seconds. Single-process jobs remain capped
at 8 GiB. The two-environment comparison uses the root-approved 16 GiB exception.
GB figures are decimal; caps use GiB and RSS is sampled every 0.15 seconds.

Independent execution imports only the generated candidate and a small duplicated row
serializer. The 15 sampled states include initialization, its boundary, the machine
body and the final states. These are execution probes, not a substitute for root's
complete canonical row-byte export and comparison.

## Reproduction and remaining parent integration

Evidence, private candidates, commands, phase events and checks are under
`.unlazy/chess-m6/leaf-1.46/`. `final-suite.py` reruns the generic strict builds, exact
comparisons, actual LazyGraph execution, safe dependency audits and all ten negative
scenarios. Valid numeral/proposition/reference mutations kernel-build and fail deep
comparison. Matcher and structural/WF source changes fail construction or certificates;
local axioms, unsafe/partial targets and source-proof contamination fail inventory.

The final actual candidate is `fixtures/M6ActualSnapshot.lean`; its focused strict replay,
exact comparison, audit and independent execution are retained separately. `SEAL.json`
pins these results and the generator. `verify.py` checks the retained evidence and
fingerprints; it does not rerun Lean. Run it before rerunning commands, because fresh
measurements replace log fingerprints.

Root owns production regeneration, its final independent comparator, name-directed
full-target mutations, AOT exporter and complete table-byte/artifact agreement. None
of those parent obligations is claimed complete by the bounded execution samples or
by this tooling leaf. No chess evaluator was run to determine the initial game's value.

## Original Lake long-line lint integration

The final generator additionally emits `set_option linter.style.longLine false` before
its fixed constructor payloads. This is the only generator change after the initial
leaf 1.46 seal. The original Lake configuration enables
`weak.linter.mathlibStandardSet = true`; Mathlib's `Style.longLine` linter reads the
current file option before inspecting command lines. Large fixed JSON and declaration
payload lines therefore need this explicit file setting when built with warnings fatal.
All other warning settings remain inherited.

The focused integration controls explicitly pass both `-DwarningAsError=true` and
`-Dlinter.style.longLine=true`. A long data line under the actual generated imports
fails with the expected 100-character-limit diagnostic without the file setting, and
passes with it. A fresh full actual candidate is replayed with those same strict flags
and independently compared against the unchanged source target.

`style-scope.json` records the exact one-line generator change. The styled candidate's
manifest and entire fixed payload are byte-identical to the previously verified
candidate; the only other file difference is its tooling-only trace-output pathname.
The original 35 checks and ten negative scenarios are retained without modification,
along with the prior seal and generator. The new seal adds the style checks and the
fresh full-target exact comparison. Root production files were not edited by this leaf.

The styled full candidate passes strict replay with the command-line linter enabled
in 115.100 seconds at 5.013 GB sampled RSS. Its fresh independent comparison passes in
6.777 seconds at 9.337 GB, again matching all 13,860 declarations and 12,981 exact bodies.
The original 35-check seal can still be validated using
`preserved-before-longline.json`, which maps the few updated source/documentation paths
to their retained original bytes. The updated seal includes 41 focused checks.
