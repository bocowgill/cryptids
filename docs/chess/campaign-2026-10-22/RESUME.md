# Active chess compression goal — 2026-10-22

Goal is ACTIVE: pursue the smallest certified full binary blank-tape chess machine
with remaining authorized usage. Exhaustion is a resource stop, not completion.
User controls resets and resumption. No outreach. All Lean/Lake/LSP/LeanProbe,
native compilation, generators, models, simulations, fixtures, synthesis and machine
counts MUST RUN REMOTELY. Local source/doc edits and saved metadata/hashes only.

Best accepted machine: 2,904,623 states at commit
7987e740b492736cc18eba7896727544ef027c93; initializer1,837,941/body1,066,682.
Named Machines.chess_field_reverse and Semantics.ChessFieldReverse.halts_iff_not_draw.
Read docs/chess/field-reverse/RESULTS.md and RESUME.md. Frozen chess spec and all
previous tracked files are fixed by this campaign's baseline-pins.json.

Initial usage snapshot:48% used/52% remaining in account's10080-minute primarywindow.
No explicit token budget requested or set. Do not consume resetcredits automatically.

Current round01: investigate removing unnecessary binary return controls from the
complete FieldPacked Post body. Binary.compile allocates one bounce for every Post
state; only write destinations use these. Initial question: which destinations can
be omitted or replaced by fused write+unconditional-move paths with universalproof?
No candidate count accepted. Retain original paid reverse initializer/input.

First two narrow source-exploration leaves: generic compiler/pruning proofinterfaces;
concrete body/write-destination structure and native measurement integration.
Root owns remote infrastructure, new campaign records, final integration and proofs.
Next: review scouts, choose exact mechanism, launch remote census and focusedproof.
Baseline sealed metadata replay passed: `check_saved_evidence.py --self-test`
returned `Reverse sealed evidence controls passed` (exit0). No local model ran.

Selected route: retain all main controls, allocate returns only for write destinations.
The generic exact-row proof can reuse Compilation.LocalCertificate.Rows. A structural
layout can retain one slot per write child and per label root, plus shared halt;
its proposed count is 2391493 + 5W where W is the number of write constructors.
This is a proposed allocation, not yet a certified or measured smaller machine.

Remote census prepared in scripts/chess_goal_20261022/census.py and its dedicated
workflow. It checks every accepted body row, measures exact required return slots,
and compares the conservative structural count. No Lean or census runs locally.
Active remote jobs: none yet; next commit/push and register the focused workflow.
Local git branch codex/chess-openevolve-pilot.
