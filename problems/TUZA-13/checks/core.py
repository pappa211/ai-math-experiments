"""Exact integer graph-edge cover and packing search. No third-party solver."""
from itertools import combinations
from functools import lru_cache
import time

class BudgetExceeded(Exception): pass

def bits(x):
    while x:
        b=x&-x; yield b.bit_length()-1; x^=b

class Graph:
    def __init__(self,n,edges,seconds=10):
        self.n=n; self.edges=sorted(set(tuple(sorted(e)) for e in edges))
        assert all(0<=a<b<n for a,b in self.edges)
        ix={e:i for i,e in enumerate(self.edges)}
        self.triangles=[t for t in combinations(range(n),3) if all(e in ix for e in combinations(t,2))]
        self.masks=[sum(1<<ix[e] for e in combinations(t,2)) for t in self.triangles]
        self.inc=[0]*len(self.edges)
        for i,m in enumerate(self.masks):
            for e in bits(m):self.inc[e]|=1<<i
        self.full=(1<<len(self.masks))-1
        self.compat=[self.full ^ sum(1<<j for j,m in enumerate(self.masks) if m&t) for t in self.masks]
        self.deadline=time.monotonic()+seconds;self.nodes=0;self.pcache={}
    def tick(self):
        self.nodes+=1
        if self.nodes%128==0 and time.monotonic()>self.deadline: raise BudgetExceeded()
    def packing(self,U=None,target=None):
        if U is None:U=self.full
        if U in self.pcache:
            p=self.pcache[U];return p
        best=[];exact=True
        def color(P):
            order=[];bounds=[];c=0
            while P:
                c+=1;Q=P
                while Q:
                    b=Q&-Q;v=b.bit_length()-1;P^=b;Q^=b
                    Q &= ~self.compat[v]
                    order.append(v);bounds.append(c)
            return order,bounds
        def expand(P,chosen):
            nonlocal best,exact
            self.tick()
            if target is not None and len(best)>=target:exact=False;return
            order,bounds=color(P)
            for j in range(len(order)-1,-1,-1):
                if len(chosen)+bounds[j]<=len(best):return
                v=order[j];Q=P&self.compat[v]
                if not Q:
                    if len(chosen)+1>len(best):best=chosen+[v]
                else:expand(Q,chosen+[v])
                P &= ~(1<<v)
                if target is not None and len(best)>=target:exact=False;return
        expand(U,[])
        if exact:self.pcache[U]=best
        return best
    def greedy_cover(self):
        U=self.full;C=0
        while U:
            e=max(range(len(self.edges)),key=lambda x:(U&self.inc[x]).bit_count())
            C|=1<<e;U &= ~self.inc[e]
        return C
    def covers(self,limit=10000):
        """All minimum covers if complete=True; otherwise a prefix of distinct optima.
        Branches partition by first selected edge of a live triangle, forbidding earlier edges.
        Integer capacity bound and actual greedy disjoint triangles prune only impossibilities.
        """
        if not self.full:return 0,[0],True
        allE=(1<<len(self.edges))-1
        upper=self.greedy_cover().bit_count()
        lower=len(self.packing(target=upper))
        cache=set()
        def dfs(U,A,k,C,answers,cap):
            self.tick()
            if not U:
                answers.append(C);return len(answers)>=cap
            if k<=0:return False
            key=(U,A,k)
            if key in cache:return False
            options=[]
            for t in bits(U):
                avail=self.masks[t]&A
                if not avail:cache.add(key);return False
                options.append((avail.bit_count(),-sum((self.inc[e]&U).bit_count() for e in bits(avail)),avail))
            maxhit=max(((self.inc[e]&U).bit_count() for e in bits(A)),default=0)
            if not maxhit or U.bit_count()>k*maxhit:cache.add(key);return False
            # Every pairwise edge-disjoint uncovered triangle costs a distinct cover edge.
            used=0;lb=0
            for t in bits(U):
                avail=self.masks[t]&A
                if not used&avail:
                    used|=avail;lb+=1
                    if lb>k:cache.add(key);return False
            avail=min(options)[2]
            order=sorted(bits(avail),key=lambda e:-(self.inc[e]&U).bit_count())
            before=len(answers)
            for e in order:
                if dfs(U&~self.inc[e],A&~(1<<e),k-1,C|(1<<e),answers,cap):return True
                A &= ~(1<<e)
            if before==len(answers):cache.add(key)
            return False
        for k in range(lower,upper+1):
            ans=[]
            stopped=dfs(self.full,allE,k,0,ans,limit)
            if ans:
                assert len(set(ans))==len(ans) and all(c.bit_count()==k for c in ans)
                return k,ans,not stopped
        raise AssertionError('greedy upper impossible')
    def cover_mask(self,edges):
        ix={e:i for i,e in enumerate(self.edges)}
        return sum(1<<ix[tuple(sorted(e))] for e in edges)
    def evaluate(self,C):
        counts=[(m&C).bit_count() for m in self.masks]
        assert all(counts)
        allowed=sum(1<<i for i,c in enumerate(counts) if c<=2)
        p=self.packing(allowed)
        one=self.packing(sum(1<<i for i,c in enumerate(counts) if c==1))
        return {'cover':[self.edges[i] for i in bits(C)],'tau':C.bit_count(),'target':(C.bit_count()+1)//2,
                'eligible_nu':len(p),'private_nu':len(one),'eligible_packing':[self.triangles[i] for i in p],
                'packing_red_counts':[counts[i] for i in p], 'class_sizes':[counts.count(i) for i in (1,2,3)],
                'D':(C.bit_count()+1)//2-len(p)}
    def literal(self):return {'n':self.n,'edges':self.edges,'triangles':self.triangles}
