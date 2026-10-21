"""Generated schedule AST -> independent rejection fixtures -> universal Lean certificate."""
import hashlib
import json
import os
import subprocess
import sys
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from scripts.chess_openevolve_wide.plans import Plan
WORK = ROOT / ".lake/chess-openevolve-wide/search"
INPUT_BITS = 1555180
BODY_STATES = 388936461
BASELINE_STATES = 392046821


def certificate(plan, timeout=120):
    assert os.environ.get("CHESS_REMOTE") == "1", "Proof checking is remote-only"
    count = plan.length(INPUT_BITS)
    source = '''import Cryptids.Optimisation.ReverseInit
open Turing ConjectureMachines.Compilation
open ConjectureMachines.Optimisation
def proposed (bits : List (Fin 2)) : List Init.Instruction := ''' + plan.lean.replace("R.", "ReverseInit.") + '''
example (bits : List (Fin 2)) :
    Init.executeList (proposed bits) (Tape.mk₁ []) = Tape.mk₁ bits := by
  first
  | simpa [proposed] using ReverseInit.reverse_correct bits
  | simpa [proposed] using ReverseInit.forward_correct bits
example (bits : List (Fin 2)) (size : bits.length = 1555180) :
    (proposed bits).length = ''' + str(count) + ''' := by
  simp [proposed, ReverseInit.writes, ReverseInit.moves, size]
'''
    digest = hashlib.sha256(source.encode()).hexdigest()
    WORK.mkdir(parents=True, exist_ok=True)
    path = WORK / (digest + ".lean")
    path.write_text(source)
    argv = ["lake", "env", "lean", "-M6144", "-DwarningAsError=true", str(path)]
    result = subprocess.run(argv, cwd=ROOT, text=True, capture_output=True, timeout=timeout)
    record = dict(argv=argv, exit=result.returncode, stdout=result.stdout, stderr=result.stderr,
                  source=source, source_sha256=digest, initializer_states=count)
    (WORK / (digest + ".proof.json")).write_text(json.dumps(record, indent=2) + "\n")
    if result.returncode or "warning:" in result.stdout + result.stderr:
        raise ValueError("Universal certificate rejected: " + json.dumps(record))
    return record


def evaluate(path):
    from openevolve.evaluation_result import EvaluationResult
    begin = time.monotonic()
    code = Path(path).read_text()
    record = dict(code=code, code_sha256=hashlib.sha256(code.encode()).hexdigest(), certified=False)
    try:
        plan = Plan(code)
        record["lean_expression"] = plan.lean
        record["fixtures"] = plan.fixtures()
        record["proof"] = certificate(plan)
        prefix = plan.length(INPUT_BITS)
        states = BODY_STATES + prefix
        record.update(certified=True, initializer_states=prefix, states=states,
                      saving=BASELINE_STATES - states)
        metrics = dict(combined_score=max(0.001, 0.5 + (BASELINE_STATES - states) / (2 * INPUT_BITS)),
                       certified=1.0, states=float(states), saving=float(BASELINE_STATES - states))
    except Exception as error:
        record["rejection"] = str(error)
        metrics = dict(combined_score=0.0, certified=0.0, states=0.0, saving=0.0)
    record["seconds"] = time.monotonic() - begin
    WORK.mkdir(parents=True, exist_ok=True)
    with (WORK / "evaluations.jsonl").open("a") as stream:
        stream.write(json.dumps(record) + "\n")
    # Feedback is intentionally compact; complete diagnostics stay in the raw record.
    feedback = {k: v for k, v in record.items() if k not in ("proof", "fixtures")}
    if "rejection" in feedback:
        feedback["rejection"] = feedback["rejection"][:2400]
    return EvaluationResult(metrics, {"feedback": json.dumps(feedback)})
