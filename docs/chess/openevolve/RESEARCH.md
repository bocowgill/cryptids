# Method and provenance

This pilot uses [OpenEvolve](https://github.com/algorithmicsuperintelligence/openevolve/tree/59dfe764b5ab4478ac00214432fcac33bbe2bf4b),
pinned at 59dfe764b5ab4478ac00214432fcac33bbe2bf4b. It uses that framework’s
controller, candidate database, evaluator feedback, population selection and
checkpoint writer. The remote adapter implements its supported custom LLM
interface. No framework patches are applied.

The public [Qwen2.5-Coder-0.5B-Instruct model](https://huggingface.co/Qwen/Qwen2.5-Coder-0.5B-Instruct/tree/ea3f2471cf1b1f0db85067f1ef93848e38e88c25)
is pinned at ea3f2471cf1b1f0db85067f1ef93848e38e88c25. It runs with local CPU
inference on the remote GitHub runner. No model API key, paid model API or copying
of personal login tokens is involved. GitHub runner minutes and CPU/memory are
separate compute costs; account billing is not inferred from an absent API bill.

## Scope of the experiment

We supplied the terminal-write optimization, its universal proof, the six-policy
grammar and the evaluator. The model selects among unseen members using constrained
autoregressive generation. The baseline is evaluated first; its policy and previous
proposals are excluded from later decoding. Thus the run exhausts five remaining
policies, ordered by the model. This is a small integration and regression pilot,
not evidence that unrestricted AI discovered an optimization or that an evolutionary
algorithm outperformed enumeration. There is no proof synthesis in this pilot.

Terminal modes are 0 (old return), 1 (skip the terminal return) and 2 (redirect a
terminal write to state zero). Live modes are 0 (old return) and 1 (skip it).
Candidates are one POLICY literal assignment; generated code is never executed.
Feedback contains syntax errors, finite operational counterexamples, universal
certificate diagnostics, measured evaluation time and state count.

Finite fixtures are rejection filters only. A policy enters the certified-best
set only after a checked universal theorem for its exact compiler implementation.
Unproved policies receive score zero. The accepted M7 policy scores 0.5; its
certified one-state reduction scores 1.0. Counts include all initialization states.
The certificate binds the data policy to one of two fixed, audited compilers;
it does not certify arbitrary generated Lean or Python.

The reference traditions are [AlphaEvolve](https://arxiv.org/abs/2506.13131)
(model proposals scored by automated evaluators),
[STOKE](https://arxiv.org/abs/1211.0557) (program superoptimization), and
[sound loop superoptimization](https://theory.stanford.edu/~aiken/publications/papers/asplos17.pdf)
(semantic validation for loops). This pilot implements a much smaller finite
family with Lean certificates; it does not reproduce those full algorithms.

## Limits and follow-on decision

The certified one-state saving is deliberately modest. The model ordered all five
nonbaseline policies in the supplied family; the third passed its Lean certificate.
The actual smaller blank machine retains the frozen target, and rejected controls,
prompts, feedback, checkpoints and passing regressions are preserved. This proves
the integration works for the supplied family. A larger campaign needs more
productive operators; whether a stronger model helps requires another experiment.
The one-state success supplies no evidence of scalability.
No outreach or later milestone is part of this run.
