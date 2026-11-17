from pathlib import Path
from functools import lru_cache
from itertools import combinations
import json,time
w=Path(__file__).resolve().parents[1]
def edge(a,b):return tuple(sorted((a,b)))
def analyze(r,ident):
 E=set();P=[]
 for i in range(r):
  prev=(i-1)%r;nxt=(i+1)%r;E.update([edge(prev,i),edge(prev,nxt),edge(r+i,prev),edge(r+i,i),edge(r+i,nxt)]);P.append(tuple(sorted([prev,i,r+i])))
 def f(x):return ident.get(x,x)
 E={edge(f(a),f(b)) for a,b in E if f(a)!=f(b)};P=[tuple(sorted(f(x) for x in t)) for t in P]
 V=sorted(set(x for e in E for x in e));ix={e:j for j,e in enumerate(sorted(E))};ed=sorted(E);T=[t for t in combinations(V,3) if all(edge(*e) in E for e in combinations(t,2))];te=[sum(1<<ix[edge(*e)] for e in combinations(t,2)) for t in T];pm=[sum(1<<ix[edge(*e)] for e in combinations(t,2)) for t in P]
 row={'r':r,'identifications':ident,'n':len(V),'edges':ed,'triangles':T,'packing':P,'packing_valid':sum(m.bit_count() for m in pm)==sum(pm).bit_count()}
 # robust packing validity checked independently of arithmetic carries
 used=set();valid=True
 for p in P:
  es={edge(*e) for e in combinations(p,2)}
  if len(p)!=3 or len(set(p))!=3 or used&es:valid=False
  used|=es
 row['packing_valid']=valid
 if not valid:return row
 B=0
 for m in pm:B|=m
 pages=[[j for j,t in enumerate(te) if (t&B).bit_count()==1 and bool(t&m)] for m in pm]
 bases=[set(te[j]&B for j in pp) for pp in pages];row['types']=[len(b) for b in bases];row['private_pages']=[[T[j] for j in p] for p in pages]
 F=0;R=0
 if all(len(b)==1 for b in bases):
  for i,b in enumerate(bases):
   bm=next(iter(b));R|=bm
   if len(pages[i])==1:
    bv=set(ed[bm.bit_length()-1]);x=next(iter(set(P[i])-bv));z=next(iter(set(T[pages[i][0]])-bv));g=edge(x,z)
    if g in ix:F|=1<<ix[g]
  F&=~R;row['bases']=[ed[j] for j in range(len(ed)) if R>>j&1];row['gains']=[ed[j] for j in range(len(ed)) if F>>j&1];row['uncovered_after_gains']=[T[j] for j,t in enumerate(te) if not t&(R|F)]
 start=time.monotonic();conf=[sum(1<<j for j,b in enumerate(te) if a&b) for a in te]
 @lru_cache(None)
 def best(s):
  if time.monotonic()-start>15:raise TimeoutError()
  if not s:return ()
  choices=[j for j in range(len(T)) if s>>j&1];i=max(choices,key=lambda j:(s&conf[j]).bit_count())
  a=(i,)+best(s&~conf[i]);b=best(s&~(1<<i));return a if len(a)>len(b) else b
 try:
  pp=best((1<<len(T))-1);row.update(nu=len(pp),maximum_packing=[T[j] for j in pp],status='EXACT')
 except TimeoutError:row['status']='UNKNOWN_TIMEOUT'
 row['seconds']=time.monotonic()-start
 return row
rows=[]
for r,ids in [(9,{9:3,12:6,15:0}),(12,{12:4,16:8,20:0}),(7,{7:2,9:4,11:0}),(8,{8:3,11:6,14:0})]:
 row=analyze(r,ids);rows.append(row);print(json.dumps({k:row.get(k) for k in ['r','n','packing_valid','types','nu','gains','uncovered_after_gains','seconds']}),flush=True)
(w/'data/merged_cycle_probe.json').write_text(json.dumps(rows,indent=2)+'\n')
