#!/usr/bin/env python3
"""Independent source-copy serial build and environment-based declaration audit.
Publication adapter of the TUZA-24 independent reviewer, 17 November 2026.
Accepts explicit source/output/compiler/package/deadline arguments; source bytes stay unchanged.
Run only with the coordinator-granted single compiler slot and pinned env sourced.
Output is owned by this reviewer under review/verification; input sources stay read-only.
"""
import argparse,datetime,fcntl,hashlib,json,os,pathlib,re,shutil,signal,subprocess,time
import psutil
# Fail before launching a compiler if process-tree monitoring is unavailable.
psutil.Process().children(recursive=True)
p=argparse.ArgumentParser();p.add_argument('roots',nargs='+');p.add_argument('--timeout',type=float,default=240);p.add_argument('--resume');p.add_argument('--target',action='append',default=[])
p.add_argument('--source-root',type=pathlib.Path,required=True)
p.add_argument('--output',type=pathlib.Path,required=True)
p.add_argument('--lean',type=pathlib.Path,required=True)
p.add_argument('--packages',type=pathlib.Path,required=True)
p.add_argument('--deadline-utc',required=True)
p.add_argument('--lock',type=pathlib.Path,required=True)
a=p.parse_args();W=a.source_root.resolve()
a.output=a.output.resolve();a.packages=a.packages.resolve();a.lean=a.lean.resolve()
deadline=datetime.datetime.fromisoformat(a.deadline_utc.replace('Z','+00:00'))
assert deadline.tzinfo is not None, 'Deadline must include timezone'
assert a.timeout>0
assert a.output != W and W not in a.output.parents, 'Output must be outside source checkout'
a.lock.parent.mkdir(parents=True,exist_ok=True)
lock=open(a.lock,'a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
now=lambda:datetime.datetime.now(datetime.timezone.utc)
stamp=now().strftime('%Y%m%dT%H%M%S%fZ')
run=pathlib.Path(a.resume).resolve() if a.resume else a.output;copy=run/'clean';out=copy/'.lake/build/lib/lean';logs=run/'logs'
out.mkdir(parents=True,exist_ok=bool(a.resume));logs.mkdir(exist_ok=bool(a.resume));start=now();records=[]
if a.resume:
 records=json.loads((run/'commands.json').read_text());start=datetime.datetime.fromisoformat(json.loads((run/'intake.json').read_text())['started_utc'])
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def write(name,data):(run/name).write_text(json.dumps(data,indent=2)+'\n')
order=[];seen=set();sources={}
def visit(mod):
 if mod in seen:return
 src=W/(mod.replace('.','/')+'.lean')
 if not src.is_file():
  if mod.startswith(('Tuza.','Tuza06.','Tuza23.','Tuza24.')):raise SystemExit('Missing local import '+mod)
  return
 seen.add(mod)
 content=src.read_text()
 for line in content.splitlines():
  m=re.match(r'^\s*(?:public\s+)?import\s+(.+)',line)
  if m:
   for dep in m.group(1).split('--')[0].split():visit(dep)
 order.append(mod);sources[mod]={'source':str(src),'sha256':sha(src)}
for root in a.roots:
 if not (W/(root.replace('.','/')+'.lean')).is_file():raise SystemExit('Missing root '+root)
 visit(root)
for mod in order:
 src=pathlib.Path(sources[mod]['source']);dest=copy/src.relative_to(W);dest.parent.mkdir(parents=True,exist_ok=True)
 if a.resume:
  assert dest.is_file() and sha(dest)==sha(src), 'Frozen source changed before audit resume: '+mod
 else:shutil.copyfile(src,dest)
def uncomment_lean(text):
 result=[];i=0;depth=0;quoted=False
 while i<len(text):
  if depth:
   if text.startswith('/-',i):depth+=1;i+=2
   elif text.startswith('-/',i):depth-=1;i+=2
   else:i+=1
  elif quoted:
   if text[i]=='\\':i+=2
   elif text[i]=='"':quoted=False;i+=1
   else:i+=1
  elif text.startswith('/-',i):depth=1;i+=2;result.append(' ')
  elif text.startswith('--',i):
   j=text.find('\n',i);i=len(text) if j<0 else j;result.append(' ')
  elif text[i]=='"':quoted=True;i+=1;result.append(' ')
  else:result.append(text[i]);i+=1
 return ''.join(result)
source_scan=[]
for mod in order:
 text=(copy/(mod.replace('.','/')+'.lean')).read_text()
 hits=re.findall(r'\b(?:sorry|sorryAx|admit|axiom|native_decide|unsafe|implemented_by|extern)\b',uncomment_lean(text))
 source_scan.append({'module':mod,'source_sha256':sources[mod]['sha256'],'forbidden_construct_tokens':hits})
write('source_scan.json',source_scan)
assert not any(x['forbidden_construct_tokens'] for x in source_scan), 'Source trust scan rejected a construct'
for f in ['lean-toolchain','lake-manifest.json','lakefile.toml']:shutil.copyfile(W/f,copy/f)
if not a.resume:(copy/'.lake/packages').symlink_to(a.packages,target_is_directory=True)
manifest=json.loads((copy/'lake-manifest.json').read_text());pins=[]
for dep in manifest['packages']:
 repo=(copy/'.lake/packages'/dep['name']).resolve()
 rev=subprocess.check_output(['git','-C',str(repo),'rev-parse','HEAD'],text=True).strip()
 dirty=subprocess.check_output(['git','-C',str(repo),'status','--porcelain','--untracked-files=no'],text=True).strip()
 pins.append({'name':dep['name'],'expected':dep['rev'],'actual':rev,'matches':rev==dep['rev'],'tracked_clean':not dirty})
 assert not dirty, 'Pinned dependency tracked files modified: '+dep['name']
assert all(x['matches'] for x in pins)
lean=str(a.lean)
env=os.environ.copy();env['LEAN_NUM_THREADS']='1';env['LEAN_PATH']=os.pathsep.join([str(out)]+[str((copy/'.lake/packages'/d['name']/'.lake/build/lib/lean').resolve()) for d in manifest['packages']])
version=subprocess.check_output([lean,'--version'],text=True).strip()
assert version.startswith('Lean (version 4.33.1,') and '819816b2e0a3' in version, version
write('intake.json',{'started_utc':start.isoformat(),'roots':a.roots,'order':order,'sources':sources,'pins':pins,'lean_version':version,'lean_binary_sha256':sha(pathlib.Path(lean)),'manifest_sha256':sha(copy/'lake-manifest.json'),'toolchain_sha256':sha(copy/'lean-toolchain'),'clean_workspace':str(copy),'lean_path':env['LEAN_PATH'],'trust_boundary':'Fresh local project objects; pinned existing compiler/Mathlib/dependency artifacts, no cold dependency rebuild.'})
def runlean(module,source,objectfile=None):
 if now()>=deadline:raise SystemExit('Publication verification deadline has passed; no compiler launched')
 cmd=[lean,'-j1','-M2200']
 if objectfile:objectfile.parent.mkdir(parents=True,exist_ok=True);cmd+=['-o',str(objectfile)]
 cmd+=[str(source)];t=time.monotonic();peak=0;reason=None;logpath=logs/(module+'.log')
 with open(logpath,'w') as stream:
  child=subprocess.Popen(cmd,cwd=copy,env=env,stdout=stream,stderr=subprocess.STDOUT,start_new_session=True)
  while child.poll() is None:
   try:
    procs=[psutil.Process(child.pid)];procs+=procs[0].children(recursive=True)
    rss=sum(q.memory_info().rss for q in procs if q.is_running());peak=max(peak,rss)
   except psutil.NoSuchProcess:
    pass  # A short compiler may exit between poll and RSS sampling.
   except (psutil.AccessDenied, OSError) as exc:
    reason='MONITOR_FAILURE: '+str(exc)
   if time.monotonic()-t>a.timeout:reason='TIMEOUT'
   if peak>2200*1024*1024:reason='TREE_RSS_LIMIT'
   if now()>=deadline:reason='PUBLICATION_DEADLINE'
   if reason:
    if child.poll() is None:
     try:os.killpg(child.pid,signal.SIGTERM)
     except ProcessLookupError:pass
     except PermissionError:child.terminate()
    try:child.wait(timeout=3)
    except subprocess.TimeoutExpired:
     try:os.killpg(child.pid,signal.SIGKILL)
     except ProcessLookupError:pass
     except PermissionError:child.kill()
    break
   time.sleep(.1)
  code=child.wait()
 rec={'module':module,'command':cmd,'cwd':str(copy),'source_sha256':sha(source),'exit_code':code,'limit_reason':reason,'elapsed_seconds':time.monotonic()-t,'peak_tree_rss_bytes':peak,'log':str(logpath),'completed_utc':now().isoformat()}
 if objectfile and objectfile.exists():rec['object_sha256']=sha(objectfile)
 records.append(rec);write('commands.json',records)
 print(json.dumps({k:rec[k] for k in ['module','exit_code','elapsed_seconds','peak_tree_rss_bytes','limit_reason']}),flush=True)
 if code or reason:
  print(logpath.read_text()[-16000:],flush=True);raise SystemExit(code or 1)
 return rec
if not a.resume:
 for mod in order:runlean(mod,copy/(mod.replace('.','/')+'.lean'),out/(mod.replace('.','/')+'.olean'))
else:
 for mod in order:
  receipt=next(r for r in records if r['module']==mod)
  assert receipt['exit_code']==0 and receipt['source_sha256']==sources[mod]['sha256']
  assert receipt['object_sha256']==sha(out/(mod.replace('.','/')+'.olean'))
# Enumerate actual imported environment constants by owning module, including private
# helpers and generated declarations. This is stronger than regex theorem inventory.
audit_name='IndependentAuditRetry' if a.resume else 'IndependentAudit'
aud=copy/(audit_name+'.lean')
module_literals=', '.join('`'+m for m in order)
aud.write_text('\n'.join('import '+r for r in a.roots)+'''
import Lean.Elab.Command
import Lean.Meta.Basic
import Lean.Util.CollectAxioms
set_option pp.universes true
set_option pp.explicit true
set_option pp.fullNames true
set_option format.width 1000000
set_option pp.proofs true
set_option pp.maxSteps 10000000
set_option maxHeartbeats 0
open Lean Elab Command in
run_cmd do
  let env ← getEnv
  let owned : Array Name := #[MODULES]
  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]
  let mut count := 0
  for (n, ci) in env.constants.toList do
    if let some idx := env.getModuleIdxFor? n then
      let mod := env.header.moduleNames[idx.toNat]!
      if owned.contains mod then
        let axioms ← Lean.collectAxioms n
        let fmt ← liftTermElabM <| Lean.Meta.ppExpr ci.type
        let refs := ci.type.getUsedConstants ++ (ci.value? true |>.map (·.getUsedConstants) |>.getD #[])
        let data := Json.mkObj [
          ("name", toJson n.toString), ("module", toJson mod.toString),
          ("type", toJson fmt.pretty), ("universe_parameters", toJson (ci.levelParams.map Name.toString)),
          ("is_theorem", toJson ci.isTheorem), ("is_axiom", toJson ci.isAxiom),
          ("is_unsafe", toJson ci.isUnsafe),
          ("axioms", toJson (axioms.map Name.toString)),
          ("direct_references", toJson (refs.map Name.toString))]
        liftIO <| IO.println ("TUZA24_AUDIT " ++ data.compress)
        for ax in axioms do
          unless allowed.contains ax do
            throwError "Unacceptable axiom {ax} in {n}"
        if ci.isAxiom || ci.isUnsafe then
          throwError "Unacceptable project declaration {n}"
        count := count + 1
  liftIO <| IO.println ("TUZA24_AUDIT_COUNT " ++ toString count)
'''.replace('MODULES',module_literals))
ar=runlean(audit_name,aud)
items=[];count=None
for line in pathlib.Path(ar['log']).read_text().splitlines():
 if line.startswith('TUZA24_AUDIT '):
  obj=json.loads(line[len('TUZA24_AUDIT '):]);src=sources[obj['module']];obj['source_sha256']=src['sha256'];obj['build_receipt']=next(r for r in records if r['module']==obj['module']);items.append(obj)
 if line.startswith('TUZA24_AUDIT_COUNT '):count=int(line.split()[-1])
assert count==len(items) and count>0
items.sort(key=lambda q:q['name']);write('declarations.json',items)
byname={q['name']:q for q in items}
target_closures={}
for target in a.target:
 assert target in byname, 'Required audit target missing: '+target
 closure=set()
 def walk(n):
  if n in closure or n not in byname:return
  closure.add(n)
  for r in byname[n]['direct_references']:walk(r)
 walk(target)
 target_closures[target]={'exact_type':byname[target]['type'],'axioms':byname[target]['axioms'],'declarations':sorted(closure),'modules':sorted({byname[n]['module'] for n in closure}),'minimality_named_dependencies':[n for n in sorted(closure) if 'minimal' in n.lower()]}
write('target_local_dependency_closures.json',{'scope':'Actual type/proof expression references among all copied local-module constants; external pinned dependencies remain disclosed trust boundary','targets':target_closures})
changed=[m for m,s in sources.items() if sha(pathlib.Path(s['source']))!=s['sha256']]
assert not changed,changed
write('summary.json',{'status':'PASS','meaning':'Independent source build and declaration audit passed; this is not by itself a theorem-scope or mission-completion claim','requested_targets':a.target,'started_utc':start.isoformat(),'completed_utc':now().isoformat(),'elapsed_seconds':(now()-start).total_seconds(),'modules_rebuilt':order,'audited_constants':len(items),'audited_theorems':sum(q['is_theorem'] for q in items),'axioms_used':sorted({ax for q in items for ax in q['axioms']}),'sources_unchanged':not changed,'max_process_tree_rss_bytes':max(r['peak_tree_rss_bytes'] for r in records),'independent_reviewer':True,'runner_sha256':sha(pathlib.Path(__file__)),'deadline_utc':deadline.isoformat(),'compiler_slot':'explicit publication lock held throughout serial invocation','no_dependency_rebuild':True,'audit_tooling_retry':'Resumed audit only after checking every frozen source and completed clean object against its prior receipt' if a.resume else None})
print('INDEPENDENT_RECEIPT '+str(run),flush=True)
