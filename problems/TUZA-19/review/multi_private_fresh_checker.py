from itertools import combinations,product,permutations
from pathlib import Path
import json,hashlib
W=Path(__file__).resolve().parents[1];OUT=W/'evidence/multi_private_fresh';OUT.mkdir(parents=True,exist_ok=True)
owners=[(0,1,3),(1,2,4),(2,0,5)]
def edge(a,b):return tuple(sorted((a,b)))
def edges(t):return {edge(a,b) for a,b in combinations(t,2)}
B=set().union(*(edges(t) for t in owners));central=edges((0,1,2))
options=[[(0,3),(1,3)],[(1,4),(2,4)],[(2,5),(0,5)]]
expected=[[4,5],[5,3],[3,4]]
all_orientations=list(product(range(2),repeat=3))
rows=[];pair_cases=0;selection_cases=0
for bits in all_orientations:
 bases=[edge(*options[i][bits[i]]) for i in range(3)]
 allowed=[]
 for i,base in enumerate(bases):
  old=[w for w in range(6) if w not in base and edges((*base,w))&B=={base}]
  assert old==[expected[i][bits[i]]];allowed.append(old[0])
 shared=[(i,j) for i,j in combinations(range(3),2) if set(bases[i])&set(bases[j])]
 assert len(shared) in (0,1)
 cyclic=not shared
 # Two outside labels exhaust the equal/distinct external-tip possibilities for pairs.
 for i,j in combinations(range(3),2):
  for x,y in product([allowed[i],6,7],[allowed[j],6,7]):
   P=edges((*bases[i],x));Q=edges((*bases[j],y));overlap=P&Q
   if set(bases[i])&set(bases[j]):pred=(x==y)
   else:pred=(x in bases[j] and y in bases[i])
   assert bool(overlap)==pred
   if cyclic:assert not overlap
   pair_cases+=1
 # Six outside labels represent every equality pattern among six chosen tips.
 tipsets=[list(combinations([a,6,7,8,9,10,11],2)) for a in allowed]
 for sets in product(*tipsets):
  if cyclic:chosen=[s[0] for s in sets]
  else:
   i,j=shared[0];k=next(k for k in range(3) if k not in (i,j))
   chosen=[None]*3;chosen[k]=next(t for t in sets[k] if t>=6)
   chosen[i]=sets[i][0];chosen[j]=next(t for t in sets[j] if t!=chosen[i])
  pages=[edges((*bases[i],chosen[i])) for i in range(3)]
  assert all(not pages[i]&pages[j] for i,j in combinations(range(3),2))
  assert all(P&B=={bases[i]} and not P&central for i,P in enumerate(pages))
  selection_cases+=1
 rows.append({'bits':bits,'bases':bases,'permitted_old_tips':allowed,'type':'cyclic' if cyclic else 'noncyclic'})
assert sum(r['type']=='cyclic' for r in rows)==2
# Check the symmetry orbits under all six relabelings of the central triangle.
owner_by_pair={frozenset(o[:2]):i for i,o in enumerate(owners)}
def relabel(bits,perm):
 answer=[None]*3
 for i,o in enumerate(owners):
  target=owner_by_pair[frozenset([perm[o[0]],perm[o[1]]])]
  selected=perm[options[i][bits[i]][0]]
  answer[target]=next(k for k in range(2) if options[target][k][0]==selected)
 return tuple(answer)
orbits=[];unseen=set(all_orientations)
while unseen:
 b=next(iter(unseen));orb={relabel(b,p) for p in permutations(range(3))};orbits.append(sorted(orb));unseen-=orb
assert sorted(map(len,orbits))==[2,6]
assert pair_cases==216 and selection_cases==74088
result={'status':'PASS','frozen_note_sha256':hashlib.sha256((W/'review/multi_private_fresh_inputs/root_multi_private_integral_cover.md').read_bytes()).hexdigest(),'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'orientation_cases':rows,'orbits':orbits,'pair_intersection_cases':pair_cases,'two_tips_per_owner_endpoint_patterns':selection_cases,'scope':'Fixed six-vertex packed-owner skeleton and all two-tip equality patterns up to renaming outside vertices. No graph census, maximum-packing search, or producer code import.'}
(OUT/'endpoint_receipt.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({'status':'PASS','orientations':8,'orbit_sizes':[2,6],'pair_intersections':pair_cases,'two_tip_patterns':selection_cases},indent=2))
