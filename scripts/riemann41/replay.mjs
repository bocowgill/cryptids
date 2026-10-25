// Independent table/schema parser and complete finite tape replay. Remote only.
import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
assert.equal(process.env.RH41_REMOTE, '1');
assert.equal(process.env.GITHUB_ACTIONS, 'true');
const dir = '.lake/riemann41/';
const read = name => JSON.parse(fs.readFileSync(dir + name, 'utf8'));
const bytes = fs.readFileSync('artifacts/riemann_95/machine.txt');
assert.equal(crypto.createHash('sha256').update(bytes).digest('hex'),
  '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d');
const table = bytes.toString().trimEnd().split('\n').map(line => {
  const cells = line.split(' ');
  assert.equal(cells.length, 2);
  return cells.map(cell => {
    if (cell === '---') return null;
    const m = /^([01])([LR])(0|[1-9][0-9]*)$/.exec(cell);
    assert.ok(m);
    return [Number(m[1]), m[2] === 'R' ? 1 : -1, Number(m[3])];
  });
});
function fidelity(t) {
  assert.equal(t.length, 95);
  const incoming = [], absent = [];
  t.forEach((row, q) => row.forEach((cell, b) => {
    if (cell === null) absent.push([q, b]);
    else {
      assert.ok(cell[2] >= 0 && cell[2] < 95);
      if (cell[2] === 41) incoming.push([q, b]);
    }
  }));
  assert.deepEqual(incoming, [[58, 1]]);
  assert.deepEqual(absent, [[61, 1]]);
  assert.deepEqual(t[41], [[0, 1, 54], [1, 1, 80]]);
  assert.deepEqual(t[58], [[1, 1, 58], [0, 1, 41]]);
}
fidelity(table);
assert.deepEqual(table, read('literal-cells.json'));
const corrupt = structuredClone(table);
corrupt[58][1][2] = 40;
assert.throws(() => fidelity(corrupt));
function array(name) {
  const text = fs.readFileSync('Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean', 'utf8');
  const start = text.indexOf('#[', text.indexOf('def ' + name)) + 1;
  assert.ok(start > 0);
  let depth = 0;
  for (let i = start; i < text.length; i++) {
    depth += Number(text[i] === '[') - Number(text[i] === ']');
    if (!depth) {
      const literal = text.slice(start, i + 1);
      assert.match(literal, /^[\[\]01,\s]*$/);
      return JSON.parse(literal);
    }
  }
  throw new Error('Missing schema array');
}
const words = array('outsideWords'), walks = array('outsideWalked');
const suffixes = array('suffixes'), local = array('localWalkSuffixes');
assert.equal(words.length, 97); assert.equal(walks.length, 97);
assert.equal(suffixes.length, 22); assert.equal(local.length, 22);
const cases = words.map((word, i) => ({label: ['outside', i], word, walked: walks[i]}));
for (let d = 0; d < 4; d++) {
  const p = [1,1,1,1,1,0].concat(...Array.from({length: d}, () => [1,1,1,1,0]));
  cases.push({label: ['entry', d], word: p.slice(0, -1), walked: p.concat(0)});
  for (let i = 0; i < 22; i++)
    cases.push({label: ['local', d, i], word: p.concat(suffixes[i]), walked: p.concat(local[i])});
}
cases.sort((a,b) => {
  const aa = [a.walked.length, a.walked.join(''), ...a.label];
  const bb = [b.walked.length, b.walked.join(''), ...b.label];
  for (let i = 0; i < Math.min(aa.length, bb.length); i++)
    if (aa[i] !== bb[i]) return aa[i] < bb[i] ? -1 : 1;
  return aa.length - bb.length;
});
const summary = read('finite-summary.json');
let evaluations = 0;
function tick() {
  assert.ok(++evaluations + summary.primary_transition_evaluations <= 2000000);
}
function endpoint(bits) {
  let q = 15;
  for (const b of bits) {
    tick();
    const cell = table[q][b];
    assert.ok(cell !== null && cell[0] === b && cell[1] === 1);
    q = cell[2];
  }
  return q;
}
const records = cases.map(test => ({case: test, endpoint: endpoint(test.walked)}));
assert.deepEqual(records, read('decoder-cases.json'));
const selected = records.filter(r => r.endpoint === 58).slice(0,16).map(r => r.case);
assert.deepEqual(selected, read('selected-callers.json'));
function replay(initial, bound, boot = false, target = [41,1]) {
  let q = initial.state, head = initial.head, outcome = 'bound';
  const tape = new Map(initial.ones.map(p => [p,1])), trace = [];
  for (let i = 0; i <= bound; i++) {
    const bit = tape.get(head) || 0;
    if (q === target[0] && bit === target[1]) { outcome = 'target-hit'; break; }
    if (q === 58 && bit === 1 && tape.has(head+1)) {
      outcome = 'separator-guard-failed'; break;
    }
    if (i && q === 15 && (!boot || i === 3634)) {
      outcome = boot ? 'initial-root' : 'next-root'; break;
    }
    if (i === bound) break;
    tick();
    const cell = table[q][bit];
    trace.push({index: i, state: q, head, bit, cell});
    if (cell === null) { outcome = 'halt'; break; }
    if (cell[0]) tape.set(head, 1); else tape.delete(head);
    head += cell[1]; q = cell[2];
  }
  return {outcome, transitions: trace.length, state: q, head,
          ones: [...tape.keys()].sort((a,b) => a-b), trace};
}
const blank = {state: 0, head: 0, ones: [], blank_elsewhere: true};
const knownHit = replay(blank, 0, false, [0,0]);
assert.equal(knownHit.outcome, 'target-hit');
assert.equal(knownHit.transitions, 0);
assert.deepEqual(knownHit, summary.known_hit_control);
const boot = read('boot.json');
assert.deepEqual(boot.input, blank);
assert.deepEqual(boot.result, replay(blank, 3634, true));
assert.equal(boot.result.transitions, 3634);
assert.equal(boot.result.outcome, 'initial-root');
assert.equal(boot.result.head, -4);
const bootBits = Array(22).fill(0).concat([1,0], ...Array.from({length:9}, () => [1,0]));
assert.deepEqual(boot.result.ones, [boot.result.head-1,
  ...bootBits.flatMap((b,i) => b ? [boot.result.head+i] : [])]);
const framesText = fs.readFileSync(dir + 'frames.jsonl', 'utf8').trimEnd();
const frames = framesText ? framesText.split('\n').map(JSON.parse) : [];
const expected = [];
for (const test of selected) for (const active of [[0,0,0,0,0],[1,1,1,1,1],
  [0,1,2,3,4],[4,3,2,1,0]]) for (const extra of [[],[0,1,0,2]]) {
  const pad = Math.max(22, test.walked.length+3);
  const bits = test.word.concat(Array(pad-test.word.length).fill(0), [1,0],
    ...active.concat(extra).map(v => Array(v+1).fill(1).concat(0)));
  expected.push({state:15, head:0, ones:[-1,...bits.flatMap((b,i) => b ? [i] : [])],
    blank_elsewhere:true, pad, active, extra, case:test});
}
assert.equal(frames.length, summary.frame_count);
assert.ok(frames.length <= 128);
frames.forEach((record, i) => {
  assert.deepEqual(record.input, expected[i]);
  assert.deepEqual(record.result, replay(record.input, 20000));
});
if (summary.status === 'finite-filters-passed') assert.equal(frames.length, expected.length);
assert.equal(evaluations, summary.primary_transition_evaluations);
const result = {status:'fixed-filters-independently-replayed', frames:frames.length,
  callers:selected.length, transition_evaluations:evaluations,
  combined_transition_evaluations:evaluations + summary.primary_transition_evaluations,
  known_hit_control_rejected:true, wrong_incoming_cell_rejected:true,
  complete_tapes_and_traces_replayed:true, global_avoidance_proved:false};
fs.writeFileSync(dir+'independent-replay.json', JSON.stringify(result,null,2)+'\n');
console.log('RH41_FIXED_FILTERS_INDEPENDENTLY_REPLAYED');
