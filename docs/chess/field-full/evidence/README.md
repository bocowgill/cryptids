# Accepted evidence

`current/` retains the official successful full run39722113405 at computation
commit270d3e6aeb7258e1c9871077cf3e8e4f7d9fc53d, including APIs, artifact ZIP,
logs ZIP, exact unpacked bytes, phase receipts and command fingerprints.
`history/` preserves 29 development runs: 19 failures, nine component/profile
successes and one cancellation. Those are development evidence, not substitutes
for the complete successful run.

`review/` is a byte-identical promoted six-file sealed independent model advisory.
Its checker validates current source/frozen hashes, official provenance, archive
integrity, every phase/command receipt, saved fixture/accounting scope and history.
It performs metadata/hash checks only, without Lean, execution or counting.

```sh
python3 docs/chess/field-full/evidence/review/check_saved_evidence.py
```

A copied review folder works with `--root /absolute/repo/path` and
`--evidence /absolute/packet/path`. Deliberate rejection modes are `--negative
source`, `entry`, `claim`, `receipt`, `missing-phase` and `seal`; each must exit1.
`root-review-replay.json` records root's independent positive and six negative
checks, copied-folder replay and the prior accepted checker. The separate
`root-phase-replay.json` records root's phase receipt inspection and local frozen
hash check. These parent receipts do not claim a second local proof build.

The advisory's seal binds the review files and computation packet, rather than
asserting human approval, a new formal proof checker or current live GitHub status.
Lean's successful kernel builds and audited dependency closure are the formal
verification evidence. Regenerate substantive evidence remotely if source changes.
