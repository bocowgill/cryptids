# Repository working rules

## Lean formatting

- Keep authored and generated Lean source lines within 100 characters.
- Before committing Lean edits, inspect changed lines with a lightweight text-only
  width check. When editing a Lean generator, inspect its templates for line width
  and check the emitted source remotely before the expensive proof stages.
- Fix generated formatting in the generator, so regeneration preserves the fix.
- Preserve theorem statements and strict linting. Do not disable a linter to hide
  a formatting error.
- Never reformat the frozen chess specification, accepted pinned files, or retained
  historical evidence. Apply formatting rules to new or otherwise mutable work.

## Failure diagnosis and resource use

- Diagnose a failed workflow from its command logs and retained result summary.
  Distinguish formatting errors, proof errors, memory limits, time limits, and
  nonfatal dependency warnings. A failure notification alone does not identify
  the cause.
- Record a bounded pilot's obstruction and make a specific corrective change
  before retrying. Do not raise resource limits merely to make a run pass.
- All heavy chess-campaign work stays remote, including Lean/Lake/LSP/LeanProbe,
  compilation, generation, simulations, fixtures, and machine-state counting.
  Keep local inspections lightweight and tool output compact.
- A paused campaign stays paused unless the user requests resumption. Small
  explicitly requested maintenance edits do not resume the research campaign.
