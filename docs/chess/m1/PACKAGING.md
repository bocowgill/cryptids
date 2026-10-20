# Recommended Cryptids packaging for chess

Status: accepted design from the audit-only task. The reference module, sanity
lemma module, and public aggregate are now implemented; see [FREEZE.md](FREEZE.md).
The remaining module layout is a proposal for later milestones. This document
preserves the reasoning accompanying the original [M1 audit](AUDIT.md).

## Decision

Use a minimal, attributed, definitions-only local port of the pinned chess file
inside the existing Cryptids Lake package. Preserve its `Chess` namespace, rule
definitions, and two avoid-loss propositions. Separate proof lemmas, executable
representations, evaluator, and machine backend by import direction.

Keep the upstream source unchanged as [archived text](source/Chess.lean.txt).
Do not add FormalConjectures as a package dependency, import its open conjecture,
or port a general game framework before the chess construction requires one.

This recommendation follows the audit's result: no reachable-game semantic defect
was established, but the source carries conjecture-specific tooling and is not an
executable or fully proved game model.

## Proposed module boundaries

| Proposed path | Responsibility and allowed imports | Stage |
| --- | --- | --- |
| `Cryptids/Chess/Spec.lean` | Pure reviewed reference definitions, through `BlackCanAvoidLoss`; Mathlib only | M1 implementation |
| `Cryptids/Chess/SpecLemmas.lean` | Reference-level facts: outcome consistency, nonterminal action existence, repetition properties; imports `Spec` | M1 onward; larger results remain M3–M4 |
| `Cryptids/Chess/Invariants.lean` | Initial-state and preservation lemmas for raw positions and reachable histories; imports reference/lemma layer | M1 onward |
| `Cryptids/Chess/Exec/Position.lean` | Concrete board/state/move encodings and executable updates | M2 |
| `Cryptids/Chess/Exec/Moves.lean` | Executable attack tests and legal move generation | M2 |
| `Cryptids/Chess/Exec/Refinement.lean` | Encoding, move-generator, update, and invariant correspondence proofs | M2 |
| `Cryptids/Chess/Exec/Game.lean` | History, repetitions, claims, legal actions, terminal detection, exact dead-position decision | M3 |
| `Cryptids/Chess/FiniteGame.lean` | Bounded play, legal strategies, unique finite results, finite-tree interpretation | M4 |
| `Cryptids/Chess/Evaluator.lean` | Executable backward induction and value/strategy correctness | M4 |
| `Cryptids/Chess.lean` | Curated public aggregate; no open draw theorem | Incrementally as components pass |
| `Cryptids/Semantics/Chess.lean` | Final theorem connecting the exact published machine to the reviewed strategic proposition | M6 |

Keep new executable names in `Chess.Exec` and reference statements in `Chess`.
Preserving the reference namespace avoids an unnecessary wholesale renaming in
the comparison target. Names and file splits can be adjusted after build and
review; their trust boundaries matter more than the exact filenames.

The reference layer must not import the executable layer, evaluator, backend, or
solution module. The executable layer may import the reference to state its
refinement theorems, but its runtime terms must not depend on noncomputable
reference operations. Do not modify `Cryptids/Machines.lean` merely to obtain
chess state types: its existing `ConjectureMachines.Machine`, initialization,
and halting semantics are the target for the later backend.

Select the compiler/register-machine packaging in M5 after the small-game
experiment. Add reusable modules to `Cryptids/Compilation/` only for components
actually shared or justified by that design. The audit does not establish that
the existing domain-specific register-machine proofs form a general compiler.

## Exact reference extraction policy

When implementation is authorized:

1. Start from source commit `03536100b3d15e928f45649e7935f8c2b785337b`, whose
   archived Git blob and SHA-256 are recorded in [EVIDENCE.md](EVIDENCE.md).
   Preserve the Apache-2.0 header and attribution. Identify the port as adapted
   from that file, rather than as a new specification authored from scratch.
2. Copy the declarations in source lines 42–615 into the reference module,
   preserving their bodies and `namespace Chess`; close the namespace normally.
   Keep the original documentation with an explicit 2023-rules/abstraction note.
   The small sanity theorem can move to `SpecLemmas.lean` without its source
   repository's category/AMS attributes.
3. Exclude the open theorem and its attributes at lines 626–638. Do not replace
   it with a local axiom, theorem parameter, or `sorry`. Define a convenient
   proposition alias for the conjunction only if useful; an alias asserts no
   truth of the proposition and must unfold in the independent audit.
4. Replace `import FormalConjecturesUtil` with Mathlib imports. Initially use
   `import Mathlib` if necessary for a faithful compatibility port, then narrow
   imports after successful builds. Exact minimal imports are untested today.
   Add the repository's module/public visibility conventions and record those
   administrative changes separately from definition bodies.
5. Build on Cryptids' existing Lean/mathlib v4.35.0-rc4 pins. Do not silently
   downgrade or update its toolchain to fit the source's v4.33.1 environment.
   Record all parser, elaboration, or definition changes needed for the port.
6. Compare every retained declaration with the archive. A raw text diff covers
   import/attribute edits; changed bodies need a documented semantic account and
   the appropriate equality/equivalence theorem on the same toolchain. Recheck
   the public strategic proposition rather than claiming source identity from
   a similar name. Cross-version bytecode equality is not a valid comparison.
7. Freeze the reviewed target only after the module builds and the change log
   accounts for all departures. If an actual rule correction becomes necessary,
   version the corrected target and keep the old source; do not assert a false
   preservation theorem simply to keep the original PR as a target.

No semantic rule correction is recommended now. Most required additions are
lemmas, executable counterparts, and clearer domain/provenance documentation.

## Raw positions, invariants, and public APIs

Leave `Position`, `applyPly`, and the raw predicates available as reference data
and relations, with clear documentation that they do not validate arbitrary
input. Retain `Reachable` as the strongest history condition for statements from
the initial game.

A future validated API should expose a position/game together with explicit
well-formedness evidence, or a checked input function with a proved contract.
It should distinguish three promises:

- A representable raw state has the right finite encoding.
- A locally coherent state satisfies a stated collection of invariants.
- A reachable game is generated by the reference's legal history from the
  standard initial game, respecting automatic termination.

Neither a FEN-shaped record nor local board coherence proves the third promise.
Do not narrow refinement theorems without stating the restriction and proving
initial validity and closure. Conversely, where an executable definition can
agree with the raw specification on every position, prefer that stronger result.

The dead-position graph requires a separate projection theorem for legal-ply
reachability; game-level reachable-history invariants must not change that graph
by forbidding paths after an automatic draw. Repetition keys and compressed
history also require their own preservation theorems before evaluator use.

## Trust and independent comparison

Use the repository's permitted axioms (`propext`, `Quot.sound`,
`Classical.choice`) and audit transitive proof dependencies. Axiom checks must
reject `sorryAx` and any custom oracle assumption. In addition, review theorem
hypotheses for hidden assumptions of the draw value or compiler correctness.
Source comments, successful simulations, and imported theorem names are not
correctness evidence.

For final chess integration, prefer a self-contained `ChessChallenge.lean` with
its own Lake target and `comparator/chess.json`, following the repository's
existing independent challenge pattern. The challenge should import Mathlib
and minimal metaprogramming support only, restate the reviewed definitions and
literal machine, and list the desired theorems. It must not import the solution's
`Spec` module or machine generator as its authority for the target statement.
Comparator should check both statements and their transitive definitions, with
the restricted axiom list. Challenge placeholders must never become solution
dependencies.

During M1–M4, a smaller independent reference/statement audit can be introduced
when public theorems exist. At M6, extend the aggregate comparator workflow or
register the new target explicitly; adding a JSON file alone does not make CI
run it. Retain Linux CI for the existing `bwrap`-based audit. Add the chess
aggregate to `Cryptids.lean` only as the actual modules pass their checks.

The archived `.lean.txt` evidence is deliberately outside Lean source roots and
cannot satisfy a build/proof obligation. It contains the original open theorem
for provenance, and must never be renamed/imported as a solution module.

## Alternatives considered

| Alternative | Assessment |
| --- | --- |
| Depend on the full FormalConjectures repository | Adds incompatible pins and conjecture/linter infrastructure without providing the needed executable refinement; no current advantage |
| Copy the whole chess module, including the conjecture | Leaves an avoidable `sorryAx` trust hazard; transitive auditing could detect misuse, but definitions-only packaging is clearer |
| Rewrite the rules into executable Lean immediately | Makes rule changes harder to separate from implementation bugs; retain reference first and prove the refinement |
| Build a separate standalone chess package now | Possible later if reuse or upstream scope demands it, but adds package and compatibility work before it is needed |
| Put all chess definitions in the shared propositions file | Blurs a substantial domain model with existing conjecture statements; a dedicated namespace/module tree is easier to review |
| Import the same reference module into both challenge and solution | Cannot independently detect an incorrect or weakened shared specification; use the existing independent-copy comparison model |

## Next decision and release boundary

Recommend adopting this packaging plan when code work is authorized. The first
implementation should be the attributed reference extraction and build, followed
by its invariant/lemma contract. M2's generator is a subsequent deliverable.

The audited candidate is not yet a frozen Cryptids reference. Outstanding M1
acceptance criteria are the actual minimal module, compatibility build, port
correspondence, and final reviewed-target record. Remaining M3–M4 theorems should
be tracked as such rather than required to finish an audit-only task.

Incremental upstream review remains the campaign strategy, but no issue, PR,
review request, maintainer message, or implementation change is part of this
recommendation.
