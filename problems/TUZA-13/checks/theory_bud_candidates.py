#!/usr/bin/env python3
"""All 64 K4-completion subsets of six specified edge-disjoint triangles."""
from pathlib import Path
import json,hashlib
W=Path(__file__).resolve().parents[1]
x=json.loads((W/'witnesses/theory_tau_drop.json').read_text());es=x['input']['edges'];C=x['minimum_C'];P=[[3,6,8],[2,5,6],[1,4,5],[0,4,7],[0,2,8],[1,2,3]]
cs={tuple(e) for e in C};out=[]
for mask in range(64):
 E=es[:];Co=C[:];v=9;added=[]
 for i,t in enumerate(P):
  if mask>>i&1:
   E=E+[[u,v] for u in t]
   r=next(e for e in cs if set(e)<set(t));opposite=next(u for u in t if u not in r)
   Co=Co+[[opposite,v]];added.append({'triangle':t,'new_vertex':v});v+=1
 out.append({'name':f'tau_drop_K4buds_{mask:02d}','n':v,'edges':sorted(E),'rule':'K4 completion on selected subset of specified six edge-disjoint eligible triangles; all 64 subsets','mask':mask,'attached':added,'designated_candidate_cover':sorted(Co),'candidate_cover_warning':'Cover is verified by construction, minimum status must be adjudicated.'})
p=W/'evidence/theory_bud_candidates.json';p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'count':len(out),'sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'path':str(p)}))
