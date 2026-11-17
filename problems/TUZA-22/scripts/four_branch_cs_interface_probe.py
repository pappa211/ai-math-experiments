"""New CS-compatible witness probe. Stops at first unresolved profile, not a census theorem."""
import itertools,json,signal,time,hashlib
from functools import lru_cache
from pathlib import Path
R=Path(__file__).resolve().parents[1]; start=time.monotonic(); rows=[]
pairs=list(itertools.combinations(range(4),2)); pairid={e:i for i,e in enumerate(pairs)}
perms=list(itertools.permutations(range(4)))
statenames=['0','D','E2','O3','DE2','DE4']
def canon(s):
 out=[]
 for p in perms:
  z=[0]*6
  for i,(a,b) in enumerate(pairs):z[pairid[tuple(sorted((p[a],p[b])))]]=s[i]
  out.append(tuple(z))
 return min(out)
def graph(s):
 E=set();n=4;paths=[]
 for (a,b),v in zip(pairs,s):
  if v in (1,4,5):E.add((a,b))
  length={2:2,3:3,4:2,5:4}.get(v)
  if length:
   path=[a]+list(range(n,n+length-1))+[b];n+=length-1
   paths.append(path)
   E.update(tuple(sorted(e)) for e in zip(path,path[1:]))
 return n,sorted(E),paths
profiles=[]
for s in itertools.product(range(6),repeat=6):
 if sum(v in (2,4,5) for v in s)>3:continue
 deg=[0]*4;p=0
 for (a,b),v in zip(pairs,s):
  z=0 if v==0 else 2 if v in (4,5) else 1
  deg[a]+=z;deg[b]+=z;p+=z
 if min(deg)<3 or max(deg)==3 or max(deg)>p-3:continue
 if all(v in (1,4,5) for v in s):continue
 if s!=canon(s):continue
 n,E,paths=graph(s);es=set(E)
 T=[t for t in itertools.combinations(range(n),3) if all(tuple(sorted(e)) in es for e in itertools.combinations(t,2))]
 if T:profiles.append((n,s,E,paths,T,deg))
profiles.sort(key=lambda z:(z[0],sum(v==5 for v in z[1]),z[1]))
def timeout(*_):raise TimeoutError
signal.signal(signal.SIGALRM,timeout)
def maxmatching(n,E):
 adj=[0]*n
 for a,b in E:adj[a]|=1<<b;adj[b]|=1<<a
 @lru_cache(maxsize=90000)
 def go(V):
  if not V:return ()
  vs=[i for i in range(n) if V>>i&1]
  u=min(vs,key=lambda i:(adj[i]&V).bit_count());N=adj[u]&V
  if not N:return go(V&~(1<<u))
  ns=[i for i in range(n) if N>>i&1]
  if len(ns)==1:
   v=ns[0];return ((min(u,v),max(u,v)),)+go(V&~(1<<u|1<<v))
  ans=go(V&~(1<<u))
  for v in ns:
   z=((min(u,v),max(u,v)),)+go(V&~(1<<u|1<<v))
   if len(z)>len(ans):ans=z
  return ans
 return go((1<<n)-1)
def solve(n,E,T):
 ei={e:i for i,e in enumerate(E)};full=(1<<len(E))-1
 inc=[0]*n;adj=[0]*n
 for i,(a,b) in enumerate(E):inc[a]|=1<<i;inc[b]|=1<<i;adj[a]|=1<<b;adj[b]|=1<<a
 Z=maxmatching(n,E);nu=len(Z)
 ts=[]
 for t in T:
  et=set(itertools.combinations(t,2));z=maxmatching(n,[e for e in E if e not in et]);ts.append((t,et,z))
 @lru_cache(maxsize=90000)
 def cover(S):
  if not S:return 0
  ds=[(inc[i]&S).bit_count() for i in range(n)]
  leaf=next((i for i,d in enumerate(ds) if d==1),None)
  if leaf is not None:
   e=E[(inc[leaf]&S).bit_length()-1];v=e[1]if e[0]==leaf else e[0]
   return (1<<v)|cover(S&~inc[v])
  u=max(range(n),key=lambda i:ds[i]);nbr=set()
  for j,e in enumerate(E):
   if (S>>j&1) and u in e:nbr.add(e[1]if e[0]==u else e[0])
  A=(1<<u)|cover(S&~inc[u]);cut=0;B=0
  for v in nbr:cut|=inc[v];B|=1<<v
  B|=cover(S&~cut)
  return A if A.bit_count()<=B.bit_count() else B
 checked=0
 def matches(V,k,P):
  if k==0:yield tuple(P);return
  if V.bit_count()<2*k:return
  vs=[i for i in range(n) if V>>i&1]
  if not vs:return
  u=min(vs,key=lambda i:(adj[i]&V).bit_count());N=adj[u]&V
  for v in range(n):
   if N>>v&1:yield from matches(V&~(1<<u|1<<v),k-1,P+[(min(u,v),max(u,v))])
  yield from matches(V&~(1<<u),k,P)
 for size in range(nu,0,-1):
  for P in matches((1<<n)-1,size,[]):
   checked+=1;pm=sum(1<<ei[e]for e in P);Q=cover(full&~pm);q=Q.bit_count()
   if q>size:continue
   out={'P':P,'Q':[i for i in range(n)if Q>>i&1],'tested_matchings':checked,'nu_matching':nu}
   if q<size:out['kind']='STRICT';return out
   if nu>size:out.update(kind='LARGER',Z=Z);return out
   ps=set(P)
   for t,et,z in ts:
    if ps&et and len(z)>=size:out.update(kind='RIM',T=t,Z=z);return out
 return {'kind':'UNRESOLVED_CERTIFICATE_TYPE','tested_matchings':checked,'nu_matching':nu}
def save(status,last=None):
 out={'identity':'TUZA22 new strict/larger/fixed-rim CS interface diagnostic','status':status,'elapsed_seconds':time.monotonic()-start,'domain_representatives':len(profiles),'processed':len(rows),'rows':rows,'first_unresolved':last,'scope':'Canonical remaining4branch parity representatives; stops first unresolved. No all-size claim from passes; fixed actual rim triangles and simultaneous witness lift required. UNKNOWN is retained.'}
 (R/'evidence/four_branch_cs_interface_probe.json').write_text(json.dumps(out,indent=2)+'\n')
for n,s,E,paths,T,deg in profiles:
 if time.monotonic()-start>55:save('GLOBAL_CAP_UNKNOWN');break
 row={'states':[statenames[v]for v in s],'state_ids':s,'pairs':pairs,'n':n,'edges':E,'paths':paths,'triangles':T,'branch_degrees':deg}
 signal.setitimer(signal.ITIMER_REAL,.8)
 try:row['result']=solve(n,E,T)
 except TimeoutError:row['result']={'kind':'PROFILE_TIMEOUT_UNKNOWN'}
 finally:signal.setitimer(signal.ITIMER_REAL,0)
 rows.append(row)
 if row['result']['kind']in('UNRESOLVED_CERTIFICATE_TYPE','PROFILE_TIMEOUT_UNKNOWN'):
  save('STOPPED_FIRST_UNRESOLVED',row);print(json.dumps({'elapsed':time.monotonic()-start,'processed':len(rows),'domain':len(profiles),'states':row['states'],'n':n,'result':row['result']}));break
 save('RUNNING')
else:save('ALL_FIXED_DOMAIN_CERTIFIED');print(json.dumps({'elapsed':time.monotonic()-start,'processed':len(rows),'domain':len(profiles),'status':'ALL_FIXED_DOMAIN_CERTIFIED'}))
