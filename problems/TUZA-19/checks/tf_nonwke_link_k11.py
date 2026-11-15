#!/usr/bin/env python3
"""Local exact K11 and link-clique facts for one structural counterconstruction.
Not a search for a large incidence graph; no global finite witness is asserted.
"""
from itertools import combinations
from pathlib import Path
import hashlib,json,datetime,platform
assert platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
def edge(a,b):return tuple(sorted((a,b)))
def edges(vs):return set(combinations(sorted(vs),2))
# Affine-plane lines on the old9 points encoded3*x+y. Remove the two nonzero
# rows and two nonzero columns; their spokes form an8-cycle plus leftoverC4.
lines=set()
for x in range(3):lines.add(tuple(sorted(3*x+y for y in range(3))))
for y in range(3):lines.add(tuple(sorted(3*x+y for x in range(3))))
for slope in (1,2):
    for c in range(3):lines.add(tuple(sorted(3*x+(slope*x+c)%3 for x in range(3))))
assert len(lines)==12
remove={(3,4,5),(6,7,8),(1,4,7),(2,5,8)}
P=sorted(lines-remove)
cycle=[4,3,5,2,8,6,7,1]
for i in range(8):
    P.append(tuple(sorted((9 if i%2==0 else 10,cycle[i],cycle[(i+1)%8]))))
P.append((0,9,10));assert len(P)==17
K=edges(range(11));used=set()
for t in P:
    f=edges(t);assert f<=K and used.isdisjoint(f);used|=f
leave=K-used
assert leave=={(4,5),(5,8),(7,8),(4,7)}
# Root-avoiding certificate for every possible root via a literal relabeling.
root_packings={}
for u,v in sorted(K):
    image={4:u,5:v}
    rem_old=[i for i in range(11) if i not in (4,5)]
    rem_new=[i for i in range(11) if i not in (u,v)]
    image.update(zip(rem_old,rem_new))
    pk=[tuple(sorted(image[i] for i in t)) for t in P]
    ee=set()
    for t in pk:assert ee.isdisjoint(edges(t));ee|=edges(t)
    assert len(pk)==17 and (u,v) not in ee
    root_packings[str((u,v))]=pk
# Balanced internal-edge covers are minimum25 by the ordinary Mantel bound.
tri=list(combinations(range(11),3));covers=[]
for side in combinations(range(11),5):
    C=edges(side)|edges(set(range(11))-set(side))
    assert len(C)==25 and all(len(C&edges(t)) in (1,3) for t in tri)
    covers.append(C)
assert all(any(edges(t)<=C for C in covers) for t in tri)
assert all(any((e in C)==val for C in covers) for e in K for val in (False,True))
# Exact vertex-cover values after each matching-size symmetry type in K4,K10.
link_tables={}
for n in (4,10):
    table=[]
    for k in range(n//2+1):
        M={edge(2*i,2*i+1) for i in range(k)}
        remaining=edges(range(n))-M
        independent=[S for j in range(n+1) for S in combinations(range(n),j) if edges(S).isdisjoint(remaining)]
        alpha=max(map(len,independent));vc=n-alpha
        assert vc>=n-2
        table.append({'removed_matching_size':k,'independence_number':alpha,'vertex_cover_number':vc})
    link_tables[str(n)]=table
x={'status':'PASS exact local certificates for the K11 TF/non-WKE-link construction',
'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.platform(),
'verifier_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
'K11_packing':P,'K11_uncovered_edges':sorted(leave),'K11_root_avoiding_packings':root_packings,
'K11_minimum_cover_size':25,'balanced_cover_count':len(covers),'K11_triangle_count':len(tri),
'K11_full_triangle_covers_verified':len(tri),'link_clique_vertex_cover_tables':link_tables,
'scope':'Only local finite facts. The large counterexample remains an ordinary existence construction from the earlier probabilistic K5-incidence lemma.'}
(ROOT/'evidence/tf_nonwke_link/k11_local_certificate.json').write_text(json.dumps(x,indent=2)+'\n')
print(json.dumps({k:x[k] for k in ('status','K11_packing','K11_uncovered_edges','K11_minimum_cover_size','balanced_cover_count','K11_triangle_count','link_clique_vertex_cover_tables')},indent=2))
