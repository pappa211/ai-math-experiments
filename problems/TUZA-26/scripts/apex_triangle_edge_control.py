"""Exact named countercontrol for triangle-plus-edge restoration; local stdlib only."""
from apex_exact import Solver,clique,edge
from itertools import combinations
import json,time
start=time.time()
E=clique(range(5))|clique([0,1,5,6,7])
T=(0,2,3); te=clique(T); e=edge(1,4)
J=E-te; L=J-{e}; K=L|te
q=Solver(E);j=Solver(J);l=Solver(L);k=Solver(K)
rows=[]
for n in range(3):
 for D in combinations(q.E,n):
  p=q.pack(q.remaining(D))
  rows.append({'deleted':D,'nu':len(p),'packing':[q.T[i] for i in p]})
assert all(r['nu']==4 for r in rows)
assert (q.nu(),q.tau(),j.nu(),j.tau(),l.nu(),l.tau(),k.nu(),k.tau())==(4,7,3,5,2,4,4,6)
assert set(l.T)==set(combinations([0,1,5,6,7],3))
N=[t for t in k.T if t not in l.T]
assert len(N)==7
assert set().union(*(clique(t) for t in N))==clique([0,1,2,3,4])-{e}
supported_spokes=sorted((clique([0,1,2,3,4])-{e}-te)&set().union(*(clique(t) for t in l.T)))
assert supported_spokes==[(0,1)]
r={'status':'VERIFIED_EXACT_NAMED_COUNTERCONTROL','claim_refuted':'Every connected supported two-edge-resilient defect-one graph has no triangle-plus-critical-edge B residual','model':'two_K5_sharing_edge_01','T':T,'e':e,'Q':q.certificate(),'J':j.certificate(),'L':l.certificate(),'K':k.certificate(),'all_at_most_two_deletions':rows,'deletion_cases':len(rows),'new_family':N,'old_supported_spokes':supported_spokes,'B_L_component_vertices':[0,1,5,6,7],'scope':'Known C12 model, not a minimum-unknown-Q or Tuza counterexample.','seconds':time.time()-start}
print(json.dumps(r,indent=2))
