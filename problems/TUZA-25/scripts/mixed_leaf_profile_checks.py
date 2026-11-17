from mixed_exact import Graph,cliques,solve
from itertools import combinations
import json,time
start=time.time();rows=[]
for root in [3,4,5]:
 H=cliques(root,[range(root)]);p=solve(H)
 for a,s in [(3,4),(3,5),(4,5)]:
  for A in combinations(range(root),a):
   Q=A+tuple(range(root,root+s-a));G=Graph(root+s-a,H.edges+tuple(combinations(Q,2)));F=H.mask(combinations(A,2));g=solve(G)
   singles={e:solve(H,D=1<<e) for e in range(len(H.edges)) if F>>e&1}
   if a==3:
    r=solve(H,D=F)
    pn=max(p['nu']+(s==5),(1 if s==4 else 2)+max(x['nu'] for x in singles.values()))
    cn=min(p['tau']+(1 if s==4 else 3),(3 if s==4 else 4)+r['tau'])
   else:
    matchings=[]
    for b in A[1:]:
     left=[v for v in A if v not in (A[0],b)];matchings.append(H.mask([(A[0],b),tuple(left)]))
    pn=max(p['nu'],1+max(x['nu'] for x in singles.values()),2+max(solve(H,D=M)['nu'] for M in matchings))
    cn=min(2+p['tau'],4+min(solve(H,D=H.mask(combinations(U,2)))['tau'] for U in combinations(A,3)),6+solve(H,D=F)['tau'])
   assert (pn,cn)==(g['nu'],g['tau'])
   rows.append({'root':root,'overlap':A,'piece':s,'nu':pn,'tau':cn,'packing':g['packing'],'cover':g['cover'],'edges':G.edges})
json.dump({'status':'EXACT_COMPLETED','count':len(rows),'seconds':time.time()-start,'instances':rows},open('evidence/mixed_leaf_profile_checks.json','w'),indent=2)
print('Exact local profile controls',len(rows))
