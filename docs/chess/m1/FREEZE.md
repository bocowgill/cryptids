# Chess reference v1 — M1 completion record

**Status: frozen.** The definitions-only port builds on Cryptids' unchanged
Lean/mathlib pins, preserves the reviewed source definitions, and excludes the
open draw theorem. M1 is complete. M2 and outreach have not started.

## Frozen target and provenance

The strategic target is exactly

```text
D := Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss
```

No theorem asserting `D`, its negation, or any chess-machine halting equivalence
is provided. This reference identifies the proposition for the subsequent
campaign; it does not solve chess.

| Item | Identity |
| --- | --- |
| Reference version | `chess-reference-v1` |
| Original source | `bocowgill/formal-conjectures`, PR #5216 |
| Source commit | `03536100b3d15e928f45649e7935f8c2b785337b` |
| Source path | `FormalConjectures/Books/Chess.lean` |
| Archived Git blob | `8018d10a3bfcd375a17c76599cfd3ceafe3e930d` |
| Archived SHA-256 | `ad43e6cfa086ff692daf57b8ee2444faa34f318ff43e05e44b53b27a53e10348` |
| Rule edition | FIDE Laws effective 1 January 2023 |
| Toolchain | `leanprover/lean4:v4.35.0-rc4` |
| Lean commit | `c29b6dda4f7c20e3eeaa717c4e565663c5cfa364` |
| Mathlib revision | `1f414401f69059aa7eead47b53ee40bd38455eeb` |

The [machine-readable manifest](reference-v1.json) records the exact SHA-256
identities of the reference modules, checker sources, toolchain file, Lake
configuration, and dependency manifest. The archive and its license notice are
unchanged. Port files preserve attribution to the Formal Conjectures Authors.

## Port contents and complete change account

- `Cryptids/Chess/Spec.lean` retains source lines 42–615, including all data
  types, move/update predicates, histories, claims, outcomes, strategies, and
  avoid-loss propositions. The namespace body is byte-identical to that excerpt,
  with the final `end Chess` appended. No rule body, signature, or strategic
  quantifier was changed.
- Replace `FormalConjecturesUtil` with five targeted Mathlib imports:
  `Data.Fintype.Basic`, `Data.Fintype.Sigma`, `Data.Nat.Dist`, `Logic.Relation`,
  and `Tactic.DeriveFintype`. Finite-board deriving needs both the `Fin` and
  dependent-pair instances; no new package dependency was added.
- Add Cryptids' `module`, `public import`, and exposed public-section metadata.
  The module documentation fixes the edition, explains the abstract claim/domain
  boundary, attributes the source, and wraps one long reference link.
- `Cryptids/Chess/SpecLemmas.lean` retains the original sanity theorem from lines
  617–624, with only the conjecture-repository category/AMS attribute removed.
  Its statement and `rfl` proof are unchanged.
- Omit source lines 626–638, including `perfect_play_results_in_draw` and its
  `sorry`. Do not replace them with an axiom or a theorem parameter.
- `Cryptids/Chess.lean` provides the public reference aggregate, imported by
  `Cryptids.lean`. No executable counterpart, invariant-preservation theorem,
  evaluator, backend, or machine was added.

No `Invariants.lean` wrapper was necessary at this stage: the exact historical
domain is already expressed by the compiled `Reachable` predicate. The
[domain contract](DOMAIN.md) fixes its use, the raw-refinement domain, and precise
desired invariant conclusions. Their later proofs remain separate obligations;
none is assumed as a new axiom or smuggled into the target proposition.

## Correspondence and trust checks

Run the portable checker with

```sh
python3 scripts/verify_chess_reference.py
```

It performs the following checks in order:

1. Recompute the archive's SHA-256 and Git blob identity and enforce its extent.
2. Compare the retained rule/strategy namespace body and sanity theorem directly
   with the hash-pinned source excerpts. Reject body changes, imported conjecture
   tooling, or placeholders/custom axioms in the port modules.
3. Check the actual compiler version and commit against the frozen record.
4. Independently extract a source-only module from the archive, not from the
   port. Compile it on this toolchain with a broad Mathlib import and without
   the open theorem or repository-specific attributes. Generated files stay
   under ignored `.lake/chess-reference-check/`.
5. Load the source and port into separate Lean environments and compare their
   entire `Chess` declaration inventories. Compare types, values, theorem proof
   terms, inductive/constructor data, recursor rules, safety, and reducibility
   fields; recursively compare their dependency declarations as well.
6. Canonically rename **bound universe parameters by position** before comparing
   declarations. The compiler embeds each input module's hygiene context in
   generated universe names, for example in `PieceKind.noConfusionType`.
   This alpha-renaming does not change a type or its universe relationships.
   No rule expressions, proof terms, or recursor fields are skipped to force
   a match.
7. Reject unsafe/partial dependencies and any axiom outside `propext`,
   `Classical.choice`, and `Quot.sound`. Check that the open draw theorem is
   absent from the port environment.
8. Compile an otherwise identical negative-control source changing the automatic
   draw threshold from 150 to 151 halfmoves. Require the same compiled-declaration
   checker to reject it. This is verification code, not a proposed rule change.
9. Verify the frozen manifest without modifying it. `--freeze` is an explicit
   manifest-writing operation and still performs all correspondence checks.

Observed output:

```text
Matched 385 Chess declarations; 2728 dependency declarations
Permitted axioms used: #[propext, Classical.choice, Quot.sound]
Compiled chess declarations and dependencies match
Semantic negative control rejected
Chess reference correspondence verified
```

The dependency count includes the root declarations. Both independently prepared
inputs were accepted by Lean. The comparison is a structural check of their
elaborated declarations under one toolchain, supported by exact source extraction;
it is not a newly proved in-logic isomorphism between distinct inductive types or
a claim that old and new toolchains produce identical bytecode.

This verifies the port's correspondence to the pinned source. It does not prove
all English-rule fidelity statements, strategy determinacy, dead-position
decidability, or the draw conjecture. Those limits remain as recorded in the
source audit and M3–M4 roadmap.

## Build and integration evidence

Commands completed successfully:

```sh
lake exe cache get
lake build Cryptids.Chess
lake build
python3 scripts/verify_chess_reference.py --freeze
python3 scripts/verify_chess_reference.py
```

The new chess modules build without warnings. The default build succeeds for
`Cryptids` and `Challenge`; the pre-existing independent `Challenge.lean` file
emits its expected placeholder-theorem warnings. It is not imported by the chess
reference, and the correspondence check excludes those axioms from its closure.
The repository's toolchain, Lake configuration, and dependency manifest were not
changed. No other worktree's build directory was linked into this one.

The existing Linux workflow now runs the portable reference checker after the
default build, and its path filters include the checker, archive, and freeze
manifest. This task did not run or claim the Linux/bwrap comparator or submit a
PR. Independent machine/challenge verification remains a later milestone.

The [port gate ledger](PORT_GATES.md) records final checks and manual review.
Historical [audit evidence](EVIDENCE.md) is retained as the evidence for the
earlier audit-only task; this record supplies the subsequent implementation and
freeze evidence.

## Audit finding disposition and future changes

| Finding | M1 disposition |
| --- | --- |
| F1: open-conjecture trust boundary | Resolved for the port: theorem omitted; full compiled dependency check accepts only standard axioms |
| F2: arbitrary raw states and unchecked updates | Exact public domain contract documented; no false claim of input validation; preservation lemmas remain later work |
| F3: strategy/result supporting lemmas | Retained as explicit M3–M4 obligations; no target-quantifier change |
| F4: exact dead-position reachability | Definition preserved; executable decision/preservation proof remains M3 |
| F5: imports, toolchain, and port correspondence | Resolved by the targeted-import build and source/compiled correspondence checks |
| F6: edition and claim abstraction | Clarified in reference module documentation and domain contract |

The frozen rule definitions are the baseline for M2. A later semantic correction
requires a new audit, a versioned reference decision, and an explicit account of
its effect on the strategic proposition. A toolchain or administrative migration
requires fresh correspondence/build evidence and a reviewed manifest update;
CI must not silently regenerate the manifest to accept changes.

M1 is complete as a reviewed, built, source-preserving **reference specification**.
M2, move-generator work, strategy proofs, compilation, machine construction,
state reduction, PRs, and outreach remain on hold.
