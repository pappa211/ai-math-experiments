#!/usr/bin/env python3
"""Supplemental exact controls for arbitrary-X K4-ear membership branches."""
from pathlib import Path
import sys,itertools,json,time
W=Path(__file__).resolve().parents[1];sys.path.insert(0,str(W/'checks'))
from b_probe import graph,pack,cover,mincovers,vc,edge,colour
start=time.monotonic()
cases=[('K4',4,list(itertools.combinations(range(4),2)),(0,1)),('twoK4-forbidden',6,list(set(e for c in [[0,1,2,3],[0,1,4,5]] for e in itertools.combinations(c,2))),(0,2)),('book-side',5,[(0,1),(0,2),(1,2),(0,3),(1,3),(0,4),(1,4)],(0,2))]
def opt(n,E,X):
 es,idx,ts,tm=graph(n,E);le=tuple(e for e in es if all(v in X for v in e));cs=mincovers(tm)
 lam=min(vc(tuple(e for e in le if not c>>idx[e]&1)) for c in cs)
 _,_,_,gt=graph(n+1,list(es)+[(v,n) for v in X])
 return {'tau_H':cover(tm),'lambda':lam,'nu_G':pack(gt),'eligible':not any(all(v in X for v in t) for t in ts)}
out=[];branches={}
for name,n,E,e in cases:
 E=list(set(E));q=[*e,n,n+1];ep=E+[t for t in itertools.combinations(q,2) if t!=e];ej=[t for t in E if t!=e];rows=[]
 for mask in range(1<<(n+2)):
  X=[v for v in range(n+2) if mask>>v&1];hp=opt(n+2,ep,X)
  if not hp['eligible']:continue
  X0=[v for v in X if v<n];r=opt(n,ej,X0);hit=[v for v in q if v in X]
  if len(hit)==2 and sum(v<n for v in hit)==1:
   u=next(v for v in hit if v<n);rp=opt(n,ej,[v for v in X0 if v!=u])
   branch='tip_old_stable' if rp['nu_G']==r['nu_G'] else 'tip_old_essential'
   assert rp['nu_G'] in [r['nu_G'],r['nu_G']-1]
   if branch=='tip_old_stable':assert hp['nu_G']>=r['nu_G']+2
   else:assert hp['nu_G']>=r['nu_G']+1
  else:branch='other_membership';rp=None;assert hp['nu_G']>=r['nu_G']+1
  assert hp['tau_H']==r['tau_H']+2
  assert hp['tau_H']+hp['lambda']<=2*hp['nu_G']
  branches[branch]=branches.get(branch,0)+1
  rows.append({'X':X,'branch':branch,'H_prime':hp,'R':r,'R_without_endpoint_spoke':rp,'status':'PASS'})
 out.append({'name':name,'H0_edges':E,'Q':q,'root_edge':e,'rows':rows})
res={'status':'PASS','eligible_instances':sum(len(r['rows']) for r in out),'branch_counts':branches,'cases':out,'runtime_seconds':time.monotonic()-start,'scope':'finite supplement; ordinary proof supplies arbitrary graph-order transfer'}
(W/'evidence/b_k4ear_allx.json').write_text(json.dumps(res,indent=2)+'\n');print(res['eligible_instances'],branches,res['runtime_seconds'])
