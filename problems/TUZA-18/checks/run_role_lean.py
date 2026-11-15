"""Pinned local Lean finite auxiliary check; no downloads or dependency mutations."""
from pathlib import Path
import subprocess,os,json,hashlib,datetime,sys,time
ROOT=Path(__file__).resolve().parents[1]
STOP=datetime.datetime(2026,11,14,21,0,10,tzinfo=datetime.timezone.utc)
assert datetime.datetime.now(datetime.timezone.utc)<STOP,'Research cutoff passed'
base=Path('PRIVATE_LOCAL_PATH')
packages=base/'workspaces/native-dependencies/.lake/packages'
env=dict(os.environ,ELAN_HOME=str(base/'toolchains/elan'),ELAN_TOOLCHAIN='leanprover/lean4:v4.33.1',LEAN_NUM_THREADS='1')
env['LEAN_PATH']=':'.join(str(p/'.lake/build/lib/lean') for p in packages.iterdir() if p.is_dir())
lean=base/'toolchains/elan/bin/lean'
command=[str(lean),'-M','2200',str(ROOT/'lean/RoleWitness.lean')]
started=datetime.datetime.now(datetime.timezone.utc).isoformat();t=time.monotonic()
try:
 r=subprocess.run(command,cwd=ROOT,env=env,text=True,capture_output=True,timeout=min(240,(STOP-datetime.datetime.now(datetime.timezone.utc)).total_seconds()))
 output=r.stdout+r.stderr;status='PASS' if r.returncode==0 else 'FAIL';rc=r.returncode
except subprocess.TimeoutExpired as e:
 output=str(e.stdout or '')+str(e.stderr or '');status='UNKNOWN_TIMEOUT';rc=None
stamp=datetime.datetime.now(datetime.timezone.utc).strftime('%Y%m%dT%H%M%SZ')
(ROOT/'evidence'/f'lean_role_{stamp}.log').write_text(output)
result=dict(status=status,returncode=rc,command=command,start_utc=started,finish_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),elapsed=time.monotonic()-t,source_sha256=hashlib.sha256((ROOT/'lean/RoleWitness.lean').read_bytes()).hexdigest(),lean_path=env['LEAN_PATH'],scope='Finite six-vertex role-selection obstruction only; not unrestricted Tuza',log=f'evidence/lean_role_{stamp}.log')
(ROOT/'evidence'/f'lean_role_{stamp}.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result));print(output);sys.exit(0 if status=='PASS' else 1)
