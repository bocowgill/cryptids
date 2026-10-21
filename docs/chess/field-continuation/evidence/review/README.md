# Independent continuation review

This directory contains independent model advisory review. It is not human approval or formal verification performed by the reviewer. Lean compilation, safe-dependency auditing, emitted numeric-row replay, and state-count execution are remote evidence. Locally the reviewer inspects source, hashes bytes, and validates saved metadata and receipts only.

After the final successful official evidence is retained and this review is sealed, run:

```sh
python3 check_saved_evidence.py --root /absolute/path/to/cryptids --evidence /absolute/path/to/field-continuation/evidence/current
```

The checker is portable with this complete directory. It verifies its seal and exact source binding, frozen dependencies, official run/job/artifact metadata, archive CRCs and entry hashes, every phase and command receipt, genuine negative-contract failures, fixture scope, corruption-control outcomes, declared count receipts, and emitted-row byte hashes. It never interprets the numeric rows or runs Lean, native code, machine fixtures, or count computations.

Controls `source`, `entry`, `claim`, `receipt`, `missing-phase`, and `seal` must each fail with exit 1 when passed with `--negative-control`. The reviewer records their outputs in `negative-controls.json`. The root owner should independently replay the sealed checker and these controls after copying the directory to its public destination.

The certified boundary starts at the accepted return entry and ends on arrival at `ret s003` after the actual normal2 main pop. Executing `ret s003` is outside the boundary. Every retained and added control is charged; no full chess machine construction or full-machine state saving is asserted.
