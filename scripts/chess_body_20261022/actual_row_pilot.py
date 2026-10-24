#!/usr/bin/env python3
"""Remote-only structural binary-row proof generation (untrusted proof producer)."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

from bisect import bisect_right
from functools import lru_cache
import hashlib
import json


def propose_plan(data, selected):
    """Propose finite witnesses only; these observations add no proof credit."""
    main, states = 533341, 573802
    records = data['getter_samples']
    offsets, return_offsets = data['prefix_offsets'], data['return_offsets']
    entries, targets = data['entries'], data['return_local_targets']
    assert len(records) == 106668 and len(entries) == 4042
    assert offsets[-1] == 106668 and return_offsets[-1] == 8092
    facts, nodes, slots, labels = {}, set(), set(), set()
    main_pairs, return_pairs, find_targets, target_slots, entry_labels = set(), set(), set(), set(), set()

    def encode(node, store):
        if node is None:
            return 1
        assert 0 <= node < 106668 and 0 <= store < 5
        raw = 1 + 5 * node + store
        return 0 if raw == 1 else raw

    def target_rank(node):
        q = bisect_right(offsets, node) - 1
        assert 0 <= q < 4042
        rank = targets[q].index(node - offsets[q])
        slots.add(node)
        labels.add(q)
        find_targets.add((q, node, rank))
        return q, rank

    @lru_cache(None)
    def auxiliary(node, bit, store):
        assert 0 <= node < 106668 and bit in (0, 1) and 0 <= store < 5
        assert records[node][0] == node
        instruction = records[node][1]
        tag = instruction[0]
        nodes.add(node)
        slots.add(node)
        lane = 5 * bit + store
        if tag == 0:
            assert instruction[1] in (-1, 1)
            result = (instruction[2], store, 'move', instruction[1])
        elif tag == 1:
            result = (instruction[2], store, 'write', instruction[1][lane])
        elif tag in (2, 3):
            value = instruction[1][lane]
            child = instruction[2] if tag == 2 else instruction[2 if value else 3]
            assert child < node
            result = auxiliary(child, bit, value if tag == 2 else store)
        elif tag == 4:
            label = instruction[1][lane]
            assert 0 <= label < 4042
            labels.add(label)
            entry_labels.add(label)
            slots.add(entries[label])
            result = (entries[label], store, 'write', bit)
        else:
            assert tag == 5
            result = (None, store, 'write', bit)
        facts[node, bit, store] = result
        return result

    rows, source_main, source_return = {}, {}, {}
    for state in selected:
        assert 0 <= state < states
        if state < main:
            if state == 1:
                for bit in (0, 1):
                    rows[state, bit] = None
                continue
            node, store = divmod((1 if state == 0 else state) - 1, 5)
            main_pairs.add((node, store))
            source_main[state] = node, store
            for bit in (0, 1):
                next_node, final_store, command, value = auxiliary(node, bit, store)
                if command == 'move':
                    main_pairs.add((next_node, final_store))
                    rows[state, bit] = bit, value, encode(next_node, final_store)
                elif next_node is None:
                    rows[state, bit] = value, 1, main
                else:
                    q, rank = target_rank(next_node)
                    return_pairs.add((q, rank, final_store))
                    target = main + 1 + 5 * (return_offsets[q] + rank) + final_store
                    rows[state, bit] = value, 1, target
        else:
            raw = state - main
            if raw == 0:
                for bit in (0, 1):
                    rows[state, bit] = bit, -1, 1
                continue
            global_rank, store = divmod(raw - 1, 5)
            q = bisect_right(return_offsets, global_rank) - 1
            rank = global_rank - return_offsets[q]
            assert 0 <= q < 4042 and 0 <= rank < len(targets[q])
            node = offsets[q] + targets[q][rank]
            assert data['return_targets'][raw] == encode(node, store)
            slots.add(node)
            labels.add(q)
            return_pairs.add((q, rank, store))
            target_slots.add((q, rank, node))
            main_pairs.add((node, store))
            source_return[state] = q, rank, store, node
            for bit in (0, 1):
                rows[state, bit] = bit, -1, encode(node, store)
    return dict(facts=facts, nodes=nodes, slots=slots, labels=labels,
                main_pairs=main_pairs, return_pairs=return_pairs,
                find_targets=find_targets, target_slots=target_slots,
                entry_labels=entry_labels, rows=rows,
                source_main=source_main, source_return=source_return,
                native_proposals_only=True)


TOOLS = r'''open ConjectureMachines.Optimisation
open Chess.Optimisation FieldCompiler
set_option backward.isDefEq.respectTransparency false

def mainIndex (pc : Fin 106668) (value : Fin 5) : Fin 573802 :=
  SelectiveBinary.mainState (r := 40461)
    (CompactPost.encode FieldPacked.getter (some pc, value))

def haltedMain : Fin 573802 := SelectiveBinary.mainState (r := 40461)
  (CompactPost.encode FieldPacked.getter (none, 0))

def returnIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) : Fin 40461 :=
  FieldSelectiveLayout.liveReturn q
    (i.cast (congrArg (fun p ↦ 1 + FieldReturns.writeCount p) same).symm) value

def bounceIndex (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) : Fin 573802 :=
  SelectiveBinary.bounceState (q := 533341) (returnIndex q p same i value)

theorem returnIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    (returnIndex q p same i value).val =
      1 + (FieldSelectiveLayout.offset q + i.val) * 5 + value.val := by
  simpa only [returnIndex, Fin.val_cast] using
    FieldSelectiveLayout.liveReturn_val q
      (i.cast (congrArg (fun p ↦ 1 + FieldReturns.writeCount p) same).symm) value

theorem bounceIndex_val (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    (bounceIndex q p same i value).val =
      533341 + (1 + (FieldSelectiveLayout.offset q + i.val) * 5 + value.val) := by
  unfold bounceIndex
  rewrite [SelectiveBinary.bounceState_val, returnIndex_val]
  rfl

theorem entry_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) :
    FieldPacked.getter.entry q = slotIndex q p same p.root := by
  cases same
  rfl

theorem findReturn_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p) (i : Fin p.size) (value : Fin 5) :
    FieldSelectiveLayout.findReturn
        (CompactPost.encode FieldPacked.getter (some (slotIndex q p same i), value)) =
      (FieldReturns.findTarget p i).map (fun j ↦ returnIndex q p same j value) := by
  cases same
  exact FieldSelectiveLayout.findReturn_live q i value

theorem returnAt_syntax (q : Fin 4042) (p : Syntax 4042)
    (same : FieldPacked.syntaxRows.get q = p)
    (i : Fin (1 + FieldReturns.writeCount p)) (value : Fin 5) :
    FieldSelectiveLayout.returnAt (returnIndex q p same i value) =
      CompactPost.encode FieldPacked.getter
        (some (slotIndex q p same (FieldReturns.targetAt p i)), value) := by
  cases same
  exact FieldSelectiveLayout.returnAt_live q i value

theorem post_halted (bit : Bool) :
    FieldPacked.post (CompactPost.encode FieldPacked.getter (none, 0)) bit = none := by
  simp only [FieldPacked.post, CompactPost.machine, CompactPost.decode_encode,
    Option.map_none]

theorem haltedMain_address : haltedMain = 1 := by
  unfold haltedMain
  rw [CompactPost.encode, permutation_numeric]
  decide +kernel

theorem decode_bit_0 : Binary.decodeSymbol 0 = false := rfl

theorem decode_bit_1 : Binary.decodeSymbol 1 = true := rfl
'''


def generate_tools(driver, header, audit_and_end, module):
    roots = ['mainIndex', 'haltedMain', 'returnIndex', 'bounceIndex',
             'returnIndex_val', 'bounceIndex_val', 'entry_syntax', 'findReturn_syntax',
             'returnAt_syntax', 'post_halted', 'haltedMain_address',
             'decode_bit_0', 'decode_bit_1']
    driver.emit('ActualTools.lean', header([module + '.RowWitnesses']) + TOOLS +
                audit_and_end(driver, 'ActualTools', roots,
                              'Structural main and return row transport helpers checked'))


def generate_rows(driver, selected, snapshot, expected_sha, header, audit_and_end,
                  progress_marker, module):
    import row_witness_pilot
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    plan = propose_plan(data, selected)
    count, scope = len(selected), f'Sample{len(selected)}'
    stem = f'Rows{count}'
    body, roots, detail = row_witness_pilot.build_body(
        driver, data, plan['nodes'], progress_marker,
        extra_slots=plan['slots'], extra_labels=plan['labels'], numeric_nodes=True)
    parts = [header([module + '.BodyRelation', module + '.SymbolicTransitions',
                     module + '.Diagnostics']),
             f'namespace {scope}\n',
             'attribute [local irreducible] FieldPacked.getter FieldPacked.layout\n'
             'attribute [local irreducible] FieldAware.syntaxRows FieldSelectiveLayout.code\n',
             body]
    offsets, entries = data['prefix_offsets'], data['entries']

    def add(name, source):
        roots.append(name)
        parts.append('capture_cert in\n' + source + '\n')

    def marker(kind, value):
        parts.append(progress_marker(kind, value, driver.args.output / f'rows-{count}-progress.tsv'))

    def boolean(value):
        assert value in (0, 1)
        return 'true' if value else 'false'

    def direction(value):
        assert value in (-1, 1)
        return 'right' if value == 1 else 'left'

    def encoded(node, store):
        raw = 1 + 5 * node + store
        return 0 if raw == 1 else raw

    def row_expression(row):
        if row is None:
            return 'none'
        write, move, next_state = row
        return f'some (({write} : Fin 2), .{direction(move)}, ({next_state} : Fin 573802))'

    def finish_index(write, move, proof):
        return (f'  exact congrArg (fun next : Fin 573802 ↦\n'
                f'    some (({write} : Fin 2), Dir.{direction(move)}, next)) {proof}')

    for q in sorted(plan['entry_labels']):
        node = entries[q]
        add(f'root_{q}', f'theorem root_{q} : syntax_{q}.root = slot_{node} := by rfl')
        add(f'entry_{q}', f'theorem entry_{q} : FieldPacked.getter.entry {q} = {node} := by\n'
            f'  rw [entry_syntax {q} syntax_{q} syntax_eq_{q}, root_{q}, address_{node}]')
        marker(f'entry-{count}', q)
    for q in sorted({item[0] for item in plan['return_pairs']}):
        add(f'return_offset_{q}',
            f'theorem return_offset_{q} : FieldSelectiveLayout.offset {q} =\n'
            f'    {data["return_offsets"][q]} := by\n'
            '  rw [return_offset_fast]\n  decide +kernel')
        marker(f'return-offset-{count}', q)
    for q, rank in sorted({(q, rank) for q, rank, _ in plan['return_pairs']}):
        parts.append(f'def rank_{q}_{rank} : Fin (1 + FieldReturns.writeCount syntax_{q}) :=\n'
                     f'  ⟨{rank}, by decide +kernel⟩\n')
        add(f'rank_val_{q}_{rank}',
            f'theorem rank_val_{q}_{rank} : rank_{q}_{rank}.val = {rank} := by rfl')
    marker(f'ranks-{count}', 0)
    for q, node, rank in sorted(plan['find_targets']):
        add(f'find_{q}_{node}', f'theorem find_{q}_{node} :\n'
            f'    FieldReturns.findTarget syntax_{q} slot_{node} = some rank_{q}_{rank} := by rfl')
    for q, rank, node in sorted(plan['target_slots']):
        add(f'target_{q}_{rank}', f'theorem target_{q}_{rank} :\n'
            f'    FieldReturns.targetAt syntax_{q} rank_{q}_{rank} = slot_{node} := by rfl')
    marker(f'targets-{count}', 0)
    for index, (node, store) in enumerate(sorted(plan['main_pairs'])):
        add(f'main_address_{node}_{store}', f'theorem main_address_{node}_{store} :\n'
            f'    mainIndex {node} {store} = {encoded(node, store)} := by\n'
            '  unfold mainIndex\n  rw [CompactPost.encode, permutation_numeric]\n'
            '  decide +kernel')
        if index % 16 == 15 or index + 1 == len(plan['main_pairs']):
            marker(f'main-address-{count}', encoded(node, store))
    marker(f'before-bounce-{count}', 0)
    parts.append('section\n'
                 'attribute [local irreducible] returnIndex bounceIndex\n')
    for q, rank, store in sorted(plan['return_pairs']):
        target = 533341 + 1 + 5 * (data['return_offsets'][q] + rank) + store
        add(f'bounce_address_{q}_{rank}_{store}',
            f'theorem bounce_address_{q}_{rank}_{store} :\n'
            f'    bounceIndex {q} syntax_{q} syntax_eq_{q} rank_{q}_{rank} {store} =\n'
            f'      {target} := by\n  apply Fin.ext\n'
            f'  have numeric :=\n'
            f'    bounceIndex_val {q} syntax_{q} syntax_eq_{q} rank_{q}_{rank} {store}\n'
            f'  rewrite [return_offset_{q}, rank_val_{q}_{rank}] at numeric\n'
            f'  exact numeric.trans (by decide +kernel)')
        marker(f'bounce-address-{count}', target)
    parts.append('end\n')
    marker(f'before-aux-{count}', 0)
    for fact_index, ((node, bit, store), result) in enumerate(sorted(plan['facts'].items())):
        instruction = data['getter_samples'][node][1]
        tag, truth = instruction[0], boolean(bit)
        if tag in (1, 2, 3, 4):
            value = instruction[1][5 * bit + store]
            literal = boolean(value) if tag in (1, 3) else str(value)
            add(f'table_read_{node}_{bit}_{store}',
                f'theorem table_read_{node}_{bit}_{store} :\n'
                f'    nodeTable_{node}.read {truth} {store} = {literal} := by rfl')
        next_node, final_store, command, value = result
        pc = 'none' if next_node is None else f'some ({next_node} : Fin 106668)'
        statement = f'.move .{direction(value)}' if command == 'move' else f'.write {boolean(value)}'
        name = f'aux_{node}_{bit}_{store}'
        source = (f'theorem {name} :\n'
                  f'    LazyGraph.trAux FieldPacked.getter {truth} {node} {store} =\n'
                  f'      (({pc}, ({final_store} : Fin 5)), {statement}) := by\n')
        prefix = f'LazyGraph.trAux_{{}} FieldPacked.getter {truth}\n    '
        node_proof = f'numeric_node_{node}'
        if tag == 0:
            source += ('  exact ' + prefix.format('move') +
                       f'{node} {instruction[2]} {store} .{direction(instruction[1])} {node_proof}')
        elif tag == 1:
            source += ('  rw [' + prefix.format('write') +
                       f'{node} {instruction[2]} {store} nodeTable_{node} {node_proof},\n'
                       f'    table_read_{node}_{bit}_{store}]')
        elif tag in (2, 3):
            read_value = instruction[1][5 * bit + store]
            child = instruction[2] if tag == 2 else instruction[2 if read_value else 3]
            child_store = read_value if tag == 2 else store
            arguments = f'{node} {instruction[2]} '
            if tag == 3:
                arguments += f'{instruction[3]} '
            source += ('  rw [' + prefix.format('load' if tag == 2 else 'branch') +
                       arguments + f'{store} nodeTable_{node} {node_proof},\n'
                       f'    table_read_{node}_{bit}_{store}]\n')
            child_proof = f'aux_{child}_{bit}_{child_store}'
            source += (f'  exact {child_proof}' if tag == 2 else
                       f'  simpa only [Bool.false_eq_true, ↓reduceIte] using {child_proof}')
        elif tag == 4:
            label = instruction[1][5 * bit + store]
            source += ('  rw [' + prefix.format('goto') +
                       f'{node} {store} nodeTable_{node} {node_proof},\n'
                       f'    table_read_{node}_{bit}_{store}, entry_{label}]')
        else:
            source += ('  exact ' + prefix.format('halt') + f'{node} {store} {node_proof}')
        add(name, source)
        if fact_index % 16 == 15 or fact_index + 1 == len(plan['facts']):
            marker(f'aux-{count}', 10 * node + 5 * bit + store)
    for state in selected:
        for bit in (0, 1):
            row = plan['rows'][state, bit]
            rhs = row_expression(row)
            source = (f'theorem actual_{state}_{bit} :\n'
                      f'    FieldSelective.body.toMachine.transition {state} {bit} =\n'
                      f'      {rhs} := by\n')
            declaration = source
            compiler = ('SelectiveBinary.compile FieldPacked.post\n'
                        '    FieldSelectiveLayout.returnAt FieldSelectiveLayout.findReturn')
            if state == 1:
                source += ('  rewrite [← haltedMain_address]\n'
                           f'  change ({compiler}).transition haltedMain {bit} = _\n'
                           '  unfold haltedMain\n'
                           '  rewrite [SelectiveBinary.compile_main, post_halted]\n  rfl')
            elif state < 533341:
                node, store = plan['source_main'][state]
                source += (f'  rewrite [← main_address_{node}_{store}]\n'
                           f'  change ({compiler}).transition\n'
                           f'    (mainIndex {node} {store}) {bit} = _\n'
                           '  unfold mainIndex\n'
                           f'  rewrite [SelectiveBinary.compile_main, decode_bit_{bit},\n'
                           f'    post_live, aux_{node}_{bit}_{store}]\n'
                           '  dsimp only [Option.bind]\n')
                next_node, final_store, command, value = plan['facts'][node, bit, store]
                if command == 'move':
                    source += (f'  change some (({bit} : Fin 2), Dir.{direction(value)},\n'
                               f'    mainIndex {next_node} {final_store}) = _\n'
                               + finish_index(bit, value,
                                              f'main_address_{next_node}_{final_store}'))
                elif next_node is None:
                    source += '  rewrite [FieldSelectiveLayout.findReturn_halt]\n  rfl'
                else:
                    q = bisect_right(offsets, next_node) - 1
                    rank = data['return_local_targets'][q].index(next_node - offsets[q])
                    source = declaration + (
                        f'  exact symbolic_main_write {node} {store} {q}\n'
                        f'    syntax_{q} syntax_eq_{q} slot_{next_node} rank_{q}_{rank}\n'
                        f'    {final_store} {boolean(bit)} {boolean(value)}\n'
                        f'    {state} {row[2]} {next_node}\n'
                        f'    main_address_{node}_{store} address_{next_node}\n'
                        f'    bounce_address_{q}_{rank}_{final_store}\n'
                        f'    aux_{node}_{bit}_{store} find_{q}_{next_node}')
            elif state == 533341:
                source += ('  have address : SelectiveBinary.bounceState (q := 533341)\n'
                           '      FieldSelectiveLayout.haltReturn = (533341 : Fin 573802) := rfl\n'
                           '  rewrite [← address]\n'
                           f'  change ({compiler}).transition\n'
                           f'    (SelectiveBinary.bounceState FieldSelectiveLayout.haltReturn) {bit} = _\n'
                           '  rewrite [SelectiveBinary.compile_bounce,\n'
                           '    FieldSelectiveLayout.returnAt_halt 0]\n'
                           f'  change some (({bit} : Fin 2), Dir.left, haltedMain) = _\n'
                           + finish_index(bit, -1, 'haltedMain_address'))
            else:
                q, rank, store, node = plan['source_return'][state]
                source += (f'  rewrite [← bounce_address_{q}_{rank}_{store}]\n'
                           f'  change ({compiler}).transition\n'
                           f'    (bounceIndex {q} syntax_{q} syntax_eq_{q} rank_{q}_{rank} {store})\n'
                           f'    {bit} = _\n  unfold bounceIndex\n'
                           '  rewrite [SelectiveBinary.compile_bounce, returnAt_syntax,\n'
                           f'    target_{q}_{rank}, address_{node}]\n'
                           f'  change some (({bit} : Fin 2), Dir.left, mainIndex {node} {store}) = _\n'
                           + finish_index(bit, -1, f'main_address_{node}_{store}'))
            add(f'actual_{state}_{bit}', source)
            marker(f'actual-{count}', 2 * state + bit)
            name = f'row_{count}_{state}_{bit}'
            add(name, f'theorem {name} : RowAt {state} {bit} := by\n'
                f'  unfold RowAt\n  rw [actual_{state}_{bit}]\n  decide +kernel')
            marker(f'row-{count}', 2 * state + bit)
    parts.append(f'end {scope}\n')
    parts.append(audit_and_end(driver, stem, [scope + '.' + name for name in roots],
                              f'Body kernel rows checked: {count} states, {2 * count} rows'))
    driver.emit(stem + '.lean', ''.join(parts))
    driver.summary.setdefault('structural_sample_plans', {})[str(count)] = dict(
        native_proposals_only=True, actual_states=count, actual_rows=2 * count,
        getter_nodes=len(plan['nodes']), traux_facts=len(plan['facts']),
        source_labels=len(detail['labels']), proof_credit=False)
    driver.checkpoint()
