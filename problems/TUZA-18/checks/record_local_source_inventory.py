"""Read-only immediate-workspace inventory; does not audit or import their mathematics."""
from pathlib import Path
import subprocess,os,json,datetime
ROOT=Path(__file__).resolve().parents[1]
ENV=dict(os.environ,GIT_OPTIONAL_LOCKS='0')
rows=[]
for path in sorted(ROOT.parent.iterdir()):
    if not path.is_dir() or not path.name.startswith('TUZA') or path==ROOT:continue
    row=dict(workspace=str(path),name=path.name)
    if (path/'.git').exists():
        result=subprocess.run(['git','-C',str(path),'log','-1','--format=%H%n%cI%n%s'],env=ENV,text=True,capture_output=True,timeout=20)
        row.update(git_read_returncode=result.returncode,head_record=result.stdout.splitlines(),git_read_error=result.stderr.strip())
    else:row['git_metadata']='No immediate .git entry; not recursively searched'
    rows.append(row)
result=dict(time_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),scope='Immediate local TUZA workspaces and their latest Git identity only. Names/commit dates do not certify mathematical results. No new theorem imported; no worktree or Git mutation.',current_campaign_excluded=str(ROOT),workspaces=rows)
(ROOT/'evidence/local_source_inventory.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(dict(workspaces=len(rows),failed_git_reads=sum(r.get('git_read_returncode',0)!=0 for r in rows),time_utc=result['time_utc'])))
