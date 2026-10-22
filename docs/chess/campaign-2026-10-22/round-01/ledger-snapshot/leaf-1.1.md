# Generic binary return-control route
OWNS: docs/chess/campaign-2026-10-22/round-01/GENERIC-ROUTE.md, .unlazy/chess-goal-20261022-r01/gates/leaf-1.1.md

Scope: Identify the exact generic compile/semantics proof interface, safe selective return allocation and optional unconditional-move fusion. State necessary invariants and first obstruction.

- [x] G1: Source-cited report identifies an exact implementable route and its full-machine proof obligations.
  EVIDENCE: Parent read GENERIC-ROUTE.md and LocalCertificate.lean: exact row certificate applies to arbitrary tape and missing transitions. Source-only route accepted, no proof checked.
- [x] G2: Adversarial source review identifies edge cases, cost accounting and any decisive obstruction without claiming unperformed computation.
  EVIDENCE: Parent reviewed four passes and challenged zero-return and terminal-write cases; both explicitly retained. Explorer capacity error occurred after report saved; parent completed manual review.
