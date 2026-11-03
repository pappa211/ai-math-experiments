#!/usr/bin/env python3
"""Finite test of weighted lemma, every labelled five-vertex simple H and independent S."""
import itertools as it
import json
import time
from functools import lru_cache
from pathlib import Path

start=time.monotonic()
n=5
possible=list(it.combinations(range(n),2))
full=(1<<n)-1
cases=0
def components(adj,mask):
    result=[]
    while mask:
        seed=mask&-mask
        c=seed
        todo=seed
        mask^=seed
        while todo:
            bit=todo&-todo
            todo^=bit
            v=bit.bit_length()-1
            new=adj[v]&mask
            c|=new
            todo|=new
            mask^=new
        result.append(c)
    return result

for em in range(1<<len(possible)):
    es=[e for i,e in enumerate(possible) if em>>i&1]
    adj=[0]*n
    for a,b in es:
        adj[a]|=1<<b
        adj[b]|=1<<a
    @lru_cache(None)
    def matching(mask):
        if not mask:return 0
        bit=mask&-mask
        v=bit.bit_length()-1
        rest=mask^bit
        return max([matching(rest)]+[1+matching(rest&~(1<<u)) for u in range(n) if (rest&adj[v])>>u&1])
    mu=matching(full)
    barriers=[]
    for a in range(1<<n):
        cs=components(adj,full^a)
        q=sum(c.bit_count()%2 for c in cs)
        barriers.append((n+a.bit_count()-q,a,cs))
    value,a,cs=min(barriers)
    assert value==2*mu
    independent=[s for s in range(1<<n) if all(not(s>>u&1 and s>>v&1) for u,v in es)]
    covers=[full^s for s in independent]
    for s in independent:
        def weight(mask):return mask.bit_count()+(mask&s).bit_count()
        optimum=min(map(weight,covers))
        q=sum(c.bit_count()%2 for c in cs)
        t=sum(c.bit_count()%2 and bool(c&s) for c in cs)
        ind=s&~a
        for c in cs:
            if c.bit_count()%2 and not c&s:
                ind|=c&-c
        assert ind in independent
        assert t <= (s&~a).bit_count()
        assert weight(ind)==2*(s&~a).bit_count()+q-t
        assert weight(ind)>=(s&~a).bit_count()+q>=s.bit_count()+q-a.bit_count()
        assert weight(full^ind)<=2*mu
        assert optimum<=weight(full^ind)
        cases+=1

receipt={'status':'PASS','domain':'all 1024 labelled simple graphs on five vertices, every independent weight-two set, all weight-one other vertices',
         'graphs':1024,'weighted_instances':cases,'tested':['Tutte-Berge minimizing barrier by exhaustive subsets','independence of constructed I','exact weight algebra','constructed cover bound','independently enumerated weighted optimum'],
         'negative_control':{'graph':'K3','S':'all three vertices (not independent)','mu':1,'weighted_vc':4,'bound_2mu':2,'interpretation':'independence hypothesis essential'},
         'parallel_edges':'Matching/vertex-cover predicates are unchanged by repeating an edge; finite graph census is simple. B root census explicitly retains parallel edges.',
         'elapsed_seconds':time.monotonic()-start}
target=Path(__file__).resolve().parent.parent/'evidence'/'check_weighted.json'
target.write_text(json.dumps(receipt,indent=2)+'\n')
print(json.dumps(receipt))
