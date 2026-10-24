#!/usr/bin/env python3
"""Remote-only literal syntax representation; every lowering identity needs Lean."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


def render(q, nodes):
    """Render the pinned postorder proposal as bounded-depth ordinary constructors.

    Native tree/range checks are only producer hygiene. The caller must prove
    lower(op_q) = syntax_q in the kernel before using this literal tree.
    """
    declarations, visited, named = [], set(), {}

    def table(values, bound, depth):
        assert len(values) == 10
        assert all(type(v) is int and 0 <= v < bound for v in values)
        pad = '  ' * depth
        cells = [('true' if v else 'false') if bound == 2 else
                 f'⟨{v}, by decide +kernel⟩' for v in values]
        return [pad + '⟨#['] + [pad + '  ' + v + ',' for v in cells[:-1]] + [
            pad + '  ' + cells[-1] + '], rfl⟩']

    def named_node(i):
        if i not in named:
            name = f'literal_{q}_{i}'
            named[i] = name
            body = expression(i, 1)
            declarations.append(f'noncomputable def {name} : Syntax 4042 :=\n' +
                                '\n'.join(body) + '\n')
        return named[i]

    def expression(i, depth):
        assert type(i) is int and 0 <= i < len(nodes)
        if depth >= 6:
            return ['  ' * depth + named_node(i)]
        assert i not in visited, 'Postorder proposal must be a tree, not a shared graph'
        visited.add(i)
        tag, *args = nodes[i]
        pad, inside = '  ' * depth, depth + 1

        def child(j):
            assert type(j) is int and 0 <= j < i
            return expression(j, inside)

        if tag == 5:
            assert not args
            return [pad + '.halt']
        if tag == 0:
            direction, target = args
            assert direction in (-1, 1)
            return [pad + '(.move .' + ('right' if direction == 1 else 'left')] + child(
                target) + [pad + ')']
        assert tag in (1, 2, 3, 4)
        bound = 2 if tag in (1, 3) else 5 if tag == 2 else 4042
        name = {1: 'write', 2: 'load', 3: 'branch', 4: 'go'}[tag]
        lines = [pad + '(.' + name] + table(args[0], bound, inside)
        if tag in (1, 2):
            assert len(args) == 2
            lines += child(args[1])
        elif tag == 3:
            assert len(args) == 3
            lines += child(args[1]) + child(args[2])
        else:
            assert len(args) == 1
        return lines + [pad + ')']

    root = named_node(len(nodes) - 1)
    assert len(visited) == len(nodes), 'Literal syntax proposal has unreachable nodes'
    declarations.append(f'noncomputable def syntax_{q} : Syntax 4042 := {root}\n')
    return ''.join(declarations)
