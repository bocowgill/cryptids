#!/usr/bin/env python3
"""Remote-only adapter to unchanged, pinned Parsimony printer routines."""
import os
if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import ast
import hashlib
import math
from pathlib import Path
import re

UPSTREAM = Path(__file__).with_name('upstream') / 'programmer.py'
SOURCE_SHA = '51bda10e4985fe68a7ee6e53aa031f636910abc8c3c82fb590bdcd88b37dade8'
FUNCTIONS = ('incrementWord', 'indexToWordMaker', 'findAppropriateNumWordsAndWordSize',
    'computeNumCharsTotalFromWordSize', 'findAppropriateWordSize', 'breakUpCodeString',
    'organizeDataStates', 'createBlankCharacter', 'createBlankWord', 'testForFinalB',
    'incrementBinaryCounter', 'convertUnaryToBinary')


class State:
    category = 'unassigned'

    def __init__(self, stateName, description=None, alphabet=None):
        self.stateName = stateName
        self.category = State.category
        self.isStartState = False
        self.nextStateDict = {'a': 'ERROR', 'b': 'ERROR'}
        self.headMoveDict = {'a': '-', 'b': '-'}
        self.writeDict = {'a': 'a', 'b': 'b'}

    def set3(self, symbol, target, direction, written):
        assert symbol in 'ab' and written in 'ab' and direction in ('L', 'R')
        self.nextStateDict[symbol] = target
        self.headMoveDict[symbol] = direction
        self.writeDict[symbol] = written

    def makeStartState(self):
        self.isStartState = True


def routines():
    raw = UPSTREAM.read_bytes()
    assert hashlib.sha256(raw).hexdigest() == SOURCE_SHA
    source = raw.decode()
    # Extract unmodified top-level functions. The last createBlankWord definition
    # intentionally overrides the earlier unfinished one, as in Python itself.
    boundaries = list(re.finditer(r'^def (\w+)\(', source, re.M))
    selected = {}
    for i, match in enumerate(boundaries):
        end = boundaries[i + 1].start() if i + 1 < len(boundaries) else len(source)
        if match[1] in FUNCTIONS:
            selected[match[1]] = source[match.start():end]
    assert set(selected) == set(FUNCTIONS)
    namespace = dict(State=State, math=math, alphabetMSToTS=lambda: ['a', 'b'])
    for name in FUNCTIONS:
        body = selected[name]
        tree = ast.parse(body)
        assert len(tree.body) == 1 and isinstance(tree.body[0], ast.FunctionDef)
        exec(compile(tree, 'pinned-parsimony:' + name, 'exec'), namespace)
    return namespace, {name: hashlib.sha256(body.encode()).hexdigest()
                       for name, body in selected.items()}


def build(bits, width=None):
    assert bits and set(bits) <= {'0', '1'}
    api, source_hashes = routines()
    if width is None:
        words, width = api['findAppropriateNumWordsAndWordSize'](len(bits))
    else:
        assert 2 <= width <= 16
        words = max((len(bits) + width - 1) // width, 2 ** width)
    assert words >= 2 ** width and words * width >= len(bits)
    State.category = 'preamble_and_epilogue'
    initial = [State(name) for name in ['preamble_write_marker_a', 'preamble_first_b_signal',
        'preamble_go_left', 'epilogue_clean_up', 'epilogue_find_code_head',
        'epilogue_found_code_head']]
    marker, signal, left, cleanup, find, found = initial
    marker.makeStartState()
    State.category = 'data'
    data0 = State('data_0')
    marker.set3('a', signal, 'R', 'a')
    signal.set3('a', left, 'L', 'b')
    left.set3('a', data0, 'R', 'a')
    out = api['organizeDataStates'](data0, width, words, bits.translate(
        str.maketrans('01', 'ab')), initial)
    State.category = 'extractor'
    keep, finish = api['testForFinalB'](out, initial)
    keep = api['createBlankWord'](keep, width, initial)
    api['convertUnaryToBinary'](keep, width, data0, 'convert', initial)
    finish.set3('a', cleanup, 'L', 'a')
    cleanup.set3('a', find, 'L', 'a')
    cleanup.set3('b', cleanup, 'L', 'a')
    find.set3('a', find, 'L', 'a')
    find.set3('b', found, 'R', 'b')
    initial.append(finish)
    found.set3('a', 'OUT', 'R', 'a')
    names = [state.stateName for state in initial]
    assert len(set(names)) == len(names) and len(set(map(id, initial))) == len(initial)
    indices = {name: i for i, name in enumerate(names)}
    probe_out, error = len(initial), len(initial) + 1
    indices.update(OUT=probe_out, ERROR=error)
    rows = []
    for state in initial:
        for symbol in 'ab':
            target = state.nextStateDict[symbol]
            name = target.stateName if isinstance(target, State) else target
            assert name in indices, 'Unallocated control: ' + name
            direction = state.headMoveDict[symbol]
            if name == 'ERROR':
                # Include an explicit nonhalting error trap, not an accidental halt.
                rows.append((int(symbol == 'b'), 1, error))
            else:
                assert direction in ('L', 'R')
                rows.append((int(state.writeDict[symbol] == 'b'),
                             int(direction == 'R'), indices[name]))
    rows += [(2, 0, 0), (2, 0, 0), (0, 1, error), (1, 1, error)]
    categories = {}
    for state in initial:
        categories[state.category] = categories.get(state.category, 0) + 1
    categories.update(probe_boundary=1, error_trap=1)
    assert sum(categories.values()) == len(rows) // 2
    return dict(rows=rows, names=names + ['PROBE_OUT', 'ERROR'], width=width, words=words,
        pad_bits=words * width - len(bits), entry=indices[marker.stateName], out=probe_out,
        error=error, categories=categories, source_functions=source_hashes,
        completed_packet_adapter=False, raw_parsimony_printer_states=len(initial),
        allocated_probe_states=len(rows) // 2)


def reconstruct(rows, words, width, data_start=6):
    """Independent transition interpretation; no encoder word dictionary used."""
    assert width >= 2 and words >= 2 ** width
    result = []
    for i in range(words):
        zero, one = rows[2 * (data_start + i):2 * (data_start + i + 1)]
        assert zero == ((1, 1, data_start + i + 1) if i + 1 < words else
                        (0, 1, data_start + words))
        assert one[0:2] == (0, 1)
        value = data_start + words - 1 - one[2]
        assert 0 <= value < 2 ** width
        result.append(format(value, '0' + str(width) + 'b'))
    return ''.join(result)


def guarded(bits, width=None):
    """Protect arbitrary packet bits from the upstream code-marker epilogue.

    Prefix a 32-one marker and a zero separator; append 100. The packet has no
    32-one run. The original epilogue finds the appended one. Explicit cleanup
    erases it, scans left without changing packet cells, erases the left marker,
    and enters the retained decoder on the first packet bit. This contract is
    experimental until proved; all new controls are emitted and counted.
    """
    marker = 32
    assert '1' * marker not in bits
    framed = '1' * marker + '0' + bits + '100'
    obj = build(framed, width)
    n = obj['raw_parsimony_printer_states']
    old_out, old_error = obj['out'], obj['error']
    cleanup = list(range(n, n + 3))
    scan = list(range(n + 3, n + 3 + marker))
    clear_init, clear_run = n + 3 + marker, n + 4 + marker
    error, out = n + 5 + marker, n + 6 + marker
    rows = []
    for written, direction, target in obj['rows'][:2 * n]:
        target = cleanup[0] if target == old_out else error if target == old_error else target
        rows.append((written, direction, target))
    rows += [(0, 0, cleanup[1]), (1, 1, error)]
    rows += [(0, 0, cleanup[2]), (1, 1, error)]
    rows += [(0, 1, error), (0, 0, scan[0])]
    for i in range(marker):
        rows += [(0, 0, scan[0]), (1, 0, scan[i + 1] if i + 1 < marker else clear_init)]
    rows += [(0, 1, clear_run), (1, 1, error)]
    rows += [(0, 1, out), (0, 1, clear_run)]
    rows += [(0, 1, error), (1, 1, error)]
    assert len(rows) == 2 * out
    rows += [(2, 0, 0), (2, 0, 0)]
    categories = {k: v for k, v in obj['categories'].items()
                  if k not in ('error_trap', 'probe_boundary')}
    categories.update(tail_cleanup=3, nondestructive_marker_scan=marker,
                      marker_erasure_and_decoder_connection=2, error_trap=1,
                      retained_decoder_boundary=1)
    assert sum(categories.values()) == out + 1
    names = obj['names'][:n] + ['tail-' + str(i) for i in range(3)] + [
        'marker-scan-' + str(i) for i in range(marker)] + ['clear-init', 'clear-marker',
                                                          'ERROR', 'RETAINED_DECODER']
    obj.update(rows=rows, names=names, out=out, error=error, categories=categories,
        allocated_probe_states=out + 1, replacement_states=out,
        completed_packet_adapter=True, marker_bits=marker, framed_bits=len(framed),
        exact_packet_bits=len(bits), packet_start=marker + 2,
        boundary_counted_in_retained_suffix=True,
        connection='last marker-erasure row directly enters retained decoder state 0',
        framed_payload=framed)
    return obj
