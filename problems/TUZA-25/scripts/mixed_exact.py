"""Independent exact finite mixed-Tuza checker. No external solver; all recursions terminate."""
from __future__ import annotations
from functools import lru_cache
from itertools import combinations
import json, time

class Graph:
    def __init__(self,n,edges):
        self.n=n; self.edges=tuple(sorted({tuple(sorted(e)) for e in edges})); self.eid={e:i for i,e in enumerate(self.edges)}
        self.vertices=tuple(t for t in combinations(range(n),3) if all(e in self.eid for e in combinations(t,2)))
        self.triangles=tuple(sum(1<<self.eid[e] for e in combinations(t,2)) for t in self.vertices)
    def mask(self,es): return sum(1<<self.eid[tuple(sorted(e))] for e in es)
    def delete(self,D): return Graph(self.n,[e for i,e in enumerate(self.edges) if not D>>i&1])
    def graph6(self):
        bits=[int((i,j) in self.eid) for j in range(1,self.n) for i in range(j)]
        bits += [0]*((-len(bits))%6)
        return chr(self.n+63)+''.join(chr(63+sum(bits[i+j]<<(5-j) for j in range(6))) for i in range(0,len(bits),6))

def solve_masks(masks):
    """Keep all distinct nonempty triangle footprints; optimize by exact subset recursion."""
    masks=tuple(masks)
    if any(m==0 for m in masks): return {'status':'INADMISSIBLE','nu':None,'tau':None}
    count=len(masks)
    if not count:return {'status':'EXACT','nu':0,'tau':0,'packing':[],'cover':0,'packing_states':1,'cover_states':1}
    # No inclusion-minimalization is used, unlike the discovery code.
    conflict=tuple(sum(1<<j for j,y in enumerate(masks) if x&y) for x in masks)
    @lru_cache(None)
    def pack(A):
        if not A:return ()
        js=[j for j in range(count) if A>>j&1]
        # Isolated members can be selected safely.
        for j in js:
            if (conflict[j]&A)==1<<j:return (j,)+pack(A^(1<<j))
        j=max(js,key=lambda x:(conflict[x]&A).bit_count())
        take=(j,)+pack(A&~conflict[j]); leave=pack(A^(1<<j))
        return take if len(take)>=len(leave) else leave
    union=0
    for m in masks:union|=m
    edge_hits={}
    for e in range(union.bit_length()):
        if union>>e&1:edge_hits[e]=sum(1<<j for j,m in enumerate(masks) if m>>e&1)
    @lru_cache(None)
    def cov(A):
        if not A:return 0
        js=[j for j in range(count) if A>>j&1]
        j=min(js,key=lambda x:masks[x].bit_count())
        choices=[e for e in edge_hits if masks[j]>>e&1]
        choices.sort(key=lambda e:-(edge_hits[e]&A).bit_count())
        best=None
        for e in choices:
            C=(1<<e)|cov(A&~edge_hits[e])
            if best is None or C.bit_count()<best.bit_count():best=C
        return best
    A=(1<<count)-1; P=pack(A); C=cov(A)
    assert all(not(masks[a]&masks[b]) for a,b in combinations(P,2))
    assert all(C&m for m in masks)
    return {'status':'EXACT','nu':len(P),'tau':C.bit_count(),'packing':list(P),'cover':C,'packing_states':pack.cache_info().currsize,'cover_states':cov.cache_info().currsize}

def solve(G,N=0,D=0):
    return solve_masks([t&~N for t in G.triangles if not(t&D)])

def cliques(n,sets):return Graph(n,[e for S in sets for e in combinations(S,2)])
def controls():
    ans={f'K{n}':cliques(n,[range(n)]) for n in (3,4,5)}
    ans['K4_background']=Graph(6,ans['K4'].edges+((4,5),))
    ans['K5_edge_K5']=cliques(8,[(0,1,2,3,4),(0,1,5,6,7)])
    ans['K5_triangle_K5']=cliques(7,[(0,1,2,3,4),(0,1,2,5,6)])
    ans['K4_three_star_K5']=cliques(13,[(0,1,2,3),(0,1,4,5,6),(0,2,7,8,9),(0,3,10,11,12)])
    for n in (6,8):ans[f'cocktail_{n}']=Graph(n,[e for e in combinations(range(n),2) if e[0]//2!=e[1]//2])
    for n in (5,7):ans[f'cone_C{n}']=Graph(n+1,[(i,(i+1)%n) for i in range(n)]+[(i,n) for i in range(n)])
    ans['book5']=Graph(7,[(0,1)]+[(v,w) for v in (0,1) for w in range(2,7)])
    return ans

def main():
    start=time.time(); out={'method':'independent exhaustive recursions over actual triangle footprints; all completed statuses EXACT','graphs':{},'elapsed_seconds':None}
    for name,G in controls().items():
        samples={0}
        samples.update(1<<e for e in range(len(G.edges)))
        samples.update((1<<e)|(1<<f) for e,f in combinations(range(len(G.edges)),2))
        # Full triangle-free N domain only for K3/K4/K5; named controls are targeted otherwise.
        if name in ('K3','K4','K5'):samples=set(range(1<<len(G.edges)))
        if name.startswith('cone_'):samples.add(G.mask([(i,G.n-1) for i in range(G.n-1)]))
        valid=[]; inadmissible=0; failures=[]; strict_fail=[]
        for N in sorted(samples):
            r=solve(G,N)
            if r['status']=='INADMISSIBLE':inadmissible+=1;continue
            r['N']=N
            if r['tau']>2*r['nu']:failures.append(N)
            if any(t&N for t in G.triangles) and r['tau']>=2*r['nu']:strict_fail.append(N)
            valid.append(r)
        out['graphs'][name]={'n':G.n,'edges':G.edges,'triangles':G.vertices,'graph6':G.graph6(),'instances':valid,'inadmissible':inadmissible,'inequality_failures':failures,'strictness_failures':strict_fail}
        print(name,len(valid),inadmissible,'done',round(time.time()-start,3),flush=True)
    out['elapsed_seconds']=time.time()-start
    with open('evidence/mixed_controls.json','w') as f:json.dump(out,f,indent=2)
if __name__=='__main__':main()
