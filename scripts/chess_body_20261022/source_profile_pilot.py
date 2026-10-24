#!/usr/bin/env python3
"""Remote-only controlled diagnosis of certified source recipe components."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json

from raw_chunk_pilot import raw_op
from source_chunk_pilot import indent


def run(driver, api):
    assert driver.summary['cache_world_source_checker_agreement_checked']
    assert driver.summary['cache_world_kernel_corruption_rejected']
    assert hashlib.sha256(api.SNAPSHOT.read_bytes()).hexdigest() == api.SNAPSHOT_SHA
    data = json.loads(api.SNAPSHOT.read_text())
    payload = json.loads((driver.args.output / 'source-operation-proposal.json').read_text())
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    assert len(payload['operations']) == 4042
    cases = [445, 476, 356]
    import local_view_pilot
    views = local_view_pilot.prepare(driver, api, data, cases)
    import working_view_pilot
    working = working_view_pilot.prepare(driver, api, data, payload['operations'], cases, views)
    working_view_pilot.emit_sets(driver, api, cases, working, views)
    imports = [api.MODULE + '.CacheWorldControls', api.MODULE + '.LocalViews']
    imports += [api.MODULE + '.' + views[q]['stem'] for q in cases]
    imports.append(api.MODULE + '.WorkingSets')
    parts = [api.header(imports + ['Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'),
        'open ConjectureMachines.Optimisation\n'
        'open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot\n'
        'namespace SourceProfilePilot\n']
    roots = []
    expected_events = []
    for index, q in enumerate(cases):
        nodes = data['row_sizes'][q]
        returns = len(data['return_local_targets'][q])
        view = views[q]
        cache_namespace = view['stem'] + 'Pilot'
        labels = working_view_pilot.labels(payload['operations'][q])
        label_text = '[' + ', '.join(map(str, labels)) + ']'
        target_text = '[' + ', '.join(map(str, [q] + labels)) + ']'
        prefixes = '[' + ', '.join(str(data['return_offsets'][i]) for i in [q] + labels) + ']'
        parts.append(f'def label_{q} : Fin 4042 := ⟨{q}, by decide +kernel⟩\n'
                     f'noncomputable def raw_{q} : RawOp :=\n' +
                     indent(raw_op(payload['operations'][q])) + '\n'
                     f'noncomputable def syntax_{q} : Syntax 4042 :=\n'
                     f'  SourceRecipePilot.syntaxOf raw_{q}\n'
                     f'noncomputable def localWorld_{q} : LookupWorldPilot.World :=\n'
                     f'  LocalViewPilot.world {cache_namespace}.cache\n'
                     f'    {view["start"]} {view["finish"]}\n'
                     f'noncomputable def workingWorld_{q} : LookupWorldPilot.World :=\n'
                     f'  WorkingViewPilot.world WorkingSetsPilot.windows_{q}\n')
        statements = {
            'source': f'erase (toTableOp (Snapshot.program label_{q})) = raw_{q}',
            'counts': f'syntax_{q}.size = {nodes} ∧\n'
                      f'      1 + FieldReturns.writeCount syntax_{q} = {returns}',
            'offset': f'PrefixScanPilot.nodePrefixes.lookup label_{q}.val 0 = {view["base"]}',
            'labels': f'RawLabelPilot.labelValues raw_{q} = {label_text}',
            'return_offsets': f'({target_text} : List Nat).map\n'
                              '      (fun i ↦ PrefixScanPilot.returnPrefixes.lookup i 0) =\n'
                              f'      {prefixes}',
            'main_original': f'StructuralCheckPilot.checkMain label_{q} syntax_{q} = true',
            'main_cached': 'LookupWorldPilot.checkMain CacheWorldPilot.cacheWorld\n'
                           f'      label_{q} syntax_{q} = true',
            'main_local': f'LookupWorldPilot.checkMain localWorld_{q}\n'
                          f'      label_{q} syntax_{q} = true',
            'main_working': f'LookupWorldPilot.checkMain workingWorld_{q}\n'
                            f'      label_{q} syntax_{q} = true',
            'return_original': f'DirectCheckPilot.checkReturns label_{q} syntax_{q} = true',
            'return_cached': 'LookupWorldPilot.checkReturns CacheWorldPilot.cacheWorld\n'
                             f'      label_{q} syntax_{q} = true',
            'return_local': f'LookupWorldPilot.checkReturns localWorld_{q}\n'
                            f'      label_{q} syntax_{q} = true',
            'return_working': f'LookupWorldPilot.checkReturns workingWorld_{q}\n'
                              f'      label_{q} syntax_{q} = true',
            'whole_original': f'SourceRecipePilot.checkRecipe label_{q} raw_{q}\n'
                              f'      {nodes} {returns} = true',
            'whole_cached': 'LookupWorldPilot.checkRecipe CacheWorldPilot.cacheWorld\n'
                            f'      label_{q} raw_{q} {nodes} {returns} = true',
            'whole_local': f'LookupWorldPilot.checkRecipe localWorld_{q}\n'
                           f'      label_{q} raw_{q} {nodes} {returns} = true',
            'whole_working': f'LookupWorldPilot.checkRecipe workingWorld_{q}\n'
                             f'      label_{q} raw_{q} {nodes} {returns} = true',
        }
        # Reverse order for the second heavy case to expose warm-up/order bias.
        order = ['source', 'counts', 'offset', 'labels', 'return_offsets']
        for component in ['main', 'return', 'whole']:
            kinds = (['original', 'cached', 'local', 'working'] if index != 1 else
                     ['working', 'local', 'cached', 'original'])
            order += [component + '_' + kind for kind in kinds]
        for component in order:
            for phase in ['before', 'after']:
                event = component + ':' + phase
                parts.append(api.progress_marker(event, q,
                    driver.args.output / 'SourceProfile-times.tsv'))
                expected_events.append([event, q])
                if phase == 'before':
                    parts.append(f'theorem {component}_{q} :\n'
                                 f'    {statements[component]} := by decide +kernel\n')
                    roots.append('SourceProfilePilot.' + component + '_' + str(q))
        parts.append(f'noncomputable def certificate_original_{q} :\n'
                     '    SourceScopeToolsPilot.SourceCertificate :=\n'
                     f'  SourceRecipePilot.fromRaw label_{q} raw_{q} {nodes} {returns}\n'
                     f'    whole_original_{q}\n'
                     f'noncomputable def certificate_cached_{q} :\n'
                     '    SourceScopeToolsPilot.SourceCertificate :=\n'
                     f'  CacheWorldPilot.fromCachedRaw label_{q} raw_{q} {nodes} {returns}\n'
                     f'    whole_cached_{q}\n'
                     f'noncomputable def certificate_local_{q} :\n'
                     '    SourceScopeToolsPilot.SourceCertificate :=\n'
                     f'  LocalViewPilot.fromLocalRaw {cache_namespace}.cache\n'
                     f'    {view["start"]} {view["finish"]} {cache_namespace}.checked\n'
                     f'    label_{q} raw_{q} {nodes} {returns} whole_local_{q}\n'
                     f'noncomputable def certificate_working_{q} :\n'
                     '    SourceScopeToolsPilot.SourceCertificate :=\n'
                     f'  WorkingViewPilot.fromRaw WorkingSetsPilot.windows_{q}\n'
                     f'    WorkingSetsPilot.checked_{q} label_{q} raw_{q}\n'
                     f'    {nodes} {returns} whole_working_{q}\n')
        roots += ['SourceProfilePilot.certificate_' + kind + '_' + str(q)
                  for kind in ['original', 'cached', 'local', 'working']]
    parts.append('end SourceProfilePilot\n')
    driver.emit('SourceProfile.lean', ''.join(parts) + api.audit_and_end(
        driver, 'SourceProfile', roots,
        'Controlled original and cached source component proofs checked'))
    driver.summary['source_component_profile_proposed'] = dict(
        labels=cases, required_roots=len(roots), expected_events=expected_events,
        kernel_checked=False, substantial_source_scaling_established=False,
        new_accepted_machine=False,
        comparison='same runner/data; original/global/local/working; reverse second-heavy order')
    driver.checkpoint()
    local_view_pilot.build(driver, views)
    working_view_pilot.build(driver)
    driver.run('SourceProfile', 120,
               'Controlled original and cached source component proofs checked')
    events = [line.split('\t') for line in
              (driver.args.output / 'SourceProfile-times.tsv').read_text().splitlines()]
    assert [[event, int(q)] for event, q, _stamp in events] == expected_events
    stamps = [int(stamp) for _event, _q, stamp in events]
    assert all(a <= b for a, b in zip(stamps, stamps[1:]))
    durations = []
    for i in range(0, len(events), 2):
        durations.append(dict(label=int(events[i][1]),
                              component=events[i][0].removesuffix(':before'),
                              elapsed_ms=stamps[i + 1] - stamps[i]))
    driver.summary['source_component_profile_durations'] = durations
    driver.summary['source_component_profile_proposed']['kernel_checked'] = True
    driver.summary.update(status='source_profile_passed', source_component_profile_checked=True)
    driver.checkpoint()
    print('Controlled source component profile passed', flush=True)
