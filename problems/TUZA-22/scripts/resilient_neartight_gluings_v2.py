"""Bounded targeted literal clique-overlap probe; NOT an exhaustive classification."""
import itertools,json,random,signal,time
from functools import lru_cache
from pathlib import Path
R=Path(__file__).resolve().parents[1]
start=time.monotonic(); DEADLINE=225; rng=random.Random(22111605)
rows=[]; hits=[]; seen=set(); processed=0; unknown=0

def clique(v):return {tuple(sorted(e)) for e in itertools.combinations(v,2)}
def alarm(*_):raise TimeoutError
signal.signal(signal.SIGALRM,alarm)

def exact(n,E):
 E=sorted(E);ei={e:i for i,e in enumerate(E)}
 T=[t for t in itertools.combinations(range(n),3) if clique(t)<=set(E)]
 tm=[sum(1<<ei[e] for e in clique(t)) for t in T]
 H=[sum(1<<i for i,t in enumerate(tm) if t>>e&1) for e in range(len(E))]
 C=[sum(1<<j for j,u in enumerate(tm) if t&u) for t in tm]; full=(1<<len(T))-1
 @lru_cache(maxsize=90000)
 def pack(s):
  if not s:return 0
  ids=[i for i in range(len(T)) if s>>i&1]
  for j in ids:
   if C[j]&s==1<<j:return 1+pack(s&~(1<<j))
  j=max(ids,key=lambda i:(C[i]&s).bit_count())
  return max(1+pack(s&~C[j]),pack(s&~(1<<j)))
 @lru_cache(maxsize=90000)
 def cover(s):
  if not s:return 0
  ids=[i for i in range(len(T)) if s>>i&1]
  j=max(ids,key=lambda i:max((H[e]&s).bit_count() for e in range(len(E)) if tm[i]>>e&1))
  return 1+min(cover(s&~H[e]) for e in range(len(E)) if tm[j]>>e&1)
 nu=pack(full);tau=cover(full)
 out={'n':n,'edge_count':len(E),'triangle_count':len(T),'nu':nu,'tau':tau,'defect':2*nu-tau}
 if out['defect']!=1:return out
 out['edge_nu']=[pack(full&~h) for h in H]
 out['resilient']=all(p==nu for p in out['edge_nu'])
 if not out['resilient']:return out
 out['cover_ineligible']=[E[i] for i,h in enumerate(H) if 1+cover(full&~h)>tau]
 reach=1 if T else 0
 while True:
  more=reach
  for i in range(len(T)):
   if reach>>i&1:more|=C[i]
  if more==reach:break
  reach=more
 out['triangle_connected']=reach==full
 out['edges']=E
 return out

seeds=[]
def seed(name,n,E):
 z=exact(n,E);z['name']=name;seeds.append((name,n,E,z))
seed('W5',6,{tuple(sorted((0,i))) for i in range(1,6)}|{tuple(sorted((i,1+i%5))) for i in range(1,6)})
seed('twoK4edge',6,clique(range(4))|clique([0,1,4,5]))
seed('K4K5edge',7,clique(range(4))|clique([0,1,4,5,6]))
seed('twoK5edge',8,clique(range(5))|clique([0,1,5,6,7]))
seed('K5minus01',5,clique(range(5))-{(0,1)})
seed('twoK4plusK4',8,clique(range(4))|clique([0,1,4,5])|clique([0,2,6,7]))
seed('twoK4plusK5',9,clique(range(4))|clique([0,1,4,5])|clique([0,2,6,7,8]))

def save(status):
 data={'identity':'TUZA22 targeted overlap construction probe v2','status':status,'seed':22111605,'internal_seconds_cap':DEADLINE,'per_instance_seconds':.9,'elapsed_seconds':time.monotonic()-start,'processed':processed,'unknown':unknown,'seed_graphs':[z for _,_,_,z in seeds],'hits':hits,'rows':rows,'scope':'Sampled literal K4/K5 completion on3-4 existing vertices with fresh remaining vertices; actual triangles rebuilt. Not exhaustive; no unbounded claim from finite survivors.'}
 (R/'evidence/resilient_neartight_gluings_v2.json').write_text(json.dumps(data,indent=2)+'\n')

jobs=[]
for name,n,E,z in seeds:
 for s,r in [(4,3),(5,3),(5,4)]:
  for S in itertools.combinations(range(n),r):jobs.append((name,n,E,z['nu'],s,S))
rng.shuffle(jobs)
for name,n,E,oldnu,s,S in jobs:
 if time.monotonic()-start>DEADLINE:break
 nn=n+s-len(S);EE=E|clique(list(S)+list(range(n,nn)));key=(nn,tuple(sorted(EE)))
 if key in seen:continue
 seen.add(key);processed+=1
 try:
  signal.setitimer(signal.ITIMER_REAL,.9)
  z=exact(nn,EE)
  signal.setitimer(signal.ITIMER_REAL,0)
  row={'seed':name,'clique_size':s,'shared_vertices':S,'nu':z['nu'],'tau':z['tau'],'resilient':z.get('resilient'),'ineligible_count':len(z.get('cover_ineligible',[]))}
  if z['defect']==1 and z.get('resilient') and z.get('triangle_connected') and z['nu']>oldnu:
   fresh=[e for e in z['cover_ineligible'] if tuple(e) not in E]
   row['fresh_ineligible']=fresh
   if fresh:
    z.update({'parent_seed':name,'clique_size':s,'shared_vertices':S,'fresh_ineligible':fresh,'old_nu':oldnu});hits.append(z)
    print('STRUCTURAL_HIT',name,s,S,z['nu'],z['tau'],fresh,flush=True)
    rows.append(row);save('STOPPED_ON_FRESH_INELIGIBLE_PATTERN');break
  rows.append(row)
 except TimeoutError:
  signal.setitimer(signal.ITIMER_REAL,0);unknown+=1
  rows.append({'seed':name,'clique_size':s,'shared_vertices':S,'status':'UNKNOWN_INSTANCE_TIMEOUT'})
 if processed%100==0:save('RUNNING');print('progress',processed,'unknown',unknown,'seconds',round(time.monotonic()-start,2),flush=True)
else:
 save('COMPLETED_TARGETED_LIST')
if hits:save('STOPPED_ON_FRESH_INELIGIBLE_PATTERN')
elif time.monotonic()-start>DEADLINE:save('INTERNAL_DEADLINE_PARTIAL')
else:save('COMPLETED_TARGETED_LIST')
print('done',processed,'unknown',unknown,'hits',len(hits),'elapsed',time.monotonic()-start,flush=True)
