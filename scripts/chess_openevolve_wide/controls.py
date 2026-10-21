"""Remote regression controls for generated schedule parsing, operational semantics and proofs."""
import json
import os
import subprocess
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))
from scripts.chess_openevolve_wide.plans import Plan
from scripts.chess_openevolve_wide.evaluator import certificate, WORK


def main():
    assert os.environ.get("CHESS_REMOTE") == "1", "Controls execute remotely"
    positives = []
    for code in ['PLAN = writes(bits, "R") + moves("L", len(bits))',
                 'PLAN = writes(bits[::-1], "L") + moves("R", 1)']:
        plan = Plan(code)
        positives.append(dict(code=code, fixtures=plan.fixtures(), proof=certificate(plan)))
    rejected = []
    for code in ['import os\nPLAN = []', 'PLAN = __import__("os").system("true")',
                 'PLAN = writes(bits, "R"); print(bits)', 'PLAN = moves("L", True)',
                 'PLAN = writes(bits, "UP")', 'PLAN = bits.__class__']:
        try:
            Plan(code)
        except (ValueError, SyntaxError) as error:
            rejected.append(dict(code=code, stage="syntax", diagnostic=str(error)))
        else:
            raise AssertionError("Malformed candidate was accepted")
    for code in ['PLAN = []', 'PLAN = writes(bits, "R")',
                 'PLAN = writes(bits, "L") + moves("R", 1)',
                 'PLAN = writes(reverse(bits), "L") + moves("L", 1)']:
        try:
            Plan(code).fixtures()
        except ValueError as error:
            rejected.append(dict(code=code, stage="semantic", diagnostic=str(error)))
        else:
            raise AssertionError("Bad tape/head candidate was accepted")
    bad_cost = Plan('PLAN = writes(reverse(bits), "L") + moves("R", 1)')
    bad_cost.length = lambda n: n
    try:
        bad_cost.fixtures()
    except ValueError as error:
        assert "cost mismatch" in str(error)
        rejected.append(dict(stage="cost", diagnostic=str(error)))
    else:
        raise AssertionError("Wrong cost escaped independent fixture accounting")
    # A correct but unsupported schedule must fail the current proof tactic bank.
    # Its finite success is explicitly not promoted into a universal certificate.
    unsupported = Plan('PLAN = moves("L", 1) + writes(reverse(bits), "L") + moves("R", 1)')
    unsupported.fixtures()
    try:
        certificate(unsupported)
    except ValueError as error:
        rejected.append(dict(stage="unproved", diagnostic=str(error)))
    else:
        raise AssertionError("Unsupported universal proof unexpectedly accepted; update control")
    try:
        certificate(Plan('PLAN = writes(bits, "R") + moves("L", len(bits))'), timeout=0.001)
    except subprocess.TimeoutExpired:
        rejected.append(dict(stage="timeout", diagnostic="Actual Lean subprocess timeout rejected"))
    else:
        raise AssertionError("Timeout control did not time out")
    corrupt = positives[1]["proof"]["source"]
    start = corrupt.index(' := by\n', corrupt.index('example (bits'))
    end = corrupt.index('\ntheorem proposed_length', start)
    corrupt = corrupt[:start] + ' := by\n  rfl\n' + corrupt[end:]
    path = WORK / "corrupt-proof.lean"
    path.write_text(corrupt)
    result = subprocess.run(["lake", "env", "lean", "-M6144", "-DwarningAsError=true", str(path)],
        cwd=ROOT, text=True, capture_output=True, timeout=120)
    assert result.returncode != 0 and "error:" in result.stdout + result.stderr
    rejected.append(dict(stage="corrupt-proof", exit=result.returncode,
                         stdout=result.stdout, stderr=result.stderr))
    (WORK.parent / "controls-detail.json").write_text(json.dumps(dict(positives=positives,
        rejections=rejected, no_candidate_python_execution=True), indent=2) + "\n")
    print("Broader OpenEvolve rejection controls passed")


if __name__ == "__main__":
    main()
