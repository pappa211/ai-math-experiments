"""Exact literal-graph finite discriminator, no third-party solver."""
import datetime,itertools,json,random,signal,time
from functools import lru_cache
from pathlib import Path
W=Path(__file__).resolve().parents[1]
def clique(v):return set(itertools.combinations(sorted(v),2))
def analyze(n,edges,cap=128):
 E=sorted(edges);ei={e:i for i,e in enumerate(E)}
 T=[t for t in itertools.combinations(range(n),3) if clique(t)<=edges]
 tm=[sum(1<<ei[e] for e in clique(t)) for t in T];full=(1<<len(T))-1
 edgehits=[sum(1<<i for i,t in enumerate(tm) if t>>e&1) for e in range(len(E))]
 @lru_cache(None)
 def cover(bits):
  if not bits:return 0
  j=(bits&-bits).bit_length()-1
  return 1+min(cover(bits&~edgehits[e]) for e in range(len(E)) if tm[j]>>e&1)
 tau=cover(full);Cs=set();partial=False
 def enum(bits,c):
  nonlocal partial
  if len(Cs)>=cap:partial=True;return
  if not bits:Cs.add(c);return
  j=(bits&-bits).bit_length()-1;val=cover(bits)
  for e in range(len(E)):
   if tm[j]>>e&1 and cover(bits&~edgehits[e])==val-1:enum(bits&~edgehits[e],c|1<<e)
 enum(full,0)
 conflict=[sum(1<<j for j,u in enumerate(tm) if t&u) for t in tm]
 @lru_cache(None)
 def pack(bits):
  if not bits:return ()
  j=(bits&-bits).bit_length()-1
  x=(j,)+pack(bits&~conflict[j]);y=pack(bits&~(1<<j))
  return x if len(x)>=len(y) else y
 vals=[]
 for c in sorted(Cs):
  f=sum(1<<j for j,t in enumerate(tm) if (t&c).bit_count()==1);m=pack(f)
  vals.append(len(m))
  if 2*len(m)<tau:
   return {'n':n,'edges':E,'triangles':T,'tau':tau,'C':[E[e] for e in range(len(E)) if c>>e&1],'private_triangles':[T[j] for j in range(len(T)) if f>>j&1],'nu_private':len(m),'private_packing':[T[j] for j in m],'nu':len(pack(full)),'packing':[T[j] for j in pack(full)],'result':'COUNTEREXAMPLE','checked_covers':len(vals),'cover_states':cover.cache_info().currsize,'pack_states':pack.cache_info().currsize}
 return {'n':n,'m':len(E),'triangles':len(T),'tau':tau,'checked_covers':len(vals),'min_nu_private_seen':min(vals,default=0),'covers_partial':partial,'result':'PASS_EXAMINED','cover_states':cover.cache_info().currsize,'pack_states':pack.cache_info().currsize}
def corpus():
 for n in range(4,8):yield 'K'+str(n),n,clique(range(n))
 E=clique(range(4))
 for i in range(4):E|={(min(4+i,j),max(4+i,j)) for j in [(i-1)%4,i,(i+1)%4]}
 yield 'switched4',8,E
 blocks=[{0,1,2,4,5},{0,1,3,6},{1,6,7,8},{1,8,9,10},{1,3,10,11}]
 yield 'tuza20_12',12,set().union(*(clique(b) for b in blocks))
 for a,b,s in [(4,4,1),(4,4,2),(4,4,3),(5,4,1),(5,4,2),(5,4,3),(5,5,2),(5,5,3)]:
  V=list(range(a))+list(range(a,a+b-s));yield f'cliques_{a}_{b}_overlap{s}',len(V),clique(range(a))|clique(list(range(s))+list(range(a,a+b-s)))
 rng=random.Random(21032026)
 # Structurally motivated: triangle-free bipartite substrate, then internal red chords.
 for n in [6,7,8]:
  for idx in range(40):
   s=n//2;E={(u,v) for u in range(s) for v in range(s,n) if rng.random()<.8}
   E|={e for part in [range(s),range(s,n)] for e in itertools.combinations(part,2) if rng.random()<.55}
   yield f'bipartite_substrate_{n}_{idx}',n,E
rows=[];start=time.time()
def alarm(*a):raise TimeoutError()
signal.signal(signal.SIGALRM,alarm)
for name,n,E in corpus():
 signal.setitimer(signal.ITIMER_REAL,3)
 try:r=analyze(n,E)
 except TimeoutError:r={'result':'UNKNOWN','reason':'3s_case_cap','n':n,'edges':sorted(E)}
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 r['name']=name;rows.append(r)
 (W/'results/private_cover_probe.json').write_text(json.dumps({'seed':21032026,'per_case_seconds':3,'minimum_cover_cap':128,'rows':rows,'elapsed':time.time()-start},indent=2)+'\n')
 print(name,r['result'],r.get('tau'),r.get('nu_private'),flush=True)
 if r['result']=='COUNTEREXAMPLE':break
print('DONE',len(rows),time.time()-start)
