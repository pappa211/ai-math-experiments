"""Scoped selected-source/Git stability checker; writes only inside TUZA26."""
from pathlib import Path
import argparse,datetime,hashlib,json,subprocess
W=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--add',nargs='*',default=[]);p.add_argument('--agent-manifests',action='store_true');p.add_argument('--check',action='store_true');args=p.parse_args()
ledger=W/'SOURCE_INTEGRITY.json';data=json.loads(ledger.read_text());known={r['path']:r for r in data['files']}
new=[(Path(x),None) for x in args.add]
if args.agent_manifests:
 for file,key in [(W/'reviews/opening_sources.json','sources'),(W/'evidence/apex_source_paths.json','files')]:
  if file.exists():
   for row in json.loads(file.read_text())[key]:
    q=Path(row['path'])
    if not q.is_relative_to(W):new.append((q,row.get('sha256')))
for q,prior_hash in new:
 q=q.resolve();digest=hashlib.sha256(q.read_bytes()).hexdigest()
 if prior_hash is not None and digest!=prior_hash:raise RuntimeError(f'Author-recorded source hash changed: {q}')
 if str(q) not in known:
  st=q.stat();known[str(q)]={'path':str(q),'sha256':prior_hash or digest,'size':st.st_size,'mtime_ns':st.st_mtime_ns,'capture_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'provenance':'Agent read-time hash checked against current bytes' if prior_hash else 'Coordinator selected-source capture'}
data['files']=sorted(known.values(),key=lambda x:x['path'])
if args.check:
 checks=[]
 for row in data['files']:
  q=Path(row['path']);st=q.stat();digest=hashlib.sha256(q.read_bytes()).hexdigest()
  checks.append({'path':str(q),'content_unchanged':digest==row['sha256'],'size_unchanged':st.st_size==row['size'],'mtime_unchanged':st.st_mtime_ns==row['mtime_ns']})
 repos=[]
 for row in data['repositories']:
  def git(*a):return subprocess.check_output(['git','--no-optional-locks','-C',row['path'],*a],text=True).strip()
  actual={'head':git('rev-parse','HEAD'),'tree':git('rev-parse','HEAD^{tree}'),'branch':git('symbolic-ref','--short','HEAD'),'status_porcelain':git('status','--porcelain=v1','--untracked-files=all')}
  repos.append({'path':row['path'],'unchanged':all(actual[k]==row[k] for k in actual),'actual':actual})
 receipt={'checked_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'file_checks':checks,'repository_checks':repos,'pass':all(all(x[k] for k in ['content_unchanged','size_unchanged','mtime_unchanged']) for x in checks) and all(x['unchanged'] for x in repos)}
 data['latest_recheck']=receipt
ledger.write_text(json.dumps(data,indent=2)+'\n')
print(json.dumps({'selected_files':len(data['files']),'repository_count':len(data['repositories']),'recheck_pass':data.get('latest_recheck',{}).get('pass')}))
