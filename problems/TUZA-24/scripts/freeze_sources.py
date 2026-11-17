#!/usr/bin/env python3
"""Freeze the accepted local source closure before independent verification."""
from pathlib import Path
import datetime,hashlib,json,re
w=Path(__file__).resolve().parents[1]
roots=['Research','Tuza24.Controls']
seen=set();order=[]
def visit(m):
 if m in seen:return
 p=w/(m.replace('.','/')+'.lean')
 if not p.is_file():
  if m.startswith(('Tuza.','Tuza06.','Tuza23.','Tuza24.')):raise RuntimeError('Missing local import '+m)
  return
 seen.add(m)
 for line in p.read_text().splitlines():
  match=re.match(r'^\s*(?:public\s+)?import\s+(.+)',line)
  if match:
   for dep in match.group(1).split('--')[0].split():visit(dep)
 order.append(m)
for m in roots:visit(m)
sources={m:{'path':m.replace('.','/')+'.lean','sha256':hashlib.sha256((w/(m.replace('.','/')+'.lean')).read_bytes()).hexdigest()} for m in order}
all_local=[p.relative_to(w).as_posix() for name in ['Tuza','Tuza06','Tuza23','Tuza24'] for p in (w/name).rglob('*.lean')]
accepted={x['path'] for x in sources.values()}
r={'frozen_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'roots':roots,'source_status':'FROZEN_FOR_INDEPENDENT_VERIFICATION','order':order,'sources':sources,'copied_but_not_accepted_in_this_mission':sorted(set(all_local)-accepted),'spec_sha256':hashlib.sha256((w/'THEOREM_SPEC.md').read_bytes()).hexdigest(),'target_list_sha256':hashlib.sha256((w/'operations/audit_targets.json').read_bytes()).hexdigest()}
(w/'operations/accepted_source_freeze.json').write_text(json.dumps(r,indent=2)+'\n')
(w/'operations/accepted_build_order.json').write_text(json.dumps(order,indent=2)+'\n')
print(json.dumps({'frozen_utc':r['frozen_utc'],'accepted_modules':len(order),'accepted_tuza24_modules':len([m for m in order if m.startswith('Tuza24.')]),'unimported_provenance_files':len(r['copied_but_not_accepted_in_this_mission'])}))
