#!/usr/bin/env python3
"""Exact all-optimum cover classification for uniform independent-apex joins.
Specialized integer subset transform, plus list-edge-coloring packing recursion.
"""
from pathlib import Path
from itertools import combinations, combinations_with_replacement
from functools import lru_cache
import argparse,json,time,fcntl,signal,datetime
from hostile_families import petersen,cycle,cone,triangles,normalized
ROOT=Path(__file__).resolve().parents[1]

class Deadline(Exception):pass

def classify(n,es,rs):
    m=len(es);M=1<<m
    induced=[];best=[-1]*M
    for U in range(1<<n):
        mask=sum(1<<i for i,(a,b) in enumerate(es) if U>>a&1 and U>>b&1)
        induced.append(mask);best[mask]=max(best[mask],U.bit_count())
    for j in range(m):
        for F in range(M):
            if F>>j&1:best[F]=max(best[F],best[F^(1<<j)])
    out=[]
    for r in rs:
        tau=min(F.bit_count()+r*(n-best[F]) for F in range(M))
        Fs=[F for F in range(M) if F.bit_count()+r*(n-best[F])==tau]
        rows=[];total=0;classes=0
        for F in Fs:
            Is=[U for U in range(1<<n) if U.bit_count()==best[F] and not(induced[U]&~F)]
            count=len(Is)**r
            import math
            classcount=math.comb(len(Is)+r-1,r)
            rows.append({'Fmask':F,'Fedges':[e for i,e in enumerate(es) if F>>i&1],'alpha_residual':best[F],'maximum_independent_sets':Is,'cover_count':count,'apex_permutation_classes':classcount})
            total+=count;classes+=classcount
        out.append({'r':r,'tau':tau,'base_edge_subsets_examined':M,'optimal_base_edge_subsets':len(Fs),'all_cover_count':total,'apex_permutation_classes':classes,'rows':rows})
    return out

def all_matchings(n,es):
    byv=[[] for _ in range(n)]
    for i,(a,b) in enumerate(es):byv[a].append((b,i));byv[b].append((a,i))
    @lru_cache(None)
    def rec(V):
        if not V:return (0,)
        a=(V&-V).bit_length()-1;W=V^(1<<a);out=list(rec(W))
        for b,i in byv[a]:
            if W>>b&1:out.extend(M|(1<<i) for M in rec(W^(1<<b)))
        return tuple(out)
    return rec((1<<n)-1)

def packing(allowed,matchings,m):
    lists=[tuple(M for M in matchings if not M&~a) for a in allowed]
    lists=[tuple(sorted(v,key=int.bit_count,reverse=True)) for v in lists]
    calls=0
    @lru_cache(None)
    def rec(i,available):
        nonlocal calls;calls+=1
        if i==len(lists):return (0,())
        upper=min(available.bit_count(),sum(max((M.bit_count() for M in lists[j] if not M&~available),default=0) for j in range(i,len(lists))))
        best=(0,())
        for M in lists[i]:
            if M&~available:continue
            val,witness=rec(i+1,available^M)
            val+=M.bit_count()
            if val>best[0]:best=(val,(M,)+witness)
            if best[0]==upper:break
        return best
    result=rec(0,(1<<m)-1)
    return result[0],result[1],calls

def analyze(name,n,es,rs,classification_only=False):
    start=time.monotonic();es=normalized(es);classification=classify(n,es,rs);matchings=all_matchings(n,es)
    results=[]
    for group in classification:
        r=group['r'];N,E=cone(n,es,r);T=triangles(N,E);assert len(T)==r*len(es)
        result={k:v for k,v in group.items() if k!='rows'}
        result.update(name=name+'_independent_apices_'+str(r),n=N,edges=E,triangles=T,base_n=n,base_edges=es,base_matching_count=len(matchings))
        if classification_only:result['classification']=group['rows'];results.append(result);continue
        evaluated=[];counts={};minmargin=10**9;max3=0;class_done=0;cover_done=0
        for row in group['rows']:
            F=row['Fmask'];Is=row['maximum_independent_sets']
            for inds in combinations_with_replacement(range(len(Is)),r):
                Us=[Is[i] for i in inds]
                C=normalized(list(row['Fedges'])+[(v,n+a) for a,U in enumerate(Us) for v in range(n) if not U>>v&1])
                assert len(C)==group['tau']
                Cset=set(C);red=[len(set(combinations(t,2))&Cset) for t in T];assert all(red)
                eligible=[sum(1<<j for j,(u,v) in enumerate(es) if not(F>>j&1 and not U>>u&1 and not U>>v&1)) for U in Us]
                nu,Ms,calls=packing(eligible,matchings,len(es));margin=nu-(group['tau']+1)//2
                import math,collections
                weights=math.factorial(r)
                for count in collections.Counter(inds).values():weights//=math.factorial(count)
                class_done+=1;cover_done+=weights;minmargin=min(minmargin,margin);max3=max(max3,red.count(3))
                key=str((nu,red.count(3)));counts[key]=counts.get(key,0)+weights
                # Keep all quotient representatives; graph itself stored once.
                evaluated.append({'base_Fmask':F,'apex_Umasks':Us,'cover':C,'orbit_multiplicity':weights,'nu_eligible':nu,'maximum_eligible_packing':[(u,v,n+a) for a,M in enumerate(Ms) for j,(u,v) in enumerate(es) if M>>j&1],'T_class_sizes':[red.count(i) for i in [1,2,3]],'D':-margin,'packing_dp_states':calls})
                if margin<0:
                    result['failing_candidate']=evaluated[-1];break
            if 'failing_candidate' in result:break
        result.update(evaluated_apex_permutation_classes=class_done,evaluated_cover_count=cover_done,complete=(cover_done==group['all_cover_count']),minimum_margin=minmargin,maximum_T3=max3,distribution=counts,representatives=evaluated)
        results.append(result)
        print({k:result[k] for k in ['name','tau','all_cover_count','apex_permutation_classes','evaluated_cover_count','minimum_margin','maximum_T3']},flush=True)
    return {'name':name,'elapsed_seconds':time.monotonic()-start,'results':results}

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--classification-only',action='store_true');ap.add_argument('--seconds',type=int,default=120);args=ap.parse_args()
    signal.signal(signal.SIGALRM,lambda *_:(_ for _ in ()).throw(Deadline()));signal.alarm(args.seconds)
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        # Reset execution budget after obtaining the exclusive compute lock.
        signal.alarm(args.seconds)
        data=[]
        for name,n,es in [('C5',*cycle(5)),('Petersen',*petersen())]:
            data.append(analyze(name,n,es,[2,3,4],args.classification_only))
        path=ROOT/'evidence'/('hostile_multiapex_classification.json' if args.classification_only else 'hostile_multiapex_results.json')
        path.write_text(json.dumps({'utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'algorithm':'base F subset transform plus all apex-cover choices modulo apex permutations; specialized matching-layer packing DP','cases':data},indent=2)+'\n')
        print('wrote',path,flush=True)
if __name__=='__main__':main()
