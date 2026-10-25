// Recheck only retained witnesses; do not enumerate typed cases or search aliases.
import fs from 'node:fs';
import assert from 'node:assert/strict';
import crypto from 'node:crypto';
assert.equal(process.env.RHSHARE_REMOTE, '1');
assert.equal(process.env.GITHUB_ACTIONS, 'true');
const dir = process.env.RHSHARE_OUTPUT_DIR + '/';
const read = name => JSON.parse(fs.readFileSync(dir + name, 'utf8'));
const sha = data => crypto.createHash('sha256').update(data).digest('hex');
const bytes = fs.readFileSync('artifacts/riemann_95/machine.txt');
assert.equal(sha(bytes), '7e9731ed1b7c63d4e67c0f8d646f8498d9645f26e237a8604d4b7f91a6ab398d');
const old = bytes.toString().trimEnd().split('\n').map(line => line.split(' ').map(s => {
  if (s === '---') return null;
  const m = /^([01])([LR])(0|[1-9][0-9]*)$/.exec(s);
  assert.ok(m);
  return [Number(m[1]), m[2] === 'R' ? 1 : -1, Number(m[3])];
}));
function checkTable(t) {
  assert.equal(t.length, 95);
  for (const row of t) { assert.equal(row.length, 2);
    for (const c of row) assert.ok(c === null || c[2] >= 0 && c[2] < 95); }
  [26,46,50,86,87,94].forEach((q, i) =>
    assert.deepEqual(t[q], [[0,1,58], [1,1,[33,60,64,89,94,43][i]]]));
}
checkTable(old);
const badTable = structuredClone(old); badTable[26][0][2] = 57;
assert.throws(() => checkTable(badTable));
const pairs = [[26,46],[26,50],[26,86],[26,87],[26,94],[46,50],[46,86],[46,87],
               [46,94],[50,86],[50,87],[50,94],[86,87],[86,94],[87,94]];
function checkFamily(f) {
  assert.equal(f.length, 30);
  f.forEach((c, i) => {
    const p = pairs[Math.floor(i / 2)];
    assert.equal(c.index, i); assert.deepEqual(c.pair, p);
    assert.equal(c.keep, p[i % 2]); assert.equal(c.remove, p[1 - i % 2]);
  });
}
const family = read('family.json'); checkFamily(family);
assert.throws(() => checkFamily(family.slice(0, -1)));
function array(name) {
  const text = fs.readFileSync('Cryptids/ReductionSupport/Riemann95/ControllerSchema95.lean','utf8');
  const start = text.indexOf('#[', text.indexOf('def ' + name)) + 1;
  assert.ok(start > 0);
  let depth = 0;
  for (let i = start; i < text.length; i++) {
    if (text[i] === '[') depth++;
    if (text[i] === ']') depth--;
    if (!depth) { const s = text.slice(start, i + 1);
      assert.match(s, /^[\[\]01,\s]*$/); return JSON.parse(s); }
  }
  throw new Error('Missing source array');
}
const outside = array('outsideWords'), outsideWalk = array('outsideWalked');
const suffix = array('suffixes'), localWalk = array('localWalkSuffixes');
let evaluations = 0;
function walk(bits, choice) {
  let q = 15;
  for (const bit of bits) {
    assert.ok(++evaluations <= 2000000);
    if (choice && q === choice.remove) q = choice.keep;
    const cell = old[q][bit];
    if (cell === null || cell[0] !== bit || cell[1] !== 1) return null;
    q = cell[2]; if (choice && q === choice.remove) q = choice.keep;
  }
  return q;
}
const dense = (q, c) => { q = q === c.remove ? c.keep : q; return q - Number(c.remove < q); };
const rows = fs.readFileSync(dir + 'aliases.jsonl', 'utf8').trimEnd().split('\n').map(JSON.parse);
assert.equal(rows.length, 30); assert.deepEqual(rows, read('screen.json').records);
rows.forEach((r, i) => {
  assert.deepEqual(r.choice, family[i]); assert.equal(r.status, 'endpoint-contract-refuted');
  const label = r.witness.label;
  let word, walked;
  if (label[0] === 'outside') { word = outside[label[1]]; walked = outsideWalk[label[1]]; }
  else {
    const p = [1,1,1,1,1,0].concat(...Array.from({length: label[1]}, () => [1,1,1,1,0]));
    if (label[0] === 'entry') { word = p.slice(0,-1); walked = p.concat(0); }
    else { assert.equal(label[0], 'local'); word = p.concat(suffix[label[2]]);
      walked = p.concat(localWalk[label[2]]); }
  }
  assert.deepEqual(r.witness.word, word); assert.deepEqual(r.witness.walked, walked);
  const before = walk(walked, null), after = walk(walked, r.choice);
  assert.notEqual(before, null); assert.equal(before, r.old_endpoint);
  assert.equal(after, r.alias_endpoint); assert.equal(dense(before, r.choice), r.expected_dense);
  assert.equal(after === null ? null : dense(after, r.choice), r.observed_dense);
  assert.notEqual(r.expected_dense, r.observed_dense);
});
const cert = fs.readFileSync(dir + 'ShareCertificate.lean', 'utf8');
assert.equal(sha(Buffer.from(cert)), '68d218019755897c2fcc67f3ab3594fd4c279ac35240668766e9f1c1791d466e');
const block = /def witnesses : Array ControlWord := #\[([\s\S]*?)\]/.exec(cert);
assert.ok(block);
assert.deepEqual(block[1].split(',').map(s => s.trim()), rows.map(r => '.' + r.witness.label.join(' ')));
const result = {status: 'retained-endpoints-replayed', witnesses: rows.length,
  witness_source_sha256: sha(Buffer.from(cert)), transition_evaluations: evaluations,
  new_alias_searches: 0, exported_candidates: 0,
  negative_controls: {wrong_cell_rejected: true, wrong_alias_count_rejected: true}};
fs.writeFileSync(dir + 'independent-replay.json', JSON.stringify(result, null, 2) + '\n');
console.log('EXACT_30_RETAINED_ENDPOINTS_INDEPENDENTLY_REPLAYED');
