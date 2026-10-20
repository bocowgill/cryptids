# M4 completion record

Date: 2026-10-20. Implementation revision:
`0e62d56fdb5971900250949fa82affb5734c68b9`.
Branch: `codex/chess-evaluator-m4` in `bocowgill/cryptids`.

M4 is complete. The reference remains `chess-reference-v1`. Every recorded M2 and M3
input hash still matches, and the toolchain remains Lean `v4.35.0-rc4` with unchanged
Lake pins. `results.json` preserves exact checked input hashes, focused verification
output, baseline regression output, and gate output fingerprints.

| Check | Observed result |
| --- | --- |
| Focused build with warnings as errors | Passed; 3,152 jobs including the unchanged fixture adapter |
| Finite play | Exact finite action enumeration and a uniform `8*N+1` bound on played prefixes and prefixes ending in claims, including terminal endpoints |
| Total evaluator | Well-founded recursion over full games; no fuel cutoff or fallback result |
| Strategic contracts | Globally legal pointwise policies, result existence/uniqueness, optimality against every legal opponent, and draw/White-win/Black-win characterizations |
| Safe declaration/dependency audit | 111 safe M4 declarations; 8,713 declarations in their full mathematical dependency closure, including roots |
| Permitted axioms actually used | Exactly `propext`, `Classical.choice`, and `Quot.sound` |
| Compiler recursion artifacts | Two exact generated artifacts separately inventoried; neither is a mathematical dependency |
| Dependency negative controls | `sorryAx`, the open draw conjecture, and each generated recursion artifact rejected |
| Source-scan controls | Proof holes, custom axioms, native proof shortcuts, user-written unsafe/partial definitions, and compiler replacements rejected |
| M4 executable fixtures | 21 assertions passed, including both players choosing wins, full-history sensitivity, and a claim improving loss to draw |
| Frozen correspondence | 385 Chess declarations and 2,728 dependencies matched the pinned source; semantic negative control rejected |
| M2 regression suite | All 164 rule assertions and 22 perft counts across 7 positions passed; theorem audit passed |
| M3 regression suite | All 55 assertions and dependency negative controls passed; theorem audit passed |
| Full default build | Passed; 4,065 jobs; only 22 pre-existing placeholder warnings in unchanged `Challenge.lean` |
| Integration | Public aggregate imported by `Cryptids.lean`; M4 verifier and script path filters added to CI; whitespace checks passed |
| Acceptance ledger | Six gates met, zero unmet, zero abandoned |

Reproduce from a configured checkout:

```sh
python3 scripts/verify_chess_m4.py
python3 scripts/verify_chess_m4.py --baseline
```

The focused verifier builds its prerequisites, checks exact public theorem types and
all safe M4 dependency closures, rejects four deliberately bad dependency roots, runs
fixtures, and confirms source stability. The baseline verifier checks all prior M2/M3
input identities, builds default targets, verifies the frozen reference, and reruns
both earlier executable regression suites. The fixture parser is an unchanged test
adapter; it is not a premise of the correspondence proofs.

The principal contracts are `Chess.Evaluation.uniform_play_bound`,
`uniform_claim_bound`, `rank_play_lt`, `policy_legal`, `strategy_legal`,
`initial_result_unique`, `policy_guarantee`, `optimal_pair_result`,
`solve_initial_draw_iff`, `solve_initial_white_win_iff`, and
`solve_initial_black_win_iff`. The audit also pins the expanded quantifiers of
`CanForceWin` for both colors. [DESIGN.md](DESIGN.md) explains the proof chain,
raw-game versus reachable-history domains, compiler artifacts, and runtime limits.

The standard initial position's value remains unknown to this campaign. Its evaluator
was not run to completion. This milestone provides no verified compiler or binary
Turing machine, and makes no practical chess-solving claim. M5–M7, new issues/PRs,
and outreach remain on hold.
