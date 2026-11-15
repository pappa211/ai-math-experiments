#!/usr/bin/env python3
from pathlib import Path
import sys,time,signal,resource,json,random,itertools
W=Path(__file__).resolve().parents[1];sys.path.insert(0,str(W/'checks'))
from b_probe import graph,pack,cover,colour,edge
resource.setrlimit(resource.RLIMIT_CPU,(55,57))
START=time.monotonic();rng=random.Random(170611)
class Timeout(Exception):pass
def al(s,f):raise Timeout()
signal.signal(signal.SIGALRM,al)
cores=[('W5',6,[(0,v) for v in range(1,6)]+[edge(v,1+v%5) for v in range(1,6)]),('K5minusEdge',5,[e for e in itertools.combinations(range(5),2) if e!=(3,4)]),('twoK4_edge',6,[e for c in [[0,1,2,3],[0,1,4,5]] for e in itertools.combinations(c,2)])]
counts={'attempted':0,'complete':0,'timeout_UNKNOWN':0,'slack1':0,'stable_slack1':0,'connected_stable_slack1':0};witnesses=[];tried=[]
for name,n,E0 in cores:
 E0=list(set(E0));base=E0+list(itertools.combinations([0,n,n+1,n+2],2));co=colour(n+3,base)
 cross=[(u,v) for u in range(1,n) for v in range(n,n+3) if co[u]!=co[v]]
 masks=list(range(1<<len(cross)));rng.shuffle(masks)
 # Put two-edge proposals first, then all remaining masks once.
 masks.sort(key=lambda m:0 if m.bit_count()==2 else 1)
 for mask in masks:
  if time.monotonic()-START>50:break
  counts['attempted']+=1;E=base+[e for i,e in enumerate(cross) if mask>>i&1];es,idx,ts,tm=graph(n+3,E)
  signal.setitimer(signal.ITIMER_REAL,.15)
  try:
   p=pack(tm);t=cover(tm)
   if t==2*p-1:
    counts['slack1']+=1
    stable=all(pack(tuple(a for a in tm if not a&(1<<i)))==p for i in range(len(es)))
    if stable:
     counts['stable_slack1']+=1
     seen={0};todo=[0]
     while todo:
      i=todo.pop()
      for j in range(len(tm)):
       if j not in seen and tm[i]&tm[j]:seen.add(j);todo.append(j)
     connected=len(seen)==len(tm)
     if connected:
      counts['connected_stable_slack1']+=1
      row={'core':name,'mask':mask,'n':n+3,'edges':es,'vertex4colouring':co,'triangles':ts,'nu':p,'tau':t,'all_edge_packing_stable':True,'one_triangle_component':True,'status':'FAIL_SMALL_CORE' if p>=3 else 'PASS_SMALL_CORE'}
      witnesses.append(row)
      print(row,flush=True)
      if p>=3:break
   counts['complete']+=1
  except Timeout:counts['timeout_UNKNOWN']+=1
  finally:signal.setitimer(signal.ITIMER_REAL,0)
  pack.cache_clear();cover.cache_clear()
 if witnesses and witnesses[-1]['nu']>=3:break
 if time.monotonic()-START>50:break
result={'target':'SMALL-CORE: stable slack-one triangle-connected rainbow3colourable implies nu<=2','seed':170611,'counts':counts,'witnesses':witnesses,'elapsed_seconds':time.monotonic()-START,'status':'REFUTED' if any(r['nu']>=3 for r in witnesses) else 'NO_COUNTEREXAMPLE_IN_COMPLETED_PROBES','scope':'targeted K4 attachments, no broad graph census','limits':'50s self-wall,55s CPU,0.15s/case; external60s/512MiB watchdog'}
(W/'evidence/b_stable_core.json').write_text(json.dumps(result,indent=2)+'\n');print(counts,flush=True)
