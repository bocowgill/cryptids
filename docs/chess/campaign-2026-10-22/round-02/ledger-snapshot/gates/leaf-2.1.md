# Exact finite seed controller and format
OWNS: Cryptids/Compilation/Seed/Format.lean, Cryptids/Compilation/Seed/Controller.lean, Cryptids/Compilation/Seed/Blocks.lean, .unlazy/chess-goal-20261022-r02/gates/leaf-2.1.md

- [x] G1: Format definitions and exact 216-state controller implement the retained pilot with every control paid and designated terminal done.
  EVIDENCE: Complete source defines the frozen LSB format, marker, whole-tape loop invariant,
  and marked output; `Control`/`controlEquiv` represent precisely the retained allocation
  through `Fin 216`, including success 214 and error 215. Independent read-only subagent
  review matched all block starts, parser branches, row directions, writes, and exits to
  pilot-02. Remote run `39790380235`, iteration 2 at
  `4fa54a4f6ab012ee281bb829fe173368b7421574`, passed the strict `lake --wfail` build of
  Format/Controller/exporter and the independent complete 432-row comparison, with
  465 positive fixtures and all 14 negative controls rerun against the actual Lean rows.
  Retained evidence: `docs/chess/campaign-2026-10-22/round-02/evidence/controller-final/unpacked/`;
  command receipt `commands/1792677426684840072.json`, `controller-compare.json`,
  `session-binding.json`, and `source-manifest.json`. Bound source SHA-256:
  Format `d2cce4c27619af93d7aa158e60f8e573e26486a8769bf056c8963821f1ca7aea`;
  Controller `61a0e6483c4ed9e2b73bbe5fcac29036b32ac953203dbc7f5dedc649cfb1c745`.
  The fixture scope remains finite; the kernel definitions and exact-row comparison
  establish this allocation gate, not universal seed expansion.
- [ ] G2: Fixed-block/parser step contracts preserve arbitrary tape frames and compile strictly on the pinned remote toolchain.
  EVIDENCE: Complete first draft has the checked finite-path theorem `run_path`, all actual
  fixed block instances `run_block`, the three-step parser on arbitrary ListBlank frames,
  exact B shift/erase contracts, the combined 31-step prepend/A contract, and finite
  write/move helpers. First remote Format diagnostic was the arithmetic normalization in
  `seed_length`; repaired using explicit length rewrites and `omega`. Strict remote
  Controller elaboration has now passed as recorded above. First Blocks check elaborated
  the fixed paths, parser, arbitrary-write helper, prepend geometry, and final B erasure;
  the B-shift proof needed only explicit normalization of its initial named state, and
  one long signature needed wrapping. Both diagnostics are repaired. Strict Blocks rerun
  and downstream integration remain pending.
- [ ] G3: Four source passes and parent review leave no deferred local obligation in the owned files.
  EVIDENCE: Four source passes completed: (1) complete exact allocation/format and fixed
  paths, (2) LSB parser and nearest-first zipper geometry review, (3) independent full
  source review against the retained pilot and arbitrary-frame contracts, (4) public
  interface/polish pass including markedOutput and explicit run-time composition. No
  proof placeholders or added axioms were introduced. Parent review and remote repair
  cycle remain open, so this gate stays pending. Local activity was source reading and
  editing only; no Lean, Lake, LSP, Probe, model execution, fixture, or count ran locally.
