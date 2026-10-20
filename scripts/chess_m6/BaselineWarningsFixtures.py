#!/usr/bin/env python3
"""Check the narrow inherited default-build warning exception."""
import importlib.util
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
spec = importlib.util.spec_from_file_location("m6_verifier", ROOT / "scripts/verify_chess_m6.py")
verifier = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verifier)
recorded = json.loads((ROOT / "docs/chess/m5/results.json").read_text())
previous = recorded["baseline"]["outputs"]["default_build"]
known = [line for line in previous.splitlines() if "warning:" in line]
assert len(known) == 22
assert verifier.baseline_diagnostic("clean build\n") == "clean build"
assert "warning:" not in verifier.baseline_diagnostic(previous)
for output in (
    previous + "warning: Cryptids/Chess/Compilation/Image.lean:1:0: declaration uses `sorry`\n",
    previous + "warning: Challenge.lean:310:8: declaration uses `sorry`\n",
    previous + known[0] + "\n",
    "\n".join(known[1:]),
    "\n".join(reversed(known)),
    previous.replace(known[0], known[0].replace("236", "235")),
):
    try:
        verifier.baseline_diagnostic(output)
    except RuntimeError:
        pass
    else:
        raise AssertionError("Accepted an altered warning set")
print("M6 baseline warning controls passed: 2 accepted, 6 rejected")
