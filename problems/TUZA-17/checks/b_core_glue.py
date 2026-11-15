#!/usr/bin/env python3
"""Exact certificates for the forbidden-edge K4 attachment and failed iteration."""
from pathlib import Path
import sys,json,itertools,time,platform
W=Path(__file__).resolve().parents[1];sys.path.insert(0,str(W/'checks'))
from b_probe import graph,pack,cover,mincovers,colour
START=time.monotonic()
def pw(tm):
 if not tm:return []
 if pack(tm[1:])==pack(tm):return pw(tm[1:])
 t=tm[0];return [t]+pw(tuple(s for s in tm[1:] if not s&t))
n=6;blocks=[[0,1,2,3],[0,1,4,5]];E=set(e for c in blocks for e in itertools.combinations(c,2));rows=[]
for step in range(3):
 es,idx,ts,tm=graph(n,E);p=pack(tm);t=cover(tm);cs=mincovers(tm);union=0
 for c in cs:union|=c
 missing=[e for e in es if not union>>idx[e]&1]
 co=colour(n,es);assert co is not None
 ec=[co[u]^co[v] for u,v in es]
 assert all(len({ec[i] for i in range(len(es)) if z>>i&1})==3 for z in tm)
 lookup=dict(zip(tm,ts));delp=[]
 for i,e in enumerate(es):
  rr=tuple(a for a in tm if not a>>i&1);q=pw(rr)
  assert len(q)==p
  assert all(not(a&b) for a,b in itertools.combinations(q,2))
  delp.append({'edge':e,'packing':[lookup[z] for z in q]})
 # A separate brute subset enumeration rechecks the minimum-cover list for n<=10.
 brute=[]
 for comb in itertools.combinations(range(len(es)),t):
  c=sum(1<<i for i in comb)
  if all(c&z for z in tm):brute.append(c)
 assert set(brute)==set(cs)
 rows.append({'n':n,'edges':es,'K4_blocks':blocks.copy(),'actual_triangles':ts,'vertex4colouring':co,'edge3colouring':ec,'nu':p,'tau':t,'minimum_covers':[[e for i,e in enumerate(es) if c>>i&1] for c in cs],'forbidden_in_all_minimum_covers':missing,'all_edge_deletion_maximum_packings':delp,'status':'FAIL_SMALL_CORE' if p>=3 else 'BASE_SEED'})
 if step<2:
  e=missing[0];q=[*e,n,n+1];blocks.append(q);E.update(itertools.combinations(q,2));n+=2
out={'target':'SMALL-CORE ν<=2 for stable slack-one triangle-connected rainbow-colourable graphs','status':'REFUTED','evidence':'ordinary transfer proof plus explicit exact finite certificates','unbounded_iteration':'NOT_ESTABLISHED; no forbidden edge remains after second attachment','cases':rows,'runtime_seconds':time.monotonic()-START,'python':platform.python_version()}
(W/'evidence/b_core_glue.json').write_text(json.dumps(out,indent=2)+'\n');print([(r['n'],r['nu'],r['tau'],len(r['minimum_covers']),r['forbidden_in_all_minimum_covers']) for r in rows]);print('runtime',out['runtime_seconds'])
