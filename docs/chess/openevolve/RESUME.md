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

Latest checkpoint: strict generic compiler + numeric bridge passed on 079cb6b
in CI 39537193950. That job terminated its concrete build with exit143 and no
artifact. Official termination logs are retained in evidence/history/079cb6b-termination.
Do not count it as successful concrete verification.

CI 39538987362 at d3fc872 built the inherited backend, then rejected the concrete
assembly when definitional normalization reached the 6144MiB Lean memory cap.
The generic proof passed. Its official artifact and diagnostic command record are
retained in evidence/history/d3fc872-bounded-failure. The repair proves equality
of arbitrary paid initializer packages symbolically before using the frozen input.

CI 39540527173 at bcc7ab9 elaborated the repaired assembly and semantics in a few
seconds, but strict warning handling rejected one overlong line. Its official
artifact is retained in evidence/history/bcc7ab9-style-failure. No search ran.

CI 39540999859 at a7c8432 passed the strict concrete build, then its interpreter
dependency audit reached the 6144MiB cap. Official evidence is retained in
evidence/history/a7c8432-audit-memory. The next repair compiles the identical
Audit.lean inspector to a native executable and uses the same positive and three
negative controls. The native process runs through lake env with an 8GiB address
space ceiling and a 900-second timeout; this differs from Lean's 6144MiB cap.
That 8GiBAS attempt failed reading toolchain metadata (official archive in
evidence/history/48c55c9-native-read-failure). A 16GiBAS retry records the file's
existence and succeeds with identical audit logic.

Current remote retry: CI 39542309855 at e2888bf3d0ac9ff13119d65aa6ae9a66cec51709.
It pins Ubuntu24.04, caps root Lean at6144MiB via lakefile.chess-openevolve.toml,
streams command output, clears restored transient reports, and restores only the
same .lake/packages + .lake/build paths that it saves. Proofs, native audit,
negative controls, artifact certificate, M7 regression and real model-backed
OpenEvolve search passed. The frozen M1–M5 baseline is running (started
2026-10-21T04:13:58Z). Referee R1 construction-only accepted; R2 awaits authentic
completed current reports. No model API credentials are needed by the public
remote CPU model.
