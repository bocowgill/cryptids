# OpenEvolve pilot checkpoint

Branch: `codex/chess-openevolve-pilot`, fork `bocowgill/cryptids`.
Accepted baseline: M7 at `ed9d02f6e5877846e5bd3eaf4c5b6fd95891a56e`.
The frozen 192-input map is `baseline-pins.json`. Never edit those inputs.

The requested pilot targets one compiler routine and aims to save one binary state.
Until RESULTS.md records completed acceptance, treat 392,046,821 as a candidate.
No local Lean/Lake/LSP/LeanProbe, model inference, native execution or table sweep.
Use the Chess OpenEvolve pilot GitHub Actions workflow on this branch. Do not run
verification phase CHECK commands locally. `verify.py --metadata` only hashes files.

Remote phases are proofs, controls, artifact, M7 regression, actual model-backed
OpenEvolve search, then the original M1–M5 baseline. Their reports record exact
commands, outputs, exits, timing and source hashes. A green workflow is insufficient:
inspect the reports and their source/provenance binding. The first cold attempt’s
tee pipe masked a failed build; that result is explicitly excluded in evidence/history.
The current workflow has pipefail and the Python strict subprocess exit checks.

The finite search is intentionally a clean run with five model proposals and a
checkpoint each iteration. Never delete failure provenance to obtain a fresh run.
A resumed framework run would additionally need adapter novelty/budget restoration;
current search.py rejects reused model logs rather than silently restarting.
To retry the bounded pilot, use a new remote workflow run and retain the old run.

For recovery, inspect current remote job before launching another. Cancel redundant
Cryptids CI / M7 push jobs if the pilot already runs those regression commands.
Preserve all completed evidence; do not claim completion from queued work.
Outreach, new PRs, upstream writes and later milestones remain on hold.
