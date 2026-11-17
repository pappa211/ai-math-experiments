"""Short decisive-failure search for the stronger joint-attainability target.
Compare total-first and private-first maximum triangle packings for exact minimum C.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json,time,random,platform
R=Path(__file__).resolve().parents[1]
def bits(x):
 while x:
  b=x&-x;yield b.bit_length()-1;x-=b

def analyze(name,E,seconds=1.2):
 start=time.monotonic();deadline=start+seconds;nodes=0
 def check():
  nonlocal nodes
  nodes+=1
  if nodes%128==0 and time.monotonic()>deadline:raise TimeoutError
 E=sorted(E);V=sorted(set(sum((list(e) for e in E),[])));ei={e:i for i,e in enumerate(E)};ES=set(E)
 T=[t for t in combinations(V,3) if set(combinations(t,2))<=ES];tm=[sum(1<<ei[e] for e in combinations(t,2)) for t in T];full=(1<<len(T))-1
 hit=[sum(1<<j for j,t in enumerate(tm) if t>>e&1) for e in range(len(E))];conf=[sum(1<<j for j,u in enumerate(tm) if u&t) for t in tm]
 @lru_cache(None)
 def cov(s):
  check()
  if not s:return 0
  j=next(bits(s));return 1+min(cov(s&~hit[e]) for e in bits(tm[j]))
 tau=cov(full);Cs=set();seen=set()
 def covers(s,c):
  check()
  if len(Cs)>=24:return
  if (s,c) in seen:return
  seen.add((s,c))
  if not s:Cs.add(c);return
  j=next(bits(s));z=cov(s)
  for e in bits(tm[j]):
   if cov(s&~hit[e])==z-1:covers(s&~hit[e],c|1<<e)
 covers(full,0)
 for C in Cs:
  check();private=sum(1<<j for j,t in enumerate(tm) if (t&C).bit_count()==1)
  @lru_cache(None)
  def lex(s,mode):
   check()
   if not s:return (0,0,())
   j=max(bits(s),key=lambda j:(s&conf[j]).bit_count());a,b,pp=lex(s&~conf[j],mode);inc=(a+(1 if mode==0 else (private>>j)&1),b+(((private>>j)&1) if mode==0 else 1),(j,)+pp);exc=lex(s&~(1<<j),mode)
   return inc if inc[:2]>=exc[:2] else exc
  p,qp,P=lex(full,0);q,pstar,Qext=lex(full,1)
  if qp<q:
   return {'status':'JOINT_ATTAINABILITY_FAILURE','name':name,'edges':E,'triangles':T,'tau':tau,'C':[E[e] for e in bits(C)],'full_nu':p,'maximum_private_among_full_maxima':qp,'private_nu':q,'p_star_fixed_C':pstar,'full_maximum_packing':[T[j] for j in P],'private_first_optimal_packing':[T[j] for j in Qext],'private_family':[T[j] for j in bits(private)],'seconds':time.monotonic()-start,'nodes':nodes}
 return {'status':'NO_FAILURE_EXAMINED','name':name,'n':len(V),'m':len(E),'triangles':len(T),'tau':tau,'minimum_covers_examined':len(Cs),'covers_capped':len(Cs)>=24,'seconds':time.monotonic()-start,'nodes':nodes}

def clique(v):return set(combinations(sorted(v),2))
def corpus():
 # Noncone cell arrangements and actual page additions that can compete for full packing.
 templates=[[(0,1,2,3),(2,3,4,5),(4,5,0,1)],[(0,1,2,3,4),(0,1,5,6),(2,3,6,7)],[(0,1,2,3),(0,1,4,5),(2,4,6,7)],[(0,1,2,3,4),(1,2,5,6),(3,4,5,7)]]
 rng=random.Random(220022)
 for k,cells in enumerate(templates):
  base=set().union(*(clique(c) for c in cells));n=max(max(c) for c in cells)+1;non=sorted(clique(range(n))-base)
  yield f'cells_{k}',base
  for j in range(10):
   F=set(rng.sample(non,min(len(non),1+j%3)));yield f'cells_{k}_added_{j}',base|F
 for n in [4,5,6]:
  core=clique(range(n));rim=list(core)
  for j in range(12):
   E=set(core)
   for off in range(3):
    a,b=rng.choice(rim);E|={(a,n+off),(b,n+off)}
   for a,b in combinations(range(n,n+3),2):
    if rng.random()<.4:E.add((a,b))
   yield f'competing_pages_{n}_{j}',E
assert platform.system()=='Darwin';start=time.monotonic();rows=[]
for name,E in corpus():
 if time.monotonic()-start>48:break
 try:r=analyze(name,E)
 except TimeoutError:r={'status':'UNKNOWN_TIMEOUT','name':name,'edges':sorted(E),'per_instance_seconds':1.2}
 rows.append(r);(R/'evidence/challenger_joint_attainability.json').write_text(json.dumps({'seed':220022,'statement':'Every minimum C has some private maximum included in a full maximum','rows':rows,'seconds':time.monotonic()-start},indent=2)+'\n');print(name,r['status'],r.get('tau'),r.get('full_nu'),r.get('private_nu'),r.get('p_star_fixed_C'),flush=True)
 if r['status']=='JOINT_ATTAINABILITY_FAILURE':break
print('DONE',len(rows),time.monotonic()-start)
