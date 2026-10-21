"""Metadata/saved-output replay only. Never executes Lean, fixtures or a machine."""
import hashlib
import json
from pathlib import Path
import zipfile

ROOT = next(p for p in Path(__file__).resolve().parents if (p/'lean-toolchain').exists())
BASE = ROOT/'docs/chess/field-binary'


def read(path):
    return json.loads(Path(path).read_text())


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def authenticate(folder):
    run, retention = read(folder/'run-api.json'), read(folder/'retention.json')
    artifact, = read(folder/'artifact-api.json')['artifacts']
    assert run['status']=='completed' and run['name']=='Chess field-aware binary pilot'
    assert run['head_branch']=='codex/chess-openevolve-pilot'
    assert run['id']==retention['run_id']==artifact['workflow_run']['id']
    assert run['head_sha']==retention['commit']==artifact['workflow_run']['head_sha']
    assert run['conclusion']==retention['conclusion']
    assert artifact['digest']=='sha256:'+sha(folder/'artifact.zip')
    assert artifact['size_in_bytes']==(folder/'artifact.zip').stat().st_size
    assert retention['artifact_sha256']==sha(folder/'artifact.zip')
    assert retention['logs_sha256']==sha(folder/'logs.zip')
    entries=read(folder/'archive-entries.json')
    with zipfile.ZipFile(folder/'artifact.zip') as archive:
        assert archive.testzip() is None
        names=[i.filename for i in archive.infolist() if not i.is_dir()]
        assert len(names)==len(set(names)) and set(names)==set(entries)
        for name in names:
            assert not Path(name).is_absolute() and '..' not in Path(name).parts
            data=archive.read(name)
            assert entries[name]=={'bytes':len(data),'sha256':hashlib.sha256(data).hexdigest()}
            assert data==(folder/'unpacked'/name).read_bytes()
    with zipfile.ZipFile(folder/'logs.zip') as logs:
        assert logs.testzip() is None
        text='\n'.join(logs.read(n).decode(errors='replace') for n in logs.namelist())
    return run,entries,text


def main():
    folder=BASE/'evidence/current'
    run,entries,logs=authenticate(folder)
    assert run['conclusion']=='success'
    phases={name:read(folder/'unpacked'/(name+'.json'))
            for name in ['probe','proofs','contracts','fixtures','counts']}
    pins=read(BASE/'baseline-pins.json'); assert len(pins)==237
    source=phases['proofs']['source_sha256']
    commands=[read(p) for p in (folder/'unpacked/commands').glob('*.json')]
    for name,d in phases.items():
        assert d['status']=='passed' and d['phase']==name
        assert d['source_sha256']==source and d['frozen_source_sha256']==pins
        assert d['commit']==run['head_sha'] and int(d['run_id'])==run['id']
        for check in d['checks']:
            assert check in commands and not check['timed_out']
            assert hashlib.sha256(check['output'].encode()).hexdigest()==check['output_sha256']
            assert check['exit'] in (0,1)
    for name,h in dict(pins,**source).items(): assert sha(ROOT/name)==h,name
    for name in ['probe','proofs','fixtures']:
        assert all(c['exit']==0 for c in phases[name]['checks'])
    contract=phases['contracts']['checks']; assert len(contract)==7
    assert contract[0]['exit']==0 and 'FieldBinary foundation audit passed' in contract[0]['output']
    for c,marker in zip(contract[1:],['Forbidden axiom: sorryAx',
        'The open chess conjecture is a dependency','Proof generator is a mathematical dependency:',
        'error:','error:','error:']):
        assert c['exit']==1 and marker in c['output']
    assert 'Permitted axioms: #[propext, Classical.choice, Quot.sound]' in contract[0]['output']
    tables=read(folder/'unpacked/routines.json')
    detail=read(folder/'unpacked/fixtures-detail.json')
    assert detail['status']=='passed' and detail['binary_machine_cases']==311296
    assert detail['raw_cell_patterns']==8192 and detail['valid_encoded_cells']==1250
    assert len(detail['routines'])==len(tables['routines'])==38
    assert len(detail['negative_controls'])==6 and all(c['rejected'] for c in detail['negative_controls'])
    assert detail['universal_proof'] is False
    assert tables['codec']==[[i,i if i<5 else 0] for i in range(8)]
    # Inspect saved sizes and scope flags only. Do not simulate rows locally.
    counts=phases['counts']
    assert counts['candidate_standalone']=={'read':[39,66,93,120],
        'write_constant':[5,11,17,23],'move':[14,14]}
    assert counts['legacy_marginal_body_allocation']=={'read':211410,'write':82000,'move':110}
    assert counts['comparison_scopes_differ'] is True and counts['full_chess_machine_constructed'] is False
    assert counts['accepted_chess_machine_states']==390491642
    assert sha(folder/'unpacked/routines.json')==counts['exported_rows_sha256']==phases['fixtures']['exported_rows_sha256']
    for table,fixture in zip(tables['routines'],detail['routines']):
        assert len(table['rows'])==len(table['exits'])==table['states']==fixture['states']
        assert table['kind']==fixture['kind'] and table['offset']==fixture['offset']
    for marker in ['Field binary compiler probe passed','Field binary proof verification passed',
                   'Field binary contracts passed','Field binary fixtures passed','Field binary counts passed']:
        assert marker in logs
    failures=[]
    for previous in sorted((BASE/'evidence/history').iterdir()):
        if (previous/'retention.json').exists():
            old,_,_=authenticate(previous)
            assert old['conclusion']=='failure'
            failures.append(old['id'])
    record={'status':'passed','run_id':run['id'],'computation_commit':run['head_sha'],
        'artifact_sha256':sha(folder/'artifact.zip'),'logs_sha256':sha(folder/'logs.zip'),
        'archive_entries':len(entries),'source_sha256':source,'frozen_inputs':len(pins),
        'phases':list(phases),'actual_binary_machine_cases':detail['binary_machine_cases'],
        'retained_failed_runs':failures,'comparison_scopes_differ':True,
        'full_chess_machine_constructed':False,'accepted_chess_machine_states':390491642,
        'local_heavy_computation':False}
    (BASE/'evidence/evidence-check.json').write_text(json.dumps(record,indent=2)+'\n')
    print('Field binary retained evidence passed')

if __name__=='__main__': main()
