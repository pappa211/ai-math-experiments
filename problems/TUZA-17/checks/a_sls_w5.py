#!/usr/bin/env python3
"""Tiny independent exhaustive witness for SLS, not a test of actual criticality."""
import itertools,json,resource,signal,sys,time
from pathlib import Path
start=time.monotonic();signal.alarm(20);resource.setrlimit(resource.RLIMIT_CPU,(20,20))
root=Path(__file__).resolve().parent.parent
def e(u,v):return tuple(sorted((u,v)))
L={e(i,(i+1)%5) for i in range(5)}
E=L|{(i,5) for i in range(5)}
EH=sorted(E);EG=sorted(E|{(i,6) for i in range(5)})
def tris(n,edges):
 S=set(edges)
 return [tuple(t) for t in itertools.combinations(range(n),3) if all(e(*f) in S for f in itertools.combinations(t,2))]
def triangle_edges(t):return {e(*x) for x in itertools.combinations(t,2)}
def mincovers(edges,T):
 ts=[triangle_edges(t) for t in T]
 for k in range(len(edges)+1):
  out=[list(C) for C in itertools.combinations(edges,k) if all(set(C)&t for t in ts)]
  if out:return k,out
 return 0,[[]]
def maxpack(T):
 ts=[triangle_edges(t) for t in T]
 for k in range(len(T),-1,-1):
  for ids in itertools.combinations(range(len(T)),k):
   chosen=[ts[i] for i in ids]
   if len(set().union(*chosen))==3*k:return k,[T[i] for i in ids]
def vc(edges):
 for k in range(6):
  for V in itertools.combinations(range(5),k):
   if all(set(V)&set(f) for f in edges):return k,list(V)
TH=tris(6,EH);TG=tris(7,EG)
spoke_colors=[0,1,0,1,2];colors={e(i,5):spoke_colors[i] for i in range(5)}
for f in L:colors[f]=next(c for c in range(3) if c not in [spoke_colors[f[0]],spoke_colors[f[1]]])
assert all(len({colors[f] for f in triangle_edges(t)})==3 for t in TH)
assert not tris(5,L)
assert all(any(f in triangle_edges(t) for t in TH) for f in L)
h,pH=maxpack(TH);p,pG=maxpack(TG);tau,minimum=mincovers(EH,TH);tauG,minG=mincovers(EG,TG)
rows=[]
for C in minimum:
 lam,S=vc(L-set(C));rows.append({'cover':C,'rim_edges':[f for f in C if f in L],'residual_link_vc':lam,'vertex_cover':S})
lam=min(row['residual_link_vc'] for row in rows)
stable=[]
for f in EH:
 nup,pw=maxpack(tris(6,set(EH)-{f}));assert nup==h
 stable.append({'deleted_edge':f,'nu':nup,'packing':pw})
assert (h,tau,2*h-tau,lam,p,tauG)==(2,3,1,2,4,5)
assert len(minimum)==10 and sorted(len(row['rim_edges']) for row in rows)==[0]*5+[1]*5
out={'status':'SLS_REFUTED','AC_status':'PASS_FOR_THIS_WITNESS','H_order':6,'H_edges':EH,'X':list(range(5)),'H_actual_triangles':TH,'L_edges':sorted(L),'L_old_edges':sorted(L),'H_rainbow_coloring':[{'edge':f,'color':colors[f]} for f in EH],'nu_H':h,'packing_H':pH,'tau_H':tau,'D_H':2*h-tau,'all_minimum_H_covers':rows,'lambda_old':lam,'all_H_edges_packing_stable':stable,'G_order':7,'G_edges':EG,'G_actual_triangles':TG,'nu_G':p,'packing_G':pG,'tau_G':tauG,'G_minimum_cover':minG[0],'apex_gain':p-h,'AC_budget':2*p-tau,'best_minimum_H_compatibility_cost':tau+lam,'exact_method':'all subsets of the full actual triangle family for packing; all graph-edge subsets by increasing size for cover; all X vertex subsets by increasing size for ordinary vertex cover','python':sys.version,'elapsed_seconds':time.monotonic()-start,'peak_rss_bytes_darwin':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
(root/'evidence/a_sls_w5.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['status','AC_status','nu_H','tau_H','D_H','lambda_old','nu_G','tau_G','apex_gain','AC_budget','elapsed_seconds']}))
