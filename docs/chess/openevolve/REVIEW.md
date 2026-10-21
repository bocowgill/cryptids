# Independent review of the OpenEvolve compiler pilot

Disposition: R1 and R2 accepted for the pinned construction and composed official
evidence, with no identified defect or remaining review obligation. This is an
independent model referee's advisory judgment, not formal verification or human
approval. The remote Lean checks provide the formal evidence for the encoded
statement.

The current computation reviewed is commit
`e2888bf3d0ac9ff13119d65aa6ae9a66cec51709`, including the symbolic packaging
repair reviewed at `bcc7ab9` and the subsequent bounded native audit runtime.
The initial source review was at `079cb6b`. The exact claim is a two-symbol machine
starting in state zero on the blank tape, with 392,046,821 states, whose halting is
equivalent to `¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)`. This is one
state fewer than accepted M7. It does not determine the value of chess.

## Construction review (R1)

The only changed compiler rule is the binary lowering of a Post write whose
destination is a distinguished control `h` satisfying `∀ b, M h b = none`.
`TerminalBinary.compile` writes the same symbol, moves right, and enters main
control `h` immediately. A write to any other control retains its right/left
return trip. The latter return controls are indexed by deleting `h`, with
`lift_drop` restoring each live destination. Moves retain their old one-step
translation.

The relation in `TerminalBinary.Related` keeps exact encoded tapes at every live
boundary. At terminal boundaries it keeps only the control, so the final head
need not be restored. This weakening is justified because both terminal rows
are missing on every tape. `respects` covers stopping at other controls as well
as terminal stopping. Every continuing source step has a positive-length target
path: one for a move or terminal write, two for a live write. Consequently the
use of `StateTransition.tr_eval_dom` preserves both halting directions. The
singleton state space and a terminal initial control are included in the
universal statement; the return block may be empty.

The chess instance chooses the quotient's halted control, proves both missing
rows in `terminal_row`, and proves its actual numeric index is 1 in
`terminal_index`. With M7's fixed Post count `q = 194468231`, the compiler pays
`q + (q - 1) = 388936461` body states. `FlatInit.initialise` adds the unchanged
3,110,360 initializer states, giving 392,046,821. `initialises` specifies the
actual 3,110,360-step execution from the ordinary blank state-zero configuration
to body state zero with the full unchanged input and restored head. No
initialization is free.

The assembly follows the generic all-input halting theorem, accepted
`M7.post_halts_input`, the paid initializer theorem, and the numeric machine cast.
`Cryptids.Semantics.ChessOpenEvolve` names this same actual machine and the same
frozen strategic proposition. The source review finds no stronger chess premise
introduced by this chain. The completed trust-closure audit is bound in R2.

The table-side constructor is independent of the new Post compiler:
`TerminalBinary.table` selects surviving old binary rows and maps their
destinations. `table_compile` proves equality for every state and symbol;
`rowMachine_eq` carries that equality through the unchanged initializer and cast
to the actual chess machine. Its revised symbolic packaging introduces
`numericImage` for an arbitrary paid initializer, and transports body equality
using `numericImage_congr`. That congruence follows from substitution and proof
irrelevance of count proofs. It adds no semantic assumption and evaluates no
new input. The independent `rowBody` is first equated with `body`; its count and
paid initialized count are then established separately. The numeric recipe has initializer offset
`p = 3110360` and deletes old state `r = p + q + 1 = 197578592`. It selects old
row `s` for new `s < r`, old row `s + 1` otherwise, redirects destination `r` to
`p + 1 = 3110361`, and decrements destinations greater than `r`. These formulas
agree with the universal `lift`/`remap` arithmetic lemmas. Prefix destinations
are at most `p`, below the deletion point. The removed old bounce row is exactly
`0L3110361 1L3110361`. Thus the recipe retains both columns and all remaining
rows without modifying the input writer. This pilot does not claim a new full
table sweep or a newly retained expanded literal payload; it uses the already
accepted M7 table and a universally justified fixed row recipe.

The local metadata-only inspection found exactly 192 frozen entries, identical
to accepted M7's `core_source_sha256` map, and every live file matches its pinned
hash. The accepted M7 seal hashes to
`c278b3cf7a66d94a6950b315c9402c9f76597ffca9939b30112249824fa192c4`.
The M7 map hash and the candidate recipe's `source_map_sha256` both equal
`ecb76aa334014cf5ef038beaa5ec9c3808e8022d0e695847eae6f118a7207140`.
The R1 source binding is retained in
[construction-binding.json](evidence/review/construction-binding.json).

## Evidence review (R2)

The authentic official archive for run `39542309855` has been inspected. Its
61 entries match GitHub's artifact digest
`35e34032deb6744aeffafe2cd2dd58acc47b760244ce51293af4e0f36e940823` and the retained
entry manifest. All 17 computation hashes and all 192 frozen input hashes match
the current files. Five completed components are accepted: concrete Lean proof,
controls, artifact correspondence, accepted M7 regression, and actual model-backed
OpenEvolve execution. The strict concrete build passed; the unchanged dependency
inspector, compiled natively, audited 74 roots and 48,724 dependencies using only
`propext`, `Classical.choice`, and `Quot.sound`. All three forbidden-root controls
failed as intended. The native inspector ran under a 16-GiB address-space ceiling
and 900-second timeout; this is distinct from Lean's 6-GiB compilation/contract
limit. Its recorded cumulative child peak was 4,011,204 KiB.

The overall core run failed because the final M1–M5 wrapper exceeded its
3,600-second bound. Its saved command records exit -9, `timed_out = true`, and
elapsed time 3,600.1517 seconds. The inner M5 baseline marker occurred, but the
full `Chess M6 baseline verification passed` marker did not. No baseline phase
success report exists in that archive. The overall run is not presented as green,
and that failed attempt grants no baseline acceptance.

The separate helper at `c7d3ff318ef8beda1e41f3185013b03ce5f2290b` completed
successfully in official run `39548653262`. It ran the same unchanged
`python3 scripts/verify_chess_m6.py --baseline` command with a 7,200-second outer
bound. The command exited 0 after 2,578.2778 seconds, with `timed_out = false`
and the full `Chess M6 baseline verification passed` marker, including the M5
executable pass. Its recorded cumulative child peak was 10,548,600 KiB. The
official three-entry artifact hashes to
`ad8503c93a567f9d5618667766d8e6f0a3221746897d850965a0d8f1cd58b78a`.
The helper's checkout and final report both match the core's exact 17 computation
hashes and 192 frozen-input hashes. Its separately checked workflow hash is
`2503eb0d458baacc6fb621211845164b1d7c14adb85b4ebbf01699591d0401f2`.
This is separate orchestration outside the unchanged 17-file computation map.
Both official archives, API metadata, entry manifests, saved commands, outputs,
and component-specific run/head bindings have been checked. These six completed
components are accepted together; the failed core baseline remains in the record.

The official logs for the earlier run `39537193950` at `079cb6b` confirm the strict
generic `TerminalBinary` build completed successfully. That run then terminated
with exit 143 during the concrete assembly step, without an artifact or completed
downstream phases. It is retained under
`evidence/history/079cb6b-termination` and is excluded from complete-candidate
acceptance. The logs do not establish the cause of the termination.
The bounded retry `39538987362` at `d3fc872` reached all inherited modules but
rejected concrete `rowMachine` type normalization at the six-GiB Lean heap limit.
Its official artifact and logs are retained in
`evidence/history/d3fc872-bounded-failure`. This is the reason for the subsequent
symbolic packaging repair; the failed run grants no concrete proof acceptance.

The reviewed search source calls the actual pinned OpenEvolve API at
`59dfe764b5ab4478ac00214432fcac33bbe2bf4b`, through its supported `init_client`
interface. The pinned upstream [API](https://github.com/algorithmicsuperintelligence/openevolve/blob/59dfe764b5ab4478ac00214432fcac33bbe2bf4b/openevolve/api.py)
and [ensemble](https://github.com/algorithmicsuperintelligence/openevolve/blob/59dfe764b5ab4478ac00214432fcac33bbe2bf4b/openevolve/llm/ensemble.py)
were inspected independently. It pins Qwen2.5-Coder-0.5B-Instruct to
`ea3f2471cf1b1f0db85067f1ef93848e38e88c25`. The supplied six-policy grammar,
supplied optimization and supplied Lean certificates are explicit. The model
orders five unseen nonbaseline policies by constrained generation. Candidate
text is parsed as one literal assignment and is not executed. An uncertified
candidate scores zero; the two admitted policies are bound to fixed compilers
by exact policy selection. The fixed state counts additionally require the
separate actual chess construction proof.

The core review inspected raw prompts, token/output records, evaluations,
feedback, evolution traces, population/checkpoint artifacts, installed framework
provenance, dependency versions, and timing/resource records. It verified all five
shrinking unseen-choice sets and all six policy evaluations. The observed model
order was `(0,1), (1,1), (1,0), (2,1), (2,0)`; the third proposal was the certified
one-state reduction. All four incorrect policies were rejected. The raw records
contain 4,081 tokens, including 50 output tokens, five checkpoints, 46.9537 seconds
of framework run time, and 36.9016 seconds summed over the adapter's recorded
generation intervals. Those intervals include first-use weight loading; package
installation, proof/regression work, and runner billing are separate costs.
The installed framework's `direct_url.json` binds the requested commit, and its
recorded runtime includes Torch 2.8.0+cpu and Transformers 4.57.1.

This evidence establishes the small model-backed integration and certified
reduction. It cannot establish
autonomous invention, unrestricted proof/program synthesis, superiority over
enumeration, global state minimality, or practical chess-running performance.
The five novel choices exhaust the supplied nonbaseline family regardless of
their model-selected order. No paid inference API is configured; remote runner
compute and account billing are separate facts.

Earlier masked-build and rejected proof/audit attempts are retained and excluded
from acceptance. The [independent metadata/output validator](evidence/review/validate_review.py)
passed against the composed evidence and current files, producing the byte-identical
public [final evidence receipt](evidence/review/evidence-check.json). The earlier
[core-only receipt](evidence/review/core-evidence-check.json) retains its historical
pending-baseline scope. Local review executed only saved-output, archive, and hash
inspection; it ran no Lean, model, native checker, fixture, or table computation.
R2 is accepted for this exact evidence composition and claim scope.

The original workflow cached transient pilot outputs, so a restored model log
could make a later fresh search fail closed. The reviewed recovery source clears
restored transient outputs before generating new reports, and uses matching
build/dependency paths for restore and save. Prior official evidence is retained
separately. Recovery starts a fresh run. Resuming the model adapter from a framework
checkpoint would additionally require explicit restoration of its novelty and
budget state; this pilot did not test that path.
