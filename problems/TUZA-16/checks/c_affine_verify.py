#!/usr/bin/env python3
"""Independent certificate verifier: adjacency intersections, no construction imports."""
import sys,json,itertools,platform,datetime
D=json.load(open(sys.argv[1]));receipt=[]
M=((0,0,0,0),(0,1,2,3),(0,2,3,1),(0,3,1,2))
for c in D['cases']:
    n=c['n'];E={frozenset(e) for e in c['edges']};adj=[set() for _ in range(n)]
    assert len(E)==len(c['edges'])
    for e in E:
        a,b=sorted(e);assert 0<=a<b<n;adj[a].add(b);adj[b].add(a)
    T=set()
    for a in range(n):
        for b in adj[a]:
            if b>a:
                for d in adj[a]&adj[b]:
                    if d>b:T.add((a,b,d))
    assert T==set(map(tuple,c['triangles']))
    owner={}
    for k,copy in enumerate(c['copies']):
        a,b=copy['slope'],copy['intercept'];V={4*i+(M[a][i]^b) for i in range(4)}
        assert V==set(copy['vertices'])
        ce={frozenset(e) for e in copy['edges']}
        assert ce=={frozenset(e) for e in itertools.combinations(V,2)}
        for e in ce:assert e in E and e not in owner;owner[e]=k
    assert set(owner)==E
    planted={t for t in T if len({owner[frozenset(e)] for e in itertools.combinations(t,2)})==1}
    assert planted==set(map(tuple,c['planted'])) and T-planted==set(map(tuple,c['mixed']))
    def pack(ts):
        used=set()
        for t in ts:
            assert tuple(sorted(t)) in T
            es={frozenset(e) for e in itertools.combinations(t,2)}
            assert not used&es;used|=es
        return len(ts)
    val=pack(c['greedy_packing'])
    row={'slopes':c['slopes'],'full_triangles_reconstructed':len(T),'packing_witness_size':val}
    if 'exact_packing' in c:
        v=pack(c['exact_packing']);assert v==32 and len(E)==3*v
        C={frozenset(e) for e in c['exact_cover']};assert C<=E and len(C)==32
        assert all(any(frozenset(e) in C for e in itertools.combinations(t,2)) for t in T)
        # Exhaust all 4^4 transversals; each is K4, certifying cover-averaging identity structurally.
        for coords in itertools.product(range(4),repeat=4):
            V=[4*i+coords[i] for i in range(4)]
            assert all(frozenset(e) in E for e in itertools.combinations(V,2))
        row.update(nu=32,tau=32,certificate='packing covers all edges; cover feasible; all 256 K4 transversals checked')
    receipt.append(row)
R={'status':'PASS','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'python':platform.python_version(),'independence':'No producer import; GF(4) static table, adjacency intersections; exact integer checks. Not an independently authored implementation.','cases':receipt}
print(json.dumps(R,indent=2))
