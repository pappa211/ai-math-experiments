#!/usr/bin/env python3
"""Exact certificate for A4 obstruction; no solver or third-party dependency."""
import itertools, json, platform, sys
from pathlib import Path

def mycielski(n, edges):
    out=set(edges)
    for a,b in edges:
        out.add(tuple(sorted((a,n+b))))
        out.add(tuple(sorted((b,n+a))))
    out.update((n+i,2*n) for i in range(n))
    return 2*n+1, sorted(out)

n=5
base=sorted({tuple(sorted((i,(i+1)%5))) for i in range(5)})
for _ in range(2):
    n,base=mycielski(n,base)
assert n==23 and len(base)==71
base_set=set(base)
assert not any(all(tuple(sorted(e)) in base_set for e in itertools.combinations(v,2)) for v in itertools.combinations(range(n),3))
# Construction proof in A_PROOFS.md establishes chi(base)=5; this script
# intentionally does not represent a solver's finite test as that proof.
t=24
apex=n*t
edges={(a*t+i,b*t+j) for a,b in base for i in range(t) for j in range(t)}
edges.update((i,apex) for i in range(apex))
edges=sorted(edges)
adj=[set() for _ in range(apex+1)]
for a,b in edges:
    adj[a].add(b);adj[b].add(a)
# Independent reconstruction by intersection of actual neighborhoods.
triangles=[]
for a,b in edges:
    for c in sorted(adj[a]&adj[b]):
        if c>b: triangles.append((a,b,c))
assert len(triangles)==40896
assert all(c==apex for a,b,c in triangles)
expected={(a*t+i,b*t+j,apex) for a,b in base for i in range(t) for j in range(t)}
assert set(triangles)==expected
# A maximal rim matching provides a completely explicit Tuza certificate.
used=set();matching=[]
for a,b in edges:
    if b!=apex and a not in used and b not in used:
        matching.append((a,b));used.update((a,b))
packing=[(a,b,apex) for a,b in matching]
cover=[(v,apex) for v in sorted(used)]
pe=set()
for tri in packing:
    tes={tuple(e) for e in itertools.combinations(tri,2)}
    assert tes <= set(edges) and not (tes&pe)
    pe |= tes
cover_set=set(cover)
assert all(any(tuple(e) in cover_set for e in itertools.combinations(tri,2)) for tri in triangles)
assert len(cover)==2*len(packing)
assert len(edges)==41448
assert t*t>n*t
out={"construction":"cone over independent-twin t-blow-up of M(M(C5))", "base_order":n,"base_edges":base,"t":t,"apex":apex,"vertices":list(range(apex+1)),"edges":edges,"triangles":triangles,"packing":packing,"cover":cover,"counts":{"vertices":apex+1,"edges":len(edges),"triangles":len(triangles),"packing_certificate":len(packing),"cover_certificate":len(cover)},"proved_upper_bound_2nu":n*t,"proved_lower_bound_fourcut_deletion":t*t,"bounds_source":"notes/A_PROOFS.md","python":sys.version,"platform":platform.platform(),"solver_status":"NOT_APPLICABLE; exact standard-library certificate"}
path=Path("notes/A_FOURCUT_WITNESS.json")
path.write_text(json.dumps(out,separators=(",",":"))+"\n")
print(json.dumps({"output":str(path),"counts":out["counts"],"2nu_upper_bound":n*t,"fourcut_deletion_lower_bound":t*t,"status":"FINITELY_CHECKED_GRAPH_AND_CERTIFICATES; bound proofs ordinary"},indent=2))
