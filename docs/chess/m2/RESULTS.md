# M2 completion record

Implementation commit: `3fe6082385cdbf5136a02af43ea61aaab8e5de13`.
Branch: `codex/chess-executable-m2` in `bocowgill/cryptids`.
Reference: unchanged `chess-reference-v1`, based on M1 commit
`1bb98ba36bd94a63ac203b4e4630e88b3eaf42c3`.
Toolchain: unchanged `leanprover/lean4:v4.35.0-rc4` and pinned Lake manifest.

The implementation and documentation satisfy M2's six acceptance gates. Exact
tested input hashes, observed perft counts, and command-output fingerprints are
retained in `results.json`. Commands were executed directly during this task;
the gate ledger records their evidence. The ledger's status/lint tools do not
themselves establish proof or test correctness.

| Check | Observed result |
| --- | --- |
| Focused build with `--wfail` | Passed; 3,138 jobs; no new warnings |
| Public contract and dependency audit | Passed; 152 M2 declarations; 3,328 declarations in the traversed dependency closure, including roots |
| Permitted axioms | Exactly `propext`, `Classical.choice`, `Quot.sound`; no other axioms, unsafe/partial dependency, or open draw theorem |
| Trust negative control | Explicit `sorryAx` root rejected with `Forbidden axiom: sorryAx` |
| Source-scan negative controls | `sorry`, `admit`, custom axiom syntax, and `native_decide` each rejected |
| Executed rule fixtures | 164 assertions passed |
| Independent legal-move-tree counts | All 22 expected counts matched across seven layouts |
| Frozen reference check | 385 Chess declarations and 2,728 dependency declarations matched; semantic negative control rejected; all frozen hashes matched |
| Full default build | Passed; 4,051 jobs; only the existing 22 placeholder warnings in unchanged `Challenge.lean` |
| Diff and integration review | No whitespace errors; executable API imported by `Cryptids.lean`; both M1 and M2 verifiers registered in CI |

Reproduce with:

```sh
env ELAN_NO_UPDATE_CHECK=1 lake --wfail build Cryptids.Chess.Exec Cryptids.Chess.Fixtures
env ELAN_NO_UPDATE_CHECK=1 lake env lean --run scripts/AuditChessM2.lean
python3 scripts/verify_chess_m2.py
python3 scripts/verify_chess_reference.py
env ELAN_NO_UPDATE_CHECK=1 lake build
```

The central contracts are `Chess.Exec.mem_legalPlies`,
`Chess.Exec.legalPlies_nodup`, `Chess.Exec.decode_applyBoard`, and
`Chess.Exec.decode_applyPly`. They quantify over every raw position and move.
Both full-position round trips and the initial encoding are checked.
`invariant_applyPly` transports reference invariant preservation;
`reachable_applyPly` proves exact history closure under the reference's legal
game-action condition. No unproved king, pawn, or historical-data invariant is
silently assumed by the executable refinement.

This is a deliberately exhaustive move-generation baseline, not a practical
chess solver. The regression evidence is bounded; the unrestricted claims come
from Lean proofs against the frozen specification. Rule fidelity beyond that
specification is supported by the M1 audit and independent fixtures, not claimed
as a complete formal derivation from the English FIDE Laws.

M3–M7 remain unstarted. There is no new game adjudicator, strategy evaluator,
compiler, machine table, issue, upstream PR, or outreach from this milestone.
