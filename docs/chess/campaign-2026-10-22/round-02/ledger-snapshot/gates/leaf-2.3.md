# Universal seed expansion and cleanup
OWNS: Cryptids/Compilation/Seed/Expander.lean, docs/chess/campaign-2026-10-22/round-02/EXPANDER-PROOF.md, .unlazy/chess-goal-20261022-r02/gates/leaf-2.3.md

- [ ] G1: Actual 216-state controller consumes every finite seed, reverses symbols into exact output cells, removes all markers and restores the correct relative head/tape.
  EVIDENCE: complete source candidate `Cryptids/Compilation/Seed/Expander.lean:run_seed`; remote compilation pending. Exact theorem quantifies over every finite `List (Fin 4)` and ends at `markedOutput letters.reverse` in `16*n*n+83*n+62` transitions. No acceptance credit yet.
- [ ] G2: Entry, each loop iteration, cleanup and finite termination compose without unproved hypotheses or hidden tape/preloaded controls.
  EVIDENCE: source candidate includes `entry_run`, `loop_once_gap`, `loop_once`, `finish_gap`, `finish`, `run_loop`, and `seed_reaches`; no `sorry` or new axiom in source. Pending remote strict build and complete axiom audit on one complete candidate.
- [ ] G3: All boundary and frame cases, especially empty input and both infinite exteriors, survive four source passes and parent review.
  EVIDENCE: four source passes documented in `docs/chess/campaign-2026-10-22/round-02/EXPANDER-PROOF.md`. Borrowed-zero scanner grouping, arbitrary frames, quotient blank-tail cleanup, and empty output are explicit. Independent read-only source review found no mathematical defect in counts or endpoints, including empty/gap-zero cases. Parent/remote verification pending.
