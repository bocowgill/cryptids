# Operational contract and intended scaling argument

This first structural phase targets the printer's data routine. It does not yet
prove the 140-state extractor or the complete blank-tape startup. Proof status
is determined by retained remote Lean results, not this plan.

For a chain whose last data index is `last`, the zero-row at index `i < last`
writes one and moves right to index `i + 1`. The last zero-row writes zero and
moves right into the extractor entry. A marker read at data index `i` writes
zero and jumps to index `last - value[i]`. Thus a finite ordinary execution should
materialize exactly `value[i]` unary ones and one zero separator in `value[i] + 2`
steps, including the marker-query step.

In nearest-head-first tape coordinates, the input has arbitrary left frame `L`,
head one, a work window of `value + 1` zero cells, and arbitrary remaining frame
`R`. The output is at extractor entry with inclusive right side exactly `R`
and left side exactly `0 :: replicate value 1 ++ 0 :: L`. The nearest zero is
the separator; the older zero is the consumed query marker. This preserves
arbitrary frames, including nonzero cells, and fixes the final head. Proving an
exact successful `runFrom` count also excludes early halting along this routine.

`unary_run` is to prove this by induction on the unary distance, uniformly over
any machine satisfying the explicit local row equations. `machine` then defines
the canonical target-encoded block and proves those equations from its numeric
constructor. `query_run` composes the query step and generic chain theorem. None
of these hypotheses assumes the entire printer's correctness or termination.

Scaling points materialize the first 512, 8,192 and all 13,360 real word values.
All share the actual 13,360-word control layout and width 13. Partial arrays use
a default value for unseen entries; only the explicitly sourced prefix rows are
compared with the candidate and the scale theorem's index is restricted to that
prefix. At the final point there are no unseen entries. This tests growing actual
data materialization while the generic proof application remains constant-sized,
without evaluating the enormous physical runtime. It does not claim smaller
synthetic machines are parts of the full machine.

Lean's exported canonical rows are compared with actual candidate rows after
adding the fixed data-block offset six. This binds every observed numeric row,
but the executable byte comparison is not itself a kernel theorem about a binary
file. Final certification must construct the whole printer in Lean and prove
its connection/relocation against the unchanged suffix, retaining the exact
machine identity and all paid controls.

Largest costs and priorities remain: certify the demonstrated 160,097-state
printer reduction; then reconsider the 533,341-state interpreter main and its
40,461 return states through a separately bounded route. The old body quotient
remains uncertified and paused. Small routine proofs here are justified only as
dependencies of the complete 609,247-state candidate, not additional savings.
