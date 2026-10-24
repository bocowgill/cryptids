#!/usr/bin/env python3
"""Remote-only linear prefix certificate with balanced numeric lookup."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')

import hashlib
import json


TOOLS = r'''open Chess.Optimisation
namespace PrefixScanPilot

def prefixes : List Nat → Nat → List Nat
  | [], initial => [initial]
  | value :: values, initial => initial :: prefixes values (initial + value)

theorem prefixes_get (values : List Nat) (initial index : Nat)
    (bounded : index ≤ values.length) :
    (prefixes values initial).getD index 0 = initial + (values.take index).sum := by
  induction values generalizing initial index with
  | nil =>
    have zero : index = 0 := Nat.eq_zero_of_le_zero bounded
    subst index
    rfl
  | cons value values ih =>
    cases index with
    | zero => rfl
    | succ index =>
      have next_bound : index ≤ values.length := Nat.le_of_succ_le_succ bounded
      change (prefixes values (initial + value)).getD index 0 = _
      rewrite [ih (initial + value) index next_bound]
      simpa only [List.take_succ_cons, List.sum_cons] using
        (Nat.add_assoc initial value (values.take index).sum)

theorem lookup_prefix (tree : Balanced.RowTree Nat) (valid : tree.WellFormed)
    (values : List Nat) (same : tree.flatten = prefixes values 0)
    (index : Nat) (bounded : index ≤ values.length) :
    tree.lookup index 0 = (values.take index).sum := by
  rewrite [Balanced.RowTree.lookup_eq_getD tree valid]
  have lookup_eq := congrArg (fun xs : List Nat ↦ xs.getD index 0) same
  exact lookup_eq.trans (by simpa only [Nat.zero_add] using prefixes_get values 0 index bounded)
'''


def generate(driver, snapshot, expected_sha, header, audit_and_end, module):
    assert hashlib.sha256(snapshot.read_bytes()).hexdigest() == expected_sha
    data = json.loads(snapshot.read_text())
    parts = [header([module + '.WeightTables']), TOOLS]
    names = ['prefixes', 'prefixes_get', 'lookup_prefix']

    def inline(values, first, count):
        if count == 0:
            return '.empty'
        if count == 1:
            return f'.leaf {values[first]}'
        half = count // 2
        left = '(' + inline(values, first, half) + ')'
        right = '(' + inline(values, first + half, count - half) + ')'
        return (f'.branch {half}\n' +
                '\n'.join('  ' + line for line in left.splitlines()) + '\n' +
                '\n'.join('  ' + line for line in right.splitlines()))

    def tree(prefix, values, first, count):
        name = f'{prefix}_{first}_{count}'
        if count <= 32:
            body = inline(values, first, count)
        else:
            half = count // 2
            left = tree(prefix, values, first, half)
            right = tree(prefix, values, first + half, count - half)
            body = f'.branch {half} {left} {right}'
        parts.append(f'def {name} : Balanced.RowTree Nat :=\n' +
                     '\n'.join('  ' + line for line in body.splitlines()) + '\n')
        return name

    for prefix, key, weights, frozen in [
            ('node', 'prefix_offsets', 'nodeWeights', 'FieldPackedLayout'),
            ('return', 'return_offsets', 'returnWeights', 'FieldSelectiveLayout')]:
        values = data[key]
        assert len(values) == 4043 and values[0] == 0
        assert all(type(x) is int and x >= 0 for x in values)
        assert all(a < b for a, b in zip(values, values[1:]))
        root = tree(prefix, values, 0, len(values))
        parts.append(f'def {prefix}Prefixes : Balanced.RowTree Nat := {root}\n'
                     f'theorem {prefix}_prefix_valid : {prefix}Prefixes.WellFormed := by\n'
                     '  decide +kernel\n'
                     f'theorem {prefix}_prefix_scan :\n'
                     f'    {prefix}Prefixes.flatten = prefixes {weights} 0 := by\n'
                     '  decide +kernel\n'
                     f'theorem {prefix}_weights_length : {weights}.length = 4042 := by\n'
                     f'  exact (congrArg List.length {prefix}_weights_eq.symm).trans\n'
                     f'    {frozen}.weights_length\n'
                     f'theorem {prefix}_offset_lookup (q : Fin 4042) :\n'
                     f'    {frozen}.offset q = {prefix}Prefixes.lookup q.val 0 := by\n'
                     f'  exact ({prefix}_offset_fast q).trans\n'
                     f'    (lookup_prefix {prefix}Prefixes {prefix}_prefix_valid {weights}\n'
                     f'      {prefix}_prefix_scan q.val\n'
                     f'      (by rw [{prefix}_weights_length]; exact Nat.le_of_lt q.isLt)).symm\n')
        names += [prefix + suffix for suffix in ['Prefixes', '_prefix_valid', '_prefix_scan',
                                                '_weights_length', '_offset_lookup']]
    parts.append('end PrefixScanPilot\n')
    driver.emit('PrefixScan.lean', ''.join(parts) + audit_and_end(
        driver, 'PrefixScan', ['PrefixScanPilot.' + name for name in names],
        'Complete linear prefix certificates agree with frozen offsets'))
    driver.summary['prefix_scan_proposed'] = dict(
        source_labels=4042, node_prefixes=4043, return_prefixes=4043,
        per_label_prefix_proofs=0, kernel_checked=False,
        full_quotient_certified=False, new_accepted_machine=False)
    driver.checkpoint()
