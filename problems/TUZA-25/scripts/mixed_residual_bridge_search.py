"""Bounded exact test of resilience descent at genuine fresh triangle/K4 leaves."""
from mixed_exact import Graph,cliques,solve
from functools import lru_cache
from itertools import combinations
import networkx as nx,json,time,signal,collections
class Timeout(Exception):pass
signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Timeout()))

def profile(G):
 ts=G.triangles;conf=[sum(1<<j for j,u in enumerate(ts) if t&u) for t in ts];hits=[sum(1<<j for j,t in enumerate(ts) if t>>e&1) for e in range(len(G.edges))]
 @lru_cache(None)
 def pack(A):
  if not A:return ()
  js=[j for j in range(len(ts)) if A>>j&1]
  for j in js:
   if conf[j]&A==1<<j:return (j,)+pack(A^(1<<j))
  j=max(js,key=lambda j:(conf[j]&A).bit_count());p=(j,)+pack(A&~conf[j]);q=pack(A^(1<<j));return p if len(p)>=len(q) else q
 full=(1<<len(ts))-1;p=pack(full);cover=solve(G)
 deletes=[len(pack(full&~h)) for h in hits]
 return {'nu':len(p),'tau':cover['tau'],'defect':2*len(p)-cover['tau'],'resilient':all(x==len(p) for x in deletes),'deletion_nu':deletes,'packing':list(p),'cover':cover['cover']}

start=time.time();counts=collections.Counter();rows=[];failures=[];byhash={};front=[];gid=0
for s in [4,5]:
 G=cliques(s,[range(s)]);p=profile(G);front.append((G,p,{'root':s,'steps':[]}));counts['roots']+=1
for depth in range(1,6):
 nxt=[]
 for H,hp,hcert in front:
  for a,s in [(3,4),(3,5),(4,5)]:
   if H.n+s-a>10:continue
   for A in combinations(range(H.n),a):
    if not all(e in H.eid for e in combinations(A,2)):continue
    Q=A+tuple(range(H.n,H.n+s-a));G=Graph(H.n+s-a,H.edges+tuple(combinations(Q,2)))
    ng=nx.Graph();ng.add_nodes_from(range(G.n));ng.add_edges_from(G.edges);key=(G.n,len(G.edges),nx.weisfeiler_lehman_graph_hash(ng))
    # Keep distinct predecessor responses even if final graph is isomorphic.
    cert={'root':hcert['root'],'steps':hcert['steps']+[{'clique':Q,'overlap':A}]}
    same=next((row for gg,row in byhash.get(key,[]) if nx.is_isomorphic(ng,gg)),None)
    if same is not None:p=same['child']
    else:
     counts['distinct_children']+=1
     try:
      signal.setitimer(signal.ITIMER_REAL,2.0);p=profile(G)
     except Timeout:counts['UNKNOWN_timeout']+=1;continue
     finally:signal.setitimer(signal.ITIMER_REAL,0)

     if p['defect'] in [1,2] and not p['resilient']:
      for t in G.triangles:
       if all(p['deletion_nu'][i]<p['nu'] for i in range(len(G.edges)) if t>>i&1):counts['critical_triangle_low_defect_states']+=1;break
     row={'n':G.n,'edges':G.edges,'child':p,'certificate':cert};byhash.setdefault(key,[]).append((ng,row));nxt.append((G,p,cert));rows.append(row)
    counts['leaf_presentations']+=1
    if p['resilient']:counts['final_resilient']+=1
    if p['resilient'] and p['defect']==1:counts['final_defect_one_resilient']+=1
    if p['resilient'] and not hp['resilient']:
     item={'parent_n':H.n,'parent_edges':H.edges,'parent':hp,'child_n':G.n,'child_edges':G.edges,'child':p,'overlap':A,'new_clique':Q,'certificate':cert}
     failures.append(item);counts['resilience_descent_failures']+=1
     if p['defect']==1:counts['defect_one_descent_failures']+=1;print('DEFECT_ONE_DESCENT_FAILURE',json.dumps(item),flush=True)
    if time.time()-start>240:break
   if time.time()-start>240:break
  if time.time()-start>240:break
 front=nxt;print('depth',depth,'front',len(front),dict(counts),'seconds',time.time()-start,flush=True)
 if time.time()-start>240 or not front:break
counts['critical_triangle_low_defect_states']+=0
out={'status':'BOUNDED_SEARCH_COMPLETED','counts':dict(counts),'seconds':time.time()-start,'universe':'roots K4/K5; fresh attachments K4 along triangle, K5 along triangle/K4; <=10 vertices; <=5 attachments; 240s wall guard, 2s per new graph exact solve; isomorphic child dedup retains all predecessor profiles','descent_failures':failures,'graphs':rows}

# Keep compact graph identities/profiles plus decisive low-order witnesses; avoid duplicate bulk.
keep=[]; seen_types=set()
for z in sorted(failures,key=lambda z:(z['child_n'],len(z['child_edges']),z['child']['defect'])):
 key=(len(z['overlap']),len(z['new_clique']),z['child']['defect'])
 if key not in seen_types: keep.append(z);seen_types.add(key)
out['descent_failure_count']=len(failures);out['descent_failures']=keep
out['graphs']=[{'n':z['n'],'graph6':Graph(z['n'],z['edges']).graph6(),'m':len(z['edges']),'nu':z['child']['nu'],'tau':z['child']['tau'],'defect':z['child']['defect'],'resilient':z['child']['resilient'],'certificate':z['certificate']} for z in rows]
json.dump(out,open('evidence/mixed_residual_bridge_search.json','w'),separators=(',',':'))
print('DONE',dict(counts),'failures',len(failures),flush=True)
