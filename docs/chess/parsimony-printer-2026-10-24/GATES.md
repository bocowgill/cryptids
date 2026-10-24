# Gates: bounded Parsimony printer pilot

OWNS: scripts/chess_parsimony_20261024/**, docs/chess/parsimony-printer-2026-10-24/**, .github/workflows/chess_parsimony_printer_20261024.yml

Scope: Measure a complete replacement printer for the exact accepted chess packet,
including every extraction, cleanup, error and connection control, before any Lean
certification. The older quotient campaign and its goal remain paused. This is
the user's separately authorized bounded experiment, not an automatic resumption.

- [ ] G1: Remote provenance binds the exact accepted packet, unchanged accepted pins and pinned Parsimony source.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_PACKET_PROVENANCE_PASSED
  EVIDENCE: Both runs passed provenance internally, but the shared oracle exited 1; retained source manifests and failure logs are in evidence/probe-01 and evidence/pilot-02. This is not a passing gate.

- [ ] G2: A complete binary printer table has no unresolved labels and every newly allocated control is counted exactly once.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_COMPLETE_PRINTER_CENSUS_PASSED
  EVIDENCE: Corrected producer allocated the full standalone printer, but stopped before full-machine linking/census and emitted no success token; see RESULTS.md.

- [ ] G3: Independent checks reconstruct the entire exact packet from the emitted data transitions and reject real corruptions; physical startup fixtures check full tapes and heads.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_PACKET_AND_FIXTURES_PASSED
  EVIDENCE: Corrected run failed its guarded adapter positive control; no exact-boundary fixture suite completed. Run 40137052792, retained failure.txt and pilot-summary.json.

- [ ] G4: A retained decision includes all replacement and retained costs, measured net full-machine savings, resource costs and explicit unproved certification obligations.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_NET_SAVINGS_ASSESSED
  EVIDENCE: RESULTS.md records conditional allocations, resources and obligations, but the shared remote oracle exited 1 before full-machine census or its success token. No validated net reduction.

- [ ] G5: Exact run, source hashes, generated artifacts, command logs, failures and next actions are retained and pushed in a recoverable checkpoint.
  EVIDENCE: pending; manual transport/provenance review after the bounded run

ABANDON: G1 The shared two-run oracle failed; preserve its provenance successes as component evidence, not a zero-exit gate pass.
ABANDON: G2 The corrected adapter failed before the complete full-machine census; the predeclared two-run budget is exhausted.
ABANDON: G3 Exact boundary validation failed; retain the failure and diagnose before any newly authorized run.
ABANDON: G4 Conditional component sums are available, but a valid replacement and full emitted census have not been demonstrated.

## Fixed boundaries and budgets

Accepted machine remains 769,344 states: writer 173,642; retained suffix 595,702.
Packet is the accepted 173,641-byte ASCII bit string, SHA-256
`ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8`.
Pin Parsimony commit `7c199dbe0c82f0b9cc1adfbdc2b48fee3fef53aa`.
Do not change its source or any accepted/frozen source or historical evidence.

Use the path-triggered initial workflow and one manual correction on the existing
free GitHub-hosted ubuntu-24.04 runner,
contents:read, no paid resources, no local generation/counting/build/simulation,
and no outreach. Total experiment budget 600 seconds, group plus driver 6 GiB,
driver 512 MiB. Native compiler stage at most 60 seconds; physical full-packet
probe at most 120 seconds and a fixed step cap. Full-game startup is prohibited.
At most two remote runs: an initial construction/framing probe and, only after
diagnosing a specific obstruction, one corrected complete pilot. No unchanged
retry, resource-limit escalation or broad parameter search. Stop before Lean
certification; do not accept or announce a new certified chess machine.

A first raw framing probe may leave G2-G4 open until every bridge and cleanup
state is concretely constructed. A bounded full-printer simulation may report
incomplete execution; it must not be called a successful complete startup.
Analytic/executable reconstruction is finite evidence, not a Lean proof of the
extractor or full chess halting equivalence. Report those distinctions explicitly.
Assess material savings against the accepted 769,344 machine, not the uncertified
310,029 candidate. Preserve all output-boundary and full-machine obligations.
