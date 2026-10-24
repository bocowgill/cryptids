#!/usr/bin/env python3
"""Two authorized remote memory pilots, replaying identical retained proof sources."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import argparse
import json
from pathlib import Path
import signal
import sys
import time

import certificate_pilot as pilot
from memory_capacity import capacity

HISTORICAL = Path('docs/chess/campaign-2026-10-22/round-03/evidence/certificate-19/unpacked')
PIN_FILE = Path('docs/chess/campaign-2026-10-22/accepted-769344-pins.json')


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--memory-gib', type=int, choices=[6, 10], required=True)
    parser.add_argument('--capacity-only', action='store_true')
    args = parser.parse_args()
    assert sys.platform == 'linux'
    assert os.environ.get('RUNNER_ENVIRONMENT') == 'github-hosted'
    assert os.environ.get('CHESS_PUBLIC_REPOSITORY') == 'true'
    args.output = pilot.ROOT / f'.lake/chess-memory-comparison-20261024-{args.memory_gib}'
    args.output.mkdir(parents=True, exist_ok=True)
    args.seconds, args.smoke_only, args.source_tables_only = 1200, False, False
    args.lakefile = Path(f'lakefile.chess-memory-20261024-{args.memory_gib}.toml')
    pins = json.loads((pilot.ROOT / PIN_FILE).read_text())
    for name, digest in pins.items():
        assert pilot.info(pilot.ROOT / name)['sha256'] == digest, name
    sources = [str(PIN_FILE), str(HISTORICAL / 'certificate-summary.json'),
               'scripts/chess_body_20261022/memory_replay.py',
               'scripts/chess_body_20261022/memory_capacity.py',
               'scripts/chess_body_20261022/certificate_pilot.py',
               '.github/workflows/chess_memory_comparison_20261024.yml',
               'lakefile.chess-body-certificate-20261022.toml']
    manifest = dict(commit=os.environ['GITHUB_SHA'], run_id=os.environ['GITHUB_RUN_ID'],
                    workflow_commit=os.environ['GITHUB_SHA'], frozen_source_sha256=pins,
                    source_sha256={name: pilot.info(pilot.ROOT / name)['sha256']
                                   for name in sources})
    pilot.save(args.output / 'source-manifest.json', manifest)
    report = capacity(args.memory_gib)
    phase = 'before-preparation' if args.capacity_only else 'before-measured-proofs'
    pilot.save(args.output / (phase + '-capacity.json'), report)
    print(json.dumps({key: report[key] for key in
                      ['requested_gib', 'host_total_bytes', 'host_available_bytes',
                       'effective_available_estimate_bytes', 'reserve_bytes', 'admission']}),
          flush=True)
    driver = pilot.Driver(args)
    driver.summary.update(classification='PAIRED_MEMORY_SCALABILITY_REPLAY',
                          capacity_report=report, historical_certificate=19,
                          requested_sample_states=[] if args.capacity_only else [64, 512, 4096],
                          source_replay='Identical historical proof and data bytes; '
                                        'current bounded driver, changed memory limits only',
                          scale_decision='pending_two_pilot_comparison',
                          partial_theorems_credited=False, completed_samples=[])
    try:
        if report['admission'] != 'admitted':
            raise pilot.Obstruction(
                'Actual runner/container lacks requested budget plus2GiB reserve')
        if args.capacity_only:
            driver.summary['status'] = 'capacity_admitted'
            return 0
        config = (pilot.ROOT / 'lakefile.chess-body-certificate-20261022.toml').read_text()
        assert config.count('"-M6144"') == 1
        config = config.replace('"-M6144"', f'"-M{args.memory_gib * 1024}"')
        (pilot.ROOT / args.lakefile).write_text(config)
        target = args.output / 'reproduction' / args.lakefile
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_text(config)
        driver.summary['generated_files'][str(args.lakefile)] = pilot.info(target)
        driver.summary['coordinated_limits'] = dict(
            lean_allocator_mib=args.memory_gib * 1024,
            process_group_plus_driver_rss_bytes=args.memory_gib << 30,
            driver_rss_bytes=512 << 20, audit_allocator_limit=None,
            audit_rss_uses_same_process_group_cap=True)
        old = json.loads((pilot.ROOT / HISTORICAL / 'certificate-summary.json').read_text())
        for name, expected in old['generated_files'].items():
            source = pilot.ROOT / HISTORICAL / 'reproduction' / name
            assert pilot.info(source) == expected, name
            relative = Path(name).relative_to(pilot.PREFIX)
            driver.emit(str(relative), source.read_text())
            if name.endswith('.roots'):
                driver.audit_roots[relative.stem] = source.read_text().splitlines()
        # The historical retained manifest already contains the32-root union.
        # Restore its original one-root component census before rebuilding that union.
        driver.audit_roots['BodyRelation'] = [pilot.NS + '.RowAt']
        driver.summary['historical_source_bytes_verified'] = True
        driver.checkpoint()
        driver.run('Audit', 120, 'Build completed successfully', audit_build=True)
        driver.run('Loaders', 60, 'Body certificate loaders checked')
        driver.run('TemplateSmoke', 60, 'Body certificate template smoke checked')
        driver.summary['template_smoke_checked'] = True
        driver.run('MapData', 240, 'Complete body class map loaded')
        driver.run('QuotientData', 180, 'Complete body quotient rows loaded')
        driver.run_data_group()
        completed = set()
        for count, seconds in [(64, 120), (512, 180), (4096, 210)]:
            current_capacity = capacity(args.memory_gib)
            pilot.save(args.output / f'before-rows{count}-capacity.json', current_capacity)
            if current_capacity['admission'] != 'admitted':
                raise pilot.Obstruction('Runner headroom decreased before next proof tier')
            started = time.monotonic()
            driver.run('Rows' + str(count), seconds,
                       f'Body kernel rows checked: {count} states, {2 * count} rows')
            for root in driver.audit_roots['Rows' + str(count)]:
                state, bit = root.rsplit('_', 2)[1:]
                completed.add((int(state), int(bit)))
            driver.summary['completed_samples'].append(dict(
                states=count, obligations=2 * count,
                build_and_full_private_audit_seconds=time.monotonic() - started))
            driver.summary['completed_positive_unique_rows'] = len(completed)
            driver.summary['remaining_actual_row_obligations'] = 2 * pilot.N - len(completed)
            driver.checkpoint()
        driver.summary.update(status='memory_pilot_passed',
                              scale_decision='Larger substantial coverage still required; '
                                             'small samples alone do not establish full scaling')
        return 0
    except Exception as error:
        driver.summary.update(status='bounded_obstruction' if
                              isinstance(error, pilot.Obstruction) else 'failed',
                              obstruction=dict(type=type(error).__name__, message=str(error),
                                               stage=driver.stage))
        print('Memory comparison outcome retained: ' + str(error), flush=True)
        return 1
    finally:
        pilot.kill_group(driver.child)
        driver.monitor_stop.set()
        signal.setitimer(signal.ITIMER_REAL, 0)
        driver.checkpoint()


if __name__ == '__main__':
    raise SystemExit(main())
