#!/usr/bin/env python3
"""Exactly the proved rainbow-number-two kernel for the vertex-cover strengthening."""
from pathlib import Path
from itertools import combinations
import json,time,hashlib
from fresh_rainbow_resource_gate_search import build
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/fresh_rainbow_vertex_gate';OUT.mkdir(exist_ok=True,parents=True)
start=time.monotonic();cases=[];witness=None
for n in range(8,13):
 for c in range(max(5,(n+1)//2),n+1):
  if time.monotonic()-start>=180:break
  f,x,es=build(n,c,mixed_lower=0)
  for vv in combinations(range(n),4):
   outside=[j for j,e in enumerate(es) if not set(e)&set(vv)]
   f.add(*(x[i][j] for i in range(2*c) for j in outside))
  r=f.solve(min(20,180-(time.monotonic()-start)))
  if r['status']=='SAT':
   pos=r.pop('positive');chosen=[es[next(j for j,v in enumerate(row) if v in pos)] for row in x]
   assert len(set(chosen))==2*c
   assert all(not set(chosen[2*j])&set(chosen[2*j+1]) for j in range(c))
   assert not any(set(combinations(t,2))<=set(chosen) for t in combinations(range(n),3))
   assert not any(len({i//2,j//2,k//2})==3 and len(set(chosen[i]+chosen[j]+chosen[k]))==6 for i,j,k in combinations(range(2*c),3))
   assert len(set(chosen[0]+chosen[2]))==4
   assert not any(all(set(e)&set(vv) for e in chosen) for vv in combinations(range(n),4))
   tau=next(s for s in range(5,n+1) if any(all(set(e)&set(vv) for e in chosen) for vv in combinations(range(n),s)))
   witness={'n':n,'colors':c,'edges':chosen,'color_of_edge':[i//2 for i in range(2*c)],'nu_r':2,'tau_vertex':tau}
   r['literal_witness']=witness
  r.update(n=n,colors=c);cases.append(r);print(json.dumps({k:v for k,v in r.items() if k!='literal_witness'}),flush=True)
  if r['status']!='UNSAT':break
 if cases and cases[-1]['status']!='UNSAT':break
status='COUNTEREXAMPLE_LITERAL' if witness else ('ALL_28_UNSAT_SOLVER_ONLY' if len(cases)==28 and all(r['status']=='UNSAT' for r in cases) else 'UNKNOWN_INCOMPLETE')
result={'status':status,'seconds':time.monotonic()-start,'cases':cases,'witness':witness,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'scope':'Exactly the proved nu_r=2 minimal-counterexample kernel; no nu_r=3 expansion; UNSAT solver-only.'}
(OUT/'kernel_receipt.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'status':status,'cases':len(cases),'seconds':result['seconds']}))
