from apex_exact import *
from collections import Counter
import json,time,resource

def is_B(X):
 unseen=set(X.all)
 while unseen:
  comp={next(iter(unseen))}
  while True:
   new=comp|{j for j in unseen if any(X.F[i]&X.F[j] for i in comp)}
   if new==comp:break
   comp=new
  es=set().union(*(X.F[i] for i in comp));vs=set().union(*map(set,es))
  if len(vs) not in (4,5) or es!=clique(vs):return False
  unseen-=comp
 return True

start=time.time();S={(0,1),(1,2),(2,3)};possible=sorted(clique(range(6))-S);counts=Counter();sharp=[]
for mask in range(1<<len(possible)):
 E={e for i,e in enumerate(possible) if mask>>i&1};L=Solver(E);counts['labelled_backgrounds']+=1
 if not is_B(L):L.pack.cache_clear();L.cover.cache_clear();continue
 counts['B_backgrounds']+=1;Q=Solver(E|S);r=L.nu();k=Q.nu();counts['packing_gain_'+str(k-r)]+=1
 if k==r+2:
  counts['gain_two_exact_cover']+=1;c=Q.tau();counts['cover_gain_'+str(c-2*r)]+=1
  assert c<=2*r+2,(E,r,k,c)
  if c==2*r+2 and len(sharp)<3:sharp.append({'old_edges':sorted(E),'new_edges':sorted(E|S),'old_nu':r,'new_nu':k,'new_tau':c})
 L.pack.cache_clear();L.cover.cache_clear();Q.pack.cache_clear();Q.cover.cache_clear()
# Archived strongest nearby packing-only negative control; reconstructed locally.
pieces=[(0,2,4,6),(0,1,2,4),(0,1,2,3),(1,2,3,5),(1,3,5,7)]
E=set().union(*(clique(P) for P in pieces));Q=Solver(E);L=Solver(E-S)
assert is_B(L)
assert (Q.nu(),Q.tau(),L.nu(),L.tau())==(5,6,2,4)
r={'status':'VERIFIED_FINITE','domain':'All 4096 labelled graphs L on vertexset0..5 excluding fixed P4 edges01,12,23; independently reconstruct all actual triangles and filter literal B(L). No graph connectivity/support requirement. All packing-gain-two cases solved exactly for cover.','counts':dict(counts),'sharp_examples':sharp,'negative_control':{'cliques':pieces,'deleted_path':sorted(S),'old_nu':L.nu(),'old_tau':L.tau(),'new_nu':Q.nu(),'new_tau':Q.tau(),'new_edges':Q.E,'old_edges':L.E},'seconds':time.time()-start,'maxrss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
print(json.dumps(r,indent=2))
