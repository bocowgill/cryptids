#!/usr/bin/env python3
"""A bounded, actual OpenEvolve run. Execute only on a remote Linux runner."""
import importlib.metadata
import json
import os
import platform
import subprocess
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from scripts.chess_openevolve.model import CpuModel, MODEL, REVISION


def main():
    assert os.environ.get("CHESS_REMOTE") == "1", "Search is remote-only"
    from openevolve import run_evolution
    from openevolve.config import Config, LLMModelConfig
    begin = time.monotonic()
    work = ROOT / ".lake/chess-openevolve/search"
    work.mkdir(parents=True, exist_ok=True)
    if (work / "model.jsonl").exists():
        raise RuntimeError("Use a fresh output directory, or explicitly resume a checkpoint")
    config = Config(max_iterations=5, checkpoint_interval=1, language="python",
                    diff_based_evolution=False, max_code_length=100, random_seed=1729)
    config.llm.models = [LLMModelConfig(name=MODEL, init_client=CpuModel,
                                       timeout=240, retries=0, max_tokens=32)]
    config.llm.evaluator_models = []
    config.database.num_islands = 1
    config.database.population_size = 8
    config.database.archive_size = 8
    config.database.log_prompts = True
    config.database.embedding_model = None
    config.prompt.system_message = (
        "Optimize the compiler's terminal-write routine. Reply with one Python assignment "
        "POLICY = (terminal, live). The decoder constrains this grammar. terminal=0: "
        "write-right-return-left then enter terminal; 1: write-right then enter terminal; "
        "2: write-right then redirect to initial state zero. live=0 preserves the return; "
        "live=1 skips the return on nonterminal writes. Terminal has no transitions on "
        "either bit. Preserve halting for ALL Post machines and ALL inputs. Score requires "
        "the universal Lean certificate. Reduce the paid binary state count. "
        "This is a supplied finite candidate family, not unrestricted program synthesis.")
    config.prompt.num_top_programs = 1
    config.prompt.num_diverse_programs = 0
    config.prompt.use_template_stochasticity = False
    config.evaluator.parallel_evaluations = 1
    config.evaluator.timeout = 240
    config.evaluator.max_retries = 0
    config.evaluator.cascade_evaluation = False
    config.evolution_trace.enabled = True
    config.evolution_trace.include_code = True
    config.evolution_trace.include_prompts = True
    result = run_evolution(str(ROOT / "scripts/chess_openevolve/seed.py"),
                           str(ROOT / "scripts/chess_openevolve/evaluator.py"),
                           config=config, iterations=5, output_dir=str(work / "openevolve"),
                           cleanup=False)
    versions = {d.metadata["Name"]: d.version for d in importlib.metadata.distributions()}
    installed_source = json.loads(importlib.metadata.distribution("openevolve").read_text("direct_url.json"))
    assert installed_source["vcs_info"]["commit_id"] == "59dfe764b5ab4478ac00214432fcac33bbe2bf4b"
    record = {"status": "passed" if result.best_score == 1.0 else "no-improvement",
              "best_code": result.best_code, "metrics": result.metrics,
              "best_score": result.best_score, "elapsed_seconds": time.monotonic() - begin,
              "model": MODEL, "model_revision": REVISION, "versions": versions,
              "installed_openevolve_source": installed_source,
              "python": sys.version, "platform": platform.platform(),
              "paid_api_calls": 0, "maximum_proposals": 5, "maximum_output_tokens_per_proposal": 32,
              "search_space": "supplied six-policy family; model constrained to unseen policies",
              "openevolve_commit": "59dfe764b5ab4478ac00214432fcac33bbe2bf4b"}
    (work / "result.json").write_text(json.dumps(record, indent=2) + "\n")
    print(json.dumps({k: v for k, v in record.items() if k != "versions"}))
    assert record["status"] == "passed", "No model-proposed certified improvement"


if __name__ == "__main__":
    main()
