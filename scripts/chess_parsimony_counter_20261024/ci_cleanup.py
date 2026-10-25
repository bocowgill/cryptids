#!/usr/bin/env python3
"""Stop/retain only incidental push CI from this bounded phase's exact commits."""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'docs/chess/parsimony-printer-2026-10-24/counter-insertion/evidence/incidental-ci'
PRODUCERS = {
    '791794fce52335ff6bfc917edaeb148d7c09abd6', '79f6cd2c1a6be35707ae4ba10c27ca7be9d74136',
    'a02c5b02861e72c9793d4dd63c130b3ba445701f', '13ba1dc8f0e0be4698160001b135e8663b14bc00',
    'b32b0642816973b1fed4f7bcc6cafd78a212f68f', '084b318e2d0675cc615970062036dd0ab2aceefd',
    '86439e752fc3b2f0fb296d02781e026fca76e655'}
WORKFLOWS = {'.github/workflows/lean_action_ci.yml', '.github/workflows/chess_m6_ci.yml'}


def api(path, method='GET'):
    return subprocess.check_output(['gh', 'api', '--method', method,
        'repos/bocowgill/cryptids/' + path], cwd=ROOT)


def save(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + '\n')


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('mode', choices=['cancel', 'retain'])
    args = parser.parse_args()
    OUT.mkdir(parents=True, exist_ok=True)
    if args.mode == 'cancel':
        assert not (OUT / 'selected.json').exists(), 'Preserve the original selection'
        runs = json.loads(api('actions/runs?branch=codex%2Fchess-openevolve-pilot&per_page=100'))
        selected = [r for r in runs['workflow_runs'] if r['head_sha'] in PRODUCERS and
            r['path'] in WORKFLOWS and r['event'] == 'push' and
            r['head_branch'] == 'codex/chess-openevolve-pilot']
        save(OUT / 'selected.json', selected)
        results = []
        for run in selected:
            folder = OUT / str(run['id'])
            folder.mkdir(exist_ok=True)
            save(folder / 'before.json', run)
            (folder / 'jobs-before.json').write_bytes(api(f'actions/runs/{run["id"]}/jobs'))
            if run['status'] != 'completed':
                api(f'actions/runs/{run["id"]}/cancel', 'POST')
                results.append(dict(run_id=run['id'], cancel_requested=True))
                save(OUT / 'cancel-requests.json', results)
        print(json.dumps(dict(selected=len(selected), cancelled=len(results))))
    else:
        results = []
        for selected in json.loads((OUT / 'selected.json').read_text()):
            run = json.loads(api(f'actions/runs/{selected["id"]}'))
            assert run['head_sha'] in PRODUCERS and run['path'] in WORKFLOWS
            assert run['status'] == 'completed', 'Cancellation still pending: ' + str(run['id'])
            folder = OUT / str(run['id'])
            save(folder / 'terminal.json', run)
            (folder / 'jobs-terminal.json').write_bytes(api(f'actions/runs/{run["id"]}/jobs'))
            logs = api(f'actions/runs/{run["id"]}/logs')
            (folder / 'logs.zip').write_bytes(logs)
            (folder / 'artifacts.json').write_bytes(api(f'actions/runs/{run["id"]}/artifacts'))
            results.append(dict(run_id=run['id'], producer=run['head_sha'], name=run['name'],
                conclusion=run['conclusion'], logs_sha256=hashlib.sha256(logs).hexdigest(),
                logs_bytes=len(logs), scope='Incidental push CI, not pilot acceptance evidence'))
            save(OUT / 'retention.json', results)
        print(json.dumps(dict(terminal=len(results), outcomes=[r['conclusion'] for r in results])))


if __name__ == '__main__':
    main()
