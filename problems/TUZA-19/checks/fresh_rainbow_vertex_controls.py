#!/usr/bin/env python3
"""Two fixed K4-subdivision targets and two semantic SAT controls; no graph census."""
from pathlib import Path
from itertools import combinations
import hashlib,json
from fresh_rainbow_resource_gate_search import build
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/fresh_rainbow_vertex_gate';OUT.mkdir(exist_ok=True,parents=True)
def tau(n,E):
 return next(k for k in range(n+1) if any(all(set(e)&set(S) for e in E) for S in combinations(range(n),k)))
def pairings(E,xs):
 if not xs:yield [];return
 x=xs[0]
 for j in range(1,len(xs)):
  y=xs[j]
  if set(E[x])&set(E[y]):continue
  for p in pairings(E,xs[1:j]+xs[j+1:]):yield [(x,y)]+p
fixed=[]
for n,E in [(8,[(0,4),(4,5),(1,5),(2,6),(6,7),(3,7),(0,2),(0,3),(1,2),(1,3)]),(9,[(0,4),(1,4),(2,5),(5,6),(3,6),(0,2),(0,3),(1,2),(1,3),(7,8)])]:
 E=sorted(E);triples=[t for t in combinations(range(10),3) if len(set(v for i in t for v in E[i]))==6];cert=[]
 for p in pairings(E,list(range(10))):
  witness=next((t for t in triples if not any(a in t and b in t for a,b in p)),None)
  assert witness is not None
  cert.append({'pairs':p,'rainbow_triple':witness})
 fixed.append({'n':n,'edges':E,'tau_vertex':tau(n,E),'proper_pairings':len(cert),'ordinary_matching_triples':len(triples),'certificates':cert})
controls=[]
for n,c,tf,lower in [(8,5,False,5),(8,4,True,4)]:
 f,x,es=build(n,c,triangle_free=tf,mixed_lower=0)
 for vv in combinations(range(n),lower-1):
  outside=[j for j,e in enumerate(es) if not set(e)&set(vv)]
  f.add(*(x[i][j] for i in range(2*c) for j in outside))
 r=f.solve(10);assert r['status']=='SAT';pos=r.pop('positive');E=[es[next(j for j,v in enumerate(row) if v in pos)] for row in x]
 assert len(set(E))==2*c and all(not set(E[2*j])&set(E[2*j+1]) for j in range(c))
 assert not any(len({i//2,j//2,k//2})==3 and len(set(E[i]+E[j]+E[k]))==6 for i,j,k in combinations(range(2*c),3))
 assert len(set(E[0]+E[2]))==4 and tau(n,E)==lower
 triangles=[t for t in combinations(range(n),3) if set(combinations(t,2))<=set(E)]
 assert not tf or not triangles
 controls.append({'n':n,'colors':c,'triangle_free_required':tf,'tau_vertex':lower,'nu_r':2,'edges':E,'color_of_edge':[i//2 for i in range(2*c)],'triangles':triangles,'solver':r})
result={'status':'PASS','fixed_targets':fixed,'semantic_controls':controls,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(OUT/'controls.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','fixed_targets':[{k:v for k,v in d.items() if k not in ['certificates','edges']} for d in fixed],'controls':[{k:v for k,v in d.items() if k not in ['edges','color_of_edge','triangles']} for d in controls]},indent=2))
