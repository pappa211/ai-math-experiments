#!/usr/bin/env python3
"""Exact negative control: maximal star packing is insufficient for PK."""
from datetime import datetime,timezone
from hashlib import sha256
from itertools import combinations
from functools import lru_cache
from pathlib import Path
import json

STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)

def main():
 assert datetime.now(timezone.utc)<STOP
 F=frozenset({tuple(sorted((i,(i+1)%8))) for i in range(8)}|{(i,i+4) for i in range(4)})
 M=frozenset(((0,2),(1,3),(4,6),(5,7)))
 H=F|M;G=H|frozenset((i,8) for i in range(8))
 triples=[t for t in combinations(range(9),3) if set(combinations(t,2))<=G]
 T=[frozenset(combinations(t,2)) for t in triples]
 P=[frozenset((e,(e[0],8),(e[1],8))) for e in sorted(M)]
 B=frozenset().union(*P)
 assert len(B)==12 and all(t&B for t in T)
 assert not any(set(combinations(q,2))<=F for q in combinations(range(8),3))
 independents=[set(s) for k in range(9) for s in combinations(range(8),k) if not any(set(e)<=set(s) for e in F)]
 alpha=max(map(len,independents));assert alpha==3
 A=set(B);private_rows=[]
 for packed in P:
  verts=set().union(*map(set,packed));priv=[t for t in T if t!=packed and len(t&B)==1 and t&B<=packed]
  support=set().union(*(t&B for t in priv))
  assert len(support)==1 and support<=M
  private_rows.append(dict(packed=sorted(map(list,packed)),private_base=list(next(iter(support))),pages=[sorted(map(list,t)) for t in priv]))
  for x in set(range(9))-verts:
   complete=verts|{x};edges=frozenset(combinations(sorted(complete),2))
   if not edges<=G:continue
   faces=[frozenset(combinations(t,2)) for t in combinations(sorted(complete),3)]
   if all(t==packed or len(t&B)==1 and t&B<=packed for t in faces):A.update(edges)
 assert A==B
 restricted=[]
 for k in range(13):
  restricted=[frozenset(c) for c in combinations(sorted(B),k) if all(set(c)&t for t in T)]
  if restricted:break
 assert k==9
 witness=((0,1,2),(0,4,8),(2,6,8),(1,3,8),(5,7,8))
 W=[frozenset(combinations(sorted(t),2)) for t in witness]
 assert all(t in T for t in W) and len(frozenset().union(*W))==15
 conflicts=[]
 for t in T:conflicts.append(sum(1<<j for j,s in enumerate(T) if t&s))
 @lru_cache(None)
 def packing(mask):
  if not mask:return ()
  i=(mask&-mask).bit_length()-1
  leave=packing(mask&~(1<<i));take=(i,)+packing(mask&~conflicts[i])
  return take if len(take)>len(leave) else leave
 optimum=packing((1<<len(T))-1)
 assert len(optimum)>len(P)
 assert datetime.now(timezone.utc)<STOP
 result=dict(status='PASS',finished_utc=datetime.now(timezone.utc).isoformat(),script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),
  vertices=list(range(9)),edges=[list(e) for e in sorted(G)],triangles=[list(t) for t in triples],
  Wagner_alpha=alpha,planted_packing=[sorted(map(list,t)) for t in P],planted_size=4,planted_is_maximal=True,
  planted_is_maximum=False,allowed_edges_equal_planted_support=True,private_pages=private_rows,
  restricted_cover_optimum=9,restricted_cover=[list(e) for e in sorted(restricted[0])],
  augmenting_five_packing=[list(t) for t in witness],actual_nu=len(optimum),maximum_packing=[list(triples[i]) for i in optimum],
  conclusion='Refutes replacing maximum by maximal, and using private-book local states alone. Does not refute PK-all or PK-exists.')
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
