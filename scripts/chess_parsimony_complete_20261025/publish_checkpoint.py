#!/usr/bin/env python3
"""Publish exact checkpoint Git objects over REST when the Git transport stalls.

Transport/provenance only. Fixed fork and branch; no force update, proof or census.
Every original unpublished commit is preserved by a local recovery branch.
"""
import argparse
import base64,datetime,json,os,subprocess,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
REPO='repos/bocowgill/cryptids/'
BRANCH='codex/chess-openevolve-pilot'
parser=argparse.ArgumentParser()
parser.add_argument('--base',required=True)
args=parser.parse_args()
BASE=args.base
assert len(BASE)==40 and all(c in '0123456789abcdef' for c in BASE)

def git(*args,input=None,env=None):
 return subprocess.check_output(['git',*args],cwd=ROOT,input=input,env=env)
def api(path,method='GET',body=None):
 cmd=['gh','api',REPO+path,'--method',method]
 if body is None:
  return json.loads(subprocess.check_output(cmd,cwd=ROOT))
 with tempfile.NamedTemporaryFile(mode='w',suffix='.json',delete=False,dir='/private/tmp') as f:
  json.dump(body,f); name=f.name
 try:
  return json.loads(subprocess.check_output(cmd+['--input',name],cwd=ROOT))
 finally: Path(name).unlink()
head=git('rev-parse','HEAD').decode().strip()
assert api('git/ref/heads/'+BRANCH)['object']['sha']==BASE
assert not git('status','--porcelain')
base_tree=git('rev-parse',BASE+'^{tree}').decode().strip()
target_tree=git('rev-parse','HEAD^{tree}').decode().strip()
entries=[]
old_objects=set(git('rev-list','--objects','--no-object-names',BASE).decode().splitlines())
for line in git('diff','--raw','--no-abbrev',BASE,head).decode().splitlines():
 meta,path=line.split('\t',1)
 oldmode,mode,oldsha,sha,status=meta[1:].split()
 assert status in ['A','M'] and mode=='100644',(status,path)
 entry=dict(path=path,mode=mode,type='blob')
 if sha in old_objects:
  entry['sha']=sha; entries.append(entry); continue
 data=git('cat-file','blob',sha)
 try: content=data.decode('utf8')
 except UnicodeDecodeError:
  # Reuse every old binary object; publish only new binary objects over REST.
  present=subprocess.run(['git','merge-base','--is-ancestor',BASE,head],cwd=ROOT).returncode==0
  assert present
  if sha not in old_objects:
   got=api('git/blobs','POST',dict(content=base64.b64encode(data).decode(),encoding='base64'))
   assert got['sha']==sha
  entry['sha']=sha
 else: entry['content']=content
 entries.append(entry)
print('Publishing tree entries:',len(entries),flush=True)
result=api('git/trees','POST',dict(base_tree=base_tree,tree=entries))
assert result['sha']==target_tree,(result['sha'],target_tree)
name=git('config','user.name').decode().strip()
email=git('config','user.email').decode().strip()
now=datetime.datetime.now(datetime.timezone.utc).replace(microsecond=0).isoformat()
message='Publish exact complete-printer checkpoint through Git API [skip ci]\n'
env=dict(os.environ,GIT_AUTHOR_NAME=name,GIT_AUTHOR_EMAIL=email,GIT_COMMITTER_NAME=name,
 GIT_COMMITTER_EMAIL=email,GIT_AUTHOR_DATE=now,GIT_COMMITTER_DATE=now)
local=git('commit-tree',target_tree,'-p',BASE,input=message.encode(),env=env).decode().strip()
author=dict(name=name,email=email,date=now)
commit=api('git/commits','POST',dict(message=message,tree=target_tree,parents=[BASE],
 author=author,committer=author))
record=dict(local_source_commit=head,base=BASE,tree=target_tree,local_canonical_commit=local,
 remote_commit=commit['sha'],files=len(entries),time=now)
Path('/private/tmp/chess-printer-git-api-push.json').write_text(json.dumps(record,indent=2)+'\n')
assert commit['sha']==local,record
# Preserve own unpublished commits before moving the branch to the identical tree.
backup='codex/chess-complete-rest-recovery-'+head[:8]
existing=subprocess.run(['git','rev-parse','--verify','refs/heads/'+backup],cwd=ROOT,
 stdout=subprocess.PIPE,stderr=subprocess.DEVNULL)
if existing.returncode==0:
 assert existing.stdout.decode().strip()==head
else: git('branch',backup,head)
assert api('git/ref/heads/'+BRANCH)['object']['sha']==BASE
api('git/refs/heads/'+BRANCH,'PATCH',dict(sha=local,force=False))
assert api('git/ref/heads/'+BRANCH)['object']['sha']==local
git('update-ref','refs/heads/'+BRANCH,local,head)
assert not git('status','--porcelain')
print(json.dumps(record,indent=2))
