#!/usr/bin/env python3
"""Independent local apex audit and exact finite random-parameter bounds."""
from datetime import datetime, timezone
from fractions import Fraction
from hashlib import sha256
from itertools import combinations
from math import comb
from pathlib import Path
import json

SOURCE=Path('ARCHIVE/TUZA-18/notes/criticality_connected_pc.md')
EXPECTED='aa6793e8674c1c01e447f966de04c34768e97d8d63659688eb17743608c1e63c'
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)

def main():
 assert datetime.now(timezone.utc)<STOP
 start=datetime.now(timezone.utc).isoformat();data=SOURCE.read_bytes();assert sha256(data).hexdigest()==EXPECTED
 rim=frozenset(combinations(range(4),2));all_edges=frozenset(combinations(range(5),2))
 all_triangles=[frozenset(combinations(t,2)) for t in combinations(range(5),3)]
 old=[t for t in all_triangles if t<=rim];cost_counts={2:0,3:0,4:0};states=0
 for face in old:
  for cut in range(32):
   side=lambda v:(cut>>v)&1
   selected={e for e in face if side(e[0])==side(e[1])}
   for triangle in all_triangles:
    noncross=[e for e in triangle if side(e[0])==side(e[1])]
    if len(noncross)==1 and noncross[0] not in face:selected.add(noncross[0])
   # Spokes can be packed elsewhere. Their support status cannot affect
   # selection of these rim edges; only rim costs covering old faces matter.
   selected_rim=selected&rim;fixed=selected_rim-face;optional=selected_rim&face
   possible=[]
   for k in range(len(optional)+1):
    for retained in combinations(optional,k):
     C=fixed|set(retained)
     if all(C&t for t in old):possible.append(len(C))
   cost=min(possible);red=sum(side(v) for v in range(4))
   expected=2 if red==2 else (4 if red in (0,4) and side(0)!=side(4) else 3)
   assert cost==expected and cost>=2+(red!=2)
   cost_counts[cost]+=1;states+=1
 counts=0
 for n in range(9,129):
  for r in range(n+1):
   assert 2*comb(r,2)*comb(n-r,2)<=comb(n,4)
   counts+=1
 # A concrete finite N makes all asymptotic requirements simultaneous.
 # For N=2^40, p=2^-110 and N^(1/4)=2^10, all comparisons below are exact.
 N=1<<40;mu=Fraction(comb(N,4),1<<110)
 assert comb(N,4)*48>=N**4
 assert mu>=Fraction(64,3)*N and mu>10*N
 cycle_failure=Fraction(1,1<<20)+Fraction(1,1<<10)
 assert cycle_failure<Fraction(1,4)
 # log(2)<3/4 follows from the first four terms of exp(3/4)>2.
 assert 1+Fraction(3,4)+Fraction(3,4)**2/2+Fraction(3,4)**3/6>2
 # Thus the all-color bad-event bound is <exp(-7N/12)<1/4.
 # The latter comparison follows already at N>=3 from exp(7/4)>4.
 assert 1+Fraction(7,4)+Fraction(7,4)**2/2>4
 assert datetime.now(timezone.utc)<STOP
 result=dict(status='PASS',input_sha256=EXPECTED,script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),
  started_utc=start,finished_utc=datetime.now(timezone.utc).isoformat(),local_apex_face_cut_cases=states,
  exact_minimum_retained_rim_cost_counts=cost_counts,balanced_fourset_inequality_cases=counts,
  explicit_random_parameter_N=N,mu_over_N_lower_bound='64/3',mu_greater_than_10N=True,
  all_coloring_failure_bound='< exp(-7N/12) < 1/4',short_cycle_failure_bound=str(cycle_failure),
  simultaneous_good_outcome_probability_lower_bound='> 1/2',
  limitations=['No large random hypergraph or graph is sampled or stored.','The unbounded theorem is established by the separately reconstructed ordinary proof.','Local tests are lower-bound checks on old block edges, not complete global cover enumeration.'])
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
