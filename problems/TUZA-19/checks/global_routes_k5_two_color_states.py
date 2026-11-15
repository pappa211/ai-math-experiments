#!/usr/bin/env python3
"""Literal fixed-K5 verification of every two-edge-colorable edge-deletion state."""
from itertools import combinations
from pathlib import Path
import json,platform
assert platform.system()=='Darwin'
E=list(combinations(range(5),2));T=list(combinations(range(5),3))
rows=[];counts={}
for mask in range(1<<len(E)):
 F={E[i] for i in range(len(E)) if mask>>i&1}
 adj=[set() for _ in range(5)]
 for u,v in F:adj[u].add(v);adj[v].add(u)
 if any(len(s)>2 for s in adj):continue
 colors={};ok=True
 for root in range(5):
  if root in colors:continue
  colors[root]=0;stack=[root]
  while stack:
   v=stack.pop()
   for w in adj[v]:
    if w not in colors:colors[w]=1-colors[v];stack.append(w)
    elif colors[w]==colors[v]:ok=False
 if not ok:continue
 ts=[set(combinations(t,2)) for t in T if not(set(combinations(t,2))&F)]
 nu=2 if any(not(a&b) for a,b in combinations(ts,2)) else int(bool(ts))
 used={x for e in F for x in e}
 bad=len(used)==5
 assert nu==(1 if bad else 2)
 cycles=[]
 for four in combinations(range(5),4):
  for omit in combinations(list(combinations(four,2)),2):
   if len(set(omit[0])|set(omit[1]))==4:
    cycles.append(set(combinations(four,2))-set(omit))
 canonical=any(F<=C for C in cycles)
 assert canonical==(not bad)
 key=f'edges{len(F)}_used{len(used)}_nu{nu}'
 counts[key]=counts.get(key,0)+1
 rows.append({'F':sorted(F),'nu_remaining':nu,'canonical':canonical})
out=Path(__file__).resolve().parents[1]/'evidence/global_routes/k5_two_color_states.json'
out.write_text(json.dumps({'status':'PASS','states':len(rows),'counts':counts,'rows':rows},indent=2)+'\n')
print(json.dumps({'status':'PASS','states':len(rows),'counts':counts,'output':str(out)}))
