#!/usr/bin/env python3
"""Targeted inverse SAT design for a rainbow-2 / mixed-cover-5 resource obstruction."""
from itertools import combinations
from pathlib import Path
from collections import Counter
import argparse,json,time,sys,hashlib
from global_routes_sat import CNF
W=Path(__file__).resolve().parents[1]
def build(n,c,triangle_free=True,mixed_lower=5):
    es=list(combinations(range(n),2));eid={e:i for i,e in enumerate(es)};m=2*c
    f=CNF(0)
    x=[[f.var() for e in es] for _ in range(m)]
    a=[f.var() for e in es]
    z=[[f.var() for v in range(n)] for _ in range(m)]
    for i in range(m):
        f.add(*x[i]);f.atmost(x[i],1)
        for v in range(n):
            inc=[x[i][j] for j,e in enumerate(es) if v in e]
            f.add(-z[i][v],*inc)
            for t in inc:f.add(-t,z[i][v])
    for j,e in enumerate(es):
        col=[x[i][j] for i in range(m)]
        f.add(-a[j],*col)
        for t in col:f.add(-t,a[j])
        f.atmost(col,1)
    for v in range(n):
        row=[a[j] for j,e in enumerate(es) if v in e]
        f.atleast(row,2);f.atmost(row,4)
    if triangle_free:
        for u,v,w in combinations(range(n),3):f.add(-a[eid[(u,v)]],-a[eid[(u,w)]],-a[eid[(v,w)]])
    for col in range(c):
        for v in range(n):f.add(-z[2*col][v],-z[2*col+1][v])
    inter={}
    for i,j in combinations(range(m),2):
        ij=f.var();inter[i,j]=ij;hs=[]
        for v in range(n):
            h=f.var();hs.append(h)
            f.add(-h,z[i][v]);f.add(-h,z[j][v]);f.add(-z[i][v],-z[j][v],h)
        f.add(-ij,*hs)
        for h in hs:f.add(-h,ij)
    for i,j,k in combinations(range(m),3):
        if len({i//2,j//2,k//2})==3:f.add(inter[i,j],inter[i,k],inter[j,k])
    # Every set of mixed_lower-1 resources misses some edge.
    for vs in range(mixed_lower):
        cs=mixed_lower-1-vs
        if cs>c or vs>n:continue
        for vv in combinations(range(n),vs):
            vsset=set(vv)
            out_e=[j for j,e in enumerate(es) if not (set(e)&vsset)]
            for cc in combinations(range(c),cs):
                ccset=set(cc)
                f.add(*(x[i][j] for i in range(m) if i//2 not in ccset for j in out_e))
    # Choose the first two color classes around a fixed maximum rainbow pair.
    f.add(x[0][eid[(0,1)]]);f.add(x[2][eid[(2,3)]])
    # Remaining color-pair ordering uses only harmless color/edge permutations.
    for col in range(2,c):
        for j in range(len(es)):
            for k in range(j+1):f.add(-x[2*col][j],-x[2*col+1][k])
    for col in range(2,c-1):
        for j in range(len(es)):
            for k in range(j+1):f.add(-x[2*col][j],-x[2*col+2][k])
    return f,x,es

def verify(n,c,chosen):
    assert len(chosen)==2*c and len(set(chosen))==len(chosen)
    edge_set=set(chosen)
    assert not any(all(e in edge_set for e in combinations(t,2)) for t in combinations(range(n),3))
    deg=Counter(v for e in chosen for v in e);assert all(2<=deg[v]<=4 for v in range(n))
    for j in range(c):assert not set(chosen[2*j])&set(chosen[2*j+1])
    assert not any(len({i//2,j//2,k//2})==3 and len(set(chosen[i]+chosen[j]+chosen[k]))==6 for i,j,k in combinations(range(2*c),3))
    assert len(set(chosen[0]+chosen[2]))==4
    for vcount in range(5):
        for vv in combinations(range(n),vcount):
            for cc in combinations(range(c),4-vcount):
                assert any(i//2 not in cc and not (set(e)&set(vv)) for i,e in enumerate(chosen))
    # Exact mixed cover (tiny fixed candidate only).
    for size in range(5,c+1):
        for vcount in range(min(size,n)+1):
            for vv in combinations(range(n),vcount):
                for cc in combinations(range(c),size-vcount):
                    if all(i//2 in cc or set(e)&set(vv) for i,e in enumerate(chosen)):
                        return {'nu_r':2,'tau_mix':size,'cover_vertices':vv,'cover_colors':cc}
    raise AssertionError

def main():
    ap=argparse.ArgumentParser();ap.add_argument('n',type=int);ap.add_argument('c',type=int);ap.add_argument('--timeout',type=int,default=60);args=ap.parse_args()
    start=time.monotonic();f,x,es=build(args.n,args.c)
    print(json.dumps({'stage':'built','n':args.n,'colors':args.c,'variables':f.n,'clauses':len(f.clauses),'build_seconds':time.monotonic()-start}),flush=True)
    r=f.solve(args.timeout)
    if r['status']=='SAT':
        pos=r.pop('positive');chosen=[es[next(j for j,v in enumerate(row) if v in pos)] for row in x]
        r['colored_edges']=[{'edge':e,'color':i//2} for i,e in enumerate(chosen)]
        r['literal_verification']=verify(args.n,args.c,chosen)
    r.update({'n':args.n,'colors':args.c,'scope':'One specified inverse-design case; UNSAT is solver-only, not exhaustive proof beyond the encoded case.','checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest()})
    out=W/'evidence/fresh_rainbow_resource_gate';out.mkdir(exist_ok=True,parents=True)
    (out/f'n{args.n}_c{args.c}.json').write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps(r,sort_keys=True),flush=True)
if __name__=='__main__':main()
