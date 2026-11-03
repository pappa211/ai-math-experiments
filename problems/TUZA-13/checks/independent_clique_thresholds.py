#!/usr/bin/env python3
"""K10..K12: literal threshold witnesses, all minimum covers by proven symmetry.
No maximum-packing claim; exact lower witness plus elementary Mantel equality.
"""
from itertools import combinations
from pathlib import Path
import datetime, hashlib, json, math, random
ROOT=Path(__file__).resolve().parents[1]

def run():
    results=[]
    for n in (10,11,12):
        a=n//2; b=n-a
        E=list(combinations(range(n),2))
        C=[(u,v) for u,v in E if (u<a)==(v<a)]
        T=list(combinations(range(n),3)); R=[frozenset(combinations(t,2)) for t in T]
        red=set(C); eligible=[i for i,r in enumerate(R) if len(r&red)<=2]
        tau=len(C); target=(tau+1)//2; rng=random.Random(131102+n)
        best=[]; tries=0
        for tries in range(1,10001):
            order=list(eligible);rng.shuffle(order); used=set(); chosen=[]
            for i in order:
                if not used&R[i]:
                    used.update(R[i]);chosen.append(i)
                    if len(chosen)>=target:break
            if len(chosen)>len(best):best=chosen
            if len(best)>=target:break
        assert len(best)>=target
        assert all(1<=len(R[i]&red)<=2 for i in best)
        assert len(set.union(*(set(R[i]) for i in best)))==3*len(best)
        covers=math.comb(n,a)//(2 if a==b else 1)
        results.append(dict(name=f'K{n}',n=n,vertices=list(range(n)),edges=E,triangles=T,
                            cover=C,tau=tau,threshold=target,eligible_packing=[T[i] for i in best],
                            packing_red_counts=[len(R[i]&red) for i in best],
                            eligible_nu_lower_bound=len(best),eligible_nu_upper_bound=(a*b)//2,
                            status='THRESHOLD_CERTIFIED_EXACT_NOT_FULL_OPTIMUM',
                            all_optimal_cover_count_by_Mantel_equality=covers,
                            cover_scope='all optima via one orbit under vertex permutations; not enumerated',
                            seed=131102+n,greedy_attempts=tries,
                            proof_reference='notes/INDEPENDENT_CLIQUE_AND_CONE_LEMMAS.md'))
    return dict(ended_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),
                code_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),records=results)

if __name__=='__main__':
    result=run()
    (ROOT/'evidence/independent_clique_thresholds.json').write_text(json.dumps(result,indent=2)+'\n')
    for r in result['records']:
        print(r['name'],r['tau'],r['threshold'],r['greedy_attempts'],r['all_optimal_cover_count_by_Mantel_equality'])
