"""Independent generation and exact re-solution of the twelve named support interfaces."""
from mixed_exact import Graph,cliques,solve
from itertools import combinations
import json,time,signal,collections
class Timeout(Exception):pass
signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Timeout()))
start=time.time();seeds={}
for leaves in range(1,4):
 for fives in range(leaves+1):
  sizes=[4]*(leaves-fives)+[5]*fives;n=4;pieces=[tuple(range(4))]
  for i,s in enumerate(sizes,1):pieces.append((0,i)+tuple(range(n,n+s-2)));n+=s-2
  seeds['central_K4_star_'+''.join(map(str,sizes))]=cliques(n,pieces)
seeds['two_K5_edge']=cliques(8,[(0,1,2,3,4),(0,1,5,6,7)])
seeds['W5']=Graph(6,[(i,(i+1)%5) for i in range(5)]+[(i,5) for i in range(5)])
seeds['K5-e']=Graph(5,[e for e in combinations(range(5),2) if e!=(3,4)])
author_seeds=json.load(open('evidence/residual_edge_exchange_seeds.json'))
assert set(seeds)=={r['name'] for r in author_seeds}
for r in author_seeds:assert seeds[r['name']].n==r['n'] and set(seeds[r['name']].edges)==set(map(tuple,r['edges']))
expected=json.load(open('evidence/residual_edge_exchange.json'));author={(r['seed'],tuple(r['inserted'])):r for r in expected['rows']}
rows=[];counts=collections.Counter();covered=set()
for name,R in seeds.items():
 for e in combinations(range(R.n),2):
  if e in R.eid:continue
  key=(name,e);covered.add(key);G=Graph(R.n,R.edges+(e,));row={'seed':name,'inserted':e}
  try:
   signal.setitimer(signal.ITIMER_REAL,8.0);r=solve(G);row.update({'status':'EXACT','nu':r['nu'],'tau':r['tau']});counts['exact']+=1
   assert (r['nu'],r['tau'])==(author[key]['nu'],author[key]['tau'])
   if 2*r['nu']-r['tau']==2:
    counts['defect_two']+=1
    quads=[set(Q) for Q in combinations(range(G.n),4) if all(f in G.eid for f in combinations(Q,2))]
    completed=all(any(set(T)<=Q for Q in quads) for T in G.vertices)
    crit=[f for i,f in enumerate(G.edges) if solve(G,D=1<<i)['nu']<r['nu']]
    allcrit=[T for T in G.vertices if all(f in crit for f in combinations(T,2))]
    row.update({'all_triangles_K4':completed,'critical_edges':crit,'critical_triangles':allcrit})
    assert completed==author[key]['all_triangles_in_K4']
    assert crit==list(map(tuple,author[key]['critical_edges']))
    assert allcrit==list(map(tuple,author[key]['all_critical_triangles']))
    if completed:counts['completed_defect_two']+=1
    counts['critical_triangles']+=len(allcrit)
  except Timeout:row['status']='UNKNOWN_TIMEOUT';counts['UNKNOWN_TIMEOUT']+=1
  finally:signal.setitimer(signal.ITIMER_REAL,0)
  rows.append(row)
assert covered==set(author)
result={'status':'VERIFIED_FINITE' if not counts['UNKNOWN_TIMEOUT'] else 'PARTIAL_UNKNOWN','method':'independently generated 12 explicit models and every nonedge; actual triangles and K4s reconstructed; independent exact footprint recursions re-solved nu,tau; all deletion optima re-solved for defect-two survivors','counts':dict(counts),'models':len(seeds),'nonedges':len(covered),'seconds':time.time()-start,'rows':rows}
json.dump(result,open('evidence/mixed_named_interface_verification.json','w'),indent=2)
print(json.dumps({k:v for k,v in result.items() if k!='rows'},indent=2))
