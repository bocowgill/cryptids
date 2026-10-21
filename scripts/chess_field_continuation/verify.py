#!/usr/bin/env python3
"""Remote-only return/continuation checks; --metadata hashes fixed inputs only."""
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
WORK = ROOT / ".lake/chess-field-continuation"
sys.path.insert(0, str(ROOT))
def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def metadata():
    pins = json.loads((ROOT / "docs/chess/field-continuation/baseline-pins.json").read_text())
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen input changed: " + name
    print("Field continuation frozen inputs passed")
    return pins
def sources():
    paths = [".github/workflows/chess_field_continuation.yml", "lakefile.chess-field-continuation.toml",
             "docs/chess/field-continuation/baseline-pins.json"]
    paths += [str(p.relative_to(ROOT)) for base in ["Cryptids/Compilation/FieldContinuation", "scripts/chess_field_continuation"]
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
    target="Certificate" if (ROOT/"Cryptids/Compilation/FieldContinuation/Certificate.lean").exists() else "Graph"
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-continuation.toml","build",
                 "Cryptids.Compilation.FieldContinuation."+target],"Build completed successfully",timeout=1200)]
    save("probe",checks)
    print("Field continuation compiler probe passed")

def proofs():
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-continuation.toml","build",
                 "Cryptids.Compilation.FieldContinuation.Certificate","chess_field_continuation_audit",
                 "chess_field_continuation_export"],"Build completed successfully",timeout=1200)]
    save("proofs",checks)
    print("Field continuation proof verification passed")

def contracts():
    audit=["lake","env",str(ROOT/".lake/build/bin/chess_field_continuation_audit")]
    checks=[run(audit,"FieldContinuation foundation audit passed")]
    for flag,expected in [("--negative-control","Forbidden axiom: sorryAx"),
                          ("--negative-control-open","The open chess conjecture is a dependency"),
                          ("--negative-control-generator","Proof generator is a mathematical dependency:")]:
        checks.append(run(audit+[flag],expected,code=1))
    for name,text in [
        ("BadCount", "example : (425 : Nat) = 420 := by decide +kernel"),
        ("BadConnector", "example : machine.transition 48 0 = none := by decide +kernel"),
        ("BadStore", "example : ConjectureMachines.Compilation.FieldReturn.symbolCode (some Turing.PartrecToTM2.Γ'.bit1) = 3 := by decide +kernel")]:
        path=WORK/(name+".lean")
        path.write_text("import Cryptids.Compilation.FieldContinuation.Certificate\nopen ConjectureMachines.Compilation.FieldContinuation\n"+text+"\n")
        checks.append(run(["lake","env","lean","-M6144","-DwarningAsError=true",str(path)],"error:",code=1))
    save("contracts",checks)
    print("Field continuation contracts passed")

def fixtures():
    checks=[run(["lake","env",str(ROOT/".lake/build/bin/chess_field_continuation_export"),
                 str(WORK/"machine.json")],"Field continuation machine export passed")]
    checks.append(run([sys.executable,"scripts/chess_field_continuation/fixtures.py"],
                      "Field continuation independent fixtures passed",timeout=600))
    detail=json.loads((WORK/"fixtures-detail.json").read_text())
    save("fixtures",checks,detail=detail,exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field continuation fixtures passed")

def counts():
    data=json.loads((WORK/"machine.json").read_text())
    assert data["states"]==len(data["rows"])==len(data["ports"])==425
    assert data["inventory"]==[245,1,39,2,14,1,37,2,14,1,39,5,25]
    measured=[0]*13
    boundaries=[245,246,285,287,301,302,339,341,355,356,395,400,425]
    for q,row in enumerate(data["rows"]):
        group=next(i for i,b in enumerate(boundaries) if q<b)
        measured[group]+=1
        terminal=q>=400 and (q-400)%5==4
        assert all((x is None)==terminal for x in row)
        for x in row:
            if x is not None: assert 0<=x[2]<425
    assert measured==data["inventory"] and sum(measured)==425
    assert len(data["entries"])==5 and len(set(data["entries"]))==5
    assert sum(p is not None for p in data["ports"])==5
    assert all(data["rows"][q][b] is not None for q in [48,97,146,195,244] for b in [0,1])
    save("counts",[],states=425,inventory=measured,entries=data["entries"],
         retained_return_states=245,additional_states=180,final_ports=5,
         full_chess_machine_constructed=False,accepted_chess_machine_states=390491642,
         exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field continuation counts passed")

def main():
    parser=argparse.ArgumentParser()
    for flag in ["metadata","probe","proofs","contracts","fixtures","counts"]:
        parser.add_argument("--"+flag,action="store_true")
    args=parser.parse_args()
    if any(getattr(args,f) for f in ["probe","proofs","contracts","fixtures","counts"]):
        assert os.environ.get("CHESS_REMOTE")=="1", "Heavy verification is remote-only"
    for flag in ["metadata","probe","proofs","contracts","fixtures","counts"]:
        if getattr(args,flag): globals()[flag]()
if __name__=="__main__": main()
