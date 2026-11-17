"""Exact, deterministic K5 ring witnesses; standard library, no solver or census."""
import itertools,json,platform,sys,time
from pathlib import Path
from collections import deque
W=Path(__file__).resolve().parents[1]
pairs=[(2*i,2*i+1) for i in range(4)]
cliques=[tuple(sorted(pairs[i]+pairs[(i+1)%4]+(8+i,))) for i in range(4)]
edges=sorted(set().union(*(set(itertools.combinations(q,2)) for q in cliques)))
eidx={e:i for i,e in enumerate(edges)}
def emask(t):return sum(1<<eidx[e] for e in itertools.combinations(t,2))
triangles=[t for t in itertools.combinations(range(12),3) if all(e in eidx for e in itertools.combinations(t,2))]
tmask=[emask(t) for t in triangles]
owners=[[i for i,q in enumerate(cliques) if set(t)<=set(q)] for t in triangles]
assert all(len(o)==1 for o in owners)
choices=[]
for q in cliques:
 tt=[(t,emask(t)) for t in triangles if set(t)<=set(q)]
 choices.append([(a[1]|b[1],[a[0],b[0]]) for a,b in itertools.combinations(tt,2) if not a[1]&b[1]])
def pack_avoiding(deleted):
 dm=sum(1<<x for x in deleted)
 def dfs(i,used,out):
  if i==4:return out
  for mask,ts in choices[i]:
   if not mask&(used|dm):
    r=dfs(i+1,used|mask,out+ts)
    if r is not None:return r
  return None
 return dfs(0,0,[])
cases=[]
for r in range(3):
 for d in itertools.combinations(range(len(edges)),r):
  p=pack_avoiding(d)
  assert p is not None
  used=0
  for t in p:
   tm=emask(t);assert not tm&used;used|=tm
  assert len(p)==8 and not used&sum(1<<i for i in d)
  cases.append({'deleted_edges':[edges[i] for i in d],'packing':p})
def rank(rows):
 basis={}
 for x in rows:
  while x:
   k=x.bit_length()-1
   if k not in basis:basis[k]=x;break
   x^=basis[k]
 return len(basis)
d0=[sum(1<<i for i,e in enumerate(edges) if v in e) for v in range(12)]
r0=rank(d0);r1=rank(tmask)
F=sorted(tuple(sorted((u,v))) for u in pairs[0] for v in pairs[1]+(8,))
fm=sum(1<<eidx[e] for e in F)
cycle=[(0,2),(2,4),(4,6),(0,6)]
assert all((fm&t).bit_count()%2==0 for t in tmask)
assert sum(e in F for e in cycle)%2==1
# Exact cut minimum by all bipartitions with vertex 0 fixed; witness is a cover.
cut_candidates=[]
for b in range(1<<11):
 colors=[0]+[(b>>(v-1))&1 for v in range(1,12)]
 C=[e for e in edges if colors[e[0]]==colors[e[1]]]
 cut_candidates.append((len(C),b,C))
mc=min(cut_candidates)
# tau>=12: each clique needs >=4 cover edges; only four shared edges counted twice.
assert mc[0]==12
seen={0};queue=[0]
while queue:
 i=queue.pop()
 for j in range(len(triangles)):
  if j not in seen and tmask[i]&tmask[j]:seen.add(j);queue.append(j)
assert len(seen)==len(triangles)
assert set().union(*(set(itertools.combinations(t,2)) for t in triangles))==set(edges)
out={'status':'VERIFIED_FINITE','universe':'one explicitly labelled simple graph; all 0,1,2-edge deletion sets; no graph census','n':12,'m':len(edges),'triangles':triangles,'edges':edges,'cliques':cliques,'triangle_owners':[o[0] for o in owners],'nu':8,'tau':12,'packing_upper_bound':'Every actual triangle belongs to exactly one K5, each permits at most two edge-disjoint triangles.','cover_lower_bound':'Each of four K5 restrictions needs four edges. Only four shared pair edges count twice, so |C|>=16-4.','minimum_cut_cover':mc[2],'cut_partition_bits':mc[1],'cut_partition_encoding':'vertex0 color0; vertex v in1..11 has color bit(v-1)','rank_d0':r0,'rank_d1':r1,'h1_dimension':len(edges)-r0-r1,'cocycle':F,'noncut_cycle':cycle,'deletion_cases':len(cases),'resilience_witnesses':cases,'solver_status':'EXACT_ENUMERATION_COMPLETED','timeouts':0,'python':sys.version,'platform':platform.platform()}
(W/'evidence/ring_certificate.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:out[k] for k in ['n','m','nu','tau','rank_d0','rank_d1','h1_dimension','deletion_cases']}))
