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
Remote census39775667430 succeeded at source5af89c69ed69e0bf0a3d7a710a2bbc3eac7ac0a4.
Retained under round-01/evidence/census-39775667430, including logs and run metadata.
It checked all2133364 body rows: W4050, required returns40461 exactly equal the
structural allocation1+5*(4042+4050). Proposed full2411743, saving492880. This is
finite evidence, NOT a new certified machine. Best accepted remains2904623.
Usage now49% used/51% remaining. No resetcredit consumed.

Source drafts now exist for generic SelectiveBinary, FieldReturns.Syntax/Graph,
FieldSelectiveLayout, full FieldSelective and its public theorem. Candidate full2411743
has NOT passed strict Lean yet. Current complete source commitbc2e490. Remote machine
run39777697376 is checking this commit. Generic retry39777234132 failed on tactic
transparency in two proofs; repair assigned to goal_selective_binary. Earlier syntax
and graph errors were repaired beforebc2e490, waiting on machinecheck confirmation.

Native Export.lean, independent fixtures.py, Audit.lean, newlakefile and fullremote
runner drafted in scripts/chess_goal_20261022/. Only source review has occurred;
no newnativeartifact or fixturepass exists. Root must inspect and commit these,
then run full acceptance after component/machineproofs pass. Account51%used/49%remaining.
No resets or outreach. ALL heavy work remainsremote. Failedremoteevidence retained.

Next concrete tasks:
1. Collect machine39777697376 diagnostics, finish genericrepair, push/runmachine again.
2. Strict fullrun builds audit/export, checks forbiddenaxiom controls and falsecounts,
   exports everyactualprefix/bodyrow, independently replays202100sourcecases and27
   corruptions, checks all4823486fullrows, and reruns acceptedM2-M7regressions.
3. Fresh independent fullcandidate review and sealedpacket replay before acceptance.
4. Only then update best count and pursue nextcompressionround; goal staysactive.
Local branch codex/chess-openevolve-pilot; push explicitfork URL (origin is upstream).

Live update: fullremote run39778061609 dispatched at83abc4f (latestgeneric
transparencyrepair, allnativevalidation sources committed). Firstmachinecheck
39777697376 failed; diagnosticsbeingretained. Audit source now additionally imports
previous public FieldReverse theorem so its retained required-root audit can find it;
this small repair is after83abc4f and requires a later fullrun beforeacceptance.

Component validation: machine39777697376 successfully built FieldReturns.Syntax
and FieldReturns.Graph on current exact sourcehashes. Generic failed on already
repaired transparency; concrete modules not yet checked. No acceptednewmachine.
