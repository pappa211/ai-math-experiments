from itertools import combinations,product
from pathlib import Path
import json,hashlib
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/multi_private_fresh';OUT.mkdir(parents=True,exist_ok=True)
def es(t):return set(combinations(sorted(t),2))
P=[(0,1,3),(1,2,4),(0,2,5)];B=set().union(*(es(t) for t in P))
options=[[(0,3),(1,3)],[(1,4),(2,4)],[(2,5),(0,5)]]
cases=0
for bits in product(range(2),repeat=3):
 bases=[options[i][bits[i]] for i in range(3)]
 allowed=[next(w for w in range(6) if w not in base and es((*base,w))&B=={tuple(sorted(base))}) for base in bases]
 choices=[]
 for old in allowed:
  tips=[old,6,7,8,9,10,11];choices.append([(x,) for x in tips]+list(combinations(tips,2)))
 for sets in product(*choices):
  if sum(len(s)==2 for s in sets)<2:continue
  for chosen in product(*sets):
   pages=[es((*bases[i],chosen[i])) for i in range(3)]
   if all(not pages[i]&pages[j] for i,j in combinations(range(3),2)):break
  else:raise AssertionError((bits,sets))
  cases+=1
assert cases==148176

def analyze(E,vertices):
 edges=sorted(E);idx={e:i for i,e in enumerate(edges)}
 ts=[t for t in combinations(vertices,3) if es(t)<=E]
 masks=[sum(1<<idx[e] for e in es(t)) for t in ts]
 best=[]
 for z in range(1<<len(ts)):
  if z.bit_count()<=len(best):continue
  used=0;packing=[]
  for i,m in enumerate(masks):
   if z>>i&1:
    if used&m:break
    used|=m;packing.append(ts[i])
  else:best=packing
 tau=min(z.bit_count() for z in range(1<<len(E)) if all(z&m for m in masks))
 private={str(o):[t for t in ts if t not in P and len(es(t)&B)==1 and es(t)&B<=es(o)] for o in P}
 return {'edges':edges,'triangles':ts,'specified_packing':P,'private_pages':private,'nu':len(best),'maximum_packing':best,'tau':tau}
failedE=B|set().union(*(es(t) for t in [(0,3,6),(1,4,5),(0,4,5),(0,5,6)]))
failed=analyze(failedE,range(7));assert failed['nu']==4
sharpE=set(combinations([0,1,2,4,5],2))|es((0,1,3))|es((0,3,6))|es((0,3,7))
sharp=analyze(sharpE,range(8));assert sharp['nu']==3 and sharp['tau']==5
assert [len(sharp['private_pages'][str(o)]) for o in P]==[2,1,1]
# Exact obstruction classification in the noncyclic representative.
def nonempty_subsets(xs):
 return [set(z) for k in range(1,len(xs)+1) for z in combinations(xs,k)]
classification_cases=0
for X,Y,Z in product(nonempty_subsets([4,6,7]),nonempty_subsets([5,6,7]),nonempty_subsets([4,6,7])):
 bad=all(x==z or (y==5 and z==4) for x,y,z in product(X,Y,Z))
 A=(len(X)==len(Z)==1 and X==Z)
 BB=(Y=={5} and Z=={4})
 C=(len(X)==1 and 4 not in X and Y=={5} and Z==X|{4})
 assert bad==(A or BB or C)
 classification_cases+=1
for w in [6,7]:
 forced=B|es((0,3,w))|es((1,4,5))|es((0,4,5))|es((0,5,w))
 augment=[(0,2,4),(0,5,w),(1,2,5)]
 assert all(es(t)<=forced for t in augment)
 assert all(not es(t)&es(u) for t,u in combinations(augment,2))
 assert set().union(*(es(t) for t in augment))&B <= es(P[1])|es(P[2])

r={'status':'PASS','noncyclic_classification_cases':classification_cases,'endpoint_assignments_with_at_least_two_multi':cases,'sharp_fixed_graph':sharp,'failed_seven_vertex_control':failed,'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'scope':'Exact strengthened six-endpoint lemma and two prescribed finite controls, not a graph census.'}
(OUT/'two_singletons_receipt.json').write_text(json.dumps(r,indent=2)+'\n')
print(json.dumps({'status':'PASS','endpoint_cases':cases,'sharp_graph':{'vertices':8,'edges':len(sharpE),'triangles':len(sharp['triangles']),'nu':3,'tau':5,'private_page_counts':[2,1,1]},'failed_control_nu':4},indent=2))
