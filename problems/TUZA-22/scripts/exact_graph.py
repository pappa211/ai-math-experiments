"""TUZA-22 independent literal graph optimizer, finite exhaustive recurrences.
No imported historical optimization code. Cache limits bound memory, not search completeness.
A caller must provide an external deadline and preserve timeouts as UNKNOWN.
"""
from itertools import combinations
from functools import lru_cache

def clique(vertices): return {tuple(sorted(e)) for e in combinations(vertices,2)}
def triangles(n,edges):
    edges=set(map(tuple,edges))
    return [t for t in combinations(range(n),3) if clique(t)<=edges]
def triangle_components(n,edges):
    T=triangles(n,edges); supports=[clique(t) for t in T]
    groups=[]; remaining=set(range(len(T)))
    while remaining:
        stack=[remaining.pop()]; group=[]; es=set()
        while stack:
            i=stack.pop();group.append(i);es|=supports[i]
            fresh={j for j in remaining if supports[j]&supports[i]}
            remaining-=fresh;stack.extend(fresh)
        vs=set().union(*(set(T[i]) for i in group))
        groups.append({'vertices':sorted(vs),'edges':sorted(es),'triangles':[T[i] for i in group], 'literal_B':len(vs) in (4,5) and es==clique(vs)})
    return groups

def optimize(n,edges):
    E=sorted(set(map(tuple,edges))); ei={e:i for i,e in enumerate(E)}; T=triangles(n,E)
    tm=[sum(1<<ei[e] for e in clique(t)) for t in T]
    hits=[sum(1<<i for i,t in enumerate(tm) if t>>e&1) for e in range(len(E))]
    conflicts=[sum(1<<j for j,u in enumerate(tm) if u&t) for t in tm]
    full=(1<<len(T))-1
    @lru_cache(maxsize=150000)
    def cover(s):
        if not s:return ()
        ids=[i for i in range(len(T)) if s>>i&1]
        # Branch on a triangle whose best covering edge covers the most remaining triangles.
        j=max(ids,key=lambda i:max((hits[e]&s).bit_count() for e in range(len(E)) if tm[i]>>e&1))
        opts=[e for e in range(len(E)) if tm[j]>>e&1]
        opts.sort(key=lambda e:-(hits[e]&s).bit_count())
        candidates=[(e,)+cover(s&~hits[e]) for e in opts]
        return min(candidates,key=len)
    @lru_cache(maxsize=150000)
    def pack(s):
        if not s:return ()
        ids=[i for i in range(len(T)) if s>>i&1]
        # Isolated triangles are mandatory in some maximum packing.
        for j in ids:
            if (conflicts[j]&s)==(1<<j):return (j,)+pack(s&~(1<<j))
        j=max(ids,key=lambda i:(conflicts[i]&s).bit_count())
        take=(j,)+pack(s&~conflicts[j]); skip=pack(s&~(1<<j))
        return take if len(take)>=len(skip) else skip
    p=pack(full);c=cover(full)
    return {'n':n,'edges':E,'triangles':T,'nu':len(p),'tau':len(c),'packing':[T[j] for j in p],'cover':[E[e] for e in c], 'literal_B':all(g['literal_B'] for g in triangle_components(n,E)), 'packing_cache':pack.cache_info()._asdict(),'cover_cache':cover.cache_info()._asdict()}
