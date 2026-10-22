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
WORK = ROOT / ".lake/chess-field-branch"
sys.path.insert(0, str(ROOT))
def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()
def metadata():
    pins = json.loads((ROOT / "docs/chess/field-branch/baseline-pins.json").read_text())
    for name, digest in pins.items():
        assert sha(ROOT / name) == digest, "Frozen input changed: " + name
    print("Field branch frozen inputs passed")
    return pins
def sources():
    paths = [".github/workflows/chess_field_branch.yml", "lakefile.chess-field-branch.toml",
             "docs/chess/field-branch/baseline-pins.json"]
    paths += [str(p.relative_to(ROOT)) for base in ["Cryptids/Compilation/FieldBranch", "scripts/chess_field_branch"]
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
    target="Certificate" if (ROOT/"Cryptids/Compilation/FieldBranch/Certificate.lean").exists() else "Graph"
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-branch.toml","build",
                 "Cryptids.Compilation.FieldBranch."+target],"Build completed successfully",timeout=1200)]
    save("probe",checks)
    print("Field branch compiler probe passed")

def proofs():
    checks=[run(["lake","--wfail","-f","lakefile.chess-field-branch.toml","build",
                 "Cryptids.Compilation.FieldBranch.Certificate","chess_field_branch_audit",
                 "chess_field_branch_export"],"Build completed successfully",timeout=1200)]
    save("proofs",checks)
    print("Field branch proof verification passed")

def contracts():
    audit=["lake","env",str(ROOT/".lake/build/bin/chess_field_branch_audit")]
    checks=[run(audit,"FieldBranch foundation audit passed")]
    for flag,expected in [("--negative-control","Forbidden axiom: sorryAx"),
                          ("--negative-control-open","The open chess conjecture is a dependency"),
                          ("--negative-control-generator","Proof generator is a mathematical dependency:")]:
        checks.append(run(audit+[flag],expected,code=1))
    for name,text in [
        ("BadCount", "example : (675 : Nat) = 670 := by decide +kernel"),
        ("BadConnector", "example : machine.transition 404 0 = none := by decide +kernel"),
        ("BadStore", "example : ConjectureMachines.Compilation.SharedModel.branchFn ConjectureMachines.Compilation.RuntimeModel.s003 none = false := by decide +kernel")]:
        path=WORK/(name+".lean")
        path.write_text("import Cryptids.Compilation.FieldBranch.Certificate\nopen ConjectureMachines.Compilation.FieldBranch\n"+text+"\n")
        checks.append(run(["lake","env","lean","-M6144","-DwarningAsError=true",str(path)],"error:",code=1))
    save("contracts",checks)
    print("Field branch contracts passed")

def fixtures():
    checks=[run(["lake","env",str(ROOT/".lake/build/bin/chess_field_branch_export"),
                 str(WORK/"machine.json")],"Field branch machine export passed")]
    checks.append(run([sys.executable,"scripts/chess_field_branch/fixtures.py"],
                      "Field branch independent fixtures passed",timeout=600))
    detail=json.loads((WORK/"fixtures-detail.json").read_text())
    save("fixtures",checks,detail=detail,exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field branch fixtures passed")

def counts():
    data=json.loads((WORK/"machine.json").read_text())
    assert data["states"]==len(data["rows"])==len(data["ports"])==675
    assert data["inventory"]==[425,5,245]
    measured=[0]*3
    boundaries=[425,430,675]
    for q,row in enumerate(data["rows"]):
        group=next(i for i,b in enumerate(boundaries) if q<b)
        measured[group]+=1
        terminal=q>=430 and (q-430)%49==48
        assert all((x is None)==terminal for x in row)
        for x in row:
            if x is not None: assert 0<=x[2]<675
    assert measured==data["inventory"] and sum(measured)==675
    assert data['entries']==[0,49,98,147,196]
    assert data['return_entries']==[430,479,528,577,626]
    assert sum(p is not None for p in data["ports"])==5
    for v in range(5):
        assert data['ports'][478+49*v]==dict(store=v,successor='normal3' if v<3 else 'reverse_push_s000')
    assert all(data["rows"][q][b] is not None for q in [404,409,414,419,424] for b in [0,1])
    save("counts",[],states=675,inventory=measured,entries=data["entries"],
         retained_continuation_states=425,additional_states=250,final_ports=5,
         final_port_indices=[478,527,576,625,674],
         full_chess_machine_constructed=False,accepted_chess_machine_states=390491642,
         exported_rows_sha256=sha(WORK/"machine.json"))
    print("Field branch counts passed")

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
