from pathlib import Path
import itertools,json,sys
from residual_oracle import Exact,clique,edge
W=Path(__file__).resolve().parents[1]

def check(n,E,label):
 X=Exact(n,E);p,c=X.values();T=X.T
 parent=list(range(3*len(T)))
 def find(x):
  while parent[x]!=x:parent[x]=parent[parent[x]];x=parent[x]
  return x
 def join(x,y):parent[find(x)]=find(y)
 te=[sorted(clique(t)) for t in T];forced=[]
 for i,j in itertools.combinations(range(len(T)),2):
  common=set(te[i])&set(te[j])
  if not common:continue
  e=next(iter(common));Q=X.pack(X.without(set(te[i])|set(te[j])))
  if len(Q)==p-1:
   join(3*i+te[i].index(e),3*j+te[j].index(e))
   forced.append({'triangles':[i,j],'edge':e,'outside_packing':[T[k] for k in Q]})
 adj={find(i):set() for i in range(3*len(T))}
 loop=False
 for i,t in enumerate(T):
  vs=[find(3*i+j) for j in range(3)]
  for a,b in itertools.combinations(vs,2):
   if a==b:loop=True
   adj[a].add(b);adj[b].add(a)
 col={};nodes=0
 def color():
  nonlocal nodes
  nodes+=1
  if len(col)==len(adj):return dict(col)
  v=max((v for v in adj if v not in col),key=lambda v:(len({col[x] for x in adj[v] if x in col}),len(adj[v])))
  used={col[x] for x in adj[v] if x in col}
  for c in range(3):
   if c in used:continue
   col[v]=c;r=color()
   if r is not None:return r
   del col[v]
  return None
 result=None if loop else color()
 out={'label':label,'n':n,'edges':sorted(E),'triangles':T,'nu':p,'tau':c,'maximum_packing':[T[i] for i in X.pack(X.full)],'minimum_cover':[X.E[i] for i in X.cover(X.full)],'forced_equalities':forced,'color_vertices':len(adj),'color_edges':sum(map(len,adj.values()))//2,'three_coloring':result,'color_search_nodes':nodes,'role_obstruction_certified_by_forced_constraints':result is None,'status':'EXACT_COMPLETED'}
 X.clear();return out
E=clique(range(5));out=[check(5,E,'K5')]
E={edge(i,(i+1)%5) for i in range(5)}|{edge(i,j) for i in range(5) for j in [5,6]}|{(5,6)}
out.append(check(7,E,'K2_join_C5'))
(W/'evidence/role_forced_constraints.json').write_text(json.dumps(out,indent=2)+'\n')
for x in out:print({k:x[k] for k in ['label','nu','tau','color_vertices','color_edges','color_search_nodes','role_obstruction_certified_by_forced_constraints']})
