from apex_probe import Exact,ROOT
import networkx as nx,json,time,hashlib
from pathlib import Path
start=time.time();bad=[];tight=[]
for idx,g in enumerate(nx.graph_atlas_g()):
 ex=Exact(g)
 if not ex.all:continue
 p=ex.pack(ex.all);t=ex.cover(ex.all)
 if t!=2*p:continue
 seen={0};todo=[0]
 while todo:
  j=todo.pop()
  for k in range(len(ex.tris)):
   if k not in seen and ex.tm[j]&ex.tm[k]:seen.add(k);todo.append(k)
 if len(seen)!=len(ex.tris):continue
 support=set().union(*(set(x) for x in ex.tris));edges=set().union(*(set(__import__('itertools').combinations(x,2)) for x in ex.tris))
 row=dict(index=idx,vertices=sorted(g),edges=ex.edges,triangles=ex.tris,nu=p,tau=t,support_vertices=len(support),support_edges=len(edges))
 tight.append(row)
 if not (len(support) in [4,5] and len(edges)==len(support)*(len(support)-1)//2):bad.append(row)
result=dict(domain='installed atlas through7 vertices; exact equality cases with one shared-edge triangle component',tight_cases=tight,counterexamples=bad,elapsed=time.time()-start,script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_equality_skeleton.json').write_text(json.dumps(result,indent=2));print('tight',len(tight),'counterexamples',len(bad),'elapsed',time.time()-start)
if bad:print(json.dumps(bad[0]))
