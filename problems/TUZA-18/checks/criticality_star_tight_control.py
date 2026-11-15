#!/usr/bin/env python3
"""Exact control: individual matching-tight triangles do not replace star maximality."""
from itertools import combinations
from pathlib import Path
import json,time

start=time.monotonic();F=set()
for j in range(3):
 b=1+5*j
 F|={tuple(sorted((b+i,b+(i+1)%5))) for i in range(5)}
 F.add((0,b))
M={(0,5),(1,3),(2,4),(6,11),(7,9),(8,10),(12,14),(13,15)}
H=F|M
def edges(t):return set(combinations(sorted(t),2))
T=[t for t in combinations(range(16),3) if edges(t)<=H]
def perfect(unused):
 if not unused:return [()]
 u=min(unused);ans=[]
 for v in sorted(unused-{u}):
  if tuple(sorted((u,v))) in H:
   ans.extend(((u,v),)+rest for rest in perfect(unused-{u,v}))
 return ans
PM=perfect(set(range(16)))
assert len(PM)==12
assert all(len(edges(t)&set(P))==1 for t in T for P in PM)
assert len(T)==8 and all(sum(e in edges(t) for t in T)==1 for e in M)
alpha=max(mask.bit_count() for mask in range(1<<16)
          if all(not(mask>>u&1 and mask>>v&1) for u,v in F))
I={0,2,4,7,9,12,14}
assert alpha==7 and all(not(set(e)<=I) for e in F)
apex=16;G=H|{(u,apex) for u in range(16)}
P=[(u,v,apex) for u,v in sorted(M)]
B=set(e for t in P for e in edges(t))
GT=[t for t in combinations(range(17),3) if edges(t)<=G]
private=[t for t in GT if len(edges(t)&B)==1]
assert private==T
R=[(0,11),(1,3),(4,5),(7,8),(9,10),(12,13),(14,15)]
larger=[(0,1,5),(2,3,4)]+[(u,v,apex) for u,v in R]
used=[e for t in larger for e in edges(t)]
assert len(larger)==9 and len(set(used))==27 and set(used)<=G
C=M|{(u,apex) for u in set(range(16))-I}
assert len(C)==17 and C<=B and all(C&edges(t) for t in GT)
out={'status':'PASS','scope':'Matching-tightness of each single old triangle, not maximum star packing.',
 'F_edges':sorted(F),'M_edges':sorted(M),'H_edges':sorted(H),'H_triangles':T,
 'all_perfect_matchings':PM,'perfect_matching_count':len(PM),
 'all_old_triangles_meet_each_perfect_matching_exactly_once':True,
 'every_M_edge_active':True,'alpha_F':alpha,'independent_set':sorted(I),
 'G_edges':sorted(G),'G_triangles':GT,'prescribed_star_packing':P,
 'all_prescribed_members_type1':True,'prescribed_packing_is_maximum':False,
 'B_only_cover_number':17,'twice_prescribed_size':16,
 'larger_packing':larger,'larger_packing_size':9,
 'ordinary_triangle_cover':sorted(C),'ordinary_cover_size':17,
 'ordinary_Tuza_certified':True,'seconds':time.monotonic()-start}
Path('evidence/criticality_star_tight_control.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['status','perfect_matching_count','alpha_F',
 'B_only_cover_number','larger_packing_size','ordinary_cover_size','seconds']}))
