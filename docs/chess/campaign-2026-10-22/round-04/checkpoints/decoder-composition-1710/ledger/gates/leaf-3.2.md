# Exact paid structured decoder control
OWNS: Cryptids/Compilation/TableSeed/Controller.lean

- [x] G1: Complete source satisfies the finite-controller portion of PROOF-PLAN.md, without placeholders or accepted-file edits; four adversarial passes and interface review recorded.
  EVIDENCE: Complete structural draft captured in `9b50904c694d2a8f616fb94cf33e29e892917c17`.
  Source-only passes checked (1) physical allocation/order and all block offsets,
  (2) actual string-sorted consume destinations, (3) semantic branches, scanners,
  and cleanup rows, and (4) dependent finite bounds and local division partitions.
  Independent reviewer `table_allocation_review` reported no concrete issue in
  its final pass. Mathlib's `finProdFinEquiv` is `inner + width * outer`, matching
  the pilot's phase/parser/destination outer ordering. The finite sum/product
  equivalence supplies encoding inverses and coverage without enumerating states.
  Geometry and native-export workers received the stable physical-state API.
  Initial syntax, public exposure, dependent-bound, and style diagnostics were
  repaired before the successful remote check. Reusable row-view lemmas are
  tracked separately under G3.
- [x] G2: Strict remote Lean build of this module passes with warningAsError, unchanged accepted pins and retained exact source/command receipts.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target controller
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Remote run `39814488598`, iteration 4, commit
  `fb199eeeee42b86d1e3085357014f37fe3621721`; source hash
  `db5b44c1e682c047c557b29907fd70da0b3bcf21b996278a44ec1058cac11aba`.
  Inspected `/tmp/chess-table-controller-session-39814488598-4/source-manifest.json`
  and three exit-zero command receipts under its `commands/` directory:
  `1792687115115209887.json` (strict build, Controller 2.5s),
  `1792687115826999065.json` (native actual-row export), and
  `1792687117942457127.json` (complete comparison).
  `controller-compare.json` confirms all 43,364 rows agree, including both missing
  done rows, entry 0, done 21680 and error 21681; all 28 negative controls reject.
  Export hash `638476757b62c8a4b2bf06868ee97de18349f82e4cd0810e12345183a642c823`;
  retained pilot hash `c812768bac296d8520f64b7df4a33de47e7c067c79594bef48e7b536e359e09f`.
  This is finite exact controller correspondence, not universal reachability.
  Accepted machine claims remain unchanged. All execution was remote.

- [ ] G3: Parameterized row-view and shared-destination inverse lemmas expose the
  actual paid read/emission/consume controls for universal primitive executions.
  CHECK: Strict remote controller build after each small complete proof block;
  source review of arithmetic partitions and all context families.
  EXPECT: No placeholders, no runtime-definition changes, all new lemmas checked.
  EVIDENCE: This gate was added before the new proof edits. First block
  (`controlRow_tagControl`, `literalRow_read`, `literalRow_emit`) passed strict
  remote run `39816975477`, iteration 1, at `37c1b72`; Controller source hash
  `59d426c6ed0bb037d166e281e87d2b495f54a66cb3c5da7c4b65a5a4231bfabf`.
  Root retained `evidence/controller-views-live-01/unpacked/controller.json`;
  Controller built in 7s, and complete row equality plus 28 negative controls
  passed again. The read-state bridge block passed as the named Controller
  dependency in remote run `39818051349`, iteration 2, commit
  `f53cff47faa9e408903741cade5d14480de6e949`, source hash
  `9eada02ac1c8ce4c3f947cfb1b4ce9fa232abf5c2e44d3944abd0239afbac71f`.
  Inspected `evidence/blocks-proof-live-02/unpacked/commands/1792688258884053541.json`:
  Controller built in 4.8s; the combined command exited 1 solely for downstream
  Blocks diagnostics. This receipt is not a successful combined Blocks build.
  The emission bridge block is source-complete and pending remote checking;
  shared destination inverses remain.
