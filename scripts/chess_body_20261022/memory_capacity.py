#!/usr/bin/env python3
"""Read actual remote capacity; never infer it from a runner marketing label."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import resource
from pathlib import Path
import time


def read(path):
    try:
        return path.read_text().strip()
    except (FileNotFoundError, PermissionError):
        return None


def capacity(budget_gib):
    assert budget_gib in (6, 10), 'Initial comparison authorizes exactly 6 and 10 GiB'
    mem = {}
    for line in Path('/proc/meminfo').read_text().splitlines():
        key, value = line.split(':', 1)
        mem[key] = int(value.strip().split()[0]) * 1024
    proc_cgroup = Path('/proc/self/cgroup').read_text()
    roots = {Path('/sys/fs/cgroup'), Path('/sys/fs/cgroup/memory')}
    for line in proc_cgroup.splitlines():
        _, controllers, relative = line.split(':', 2)
        mount = Path('/sys/fs/cgroup/memory' if 'memory' in controllers else '/sys/fs/cgroup')
        path = mount / relative.lstrip('/')
        while path.is_relative_to(mount):
            roots.add(path)
            if path == mount:
                break
            path = path.parent
    groups, available = [], [mem['MemAvailable']]
    for root in sorted(roots):
        names = ['memory.max', 'memory.high', 'memory.current', 'memory.stat',
                 'memory.limit_in_bytes', 'memory.usage_in_bytes']
        raw = {name: read(root / name) for name in names}
        raw = {name: value for name, value in raw.items() if value is not None}
        if not raw:
            continue
        stat = dict(line.split() for line in raw.get('memory.stat', '').splitlines())
        reclaimable = int(stat.get('inactive_file', stat.get('total_inactive_file', '0')))
        usage = int(raw.get('memory.current', raw.get('memory.usage_in_bytes', '0')))
        limits = [int(raw[name]) for name in
                  ['memory.max', 'memory.high', 'memory.limit_in_bytes']
                  if name in raw and raw[name].isdigit() and int(raw[name]) < (1 << 60)]
        if limits:
            available.append(max(0, min(limits) - usage + min(reclaimable, usage)))
        groups.append(dict(path=str(root), raw=raw,
                           reclaimable_inactive_file_bytes=reclaimable))
    as_limit = resource.getrlimit(resource.RLIMIT_AS)
    if as_limit[0] != resource.RLIM_INFINITY:
        available.append(as_limit[0])
    budget, reserve = budget_gib << 30, 2 << 30
    effective = min(available)
    return dict(schema='chess-runner-capacity-v1', utc_epoch=time.time(),
                requested_gib=budget_gib, requested_bytes=budget, reserve_bytes=reserve,
                host_total_bytes=mem['MemTotal'], host_available_bytes=mem['MemAvailable'],
                cgroups=groups, proc_self_cgroup=proc_cgroup,
                rlimit_as=as_limit, rlimit_data=resource.getrlimit(resource.RLIMIT_DATA),
                cpu_affinity=sorted(os.sched_getaffinity(0)),
                effective_available_estimate_bytes=effective,
                admission='admitted' if budget + reserve <= effective else 'insufficient_headroom',
                accounting='Host MemAvailable and tightest visible cgroup max/high; '
                           'only inactive file pages treated as reclaimable; 2GiB reserve',
                runner_environment=os.environ.get('RUNNER_ENVIRONMENT'),
                runner_os=os.environ.get('RUNNER_OS'), runner_arch=os.environ.get('RUNNER_ARCH'))
