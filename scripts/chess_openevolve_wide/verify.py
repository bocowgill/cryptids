#!/usr/bin/env python3
"""Remote-only broad search checks; --metadata performs file hashing only."""
import argparse
import hashlib
import json
import os
import resource
import selectors
import signal
import subprocess
import sys
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / ".lake/chess-openevolve-wide"
sys.path.insert(0, str(ROOT))
def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def metadata():
    pins = json.loads((ROOT / "docs/chess/openevolve-wide/baseline-pins.json").read_text())
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen input changed: " + name
    print("Broader OpenEvolve frozen inputs passed")
    return pins
def sources():
    paths = ["Cryptids/Optimisation/ReverseInit.lean", "lakefile.chess-openevolve-wide.toml",
             ".github/workflows/chess_openevolve_wide.yml", "docs/chess/openevolve-wide/baseline-pins.json"]
    paths += [str(p.relative_to(ROOT)) for p in (ROOT / "scripts/chess_openevolve_wide").glob("*")
              if p.is_file() and p.suffix in (".py", ".lean", ".txt")]
    paths += [str(p.relative_to(ROOT)) for name in ["Cryptids/Chess/Optimisation/OpenEvolveWide.lean",
              "Cryptids/Semantics/ChessOpenEvolveWide.lean"] if (p := ROOT / name).is_file()]
    return {p: sha(ROOT / p) for p in sorted(paths)}
def save(phase, checks, **extra):
    WORK.mkdir(parents=True, exist_ok=True)
    (WORK / (phase + ".json")).write_text(json.dumps(dict(status="passed", phase=phase,
        source_sha256=sources(), frozen_source_sha256=metadata(), checks=checks,
        commit=os.environ.get("GITHUB_SHA"), run_id=os.environ.get("GITHUB_RUN_ID"), **extra), indent=2) + "\n")

def run(command, expected="", code=0, timeout=900):
    assert os.environ.get("CHESS_REMOTE") == "1", "Heavy verification is remote-only"
    begin = time.monotonic()
    chunks = []
    timed_out = False
    with subprocess.Popen(command, cwd=ROOT, stdout=subprocess.PIPE,
                          stderr=subprocess.STDOUT, start_new_session=True) as process:
        selector = selectors.DefaultSelector()
        selector.register(process.stdout, selectors.EVENT_READ)
        while selector.get_map():
            if not timed_out and time.monotonic() - begin > timeout:
                try:
                    os.killpg(process.pid, signal.SIGKILL)
                except ProcessLookupError:
                    pass
                timed_out = True
            for key, _ in selector.select(1):
                data = os.read(key.fd, 65536)
                if data:
                    chunks.append(data)
                    sys.stdout.buffer.write(data)
                    sys.stdout.buffer.flush()
                else:
                    selector.unregister(key.fileobj)
        exit_code = process.wait()
        selector.close()
    output = b"".join(chunks).decode("utf-8", errors="replace")
    record = {"argv": command, "cwd": str(ROOT), "shell": False, "exit": exit_code,
              "output": output, "output_sha256": hashlib.sha256(output.encode()).hexdigest(),
              "timed_out": timed_out,
              "elapsed_seconds": time.monotonic() - begin,
              "cumulative_children_peak_rss_kib": resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss}
    logs = WORK / "commands"
    logs.mkdir(parents=True, exist_ok=True)
    (logs / (str(time.time_ns()) + ".json")).write_text(json.dumps(record, indent=2) + "\n")
    assert not timed_out and exit_code == code and expected in output, json.dumps(record)
    return record


def probe():
    checks = [run(["lake", "--wfail", "-f", "lakefile.chess-openevolve-wide.toml", "build",
        "Cryptids.Optimisation.ReverseInit"], "Build completed successfully", timeout=1200)]
    save("probe", checks)
    print("Broader OpenEvolve compiler probe passed")
if __name__ == "__main__":
    parser=argparse.ArgumentParser()
    for phase in ["metadata", "probe"]:
        parser.add_argument("--"+phase, action="store_true")
    for phase, selected in vars(parser.parse_args()).items():
        if selected: globals()[phase]()
