#!/usr/bin/env python3
"""Two literal positive canonical-cycle controls; no optimization is used."""
from itertools import combinations
from pathlib import Path
import json,platform
assert platform.system()=='Darwin'
controls=[
 ('k33',6,[(u,v) for u in range(3) for v in range(3,6)],
 [((0,10),1),((0,16),0),((1,4),1),((1,7),0),((2,9),1),((2,20),0),((3,5),1),((3,11),0),((4,18),0),((5,12),0),((6,14),1),((6,15),0),((7,18),1),((8,13),1),((8,19),0),((9,10),0),((11,12),1),((13,14),0),((15,16),1),((19,20),1)],
 {'solver_discovery_seconds':0.005140332999872044,'cnf_sha256':'75dd2fe95931344a3b69cb4e709bc088d68b3d41bc71bc076e718da13e1a0c6a'}),
 ('petersen',10,sorted({tuple(sorted(e)) for i in range(5) for e in [(i,(i+1)%5),(i,i+5),(i+5,5+(i+2)%5)]}),
 [((0,16),1),((0,18),0),((1,15),1),((1,23),0),((2,25),0),((2,26),1),((3,17),0),((3,19),1),((4,27),1),((4,28),0),((5,19),0),((5,21),1),((6,14),0),((6,29),1),((7,22),1),((7,24),0),((8,31),0),((8,32),1),((9,33),0),((9,34),1),((10,25),1),((10,26),0),((11,31),1),((11,32),0),((12,27),0),((12,28),1),((13,33),1),((13,34),0),((14,30),1),((15,16),0),((17,18),1),((21,22),0),((23,24),1),((29,30),0)],
 {'solver_discovery_seconds':0.1963679580076132,'cnf_sha256':'1beec10a8d0b21ebb93d5de5daf42a482d0ee722fef6ee434a727b37c8663db1'})
]
results=[]
for name,nroot,root_edges,colored,discovery in controls:
 base=root_edges+[(v,nroot+2*v+i) for v in range(nroot) for i in (0,1)]
 blocks=[[j for j,e in enumerate(base) if v in e] for v in range(nroot)]
 assert all(len(b)==5 for b in blocks)
 n=len(base);assert n%2==1
 E={tuple(e) for b in blocks for e in combinations(b,2)}
 T=[t for t in combinations(range(n),3) if all(tuple(e) in E for e in combinations(t,2))]
 assert all(len(set(a)&set(b))<=1 for a,b in combinations(blocks,2))
 assert all(sum(set(t)<=set(b) for b in blocks)==1 for t in T)
 assert len(E)==10*nroot and len(T)==10*nroot
 F={e for e,c in colored};assert len(F)==len(colored)==n-1 and F<=E
 for color in (0,1):
  vertices=[v for e,c in colored if c==color for v in e]
  assert len(vertices)==len(set(vertices))
 for b in blocks:
  used={v for e in F if set(e)<=set(b) for v in e}
  assert len(used)<=4
 adj={v:set() for v in range(n)}
 for u,v in F:adj[u].add(v);adj[v].add(u)
 assert set(map(len,adj.values()))<={0,2}
 seen=set();components=[]
 for v in range(n):
  if v in seen:continue
  comp={v};stack=[v];seen.add(v)
  while stack:
   x=stack.pop()
   for y in adj[x]:
    if y not in seen:seen.add(y);comp.add(y);stack.append(y)
  if len(comp)>1:assert len(comp)%2==0 and len(comp)>=4
  components.append(sorted(comp))
 results.append({'name':name,'status':'PASS literal positive certificate','root_edges':root_edges,'augmented_root_edges':base,'vertices':n,'blocks':blocks,'edges':sorted(E),'triangles':T,'canonical_maximum':n-1,'colored_state':colored,'components':components,'isolated':[v for v in range(n) if not adj[v]],'ordinary_upper_bound':'odd order forbids a spanning union of even cycles; maximum degree2 implies at most n edges, so at most n-1','discovery':discovery})
out=Path(__file__).resolve().parents[1]/'evidence/global_routes/k5_cycle_controls.json'
out.write_text(json.dumps({'status':'PASS two fixed controls; no all-size theorem','controls':results},indent=2)+'\n')
print(json.dumps([{'name':r['name'],'n':r['vertices'],'m':r['canonical_maximum'],'component_sizes':list(map(len,r['components'])),'isolated':r['isolated']} for r in results]))
