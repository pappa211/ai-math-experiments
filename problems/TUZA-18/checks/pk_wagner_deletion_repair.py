#!/usr/bin/env python3
"""Exhaust exactly the 4096 outside-support deletions of one planted control."""
from collections import Counter
from datetime import datetime,timezone
from functools import lru_cache
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json,time

STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)

def main():
 assert datetime.now(timezone.utc)<STOP
 start=datetime.now(timezone.utc).isoformat();tic=time.monotonic()
 cycle={tuple(sorted((i,(i+1)%8))) for i in range(8)}
 diameters={(i,i+4) for i in range(4)};F=sorted(cycle|diameters)
 M={(0,2),(1,3),(4,6),(5,7)};spokes={(i,8) for i in range(8)};B=sorted(M|spokes);bs=set(B)
 full_edges=bs|set(F);full_triples=[t for t in combinations(range(9),3) if set(combinations(t,2))<=full_edges]
 T=[frozenset(combinations(t,2)) for t in full_triples]
 P=[frozenset((e,(e[0],8),(e[1],8))) for e in sorted(M)]
 conflict=[sum(1<<j for j,s in enumerate(T) if t&s) for t in T]
 allowed=[sum(1<<j for j,e in enumerate(B) if e in t) for t in T]
 hit=[sum(1<<i for i,t in enumerate(T) if e in t) for e in B]
 @lru_cache(None)
 def packing(mask):
  if not mask:return ()
  i=(mask&-mask).bit_length()-1
  a=packing(mask&~(1<<i));b=(i,)+packing(mask&~conflict[i])
  return b if len(b)>len(a) else a
 @lru_cache(None)
 def cover(mask):
  if not mask:return (0,0)
  inds=[i for i in range(len(T)) if mask>>i&1]
  i=min(inds,key=lambda j:allowed[j].bit_count());best=(99,0)
  for e in range(len(B)):
   if allowed[i]>>e&1:
    n,c=cover(mask&~hit[e]);cand=(n+1,c|(1<<e))
    if cand[0]<best[0]:best=cand
  return best
 rows=[];gaps=[];failures=[];counts=Counter();minimal_gaps=[]
 for subset in range(1<<len(F)):
  if subset%256==0:assert datetime.now(timezone.utc)<STOP
  outside={e for i,e in enumerate(F) if subset>>i&1};E=bs|outside
  mask=sum(1<<i for i,t in enumerate(T) if t<=E)
  active=[t for i,t in enumerate(T) if mask>>i&1]
  A=set(bs)
  for packed in P:
   verts=set().union(*map(set,packed))
   for x in set(range(9))-verts:
    four=verts|{x};ed=set(combinations(sorted(four),2))
    if not ed<=E:continue
    faces=[frozenset(combinations(t,2)) for t in combinations(sorted(four),3)]
    if all(t==packed or len(t&bs)==1 and t&bs<=packed for t in faces):A.update(ed)
  assert A==bs
  p=packing(mask);c,cset=cover(mask)
  assert len(p)>=4 and all(t&bs for t in active)
  predicted_gap=cycle<=outside and bool(outside&{(0,4),(2,6)}) and bool(outside&{(1,5),(3,7)})
  assert (c>8)==predicted_gap
  row=dict(retained_outside_mask=subset,actual_triangles=mask.bit_count(),nu=len(p),restricted_cover=c)
  rows.append(row);counts[(len(p),c)]+=1
  if c>8:
   item=dict(**row,retained_outside_edges=[list(e) for e in sorted(outside)],
             maximum_packing=[list(full_triples[i]) for i in p],
             restricted_cover_witness=[list(e) for i,e in enumerate(B) if cset>>i&1])
   gaps.append(item)
   if len(outside)==10:minimal_gaps.append(item)
   if len(p)==4:failures.append(item)
 assert len(rows)==4096 and len(gaps)==9 and len(minimal_gaps)==4 and not failures
 result=dict(status='PASS',started_utc=start,finished_utc=datetime.now(timezone.utc).isoformat(),
  script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),domain='All subsets of the12 Wagner edges outside fixed plantedP support; all12 packed-support edges retained.',
  vertices=list(range(9)),outside_edge_bit_order=[list(e) for e in F],fixed_support=[list(e) for e in B],
  planted_packing=[sorted(map(list,t)) for t in P],full_actual_triangles=[list(t) for t in full_triples],
  cases=4096,allowed_set_equal_support_cases=4096,restricted_gap_cases=9,maximal_and_maximum_failure_cases=0,
  histogram=[dict(nu=a,restricted_cover=b,cases=n) for (a,b),n in sorted(counts.items())],
  minimal_gap_cases=minimal_gaps,all_gap_cases=gaps,case_rows=rows,elapsed_seconds=time.monotonic()-tic,
  conclusion='No outside-edge deletion repairs this planted control into a PK-all counterexample. Every restricted9vs8 gap retains a certified larger packing. The4096-case repair domain is closed; no graph-order extension inferred.')
 print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
