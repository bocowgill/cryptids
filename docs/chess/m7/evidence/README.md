# M7 retained verification evidence

All Lean, native export, exhaustive table processing and regression checks ran on
remote Linux. These files preserve the actual reports and official artifacts,
including unsuccessful runs. Local rechecking reads metadata, source hashes and
these small archives; it does not execute Lean or process the chess table.

| Directory | Evidence and acceptance role |
| --- | --- |
| `bootstrap/` | First complete proof suite and proposed snapshot/map; proposal-only, insufficient for final acceptance. |
| `current/` | Actual implementation `088988f`: successful proofs, independent target, semantic controls and exhaustive table identity. The whole workflow failed later during regression setup; its recorded conclusion remains `failure`. |
| `regressions/` | Unchanged baseline wrapper after fetching complete pinned Mathlib, at helper-only commit `1c3be1c`; requires identical 192 core input hashes. |
| `original-ci/` | Entire original Cryptids CI, attempt 2, successful on `088988f`; supplementary regression coverage. |
| `failures/` | Six early implementation/proof attempts, original CI download failure, and the incomplete Mathlib-cache failure. |
| `review/` | Independent reviewer checks and final provenance seal, copied unchanged from the referee. |

The accepted computation inputs are fixed in each proof, definition, table and
baseline report. The extra regression workflow is hashed separately in its
`regression-checkout.json`. It changes setup without changing those 192 inputs.
The earlier failed whole run is never treated as a successful whole workflow.

`current/archive-entries.json` identifies every entry of the official artifact
ZIP, its digest, and its retained report or current repository output. A cached
`bootstrap.json` in that ZIP is explicitly excluded from final acceptance. The
official ZIP digest is checked against the saved GitHub API artifact metadata.
`regressions/` follows the same inventory convention. Log ZIPs retain actual
remote completion tokens and diagnostics.

After the regression evidence is present, run the lightweight independent check
from any directory:

```sh
python3 docs/chess/m7/evidence/check_evidence.py
```

It checks both official archives, actual run/step status, current core hashes,
172 frozen baseline hashes, separately pinned orchestration, all ordered range
records, independent byte/gzip completion, control outcomes and failure records.
It does not repeat the remote table sweep. The mathematical Lean proof and its
audits remain distinct from the native/file-I/O artifact verification boundary.

The complete canonical candidate manifest is
[`current/candidate-table-manifest.json`](current/candidate-table-manifest.json).
The table itself is exactly recoverable from the retained M6 literal parts and
the fixed [M7 quotient map and extractor](../../../../artifacts/chess_m7/README.md).
See [results](../RESULTS.md), [independent review](../REVIEW.md) and
[research history](../RESEARCH.md) for interpretation and costs.
