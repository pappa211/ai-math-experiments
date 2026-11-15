#!/usr/bin/env python3
"""Local exact SAT interface for targeted triangle parity/packing gate attacks.
SAT witnesses are checked against literal graph triangles and all generated clauses.
UNSAT is a solver result, not a Lean/kernel claim; callers retain status and limits.
"""
from itertools import combinations
from pathlib import Path
import subprocess,time,hashlib,datetime,json,platform
CADICAL='LOCAL_ENVIRONMENT'
CUTOFF=datetime.datetime.fromisoformat('2026-11-15T09:23:58+00:00')

class CNF:
    def __init__(self,n):self.n=n;self.clauses=[]
    def var(self):self.n+=1;return self.n
    def add(self,*lits):self.clauses.append(tuple(lits))
    def count_ge(self,xs,k):
        if k<=0:return None
        if k>len(xs):self.add();return None
        prev=None
        for i,x in enumerate(xs):
            row=[self.var() for _ in range(k)]
            if prev is None:
                self.add(-row[0],x);self.add(-x,row[0])
                for y in row[1:]:self.add(-y)
            else:
                y=row[0];a=prev[0]
                self.add(-a,y);self.add(-x,y);self.add(-y,a,x)
                for j in range(1,k):
                    y=row[j];a=prev[j];b=prev[j-1]
                    self.add(-a,y);self.add(-x,-b,y);self.add(-y,a,x);self.add(-y,a,b)
            prev=row
        return prev[-1]
    def atleast(self,xs,k):
        if k<=0:return
        lit=self.count_ge(xs,k)
        if lit is not None:self.add(lit)
    def atmost(self,xs,k):
        if k<0:self.add();return
        if k>=len(xs):return
        lit=self.count_ge(xs,k+1)
        if lit is not None:self.add(-lit)
    def solve(self,timeout=10):
        assert platform.system()=='Darwin'
        now=datetime.datetime.now(datetime.timezone.utc)
        remaining=(CUTOFF-now).total_seconds()
        if remaining<=0:return {'status':'UNKNOWN_CUTOFF'}
        timeout=max(.01,min(timeout,remaining,60))
        data=('p cnf %d %d\n'%(self.n,len(self.clauses))+''.join(' '.join(map(str,c))+' 0\n' for c in self.clauses)).encode()
        t=time.monotonic()
        try:r=subprocess.run([CADICAL,'-q'],input=data,stdout=subprocess.PIPE,stderr=subprocess.PIPE,timeout=timeout)
        except subprocess.TimeoutExpired:
            return {'status':'UNKNOWN_TIMEOUT','seconds':time.monotonic()-t,'timeout':timeout,'cnf_sha256':hashlib.sha256(data).hexdigest()}
        out=r.stdout.decode();meta={'seconds':time.monotonic()-t,'returncode':r.returncode,'variables':self.n,'clauses':len(self.clauses),'cnf_sha256':hashlib.sha256(data).hexdigest()}
        if r.returncode==20:return {'status':'UNSAT',**meta}
        if r.returncode!=10:return {'status':'UNKNOWN_ERROR',**meta,'stdout':out[-1000:],'stderr':r.stderr.decode()[-1000:]}
        pos=set();neg=set()
        for line in out.splitlines():
            if line.startswith('v '):
                for x in map(int,line[2:].split()):
                    if x>0:pos.add(x)
                    elif x<0:neg.add(-x)
        assert not(pos&neg)
        assert all(any((x>0 and x in pos) or (x<0 and -x in neg) for x in c) for c in self.clauses)
        return {'status':'SAT',**meta,'positive':pos}

class TriangleSAT:
    def __init__(self,n,edges):
        self.n=n;self.edges=sorted({tuple(sorted(e)) for e in edges});self.eid={e:i for i,e in enumerate(self.edges)}
        self.triples=[t for t in combinations(range(n),3) if all(e in self.eid for e in combinations(t,2))]
        self.ts=[tuple(self.eid[e] for e in combinations(t,2)) for t in self.triples]
        self.byedge=[[] for _ in self.edges]
        for j,t in enumerate(self.ts):
            for i in t:self.byedge[i].append(j)
    def pack(self,k,deleted=(),timeout=10):
        F=CNF(len(self.ts));deleted=set(deleted)
        for ids in self.byedge:
            for i,j in combinations(ids,2):F.add(-(i+1),-(j+1))
        for i,t in enumerate(self.ts):
            if deleted.intersection(t):F.add(-(i+1))
        F.atleast(list(range(1,len(self.ts)+1)),k);r=F.solve(timeout)
        if r['status']=='SAT':
            model=r.pop('positive');selected=[j for j in range(len(self.ts)) if j+1 in model]
            used=[e for j in selected for e in self.ts[j]]
            assert len(selected)>=k and len(used)==len(set(used)) and not deleted.intersection(used)
            r['packing_indices']=selected;r['packing']=[self.triples[j] for j in selected]
        return r
    def cover(self,k,deleted=(),forced=(),odd=False,timeout=10):
        F=CNF(len(self.edges));deleted=set(deleted)
        for t in self.ts:
            if deleted.intersection(t):continue
            x,y,z=[e+1 for e in t]
            if not odd:F.add(x,y,z)
            else:
                F.add(x,y,z);F.add(x,-y,-z);F.add(-x,y,-z);F.add(-x,-y,z)
        for e in deleted:F.add(-(e+1))
        for e in forced:F.add(e+1)
        F.atmost(list(range(1,len(self.edges)+1)),k);r=F.solve(timeout)
        if r['status']=='SAT':
            model=r.pop('positive');C={j for j in range(len(self.edges)) if j+1 in model}
            assert len(C)<=k and not C.intersection(deleted) and set(forced)<=C
            assert all((len(C.intersection(t))%2==1 if odd else bool(C.intersection(t))) for t in self.ts if not deleted.intersection(t))
            r['cover_indices']=sorted(C);r['cover']=[self.edges[j] for j in sorted(C)]
        return r
    def optimum_nu(self,timeout=10):
        lo=0;hi=min(len(self.edges)//3,len(self.ts));calls=[];cert=[]
        while lo<hi:
            k=(lo+hi+1)//2;r=self.pack(k,timeout=timeout);calls.append({'k':k,**r})
            if r['status']=='SAT':lo=len(r['packing']);cert=r['packing']
            elif r['status']=='UNSAT':hi=k-1
            else:return {'status':r['status'],'lower':lo,'upper':hi,'calls':calls}
        return {'status':'EXACT_SOLVER','value':lo,'packing':cert,'calls':calls}
    def optimum_tau(self,lower=0,odd=False,timeout=10):
        lo=lower;hi=len(self.edges);calls=[];cert=self.edges
        while lo<hi:
            k=(lo+hi)//2;r=self.cover(k,odd=odd,timeout=timeout);calls.append({'k':k,**r})
            if r['status']=='SAT':hi=len(r['cover']);cert=r['cover']
            elif r['status']=='UNSAT':lo=k+1
            else:return {'status':r['status'],'lower':lo,'upper':hi,'calls':calls}
        return {'status':'EXACT_SOLVER','value':lo,'cover':cert,'calls':calls}
