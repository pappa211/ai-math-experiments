"""TUZA-17 exact finite algorithms, standard library; no floating point.
All graph triangles reconstructed from edges. Certificate methods are recursion
with exhaustive branches; optional signal/runtime wrapper is external.
"""
from itertools import combinations
from functools import lru_cache

class Graph:
    def __init__(self,n,edges):
        self.n=n; self.edges=tuple(sorted({tuple(sorted(e)) for e in edges})); self.index={e:i for i,e in enumerate(self.edges)}
        assert all(0<=u<v<n for u,v in self.edges)
        self.triangles=tuple(t for t in combinations(range(n),3) if all(e in self.index for e in combinations(t,2)))
        self.masks=tuple(sum(1<<self.index[e] for e in combinations(t,2)) for t in self.triangles)
        self.hits=tuple(sum(1<<j for j,t in enumerate(self.masks) if t>>i&1) for i in range(len(self.edges)))
        self.alltri=(1<<len(self.masks))-1
        @lru_cache(None)
        def cover(state):
            if not state:return 0
            j=max((j for j in range(len(self.masks)) if state>>j&1),key=lambda j:sum((self.hits[i]&state).bit_count() for i in range(len(self.edges)) if self.masks[j]>>i&1))
            return 1+min(cover(state&~self.hits[i]) for i in range(len(self.edges)) if self.masks[j]>>i&1)
        self.cover=cover
        conflicts=tuple(sum(1<<j for j,t in enumerate(self.masks) if s&t) for s in self.masks)
        @lru_cache(None)
        def pack(state):
            if not state:return 0
            j=max((j for j in range(len(self.masks)) if state>>j&1),key=lambda j:(conflicts[j]&state).bit_count())
            return max(pack(state&~(1<<j)),1+pack(state&~conflicts[j]))
        self.pack=pack;self.conflicts=conflicts
    def remaining(self,deleted):
        state=self.alltri
        for i in deleted:state&=~self.hits[i]
        return state
    def tau(self):return self.cover(self.alltri)
    def nu(self):return self.pack(self.alltri)
    def cover_witness(self,state=None):
        if state is None:state=self.alltri
        out=[]
        while state:
            t=self.masks[(state&-state).bit_length()-1]
            for i in range(len(self.edges)):
                if t>>i&1 and self.cover(state&~self.hits[i])+1==self.cover(state):
                    out.append(self.edges[i]);state&=~self.hits[i];break
        return out
    def pack_witness(self,state=None):
        if state is None:state=self.alltri
        out=[]
        while state:
            j=(state&-state).bit_length()-1
            if 1+self.pack(state&~self.conflicts[j])==self.pack(state):
                out.append(self.triangles[j]);state&=~self.conflicts[j]
            else:state&=~(1<<j)
        return out
    def lambda_cover(self,X,max_budget=None):
        X=tuple(sorted(X)); link=[(u,v,i) for i,(u,v) in enumerate(self.edges) if u in X and v in X]
        tau=self.tau(); tried=0
        for k in range(len(X)+1 if max_budget is None else min(len(X),max_budget)+1):
            for S in combinations(X,k):
                S=set(S);F=[i for u,v,i in link if u not in S and v not in S];tried+=1
                if len(F)<=tau and len(F)+self.cover(self.remaining(F))==tau:
                    C=[self.edges[i] for i in F]+self.cover_witness(self.remaining(F))
                    return k,{'S':sorted(S),'C':C,'forced_link_edges':[self.edges[i] for i in F],'states_checked':tried}
        return None,{'states_checked':tried,'checked_through':max_budget}
    def apex(self,X):return Graph(self.n+1,self.edges+tuple((x,self.n) for x in X))
    def tri_free_link(self,X):return not any(set(t)<=set(X) for t in self.triangles)

def vertex_cover(n,edges):
    edges=tuple(edges)
    @lru_cache(None)
    def go(state):
        if not state:return 0,()
        j=(state&-state).bit_length()-1
        opts=[]
        for v in edges[j]:
            rest=state
            for i,e in enumerate(edges):
                if v in e:rest&=~(1<<i)
            val,S=go(rest);opts.append((val+1,(v,)+S))
        return min(opts)
    return go((1<<len(edges))-1)

def rainbow_coloring(g):
    adj=[set() for e in g.edges]
    for t in g.masks:
        ids=[i for i in range(len(g.edges)) if t>>i&1]
        for i in ids:adj[i].update(j for j in ids if j!=i)
    colors={}
    def go():
        if len(colors)==len(adj):return True
        i=max((i for i in range(len(adj)) if i not in colors),key=lambda i:(len({colors[j] for j in adj[i] if j in colors}),len(adj[i])))
        bad={colors[j] for j in adj[i] if j in colors}
        for c in range(3):
            if c not in bad:
                colors[i]=c
                if go():return True
                del colors[i]
        return False
    if not go():return None
    return {str(e):colors[i] for i,e in enumerate(g.edges)}
