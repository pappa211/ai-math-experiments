from residual_oracle import *
from residual_family_certificates import certify_F
from pathlib import Path
import json,time,signal,collections,resource
class Timeout(Exception):pass
def alarm(*a):raise Timeout()
signal.signal(signal.SIGALRM,alarm)
seeds=[]
for L in [(4,),(5,),(4,4),(4,5),(5,5),(4,4,4),(4,4,5),(4,5,5),(5,5,5)]:
 n,E,Q=star(L);seeds.append({'name':'central_K4_star_'+''.join(map(str,L)),'n':n,'edges':sorted(E),'pieces':Q})
seeds.append({'name':'two_K5_edge','n':8,'edges':sorted(clique(range(5))|clique([0,1,5,6,7])),'pieces':[list(range(5)),[0,1,5,6,7]]})
seeds.append({'name':'W5','n':6,'edges':sorted({edge(i,(i+1)%5) for i in range(5)}|{edge(i,5) for i in range(5)})})
seeds.append({'name':'K5-e','n':5,'edges':sorted(clique(range(5))-{(3,4)})})
assert len(seeds)==12
Path('evidence/residual_edge_exchange_seeds.json').write_text(json.dumps(seeds,indent=2)+'\n')
counts=collections.Counter();rows=[];transitions=[];start=time.time()
for seed in seeds:
 n=seed['n'];E=set(map(tuple,seed['edges']));X=Exact(n,E);p,c=X.values();assert c==2*p-1 and X.connected();assert all(len(X.pack(X.without([e])))==p for e in E);X.clear();counts['seeds_verified']+=1
 for e in sorted(clique(range(n))-E):
  counts['nonedge_presentations']+=1;J=E|{e};Y=None;t=time.time()
  try:
   signal.setitimer(signal.ITIMER_REAL,10);Y=Exact(n,J);new=[T for T in Y.T if e in clique(T)]
   row={'seed':seed['name'],'n':n,'inserted':e,'edges':sorted(J),'new_triangles':new}
   if not new:
    counts['no_new_triangle']+=1;row['status']='NO_NEW_TRIANGLE';rows.append(row);continue
   counts['triangle_bearing_insertions']+=1;pp,cc=Y.values();row.update({'nu':pp,'tau':cc,'status':'EXACT','seconds':time.time()-t})
   if cc==2*pp-2:
    counts['defect_two_insertions']+=1
    Q4=[set(Q) for Q in combinations(range(n),4) if clique(Q)<=J]
    completion={T:next((sorted(Q) for Q in Q4 if set(T)<=Q),None) for T in Y.T};row['all_triangles_in_K4']=all(completion.values())
    if row['all_triangles_in_K4']:
     counts['accepted_K4_completed_defect_two']+=1;row['K4_completions']=[{'triangle':T,'clique':q} for T,q in completion.items()]
     critical=[f for f in Y.E if len(Y.pack(Y.without([f])))==pp-1];row['critical_edges']=critical;allcrit=[T for T in Y.T if clique(T)<=set(critical)];row['all_critical_triangles']=allcrit
     if allcrit:counts['has_all_critical_triangle']+=1
     for f in critical:
      K=J-{f};Z=Exact(n,K);r=Z.profile();counts['critical_deletion_transitions']+=1
      assert r['tau']==2*r['nu']-1 and r['one_edge_resilient'] and r['triangle_connected'] and r['all_edges_triangular']
      cert=certify_F(K);r.update({'from_seed':seed['name'],'inserted':e,'deleted':f,'F_certificate':cert,'status':'EXACT'})
      if cert['member']:counts['transition_F_members']+=1
      else:counts['transition_nonF']+=1
      if r['all_triangles_extend']:counts['transition_triangles_extend']+=1
      transitions.append(r);Z.clear()
   rows.append(row)
  except Timeout:
   counts['UNKNOWN_timeout']+=1;rows.append({'seed':seed['name'],'n':n,'inserted':e,'edges':sorted(J),'status':'UNKNOWN_timeout','seconds':time.time()-t})
  finally:
   signal.setitimer(signal.ITIMER_REAL,0)
   if Y:Y.clear()
 print(seed['name'],dict(counts),'seconds',round(time.time()-start,1),'rss',resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,flush=True)
Path('evidence/residual_edge_exchange.json').write_text(json.dumps({'counts':dict(counts),'seconds':time.time()-start,'maxrss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'rows':rows,'transitions':transitions},indent=2)+'\n');print('DONE',dict(counts),time.time()-start,flush=True)
