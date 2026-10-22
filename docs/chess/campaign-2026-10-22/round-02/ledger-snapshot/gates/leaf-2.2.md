# Leaf 2.2 — generic scanner traversal

Owner: goal_seed_scan. Scope: `Cryptids/Compilation/Seed/Scan.lean` only.

## Acceptance gates

- Scanner behavior depends only on the caller's actual eight preserving transition rows.
- Every safe finite binary word executes in exactly its length and returns the exact shifted tape.
- Four ones from run zero execute in exactly four steps to the supplied exit.
- Both directions expose Reads and exact shift lemmas for finite prefixes with arbitrary
  ListBlank exterior frames; safe-word concatenation, zero runs, and grouped traversal compose.
- No new axioms, `sorry`, `admit`, unchecked computation, or assumed marker uniqueness.
- All Lean/Lake verification is remote, dispatched by the root agent; no local proof execution.

## Passes

1. First draft written. Imported only verified FlatInit and FieldBinary.Fields. Source reviewed
   with an independent read-only subagent for the bidirectional zipper interface.
2. Remote run `39791458233`, retained `components-session-1/commands/*.json`, reported
   two elaboration issues: the row hypothesis needed explicit instantiation and the local
   execution-composition base case needed `Nat.zero_add`. Both repaired. All other scanner
   declarations passed this attempt. The failed attempt is retained; the subsequent named
   component build passed as recorded below.
   Exact command receipt: `docs/chess/campaign-2026-10-22/round-02/evidence/`
   `components-session-1/commands/1792677565501387873.json`.
   Invocation: `lake --wfail -f lakefile.chess-seed-20261022.toml build` with
   `Cryptids.Compilation.Seed.Blocks Cryptids.Compilation.Seed.Scan`.
3. Independent read-only source review found the generic traversal and zipper contracts
   mathematically sound and the induction/simplification strategy coherent. Integration caller
   (Expander) confirmed the interface covers its left and right scans. An additional direct
   read-only review of its row instances, grouping, prefix Reads, and exact zipper calls found
   no API or orientation mismatch.
4. Strict remote named component build passed in run `39793271595`, commit
   `7710f6f93ba0e67746ed847c60469c6565631449`. The retained command output states
   `Built Cryptids.Compilation.Seed.Scan (4.7s)` with no scanner warnings or errors.
   The same command also reports `Built Cryptids.Compilation.Seed.Blocks (4.3s)`.
   This is component evidence: the overall command exited 1 on downstream Expander and
   ChessCodec failures. No successful combined root receipt or complete dependency-axiom
   audit is claimed here; those remain root integration gates.

## Passing component evidence

- Official run: `39793271595`.
- Exact source commit: `7710f6f93ba0e67746ed847c60469c6565631449`.
- Command receipt:
  `docs/chess/campaign-2026-10-22/round-02/evidence/proofs-session-1-diagnostics/commands/1792678380255457094.json`.
- Command: `lake --wfail -f lakefile.chess-seed-20261022.toml build`
  `Cryptids.Compilation.Seed.Expander Cryptids.Compilation.Seed.ChessCodec`.
- Overall exit: 1, due to downstream targets; Scan's named build succeeded.
- Retained command output SHA-256:
  `0d7a19f2e185bbd44918436b5f0b1357cc94b596982eecc09eb36ffa17d005a9`.
- Scan source SHA-256, matched against the retained source manifest and current file:
  `7fc026b4ab6510609369c38b47fb8738f11cbb2c5f05604ee5328b60acde3b77`.
- No source edits after the successful named component build. No local Lean/Lake execution.


## Exposed interface

`advance`, `scanWord`, `target`, `Rows`, `Reads`, `scanWord_append`, `scanWord_zeros`,
`scanWord_zeros_reset`, `scanWord_three_zero`, `scanWord_flatMap`, `scanWord_fourOnes`,
`reads_append`, `mkLeft`, `mkLeft_cons`, `move_left_mkLeft`, `reads_right`,
`shift_right_prefix`, `reads_left`, `shift_left_prefix`, `step_row`, `run_safe`,
`run_fourOnes`, `run_safe_fourOnes`.

The four-one contract asserts a run of four transitions ending at exit. It intentionally makes
no first-hit/minimality claim for arbitrary caller state embeddings, which may alias states.

Status: generic scanner component strictly verified remotely; four review passes complete.
Combined root success receipt and dependency audit remain pending integration evidence.
