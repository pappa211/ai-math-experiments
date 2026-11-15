"""Exact simultaneous Delta-Y encoding and closed-terminal obstruction controls.
Standard library only. All graph triangles and parity states are reconstructed.
"""
from itertools import combinations
from collections import Counter
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parents[1]
def edges(t):return set(combinations(sorted(t),2))
def all_triangles(V,E):return [t for t in combinations(V,3) if edges(t)<=E]
def disjoint(q):return len(set().union(*(edges(t) for t in q)))==3*len(q)
def transform(V,E,P):
    B=set().union(*(edges(t) for t in P));phi={};apices=list(range(max(V)+1,max(V)+1+len(P)))
    assert len(B)==3*len(P)
    for a,t in zip(apices,P):
        for e in edges(t):phi[e]=tuple(sorted((a,next(v for v in t if v not in e))))
    for e in E-B:phi[e]=e
    EH=set(phi.values());VH=V+apices
    assert len(EH)==len(E) and not all_triangles(VH,EH)
    return phi,apices,VH,EH

def boundary(C,phi,V):
    d=Counter(v for e in C for v in phi[e]);return sorted(v for v in V if d[v]%2)

def lift_check(V,E,P,phi,apices):
    N=E-set().union(*(edges(t) for t in P));out=[]
    for q in all_triangles(V,E):
        if q in P:continue
        owners=[i for i,t in enumerate(P) if edges(q)&edges(t)]
        assert owners and all(len(edges(q)&edges(P[i]))==1 for i in owners)
        cycle={phi[e] for e in edges(q)}
        for i in owners:cycle^={phi[e] for e in edges(P[i])}
        deg=Counter(v for e in cycle for v in e)
        assert set(deg.values())=={2} and len(cycle)==3+len(owners)
        # Degree2 plus connectedness establishes a simple cycle.
        reach={next(iter(deg))}
        while True:
            more=reach|{v for e in cycle if set(e)&reach for v in e}
            if more==reach:break
            reach=more
        assert reach==set(deg)
        assert sum(2 if e in N else 1 for e in cycle)==6
        out.append({'triangle':q,'owners':owners,'lifted_cycle':sorted(cycle)})
    return out

V=list(range(5));E=set(combinations(V,2));T=all_triangles(V,E)
Ps=[list(p) for p in combinations(T,2) if disjoint(p)]
assert len(Ps)==15 and not any(disjoint(p) for p in combinations(T,3))
Es=sorted(E);covers=[]
for k in range(11):
    covers=[set(c) for c in combinations(Es,k) if all(set(c)&edges(t) for t in T)]
    if covers:break
assert k==4 and len(covers)==10
assert all(any(e in c for c in covers) for e in E)
resilience=[]
for k in range(3):
    for S in combinations(Es,k):
        ps=next(p for p in Ps if not set().union(*(edges(t) for t in p))&set(S))
        resilience.append({'deleted_edges':S,'packing':ps})
assert len(resilience)==56
rows=[]
for P in Ps:
    phi,A,VH,EH=transform(V,E,P);lifts=lift_check(V,E,P,phi,A);states=[]
    for m in range(1<<10):
        C={e for j,e in enumerate(Es) if m>>j&1}
        b=boundary(C,phi,VH)
        if b!=A:continue
        uncovered=[t for t in T if not C&edges(t)]
        states.append({'cover_edges':sorted(C),'transformed_edges':sorted(phi[e] for e in C),'size':len(C),'uncovered_triangles':uncovered})
    feasible=[s for s in states if not s['uncovered_triangles']]
    assert len(states)==16 and len(feasible)==7 and min(s['size'] for s in feasible)==6
    boundary_sizes=[len(boundary(c,phi,V)) for c in covers]
    assert min(boundary_sizes)==2 and set(boundary_sizes)=={2,4}
    rows.append({'packing':P,'phi':[[e,phi[e]] for e in Es],'transformed_vertices':VH,'transformed_edges':sorted(EH),'triangle_lifts':lifts,'all_closed_T_join_states':states,'closed_T_join_cover_minimum':6,'minimum_ordinary_cover_old_boundary_sizes':boundary_sizes})
# A separate actual-graph independence-system check for the graphic-matroid shortcut.
V4=list(range(4));E4=set(combinations(V4,2));Ts4=all_triangles(V4,E4)
small=edges((0,1))|edges((0,2))|edges((0,3))
large={(0,1),(1,2),(2,3),(0,3)}
assert len(small)==3 and len(large)==4
assert not any(edges(t)<=small for t in Ts4) and not any(edges(t)<=large for t in Ts4)
assert all(any(edges(t)<=small|{e} for t in Ts4) for e in large-small)
# Finite controls of the all-size bouquet proof, with explicit sharp terminal states.
bouquets=[]
for m in range(1,6):
    Vb=list(range(1+4*m));Eb=set();Pb=[];Cb=set();Cclosed=set();local=[]
    for i in range(m):
        a,b,c,d=range(1+4*i,5+4*i);block=[0,a,b,c,d]
        Eb|=edges(block);Pb += [tuple(sorted((a,0,b))),tuple(sorted((a,c,d)))]
        Cb|=edges((a,0,b))|{(c,d)}
        Cclosed|=edges((0,b,c,d))
        local.extend(all_triangles(sorted(block),edges(block)))
    Tb=all_triangles(Vb,Eb)
    assert set(Tb)==set(local) and len(Tb)==10*m and len(Eb)==10*m
    phi,A,VH,EH=transform(Vb,Eb,Pb);lifts=lift_check(Vb,Eb,Pb,phi,A)
    assert len(Cb)==4*m and all(Cb&edges(t) for t in Tb)
    bb=boundary(Cb,phi,Vb)
    assert len(bb)==m+m%2 and boundary(Cb,phi,A)==A
    assert len(Cclosed)==6*m and all(Cclosed&edges(t) for t in Tb)
    assert boundary(Cclosed,phi,VH)==A
    bouquets.append({'m':m,'vertices':Vb,'edges':sorted(Eb),'triangles':Tb,'packing':Pb,'nu':2*m,'tau':4*m,'minimum_closed_T_join_cover':6*m,'minimum_factor_two_cover_old_boundary':m+m%2,'factor_two_cover':sorted(Cb),'old_boundary':bb,'closed_cover':sorted(Cclosed),'scope':'Counts and optimality from proved local-block factorization; explicit graph, triangles, covers and parities checked here.'})
result={'status':'PASS','K5':{'vertices':V,'edges':Es,'triangles':T,'nu':2,'tau':4,'all_minimum_covers':[sorted(c) for c in covers],'criticality_certificate':'Every graph edge occurs in a displayed minimum4-cover.','two_edge_resilience_certificates':resilience,'all_maximum_packings_and_closed_join_states':rows},'graphic_independence_failure':{'graph':'K4','smaller_maximal_triangle_free_edge_set':sorted(small),'larger_triangle_free_edge_set':sorted(large)},'bouquet_controls':bouquets,'scope':'Exact literal obstruction to the closed-original-boundary T-join availability gate, including all maximum K5 packings; not a rejection of all Delta-Y, matroid-parity or unrestricted cover approaches.'}
out=ROOT/'evidence/packing_routes/packing_new_delta_y.json';out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','K5_maximum_packings':len(rows),'closed_states_each':16,'closed_cover_minimum_each':6,'resilience_deletion_sets':len(resilience),'bouquet_controls':len(bouquets),'output':str(out)}))
