# Lift the verified source-control paths into the actual paid machine

OWNS: Cryptids/Compilation/TableSeed/Correct.lean

- [x] G1: Every Transducer.Step and finite Path is realized by actual-machine Reaches between
  exact frameTape configurations using the verified paid Blocks; no free steps, placeholders,
  new axioms or accepted-source edits. Four source passes completed.
  EVIDENCE: Unchanged complete source, independent source review, and exact strict-build binding below.
- [x] G2: The focused strict remote Correct command proves general physical path lifting and
  entry/path/finish composition conditional only on the stated source-graph Path.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target correct
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Retained `correct.json` reports target `correct`, status `passed`, and command exit 0
  at run `39823380010`, commit `721ab7423d47146c446c51e6e601593c0f9e46d0`.
  This gate records focused named-build success only. Final workflow provenance and integration
  remain separate root obligations, as explained below.

Conditional-lift scope: 2 met, 0 unmet, 0 abandoned. The historic conditional receipt does not
prove the later unconditional extension. No source edit was needed during resume reconciliation.

## Exact conditional contract

`Correct.frameCfg` maps every source configuration to the actual paid control encoding and
`Blocks.frameTape`. `step_reaches` uses only `Blocks.read_reaches` and `Blocks.emit_reaches`.
`path_reaches` uses reflexive-transitive tail induction and concatenates those physical paths.
`source_path_reaches` composes the verified entry, explicit source path, and verified cleanup.
`packet_reaches_of_path` exposes the same result at numeric state zero on `header ++ raw`.

The sole semantic premise is exactly
`Transducer.Path ⟨.read (.literal 0 0), [], raw, 1⟩ ⟨.finish, out, [], gap⟩`.
The conclusion is actual-machine reachability to `⟨done, Tape.mk₁ (Seed.seed out)⟩`.
These conditional theorems do not invoke `Transducer.packet_run` or assert that arbitrary raw
input admits such a path. No additional positive-gap premise, runtime operation, paid control,
or row is introduced. No placeholders, new axioms, unsafe declarations, or native proof oracles occur.

## Strict named-build evidence

Evidence directory:
`docs/chess/campaign-2026-10-22/round-04/evidence/correct-pause-live-01`.

- Result: `unpacked/correct.json`; `status: passed`, `target: correct`,
  `new_accepted_machine: false`.
- Command record: `unpacked/commands/1792690408529178339.json`.
- Run: `39823380010`; source/workflow commit:
  `721ab7423d47146c446c51e6e601593c0f9e46d0`.
- Actual command: `lake --wfail -f lakefile.chess-table-proof-20261022.toml build`
  `Cryptids.Compilation.TableSeed.Correct`.
- Command exit: 0; no timeout; output reports
  `Built Cryptids.Compilation.TableSeed.Correct (2.7s)` and successful completion.
- Conditional snapshot source SHA-256, matched with the file during resume reconciliation,
  receipt, and source manifest (before the separately authorized extension below):
  `3839f6e4c8b69166fce45310881f812444bbe032be3829134ec94a45ee808799`.
- Result receipt SHA-256:
  `0e8cbe55b65c6fd748aa9ee115ebd968eb16e370aef57347cb0ee688ef42f976`.
- Command record SHA-256:
  `b95eb4a87fac915e45bf56c176430f5859ab19c625264a0ed8fe4a23e3783afe`.
- Command output SHA-256:
  `9e9c84133269ed5c8e9b5025c83cd47e2ffba4f8a052657915f738dfa5b736f8`.
- `unpacked/session-result.json` also records target `correct`, the same commit/run, and exit 0.

The saved `run-api-pending.json` records workflow status `completed` with conclusion `cancelled`.
The retained `PENDING.json` is still `UPLOADED_DIAGNOSTICS_ONLY` and explicitly requires final
run logs and provenance. Therefore the successful focused command above is not represented as
an overall successful workflow or fully finalized official provenance packet. Root owns that
remaining provenance reconciliation. No network/API refresh was performed by this leaf.

## Four completed source-review passes

1. Matched both source Step constructors against verified Blocks endpoints, including output,
   unread bit removal, gap increment, emission continuation, and complete tape frames.
2. Checked closure lifting and entry/path/finish concatenation: zero source paths map to
   reflexivity; nonempty source edges map to finite paid executions. Cleanup remains a separate
   paid physical path. No first-hit, marker-uniqueness, or unconditional-validity claim is made.
3. Independent read-only draft review found no defect in frameCfg, read/emit endpoint matching,
   reflexive/tail path lifting, or conditional entry/path/finish composition. No execution occurred.
4. On explicit resume, reread the exact unchanged source and reconciled its hash with the saved
   successful strict command, result, manifest, and session metadata. Distinguished component
   proof acceptance from the cancelled workflow and from the unproved final packet antecedent.

## Pause and resume history / integration boundary

At the user's explicit pause, Correct.lean was frozen with its first strict check pending.
The user later resumed from checkpoint `fc16528`; the saved receipt now establishes that the
unchanged conditional-lift source completed its strict command successfully before the workflow
was cancelled. Resume work here consisted only of source/metadata/hash inspection and this ledger.
No local Lean, Lake, LSP, Probe, model, generator, test, or count execution occurred.

Root subsequently reported the final Transducer packet source passing strict remote run
`39825511470`, iteration 3, at `dfb522af6c94a153c3f109dee8515d67751c9a2f`, and explicitly
authorized the unconditional extension below. Full decoder/chess composition, dependency audit,
numeric correspondence, and accepted machine changes remain separate.

## Unconditional composition extension (user-resumed campaign)

- [x] G3: `Correct.packet_reaches pre rows post` proves actual paid-machine reachability from
  state zero on the complete valid packet to done on the exact Seed.seed letters, for every
  bounded row list and arbitrary literal pre/post, with no Path premise.
  EVIDENCE: Strict named build passed for the exact current source. The theorem rewrites
  `Transducer.packet_eq_header_raw`, then applies the unchanged `packet_reaches_of_path` to
  the verified `Transducer.packet_run`; no semantic premise remains in its statement.
- [x] G4: Expanded Correct source passes strict remote checking and current exact source
  hashes match retained receipts; original conditional theorems unchanged.
  CHECK: CHESS_REMOTE=1 GITHUB_ACTIONS=true python3 scripts/chess_table_seed_20261022/proof_verify.py --target correct
  EXPECT: Structured decoder proof target passed
  EVIDENCE: Run `39827508136`, iteration 1, commit
  `7c477f3d31221d960f568c21a7f71b8daaca8fdb`; retained command exit 0 and exact source binding below.

Expanded source was frozen for that check at SHA-256
`dc7e55b7441a84f1276ff15156b2978dac4b5d154dbac48ddba6b4574280d9c3`.
The original conditional APIs are unchanged. The old successful receipt above binds only the
conditional snapshot; it is not evidence that this newly appended theorem elaborates.

Independent read-only review of the extension found no defect: header rewriting, exact output
letters, source-path final gap, actual machine/control endpoints, and full tape constructors all
match. It confirmed that the theorem has only pre/rows/post binders and preserves all existing
conditional APIs. No local execution or additional source edit occurred during that review.

### Expanded source strict named-build evidence

Evidence directory:
`docs/chess/campaign-2026-10-22/round-04/evidence/correct-unconditional-live-01`.

- Result: `unpacked/correct.json`; target `correct`, status `passed`,
  `new_accepted_machine: false`.
- Run: `39827508136`; computation/workflow commit:
  `7c477f3d31221d960f568c21a7f71b8daaca8fdb`.
- Command: `unpacked/commands/1792692132348558583.json`, exactly matching the receipt's check.
  Actual command is `lake --wfail -f lakefile.chess-table-proof-20261022.toml build`
  `Cryptids.Compilation.TableSeed.Correct`; exit 0, no timeout.
- Output reports `Built Cryptids.Compilation.TableSeed.Correct (5.0s)` and successful completion.
- Current source, result receipt, and `unpacked/source-manifest.json` all bind Correct.lean to
  `dc7e55b7441a84f1276ff15156b2978dac4b5d154dbac48ddba6b4574280d9c3`.
- Result receipt SHA-256:
  `55c1a5361f1daab6b3f543deee7a04d9f2b386f5492e39490ed3a2416aa01183`.
- Command record SHA-256:
  `ae227865bfa79e3d454401794611141acc4f16bcfdb9320819ae58a703b86715`.
- Command output SHA-256, independently matched to the retained output text:
  `3072fe19bbaa6e9896feebb8bb1597c3ebe25447b9d9d9a2f1a37275e2eb5fa8`.
- `unpacked/session-result.json` agrees on target, commit, run, and exit 0.

The saved API snapshot reports workflow status `completed`, conclusion `success`. Its retained
`PENDING.json` still labels the packet `UPLOADED_DIAGNOSTICS_ONLY` and requires final logs and
provenance. This ledger closes the focused source/build gates; official provenance finalization
and full-machine acceptance remain root's separate work. No accepted machine change is claimed.

Leaf total: 4 met, 0 unmet, 0 abandoned at the stated focused scope. Correct.lean remains frozen
at the exact expanded source hash above. This reconciliation used only local source/metadata
reading and hashing; no local Lean, Lake, LSP, Probe, model, generator, test, or count execution.
