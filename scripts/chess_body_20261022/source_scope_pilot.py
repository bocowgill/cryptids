#!/usr/bin/env python3
"""Remote-only substantial actual-body coverage using proof-carrying source records."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json

from raw_chunk_pilot import raw_op
from source_chunk_pilot import indent


def generate(driver, snapshot, expected_sha, header, audit_and_end, progress_marker, module,
             divisor, inherited, recipe_constructor='SourceRecipePilot.fromRaw',
             recipe_constructors=None, recipe_modules=None):
    assert divisor in (16, 4)
    assert recipe_constructor in ('SourceRecipePilot.fromRaw', 'CacheWorldPilot.fromCachedRaw',
                                  'NumericSourceAdapterPilot.fromRaw')
    numeric_recipe = recipe_constructor == 'NumericSourceAdapterPilot.fromRaw'
    fast_world = recipe_constructor == 'CacheWorldPilot.fromCachedRaw'
    local_views = recipe_constructors is not None
    if numeric_recipe:
        assert not local_views
        assert driver.summary['numeric_source_adapter_checked']
        assert driver.summary['numeric_actual_source_profile_checked']
        assert driver.summary['numeric_actual_kernel_corruption_rejected']
        import numeric_trace_literal_pilot
    if local_views:
        assert recipe_modules is not None
        assert driver.summary['operation_local_source_cache_checked']
        assert driver.summary['operation_local_source_controls_checked']
        assert driver.summary['operation_local_source_kernel_corruption_rejected']
    if fast_world:
        assert driver.summary['cache_world_source_checker_agreement_checked']
        assert driver.summary['cache_world_actual_source_controls_checked']
        assert driver.summary['cache_world_kernel_corruption_rejected']
    assert driver.summary['local_chunk_proposed']['kernel_checked']
    assert driver.summary['local_chunk_kernel_corruption_rejected']
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    payload = json.loads((driver.args.output / 'source-operation-proposal.json').read_text())
    assert payload['schema'] == 'finite-source-op-proposal-v1'
    operations = payload['operations']
    assert len(operations) == 4042
    end, covered = 0, 0
    while divisor * covered < 573802:
        assert end < 4042
        covered += 5 * (data['row_sizes'][end] + len(data['return_local_targets'][end]))
        end += 1
    end = min(4042, (end + 31) // 32 * 32)
    nodes = sum(data['row_sizes'][:end])
    returns = sum(len(ranks) for ranks in data['return_local_targets'][:end])
    states, rows = 5 * (nodes + returns), 10 * (nodes + returns)
    assert divisor * states >= 573802
    stem, namespace = f'LocalScope{divisor}', f'LocalScope{divisor}Pilot'
    parent_stems = sorted(set(inherited.values()))
    imports = ([module + '.SourceRecipes'] +
               [module + '.' + name for name in parent_stems])
    if fast_world:
        imports.append(module + '.CacheWorldControls')
    if numeric_recipe:
        imports.append(module + '.NumericActualProfile')
    if local_views:
        imports += sorted({recipe_modules[q] for q in range(end)})
        imports.append(module + '.LocalViewControls')
    parts = [header(imports + ['Lean']).replace(
        'public import Lean\n', 'public meta import Lean\n'),
             'open ConjectureMachines.Optimisation\n'
             'open Chess.Optimisation FieldCompiler RawLabelPilot RawChunkPilot\n'
             'open NumericLocalPilot LocalRulePilot SourceScopeToolsPilot LocalChunkPilot\n'
             f'namespace {namespace}\n']
    roots = []
    prefixes = ['source_raw_', 'source_op_', 'source_literal_', 'source_syntax_',
                'coherent_', 'returned_',
                'main_rows_', 'return_rows_', 'nodes_', 'returns_']
    for q in range(end):
        record = f'record_{q}'
        if q in inherited and inherited[q] != 'LocalChunk':
            parts.append(f'noncomputable def {record} : SourceCertificate :=\n'
                         f'  {inherited[q]}Pilot.{record}\n')
        elif q in inherited:
            # Preserve the independently checked regression block and all its
            # public mathematical roots. Only new operations use compact recipes.
            owner = inherited[q] + 'Pilot'
            roots += [owner + '.' + prefix + str(q) for prefix in prefixes]
            parts.append(f'noncomputable def {record} : SourceCertificate :=\n'
                         f'  makeCertificate {owner}.label_{q} {owner}.syntax_{q}\n'
                         f'    {owner}.source_syntax_{q}\n'
                         f'    {data["row_sizes"][q]} {len(data["return_local_targets"][q])}\n'
                         f'    {owner}.nodes_{q} {owner}.returns_{q}\n'
                         f'    {owner}.coherent_{q} {owner}.returned_{q}\n')
        else:
            constructor = recipe_constructors[q] if local_views else recipe_constructor
            parts.append(progress_marker('recipe_data', q,
                                         driver.args.output / f'{stem}-details.tsv'))
            parts.append(f'def label_{q} : Fin 4042 := ⟨{q}, by decide +kernel⟩\n'
                         f'noncomputable def raw_{q} : RawOp :=\n' +
                         indent(raw_op(operations[q])) + '\n')
            if numeric_recipe:
                parts.append(numeric_trace_literal_pilot.render(
                    q, data['syntax'][q], data['return_local_targets'][q]))
            parts.append(progress_marker('recipe_check', q,
                                         driver.args.output / f'{stem}-details.tsv'))
            parts.append(f'noncomputable def {record} : SourceCertificate :=\n'
                         f'  {constructor} label_{q} raw_{q}\n')
            if numeric_recipe:
                parts.append(f'    fragment_{q} {data["prefix_offsets"][q]} '
                             f'{data["return_offsets"][q]}\n')
            parts.append(
                         f'    {data["row_sizes"][q]} {len(data["return_local_targets"][q])}\n'
                         '    (by decide +kernel)\n')
        roots.append(namespace + '.' + record)
        parts.append(progress_marker('source-records', q + 1,
                                     driver.args.output / f'{stem}-progress.tsv'))

    parts.append(progress_marker('assembly_build', 0,
                                 driver.args.output / f'{stem}-details.tsv'))

    def tree(first, count):
        if count == 1:
            return f'(.leaf record_{first})'
        half = count // 2
        left, right = tree(first, half), tree(first + half, count - half)
        name = f'collection_{first}_{count}'
        parts.append(f'noncomputable def {name} : Balanced.RowTree SourceCertificate :=\n'
                     f'  .branch {half} {left} {right}\n')
        return name

    collection = tree(0, end)
    parts.append('theorem collection_checked :\n'
                 f'    scan {collection} 0 = some ({end}, {nodes}, {returns}) := by\n'
                 '  decide +kernel\n'
                 'theorem complete_source_prefix (q : Fin 4042)\n'
                 f'    (before : q.val < {end}) : SourceRows q :=\n'
                 f'  scan_covers {collection} 0 {end} {nodes} {returns}\n'
                 '    collection_checked q (Nat.zero_le _) before\n'
                 'theorem actual_node_and_return_census :\n'
                 f'    ({collection}.flatten.map\n'
                 f'      (fun r ↦ (FieldPacked.syntaxRows.get r.label).size)).sum = {nodes} ∧\n'
                 f'    ({collection}.flatten.map\n'
                 f'      (fun r ↦ FieldSelectiveLayout.localSize r.label)).sum = {returns} :=\n'
                 f'  scan_sizes {collection} 0 {end} {nodes} {returns} collection_checked\n'
                 f'theorem substantial_domain : {divisor} * (5 * ({nodes} + {returns})) ≥\n'
                 '    573802 := by decide +kernel\n'
                 'theorem wrong_source_order_rejected :\n'
                 '    scan (.branch 1 (.leaf record_1) (.leaf record_0)) 0 = none := by\n'
                 '  decide +kernel\n'
                 f'end {namespace}\n')
    roots += [namespace + '.' + name for name in ['collection_checked', 'complete_source_prefix',
              'actual_node_and_return_census', 'substantial_domain', 'wrong_source_order_rejected']]
    source = ''.join(parts)
    declarations = ['theorem collection_checked', 'theorem complete_source_prefix',
                    'theorem actual_node_and_return_census', 'theorem substantial_domain',
                    'theorem wrong_source_order_rejected', 'end ' + namespace + '\n']
    for index, declaration in enumerate(declarations, 1):
        assert source.count(declaration) == 1
        source = source.replace(declaration, progress_marker('assembly', index,
            driver.args.output / f'{stem}-details.tsv') + declaration)
    driver.emit(stem + '.lean', source + audit_and_end(
        driver, stem, roots, f'Actual paid body coverage checked: at least 1/{divisor}'))
    driver.summary[f'local_scope_{divisor}_proposed'] = dict(
        divisor=divisor, first_label=0, end_label=end, operations=end,
        new_operations=len([q for q in range(end) if q not in inherited]),
        finite_state_domain=states, finite_row_domain=rows, source_body_states=573802,
        main_nodes=nodes, return_ranks=returns, required_roots=len(roots),
        every_bit_and_store=True, all_paid_local_returns=True,
        syntax_representation=('numeric trace equals encoded original source syntax' if
                               numeric_recipe else
                               'lower restored raw operation; exact raw-source equality checked'),
        proof_representation='compact Boolean recipe implies identical SourceRows and census',
        recipe_constructor=('certified operation-local family' if local_views else
                            recipe_constructor),
        independent_block_roots_preserved=True,
        kernel_checked=False, full_quotient_certified=False, new_accepted_machine=False)
    driver.checkpoint()
    return {q: stem for q in range(end)}
