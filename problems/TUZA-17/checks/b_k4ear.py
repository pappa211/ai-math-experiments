#!/usr/bin/env python3
from pathlib import Path
import sys,itertools,json,time
W=Path(__file__).resolve().parents[1];sys.path.insert(0,str(W/'checks'))
from b_probe import graph,pack,cover,mincovers,vc,edge,colour
start=time.monotonic()
cases=[('K4',4,list(itertools.combinations(range(4),2)),(0,1)),('twoK4-forbidden',6,list(set(e for c in [[0,1,2,3],[0,1,4,5]] for e in itertools.combinations(c,2))),(0,2)),('book-side',5,[(0,1),(0,2),(1,2),(0,3),(1,3),(0,4),(1,4)],(0,2))]
out=[]
def info(n,E,X):
 es,idx,ts,tm=graph(n,E);le=tuple(e for e in es if all(v in X for v in e));cs=mincovers(tm)
 lam=min(vc(tuple(e for e in le if not c>>idx[e]&1)) for c in cs)
 return {'nu':pack(tm),'tau':cover(tm),'lambda':lam,'eligible_link':not any(all(v in X for v in t) for t in ts)}
for name,n,E,e in cases:
 E=list(set(E));ep=E+[q for q in itertools.combinations([*e,n,n+1],2) if q!=e];ej=[q for q in E if q!=e];rows=[]
 assert colour(n+2,ep) is not None
 for mask in range(1<<n):
  X=[v for v in range(n) if mask>>v&1];h=info(n,E,X)
  if not h['eligible_link']:continue
  hp=info(n+2,ep,X);j=info(n,ej,X)
  _,_,_,gt=graph(n+1,E+[(v,n) for v in X]);ng=pack(gt)
  _,_,_,gpt=graph(n+3,ep+[(v,n+2) for v in X]);ngp=pack(gpt)
  assert hp['tau']==j['tau']+2 and hp['lambda']==j['lambda'] and hp['nu']==h['nu']+1 and ngp==ng+1
  rows.append({'X':X,'H':h,'H_prime':hp,'J':j,'nu_G':ng,'nu_G_prime':ngp,'status':'PASS'})
 out.append({'name':name,'H_edges':E,'ear_root_edge':e,'new_vertices':[n,n+1],'rows':rows})
res={'status':'PASS','cases':out,'eligible_instances':sum(len(c['rows']) for c in out),'runtime_seconds':time.monotonic()-start,'scope':'supplemental exact finite checks; ordinary proof is decisive'}
(W/'evidence/b_k4ear.json').write_text(json.dumps(res,indent=2)+'\n');print(res['eligible_instances'],res['runtime_seconds'])
