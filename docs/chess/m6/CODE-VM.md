# Shared-table runtime reference machine

`Cryptids/Compilation/CodeVM.lean` defines a deterministic operational machine for a validated
`CodeDAG.DAG`. The executed state contains natural-number program counters and ordinary data;
it contains no recursive `ToPartrec.Code`, semantic decoder, partial evaluator, or procedure
oracle. This is the reference semantics for the separately constructed fixed TM2 interpreter.

## Runtime states and instructions

The public namespace is `ConjectureMachines.Compilation.CodeVM`. `Config` has three modes:

```lean
eval (pc : Nat) (frame : Frame) (values : List Nat)
ret (frame : Frame) (values : List Nat)
halt (values : List Nat)
```

`Frame` stores only the following data:

| Frame | Stored data | Return behavior |
| --- | --- | --- |
| `halt` | none | Produce successful output. |
| `cons1 right saved next` | right child PC and original input | Evaluate the right child on saved input, keeping the returned head. |
| `cons2 head next` | one natural-number head | Prepend the saved head to the returned list. |
| `comp left next` | left child PC | Evaluate that child on the returned list. |
| `fix body next` | body PC | Remove the returned flag; return on zero, otherwise run the body again with the same frame. |

`step rows` performs one explicit row lookup or return instruction. Zero prepends zero;
successor returns the singleton successor of the input head, using zero for an empty input;
tail drops the input head. Cons evaluates its left child first and its right child on the
original input. Composition evaluates right then left. Case removes a zero head or replaces a
positive head with its predecessor. Fix evaluates its body and installs a runtime fix frame.
No evaluation fuel or bound is part of the runtime configuration.

An out-of-range PC rejects with `none`, while successful output is explicitly `Config.halt`.
`step_none_iff` proves that on well-formed states only successful outputs can stop. The
`Frame.WF` and `Config.WF` predicates bound every runtime PC by the table size. `step_wf` and
`reaches_wf` prove that a topological table preserves this invariant, and `init_wf` establishes
it at the validated root.

The shapes agree with the fixed interpreter's proposed frame wire:

```text
halt:  trList [0]
cons1: trList [1] ++ trList saved ++ [cons_l] ++ trList [right] ++ frames next
cons2: trList [2, head] ++ frames next
comp:  trList [3, left] ++ frames next
fix:   trList [4, body] ++ frames next
```

This document records the interface; the physical stack encoding and its TM2 simulation are
separate root-owned obligations.

## Exact finite-run correspondence

`Runs rows config out` means an actual finite `Reaches (step rows)` path from that configuration
to `Config.halt out`. The main public theorems are:

```lean
runs_iff (dag) (valid : dag.Valid) (input out) :
  Runs dag.rows (init dag input) out ↔ out ∈ dag.decode.eval input

runs_compile_iff (code) (input out) :
  Runs (CodeDAG.compile code).rows (init (CodeDAG.compile code) input) out ↔
    out ∈ code.eval input

halts_compile_iff (code) (input) :
  (StateTransition.eval (step (CodeDAG.compile code).rows)
    (init (CodeDAG.compile code) input)).Dom ↔ (code.eval input).Dom
```

The corresponding `halts_iff` handles any valid DAG. These statements preserve both successful
outputs and divergence and have no callee-refinement hypothesis.

The proof has two distinct directions. `Frame.decode` interprets data continuations only in
proofs, and `meaning` assigns each configuration its partial semantics. A cons2 frame decodes
to `Cont.cons₂ [head] next`; storing only the head preserves the full continuation's behavior.
`step_meaning` proves semantic preservation for every executed transition, and
`reaches_meaning` gives soundness for finite runs.

Completeness is proved separately. `eval_reaches` turns every terminating decoded evaluation
into a finite runtime path ending at the same return frame. Its induction uses strictly smaller
child PCs, guaranteed by table topology. Fixpoint iteration uses `PFun.fixInduction` and the
actual returned flags to construct finite body-loop paths. This covers the gap that a
zero-source-step simulation alone would leave: a terminating source evaluation cannot become
an infinite sequence of runtime dispatches. The subsequent invariant and terminal-shape proofs
identify actual `StateTransition.eval` termination with successful finite runs.

## Verification boundary

The focused target builds with `--wfail`. Local leaf evidence contains runtime fixtures for all
seven code constructors, shared children in different contexts, original-input preservation,
head-only cons2 data, empty and positive case branches, repeated terminating fix iterations,
invalid table rejection, and a live prefix of an always-positive fix loop. Kernel examples also
prove all-input zero termination and all-input positive-fix nontermination using the generic
equivalence. Bounded prefix checks are regression evidence, not the divergence proof.

The declaration audit checks the entire new module and transitive dependencies against the
standard axiom allowlist. A separate runtime-closure check excludes `Code`, `Code.eval`, semantic
decoders, and `meaning` from `Frame`, `Config`, and `step`. Positive controls must reject both
`sorryAx` and an injected proof-only denotation. Root M6 verification must incorporate these
checks into its durable scripts.

The fixed TM2 interpreter, physical frame/row lookup simulation, blank initialization,
literal-table identity, and final chess strategic equivalence remain integration obligations.
