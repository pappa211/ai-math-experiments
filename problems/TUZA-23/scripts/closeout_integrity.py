from pathlib import Path
import json,hashlib,subprocess,datetime,os,psutil
w=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
s=json.loads((w/'SOURCE_INTEGRITY.json').read_text());checks=[]
for e in s['selected']:
 source=Path(e['source']);copy=w/e['copy'];a=sha(source);b=sha(copy)
 checks.append({'source':str(source),'copy':e['copy'],'before_sha256':e['sha256'],'source_after_sha256':a,'copy_after_sha256':b,'unchanged':a==b==e['sha256']})
assert all(c['unchanged'] for c in checks)
states={}
for key,root in [('tuza22',Path('problems/TUZA-22')),('public',Path('repository-root'))]:
 state={n:subprocess.check_output(['git','-C',str(root),*cmd],text=True).strip() for n,cmd in [('commit',['rev-parse','HEAD']),('tree',['rev-parse','HEAD^{tree}']),('status',['status','--porcelain'])]};assert state==s['identities'][key];states[key]=state
assert sha(Path(s['identities']['archive']['path']))==s['identities']['archive']['sha256']
f=json.loads((w/'operations/accepted_source_freeze.json').read_text());assert all(sha(w/p)==h for p,h in f['files'].items())
summary=json.loads((w/'verification/independent-20261116T092129409939Z/summary.json').read_text());assert summary['status']=='PASS'
neg=json.loads((w/'verification/independent-20261116T092129409939Z/negative_guard.json').read_text())
remotes=subprocess.check_output(['git','-C',str(w),'remote'],text=True).split();assert not remotes
anc={p.pid for p in psutil.Process().parents()}|{os.getpid()};jobs=[]
for p in psutil.process_iter(['pid','name','cmdline']):
 try:
  if p.pid in anc:continue
  if p.cwd().startswith(str(w)) and p.info['name'].lower() in ['lean','lake','python','python3','python3.12']:
   jobs.append(p.info)
 except(psutil.Error,PermissionError):pass
assert not jobs,jobs
now=datetime.datetime.now(datetime.timezone.utc).isoformat()
s['closing']={'checked_utc':now,'selected_checks':checks,'all_passed':True,'source_repositories':states,'archive_bytes_unchanged':True,'scope':'Selected source integrity detection only; not OS immutability or a full-archive audit'};(w/'SOURCE_INTEGRITY.json').write_text(json.dumps(s,indent=2)+'\n')
f['status']='ACCEPTED_WITH_INDEPENDENT_CLEAN_BUILD_AND_AXIOM_AUDIT';f['verified_unchanged_utc']=now;(w/'operations/accepted_source_freeze.json').write_text(json.dumps(f,indent=2)+'\n')
clock=json.loads((w/'operations/clock.json').read_text());clock['phase']='CLOSEOUT';clock['completion_reason']='ALL_REQUIRED_DELIVERABLES_AND_INDEPENDENT_VERIFICATION_COMPLETE';clock['verification_complete_utc']=summary['completed_utc'];clock['closeout_integrity_utc']=now;(w/'operations/clock.json').write_text(json.dumps(clock,indent=2)+'\n')
receipt={'checked_utc':now,'selected_source_checks':len(checks),'all_sources_unchanged':True,'accepted_source_hashes_unchanged':True,'zero_remotes':True,'owned_compiler_jobs':jobs,'independent_verification':'PASS','negative_guard':neg,'source_states':states}
(w/'operations/closeout_integrity_precommit.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps({k:v for k,v in receipt.items() if k not in ['negative_guard','source_states']},indent=2))
