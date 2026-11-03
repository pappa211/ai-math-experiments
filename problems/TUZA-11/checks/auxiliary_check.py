"""Bounded independent checks of additional saved ordinary interfaces."""
from independent_check import *
from collections import Counter
out={}
# Exact no-tightness petal graph; all six size-two K3,2 matchings checked.
A=[0,1,2];X=[3,4];spokes={edge(a,x) for a in A for x in X};H=set(spokes)
for z,(u,v) in enumerate(sorted(spokes),5):H|={edge(u,z),edge(v,z)}
G=H|clique(A);hc=certificate(H);gc=certificate(G)
assert (hc['nu'],hc['tau'],gc['nu'],gc['tau'])==(6,6,7,7)
reserved=[]
for M in combinations(sorted(spokes),2):
 if len(set().union(*map(set,M)))!=4:continue
 c=certificate(H-(spokes-set(M)));assert c['nu']==2;reserved.append({'M':M,'nu_after':2})
assert len(reserved)==6
out['petals']={'H':hc,'G':gc,'six_matchings':reserved}
# All five-vertex neighborhood defects; independent matching-subset enumeration.
es=list(combinations(range(5),2));hist=Counter();positive=[]
for gs in subsets(es):
 E=set(gs);best=6
 for M in subsets(gs):
  if len(set().union(*map(set,M)))!=2*len(M) if M else False:continue
  R=E-set(M)
  beta=next(len(C) for C in subsets(tuple(range(5))) if all(set(C)&set(e) for e in R))
  best=min(best,beta-len(M))
 hist[best]+=1
 if best>0:
  missing=set(es)-E;assert all(sum(v in e for e in missing)<=1 for v in range(5));positive.append(len(E))
assert dict(hist)=={-2:15,-1:395,0:588,1:26}
out['sigma']={'graphs':1024,'histogram':dict(hist),'positive_edge_counts':dict(Counter(positive))}
# Complete tiny classification domain: all2^7 graphs containing fixed abc.
rows=0
for extra in subsets([e for e in combinations(range(5),2) if e not in clique(A)]):
 E=clique(A)|set(extra);T=triangles(E)
 if not all(clique(t)&clique(A) for t in T):continue
 sets=[{x for x in [3,4] if edge(u,x) in E and edge(v,x) in E} for u,v in sorted(clique(A))]
 predicted=all(sets) and all(not(len(sets[i])==len(sets[j])==1 and sets[i]==sets[j]) for i in range(3) for j in range(i))
 tau=certificate(E)['tau'];assert (tau==3)==bool(predicted);rows+=1
out['three_book_classification']={'labelled_graphs_examined':128,'qualifying_graphs':rows,'base_triangle_present':True}
# Additional T3 parameter corners, independent of the book witness.
base={edge(0,v) for v in range(1,6)}|{edge(v,1+v%5) for v in range(1,6)}|clique([6,7,8])
E=base|{(1,9),(2,9)};B={(1,9)};assert certificate(E)['nu']==4
assert (certificate(E-B)['nu'],certificate(E-B)['tau'])==(3,4)
S=set().union(*(clique(t) for t in triangles(E-B)));assert not triangles(E-S)
out['outside_support_empty']={'F':certificate(E),'H':certificate(E-B),'B':sorted(B)}
E=base|clique([9,10,11,12]);B={(9,10),(11,12)};assert certificate(E)['nu']==4
assert (certificate(E-B)['nu'],certificate(E-B)['tau'])==(3,4)
S=set().union(*(clique(t) for t in triangles(E-B)));assert len(triangles(E-S))==4
out['outside_support_K4']={'F':certificate(E),'H':certificate(E-B),'B':sorted(B)}
(W/'evidence/AUXILIARY_RESULTS.json').write_text(json.dumps({'generated_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'script_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'results':out},indent=2))
print(json.dumps({'petal_optima':[hc['nu'],hc['tau'],gc['nu'],gc['tau']],'sigma':dict(hist),'three_book_qualifying':rows,'T3_corner_cases':['empty','K4']}))
