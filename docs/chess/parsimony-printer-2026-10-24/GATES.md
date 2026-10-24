# Gates: bounded Parsimony printer pilot

OWNS: scripts/chess_parsimony_20261024/**, docs/chess/parsimony-printer-2026-10-24/**, .github/workflows/chess_parsimony_printer_20261024.yml

Scope: Measure a complete replacement printer for the exact accepted chess packet,
including every extraction, cleanup, error and connection control, before any Lean
certification. The older quotient campaign and its goal remain paused. This is
the user's separately authorized bounded experiment, not an automatic resumption.

- [ ] G1: Remote provenance binds the exact accepted packet, unchanged accepted pins and pinned Parsimony source.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_PACKET_PROVENANCE_PASSED
  EVIDENCE: pending; execute this shared remote oracle once, not once per gate

- [ ] G2: A complete binary printer table has no unresolved labels and every newly allocated control is counted exactly once.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_COMPLETE_PRINTER_CENSUS_PASSED
  EVIDENCE: pending

- [ ] G3: Independent checks reconstruct the entire exact packet from the emitted data transitions and reject real corruptions; physical startup fixtures check full tapes and heads.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_PACKET_AND_FIXTURES_PASSED
  EVIDENCE: pending

- [ ] G4: A retained decision includes all replacement and retained costs, measured net full-machine savings, resource costs and explicit unproved certification obligations.
  CHECK: python3 scripts/chess_parsimony_20261024/pilot.py
  EXPECT: PARSIMONY_NET_SAVINGS_ASSESSED
  EVIDENCE: pending

- [ ] G5: Exact run, source hashes, generated artifacts, command logs, failures and next actions are retained and pushed in a recoverable checkpoint.
  EVIDENCE: pending; manual transport/provenance review after the bounded run

## Fixed boundaries and budgets

Accepted machine remains 769,344 states: writer 173,642; retained suffix 595,702.
Packet is the accepted 173,641-byte ASCII bit string, SHA-256
`ab1f8764749765bfb0d44b22a999d7907345d2648bf478092a276cf8df71c2d8`.
Pin Parsimony commit `7c199dbe0c82f0b9cc1adfbdc2b48fee3fef53aa`.
Do not change its source or any accepted/frozen source or historical evidence.

Use only a manual workflow on the existing free GitHub-hosted ubuntu-24.04 runner,
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
