# M7 research and failed-attempt record

The roadmap's first optimization goal is one certified strict reduction, without
a numerical target or optimality claim. The selected route quotients duplicate
initial and halted-store Post controls. It preserves every live node/store pair,
all source semantics, the complete input and the paid initializer. No SAT/SMT
search or nonexistence result is used in this attempt.

## Retained remote attempts

- `077a8bb`, [run39494811233](https://github.com/bocowgill/cryptids/actions/runs/39494811233):
  generic source failed on unresolved sibling namespace names. Corrected the
  namespace opening; no theorem or machine semantics changed.
- `023e4c7`, [run39495699333](https://github.com/bocowgill/cryptids/actions/runs/39495699333):
  generic proof exposed explicit Fin-sum zero and default-state simplification
  obligations. Used the exact cast-add zero constructor and explicit ordinary
  initial configuration. No assumptions were added.
- `75f25b5`, [run39496217300](https://github.com/bocowgill/cryptids/actions/runs/39496217300):
  the generic quotient kernel build passed. The first actual M7 assembly build
  terminated with exit143 after frozen Image completed; this is not a successful
  chess proof. Its failure log is retained privately. An explicit symbolic
  initializer-state NeZero instance was added, following M6.
- `522d1c4`, [run39499548293](https://github.com/bocowgill/cryptids/actions/runs/39499548293):
  a direct assembly probe with 240-second/6144-MiB limits isolated kernel excessive
  memory consumption at `generated_states`. The first probe also inserted phase
  markers between docstrings and declarations, causing probe parser errors.
  Both diagnostics are retained. The count proof was switched to the frozen
  generic `Input.initialise_states body` certificate, as in M6; docstrings are
  stripped only from the disposable probe before inserting phase markers.


- `4c843c3`, [run39501243560](https://github.com/bocowgill/cryptids/actions/runs/39501243560):
  actual M7 assembly and its halting/count/initializer proofs passed the remote
  kernel. The separate row-table bridge failed because a module file imported
  the frozen legacy non-module Matrix file. Kept that bridge a legacy import
  consumer and built it separately; the mathematical assembly is unchanged.
- `5af498c`, [run39502074057](https://github.com/bocowgill/cryptids/actions/runs/39502074057):
  assembly, row-table bridge and foundation audit passed (63 roots, 48,672
  dependencies, only the three standard axioms). All three audit rejection
  controls behaved correctly. A finite fixture proof using `decide` could not
  reduce the well-founded graph lookup. Added the universal row-commutation
  certificate and used it for the same fixture statement; retained independent
  native enumeration of all 34 fixture row corners. This is a proof-method
  correction, without an added assumption or changed target.

These are implementation/build failures, not mathematical counterexamples to the
quotient theorem. The symbolic proof repair does not change the proposed machine.
Exact failed-step logs and their hashes are retained in
[evidence/failures](evidence/failures/manifest.json); source versions and remote
runs are recorded above. Later results must distinguish pending trials from completed
verification and report construction/verification cost separately from state count.

No current bound is claimed optimal. Larger reductions remain possible research
questions after the first strict improvement has been accepted. Outreach is held.

## First successful proof and bootstrap

`86b82c9`, [run39503052097](https://github.com/bocowgill/cryptids/actions/runs/39503052097),
passes the actual assembly, generic row/step/stop proofs, all seven proof-suite
checks, three audit rejection controls, 34 native row corners and the Python
literal oracle across all 120 intervals. The foundation audit covers 65 roots
and 48,674 dependencies, using only the three permitted standard axioms. The
remote native generator build took 1,223.32 seconds; target export took 78.47
seconds. Its result is explicitly `proposed_only`, not final M7 acceptance.

The official artifact archive has SHA-256
`57f8ceabd9f247de0cffc6c0d92bf98b78aa98c75d8fd1530611368ac3d614d2`;
its extracted entries were checked against that archive. The bootstrap fixes
initial graph node 0, hence raw root control 1. The snapshot and quotient map were
committed in `088988f` for the full fixed-target workflow. Pending independent
definition/mutation/sandbox, every-row and regression checks remain separate.

The first original Cryptids CI attempt at `088988f`
([run39506528743](https://github.com/bocowgill/cryptids/actions/runs/39506528743))
failed before compilation because the remote Lean release download encountered a
TLS connection error. Its log is retained in
[evidence/failures/original-fixed-tls.log](evidence/failures/original-fixed-tls.log).
The same source revision was retried without a code or toolchain change. This
network failure does not certify or refute any source theorem.

The original CI retry subsequently passed all steps on the same implementation
commit `088988f` (attempt 2). Its API metadata, step results and full log archive
are retained in [evidence/original-ci](evidence/original-ci/manifest.json). M1–M5,
the original comparator and blank-initializer checks pass. This regression result
is separate from the M7 wrapper and exact-artifact acceptance.

## Fixed target and complete table

At `088988f`, [run39506528766](https://github.com/bocowgill/cryptids/actions/runs/39506528766)
passed the current strict proof suite, independent fixed-target/dependency
comparison, all four kernel-valid semantic mutants and the supported Linux
sandbox comparator. All 392,046,822 extracted candidate rows matched the standalone
native reconstruction, and fresh gzip reproduction matched every one of 393
canonical parts. The exact raw stream hash is
`47a9730ccdcbdf0983951be91993ce1470b0109e75a347696786b70eda011c81`.
Extraction took 3,063.87 seconds; independent comparison/reproduction took
4,173.74 seconds. These are verification costs, not an initial-chess runtime.

That whole workflow nevertheless concluded **failure**. Its subsequent unchanged
baseline wrapper compiled the original pinned reference, which imports umbrella
`Mathlib`, after setup had fetched only particular Mathlib module roots. It stopped
because `Mathlib.olean` did not exist. This setup defect neither invalidates the
completed source/table checks nor counts as a passing regression suite. The exact
log is retained in
[fixed-baseline-mathlib-cache.log](evidence/failures/fixed-baseline-mathlib-cache.log).

The correction is a separate, explicitly pinned remote regression helper at
`1c3be1c`, fetching the complete pinned Mathlib cache before invoking the unchanged
baseline wrapper. No production source, fixed target/map, existing checker or
primary workflow changes. All 192 core computation hashes must agree across the
completed proof/definition/table reports and the new baseline report. The helper
workflow hash and exact checkout are recorded separately. This avoids repeating
two hours of already completed table work merely to repair regression setup.
Final acceptance still requires its actual successful report, authenticated
archive and independent seal; the earlier failed whole-run result is retained.

During final evidence review, the referee found a light local metadata-checker
condition that incorrectly required nonempty rejection markers on successful
mutant kernel builds. Those records legitimately have empty markers; the rejection
marker is required only for the exact-comparison rejection. The checker was
corrected. No remote proof, machine, artifact or control outcome changed.

## Successful regression completion

[Run39527113752](https://github.com/bocowgill/cryptids/actions/runs/39527113752)
at helper-only commit `1c3be1c` completed successfully. The unchanged baseline
wrapper took 2,287.08 seconds. All 192 core hashes in its baseline and checkout
reports exactly match the proof, definition and full-table reports and current
files. The separately recorded helper workflow hash also matches. Its official
artifact 12315800109 has SHA-256
`459319558e2fa81574f9df225868f0d42ac3704b946e42fa6b853513c23ba6e0`;
the ZIP digest and all three report entries were verified. Actual run/API,
reports, logs and archive are retained in
[evidence/regressions](evidence/regressions/run.json).

The complete independent root metadata/hash recheck passed and is retained in
[root-check.json](evidence/root-check.json). No source or table input changed to
obtain this passing wrapper. The failed earlier whole core run remains visible;
successful current component evidence is composed across the recorded runs.
