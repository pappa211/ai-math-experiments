#!/usr/bin/env python3
from pathlib import Path
import subprocess,os,sys,time,json,datetime,signal
F=Path(__file__).resolve().parent
logs=F/'logs';logs.mkdir(exist_ok=True)
name=sys.argv[1];label=sys.argv[2] if len(sys.argv)>2 else Path(name).stem
memory=int(os.environ.get('FORMAL_LEAN_MEMORY_MIB','2200'));assert 0<memory<=2200
cmd=['/usr/bin/time','-l','lean','-M',str(memory),'-j','1',name,'-o',str(Path(name).with_suffix('.olean'))]
env=os.environ.copy();env['LEAN_PATH']=str(F)
start=time.monotonic();started=datetime.datetime.now(datetime.timezone.utc).isoformat()
with (logs/(label+'.stdout')).open('w') as out,(logs/(label+'.stderr')).open('w') as err:
 p=subprocess.Popen(cmd,cwd=F,env=env,stdout=out,stderr=err,start_new_session=True)
 timeout=False
 try:rc=p.wait(timeout=240)
 except subprocess.TimeoutExpired:
  timeout=True;os.killpg(p.pid,signal.SIGKILL);rc=p.wait()
record={'command':cmd,'cwd':str(F),'started_utc':started,'seconds':time.monotonic()-start,'returncode':rc,'timeout':timeout,'memory_limit_MiB':memory,'threads':1,'stdout':str(logs/(label+'.stdout')),'stderr':str(logs/(label+'.stderr'))}
with (F/'commands.jsonl').open('a') as out:out.write(json.dumps(record)+'\n')
print(json.dumps(record))
print((logs/(label+'.stdout')).read_text()[:7000])
if rc:print((logs/(label+'.stderr')).read_text()[:1000])
sys.exit(rc)
