#!/usr/bin/env python3
"""Bounded exact-hash Git object publication to the authorized fork; no ref update."""
import argparse
import base64, datetime, hashlib, json, os, re, subprocess, tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
REPO='bocowgill/cryptids'
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--base',required=True)
parser.add_argument('--target',required=True)
parser.add_argument('--record',type=Path,required=True)
args=parser.parse_args()
BASE,TARGET,RECORD=args.base,args.target,args.record
assert all(re.fullmatch(r'[0-9a-f]{40}',x) for x in (BASE,TARGET))
assert RECORD.is_absolute() and not RECORD.exists()
assert not RECORD.resolve().is_relative_to(ROOT)

def git(*args):
    return subprocess.check_output(['git',*args],cwd=ROOT,timeout=20)

def api(method,path,payload=None,query=None):
    args=['gh','api','--method',method,'repos/'+REPO+'/'+path]
    with tempfile.TemporaryDirectory(prefix='chess-git-api-',dir='/private/tmp') as d:
        if payload is not None:
            p=Path(d)/'request.json';p.write_text(json.dumps(payload));args+=['--input',str(p)]
        if query:args+=['--jq',query]
        r=subprocess.run(args,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=90)
        if r.returncode:raise RuntimeError(r.stderr.decode(errors='replace')[:1500])
        return r.stdout.decode().strip()

def identity(text):
    m=re.fullmatch(r'(.*) <([^>]+)> (\d+) ([+-])(\d{2})(\d{2})',text)
    assert m
    name,email,stamp,sign,hh,mm=m.groups()
    offset=datetime.timedelta(hours=int(hh),minutes=int(mm))*(1 if sign=='+' else -1)
    date=datetime.datetime.fromtimestamp(int(stamp),datetime.timezone(offset)).isoformat()
    return dict(name=name,email=email,date=date)

raw=git('cat-file','-p',TARGET).decode();head,message=raw.split('\n\n',1)
headers=dict(line.split(' ',1) for line in head.splitlines())
assert headers['parent']==BASE and git('rev-parse','HEAD').decode().strip()==TARGET
assert not git('status','--porcelain')
base_tree=git('rev-parse',BASE+'^{tree}').decode().strip()
fields=git('diff','--raw','--no-abbrev','--no-renames','-z',BASE,TARGET).split(b'\0')
assert fields[-1]==b'';fields=fields[:-1];assert len(fields)%2==0 and len(fields)<=8192
pin_bytes=(ROOT/'docs/chess/campaign-2026-10-22/accepted-769344-pins.json').read_bytes()
assert hashlib.sha256(pin_bytes).hexdigest()=='43942091ac61ca4d93001fb259eb8e0694bbc499e5279658ac10d3836f166102'
pins=json.loads(pin_bytes)
# Tree metadata only: reuse blobs already reachable from the published base.
known=set(git('ls-tree','-r','--format=%(objectname)',BASE).decode().splitlines())
entries=[];blobs=[];total=0;reused=0
for h,p in zip(fields[::2],fields[1::2]):
    oldmode,newmode,oldsha,newsha,status=h.decode()[1:].split();path=p.decode()
    assert path not in pins and status in ('A','M','D') and newmode in ('100644','100755','000000')
    assert '/evidence/' not in path or status=='A'
    if status=='D':entries.append(dict(path=path,mode=oldmode,type='blob',sha=None));continue
    if newsha in known:
        entries.append(dict(path=path,mode=newmode,type='blob',sha=newsha));reused+=1;continue
    content=git('cat-file','blob',newsha);total+=len(content)
    assert len(content)<=8<<20 and total<=32<<20
    digest=hashlib.sha1(b'blob '+str(len(content)).encode()+b'\0'+content).hexdigest()
    assert digest==newsha
    item=dict(path=path,mode=newmode,type='blob')
    try:
        text=content.decode('utf-8')
        if b'\0' in content:raise UnicodeError()
        item['content']=text
    except UnicodeError:
        blobs.append((item,newsha,content))
    entries.append(item)
record=dict(base=BASE,target=TARGET,expected_tree=headers['tree'],changed_files=len(entries),
            object_bytes=total,reused_blobs=reused,binary_blobs=len(blobs),
            phase='prepared',ref_updated=False)
RECORD.write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record),flush=True)
for item,expected,content in blobs:
    sha=api('POST','git/blobs',dict(content=base64.b64encode(content).decode(),encoding='base64'),'.sha')
    assert sha==expected
    item['sha']=sha
    record['phase']='binary_blob_uploaded';RECORD.write_text(json.dumps(record,indent=2)+'\n')
tree=api('POST','git/trees',dict(base_tree=base_tree,tree=entries),'.sha')
assert tree==headers['tree'],(tree,headers['tree'])
record.update(phase='tree_verified',tree=tree);RECORD.write_text(json.dumps(record,indent=2)+'\n')
commit=api('POST','git/commits',dict(tree=tree,parents=[BASE],message=message,
           author=identity(headers['author']),committer=identity(headers['committer'])),'.sha')
record.update(phase='commit_created',api_commit=commit,commit_matches=commit==TARGET)
RECORD.write_text(json.dumps(record,indent=2)+'\n')
assert commit==TARGET,record
print(json.dumps(record),flush=True)
