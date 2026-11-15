#!/usr/bin/env python3
"""Replay precisely the proved 28-domain kernel; no expansion permitted here."""
from pathlib import Path
import json,time,hashlib
from fresh_rainbow_resource_gate_search import build,verify
W=Path(__file__).resolve().parents[1]
start=time.monotonic();cases=[]
for n in range(8,13):
    for c in range(max(5,(n+1)//2),n+1):
        assert time.monotonic()-start<300,'overall 300-second replay budget exhausted'
        f,x,es=build(n,c);r=f.solve(min(10,300-(time.monotonic()-start)))
        if r['status']=='SAT':
            pos=r.pop('positive');chosen=[es[next(j for j,v in enumerate(row) if v in pos)] for row in x]
            r['edges']=chosen;r['literal_verification']=verify(n,c,chosen)
        r.update(n=n,colors=c);cases.append(r)
        print(json.dumps({'n':n,'colors':c,'status':r['status']}),flush=True)
        if r['status']!='UNSAT':break
    if cases[-1]['status']!='UNSAT':break
out={'scope':'Exactly the 28-domain nu_r=2 kernel; UNSAT solver-only','cases':cases,'seconds':time.monotonic()-start}
(W/'evidence/fresh_rainbow_resource_gate/kernel_replay.json').write_text(json.dumps(out,indent=2)+'\n')
assert len(cases)==28 and all(r['status']=='UNSAT' for r in cases)
