# Exact frozen chess input codec identity
OWNS: Cryptids/Compilation/Seed/ChessCodec.lean, .unlazy/chess-goal-20261022-r02/gates/leaf-2.4.md

- [ ] G1: A universal four-symbol map identifies the expander markedOutput with the existing complete thirteen-bit encoding of trInit, including empty input.
  EVIDENCE: `Seed.markedOutput_bitInput` and `Seed.markedOutput_input` are complete source
  drafts with no placeholder. They quantify over every `List Γ'`; the empty and nonempty
  first-cell helpers preserve the relative head, marker, and complete tape. Pinned Mathlib
  `trInit` source (commit `1f414401f69059aa7eead47b53ee40bd38455eeb`) was read and matches the
  reversed-list helper exactly. Remote Lean validation remains pending.
- [ ] G2: The concrete seed length and output tape equal the original frozen chess input without changing any specification, source program, or codec.
  EVIDENCE: `Seed.ChessCodec.bits_size` derives 424156 from `Seed.seed_length` and
  `Chess.Compilation.Input.stack_length`; `paid_writer_states` derives 424157 for the actual
  existing `OpenEvolveWide.schedule`. `output_eq` names `FieldSelective.bits.toList` directly
  and follows the unchanged `FieldPacked` / `FieldAware` definitions to the universal identity.
  Strict remote build remains pending.
- [ ] G3: Four source passes and parent review distinguish universal proof from finite static evidence and leave no deferred owned obligation.
  EVIDENCE: Source passes completed: (1) four symbol values agree with `symbolCode`'s nonzero
  codes; (2) fixed first-cell marker update covers empty and nonempty inputs; (3) list reversal,
  complete-tape equality, and the frozen `FieldSelective` input chain agree; (4) independent
  read-only subagent review found no semantic concern and confirmed counts use existing kernel
  length theorems, not a static hash. Parent informed. Final acceptance still awaits remote
  elaboration, strict no-placeholder/axiom validation, and parent review of the same candidate.

Remote proof session 1 diagnosed two implementation issues in this leaf: simplification did
not unfold the unapplied `unmarkedSymbol` under `List.map`, and the paid-writer `rw` proof
exhausted the 6 GiB kernel memory limit while reducing concrete data. The candidate now explicitly
unfolds the generic helper before conversion, uses direct equality transitivity for the paid
schedule and exact output, and locally protects the frozen data definitions from unfolding.
Receipt: `docs/chess/campaign-2026-10-22/round-02/evidence/proofs-session-1-diagnostics/commands/1792678380255457094.json`.
These repairs are not yet accepted; the next remote strict recheck is required.
