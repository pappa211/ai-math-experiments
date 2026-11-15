"""Finite link and eligibility controls; no search-based nonexistence claim."""
from pathlib import Path
from itertools import combinations
from functools import lru_cache
import json,time,resource
R=Path(__file__).resolve().parents[1];start=time.monotonic()
def edge(u,v):return tuple(sorted((u,v)))
def matching(n,E):
    adj=[0]*n
    for u,v in E:adj[u]|=1<<v;adj[v]|=1<<u
    @lru_cache(None)
    def rec(A):
        if not A:return ()
        u=(A&-A).bit_length()-1;B=A&~(1<<u);best=rec(B);N=adj[u]&B
        while N:
            bit=N&-N;N-=bit;v=bit.bit_length()-1;trial=((u,v),)+rec(B&~bit)
            if len(trial)>len(best):best=trial
        return best
    return rec((1<<n)-1)
def independence(n,E):
    for k in range(n,-1,-1):
        for I in combinations(range(n),k):
            if all(edge(u,v) not in E for u,v in combinations(I,2)):return I
L={edge(u,(u+d)%11) for u in range(11) for d in (1,4)}
assert not any(all(edge(u,v) in L for u,v in combinations(T,2)) for T in combinations(range(11),3))
M=matching(11,L);I=independence(11,L);assert(len(M),len(I))==(5,4)
# H=L itself is an eligible AC graph, but its budget is10, not6.
assert not any(all(edge(u,v) in L for u,v in combinations(T,2)) for T in combinations(range(11),3))
col=None
for I0 in combinations(range(11),4):
    if any(edge(u,v) in L for u,v in combinations(I0,2)):continue
    rest=[v for v in range(11) if v not in I0]
    for bits in range(1<<len(rest)):
        c={v:0 for v in I0};c.update({v:1+((bits>>i)&1) for i,v in enumerate(rest)})
        if all(c[u]!=c[v] for u,v in L):col=[c[v] for v in range(11)];break
    if col:break
assert col is not None
# An actual eligible (b,m)=(6,5) with a 5-edge matching link is easy,
# but has vc5 and is therefore outside the uncovered stratum.
E={edge(2*i,2*i+1) for i in range(5)}|{edge(10,v) for v in range(10)}|set(combinations([11,12,13],2))
X=set(range(10));T=[Q for Q in combinations(range(14),3) if all(edge(u,v) in E for u,v in combinations(Q,2))]
assert len(T)==6
out={'status':'PASS','connected_boundary_link':{'vertices':11,'edges':sorted(L),'matching_number':len(M),'matching_certificate':M,'independence_number':len(I),'independent_set_certificate':I,'vertex_cover_number':11-len(I),'triangle_free':True,'proper_vertex3colouring':col,'eligible_H_equals_L_budget':10,'uncovered_H_budget6_realization':'NOT_ESTABLISHED_BY_THIS_CHECK'},'numeric_only_budget6_example':{'H_vertices':14,'H_edges':sorted(E),'X':sorted(X),'nu_H':6,'tau_H':6,'nu_G':6,'b':6,'link_matching':5,'link_vertex_cover':5,'hard_boundary':False,'certification':'six edge-disjoint old triangles; each of five rim edges supports one page per apex, so G packs at most five such pages plus the isolated old triangle; choosing the five rim edges and one isolated triangle edge covers H and G'},'elapsed_seconds':time.monotonic()-start,'peak_rss_Darwin_bytes':resource.getrusage(resource.RUSAGE_SELF).ru_maxrss}
(R/'evidence/critic_boundary.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
