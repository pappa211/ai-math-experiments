"""Mission-owned process-tree wall/RSS monitor; Darwin ps RSS is KiB."""
import argparse,datetime,json,os,signal,subprocess,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--seconds',type=float,default=180);p.add_argument('--rss-mib',type=float,default=2200);p.add_argument('--name',required=True);p.add_argument('cmd',nargs='+');a=p.parse_args()
w=Path(__file__).resolve().parents[1];start=time.time();peak=0;reason=None
log=(w/'operations'/f'{a.name}.log').open('w')
child=subprocess.Popen(a.cmd,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,cwd=w)
while child.poll() is None:
 rows=subprocess.check_output(['ps','-axo','pid=,ppid=,rss='],text=True)
 vals=[tuple(map(int,l.split())) for l in rows.splitlines() if len(l.split())==3]
 ids={child.pid}
 while True:
  new=ids|{pid for pid,ppid,rss in vals if ppid in ids}
  if new==ids:break
  ids=new
 rss=sum(r for pid,ppid,r in vals if pid in ids)/1024;peak=max(peak,rss)
 if time.time()-start>a.seconds:reason='wall_timeout'
 if rss>a.rss_mib:reason='rss_limit'
 if reason:
  os.killpg(child.pid,signal.SIGTERM)
  try:child.wait(timeout=3)
  except subprocess.TimeoutExpired:os.killpg(child.pid,signal.SIGKILL);child.wait()
  break
 time.sleep(.1)
rc=child.wait();log.close()
receipt={'start_utc':datetime.datetime.fromtimestamp(start,datetime.timezone.utc).isoformat(),'end_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'seconds':time.time()-start,'command':a.cmd,'pid':child.pid,'peak_sampled_tree_rss_mib':peak,'rss_ceiling_mib':a.rss_mib,'wall_seconds_cap':a.seconds,'returncode':rc,'termination_reason':reason,'owned_process_finished':True}
(w/'operations'/f'{a.name}.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt));raise SystemExit(rc or bool(reason))
