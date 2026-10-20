#!/usr/bin/env python3
"""Synthetic/static M5 fixture producer; never executes the chess evaluator."""
import argparse
import itertools
from pathlib import Path
import sys
import time
p = argparse.ArgumentParser()
p.add_argument('--start', type=int, required=True)
p.add_argument('--count', type=int, required=True)
p.add_argument('--states', type=int, required=True)
p.add_argument('--mode', default='normal')
p.add_argument('--file')
p.add_argument('--marker')
a = p.parse_args()
if a.mode == 'hang':
    time.sleep(30)
if a.mode == 'nonzero':
    raise SystemExit(7)
if a.mode == 'stderr':
    sys.stderr.write('x' * 2_000_000)
if a.mode == 'delay' and a.start == 0:
    time.sleep(.15)
if a.mode == 'fail-once' and a.start > 0 and not Path(a.marker).exists():
    Path(a.marker).write_text('transient fixture failure')
    raise SystemExit(9)
count = a.count - (a.mode == 'truncated') + (a.mode == 'extra')
if a.file:
    with open(a.file, 'rb') as source:
        for row in itertools.islice(source, a.start, a.start + count):
            sys.stdout.buffer.write(row)
else:
    indices = range(a.start, a.start + count)
    if a.mode == 'reverse':
        indices = reversed(indices)
    for i in indices:
        if a.mode == 'out-of-range':
            row = f'0L{a.states} ---\n'
        elif a.mode == 'malformed':
            row = 'not a canonical row\n'
        else:
            target = (i * 7919 + 1) % a.states
            if a.mode == 'changed':
                target = (target + 1) % a.states
            row = f'{i % 2}L{target} {(i + 1) % 2}R{(i + 1) % a.states}\n'
        sys.stdout.buffer.write(row.encode('ascii'))
