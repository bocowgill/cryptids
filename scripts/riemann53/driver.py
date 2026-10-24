#!/usr/bin/env python3
"""Remote-only watchdog. No packages, model calls, retries or Chess job actions."""
import os

if not (os.environ.get('RH53_REMOTE') == '1'
        and os.environ.get('GITHUB_ACTIONS') == 'true'
        and os.environ.get('RH53_PUBLIC') == 'true'
        and os.environ.get('GITHUB_REPOSITORY') == 'bocowgill/cryptids'
        and os.environ.get('RUNNER_ENVIRONMENT') == 'github-hosted'):
    raise SystemExit('Existing public free GitHub-hosted runner required')

import json
from pathlib import Path
import resource
import signal
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / '.lake/riemann53'
TOTAL = 3180
MEMORY = 6 << 30
DRIVER_MEMORY = 512 << 20


def save(name, value):
    (OUT / name).write_text(json.dumps(value, indent=2) + '\n')


def optional_read(path):
    try:
        return Path(path).read_text().strip()
    except (FileNotFoundError, PermissionError):
        return None


def rss_group(group):
    """Aggregate RSS of the isolated child session plus this watchdog."""
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
    elapsed_setup = time.time() - float(os.environ['RH53_JOB_START'])
    start = time.monotonic() - elapsed_setup
    original_as_limit = resource.getrlimit(resource.RLIMIT_AS)
    resource.setrlimit(resource.RLIMIT_AS, (DRIVER_MEMORY, original_as_limit[1]))
    OUT.mkdir(parents=True, exist_ok=False)
    mem = dict((line.split(':')[0], int(line.split()[1]) * 1024)
               for line in Path('/proc/meminfo').read_text().splitlines()
               if line.startswith(('MemTotal:', 'MemAvailable:')))
    cgroup_files = {p: optional_read(p) for p in [
        '/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory.current',
        '/sys/fs/cgroup/memory/memory.limit_in_bytes',
        '/sys/fs/cgroup/memory/memory.usage_in_bytes',
        '/sys/fs/cgroup/memory.limit_in_bytes', '/sys/fs/cgroup/memory.usage_in_bytes']}
    capacity = dict(host=mem, runner=os.environ.get('RUNNER_NAME'),
                    environment=os.environ['RUNNER_ENVIRONMENT'],
                    cgroup=Path('/proc/self/cgroup').read_text(),
                    visible_cgroup_files=cgroup_files,
                    probe_revision='optional-v1-v2-files; unexecuted after first-run failure')
    summary = dict(status='running', candidate_limit=1, total_limit_seconds=TOTAL,
                   aggregate_limit_bytes=MEMORY, driver_limit_bytes=DRIVER_MEMORY,
                   stage_caps=dict(setup=900, generation=120, screening=180,
                                   kernel=600, candidate=900, audits=450, packaging=30),
                   commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
                   capacity=capacity, setup_seconds=elapsed_setup, stages=[],
                   peak_group_plus_driver_rss_bytes=0,
                   new_certified_savings=0, lean_runs=0, baseline_replays=0)
    save('resource-summary.json', summary)
    if elapsed_setup > 900:
        raise RuntimeError('Setup cap reached before generation')
    available = mem['MemAvailable']
    for limit_path, usage_path in [
            ('/sys/fs/cgroup/memory.max', '/sys/fs/cgroup/memory.current'),
            ('/sys/fs/cgroup/memory/memory.limit_in_bytes',
             '/sys/fs/cgroup/memory/memory.usage_in_bytes'),
            ('/sys/fs/cgroup/memory.limit_in_bytes', '/sys/fs/cgroup/memory.usage_in_bytes')]:
        limit, usage = cgroup_files[limit_path], cgroup_files[usage_path]
        if limit and usage and limit.isdigit() and usage.isdigit() and int(limit) < 1 << 60:
            available = min(available, int(limit) - int(usage))
    if available < MEMORY + (2 << 30):
        raise RuntimeError('Insufficient free-runner headroom; no larger runner allowed')
    stages = [('generation', 120, [sys.executable, 'scripts/riemann53/pilot.py', 'generate']),
              ('screening', 180, [sys.executable, 'scripts/riemann53/pilot.py', 'screen']),
              ('audits', 450, ['node', 'scripts/riemann53/replay.mjs'])]
    try:
        for name, cap, argv in stages:
            before = time.monotonic()
            remaining = TOTAL - (before - start)
            allowed = min(cap, remaining)
            if allowed <= 0:
                raise RuntimeError('Whole-recipe wall cap reached')
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
            summary['stages'].append(dict(name=name, argv=argv, exit=child.returncode,
                                          seconds=time.monotonic() - before,
                                          effective_cap_seconds=allowed, stop=stopped))
            save('resource-summary.json', summary)
            print(json.dumps(summary['stages'][-1]), flush=True)
            if stopped or child.returncode:
                raise RuntimeError('Failed stage: ' + name)
        result = json.loads((OUT / 'screen.json').read_text())
        replay = json.loads((OUT / 'independent-replay.json').read_text())
        if result['status'] == 'obstruction' and replay['status'] == 'witness-reproduced':
            summary['status'] = 'obstruction-reproduced'
            print('PILOT_OBSTRUCTION_REPRODUCED', flush=True)
        else:
            summary['status'] = 'open-universal-encoding-obligation'
            raise RuntimeError('No negative witness; universal encoding proof remains open')
    except Exception as error:
        if summary['status'] == 'running':
            summary['status'] = 'execution-failed'
        summary['error'] = str(error)
        raise
    finally:
        summary['total_seconds'] = time.monotonic() - start
        summary['driver_peak_rss_bytes'] = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * 1024
        save('resource-summary.json', summary)


if __name__ == '__main__':
    main()
