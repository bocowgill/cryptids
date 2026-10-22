#!/usr/bin/env python3
"""Remote-only research census of the accepted full machine, not a new certificate."""
import collections
import hashlib
import json
import os
from pathlib import Path


def sha(path):
    digest = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            digest.update(block)
    return digest.hexdigest()


def main():
    if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
        raise SystemExit('Remote GitHub Actions execution required')
    root = Path(__file__).resolve().parents[2]
    frozen = root / 'docs/chess/field-reverse/evidence/current/unpacked'
    out = root / '.lake/chess-goal-20261022'
    out.mkdir(parents=True, exist_ok=True)
    data_path, rows_path = frozen / 'machine-export.json', frozen / 'body-rows.jsonl'
    expected = {
        'machine-export.json': '3c9ad4e5c7c979e17d2a4e26ff0310fbaa27ab2aee6f948295650ca7a40a45a4',
        'body-rows.jsonl': '64337bda276a0b178e29318f7d7023b504adee4a1c1438465b416130cb111b65',
    }
    for path in (data_path, rows_path):
        assert sha(path) == expected[path.name], ('frozen artifact changed', path)
    data = json.loads(data_path.read_text())
    meta = data['metadata']
    q, prefix, total = meta['post_states'], meta['body_entry'], meta['machine_states']
    assert (q, prefix, total) == (533341, 1837941, 2904623)
    assert total == prefix + 2 * q
    main_rows = [[None, None] for _ in range(q)]
    write_destinations = collections.Counter()
    kinds = collections.Counter()
    rows_checked = 0
    with rows_path.open() as stream:
        for line_index, line in enumerate(stream):
            state, bit, row = json.loads(line)
            assert (state, bit) == (prefix + line_index // 2, line_index % 2)
            assert state < total
            index = state - prefix
            if index < q:
                main_rows[index][bit] = row
                if row is None:
                    kinds['halt_rows'] += 1
                else:
                    write, direction, target = row
                    assert write in (0, 1) and direction in (-1, 1)
                    assert prefix <= target < total
                    if target >= prefix + q:
                        assert direction == 1
                        write_destinations[target - prefix - q] += 1
                        kinds['write_rows'] += 1
                    else:
                        assert write == bit
                        kinds['move_rows'] += 1
            else:
                assert row == [bit, -1, prefix + index - q]
                kinds['bounce_rows'] += 1
            rows_checked += 1
    assert rows_checked == 4 * q
    initial_raw = meta['initial_raw']
    nodes = [node for row in data['syntax'] for node in row]
    assert len(nodes) == meta['graph_nodes']
    write_nodes = sum(node[0] == 1 for node in nodes)
    structural_returns = 1 + 5 * (len(data['syntax']) + write_nodes)

    def destination_tag(index):
        raw = initial_raw if index == 0 else 0 if index == initial_raw else index
        return 'shared_halt' if raw == 0 else str(nodes[(raw - 1) // 5][0])

    destinations_by_tag = collections.Counter(destination_tag(j) for j in write_destinations)
    unconditional_moves = set()
    for j, (zero, one) in enumerate(main_rows):
        if (zero is not None and one is not None and zero[0] == 0 and one[0] == 1
                and zero[1:] == one[1:] and zero[2] < prefix + q):
            unconditional_moves.add(j)
    fusion_destinations = set(write_destinations) & unconditional_moves
    retained = sorted(write_destinations)
    (out / 'write-destinations.json').write_text(json.dumps(retained) + '\n')
    report = {
        'schema': 'chess-goal-bounce-census-v1',
        'status': 'passed', 'certifies_new_machine': False,
        'evidence_scope': 'Complete finite census of previously certified binary transition rows; proposed smaller counts still require new universal Lean construction and full validation.',
        'commit': os.environ.get('GITHUB_SHA'), 'run_id': os.environ.get('GITHUB_RUN_ID'),
        'census_source_sha256': sha(Path(__file__)), 'frozen_artifact_sha256': expected,
        'baseline_states': total, 'post_states': q, 'initializer_states': prefix,
        'body_rows_checked': rows_checked, 'row_kinds': dict(kinds),
        'distinct_write_destinations': len(retained),
        'syntax_write_nodes': write_nodes,
        'structural_return_slots': structural_returns,
        'structural_candidate_full_states': prefix + q + structural_returns,
        'unused_bounce_states': q - len(retained),
        'selective_bounce_candidate_body_states': q + len(retained),
        'selective_bounce_candidate_full_states': prefix + q + len(retained),
        'write_destinations_by_target_node_tag': dict(destinations_by_tag),
        'node_tag_key': {'0': 'move', '1': 'write', '2': 'load', '3': 'branch', '4': 'go', '5': 'halt'},
        'unconditional_move_controls': len(unconditional_moves),
        'write_destinations_with_unconditional_move': len(fusion_destinations),
        'write_destination_list_sha256': sha(out / 'write-destinations.json'),
    }
    (out / 'census.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps(report, indent=2))
    print('Chess binary return census passed')


if __name__ == '__main__':
    main()
