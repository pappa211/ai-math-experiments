"""Exact 4096 cross graphs for C=K3 in A plus 2K2 in B.
Every passing mask gets either a private3 witness or an ordinary <=4 cover.
Stop on first minimum-C/private-packing deficiency; all actual triangles included.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json,time,platform
assert platform.system()=='Darwin'
root=Path(__file__).resolve().parents[1]
start=time.monotonic();deadline=start+24
A=[0,1,2];B=[3,4,5,6]
C=[(0,1),(0,2),(1,2),(3,4),(5,6)]
X=[(a,b) for a in A for b in B]
E=C+X;ei={e:i for i,e in enumerate(E)}
Cmask=(1<<5)-1
alltri=[t for t in combinations(range(7),3) if all(e in ei for e in combinations(t,2))]
tm=[sum(1<<ei[e] for e in combinations(t,2)) for t in alltri]
rows=[];found=None;counts={'PRIVATE3_WITNESS':0,'CHEAPER_COVER':0};status='RUNNING'
def bits(x):
 while x:
  b=x&-x;yield b.bit_length()-1;x-=b
for cross in range(1<<12):
 if time.monotonic()>deadline:status='UNKNOWN_INTERNAL_TIMEOUT';break
 present=Cmask|(cross<<5)
 T=[i for i,m in enumerate(tm) if m&present==m]
 private=[i for i in T if (tm[i]&Cmask).bit_count()==1]
 pack=None
 for a,b,c in combinations(private,3):
  if not (tm[a]&tm[b] or tm[a]&tm[c] or tm[b]&tm[c]):pack=[a,b,c];break
 if pack is not None:
  rows.append([cross,'PRIVATE3_WITNESS',pack]);counts['PRIVATE3_WITNESS']+=1;continue
 # Exact ordinary-cover recurrence over this graph's actual triangle family.
 hit=[sum(1<<i for i in T if tm[i]>>e&1) for e in range(len(E))]
 @lru_cache(None)
 def cover(s):
  if not s:return ()
  i=next(bits(s));return min(((e,)+cover(s&~hit[e]) for e in bits(tm[i])),key=len)
 actualmask=sum(1<<i for i in T)
 D=cover(actualmask)
 if len(D)<5:
  rows.append([cross,'CHEAPER_COVER',list(D)]);counts['CHEAPER_COVER']+=1;continue
 assert len(D)==5
 # We already exhaustively ruled out a three-packing in the private family.
 q=1 if private else 0;Q=private[:1]
 for a,b in combinations(private,2):
  if not tm[a]&tm[b]:q=2;Q=[a,b];break
 found={'mask':cross,'vertices':list(range(7)),'edges':[E[i] for i in bits(present)],'triangles':[alltri[i] for i in T],
        'minimum_cover':C,'tau':5,'maximum_private_packing':[alltri[i] for i in Q],'private_nu':q,
        'private_triangles':[alltri[i] for i in private]}
 rows.append([cross,'PRIVATE_BOUND_FAILURE',Q]);status='CERTIFIED_CANDIDATE_FAILURE';break
else:status='EXHAUSTIVE_NO_FAILURE'
out={'status':status,'target':'For this fixed minimum internal cover, 5<=2*private_nu',
     'partition':[A,B],'fixed_C':C,'ordered_cross_edges':X,'ordered_all_edges':E,'ordered_potential_triangles':alltri,
     'domain_size':4096,'examined':len(rows),'rows':rows,'counts':counts,'failure':found,
     'seconds':time.monotonic()-start,'unknown_unexamined':4096-len(rows)}
(root/'evidence/challenger_bipartite_private_bound.json').write_text(json.dumps(out,indent=2)+'\n')
print(status,'examined',len(rows),'counts',counts,'seconds',out['seconds'],flush=True)
