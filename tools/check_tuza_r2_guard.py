#!/usr/bin/env python3
"""Recheck missing-B API rejection against fresh replay_tuza_23_24 objects."""
import argparse,fcntl,hashlib,json,os,pathlib,signal,subprocess,time
import psutil
p=argparse.ArgumentParser();p.add_argument('--run',type=pathlib.Path,required=True);p.add_argument('--fixture',type=pathlib.Path,required=True);p.add_argument('--lock',type=pathlib.Path,required=True);a=p.parse_args();run=a.run.resolve()
assert json.loads((run/'summary.json').read_text())['status']=='PASS'
intake=json.loads((run/'intake.json').read_text());cmds=json.loads((run/'commands.json').read_text());lean=cmds[0]['command'][0]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(pathlib.Path(lean))==intake['lean_binary_sha256']
for r in cmds:
 if 'object_sha256' in r:
  obj=pathlib.Path(r['command'][r['command'].index('-o')+1]);assert sha(obj)==r['object_sha256']
lock=open(a.lock,'a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB);psutil.Process().children(recursive=True)
fixture=run/'clean/MissingBGuard.lean';assert not fixture.exists();fixture.write_bytes(a.fixture.read_bytes());log=run/'logs/MissingBGuard.log';env=os.environ.copy();env.update(LEAN_NUM_THREADS='1',LEAN_PATH=intake['lean_path'])
cmd=[lean,'-j1','-M2200',str(fixture)];start=time.monotonic();peak=0;reason=None
with log.open('w') as f:
 proc=subprocess.Popen(cmd,cwd=run/'clean',env=env,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 while proc.poll() is None:
  try:
   parent=psutil.Process(proc.pid);peak=max(peak,sum(x.memory_info().rss for x in [parent,*parent.children(recursive=True)] if x.is_running()))
  except psutil.NoSuchProcess:pass
  except (psutil.AccessDenied,OSError) as exc:reason='MONITOR_FAILURE: '+str(exc)
  if time.monotonic()-start>240:reason='TIMEOUT'
  if peak>2200*1024*1024:reason='TREE_RSS_LIMIT'
  if reason:
   if proc.poll() is None:proc.terminate()
   try:proc.wait(timeout=3)
   except subprocess.TimeoutExpired:proc.kill()
   break
  time.sleep(.1)
 code=proc.wait()
text=log.read_text();ok=code!=0 and reason is None and 'Application type mismatch' in text and 'B H' in text and 'r2 H F hF hcard htight' in text
receipt={'status':'EXPECTED_API_REJECTION' if ok else 'FAIL','command':cmd,'source_sha256':sha(fixture),'source_fixture':a.fixture.name,'exit_code':code,'limit_reason':reason,'elapsed_seconds':time.monotonic()-start,'peak_tree_rss_bytes':peak,'log':'logs/MissingBGuard.log','scope':'Missing old-B argument is rejected by the exported API against freshly rebuilt objects; not a mathematical independence proof','excluded_from_accepted_library':True}
(run/'negative_guard.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));assert ok
