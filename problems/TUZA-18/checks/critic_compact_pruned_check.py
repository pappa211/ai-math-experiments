#!/usr/bin/env python3
"""Independent literal compact K4-block certificate validation."""
from collections import Counter
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json, time

ROOT=Path('ARCHIVE/TUZA-18/evidence')
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)

def main():
 assert datetime.now(timezone.utc)<STOP
 start=datetime.now(timezone.utc).isoformat();tic=time.monotonic();raw={};hashes={}
 for name in ['apex_pruned_voltage.json','apex_pruned_graph.json','apex_pruned_verified.json']:
  data=(ROOT/name).read_bytes();hashes[name]=sha256(data).hexdigest();raw[name]=json.loads(data)
  Path('SCRATCH_OUTPUT/tuza18_critic_input_'+name).write_bytes(data)
 volt=raw['apex_pruned_voltage.json']['found'];g=raw['apex_pruned_graph.json'];receipt=raw['apex_pruned_verified.json']
 q=volt['q'];assert q==31
 weights=dict(zip(map(tuple,volt['base_edges']),volt['voltages']))
 assert set(weights)=={(a,j) for a in range(5) for j in range(5) if a!=j}
 assert receipt['source_sha256']==hashes['apex_pruned_voltage.json']
 V=set(g['vertices']);assert len(V)==len(g['vertices'])==5*q and V==set(range(5*q))
 blocks=[frozenset(b) for b in g['blocks']];assert len(set(blocks))==len(blocks)==5*q
 for j in range(5):
  for u in range(q):
   expected=frozenset(a*q+(u-weights[(a,j)])%q for a in range(5) if a!=j)
   assert blocks[j*q+u]==expected
 assert all(len(b)==4 and b<=V for b in blocks)
 assert set(Counter(v for b in blocks for v in b).values())=={4}
 assert all(len(a&b)<=1 for a,b in combinations(blocks,2))
 E={tuple(e) for e in g['edges']};assert len(E)==len(g['edges'])==930
 expected_E={e for b in blocks for e in combinations(sorted(b),2)};assert E==expected_E
 assert sum(len(b)*(len(b)-1)//2 for b in blocks)==len(E)
 actual={t for t in combinations(sorted(V),3) if all(e in E for e in combinations(t,2))}
 block_faces={t for b in blocks for t in combinations(sorted(b),3)}
 assert len(actual)==620 and actual==block_faces==set(map(tuple,g['triangles']))
 T=[frozenset(combinations(t,2)) for t in sorted(actual)]
 P=[frozenset(combinations(sorted(t),2)) for t in g['packing']]
 assert len(P)==155 and all(p in T for p in P) and len(frozenset().union(*P))==3*len(P)
 C=frozenset(map(tuple,g['cover']));assert len(C)==310 and C<=E and all(C&t for t in T)
 # Each local face/cut pair must appear once in the literal local table.
 cases={(frozenset(map(tuple,row['packed'])),row['cut']):row['minimum_cost'] for row in g['local_cases']}
 faces={frozenset(combinations(t,2)) for t in combinations(range(4),3)}
 assert len(cases)==len(g['local_cases'])==64 and set(cases)=={(f,s) for f in faces for s in range(16)}
 assert all(cost==(2 if cut.bit_count()==2 else 3) for (face,cut),cost in cases.items())
 # Explicitly expose the scope boundary: components are under shared EDGES.
 parent={e:e for e in E}
 def find(e):
  while parent[e]!=e:parent[e]=parent[parent[e]];e=parent[e]
  return e
 for t in T:
  edges=list(t)
  for e in edges[1:]:parent[find(e)]=find(edges[0])
 edge_components=Counter(find(e) for e in E)
 assert len(edge_components)==155 and set(edge_components.values())=={6}
 assert 155%2==1
 assert datetime.now(timezone.utc)<STOP
 result=dict(status='PASS',started_utc=start,finished_utc=datetime.now(timezone.utc).isoformat(),
  input_sha256=hashes,script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),q=q,
  vertices=155,blocks=155,vertex_block_degree=4,edges=930,actual_triangles=620,
  explicit_packing_size=155,explicit_cover_size=310,nu_via_block_upper_bound=155,tau_via_block_lower_bound=310,
  local_face_cut_table_cases=64,global_cut_PC_lower_bound=311,shared_edge_triangle_components=155,
  edges_per_triangle_component=6,scope='Refutes one global cut only; independent cuts on the 155 K4 triangle components attain 310.',
  elapsed_seconds=time.monotonic()-tic,limitation='All actual triangles are independently enumerated; universal cut obstruction follows the reviewed parity/local-cost proof, not enumeration of 2^155 cuts.')
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
