# M5 acceptance ledger

Scope: the verified compilation backend and four finite branching games. Frozen reference
`chess-reference-v1` and M2–M4 mathematical/computational sources remain fixed. Full chess
translation, M6/M7, PR creation and outreach are outside this milestone.

| Gate | Required evidence | Status |
|---|---|---|
| A — Adequate source language | Finite-control multi-stack semantics; arithmetic/list/fixpoint adequacy; explicit storage and control support | Passed |
| B — Simulation | Actual supported-language lowering, both halting directions and no accidental finite stutter | Passed |
| C — Initialization and invariants | Blank writer reachability; malformed data; arbitrary stack growth; unconditional draw loops | Passed |
| D — Branching examples | White win, Black win, draw and a White-winning leaf refuted by Black | Passed |
| E — Exact artifacts | Literal kernel proofs, four canonical tables/counts/hashes, native regeneration, literal export, independent target and mutation controls | Passed |
| F — Regression/freeze | Exact M1–M4 source hashes, reviewed integration-only deltas, default build and all prior verifiers | Passed |

Reproduce with:

```sh
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m5.py
ELAN_NO_UPDATE_CHECK=1 python3 scripts/verify_chess_m5.py --baseline
```

All six M5 acceptance gates passed on implementation
`b3f5e29eebcb96ebdebf08ebf746a0dbae01a140`. Complete outputs and exact input hashes
are retained in [results.json](results.json); [RESULTS.md](RESULTS.md) gives the proof guide.

The default repository build and `python3 verify.py` also pass. The older repository
sandbox comparator requires Linux namespaces and cannot run on macOS. Its fork
[Linux CI run](https://github.com/bocowgill/cryptids/actions/runs/39380457555) remains in
progress and is not claimed as passed. M5's separate independent target checker,
including both semantic mutation controls, passed locally.
