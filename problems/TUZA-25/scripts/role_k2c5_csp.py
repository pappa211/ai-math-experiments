"""Finite role-CSP proof search; no external SAT package, timeout is UNKNOWN."""
import itertools,json,time,signal
from pathlib import Path


W=Path(__file__).resolve().parents[1]
PERMS=list(itertools.permutations(range(3)))
E={tuple(sorted((i,(i+1)%5))) for i in range(5)}|{(i,j) for i in range(5) for j in [5,6]}|{(5,6)}
T=[t for t in itertools.combinations(range(7),3) if set(itertools.combinations(t,2))<=E]
te=[list(itertools.combinations(t,2)) for t in T]
pairs=[]
for i,j in itertools.combinations(range(len(T)),2):
 c=set(te[i])&set(te[j])
 if c:
  e=next(iter(c));a,b=te[i].index(e),te[j].index(e)
  pairs.append((i,j,a,b))
pi={(i,j):k for k,(i,j,a,b) in enumerate(pairs)}
raw=set()
for F in itertools.combinations(range(len(T)),5):
 cl=frozenset(pi[(i,j)] for i,j in itertools.combinations(F,2) if (i,j) in pi)
 assert cl;raw.add(cl)
clauses=[]
for c in sorted(raw,key=lambda x:(len(x),tuple(x))):
 if not any(d<=c for d in clauses):clauses.append(c)
# A clause says at least one shared graph edge in that five-triangle family
# receives the same role on both triangles, preventing a role-disjoint size5 family.
compat=[]
for i,j,a,b in pairs:
 compat.append([[PERMS[x][a]==PERMS[y][b] for y in range(6)] for x in range(6)])
nodes=0;fails=0;start=time.monotonic();proof=[]
def propagate(ds):
 while True:
  changes=False
  for c in clauses:
   poss=[];satisfied=False
   for p in c:
    i,j,a,b=pairs[p];tab=compat[p]
    vals=[tab[x][y] for x in ds[i] for y in ds[j]]
    if all(vals):satisfied=True;break
    if any(vals):poss.append(p)
   if satisfied:continue
   if not poss:return None
   if len(poss)==1:
    p=poss[0];i,j,a,b=pairs[p];tab=compat[p]
    di=tuple(x for x in ds[i] if any(tab[x][y] for y in ds[j]))
    dj=tuple(y for y in ds[j] if any(tab[x][y] for x in di))
    if not di or not dj:return None
    if di!=ds[i] or dj!=ds[j]:ds[i]=di;ds[j]=dj;changes=True
  if not changes:return ds
freq=[sum(any(pairs[p][0]==i or pairs[p][1]==i for p in c) for c in clauses) for i in range(len(T))]
def solve(ds):
 global nodes,fails
 nodes+=1
 ds=propagate(list(ds))
 if ds is None:fails+=1;return None
 if all(len(d)==1 for d in ds):return [d[0] for d in ds]
 i=min((i for i,d in enumerate(ds) if len(d)>1),key=lambda i:(len(ds[i]),-freq[i]))
 for x in ds[i]:
  child=list(ds);child[i]=(x,);res=solve(child)
  if res is not None:return res
 return None
class Timeout(Exception):pass
def alarm(*x):raise Timeout()
signal.signal(signal.SIGALRM,alarm);signal.alarm(120)
try:
 ds=[tuple(range(6)) for _ in T];ds[0]=(0,)
 res=solve(ds);status='UNSAT_EXHAUSTIVE' if res is None else 'SAT_WITNESS'
except Timeout:res=None;status='UNKNOWN_TIMEOUT'
finally:signal.alarm(0)
out={'graph':'K2_join_C5','n':7,'edges':sorted(E),'triangles':T,'target_no_role_disjoint_family_size':5,'ordinary_nu':4,'ordinary_nu_source':'independently brute-force checked by reviewer before acceptance','symmetry':'Global permutation of three roles fixes first triangle permutation0 without loss','all_five_families':len(list(itertools.combinations(T,5))),'raw_distinct_clauses':len(raw),'minimal_clauses':len(clauses),'pairs':pairs,'clauses':[sorted(c) for c in clauses],'status':status,'role_assignment':res,'search_nodes':nodes,'failed_nodes':fails,'elapsed_seconds':time.monotonic()-start,'timeout_seconds':120}
(W/'evidence/role_k2c5_csp.json').write_text(json.dumps(out,indent=2)+'\n')
print({k:out[k] for k in ['status','search_nodes','failed_nodes','elapsed_seconds','minimal_clauses']})
