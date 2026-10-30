#!/usr/bin/env python3
"""Fresh TUZA-06 source rebuild/type audit/exact-module kernel replay.
Reuses separately verified pinned compiled dependency packages; never fetches/builds them.
No permanent mission deadline: future user reproduction is supported. Optional invocation-specific deadlines may be supplied for bounded runs.
Each individual compiler/replay command acquires the same shared build lock.
"""
from pathlib import Path
import argparse,datetime,fcntl,hashlib,json,os,re,resource,shutil,signal,subprocess,sys,time

ap=argparse.ArgumentParser(description=__doc__)
ap.add_argument('--source',required=True,type=Path)
ap.add_argument('--output',required=True,type=Path,help='Must be a new directory')
ap.add_argument('--targets',required=True,nargs='+',help='Exact completed local modules whose dependency closure is rebuilt')
ap.add_argument('--packages',type=Path)
ap.add_argument('--lock-file',type=Path)
ap.add_argument('--campaign-clock',type=Path,help='Optional for later users; mandatory for this campaign')
ap.add_argument('--stop-before',help='Optional UTC cutoff, including Z')
ap.add_argument('--job-timeout',type=float,default=240)
ap.add_argument('--lake',type=Path,default=Path.home()/'.elan/bin/lake')
ap.add_argument('--resume',action='store_true',help='Resume an interrupted fresh workspace after verifying its preserved source hashes')
ap.add_argument('--replay-existing',action='store_true',help='Pilot existing oleans only; NEVER reported as clean reproduction')
ap.add_argument('--fresh-build-evidence',type=Path,help='Successful prior fresh build verification JSON, required to label existing-object replay as fresh-project evidence')
ap.add_argument('--native-leaf-comparison',action='store_true',help='Pilot comparison with installed prefix CLI, only when target has no descendants')
ap.add_argument('--skip-replay',action='store_true')
ap.add_argument('--memory-mb',type=int,default=2200,help='Exact replay runtime cap, at most 2200 MiB')
ap.add_argument('--replay-closure',action='store_true',help='Replay the complete local source dependency closure even in existing-project mode')
args=ap.parse_args()
src=args.source.resolve();dst=args.output.resolve()
if dst.exists() and not args.resume:raise SystemExit('Refusing to overwrite existing output evidence')
if args.resume and (args.replay_existing or not dst.is_dir()):raise SystemExit('Resume requires an existing fresh workspace')
if not src.is_dir() or not (src/'lean-toolchain').is_file():raise SystemExit('Invalid source project')
if args.fresh_build_evidence and not args.replay_existing:raise SystemExit('Fresh build evidence is for a separate existing-object replay stage')
if args.job_timeout<=0:raise SystemExit('Timeout must be positive')
if not 0<args.memory_mb<=2200:raise SystemExit('Replay memory cap outside conservative bound')
dst.mkdir(parents=True,exist_ok=args.resume);out=dst/'reproduction-output';out.mkdir(exist_ok=args.resume)
lockpath=(args.lock_file or dst.parent/'tuza06-reproduction.lock').resolve();lockpath.parent.mkdir(parents=True,exist_ok=True)
resume_results=[]
if args.resume:
 prior=json.loads((out/'failure.json').read_text());resume_results=prior['commands']
 shutil.copy2(out/'failure.json',out/f'failure-before-resume-{int(time.time())}.json')
log=(out/'build-and-replay.log').open('a' if args.resume else 'w');started=time.monotonic();results=list(resume_results);active=None
cutoffs=[]
if args.campaign_clock:
 c=json.loads(args.campaign_clock.read_text());cutoffs.append(datetime.datetime.fromisoformat(c['hard_deadline_utc'].replace('Z','+00:00')))
if args.stop_before:cutoffs.append(datetime.datetime.fromisoformat(args.stop_before.replace('Z','+00:00')))
def remaining():
 return min((d-datetime.datetime.now(datetime.timezone.utc)).total_seconds() for d in cutoffs) if cutoffs else float('inf')
def stop_signal(sig,frame):raise KeyboardInterrupt(f'Signal {sig}')
for sig in [signal.SIGINT,signal.SIGTERM,signal.SIGHUP]:signal.signal(sig,stop_signal)
def kill_active():
 global active
 if active is not None and active.poll() is None:
  try:os.killpg(active.pid,signal.SIGTERM)
  except ProcessLookupError:pass
  try:active.communicate(timeout=3)
  except subprocess.TimeoutExpired:
   try:os.killpg(active.pid,signal.SIGKILL)
   except ProcessLookupError:pass
   active.communicate()
 active=None
project=src if args.replay_existing else dst
env=dict(os.environ);env.pop('LEAN_PATH',None);env.pop('LEAN_SRC_PATH',None)
env['LEAN_NUM_THREADS']='1';env['OMP_NUM_THREADS']='1'
def run(argv,tag,*,timeout=None,extra_env=None):
 global active
 argv=list(map(str,argv));t=time.monotonic();jobenv=dict(env);jobenv.update(extra_env or {})
 with lockpath.open('a') as lk:
  def lock_alarm(sig,frame):raise TimeoutError('Campaign deadline/cutoff reached while waiting for build lock')
  if remaining()<=0:raise TimeoutError('Campaign deadline/cutoff reached before build lock')
  previous_alarm=signal.signal(signal.SIGALRM,lock_alarm)
  if cutoffs:signal.setitimer(signal.ITIMER_REAL,remaining())
  try:fcntl.flock(lk,fcntl.LOCK_EX)
  finally:
   signal.setitimer(signal.ITIMER_REAL,0);signal.signal(signal.SIGALRM,previous_alarm)
  allowed=min(timeout or args.job_timeout,remaining())
  if allowed<=0:raise TimeoutError('Campaign deadline/cutoff reached; no new job started')
  print(tag,flush=True);print('$ '+' '.join(argv),file=log,flush=True)
  if extra_env:print('ENV '+json.dumps(extra_env,sort_keys=True),file=log,flush=True)
  before=datetime.datetime.now(datetime.timezone.utc).isoformat();beg=time.monotonic()
  try:
   active=subprocess.Popen(argv,cwd=project,env=jobenv,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,start_new_session=True)
   if 'leanchecker' in argv:
    limit_at=time.monotonic()+allowed
    while True:
     left=limit_at-time.monotonic()
     if left<=0:raise TimeoutError('Native comparison timed out')
     try:
      stdout,_=active.communicate(timeout=min(.2,left));break
     except subprocess.TimeoutExpired:
      status=Path(f'/proc/{active.pid}/status')
      if status.exists():
       rss=re.search(r'^VmRSS:\s+(\d+)',status.read_text(),re.M)
       if rss and int(rss[1])>args.memory_mb*1024:raise MemoryError('Native CLI RSS cap exceeded')
   else:stdout,_=active.communicate(timeout=allowed)
   code=active.returncode;active=None
  except BaseException:
   kill_active();raise
  entry={'tag':tag,'command':argv,'exit_code':code,'seconds':round(time.monotonic()-beg,3),'wait_and_run_seconds':round(time.monotonic()-t,3),'start_utc':before,'extra_env':extra_env or {}}
  results.append(entry);print(stdout,file=log,end='',flush=True)
  (out/(re.sub(r'[^A-Za-z0-9_.-]','_',tag)+'.log')).write_text(stdout)
  if code:raise RuntimeError(f'{tag} exited {code}')
  return stdout

def strip_comments(s):
 # Retain line breaks; nested Lean comments and quoted strings are distinguished.
 out=[];i=0;depth=0;quoted=False
 while i<len(s):
  if depth:
   if s.startswith('/-',i):depth+=1;i+=2
   elif s.startswith('-/',i):depth-=1;i+=2
   else:
    if s[i]=='\n':out.append('\n')
    i+=1
  elif quoted:
   if s[i]=='\\':out.extend('  ');i+=2
   elif s[i]=='"':quoted=False;out.append(' ');i+=1
   else:out.append('\n' if s[i]=='\n' else ' ');i+=1
  elif s.startswith('--',i):
   j=s.find('\n',i);i=len(s) if j<0 else j
  elif s.startswith('/-',i):depth=1;i+=2
  elif s[i]=='"':quoted=True;out.append(' ');i+=1
  else:out.append(s[i]);i+=1
 return ''.join(out)
modules={};order=[];visiting=set()
def visit(m):
 if m in modules:return
 if m in visiting:raise RuntimeError('Local import cycle: '+m)
 if not re.fullmatch(r'[A-Za-z_][A-Za-z0-9_]*(\.[A-Za-z_][A-Za-z0-9_]*)*',m):raise RuntimeError('Invalid module '+m)
 p=src/Path(m.replace('.','/')).with_suffix('.lean')
 if not p.is_file():raise RuntimeError('Missing requested/local module '+m)
 visiting.add(m);clean=strip_comments(p.read_text())
 imports=[]
 for line in clean.splitlines():
  if line.startswith('import '):imports+=line.split()[1:]
 for dep in imports:
  if (src/Path(dep.replace('.','/')).with_suffix('.lean')).is_file():visit(dep)
  elif dep.startswith(('Tuza.','Tuza06.','Review.')):raise RuntimeError('Missing local dependency '+dep)
 visiting.remove(m);modules[m]=p;order.append(m)

def declarations(clean):
 scopes=[];answer=[];defs=[]
 for line in clean.splitlines():
  s=line.strip()
  n=re.match(r'namespace\s+(\S+)',s)
  if n:scopes.append(('namespace',n[1]));continue
  if re.match(r'(?:noncomputable\s+)?section(?:\s|$)',s):scopes.append(('section',''));continue
  if re.fullmatch(r'end(?:\s+\S+)?',s):
   if scopes:scopes.pop()
   continue
  prefix='.'.join(x[1] for x in scopes if x[0]=='namespace')
  d=re.match(r'(?:@\[[^\n]*\]\s*)?(theorem|lemma|(?:noncomputable\s+)?def|structure)\s+([A-Za-z0-9_\'.]+)',s)
  if d:
   name=(prefix+'.' if prefix else '')+d[2]
   (answer if d[1] in ['theorem','lemma'] else defs).append(name)
 return answer,defs
try:
 for m in args.targets:visit(m)
 fresh_build_hash=None
 if args.fresh_build_evidence:
  epath=args.fresh_build_evidence.resolve();prior_build=json.loads(epath.read_text())
  if prior_build['status']!='PASS' or prior_build['replayed_modules'] or 'fresh source-project rebuild' not in prior_build['method']:raise RuntimeError('Invalid prior fresh build evidence')
  if prior_build['build_order']!=order:raise RuntimeError('Prior fresh build closure order differs')
  for item in prior_build['source_hashes']:
   if hashlib.sha256((src/item['file']).read_bytes()).hexdigest()!=item['sha256']:raise RuntimeError('Fresh build source identity differs '+item['file'])
  for item in prior_build['object_hashes']:
   obj=src/'.lake/build/lib/lean'/Path(item['module'].replace('.','/')).with_suffix('.olean')
   if hashlib.sha256(obj.read_bytes()).hexdigest()!=item['sha256']:raise RuntimeError('Fresh object identity differs '+item['module'])
  if len(prior_build['object_hashes'])!=len(order):raise RuntimeError('Incomplete prior object inventory')
  for module in order:
   attempts=[c for c in prior_build['commands'] if c['tag']=='build-'+module]
   if not attempts or attempts[-1]['exit_code']!=0:raise RuntimeError('Prior fresh build lacks successful module '+module)
  fresh_build_hash=hashlib.sha256(epath.read_bytes()).hexdigest()
 hashes=[];theorems=[];definitions=[]
 for m in order:
  p=modules[m];clean=strip_comments(p.read_text())
  bad=re.search(r'\b(sorry|admit|sorryAx|axiom|unsafe|native_decide|implemented_by)\b',clean)
  if bad:raise RuntimeError(f'Forbidden active proof-source token {bad[0]} in {m}')
  hashes.append({'module':m,'file':str(p.relative_to(src)),'sha256':hashlib.sha256(p.read_bytes()).hexdigest()})
  ns,ds=declarations(clean);theorems+=ns;definitions+=ds
 packages=(args.packages or src/'.lake/packages').resolve()
 if not packages.is_dir():raise RuntimeError('Supply an existing pinned compiled package directory; no fetching is performed')
 if not args.replay_existing:
  for name in ['lean-toolchain','lake-manifest.json','lakefile.toml','lakefile.lean']:
   if (src/name).is_file():shutil.copy2(src/name,dst/name)
  for m in order:
   p=modules[m];q=dst/p.relative_to(src);q.parent.mkdir(parents=True,exist_ok=True)
   if args.resume:
    if not q.is_file() or q.read_bytes()!=p.read_bytes():raise RuntimeError('Fresh resume source mismatch '+m)
   else:shutil.copy2(p,q)
  (dst/'.lake').mkdir(exist_ok=args.resume)
  if not (dst/'.lake/packages').is_symlink():(dst/'.lake/packages').symlink_to(packages,target_is_directory=True)
  (dst/'tools').mkdir(exist_ok=args.resume)
  for name in ['ReplayExact.lean','ReplayExactNative.lean']:
   if (src/'tools'/name).is_file():shutil.copy2(src/'tools'/name,dst/'tools'/name)
 version=run([args.lake,'env','lean','--version'],'compiler-version')
 if 'version 4.33.1' not in version:raise RuntimeError('Unexpected Lean version: '+version)
 prefix=Path(run([args.lake,'env','lean','--print-prefix'],'compiler-prefix').strip())
 upstream=prefix/'src/lean/LeanChecker.lean'
 upstream_hash=hashlib.sha256(upstream.read_bytes()).hexdigest() if upstream.is_file() else None
 if upstream.is_file():shutil.copy2(upstream,out/'LeanChecker.upstream.lean')
 driver=project/'tools/ReplayExactNative.lean'
 if not driver.is_file():driver=project/'tools/ReplayExact.lean'
 driverhash=hashlib.sha256(driver.read_bytes()).hexdigest()
 manifest=json.loads((project/'lake-manifest.json').read_text());pins=[]
 for p in manifest['packages']:
  head=run(['git','--no-optional-locks','-C',packages/p['name'],'rev-parse','HEAD'],'pin-'+p['name']).strip()
  state=run(['git','--no-optional-locks','-C',packages/p['name'],'status','--porcelain','--untracked-files=no'],'clean-'+p['name']).strip()
  if head!=p['rev'] or state:raise RuntimeError('Dependency pin/clean mismatch '+p['name'])
  pins.append({'name':p['name'],'rev':head,'tracked_clean':True})
 if not args.replay_existing:
  for m in order:
   rel=Path(m.replace('.','/'));target=dst/'.lake/build/lib/lean'/rel.with_suffix('.olean');target.parent.mkdir(parents=True,exist_ok=True)
   if args.resume and any(x['tag']=='build-'+m and x['exit_code']==0 for x in resume_results):
    if not target.is_file():raise RuntimeError('Missing previously successful fresh object '+m)
    continue
   run([args.lake,'env','lean','-DautoImplicit=false','-j','1','-M',str(args.memory_mb),'-o',target,rel.with_suffix('.lean')],'build-'+m)
  header='\n'.join('import '+m for m in args.targets)+'\nset_option pp.universes true\n'
  primary=header
  for n in ['Tuza06.Degenerate','Tuza06.ComponentCliques','Tuza06.CombinedStatement','Tuza06.Good','Tuza06.MinimalObstruction','Tuza06.FinalConfiguration']:
   if n in definitions:primary+='#print '+n+'\n'
  for target in args.targets:
   ns,_=declarations(strip_comments(modules[target].read_text()))
   for n in ns:primary+='#check @'+n+'\n#print axioms '+n+'\n'
  (dst/'ReproductionMainAudit.lean').write_text(primary)
  run([args.lake,'env','lean','-DautoImplicit=false','-j','1','-M',str(args.memory_mb),'-o','.lake/build/lib/lean/ReproductionMainAudit.olean','ReproductionMainAudit.lean'],'main-type-axiom-audit')
  allowed={'propext','Classical.choice','Quot.sound'};axioms=[]
  allnames=list(dict.fromkeys(theorems))
  for offset in range(0,len(allnames),50):
   batch=allnames[offset:offset+50];stem=f'ReproductionAudit{offset//50:03}'
   audit=header+''.join('#check @'+n+'\n#print axioms '+n+'\n' for n in batch)
   (dst/(stem+'.lean')).write_text(audit)
   aud=run([args.lake,'env','lean','-DautoImplicit=false','-j','1','-M',str(args.memory_mb),'-o',f'.lake/build/lib/lean/{stem}.olean',stem+'.lean'],'type-axiom-audit-'+stem)
   for n in batch:
    match=re.search(re.escape("'"+n+"'")+r' depends on axioms: \[([^\]]*)\]',aud)
    if match:used={a.strip() for a in re.sub(r'\.\{[^}]*\}','',match[1]).split(',') if a.strip()}
    elif "'"+n+"' does not depend on any axioms" in aud:used=set()
    else:raise RuntimeError('Missing axiom report '+n)
    if used-allowed:raise RuntimeError('Unexpected axiom closure '+n+str(used))
    axioms.append({'theorem':n,'axioms':sorted(used)})
  (out/'declaration-axioms.json').write_text(json.dumps(axioms,indent=2)+'\n')
 replaymods=args.targets if args.replay_existing and not args.replay_closure else order
 if not args.skip_replay:
  native_driver=project/'tools/ReplayExactNative.lean'
  native_exe=project/'.lake/replay-tools/replay-exact'
  if native_driver.is_file():
   native_exe.parent.mkdir(parents=True,exist_ok=True)
   run([args.lake,'env','lean','-j','1','-M','1900','-o',native_exe.parent/'ReplayExactNative.olean','-c',native_exe.parent/'ReplayExactNative.c',native_driver],'build-exact-replay-C')
   run([args.lake,'env','leanc','-o',native_exe,native_exe.parent/'ReplayExactNative.c'],'build-exact-replay-native')
  for m in replaymods:
   if native_driver.is_file():
    run([args.lake,'env',native_exe,m],'replay-exact-'+m,extra_env={'LEAN_SYSROOT':str(prefix),'TUZA06_REPLAY_MEMORY_MB':str(args.memory_mb)})
   else:
    run([args.lake,'env','lean','-j','1','-M','1900','tools/ReplayExact.lean'],'replay-exact-'+m,extra_env={'TUZA06_REPLAY_MODULE':m})
   if args.native_leaf_comparison:
    built=project/'.lake/build/lib/lean'
    if any(str(p.relative_to(built).with_suffix('')).replace('/','.').startswith(m+'.') for p in built.rglob('*.olean')):raise RuntimeError('Native CLI prefix fanout would occur: '+m)
    run([args.lake,'env','leanchecker','-v',m],'native-leaf-'+m)
 for d in hashes:
  if hashlib.sha256((src/d['file']).read_bytes()).hexdigest()!=d['sha256']:raise RuntimeError('Source changed during run '+d['module'])
 report={'status':'PASS','finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seconds':round(time.monotonic()-started,3),'method':('exact-module standard Lean kernel replay of source-hash-verified fresh-project objects' if fresh_build_hash else 'existing development-object replay pilot') if args.replay_existing else ('fresh source-project rebuild and batched type/axiom audit; pinned compiled dependencies reused; replay not requested in this stage' if args.skip_replay else 'fresh source-project rebuild; pinned compiled dependencies reused; exact-module standard LeanChecker API replay'),'prior_fresh_build_evidence_sha256':fresh_build_hash,'cold_mathlib_rebuild':False,'independent_kernel_implementation':False,'compiler':version.strip(),'source_hashes':hashes,'dependency_pins':pins,'build_order':order,'public_theorems':list(dict.fromkeys(theorems)),'replayed_modules':[] if args.skip_replay else replaymods,'replay_driver_sha256':driverhash,'compiler_memory_mb':args.memory_mb,'replay_memory_mb':args.memory_mb,'upstream_LeanChecker_source_sha256':upstream_hash,'shared_lock':str(lockpath),'campaign_clock':str(args.campaign_clock) if args.campaign_clock else None,'commands':results}
 if fresh_build_hash:
  for item in prior_build['object_hashes']:
   obj=src/'.lake/build/lib/lean'/Path(item['module'].replace('.','/')).with_suffix('.olean')
   if hashlib.sha256(obj.read_bytes()).hexdigest()!=item['sha256']:raise RuntimeError('Fresh object changed during replay '+item['module'])
 report['object_hashes']=[{'module':m,'sha256':hashlib.sha256((project/'.lake/build/lib/lean'/Path(m.replace('.','/')).with_suffix('.olean')).read_bytes()).hexdigest()} for m in order]
 (out/'verification.json').write_text(json.dumps(report,indent=2)+'\n');print('PASS',report['method'],flush=True)
except BaseException as e:
 kill_active();(out/'failure.json').write_text(json.dumps({'status':'FAIL','error':repr(e),'commands':results},indent=2)+'\n');print('FAIL',repr(e),file=sys.stderr,flush=True);raise
finally:kill_active();log.close()
