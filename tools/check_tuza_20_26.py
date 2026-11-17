#!/usr/bin/env python3
"""Serial essential finite-certificate replay in fresh output copies.

Python 3.10+, assertions enabled, psutil for sampled process-tree RSS. No
installer, solver, Lean, network, or historical census is launched. Checkers
are preserved independent verification implementations, rerun here; this
runner does not claim they were newly independently implemented today.
"""
import argparse,datetime,fcntl,hashlib,json,os,pathlib,re,shutil,signal,subprocess,sys,time
import psutil
assert __debug__, 'Assertions must remain enabled'
assert sys.version_info >= (3,10)
p=argparse.ArgumentParser();p.add_argument('--repo',type=pathlib.Path,default=pathlib.Path(__file__).resolve().parents[1]);p.add_argument('--output',type=pathlib.Path,required=True);p.add_argument('--only',default='20,21,22,25,26');p.add_argument('--timeout',type=float,default=240);p.add_argument('--lock',type=pathlib.Path,required=True);a=p.parse_args()
repo=a.repo.resolve();out=a.output.resolve();assert repo not in out.parents and out!=repo
out.mkdir(parents=True,exist_ok=False);work=out/'work';work.mkdir();(out/'logs').mkdir()
a.lock.parent.mkdir(parents=True,exist_ok=True);lock=open(a.lock,'a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
psutil.Process().children(recursive=True) # fail before starting if monitoring is unavailable
checks={
'20': [('checks/verifier_exact.py',['controls']),('checks/verifier_candidate01.py',[]),('checks/verifier_candidate02_counterexample.py',[])],
'21': [('scripts/book_verify.py',[]),('scripts/book_clebsch_private_verify.py',[])],
'22': [('scripts/coordinator_p6_interface_validator.py',[]),('scripts/coordinator_cycle_cover_isolate_validator.py',[]),('scripts/coordinator_cycle_cover_complete_validator.py',[]),('scripts/d_extension_independent_validator.py',[])],
'25': [('scripts/critic_ring_check.py',[]),('reviews/critic_edge_exchange_check.py',[]),('reviews/critic_matching_control.py',[]),('reviews/critic_bridge_check.py',[]),('reviews/critic_role_check.py',[]),('scripts/mixed_verify_named_interface.py',[]),('scripts/role_status_mock.py',[])],
'26': [('scripts/opening_checks.py',[]),('scripts/matching26_adjacent_replay.py',[]),('scripts/opening_triangle_replay.py',[]),('scripts/matching26_book_controls.py',[]),('scripts/opening_cover_operation_controls.py',[])]}
selected=a.only.split(',');assert selected and set(selected)<=set(checks)
copy_ids=set(selected)|({'25'} if '26' in selected else set())
sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
adapt=[];sources=[]
for n in sorted(copy_ids):
 src=repo/'problems'/('TUZA-'+n);dst=work/('TUZA-'+n)
 shutil.copytree(src,dst,ignore=shutil.ignore_patterns('.git','.lake','__pycache__','*.pyc'))
 for f in sorted(src.rglob('*')):
  if f.is_file():sources.append({'path':f.relative_to(repo).as_posix(),'sha256':sha(f)})
 for d in ['receipts','results','data','evidence','reviews']:(dst/d).mkdir(exist_ok=True)
 for f in dst.rglob('*.py'):
  s=f.read_text();t=s
  # Strict old owner-path assertions are execution guards, not mathematics.
  t=re.sub(r"sys\.executable\s*==\s*(['\"])PRIVATE_PATH_REMOVED\1", "sys.version_info >= (3,10)",t)
  t=re.sub(r"sys\.executable\s*!=\s*(['\"])PRIVATE_PATH_REMOVED\1", "sys.version_info < (3,10)",t)
  t=t.replace("Path(sys.executable).parent == Path('PRIVATE_PATH_REMOVED')", "sys.version_info >= (3,10)")
  t=t.replace("SOURCE=Path('problems/TUZA-25')", "SOURCE=Path(__file__).resolve().parents[2]/'TUZA-25'")
  # Keep the archived platform preconditions; actual publication replay is on Darwin.
  if t!=s:
   before=sha(f);f.write_text(t);adapt.append({'path':f.relative_to(work).as_posix(),'before_sha256':before,'after_sha256':sha(f),'reason':'Execution-only interpreter guard or public sibling input path; mathematical constants/domain unchanged'})
# Match only named certificate dependency hash checks to authenticated public bytes.
# The certificate retains its original source identity; current bytes must match
# the explicit source-to-public manifest before that identity is returned.
manifest=json.loads((repo/'problems/TUZA-20-26-SOURCE_MANIFEST.json').read_text())
if '22' in copy_ids:
 dst=work/'TUZA-22';bindings={}
 for script,args in checks['22']:
  f=dst/script;s=f.read_text()
  dependencies=re.findall(r"==sha\('([^']+)'\)",s)
  if not dependencies:continue
  for dep in dependencies:
   row=next(r for r in manifest['files'] if r['mission']=='TUZA-22' and r['source_file']==dep and r.get('public_file')=='problems/TUZA-22/'+dep)
   assert sha(dst/dep)==row['public_sha256'], 'Public source manifest is stale: '+dep
   bindings[dep]={'source_sha256':row['source_sha256'],'public_sha256':row['public_sha256']}
  helper="\ndef source_identity(p):\n row=json.loads((W/'PUBLIC_SOURCE_BINDINGS.json').read_text())[p]\n assert sha(p)==row['public_sha256'], 'Public dependency bytes changed: '+p\n return row['source_sha256']\n"
  t=re.sub(r"==sha\('([^']+)'\)",r"==source_identity('\1')",s)
  position=t.index('\n',t.index('def sha(p):'))
  t=t[:position]+helper+t[position:]
  before=sha(f);f.write_text(t);adapt.append({'path':f.relative_to(work).as_posix(),'before_sha256':before,'after_sha256':sha(f),'reason':'Only original certificate dependency identities are translated through checked source-to-public pairs; all combinatorial checks and actual output hashes retained','dependency_bindings':{k:bindings[k] for k in dependencies}})
 (dst/'PUBLIC_SOURCE_BINDINGS.json').write_text(json.dumps(bindings,indent=2)+'\n')
if '26' in copy_ids:
 f=work/'TUZA-26/scripts/matching26_adjacent_replay.py';s=f.read_text();t=s;bindings=[]
 known={'domain':'evidence/apex_adjacent_interface_domain.json','exact':'evidence/apex_adjacent_interface_exact.json','internal':'evidence/apex_adjacent_internal_controls.json'}
 for key,dep in known.items():
  row=next(r for r in manifest['files'] if r['mission']=='TUZA-26' and r['source_file']==dep and r.get('public_file')=='problems/TUZA-26/'+dep)
  assert sha(work/'TUZA-26'/dep)==row['public_sha256'], 'Public source manifest is stale: '+dep
  old="assert hashes['"+key+"']=='"+row['source_sha256']+"'"
  assert old in t, 'Unrecognized frozen hash assertion: '+key
  t=t.replace(old,"assert hashes['"+key+"']=='"+row['public_sha256']+"'")
  bindings.append({'path':dep,'original_expected_sha256':row['source_sha256'],'public_expected_sha256':row['public_sha256']})
 before=sha(f);f.write_text(t);adapt.append({'path':f.relative_to(work).as_posix(),'before_sha256':before,'after_sha256':sha(f),'reason':'Three explicit frozen certificate byte pins rebound to source-manifest-authenticated sanitized public copies; all literal witness/domain checks unchanged','dependency_bindings':bindings})
(out/'SOURCE_MANIFEST.json').write_text(json.dumps(sources,indent=2)+'\n');(out/'ADAPTATIONS.json').write_text(json.dumps(adapt,indent=2)+'\n')
env=os.environ.copy();env.update(PYTHONDONTWRITEBYTECODE='1',OPENBLAS_NUM_THREADS='1',OMP_NUM_THREADS='1')
records=[];start=datetime.datetime.now(datetime.timezone.utc)
for n in selected:
 dst=work/('TUZA-'+n)
 for script,args in checks[n]:
  if n=='22':
   dst=out/'separate-22'/pathlib.Path(script).stem
   shutil.copytree(work/'TUZA-22',dst)
  f=dst/script;assert f.is_file(),f
  key='TUZA-'+n+'-'+pathlib.Path(script).stem;log=out/'logs'/(key+'.log')
  before={x.relative_to(dst).as_posix():x.stat().st_mtime_ns for x in dst.rglob('*.json')}
  cmd=[sys.executable,script,*args];t=time.monotonic();peak=0;reason=None
  with log.open('w') as stream:
   proc=subprocess.Popen(cmd,cwd=dst,env=env,stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
   while proc.poll() is None:
    try:
     parent=psutil.Process(proc.pid);rss=sum(c.memory_info().rss for c in [parent,*parent.children(recursive=True)] if c.is_running());peak=max(peak,rss)
    except psutil.NoSuchProcess:pass
    except (psutil.AccessDenied,OSError) as exc:reason='MONITOR_FAILURE: '+str(exc)
    if time.monotonic()-t>a.timeout:reason='TIMEOUT'
    if peak>2200*1024*1024:reason='TREE_RSS_LIMIT'
    if reason:
     if proc.poll() is None:
      try:os.killpg(proc.pid,signal.SIGTERM)
      except ProcessLookupError:pass
      except PermissionError:proc.terminate()
     try:proc.wait(timeout=3)
     except subprocess.TimeoutExpired:proc.kill()
     break
    time.sleep(.05)
   code=proc.wait()
  fresh=[]
  for x in dst.rglob('*.json'):
   k=x.relative_to(dst).as_posix()
   if x.stat().st_mtime_ns!=before.get(k):
    data=json.loads(x.read_text());saved=out/'fresh-results'/key/k;saved.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(x,saved);fresh.append({'path':k,'sha256':sha(x),'status':data.get('status',data.get('validation')) if isinstance(data,dict) else None})
  rec={'mission':'TUZA-'+n,'script':script,'script_sha256':sha(f),'argv':[pathlib.Path(sys.executable).name,script,*args],'exit_code':code,'limit_reason':reason,'elapsed_seconds':time.monotonic()-t,'peak_tree_rss_bytes':peak,'log':log.relative_to(out).as_posix(),'fresh_json':fresh}
  records.append(rec);(out/'COMMANDS.json').write_text(json.dumps(records,indent=2)+'\n');print(json.dumps(rec),flush=True)
  if code or reason or not fresh:
   print(log.read_text()[-6000:]);raise SystemExit('FAILED: '+key)
changed=[s['path'] for s in sources if sha(repo/s['path'])!=s['sha256']]
assert not changed,changed
summary={'status':'PASS','started_utc':start.isoformat(),'completed_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'missions':selected,'commands':len(records),'runner_sha256':sha(pathlib.Path(__file__)),'sources_unchanged':True,'source_manifest':'SOURCE_MANIFEST.json','adaptations':'ADAPTATIONS.json','commands_receipt':'COMMANDS.json','max_process_tree_rss_bytes':max(r['peak_tree_rss_bytes'] for r in records),'scope':'Fresh execution of selected independent finite validators, bounded exact domains and explicitly supplied certificates; not all historical searches, no new all-size theorem, no Lean build, no external human review.'}
(out/'VERIFICATION.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary),flush=True)
