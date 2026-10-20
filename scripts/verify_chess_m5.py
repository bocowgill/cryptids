#!/usr/bin/env python3
"""Verify the M5 backend, literal tables, independent contracts and prior milestones."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[1]
WORK = ROOT / ".lake/chess-m5-check"
NAMES = ("white", "black", "draw", "refutation")
FIXTURES = {
    "white": ["w", 0, 2], "black": ["b", 2, 0], "draw": ["w", 0, 1],
    "refutation": ["w", ["b", 2, 1], 0],
}


def require(test, message):
    if not test:
        raise RuntimeError(message)


def run(*args, success=True, warnings=False):
    p = subprocess.run(args, cwd=ROOT, env=dict(os.environ, ELAN_NO_UPDATE_CHECK="1"),
                       stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True, timeout=2400)
    require((p.returncode == 0) == success, f"Unexpected exit {p.returncode}: {args}\n{p.stdout}")
    require(warnings or "warning:" not in p.stdout, f"Unexpected warning: {p.stdout}")
    return p.stdout


def lean(script, *args, success=True):
    return run("lake", "env", "lean", "-DwarningAsError=true", "--run", script, *args,
               success=success)


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def inputs():
    paths = sorted((ROOT / "Cryptids/Compilation").glob("*.lean")) + [
        ROOT / "Cryptids/Compilation.lean", ROOT / "ChessM5Challenge.lean",
        ROOT / "Cryptids.lean", ROOT / "lakefile.toml", ROOT / "lakefile.chess-m5.toml",
        ROOT / "lean-toolchain",
        ROOT / "lake-manifest.json", ROOT / ".github/workflows/lean_action_ci.yml",
    ] + sorted((ROOT / "scripts").glob("*ChessM5.lean")) + [Path(__file__).resolve()] + [
        ROOT / f"artifacts/chess_m5/{name}.txt" for name in NAMES] + [
        ROOT / "artifacts/chess_m5/manifest.json"]
    return {str(p.relative_to(ROOT)): digest(p) for p in paths}


def source_safe(text):
    # Comments may describe the partial-recursive source language; reject declaration escapes.
    return not re.search(r"\b(sorry|admit|axiom|native_decide|unsafe|implemented_by|_unsafe_rec)\b|"
                         r"\bpartial\s+def\b", text)


def parse(data):
    text = data.decode("ascii")
    require(text.endswith("\n"), "Table lacks final newline")
    lines = text.splitlines()
    require(lines, "Empty table")
    rows = []
    for line in lines:
        require(re.fullmatch(r"(?:---|[01][LR](?:0|[1-9][0-9]*)) (?:---|[01][LR](?:0|[1-9][0-9]*))", line),
                f"Noncanonical table row: {line!r}")
        row = []
        for cell in line.split(" "):
            if cell == "---":
                row.append(None)
            else:
                value = (int(cell[0]), -1 if cell[1] == "L" else 1, int(cell[2:]))
                require(value[2] < len(lines), "Transition outside state range")
                row.append(value)
        rows.append(row)
    return rows


def minimax(tree):
    if isinstance(tree, int):
        return tree
    a, b = minimax(tree[1]), minimax(tree[2])
    return (max if tree[0] == "w" else min)(a, b)


def simulate(rows, limit=200000):
    tape = {}
    state = head = 0
    seen = {}
    for steps in range(limit):
        key = state, head, tuple(sorted(tape.items()))
        if key in seen:
            return {"halted": False, "prefix_steps": steps, "cycle_start": seen[key],
                    "cycle_length": steps - seen[key], "cycle_state": state}
        seen[key] = steps
        transition = rows[state][tape.get(head, 0)]
        if transition is None:
            return {"halted": True, "steps": steps}
        write, direction, state = transition
        if write:
            tape[head] = write
        else:
            tape.pop(head, None)
        head += direction
    return {"halted": False, "prefix_steps": limit}


def baseline():
    prior = {}
    m4_hashes = json.loads((ROOT / "docs/chess/m4/results.json").read_text())["source_sha256"]
    # Independently pin the removed integration additions to the exact previous bytes.
    additions = {
        "Cryptids.lean": ["public import Cryptids.Compilation\n",
            "- `Cryptids.Compilation` — Verified binary backend and blank-tape branching-game examples.\n"],
        ".github/workflows/lean_action_ci.yml": [
            "      - 'scripts/verify_chess_m5.py'\n      - 'scripts/*ChessM5.lean'\n      - 'ChessM5Challenge.lean'\n      - 'lakefile.chess-m5.toml'\n",
            "      - name: Verify compiled branching games and literal binary tables\n"
            "        run: python3 scripts/verify_chess_m5.py\n\n"],
    }
    for name, snippets in additions.items():
        previous = (ROOT / name).read_text()
        for snippet in snippets:
            require(snippet in previous, f"Missing reviewed integration addition in {name}")
            previous = previous.replace(snippet, "")
        require(hashlib.sha256(previous.encode()).hexdigest() == m4_hashes[name],
                f"Unreviewed integration change in {name}")
    # Only integration files may differ from M4; its mathematical/computational sources are fixed.
    allowed = {"Cryptids.lean", ".github/workflows/lean_action_ci.yml"}
    for milestone in ("m2", "m3", "m4"):
        recorded = json.loads((ROOT / f"docs/chess/{milestone}/results.json").read_text())
        for name, expected in recorded["source_sha256"].items():
            if name in allowed:
                continue
            require(digest(ROOT / name) == expected, f"{milestone} input changed: {name}")
        prior[milestone] = recorded["source_sha256"]
    results = {}
    for name, command, warnings in (
        ("default_build", ["lake", "build"], True),
        ("reference", ["python3", "scripts/verify_chess_reference.py"], False),
        ("m2", ["python3", "scripts/verify_chess_m2.py"], False),
        ("m3", ["python3", "scripts/verify_chess_m3.py"], False),
        ("m4", ["python3", "scripts/verify_chess_m4.py"], False),
    ):
        results[name] = run(*command, warnings=warnings)
        if name == "default_build":
            warnings_found = [line for line in results[name].splitlines() if "warning:" in line]
            require(all(line.startswith("warning: Challenge.lean:") for line in warnings_found),
                    "Default build introduced a warning outside the existing Challenge baseline")
        print(results[name], end="", flush=True)
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / "baseline.json").write_text(json.dumps({"prior_inputs_verified": prior,
        "reviewed_integration_changes": sorted(allowed), "outputs": results}, indent=2) + "\n")
    print("Chess M5 baseline verification passed")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--baseline", action="store_true")
    args = parser.parse_args()
    if args.baseline:
        baseline()
        return
    extra_target = '\n[[lean_exe]]\nname = "chess_m5_generate"\nroot = "scripts.GenerateChessM5"\n'
    require((ROOT / "lakefile.chess-m5.toml").read_text() ==
            (ROOT / "lakefile.toml").read_text() + extra_target,
            "Generator configuration differs beyond the additional executable")
    before = inputs()
    for token in ("sorry", "admit", "axiom hidden : False", "native_decide", "unsafe def",
                  "implemented_by", "_unsafe_rec", "partial def"):
        require(not source_safe(token), f"Source negative control accepted: {token}")
    for path in sorted((ROOT / "Cryptids/Compilation").glob("*.lean")):
        require(source_safe(path.read_text()), f"Proof escape in {path}")
    challenge_source = (ROOT / "ChessM5Challenge.lean").read_text()
    require(source_safe(challenge_source), "Proof escape in independent challenge")
    require(not re.search(r"\bimport\s+Cryptids", challenge_source),
            "Independent challenge imports the solution")
    WORK.mkdir(parents=True, exist_ok=True)
    outputs = {}
    outputs["build"] = run("lake", "--wfail", "build", "Cryptids.Compilation")
    outputs["native_build"] = run("lake", "-f", "lakefile.chess-m5.toml", "--wfail", "build",
                                  "chess_m5_generate")
    print(outputs["build"], end="", flush=True)
    # Force fresh elaboration: the table loader reads external files outside Lake's normal hash graph.
    print("Rechecking literal data and kernel execution certificates", flush=True)
    outputs["fresh_literal_proofs"] = run("lake", "env", "lean", "-DwarningAsError=true",
                                            "Cryptids/Compilation/Tables.lean")
    (WORK / "invalid-state.txt").write_text("0L9 ---\n")
    (WORK / "BadM5Literal.lean").write_text(
        "import Cryptids.Compilation.BalancedTable\n"
        "open ConjectureMachines.Compilation.Balanced Turing\n"
        "def bad : RowTree (List (Option (Fin 2 × Dir × Fin 3))) :=\n"
        f'  load_balanced_rows% "{WORK / "invalid-state.txt"}"\n')
    rejection = run("lake", "env", "lean", str(WORK / "BadM5Literal.lean"), success=False)
    require("(kernel) application type mismatch" in rejection, "Bounds control not kernel-rejected")
    outputs["audit"] = lean("scripts/AuditChessM5.lean")
    print(outputs["audit"], end="", flush=True)
    for flag, error in (("--negative-control", "Forbidden axiom"),
                        ("--negative-control-open", "open chess conjecture"),
                        ("--negative-control-rec", "Unsafe or partial dependency")):
        result = lean("scripts/AuditChessM5.lean", flag, success=False)
        require(error in result, f"Wrong rejection for {flag}: {result}")
    outputs["fixtures"] = lean("scripts/RunChessM5.lean")
    require("16 assertions" in outputs["fixtures"], "Missing fixtures")
    print(outputs["fixtures"], end="", flush=True)
    exported = WORK / "exported"
    outputs["literal_export"] = lean("scripts/ExportChessM5.lean", str(exported))
    print(outputs["literal_export"], end="", flush=True)
    generated = WORK / "generated"
    print("Regenerating all four native artifacts", flush=True)
    outputs["generation"] = run(str(ROOT / ".lake/build/bin/chess_m5_generate"),
                                 "--output", str(generated))
    print(outputs["generation"], end="", flush=True)
    artifacts = {}
    manifest = json.loads((ROOT / "artifacts/chess_m5/manifest.json").read_text())
    require(manifest["lean_toolchain"] == (ROOT / "lean-toolchain").read_text().strip(),
            "Manifest toolchain mismatch")
    for name in NAMES:
        path = ROOT / f"artifacts/chess_m5/{name}.txt"
        data = path.read_bytes()
        require(data == (generated / path.name).read_bytes(), f"Regeneration mismatch: {name}")
        require(data == (exported / path.name).read_bytes(), f"Literal export mismatch: {name}")
        rows = parse(data)
        result = simulate(rows)
        require(result["halted"] == (minimax(FIXTURES[name]) != 1), f"Wrong branch: {name}")
        if not result["halted"]:
            require(result.get("cycle_length") == 2, f"Expected bounce cycle: {name}")
        artifacts[name] = {"states": len(rows), "sha256": digest(path), "trace": result,
                           "tree": FIXTURES[name], "value": minimax(FIXTURES[name])}
        recorded = manifest["artifacts"][name]
        require(all(recorded[key] == value for key, value in artifacts[name].items()),
                f"Manifest mismatch: {name}")
        require(len(rows) == 2 * recorded["post_states"] + recorded["initializer_states"],
                "State formula mismatch")
        expected_line = (f"{name}: {len(rows)} states; Post {recorded['post_states']}; "
                         f"input {manifest['source_input_bits']}")
        require(expected_line in outputs["generation"], f"Native count mismatch: {name}")
        for state, transitions in recorded.get("loop_rows", {}).items():
            require([list(t) for t in rows[int(state)]] == transitions,
                    f"Loop row mismatch: {name}, {state}")
    for malformed in (b"2L0 ---\n", b"0L1 ---\n", b"0L00 ---\n", b"---\n", b"--- ---"):
        try:
            parse(malformed)
        except (RuntimeError, UnicodeError):
            pass
        else:
            raise RuntimeError(f"Parser accepted negative control: {malformed}")
    challenge = WORK / "ChessM5Challenge.olean"
    print("Checking the standalone target", flush=True)
    outputs["challenge_build"] = run("lake", "env", "lean", "-DwarningAsError=true",
                                      "-o", str(challenge), "ChessM5Challenge.lean")
    outputs["comparison"] = lean("scripts/CompareChessM5.lean", "ChessM5Challenge", str(WORK))
    require("Independent M5 target declarations and dependencies match" in outputs["comparison"],
            "Independent target check missing")
    print(outputs["comparison"], end="", flush=True)
    original = (ROOT / "ChessM5Challenge.lean").read_text()
    mutant = original.replace("def whiteStatement : Prop := Halts whiteMachine",
                               "def whiteStatement : Prop := True")
    require(mutant != original, "Target mutation did not apply")
    (WORK / "MutantM5.lean").write_text(mutant)
    print("Checking independent target mutation control", flush=True)
    run("lake", "env", "lean", "-o", str(WORK / "MutantM5.olean"), str(WORK / "MutantM5.lean"))
    rejection = lean("scripts/CompareChessM5.lean", "MutantM5", str(WORK), success=False)
    require("Compiled declaration mismatch" in rejection, "Target mutation not rejected")
    # Mutate a valid transition, retaining the exact target spelling: dependency comparison
    # must reject the changed table data, not just a changed proposition name or type.
    table = (ROOT / "artifacts/chess_m5/white.txt").read_text()
    require(table[0] in "01", "Unexpected first cell in mutation control")
    mutated_table = WORK / "mutated-white.txt"
    mutated_table.write_text(("1" if table[0] == "0" else "0") + table[1:])
    parse(mutated_table.read_bytes())
    mutant = original.replace('"artifacts/chess_m5/white.txt"', f'"{mutated_table}"')
    require(mutant != original, "Table mutation did not apply")
    (WORK / "MutantTableM5.lean").write_text(mutant)
    print("Checking independent table mutation control", flush=True)
    run("lake", "env", "lean", "-o", str(WORK / "MutantTableM5.olean"),
        str(WORK / "MutantTableM5.lean"))
    rejection = lean("scripts/CompareChessM5.lean", "MutantTableM5", str(WORK), success=False)
    require("Compiled declaration mismatch" in rejection, "Table mutation not rejected")
    require(before == inputs(), "M5 input changed during verification")
    result = {"source_sha256": before, "artifacts": artifacts, "outputs": outputs,
              "controls": {"source": 8, "audit": 3, "parser": 5, "kernel_bounds": 1,
                           "independent_target": 2},
              "nonhalting_evidence": "Lean closed-total-state proofs; traces supplement them"}
    (WORK / "results.json").write_text(json.dumps(result, indent=2) + "\n")
    print("Chess M5 executable verification passed")


if __name__ == "__main__":
    main()
