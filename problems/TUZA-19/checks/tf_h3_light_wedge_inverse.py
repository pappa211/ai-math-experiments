#!/usr/bin/env python3
"""One targeted strengthened inverse design: TF, H3 triangle-free, light wedge 012 with tips 3 and 4. Adapted from fresh_tf_light_wedge_inverse.py; not independent verification."""
from pathlib import Path
from itertools import combinations
import json,time,hashlib,datetime
from global_routes_sat import CNF,TriangleSAT
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/tf_h3_light_wedge';OUT.mkdir(exist_ok=True,parents=True)
n=9;es=list(combinations(range(n),2));eid={e:i for i,e in enumerate(es)};ts=list(combinations(range(n),3));tids=[[eid[e] for e in combinations(t,2)] for t in ts]
f=CNF(0);av=[f.var() for _ in es];tv=[f.var() for _ in ts]
for a,ids in zip(tv,tids):
 for e in ids:f.add(-a,av[e])
 f.add(a,*[-av[e] for e in ids])
for e in [(0,1),(0,2),(1,2),(0,3),(1,3),(0,4),(2,4)]:f.add(av[eid[e]])
for x in range(n):
 if x not in [0,1,2,3]:f.add(-av[eid[tuple(sorted((0,x)))]],-av[eid[tuple(sorted((1,x)))]])
 if x not in [0,1,2,4]:f.add(-av[eid[tuple(sorted((0,x)))]],-av[eid[tuple(sorted((2,x)))]])
# A heavy flag is forced whenever at least three actual pages use its edge.
# Optional extra true flags cannot admit an invalid graph; setting flags to the
# actual codegree>=3 predicate always satisfies these clauses.
heavy=[f.var() for _ in es]
for ei,e in enumerate(es):
 incident=[i for i,ids in enumerate(tids) if ei in ids]
 for trio in combinations(incident,3):f.add(heavy[ei],*[-tv[j] for j in trio])
for ti,ids in enumerate(tids):f.add(-tv[ti],*[-heavy[e] for e in ids])
# Choose a candidate common optimum size, bounded by a K9 cut complement.
sizes=list(range(3,17));sel={s:f.var() for s in sizes};f.add(*sel.values());f.atmost(list(sel.values()),1)
def counter(xs,k):
 prev=None
 for x in xs:
  row=[f.var() for _ in range(k)]
  if prev is None:
   f.add(-row[0],x);f.add(-x,row[0])
   for y in row[1:]:f.add(-y)
  else:
   y=row[0];a=prev[0];f.add(-a,y);f.add(-x,y);f.add(-y,a,x)
   for j in range(1,k):
    y=row[j];a=prev[j];b=prev[j-1]
    f.add(-a,y);f.add(-x,-b,y);f.add(-y,a,x);f.add(-y,a,b)
  prev=row
 return prev
coverrows=[]
for ti,t in enumerate(ts):
 row=[f.var() for _ in es];coverrows.append(row)
 for e,y in enumerate(row):f.add(-y,av[e])
 for e in tids[ti]:f.add(-tv[ti],row[e])
 for tj,ids in enumerate(tids):f.add(-tv[ti],-tv[tj],*[row[e] for e in ids])
 final=counter(row,17)
 for s in sizes:f.add(-sel[s],-tv[ti],-final[s])
# Degree-one resources cannot occur in TF. This is redundant but helpful.
for ei,e in enumerate(es):
 incident=[i for i,t in enumerate(tids) if ei in t]
 for ti in incident:f.add(-tv[ti],*[tv[tj] for tj in incident if tj!=ti])
start=time.monotonic();iterations=[];candidate=None;status='UNKNOWN_BUDGET'
while time.monotonic()-start<180:
 r=f.solve(min(120,180-(time.monotonic()-start)))
 meta={k:v for k,v in r.items() if k!='positive'}
 if r['status']!='SAT':status=r['status'];iterations.append(meta);break
 pos=r['positive'];target=next(s for s in sizes if sel[s] in pos)
 edges=[e for e,a in zip(es,av) if a in pos];g=TriangleSAT(n,edges)
 optimum=g.optimum_tau(timeout=min(10,180-(time.monotonic()-start)))
 meta.update(target=target,edges=len(edges),triangles=len(g.ts),optimum_status=optimum['status'])
 if optimum['status']!='EXACT_SOLVER':status='UNKNOWN_OPTIMUM';iterations.append(meta);break
 tau=optimum['value'];meta['tau']=tau;iterations.append(meta)
 print(json.dumps(meta),flush=True)
 if tau==target:
  witnesses=[]
  for ti,t in enumerate(ts):
   if tv[ti] in pos:
    C=[e for e,y in zip(es,coverrows[ti]) if y in pos]
    assert len(C)<=tau and set(combinations(t,2))<=set(C)
    assert all(set(combinations(tri,2))&set(C) for tri in g.triples)
    witnesses.append({'triangle':t,'cover':C})
  codeg={str(e):sum(set(e)<=set(t) for t in g.triples) for e in edges}
  assert codeg['(0, 1)']==codeg['(0, 2)']==2
  candidate={'n':n,'edges':edges,'triangles':g.triples,'tau':tau,'TF_witnesses':witnesses,'optimum_certificate':optimum,'codegrees':codeg};status='COUNTEREXAMPLE_TF_H3_SOLVER_LOWER';break
 # This smaller cover must fail in any later graph with target larger than tau.
 C=set(tuple(e) for e in optimum['cover'])
 outside=[tv[i] for i,t in enumerate(ts) if not set(combinations(t,2))&C]
 f.add(*[sel[s] for s in sizes if s<=tau],*outside)
result={'status':status,'n':n,'scope':'One n=9 distinct-tip TF + triangle-free H3 inverse domain; no graph census or larger domain. UNSAT/optimality are solver-only.','iterations':iterations,'seconds':time.monotonic()-start,'candidate':candidate,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'adapted_from':'checks/fresh_tf_light_wedge_inverse.py'}
(OUT/'inverse_n9.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({k:v for k,v in result.items() if k not in ['candidate','iterations']}),flush=True)
