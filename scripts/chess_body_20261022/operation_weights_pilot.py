#!/usr/bin/env python3
"""Remote-only universal exact cost summaries for the frozen operation compiler."""
import os

if os.environ.get('CHESS_REMOTE') != '1' or os.environ.get('GITHUB_ACTIONS') != 'true':
    raise SystemExit('Remote GitHub Actions execution required before import')


SOURCE = r'''open Chess.Optimisation
open FieldCompiler FieldBinary
set_option backward.isDefEq.respectTransparency false

def opWeights {n : Nat} : Op n → Nat × Nat
  | .move _ _ => (14, 1)
  | .write field _ _ => (10 * fieldOffset field + 44, 16)
  | .load field _ _ => (9 * fieldOffset field + 61, 1)
  | .pureLoad _ _ => (2, 1)
  | .marker _ _ => (39, 1)
  | .absent field _ _ => (9 * fieldOffset field + 53, 1)
  | .branch _ _ _ => (3, 1)
  | .jump _ => (1, 1)
  | .halt => (1, 1)

theorem lower_weights {n : Nat} (op : Op n) :
    ((lower op).size, 1 + FieldReturns.writeCount (lower op)) = opWeights op := by
  cases op with
  | move dir next => rfl
  | write field value next => fin_cases field <;> rfl
  | load field value next => fin_cases field <;> rfl
  | pureLoad value next => rfl
  | marker yes no => rfl
  | absent field yes no => fin_cases field <;> rfl
  | branch test yes no => rfl
  | jump target => rfl
  | halt => rfl

theorem lower_node_weight {n : Nat} (op : Op n) :
    (lower op).size = (opWeights op).1 := congrArg Prod.fst (lower_weights op)

theorem lower_return_weight {n : Nat} (op : Op n) :
    1 + FieldReturns.writeCount (lower op) = (opWeights op).2 :=
  congrArg Prod.snd (lower_weights op)

theorem node_weight_function :
    (fun row : Snapshot.Entry ↦ (lower row.1).size) =
      (fun row : Snapshot.Entry ↦ (opWeights row.1).1) := by
  funext row
  exact lower_node_weight row.1

theorem return_weight_function :
    (fun row : Snapshot.Entry ↦ 1 + FieldReturns.writeCount (lower row.1)) =
      (fun row : Snapshot.Entry ↦ (opWeights row.1).2) := by
  funext row
  exact lower_return_weight row.1
'''


def generate(driver, header, audit_and_end):
    roots = ['opWeights', 'lower_weights', 'lower_node_weight', 'lower_return_weight',
             'node_weight_function', 'return_weight_function']
    driver.emit('OperationWeights.lean', header([
        'Cryptids.Chess.Optimisation.FieldSelective', 'Mathlib.Tactic.FinCases']) + SOURCE +
        audit_and_end(driver, 'OperationWeights', roots,
                      'Universal frozen operation weight summaries checked'))
