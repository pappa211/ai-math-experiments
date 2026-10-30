from pathlib import Path
from itertools import combinations
import json,datetime
W=Path(__file__).resolve().parent
rows=[
 ('4.1 K3 link',['bc','ax','bx'],['ab']),
 ('4.2 K4 link',['ac','bd','ax','bx'],['ab','cd']),
 ('4.3 diamond',['ad','bc','ax','cx'],['ac','bd','ab']),
 ('5.1 dense1',['pb','pc','qb'],['bc','pq']),
 ('5.1 dense2',['ac','ae','ad','be'],['ab','bc','cd','bd','ce']),
 ('5.1 dense3',['ae','ce','ad','be'],['ab','bc','cd','de','ac','bd']),
 ('5.1 dense4',['aq','pq','bp','cq'],['ap','bq','ab','ac','bc']),
 ('5.2 K23',['ad','be','ax','cx'],['ac','ab','cd','ce']),
 ('5.2 C5',['bc','de','ax','bx'],['ab','cd','ad','bd']),
 ('5.4 extra non3colorable',['ac','ad','bd'],['cd']),
 ('6.2 adjacent degree5',['p1','p2','q1','q3'],['12','13','23']),
 ('7.3 overlap missinginside',['pb','pc','sb','rs'],['bc','br','cr']),
 ('7.4 overlap missingoutside',['pa','pc','qa'],['ac']),
 ('7.2 fourcommon page',['pa','pb'],['ab']),
 ('AppendixB smalllink',['ad','bc','xa','xc'],['ac','bd','ab']),
]
result=[]
for name,foot,missing in rows:
 edges=[frozenset(x) for x in foot];forbid=[frozenset(x) for x in missing];caps={};stars={}
 for order in [4,5]:
  feasible=[]
  for r in range(len(edges)+1):
   for chosen in combinations(edges,r):
    vertices=frozenset().union(*chosen)
    if len(vertices)>order or any(f<=vertices for f in forbid):continue
    feasible.append(chosen)
    if order==4 and chosen:assert set.intersection(*(set(x) for x in chosen)),(name,chosen)
  caps[str(order)]=max(map(len,feasible));assert caps[str(order)]<=2,(name,caps)
 result.append({'application':name,'whole_surviving_footprint':foot,'forced_residual_nonedges_used':missing,'maximum_feasible_forbidden_edges_by_block_order':caps,'K4_footprints_are_stars':True,'K5_two_edge_bound':True})
# Symbolic applications are not replaced by any outside-graph enumeration.
symbolic=[
 {'application':'Lemma3 deletion wedge','argument':'Deletedxy prevents a clique block from containing both xw and yw; wholefootprint≤1.'},
 {'application':'Lemma4 uniqueedge lostfamily','argument':'BlockmeetsU0≤1; each of two triangles contributes≤1 oldedge; wholefootprintstar≤2.'},
 {'application':'5.3 K221 twoexternalpages','argument':'Local3packing lies entirely on deleted coreedges; each page contributes≤1 oldspoke per block; independentW implies commonstarcenter; total≤2.'},
 {'application':'8.3 finalcore arbitrarypages','argument':'Local6packing has0 residualedges; each of2 pages contributes≤1 oldspoke per block because A independent; wholefootprintstar≤2.'},
]
report={'status':'PASS','checked_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Targeted necessary clique-incidence conditions for the explicitly displayed finite footprints; no graph census or enumeration of outside attachments. Symbolic terminal/page arguments reviewed separately.','finite_cases':result,'symbolic_hypotheses_to_check_in_the_paper':symbolic,'new_Lean_run':False}
print(json.dumps(report,indent=2))
