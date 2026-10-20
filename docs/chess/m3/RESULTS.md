# M3 completion record

Date: 2026-10-20. Implementation revision:
`9115a213a1203fde1e9b4725e1b0b0eee6b3426d`.
The mathematical implementation is commit
`4aeb126fae44d86fe695f93e821eacefe3bac4f4`; the following commit makes the
verification entry points build their standalone prerequisites.
Branch: `codex/chess-adjudication-m3` in `bocowgill/cryptids`.

The reference remains unchanged `chess-reference-v1`. Every M2 input hash recorded
in `docs/chess/m2/results.json` also matches. The Lean `v4.35.0-rc4` toolchain and
Lake pins are unchanged. `results.json` retains exact tested M3 input hashes,
command output, prior-milestone checks, and evidence fingerprints.

| Check | Observed result |
| --- | --- |
| Focused build, warnings treated as errors | Passed; 3,145 jobs, including the unchanged M2 fixture adapter |
| Exact public contract checks | Passed: projection/path lifting, deadness, full history, repetition counting, claims, outcomes, and legal actions |
| Safe declaration/dependency audit | Passed; 174 safe M3 declarations, 8,279 declarations in their dependency closure including roots |
| Axioms in that closure | Exactly `propext`, `Classical.choice`, `Quot.sound` |
| Generated recursion artifact | Exactly one Lean-generated implementation separately inventoried; absent from the safe mathematical dependency closure |
| Negative dependency controls | `sorryAx`, the open draw conjecture, and the compiler recursion artifact each rejected as proof dependencies |
| Source-scan controls | Explicit holes, custom axioms, native proof shortcuts, unchecked recursion, and compiler replacements rejected |
| Runtime fixtures | 55 recorded assertions passed, plus legal-ply checks while constructing the knight-cycle histories |
| M1 correspondence/freeze | Passed; 385 declarations and 2,728 dependencies matched; semantic negative control rejected; frozen hashes matched |
| M2 compatibility | Every recorded input unchanged; the 152-declaration, 3,328-dependency theorem audit passed |
| Full default build | Passed; 4,058 jobs; only the existing 22 placeholder warnings in unchanged `Challenge.lean` |
| Integration | Public aggregate imported by `Cryptids.lean`; M3 verifier and path filters added to CI; whitespace checks passed |

Reproduce from a configured checkout:

```sh
python3 scripts/verify_chess_m3.py
python3 scripts/verify_chess_m3.py --baseline
```

The first command builds both adjudication and its fixture adapter, checks the
theorem contracts, runs the dependency controls and fixtures, and verifies source
stability during the run. The baseline command verifies the M2 input hashes,
builds the default targets, verifies the frozen reference, and reruns the M2
theorem audit. These entry points establish their required compiled modules
instead of assuming artifacts from an earlier milestone are cached.

`DESIGN.md` gives the exact domains and proof chain. The central contracts are
`Chess.Adjudication.isDead_iff`, `repeated_iff_occurrences`,
`canClaimThreefold_iff`, `canClaimFiftyMove_iff`, `automatic_some_iff`, and
`mem_legalActions`. Outcome uniqueness, terminal-action exclusion, and action
existence are proved for all raw games, stronger than the required reachable-game
domain. No unproved reachable-position invariant or draw conjecture is assumed.

The exact dead-position search uses the complete clock-free legal-move graph.
It is mathematically total but can be astronomically expensive. Runtime checks
include a stalemate, a current mate, a one-ply mating continuation, a small
directed cycle, and an explicitly unreachable raw lone-king layout that exercises
automatic deadness despite having raw legal plies. Exhaustive practical endgame
coverage is not claimed. Compiled execution relies on Lean's compiler/runtime;
the generated recursion implementation is documented and separately audited,
not presented as an additional kernel theorem or axiom.

Six acceptance gates are met, with zero unmet and zero abandoned. The conditional
alternative-game preservation route in the roadmap is unnecessary because exact
deadness was implemented and proved directly. M4–M7 remain unstarted; outreach
remains on hold.
