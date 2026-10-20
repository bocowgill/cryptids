# Evidence and limits of the M1 audit

## Source identity

Input retrieved from [the pinned PR head][source] through the connected GitHub
read tools. PR metadata was re-read during this task and still identified head
`03536100b3d15e928f45649e7935f8c2b785337b`. Its archive is
[`source/Chess.lean.txt`](source/Chess.lean.txt), not a compiled Lean module.

Observed source identity:

```text
bytes:    25395
lines:    640
Git blob: 8018d10a3bfcd375a17c76599cfd3ceafe3e930d
SHA-256:  ad43e6cfa086ff692daf57b8ee2444faa34f318ff43e05e44b53b27a53e10348
```

The Git blob was recomputed as SHA-1 of `blob <byte length>\0<file bytes>` and
matched the value returned by GitHub. SHA-256 was independently computed over
the archived bytes. These checks establish source identity, not semantic truth.

Reproduction from the repository root:

```sh
git hash-object docs/chess/m1/source/Chess.lean.txt
shasum -a 256 docs/chess/m1/source/Chess.lean.txt
wc -l -c docs/chess/m1/source/Chess.lean.txt
```

The inspected source has one import, five explicitly `noncomputable` definitions,
and two theorems. `initial_position_sanity` uses `rfl`; the open draw theorem has
the sole `sorry` token at source line 638. These observations came from direct
reading and a declaration/token search, not a transitive Lean axiom audit.

## Supporting primary sources inspected

| Source | Observation relevant to this audit |
| --- | --- |
| [Chess source][source] | Entire file reviewed; line references in `AUDIT.md` refer to this version |
| [FormalConjecturesUtil.lean][util] at the same commit | Imports Mathlib, FormalConjecturesForMathlib, answer support, and repository linters |
| [FormalConjectures Lake configuration][lake] at the same commit | Pins mathlib v4.33.1 and configures conjecture-specific linters/attributes |
| [FormalConjectures toolchain][toolchain] at the same commit | `leanprover/lean4:v4.33.1` |
| [FIDE 2023 handbook][fide] | Rule edition and article references checked for the abstract model's scope |
| [PR discussion][pr] | Existing author/AI review and resolved URL thread read; neither treated as an independent certificate |
| Local `lakefile.toml`, `lean-toolchain` | Cryptids remains on v4.35.0-rc4; no dependency/configuration changes made |
| Local `Cryptids.lean`, `Cryptids/Machines.lean`, `Challenge.lean` | Existing public import, machine, blank-tape, and independent challenge conventions |
| Local `comparator/README.md`, `comparator/riemann_95.json`, `.github/workflows/lean_action_ci.yml` | Permitted axioms, exported-definition comparison, and Linux/bwrap verification integration |

No approval request or message was sent to the PR author, reviewers, or maintainers.

## Finite geometry replay

Question: does the source's `OnOpenSegment` predicate, lines 151–159, pick exactly
the interior squares of a rook/bishop/queen ray on the 8×8 board?

Encoding: square coordinates are integer pairs in `range(8)`. `Nat.dist` becomes
integer absolute difference on these nonnegative values, and source conjunctions
and disjunctions are translated directly. The independent comparison constructs
the ray by repeated signed unit steps, admitting only horizontal, vertical, or
diagonal endpoints. Identical endpoints have an empty interior. This is a manual
translation of one finite relation, not an extraction of the entire Lean model.

The following Python was executed as audit-only scratch computation. It is kept
here for reproducibility; no chess runtime or test implementation was added.

```python
from itertools import product

squares = list(product(range(8), repeat=2))

def inside(a, b, x):
    return min(a, b) < x < max(a, b)

def source_relation(s, d, x):
    sf, sr = s
    df, dr = d
    xf, xr = x
    return (
        (sf == df and xf == sf and inside(sr, dr, xr))
        or (sr == dr and xr == sr and inside(sf, df, xf))
        or (
            abs(sf - df) == abs(sr - dr)
            and abs(sf - xf) == abs(sr - xr)
            and inside(sf, df, xf)
            and inside(sr, dr, xr)
        )
    )

def ray_interior(s, d):
    dx = d[0] - s[0]
    dy = d[1] - s[1]
    if s == d or not (dx == 0 or dy == 0 or abs(dx) == abs(dy)):
        return set()
    step = lambda z: (z > 0) - (z < 0)
    return {
        (s[0] + k * step(dx), s[1] + k * step(dy))
        for k in range(1, max(abs(dx), abs(dy)))
    }

comparisons = 0
mismatches = []
for s, d in product(squares, repeat=2):
    expected = ray_interior(s, d)
    for x in squares:
        comparisons += 1
        if source_relation(s, d, x) != (x in expected):
            mismatches.append((s, d, x))
assert not mismatches, mismatches[:1]
print(f"Open-segment finite audit: {comparisons} triples; {len(mismatches)} mismatches.")
```

Observed result, exit status 0:

```text
Open-segment finite audit: 262144 triples; 0 mismatches.
```

This checks the exact finite encoding described above. It does not establish
attack/move legality, castling, histories, strategy determinacy, or the Lean
translation's correctness. Source/refinement proofs and full rule fixtures remain
future work. No SAT/SMT solver or nonexistence certificate was used.

## Review record and unresolved validation

Constructive pass: followed the rule/update/result dependency chain and matched
each definition group to the coverage table in `AUDIT.md`. Hostile pass: tested
the listed objections against the exact source; retained raw-position misuse
witnesses and missing proof obligations, while rejecting unsupported bug claims.
Both passes were performed in this chat; no independent agent or human review
is claimed.

The audit's result-totality and finite-key reasoning is mathematical analysis.
It has not been checked by Lean. The malformed-position witnesses are direct
definition unfoldings, not executed Lean examples. The PR author's reported build
is historical context, not a build reproduced here.

Pending future validation: reference extraction/port, Cryptids-toolchain build,
retained-definition correspondence, invariant and strategy lemmas, executable
move/terminal refinements, public-theorem axiom inspection, and independent
comparator checks. No claim that all M1 acceptance criteria are met follows from
the audit gates below.

Task gates in `GATES.md` concern the requested documentation-only audit. They
are manual because commands cannot decide the semantic coverage or the suitability
of the packaging plan. Their evidence identifies the reviewed sections and
repository checks rather than passing off a text-search oracle as proof.

Final document checks: source hash verified; local Markdown links resolved;
fenced blocks balanced; `git diff --check` clean; changed paths inspected against
the audit-documentation scope. The exact final check output is retained in this
chat's tool transcript. No `.lean`, Lake, CI, machine-table, or runtime source
file was changed.

[source]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/FormalConjectures/Books/Chess.lean
[util]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/FormalConjecturesUtil.lean
[lake]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/lakefile.toml
[toolchain]: https://github.com/bocowgill/formal-conjectures/blob/03536100b3d15e928f45649e7935f8c2b785337b/lean-toolchain
[fide]: https://handbook.fide.com/chapter/E012023
[pr]: https://github.com/google-deepmind/formal-conjectures/pull/5216
