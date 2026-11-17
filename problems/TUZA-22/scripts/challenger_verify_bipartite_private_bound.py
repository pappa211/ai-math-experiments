"""Independent witness-only verification of the exact 3+4 fixed-cover domain."""
from pathlib import Path
from itertools import combinations
import json
r=Path(__file__).resolve().parents[1]
d=json.loads((r/'evidence/challenger_bipartite_private_bound.json').read_text())
assert d['status']=='EXHAUSTIVE_NO_FAILURE'
A=range(3);B=range(3,7);C={(0,1),(0,2),(1,2),(3,4),(5,6)}
X=[(a,b) for a in A for b in B]
E=[(0,1),(0,2),(1,2),(3,4),(5,6)]+X
potential=[t for t in combinations(range(7),3) if set(combinations(t,2))<=set(E)]
assert len(d['rows'])==4096
assert [x[0] for x in d['rows']]==list(range(4096))
counts={}
for mask,typ,wit in d['rows']:
 G=C|{e for i,e in enumerate(X) if mask>>i&1}
 T=[set(combinations(t,2)) for t in combinations(range(7),3) if set(combinations(t,2))<=G]
 if typ=='PRIVATE3_WITNESS':
  assert len(wit)==3
  used=set()
  for j in wit:
   q=set(combinations(potential[j],2))
   assert q<=G and len(q&C)==1 and not used&q
   used|=q
 elif typ=='CHEAPER_COVER':
  D={E[i] for i in wit}
  assert D<=G and len(D)<=4 and all(D&t for t in T)
 else:raise AssertionError(typ)
 counts[typ]=counts.get(typ,0)+1
out={'status':'PASS','domain_size':4096,'verified_rows':4096,'witness_counts':counts,
     'method':'Reconstruct each literal graph and all actual triangles; check explicit private3 or ordinary cover<=4, with no recurrence or optimizer.'}
(r/'evidence/challenger_bipartite_private_bound_verification.json').write_text(json.dumps(out,indent=2)+'\n')
print(out)
