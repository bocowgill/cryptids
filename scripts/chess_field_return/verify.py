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
WORK = ROOT / ".lake/chess-field-return"
sys.path.insert(0, str(ROOT))
def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def metadata():
    pins = json.loads((ROOT / "docs/chess/field-return/baseline-pins.json").read_text())
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen input changed: " + name
    print("Field return frozen inputs passed")
    return pins
def sources():
    paths = [".github/workflows/chess_field_return.yml", "lakefile.chess-field-return.toml",
             "docs/chess/field-return/baseline-pins.json"]
    paths += [str(p.relative_to(ROOT)) for base in ["Cryptids/Compilation/FieldReturn", "scripts/chess_field_return"]
              for p in (ROOT/base).glob("*") if p.is_file() and p.suffix in (".lean", ".py")]
    return {p:sha(ROOT/p) for p in sorted(paths)}
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
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-return.toml","build",
                 "Cryptids.Compilation.FieldReturn.Certificate"],"Build completed successfully",timeout=1200)]
    save("probe",checks)
    print("Field return compiler probe passed")

def proofs():
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-return.toml","build",
                 "Cryptids.Compilation.FieldReturn.Certificate","chess_field_return_audit",
                 "chess_field_return_export"],"Build completed successfully",timeout=1200)]
    save("proofs",checks)
    print("Field return proof verification passed")

def contracts():
    audit=["lake","env",str(ROOT/".lake/build/bin/chess_field_return_audit")]
    checks=[run(audit,"FieldReturn foundation audit passed")]
    for flag,expected in [("--negative-control","Forbidden axiom: sorryAx"),
                          ("--negative-control-open","The open chess conjecture is a dependency"),
                          ("--negative-control-generator","Proof generator is a mathematical dependency:")]:
        checks.append(run(audit+[flag],expected,code=1))
    for name,text in [
        ("BadCount", "example : (245 : Nat) = 240 := by decide +kernel"),
        ("BadDispatch", "example : block.transition 12 0 = some (0, Turing.Dir.left, 37) := by decide +kernel"),
        ("BadCodec", "example : symbolCode (some Turing.PartrecToTM2.Γ'.bit1) = 3 := by decide +kernel")]:
        path=WORK/(name+".lean")
        path.write_text("import Cryptids.Compilation.FieldReturn.Certificate\nopen ConjectureMachines.Compilation.FieldReturn\n"+text+"\n")
        checks.append(run(["lake","env","lean","-M6144","-DwarningAsError=true",str(path)],"error:",code=1))
    save("contracts",checks)
    print("Field return contracts passed")

def fixtures():
    checks=[run(["lake","env",str(ROOT/".lake/build/bin/chess_field_return_export"),
                 str(WORK/"machine.json")],"Field return machine export passed")]
    checks.append(run([sys.executable,"scripts/chess_field_return/fixtures.py"],
                      "Field return independent fixtures passed",timeout=600))
    detail=json.loads((WORK/"fixtures-detail.json").read_text())
    save("fixtures",checks,detail=detail,exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field return fixtures passed")

def counts():
    data=json.loads((WORK/"machine.json").read_text())
    assert data["states"]==len(data["rows"])==len(data["ports"])==245
    assert data["inventory"]==[60,5,120,55,5]
    measured=[0,0,0,0,0]
    for q,row in enumerate(data["rows"]):
        c=q%49
        group=0 if c<12 else 1 if c==12 else 2 if c<37 else 3 if c<48 else 4
        measured[group]+=1
        assert all((x is None)==(c==48) for x in row)
        for bit,x in enumerate(row):
            if x is not None:
                assert x[0]==bit and x[2]//49==q//49
    assert measured==data["inventory"]
    assert len(data["entries"])==5 and len(set(data["entries"]))==5
    assert sum(p is not None for p in data["ports"])==5
    assert all(len(row)==2 for row in data["rows"])
    save("counts",[],states=data["states"],inventory=data["inventory"],entries=data["entries"],
         full_chess_machine_constructed=False,accepted_chess_machine_states=390491642,
         exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field return counts passed")

def main():
    parser=argparse.ArgumentParser()
    for flag in ["metadata","probe","proofs","contracts","fixtures","counts"]:
        parser.add_argument("--"+flag,action="store_true")
    args=parser.parse_args()
    for flag in ["metadata","probe","proofs","contracts","fixtures","counts"]:
        if getattr(args,flag): globals()[flag]()
if __name__=="__main__": main()
