// Independent source parser, alias walker and complete finite tape replay.
import fs from 'node:fs';
import crypto from 'node:crypto';
import assert from 'node:assert/strict';
assert.equal(process.env.RHSHARE_REMOTE, '1');
assert.equal(process.env.GITHUB_ACTIONS, 'true');
const dir = '.lake/riemann-share/';
const read = name => JSON.parse(fs.readFileSync(dir + name, 'utf8'));
const sha = data => crypto.createHash('sha256').update(data).digest('hex');
const bytes = fs.readFileSync('artifacts/riemann_95/machine.txt');
assert.equal(sha(bytes), '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d');
const original = bytes.toString().trimEnd().split('\n').map(line => {
  const cells = line.split(' ');
  assert.equal(cells.length, 2);
  return cells.map(s => {
    if (s === '---') return null;
    const m = /^([01])([LR])(0|[1-9][0-9]*)$/.exec(s);
    assert.ok(m);
    return [Number(m[1]), m[2] === 'R' ? 1 : -1, Number(m[3])];
  });
});
const members = [26, 46, 50, 86, 87, 94];
function checkOriginal(t) {
  assert.equal(t.length, 95);
  for (const row of t) for (const cell of row)
    assert.ok(cell === null || cell[2] >= 0 && cell[2] < t.length);
  members.forEach((q, i) => assert.deepEqual(t[q], [[0, 1, 58], [1, 1, [33,60,64,89,94,43][i]]]));
}
checkOriginal(original);
const expectedFamily = [];
for (let a = 0; a < members.length; a++) for (let b = a + 1; b < members.length; b++) {
  for (const [keep, remove] of [[members[a], members[b]], [members[b], members[a]]])
    expectedFamily.push({index: expectedFamily.length, pair: [members[a], members[b]], keep, remove});
}
function checkFamily(family) { assert.deepEqual(family, expectedFamily); }
const family = read('family.json');
checkFamily(family);
assert.throws(() => checkFamily(family.slice(0, -1)));
const corrupt = structuredClone(original);
corrupt[26][0][2] = 57;
assert.throws(() => checkOriginal(corrupt));
let evaluations = 0;
const tick = () => { assert.ok(++evaluations + readScreenSteps <= 2000000); };
const screen = read('screen.json'), readScreenSteps = screen.total_transition_evaluations;
function array(name) {
  const text = fs.readFileSync('Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean', 'utf8');
  const start = text.indexOf('#[', text.indexOf('def ' + name)) + 1;
  assert.ok(start > 0);
  let depth = 0;
  for (let i = start; i < text.length; i++) {
    if (text[i] === '[') depth++;
    if (text[i] === ']') depth--;
    if (!depth) {
      const literal = text.slice(start, i + 1);
      assert.match(literal, /^[\[\]01,\s]*$/);
      return JSON.parse(literal);
    }
  }
  throw new Error('Source array missing');
}
const words = array('outsideWords'), walked = array('outsideWalked');
const suffixes = array('suffixes'), local = array('localWalkSuffixes');
assert.equal(words.length, 97); assert.equal(walked.length, 97);
assert.equal(suffixes.length, 22); assert.equal(local.length, 22);
const cases = words.map((w, i) => ({label: ['outside', i], word: w, walked: walked[i]}));
for (let d = 0; d <= 3; d++) {
  const p = [1,1,1,1,1,0].concat(...Array.from({length: d}, () => [1,1,1,1,0]));
  cases.push({label: ['entry', d], word: p.slice(0, -1), walked: p.concat(0)});
  for (let s = 0; s < 22; s++)
    cases.push({label: ['local', d, s], word: p.concat(suffixes[s]), walked: p.concat(local[s])});
}
function compare(a, b) {
  const aa = [a.walked.length, a.walked.join(''), ...a.label];
  const bb = [b.walked.length, b.walked.join(''), ...b.label];
  for (let i = 0; i < Math.min(aa.length, bb.length); i++)
    if (aa[i] !== bb[i]) return aa[i] < bb[i] ? -1 : 1;
  return aa.length - bb.length;
}
cases.sort(compare);
assert.equal(cases.length, screen.fixture_set_size);
const alias = (q, c) => q === c.remove ? c.keep : q;
const dense = (q, c) => alias(q, c) - Number(c.remove < alias(q, c));
function cell(q, b, c) {
  const t = original[c ? alias(q, c) : q][b];
  return t === null ? null : [t[0], t[1], c ? alias(t[2], c) : t[2]];
}
function walk(w, c) {
  let q = 15;
  const trace = [];
  for (let i = 0; i < w.length; i++) {
    tick();
    const t = cell(q, w[i], c);
    trace.push({index: i, state: q, bit: w[i], cell: t});
    if (t === null || t[0] !== w[i] || t[1] !== 1) return {endpoint: null, trace};
    q = t[2];
  }
  return {endpoint: q, trace};
}
const rows = fs.readFileSync(dir + 'aliases.jsonl', 'utf8').trimEnd().split('\n').map(JSON.parse);
assert.deepEqual(rows, screen.records);
let rejected = 0;
family.forEach((choice, index) => {
  const record = rows[index];
  assert.deepEqual(record.choice, choice);
  let first = null, tested = 0;
  for (const test of cases) {
    tested++;
    const a = walk(test.walked), b = walk(test.walked, choice);
    assert.notEqual(a.endpoint, null);
    const expected = dense(a.endpoint, choice);
    const actual = b.endpoint === null ? null : dense(b.endpoint, choice);
    if (expected !== actual) { first = {test, a, b, expected, actual}; break; }
  }
  assert.equal(tested, record.tested);
  if (first) {
    rejected++;
    assert.equal(record.status, 'endpoint-contract-refuted');
    assert.deepEqual(record.witness, first.test);
    assert.equal(record.old_endpoint, first.a.endpoint);
    assert.equal(record.alias_endpoint, first.b.endpoint);
    assert.equal(record.expected_dense, first.expected);
    assert.equal(record.observed_dense, first.actual);
    assert.deepEqual(record.old_trace, first.a.trace);
    assert.deepEqual(record.alias_trace, first.b.trace);
  } else assert.equal(record.status, 'finite-survivor');
});
function replay(initial, count, choice) {
  let q = 15, head = 0;
  const tape = new Map(initial.ones.map(p => [p, 1])), trace = [];
  for (let i = 0; i < count; i++) {
    tick();
    const b = tape.get(head) || 0, t = cell(q, b, choice);
    trace.push({index: i, state: q, head, bit: b, cell: t});
    if (t === null) return {halted: true, steps: i, state: q, head,
                           ones: [...tape.keys()].sort((a,b) => a-b), trace};
    if (t[0]) tape.set(head, 1); else tape.delete(head);
    head += t[1]; q = t[2];
  }
  return {halted: false, steps: count, state: q, head,
          ones: [...tape.keys()].sort((a,b) => a-b), trace};
}
if (rejected === 30) {
  assert.equal(screen.status, 'all-aliases-refuted');
  const certificate = fs.readFileSync(dir + 'ShareCertificate.lean', 'utf8');
  assert.equal(sha(Buffer.from(certificate)), screen.generated_certificate_sha256);
  const witnessBlock = /def witnesses : Array ControlWord := #\[([\s\S]*?)\]/.exec(certificate);
  assert.ok(witnessBlock);
  const encoded = witnessBlock[1].split(',').map(s => s.trim());
  const expected = rows.map(r => '.' + r.witness.label.join(' '));
  assert.deepEqual(encoded, expected);
  const t = read('tapes.json'), w = rows[0].witness;
  assert.deepEqual(t.choice, family[0]); assert.deepEqual(t.label, w.label);
  assert.deepEqual(t.input.word, w.word); assert.deepEqual(t.input.banks, Array(9).fill(0));
  const expectedBits = w.word.concat(Array(t.input.pad - w.word.length).fill(0), [1,0],
                                  ...Array.from({length: 9}, () => [1,0]));
  const support = [-1, ...expectedBits.flatMap((bit, p) => bit ? [p] : [])];
  assert.deepEqual(t.input.ones, support);
  assert.equal(t.requested_steps, w.walked.length);
  assert.deepEqual(t.old, replay(t.input, t.requested_steps, null));
  assert.deepEqual(t.aliased, replay(t.input, t.requested_steps, t.choice));
}
const result = {status: 'fixed-family-replayed', aliases: family.length, rejected,
  exported_candidates: 0, baseline_sha256: sha(bytes),
  negative_controls: {wrong_cell_rejected: true, wrong_alias_count_rejected: true},
  full_tapes_replayed: rejected === 30, transition_evaluations: evaluations,
  combined_evaluations: evaluations + readScreenSteps, certified_rh_savings: 0};
fs.writeFileSync(dir + 'independent-replay.json', JSON.stringify(result, null, 2) + '\n');
console.log('FIXED_FAMILY_INDEPENDENTLY_REPLAYED');
