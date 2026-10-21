# OpenEvolve compiler pilot

Status: verification in progress. The generic compiler theorem, concrete chess
assembly, dependency audit, controls, artifact certificate, M7 regression and
actual OpenEvolve search have passed their remote steps. The frozen M1–M5 baseline
and independent acceptance of the completed official evidence remain required.
See [RESUME.md](RESUME.md) for the current remote run.

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
checks. Lean builds use a 6144MiB limit. The native audit uses a separate 16GiB
virtual-address ceiling and a 900-second timeout; these are different limits.
The workflow has a 120-minute ceiling. Model proposals are capped at five,
input at 3072 tokens and output at 32 tokens per proposal. No paid model API is
configured; runner minutes and account billing are separate costs.

To reproduce, dispatch the `Chess OpenEvolve pilot` workflow on the pilot branch
in the fork. It uses Ubuntu24.04 and the unchanged Lean4.35.0-rc4 toolchain,
fetches the complete pinned Mathlib cache, prepares the supported sandbox,
installs the pinned CPU inference environment, and executes all six phases.
Do not run these substantial verification commands locally. A lightweight local
`python3 scripts/chess_openevolve/verify.py --metadata` checks only frozen hashes.
Once official evidence is retained, `evidence/check_evidence.py` inspects archive
digests, saved outputs and current file hashes without executing Lean or a model.

The [failure history](evidence/history/dispositions.json) retains rejected proof
attempts, an early masked build exit, termination without a final artifact,
normalization memory failure, strict formatting rejection, and audit runtime
failures. The masked green workflow grants no proof acceptance. Subsequent runs
use pipefail and explicit subprocess exit checks. Successful build caches contain
only dependencies and compiled modules; restored transient pilot outputs are
cleared before each fresh search. Explicit model-checkpoint resume requires
additional novelty/budget restoration and is not implemented by this pilot.

Outreach, new PRs and later milestones remain on hold.
