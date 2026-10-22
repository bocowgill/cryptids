#!/usr/bin/env python3
"""Bounded remote proof-repair session; reuse one runner's dependency cache."""
import argparse
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
STATE = ROOT / '.lake/chess-seed-session'
WORK = ROOT / '.lake/chess-seed-20261022'
BRANCH = 'refs/heads/codex/chess-openevolve-pilot'


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT, text=True, timeout=30).strip()


def output(name, value):
    with open(os.environ['GITHUB_OUTPUT'], 'a') as stream:
        stream.write(name + '=' + str(value) + '\n')


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    parser = argparse.ArgumentParser()
    parser.add_argument('mode', choices=['sync', 'check', 'finish'])
    parser.add_argument('--first', action='store_true')
    parser.add_argument('--target', choices=['link', 'format', 'controller', 'blocks', 'scan', 'components', 'codec', 'expander', 'proofs'], default='link')
    args = parser.parse_args()
    STATE.mkdir(parents=True, exist_ok=True)
    result_path = STATE / 'last-result.json'
    if args.mode == 'finish':
        if not result_path.exists():
            raise SystemExit('No proof check ran in this session')
        result = json.loads(result_path.read_text())
        print(json.dumps(result, indent=2))
        raise SystemExit(result['exit'])
    if args.mode == 'sync':
        workflow = STATE / 'executed-workflow.yml'
        if args.first:
            workflow.write_text(git('show', os.environ['GITHUB_SHA'] +
                                   ':.github/workflows/chess_seed_20261022.yml') + '\n')
        if not args.first and result_path.exists():
            last = json.loads(result_path.read_text())
            if last['exit'] == 0:
                output('changed', 'false')
                print('Requested verification passed; session stops without additional builds')
                return
        before = git('rev-parse', 'HEAD')
        if not args.first:
            deadline = time.monotonic() + 300
            while time.monotonic() < deadline:
                remote = git('ls-remote', '--heads', 'origin', BRANCH).split()
                if remote and remote[0] != before:
                    subprocess.run(['git', 'fetch', '--depth=1', 'origin', BRANCH], cwd=ROOT, check=True, timeout=120)
                    subprocess.run(['git', 'reset', '--hard', 'FETCH_HEAD'], cwd=ROOT, check=True, timeout=30)
                    break
                time.sleep(10)
            else:
                output('changed', 'false')
                print('No new source checkpoint within five minutes; session stops recoverably')
                return
        commit = git('rev-parse', 'HEAD')
        # Only a disposable remote evidence directory is cleared. Prior iteration
        # artifacts were uploaded before reaching this step; compiled caches remain.
        if WORK.exists():
            shutil.rmtree(WORK)
        WORK.mkdir(parents=True)
        binding = dict(commit=commit, initial_workflow_commit=os.environ.get('GITHUB_SHA'),
                       run_id=os.environ.get('GITHUB_RUN_ID'), branch=BRANCH,
                       target=args.target, prior_commit=before,
                       executed_workflow_sha256=hashlib.sha256(workflow.read_bytes()).hexdigest())
        shutil.copyfile(workflow, WORK / 'executed-workflow.yml')
        (WORK / 'session-binding.json').write_text(json.dumps(binding, indent=2) + '\n')
        output('changed', 'true')
        output('commit', commit)
        print('Remote verification checkpoint: ' + commit)
        return
    commit = git('rev-parse', 'HEAD')
    environment = dict(os.environ, GITHUB_SHA=commit,
                       CHESS_WORKFLOW_SHA=os.environ['GITHUB_SHA'])
    result = subprocess.run([sys.executable, 'scripts/chess_seed_20261022/verify.py',
                             '--target', args.target], cwd=ROOT, env=environment)
    record = dict(commit=commit, run_id=os.environ.get('GITHUB_RUN_ID'),
                  target=args.target, exit=result.returncode)
    result_path.write_text(json.dumps(record, indent=2) + '\n')
    (WORK / 'session-result.json').write_text(json.dumps(record, indent=2) + '\n')
    raise SystemExit(result.returncode)


if __name__ == '__main__':
    main()
