#!/usr/bin/env python3
"""Serial local Lean builds with immutable dependency objects and external limits."""
import pathlib,json,os,sys,subprocess,time,datetime,hashlib,signal,fcntl,psutil,argparse
p=argparse.ArgumentParser();p.add_argument('modules',nargs='*');p.add_argument('--timeout',type=float,default=240);p.add_argument('--out',default='.lake/build/lib/lean');p.add_argument('--label',default='build');a=p.parse_args()
w=pathlib.Path(__file__).resolve().parent.parent
lock=open(w/'operations/build.lock','w');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
mods=a.modules or json.loads((w/'operations/reused_build_order.json').read_text());out=w/a.out;out.mkdir(parents=True,exist_ok=True)
pkgs=w/'.lake/packages';manifest=json.loads((w/'lake-manifest.json').read_text())
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join([str(out)]+[str(pkgs/d['name']/'.lake/build/lib/lean') for d in manifest['packages']]);env['LEAN_NUM_THREADS']='1'
lean='PRIVATE_PATH_REMOVED'
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%S%fZ');dest=w/'operations'/f'{a.label}-{stamp}';dest.mkdir()
for mod in mods:
 src=w/(mod.replace('.','/')+'.lean');obj=out/(mod.replace('.','/')+'.olean');obj.parent.mkdir(parents=True,exist_ok=True)
 cmd=[lean,'-j1','-M2200','-o',str(obj),str(src)];start=time.monotonic();peak=0;reason=None
 with open(dest/(mod+'.log'),'w') as log:
  pr=subprocess.Popen(cmd,cwd=w,env=env,stdout=log,stderr=subprocess.STDOUT,start_new_session=True)
  while pr.poll() is None:
   try:
    root=psutil.Process(pr.pid);rss=sum(x.memory_info().rss for x in [root]+root.children(recursive=True) if x.is_running());peak=max(peak,rss)
   except psutil.Error:pass
   if time.monotonic()-start>a.timeout:reason='EXTERNAL_TIMEOUT'
   if peak>2200*1024*1024:reason='PROCESS_TREE_RSS_LIMIT'
   if datetime.datetime.now(datetime.timezone.utc)>=datetime.datetime.fromisoformat('2026-11-16T16:51:42+00:00'):reason='MISSION_DEADLINE'
   if reason:
    os.killpg(pr.pid,signal.SIGTERM)
    try:pr.wait(timeout=3)
    except subprocess.TimeoutExpired:os.killpg(pr.pid,signal.SIGKILL)
    break
   time.sleep(.1)
  code=pr.wait()
 rec={'module':mod,'cmd':cmd,'cwd':str(w),'lean_path':env['LEAN_PATH'],'source_sha256':hashlib.sha256(src.read_bytes()).hexdigest(),'elapsed_seconds':time.monotonic()-start,'peak_process_tree_rss_bytes':peak,'exit_code':code,'limit_reason':reason,'completed_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()}
 (dest/(mod+'.json')).write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps({k:rec[k] for k in ['module','exit_code','elapsed_seconds','peak_process_tree_rss_bytes','limit_reason']}),flush=True)
 if code or reason:
  print((dest/(mod+'.log')).read_text()[-14000:],flush=True);sys.exit(code or 1)
print('RECEIPTS '+str(dest),flush=True)
