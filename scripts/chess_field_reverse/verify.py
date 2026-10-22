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
WORK = ROOT / '.lake/chess-field-reverse'

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda:stream.read(1024*1024),b''): h.update(block)
    return h.hexdigest()

def metadata():
    pins=json.loads((ROOT/'docs/chess/field-reverse/baseline-pins.json').read_text())
    for name,digest in pins.items():
        assert sha(ROOT/name)==digest, 'Frozen input changed: '+name
    print('Reverse field frozen inputs passed')
    return pins

def sources():
    names=['.github/workflows/chess_field_reverse.yml','lakefile.chess-field-reverse.toml',
           'docs/chess/field-reverse/baseline-pins.json']
    for base in ['scripts/chess_field_reverse']:
        names += [str(p.relative_to(ROOT)) for p in (ROOT/base).rglob('*')
                  if p.is_file() and p.suffix in ('.lean','.py')]
    for name in ['Cryptids/Chess/Optimisation/FieldReverse.lean','Cryptids/Semantics/ChessFieldReverse.lean']:
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
           str(ROOT/'.lake/build/bin/chess_field_reverse_audit')]
    checks=[run(audit,'Chess FieldReverse foundation audit passed',timeout=600)]
    for flag,expected in [('--negative-control','Forbidden axiom: sorryAx'),
                          ('--negative-control-open','The open chess conjecture is a dependency'),
                          ('--negative-control-generator','Proof generator is a mathematical dependency:')]:
        checks.append(run(audit+[flag],expected,code=1,timeout=600))
    examples=[
      ('BadCount','example : generated.states = 4742562 := by rw [generated_states]; decide +kernel'),
      ('Unpaid','example : generated.states = body.states := by rw [generated_states, body_states]; decide +kernel'),
      ('BadInitializer','example : actions.size = 3675880 := by rw [prefix_states]; decide +kernel'),
      ('MissingTurn','example : actions.size = bits.size := by rw [prefix_states, bits_size]; decide +kernel'),
      ('BadBody','example : body.states = 533341 := by rw [body_states]; decide +kernel'),
      ('BadSaving','example : FieldPacked.generated.states - generated.states = 1837940 := by rw [FieldPacked.generated_states, generated_states]; decide +kernel')]
    for name,text in examples:
        path=WORK/(name+'.lean')
        path.write_text('import Cryptids.Semantics.ChessFieldReverse\n'
          'open Chess.Optimisation Chess.Optimisation.FieldReverse ConjectureMachines.Compilation\n'+text+'\n')
        checks.append(run(['lake','env','lean','-M6144','-DwarningAsError=true',str(path)],
                          'is false',code=1,timeout=300))
    save('contracts',checks)
    return checks

def native():
    checks=[run(['lake','--wfail','-f','lakefile.chess-field-reverse.toml','build',
                  'chess_field_reverse_export'],'Build completed successfully',timeout=1800),
            run(['prlimit','--stack=67108864','--','lake','env',
                 str(ROOT/'.lake/build/bin/chess_field_reverse_export'),
                 str(WORK/'machine-export.json')],'Reverse native export passed',timeout=900)]
    save('native',checks)
    return checks

def fixtures():
    checks=[run([sys.executable,'scripts/chess_field_reverse/fixtures.py'],
                 'Reverse independent fixtures passed',timeout=900)]
    detail=json.loads((WORK/'fixtures-detail.json').read_text())
    assert detail['status']=='passed'
    save('fixtures',checks,detail=detail,export_sha256=sha(WORK/'machine-export.json'),
         body_rows_sha256=sha(WORK/'body-rows.jsonl'),
         prefix_rows_sha256=sha(WORK/'prefix-rows.bin'))
    return checks

def counts():
    detail=json.loads((WORK/'fixtures-detail.json').read_text())
    assert detail['status']=='passed' and detail['initializer_verified'] is True
    assert detail['labels_covered']==4042
    assert detail['states']==detail['body_states']+detail['initializer_states']
    assert detail['states']<detail['previous_states']==4742562
    assert detail['saved_states']==detail['previous_states']-detail['states']
    assert detail['complete_body_rows_verified'] is True
    assert detail['complete_body_rows_checked']==2*detail['body_states']
    assert detail['complete_prefix_rows_verified'] is True
    assert detail['complete_prefix_rows_checked']==2*detail['initializer_states']
    assert detail['complete_full_rows_checked']==2*detail['states']
    assert detail['initializer_states'] < 3675880
    assert len(detail['mutation_controls'])>=15
    assert all(c['passed'] is True and c['rejected'] is True for c in detail['mutation_controls'])
    save('counts',[],detail=detail,export_sha256=sha(WORK/'machine-export.json'),
         body_rows_sha256=sha(WORK/'body-rows.jsonl'),
         prefix_rows_sha256=sha(WORK/'prefix-rows.bin'))
    print('Reverse full chess reduction passed')

def accepted_regressions():
    checks=[run(['lake','--wfail','-f','lakefile.chess-field-reverse.toml','build',
                 'Cryptids.Chess.Fixtures','Cryptids.Chess.Evaluation',
                 'Cryptids.Semantics.ChessFieldPacked','Cryptids.Compilation.FieldBranch.Certificate'],
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

TARGETS={
 'machine':['Cryptids.Semantics.ChessFieldReverse'],
 'full':['Cryptids.Semantics.ChessFieldReverse','chess_field_reverse_audit','chess_field_reverse_export']}

def full():
    checks=[run(['lake','--wfail','-f','lakefile.chess-field-reverse.toml','build']+
                 TARGETS['full'],'Build completed successfully',timeout=1800)]
    for target in ['machine']:
        checks.append(run([sys.executable,'scripts/chess_field_reverse/verify.py','--target',target],
                          'Reverse field '+target+' passed',timeout=1800))
    checks.append(run([sys.executable,'scripts/chess_field_reverse/verify.py','--regressions'],
                      'Reverse field regressions passed',timeout=1800))
    checks.append(run([sys.executable,'scripts/chess_field_reverse/verify.py','--counts'],
                      'Reverse full chess reduction passed',timeout=120))
    save('full',checks)
    print('Complete reverse initializer chess compiler passed')

def main():
    parser=argparse.ArgumentParser()
    modes=parser.add_mutually_exclusive_group(required=True)
    modes.add_argument('--metadata',action='store_true')
    modes.add_argument('--target',choices=TARGETS)
    for flag in ['native','regressions','counts']:
        modes.add_argument('--'+flag,action='store_true')
    args=parser.parse_args()
    if args.metadata:
        metadata()
        return
    assert os.environ.get('CHESS_REMOTE')=='1','Heavy verification is remote-only'
    metadata()
    if args.target:
        if args.target=='full':full();return
        checks=[run(['lake','--wfail','-f','lakefile.chess-field-reverse.toml','build']+
                     TARGETS[args.target],'Build completed successfully',timeout=1800)]
        save(args.target,checks)
        print('Reverse field '+args.target+' passed')
    if args.native:native()
    if args.counts:counts()
    if args.regressions:
        checks=contracts()+native()+fixtures()+accepted_regressions()
        save('regressions',checks)
        print('Reverse field regressions passed')

if __name__=='__main__':main()

