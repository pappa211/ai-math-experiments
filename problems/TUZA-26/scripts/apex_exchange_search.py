"""Frozen targeted falsification: delete one edge and insert one nonedge of C12.
Only candidates with NO universal supported vertex receive exact optimization.
This is a labelled finite mutation domain, not an unlabelled graph census.
"""
from apex_exact import *
from collections import Counter
import json,time,signal,sys,resource
SRC='problems/TUZA-25/evidence/residual_edge_exchange_seeds.json'
OUT=sys.argv[1]
class Timeout(Exception):pass
def stop(*_):raise Timeout()
signal.signal(signal.SIGALRM,stop)
seeds=json.load(open(SRC)); counts=Counter(); survivors=[];fragile=[];unknown=[];seen=set();start=time.time()
for seed in seeds:
 E=set(map(tuple,seed['edges']));V=range(seed['n']);univ=[v for v in V if all(u==v or edge(u,v) in E for u in V)]
 for rem in sorted(E):
  # Every original universal vertex must lose an incident edge to stop being universal.
  if not set(univ)<=set(rem):continue
  for add in sorted(clique(V)-E):
   counts['labelled_presentations']+=1
   F=E-{rem}|{add}; key=tuple(sorted(F))
   if key in seen:counts['duplicate_edge_sets']+=1;continue
   seen.add(key);X=None
   try:
    signal.setitimer(signal.ITIMER_REAL,3)
    X=Solver(F)
    if not X.supported():counts['not_fully_triangle_supported']+=1;continue
    if not X.connected():counts['triangle_disconnected']+=1;continue
    if X.universal():counts['has_universal_vertex']+=1;continue
    counts['nonapex_supported_connected']+=1
    # Explicit cheap packing and cut-cover filter, direction U<=2L-2 only.
    used=set();P=[]
    for i,T in enumerate(X.F):
     if not used&T:P.append(i);used|=T
    L=len(P); maxcut=max(sum((bits>>u&1)!=(bits>>v&1) for u,v in F) for bits in range(1<<(len(V)-1)))
    U=len(F)-maxcut
    if U<=2*L-2:counts['safe_defect_at_least_two_filter']+=1;continue
    k=X.nu();c=X.tau();counts['exact_nu_tau']+=1;counts['exact_defect_'+str(2*k-c)]+=1
    if c!=2*k-1:continue
    counts['defect_one']+=1
    bad=next((e for e in X.E if X.nu([e])<k),None)
    row={'seed':seed['name'],'deleted_edge':rem,'inserted_edge':add,'edges':X.E,'nu':k,'tau':c}
    if bad:
     counts['defect_one_nonresilient']+=1;row['critical_edge']=bad;fragile.append(row)
    else:
     counts['defect_one_resilient_nonapex']+=1;row.update(X.certificate());survivors.append(row)
   except Timeout:
    counts['UNKNOWN_timeout']+=1;unknown.append({'seed':seed['name'],'deleted_edge':rem,'inserted_edge':add,'edges':sorted(F)})
   finally:
    signal.setitimer(signal.ITIMER_REAL,0)
    if X:X.pack.cache_clear();X.cover.cache_clear()
 print(seed['name'],dict(counts),'seconds',round(time.time()-start,1),flush=True)
 result={'status':'PARTIAL_UNKNOWN' if unknown else 'VERIFIED_FINITE_DOMAIN','domain':'all labelled C12 one-edge deletion/nonedge insertion presentations destroying every original universal vertex; all edges retained, no support pruning','seed_source':SRC,'counts':dict(counts),'seconds':time.time()-start,'maxrss_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss,'survivors':survivors,'fragile_defect_one':fragile,'unknown':unknown}
 open(OUT,'w').write(json.dumps(result,indent=2)+'\n')
