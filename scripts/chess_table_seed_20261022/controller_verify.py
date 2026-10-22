#!/usr/bin/env python3
"""Bounded remote construction and independent finite decoder experiment."""
import importlib.util
import json
import os
from pathlib import Path
import signal
import sys
import time
import traceback

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / '.lake/chess-table-controller-20261022'


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    started = time.monotonic()

    def stop_children():
        # The pinned runner creates each direct child as a new process group.
        # Kill that complete group before raising through its Popen context.
        task = Path(f'/proc/{os.getpid()}/task/{os.getpid()}/children')
        for token in task.read_text().split():
            child = int(token)
            try:
                if os.getpgid(child) == child:
                    os.killpg(child, signal.SIGKILL)
                else:
                    os.kill(child, signal.SIGKILL)
            except ProcessLookupError:
                pass

    def hard_deadline(_signum, _frame):
        try:
            stop_children()
        finally:
            os._exit(124)

    def work_deadline(_signum, _frame):
        signal.signal(signal.SIGALRM, hard_deadline)
        remaining = 600 - (time.monotonic() - started)
        if remaining <= 0:
            hard_deadline(None, None)
        signal.setitimer(signal.ITIMER_REAL, remaining)
        stop_children()
        raise TimeoutError('Combined pilot work deadline; three seconds reserved for diagnostics')

    signal.signal(signal.SIGALRM, work_deadline)
    signal.setitimer(signal.ITIMER_REAL, max(0.001, 597 - (time.monotonic() - started)))
    spec = importlib.util.spec_from_file_location('accepted_runner', ROOT / 'scripts/chess_field_reverse/verify.py')
    runner = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(runner)
    runner.WORK = WORK
    WORK.mkdir(parents=True, exist_ok=True)
    if (WORK / 'source-manifest.json').exists():
        raise SystemExit('Use a fresh output directory; preserve prior evidence')
    checks = []
    phase = 'source_pins'
    try:
        pin_path = 'docs/chess/campaign-2026-10-22/accepted-998176-pins.json'
        pins = json.loads((ROOT / pin_path).read_text())
        for name, digest in pins.items():
            assert runner.sha(ROOT / name) == digest, 'Accepted bytes changed: ' + name
        paths = [pin_path, '.github/workflows/chess_table_controller_20261022.yml',
                 'scripts/chess_table_seed_20261022/controller_verify.py',
                 'scripts/chess_table_seed_20261022/controller.py',
                 'scripts/chess_table_seed_20261022/controller_fixtures.py',
                 'docs/chess/campaign-2026-10-22/round-04/CONTROLLER-CONTRACT.md',
                 'docs/chess/campaign-2026-10-22/round-04/SEED-ARCHITECTURE.md',
                 'docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/unpacked/pilot-summary.json']
        manifest = dict(commit=os.environ.get('GITHUB_SHA'), run_id=os.environ.get('GITHUB_RUN_ID'),
                        workflow_commit=os.environ.get('GITHUB_SHA'),
                        source_sha256={p: runner.sha(ROOT / p) for p in paths},
                        frozen_source_sha256=pins,
                        scope='Finite physical decoder only; universal Lean proof and full-machine acceptance absent',
                        limits=dict(wall_seconds=600, child_address_space_bytes=4294967296,
                                    controller_states=50000))
        (WORK / 'source-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')

        def bounded(command, banner, stage_cap):
            remaining = 597 - (time.monotonic() - started)
            if remaining <= 0:
                raise TimeoutError('Combined 600-second pilot budget exhausted')
            return runner.run(['prlimit', '--as=4294967296', '--'] + command, banner,
                              timeout=min(stage_cap, remaining))

        phase = 'controller_construction'
        checks.append(bounded([sys.executable, 'scripts/chess_table_seed_20261022/controller.py',
                               '--output', str(WORK)], 'CHESS_TABLE_SEED_CONTROLLER_BUILT', 120))
        machine = json.loads((WORK / 'controller.json').read_text())
        assert type(machine['states']) is int and 0 < machine['states'] <= 50000, 'Decoder allocation exceeds bounded pilot gate'
        controller_sha = runner.sha(WORK / 'controller.json')
        phase = 'independent_fixtures'
        checks.append(bounded([sys.executable, 'scripts/chess_table_seed_20261022/controller_fixtures.py',
                               '--controller', str(WORK / 'controller.json'), '--output', str(WORK)],
                              'CHESS_TABLE_SEED_CONTROLLER_PILOT_PASSED', 597))
        detail = json.loads((WORK / 'controller-summary.json').read_text())
        assert detail['status'] == 'passed'
        assert detail['universal_proof'] is False and detail['new_accepted_machine'] is False
        assert detail['controller_sha256'] == controller_sha, 'Summary/controller identity mismatch'
        assert type(detail['controller_states']) is int and detail['controller_states'] == machine['states']
        assert type(detail['transition_rows']) is int and detail['transition_rows'] == 2 * machine['states']
        assert runner.sha(WORK / 'controller.json') == controller_sha, 'Checker changed controller bytes'
        (WORK / 'verification.json').write_text(json.dumps(dict(manifest, status='passed', checks=checks,
            controller_sha256=controller_sha, detail=detail, elapsed_seconds=time.monotonic()-started), indent=2)+'\n')
        print('Bounded structured decoder verification passed')
        signal.setitimer(signal.ITIMER_REAL, 0)
    except BaseException as exc:
        (WORK / 'verification-failure.json').write_text(json.dumps(dict(status='failed', phase=phase,
            error_type=type(exc).__name__, error=str(exc), elapsed_seconds=time.monotonic()-started,
            completed_checks=checks, universal_proof=False, new_accepted_machine=False), indent=2)+'\n')
        (WORK / 'verification-failure.txt').write_text(traceback.format_exc())
        raise


if __name__ == '__main__':
    main()
