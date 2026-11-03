#!/usr/bin/env python3
"""New direct-set checks of displayed TUZA-15 core facts and footprint bounds.
No historical Python imports. Finite identities do not certify arbitrary pages;
the upper-completion footprint checks verify only their stated boundary interface.
"""
from itertools import combinations, permutations
from fractions import Fraction as F
from pathlib import Path
import json, time, resource, hashlib
A=Path(__file__).resolve().parents[1]
def edge(a,b): return tuple(sorted((a,b)))
def E(v): return {edge(a,b) for a,b in combinations(v,2)}
def TE(t): return E(t)
def triangles(g):
    v=set().union(*map(set,g)) if g else set()
    return [tuple(c) for c in combinations(sorted(v),3) if TE(c)<=g]
def check_pack(g, rows):
    seen=set()
    for t in rows:
        es=TE(t)
        assert len(set(t))==3 and len(es)==3 and es<=g, ('nontriangle',t)
        assert not seen&es, ('overlap',t,seen&es)
        seen|=es
    return seen
def lost_cover(g,k,x):
    assert x<=g
    for t in triangles(g):
        if not TE(t)<=k: assert TE(t)&x, ('uncovered_lost',t)
def footprint_bound(g,k,rows,upper=None):
    f=check_pack(g,rows)&k
    vv=set().union(*map(set,f)) if f else set()
    possible=E(vv) if upper is None else upper
    checked=0
    for n in range(1,min(5,len(vv))+1):
        for c in combinations(sorted(vv),n):
            if not E(c)<=possible: continue
            d=f&E(c)
            if n<=4 and d:
                assert set.intersection(*(set(e) for e in d)), ('nonstar',c,d)
            assert len(d)<=2, ('three_edge_K5_footprint',c,d)
            checked+=1
    return {'footprint':[list(e) for e in sorted(f)],'candidate_intersections':checked}
def findpack(g,n):
    ts=triangles(g); masks=[TE(t) for t in ts]
    def go(start,used,out):
        if len(out)==n:return out
        for i in range(start,len(ts)):
            if not masks[i]&used:
                ans=go(i+1,used|masks[i],out+[ts[i]])
                if ans is not None:return ans
        return None
    ans=go(0,set(),[]); assert ans is not None, ('packing_not_found',n,sorted(g))
    return ans
def cover_containing(g,n,f=None):
    es=sorted(g); ts=list(map(TE,triangles(g)))
    for c in combinations(es,n):
        cc=set(c)
        if f is not None and f not in cc:continue
        if all(cc&t for t in ts):return cc
    raise AssertionError(('cover_not_found',n,f))

def run():
    out={}; start=time.monotonic()
    # R6: v=0, missing12/34, W=1..5, extra6.
    g=E(range(7))-{(1,2),(3,4)}
    r=(E(range(1,6))-{(1,2),(3,4)})|{(5,6)}
    k=g-({edge(0,i) for i in range(1,7)}|r)
    p=[(0,1,4),(0,2,3),(0,5,6),(1,3,5),(2,4,5)]
    assert not check_pack(g,p)&k
    lost_cover(g,k,r|{(0,6)})
    cover={(0,1),(0,2),(3,5),(3,6),(4,5),(4,6),(5,6)}
    assert all(TE(t)&cover for t in triangles(g))
    # Every forbidden core edge, including the full orbit, independently searched.
    rows={str(f):findpack(g-{f},5) for f in sorted(g)}
    pages=[]
    for f in sorted(r):
        gg=g|{edge(f[0],7),edge(f[1],7)}
        kk=k|{edge(f[0],7),edge(f[1],7)}
        q=rows[str(f)]+[(f[0],f[1],7)]
        upper=E(range(8))-(g-k)-{(1,2),(3,4)}
        pages.append(footprint_bound(gg,kk,q,upper))
    out['R6']={'all_forbidden_edges':len(rows),'packings':rows,'page_interfaces':pages}
    # TWIN, all four optional incidences wa/wb. hubs0/1, a2,b3,c4,d5,w6.
    twins=[]
    for bits in range(4):
        g=E(range(7))-{(2,6),(3,6)}
        if bits&1:g.add((2,6))
        if bits&2:g.add((3,6))
        r={(2,3),(3,4),(4,5),(2,5)}
        deleted={e for e in g if 0 in e or 1 in e}|r
        k=g-deleted
        p=[(0,2,3),(0,4,5),(1,3,4),(1,2,5),(0,1,6)]
        q=[(6,0,1),(6,4,5),(2,0,4),(2,1,5),(3,0,5),(3,1,4)]
        x=r|{(0,6),(1,6),(0,2),(0,3),(1,4),(1,5)}
        assert not check_pack(g,p)&k
        lost_cover(g,k,x)
        twins.append(footprint_bound(g,k,q,E(range(7))-deleted))
    out['TWIN']=twins
    # THIN: v0,u1,W2..5 cyclic, q6,p1=7,p2=8.
    g=(E(range(7))-{(1,6),(2,4),(3,5)})|{(1,7),(1,8)}
    # Remove optional non-neighborhood edges to respect d(v)=6 and d(u)=7.
    x={(2,3),(3,4),(4,5),(2,5),(0,1),(1,7),(1,8),(0,6)}
    k={e for e in g-x if 0 not in e and 1 not in e}
    p=[(1,2,3),(1,4,5),(0,3,4),(0,2,5)]
    q=[(1,2,3),(6,4,5),(0,1,4),(0,2,5),(0,3,6)]
    assert not check_pack(g,p)&k
    lost_cover(g,k,x)
    absent={(1,6),(2,4),(3,5)}|{(0,7),(0,8)}
    out['THIN']=footprint_bound(g,k,q,E(range(9))-absent-x-{e for e in E(range(9)) if 0 in e or 1 in e})
    # DOM complete and one-missing-edge branches.
    for miss in (None,(2,3)):
        core=E(range(7))-(set() if miss is None else {miss})
        if miss is None:q=[(0,1,3),(0,2,6),(0,4,5),(1,2,4),(1,5,6),(2,3,5),(3,4,6)]
        else:
            # u0,v1,w1=2,w2=3,w3=4,w4=5,w5=6.
            q=[(0,3,6),(0,4,5),(1,3,4),(1,5,6),(0,1,2),(2,4,6)]
        check_pack(core,q)
        out['DOM_'+str(miss)]={'packing_size':len(q),'used_edges':len(set().union(*map(TE,q)))}
    # Adjacent6/6 B2, p6 and q7, hubs0/1, w1..4=2..5.
    for full in (False,True):
        h=E(range(2,6)) if full else {(2,3),(3,5),(4,5),(2,4)}
        g=h|{(0,1),(0,6),(1,7)}|{edge(u,w) for u in (0,1,6,7) for w in range(2,6)}
        x=h|{(0,1),(0,6),(4,6),(1,7),(3,7)}
        k={e for e in g-x if 0 not in e and 1 not in e}
        p=[(0,2,3),(1,2,4),(0,1,5),(0,6,4),(1,7,3)]
        if full:p.append((3,4,5))
        assert not check_pack(g,p)&k
        lost_cover(g,k,x)
        assert len(x)<2*len(p)
        out['B2_'+str(full)]={'packing_size':len(p),'cover_size':len(x)}
    # Degree7/8 helper facts over exact K6, and K6-ab.
    g=E(range(6)); allf=[]
    for f in sorted(g):
        allf.append({'forbidden':[f],'packing':findpack(g-{f},4),'cover_containing':sorted(cover_containing(g,6,f))})
    for f,h in combinations(sorted(g),2):
        if not set(f)&set(h):allf.append({'forbidden':[f,h],'packing':findpack(g-{f,h},4)})
    for c in range(6):
        for leaves in combinations([v for v in range(6) if v!=c],3):
            fs={edge(c,v) for v in leaves}
            findpack(g-fs,3)
    out['degree78_K6_helpers']={'single_edge_and_disjoint_pair_cases':len(allf),'three_star_cases':60,'rows':allf}
    # Degree8 near-K4 page pair rows, u0,v1,a2,b3,c4,d5.
    gg=g-{(2,3)}
    forbidden=[{(2,4),(2,5)},{(2,4),(3,4)},{(2,4),(3,5)}]
    qs=[[(2,0,1),(3,4,0),(3,5,1)],[(2,0,1),(3,5,0),(4,5,1)],[(2,0,1),(3,4,0),(4,5,1)]]
    for fs,q in zip(forbidden,qs):assert not check_pack(gg,q)&fs
    for c in ({(2,4),(3,4),(0,1),(0,5),(1,5)},{(2,5),(3,5),(0,1),(0,4),(1,4)}):
        assert all(TE(t)&c for t in triangles(gg))
    # Singleton H2 diamond for every internal matching (size<=2).
    diamond_cases=0
    for missing in (set(),{(0,1)}):
        five=E(range(5))-missing
        for n in (0,1,2):
            for m in combinations(sorted(five),n):
                if len(set().union(*map(set,m)))!=2*n if m else False:continue
                j=five-set(m)
                if j==E(range(5)):continue
                assert any(len(E(s)-j)==1 for s in combinations(range(5),4))
                diamond_cases+=1
    out['H2_diamond_cases']=diamond_cases
    # Exact rational final charges; k>=10 inequalities have positive slopes.
    out['discharging']={'degree5_min':str(5+3*F(2,3)),'thin6':str(6+6*F(1,6)),'nonthin6_min':str(6+4*F(1,4)),'degree7':7,'degree8_min':str(8-4*F(1,4)),'degree9_t_le3_min':str(9-3*F(2,3)),'degree9_t_ge4_min':str(9-F(2,3)-4*F(1,4)),'k_ge10_two_subsumed5':'k/3+4; minimum22/3 at10, slope1/3','k_ge10_at_most_one_subsumed5':'3k/4+7/12; minimum97/12 at10, slope3/4'}
    assert 10-2*F(10-6,3)>=7
    assert 10-F(2,3)-F(10-5,4)>=7
    # Semantic controls: original checks should reject these, assertions retained.
    controls=[]
    for name, fn in [('nontriangle',lambda:check_pack({(0,1),(1,2)},[(0,1,2)])),('packing_overlap',lambda:check_pack(E(range(4)),[(0,1,2),(0,1,3)])),('uncovered_lost_triangle',lambda:lost_cover(E(range(3)),set(),set()))]:
        try:fn()
        except AssertionError:controls.append({'name':name,'rejected':True})
        else:raise AssertionError(('control_accepted',name))
    out['negative_controls']=controls
    out['elapsed_seconds']=time.monotonic()-start
    out['peak_rss_bytes_darwin']=resource.getrusage(resource.RUSAGE_SELF).ru_maxrss
    out['scope']='Explicit fixed-core facts and conservative finite footprint interfaces. No outside-attachment census or proof by bounded graph order.'
    out['checker_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    return out
if __name__=='__main__':
    result=run()
    (A/'evidence/coordinator_fixed_core.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'status':'PASS','elapsed_seconds':result['elapsed_seconds'],'peak_rss_bytes_darwin':result['peak_rss_bytes_darwin'],'H2_cases':result['H2_diamond_cases'],'negative_controls':result['negative_controls']}))
