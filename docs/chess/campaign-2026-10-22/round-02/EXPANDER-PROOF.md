# Universal expander proof candidate

Status: complete source candidate, first remote diagnostics repaired; strict rerun and axiom audit
pending. This document
does not certify the candidate or change the accepted 2,411,743-state result.

The exact target is `Seed.run_seed`: for every `letters : List (Fin 4)`, the actual
`Seed.machine : Machine 216 2` runs from `entry` on `Tape.mk₁ (seed letters)` to `done` on
`markedOutput letters.reverse`, in `16*n*n + 83*n + 62` transitions, where `n = letters.length`.
The reachable target is exported as `Seed.seed_reaches`. Neither theorem takes an assumption
about the expander's behavior.

The proof uses the frozen `Format`, the actual controller row contracts in `Blocks`, and the
generic finite scanner contracts in `Scan`. It never substitutes a different abstract machine.
`frameTape out todo gap` is proof notation describing both complete infinite half-tapes, with
finite listed content and blank tails. The published loop invariant specializes
`gap = 1 + 3*out.length`.

One loop iteration reads B and the next valid word in nine transitions, rewrites B in ten,
scans left to A, prepends the decoded thirteen-bit cell and replaces A in thirty-one, then
scans right and returns five steps to B's left guard. The generalized exact iteration cost is
`26*out.length + 2*gap + 81`; the canonical cost is `32*out.length + 83`.

The left scanner does not claim that an ordinary reversed cell resets its counter. It scans
the reversed output with a borrowed following zero. The identity
`reverse(output(s::out)) ++ [0] = (reverse(output out) ++ [0]) ++
(zeros 9 ++ reverse(word s) ++ [0])` supplies thirteen-bit groups ending in zero. Each group
resets the scanner. Both scanners inspect only the output, cleared gap, and relevant marker.
The unread payload is carried as an arbitrary tape frame throughout their contracts.

At end input, the same nine-step read recognizes `000`, ten transitions erase B, the left
scan reaches A, and six zero writes erase A. The quotient identity
`ListBlank.mk (bits ++ zeros n) = ListBlank.mk bits` removes only trailing blank cells.
It is never applied to a zero prefix followed by an arbitrary frame. The result before
marking is exactly `Tape.mk₁ (output out)` with both exterior regions blank.

The last twenty-four transitions move right twelve, write the single bottom marker while
moving left, and move left eleven more times. This gives precisely `markedOutput out`,
including `out = []`. No empty-input special machine or residual sentinel is introduced.
The complete canonical finish costs `16*out.length + 55` transitions.

Induction on the unread finite list, generalized over the emitted output, proves `run_loop`.
Its target order is `todo.reverse ++ out`, and its cost is
`16*n*n + (32*m+83)*n + 16*m + 55`. Polynomial arithmetic closes the successor count.
Seven entry moves establish `loopTape [] letters`, yielding the universal final formula.

Source review passes completed before remote feedback:

1. Checked the frozen protocol and actual row block endpoints against the proof plan.
2. Checked scanner direction, borrowed-zero grouping, B overlap, prepend geometry, and the
   orientation of the emitted and unread lists.
3. Checked cleanup, arbitrary-frame preservation, empty input, both blank exteriors, and
   the distinction between paid state count and execution length.
4. Checked the final theorem's quantifiers and dependency path; no new axiom, `sorry`,
   finite-fixture replacement, or expander-behavior premise appears in the source candidate.

An independent read-only source review recomputed both generalized costs, the canonical
quadratic recurrence, each scanner endpoint, the thirteen blank cells needed for prepending,
and the empty/gap-zero cases. It found no mathematical defect or definite source/API error.
That review is advisory and is not kernel verification. All remote diagnostics remain
required before changing any acceptance gate to checked. Remote build/evidence references
will be recorded here after
the root supplies them. All local activity for this work consisted of source reads and edits;
Lean, Lake, LSP, LeanProbe, models, and tests were not executed locally.

## Remote repair record

The first proof session built `Blocks` and `Scan` successfully, then rejected `Expander`.
Its exact retained command record is
`evidence/proofs-session-1-diagnostics/commands/1792678380255457094.json`.
The diagnosed defects were the reserved identifier `prefix`, a numeral rewrite whose motive
abstracted a dependent `Fin` instance, a missing explicit blank-prefix quotient equality,
normalization of the right-scan step count and canonical gap, and asymmetric blank-tail
simplification in the erase-A proof. The source now renames the local scanner word, rewrites a
separately typed shift equality, explicitly collapses the thirteen supplied left blanks, and
normalizes the affected tape and count expressions. The erase-A goal is normalized before
applying the framed write theorem. No mathematical statement or controller definition changed.

All changes are source repairs awaiting the next remote strict build. The syntax defect prevented
the first session from checking the full scanner composition, so no partial acceptance is inferred
from the absence of additional diagnostics in that session.
