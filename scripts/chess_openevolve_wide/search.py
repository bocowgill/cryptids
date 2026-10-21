#!/usr/bin/env python3
"""Bounded generative compiler-plan search using the pinned real OpenEvolve controller."""
import importlib.metadata
import json
import os
import platform
import sys
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from scripts.chess_openevolve_wide.model import CpuModel, MODEL, REVISION, WORK


def main():
    assert os.environ.get("CHESS_REMOTE") == "1", "Search is remote-only"
    from openevolve import run_evolution
    from openevolve.config import Config, LLMModelConfig
    WORK.mkdir(parents=True, exist_ok=True)
    if (WORK / "model.jsonl").exists():
        raise RuntimeError("Fresh bounded run required; retain prior evidence before retrying")
    config = Config(max_iterations=24, checkpoint_interval=1, language="python",
        diff_based_evolution=False, max_code_length=4000, random_seed=21901)
    config.llm.models = [LLMModelConfig(name=MODEL, init_client=CpuModel,
        timeout=300, retries=0, max_tokens=256)]
    config.llm.evaluator_models = []
    config.database.num_islands = 1
    config.database.population_size = 32
    config.database.archive_size = 32
    config.database.log_prompts = True
    config.database.embedding_model = None
    config.prompt.system_message = (
        "Optimize a blank-tape Turing-machine compiler initializer. Output ONLY one Python "
        "assignment PLAN = expression, no prose. This is a declarative schedule language; "
        "Python is never executed. bits is an arbitrary finite binary list of length n. "
        "writes(sequence, 'L' or 'R') writes each bit in that order and moves one cell in "
        "that direction after EACH write. moves('L' or 'R', count) preserves scanned bits "
        "while moving count cells. Concatenate schedules with +. Use bits, reverse(bits), "
        "reversed(bits), list(...), bits[::-1], constant binary lists, len(sequence), "
        "small nonnegative integer literals, + and literal multiplication. No loops, "
        "imports, definitions, comparisons or other calls. You may generate new expression "
        "trees; there is no list of allowed complete answers. Start with an infinite blank "
        "tape. Finish with exactly bits starting at the current head and blank cells "
        "elsewhere, for EVERY finite input including empty. Absolute tape location is "
        "irrelevant. One state per schedule instruction; minimize that count. The seed "
        "uses 2*n states. Aim for a much shorter construction. Finite counterexamples "
        "reject bad schedules; a universal Lean certificate is mandatory for reward. "
        "A proof failure means unsupported/unproved, not necessarily false. Return only "
        "PLAN = ... using the stated primitives. Respond to evaluator feedback.")
    config.prompt.num_top_programs = 1
    config.prompt.num_diverse_programs = 1
    config.prompt.use_template_stochasticity = False
    config.evaluator.parallel_evaluations = 1
    config.evaluator.timeout = 180
    config.evaluator.max_retries = 0
    config.evaluator.cascade_evaluation = False
    config.evolution_trace.enabled = True
    config.evolution_trace.include_code = True
    config.evolution_trace.include_prompts = True
    begin = time.monotonic()
    result = run_evolution(str(ROOT / "scripts/chess_openevolve_wide/seed.py"),
        str(ROOT / "scripts/chess_openevolve_wide/evaluator.py"), config=config, iterations=24,
        output_dir=str(WORK / "openevolve"), cleanup=False)
    installed = json.loads(importlib.metadata.distribution("openevolve").read_text("direct_url.json"))
    assert installed["vcs_info"]["commit_id"] == "59dfe764b5ab4478ac00214432fcac33bbe2bf4b"
    model = [json.loads(line) for line in (WORK / "model.jsonl").read_text().splitlines()]
    record = dict(status="completed", best_code=result.best_code, best_score=result.best_score,
        metrics=result.metrics, elapsed_seconds=time.monotonic()-begin, model=MODEL,
        model_revision=REVISION, requests=len(model), maximum_requests=24,
        tokens=sum(m["usage"]["total_tokens"] for m in model),
        search_space="generative typed schedule expression trees; no enumerated response set",
        proof_support="supplied universal identities for forward and reversed initialization",
        explicit_solution_in_system_prompt=False,
        feedback_may_expose_supplied_proof_identities=True, autonomous_discovery_claim=False,
        python=sys.version, platform=platform.platform(), installed_openevolve_source=installed,
        versions={d.metadata["Name"]: d.version for d in importlib.metadata.distributions()},
        paid_api_calls=0, billing_amount_measured=False)
    (WORK / "result.json").write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps({k:v for k,v in record.items() if k != "versions"}))


if __name__ == "__main__":
    main()
