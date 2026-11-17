#!/usr/bin/env python3
import pathlib,json,os,fcntl,hashlib,subprocess,time,signal,datetime
import psutil
W=pathlib.Path(__file__).resolve().parents[1];R=W/'verification/independent-20261116T092129409939Z';C=R/'clean'
lock=open(W/'operations/build.lock','a');fcntl.flock(lock,fcntl.LOCK_EX|fcntl.LOCK_NB)
src=W/'exploratory/control_guard_missing_B.lean';dst=C/'MissingBGuard.lean';dst.write_bytes(src.read_bytes())
env=os.environ.copy();env['LEAN_PATH']=json.loads((R/'intake.json').read_text())['lean_path'];env['LEAN_NUM_THREADS']='1'
cmd=['PRIVATE_PATH_REMOVED','-j1','-M2200',str(dst)]
start=time.monotonic();peak=0;reason=None;log=R/'logs/MissingBGuard.log'
with log.open('w') as out:
 p=subprocess.Popen(cmd,cwd=C,env=env,stdout=out,stderr=subprocess.STDOUT,start_new_session=True)
 while p.poll() is None:
  try:
   root=psutil.Process(p.pid);rss=sum(q.memory_info().rss for q in [root]+root.children(recursive=True) if q.is_running());peak=max(peak,rss)
  except psutil.Error:pass
  if time.monotonic()-start>60:reason='TIMEOUT'
  if peak>2200*1024*1024:reason='TREE_RSS_LIMIT'
  if reason:
   os.killpg(p.pid,signal.SIGTERM)
   try:p.wait(timeout=3)
   except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL)
   break
  time.sleep(.1)
 code=p.wait()
text=log.read_text();passed=code==1 and reason is None and 'htight' in text and 'B H' in text and ('type mismatch' in text.lower())
receipt={'status':'EXPECTED_API_REJECTION' if passed else 'FAIL','command':cmd,'cwd':str(C),'source_sha256':hashlib.sha256(dst.read_bytes()).hexdigest(),'exit_code':code,'limit_reason':reason,'elapsed_seconds':time.monotonic()-start,'peak_tree_rss_bytes':peak,'log':str(log),'scope':'Independent replay against fresh project objects: omitting B fails exported theorem application; no mathematical independence claim','excluded_from_accepted_library':True}
(R/'negative_guard.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2));print(text)
assert passed
