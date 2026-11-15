#!/usr/bin/env python3
"""Fixed auxiliary checks for the fresh probabilistic-construction review.
No random hypergraph is generated and no finite existence census is attempted.
"""
from pathlib import Path
from itertools import combinations
from fractions import Fraction
from math import comb
import hashlib,json,platform,shutil

def main():
    assert platform.system()=="Darwin"
    manifest=json.loads(Path('evidence/binary_tf/cone_decoration_manifest.json').read_text())
    for f,h in manifest.items():assert hashlib.sha256(Path(f).read_bytes()).hexdigest()==h
    snapshots=Path('review/binary_tf_fresh_inputs');snapshots.mkdir(parents=True,exist_ok=True)
    for f in ['notes/binary_tf_cone_decoration_obstruction.md','evidence/binary_tf/cut_obstruction_input.md',
              'evidence/binary_tf/cone_decoration_manifest.json','evidence/binary_tf/rank5_control.json']:
        shutil.copyfile(f,snapshots/Path(f).name)
    # Local graph facts checked without importing a producer checker.
    E=list(combinations(range(5),2));T=[set(combinations(t,2)) for t in combinations(range(5),3)]
    covers=[];odd=[]
    for bits in range(1<<10):
        C={E[i] for i in range(10) if bits>>i&1}
        if all(C&t for t in T):covers.append(C)
        if all(len(C&t)%2 for t in T):odd.append(C)
    tau=min(map(len,covers));pi=min(map(len,odd));assert tau==pi==4
    mc=[C for C in covers if len(C)==4];mo=[C for C in odd if len(C)==4]
    assert len(mc)==len(mo)==10 and all(C in mo for C in mc)
    assert all(any(int((0,1) in C)==root for C in mo) for root in (0,1))
    assert all(sum(t<=C for C in mc)==1 for t in T)
    packs=[(i,j) for i,j in combinations(range(10),2) if not T[i]&T[j]]
    assert len(packs)==15
    localcases=0
    for size in range(3):
        for D in combinations(E,size):
            assert any(not (T[i]|T[j])&set(D) for i,j in packs);localcases+=1
    assert localcases==56
    # The separate prescribed rank-five example: all additive triples, all2^11 subsets.
    points=[1,2,4,8,16,31,3,5,9,18,29]
    triples=[t for t in combinations(sorted(points),3) if t[0]^t[1]^t[2]==0]
    expected={tuple(sorted(t)) for t in [(1,2,3),(1,4,5),(1,8,9),(2,16,18),(2,31,29)]}
    assert set(triples)==expected
    ordinary=[];parity=[]
    for bits in range(1<<11):
        C={points[i] for i in range(11) if bits>>i&1}
        if all(C&set(t) for t in triples):ordinary.append(C)
        if all(len(C&set(t))%2 for t in triples):parity.append(C)
    rt=min(map(len,ordinary));rp=min(map(len,parity));assert (rt,rp)==(2,3)
    minordinary=[C for C in ordinary if len(C)==rt];assert minordinary==[{1,2}]
    assert {1,2,3} in parity and not any(set(t)<=C for t in triples for C in minordinary)
    # Rebuild the actual seven-vertex cone control independently.
    rim={(0,1),(0,2),(0,3),(1,4),(1,5)};GE=rim|{(i,6) for i in range(6)}
    GT=[t for t in combinations(range(7),3) if all(e in GE for e in combinations(t,2))]
    labels={tuple(sorted((i,6))):points[i] for i in range(6)}
    for u,v in rim:labels[u,v]=points[u]^points[v]
    assert {tuple(sorted(labels[e] for e in combinations(t,2))) for t in GT}==expected
    # Exact arithmetic check of an explicit sufficient ambient size for L=1.
    L=1;q=3840*(L+1);N=q**4;p=Fraction(1,q**15);m0=p*comb(N,5)
    assert m0>16*(L+1)*N>8*(L+1)*N
    assert m0/8-N>L*N
    assert Fraction(1,q)+Fraction(1,q*q)<Fraction(1,4)
    result=dict(status='PASS',host=platform.system(),large_hypergraph_generated=False,
                local_K5_tau=tau,local_K5_pi=pi,local_minimum_covers=len(mc),local_deletion_cases=localcases,
                rank5_points=points,rank5_all_triples=triples,rank5_tau=rt,rank5_pi=rp,rank5_unique_minimum_cover=[1,2],rank5_TF=False,
                cone_control_vertices=7,cone_control_edges=sorted(GE),cone_control_triangles=GT,
                explicit_sufficient_size_control=dict(L=L,q=q,N=N,m0_over_N=[(m0/N).numerator,(m0/N).denominator],
                    comment='Parameter inequality only; not a literal sampled hypergraph or graph.'),
                checker_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),frozen_input_hashes=manifest)
    target=Path('evidence/binary_tf_fresh');target.mkdir(parents=True,exist_ok=True)
    (target/'auxiliary_checks.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k not in ('frozen_input_hashes','rank5_points','rank5_all_triples','cone_control_edges','cone_control_triangles','explicit_sufficient_size_control')},indent=2))
if __name__=='__main__':main()
