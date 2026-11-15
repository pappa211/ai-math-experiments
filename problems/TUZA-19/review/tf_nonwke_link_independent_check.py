#!/usr/bin/env python3
"""Independent local/small-control verifier; no producer code or results imported."""
from collections import Counter
from datetime import datetime, timezone
from functools import lru_cache
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json, platform, sys
W = Path(__file__).resolve().parents[1]
out = W / "evidence/tf_nonwke_link_independent"
out.mkdir(parents=True, exist_ok=True)
inputs = {
    "notes/tf_nonwke_link_counterconstruction.md": "02aa09e9ca43458282deff55073580510dcb2204ac3db57e8a88ad2d933f04ce",
    "evidence/binary_tf/cut_obstruction_input.md": "2ec94c291275ae6d02628ffd227d2acd9bb2c3eee638a1369c40bd8fc053ac1b",
    "notes/binary_tf_cone_decoration_obstruction.md": "db3a479a74064b0038274cefc0b64bc9356e79d5dfd37706eb89221fb75c7a16",
}
for name, expected in inputs.items():
    raw = (W/name).read_bytes()
    assert sha256(raw).hexdigest() == expected
    (out/Path(name).name).write_bytes(raw)
assert platform.system() == "Darwin"

def e(a,b): return tuple(sorted((a,b)))
def te(t): return set(combinations(sorted(t),2))
def alltris(vertices,edges):
    return [t for t in combinations(vertices,3) if te(t) <= edges]
def validpacking(ts, edges):
    used=set()
    for t in ts:
        s=te(t)
        assert s <= edges and not used & s
        used |= s
    return used

v11=tuple(range(11)); edges11=set(combinations(v11,2)); tris11=alltris(v11,edges11)
p11=[(0,1,2),(0,3,6),(0,4,8),(0,5,7),(1,3,8),(1,5,6),(2,3,7),(2,4,6),
     (3,4,9),(3,5,10),(2,5,9),(2,8,10),(6,8,9),(6,7,10),(1,7,9),(1,4,10),(0,9,10)]
left=edges11-validpacking(p11,edges11)
assert left == {(4,5),(4,7),(5,8),(7,8)}
roots=[]
for a,b in sorted(edges11):
    dest=[a,b]+[v for v in v11 if v not in (a,b)]
    origin=[4,5]+[v for v in v11 if v not in (4,5)]
    m=dict(zip(origin,dest)); packing=[tuple(sorted(m[x] for x in t)) for t in p11]
    assert e(a,b) not in validpacking(packing,edges11)
    roots.append({"root":[a,b],"packing":packing})
covers11=[]
for part in combinations(v11,5):
    s=set(part); c={ab for ab in edges11 if (ab[0] in s)==(ab[1] in s)}
    assert len(c)==25
    assert all(len(te(t)&c) in (1,3) for t in tris11)
    covers11.append(c)
assert len(covers11)==462
assert all({int(root in c) for c in covers11}=={0,1} for root in edges11)
containing11={t:next(c for c in covers11 if te(t)<=c) for t in tris11}

cliquetables=[]
for k in (4,10):
    vs=range(k); es=set(combinations(vs,2))
    for j in range(k//2+1):
        matching={(2*i,2*i+1) for i in range(j)}; rem=es-matching
        q=next(s for size in range(k+1) for s in combinations(vs,size)
               if all(a in s or b in s for a,b in rem))
        assert len(q)==k-(2 if j else 1)
        cliquetables.append({"clique_order":k,"matching_size":j,"minimum_remaining_cover":len(q),"cover":q})

# Two K5 blocks sharing vertex0: a small interface control, not the large-cut example.
blocks=[tuple(range(5)),(0,5,6,7,8)]
hverts=tuple(range(9)); hedges=set().union(*(te(b) for b in blocks))
htris=alltris(hverts,hedges)
assert len(htris)==20
assert all(sum(te(t)<=te(b) for b in blocks)==1 for t in htris)
@lru_cache(None)
def maxmatch(remaining):
    if not remaining: return ()
    u,*rest=remaining
    best=maxmatch(tuple(rest))
    for v in rest:
        if e(u,v) in hedges:
            cand=(e(u,v),)+maxmatch(tuple(x for x in rest if x!=v))
            if len(cand)>len(best): best=cand
    return best
matching=maxmatch(hverts); mu=len(matching); assert mu==4
cutopts=[]
for bits in range(1<<9):
    c={ab for ab in hedges if ((bits>>ab[0])&1)==((bits>>ab[1])&1)}
    cutopts.append((len(c),bits,c))
tauB,bits,bestcut=min(cutopts,key=lambda x:x[0]); assert tauB==8
apex=9
localmaps={}
wedges=set(hedges)
for v in hverts:
    fresh=tuple(range(10+9*v,19+9*v))
    # Map the root4--5 of K11 to apex--v.
    dst=[apex,v]+list(fresh); src=[4,5]+[x for x in v11 if x not in (4,5)]
    localmaps[v]=dict(zip(src,dst))
    wedges |= set(combinations(sorted(dst),2))
wverts=tuple(range(91)); wtris=alltris(wverts,wedges); wtriedges=[te(t) for t in wtris]
counts=Counter()
for t in wtris:
    if set(t)<=set(hverts): counts["old_H"]+=1
    elif apex in t and len(set(t)&set(hverts))==2: counts["cone"]+=1
    else:
        owners=[v for v,m in localmaps.items() if set(t)<=set(m.values())]
        assert len(owners)==1
        counts["local_K11"]+=1
assert counts=={"old_H":20,"cone":20,"local_K11":1485}
assert (len(wverts),len(wedges),len(wtris))==(91,515,1525)
def mappedcover(v,c):
    m=localmaps[v]; return {e(m[a],m[b]) for a,b in c}
def hcover(containing_triangle=None):
    cover=set()
    for b in blocks:
        part=set(containing_triangle) if containing_triangle is not None and set(containing_triangle)<=set(b) else set(b[:3])
        cover |= {ab for ab in te(b) if (ab[0] in part)==(ab[1] in part)}
    assert len(cover)==8 and all(te(t)&cover for t in htris)
    return cover
rootone=next(c for c in covers11 if (4,5) in c)
basecover=hcover()|set().union(*(mappedcover(v,rootone) for v in hverts))
assert len(basecover)==233 and all(s&basecover for s in wtriedges)
# A containing cover for every actual small-control triangle, checking every other triangle.
for target in wtris:
    if set(target)<=set(hverts):
        c=hcover(target)|set().union(*(mappedcover(v,rootone) for v in hverts))
    elif apex in target and len(set(target)&set(hverts))==2:
        uv=set(target)-{apex}; ht=next(t for t in htris if uv<=set(t))
        c=hcover(ht)|set().union(*(mappedcover(v,rootone) for v in hverts))
    else:
        v=next(v for v,m in localmaps.items() if set(target)<=set(m.values()))
        inv={y:x for x,y in localmaps[v].items()}; localt=tuple(sorted(inv[x] for x in target))
        c=hcover()|mappedcover(v,containing11[localt])
        c |= set().union(*(mappedcover(u,rootone) for u in hverts if u!=v))
    assert len(c)==233 and te(target)<=c and all(s&c for s in wtriedges)
# Odd-cover extension for every spoke state, not only a minimizing coloring.
for state in range(1<<9):
    c={ab for ab in hedges if ((state>>ab[0])&1)==((state>>ab[1])&1)}
    oldcost=len(c)
    for v in hverts:
        rootvalue=(state>>v)&1
        localc=next(d for d in covers11 if int((4,5) in d)==rootvalue)
        c |= mappedcover(v,localc)
    assert len(c)==225+oldcost
    assert all(len(s&c)%2 for s in wtriedges)

def pack_with_spokes_removed(removed_vertices):
    mm=maxmatch(tuple(v for v in hverts if v not in removed_vertices))
    ts=[tuple(sorted((apex,a,b))) for a,b in mm]
    for b in blocks:
        candidates=[t for t in combinations(b,3) if not te(t)&set(mm)]
        pair=next((t,u) for t,u in combinations(candidates,2) if not te(t)&te(u))
        ts.extend(pair)
    for v,m in localmaps.items(): ts.extend(tuple(sorted(m[x] for x in t)) for t in p11)
    remedges=wedges-{e(apex,v) for v in removed_vertices}
    validpacking(ts,remedges)
    assert len(ts)==153+4+len(mm)
    return ts,mm
packing,_=pack_with_spokes_removed(set()); assert len(packing)==161
blockers=[]
for u,v in sorted(hedges):
    pp,mm=pack_with_spokes_removed({u,v})
    assert len(mm)<=mu-1
    blockers.append({"H_edge":[u,v],"removed_spokes":[e(apex,u),e(apex,v)],
                     "residual_H_matching":mm,"certified_packing_size":len(pp)})
# Derive every link from the literal W graph and verify the claimed clique partition.
neighbors={v:{u for u in wverts if e(u,v) in wedges} for v in wverts}
links=[]
for v in wverts:
    ns=neighbors[v]; le={ab for ab in wedges if set(ab)<=ns}
    reached={next(iter(ns))}
    while True:
        newer=reached|{b for a,b in le if a in reached}|{a for a,b in le if b in reached}
        if newer==reached: break
        reached=newer
    assert reached==ns
    if v==apex:
        parts=[set(m.values())-{apex} for m in localmaps.values()]
    elif v in hverts:
        parts=[set(localmaps[v].values())-{v}]+[set(b)-{v} for b in blocks if v in b]
    else:
        owner=next(u for u,m in localmaps.items() if v in m.values())
        parts=[set(localmaps[owner].values())-{v}]
    assert set().union(*parts)==ns and sum(map(len,parts))==len(ns)
    assert all(te(part)<=le for part in parts)
    lower=sum(len(part)-2 for part in parts); upper=len(ns)//2
    assert lower>upper
    links.append({"vertex":v,"link_vertices":sorted(ns),"link_edges":sorted(le),
                  "disjoint_cliques":[sorted(s) for s in parts],
                  "cover_lower_bound_for_every_matching":lower,"matching_upper_bound":upper})
receipt={"created_utc":datetime.now(timezone.utc).isoformat(),"host":platform.system(),"python":sys.version,
 "input_hashes":inputs,"producer_code_or_output_read":False,
 "script_sha256":sha256(Path(__file__).read_bytes()).hexdigest(),
 "K11":{"packing":p11,"leave":sorted(left),"root_avoiding_packings":roots,"balanced_cover_count":462,
        "all_triangles_contained_in_some_minimum_cover":True,"clique_matching_deletion_tables":cliquetables},
 "small_control":{"H_blocks":blocks,"H_matching":matching,"H_minimum_cut_monochromatic_edges":sorted(bestcut),
  "H_tauB":tauB,"vertices":wverts,"edges":sorted(wedges),"all_actual_triangles":wtris,
  "triangle_counts":dict(counts),"packing":packing,"minimum_cover_certificate":sorted(basecover),
  "claimed_exact_nu_by_ordinary_upper_bound":161,"claimed_exact_tau_and_pi_by_ordinary_lower_bound":233,
  "TF_target_triangles_checked":len(wtris),"odd_spoke_states_checked":512,"two_spoke_blockers":blockers,"links":links},
 "limits":"The small H is two K5s sharing a vertex and does NOT have the required large cut gap. This computation verifies local certificates, interface closure, TF constructions and link bounds, not the probabilistic existence assertion or a literal counterexample to the proposed parity gate. Universal matching bounds and exact optimality use the reconstructed ordinary proof."}
path=out/'literal_check.json'; path.write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps({"status":"PASS","counts":[91,515,1525],"packing":161,"cover":233,"TF_checks":1525,
                  "spoke_states":512,"link_checks":91,"spoke_blockers":len(blockers),"receipt":str(path),
                  "receipt_sha256":sha256(path.read_bytes()).hexdigest(),"script_sha256":receipt["script_sha256"]},indent=2))
