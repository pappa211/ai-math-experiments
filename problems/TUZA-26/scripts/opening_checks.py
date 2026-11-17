#!/usr/bin/env python3
"""Fresh bounded opening audit: direct exact solution of the frozen C12 interface."""
from pathlib import Path
from itertools import combinations, combinations_with_replacement
from functools import lru_cache
from collections import Counter
import json, hashlib, platform, sys, time, signal
START=time.monotonic()
SOURCE=Path('problems/TUZA-25')
OUT=Path(__file__).resolve().parents[1]/'evidence/opening_checks.json'
assert platform.system()=='Darwin'
assert sys.executable=='PRIVATE_PATH_REMOVED'
signal.signal(signal.SIGALRM,lambda *_: (_ for _ in ()).throw(TimeoutError('UNKNOWN_TIMEOUT')))
signal.alarm(120)
calls=Counter()
def K(V): return frozenset(combinations(sorted(V),2))
def tri(n,E): return tuple(t for t in combinations(range(n),3) if K(t)<=E)
@lru_cache(None)
def optimum(n,E):
    T=tri(n,E); masks=tuple(K(t) for t in T); q=len(T)
    incident={e:sum(1<<i for i,t in enumerate(masks) if e in t) for e in E}
    closed=tuple(sum(1<<j for j,u in enumerate(masks) if t&u) for t in masks)
    def split(s):
        parts=[]; left=s
        while left:
            f=left&-left; part=f; left^=f
            while f:
                bit=f&-f; f^=bit
                a=closed[bit.bit_length()-1]&left
                f|=a; part|=a; left^=a
            parts.append(part)
        return parts
    @lru_cache(None)
    def pack(s):
        calls['packing_states']+=1
        if not s:return ()
        parts=split(s)
        if len(parts)>1:return sum((pack(p) for p in parts),())
        hit=max((v&s for v in incident.values()),key=int.bit_count)
        ans=pack(s&~hit)
        while hit:
            bit=hit&-hit; hit^=bit; i=bit.bit_length()-1
            trial=(i,)+pack(s&~closed[i])
            if len(trial)>len(ans):ans=trial
        return ans
    @lru_cache(None)
    def cover(s):
        calls['cover_states']+=1
        if not s:return ()
        parts=split(s)
        if len(parts)>1:return sum((cover(p) for p in parts),())
        i=max((i for i in range(q) if s>>i&1),key=lambda i:sum((incident[e]&s).bit_count() for e in masks[i]))
        return min(((e,)+cover(s&~incident[e]) for e in sorted(masks[i])),key=len)
    P=tuple(T[i] for i in pack((1<<q)-1)); C=cover((1<<q)-1)
    assert len(set().union(*(K(t) for t in P)))==3*len(P)
    assert all(set(C)&K(t) for t in T)
    return {'nu':len(P),'tau':len(C),'packing':P,'cover':C}
models=[]
for count in (1,2,3):
    for sizes in combinations_with_replacement((4,5),count):
        pieces=[(0,1,2,3)]; n=4
        for terminal,size in enumerate(sizes,1):
            pieces.append((0,terminal)+tuple(range(n,n+size-2)));n+=size-2
        models.append(('central_K4_star_'+''.join(map(str,sizes)),n,frozenset().union(*(K(p) for p in pieces)),pieces))
models.extend([('two_K5_edge',8,K((0,1,2,3,4))|K((0,1,5,6,7)),[(0,1,2,3,4),(0,1,5,6,7)]),('W5',6,frozenset(tuple(sorted((i,(i+1)%5))) for i in range(5))|frozenset((i,5) for i in range(5)),None),('K5-e',5,K(range(5))-{(3,4)},None)])
seed_path=SOURCE/'evidence/residual_edge_exchange_seeds.json'; old_path=SOURCE/'evidence/residual_edge_exchange.json'
seeds={r['name']:r for r in json.loads(seed_path.read_text())}
old=json.loads(old_path.read_text()); oldrows={(r['seed'],tuple(r['inserted'])):r for r in old['rows']}
assert len(oldrows)==len(old['rows'])
assert set(seeds)=={r[0] for r in models}
rows=[];modelrows=[]
for name,n,E,pieces in models:
    assert seeds[name]['n']==n and frozenset(map(tuple,seeds[name]['edges']))==E
    if pieces is not None: assert seeds[name]['pieces']==list(map(list,pieces))
    universal=[v for v in range(n) if all(tuple(sorted((u,v))) in E for u in range(n) if u!=v)]
    c4=[V for V in combinations(range(n),4) if all(sum(tuple(sorted((u,v))) in E for u in V if u!=v)==2 for v in V)]
    assert universal and not c4
    T=tri(n,E); assert frozenset().union(*(K(t) for t in T))==E
    v=optimum(n,E); assert 2*v['nu']-v['tau']==1
    deletion=[{'edge':e,'nu':optimum(n,E-{e})['nu']} for e in sorted(E)]
    assert all(r['nu']==v['nu'] for r in deletion)
    modelrows.append({'name':name,'n':n,'edges':sorted(E),'pieces':pieces,'universal_vertices':universal,'induced_C4s':c4,'optimum':v,'deletion_checks':deletion})
    for e in sorted(K(range(n))-E):
        J=E|{e}; out=optimum(n,J); new=[t for t in tri(n,J) if e in K(t)]
        assert new
        r=oldrows[(name,e)]
        assert (out['nu'],out['tau'])==(r['nu'],r['tau'])
        assert set(map(tuple,r['edges']))==J and set(map(tuple,r['new_triangles']))==set(new)
        complete=all(any(w not in t and K(t+(w,))<=J for w in range(n)) for t in tri(n,J))
        row={'model':name,'inserted':e,'optimum':out,'all_triangles_K4':complete,'new_triangles':new}
        if 2*out['nu']-out['tau']==2:
            crit=[f for f in sorted(J) if optimum(n,J-{f})['nu']<out['nu']]
            critical_triangles=[t for t in tri(n,J) if K(t)<=set(crit)]
            assert complete and crit==[e] and not critical_triangles
            assert crit==list(map(tuple,r['critical_edges']))
            row.update(critical_edges=crit,critical_triangles=critical_triangles)
        rows.append(row)
assert {(r['model'],r['inserted']) for r in rows}==set(oldrows)
control_pieces=[(0,2,4,6),(0,1,2,4),(0,1,2,3),(1,2,3,5),(1,3,5,7)]
J=frozenset().union(*(K(p) for p in control_pieces));S=frozenset({(0,1),(1,2),(2,3)});L=J-S
j,l=optimum(8,J),optimum(8,L)
assert (j['nu'],j['tau'],l['nu'],l['tau'])==(5,6,2,4)
ls=frozenset().union(*(K(t) for t in tri(8,L)))
assert ls==K((0,2,4,6))|K((1,3,5,7))
assert all(any(K(t)<=K(p) for p in control_pieces) for t in tri(8,J))
result={'status':'VERIFIED_FINITE','method':'Separately authored edge-use branching for exact packing and triangle-hitting branching for exact cover, with actual shared-edge component splitting. Every one of 210 labelled insertions solved directly; no symmetry reduction, optimizer import, numerical tolerance, or sampling. Witnesses checked after exhaustive recursion.', 'scope':'Exactly frozen C12 and their 210 internal missing-edge insertions, plus one preserved P4 control. Arbitrary-background application requires separately audited diamond confinement. No claim about all defect-one supports.', 'counts':{'models':len(models),'insertions':len(rows),'qualifying_defect_two':sum('critical_edges' in r for r in rows)},'models':modelrows,'insertions':rows,'P4_control':{'pieces':control_pieces,'J_edges':sorted(J),'deleted':sorted(S),'J':j,'L':l,'old_background':sorted(L-ls)},'sources':{str(p):hashlib.sha256(p.read_bytes()).hexdigest() for p in (seed_path,old_path)},'checker_sha256':hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),'states':dict(calls),'python':sys.version,'executable':sys.executable,'platform':platform.platform(),'elapsed_seconds':time.monotonic()-START,'processes':1,'solver_threads':1}
OUT.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ('status','counts','states','elapsed_seconds')}))
