# OpenEvolve compiler pilot

Status: **complete**. The generic compiler theorem, concrete chess assembly,
dependency audit, controls, artifact certificate, M7 regression, actual OpenEvolve
search and complete frozen M1–M5 baseline passed remotely. Independent review
accepted the construction and authenticated composed evidence. All 9 acceptance
gates are met: 0 unmet and 0 abandoned. See [REVIEW.md](REVIEW.md) and the
[final review seal](evidence/review/seal.json).

The [machine-readable results](results.json) record the measured core outcome.
Core run [39542309855](https://github.com/bocowgill/cryptids/actions/runs/39542309855)
at `e2888bf3d0ac9ff13119d65aa6ae9a66cec51709` has overall conclusion **failure**:
its final baseline wrapper timed out after 3,600.15 seconds during M5 executable
verification. The default build and M1–M4 had passed. The five earlier pilot
phase reports passed and are retained in the authenticated 61-entry
[official archive](evidence/current/artifact.zip). The
[baseline-only recovery](https://github.com/bocowgill/cryptids/actions/runs/39548653262)
passed in full; its orchestration hash is sealed independently
while all 17 core computation hashes and 192 frozen inputs remain identical.
Its [official archive](evidence/baseline/artifact.zip) records successful execution
of the unchanged baseline CLI in 2,578.28 seconds. The original core workflow
remains a failed whole run; acceptance combines its five passed components with
the matching successful baseline receipt.

## Construction

The selected routine lowers a Post write whose destination has no transitions on
either symbol. Enter that terminal control immediately after writing and moving
right, omitting its dedicated move-left return control. The universal simulation
preserves both halting directions for every source satisfying this premise and
every finite input. Live boundaries keep exactly the encoded tape; the terminal
head position is allowed to differ.

| Component | Accepted M7 | Candidate |
| --- | ---: | ---: |
| Post controls | 194,468,231 | 194,468,231 |
| Binary body | 388,936,462 | 388,936,461 |
| Paid blank initializer | 3,110,360 | 3,110,360 |
| Total states | 392,046,822 | 392,046,821 |

The proof includes the full 1,555,180-bit initial input and the actual
3,110,360-step blank initialization. Its target remains
`Halts machine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`.
The chess value is not determined. All 192 accepted M7 computation inputs remain
byte-for-byte fixed, including the frozen specification and original toolchain.

The implementation is [TerminalBinary.lean](../../../Cryptids/Optimisation/TerminalBinary.lean),
with the actual assembly in
[OpenEvolve.lean](../../../Cryptids/Chess/Optimisation/OpenEvolve.lean) and the named
machine and statement in
[ChessOpenEvolve.lean](../../../Cryptids/Semantics/ChessOpenEvolve.lean).

## Search scope

The pilot supplies the optimization, universal Lean certificates, six-policy family,
grammar and evaluator. A pinned public Qwen2.5-Coder-0.5B-Instruct model runs through
the real pinned OpenEvolve API on the remote runner. It orders the five unseen
nonbaseline policies through constrained autoregressive generation. Exhausting
this family guarantees that the supplied good policy is considered. The run
therefore measures integration, certification, feedback and provenance; it offers
no evidence of unrestricted invention, superiority over enumeration or scalability.
See [RESEARCH.md](RESEARCH.md) for exact pins and primary references.

Candidate Python is parsed as one literal `POLICY` assignment and never executed.
Finite operational counterexamples reject bad policies. Admission additionally
requires an actual Lean check of the universal theorem for the selected compiler.
A timeout or failed proof never produces a certificate. The actual chess count
and end-to-end theorem are checked separately from the search score.

The completed core search made five model proposals and six evaluations including
the M7 seed. Proposal order was `(0,1)`, `(1,1)`, `(1,0)`, `(2,1)`, `(2,0)`.
The third proposal `(1,0)` passed its universal Lean certificate; the other four
were rejected by operational counterexamples. The seed also passed its certificate.
The raw prompts show counterexample feedback reaching subsequent proposals.
There were 4,031 input tokens and 50 output tokens, with zero paid model API calls.
Framework wall time was 46.95 seconds; its enclosing workflow step took 49 seconds.
This run exhausts the supplied family and makes no search-efficiency comparison.

The native foundation audit checked 74 roots and 48,724 transitive declarations,
allowing only `propext`, `Classical.choice` and `Quot.sound`. Its three negative
controls rejected an unproved axiom, dependence on the open chess conjecture,
and dependence on a proof generator. Routine controls rejected four malformed
policies, four semantic corruptions, four map/cost corruptions, a real certificate
subprocess timeout, and a corrupt Lean proof. Small executable table fixtures
covered 30 corners; a separate universal theorem covers the singleton terminal
initial-state edge case.

| Completed core operation | Measured wall time |
| --- | ---: |
| New assembly, native audit, controls and artifact certificate step | 41 s |
| Accepted M7 regression step | 44 s |
| Pinned CPU search-runtime installation | 51 s |
| OpenEvolve search step, including startup and evaluation | 49 s |
| Incomplete legacy baseline attempt | 3,600.15 s; timed out |
| Complete baseline-only recovery CLI | 2,578.28 s |

These are construction and validation costs. The initial-position chess evaluator
was not run to determine its value. Failed attempts and the separate baseline
recovery are additional costs, recorded with their actual run outcomes.

## Explicit table representation

The [fixed recipe](../../../artifacts/chess_openevolve/table-map.json) selects rows
from the accepted M7 literal table. It removes old state 197,578,592, redirects
incoming destinations to terminal main state 3,110,361, and decrements greater
indices. The initializer rows are retained. `TerminalBinary.table_compile` and
`rowMachine_eq` prove universal row correspondence and equality with the actual
paid blank machine, including both symbols and every surviving state.

This pilot retains the accepted M7 table plus this recipe. It does not generate
a new expanded payload or claim a new complete table sweep. The formal universal
correspondence is distinguished from the small numeric boundary fixtures.
The optional stream transform requires the authenticated accepted M7 input stream;
its bounded parser and row-count checks do not authenticate arbitrary input bytes.

## Evidence and recovery

Only completed official source-bound reports may close acceptance. Remote phases
are proofs, controls, artifact, M7 regression, actual search, and the frozen M1–M5
baseline wrapper. Their source maps must agree with the live pilot files and all
192 frozen inputs. Independent review must accept the authentic retained archive.

All Lean compilation, native execution, fixture runs, model inference and search
are remote. Local work consists of editing, orchestration and small metadata/hash
checks. Pilot strict build targets and admitted-candidate certificate subprocesses
use a 6144MiB Lean limit. Frozen regression commands retain their original settings.
The native audit uses a separate 16GiB virtual-address ceiling and a 900-second
timeout; these are different limits.
The core workflow has a 120-minute ceiling. Its failed baseline phase had a
3,600-second outer bound. The baseline-only recovery job has a 180-minute ceiling
and a 7,200-second bound around the same unchanged frozen baseline CLI.
Model proposals are capped at five,
input at 3072 tokens and output at 32 tokens per proposal. No paid model API is
configured; runner minutes and account billing are separate costs.

To reproduce, dispatch the `Chess OpenEvolve pilot` workflow on the pilot branch
in the fork. It uses Ubuntu24.04 and the unchanged Lean4.35.0-rc4 toolchain,
fetches the complete pinned Mathlib cache, prepares the supported sandbox,
installs the pinned CPU inference environment, and executes all six phases.
The separate `Chess OpenEvolve baseline completion` workflow reproduces the
baseline completion with its separately pinned orchestration file and longer
outer timeout. Do not run these substantial verification commands locally.
A lightweight local
`python3 scripts/chess_openevolve/verify.py --metadata` checks only frozen hashes.
Once official evidence is retained, `evidence/check_evidence.py` inspects archive
digests, saved outputs and current file hashes without executing Lean or a model.
The independent `evidence/review/validate_review.py` rechecks both official archives,
all six components, policy/proof bindings, checkpoints, current inputs and the
separate helper hash. Both metadata-only validators passed on the final inputs.

The [failure history](evidence/history/dispositions.json) retains rejected proof
attempts, an early masked build exit, termination without a final artifact,
normalization memory failure, strict formatting rejection, and audit runtime
failures. The masked green workflow grants no proof acceptance. Subsequent runs
use pipefail and explicit subprocess exit checks. Successful build caches contain
only dependencies and compiled modules; restored transient pilot outputs are
cleared before each fresh search. Explicit model-checkpoint resume requires
additional novelty/budget restoration and is not implemented by this pilot.

Outreach, new PRs and later milestones remain on hold.
