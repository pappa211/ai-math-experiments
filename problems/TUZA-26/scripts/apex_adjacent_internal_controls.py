from apex_exact import *
import json,sys
C=clique([0,1,2,3])|clique([0,1,4,5]);I=[(2,4),(2,5),(3,4),(3,5)];rows=[]
for e,f in combinations(I,2):
 if not(set(e)&set(f)):continue
 X=Solver(C|{e,f});row=X.certificate();row.update({'restored_edges':[e,f],'min_degree':min(sum(v in g for g in X.E) for v in X.V)})
 assert (row['nu'],row['tau'],row['min_degree'])==(3,4,3);rows.append(row)
assert not any(not(clique(t)&C) for t in combinations(range(6),3))
print(json.dumps({'status':'VERIFIED_FINITE','scope':'All4adjacentpairs amongthe4qualifyinginternalinsertions inexactdoubleK4; alsoindependencenumber<=2 ofthatmodel.','rows':rows},indent=2))
