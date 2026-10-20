#!/usr/bin/env python3
"""Verify the frozen definitions-only chess port against its pinned source.

This checks source identity, exact retained bodies, independent elaboration,
compiled declarations/dependencies, allowed axioms, and a semantic negative control.
Temporary Lean sources and artifacts stay under the ignored .lake directory.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parent.parent
ARCHIVE = ROOT / "docs/chess/m1/source/Chess.lean.txt"
MANIFEST = ROOT / "docs/chess/m1/reference-v1.json"
SOURCE_SHA256 = "ad43e6cfa086ff692daf57b8ee2444faa34f318ff43e05e44b53b27a53e10348"
SOURCE_BLOB = "8018d10a3bfcd375a17c76599cfd3ceafe3e930d"
SOURCE_COMMIT = "03536100b3d15e928f45649e7935f8c2b785337b"
PIN = "leanprover/lean4:v4.35.0-rc4"
FILES = (
    "Cryptids/Chess/Spec.lean",
    "Cryptids/Chess/SpecLemmas.lean",
    "Cryptids/Chess.lean",
    "scripts/CompareChessReference.lean",
    "scripts/verify_chess_reference.py",
    "lean-toolchain",
    "lakefile.toml",
    "lake-manifest.json",
)


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def run(*args: str, expected_success: bool = True) -> str:
    env = dict(os.environ, ELAN_NO_UPDATE_CHECK="1")
    result = subprocess.run(
        args, cwd=ROOT, env=env, text=True, stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT, check=False,
    )
    if expected_success:
        require(result.returncode == 0, f"Command failed: {args}\n{result.stdout}")
    else:
        require(result.returncode != 0, "Semantic negative control was unexpectedly accepted")
    return result.stdout


def namespace_body(text: str) -> str:
    require(text.count("namespace Chess\n") == 1, "Expected exactly one Chess namespace")
    return text[text.index("namespace Chess\n"):]


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--freeze", action="store_true",
        help="explicitly write a new freeze manifest after all correspondence checks pass",
    )
    args = parser.parse_args()

    data = ARCHIVE.read_bytes()
    require(sha256(data) == SOURCE_SHA256, "Pinned source SHA-256 mismatch")
    blob = hashlib.sha1(b"blob " + str(len(data)).encode() + b"\0" + data).hexdigest()
    require(blob == SOURCE_BLOB, "Pinned source Git blob mismatch")
    source = data.decode("utf-8").splitlines(keepends=True)
    require(len(source) == 640, "Unexpected pinned source extent")
    definitions = "".join(source[41:615])
    sanity = "".join(source[616:624]).replace("@[category test, AMS 68 91]\n", "")
    expected_spec = definitions + "\nend Chess\n"
    expected_lemmas = "namespace Chess\n\n" + sanity + "\nend Chess\n"
    spec = (ROOT / FILES[0]).read_text()
    lemmas = (ROOT / FILES[1]).read_text()
    require(namespace_body(spec) == expected_spec, "Retained rule/strategy source bodies differ")
    require(namespace_body(lemmas) == expected_lemmas, "Retained sanity theorem differs")
    for path in FILES[:3]:
        text = (ROOT / path).read_text()
        require(not re.search(r"\bsorry\b|\baxiom\b", text), f"Placeholder/custom axiom in {path}")
        require("FormalConjecturesUtil" not in text, f"Conjecture tooling import in {path}")
    require((ROOT / "lean-toolchain").read_text().strip() == PIN, "Toolchain pin changed")
    version = run("lake", "env", "lean", "--version").strip()
    require("version 4.35.0-rc4," in version, f"Wrong compiler: {version}")
    lean_commit = run("lake", "env", "lean", "--githash").strip()

    # Independent input: construct this only from the hash-checked archive, not Spec.lean.
    work = ROOT / ".lake/chess-reference-check"
    work.mkdir(parents=True, exist_ok=True)
    independent = (
        "module\n\npublic import Mathlib\n\n@[expose] public section\n"
        + definitions + "\n" + sanity + "\nend Chess\n"
    )

    def compile_source(module: str, contents: str) -> None:
        path = work / f"{module}.lean"
        path.write_text(contents)
        output = run(
            "lake", "env", "lean", f"--root={work}",
            "-o", str(work / f"{module}.olean"), str(path),
        )
        require("warning:" not in output, f"Independent source warnings:\n{output}")

    def compare(module: str, expected_success: bool = True) -> str:
        return run(
            "lake", "env", "lean", "--run", "scripts/CompareChessReference.lean",
            module, str(work), expected_success=expected_success,
        )

    compile_source("PinnedChessSource", independent)
    report = compare("PinnedChessSource")
    require("Compiled chess declarations and dependencies match" in report, report)
    counts = re.search(r"Matched (\d+) Chess declarations; (\d+) dependency declarations", report)
    require(counts is not None, "Missing compiled declaration inventory")

    # This changes an actual reference value. The same checker must reject it.
    threshold = "150 ≤ game.current.halfmoveClock"
    require(independent.count(threshold) == 1, "Negative-control site changed")
    mutant = independent.replace(threshold, "151 ≤ game.current.halfmoveClock", 1)
    compile_source("PinnedChessMutant", mutant)
    rejected = compare("PinnedChessMutant", expected_success=False)
    require("Compiled declaration mismatch:" in rejected, f"Unexpected rejection:\n{rejected}")

    freeze = {
        "reference": "chess-reference-v1",
        "source_repository": "bocowgill/formal-conjectures",
        "source_path": "FormalConjectures/Books/Chess.lean",
        "source_commit": SOURCE_COMMIT,
        "source_git_blob": SOURCE_BLOB,
        "source_sha256": SOURCE_SHA256,
        "toolchain": PIN,
        "lean_version": "4.35.0-rc4",
        "lean_commit": lean_commit,
        "rule_edition": "FIDE Laws of Chess effective 2023-01-01",
        "target": "Chess.WhiteCanAvoidLoss ∧ Chess.BlackCanAvoidLoss",
        "retained_definition_lines": [42, 615],
        "retained_sanity_lines": [617, 624],
        "chess_declarations": int(counts.group(1)),
        "dependency_declarations": int(counts.group(2)),
        "semantic_negative_control": "automatic draw threshold 150 → 151 rejected",
        "sha256": {path: sha256((ROOT / path).read_bytes()) for path in FILES},
    }
    if args.freeze:
        MANIFEST.write_text(json.dumps(freeze, indent=2, ensure_ascii=False) + "\n")
    else:
        require(MANIFEST.exists(), "Freeze manifest missing; use --freeze explicitly after review")
        require(json.loads(MANIFEST.read_text()) == freeze, "Frozen reference manifest differs")
    print(report.strip())
    print("Semantic negative control rejected")
    print("Chess reference correspondence verified")


if __name__ == "__main__":
    try:
        main()
    except (OSError, RuntimeError) as error:
        print(f"Chess reference verification failed: {error}", file=sys.stderr)
        sys.exit(1)
