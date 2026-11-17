#!/usr/bin/env python3
"""Complete fourteen-shape cycle-cover residual discriminator; stop first UNKNOWN."""
import itertools,json,time,signal,functools,hashlib
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1];START=time.monotonic();ROWS=[]
TF_DEP='1c40a0c8be58ca926e7f35175448dc80c0d891c22128a6596af9a379775d88b6'
PAID_DEP='8143c49ad20f0dc7ef5d9d585be5d759b346be2ff1cf9b31ffab3e6f1cc57865'
BRANCH_DEP='dd530b892b10279fda98b195522f1027376deadfbce7a769ae2aec28d62bafa4'
def triangles(n,E):
 return [t for t in itertools.combinations(range(n),3) if all(e in E for e in itertools.combinations(t,2))]
def matchings(n,E):
 adj=[0]*n
 for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
 def rec(V):
  if not V:yield ();return
  bit=V&-V;u=bit.bit_length()-1;rest=V^bit
  yield from rec(rest)
  W=adj[u]&rest
  while W:
   bv=W&-W;W^=bv;v=bv.bit_length()-1
   for M in rec(rest^bv):yield ((u,v),)+M
 return sorted(rec((1<<n)-1),key=lambda M:(-len(M),M))
def badcomponent(T):
 tes=[set(itertools.combinations(t,2)) for t in T];left=set(range(len(T)))
 while left:
  j=min(left);left.remove(j);todo=[j];comp=[];support=set()
  while todo:
   j=todo.pop();comp.append(j);support|=tes[j]
   nxt=[k for k in left if tes[k]&tes[j]]
   for k in nxt:left.remove(k);todo.append(k)
  V=sorted({v for e in support for v in e})
  if len(V)>5 or support!=set(itertools.combinations(V,2)):
   return {'triangles':[T[j] for j in sorted(comp)],'support':sorted(support),'vertices':V}
 return None
def solve(n,E,T,deg):
 branches=[i for i,d in enumerate(deg) if d>=3]
 if len(branches)<=3:return {'kind':'ORDINARY_BRANCH_AT_MOST_3','branch_vertices':branches,'dependency_sha256':BRANCH_DEP}
 E=tuple(E);ei={e:i for i,e in enumerate(E)};inc=[0]*n;full=(1<<len(E))-1
 for j,(u,v) in enumerate(E):inc[u]|=1<<j;inc[v]|=1<<j
 @functools.lru_cache(None)
 def vc(mask):
  if not mask:return 0
  j=(mask&-mask).bit_length()-1;u,v=E[j]
  A=(1<<u)|vc(mask&~inc[u]);B=(1<<v)|vc(mask&~inc[v])
  return min((A,B),key=lambda x:(x.bit_count(),x))
 Sdata=[]
 for k in range(3):
  for S in itertools.combinations(range(n),k):
   ss=set(S);Sdata.append((S,ss,[t for t in T if not ss.intersection(t)]))
 mats=matchings(n,E);rimcache={};tested=0
 for P in mats:
  if time.monotonic()-START>55:raise TimeoutError('global55s')
  r=len(P)
  if not r:break
  tested+=1;ps=set(P);pm=sum(1<<ei[e] for e in P);qm=vc(full&~pm)
  if qm.bit_count()>r:continue
  out={'P':P,'Q':[v for v in range(n) if qm>>v&1],'tested_matchings':tested}
  if qm.bit_count()<r:return dict(out,kind='STRICT')
  for S,ss,Ts in Sdata:
   Z=sorted({v if u in ss else u for u,v in P if (u in ss)!=(v in ss)})
   if r>len(S)+len(Z)+len(Ts):
    return dict(out,kind='PAID_TRIANGLE_COLLAPSE' if Ts else 'S_COLLAPSE',S=S,S_mates=Z,remaining_actual_triangles=Ts,dependency_sha256=PAID_DEP)
  R=set(E)-ps;RT=[t for t in T if not ps.intersection(itertools.combinations(t,2))]
  bad=badcomponent(RT)
  if bad:return dict(out,kind='B_INCOMPATIBLE',component=bad)
  if not RT:
   N=next((M for M in mats if len(M)>=r and not ps.intersection(M)),None)
   if N is not None:return dict(out,kind='TF_RESIDUAL_EQUAL_MATCHING',R_matching=N,dependency_sha256=TF_DEP)
  cliques=[set(itertools.combinations(C,2)) for k in range(2,6) for C in itertools.combinations(range(n),k) if all(e in R for e in itertools.combinations(C,2))]
  for t in T:
   te=set(itertools.combinations(t,2))
   if not ps&te:continue
   if t not in rimcache:rimcache[t]=[M for M in mats if not te.intersection(M)]
   for N in rimcache[t]:
    if len(N)<r:break
    footprint=(set(N)|te)&R;ok=True
    for CE in cliques:
     A=footprint&CE
     if len(A)>2:ok=False;break
     if len(A)==2:
      e,f=tuple(A)
      if not set(e)&set(f):ok=False;break
    if ok:return dict(out,kind='RIM',T=t,Z=N,footprint=sorted(footprint))
 return {'kind':'UNKNOWN_NO_APPROVED_CERTIFICATE','tested_matchings':tested}
def alarm(*_):raise TimeoutError('profile0.5s')
signal.signal(signal.SIGALRM,alarm)
profiles=[];rejected_degree_connected=0;rejected_k4=0;raw=0;shape_records=[]
for lengths in ([2],[3],[4],[5],[2,2],[2,3],[3,3]):
 for isolates in (0,1):
  nf=sum(lengths)+isolates;n=nf+2;F=set();offset=0
  for length in lengths:
   F.update((i,i+1) for i in range(offset,offset+length-1));offset+=length
  sid='P'+'_P'.join(map(str,lengths))+('_I1' if isolates else '')
  shape_row={'id':sid,'path_orders':lengths,'isolates':isolates,'n_F':nf,'F_edges':sorted(F),'raw':0,'eligible':0,'rejected_degree_connected':0,'rejected_k4':0};shape_records.append(shape_row)
  for am in range(1<<nf):
   for bm in range(1<<nf):
    for ab in (0,1):
     raw+=1;shape_row['raw']+=1
     E=F|{(i,nf) for i in range(nf) if am>>i&1}|{(i,nf+1) for i in range(nf) if bm>>i&1}
     if ab:E=E|{(nf,nf+1)}
     deg=[sum(v in e for e in E) for v in range(n)]
     if min(deg)<2:
      rejected_degree_connected+=1;shape_row['rejected_degree_connected']+=1;continue
     seen={0};todo=[0]
     while todo:
      u=todo.pop()
      for e in E:
       if u in e:
        v=e[0] if e[1]==u else e[1]
        if v not in seen:seen.add(v);todo.append(v)
     if len(seen)<n:
      rejected_degree_connected+=1;shape_row['rejected_degree_connected']+=1;continue
     if any(all(e in E for e in itertools.combinations(V,2)) for V in itertools.combinations(range(n),4)):
      rejected_k4+=1;shape_row['rejected_k4']+=1;continue
     shape_row['eligible']+=1
     profiles.append({'shape':sid,'path_orders':lengths,'isolates':isolates,'n_F':nf,'F_edges':sorted(F),'a':nf,'b':nf+1,'a_mask':am,'b_mask':bm,'ab':ab,'a_neighbors':[i for i in range(nf) if am>>i&1],'b_neighbors':[i for i in range(nf) if bm>>i&1],'n':n,'edges':sorted(E),'triangles':triangles(n,E),'degrees':deg})
status='ALL_FIXED_DOMAIN_CERTIFIED';unknown=None
for row in profiles:
 if time.monotonic()-START>55:
  status='GLOBAL_CAP_UNKNOWN';unknown=row;unknown['certificate']={'kind':'GLOBAL_TIMEOUT_UNKNOWN','reason':'global55s'};break
 signal.setitimer(signal.ITIMER_REAL,.5)
 try:row['certificate']=solve(row['n'],row['edges'],row['triangles'],row['degrees'])
 except TimeoutError as exc:row['certificate']={'kind':'TIMEOUT_UNKNOWN','reason':str(exc)}
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 ROWS.append(row)
 if 'UNKNOWN' in row['certificate']['kind']:
  status='STOPPED_FIRST_UNKNOWN';unknown=row;break
counts={}
for row in ROWS:counts[row['certificate']['kind']]=counts.get(row['certificate']['kind'],0)+1
out={'identity':'TUZA22 complete14 path-forest cycle-cover residual interface','status':status,'raw_ordered_states':raw,'rejected_degree_connected':rejected_degree_connected,'rejected_k4':rejected_k4,'domain_records':len(profiles),'processed':len(ROWS),'shape_records':shape_records,'counts':counts,'elapsed_seconds':time.monotonic()-START,'first_unknown':unknown,'rows':ROWS,'scope':'Exactly seven nontrivial path forests of matching number at most2, each with0/1 isolate; every ordered pair of apex neighborhoods and optional apex edge. Filters only actual minimum degree>=2, connectedness, K4-freeness. No symmetry quotient or further pruning. First UNKNOWN stops. Independent full-domain and literal-certificate validation required.'}
(ROOT/'evidence/challenger_cycle_cover_residual_interface.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='rows'}))
