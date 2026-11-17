"""One fixed twelve-shape CS interface, complete or stop first UNKNOWN."""
import itertools,json,time,signal
from functools import lru_cache
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]; start=time.monotonic(); rows=[]
def edge(a,b):return tuple(sorted((a,b)))
def shape(i):
 E={(0,1),(1,2),(0,2)}; n=3
 def path(root,length):
  nonlocal n
  seq=[root]+list(range(n,n+length));n+=length
  E.update(edge(a,b)for a,b in zip(seq,seq[1:]));return seq[-1]
 if i==1:path(0,1);path(1,1)
 elif i==2:path(0,2)
 elif i==3:path(0,2);path(1,1);path(2,1)
 elif i==4:path(0,3);path(1,1)
 elif i==5:path(0,1);path(0,2);path(1,1)
 elif i==6:path(0,1);path(0,3)
 elif i==7:path(0,1);path(0,3);path(1,1)
 elif i==8:path(0,2);path(1,2)
 elif i==9:path(0,4)
 elif i==10:path(0,2);path(0,2)
 elif i==11:x=path(0,1);path(x,1);path(x,2)
 elif i==12:x=path(0,1);path(x,1);path(x,3)
 return n,tuple(sorted(E))
def triangles(n,E):
 es=set(E);return [t for t in itertools.combinations(range(n),3)if all(e in es for e in itertools.combinations(t,2))]
def allmatchings(n,E):
 adj=[0]*n
 for a,b in E:adj[a]|=1<<b;adj[b]|=1<<a
 def rec(V):
  if not V:yield ();return
  u=(V&-V).bit_length()-1;rest=V&~(1<<u)
  for M in rec(rest):yield M
  N=adj[u]&rest
  while N:
   bit=N&-N;N-=bit;v=bit.bit_length()-1
   for M in rec(rest&~bit):yield ((u,v),)+M
 return sorted(rec((1<<n)-1),key=lambda M:(-len(M),M))
def badcomponent(T,E):
 sets=[set(itertools.combinations(t,2))for t in T];left=set(range(len(T)))
 while left:
  seed=min(left);left.remove(seed);todo=[seed];comp=[];support=set()
  while todo:
   j=todo.pop();comp.append(j);support|=sets[j]
   new=[k for k in left if sets[k]&sets[j]]
   for k in new:left.remove(k);todo.append(k)
  vs=sorted({v for e in support for v in e})
  if len(vs)>5 or support!=set(itertools.combinations(vs,2)):
   return {'triangles':[T[j]for j in sorted(comp)],'support':sorted(support),'vertices':vs}
 return None
def solve(n,E,T):
 E=tuple(E);ei={e:i for i,e in enumerate(E)};full=(1<<len(E))-1;inc=[0]*n
 for j,(a,b)in enumerate(E):inc[a]|=1<<j;inc[b]|=1<<j
 @lru_cache(None)
 def cover(mask):
  if not mask:return 0
  j=(mask&-mask).bit_length()-1;a,b=E[j]
  A=(1<<a)|cover(mask&~inc[a]);B=(1<<b)|cover(mask&~inc[b])
  return A if(A.bit_count(),A)<=(B.bit_count(),B)else B
 trans=[]
 for size in range(3):
  for S in itertools.combinations(range(n),size):
   ss=set(S)
   if all(ss.intersection(t)for t in T):trans.append(S)
 mats=allmatchings(n,E);nu=len(mats[0]); tested=0
 rim_matches={}
 for t in T:
  te=set(itertools.combinations(t,2));rim_matches[t]=[M for M in allmatchings(n,[e for e in E if e not in te])]
 for P in mats:
  r=len(P)
  if not r:break
  tested+=1;ps=set(P);pm=sum(1<<ei[e]for e in P);qm=cover(full&~pm);q=qm.bit_count()
  if q>r:continue
  out={'P':P,'Q':[v for v in range(n)if qm>>v&1],'tested_matchings':tested,'nu_matching_not_premise':nu}
  if q<r:return dict(out,kind='STRICT')
  for S in trans:
   ss=set(S);Z=sorted({b if a in ss else a for a,b in P if(a in ss)!=(b in ss)})
   if r>len(S)+len(Z):return dict(out,kind='S_COLLAPSE',S=S,S_mates=Z)
  R=set(E)-ps;RT=[t for t in T if not ps.intersection(itertools.combinations(t,2))]
  bad=badcomponent(RT,R)
  if bad:return dict(out,kind='B_INCOMPATIBLE',component=bad)
  cliques=[set(itertools.combinations(C,2))for size in range(2,min(5,n)+1)for C in itertools.combinations(range(n),size)if all(e in R for e in itertools.combinations(C,2))]
  for t in T:
   te=set(itertools.combinations(t,2))
   if not ps&te:continue
   for Z in rim_matches[t]:
    if len(Z)<r:break
    footprint=(set(Z)|te)&R;ok=True
    for CE in cliques:
     A=footprint&CE
     if len(A)>2 or(len(A)==2 and not(set(next(iter(A)))&set(next(iter(A-{next(iter(A))}))))):ok=False;break
    if ok:return dict(out,kind='RIM',T=t,Z=Z,footprint=sorted(footprint),footprint_rule='AT_MOST_TWO_INCIDENT_EDGES_PER_RESIDUAL_CLIQUE_2_TO_5')
 return {'kind':'UNKNOWN_NO_APPROVED_CERTIFICATE','tested_matchings':tested,'nu_matching_not_premise':nu}
def timeout(*_):raise TimeoutError
signal.signal(signal.SIGALRM,timeout)
profiles=[]
for i in range(1,13):
 nf,FE=shape(i);deg=[0]*nf
 for a,b in FE:deg[a]+=1;deg[b]+=1
 leaves=[v for v in range(nf)if deg[v]==1];mandatory=sum(1<<v for v in leaves)
 for mask in range(1<<nf):
  if mask&mandatory!=mandatory or mask.bit_count()<2:continue
  W=[v for v in range(nf)if mask>>v&1];E=sorted(set(FE)|{(v,nf)for v in W});T=triangles(nf+1,E)
  profiles.append({'shape_id':i,'n_F':nf,'F_edges':FE,'F_leaves':leaves,'apex':nf,'apex_neighbors':W,'n':nf+1,'edges':E,'triangles':T})
def save(status,unknown=None):
 out={'identity':'TUZA22 complete twelve-shape triangular-unicyclic CS interface','status':status,'elapsed_seconds':time.monotonic()-start,'domain_records':len(profiles),'processed':len(rows),'first_unknown':unknown,'rows':rows,'scope':'All twelve proved F shapes, every apex neighborhood containing all original leaves and size>=2. No other pruning or symmetry quotient. Only approved literal CS certificates. Independent completeness and witness validation required.'}
 (ROOT/'evidence/triangular_unicyclic_cs_interface.json').write_text(json.dumps(out,indent=2)+'\n')
for row in profiles:
 if time.monotonic()-start>55:save('GLOBAL_CAP_UNKNOWN',row);print(json.dumps({'status':'GLOBAL_CAP_UNKNOWN','processed':len(rows),'domain':len(profiles)}));break
 signal.setitimer(signal.ITIMER_REAL,.8)
 try:row['certificate']=solve(row['n'],row['edges'],row['triangles'])
 except TimeoutError:row['certificate']={'kind':'PROFILE_TIMEOUT_UNKNOWN'}
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 rows.append(row)
 if 'UNKNOWN'in row['certificate']['kind']:
  save('STOPPED_FIRST_UNKNOWN',row);print(json.dumps({'status':'STOPPED_FIRST_UNKNOWN','processed':len(rows),'domain':len(profiles),'shape':row['shape_id'],'neighbors':row['apex_neighbors'],'certificate':row['certificate']}));break
 if len(rows)%25==0:save('RUNNING')
else:
 save('ALL_FIXED_DOMAIN_CERTIFIED');counts={}
 for row in rows:counts[row['certificate']['kind']]=counts.get(row['certificate']['kind'],0)+1
 print(json.dumps({'status':'ALL_FIXED_DOMAIN_CERTIFIED','elapsed':time.monotonic()-start,'processed':len(rows),'domain':len(profiles),'counts':counts}))
