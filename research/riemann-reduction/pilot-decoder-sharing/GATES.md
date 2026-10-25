# Gates: authorized decoder-sharing pilot

Historical first-job integration ledger. The separately authorized retained-witness
verification succeeded; see [verify-02/RESULT.md](verify-02/RESULT.md) and its gates.
The original failed producer and unexecuted first-job audit remain historical facts.

OWNS: scripts/riemann_share/**, lakefile.riemann-share.toml,
  .github/workflows/riemann_share.yml, research/riemann-reduction/**

One solo execution leaf: prepare the fixed family, run one free remote job,
retain its exact outcome, then preserve the hold. No local executable mathematics.
The original proposal remains unchanged as the approved contract.

- [x] D1: The remote producer implements exactly the approved 30 aliases and caps.
  EVIDENCE: Manual source/provenance review; producer 8f3bda334456, family.json has
    the fixed ordered pairs; provenance pins original sources; remote baseline diff
    passed. No candidate was exported; the source transport used skip CI.
- [x] D2: Exactly one free job runs with no retry and records actual resource use.
  EVIDENCE: Run 40141846969, job 121015053991, attempt 1 on ordinary public-fork
    ubuntu-24.04. resource-summary records 332.146s and sampled 5510496256-byte
    aggregate peak; no resource stop. Kernel exit 1 ended execution; no retry.
- [x] D3: Every fixed alias receives a reproducible typed-word disposition.
  EVIDENCE: aliases.jsonl and screen.json record all choices and finite witnesses;
    independent-replay.json confirms all 30 failures, full tapes and corruption
    controls, 40050 combined evaluations. Node checked the generated witness list.
- [x] D4: The job returns certified counterexamples, a complete RH certificate,
  or the earliest exact obstruction with unexecuted obligations explicit.
  EVIDENCE: RESULT and kernel.log retain the precise Decidable synthesis failure
    at ShareCertificate.lean:52:2. The batch is explicitly unverified; audit,
    forbidden-axiom/kernel controls and comparator did not run. The exact-obstruction
    outcome is met; formal certification is not claimed or silently abandoned.
- [x] D5: Evidence is retained and baseline, historical proof evidence and Chess
  pause are preserved; broader search remains held.
  EVIDENCE: Artifact 12579470236 retained intact and extracted; measured SHA-256
    equals GitHub digest f976adbed2c07f18...; accepted-source and old-runner/evidence
    Git diffs exit 0. The historical Chess pause file comparison exits 0; no Chess
    action was taken. Final report holds broader search and every further RH job.

These are manual evidence-integration gates: each reviews external job artifacts
and scope, rather than running the mathematics locally. No met gate implies an
RH saving unless the full public theorem and all certification checks pass.
Manual execution-integration gates: 5 met, 0 unmet, 0 abandoned. The failed Lean
proof remains failed; these gates certify only completion of the bounded task
at its explicitly allowed exact-obstruction outcome.
