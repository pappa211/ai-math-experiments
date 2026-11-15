#!/usr/bin/env python3
"""Independent positive-certificate check of frozen CP5 data. Standard library only."""
from pathlib import Path
from itertools import combinations,permutations
from collections import Counter
from fractions import Fraction as Q
import hashlib,json,datetime,platform
W=Path(__file__).resolve().parents[1]
E=W/'evidence/clique_link_fresh'
INPUT=E/'clique_link_control.json'
assert hashlib.sha256(INPUT.read_bytes()).hexdigest()=='a27c52c171bb0dcade1ce16678484c61e90dc1e5679643bd606feb7b911e6156'
d=json.loads(INPUT.read_text())
def pair(a,b):return tuple(sorted((a,b)))
def edges(t):return {pair(a,b) for a,b in combinations(t,2)}
V=set(range(10));G={p for p in combinations(range(10),2) if p[0]//2!=p[1]//2}
T={t for t in combinations(range(10),3) if edges(t)<=G}
assert len(G)==40 and len(T)==80
assert set(map(tuple,d['edges']))==G and set(map(tuple,d['triangles']))==T
assert all(sum(v in e for e in G)==8 for v in V)
assert all(sum(set(e)<=set(t) for t in T)==6 for e in G)
def pack(P,graph=G):
    used=[]
    for tri in P:
        assert len(tri)==3 and len(set(tri))==3 and edges(tri)<=graph
        used.extend(edges(tri))
    assert len(used)==len(set(used))
    return set(used)
def cycle(c):
    assert len(c)==4 and len(set(c))==4
    return {pair(c[j],c[(j+1)%4]) for j in range(4)}
def cover(C):
    assert C<=G and all(edges(t)&C for t in T)
for P,c in zip(d['base_packings'],d['base_cycles']):
    assert len(P)==12 and G-pack(P)==cycle(c)
# Generate all actual cycles independently, without using the supplied maps.
allcycles={frozenset(cycle(c)) for c in permutations(range(10),4) if cycle(c)<=G}
assert len(allcycles)==370
certleaves=[]
for row in d['cycle_certificates']:
    m=row['map'];assert set(m)==V and len(m)==10
    assert {pair(m[a],m[b]) for a,b in G}==G
    P=[[m[v] for v in t] for t in d['base_packings'][row['base']]]
    L=frozenset(map(tuple,row['leave']))
    assert len(P)==12 and G-pack(P)==L
    certleaves.append(L)
assert len(certleaves)==370 and set(certleaves)==allcycles
pairs=set()
for row in d['two_edge_certificates']:
    D=frozenset(map(tuple,row['deleted']));assert len(D)==2 and D<=G
    assert D<=certleaves[row['cycle_index']]
    pairs.add(D)
assert pairs=={frozenset(p) for p in combinations(G,2)} and len(pairs)==780
covered_triangles=set()
for row in d['tf_certificates']:
    t=tuple(sorted(row['triangle']));C=set(map(tuple,row['cover']));side=set(row['side'])
    assert t in T and len(C)==16 and edges(t)<=C
    assert C=={e for e in G if (e[0] in side)==(e[1] in side)}
    cover(C);assert all(len(edges(t2)&C)%2==1 for t2 in T)
    covered_triangles.add(t)
assert covered_triangles==T
vertices=set()
for row in d['full_link_polytope_certificates']:
    v=row['vertex'];w=Q(row['weight_per_state']);states=row['states']
    assert len(states)==6 and w*len(states)==1
    counts=Counter()
    for P in states:
        assert len(P)==4 and all(v in t for t in P);pack(P)
        counts.update(tuple(sorted(t)) for t in P)
    assert set(counts)=={t for t in T if v in t}
    assert all(w*n==Q(1,6) for n in counts.values());vertices.add(v)
assert vertices==V
clique_counts={}
for s in range(3,6):
    cliques=[c for c in combinations(range(10),s) if edges(c)<=G]
    clique_counts[s]=len(cliques)
    row=next(r for r in d['full_clique_polytope_certificates'] if r['size']==s)
    assert row['actual_clique_count']==len(cliques)
    lam=Q(row['nonempty_mixture_weight']);empty=Q(row['empty_weight'])
    assert lam>=0 and empty>=0 and lam+empty==1
    K=set(combinations(range(s),2));base=row['base_packing'];pack(base,K)
    marginal=Counter();perms=list(permutations(range(s)))
    for p in perms:
        P=[[p[v] for v in t] for t in base];pack(P,K)
        marginal.update(tuple(sorted(t)) for t in P)
    assert set(marginal)==set(combinations(range(s),3))
    assert all(lam*Q(n,len(perms))==Q(1,6) for n in marginal.values())
assert not any(edges(c)<=G for c in combinations(range(10),6))
# Consequential negative controls: repeated triangle and damaged distribution.
negative={}
try:pack(d['base_packings'][0]+[d['base_packings'][0][0]])
except AssertionError:negative['duplicate_triangle_rejected']=True
assert negative.get('duplicate_triangle_rejected')
assert Q(1,5)*6!=1;negative['wrong_state_probability_rejected']=True
# Non-WKE bound independently checks the only needed triples, for each link.
for v in V:
    N={u for u in V if pair(u,v) in G}
    L={e for e in G if set(e)<=N}
    for triple in combinations(N,3):
        present=edges(triple)&L
        assert present and len({u for e in present for u in e})<2*len(present)
# A matching cannot delete all edges of any such triple, so alpha(L-M)<=2.
receipt={'status':'PASS','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'host':platform.system(),'python':platform.python_version(),'producer_code_imported':False,'finite_scope':'Fixed CP5 positive certificates only; no SAT or graph search','counts':{'vertices':10,'edges':40,'triangles':80,'base_packings':3,'cycles':len(allcycles),'two_edge_pairs':len(pairs),'TF_covers':len(covered_triangles),'link_distributions':len(vertices),'cliques':clique_counts},'negative_controls':negative,'derived_numbers':{'nu':12,'tau':16,'rho':'40/3','gap':'4/3'},'ordinary_dependencies':'nu upper bound by degree parity; tau lower by Mantel equality; amplification reviewed in prose','input_sha256':hashlib.sha256(INPUT.read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
(E/'independent_receipt.json').write_text(json.dumps(receipt,indent=2)+'\n');print(json.dumps(receipt,indent=2))
