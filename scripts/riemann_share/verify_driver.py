#!/usr/bin/env python3
"""Remote-only watchdog. No packages, model calls, retries or Chess job actions."""
import os

if not (os.environ.get('RHSHARE_REMOTE') == '1'
        and os.environ.get('GITHUB_ACTIONS') == 'true'
        and os.environ.get('RHSHARE_PUBLIC') == 'true'
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
OUT = ROOT / '.lake/riemann-share-verify02'
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
    elapsed_setup = time.time() - float(os.environ['RHSHARE_JOB_START'])
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
                    probe_revision='optional-v1-v2-files; retained-witness verification')
    summary = dict(status='running', candidate_limit=0, total_limit_seconds=TOTAL,
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
    assert os.environ.get('GITHUB_RUN_ATTEMPT') == '1', 'No automatic or manual retry'
    assert os.environ.get('RHSHARE_OUTPUT_DIR') == '.lake/riemann-share-verify02'
    launch = json.loads((ROOT / 'scripts/riemann_share/launch-verify02.json').read_text())
    parent = subprocess.check_output(['git', 'rev-parse', 'HEAD^'], cwd=ROOT, text=True).strip()
    assert launch['source_transport_commit'] == parent
    assert launch['retained_witnesses'] == 30 and launch['maximum_exported_candidates'] == 0
    assert launch['jobs_authorized'] == 1 and launch['retry'] is False
    setup_remaining = 900 - elapsed_setup
    stages = [('generation', 120, [sys.executable, 'scripts/riemann_share/retained.py']),
              ('independent-replay', 60, ['node', 'scripts/riemann_share/verify-retained.mjs']),
              ('setup', setup_remaining, [sys.executable, 'scripts/riemann_share/setup.py']),
              ('kernel', 600, ['lake', '--wfail', '-f', 'lakefile.riemann-share.toml',
                               'build', 'ShareCertificate']),
              ('audits', 390, [sys.executable, 'scripts/riemann_share/check_lean.py'])]
    try:
        for name, cap, argv in stages:
            before = time.monotonic()
            if name == 'setup':
                cap = min(cap, 900 - (before - start))
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
        result = json.loads((OUT / 'provenance.json').read_text())
        replay = json.loads((OUT / 'independent-replay.json').read_text())
        lean = json.loads((OUT / 'lean-verification.json').read_text())
        summary['transition_evaluations'] = replay['transition_evaluations']
        summary['new_alias_searches'] = 0
        summary['exported_candidates'] = 0
        if (result['status'] == 'retained-witnesses-pinned'
                and replay['status'] == 'retained-endpoints-replayed' and replay['witnesses'] == 30
                and lean['status'] == 'lean-family-counterexamples-checked'):
            summary['status'] = 'all-30-retained-witnesses-kernel-checked-and-audited'
            print('ALL_30_RETAINED_WITNESSES_KERNEL_CHECKED_AND_AUDITED', flush=True)
        else:
            raise RuntimeError('Certificate and independently replayed family disagree')
    except Exception as error:
        if summary['status'] == 'running':
            summary['status'] = 'execution-failed'
        summary['error'] = str(error)
        raise
    finally:
        summary['total_seconds'] = time.monotonic() - start
        summary['driver_peak_rss_bytes'] = resource.getrusage(resource.RUSAGE_SELF).ru_maxrss * 1024
        invocation_log = OUT / 'lean-invocations.txt'
        summary['lean_runs'] = (len(invocation_log.read_text().splitlines())
                                if invocation_log.exists() else 0)
        save('resource-summary.json', summary)


if __name__ == '__main__':
    main()
