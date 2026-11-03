#!/usr/bin/env python3
"""Verify stated fixed-core witnesses against complete actual triangle families.
These checks do not replace the symbolic outside-attachment arguments.
"""
import itertools as it,json,time
from pathlib import Path
start=time.monotonic()
def edge(a,b):return tuple(sorted((a,b)))
def complete(v):return {edge(a,b) for a,b in it.combinations(v,2)}
def triples(E,V):return [t for t in it.combinations(V,3) if complete(t)<=E]
def packing(E,ts):
 used=set()
 for t in ts:
  e=complete(t);assert len(e)==3 and e<=E and not e&used,(t,sorted(e-used));used|=e
 return used
def cover(E,V,C):assert C<=E and all(complete(t)&C for t in triples(E,V))
def footprint(J,D,V):
 for n in range(2,min(5,len(V))+1):
  for C in it.combinations(V,n):
   ce=complete(C)
   if ce<=J:
    f=D&ce;assert len(f)<=2
    if n<=4 and f:assert set.intersection(*(set(e) for e in f))
results={}
V='0123456';E=complete(V)-{edge('1','2'),edge('3','4')}
P=['014','023','056','135','245'];packing(E,P)
rows={'13':['014','025','036','156','246'],'15':['013','024','056','146','235'],'56':['013','025','046','145','236']}
for f,ts in rows.items():assert edge(*f) not in packing(E,ts)
cover(E,V,{edge(*f) for f in ['01','02','35','36','45','46','56']})
results['R6']={'five_pack':True,'three_orbit_avoidance_rows':True,'seven_edge_full_core_cover':True}
V='uvabcdw'
for wa,wb in it.product([False,True],repeat=2):
 E=complete('uvabcd')|{edge('u','w'),edge('v','w'),edge('w','c'),edge('w','d')}
 if wa:E.add(edge('w','a'))
 if wb:E.add(edge('w','b'))
 P=['uab','ucd','vbc','vad','uvw'];packing(E,P)
 X={edge(*f) for f in ['ab','bc','cd','da','uw','vw','ua','ub','vc','vd']}
 # X is a cover increment for LOST triangles; retained triangles use the K cover.
 Q=['wuv','wcd','auc','avd','bud','bvc'];used=packing(E,Q)
 deleted={e for e in E if 'u' in e or 'v' in e}|{edge(*f) for f in ['ab','bc','cd','da']}
 J=E-deleted
 assert X<=E and all(complete(t)&X for t in triples(E,V) if not complete(t)<=J)
 footprint(J,used&J,V)
results['TWIN']={'all_four_optional_edge_choices':True,'five_six_packings':True,'ten_edge_cover_of_all_lost_triangles':True,'complete_local_clique_footprints':True}
V='uvqabcd';E=complete(V)-{edge(*f) for f in ['uq','ac','bd']}
# Exact displayed core includes no extra q-u edge; other unknown edges are unnecessary.
packing(E,['uab','ucd','vbc','vad']);used=packing(E,['uab','qcd','vuc','vad','vbq'])
X={edge(*f) for f in ['ab','bc','cd','da','uv','vq']}
assert all(complete(t)&X for t in triples(E,V) if 'u' in t or 'v' in t)
J={e for e in E if 'u' not in e and 'v' not in e}-X;footprint(J,used&J,V)
results['THIN']={'four_five_packings':True,'core_lost_triangles':True,'complete_local_clique_footprints':True}
V='0123456';E=complete(V);packing(E,['013','026','045','124','156','235','346'])
V='uv12345';E=complete(V)-{edge('1','2')};packing(E,['u25','u34','v23','v45','uv1','135'])
results['DOM']={'K7_decomposition':True,'K7_minus_edge_six_pack':True}
V='uvabcd';E=complete(V)-{edge('a','b')}
rows=[(['ac','ad'],['auv','bcu','bdv']),(['ac','bc'],['auv','bdu','cdv']),(['ac','bd'],['auv','bcu','cdv'])]
for fs,ts in rows:assert not {edge(*f) for f in fs}&packing(E,ts)
for cs in [['ac','bc','uv','ud','vd'],['ad','bd','uv','uc','vc']]:cover(E,V,{edge(*f) for f in cs})
V='uvwabc';E=complete(V);assert not {edge(*f) for f in ['uw','wa','wb']}&packing(E,['wvc','uva','ubc'])
diamond_cases=0
for missing in [set(),{edge('a','b')}]:
 V='vabcd';E=complete(V)-missing
 for size in range(3):
  for M in it.combinations(sorted(E),size):
   if len(set(it.chain.from_iterable(M)))!=2*size:continue
   J=E-set(M)
   if J==complete(V):continue
   assert any(len(complete(C)-J)==1 for C in it.combinations(V,4));diamond_cases+=1
results['DEGREE8']={'three_avoidance_types':True,'both_five_edge_covers':True,'three_star_avoidance':True,'all_K5_near_clique_matching_deletions':diamond_cases}
assert __debug__
out={'status':'PASS','elapsed_seconds':time.monotonic()-start,'assertions_enabled':__debug__,'results':results,'scope':'Exact displayed small cores only; not a graph census or outside-attachment proof.'}
print(json.dumps(out,indent=2))
