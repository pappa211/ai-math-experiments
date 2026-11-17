#!/usr/bin/env python3
"""Independent 326-interface domain check using already independently exact210 data.
No author optimization code is imported. Every required numeric J profile is
rejected by its previously re-solved full critical-edge set.
"""
from pathlib import Path
from itertools import combinations
from hashlib import sha256
import json,platform,sys,time
START=time.monotonic();W=Path(__file__).resolve().parents[1]
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
prior_path=W/'evidence/opening_checks.json';prior=json.loads(prior_path.read_text());assert prior['status']=='VERIFIED_FINITE'
insert={(r['model'],tuple(r['inserted'])):r for r in prior['insertions']}
author_path=W/'evidence/apex_simplicial_internal_checks.json';author=json.loads(author_path.read_text())
reported={(r['seed'],tuple(r['inserted']),r['apex_c']):r for r in author['rows']};assert len(reported)==len(author['rows'])
rows=[];profiles=[]
for model in prior['models']:
 n=model['n'];E=frozenset(map(tuple,model['edges']));name=model['name'];nuC=model['optimum']['nu']
 for ab in combinations(range(n),2):
  if ab in E:continue
  source=insert[(name,ab)];J=source['optimum'];a,b=ab
  for c in range(n):
   if c in ab:continue
   ac=tuple(sorted((a,c)));bc=tuple(sorted((b,c)))
   if ac not in E or bc not in E:continue
   key=(name,ab,c);r=reported[key]
   assert (r['nu_C'],r['nu_J'],r['tau_J'])==(nuC,J['nu'],J['tau'])
   row={'seed':name,'inserted':ab,'apex_c':c,'nu_C':nuC,'nu_J':J['nu'],'tau_J':J['tau']}
   if J['nu']==nuC+1 and J['tau']==2*J['nu']-2:
    crit=set(map(tuple,source['critical_edges']));assert crit=={ab}
    assert set(map(tuple,r['critical_A_edges']))==crit.intersection({ab,ac,bc})=={ab}
    row['full_J_critical_edges']=sorted(crit);row['all_three_A_edges_critical']=False;profiles.append(row)
   rows.append(row)
assert {(r['seed'],r['inserted'],r['apex_c']) for r in rows}==set(reported)
assert len(rows)==326 and len(profiles)==8 and len(insert)==210
assert not author['survivors']
counts={'models':len(prior['models']),'inserted_graphs':len(insert),'labelled_internal_interfaces':len(rows),'required_J_numeric_profile':len(profiles),'all_three_A_edges_critical':0}
paths=[prior_path,author_path,W/'notes/apex_simplicial_reduction_v1.md']
out={'status':'VERIFIED_FINITE','method':__doc__,'scope':'All frozen C12 internal nonedge/common-neighbor presentations. Values and full critical sets come from the separately authored direct210-graph exact checker; no new optimizer run and no claim to independently check irrelevant author critical-edge entries outside the required numeric profile.','counts':counts,'qualifying':profiles,'rows':rows,'source_sha256':{str(p):sha256(p.read_bytes()).hexdigest() for p in paths},'checker_sha256':sha256(Path(__file__).read_bytes()).hexdigest(),'elapsed_seconds':time.monotonic()-START,'platform':platform.platform(),'executable':sys.executable}
(W/'evidence/opening_simplicial_internal.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'status':out['status'],'counts':counts,'elapsed_seconds':out['elapsed_seconds']}))
