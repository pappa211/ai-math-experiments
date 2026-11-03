#!/usr/bin/env python3
"""Persisted fresh adversary's direct literal checks.

The initial ad hoc execution was on 2026-11-02 at approximately 18:26 UTC.
This version preserves the same mathematical tests and records their output
as one JSON artifact. It imports no existing solver. The reviewer had read
prior checker code, so blind code independence is NOT claimed.
"""
import json,itertools,time
from hashlib import sha256
from pathlib import Path
root=Path(__file__).resolve().parents[1]
start=time.monotonic()
results=[]
sources=[]
def load(rel):
    raw=(root/rel).read_bytes()
    sources.append({'path':rel,'sha256':sha256(raw).hexdigest()})
    return json.loads(raw)
def edges(t): return frozenset(itertools.combinations(sorted(t),2))
def triangles(n,E): return [t for t in itertools.combinations(range(n),3) if edges(t)<=E]
def check_pack(P,E,C,allowed=(1,2)):
    used=set()
    for t in P:
        q=edges(t)
        assert q<=E and len(q&C) in allowed and not q&used
        used.update(q)
    return len(P)
for fn in ['track_a_private_multiplicity_two.json','track_a_private_multiplicity_two_reduced.json']:
    w=load('witnesses/'+fn); E=set(map(tuple,w['edges'])); C=set(map(tuple,w['cover'])); a=w['n']-1; B={e for e in E if a not in e}; T=triangles(w['n'],E)
    assert not triangles(a,B)
    assert len(T)==len(B) and all(a in t for t in T)
    neighbors=[set() for _ in range(a)]
    for u,v in B: neighbors[u].add(v);neighbors[v].add(u)
    checked=0
    for S in itertools.combinations(range(a),7):
        checked+=1
        assert any(v in neighbors[u] for u,v in itertools.combinations(S,2)),S
    assert not any(edges(t)<=B for t in itertools.combinations(range(6),2))
    assert all(any(e in C for e in edges(t)) for t in T)
    assert all(sum(edges(t)&C=={e} for t in T)==2 for e in C)
    p=check_pack(w['private_packing'],E,C,(1,));k=check_pack(w['eligible_packing'],E,C)
    assert all(len(edges(t)&{(i,a) for i in range(6)})==1 for t in T if len(edges(t)&C)==1)
    results.append({'input':fn,'all_actual_triangles':len(T),'seven_vertex_subsets_checked':checked,'alpha':6,'tau':a-6,'private_packing':p,'eligible_packing':k})
w=load('witnesses/track_a_unique_prepacking.json');E=set(map(tuple,w['edges']));C=set(map(tuple,w['cover']));T=triangles(w['n'],E)
k5=set((1,2,3,4,7));k4=set((0,5,7,8));outside={t for t in T if not set(t)<=k5 and not set(t)<=k4}
assert outside=={(2,4,6),(4,6,8),(4,7,8)}
assert all(edges(t)&C for t in T)
assert [t for t in T if edges(t)&C=={(4,6)}]==[(4,6,8)]
assert check_pack(w['eligible_packing'],E,C)==5 and check_pack(w['forced_packing'],E,C)==4
results.append({'input':'A3','actual_triangle_count':len(T),'actual_outside':sorted(outside),'packings_checked':[5,4]})
b=load('evidence/track_b_small.json')['B8'];E=set(map(tuple,b['edges']));T=triangles(10,E);mins=[]
for s in range(5):
    found=[frozenset(Q) for Q in itertools.combinations(E,s) if all(edges(t)&set(Q) for t in T)]
    if found: mins=found;assert s==4;break
expected=[frozenset({(0,3),(1,3),(2,3),e}) for e in [(0,1),(0,2),(1,2)]]
assert set(mins)==set(expected)
for C in mins:
    allred=[t for t in T if edges(t)<=C];assert len(allred)==1
    assert check_pack([(0,1,2),(0,3,4),(1,3,6),(2,3,8)],E,set(C))==4
    avoiding=[t for t in T if not edges(t)&edges(allred[0]) and len(edges(t)&C) in (1,2)]
    assert all(edges(t)&edges(q) for t,q in itertools.combinations(avoiding,2))
results.append({'input':'B8','minimum_covers':len(mins),'tau':4,'k_all':4,'max_avoiding_each_allred':1})
C={(0,1),(2,3),(2,4),(3,4)};E=set(itertools.combinations(range(5),2));T=triangles(5,E)
pairs=[((0,1),(2,3)),((0,1),(2,4)),((0,1),(3,4)),((2,3),(2,4)),((2,3),(3,4)),((2,4),(3,4))]
packs=[[(0,2,4),(1,3,4)],[(0,2,3),(1,3,4)],[(0,2,3),(1,2,4)],[(0,1,2),(0,3,4)],[(0,1,3),(0,2,4)],[(0,1,4),(0,2,3)]]
assert all(edges(t)&C for t in T)
for forbidden,P in zip(pairs,packs):
    assert check_pack(P,E,C)==2 and not set(forbidden)&set().union(*(edges(t) for t in P))
results.append({'input':'Track C K5','six_red_pair_avoidance_witnesses':'PASS'})
output={'status':'PASS','scope':'Literal A3, two A4 cones, B8 and six Track C K5 witnesses only; no graph census',
        'independence':'Fresh direct code, no solver imports; earlier checker had been read',
        'initial_ad_hoc_elapsed_seconds':0.058558291999361245,
        'persisted_replay_elapsed_seconds':time.monotonic()-start,'sources':sources,'results':results}
(root/'evidence/fresh_adversarial.json').write_text(json.dumps(output,indent=2)+'\n')
print(json.dumps({'status':output['status'],'elapsed_seconds':output['persisted_replay_elapsed_seconds'],'output':'evidence/fresh_adversarial.json'}))
