"""Read-only selected-source comparison against the authenticated mission baseline."""
from pathlib import Path
import hashlib,json,subprocess,os,datetime
R=Path(__file__).resolve().parents[1];before=json.loads((R/'evidence/source_before.json').read_text())
env=dict(os.environ,GIT_OPTIONAL_LOCKS='0');rows=[];ok=True
sha=lambda b:hashlib.sha256(b).hexdigest()
def git(root,*args):return subprocess.check_output(['git','-C',str(root),*args],env=env).decode().strip()
for old in before:
 if 'root' in old:
  root=Path(old['root']);row={k:v for k,v in old.items() if k!='files'}
  row.update(actual_head_after=git(root,'rev-parse','HEAD'),pinned_tree_after=git(root,'rev-parse',old['pinned_commit']+'^{tree}'),status_after=git(root,'status','--porcelain=v1'),files=[])
  row['identity_unchanged']=row['actual_head_after']==old['actual_head'] and row['pinned_tree_after']==old['pinned_tree'] and row['status_after']==old['status_before']
  for f in old['files']:
   item=dict(f);item['worktree_after_sha256']=sha((root/f['path']).read_bytes());item['object_after_sha256']=sha(subprocess.check_output(['git','-C',str(root),'show',old['pinned_commit']+':'+f['path']],env=env))
   item['unchanged']=item['worktree_after_sha256']==f['worktree_before_sha256'] and item['object_after_sha256']==f['object_sha256'];row['files'].append(item)
  row['all_selected_files_unchanged']=all(f['unchanged'] for f in row['files']);ok &= row['identity_unchanged'] and row['all_selected_files_unchanged'];rows.append(row)
 else:
  row=dict(old);row['after_sha256']=sha(Path(old['operating_path']).read_bytes());row['unchanged']=row['after_sha256']==old['before_sha256'];ok &= row['unchanged'];rows.append(row)
out={'status':'PASS' if ok else 'FAIL','checked_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Selected source content plus pinned/actual Git identities and status; not a full archive audit','protection':'Desktop filesystem sandbox plus read-only operating convention and frozen git-show reads with GIT_OPTIONAL_LOCKS=0. Narrow escalated writes targeted only the new authorized workspace. No source permissions/flags changed. Hashes detect changes, do not enforce immutability.','sources':rows,'selected_versioned_file_count':sum(len(x.get('files',[])) for x in rows),'operating_file_count':sum('operating_path' in x for x in rows)}
(R/'SOURCE_INTEGRITY.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='sources'}));assert ok
