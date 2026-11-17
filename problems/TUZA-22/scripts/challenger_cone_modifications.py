"""Exact structural reduction for a cone over a link with few actual triangles."""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import networkx as nx
import argparse,json,time,platform,random
ROOT=Path(__file__).resolve().parents[1]
def bits(x):
 while x:
  b=x&-x;yield b.bit_length()-1;x-=b

def solve(edges,n=16,seconds=15,qcap=64):
 begin=time.monotonic();deadline=begin+seconds;calls=0
 def check():
  nonlocal calls
  calls+=1
  if calls%64==0 and time.monotonic()>deadline:raise TimeoutError
 E=sorted(edges);ei={e:i for i,e in enumerate(E)};adj=[0]*n
 for a,b in E:adj[a]|=1<<b;adj[b]|=1<<a
 B=[t for t in combinations(range(n),3) if all(e in edges for e in combinations(t,2))]
 bm=[sum(1<<ei[e] for e in combinations(t,2)) for t in B]
 bh=[sum(1<<j for j,t in enumerate(bm) if t>>e&1) for e in range(len(E))];allB=(1<<len(B))-1
 @lru_cache(None)
 def tc(s):
  check()
  if not s:return (0,0)
  j=next(bits(s));opts=[]
  for e in bits(bm[j]):
   k,c=tc(s&~bh[e]);opts.append((k+1,c|1<<e))
  return min(opts)
 count=[0]*(1<<n);hit=[0]*(1<<n);fedge=[0]*(1<<n);best=10**9;covers=[]
 for vs in range(1<<n):
  check()
  if vs:
   v=next(bits(vs));prev=vs&~(1<<v);mask=prev&adj[v]
   count[vs]=count[prev]+mask.bit_count();hit[vs]=hit[prev];fedge[vs]=fedge[prev]
   for u in bits(mask):
    e=ei[tuple(sorted((v,u)))];hit[vs]|=bh[e];fedge[vs]|=1<<e
  lower=n-vs.bit_count()+count[vs]
  if lower>best:continue
  k,c=tc(allB&~hit[vs]);val=lower+k
  if val<best:best=val;covers=[]
  if val==best and len(covers)<16:covers.append(((1<<n)-1-vs,fedge[vs]|c))
 result={'tau':best,'base_triangles':B,'minimum_covers_retained':len(covers),'private_deficient_states':0,'q_checked':0}
 m=len(E);fulltm=bm+[1<<i|1<<(m+a)|1<<(m+b) for i,(a,b) in enumerate(E)];fullt=B+[(a,b,n) for a,b in E]
 def match(allowed,active=(1<<n)-1):
  H=nx.Graph();H.add_nodes_from(bits(active));H.add_edges_from(E[e] for e in bits(allowed) if all(active>>v&1 for v in E[e]))
  return tuple(ei[tuple(sorted(e))] for e in nx.max_weight_matching(H,maxcardinality=True))
 def basepackings(allowed):
  def rec(j,used,taken):
   check()
   if j==len(allowed):yield taken,used;return
   t=allowed[j];yield from rec(j+1,used,taken)
   if not bm[t]&used:yield from rec(j+1,used|bm[t],taken+(t,))
  yield from rec(0,0,())
 def residual(Q):
  used=0
  for t in Q:used|=fulltm[t]
  return [t for t in range(len(fulltm)) if not fulltm[t]&used]
 rng=random.Random(220016)
 for S,F in covers:
  check();private_base=[j for j,t in enumerate(bm) if (t&F).bit_count()==1]
  private_rim=sum(1<<i for i,(a,b) in enumerate(E) if ((F>>i)&1)+((S>>a)&1)+((S>>b)&1)==1)
  q=-1;bestBs=[]
  for bb,used in basepackings(private_base):
   M=match(private_rim&~used);z=len(bb)+len(M)
   if z>q:q=z;bestBs=[]
   if z==q and len(bestBs)<64:bestBs.append((bb,used,M))
  result.setdefault('private_optima',[]).append(q)
  if q*2>=best:continue
  result['private_deficient_states']+=1
  state={'C':[E[e] for e in bits(F)]+[(v,n) for v in bits(S)],'nu_private':q,'sample_Q':[],'minimum_sampled_full_extension':None}
  result.setdefault('deficient_states',[]).append(state)
  for bb,used,M in bestBs:
   allowed=private_rim&~used;ad=[0]*n
   for e in bits(allowed):
    a,b=E[e];ad[a]|=1<<b;ad[b]|=1<<a
   @lru_cache(None)
   def mn(vs):
    check()
    if not vs:return 0
    v=next(bits(vs));rest=vs&~(1<<v)
    return max([mn(rest)]+[1+mn(rest&~(1<<u)) for u in bits(ad[v]&rest)])
   Ms=[]
   def enum(vs,mm):
    check()
    if len(Ms)>=qcap:return
    if not vs:Ms.append(mm);return
    v=next(bits(vs));rest=vs&~(1<<v);z=mn(vs)
    for u in bits(ad[v]&rest):
     if 1+mn(rest&~(1<<u))==z:enum(rest&~(1<<u),mm+(ei[tuple(sorted((v,u)))],))
    if mn(rest)==z:enum(rest,mm)
   enum((1<<n)-1,())
   for mm in Ms:
    Q=bb+tuple(len(B)+e for e in mm);result['q_checked']+=1;res=residual(Q)
    if len(state['sample_Q'])<3:state['sample_Q'].append([fullt[t] for t in Q])
    for trial in range(12):
     rem=res[:];P=list(Q)
     while rem:
      if trial==0:t=max(rem,key=lambda t:sum(bool(fulltm[t]&fulltm[u]) for u in rem))
      else:t=rng.choice(rem)
      P.append(t);rem=[u for u in rem if not fulltm[t]&fulltm[u]]
     if state['minimum_sampled_full_extension'] is None or len(P)<state['minimum_sampled_full_extension']:state['minimum_sampled_full_extension']=len(P)
     if len(P)*2<best:
      pused=0
      for t in Q:pused|=fulltm[t]
      active=((1<<n)-1)&~(pused>>m);baseallowed=[t for t in range(len(B)) if not bm[t]&pused];rallowed=sum(1<<e for e in range(m) if len(B)+e in res);extmax=0;ex=[]
      for rb,ru in basepackings(baseallowed):
       RM=match(rallowed&~ru,active);val=len(rb)+len(RM)
       if val>extmax:extmax=val;ex=list(rb)+[len(B)+e for e in RM]
      result.update(status='COUNTEREXAMPLE_D_ALL',C=[E[e] for e in bits(F)]+[(v,n) for v in bits(S)],nu_private=q,Q=[fullt[t] for t in Q],P=[fullt[t] for t in P],maximum_extension_size=len(Q)+extmax,maximum_extension=[fullt[t] for t in list(Q)+ex],edges=E+[(v,n) for v in range(n)])
      return result
 result['status']='PASS_EXAMINED';result['seconds']=time.monotonic()-begin;return result

def corpus():
 masks=[x for x in range(32) if x.bit_count()%2==0];ix={v:i for i,v in enumerate(masks)}
 L={tuple(sorted((ix[a],ix[b]))) for a,b in combinations(masks,2) if (a^b).bit_count()==4};non=sorted(set(combinations(range(16),2))-L);rng=random.Random(221116)
 for k in [2,3,4,5]:
  for idx in range(12):
   F=set(rng.sample(non,k));yield f'rim_{k}_{idx}',L|F,F

def main():
 assert platform.system()=='Darwin'
 p=argparse.ArgumentParser();p.add_argument('--seconds',type=float,default=100);p.add_argument('--case-seconds',type=float,default=12);a=p.parse_args();start=time.monotonic();rows=[]
 for name,E,F in corpus():
  if time.monotonic()-start>a.seconds:break
  t=time.monotonic()
  try:r=solve(E,seconds=a.case_seconds)
  except TimeoutError:r={'status':'UNKNOWN_TIMEOUT'}
  r.update(name=name,edges=sorted(E|{(v,16) for v in range(16)}),added_rim_edges=sorted(F),seconds=time.monotonic()-t);rows.append(r)
  (ROOT/'evidence/challenger_cone_modifications.json').write_text(json.dumps({'seed':221116,'per_instance_seconds':a.case_seconds,'seconds':time.monotonic()-start,'rows':rows},indent=2)+'\n')
  print(name,r['status'],r.get('tau'),r.get('private_optima'),r.get('private_deficient_states'),r.get('q_checked'),flush=True)
  if r['status']=='COUNTEREXAMPLE_D_ALL':break
 print('DONE',len(rows),time.monotonic()-start)
if __name__=='__main__':main()
