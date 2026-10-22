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
   with an independent read-only subagent for the bidirectional zipper interface. Awaiting remote
   diagnostics.
2. Pending compiler-directed repair.
3. Independent read-only source review found the generic traversal and zipper contracts
   mathematically sound and the induction/simplification strategy coherent. Integration caller
   (Expander) confirmed the interface covers its left and right scans. Remote acceptance pending.
4. Pending final remote check and axiom audit.

## Exposed interface

`advance`, `scanWord`, `target`, `Rows`, `Reads`, `scanWord_append`, `scanWord_zeros`,
`scanWord_zeros_reset`, `scanWord_three_zero`, `scanWord_flatMap`, `scanWord_fourOnes`,
`reads_append`, `mkLeft`, `mkLeft_cons`, `move_left_mkLeft`, `reads_right`,
`shift_right_prefix`, `reads_left`, `shift_left_prefix`, `step_row`, `run_safe`,
`run_fourOnes`, `run_safe_fourOnes`.

The four-one contract asserts a run of four transitions ending at exit. It intentionally makes
no first-hit/minimality claim for arbitrary caller state embeddings, which may alias states.

Status: draft, not yet accepted.
