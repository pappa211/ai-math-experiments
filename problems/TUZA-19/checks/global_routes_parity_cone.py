#!/usr/bin/env python3
"""Literal Kalbfleisch-cone parity obstruction. Exact integer checks, local only.
The rim is the classical 35-vertex circulant with distances1,7,11,16.
"""
from itertools import combinations
from pathlib import Path
from fractions import Fraction
import json,time,platform,argparse,hashlib

def bits(x):
    while x:
        b=x&-x;yield b.bit_length()-1;x-=b

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--output',required=True);args=ap.parse_args()
    assert platform.system()=='Darwin';start=time.time();n=35;dist={1,7,11,16}
    E={tuple(sorted((u,(u+d)%n))) for u in range(n) for d in dist}
    adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    assert len(E)==140 and all(x.bit_count()==8 for x in adj)
    assert not [t for t in combinations(range(n),3) if all(e in E for e in combinations(t,2))]
    counts=[0]*10;size8=[];nodes=0
    def enumerate_independent(cand,chosen):
        nonlocal nodes
        nodes+=1;r=len(chosen);counts[r]+=1
        if r==8:size8.append(chosen)
        assert r<9,('independent9',chosen)
        while cand:
            b=cand&-cand;v=b.bit_length()-1;cand-=b
            enumerate_independent(cand&~adj[v],chosen+[v])
    enumerate_independent((1<<n)-1,[])
    assert size8
    def independent(S,edges=E):return all(e not in edges for e in combinations(sorted(S),2))
    alpha=8
    witness9={}
    for d in sorted(dist):
        removed=(0,d);Er=E-{removed}
        ar=adj.copy();ar[0]&=~(1<<d);ar[d]&=~1
        def find(cand,chosen,k):
            if len(chosen)==k:return chosen
            if len(chosen)+cand.bit_count()<k:return None
            while cand:
                b=cand&-cand;v=b.bit_length()-1;cand-=b
                ans=find(cand&~ar[v],chosen+[v],k)
                if ans is not None:return ans
            return None
        cand=((1<<n)-1)&~(1<<d)&~1&~ar[0]&~ar[d]
        I=find(cand,[0,d],9)
        assert I is not None and independent(I,Er)
        witness9[str(d)]=sorted(I)
    apex=35;EG=E|{(v,apex) for v in range(n)}
    Ts=[t for t in combinations(range(n+1),3) if all(e in EG for e in combinations(t,2))]
    assert len(Ts)==140 and all(apex in t for t in Ts)
    I8=size8[0];C=[(v,apex) for v in range(n) if v not in I8]
    assert len(C)==27 and all(any(e in C for e in combinations(t,2)) for t in Ts)
    packing=[(2*i,2*i+1,apex) for i in range(17)]
    used=[e for t in packing for e in combinations(t,2)]
    assert all(t in Ts for t in packing) and len(set(used))==len(used)
    no0=next(S for S in size8 if 0 not in S)
    spokes_deleted_cover=[(v,apex) for v in range(n) if v!=0 and v not in no0]
    assert len(spokes_deleted_cover)==26
    G_no_spoke=EG-{(0,apex)}
    assert all(any(e in spokes_deleted_cover for e in combinations(t,2)) for t in Ts if all(e in G_no_spoke for e in combinations(t,2)))
    for d,II in witness9.items():
        oldcover=[(v,apex) for v in range(n) if v not in II]
        assert len(oldcover)==26
        assert all(any(e in oldcover for e in combinations(t,2)) for t in Ts if tuple(sorted((0,int(d)))) not in set(combinations(t,2)))
    lb=Fraction(n*n-alpha*alpha,4*alpha)
    assert lb>34
    # The matching on vertices2,...,33 survives deleting apex-spokes0 and1.
    blocker_packing=[(2*i,2*i+1,apex) for i in range(1,17)]
    out={'status':'PASS','source_graph':'Kalbfleisch1966 circulant Z35, circular distances1,7,11,16; independent properties rechecked here.',
         'rim_n':n,'rim_edges':sorted(E),'rim_degree':8,'rim_triangles':0,
         'independent_set_counts_by_size':counts,'independence_search_nodes':nodes,'all_independent8_sets':size8,'alpha':alpha,
         'independent9_after_deleting_edge_0d':witness9,
         'cone_n':36,'cone_edges':sorted(EG),'cone_triangles':Ts,'nu':17,'tau':27,
         'maximum_packing':packing,'minimum_cover':C,'spoke_deletion_independent8_avoiding0':no0,
         'odd_cover_lower_bound_fraction':[lb.numerator,lb.denominator],'odd_cover_integer_lower_bound':37,
         'two_spoke_blocker':[[0,35],[1,35]],'nu_after_blocker':16,'packing_after_blocker':blocker_packing,
         'scope':'Counterexample to odd-triangle parity cover bound under edge-cover-criticality alone. Fails two-edge resilience. Not a Tuza counterexample.',
         'seconds':time.time()-start}
    Path(args.output).write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({k:out[k] for k in ('status','rim_n','alpha','independent_set_counts_by_size','independence_search_nodes','nu','tau','odd_cover_integer_lower_bound','nu_after_blocker','seconds')},indent=2))
if __name__=='__main__':main()
