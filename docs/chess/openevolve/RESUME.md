# Completed OpenEvolve pilot checkpoint

Branch: `codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`.
The pilot is complete: **392,046,822 → 392,046,821 states**, with the full paid
blank initializer and the unchanged theorem that the machine halts iff the frozen
initial chess position is not drawn. All 9 acceptance gates are met, none unmet
or abandoned. See [RESULTS.md](RESULTS.md), [REVIEW.md](REVIEW.md) and the
[final independent review seal](evidence/review/seal.json).

Implementation commit: `e2888bf3d0ac9ff13119d65aa6ae9a66cec51709`.
Accepted M7 baseline: `ed9d02f6e5877846e5bd3eaf4c5b6fd95891a56e`.
All 192 frozen computation inputs in `baseline-pins.json` remain unchanged.

Core run [39542309855](https://github.com/bocowgill/cryptids/actions/runs/39542309855)
passed strict proofs, native dependency audit, controls, artifact correspondence,
M7 regression and actual OpenEvolve search. Its overall conclusion remains failure:
the final legacy baseline timed out after 3,600.15 seconds during M5 executable
verification. Its authenticated 61-entry archive is retained in `evidence/current`.
Baseline-only run
[39548653262](https://github.com/bocowgill/cryptids/actions/runs/39548653262), at
`c7d3ff318ef8beda1e41f3185013b03ce5f2290b`, completed the unchanged baseline CLI
in 2,578.28 seconds. Its three-entry archive is in `evidence/baseline`. Both sets
of evidence bind the same 17 computation and 192 frozen hashes. The separately
sealed helper changes orchestration only. Earlier failures remain in
`evidence/history`; do not relabel the failed core workflow as a green whole run.

Five real model requests ordered a supplied six-policy family after its baseline.
The successful terminal-return policy was selected third. Six evaluations,
4,081 tokens, raw feedback, checkpoints and exact dependency pins are retained.
We supplied the optimization and universal certificates; no autonomous invention,
proof synthesis or advantage over enumeration is established. No paid model API
was used; runner billing was not measured. No new expanded table was generated.

No remote heavy work remains running for this pilot. Do not restart it to inspect
the result. These commands only inspect saved evidence and file hashes:

```sh
python3 docs/chess/openevolve/evidence/check_evidence.py
python3 docs/chess/openevolve/evidence/review/validate_review.py
python3 scripts/chess_openevolve/verify.py --metadata
```

Any future Lean/Lake/LSP/LeanProbe work, model inference, native execution, fixtures
or table sweep must remain remote. Preserve the frozen reference and failure
provenance. A future checkpoint-resumed search needs explicit restoration of adapter
novelty and token/proposal budgets; this pilot tested fresh bounded execution only.
Outreach, new PRs, upstream writes and later milestones remain on hold.
