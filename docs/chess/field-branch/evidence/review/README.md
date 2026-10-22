# Independent return-branch review

This directory contains independent model advisory review. It is not human approval or formal verification performed by the reviewer. Lean compilation, safe-dependency auditing, numeric-row replay and state-count execution are remote evidence. Locally the reviewer inspects source, hashes bytes and validates saved metadata and receipts only.

After the final successful official evidence is retained and this review is sealed, run:

```sh
python3 check_saved_evidence.py --root /absolute/path/to/cryptids --evidence /absolute/path/to/field-branch/evidence/current
```

The checker is portable with this complete directory. It verifies its seal and exact source binding, frozen dependencies, official run/job/artifact metadata, archive CRCs and entry hashes, every phase and command receipt, genuine false-contract rejection, fixture scope, corruption-control outcomes, declared count receipts and exported-row byte hashes. It never parses the numeric row JSON or runs Lean, native code, machine fixtures or count computations. Literal runtime/shared source constructor totals in the remote fixture detail are descriptive inventory; they do not certify compiler coverage.

Controls `source`, `entry`, `claim`, `receipt`, `missing-phase` and `seal` must each fail with exit 1 when passed with `--negative-control`. Their exact outputs are retained in `negative-controls.json` once R2 passes. The root owner should independently replay the sealed checker and all controls after copying the directory to its public destination.

The certified full path begins at the accepted return entry, executes normal2/main-pop, and executes `ret s003` through arrival at its actual normal3 or reverse-push successor. Those successor bodies are outside this boundary. Every retained and added control is charged; no full chess machine construction or full-machine state saving is asserted. Final public summaries, the integration assessment, retainer, status and development history are reviewed extras once declared stable. The root owner's `REVIEW.md` and `root-check.json` are intentionally outside the independent seal.
