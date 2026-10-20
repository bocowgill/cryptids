#!/usr/bin/env python3
"""Separate direct arithmetic/static-file fixture export implementation."""
import sys
arguments = dict(zip(sys.argv[1::2], sys.argv[2::2]))
start = int(arguments['--start'])
count = int(arguments['--count'])
q = int(arguments['--states'])
if '--file' in arguments:
    with open(arguments['--file'], 'rb') as stream:
        number = 0
        for line in stream:
            if start <= number < start + count:
                sys.stdout.buffer.write(line)
            number += 1
            if number == start + count:
                break
else:
    i = start
    while i < start + count:
        quotient, left = divmod(7919 * i + 1, q)
        right = 0 if i + 1 == q else i + 1
        bit = '1' if i & 1 else '0'
        other = '0' if i & 1 else '1'
        sys.stdout.buffer.write((bit + 'L' + str(left) + ' ' + other + 'R' + str(right) + '\n').encode())
        i += 1
