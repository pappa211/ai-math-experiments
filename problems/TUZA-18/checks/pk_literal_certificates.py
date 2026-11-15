#!/usr/bin/env python3
"""Independent literal audits of the role and nonmaximum type0 witnesses."""
from collections import Counter
from datetime import datetime,timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json,time

ROOT=Path('ARCHIVE/TUZA-18/evidence')
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
EXPECTED={'apex_role_witness_verified.json':'b0f9c987a68ff3f93b7f0c25978b98e235c57615c6cabb3be0533ef41331621f',
 'criticality_type0_nonmaximum.json':'9c5c312140b20ecc00a4feb1487316d799e181180f5263f4566c9dd921631511'}

def edges(t):return frozenset(combinations(sorted(t),2))

def main():
 assert datetime.now(timezone.utc)<STOP
 start=datetime.now(timezone.utc).isoformat();tic=time.monotonic();raw={}
 for name,digest in EXPECTED.items():
  data=(ROOT/name).read_bytes();assert sha256(data).hexdigest()==digest
  raw[name]=json.loads(data)
 role=raw['apex_role_witness_verified.json'];E=frozenset(map(tuple,role['edges']))
 ts=[t for t in combinations(range(6),3) if edges(t)<=E]
 assert set(ts)==set(map(tuple,role['triangles'])) and len(ts)==6
 packs=[]
 for k in range(7):
  level=[p for p in combinations(ts,k) if len(frozenset().union(*(edges(t) for t in p)))==3*k]
  if not level:break
  packs=level
 assert len(packs)==4 and len(packs[0])==2
 signatures=[]
 for p in packs:
  B=frozenset().union(*(edges(t) for t in p));used=set().union(*map(set,p));assert len(used)==5
  forced=[];mixed=[]
  for t in p:
   private=[q for q in ts if q!=t and len(edges(q)&B)==1 and edges(q)&B<=edges(t)]
   bases=set().union(*(edges(q)&B for q in private));assert len(private)==len(bases)==1
   base=next(iter(bases));tip=next(iter(set(t)-set(base)));forced.append(base)
   if any(tip in other for other in p if other!=t):mixed.append(tip)
  assert mixed and frozenset(forced)==frozenset(((0,1),(4,5)))
  assert all(frozenset(forced)&edges(t) for t in ts)
  signatures.append(dict(packing=[list(t) for t in p],mixed_tips=mixed))
 obj=raw['criticality_type0_nonmaximum.json'];G=frozenset(map(tuple,obj['edges']))
 F=frozenset((x,y) for x,y in combinations(range(16),2) if x^y in (1,2,4,8,15))
 N=frozenset((u+16*c,v+16*c) for c in range(3) for u,v in F)
 B=frozenset((u,v) for u,v in combinations(range(48),2) if u//16!=v//16)
 assert len(F)==40 and len(N)==120 and len(B)==768 and G==N|B
 assert frozenset(map(tuple,obj['N_edges']))==N and frozenset(map(tuple,obj['B_edges']))==B
 actual=[t for t in combinations(range(48),3) if edges(t)<=G]
 counts=Counter(len(edges(t)&B) for t in actual);assert counts=={2:3840,3:4096}
 assert len(actual)==7936 and obj['actual_triangle_count']==len(actual)
 p=[tuple(t) for t in obj['prescribed_packing']]
 expected={(x,16+y,32+(x^y)) for x in range(16) for y in range(16)}
 assert set(p)==expected and len(p)==256 and frozenset().union(*(edges(t) for t in p))==B
 masks=[(1<<u)|(1<<v) for u,v in F]
 alpha=max(s.bit_count() for s in range(1<<16) if not any(s&e==e for e in masks));assert alpha==5
 sts={tuple(sorted(((x+t)%13,(y+t)%13,(z+t)%13))) for t in range(13) for x,y,z in ((0,1,4),(0,2,7))}
 assert len(sts)==26
 edge_counter=Counter(e for t in sts for e in edges(t));assert len(edge_counter)==78 and set(edge_counter.values())=={1}
 remaining=[t for t in sts if 12 not in t];assert len(remaining)==20
 matching=[tuple(v for v in t if v!=12) for t in sts if 12 in t]
 assert len(matching)==6 and len(set().union(*map(set,matching)))==12
 mapping={int(k):v for k,v in obj['STS13_local_mapping'].items()}
 assert set(mapping)==set(range(12)) and len(set(mapping.values()))==12
 mapped={tuple(sorted(mapping[v] for v in t)) for t in remaining}
 assert mapped==set(map(tuple,obj['replacement_local_triangles']))
 selected=set(mapping.values());old={t for t in p if set(t)<=selected};assert len(old)==16
 assert old==set(map(tuple,obj['old_local_triangles']))
 larger=set(map(tuple,obj['larger_packing']));assert larger==(set(p)-old)|mapped and len(larger)==260
 assert all(edges(t)<=G for t in larger) and len(frozenset().union(*(edges(t) for t in larger)))==780
 cover=frozenset(map(tuple,obj['ordinary_triangle_cover']));assert len(cover)==376 and cover<=G and all(cover&edges(t) for t in actual)
 assert 768-(48*(3*alpha)//2-120)==528 and 528>512
 assert datetime.now(timezone.utc)<STOP
 result=dict(status='PASS',input_sha256=EXPECTED,script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),
  started_utc=start,finished_utc=datetime.now(timezone.utc).isoformat(),elapsed_seconds=time.monotonic()-tic,
  role_witness=dict(actual_triangles=6,all_maximum_packings=signatures,nu=2,tau=2,all_vertex_supports=5,all_have_forced_role_collision=True),
  nonmaximum_type0=dict(vertices=48,edges=888,actual_triangles=7936,support_intersection_counts=dict(counts),
    Clebsch_alpha=5,independent_subsets=65536,prescribed_packing_size=256,restricted_cover_lower_bound=528,
    replacement_local_triangles=20,larger_packing_size=260,ordinary_cover_size=376,ordinary_Tuza_certified=True),
  limits=['No exact maximum triangle packing of the48vertexgraph is asserted.','The528 cover lower bound uses the reconstructed neighborhood argument, not an exact restricted optimization.','Neither witness refutes maximum-packing PK.'])
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
