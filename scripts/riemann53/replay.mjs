// Independent literal parser, skipped-bit map, pop calculation and tape replay.
import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';

assert.equal(process.env.RH53_REMOTE, '1');
assert.equal(process.env.GITHUB_ACTIONS, 'true');
const directory = (process.env.RH53_OUTPUT_DIR || '.lake/riemann53') + '/';
const read = name => JSON.parse(fs.readFileSync(directory + name, 'utf8'));
const sha = bytes => crypto.createHash('sha256').update(bytes).digest('hex');
function table(bytes) {
  const rows = bytes.toString('utf8').trimEnd().split('\n').map(line => {
    const cells = line.split(' ');
    assert.equal(cells.length, 2);
    return cells.map(cell => {
      if (cell === '---') return null;
      const m = /^([01])([LR])(0|[1-9][0-9]*)$/.exec(cell);
      assert.ok(m);
      return [Number(m[1]), m[2] === 'R' ? 1 : -1, Number(m[3])];
    });
  });
  for (const row of rows) for (const cell of row)
    assert.ok(cell === null || cell[2] < rows.length);
  return rows;
}
const originalBytes = fs.readFileSync('artifacts/riemann_95/machine.txt');
const candidateBytes = fs.readFileSync(directory + 'machine94.txt');
const old = table(originalBytes), newer = table(candidateBytes);
assert.equal(old.length, 95);
assert.equal(newer.length, 94);
const missing = [];
newer.forEach((row, q) => row.forEach((cell, a) => {
  if (cell === null) missing.push([q, a]);
}));
assert.deepEqual(missing, [[60, 1]]);
const map = q => q < 53 ? q : q - 1;
function verifyTransformation(candidate) {
  assert.equal(candidate.length, 94);
  old.forEach((row, q) => {
    if (q === 53) return;
    row.forEach((cell, a) => {
      const expected = cell === null ? null :
        [cell[0], cell[1], map(cell[2] === 53 ? 68 : cell[2])];
      assert.deepEqual(candidate[map(q)][a], expected);
    });
  });
}
verifyTransformation(newer);
const badCell = structuredClone(newer);
badCell[40][1][2] = 66;
assert.throws(() => verifyTransformation(badCell));
assert.throws(() => verifyTransformation(newer.slice(0, -1)));
function encode(word) {
  let state = 15;
  const result = [];
  for (let i = 0; i < word.length; i++) {
    const bit = word[i], cell = old[state][bit];
    if (cell === null || cell[0] !== bit || cell[1] !== 1)
      return result.concat(word.slice(i));
    if (state !== 53) result.push(bit);
    state = cell[2];
  }
  return result;
}
function pop(word, cont, k) {
  const reversed = [...word].reverse();
  while (reversed.length) {
    const bit = reversed.shift();
    if (bit === (cont ? 1 : 0)) {
      if (k === 0) return [1, ...reversed].reverse();
      k--;
    }
  }
  return [];
}
function replay(machine, frame, expected) {
  const tape = new Map(frame.ones.map(pos => [pos, 1]));
  let state = frame.state, head = frame.head;
  assert.ok(expected.steps <= 20000);
  for (let i = 0; i < expected.steps; i++) {
    const cell = machine[state][tape.get(head) || 0];
    assert.ok(cell !== null);
    if (cell[0]) tape.set(head, 1); else tape.delete(head);
    head += cell[1]; state = cell[2];
    if (i < expected.steps - 1) assert.notEqual(state, 15);
  }
  assert.equal(state, expected.state);
  assert.equal(head, expected.head);
  assert.deepEqual([...tape.keys()].sort((a, b) => a - b), expected.ones);
}
const witness = read('witness.json');
function sourceArray(file, name) {
  const source = fs.readFileSync(file, 'utf8');
  const start = source.indexOf('#[', source.indexOf('def ' + name)) + 1;
  let level = 0;
  for (let i = start; i < source.length; i++) {
    if (source[i] === '[') level++;
    if (source[i] === ']') level--;
    if (level === 0) return source.slice(start, i + 1);
  }
  throw new Error('Missing source array');
}
const schema = 'Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean';
assert.equal(witness.label[0], 'outside');
assert.deepEqual(JSON.parse(sourceArray(schema, 'outsideWords'))[witness.label[1]], witness.word);
assert.deepEqual(JSON.parse(sourceArray(schema, 'outsideWalked'))[witness.label[1]], witness.walked);
const control = 'Cryptids/ReductionSupport/Riemann95/ControlStep95.lean';
const effectLines = sourceArray(control, 'outsideEffects').slice(1, -1).trim().split('\n');
const effectText = effectLines[witness.label[1]].trim().replace(/,$/, '');
const e = witness.effect;
assert.equal(effectText, e.kind === 'jump' ? `.jump ${e.cont} ${e.k}` : `.${e.kind} ${e.reg}`);
assert.deepEqual(encode(witness.word), witness.encoded_word);
assert.deepEqual(encode(witness.walked), witness.encoded_walked);
assert.deepEqual(pop(witness.walked, witness.cont, witness.k), witness.old_return);
const lhs = encode(witness.old_return);
const rhs = pop(witness.encoded_walked, witness.cont, witness.k);
assert.deepEqual(lhs, witness.encoded_old_return);
assert.deepEqual(rhs, witness.return_of_encoded);
assert.notDeepEqual(lhs, rhs);
replay(old, witness.frames.old_input, witness.frames.old_next_root);
replay(newer, witness.frames.new_input, witness.frames.new_next_root);
assert.deepEqual(witness.frames.old_next_root.relative_ones,
                 witness.frames.expected_old_next.ones);
assert.deepEqual(witness.frames.new_next_root.relative_ones,
                 witness.frames.expected_new_control_next.ones);
assert.deepEqual(witness.label, ['outside', 44]);
assert.equal(witness.cont, false);
assert.equal(witness.k, 1);
const result = {
  status: 'witness-reproduced', baseline_sha256: sha(originalBytes),
  candidate_sha256: sha(candidateBytes), states: newer.length,
  cells: newer.flat().length, defined: newer.flat().filter(x => x !== null).length,
  absent: missing, equation_lhs: lhs, equation_rhs: rhs,
  negative_controls: {wrong_cell_rejected: true, wrong_count_rejected: true},
  actual_tapes_replayed: true, certified_rh_equivalence: false,
  witness_sha256: sha(fs.readFileSync(directory + 'witness.json')),
};
fs.writeFileSync(directory + 'independent-replay.json', JSON.stringify(result, null, 2) + '\n');
console.log('INDEPENDENT_EXACT_OBSTRUCTION_REPLAYED');
