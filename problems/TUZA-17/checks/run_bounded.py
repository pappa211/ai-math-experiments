"""Run an owned local child with wall/RSS watchdog; never affects other jobs."""
import sys,subprocess,time,os,signal,json
from pathlib import Path
seconds=float(sys.argv[1]);MiB=float(sys.argv[2]);log=Path(sys.argv[3]);cmd=sys.argv[4:]
start=time.monotonic();peak=0;reason=None
with log.open('w') as f:
 p=subprocess.Popen(cmd,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 while p.poll() is None:
  try:
   raw=subprocess.check_output(['ps','-o','rss=','-p',str(p.pid)],text=True).strip()
   rss=int(raw or 0)*1024;peak=max(peak,rss)
  except (subprocess.CalledProcessError,ValueError):rss=0
  if time.monotonic()-start>seconds:reason='TIME_LIMIT'
  if rss>MiB*1024**2:reason='RSS_LIMIT'
  if reason:os.killpg(p.pid,signal.SIGKILL);break
  time.sleep(.2)
 rc=p.wait()
record={'command':cmd,'pid':p.pid,'exit_code':rc,'reason':reason,'elapsed_seconds':time.monotonic()-start,'peak_sampled_RSS_bytes':peak,'wall_limit_seconds':seconds,'RSS_limit_MiB':MiB,'status':'PASS' if rc==0 else 'UNKNOWN_OR_ERROR'}
log.with_suffix('.limits.json').write_text(json.dumps(record,indent=2)+'\n');print(json.dumps(record));sys.exit(rc if rc>=0 else 1)
