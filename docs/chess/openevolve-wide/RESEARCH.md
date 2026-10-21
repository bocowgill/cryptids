# Broader search method and scope

The completed pilot ordered a supplied six-policy family. This run instead uses
unconstrained token generation to propose expression trees for a compiler's blank
initializer. OpenEvolve's controller, feedback, population and checkpoints are
still the real pinned upstream framework at
`59dfe764b5ab4478ac00214432fcac33bbe2bf4b`; the framework is not patched.

The remote CPU model is
[Qwen2.5-Coder-1.5B-Instruct](https://huggingface.co/Qwen/Qwen2.5-Coder-1.5B-Instruct),
revision `2e1fd397ee46e1388853d2af2c993145b0f1098a`. The official model API revision
is retained in `model-pin.json`. This is larger than the pilot's 0.5B model, but
that alone establishes no quality improvement. No paid inference API is used.
Runner cost and model API cost are distinct; billing is not measured.

The representation is supplied: write a sequence while moving L/R, move a counted
number of cells while preserving symbols, concatenate plans, reverse and concatenate
bit sequences, and calculate lengths with nonnegative addition and literal
multiplication. The AST language admits newly composed expressions. There is no
finite list of complete responses, response trie or exclusion-driven enumeration.
Only literals and typed operations reach the Lean translator; no generated Python
or generated Lean tactic source is executed.

The proof support is also supplied. In particular, the reverse-write idea and its
universal tape identity were engineered before the model run. The search model is
not credited with inventing that idea. Its prompt supplies the primitive semantics
and explains that the tape has no distinguished absolute origin; it does not show
the reversed-write solution. The initial population contains only the accepted
forward-write/long-return seed. Preflight checks of supplied identities are not
model proposals and are recorded separately.

Certificate diagnostics in later feedback can expose the names or source of the
supplied proof identities. Absence of an explicit solution in the static system
prompt does not mean that every later model request is free of optimization hints.

The current proof tactic bank covers schedules reducible to the two supplied
universal identities by Lean simplification. This restricts certification more
than proposal generation: a valid new plan can be rejected as unproved. Such a
failure is retained, never treated as a mathematical refutation. This campaign
tests generative schedule proposals and their certified assembly; it does not
implement unrestricted compiler or Lean-proof synthesis.

Independent finite fixtures use a sparse integer-indexed tape and all 127 binary
inputs of lengths zero through six. They compare both cell contents and the head's
position relative to the written input. They also independently compare expanded
instruction length against symbolic cost. These are rejection filters, not proofs.
The universal Lean certificate and final paid-machine theorem are mandatory.

The search budget is 24 proposals with raw token/prompt logs, 256 generated tokens
and 4096 input tokens per proposal, checkpointing every iteration, and a 40-minute
subprocess timeout. Duplicate and unsuccessful proposals remain in provenance.
The supplied million-state savings target is an objective, not evidence of success.
No claim of optimality, autonomous discovery, advantage over enumeration or
scalability follows from this experiment.
