"""Independent certificate verifier: imports no generator or discovery code.
Enumerates all three-vertex sets of the final simple graph and every local cut/pruning.
"""
import json,hashlib,time
from pathlib import Path
from itertools import combinations
ROOT=Path(__file__).resolve().parents[1];start=time.time()
source=ROOT/'evidence/apex_pruned_voltage.json';data=json.loads(source.read_text())['found'];q=data['q'];w={tuple(e):x for e,x in zip(data['base_edges'],data['voltages'])}
assert q%2==1 and set(w)=={(a,j) for a in range(5) for j in range(5) if a!=j}
blocks=[tuple(sorted(a*q+(u-w[a,j])%q for a in range(5) if a!=j)) for j in range(5) for u in range(q)]
n=5*q;b=len(blocks)
assert n==b and b%2==1 and len(set(blocks))==b
assert all(len(set(B))==4 for B in blocks)
assert all(sum(v in B for B in blocks)==4 for v in range(n))
assert all(len(set(A)&set(B))<=1 for A,B in combinations(blocks,2))
E={e for B in blocks for e in combinations(B,2)}
assert len(E)==6*b
T={t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))}
BT={t for B in blocks for t in combinations(B,3)}
assert T==BT and len(T)==4*b
P=[tuple(B[:3]) for B in blocks];PE=[set(combinations(t,2)) for t in P]
assert all(t in T for t in P) and len(set().union(*PE))==3*b
C={e for B in blocks for e in [(B[0],B[1]),(B[2],B[3])]}
assert len(C)==2*b and all(C&set(combinations(t,2)) for t in T)
# Every maximum packing is exactly one face/block, and every cover needs>=2/block.
localE=set(combinations(range(4),2));localT=[set(combinations(t,2)) for t in combinations(range(4),3)]
assert all(A&B for A,B in combinations(localT,2))
assert not any(all(e in t for t in localT) for e in localE)
rows=[]
for packed in localT:
 for cut in range(16):
  same={e for e in localE if (cut>>e[0]&1)==(cut>>e[1]&1)}
  Q=same&packed;D=set()
  for t in localT:
   ss=t&same
   if len(ss)==1 and not(ss&packed):D|=ss
  attainable=[]
  for k in range(len(Q)+1):
   for kept in combinations(sorted(Q),k):
    cc=D|set(kept)
    if all(cc&t for t in localT):attainable.append(len(cc))
  cost=min(attainable);want=2 if cut.bit_count()==2 else 3
  assert cost==want
  rows.append(dict(packed=sorted(packed),cut=cut,minimum_cost=cost))
result=dict(status='PASS',q=q,n=n,blocks=b,edges_count=len(E),actual_triangles=len(T),nu=b,tau=2*b,PC_lower_bound=2*b+1,all_actual_triangles_are_block_faces=True,regularity=4,parity_obstruction='4*red=2*b impossible for odd b',local_cut_pruning_cases=len(rows),elapsed=time.time()-start,source_sha256=hashlib.sha256(source.read_bytes()).hexdigest(),script_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
(ROOT/'evidence/apex_pruned_verified.json').write_text(json.dumps(result,indent=2))
(ROOT/'evidence/apex_pruned_graph.json').write_text(json.dumps(dict(vertices=list(range(n)),blocks=blocks,edges=sorted(E),triangles=sorted(T),packing=P,cover=sorted(C),local_cases=rows),indent=2))
print(json.dumps(result,indent=2))
