"""Two prescribed named book controls, no graph census or optimizer.
Literal clique-piece upper bounds and exhaustive local maximum-packing/minimum-
cover response products certify the old named graph. Deletion extension and
explicit witnesses give all claimed residual optima.
"""
from pathlib import Path
from itertools import combinations,product
from datetime import datetime,timezone
import json,hashlib,time,platform,sys
root=Path(__file__).resolve().parents[1];start=time.monotonic();source=root/'inputs/C12_frozen.json';models={r['name']:r for r in json.loads(source.read_text())}
def edge(u,v):return tuple(sorted((u,v)))
def te(t):return frozenset(combinations(sorted(t),2))
def triangles(n,E):return [t for t in combinations(range(n),3) if te(t)<=E]
def cover(C,TT):return all(set(C)&te(t) for t in TT)
def pack(P,E):
 used=set()
 for t in P:assert te(t)<=E and not used&te(t);used|=te(t)
 return frozenset(used)
def tcomponents(TT):
 remaining=set(range(len(TT)));out=[]
 while remaining:
  j=remaining.pop();part={j};edges=set(te(TT[j]));changed=True
  while changed:
   changed=False
   for j in list(remaining):
    if edges&te(TT[j]):remaining.remove(j);part.add(j);edges|=te(TT[j]);changed=True
  out.append(sorted(part))
 return out
def pools(C):
 E={tuple(e) for e in C['edges']};TT=triangles(C['n'],E);pieces=[set(p) for p in C['pieces']];assert all(sum(set(t)<=p for p in pieces)==1 for t in TT)
 locals=[];r=0
 for p in pieces:
  localT=list(combinations(sorted(p),3));size=len(p)-3;r+=size;options=[]
  for P in combinations(localT,size):
   used=set();good=True
   for t in P:
    if used&te(t):good=False;break
    used|=te(t)
   if good:options.append((P,frozenset(used)))
  locals.append(options)
 maxpacks=[]
 for choices in product(*locals):
  used=set();P=[];good=True
  for ps,es in choices:
   if used&es:good=False;break
   used|=es;P.extend(ps)
  if good:assert len(P)==r;maxpacks.append((tuple(P),frozenset(used)))
 rootP=pieces[0];RE=sorted(combinations(sorted(rootP),2));RT=list(combinations(sorted(rootP),3));leaves=[]
 for p in pieces[1:]:
  parent=tuple(sorted(p&rootP));assert len(parent)==2;LE=set(combinations(sorted(p),2));LT=list(combinations(sorted(p),3));tau=2*(len(p)-3);opts={}
  for selected in(0,1):opts[selected]=[frozenset(D) for D in combinations(sorted(LE-{parent}),tau-selected) if cover(set(D)|({parent} if selected else set()),LT)]
  leaves.append((parent,tau,opts))
 rootstates=[]
 for bits in range(1<<len(RE)):
  D=frozenset(RE[i] for i in range(len(RE)) if bits>>i&1)
  if cover(D,RT):rootstates.append((len(D)+sum(t-int(p in D) for p,t,_ in leaves),D))
 tau=min(v for v,D in rootstates);mincovers=[]
 for v,D in rootstates:
  if v!=tau:continue
  for choices in product(*(opts[int(p in D)] for p,_,opts in leaves)):
   F=frozenset().union(D,*choices);assert len(F)==tau and cover(F,TT);mincovers.append(F)
 return E,TT,r,tau,maxpacks,list(dict.fromkeys(mincovers))
records=[]
for name,e in [('central_K4_star_555',(4,5)),('two_K5_edge',(0,1))]:
 C=models[name];E,QT,r,tau,PP,CC=pools(C);assert e in E;K=E-{e};KT=triangles(C['n'],K)
 pK=next(P for P,U in PP if e not in U);cQ=next(D for D in CC if e in D);cK=cQ-{e};assert cover(cK,KT)
 dels=[]
 for g in sorted(K):
  p=next((P for P,U in PP if e not in U and g not in U),None)
  assert p is not None,(name,g);pack(p,K-{g});dels.append({'edge':g,'nu':r,'packing':p})
 book=[];u,v=e
 for x in range(C['n']):
  px={edge(u,x),edge(v,x)}
  if x in e or not px<=K:continue
  T=tuple(sorted((u,v,x)));TE=set(te(T));R=E-TE;RT=triangles(C['n'],R)
  qp=next(P for P,U in PP if T in P);rp=[t for t in qp if t!=T];assert len(rp)==r-1;pack(rp,R)
  qc=next(D for D in CC if TE<=D);rc=qc-TE;assert len(rc)==tau-3 and cover(rc,RT)
  joint=qc-{e};assert len(joint)==tau-1 and px<=joint and cover(joint,KT)
  book.append({'apex':x,'spoke_pair':sorted(px),'nu_after_pair':r-1,'tau_after_pair':tau-3,'defect_after_pair':2*(r-1)-(tau-3),'packing_after_pair':rp,'cover_after_pair':sorted(rc),'minimum_K_cover_containing_pair':sorted(joint)})
 records.append({'model':name,'Q_edges':sorted(E),'deleted_edge':e,'Q_nu':r,'Q_tau':tau,'Q_min_degree':min(sum(v in f for f in E) for v in range(C['n'])),'K_edges':sorted(K),'K_nu':r,'K_tau':tau-1,'K_defect':2*r-(tau-1),'K_triangle_component_count':len(tcomponents(KT)),'K_triangle_supported':set.union(*(set(te(t)) for t in KT))==K,'K_packing':pK,'K_cover':sorted(cK),'K_single_deletion_packings':dels,'book_pair_rows':book,'maximum_Q_packings_enumerated':len(PP),'minimum_Q_covers_enumerated':len(CC),'no_minimum_K_cover_meets_all_pages_reason':'Any such cover would cover Q at tau(K), contradicting exact tau(Q)=tau(K)+1.'})
# Explicit global failures of the connected star control.
C=models['central_K4_star_555'];E,TT,r,tau,PP,CC=pools(C);S={(0,1),(2,3)};R=E-S;P=next([t for t in ps if not te(t)&S] for ps,U in PP if sum(not bool(te(t)&S) for t in ps)==r-1);pack(P,R)
records[0]['Q_global_blocker_control']={'deleted_pair':sorted(S),'nu_after_pair':r-1,'packing':P,'upper_bound':'The central K4 has no remaining triangle; every other triangle belongs to one of the three K5 leaves, each contributing at most2.'}
T=(1,2,3);R=E-set(te(T));RT=triangles(C['n'],R);records[0]['other_triangle_residual']={'triangle':T,'nu':6,'tau':12,'defect':0,'B_components':'three literal K5 leaves, each sharing only central vertex0 with the others'}
out={'status':'CERTIFIED_PRESCRIBED_BOOK_CONTROLS','utc':datetime.now(timezone.utc).isoformat(),'method':__doc__,'records':records,'sources':{str(source):hashlib.sha256(source.read_bytes()).hexdigest()},'elapsed_seconds':time.monotonic()-start,'python':sys.version,'platform':platform.platform(),'processes':1,'solver_threads':0}
p=root/'evidence/matching26_book_controls.json';p.write_text(json.dumps(out,indent=2)+'\n')
for r in records:print(r['model'],'Q',r['Q_nu'],r['Q_tau'],'K',r['K_nu'],r['K_tau'],'components',r['K_triangle_component_count'],'pages',len(r['book_pair_rows']),'pair defects',[z['defect_after_pair'] for z in r['book_pair_rows']])
print('seconds',out['elapsed_seconds']);print(p)
