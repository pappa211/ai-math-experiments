"""Literal local verification of W(J), authored for TUZA-19.
No archive checker or LP solver is imported. The all-J proof is separate.
"""
from pathlib import Path
from itertools import combinations, product
from functools import lru_cache
from datetime import datetime, timezone
from hashlib import sha256
import json, platform, sys
START=datetime.now(timezone.utc);STOP=datetime(2026,11,15,9,23,58,tzinfo=timezone.utc)
assert START<STOP and platform.system()=='Darwin'
ROOT=Path(__file__).resolve().parents[1]
def es(t):return frozenset(combinations(sorted(t),2))
def triangles(V,E):return tuple(t for t in combinations(sorted(V),3) if es(t)<=E)
def maxpack(T):
    universe=sorted(set().union(*(es(t) for t in T))) if T else []
    ids={e:i for i,e in enumerate(universe)}
    masks=[sum(1<<ids[e] for e in es(t)) for t in T]
    @lru_cache(None)
    def f(i,used):
        if i==len(T):return ()
        a=f(i+1,used)
        if not masks[i]&used:
            b=(i,)+f(i+1,used|masks[i])
            if len(b)>len(a):a=b
        return a
    return tuple(T[i] for i in f(0,0))
def check(n,core,name):
    core=set(core);m=len(core);V=set(range(n));E=set();H=set();wheels=[];local=[];certificate=[];cover=set();badcover=set();counter=n
    for u,v in sorted(core):
        a,b,c,d=range(counter,counter+4);counter+=4;V.update((a,b,c,d))
        rim=(v,a,b,c,d)
        spokes={tuple(sorted((u,x))) for x in rim}
        rings={tuple(sorted((rim[i],rim[(i+1)%5]))) for i in range(5)}
        Ei=spokes|rings
        assert not E&Ei
        E|=Ei;H|=spokes
        Ti=tuple(tuple(sorted((u,*r))) for r in sorted(rings))
        assert triangles({u,*rim},Ei)==tuple(sorted(Ti))
        local.extend(Ti);wheels.append({'edges':Ei,'spokes':spokes,'rim':rings,'triangles':Ti})
        certificate.extend([tuple(sorted((u,a,b))),tuple(sorted((u,c,d)))])
        cover|={tuple(sorted((u,x))) for x in (v,b,d)}
        badcover|={tuple(sorted((u,x))) for x in (a,c,d)}
        assert len(maxpack(Ti))==2
        minimum=None
        for k in range(4):
            choices=[set(S) for S in combinations(sorted(Ei),k) if all(es(t)&set(S) for t in Ti)]
            if choices:minimum=k;break
        assert minimum==3
    CT=triangles(range(n),core);T=triangles(V,E);CP=maxpack(CT)
    assert set(T)==set(local)|set(CT) and not set(local)&set(CT)
    assert (len(V),len(E),len(T),len(H))==(n+4*m,10*m,5*m+len(CT),5*m)
    assert {e for e in H if max(e)<n}==core
    assert all(sum(v in e for e in H)==1 for v in V-set(range(n)))
    loads={e:sum(e in es(t) for t in local) for e in E}
    # All LP quantities are scaled by 2, so primal spokes=1 and dual local faces=1.
    assert all(loads[e]==(2 if e in H else 1) for e in E)
    assert all(len(es(t)&H)==(2 if t in local else 3) for t in T)
    assert len(local)==len(H)==5*m
    pairs={frozenset(es(t)&H) for t in T if len(es(t)&H)==2}
    assert len(pairs)==5*m and all(len(p)==2 for p in pairs)
    for W in wheels:
        Q={p for p in pairs if p<=W['spokes']}
        assert len(Q)==5 and all(sum(s in p for p in Q)==2 for s in W['spokes'])
        # Solve uniqueness equations by enumerating scaled spoke entries 0,1,2.
        # All LP-real uniqueness is the odd-cycle argument in the ordinary proof.
        assert all(not p&(H-W['spokes']) for p in Q)
        order=sorted(W['spokes'])
        feasible=[]
        for values in product(range(3),repeat=5):
            z=dict(zip(order,values))
            if all(sum(z[e] for e in pair)==2 for pair in Q):feasible.append(values)
        assert feasible==[(1,1,1,1,1)]
    packing=certificate+list(CP)
    assert all(t in T for t in packing)
    assert sum(len(es(t)) for t in packing)==len(set().union(*(es(t) for t in packing))) if packing else True
    assert len(packing)==2*m+len(CP)
    assert len(cover)==3*m and all(es(t)&cover for t in T)
    assert len(badcover)==3*m and all(es(t)&badcover for t in local)
    assert [t for t in T if not es(t)&badcover]==list(CT)
    return {'name':name,'core_vertices':n,'core_edges':sorted(core),'core_triangles':CT,'core_maximum_packing':CP,'vertices':len(V),'edges':sorted(E),'actual_triangles':T,'halfweight_support':sorted(H),'primal_weight_twice':5*m,'dual_weight_twice':5*m,'local_triangle_dual_weights_twice':[[t,1] for t in local],'rim_dual_load_twice':1,'spoke_dual_load_twice':2,'tight_pair_components':[5]*m,'maximum_packing':len(packing),'packing_certificate':packing,'packing_upper_bound':'At most two triangles per wheel plus at most nu(core) original triangles.','cover_number':len(cover),'cover_certificate':sorted(cover),'cover_lower_bound':'At least three edges in each edge-disjoint local wheel triangle family.','independent_local_bad_cover':sorted(badcover),'triangles_missed_by_bad_cover':CT}
cases=[]
for n in (0,3,4,5):cases.append(check(n,combinations(range(n),2),f'K{n}'))
cases.append(check(5,{tuple(sorted((i,(i+1)%5))) for i in range(5)},'C5'))
FINISH=datetime.now(timezone.utc);assert FINISH<STOP
out={'status':'PASS','started_utc':START.isoformat(),'finished_utc':FINISH.isoformat(),'host':platform.platform(),'python':sys.version,'script_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'proof_sha256':sha256((ROOT/'notes/fractional_routes_halfcover_embedding.md').read_bytes()).hexdigest(),'scope':'Five literal cores only; all-core identities and real LP uniqueness are ordinary proof, not exhaustive global verification.','cases':cases}
p=ROOT/'evidence/fractional_routes/halfcover_embedding_check.json';p.write_text(json.dumps(out,indent=2,sort_keys=True)+'\n')
print(json.dumps({'status':'PASS','seconds':(FINISH-START).total_seconds(),'cases':[{'name':r['name'],'n':r['vertices'],'m':len(r['edges']),'triangles':len(r['actual_triangles']),'nu':r['maximum_packing'],'tau':r['cover_number'],'tau_star_twice':r['primal_weight_twice']} for r in cases]},sort_keys=True))
