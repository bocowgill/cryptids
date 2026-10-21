# Broader OpenEvolve compiler search

The remote campaign completed on 2026-10-21 with two distinct outcomes:

- **OpenEvolve found no certified state saving in 24 model proposals.** Its best
  certified program remains the 392,046,821-state pilot initializer.
- **The compiler optimization supplied before the search is certified at
  390,491,642 states**, saving 1,555,179 states. The model did not discover it.

The complete successful remote run is
[39598997807](https://github.com/bocowgill/cryptids/actions/runs/39598997807), at
`5af346f454a32b403a0dfd085160431b8d9cca77` on fork branch
`codex/chess-openevolve-pilot`. All five phase receipts bind the same 16 new
computation inputs and 211 unchanged prior inputs. The official archive, raw
proposals, checkpoints, diagnostics and logs are retained in
[evidence/current](evidence/current). Final independent review and the root
acceptance record are separate from the remote receipts: [REVIEW.md](REVIEW.md)
and [root-check.json](evidence/root-check.json).

## Certified construction

Write the input bits in reverse order while moving left, then move right once.
The resulting relative tape zipper is exactly the input followed by blanks, with
blanks to its left. Its physical location may translate; the machine has no
distinguished absolute tape origin. The universal proof covers every finite
binary input, including empty input and arbitrary zero padding.

| Component | Completed pilot | New certified machine |
|---|---:|---:|
| Frozen binary body | 388,936,461 | 388,936,461 |
| Paid initialization states and steps | 3,110,360 | 1,555,181 |
| Total states | 392,046,821 | 390,491,642 |

The input remains 1,555,180 bits. The new initializer uses exactly `n + 1` paid
states and transitions, replacing `2 * n`. The total reduction is 1,555,179 states,
about 0.4%. The named machine
`ConjectureMachines.Machines.chess_openevolve_wide : Machine 390491642 2`
starts in state zero on a blank tape and satisfies the unchanged theorem:

```text
Halts machine ↔ ¬(Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss)
```

The generic constructor and exact execution are in
[ReverseInit.lean](../../../Cryptids/Optimisation/ReverseInit.lean).
The concrete count, initialization, body-row correspondence and halting proof are
in [OpenEvolveWide.lean](../../../Cryptids/Chess/Optimisation/OpenEvolveWide.lean).
The independent statement is in
[ChessOpenEvolveWide.lean](../../../Cryptids/Semantics/ChessOpenEvolveWide.lean).
The [numeric table recipe](../../../artifacts/chess_openevolve_wide/table-map.json)
replaces the initializer and reindexes unchanged accepted body rows. Its identity
is proved universally; no new expanded table or full row sweep is claimed. This
result establishes neither chess's value nor a minimal machine, and makes no
claim about the full machine's runtime.

## Actual generative search

The pinned OpenEvolve controller, population, feedback and checkpoints ran with
unconstrained generation from a pinned Qwen2.5-Coder-1.5B-Instruct CPU model.
Candidates were typed write/move expression trees, with no finite response list
or response-constraining trie. Candidate Python was parsed as data and never
executed. See [RESEARCH.md](RESEARCH.md) for the exact language and proof frontier.

| Measured search quantity | Result |
|---|---:|
| Model requests | 24 |
| Evaluations, including initial seed | 25 |
| Distinct raw proposals | 18 |
| Certified evaluations | 6 |
| Best certified total states | 392,046,821 |
| Certified saving found by search | **0** |
| Million-state search target met | **No** |
| Framework elapsed time | 535.11 seconds |
| Model generation time, summed | 508.92 seconds |
| Input / output tokens | 19,562 / 536 |

All six certified evaluations are the forward-write/long-return seed: the initial
seed and five model repeats. Proposed reverse-left schedules used an incorrect
long return or malformed arguments. The model never proposed the correct final
one-step right move. Consequently, no selected-plan-to-new-machine bridge was
invoked. The larger machine theorem above is independently checked for the
supplied construction; it is not a certificate for the model's best plan.

The reverse-write idea and its proof support predate inference. The proof bank
currently supplies only two universal identities; it can reject a correct new
algorithm as unproved. The static system prompt omits the reverse solution, but
later certificate diagnostics may expose supplied identity names or source.
These limits prevent claims of autonomous discovery, unrestricted compiler or
proof synthesis, optimality, or superiority over enumeration. A further search
would benefit from a wider certification mechanism before a larger proposal
budget is spent; this completed run does not establish that more samples alone
would help.

The budget was 24 proposals, at most 4096 input and 256 output tokens each, and a
40-minute subprocess bound. Actual requests used at most 955 input and 110 output
tokens; no prompts were truncated. Model revision:
`2e1fd397ee46e1388853d2af2c993145b0f1098a`; OpenEvolve commit:
`59dfe764b5ab4478ac00214432fcac33bbe2bf4b`. There were zero paid model API calls.
Runner billing was not measured.

## Verification and retained evidence

The successful remote workflow passed strict Lean builds, the 14 rejection
controls, two positive controls with all 127 small-input fixtures each, universal
certificates, the native dependency audit and actual M7/pilot proof regressions.
Controls included malformed syntax, wrong tape behavior, cost corruption, a
correct but unsupported plan, an actual proof timeout and a corrupted proof.
Finite fixtures served only as rejection filters. The final proof generator
disabled no proof or style warnings.

The new audit checked 69 roots and 48,854 dependencies, allowing only
`propext`, `Classical.choice` and `Quot.sound`. It rejected separate sorry,
open-chess-conjecture and generator controls. The M7 and earlier pilot proof
regressions passed on their actual unchanged sources. Authenticated prior M1–M5
receipts remain applicable to their unchanged inputs; their expensive full run
was not repeated here.

The official artifact contains 427 entries. SHA-256:
`581026dac290c7ebb74d666ed7760f335027fb8eb99eacf0226ae517f59f1ec7`.
Logs SHA-256:
`513a221c803178a54919ce72990ec965771a5662a9c672623329a8c037cc8bb4`.
The [saved-evidence checker](evidence/check_evidence.py) verifies archive entries,
source maps, phase receipts, raw model outcomes and prior evidence; it performs
only metadata and saved-output checks locally.

Earlier failed proof/preflight attempts are retained under
[evidence/history](evidence/history). They stopped before any model request and
are not relabeled successful whole workflows. In particular, the first strict
concrete machine pass at `2d9987b` later failed candidate preflight. The final
successful evidence is bound to `5af346f`, not to those failed attempts.

The frozen chess specification and all 211 pinned prior inputs remain fixed.
All substantive computation ran remotely. Outreach, upstream writes and later
milestones remain on hold. See [results.json](results.json) for the machine-readable
outcome and [RESUME.md](RESUME.md) for the checkpoint.
