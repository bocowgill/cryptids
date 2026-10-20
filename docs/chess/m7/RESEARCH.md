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
