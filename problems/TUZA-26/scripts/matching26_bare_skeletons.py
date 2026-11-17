"""Exact six-terminal bare-skeleton geometry; no global graph census or solver.
Domain: all 2^12 terminal crossedge sets, S={01,23,45}. A retained
skeleton has triangle-free old edges, every old edge used in an ordinary
page, each base active, and no three edge-disjoint pages. Every actual
B-bare skeleton in the matching profile belongs to this domain by the
terminal-confinement lemma. We quotient by permutations preserving S.
"""
from itertools import combinations, permutations, product
from pathlib import Path
import json
S=[(0,1),(2,3),(4,5)]
X=[e for e in combinations(range(6),2) if e not in S]
allE=list(combinations(range(7),2))
ei={e:i for i,e in enumerate(allE)}
def mask(edges):return sum(1<<ei[tuple(sorted(e))] for e in edges)
def pm(i,a): return mask([S[i],(S[i][0],a),(S[i][1],a)])
perms=[]
for bs in permutations(range(3)):
 for flips in product(range(2),repeat=3):
  v=[2*bs[i]+(j^flips[i]) for i in range(3) for j in range(2)]
  perms.append([X.index(tuple(sorted((v[a],v[b])))) for a,b in X])
def canon(bits):
 return min(sum(1<<p[i] for i in range(12) if bits>>i&1) for p in perms)
records={}
counts={'terminal_crossedge_subsets':4096,'retained_labeled_skeletons':0}
for bits in range(4096):
 E={X[i] for i in range(12) if bits>>i&1}
 if any(all(tuple(sorted(e)) in E for e in combinations(t,2)) for t in combinations(range(6),3)):continue
 fams=[]
 for i,(a,b) in enumerate(S):
  fams.append([(x,pm(i,x)) for x in range(6) if x not in (a,b) and tuple(sorted((a,x))) in E and tuple(sorted((b,x))) in E])
 if any(not f for f in fams):continue
 used=set()
 for i,f in enumerate(fams):
  for x,_ in f: used.update(tuple(sorted((v,x))) for v in S[i])
 if E!=used:continue
 if any(not(a&b or a&c or b&c) for (_,a),(_,b),(_,c) in product(*fams)):continue
 counts['retained_labeled_skeletons']+=1
 cb=canon(bits)
 if cb in records:records[cb]['labeled_count']+=1;continue
 if cb!=bits:continue
 # Necessary condition: resilience supplies a compatible pair for each deleted base;
 # allow all extra terminal edges that do not create an old triangle through bare edges,
 # and a symbolic external apex. No unknown old packing compatibility is asserted.
 feasible_extensions=[]
 for add in range(4096):
  if add&bits!=bits:continue
  EE={X[i] for i in range(12) if add>>i&1}
  if any(any(tuple(sorted(e)) in E for e in combinations(t,2)) and all(tuple(sorted(e)) in EE for e in combinations(t,2)) for t in combinations(range(6),3)):continue
  pages=[]
  for i,(a,b) in enumerate(S):
   pages.append([(x,pm(i,x)) for x in range(7) if x not in (a,b) and (x==6 or (tuple(sorted((a,x))) in EE and tuple(sorted((b,x))) in EE))])
  allowed=[]
  for i in range(3):
   j,k=[z for z in range(3) if z!=i]
   allowed.append([(x,m) for x,m in pages[i] if all(m&n or m&o or n&o for (_,n),(_,o) in product(fams[j],fams[k]))])
  if not all(any(not(m&n) and all((u&m) or (u&n) for _,u in fams[i]) for (_,m),(_,n) in product(allowed[j],allowed[k])) for i in range(3) for j,k in [[z for z in range(3) if z!=i]]):continue
  feasible_extensions.append({'terminal_crossedges':[list(e) for e in sorted(EE)],'allowed_page_apices':[[x for x,_ in f] for f in allowed]})
 records[cb]={'crossedges':[list(e) for e in sorted(E)],'bare_apices':[[x for x,_ in f] for f in fams], 'labeled_count':1,'necessary_extension_count':len(feasible_extensions),'necessary_extensions':feasible_extensions}
# Recompute orbit sizes directly to avoid label-order dependence in first pass.
for cb,r in records.items():
 r['labeled_count']=len({sum(1<<p[i] for i in range(12) if cb>>i&1) for p in perms})
counts['unlabeled_skeletons']=len(records)
counts['with_necessary_resilience_extensions']=sum(bool(r['necessary_extension_count']) for r in records.values())
out={'status':'VERIFIED_FINITE_NECESSARY_GEOMETRY_ONLY','domain':__doc__,'counts':counts,'skeletons':list(records.values())}
root=Path(__file__).resolve().parents[1]
p=root/'evidence/matching26_bare_skeletons.json';p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(counts,indent=2))
for i,r in enumerate(records.values()):print(i,r['bare_apices'],r['necessary_extension_count'])
print(p)
