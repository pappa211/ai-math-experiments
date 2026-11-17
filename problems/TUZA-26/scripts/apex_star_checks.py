from apex_exact import *
from itertools import product
import json,time
start=time.time();n=0;vc3=[]
# Symbolic interface O_i: nonempty subsets of two old apex vertices 3,4.
# A_i: nonempty marked bare subsets of O_i. Old leaf edges must not create
# a triangle through any marked background spoke.
options=[(O,A) for O in [{3},{4},{3,4}] for A in [{3},{4},{3,4}] if A<=O]
for rows in product(options,repeat=3):
 O=[x[0] for x in rows];A=[x[1] for x in rows]
 for mask in range(8):
  NN={e for j,e in enumerate(combinations(range(3),2)) if mask>>j&1}
  if any(A[i]&O[j] or A[j]&O[i] for i,j in NN):continue
  n+=1;K=NN|{edge(i,x) for i in range(3) for x in O[i]}
  assert not Solver(K).T
  c=len(vc(K))
  if c>=3:
   assert len(K)==5 and all(sum(v in e for e in K)==2 for v in range(5))
   vc3.append({'ordinary_apices':[sorted(o) for o in O],'bare_apices':[sorted(a) for a in A],'link_edges':sorted(K)})
# Sharp wheel control with a three-star deletion to empty triangle support.
E={edge(i,(i+1)%5) for i in range(5)}|{edge(i,5) for i in range(5)}
S={(0,5),(1,5),(3,5)};X=Solver(E);Y=Solver(E-S)
r={'status':'VERIFIED_FINITE','symbolic_interfaces_checked':n,'vc_three_interfaces':vc3,'wheel':X.certificate(),'deleted_star':sorted(S),'old_edges':sorted(E-S),'old_nu':Y.nu(),'old_tau':Y.tau(),'seconds':time.time()-start}
assert (X.nu(),X.tau(),Y.nu(),Y.tau())==(2,3,0,0)
print(json.dumps(r,indent=2))
