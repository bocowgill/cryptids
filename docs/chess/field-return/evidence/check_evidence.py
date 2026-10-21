#!/usr/bin/env python3
"""Local-safe verification of saved official outputs and hashes; no machine/proof execution."""
import hashlib
import json
from pathlib import Path
import zipfile
ROOT = next(p for p in Path(__file__).resolve().parents
            if (p/'lean-toolchain').is_file() and (p/'Cryptids').is_dir())
HERE = Path(__file__).resolve().parent

def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()

def load(path):
    return json.loads(Path(path).read_text())

def retained(folder):
    run = load(folder/'run-api.json')
    api = load(folder/'artifact-api.json')['artifacts']
    retention = load(folder/'retention.json')
    assert run['status']=='completed'
    assert len(api)==1
    assert api[0]['digest']=='sha256:'+sha(folder/'artifact.zip')
    assert api[0]['size_in_bytes']==(folder/'artifact.zip').stat().st_size
    assert api[0]['workflow_run']['head_sha']==run['head_sha']==retention['commit']
    assert retention['run_id']==run['id']
    assert retention['artifact_sha256']==sha(folder/'artifact.zip')
    assert retention['logs_sha256']==sha(folder/'logs.zip')
    entries=load(folder/'archive-entries.json')
    with zipfile.ZipFile(folder/'artifact.zip') as archive:
        assert archive.testzip() is None
        names=[i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names)==len(set(names))==len(entries)
        assert set(names)==set(entries)
        for name in names:
            assert not Path(name).is_absolute() and '..' not in Path(name).parts
            content=archive.read(name)
            assert len(content)==entries[name]['bytes']
            assert hashlib.sha256(content).hexdigest()==entries[name]['sha256']
            assert (folder/'unpacked'/name).read_bytes()==content
    return run


def main():
    folder=HERE/'current'
    run=retained(folder)
    assert run['conclusion']=='success'
    jobs=load(folder/'jobs-api.json')['jobs']
    assert jobs and all(j['status']=='completed' and j['conclusion']=='success' for j in jobs)
    work=folder/'unpacked'
    phases=[load(work/(name+'.json')) for name in ['probe','proofs','contracts','fixtures','counts']]
    sources=phases[0]['source_sha256']
    frozen=load(ROOT/'docs/chess/field-return/baseline-pins.json')
    for phase in phases:
        assert phase['status']=='passed' and phase['commit']==run['head_sha']
        assert str(phase['run_id'])==str(run['id'])
        assert phase['source_sha256']==sources and phase['frozen_source_sha256']==frozen
        for check in phase['checks']:
            assert check['shell'] is False and not check['timed_out']
            assert hashlib.sha256(check['output'].encode()).hexdigest()==check['output_sha256']
    for name,digest in (sources|frozen).items():
        assert sha(ROOT/name)==digest, 'Changed bound input: '+name
    contracts=phases[2]['checks']
    assert len(contracts)==7 and contracts[0]['exit']==0
    assert 'FieldReturn foundation audit passed' in contracts[0]['output']
    assert all(c['exit']==1 for c in contracts[1:])
    assert 'Forbidden axiom: sorryAx' in contracts[1]['output']
    assert 'open chess conjecture' in contracts[2]['output']
    assert 'Proof generator is a mathematical dependency:' in contracts[3]['output']
    assert all('error:' in c['output'] for c in contracts[4:])
    fixtures=load(work/'fixtures-detail.json')
    assert fixtures==phases[3]['detail'] and fixtures['status']=='passed'
    assert fixtures['raw_cell_patterns']==8192 and fixtures['store_values']==5
    assert fixtures['visited_controls']==245 and fixtures['valid_unmarked_cell_patterns']==625
    assert len(fixtures['corruption_controls'])==6
    assert all(c['rejected'] for c in fixtures['corruption_controls'])
    counts=phases[4]
    assert counts['states']==245 and counts['inventory']==[60,5,120,55,5]
    assert counts['full_chess_machine_constructed'] is False
    assert counts['accepted_chess_machine_states']==390491642
    digest=sha(work/'machine.json')
    assert phases[3]['exported_rows_sha256']==counts['exported_rows_sha256']==digest
    # Read saved native export metadata only; do not run transitions or derive a fresh count.
    native=load(work/'machine.json')
    assert native['states']==counts['states'] and native['inventory']==counts['inventory']
    assert native['entries']==counts['entries']
    with zipfile.ZipFile(folder/'logs.zip') as logs:
        output='\n'.join(logs.read(n).decode(errors='replace') for n in logs.namelist() if not n.endswith('/'))
    for marker in ['Field return compiler probe passed','Field return proof verification passed',
                   'Field return contracts passed','Field return fixtures passed','Field return counts passed']:
        assert marker in output
    failures=[]
    for history in sorted((HERE/'history').glob('*')):
        if history.is_dir():
            old=retained(history)
            assert old['conclusion']!='success'
            failures.append(old['id'])
    print(json.dumps({'run_id':run['id'],'commit':run['head_sha'],
                      'source_files':len(sources),'frozen_files':len(frozen),
                      'cases':fixtures['binary_machine_cases'],'states':counts['states'],
                      'retained_unsuccessful_runs':failures}))
    print('Field return saved evidence passed')

if __name__=='__main__': main()
