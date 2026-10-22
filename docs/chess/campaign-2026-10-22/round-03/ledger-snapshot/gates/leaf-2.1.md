# Bounded concrete quotient certificate scalability
OWNS: scripts/chess_body_20261022/certificate_pilot.py, docs/chess/campaign-2026-10-22/round-03/CERTIFICATE-PILOT.md

- [x] G1: Source generator/driver loads the complete measured map and quotient data and proposes ordinary kernel-checked row proofs against the actual accepted body, with no native_decide/sorry/axiom shortcuts.
  EVIDENCE: scripts/chess_body_20261022/certificate_pilot.py drafted with import-time remote guard, pinned complete data, typed Balanced.RowTree loaders, full count/cache proofs, forward actual-body RowAt, increasing both-bit samples, transitive safe-closure audits and deliberate addDecl(true) false-row rejection. Four source passes and independent static API review completed; no local generation/import/Lean/model/count/test execution. Runtime correctness remains G2.
- [ ] G2: Remote bounded data-load and increasing representative row proof measurements are retained, including correct failure classification and a kernel-rejected deliberately false row.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python scripts/chess_body_20261022/certificate_pilot.py --lakefile lakefile.chess-body-certificate-20261022.toml --output .lake/chess-body-certificate-20261022 --seconds 1200 --memory-gib 6
  EXPECT: Bounded body kernel certificate pilot passed
  EVIDENCE: pending root-owned remote scalability run. First obstruction exits nonzero and preserves its stage/log/source/resources; later stages and negative control may remain unrun. A retained obstruction is an experiment result, not this success oracle or a full quotient certificate.
