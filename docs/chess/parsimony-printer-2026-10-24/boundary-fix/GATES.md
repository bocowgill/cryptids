# Gates: bounded Parsimony boundary diagnosis and correction

OWNS: scripts/chess_parsimony_20261024/**, docs/chess/parsimony-printer-2026-10-24/boundary-fix/**, .github/workflows/chess_parsimony_printer_20261024.yml

Scope: The user authorized diagnosis and correction after the closed first pilot.
Preserve all previous evidence. Diagnose before changing the expected boundary;
validate exact tape, exterior and head, then count every full-machine state.
No Lean certification, outreach, paid resources or old-goal resumption.

- [x] D1: A remote trace records the failing unmodified boundary, independently reproduces it, and identifies a specific cause without dropping tape or exterior requirements.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py --phase diagnose
  EXPECT: PARSIMONY_BOUNDARY_DIAGNOSED
  EVIDENCE: Run 40138030294, producer d72ac3da4dbf747d35e598a92d165ebc64d09105; command exited zero with the required token. Both engines returned exact payload/exterior at head 33 after 3725 steps; prior oracle expected 34. Retained trace and gate-evidence.json bind the command, shell/CWD/PATH and output fingerprint.

- [x] V1: Corrected boundary and corruption controls plus all 261 physical fixtures pass in independent simulators; the exact unchanged chess packet is reconstructed.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py --phase pilot
  EXPECT: PARSIMONY_PACKET_AND_FIXTURES_PASSED
  EVIDENCE: Run 40138445160, producer 367b2fbebbd8b86a9e4a4b03e83832d680c0255a; zero exit and required token. All 261 full-tape/head/step fixtures, adapter/data corruption controls and entire packet reconstruction passed. The emitted printer is checksum-identical to the prior table. See gate-evidence.json and retained physical-fixtures.json.

- [x] V2: The complete emitted candidate is independently parsed, all added and retained states are counted, retained transitions match after relocation, and net savings are measured.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py --phase pilot
  EXPECT: PARSIMONY_COMPLETE_PRINTER_CENSUS_PASSED
  EVIDENCE: Same successful validation command and required token; Python/C++ both counted 609247 states, 1218494 cells and two missing cells. All retained rows roundtrip-match; actual invalid-target and truncated full tables rejected. Full-table SHA-256 b9cf384e5470f3c9f5c501bd8c13555f15d4ea134469f5d159cd1bdb363cbf45. See full-candidate-census.json and gate-evidence.json.

- [x] V3: Exact packet/pin provenance, bounded full-printer probe outcome, runtime/memory, accepted-versus-experimental counts and remaining proof obligations are retained without claiming certification.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py --phase pilot
  EXPECT: PARSIMONY_NET_SAVINGS_ASSESSED
  EVIDENCE: Same successful validation command and required token. Exact/frozen pins passed; 27.746 seconds total, driver peak 329804 KiB. Full probe stopped at 500000000 steps without startup completion. RESULTS.md distinguishes experimental saving 160097 from accepted saving zero and records structural proof/composition obligations. See gate-evidence.json for environment and output fingerprint.

- [ ] R1: Complete artifacts, logs, producer hashes, diagnosis, corrected sources and next steps are pushed in a clean recoverable checkpoint, with no pilot jobs left active.
  EVIDENCE: pending; manual archive/provenance and fork-ref review after terminal runs

## Bounds and accounting

Use only manual dispatches on the existing free ubuntu-24.04 GitHub-hosted runner.
First use one diagnosis run capped at 60 driver seconds; then one corrected
validation run capped at 600 driver seconds. Allow at most one additional 600-second
validation only for a newly observed, specifically diagnosed obstruction. No
unchanged retry, increased limits or broad parameter search. Keep the existing
6 GiB group-plus-driver and 512 MiB driver caps, native compilation at most 60
seconds, and full printer probe at most 120 seconds and 500,000,000 ordinary steps.
No full-game startup simulation. Diagnose and save results before assertions.

The whole-machine baseline remains the accepted 769,344 states, writer 173,642,
suffix 595,702. Count every new extractor, framing, cleanup, error and bridge
control exactly once. Do not count the retained decoder twice. Keep the exact
173,641-bit packet and every accepted/frozen pin fixed. A full printer probe that
hits its cap is incomplete evidence, not successful startup. Even passing finite
tests and census establishes no new certified machine or accepted saving.
