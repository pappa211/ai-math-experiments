"""Scoped source comparison only; never writes any source tree."""
from pathlib import Path
import json,hashlib,datetime,os
from source_snapshot import repo_state
W=Path(__file__).resolve().parents[1]
records=[];repo_before={};manifests=[];snapshots=[]
for p in sorted((W/'sources').rglob('manifest.json')):
 d=json.loads(p.read_text())
 if isinstance(d,list):
  for r in d:
   if 'file' in r and 'sha256' in r:snapshots.append({'snapshot':r['file'],'sha256':r['sha256'],'url':r.get('url'),'manifest':str(p.relative_to(W))})
  manifests.append(str(p.relative_to(W)))
  continue
 if not isinstance(d,dict) or 'files' not in d:continue
 manifests.append(str(p.relative_to(W)))
 for r in d['files']:
  if 'source' in r and 'sha256' in r:records.append({**r,'manifest':str(p.relative_to(W))})
  if r.get('snapshot'):snapshots.append({'snapshot':r['snapshot'],'sha256':r['sha256'],'manifest':str(p.relative_to(W))})
 for r in d.get('repos',[]):repo_before.setdefault(r['root'],[]).append(r)
public=json.loads((W/'operations/public_state_before.json').read_text())
repo_before.setdefault(public['root'],[]).append(public)
checks=[]
for r in records:
 p=Path(r['source'])
 try:
  b=p.read_bytes();h=hashlib.sha256(b).hexdigest()
  checks.append({**r,'after_sha256':h,'after_bytes':len(b),'hash_unchanged':h==r['sha256'],'mtime_unchanged':p.stat().st_mtime_ns==r.get('mtime_ns',p.stat().st_mtime_ns)})
 except Exception as e:checks.append({**r,'hash_unchanged':False,'error':repr(e)})
snapshot_checks=[]
for r in snapshots:
 try:
  h=hashlib.sha256((W/r['snapshot']).read_bytes()).hexdigest()
  snapshot_checks.append({**r,'after_sha256':h,'hash_unchanged':h==r['sha256']})
 except Exception as e:snapshot_checks.append({**r,'hash_unchanged':False,'error':repr(e)})
repos=[]
for name,befores in repo_before.items():
 after=repo_state(Path(name));equal=all(x==after for x in befores)
 repos.append({'root':name,'before':befores[0],'after':after,'all_recorded_before_states_equal':all(x==befores[0] for x in befores),'unchanged':equal})
unique={r['source'] for r in records}
out={'scope':'Only selected relied-upon files and recorded source Git HEAD/tree/branch/worktree states. This is not an audit of the entire archive or OS-enforced immutability. Operational migration instructions are hash-only to avoid copying historical access details.','at_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'manifest_paths':manifests,'selected_records':len(records),'unique_source_files':len(unique),'file_hash_mismatches':sum(not x['hash_unchanged'] for x in checks),'mtime_changes':sum(not x.get('mtime_unchanged',False) for x in checks),'git_state_mismatches':sum(not x['unchanged'] for x in repos),'files':checks,'snapshot_checks':snapshot_checks,'snapshot_hash_mismatches':sum(not x['hash_unchanged'] for x in snapshot_checks),'repositories':repos,'overall':'PASS' if all(x['hash_unchanged'] for x in checks) and all(x['unchanged'] for x in repos) and all(x['hash_unchanged'] for x in snapshot_checks) else 'FAIL'}
(W/'SOURCE_INTEGRITY.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['at_utc','selected_records','unique_source_files','file_hash_mismatches','mtime_changes','git_state_mismatches','snapshot_hash_mismatches','overall']}))
