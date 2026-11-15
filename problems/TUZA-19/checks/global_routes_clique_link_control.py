#!/usr/bin/env python3
"""Literal standard-library certificate check for one K_{2,2,2,2,2} control.
No optimization or imported producer checker. The three packing witnesses are fixed.
"""
from itertools import combinations, permutations, product
from fractions import Fraction
from pathlib import Path
import json,platform
assert platform.system()=='Darwin'
V=tuple(range(10))
E={e for e in combinations(V,2) if e[0]//2!=e[1]//2}
T={t for t in combinations(V,3) if all(e in E for e in combinations(t,2))}
PACKINGS=[
 [(0,4,6),(0,5,8),(0,7,9),(1,4,7),(1,6,8),(1,5,9),(2,4,8),(2,5,7),(2,6,9),(3,4,9),(3,5,6),(3,7,8)],
 [(0,3,6),(0,5,8),(0,7,9),(1,5,6),(1,3,9),(1,7,8),(3,5,7),(2,5,9),(2,4,7),(2,6,8),(3,4,8),(4,6,9)],
 [(0,3,4),(0,5,8),(0,7,9),(1,4,9),(4,7,8),(1,2,7),(2,6,8),(1,3,8),(1,5,6),(2,5,9),(3,5,7),(3,6,9)]
]
CYCLES=[(0,2,1,3),(0,2,1,4),(0,2,4,6)]
def cycle_edges(c):return frozenset(tuple(sorted((c[i],c[(i+1)%4]))) for i in range(4))
def check_pack(P):
 assert len(P)==12 and all(tuple(sorted(t)) in T for t in P)
 U=[tuple(sorted(e)) for t in P for e in combinations(t,2)]
 assert len(U)==len(set(U))==36
 return frozenset(E-set(U))
LEAVES=[check_pack(P) for P in PACKINGS]
assert LEAVES==[cycle_edges(c) for c in CYCLES]
assert len(E)==40 and len(T)==80
assert all(sum(v in e for e in E)==8 for v in V)
# Exhaust all actual four-cycles, not all graphs; automorphism images give certificates.
cycles={cycle_edges(c) for c in permutations(V,4) if cycle_edges(c)<=E}
image_cert={}
for pp in permutations(range(5)):
 for flips in product(range(2),repeat=5):
  mp={v:2*pp[v//2]+((v%2)^flips[v//2]) for v in V}
  assert {tuple(sorted((mp[u],mp[v]))) for u,v in E}==E
  for j,L in enumerate(LEAVES):
   image=frozenset(tuple(sorted((mp[u],mp[v]))) for u,v in L)
   if image not in image_cert:
    P=[tuple(sorted(mp[v] for v in t)) for t in PACKINGS[j]]
    assert check_pack(P)==image
    image_cert[image]={'base':j,'map':[mp[v] for v in V]}
assert set(image_cert)==cycles
ordered_cycles=sorted(cycles,key=lambda z:sorted(z))
pair_witness=[]
for pair in combinations(sorted(E),2):
 idx=next(i for i,L in enumerate(ordered_cycles) if set(pair)<=L)
 pair_witness.append({'deleted':pair,'cycle_index':idx})
assert len(pair_witness)==780
# Every triangle has a literal16-cover containing it.
full_covers=[]
for tri in sorted(T):
 parts={v//2 for v in tri};assert len(parts)==3
 side={v for v in V if v//2 in parts}
 C={e for e in E if (e[0] in side)==(e[1] in side)}
 assert len(C)==16 and set(combinations(tri,2))<=C
 assert all(set(combinations(t,2))&C for t in T)
 full_covers.append({'triangle':tri,'side':sorted(side),'cover':sorted(C)})
# Six perfect link matchings realize the uniform1/6 coordinate vector exactly.
link_cert=[]
for v in V:
 ps=[p for p in range(5) if p!=v//2]
 factor_pairs=[((ps[0],ps[1]),(ps[2],ps[3])),((ps[0],ps[2]),(ps[1],ps[3])),((ps[0],ps[3]),(ps[1],ps[2]))]
 factors=[]
 for pairs in factor_pairs:
  for flip in (0,1):
   M=[tuple(sorted((2*a+i,2*b+(i^flip)))) for a,b in pairs for i in (0,1)]
   assert len({u for e in M for u in e})==8
   star=[tuple(sorted((v,*e))) for e in M]
   U=[e for t in star for e in combinations(t,2)]
   assert len(U)==len(set(U)) and set(star)<=T
   factors.append(star)
 counts={t:sum(t in P for P in factors) for t in T if v in t}
 assert len(counts)==24 and set(counts.values())=={1}
 link_cert.append({'vertex':v,'weight_per_state':'1/6','states':factors})
# Full clique packing polytope certificates, including all its inequalities.
clique_cert=[]
for s,packing in [(3,[(0,1,2)]),(4,[(0,1,2)]),(5,[(0,1,2),(0,3,4)])]:
 local_tri=list(combinations(range(s),3));alpha=len(packing)
 lam=Fraction(len(local_tri),6*alpha)
 counts={t:Fraction(0) for t in local_tri}
 perms=list(permutations(range(s)))
 for perm in perms:
  P=[tuple(sorted(perm[v] for v in t)) for t in packing]
  used=[e for t in P for e in combinations(t,2)]
  assert len(used)==len(set(used))
  for t in P:counts[t]+=lam/Fraction(len(perms))
 assert set(counts.values())=={Fraction(1,6)} and 0<=lam<=1
 actual=[c for c in combinations(V,s) if all(e in E for e in combinations(c,2))]
 assert all(len({v//2 for v in c})==s for c in actual)
 clique_cert.append({'size':s,'actual_clique_count':len(actual),'base_packing':packing,'nonempty_mixture_weight':str(lam),'empty_weight':str(1-lam),'permutation_states':len(perms),'marginal':'1/6'})
assert not any(all(e in E for e in combinations(c,2)) for c in combinations(V,6))
result={
 'status':'PASS literal fixed-graph certificates; optimum upper/lower arguments are in the ordinary note',
 'vertices':list(V),'parts':[[2*p,2*p+1] for p in range(5)],'edges':sorted(E),'triangles':sorted(T),
 'nu':12,'tau':16,'rho':'40/3','uniform_triangle_weight':'1/6',
 'base_packings':PACKINGS,'base_cycles':CYCLES,'all_cycle_count':len(cycles),
 'cycle_certificates':[{'leave':sorted(L),**image_cert[L]} for L in ordered_cycles],
 'two_edge_certificates':pair_witness,'tf_certificates':full_covers,
 'full_link_polytope_certificates':link_cert,'full_clique_polytope_certificates':clique_cert,
 'all_two_edge_pairs_checked':len(pair_witness),'all_triangles_checked':len(T)
}
out=Path(__file__).resolve().parents[1]/'evidence/global_routes/clique_link_control.json'
out.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['status','nu','tau','rho','all_cycle_count','all_two_edge_pairs_checked','all_triangles_checked']}))
