#!/usr/bin/env python3
"""Finite direct attack on H-O2, actual triangle constraints, exact recursion/GF2."""
from global_routes_deletion_gate import Exact
from itertools import combinations
from pathlib import Path
import networkx as nx, json,time,platform

def odd_optimum(X):
    piv={}
    for row in X.tri:
        while row:
            i=row.bit_length()-1
            if i in piv:row^=piv[i]
            else:piv[i]=row;break
    free=[i for i in range(len(X.edges)) if i not in piv]
    basis=[]
    for j in free:
        v=1<<j
        for i in sorted(piv):
            if (v&piv[i]).bit_count()%2:v^=1<<i
        assert all((v&t).bit_count()%2==0 for t in X.tri)
        basis.append(v)
    best=X.full;previous=0;v=X.full
    for i in range(1,1<<len(basis)):
        gray=i^(i>>1);delta=gray^previous;v^=basis[delta.bit_length()-1];previous=gray
        if v.bit_count()<best.bit_count():best=v
    assert all((best&t).bit_count()%2==1 for t in X.tri)
    return best.bit_count(),[X.edges[i] for i in range(len(X.edges)) if best>>i&1],len(basis)

assert platform.system()=='Darwin'
t0=time.monotonic();quals=[];counts={'graphs':0,'all_edges_in_triangle':0,'critical':0,'critical_resilient':0}
for ai,G in enumerate(nx.graph_atlas_g()):
    counts['graphs']+=1;X=Exact(G)
    if not X.tri:continue
    cod=[sum(bool(t&(1<<i)) for t in X.tri) for i in range(len(X.edges))]
    if min(cod)<2:continue
    counts['all_edges_in_triangle']+=1;c=X.tau(X.full)
    if any(X.tau(X.full&~(1<<i))!=c-1 for i in range(len(X.edges))):continue
    counts['critical']+=1;k=X.nu(X.full)
    if any(X.nu(X.full&~(1<<i)&~(1<<j))!=k for i,j in combinations(range(len(X.edges)),2)):continue
    counts['critical_resilient']+=1;p,C,dim=odd_optimum(X)
    quals.append({'atlas_index':ai,'n':len(G),'edges':X.edges,'triangles':X.triples,'nu':k,'tau':c,'pi':p,'odd_cover':C,'kernel_dimension':dim,'minimum_triangle_codegree':min(cod),'counterexample':p>2*k})
out={'gate':'H-O2','scope':'NetworkX atlas through seven vertices; literal triangles; exhaustive memoized tau/nu; exhaustive GF2 affine solution enumeration for odd cover. No SAT UNSAT dependency.','counts':counts,'qualifiers':quals,'seconds':time.monotonic()-t0,'status':'REFUTED' if any(r['counterexample'] for r in quals) else 'NO_COUNTEREXAMPLE_IN_FINITE_DOMAIN'}
p=Path('ARCHIVE/TUZA-19/evidence/global_routes/parity_atlas.json');p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({k:v for k,v in out.items() if k!='qualifiers'},indent=2));print([(r['atlas_index'],r['n'],len(r['edges']),r['nu'],r['tau'],r['pi'],r['minimum_triangle_codegree']) for r in quals])
