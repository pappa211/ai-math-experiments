#!/usr/bin/env python3
"""TUZA-13 hostile generators and independent exact triangle-free cone analysis.
No imports from coordinator discovery or independent referee code.
"""
from itertools import combinations
from functools import lru_cache
from pathlib import Path
from datetime import datetime, timezone
import json, hashlib, subprocess, time, fcntl, argparse
ROOT=Path(__file__).resolve().parents[1]

def normalized(es): return tuple(sorted({tuple(sorted(e)) for e in es}))
def cycle(n): return n,normalized((i,(i+1)%n) for i in range(n))
def petersen():
    return 10,normalized([(i,(i+1)%5) for i in range(5)]+[(i,i+5) for i in range(5)]+[(i+5,(i+2)%5+5) for i in range(5)])
def clebsch(): return 16,tuple((a,b) for a,b in combinations(range(16),2) if a^b in {1,2,4,8,15})
def cone(n,es,r=1,apex_edges=False):
    return n+r,normalized(list(es)+[(v,n+i) for i in range(r) for v in range(n)]+(list(combinations(range(n,n+r),2)) if apex_edges else []))
def triangles(n,es):
    E=set(es)
    return tuple(t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2)))
def matching(n,es):
    adj=[0]*n
    for a,b in es: adj[a]|=1<<b;adj[b]|=1<<a
    @lru_cache(None)
    def rec(mask):
        if not mask: return ()
        a=(mask&-mask).bit_length()-1; remain=mask^(1<<a)
        best=rec(remain); choices=adj[a]&remain
        while choices:
            bit=choices&-choices; choices^=bit;b=bit.bit_length()-1
            v=((a,b),)+rec(remain^bit)
            if len(v)>len(best):best=v
        return best
    return rec((1<<n)-1)

def cone_check(name,n,es):
    started=time.monotonic();es=normalized(es)
    assert not triangles(n,es)
    N,E=cone(n,es);T=triangles(N,E)
    assert len(T)==len(es)
    adj=[0]*n
    for a,b in es:adj[a]|=1<<b;adj[b]|=1<<a
    induced=[0]*(1<<n);best=-1;us=[];alpha=0
    for U in range(1<<n):
        if U:
            bit=U&-U;v=bit.bit_length()-1;V=U^bit
            induced[U]=induced[V]+(adj[v]&V).bit_count()
        score=U.bit_count()-induced[U]
        if not induced[U]:alpha=max(alpha,U.bit_count())
        if score>best:best=score;us=[U]
        elif score==best:us.append(U)
    assert best==alpha
    fullM=matching(n,es);nu=len(fullM);tau=n-best;target=(tau+1)//2
    rows=[]
    for U in us:
        C=normalized([(v,n) for v in range(n) if not(U>>v&1)]+[(a,b) for a,b in es if U>>a&1 and U>>b&1])
        Cset=set(C);classes={1:[],2:[],3:[]}
        for t in T:classes[len(set(combinations(t,2))&Cset)].append(t)
        assert len(C)==tau and not classes[3]
        privateEs=[(a,b) for a,b in es if len(Cset&{(a,b),(a,n),(b,n)})==1]
        privateM=matching(n,privateEs)
        P=[(a,b,n) for a,b in fullM]
        rows.append({'cover':C,'unselected_spoke_vertices':[v for v in range(n) if U>>v&1], 'T1':classes[1],'T2':classes[2],'T3':classes[3], 'nu_private':len(privateM),'private_packing':[(a,b,n) for a,b in privateM],'nu_eligible':nu,'maximum_eligible_packing':P,'packing_red_counts':[len(Cset&set(combinations(t,2))) for t in P],'margin':nu-target})
    result={'name':name,'n':N,'edges':E,'triangles':T,'base_edges':es,'base_n':n,'alpha_base':alpha,'tau':tau,'nu':nu,'target':target,'all_base_subsets_examined':1<<n,'all_optimal_cover_count':len(rows),'cover_scope':'all optima; each minimum cover has exactly spokes outside U and base edges induced by U; all 2^n U examined','eligible_family_always_full':True,'minimum_margin':nu-target,'rows':rows,'elapsed_seconds':time.monotonic()-started}
    return result

def generate_hostile():
    """Deterministic literal labelled candidates, label-deduplicated only."""
    graphs=[];seen=set()
    def add(name,n,es,rule):
        es=normalized(es);key=(n,es)
        if key not in seen:seen.add(key);graphs.append({'name':name,'n':n,'edges':es,'rule':rule})
    bases=[('C5',*cycle(5)),('Petersen',*petersen()),('Clebsch',*clebsch())]
    for name,n,es in bases:
        for r in [1,2,3]:
            N,E=cone(n,es,r);add(name+f'_independent_apices_{r}',N,E,'full independent-apex join of triangle-free base')
            if r>=2:
                N,E=cone(n,es,r,True);add(name+f'_clique_apices_{r}',N,E,'full clique-apex join of triangle-free base')
        N,E=cone(n,es)
        for e in combinations(range(n),2):
            if e not in es:add(name+f'_cone_add_base_{e[0]}_{e[1]}',N,E+(e,),'single missing base edge addition')
        for v in range(n):
            add(name+f'_unequal_two_apices_missing_{v}',n+2,cone(n,es,2)[1]+(), 'placeholder') if False else None
            ee=[e for e in cone(n,es,2)[1] if e!=(v,n+1)]
            add(name+f'_unequal_two_apices_missing_{v}',n+2,ee,'two independent full apices, one missing spoke at second apex')
        # Add a triangle among up to three existing base vertices; preserve original lists.
        for tri in list(combinations(range(n),3))[:min(60,n*n)]:
            add(name+'_cone_fill_'+('_'.join(map(str,tri))),N,E+tuple(combinations(tri,2)),'fill first lexicographic up-to-60 base triples to triangle')
    for p,q in [(4,4),(4,5),(5,5),(5,6),(6,6)]:
        for k in [1,2,3]:
            es=list(combinations(range(p),2))+list(combinations(list(range(k))+list(range(p,p+q-k)),2))
            add(f'K{p}_K{q}_overlap{k}',p+q-k,es,'two clique supports with exactly k shared vertices')
            exclusive1=range(k,p);exclusive2=range(p,p+q-k)
            for a,b in list(__import__('itertools').product(exclusive1,exclusive2))[:5]:
                add(f'K{p}_K{q}_overlap{k}_cross{a}_{b}',p+q-k,es+[(a,b)],'clique sum plus one cross edge')
    return graphs

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--generate',action='store_true');args=ap.parse_args()
    if args.generate:
        graphs=generate_hostile();(ROOT/'evidence/hostile_candidates.json').write_text(json.dumps({'generator':'checks/hostile_families.py generate_hostile','deduplication':'exact labelled edge-list tuple only; no isomorphism quotient','graphs':graphs},indent=2)+'\n'); print({'generated_candidates':len(graphs)});return
    with (ROOT/'evidence/compute.lock').open('a+') as lock:
        fcntl.flock(lock,fcntl.LOCK_EX)
        cases=[('C5_cone',*cycle(5)),('W7_cycle6',*cycle(6)),('W8_cycle7',*cycle(7)),('Petersen_cone',*petersen()),('Clebsch_cone',*clebsch())]
        reports=[]
        for name,n,es in cases:
            r=cone_check(name,n,es);out=ROOT/'witnesses'/('hostile_'+name+'.json');out.write_text(json.dumps(r,indent=2)+'\n');reports.append({k:r[k] for k in ['name','n','tau','nu','target','all_base_subsets_examined','all_optimal_cover_count','minimum_margin','elapsed_seconds']});print(reports[-1],flush=True)
        (ROOT/'evidence/hostile_cone_summary.json').write_text(json.dumps({'utc':datetime.now(timezone.utc).isoformat(),'scope':'all minimum covers of five explicitly generated cone graphs','reports':reports},indent=2)+'\n')
if __name__=='__main__':main()

# Importable coordinator interface: no computation or files on import.
def hostile_graphs(max_n=None):
    for row in generate_hostile():
        if max_n is None or row['n']<=max_n:
            yield row['name'], row['n'], row['edges']
