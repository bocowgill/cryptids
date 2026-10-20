# Fixed interpreter correspondence

`RuntimeProof.tm2_halts_compiled` proves, for every finite source `Code` and every finite
natural-list argument, that the fixed four-stack interpreter terminates exactly when
the source computation terminates. No source-dependent instruction is in finite control.

The shared DAG rows, runtime program counter, saved values and continuation frames are
ordinary tape data. Every lookup reads the specified triple and restores the entire
program table. All seven opcodes and four continuation bodies have concrete positive
TM2 reachability proofs, including empty lists, zero-valued operands and arbitrary older
frame symbols. The halt continuation consumes its tag and executes the actual halt
instruction before the source terminal state is considered represented.

`RuntimeProof.respects` composes these paths with the source well-formedness invariant.
Every source step has positive target progress. `StateTransition.tr_eval_dom` therefore
gives both halting directions; no inference from a bounded timeout is used. Startup is
proved from ordinary `TM2.init`, including the program delimiter and halt frame.

`Chess.Compilation.Tape.halts_iff` instantiates the result for the fully proved concrete
chess program. It is an unconditional four-stack termination theorem for the negation
of the frozen strategic draw proposition. The binary backend, paid blank initializer,
literal table, measured state count and independent comparator remain separate M6 gates.
