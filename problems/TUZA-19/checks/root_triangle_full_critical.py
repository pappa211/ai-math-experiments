#!/usr/bin/env python3
"""Bounded discriminator for triangle-full criticality; exact finite scope."""
from pathlib import Path
from functools import lru_cache
from itertools import combinations
import sys,json,time,platform
import networkx as nx
from global_routes_deletion_gate import Exact

def odd_min(ex):
    piv={}
    for t in ex.tri:
        a=t
        while a:
            p=a.bit_length()-1
            if p in piv:a^=piv[p]
            else:piv[p]=a;break
    free=[i for i in range(len(ex.edges)) if i not in piv]
    basis=[]
    for f in free:
        a=1<<f
        for p in sorted(piv):
            if (piv[p]&a).bit_count()%2:a|=1<<p
        assert all((t&a).bit_count()%2==0 for t in ex.tri)
        basis.append(a)
    current=ex.full;best=current;prev=0
    for i in range(1<<len(free)):
        gray=i^(i>>1)
        if i:current^=basis[(gray^prev).bit_length()-1]
        prev=gray
        if current.bit_count()<best.bit_count():best=current
    assert all((t&best).bit_count()%2==1 for t in ex.tri)
    return best.bit_count(),best,len(free)

def min_covers(ex):
    @lru_cache(None)
    def rec(g):
        ts=ex.live(g)
        if not ts:return frozenset([0])
        c=ex.tau(g);t=ts[0];out=set()
        for i in range(len(ex.edges)):
            if t>>i&1:
                bit=1<<i
                if ex.tau(g&~bit)==c-1:
                    out.update(bit|x for x in rec(g&~bit))
        return frozenset(out)
    return rec(ex.full)

def decode(ex,mask):return [e for i,e in enumerate(ex.edges) if mask>>i&1]

def main():
    assert platform.system()=='Darwin'
    started=time.time();rows=[];checked=0;tf_empty=0
    for ix,g in enumerate(nx.graph_atlas_g()):
        ex=Exact(g);checked+=1
        if not ex.tri:tf_empty+=1;continue
        c=ex.tau(ex.full)
        if c<3 or any(ex.tau(ex.full&~t)!=c-3 for t in ex.tri):continue
        k=ex.nu(ex.full);pi,oc,dim=odd_min(ex)
        covers=min_covers(ex)
        assert all(x.bit_count()==c and all(x&t for t in ex.tri) for x in covers)
        assert all(any(x&t==t for x in covers) for t in ex.tri)
        bad=next((x for x in covers if any((x&t).bit_count()==2 for t in ex.tri)),None)
        blocker=next(([ex.edges[i],ex.edges[j]] for i,j in combinations(range(len(ex.edges)),2) if ex.nu(ex.full&~(1<<i)&~(1<<j))<k),None)
        rows.append({'atlas_index':ix,'n':ex.n,'edges':ex.edges,'triangles':ex.triples,'tau':c,'nu':k,'pi':pi,'parity_cover':decode(ex,oc),'kernel_dimension':dim,'minimum_cover_count':len(covers),'nonodd_minimum_cover':None if bad is None else decode(ex,bad),'two_edge_blocker':blocker})
    out={'hypotheses':['TF implies pi=tau','TF implies every minimum cover is odd','TF implies two-edge packing resilience'],'definitions':'TF: tau(G-E(T))=tau(G)-3 for every actual triangle T.','scope':'All 1253 NetworkX graph-atlas representatives through order seven. Triangle-free graphs are vacuous and separated.','checked':checked,'vacuous_trianglefree':tf_empty,'nonvacuous_qualifiers':rows,'seconds':time.time()-started}
    p=Path(sys.argv[1]);p.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({'checked':checked,'qualifiers':len(rows),'values':[(r['atlas_index'],r['n'],len(r['edges']),r['tau'],r['nu'],r['pi'],r['minimum_cover_count'],r['nonodd_minimum_cover'] is not None,r['two_edge_blocker']) for r in rows],'seconds':out['seconds']},indent=2))
if __name__=='__main__':main()
