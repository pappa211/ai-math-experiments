import subprocess,time,json,sys,os,signal,datetime
from pathlib import Path
w=Path(__file__).resolve().parents[1];log=w/'receipts/root_search.log';start=time.monotonic();peak=0;samples=0;reason=None
with log.open('w') as f:
 p=subprocess.Popen([sys.executable,str(w/'checks/root_search.py'),'300'],cwd=w,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 while p.poll() is None:
  rows=subprocess.check_output(['ps','-axo','pid=,ppid=,rss='],text=True).splitlines();table=[tuple(map(int,r.split())) for r in rows if len(r.split())==3];pids={p.pid};change=True
  while change:
   old=len(pids);pids.update(pid for pid,ppid,rss in table if ppid in pids);change=len(pids)>old
  rss=sum(rss for pid,ppid,rss in table if pid in pids);peak=max(peak,rss);samples+=1
  if rss>2200*1024:reason='RSS_LIMIT'
  if time.monotonic()-start>330:reason='TIME_LIMIT'
  if reason:os.killpg(p.pid,signal.SIGTERM);break
  time.sleep(.2)
 try:p.wait(timeout=5)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait()
(w/'receipts/root_search_monitor.json').write_text(json.dumps({'pid':p.pid,'exit':p.returncode,'seconds':time.monotonic()-start,'peak_sampled_tree_RSS_KiB':peak,'samples':samples,'termination_reason':reason,'finished_utc':datetime.datetime.now(datetime.timezone.utc).isoformat()},indent=2)+'\n');print(log.read_text()[-4000:])
