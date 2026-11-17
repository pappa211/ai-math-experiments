"""Frozen complete named-support plus restored triangle domain, no optimizer.
Two complete families: all independent triples inside frozen C12; and every
internal nonedge ab plus one new triangle vertex c with independent old
neighbors I of size2 or3 disjoint from a,b. Necessary structural filters only.
"""
from pathlib import Path
from itertools import combinations
from collections import Counter
from datetime import datetime,timezone
import json,hashlib,platform,sys,time
root=Path(__file__).resolve().parents[1];start=time.monotonic()
seed_path=root/'inputs/C12_frozen.json';opening_path=root/'evidence/opening_checks.json'
seeds=json.loads(seed_path.read_text());opening=json.loads(opening_path.read_text());nu={r['name']:r['optimum']['nu'] for r in opening['models']}
def edge(u,v):return tuple(sorted((u,v)))
def triangle_edges(t):return set(combinations(sorted(t),2))
def triangles(n,E):return [t for t in combinations(range(n),3) if triangle_edges(t)<=E]
def parts(n,E,cut):
 live=set(range(n))-set(cut);adj={v:set() for v in live}
 for u,v in E:
  if u in live and v in live:adj[u].add(v);adj[v].add(u)
 out=[]
 while live:
  s=live.pop();p={s};stack=[s]
  while stack:
   u=stack.pop()
   for v in adj[u]&live:live.remove(v);p.add(v);stack.append(v)
  out.append(p)
 return out
def separator(n,E):
 for size in(0,1,2):
  for cut in combinations(range(n),size):
   ps=parts(n,E,cut)
   if len(ps)>1:return {'deleted_vertices':cut,'component':sorted(ps[0]),'other_vertices':sorted(set.union(*ps[1:]))}
 return None
rows=[];counts=Counter();model_counts={}
for C in seeds:
 name=C['name'];n=C['n'];E={tuple(e) for e in C['edges']};oldtri=triangles(n,E);mc=Counter()
 independent={k:[I for I in combinations(range(n),k) if not(triangle_edges(I)&E)] for k in(2,3,4)}
 assert not independent[4]
 cases=[]
 for T in independent[3]:cases.append(('all_inside',T,(),n,E|triangle_edges(T)))
 for ab in independent[2]:
  for size in(2,3):
   for I in independent[size]:
    if set(ab)&set(I):continue
    c=n;T=(*ab,c);Q=E|{ab}|{edge(c,v) for v in (*ab,*I)}
    cases.append(('one_outside',T,I,n+1,Q))
 for mode,T,I,nQ,Q in cases:
  S=triangle_edges(T);R=Q-S;QT=triangles(nQ,Q)
  assert triangles(nQ,R)==oldtri
  row={'model':name,'mode':mode,'T':T,'old_outside_neighbors':I,'n':nQ,'nu_C':nu[name]}
  counts[mode+'_raw']+=1;mc[mode+'_raw']+=1
  degrees={v:sum(v in e for e in Q) for v in range(nQ)}
  bad=next((v for v,d in degrees.items() if d<4),None)
  if bad is not None:row.update(status='REJECT_MIN_DEGREE',vertex=bad,degree=degrees[bad])
  else:
   supported=set.union(*(triangle_edges(t) for t in QT));missing=sorted(Q-supported)
   if missing:row.update(status='REJECT_UNSUPPORTED_EDGE',edge=missing[0])
   else:
    ordinary={s:[t for t in QT if triangle_edges(t)&S=={s}] for s in sorted(S)}
    inactive=next((s for s,P in ordinary.items() if not P),None)
    if inactive is not None:
     assert triangles(nQ,R|{inactive})==oldtri
     row.update(status='REJECT_TRIANGLE_PAIR_BLOCKER',inactive_restored_edge=inactive,deleted_pair=sorted(S-{inactive}))
    else:
     sep=separator(nQ,Q)
     if sep is not None:row.update(status='REJECT_VERTEX_SEPARATOR',separator=sep)
     else:row['status']='STRUCTURALLY_RETAINED'
  counts[row['status']]+=1;mc[row['status']]+=1;rows.append(row)
 model_counts[name]=dict(mc)
assert counts['all_inside_raw']==160
out={'status':'FROZEN_COMPLETE_TRIANGLE_RESTORATION_DOMAIN','utc':datetime.now(timezone.utc).isoformat(),'domain':__doc__,'counts':dict(counts),'model_counts':model_counts,'rows':rows,'sources':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in [seed_path,opening_path,Path(__file__)]},'python':sys.version,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-start,'processes':1,'solver_threads':0}
p=root/'evidence/matching26_triangle_domain.json';p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'counts':out['counts'],'seconds':out['elapsed_seconds']}));print(p)
