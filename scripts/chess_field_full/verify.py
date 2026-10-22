#!/usr/bin/env python3
"""All compiler/proof/native/fixture/count work is remote; metadata only is local-safe."""
import argparse
import hashlib
import json
import os
import resource
import selectors
import signal
import shutil
import subprocess
import sys
import time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-field-full'

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def metadata():
    pins=json.loads((ROOT/'docs/chess/field-full/baseline-pins.json').read_text())
    for name,digest in pins.items():
        assert sha(ROOT/name)==digest, 'Frozen input changed: '+name
    print('Full field compiler frozen inputs passed')
    return pins

def sources():
    names=['.github/workflows/chess_field_full.yml','lakefile.chess-field-full.toml',
           'docs/chess/field-full/baseline-pins.json']
    for base in ['Cryptids/Compilation/FieldCompiler','scripts/chess_field_full']:
        names += [str(p.relative_to(ROOT)) for p in (ROOT/base).rglob('*')
                  if p.is_file() and p.suffix in ('.lean','.py')]
    for name in ['Cryptids/Chess/Optimisation/FieldAware.lean',
                 'Cryptids/Machines/ChessFieldAware.lean','Cryptids/Semantics/ChessFieldAware.lean']:
        if (ROOT/name).is_file(): names.append(name)
    return {p:sha(ROOT/p) for p in sorted(names)}

def save(phase,checks,**extra):
    WORK.mkdir(parents=True,exist_ok=True)
    (WORK/(phase+'.json')).write_text(json.dumps(dict(status='passed',phase=phase,
        source_sha256=sources(),frozen_source_sha256=metadata(),checks=checks,
        commit=os.environ.get('GITHUB_SHA'),run_id=os.environ.get('GITHUB_RUN_ID'),**extra),indent=2)+'\n')

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
              "timed_out": timed_out, "timeout_seconds": timeout,
              "elapsed_seconds": time.monotonic() - begin,
              "cumulative_children_peak_rss_kib": resource.getrusage(resource.RUSAGE_CHILDREN).ru_maxrss}
    logs = WORK / "commands"
    logs.mkdir(parents=True, exist_ok=True)
    (logs / (str(time.time_ns()) + ".json")).write_text(json.dumps(record, indent=2) + "\n")
    assert not timed_out and exit_code == code and expected in output, (
        f"Command failed: {command}; exit={exit_code}; expected={expected!r}; "
        f"timeout={timed_out}; diagnostic record={logs}")
    return record

def contracts():
    audit=['prlimit','--as=17179869184','--','lake','env',
           str(ROOT/'.lake/build/bin/chess_field_full_audit')]
    checks=[run(audit,'Chess FieldAware foundation audit passed',timeout=600)]
    for flag,expected in [('--negative-control','Forbidden axiom: sorryAx'),
                          ('--negative-control-open','The open chess conjecture is a dependency'),
                          ('--negative-control-generator','Proof generator is a mathematical dependency:')]:
        checks.append(run(audit+[flag],expected,code=1,timeout=600))
    examples=[
      ('BadCount','example : generated.states = 390491642 := by rw [generated_states]; decide +kernel'),
      ('Unpaid','example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel'),
      ('BadStore',"example : FieldReturn.symbolCode (some Turing.PartrecToTM2.Γ'.bit1) = 3 := by decide +kernel"),
      ('BadFrame','example : FieldBinary.updateCell (false, fun _ ↦ 0) 0 4 = (false, fun _ ↦ 4) := by decide +kernel'),
      ('BadBranch','example : SharedModel.branchFn RuntimeModel.s003 none = false := by decide +kernel'),
      ('BadInitializer','example : (FlatInit.initialise #[0, 1] (⟨1, {transition := fun _ _ ↦ none}⟩ : ConjectureMachines.BundledMachine 2)).states = 1 := by decide +kernel')]
    for name,text in examples:
        path=WORK/(name+'.lean')
        path.write_text('import Cryptids.Semantics.ChessFieldAware\n'
                        'open Chess.Optimisation.FieldAware ConjectureMachines.Compilation\n'+text+'\n')
        checks.append(run(['lake','env','lean','-M6144','-DwarningAsError=true',str(path)],
                          'is false',code=1,timeout=300))
    save('contracts',checks)
    return checks

def native_fixtures():
    checks=[run(['prlimit','--stack=67108864','--','lake','env',
                 str(ROOT/'.lake/build/bin/chess_field_full_export'),
                 str(WORK/'machine-export.json')],'Full field machine export passed',timeout=900)]
    checks.append(run([sys.executable,'scripts/chess_field_full/fixtures.py'],
                      'Full field independent fixtures passed',timeout=900))
    detail=json.loads((WORK/'fixtures-detail.json').read_text())
    assert detail['status']=='passed'
    save('fixtures',checks,detail=detail,export_sha256=sha(WORK/'machine-export.json'))
    return checks

def counts():
    assert os.environ.get('CHESS_REMOTE')=='1','Heavy verification is remote-only'
    detail=json.loads((WORK/'fixtures-detail.json').read_text())
    assert detail['initializer_verified'] is True
    assert detail['labels_covered']==4042
    assert detail['states']==detail['body_states']+detail['initializer_states']
    assert detail['states']<detail['previous_states']==390491642
    assert detail['saved_states']==detail['previous_states']-detail['states']
    assert len(detail['mutation_controls'])>=5
    assert all(c['passed'] is True and c['rejected'] is True for c in detail['mutation_controls'])
    save('counts',[],detail=detail,export_sha256=sha(WORK/'machine-export.json'))
    print('Full field chess reduction passed')

def accepted_regressions():
    checks=[run(['lake','--wfail','-f','lakefile.chess-field-full.toml','build',
                 'Cryptids.Chess.Fixtures','Cryptids.Chess.Evaluation',
                 'Cryptids.Semantics.ChessM7','Cryptids.Compilation.FieldBranch.Certificate'],
                'Build completed successfully',timeout=1200)]
    for name,expected,args in [
      ('scripts/RunChessM2.lean','Rule fixtures passed:',['--rules']),
      ('scripts/RunChessM3.lean','Chess M3 fixtures passed:',[]),
      ('scripts/RunChessM4.lean','Chess M4 fixtures passed:',[]),
      ('scripts/RunChessM5.lean','16 assertions',[]),
      ('scripts/chess_m6/SharedFixtures.lean','Shared fixtures passed:',[]),
      ('scripts/chess_m7/Fixtures.lean','M7 quotient fixtures passed',[]),
      ('scripts/chess_openevolve/Fixtures.lean','Terminal binary fixtures passed',[])]:
        mode=[] if name=='scripts/chess_m6/SharedFixtures.lean' else ['--run']
        checks.append(run(['lake','env','lean','-M6144','-DwarningAsError=true']+
                          mode+[name]+args,expected,timeout=600))
    return checks

def regenerate():
    generated=WORK/'generated/Snapshot.lean'
    generated.parent.mkdir(parents=True,exist_ok=True)
    check=run([sys.executable,'scripts/chess_field_full/generate_snapshot.py',
               '--output',str(generated)],timeout=120)
    snapshot=ROOT/'Cryptids/Compilation/FieldCompiler/Snapshot.lean'
    if snapshot.is_file():
        assert snapshot.read_bytes()==generated.read_bytes(),'Committed snapshot differs from generator'
    else:
        shutil.copyfile(generated,snapshot)
    return check

def full():
    metadata()
    checks=[regenerate(),run(['lake','--wfail','-f','lakefile.chess-field-full.toml','build']+
                            TARGETS['full'],'Build completed successfully',timeout=1800)]
    for phase,token in [('semantics','Full field compiler semantics passed'),
                        ('coverage','Full field compiler coverage passed'),
                        ('machine','Full field chess machine passed')]:
        checks.append(run([sys.executable,'scripts/chess_field_full/verify.py','--'+phase],
                          token,timeout=1800))
    checks.append(run([sys.executable,'scripts/chess_field_full/verify.py','--regressions'],
                      'Full field chess regressions passed',timeout=1800))
    checks.append(run([sys.executable,'scripts/chess_field_full/verify.py','--counts'],
                      'Full field chess reduction passed',timeout=120))
    save('full',checks)
    print('Complete field-aware chess compiler passed')


TARGETS={
 'core':['Cryptids.Compilation.FieldCompiler.Operations','Cryptids.Compilation.FieldCompiler.Bounds'],
 'routines':['Cryptids.Compilation.FieldCompiler.RoutineSemantics'],
 'codec':['Cryptids.Compilation.FieldCompiler.Codec'],
 'graph':['Cryptids.Compilation.FieldCompiler.Graph'],
 'snapshot':['Cryptids.Compilation.FieldCompiler.Snapshot'],
 'semantics':['Cryptids.Compilation.FieldCompiler.Semantics','Cryptids.Compilation.FieldCompiler.Numeric'],
 'machine':['Cryptids.Semantics.ChessFieldAware'],
 'profile':['chess_field_full_export'],
 'full':['Cryptids.Semantics.ChessFieldAware','chess_field_full_audit','chess_field_full_export']}

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--metadata',action='store_true')
    parser.add_argument('--target',choices=TARGETS)
    for flag in ['semantics','coverage','machine','counts','regressions']:
        parser.add_argument('--'+flag,action='store_true')
    args=parser.parse_args()
    if args.metadata: metadata()
    if args.target:
        assert os.environ.get('CHESS_REMOTE')=='1','Heavy verification is remote-only'
        checks=[]
        if args.target=='full':
            full()
            return
        if args.target=='snapshot':checks.append(regenerate())
        checks.append(run(['lake','--wfail','-f','lakefile.chess-field-full.toml','build']+TARGETS[args.target],
                    'Build completed successfully',timeout=1800))
        if args.target=='profile':
            checks.append(run(['prlimit','--stack=67108864','--','lake','env',
                str(ROOT/'.lake/build/bin/chess_field_full_export'),
                str(WORK/'machine-export.json')],'Full field machine export passed',timeout=180))
        save(args.target,checks)
        print('Full field compiler '+args.target+' passed')
    for flag,target in [('semantics','semantics'),('coverage','snapshot'),('machine','machine')]:
        if getattr(args,flag):
            checks=([regenerate()] if flag=='coverage' else [])
            targets=TARGETS[target]+(TARGETS['graph'] if flag=='coverage' else [])
            checks.append(run(['lake','--wfail','-f','lakefile.chess-field-full.toml','build']+
                              targets,'Build completed successfully',timeout=1800))
            save(flag,checks)
            print('Full field chess machine passed' if flag=='machine' else
                  'Full field compiler '+flag+' passed')
    if args.counts:counts()
    if args.regressions:
        checks=contracts()+native_fixtures()+accepted_regressions()
        save('regressions',checks)
        print('Full field chess regressions passed')
if __name__=='__main__':main()
