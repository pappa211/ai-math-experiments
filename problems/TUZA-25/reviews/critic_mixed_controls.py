#!/usr/bin/env python3
"""Independent tiny semantic controls; not a universal proof or graph census replay."""
from functools import lru_cache
from itertools import combinations, product
from pathlib import Path
import hashlib
import json
import platform
import sys
import time

ROOT=Path(__file__).resolve().parents[1]
START=time.monotonic()
def require(ok, message):
    if not ok: raise ValueError(message)
def edges_on(vs):
    return frozenset(tuple(sorted(e)) for e in combinations(vs,2))
def subsets(xs):
    xs=tuple(xs)
    for size in range(len(xs)+1):
        yield from combinations(xs,size)
@lru_cache(None)
def triangles(E):
    vs=sorted(set(v for e in E for v in e))
    return tuple(edges_on(t) for t in combinations(vs,3) if edges_on(t)<=E)
def feasible_family(family):
    return sum(map(len,family)) == len(frozenset().union(*family))
@lru_cache(None)
def optimum(E,N):
    require(N<=E,'N not a graph-edge subset')
    T=triangles(E)
    require(all(t-N for t in T),'inadmissible forbidden triangle')
    A=E-N
    F=tuple(t-N for t in T)
    tau=next(size for size in range(len(A)+1)
             if any(all(set(c)&t for t in F) for c in combinations(A,size)))
    nu=max(len(fam) for fam in subsets(F) if feasible_family(fam))
    return nu,tau
@lru_cache(None)
def is_B(E):
    todo=set(triangles(E))
    while todo:
        first=todo.pop(); frontier=[first]; comp=[first]
        while frontier:
            t=frontier.pop()
            found={u for u in todo if t&u}
            todo-=found; frontier.extend(found); comp.extend(found)
        support=frozenset().union(*comp)
        vertices=set(v for e in support for v in e)
        if len(vertices) not in (4,5) or support != edges_on(vertices): return False
    return True

def weighted_cover_cost(E,N):
    q=len(E-N); M=q+1
    return min(sum(M if e in N else 1 for e in c)
               for c in subsets(E) if all(set(c)&t for t in triangles(E)))

require(platform.system()=='Darwin','local Mac required')
require(sys.executable=='PRIVATE_PATH_REMOVED','pinned Python required')
universe=tuple(sorted(edges_on(range(4))))
counts={'edge_colorings_examined':0,'admissible_instances':0,'inadmissible_instances':0,
        'allowed_edge_branches':0,'inadmissible_forbid_branches':0,
        'fan_checks':0,'inclusion_maximal_active_packings_checked':0,
        'equality_classifications_checked':0,'weighted_cover_checks':0}
for state in product(range(3),repeat=len(universe)):
    counts['edge_colorings_examined']+=1
    E=frozenset(e for e,s in zip(universe,state) if s)
    N=frozenset(e for e,s in zip(universe,state) if s==2)
    T=triangles(E)
    if any(t<=N for t in T):
        counts['inadmissible_instances']+=1
        continue
    counts['admissible_instances']+=1
    nu,tau=optimum(E,N)
    require(weighted_cover_cost(E,N)==tau,'finite weighted cover semantics failed')
    counts['weighted_cover_checks']+=1
    # Every multiset repetition would repeat a nonempty allowed footprint;
    # a size > q would consume > q allowed capacities. These are checked
    # from the actual footprints; no relaxation is accepted as an optimum.
    require(all(t-N for t in T) and nu<=len(E-N),'finite capacity bound failed')
    active=any(t&N for t in T)
    require(tau<=2*nu,'tiny semantic mixed inequality control failed')
    require((tau==2*nu)==((not active) and is_B(E)),'tiny mixed equality control failed')
    counts['equality_classifications_checked']+=1
    for e in E-N:
        counts['allowed_edge_branches']+=1
        H=E-{e}
        dnu,dtau=optimum(H,N)
        Nnew=N|{e}
        admissible=not any(t<=Nnew for t in T)
        if not admissible:
            counts['inadmissible_forbid_branches']+=1
            require(tau==1+dtau,'inadmissible branch not forced')
            continue
        fnu,ftau=optimum(E,Nnew)
        require(tau==min(1+dtau,ftau),'cover recurrence failed')
        pages=[t for t in T if e in t]
        D=[t-Nnew for t in pages]
        require(all(D) and feasible_family(D),'page footprints not nonempty/disjoint')
        fan=max(len(U)+optimum(H-frozenset().union(*U),N)[0] for U in subsets(D))
        require(fnu==fan,'forbidden fan identity failed')
        alternatives=[dnu]+[1+optimum(H-d,N)[0] for d in D]
        require(nu==max(alternatives),'allowed fan identity failed')
        counts['fan_checks']+=1
    active_triangles=[t for t in T if t&N]
    for P in subsets(active_triangles):
        F=[t-N for t in P]
        if not feasible_family(F): continue
        S=frozenset().union(*F)
        if any(not (t-N)&S for t in active_triangles if t not in P): continue
        H=E-S
        counts['inclusion_maximal_active_packings_checked']+=1
        require(not any(t&N for t in triangles(H)),'maximal peeling leaves active triangle')
        hnu,htau=optimum(H,frozenset())
        require(len(S)<=2*len(P),'peeling cost bound failed')
        require(tau<=len(S)+htau,'peeling cover transfer failed')
        require(nu>=len(P)+hnu,'peeling packing transfer failed')

# Deliberately retain forbidden/background edges in final-restoration controls.
lemma_examples=[]
examples=[
    ('one_page_with_extra_forbidden_background',
     edges_on((2,3,4,5))|{(0,1),(0,3)}, frozenset({(0,1),(0,3)})),
    ('two_pages_with_two_extra_forbidden_background_edges',
     edges_on((2,3,4,5,6))|{(0,1),(0,3),(1,4)}, frozenset({(0,1),(0,3),(1,4)})),
    ('two_pages_across_vertex_sharing_old_cliques',
     edges_on((2,3,4,5))|edges_on((0,3,6,7))|{(0,1),(1,4)}, frozenset({(0,1),(1,4)})),
]
for name,H,N in examples:
    H=frozenset(H); G=H|{(0,2),(1,2)}
    require(is_B(H),'example lacks old B')
    require(not any(t&N for t in triangles(H)),'N active in old graph')
    require(not any(t<=N for t in triangles(G)),'example inadmissible')
    m,htau=optimum(H,N)
    nu,tau=optimum(G,N)
    require(htau==2*m and tau<=2*nu-1,'restoration strictness failed')
    lemma_examples.append({'name':name,'H_edges':sorted(H),'N':sorted(N),
                           'restored_edges':[(0,2),(1,2)],
                           'H_nu':m,'H_tau':htau,'G_nu':nu,'G_tau':tau,
                           'H_triangles':len(triangles(H)),'G_triangles':len(triangles(G))})
# Same-apex pages force the forbidden old triangle 0-1-3, so the lemma's
# inactivity premise, rather than its proof, must reject this input.
bad_H=frozenset({(0,1),(0,3),(1,3),(2,3)})
require(any(t&{(0,1)} for t in triangles(bad_H)),'same-apex negative control not rejected')

proof=ROOT/'notes/mixed_frozen_theorems.md'
result={'status':'PASS','scope':'All three-state edge colorings on a fixed four-vertex universe; tiny semantic controls only, not the reported census or a universal proof.',
        'counts':counts,'lemma4_examples':lemma_examples,
        'negative_control':'Same-apex new pages have an old triangle meeting forbidden uv; inactivity is correctly rejected.',
        'method':'Independent standard-library exact enumeration; no discovery imports, optimization packages, remote execution, or timeout.',
        'proof_sha256':hashlib.sha256(proof.read_bytes()).hexdigest(),
        'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        'python':sys.version,'python_executable':sys.executable,'platform':platform.platform(),
        'elapsed_seconds':time.monotonic()-START}
out=ROOT/'reviews/critic_mixed_controls.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':result['status'],'counts':counts,'lemma4_optima':[{k:x[k] for k in ('name','H_nu','H_tau','G_nu','G_tau')} for x in lemma_examples],'elapsed_seconds':result['elapsed_seconds']}))
