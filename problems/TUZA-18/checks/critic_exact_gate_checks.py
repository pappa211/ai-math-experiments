#!/usr/bin/env python3
"""Independent finite audit. Does not prove unbounded probabilistic existence."""
from datetime import datetime, timezone
from hashlib import sha256
from itertools import combinations
from pathlib import Path
import json, platform, sys, time

ROOT=Path('ARCHIVE/TUZA-18')
STOP=datetime(2026,11,14,21,0,10,tzinfo=timezone.utc)
EXPECTED={'notes/global_finite_incidence_gate.md':'7ec106efb669f729e89d312b174be339474db93b1292945f56e01fec55ab8ac6',
          'notes/global_cut_gate.md':'83893dd6658e738ef91fb60ac2b5ed733160ec1a74b13732df40e72734b7486c'}

def deadline():
    if datetime.now(timezone.utc)>=STOP: raise RuntimeError('Mathematical testing deadline reached')

def triangles(n,edges):
    result=[]
    for a,b,c in combinations(range(n),3):
        t=frozenset(((a,b),(a,c),(b,c)))
        if t<=edges: result.append(t)
    return result

def alpha(n,edges):
    masks=[(1<<u)|(1<<v) for u,v in edges]
    return max(s.bit_count() for s in range(1<<n) if not any(s&e==e for e in masks))

def forest(n,family):
    parent=list(range(n+len(family)))
    def root(x):
        while parent[x]!=x:
            parent[x]=parent[parent[x]]
            x=parent[x]
        return x
    for i,triple in enumerate(family,n):
        for v in triple:
            a,b=root(i),root(v)
            if a==b:return False
            parent[a]=b
    return True

def realize(n,family):
    inc=[[] for _ in range(n)]
    for i,triple in enumerate(family):
        for v in triple:inc[v].append(i)
    mapping={}; done=set(); ng=0
    for r in range(n):
        if r in mapping:continue
        mapping[r]=(ng,ng+1);ng+=2;queue=[r]
        while queue:
            p=queue.pop()
            for i in inc[p]:
                if i in done:continue
                done.add(i)
                children=[v for v in family[i] if v!=p]
                assert len(children)==2 and all(v not in mapping for v in children)
                a,b=mapping[p];w=ng;ng+=1
                mapping[children[0]]=tuple(sorted((a,w)))
                mapping[children[1]]=tuple(sorted((b,w)))
                queue.extend(children)
    inverse={edge:v for v,edge in mapping.items()}
    assert len(inverse)==len(mapping)==n and len(done)==len(family)
    actual=triangles(ng,frozenset(inverse))
    recovered={frozenset(inverse[e] for e in t) for t in actual}
    assert recovered=={frozenset(t) for t in family} and len(actual)==len(family)

def forests():
    rows=[]
    for n in range(8):
        deadline();attempts=checked=0
        possible=list(combinations(range(n),3))
        for m in range(max(0,(n-1)//2)+1):
            for family in combinations(possible,m):
                attempts+=1
                if forest(n,family):realize(n,family);checked+=1
        rows.append(dict(n=n,candidates=attempts,forests=checked))
    for family in [[(0,2*i+1,2*i+2) for i in range(40)],[(2*i,2*i+1,2*i+2) for i in range(40)]]:
        assert forest(81,family);realize(81,family)
    return dict(by_order=rows,additional_81_hypervertex_forests=2)

def maximum_packings(ts):
    best=[-1,[]]
    def visit(i,used,chosen):
        if i==len(ts):
            if len(chosen)>best[0]:best[:]=[len(chosen),[tuple(chosen)]]
            elif len(chosen)==best[0]:best[1].append(tuple(chosen))
            return
        if len(chosen)+len(ts)-i<best[0]:return
        visit(i+1,used,chosen)
        if not used&ts[i]:visit(i+1,used|ts[i],chosen+[i])
    visit(0,frozenset(),[])
    return best[1]

def cover(ts,packed,side):
    selected={e for e in packed if side(e[0])==side(e[1])}
    for t in ts:
        same=[e for e in t if side(e[0])==side(e[1])]
        if len(same)==1 and same[0] not in packed:selected.add(same[0])
    return selected

def small_graphs():
    rows=[]
    for n in range(7):
        deadline();cases=0
        possible=list(combinations(range(n),2))
        for mask in range(1<<len(possible)):
            if mask%1024==0:deadline()
            edges=frozenset(e for i,e in enumerate(possible) if mask>>i&1)
            assert 3*alpha(n,edges)>=2*n-len(edges)
            if n>5:continue
            ts=triangles(n,edges)
            for packing in maximum_packings(ts):
                packed=frozenset().union(*(ts[i] for i in packing))
                for cut in range(1<<max(0,n-1)):
                    side=lambda v:0 if v==0 else (cut>>(v-1))&1
                    selected=cover(ts,packed,side)
                    assert selected<=edges and all(selected&t for t in ts)
                    cases+=1
        rows.append(dict(n=n,graphs=1<<len(possible),maximum_packing_cut_cover_cases=cases))
    return rows

def perfect_matchings(n,edges):
    def visit(unmatched):
        if not unmatched:yield frozenset();return
        v=min(unmatched)
        for w in sorted(unmatched-{v}):
            edge=tuple(sorted((v,w)))
            if edge in edges:
                for rest in visit(unmatched-{v,w}):yield rest|{edge}
    return list(visit(set(range(n))))

def cones():
    rows=[]
    for n in (0,2,4,6):
        deadline();rims=pm=cases=0
        possible=list(combinations(range(n),2))
        for mask in range(1<<len(possible)):
            if mask%256==0:deadline()
            rim=frozenset(e for i,e in enumerate(possible) if mask>>i&1)
            if triangles(n,rim):continue
            matchings=perfect_matchings(n,rim)
            if not matchings:continue
            rims+=1;a=alpha(n,rim)
            spokes=frozenset((v,n) for v in range(n));actual=triangles(n+1,rim|spokes)
            expected={frozenset((e,(e[0],n),(e[1],n))) for e in rim}
            assert set(actual)==expected and len(actual)==len(rim)
            for matching in matchings:
                pm+=1
                for cut in range(1<<n):
                    side=lambda v:0 if v==n else (cut>>v)&1
                    selected=cover(actual,spokes|matching,side)
                    s={v for v in range(n) if side(v)};t=set(range(n))-s
                    hs=sum(u in s and v in s for u,v in rim)
                    ms=sum(u in s and v in s for u,v in matching)
                    mt=sum(u in t and v in t for u,v in matching)
                    assert len(selected)==n-len(s)+hs+mt==3*n//2-2*len(s)+hs+ms
                    assert 2*len(selected)>=3*n-6*a and all(selected&t for t in actual)
                    cases+=1
        rows.append(dict(n=n,triangle_free_rims_with_perfect_matching=rims,perfect_matchings=pm,packing_cut_cases=cases))
    return rows

def main():
    deadline();start=datetime.now(timezone.utc).isoformat();tic=time.monotonic();hashes={}
    for rel,expected in EXPECTED.items():
        data=(ROOT/rel).read_bytes();digest=sha256(data).hexdigest();assert digest==expected
        hashes[rel]=digest
        Path('SCRATCH_OUTPUT/tuza18_critic_input_'+Path(rel).name).write_bytes(data)
    faces=((0,1,2),(0,1,3),(0,2,3))
    pairs=frozenset(e for t in faces for e in combinations(t,2))
    blown={frozenset(combinations(t,2)) for t in faces};actual=set(triangles(4,pairs))
    assert len(pairs)==6 and len(blown)==3 and len(actual)==4 and blown<actual
    result=dict(status='PASS',started_utc=start,input_sha256=hashes,
                model_request='gpt-6-astra / ultra; runtime model identity not independently inspected',
                script_sha256=sha256(Path(__file__).read_bytes()).hexdigest(),python=sys.version,platform=platform.platform(),
                stop_utc=STOP.isoformat(),forest_realization=forests(),graph_inequality_and_cover=small_graphs(),cone_formula=cones(),
                noninduced_embedding_warning=dict(pairs=6,designated_faces=3,actual_triangles=4),
                limitations=['Finite tests do not prove the unbounded existence statements.','No explicit large-ratio rim graph is produced.','No Lean verification or external human peer review.'])
    deadline();result['finished_utc']=datetime.now(timezone.utc).isoformat();result['elapsed_seconds']=time.monotonic()-tic
    print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
