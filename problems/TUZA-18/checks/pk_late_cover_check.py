#!/usr/bin/env python3
"""Independent literal Mycielski-cone certificate, no producer imports."""
from datetime import datetime,timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json

PATH=Path('ARCHIVE/TUZA-18/evidence/late_cover_verified.json')
EXPECTED='5699930e916dbbe45d09b86bdce25b6bb96796b56c8270256a658d9443ed2078'
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)

def main():
 assert datetime.now(timezone.utc)<STOP
 start=datetime.now(timezone.utc).isoformat();data=PATH.read_bytes();assert sha256(data).hexdigest()==EXPECTED;o=json.loads(data)
 H=set()
 for i in range(5):
  H.add(tuple(sorted((i,(i+1)%5))))
  H.add(tuple(sorted((5+i,(i-1)%5))))
  H.add(tuple(sorted((5+i,(i+1)%5))))
  H.add((5+i,10))
 G=H|{(i,11) for i in range(11)}
 assert len(H)==20 and len(G)==31 and H==set(map(tuple,o['rim_edges'])) and G==set(map(tuple,o['graph_edges']))
 assert not any(set(combinations(t,2))<=H for t in combinations(range(11),3))
 ts=[t for t in combinations(range(12),3) if set(combinations(t,2))<=G]
 assert len(ts)==20 and set(ts)==set(map(tuple,o['all_actual_triangles'])) and all(11 in t for t in ts)
 assert not any(set(combinations(q,2))<=G for q in combinations(range(12),4))
 independent=[s for s in range(1<<11) if not any(s>>u&1 and s>>v&1 for u,v in H)]
 assert max(map(int.bit_count,independent))==5
 matching=list(map(tuple,o['rim_maximum_matching']));assert len(matching)==5 and all(e in H for e in matching) and len(set().union(*map(set,matching)))==10
 cover=set(map(tuple,o['triangle_cover']));assert len(cover)==6 and cover<=G and all(cover&set(combinations(t,2)) for t in ts)
 P=[set(combinations(t,2)) for t in o['triangle_packing']];assert len(P)==5 and all(t<=G for t in P) and len(set().union(*P))==15
 proper4=o['rim_4_colouring'];assert len(proper4)==11 and all(proper4[u]!=proper4[v] for u,v in H)
 neighbors={v:{w if u==v else u for u,w in H if u==v or w==v} for v in range(11)}
 order=[10]+sorted(range(10),key=lambda v:-len(neighbors[v]));colors={10:0};count=0
 def visit(i):
  nonlocal count
  if i==len(order):count+=1;return
  v=order[i]
  for c in range(3):
   if all(colors.get(w,-1)!=c for w in neighbors[v]):colors[v]=c;visit(i+1);del colors[v]
 visit(1);assert count==0
 seen={0};front=[0]
 while front:
  v=front.pop()
  for w in neighbors[v]-seen:seen.add(w);front.append(w)
 assert len(seen)==11
 assert datetime.now(timezone.utc)<STOP
 result=dict(status='PASS',started_utc=start,finished_utc=datetime.now(timezone.utc).isoformat(),input_sha256=EXPECTED,
  script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),reviewed_proof_sha256='c0bf6c91879dc2981c41138f00a59cdb9c10737d2c13e1ec135f6dcabba53f0c',
  rim_vertices=11,rim_edges=20,rim_alpha=5,rim_vertex_subsets_checked=2048,rim_3_colourings_with_w_fixed=0,
  graph_vertices=12,graph_edges=31,actual_triangles=20,K4_free=True,one_triangle_component=True,nu=5,tau=6,
  limitations=['Sheet-splitting is an ordinary unbounded proof, not a finite cover census.','The reviewed target needs assemblies to mean shared-edge triangle components; arbitrary overlapping additive gluings were not excluded.','No exact-minimal-Tuza-counterexample claim.'])
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
