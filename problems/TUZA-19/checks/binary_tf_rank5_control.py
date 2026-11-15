#!/usr/bin/env python3
"""One prescribed rank-five non-TF control; not a rank-five census."""
from itertools import combinations
from pathlib import Path
import datetime,hashlib,json,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
u,v,p,q,r=1,2,4,8,16
s=u^v^p^q^r
spokes=[u,v,p,q,r,s]
rims=[u^v,u^p,u^q,v^r,v^s]
E=sorted(set(spokes+rims));assert len(E)==11
tri=sorted({tuple(sorted((x,y,x^y))) for x,y in combinations(E,2) if x^y in E})
expected=sorted([tuple(sorted(t)) for t in ((u,v,u^v),(u,p,u^p),(u,q,u^q),(v,r,v^r),(v,s,v^s))])
assert tri==expected
covers=[];odd=[]
for mask in range(1<<len(E)):
    C={x for i,x in enumerate(E) if mask>>i&1}
    hits=[len(C&set(t)) for t in tri]
    if all(hits):covers.append(C)
    if all(h%2 for h in hits):odd.append(C)
tau=min(map(len,covers));pi=min(map(len,odd))
mins=[C for C in covers if len(C)==tau]
assert tau==2 and pi==3 and mins==[{u,v}]
assert not all(any(set(t)<=C for C in mins) for t in tri)
x={'status':'EXACT RANK-FIVE NON-TF CONTROL','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),
'host':platform.platform(),'points':E,'spoke_points':spokes,'rim_points':rims,'triangles':tri,
'proper_binary_rank':5,'tau':tau,'pi':pi,'TF':False,'unique_minimum_cover':[u,v],
'minimum_odd_cover':sorted(min(odd,key=len)),
'scope':'One prescribed11-point restriction of F2^5. Its five-triangle hypergraph is also the actual triangle family of the cone over a six-vertex double-star. It does not refute H-BTF because TF fails.',
'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(ROOT/'evidence/binary_tf/rank5_control.json').write_text(json.dumps(x,indent=2)+'\n')
print(json.dumps(x,indent=2))
