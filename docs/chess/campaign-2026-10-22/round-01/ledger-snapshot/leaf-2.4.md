# Complete selective-return chess integration
OWNS: Cryptids/Chess/Optimisation/FieldSelectiveLayout.lean, Cryptids/Chess/Optimisation/FieldSelective.lean, Cryptids/Semantics/ChessFieldSelective.lean, .unlazy/chess-goal-20261022-r01/gates/leaf-2.4.md

Scope: Draft against parent-approved source APIs; final integration depends on all component strict builds. Balanced 8092 local return slots,40461 globalreturns,573802body,2411743full. Frozen source and prefix unchanged.

- [ ] G1: Full executable construction and both halting directions, exact paid tape entry and independent row image, no placeholders.
  EVIDENCE: First complete source draft in all three owned modules. Four source passes cover balanced allocation, universal graph write coverage, every paid initializer/body state, and exact row-image composition. Parent review and remote diagnostics pending; no correctness acceptance claimed.
- [ ] G2: Strict remote full machine Lean build passes, all component gates required.
  EVIDENCE: pending exact commit and remote receipt

Source pass1: instantiated Block.ofTree with1+writeCount and the complete frozen snapshot;
all8092 local slots and40461 halt/live/store returns are paid. Partial lookup remains visible.
Source pass2: coverage is structural at every write-child and label-entry, then lifted through
pure graph loads/branches by compact_write_covered. Numeric raw/encoded swap remains accepted.
Source pass3: reviewed halt-store quotient, Option missing-row behavior, sigma casts, local
target rank, full paid input tape, and both halting directions. Added exact return roundtrip.
Source pass4: root-visible APIs, complete machine/row image, explicit counts and no placeholders;
all source checks are manual, and strict remote build remains a separate unmet gate.
