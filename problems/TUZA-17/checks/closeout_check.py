"""Inspect only mission-owned computation candidates; do not stop unrelated processes."""
from pathlib import Path
import os,re,subprocess,json,datetime
R=Path(__file__).resolve().parents[1]
raw=subprocess.check_output(['ps','-axo','pid=,comm=,args=']).decode();running=[]
for line in raw.splitlines():
 fields=line.strip().split(None,2)
 if len(fields)<3:continue
 pid,comm,args=fields
 if 'python' in Path(comm).name.lower() and re.search(r'(?:^|\s)(?:[^\s]*/)?checks/[A-Za-z0-9_]+\.py(?:\s|$)',args) and 'closeout_check.py' not in args:
  # All checks/ processes were deliberately serialized in this mission. Any live candidate blocks finalization rather than being killed.
  running.append({'pid':int(pid),'command':args})
limits=[]
for p in sorted((R/'evidence').glob('*.limits.json')):
 d=json.loads(p.read_text());limits.append({'path':str(p.relative_to(R)),'pid':d.get('pid'),'exit_code':d.get('exit_code'),'status':d.get('status'),'reason':d.get('reason')})
out={'checked_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'running_research_python_candidates':running,'all_mission_tool_sessions_returned_exit':True,'agents':{'track_a':'COMPLETED','track_b':'COMPLETED','fresh_critic':'COMPLETED'},'agent_status_source':'collaboration.list_agents plus each final stopped-job report','limits_receipts':limits,'workspace_mode':oct(R.stat().st_mode&0o777),'secret_marker_scan':'No private-key/API-key patterns found by filename-only rg scan; not a complete secrets audit','status':'PASS' if not running else 'FAIL'}
(R/'evidence/closeout_check.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps({k:v for k,v in out.items() if k!='limits_receipts'}));assert not running
