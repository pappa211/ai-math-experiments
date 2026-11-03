#!/usr/bin/env python3
"""Direct enumeration certificates; standard library, no discovery solver import."""
from itertools import combinations,product
from pathlib import Path
import json
W=Path(__file__).resolve().parents[1]
def edges(t):return frozenset(combinations(sorted(t),2))
def alltri(n,E):return [t for t in combinations(range(n),3) if edges(t)<=E]
def pack(T):
 for k in range(len(T),-1,-1):
  for P in combinations(T,k):
   if len(set().union(*(edges(t) for t in P)))==3*k:return P

def main():
 E=frozenset().union(*(edges(t) for t in [(0,1,2),(0,1,3),(1,2,4),(0,2,5)]))
 T=alltri(6,E);C=frozenset([(0,1),(1,4),(0,5)]);P=[(0,1,2)]
 assert len(E)==9 and len(T)==4
 assert all(len(edges(t)&C)==1 for t in T)
 assert all(edges(t)&edges(P[0]) for t in T)
 assert all(not all(edges(t)&set(F) for t in T) for F in combinations(E,2))
 Q=pack(T);assert len(Q)==3
 out={'n':6,'edges':sorted(E),'triangles':T,'cover':sorted(C),'tau':3,'eligible_nu':3,'maximum_packing':Q,'maximal_insufficient_packing':P,'target':2,'status':'AUXILIARY_ADD_ONLY_MAXIMAL_LEMMA_REFUTED','central_D':-1}
 (W/'witnesses/theory_maximal_packing.json').write_text(json.dumps(out,indent=2)+'\n')
 x=json.loads((W/'witnesses/theory_tau_drop.json').read_text());E=frozenset(tuple(e) for e in x['input']['edges']);T=alltri(9,E);C=frozenset(tuple(e) for e in x['minimum_C']);F=frozenset(tuple(e) for e in x['eligible_cover_F']);P=[(3,6,8),(2,5,6),(1,4,5),(0,4,7),(0,2,8),(1,2,3)]
 assert T==[tuple(t) for t in x['triangles']]
 assert all(edges(t)&C for t in T)
 assert set(t for t in T if edges(t)<=C)=={(1,2,5)}
 A=[t for t in T if len(edges(t)&C)<3]
 assert all(edges(t)&F for t in A)
 assert len(set().union(*(edges(t) for t in P)))==18
 choices=list(product(*(edges(t) for t in P)))
 assert len(choices)==729
 surviving=[z for z in choices if all(edges(t)&set(z) for t in A)]
 assert len(surviving)==1 and set(surviving[0])==F
 assert not all(edges(t)&F for t in T)
 record={'complete_triangles_reconstructed':True,'eligible_cover_choices_tested':729,'unique_eligible_six_cover':sorted(F),'full_tau':7,'eligible_tau':6,'eligible_nu':6,'ordinary_nu':6,'odd_degree_vertices':[v for v in range(9) if sum(v in e for e in E)%2],'all_checks_pass':True}
 assert record['odd_degree_vertices']==[1,7]
 (W/'evidence/theory_small_certificates.json').write_text(json.dumps(record,indent=2)+'\n')
 print(json.dumps(record))
if __name__=='__main__':main()
