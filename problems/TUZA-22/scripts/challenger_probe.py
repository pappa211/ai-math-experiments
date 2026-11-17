"""TUZA-22 independent targeted D-all search; full graph triangles and exact optima.
Not a replay of Claude or TUZA-21. Capped states are UNKNOWN.
"""
import itertools, json, time, random, platform, signal, argparse
from functools import lru_cache
from pathlib import Path
W=Path(__file__).resolve().parents[1]
def edge(u,v): return tuple(sorted((u,v)))
def clique(v): return set(itertools.combinations(sorted(v),2))
def bits(x):
 while x:
  b=x&-x; yield b.bit_length()-1; x-=b

def analyze(name, edges, candidate_covers, seconds=4, qcap=300):
 begin=time.monotonic(); deadline=begin+seconds
 E=sorted(edges); V=sorted(set(itertools.chain.from_iterable(E))); ei={e:i for i,e in enumerate(E)}
 T=[t for t in itertools.combinations(V,3) if clique(t)<=edges]
 tm=[sum(1<<ei[e] for e in clique(t)) for t in T]; all_t=(1<<len(T))-1
 hits=[sum(1<<j for j,t in enumerate(tm) if t>>e&1) for e in range(len(E))]
 conf=[sum(1<<j for j,u in enumerate(tm) if u&t) for t in tm]
 nodes=0
 def check():
  nonlocal nodes
  nodes+=1
  if nodes%128==0 and time.monotonic()>deadline: raise TimeoutError
 @lru_cache(maxsize=400000)
 def tau(s):
  check()
  if not s: return 0
  # Most-constrained triangle, prefer incidences covering many constraints.
  j=max(bits(s), key=lambda j:sum((s&hits[e]).bit_count()**2 for e in bits(tm[j])))
  return 1+min(tau(s&~hits[e]) for e in sorted(bits(tm[j]),key=lambda e:-(s&hits[e]).bit_count()))
 @lru_cache(maxsize=400000)
 def pack(s):
  check()
  if not s:return ()
  j=max(bits(s), key=lambda j:(s&conf[j]).bit_count())
  inc=(j,)+pack(s&~conf[j]);exc=pack(s&~(1<<j))
  return inc if len(inc)>=len(exc) else exc
 def mincover(s):
  if not s:return 0
  j=next(bits(s));z=tau(s)
  for e in bits(tm[j]):
   if tau(s&~hits[e])==z-1:return (1<<e)|mincover(s&~hits[e])
 def maximal_greedy(s, rng):
  p=[]
  while s:
   js=list(bits(s)); mode=rng.randrange(3)
   if mode==0:j=max(js,key=lambda j:(s&conf[j]).bit_count())
   else:j=rng.choice(js)
   p.append(j);s&=~conf[j]
  return tuple(p)
 out={'name':name,'n':len(V),'m':len(E),'triangles':len(T),'edges':E,'status':'RUNNING'}
 try:
  opt=tau(all_t);out['tau']=opt
  Cs={mincover(all_t)}
  for C in candidate_covers:
   if C<=edges:
    cm=sum(1<<ei[e] for e in C)
    if len(C)==opt and all(t&cm for t in tm): Cs.add(cm)
  out['minimum_covers_checked']=len(Cs);out['deficient_covers']=0;out['q_checked']=0
  rng=random.Random(220015)
  for C in Cs:
   F=sum(1<<j for j,t in enumerate(tm) if (t&C).bit_count()==1)
   q=len(pack(F));out.setdefault('private_optima',[]).append(q)
   if 2*q>=opt:continue
   out['deficient_covers']+=1
   Qs=[]
   def enum(s,p):
    check()
    if len(Qs)>=qcap:return
    if not s:Qs.append(p);return
    j=max(bits(s),key=lambda j:(s&conf[j]).bit_count());z=len(pack(s))
    if 1+len(pack(s&~conf[j]))==z:enum(s&~conf[j],p+(j,))
    if len(pack(s&~(1<<j)))==z:enum(s&~(1<<j),p)
   enum(F,())
   out['q_cap_reached']=len(Qs)>=qcap
   for Q in Qs:
    check();out['q_checked']+=1;s=all_t
    for j in Q:s&=~conf[j]
    for _ in range(12):
     P=Q+maximal_greedy(s,rng)
     if 2*len(P)<opt:
      out.update(status='COUNTEREXAMPLE_D_ALL',C=[E[e] for e in bits(C)],Q=[T[j] for j in Q],P=[T[j] for j in P],nu_private=q,private_triangles=[T[j] for j in bits(F)],max_extension_size=len(Q)+len(pack(s)),max_extension=[T[j] for j in Q+pack(s)])
      return out
  out['status']='PASS_EXAMINED'
 except TimeoutError:out['status']='UNKNOWN_TIMEOUT'
 finally:
  out['seconds']=time.monotonic()-begin;out['nodes']=nodes;out['cover_cache']=tau.cache_info()._asdict();out['pack_cache']=pack.cache_info()._asdict()
 return out

def corpus():
 V=[x for x in range(32) if x.bit_count()%2==0];L={edge(a,b) for a,b in itertools.combinations(V,2) if (a^b).bit_count()==4}
 I={x for x in V if x.bit_count()==4};S=set(V)-I;z=32;y=33
 cone=L|{edge(z,x) for x in V};C={edge(z,x) for x in S}
 # Do not replay the untouched Clebsch control. Every graph changes full family.
 nonedges=sorted(clique(V)-L);rng=random.Random(221511)
 for k in [1,2,3,4]:
  for idx in range(12):
   F=set(rng.sample(nonedges,k));yield f'rim_add_{k}_{idx}',cone|F,[C|F]
 for k in [4,5,6,7,8,10,12]:
  for idx in range(10):
   A=set(rng.sample(V,k));E=cone|{edge(y,x) for x in A}
   Cs=[C|{edge(y,x) for x in A&S}, C|{e for e in L if set(e)<=A}]
   yield f'partial_second_apex_{k}_{idx}',E,Cs
 for common in [2,4,6,8,10]:
  for idx in range(8):
   both=set(rng.sample(V,common));other=set(V)-both;az=set(rng.sample(sorted(other),len(other)//2));ay=other-az
   E=L|{edge(z,x) for x in both|az}|{edge(y,x) for x in both|ay}
   Cs=[{edge(z,x) for x in (both|az)&S}|{edge(y,x) for x in (both|ay)&S}]
   yield f'apex_split_{common}_{idx}',E,Cs

def main():
 assert platform.system()=='Darwin'
 ap=argparse.ArgumentParser();ap.add_argument('--seconds',type=float,default=120);ap.add_argument('--case-seconds',type=float,default=3);ap.add_argument('--limit',type=int,default=1000);a=ap.parse_args()
 begin=time.monotonic(); rows=[]
 for name,E,Cs in corpus():
  if time.monotonic()-begin>a.seconds or len(rows)>=a.limit:break
  r=analyze(name,E,Cs,a.case_seconds);rows.append(r)
  (W/'evidence/challenger_probe.json').write_text(json.dumps({'seed':221511,'seconds':time.monotonic()-begin,'per_instance_cap':a.case_seconds,'full_corpus_complete':False,'rows':rows},indent=2)+'\n')
  print(name,r['status'],r.get('tau'),r.get('private_optima'),r.get('q_checked'),flush=True)
  if r['status']=='COUNTEREXAMPLE_D_ALL':break
 print('DONE',len(rows),time.monotonic()-begin)
if __name__=='__main__':main()
