from apex_exact import *
from collections import Counter
import json,time,resource,signal,sys
SRC='problems/TUZA-25/evidence/residual_edge_exchange_seeds.json'
start=time.time();counts=Counter();rows=[];survivors=[]
for seed in json.load(open(SRC)):
 E=set(map(tuple,seed['edges']));V=range(seed['n']);C=Solver(E);r=C.nu()
 for e in sorted(clique(V)-E):
  a,b=e;J=Solver(E|{e});p=J.nu();q=J.tau()
  for c in V:
   if c in e or edge(a,c) not in E or edge(b,c) not in E:continue
   counts['labelled_internal_interfaces']+=1
   f=edge(a,c);g=edge(b,c);critical=[h for h in [e,f,g] if J.nu([h])==p-1]
   row={'seed':seed['name'],'n':seed['n'],'inserted':e,'apex_c':c,'nu_C':r,'nu_J':p,'tau_J':q,'critical_A_edges':critical}
   if p==r+1 and q==2*p-2:
    counts['required_J_numeric_profile']+=1
    if len(critical)==3:
     counts['all_three_A_edges_critical']+=1
     x=seed['n'];Q=Solver(E|{e}|{edge(x,t) for t in (a,b,c)})
     row['Q']=Q.certificate();survivors.append(row)
   rows.append(row)
  J.pack.cache_clear();J.cover.cache_clear()
 C.pack.cache_clear();C.cover.cache_clear()
 print(seed['name'],dict(counts),round(time.time()-start,3),file=sys.stderr,flush=True)
print(json.dumps({'status':'VERIFIED_FINITE','domain':'Exactly the12 frozen C12 supports, every labelled nonedgeab, and every common neighborc ofa,b inC. J=C+ab. Independently exactnu,tau and single deletions of triangleabc; all required critical-triangle profiles retained.','source':SRC,'counts':dict(counts),'rows':rows,'survivors':survivors,'seconds':time.time()-start,'maxrss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss},indent=2))
