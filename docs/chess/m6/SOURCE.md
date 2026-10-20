# Complete concrete source

`Cryptids/Chess/Compilation/Source.lean` instantiates every chess callee with actual
`ToPartrec.Code` syntax: legality, unchecked updates, check, history/repetition,
automatic adjudication, optional claims, action enumeration and evaluator control.

`Source.evaluator_eval` proves agreement with unchanged M4 on every raw game.
`Source.program_eval` returns on either winner and diverges on draw.
`Source.program_initial_dom` consequently proves

```lean
(Source.program.eval [Control.gameWord Adjudication.Game.initial]).Dom ↔
  ¬ (WhiteCanAvoidLoss ∧ BlackCanAvoidLoss)
```

The proof assumes no initial chess value. Dead-position termination is deferred only
through the unconditional value-preservation theorem in `WithoutDead`. There is no
runtime fuel cutoff, claim omission, legal-line heuristic or abstract rule oracle.

This is a source-program theorem. It does not establish a literal binary table,
the fixed runtime DAG interpreter's correctness, or the final M6 artifact identity.
The final binary initializer must pay for both the shared program and initial data.
