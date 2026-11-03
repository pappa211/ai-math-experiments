#!/usr/bin/env python3
from itertools import combinations
from pathlib import Path
import json,sys
import search
W=Path(__file__).resolve().parents[1]
def generators(stage,seed):
 for idx in (9,3,0):
  raw=json.loads((W/'witnesses'/f'independent_nearest_{idx}_normalized.json').read_text())
  # Normalize using authoritative actual edges, irrespective of optional metadata.
  es=raw.get('edges')
  if es is None:
   for value in raw.values():
    if isinstance(value,dict) and 'edges' in value: es=value['edges'];break
  assert es is not None,raw.keys()
  vertices=sorted({v for e in es for v in e});remap={v:i for i,v in enumerate(vertices)}
  n=len(vertices);E={tuple(sorted(remap[v] for v in e)) for e in es};allpairs=list(combinations(range(n),2))
  for size in (1,2):
   for change in combinations(allpairs,size):
    yield {'name':f'near{idx}_toggle{change}','n':n,'edges':sorted(E^set(change)),'rule':{'base':idx,'edge_toggle_subset_size':size,'changes':change}}
  for mask in range(1<<n):
   yield {'name':f'near{idx}_new_vertex_{mask}','n':n+1,'edges':sorted(E|{(v,n) for v in range(n) if mask>>v&1}),'rule':{'base':idx,'all_added_vertex_neighborhoods_mask':mask}}
  for v in range(n):
   N={b if a==v else a for a,b in E if v in (a,b)}
   for true in (False,True):
    yield {'name':f'near{idx}_twin_{v}_{true}','n':n+1,'edges':sorted(E|{tuple(sorted((u,n))) for u in N|({v} if true else set())}),'rule':'one true/false twin'}
search.generators=generators
if __name__=='__main__': search.run('focused',600,2,20000,13110297)
