"""Necessary geometry for S={01,12,34}, B-bare pages confined to012345.
Vertex5 is the sole possible outside bare apex, common to01/12 when both
use it. Generic ordinary apices6,7 are distinct, preserving adjacent-page
same/different-apex semantics. Exhaust512 possible bare unions on9spokes,
then all old-edge supergraphs on6vertices preserving bare-triangle-freeness.
No assertion that surviving interfaces have compatible old packings.
"""
from itertools import combinations,product
from pathlib import Path
import json
S=[(0,1),(1,2),(3,4)]
X=[(0,3),(0,4),(1,3),(1,4),(2,3),(2,4),(0,5),(1,5),(2,5)]
Z=[e for e in combinations(range(6),2) if e not in S]
EA=list(combinations(range(8),2));ei={e:i for i,e in enumerate(EA)}
def pm(i,x):return sum(1<<ei[tuple(sorted(e))] for e in [S[i],(S[i][0],x),(S[i][1],x)])
P=[]
for ab,cd in product(range(2),repeat=2):
 p=list(range(6))
 if ab:p[0],p[2]=2,0
 if cd:p[3],p[4]=4,3
 P.append([X.index(tuple(sorted((p[a],p[b])))) for a,b in X])
def canon(bits):return min(sum(1<<p[i] for i in range(9) if bits>>i&1) for p in P)
def compatible(i,x,j,y):
 return bool(set(S[i])&set(S[j])) or x==y or x in S[j] or y in S[i]
def conflict(i,p,j,q,F):
 x,m=p;y,n=q
 if m&n or not compatible(i,x,j,y):return False
 k=3-i-j
 return any(not(t&m or t&n) for _,t in F[k])
records=[];labeled=0
for bits in range(512):
 E={X[i] for i in range(9) if bits>>i&1}
 if any(all(tuple(sorted(e)) in E for e in combinations(t,2)) for t in combinations(range(6),3)):continue
 F=[]
 for i,(a,b) in enumerate(S):
  F.append([(x,pm(i,x)) for x in range(6) if x not in(a,b) and all(tuple(sorted(e)) in E for e in [(a,x),(b,x)])])
 if any(not f for f in F):continue
 if set(e for i,f in enumerate(F) for x,_ in f for e in [tuple(sorted((S[i][0],x))),tuple(sorted((S[i][1],x)))])!=E:continue
 if any(not(a&b or a&c or b&c) for (_,a),(_,b),(_,c) in product(*F)):continue
 labeled+=1
 if canon(bits)!=bits:continue
 exts=[];remaining=[e for e in Z if e not in E]
 for add in range(1<<len(remaining)):
  EE=E|{remaining[j] for j in range(len(remaining)) if add>>j&1}
  if any(any(tuple(sorted(e)) in E for e in combinations(t,2)) and all(tuple(sorted(e)) in EE for e in combinations(t,2)) for t in combinations(range(6),3)):continue
  pages=[]
  for i,(a,b) in enumerate(S):
   # Ordinary means the other spokes must be old, so A-apex2 and B-apex0 are absent.
   pages.append([(x,pm(i,x)) for x in range(8) if x not in(a,b) and (x>=6 or all(tuple(sorted(e)) in EE for e in [(a,x),(b,x)]))])
  allowed=[]
  for i in range(3):
   j,k=[z for z in range(3) if z!=i]
   allowed.append([(x,m) for x,m in pages[i] if all(m&n or m&o or n&o for (_,n),(_,o) in product(F[j],F[k]))])
  # Every finite ordinary page is actual; incompatible combinations are impossible.
  finite=[[(x,m) for x,m in f if x<6] for f in pages]
  if any(conflict(i,p,j,q,F) for i,j in combinations(range(3),2) for p,q in product(finite[i],finite[j])):continue
  allowed=[[(x,m) for x,m in allowed[i] if all(not conflict(i,(x,m),j,q,F) for j in range(3) if j!=i for q in finite[j])] for i in range(3)]
  pairs=[]
  for i in range(3):
   j,k=[z for z in range(3) if z!=i]
   pairs.append([(x,y) for (x,m),(y,n) in product(allowed[j],allowed[k]) if not(m&n) and all((u&m) or (u&n) for _,u in F[i])])
  if any(not f for f in pairs):continue
  exts.append({'old_edges':[list(e) for e in sorted(EE)],'allowed_ordinary_apices':[[x for x,_ in f] for f in allowed],'compatible_pair_candidates':pairs,'two_new_triangle':(0,2) in EE})
 records.append({'bits':bits,'bare_edges':[list(e) for e in sorted(E)],'bare_apices':[[x for x,_ in f] for f in F],'extensions':exts})
counts={'bare_spoke_subsets':512,'retained_labeled_skeletons':labeled,'unlabeled_skeletons':len(records),'with_necessary_resilience_extensions':sum(bool(r['extensions']) for r in records)}
out={'status':'NECESSARY_FINITE_GEOMETRY_SINGLE_CHECKER','domain':__doc__,'counts':counts,'skeletons':records}
root=Path(__file__).resolve().parents[1];p=root/'evidence/matching26_disconnected_path_geometry_v2.json';p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(counts))
for r in records:
 if r['extensions']:
  union=[sorted({x for e in r['extensions'] for x in e['allowed_ordinary_apices'][i]}) for i in range(3)]
  print(r['bits'],r['bare_apices'],len(r['extensions']),union,'two-new',any(e['two_new_triangle'] for e in r['extensions']))
print(p)
