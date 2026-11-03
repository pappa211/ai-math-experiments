#!/usr/bin/env python3
from pathlib import Path
import json
import search
W=Path(__file__).resolve().parents[1]
data=json.loads((W/'evidence/theory_bud_candidates.json').read_text())
search.generators=lambda stage,seed:iter(data)
search.run('theory_buds',180,2,20000,131102)
rows=[]
for line in (W/'evidence/search_theory_buds.jsonl').read_text().splitlines():
 r=json.loads(line);i=r['input'];C=i['designated_candidate_cover'];d={'name':i['name'],'designated_cover_size':len(C),'search_status':r['status']}
 if 'tau' in r:d.update(tau=r['tau'],designated_is_minimum=len(C)==r['tau'])
 if r['status']=='EXACT' and len(C)==r['tau']:
  rec=next((z for z in r['records'] if z['cover']==C),None)
  if rec:d.update(eligible_nu=rec['eligible_nu'],D=rec['D'],eligible_packing=rec['eligible_packing'])
  else:d['designated_cover_evaluation']='not in tested optimum prefix'
 rows.append(d)
(W/'evidence/theory_bud_designated.json').write_text(json.dumps(rows,indent=2)+'\n')
