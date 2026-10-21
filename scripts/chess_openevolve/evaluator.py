"""Strict data grammar, operational fixtures, then an actual universal Lean certificate."""
import ast
import hashlib
import json
import os
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-openevolve/search"


def parse(code):
    tree = ast.parse(code)
    if len(tree.body) != 1 or not isinstance(tree.body[0], ast.Assign):
        raise ValueError("Exactly one POLICY literal assignment is allowed")
    statement = tree.body[0]
    if len(statement.targets) != 1 or not isinstance(statement.targets[0], ast.Name) or statement.targets[0].id != "POLICY":
        raise ValueError("Candidate may only set POLICY")
    policy = ast.literal_eval(statement.value)
    if (type(policy) is not tuple or len(policy) != 2 or
            any(type(v) is not int for v in policy) or policy[0] not in range(3) or policy[1] not in range(2)):
        raise ValueError("Outside the finite terminal/live lowering grammar")
    return policy


def fixtures(policy):
    """Independent bounded executions. They reject bad modes; they are not the proof."""
    # Post rows: (next, op, value). None means halt. Three representative programs,
    # both input cells, and enough fuel to expose wrong live head position / redirect.
    programs = [
        {(0, 0): (1, "write", 1), (0, 1): (1, "write", 0)},
        {(0, b): (2, "write", 1) for b in (0, 1)} |
        {(2, 0): (2, "move", 1), (2, 1): (1, "write", 0)},
        {(0, b): (2, "write", 1) for b in (0, 1)} |
        {(2, b): (0, "move", 1) for b in (0, 1)},
    ]
    results = []
    for number, rows in enumerate(programs):
        for bit in (0, 1):
            def run(candidate):
                tape, head, state = {0: bit}, 0, 0
                for _ in range(40):
                    if state == 1:
                        return True
                    row = rows.get((state, tape.get(head, 0)))
                    if row is None:
                        return True
                    state, op, value = row
                    if op == "move":
                        head += value
                    else:
                        tape[head] = value
                        if candidate:
                            if state == 1:
                                if policy[0] == 1:
                                    head += 1
                                elif policy[0] == 2:
                                    state = 0
                                    head += 1
                            elif policy[1] == 1:
                                head += 1
                return False
            expected, actual = run(False), run(True)
            results.append({"program": number, "bit": bit, "source_halts_within_bound": expected,
                            "candidate_halts_within_bound": actual})
            if expected != actual:
                raise ValueError("Counterexample: " + json.dumps(results[-1]))
    return results


def certificate(policy):
    if os.environ.get("CHESS_REMOTE") != "1":
        raise RuntimeError("Lean evaluation is remote-only")
    WORK.mkdir(parents=True, exist_ok=True)
    if policy == (0, 0):
        source = '''import Cryptids.Compilation.Binary
open Turing ConjectureMachines ConjectureMachines.Compilation
example {q : Nat} [NeZero q] (M : TM0.Machine Bool (Fin q)) (input : List Bool) :
    (StateTransition.eval (step (Binary.compile M))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval M input).Dom :=
  Binary.compile_halts_input M input
'''
    elif policy == (1, 0):
        source = '''import Cryptids.Optimisation.TerminalBinary
open Turing ConjectureMachines ConjectureMachines.Compilation
open ConjectureMachines.Optimisation
example {q : Nat} [NeZero q] (h : Fin q) (M : TM0.Machine Bool (Fin q))
    (terminal : ∀ b, M h b = none) (input : List Bool) :
    (StateTransition.eval (step (TerminalBinary.compile h M))
      ⟨0, Tape.mk₁ (input.map Binary.encodeSymbol)⟩).Dom ↔ (TM0.eval M input).Dom :=
  TerminalBinary.halts_input h M terminal input
'''
    else:
        raise ValueError("No universal certificate available for this policy")
    digest = hashlib.sha256(source.encode()).hexdigest()
    path = WORK / (digest + ".lean")
    path.write_text(source)
    command = ["lake", "env", "lean", "-M6144", "-DwarningAsError=true", str(path)]
    result = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, timeout=180)
    proof = {"argv": command, "exit": result.returncode, "stdout": result.stdout,
             "stderr": result.stderr, "source_sha256": digest, "source": source}
    if result.returncode or "warning:" in result.stdout + result.stderr:
        raise ValueError("Certificate rejected: " + json.dumps(proof))
    return proof


def evaluate(path):
    from openevolve.evaluation_result import EvaluationResult
    begin = time.monotonic()
    code = Path(path).read_text()
    record = {"code": code, "code_sha256": hashlib.sha256(code.encode()).hexdigest(),
              "certified": False}
    try:
        policy = parse(code)
        record["policy"] = policy
        record["fixtures"] = fixtures(policy)
        record["proof"] = certificate(policy)
        record["certified"] = True
        states = 392046822 - int(policy == (1, 0))
        record["states"] = states
        metrics = {"combined_score": 1.0 if policy == (1, 0) else 0.5,
                   "certified": 1.0, "states": states}
    except Exception as error:
        record["rejection"] = str(error)
        metrics = {"combined_score": 0.0, "certified": 0.0, "states": 0.0}
    record["seconds"] = time.monotonic() - begin
    WORK.mkdir(parents=True, exist_ok=True)
    with (WORK / "evaluations.jsonl").open("a") as handle:
        handle.write(json.dumps(record) + "\n")
    return EvaluationResult(metrics, {"feedback": json.dumps(record)})
