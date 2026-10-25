#!/usr/bin/env python3
"""One free job, no retries, aggregate watchdog, exact-obstruction completion."""
import os
if not (os.environ.get('RH41_REMOTE') == '1'
        and os.environ.get('GITHUB_ACTIONS') == 'true'
        and os.environ.get('RH41_PUBLIC') == 'true'
        and os.environ.get('GITHUB_REPOSITORY') == 'bocowgill/cryptids'
        and os.environ.get('RUNNER_ENVIRONMENT') == 'github-hosted'):
    raise SystemExit('Existing public free GitHub-hosted runner required')

import hashlib
import json
from pathlib import Path
import resource
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / os.environ.get('RH41_OUTPUT_DIR', '.lake/riemann41')
TOTAL, MEMORY, DRIVER_MEMORY = 3180, 6 << 30, 512 << 20
BASE = '6c28d8524fa008c6fb5aadb759df74a55ce96423'


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def optional_read(path):
    try:
        return Path(path).read_text().strip()
    except (FileNotFoundError, PermissionError):
        return None


def rss_group(group):
    total = 0
    for path in Path('/proc').glob('[0-9]*/stat'):
        try:
            pid = int(path.parent.name)
            fields = path.read_text().rsplit(')', 1)[1].split()
            if pid == os.getpid() or int(fields[2]) == group:
                total += int(fields[21]) * os.sysconf('SC_PAGE_SIZE')
        except (FileNotFoundError, ProcessLookupError, PermissionError):
            pass
    return total


def main():
    setup_elapsed = time.time() - float(os.environ['RH41_JOB_START'])
    start = time.monotonic() - setup_elapsed
    original_as_limit = resource.getrlimit(resource.RLIMIT_AS)
    resource.setrlimit(resource.RLIMIT_AS, (DRIVER_MEMORY, original_as_limit[1]))
    OUT.mkdir(parents=True, exist_ok=False)
    mem = dict((line.split(':')[0], int(line.split()[1]) * 1024)
               for line in Path('/proc/meminfo').read_text().splitlines()
               if line.startswith(('MemTotal:', 'MemAvailable:')))
    cgroup_paths = [
        '/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory.current',
        '/sys/fs/cgroup/memory/memory.limit_in_bytes',
        '/sys/fs/cgroup/memory/memory.usage_in_bytes',
        '/sys/fs/cgroup/memory.limit_in_bytes', '/sys/fs/cgroup/memory.usage_in_bytes']
    cgroups = {p: optional_read(p) for p in cgroup_paths}
    summary = dict(status='running', commit=os.environ['GITHUB_SHA'],
                   run_id=os.environ['GITHUB_RUN_ID'], total_limit_seconds=TOTAL,
                   aggregate_limit_bytes=MEMORY, driver_limit_bytes=DRIVER_MEMORY,
                   capacity=dict(host=mem, runner=os.environ.get('RUNNER_NAME'),
                                 environment=os.environ['RUNNER_ENVIRONMENT'],
                                 cgroup=Path('/proc/self/cgroup').read_text(),
                                 visible_cgroup_files=cgroups,
                                 probe_revision='optional-v1-v2-files; rh41 proof pilot'),
                   setup_seconds=setup_elapsed, stages=[], peak_group_plus_driver_rss_bytes=0,
                   candidate_limit=0, exported_candidates=0, new_certified_savings=0,
                   global_avoidance_proved=False, retries=0,
                   stage_caps=dict(setup=900, fidelity=120, filters=180, local=600,
                                   assembly=900, audits=450, packaging=30))
    save('resource-summary.json', summary)

    def stage(name, cap, argv, allow_failure=False):
        before = time.monotonic()
        allowed = min(cap, TOTAL - (before - start))
        if allowed <= 0:
            raise RuntimeError('Whole-job wall cap reached')
        logpath = OUT / (name + '.log')
        with logpath.open('wb') as log:
            child = subprocess.Popen(argv, cwd=ROOT, stdout=log, stderr=log,
                                     start_new_session=True,
                                     preexec_fn=lambda: resource.setrlimit(
                                         resource.RLIMIT_AS, original_as_limit))
            stopped = None
            while child.poll() is None:
                rss = rss_group(child.pid)
                summary['peak_group_plus_driver_rss_bytes'] = max(
                    summary['peak_group_plus_driver_rss_bytes'], rss)
                if rss > MEMORY:
                    stopped = 'aggregate-memory-limit'
                elif time.monotonic() - before > allowed:
                    stopped = 'stage-or-total-time-limit'
                elif logpath.stat().st_size > 2 << 20:
                    stopped = 'output-limit'
                if stopped:
                    os.killpg(child.pid, signal.SIGTERM)
                    try:
                        child.wait(timeout=1)
                    except subprocess.TimeoutExpired:
                        os.killpg(child.pid, signal.SIGKILL)
                        child.wait()
                    break
                time.sleep(0.05)
        record = dict(name=name, argv=argv, exit=child.returncode,
                      seconds=time.monotonic() - before, effective_cap_seconds=allowed,
                      stop=stopped)
        summary['stages'].append(record)
        save('resource-summary.json', summary)
        print(json.dumps(record), flush=True)
        if stopped or (child.returncode and not allow_failure):
            raise RuntimeError('Failed stage: ' + name)
        return child.returncode

    try:
        assert setup_elapsed <= 900, 'Setup cap reached'
        assert os.environ.get('GITHUB_RUN_ATTEMPT') == '1', 'No retry authorized'
        assert os.environ.get('GITHUB_REF') == 'refs/heads/codex/riemann-reduction'
        available = mem['MemAvailable']
        for limit_path, usage_path in zip(cgroup_paths[::2], cgroup_paths[1::2]):
            limit, usage = cgroups[limit_path], cgroups[usage_path]
            if limit and usage and limit.isdigit() and usage.isdigit() and int(limit) < 1 << 60:
                available = min(available, int(limit) - int(usage))
        assert available >= MEMORY + (2 << 30), 'Insufficient free-runner headroom'
        packet = os.environ.get('RH41_LAUNCH_PACKET', 'scripts/riemann41/launch.json')
        launch = json.loads((ROOT / packet).read_text())
        parent = subprocess.check_output(['git', 'rev-parse', 'HEAD^'], text=True).strip()
        assert launch['source_transport_commit'] == parent
        assert launch['baseline_commit'] == BASE
        assert launch['jobs_authorized'] == 1 and launch['retry'] is False
        assert launch['maximum_exported_candidates'] == 0
        assert launch['total_seconds'] == TOTAL and launch['aggregate_memory_bytes'] == MEMORY
        if os.environ.get('RH41_VERIFY02') == '1':
            assert packet == 'scripts/riemann41/launch-verify02.json'
            assert os.environ.get('RH41_OUTPUT_DIR') == '.lake/riemann41-verify02'
            assert launch['failed_producer'] == '06e9245fe2675f1c2e94ba1477982c2d2a8b4816'
        stage('fidelity', 120, [sys.executable, 'scripts/riemann41/pilot.py', 'prepare'])
        stage('filters', 180, [sys.executable, 'scripts/riemann41/pilot.py', 'filters'])
        stage('independent-replay', 60, ['node', 'scripts/riemann41/replay.mjs'])
        stage('setup', 900 - (time.monotonic() - start),
              [sys.executable, 'scripts/riemann41/setup.py'])
        local = stage('local-kernel', 600,
                      ['lake', '--wfail', '-f', 'lakefile.riemann41.toml',
                       'build', 'GuardCore', 'GuardBoot'], allow_failure=True)
        assembly = None
        if local == 0:
            assembly = stage('assembly-probe', 900,
                             ['lake', '--wfail', '-f', 'lakefile.riemann41.toml',
                              'build', 'AssemblyProbe'], allow_failure=True)
        stage('audits', 390, [sys.executable, 'scripts/riemann41/check_lean.py'])
        before_package = time.monotonic()
        subprocess.run(['git', 'diff', '--exit-code', BASE, '--', 'Cryptids', 'Cryptids.lean',
                        'Challenge.lean', 'artifacts', 'comparator', 'lean-toolchain',
                        'lakefile.toml', 'lake-manifest.json', 'verify.py'], check=True)
        finite = json.loads((OUT / 'finite-summary.json').read_text())
        checked = json.loads((OUT / 'lean-verification.json').read_text())
        replay = json.loads((OUT / 'independent-replay.json').read_text())
        obstruction = ('local-kernel-build-failed' if local else
                       'native-intermediate-trace-lemma-unproved' if assembly else
                       'remaining-jump-return-stage-coverage-unproved')
        if finite['status'] != 'finite-filters-passed':
            obstruction = finite['status']
        summary.update(status='exact-obstruction-recorded', obstruction=obstruction,
                       checked_level=checked['checked_level'],
                       transition_evaluations=replay['combined_transition_evaluations'],
                       frame_count=finite['frame_count'], assembly_exit=assembly)
        for path in (ROOT / 'scripts/riemann41').glob('*.lean'):
            (OUT / path.name).write_bytes(path.read_bytes())
        save('result.json', dict(status='exact-obstruction', obstruction=obstruction,
             local_exit=local, assembly_exit=assembly, checked_level=checked['checked_level'],
             global_avoidance_proved=False, unconditional_isolation_proved=False,
             exported_candidates=0, certified_state_savings=0,
             unexecuted=['global blank-run assembly', 'unconditional overwrite corollary']))
        assert time.monotonic() - before_package <= 30, 'Packaging cap'
        assert time.monotonic() - start <= TOTAL, 'Total cap'
        print('RH41_EXACT_OBSTRUCTION_RECORDED', obstruction, flush=True)
    except Exception as error:
        summary.update(status='execution-failed', error=str(error))
        raise
    finally:
        summary['total_seconds'] = time.monotonic() - start
        summary['driver_peak_rss_bytes'] = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * 1024
        invocations = OUT / 'lean-invocations.txt'
        summary['lean_runs'] = len(invocations.read_text().splitlines()) if invocations.exists() else 0
        summary['retained_hashes'] = {
            p.name: hashlib.sha256(p.read_bytes()).hexdigest()
            for p in OUT.iterdir() if p.is_file() and p.name != 'resource-summary.json'}
        save('resource-summary.json', summary)


if __name__ == '__main__':
    main()
