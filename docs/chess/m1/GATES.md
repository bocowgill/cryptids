# Gates: M1 chess specification audit

OWNS: docs/chess/m1/**, ROADMAP.md

Scope: Audit the pinned PR specification, document supported findings and proposed corrections, and recommend packaging without implementation or outreach.

- [x] G1: Audit inputs and rule edition are pinned with verifiable provenance.
  EVIDENCE: Manual review of AUDIT.md scope and EVIDENCE.md provenance; PR head re-read; archived 25395-byte source recomputed to Git blob 8018d10a3bfcd375a17c76599cfd3ceafe3e930d and its recorded SHA-256; fixed 2023 handbook inspected.

- [x] G2: Every definition group is reviewed for rule fidelity, quantifier meaning, and relevant boundary cases.
  EVIDENCE: Manual constructive review of all 640 source lines; AUDIT.md contains full definition-group coverage and quantified-strategy analysis; documented geometry replay independently checked all 262144 square triples with zero mismatches. No whole-model formal verification claimed.

- [x] G3: Each reported defect or gap has a precise location, justification, impact, and proposed correction; suspected false positives are triaged.
  EVIDENCE: Manual hostile review recorded as findings F1–F6 and twelve rejected objections in AUDIT.md; two raw-position witnesses retained; no confirmed reachable-game semantic error asserted; each finding distinguishes integration/proof/API scope from rule correctness.

- [x] G4: Packaging recommendation specifies modules, dependencies, provenance, trust boundaries, and required future proof obligations.
  EVIDENCE: Manual review of PACKAGING.md against local Lake/import/machine/challenge/comparator/CI files and pinned FormalConjectures imports; definitions-only extraction, namespace, version mismatch, executable separation, independent challenge, licensing, and deferred proof/build gates specified.

- [x] G5: Roadmap records the audit outcome while preserving pending reference criteria and the hold on code and outreach.
  EVIDENCE: ROADMAP.md marks source review complete and leaves formal invariants, port/build/correspondence, and freeze pending; later milestones remain unstarted; current authorization and next-work text retain the implementation/outreach hold.

- [x] G6: Final document review and repository inspection confirm only audit documentation changed, with no implementation or outreach.
  EVIDENCE: Final self-review reconciled the user request against all deliverables; Python document checks resolved links and balanced fences, replayed the documented geometry computation, and checked changed/untracked paths against ROADMAP.md and docs/chess/m1/**; git diff --check exited zero; no Lean/runtime/configuration edits or issue/PR/message tools used.

All gates require manual review: source identity alone cannot establish an honest mathematical audit, rule fidelity, or a suitable packaging recommendation. Inspection commands and their observations are recorded in the evidence rather than treated as semantic proof oracles.
