import os,sys,json,random,time,signal,resource,gc
from pathlib import Path
from itertools import combinations
from exact_core import Graph
os.umask(0o077)
resource.setrlimit(resource.RLIMIT_CPU,(190,200))
class TimedOut(Exception):pass
def alarm(*args):raise TimedOut()
signal.signal(signal.SIGALRM,alarm)
start=time.monotonic();rng=random.Random(170401);records=[];timeouts=[];tested=0;worst=-999;restrict=[]
for case in range(700):
    if time.monotonic()-start>180:break
    n=rng.choice([8,9,10,11,12]);parts=[i%4 for i in range(n)];rng.shuffle(parts)
    prob=rng.choice([.3,.4,.5,.6,.7,.8]);edges=[e for e in combinations(range(n),2) if parts[e[0]]!=parts[e[1]] and rng.random()<prob]
    # Half the probes include planted K4s; edges remain colour-respecting.
    if case%2==0:
        for _ in range(rng.choice([1,2,3])):
            q=[rng.choice([i for i in range(n) if parts[i]==c]) for c in range(4)]
            edges+=list(combinations(q,2))
    g=Graph(n,edges)
    if not g.triangles:continue
    signal.setitimer(signal.ITIMER_REAL,2.0)
    try:
        nu=g.nu();tau=g.tau();assert tau<=2*nu
        # Tri-free sets from two colour classes plus arbitrary greedy extension/deletion.
        links=[]
        for _ in range(8):
            order=list(range(n));rng.shuffle(order);X=[]
            for v in order:
                if rng.random()<.15:continue
                if g.tri_free_link(X+[v]):X.append(v)
            X=tuple(sorted(X))
            if X not in links:links.append(X)
        for X in links:
            L=[e for e in g.edges if set(e)<=set(X)]
            if not L or not any(g.hits[g.index[e]] for e in L):continue
            G=g.apex(X);p=G.nu();lam,cert=g.lambda_cover(X);gap=tau+lam-2*p;tested+=1
            row={'case':case,'n':n,'H_edges':g.edges,'X':X,'parts':parts,'H_colors':[(e,(parts[e[0]]^parts[e[1]])-1) for e in g.edges],'H_triangles':g.triangles,'nu_H':nu,'tau_H':tau,'nu_G':p,'lambda':lam,'D':2*nu-tau,'a':p-nu,'gap':gap,'compatible_min_cover':cert,'packing_G':G.pack_witness()}
            if gap>worst:
                worst=gap;records.append(row);print('RECORD',case,n,tau,nu,p,lam,'gap',gap,flush=True)
            if gap>=-1:
                tauG=G.tau();row['tau_G']=tauG
                if tau+lam>tauG:
                    row['restriction_loss']=tau+lam-tauG
                    if len(restrict)<12:restrict.append(row);print('RESTRICTION_LOSS',case,row['restriction_loss'],flush=True)
            if gap>0:
                records.append(row);raise AssertionError('AC_FAIL')
    except TimedOut:timeouts.append(case)
    finally:signal.setitimer(signal.ITIMER_REAL,0)
    gc.collect()
    if tested%100==0:print('progress',case,tested,len(timeouts),flush=True)
out={'status':'FAIL' if worst>0 else 'PASS_FOR_COMPLETED_PROBES','seed':170401,'completed_AC_probes':tested,'timeouts_UNKNOWN':timeouts,'max_gap':worst,'record_cases':records,'restriction_loss_cases':restrict,'elapsed_seconds':time.monotonic()-start,'python':sys.version,'limits':{'per_H_seconds':2,'total_seconds':180,'supervisor_RSS_MiB':1500},'evidence':'exact exhaustive integer recursion; not full-class proof'}
Path('evidence/random_ac.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k not in ['record_cases','restriction_loss_cases']}),flush=True)
