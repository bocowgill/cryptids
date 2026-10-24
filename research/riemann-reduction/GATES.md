# Gates: bounded Riemann reduction audit

OWNS: research/riemann-reduction/**

Scope: audit the current accepted machine and propose one bounded optimization pilot.
All gates use manual source/provenance review. No candidate is implemented here.
Remote execution budget for this audit: zero compute jobs, zero proof replays,
zero generated candidates. Public metadata/log retrieval is read-only.
Local work: lightweight source reads, Git provenance, small-file hashes and documents.

- [x] G1: Independent branch is safely based on freshly inspected upstream main.
  EVIDENCE: Manual review 2026-10-24; BASELINE records clean detached initial HEAD,
    fresh main resolution/fetch at 6c28d852, unused branch creation and stable chess HEAD.

- [x] G2: Baseline pins literal table, toolchain, sources and retained verification evidence.
  EVIDENCE: Manual review 2026-10-24; BASELINE and evidence/ record raw hashes,
    exact historical test commits, successful kernel logs, scoped zero-diff comparison
    (exit 0) and zero new Lean replays. Third-party claims are separately labeled.

- [x] G3: Every physical state has exactly one accounting row, with attribution limits.
  EVIDENCE: Manual source/table review 2026-10-24; STATE-ACCOUNTING and state-ledger.tsv
    enumerate actual IDs 0..94, both cells and disjoint role charges totaling 95.
    Initializer sharing and unknown exclusivity are explicit; no executable census claimed.

- [x] G4: Ranked opportunities name savings hypotheses, proof contracts and obligations.
  EVIDENCE: Manual review 2026-10-24; OPPORTUNITIES ranks six concrete routes with
    conditional whole-machine savings, difficulty/effort and named old/new proof contracts.

- [x] G5: First pilot has complete counting, resource limits and acceptance/rejection gates.
  EVIDENCE: Manual review 2026-10-24; PILOT fixes the old-53 bypass operator, one candidate,
    conditional 94-state accounting, seven staged gates, 3180-second/6-GiB free remote cap
    and no retry. Unbounded encoding closure and final RH theorem are required.

- [x] G6: Report and checkpoint record failures, evidence limits and the next concrete task.
  EVIDENCE: Manual review 2026-10-24; REPORT and CHECKPOINT separate static exclusions
    from unexecuted experiments and name the pop/return encoding kernel as the next task.

- [x] G7: Final scope review confirms no accepted source or chess campaign change.
  EVIDENCE: Manual final review 2026-10-24; Git status contains only this research directory,
    worktree listing retains chess at b971fa888c84, and all mutation calls were scoped to
    this branch/documents. No job, goal, automation, outreach or upstream-write tools used.

These seven met gates certify completion of the source audit deliverables only.
They are manual evidence reviews, not a fresh Lean or executable census certificate.
Unmet: zero. Abandoned: zero. No smaller machine has passed a verification gate.
