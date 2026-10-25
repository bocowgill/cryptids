#!/usr/bin/env python3
"""Provenance-only check of the bounded incomplete result; no Lean or census."""
import hashlib,json,re,subprocess
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
DOC=ROOT/'docs/chess/parsimony-printer-2026-10-25/complete-printer'

def read(p): return json.loads(p.read_text())
def sha(p):
 h=hashlib.sha256()
 with p.open('rb') as stream:
  for block in iter(lambda:stream.read(1<<20),b''): h.update(block)
 return h.hexdigest()

runs=[]
for i in range(1,4):
 folder=DOC/'evidence'/('complete-'+str(i).zfill(2)); work=folder/'unpacked'
 retained,run=read(folder/'retention.json'),read(folder/'run-api.json')
 assert run['status']=='completed' and run['conclusion']=='failure'
 assert retained['producer_source_verified'] and retained['workflow_commit']==run['head_sha']
 assert sha(folder/'logs.zip')==retained['logs_sha256']
 if (folder/'artifact.zip').is_file():
  assert sha(folder/'artifact.zip')==retained['artifact_sha256']
 assert read(folder/'artifact-api.json')['digest']=='sha256:'+retained['artifact_sha256']
 for name,entry in read(folder/'archive-entries.json').items():
  assert sha(work/name)==entry['sha256'],name
  assert (work/name).stat().st_size==entry['bytes'],name
 manifest=read(work/'source-manifest.json')
 assert manifest['commit']==run['head_sha']
 for name,expected in manifest['source_sha256'].items():
  data=subprocess.check_output(['git','show',run['head_sha']+':'+name],cwd=ROOT)
  assert hashlib.sha256(data).hexdigest()==expected,name
 for name,expected in manifest['frozen_source_sha256'].items():
  assert sha(ROOT/name)==expected,name
 if i>1:
  plan=read(work/'instance-plan.json')
  table=ROOT/'docs/chess/parsimony-printer-2026-10-24/evidence/validation-04/unpacked/full-candidate-rows.bin'
  packet=ROOT/'docs/chess/campaign-2026-10-22/round-04/evidence/packet-02/unpacked/packet.bits'
  assert sha(table)==plan['candidate_sha256']
  assert sha(packet)==plan['packet_sha256']
 summary=read(work/'pilot-summary.json')
 assert summary['status']=='failed' and summary['gates']=={}
 assert not summary['new_accepted_machine'] and summary['certified_saving']==0
 assert not summary['complete_printer_certified']
 for command in summary['commands']:
  assert command['resource_stop'] is None
  assert sha(work/command['log'])==command['log_sha256']
  assert command['peak_group_plus_driver_rss_bytes']<=6<<30
 assert not (work/'Complete.olean').exists()
 assert not list(work.glob('ScanBatch*.olean'))
 assert not (work/'PrinterModel.olean').exists()
 if i==1:
  assert summary['commands']==[] and 'Lean width exceeded' in summary['failure']
 elif i==2:
  log=(work/'structural-cleanup.log').read_text()
  assert not (work/'Cleanup.olean').exists() and 'sorryAx' in log
  assert 'Application type mismatch' in log and 'unused' in log
 else:
  log=(work/'structural-cleanup.log').read_text()
  assert (work/'Cleanup.olean').is_file()
  assert sha(work/'Cleanup.lean')==sha(ROOT/'scripts/chess_parsimony_complete_20261025/Cleanup.lean')
  assert 'error:' not in log and 'warning:' not in log and 'sorryAx' not in log
  allowed={'propext','Classical.choice','Quot.sound'}
  groups=re.findall(r'depends on axioms:\s*\[([^\]]*)\]',log,re.S)
  assert len(groups)==5
  for group in groups:
   assert set(group.replace('\n','').replace(' ','').split(','))<=allowed
  failed=(work/'complete-model-rows.log').read_text()
  assert '`main` has already been declared' in failed
  assert 'PARSIMONY_COMPLETE_PRINTER_ROWS_EXPORTED' not in failed
  assert not (work/'PrinterModel.rows').exists()
  assert not any(c['name'].startswith('scan-batch') for c in summary['commands'])
  cleanup=dict(producer=run['head_sha'],run=run['id'],source_sha256=sha(work/'Cleanup.lean'),
   object_sha256=sha(work/'Cleanup.olean'),object_bytes=(work/'Cleanup.olean').stat().st_size,
   checked_roots=['extend','startup','workspace','tail','cleanup'])
 reuse=read(work/'reuse.json')
 assert reuse['packet_batches_reused']==53 and reuse['packet_batch_recompilations']==0
 for name,entry in reuse['files'].items(): assert sha(work/name)==entry['sha256'],name
 runs.append(dict(run=run['id'],producer=run['head_sha'],failure=summary['failure'],
  elapsed_seconds=summary['elapsed_seconds'],commands=summary['commands'],
  artifact_sha256=retained['artifact_sha256'],logs_sha256=retained['logs_sha256']))
record=dict(schema='parsimony-complete-printer-partial-v1',attempts=3,attempt_budget_exhausted=True,
 complete_printer_certified=False,full_packet_scan_checked=False,full_printer_rows_matched=False,
 cleanup_generic_module_checked=True,cleanup=cleanup,runs=runs,packet_batches_reused=53,
 packet_batches_recompiled=0,accepted_machine_states=769344,candidate_states=609247,
 new_accepted_full_machine_saving=0,draft_exporter_fix_unverified=True,
 reviewer_sha256=sha(Path(__file__).resolve()))
(DOC/'partial-review.json').write_text(json.dumps(record,indent=2,sort_keys=True)+'\n')
(DOC/'checked-cleanup-pins.json').write_text(json.dumps(cleanup,indent=2,sort_keys=True)+'\n')
print('PARSIMONY_COMPLETE_PRINTER_PARTIAL_VERIFIED')
print('Generic cleanup checked; full printer UNPROVED; three-attempt bound exhausted')
