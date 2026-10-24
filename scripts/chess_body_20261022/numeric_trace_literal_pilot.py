#!/usr/bin/env python3
"""Remote-only untrusted ordinary numeric-trace literal renderer."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


def table(values, bound, depth):
    assert len(values) == 10
    assert all(type(v) is int and 0 <= v < bound for v in values)
    pad = '  ' * depth
    cells = [('true' if v else 'false') if bound == 2 else
             f'⟨{v}, by decide +kernel⟩' for v in values]
    return [pad + '⟨#['] + [pad + '  ' + v + ',' for v in cells[:-1]] + [
        pad + '  ' + cells[-1] + '], rfl⟩']


def node(row, depth):
    tag, *args = row
    pad, inner = '  ' * depth, depth + 1
    if tag == 5:
        assert not args
        return [pad + '.halt']
    if tag == 0:
        direction, target = args
        assert direction in (-1, 1) and type(target) is int and target >= 0
        return [pad + f'(.move .{"right" if direction == 1 else "left"} {target})']
    assert tag in (1, 2, 3, 4)
    bound = 2 if tag in (1, 3) else 5 if tag == 2 else 4042
    name = {1: 'write', 2: 'load', 3: 'branch', 4: 'go'}[tag]
    lines = [pad + '(.' + name] + table(args[0], bound, inner)
    targets = args[1:]
    assert len(targets) == (2 if tag == 3 else 0 if tag == 4 else 1)
    assert all(type(v) is int and v >= 0 for v in targets)
    lines += ['  ' * inner + str(v) for v in targets]
    return lines + [pad + ')']


def natural_list(values, depth):
    assert all(type(value) is int and value >= 0 for value in values)
    pad = '  ' * depth
    if not values:
        return [pad + '[]']
    return [pad + '['] + [pad + '  ' + str(value) + ',' for value in values[:-1]] + [
        pad + '  ' + str(values[-1]) + ']']


def render(q, nodes, targets):
    """Producer checks are hygiene only; the caller kernel-checks full fidelity."""
    assert nodes and targets and targets[0] == len(nodes) - 1
    assert all(type(v) is int and 0 <= v < len(nodes) for v in targets)
    declarations, visited, named = [], set(), {}

    def named_node(i):
        if i not in named:
            name = f'trace_{q}_{i}'
            named[i] = name
            body = expression(i, 1)
            declarations.append(f'noncomputable def {name} : NumericTreePilot.Trace :=\n' +
                                '\n'.join(body) + '\n')
        return named[i]

    def expression(i, depth):
        assert type(i) is int and 0 <= i < len(nodes)
        if depth >= 6:
            return ['  ' * depth + named_node(i)]
        assert i not in visited, 'Numeric source proposal must be a complete tree'
        visited.add(i)
        row = nodes[i]
        tag = row[0]
        pad, inner = '  ' * depth, depth + 1
        if tag in (4, 5):
            return [pad + f'(.leaf {i}'] + node(row, inner) + [pad + ')']
        children = row[2:] if tag in (0, 1, 2, 3) else None
        assert children is not None and len(children) == (2 if tag == 3 else 1)
        kind = 'branch' if tag == 3 else 'unary'
        lines = [pad + f'(.{kind} {i}'] + node(row, inner)
        for child in children:
            assert type(child) is int and 0 <= child < i
            lines += expression(child, inner)
        return lines + [pad + ')']

    root = named_node(len(nodes) - 1)
    assert len(visited) == len(nodes), 'Numeric source proposal has unreachable nodes'
    declarations.append(f'noncomputable def fragment_{q} : NumericTreePilot.Fragment :=\n'
                        f'  ⟨{len(nodes)}, {len(nodes) - 1}, {root},\n'
                        + '\n'.join(natural_list(targets[1:], 2)) + '⟩\n')
    return ''.join(declarations)
